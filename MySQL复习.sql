MySQL数据库笔记


1. 什么是数据库
    数据库英文单词DataBase 简称DB
    1)存储数据的仓库
    2)本质上是一个文件系统,还以文件件方式存储在服务器上
    3)所有的关系数据库都是以SQL管理的

2. 数据库的特点
    1)持久化存储数据,其实数据库就是一个文件系统
    2)方便数据管理
    3)使用统一的方式存储数据 --SQL

3. 常见的数据库
    1)MySQL：开源免费的数据库，小型的数据库，已经被 Oracle 收购了。MySQL6.x 版本也开始收费。后来 Sun
公司收购了 MySQL，而 Sun 公司又被 Oracle 收购
    2)Oracle：收费的大型数据库，Oracle 公司的产品
    3)DB2 ：IBM 公司的数据库产品,收费的。常应用在银行系统中
    4)SQL Server：MicroSoft 公司收费的中型的数据库。C#、.net 等语言常使用。
    5)SQLite: 嵌入式的小型数据库，应用在手机端，如：Android。
4. 数据库安装
    1)百度查
5. 什么是SQL
    Structured Query Language：结构化查询语言
    大白话讲:就是定义有关数据库操作的规则.每一种关系数据库的操作存在一些差异,俗称"数据库方言"
6. SQL 的通用语言
    1)SQL语句可以单行或者多行书写, 以分号结尾(;)
    2)可使用空格和缩进来提高语句的可读性
    3)mysql 数据库不区分大小写,但是建议关键字大写.而通常我们为了阅读采用小写
    4) SQL 注释
        单行: -- 注释内容  在MySQL中我们也可以通过 # 注释内容的方式来注释
        多行: /* 注释内容 */ 
7. SQL的分类
    1)DDL(Data Definition Language)数据定义语言
        用来定义数据库对象:数据库,数据表,数据列.关键字: create,drop,alter ...
    2) DML(Data Manipulation Language)数据操作语言
        用来对数据库增删改查.关键字:insert,delete,update...
    3)   DQL(Data Query Language)数据查询语言
        用来查询数据库中的表记录,关键字:select,where
    4) DCL(Data Control Language)数据控制语言(了解)
		用来定义数据库的访问权限和安全级别，及创建用户。关键字：GRANT， REVOKE 等
8. DDL操作数据库
# 创建
    1. 创建数据库
    create database 数据库名;
    2. 判断数据库存在不存在,存在就跳过,不存在就创建
    create database if not exists 数据库名;
    3. 创建数据库并指定字符集 为gbk
    create database 数据库名 default character set gbk;

create database db1;
create database if not exists db2;
create database db3 default character set gbk;

# 查询数据库
    1. 查询所有数据库的名称
    show databases;
    2. 查询数据库的字符集:查询数据库的创建语句
    show create database 数据库名;
show create database db;
## 修改数据库
    1. 修改数据库的字符集
    alter database 数据库名 character set 数据库名;

## 删除
    1. 删除数据库
    drop database 数据库名称;
    2. 判断数据库是否存在存在就删除,不存在就跳过
    drop database if exists 数据库名
## 使用数据库
    1. 查询正在使用的数据库
    select database();
    2. 使用数据库
    use 数据库名称;

# 操作数据表
1 .创建数据表
create table 表名(
    列名1 数据类型,
    列名2 数据类型,
    列名3 数据类型,
    列名4 数据类型
)
 注意：最后一列，不需要加逗号（,）

# 数据库类型：
		1. int：整数类型
			* age int,
		2. double:小数类型
			* score double(5,2)
		3. date:日期，只包含年月日，yyyy-MM-dd
		4. datetime:日期，包含年月日时分秒	 yyyy-MM-dd HH:mm:ss
		5. timestamp:时间错类型	包含年月日时分秒	 yyyy-MM-dd HH:mm:ss	
			* 如果将来不给这个字段赋值，或赋值为null，则默认使用当前的系统时间，来自动赋值
		6. varchar：字符串
			* name varchar(20):姓名最大20个字符
			* zhangsan 8个字符  张三 2个字符

create table student(
	id int,
	name varchar(32),
	age int ,
	score double(4,1),
	birthday date,
	insert_time timestamp
);

# 复制表
    create table 表名 like 被复制的表名;

# 修改
    1. 修改表名
    alter table 表名 rename to 新表名;
    2. 修改b表的字符集
    alter table 表名 character set 字符集名称;
    3. 添加一列
    alter table 表名 add 列名 数据类型;
    4. 修改列的名称和类型
        alter table 列名 chname 列名 新列名 新数据类型;
        alter table 表名 modify 列名 数据类型;
    4 删除表
    drop table 表名;
    如果表不存在就删除
    drop table if exists 表名;

9. DML: 增删改变表数据

	1. 添加数据
	    语法:
	        insert into 表名(列名1,列名2,列名3) values (值1,值2,值3);
	    注意:
	    	1. 列名与值要一一对应
	    	2. 如果表名后,不定义列名,则默认给每个值都添加,而且按照创建顺序
	    	3. 除了数据类型其它的数据类型都要用引号括起来
	2. 删除数据:
		语法:
			delete from 表名 [where 条件]
		注意:
			1. 如果不加条件,则删除表里的所有记录.
			2. 如果要删除表里的所有记录
				1. delete from 表名 -- 推荐使用.有多少条记录就会执行多少次删除操作
				2. truncate table 表名 --推荐使用.效率高,先删除表,然后再创建一张一样的表
	3. 修改数据
		语法:
			update 表名 set 列名1 = 值1,列名2 = 值2,列名3 = 值3,... [where 条件];
		注意:
			如果不加条件,会将表里的全部数据记录全部修改成一种,所以修改数据时一定要加条件
10. 条件查询
	1. where子语句后跟条件
	2. 运算符
		>	,<	,	<=	 ,	>=	,	=	,<>
		大于,小于,小于等于,大于等于,等于	,不等于
		between A and B 
		在 A 和 B 之间
		is null 
		是空
		and 或者 && 
		和
		or 或者 ||
		或者

		not 或者 !
		不是...
		案例:
		1. 查询年龄大于20岁的学生
			select * from student where age > 20
		2. 查询年龄大于等于20岁的学生
			select * from student where age >= 20
		3. 查询年龄不等于20岁的学生
			select * from student where age != 20
			select * from student where age <> 20
		4. 查询年龄大于20小于30的学生
			select * from student where age > 20 && age <30
			select * from student where age > 20 and age <30
			select * from student where age between 20 and 30
		5. 查询年龄22,18,25岁的学生
			select * from student where age = 22 or 18 or 25;
			select * from student where age = 20 || age = 18 || age = 25;
			select * from student where age in (22,18125);
		6. 查询成绩为null的学生
			select * from student where score is null;
		7. 查询成绩不为null的学生
			select * from student where score is not null;
    	8. 查找性马的
    		select * from student where name like "马%"
    	9. 查找叫宝国的单姓学生
    		select * from student where name like "_宝国"
    	10. 查找出名字是4个字的学生
    		select * from student where name like "____"
    	11. 查找名字里含"发"的学生
    		select * from student where name like "%发%"
11. 排序查询
	使用: order by 子句 
	格式: order by 排序字段1 排序方式1 ，  排序字段2 排序方式2...
		asc :升序(从小到大),一般是默认的
		desc :升序(从大到小)
	注意: 如果有多个排序条件，则当前边的条件值一样时，才会判断第二条件。
	案例:
	1. 查询所有数据,使用年龄降序排序
		select * from student order by age desc;

	2. 查询所有数据,在年龄降序排序的基础上，如果年龄相同再以数学成绩升序排序
		select * from student order by age desc, math asc;
12. 聚合函数,将一列数据作为一个整体,进行纵向计算
	1. count: 计算个数
	 	1) 一般选择非空的列
    	2)一般写count(1) 或者count(*)
	2. max: 计算最大值
	3. min: 计算最小值
	4. sum: 求和
	5. avg: 计算平均值

	6. 案例:
		1)查询学生总数
		select count(id) as 总人数 from student;
		select count(*) as 总人数 from student;
		上面的统计一般不统计数据列存在null的数据
		2)如果需要把null统计进去
		select count(id,0) from student;
		我们可以利用 IFNULL()函数，如果记录为 NULL，给个默认值，这样统计的数据就不会遗漏
		select count(IFNULL(id,0)) from student;

		案例:
		1. 查询年龄大于20的总数
		select count(*) from student where age > 20;
		2. 查询数学成绩总分
		select sum(math) as 数学总分 from student;
		3. 查询数学的平均分
		select avg(math) as 数学平均分 from student;
		4. 查询数学成绩的最高分
		select max(math) as 数学最高分 from student;
		5. 查询数学成绩的最低分
		select min(math) as 数学最低分 from student;
13. 分组查询:
	1. 语法：group by 分组字段；
	2. 注意：
		1. 分组之后查询的字段：分组字段、聚合函数
		2. where 和 having 的区别？
			1. where 在分组之前进行限定，如果不满足条件，则不参与分组。having在分组之后进行限定，如果不满足结果，则不会被查询出来
			2. where 后不可以跟聚合函数，having可以进行聚合函数的判断。
	3. 案例:
		1.按照性别分组,分别查询男女同学的数学平均分
		select sex,avg(math) from student group by sex;
		2.按照性别分组。分别查询男、女同学的平均分,人数
		select sex,avg(math),count(id) from student group by sex;
		3.按照性别分组。分别查询男、女同学的平均分,人数 要求：分数低于70分的人，不参与分组
		select sex,avg(math),count(id) from student where math > 70 group by sex;
		4. 按照性别分组。分别查询男、女同学的平均分,人数 要求：分数低于70分的人，不参与分组,分组之后。人数要大于2个人
		select sex,avg(math),count(id) from student where math > 70 group by sex having count(id) > 2;

		select sex,avg(math),count(id) as 人数 from student where math > 70 group by sex having 人数 > 2;
14. 分页查询
	1. 语法:limit 开始的索引,每页显示的条数;
	2. 公式:开始的索引 = (当前的页码 - 1) * 每页显示的条数

	select * from student limit 0,3; --第一页
	select * from student limit 3,3; --第二页
	select * from student limit 6,3; --第三页	
	-- limit 是MySQL的"方言"	

15. 约束
	1.概念： 对表中的数据进行限定，保证数据的正确性、有效性和完整性。	
	2.分类：
		1. 主键约束：primary key
		2. 非空约束：not null
		3. 唯一约束：unique
		4. 外键约束：foreign key
	3.案例:
	1)非空约束：not null
		1. 创建数据表添加名字不可以为空
		create table student(
			id int,
			name varchar(20) not null
		)
		2. 创建表添加非空约束
		alter table student modify name varchar(25) not null;
		3.删除name的非空约束
		alter table student modify name varchar(25);  
    2)唯一约束：unique
		1. 创建一个表,添加唯一约束
		create table student(
			id int,
			phone_num varchar(20) unique 
		)
		注意mysql中，唯一约束限定的列的值可以有多个null
		2. 删除唯一约束
		alter table student drop index phone_num;
		3. 创建表后,添加唯一约束
		alter table student modify phone_num varchar(20) unique;

    3)主键约束：primary
	1. 注意：
		1. 含义：非空且唯一
		2. 一张表只能有一个字段为主键
		3. 主键就是表中记录的唯一标识
	2. 创建表时添加主键约束
		create table student(
			id int primary key,
			name varchar(20)
		)
	3. 删除主键约束
	-- 错误 alter table student modify id int
	alter table student drop primary key;
	4. 创建表后添加主键
	alter table student modify id int primary key;
    4)自动增长
		1. 概念: 如果某一列的数值类型的,使用 auto_increament
		可以完成值的自动增长
		2. 在创建表时,添加主键约束完成主键的自增长
		create table student(
			id in primary key auto_increament,
			name varchar(25)
		);
		3. 删除自增
		alter table student modify id int;
		4. 添加自动增长
		alter table student modify int auto_increament;
	5)外键约束：foreign 让表于表产生关系，从而保证数据的正确性。
		1. 创建表时添加外建
		语法:
		create table 表名(
			...
			外检列
			constraint 外键名称 foregin key (外建名称) references 主表名称 (主表列名)			
		);
		2. 删除外键
		alter table 表名 drop foregin key 外键名称;
		3. 创建表之后,添加外键
		alter table 表名 add constraint 外键名称 foregin key(外键字段名称) references 主表名称(主表列名);
		4. 级联操作
			1. 添加级联操作
			语法:
			alter table 表名 add constraint 外键名称 foregin key  (外键字段名称) references 主表名称(主表列名称) on update cascade on delete create ;
			2. 分类:
				1. 级联更新：ON UPDATE CASCADE 
				2. 级联删除：ON DELETE CASCADE 
16. 数据库设计
	1. 多表之间的关系
	1. 分类：
		1. 一对一(了解)：
			* 如：人和身份证
			* 分析：一个人只有一个身份证，一个身份证只能对应一个人
		2. 一对多(多对一)：
			* 如：部门和员工
			* 分析：一个部门有多个员工，一个员工只能对应一个部门
		3. 多对多：
			* 如：学生和课程
			* 分析：一个学生可以选择很多门课程，一个课程也可以被很多学生选择
	2. 实现关系：
		1. 一对多(多对一)：
			* 如：部门和员工
			* 实现方式：在多的一方建立外键，指向一的一方的主键。
		2. 多对多：
			* 如：学生和课程
			* 实现方式：多对多关系实现需要借助第三张中间表。中间表至少包含两个字段，这两个字段作为第三张表的外键，分别指向两张表的主键
		3. 一对一(了解)：
			* 如：人和身份证
			* 实现方式：一对一关系实现，可以在任意一方添加唯一外键指向另一方的主键。

	3. 案例
		-- 创建旅游线路分类表 tab_category
		-- cid 旅游线路分类主键，自动增长
		-- cname 旅游线路分类名称非空，唯一，字符串 100
		CREATE TABLE tab_category (
			cid INT PRIMARY KEY AUTO_INCREMENT,
			cname VARCHAR(100) NOT NULL UNIQUE
		);
		
		-- 创建旅游线路表 tab_route
		/*
		rid 旅游线路主键，自动增长
		rname 旅游线路名称非空，唯一，字符串 100
		price 价格
		rdate 上架时间，日期类型
		cid 外键，所属分类
		*/
		CREATE TABLE tab_route(
			rid INT PRIMARY KEY AUTO_INCREMENT,
			rname VARCHAR(100) NOT NULL UNIQUE,
			price DOUBLE,
			rdate DATE,
			cid INT,
			FOREIGN KEY (cid) REFERENCES tab_category(cid)
		);
		
		/*创建用户表 tab_user
		uid 用户主键，自增长
		username 用户名长度 100，唯一，非空
		password 密码长度 30，非空
		name 真实姓名长度 100
		birthday 生日
		sex 性别，定长字符串 1
		telephone 手机号，字符串 11
		email 邮箱，字符串长度 100
		*/
		CREATE TABLE tab_user (
			uid INT PRIMARY KEY AUTO_INCREMENT,
			username VARCHAR(100) UNIQUE NOT NULL,
			PASSWORD VARCHAR(30) NOT NULL,
			NAME VARCHAR(100),
			birthday DATE,
			sex CHAR(1) DEFAULT '男',
			telephone VARCHAR(11),
			email VARCHAR(100)
		);
		
		/*
		创建收藏表 tab_favorite
		rid 旅游线路 id，外键
		date 收藏时间
		uid 用户 id，外键
		rid 和 uid 不能重复，设置复合主键，同一个用户不能收藏同一个线路两次
		*/
		CREATE TABLE tab_favorite (
			rid INT, -- 线路id
			DATE DATETIME,
			uid INT, -- 用户id
			-- 创建复合主键
			PRIMARY KEY(rid,uid), -- 联合主键
			FOREIGN KEY (rid) REFERENCES tab_route(rid),
			FOREIGN KEY(uid) REFERENCES tab_user(uid)
		);
		
17. 数据库设计的范式
	* 概念：设计数据库时，需要遵循的一些规范。要遵循后边的范式要求，必须先遵循前边的所有范式要求

		设计关系数据库时，遵从不同的规范要求，设计出合理的关系型数据库，这些不同的规范要求被称为不同的范式，各种范式呈递次规范，越高的范式数据库冗余越小。
		目前关系数据库有六种范式：第一范式（1NF）、第二范式（2NF）、第三范式（3NF）、巴斯-科德范式（BCNF）、第四范式(4NF）和第五范式（5NF，又称完美范式）。

	* 分类：
		1. 第一范式（1NF）：每一列都是不可分割的原子数据项
		2. 第二范式（2NF）：在1NF的基础上，非码属性必须完全依赖于码（在1NF基础上消除非主属性对主码的部分函数依赖）
			* 几个概念：
				1. 函数依赖：A-->B,如果通过A属性(属性组)的值，可以确定唯一B属性的值。则称B依赖于A
					例如：学号-->姓名。  （学号，课程名称） --> 分数
				2. 完全函数依赖：A-->B， 如果A是一个属性组，则B属性值得确定需要依赖于A属性组中所有的属性值。
					例如：（学号，课程名称） --> 分数
				3. 部分函数依赖：A-->B， 如果A是一个属性组，则B属性值得确定只需要依赖于A属性组中某一些值即可。
					例如：（学号，课程名称） -- > 姓名
				4. 传递函数依赖：A-->B, B -- >C . 如果通过A属性(属性组)的值，可以确定唯一B属性的值，在通过B属性（属性组）的值可以确定唯一C属性的值，则称 C 传递函数依赖于A
					例如：学号-->系名，系名-->系主任
				5. 码：如果在一张表中，一个属性或属性组，被其他所有属性所完全依赖，则称这个属性(属性组)为该表的码
					例如：该表中码为：（学号，课程名称）
					* 主属性：码属性组中的所有属性
					* 非主属性：除过码属性组的属性
					
		3. 第三范式（3NF）：在2NF基础上，任何非主属性不依赖于其它非主属性（在2NF基础上消除传递依赖）
18. 数据库的备份
	mysqldump -uroot -proot day21 > d:/***.sql

19. 数据库的还原操作
	source d:/***.sql;
	*/
20. 多表查询
    1. 查询语法:
        SELECT
            列名列表
        FROM
            表明列表
        WHERE ...;
    2. 准备SQL
        # 创建部门表
        CREATE TABLE dept(
            id  INT PRIMARY KEY auto_increment,
            name VARCHAR(20)
        );
    INSERT INTO dept (name) VALUES ("开发部"),("市场部"),("财务部");
    # 创建员工表
    CREATE TABLE emp(
        id INT PRIMARY KEY auto_increment,
        name VARCHAR(10),
        gander CHAR(1), -- 性别
        salary DOUBLE,  -- 工资
        join_data DATA, -- 入职日期
        dept_id INT,
        FOREIGN KEY (dept_id) peferences dept(id) -- 外键，关联部门表(部门表的主键)

    );
    INSERT INTO emp(NAME,gender,salary,join_date,dept_id) VALUES('孙悟空','男',7200,'2013-02-24',1);
	INSERT INTO emp(NAME,gender,salary,join_date,dept_id) VALUES('猪八戒','男',3600,'2010-12-02',2);
	INSERT INTO emp(NAME,gender,salary,join_date,dept_id) VALUES('唐僧','男',9000,'2008-08-08',2);
	INSERT INTO emp(NAME,gender,salary,join_date,dept_id) VALUES('白骨精','女',5000,'2015-10-07',3);
	INSERT INTO emp(NAME,gender,salary,join_date,dept_id) VALUES('蜘蛛精','女',4500,'2011-03-14',1);

3. 笛卡尔积
    有两个集合A,B 取这两个集合所有元素任意配对组成的组
    要完成多表查询要消除无用的组
4. 多表查询的分类
    1. 内连接查询
        1. 隐式内连接: 使用where条件消除无用数据
            例子
            -- 查询所有员工信息和对应的部门信息
            select * from emp,dept where emp.dept_id = dept.id;
            -- 查询员工表名称,性别.部门表的名称
            select emp.name,emp.gender,dept.name from emp,dept where emp.dept_id = dept.id;

            或者

            select
                t1.name,
                t1.gender,
                t2.name
            from 
                emp t1,
                dept t2,
            where 
                t1.dept_id = t2.id;
        2.显示内连接
            语法
                select 字段列表 from 表明1 [inner] join 表明2 on 条件;
            例如
                select * from emp inner join dept on emp.dept_id = dept.id
				select * from emp join dept on emp.dept_id = dept.id
	2.外连接查询
		1. 左外连接查询
			语法
			select 字段列表 from 表明1 left [outer] join 表明2 on 条件;
			查询左表所有数据及其交集部分
			例子
			-- 查询所有员工信息，如果员工有部门，则查询部门名称，没有部门，则不显示部门名称
			select t1.*,t2.name from emp t1 left join dept t2 on t1.dept_id = t2.dept;
			
		2. 右外连接:
			语法:
				select 字段列表 from 表明1 right [outer] join 表明2 on 条件;
			例子:
				select * from dept t2 right join emp t1 on t1.dept_id = t2.id
		3. 嵌套查询
			概念：查询中嵌套查询，称嵌套查询为子查询。
			-- 查询工资最高的员工信息
			-- 1 查询最高的工资是多少 9000
			select max(salary) from  emp;
			-- 2 查询员工信息,并且工资等于9000
			select * from emp where emp.salary = 9000;
		4. 子查询不同情况
			1. 子查询的结果是单行单列的：
				* 子查询可以作为条件，使用运算符去判断。 运算符： > >= < <= =
				* 
				-- 查询员工工资小于平均工资的人
				SELECT * FROM emp WHERE emp.salary < (SELECT AVG(salary) FROM emp);
			2. 子查询的结果是多行单列的：
				* 子查询可以作为条件，使用运算符in来判断
				-- 查询'财务部'和'市场部'所有的员工信息
				SELECT id FROM dept WHERE NAME = '财务部' OR NAME = '市场部';
				SELECT * FROM emp WHERE dept_id = 3 OR dept_id = 2;
				-- 子查询
				SELECT * FROM emp WHERE dept_id IN (SELECT id FROM dept WHERE NAME = '财务部' OR NAME = '市场部');

			3. 子查询的结果是多行多列的：
				* 子查询可以作为一张虚拟表参与查询
				-- 查询员工入职日期是2011-11-11日之后的员工信息和部门信息
				-- 子查询
				SELECT * FROM dept t1 ,(SELECT * FROM emp WHERE emp.`join_date` > '2011-11-11') t2
				WHERE t1.id = t2.dept_id;
				
				-- 普通内连接
				SELECT * FROM emp t1,dept t2 WHERE t1.`dept_id` = t2.`id` AND t1.`join_date` >  '2011-11-11'

	* 多表查询练习

			-- 部门表
			CREATE TABLE dept (
			  id INT PRIMARY KEY PRIMARY KEY, -- 部门id
			  dname VARCHAR(50), -- 部门名称
			  loc VARCHAR(50) -- 部门所在地
			);
			
			-- 添加4个部门
			INSERT INTO dept(id,dname,loc) VALUES 
			(10,'教研部','北京'),
			(20,'学工部','上海'),
			(30,'销售部','广州'),
			(40,'财务部','深圳');	
			
			-- 职务表，职务名称，职务描述
			CREATE TABLE job (
			  id INT PRIMARY KEY,
			  jname VARCHAR(20),
			  description VARCHAR(50)
			);
			
			-- 添加4个职务
			INSERT INTO job (id, jname, description) VALUES
			(1, '董事长', '管理整个公司，接单'),
			(2, '经理', '管理部门员工'),
			(3, '销售员', '向客人推销产品'),
			(4, '文员', '使用办公软件');
			-- 员工表
			CREATE TABLE emp (
			  id INT PRIMARY KEY, -- 员工id
			  ename VARCHAR(50), -- 员工姓名
			  job_id INT, -- 职务id
			  mgr INT , -- 上级领导
			  joindate DATE, -- 入职日期
			  salary DECIMAL(7,2), -- 工资
			  bonus DECIMAL(7,2), -- 奖金
			  dept_id INT, -- 所在部门编号
			  CONSTRAINT emp_jobid_ref_job_id_fk FOREIGN KEY (job_id) REFERENCES job (id),
			  CONSTRAINT emp_deptid_ref_dept_id_fk FOREIGN KEY (dept_id) REFERENCES dept (id)
			);
			
			-- 添加员工
			INSERT INTO emp(id,ename,job_id,mgr,joindate,salary,bonus,dept_id) VALUES 
			(1001,'孙悟空',4,1004,'2000-12-17','8000.00',NULL,20),
			(1002,'卢俊义',3,1006,'2001-02-20','16000.00','3000.00',30),
			(1003,'林冲',3,1006,'2001-02-22','12500.00','5000.00',30),
			(1004,'唐僧',2,1009,'2001-04-02','29750.00',NULL,20),
			(1005,'李逵',4,1006,'2001-09-28','12500.00','14000.00',30),
			(1006,'宋江',2,1009,'2001-05-01','28500.00',NULL,30),
			(1007,'刘备',2,1009,'2001-09-01','24500.00',NULL,10),
			(1008,'猪八戒',4,1004,'2007-04-19','30000.00',NULL,20),
			(1009,'罗贯中',1,NULL,'2001-11-17','50000.00',NULL,10),
			(1010,'吴用',3,1006,'2001-09-08','15000.00','0.00',30),
			(1011,'沙僧',4,1004,'2007-05-23','11000.00',NULL,20),
			(1012,'李逵',4,1006,'2001-12-03','9500.00',NULL,30),
			(1013,'小白龙',4,1004,'2001-12-03','30000.00',NULL,20),
			(1014,'关羽',4,1007,'2002-01-23','13000.00',NULL,10);

			-- 工资等级表
			CREATE TABLE salarygrade (
			  grade INT PRIMARY KEY,   -- 级别
			  losalary INT,  -- 最低工资
			  hisalary INT -- 最高工资
			);
			
			-- 添加5个工资等级
			INSERT INTO salarygrade(grade,losalary,hisalary) VALUES 
			(1,7000,12000),
			(2,12010,14000),
			(3,14010,20000),
			(4,20010,30000),
			(5,30010,99990);
			
			-- 需求：
			
			-- 1.查询所有员工信息。查询员工编号，员工姓名，工资，职务名称，职务描述
			/*
				分析：
					1.员工编号，员工姓名，工资，需要查询emp表  职务名称，职务描述 需要查询job表
					2.查询条件 emp.job_id = job.id
			
			*/
			SELECT 
				t1.`id`, -- 员工编号
				t1.`ename`, -- 员工姓名
				t1.`salary`,-- 工资
				t2.`jname`, -- 职务名称
				t2.`description` -- 职务描述
			FROM 
				emp t1, job t2
			WHERE 
				t1.`job_id` = t2.`id`;
			-- 2.查询员工编号，员工姓名，工资，职务名称，职务描述，部门名称，部门位置
			/*
				分析：
					1. 员工编号，员工姓名，工资 emp  职务名称，职务描述 job  部门名称，部门位置 dept
					2. 条件： emp.job_id = job.id and emp.dept_id = dept.id
			*/
			
			SELECT 
				t1.`id`, -- 员工编号
				t1.`ename`, -- 员工姓名
				t1.`salary`,-- 工资
				t2.`jname`, -- 职务名称
				t2.`description`, -- 职务描述
				t3.`dname`, -- 部门名称
				t3.`loc` -- 部门位置
			FROM 
				emp t1, job t2,dept t3
			WHERE 
				t1.`job_id` = t2.`id` AND t1.`dept_id` = t3.`id`;
			   
			-- 3.查询员工姓名，工资，工资等级
			/*
				分析：
					1.员工姓名，工资 emp  工资等级 salarygrade
					2.条件 emp.salary >= salarygrade.losalary and emp.salary <= salarygrade.hisalary
						emp.salary BETWEEN salarygrade.losalary and salarygrade.hisalary
			*/
			SELECT 
				t1.ename ,
				t1.`salary`,
				t2.*
			FROM emp t1, salarygrade t2
			WHERE t1.`salary` BETWEEN t2.`losalary` AND t2.`hisalary`;

			-- 4.查询员工姓名，工资，职务名称，职务描述，部门名称，部门位置，工资等级
			/*
				分析：
					1. 员工姓名，工资 emp ， 职务名称，职务描述 job 部门名称，部门位置，dept  工资等级 salarygrade
					2. 条件： emp.job_id = job.id and emp.dept_id = dept.id and emp.salary BETWEEN salarygrade.losalary and salarygrade.hisalary
						
			*/
			SELECT 
				t1.`ename`,
				t1.`salary`,
				t2.`jname`,
				t2.`description`,
				t3.`dname`,
				t3.`loc`,
				t4.`grade`
			FROM 
				emp t1,job t2,dept t3,salarygrade t4
			WHERE 
				t1.`job_id` = t2.`id` 
				AND t1.`dept_id` = t3.`id`
				AND t1.`salary` BETWEEN t4.`losalary` AND t4.`hisalary`;
			-- 5.查询出部门编号、部门名称、部门位置、部门人数
			
			/*
				分析：
					1.部门编号、部门名称、部门位置 dept 表。 部门人数 emp表
					2.使用分组查询。按照emp.dept_id完成分组，查询count(id)
					3.使用子查询将第2步的查询结果和dept表进行关联查询
					
			*/
			SELECT 
				t1.`id`,t1.`dname`,t1.`loc` , t2.total
			FROM 
				dept t1,
				(SELECT
					dept_id,COUNT(id) total
				FROM 
					emp
				GROUP BY dept_id) t2
			WHERE t1.`id` = t2.dept_id;
			-- 6.查询所有员工的姓名及其直接上级的姓名,没有领导的员工也需要查询
			
			/*
				分析：
					1.姓名 emp， 直接上级的姓名 emp
						* emp表的id 和 mgr 是自关联
					2.条件 emp.id = emp.mgr
					3.查询左表的所有数据，和 交集数据
						* 使用左外连接查询
				
			*/
			/*
			select
				t1.ename,
				t1.mgr,
				t2.`id`,
				t2.ename
			from emp t1, emp t2
			where t1.mgr = t2.`id`;
			
			*/
			
			SELECT 
				t1.ename,
				t1.mgr,
				t2.`id`,
				t2.`ename`
			FROM emp t1
			LEFT JOIN emp t2
			ON t1.`mgr` = t2.`id`;
22.事务
	1. 事务的基本介绍
	1. 概念：
		*  如果一个包含多个步骤的业务操作，被事务管理，那么这些操作要么同时成功，要么同时失败。
		
	2. 操作：
		1. 开启事务： start transaction;
		2. 回滚：rollback;
		3. 提交：commit;
	3. 例子：
		CREATE TABLE account (
			id INT PRIMARY KEY AUTO_INCREMENT,
			NAME VARCHAR(10),
			balance DOUBLE
		);
		-- 添加数据
		INSERT INTO account (NAME, balance) VALUES ('zhangsan', 1000), ('lisi', 1000);
	SELECT * FROM account;
		UPDATE account SET balance = 1000;
		-- 张三给李四转账 500 元
		
		-- 0. 开启事务
		START TRANSACTION;
		-- 1. 张三账户 -500
		
		UPDATE account SET balance = balance - 500 WHERE NAME = 'zhangsan';
		-- 2. 李四账户 +500
		-- 出错了...
		UPDATE account SET balance = balance + 500 WHERE NAME = 'lisi';
		
		-- 发现执行没有问题，提交事务
		COMMIT;
		
		-- 发现出问题了，回滚事务
		ROLLBACK;
	4. MySQL数据库中事务默认自动提交
		
		* 事务提交的两种方式：
			* 自动提交：
				* mysql就是自动提交的
				* 一条DML(增删改)语句会自动提交一次事务。
			* 手动提交：
				* Oracle 数据库默认是手动提交事务
				* 需要先开启事务，再提交
		* 修改事务的默认提交方式：
			* 查看事务的默认提交方式：SELECT @@autocommit; -- 1 代表自动提交  0 代表手动提交
			* 修改默认提交方式： set @@autocommit = 0;
	2. 事务的四大特征：
	1. 原子性：是不可分割的最小操作单位，要么同时成功，要么同时失败。
	2. 持久性：当事务提交或回滚后，数据库会持久化的保存数据。
	3. 隔离性：多个事务之间。相互独立。
	4. 一致性：事务操作前后，数据总量不变
3. 事务的隔离级别（了解）
	* 概念：多个事务之间隔离的，相互独立的。但是如果多个事务操作同一批数据，则会引发一些问题，设置不同的隔离级别就可以解决这些问题。
	* 存在问题：
		1. 脏读：一个事务，读取到另一个事务中没有提交的数据
		2. 不可重复读(虚读)：在同一个事务中，两次读取到的数据不一样。
		3. 幻读：一个事务操作(DML)数据表中所有记录，另一个事务添加了一条数据，则第一个事务查询不到自己的修改。
	* 隔离级别：
		1. read uncommitted：读未提交
			* 产生的问题：脏读、不可重复读、幻读
		2. read committed：读已提交 （Oracle）
			* 产生的问题：不可重复读、幻读
		3. repeatable read：可重复读 （MySQL默认）
			* 产生的问题：幻读
		4. serializable：串行化
			* 可以解决所有的问题

		* 注意：隔离级别从小到大安全性越来越高，但是效率越来越低
		* 数据库查询隔离级别：
			* select @@tx_isolation;
		* 数据库设置隔离级别：
			* set global transaction isolation level  级别字符串;

	* 演示：
		set global transaction isolation level read uncommitted;
		start transaction;
		-- 转账操作
		update account set balance = balance - 500 where id = 1;
		update account set balance = balance + 500 where id = 2;
23.DCL：
	* SQL分类：
	1. DDL：操作数据库和表
	2. DML：增删改表中数据
	3. DQL：查询表中数据
	4. DCL：管理用户，授权

* DBA：数据库管理员

* DCL：管理用户，授权
	1. 管理用户
		1. 添加用户：
			* 语法：CREATE USER '用户名'@'主机名' IDENTIFIED BY '密码';
		2. 删除用户：
			* 语法：DROP USER '用户名'@'主机名';
		3. 修改用户密码：
			
			UPDATE USER SET PASSWORD = PASSWORD('新密码') WHERE USER = '用户名';
			UPDATE USER SET PASSWORD = PASSWORD('abc') WHERE USER = 'lisi';
			
			SET PASSWORD FOR '用户名'@'主机名' = PASSWORD('新密码');
			SET PASSWORD FOR 'root'@'localhost' = PASSWORD('123');

			* mysql中忘记了root用户的密码？
				1. cmd -- > net stop mysql 停止mysql服务
					* 需要管理员运行该cmd

				2. 使用无验证方式启动mysql服务： mysqld --skip-grant-tables
				3. 打开新的cmd窗口,直接输入mysql命令，敲回车。就可以登录成功
				4. use mysql;
				5. update user set password = password('你的新密码') where user = 'root';
				6. 关闭两个窗口
				7. 打开任务管理器，手动结束mysqld.exe 的进程
				8. 启动mysql服务
				9. 使用新密码登录。
		4. 查询用户：
			-- 1. 切换到mysql数据库
			USE myql;
			-- 2. 查询user表
			SELECT * FROM USER;
			
			* 通配符： % 表示可以在任意主机使用用户登录数据库

	2. 权限管理：
		1. 查询权限：
			-- 查询权限
			SHOW GRANTS FOR '用户名'@'主机名';
			SHOW GRANTS FOR 'lisi'@'%';

		2. 授予权限：
			-- 授予权限
			grant 权限列表 on 数据库名.表名 to '用户名'@'主机名';
			-- 给张三用户授予所有权限，在任意数据库任意表上
			
			GRANT ALL ON *.* TO 'zhangsan'@'localhost';
		3. 撤销权限：
			-- 撤销权限：
			revoke 权限列表 on 数据库名.表名 from '用户名'@'主机名';
			REVOKE UPDATE ON db3.`account` FROM 'lisi'@'%';
	