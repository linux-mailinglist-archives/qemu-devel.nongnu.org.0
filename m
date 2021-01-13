Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 395452F541E
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 21:29:56 +0100 (CET)
Received: from localhost ([::1]:49964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzmmA-00044o-O8
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 15:29:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzmkg-0003YK-6W; Wed, 13 Jan 2021 15:28:22 -0500
Received: from mail-vi1eur05on2099.outbound.protection.outlook.com
 ([40.107.21.99]:34144 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzmkc-0000bZ-TN; Wed, 13 Jan 2021 15:28:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYuXS5u1I52/cNxTySvERkcumy+FMpldhe+kvGSxcZxsNII1VeiQdtotRgqvcidRB4S2R5rkiwzvlCpK69kkS0JkFA4+oWdK40ivduZkU59H+g1K7o6hq25P1n4KLoaT8RBa2vQWm7QK0YSr9KZgfsW3Qm/N80PctBKm6CihXp5yX6/r9xf4A75ToGzXWbhCQxa9Ai0adXjZBGxfCWALwWPx1Rg0qCw8UFUe2Aw0pX90kI0PKe+4QqlsM4pWQQh5d5YHF1x9JdkGyPY37npAAepU1vsb1FeVhv8vIM1Xy+hX81j5azO2RgR51qVQmlb3Cd4RixYVcQtMZSnofj2GZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NcityWIHHhVIP5kwjp31vZc2ukRn2HYtn9BcefqbGnY=;
 b=UpIWDiVkay7pbzfas3Z7/jtAVthR9YdPuQET9WMEWrLMwpy0vNuHFdUl2utmhyYQzOkOToIiDQWeBv0k6ubIgdIPGr7x3+QL/i1xt9pPo17pDVpTJINuh+1U6Cw4tZrOdESigVKq/IrHDLqvU2pjaj8lC/aX58fQkgmOBcvdGzPwWPz9ByZxqaC2P3QZZk7npMiwquwd3QdenQv5YH8bRX4C5nhE31FfWjsvmFzY2JptV5G/nhy+/Tpfui2kpNVwlg1yyMGylvdrXZSdxDqRIo/7m06462OFe3lQV82cRW9F3eqlPq+4okO/mY8eBY9/cNe8rwYrdFuJ/Ghtc3RS0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NcityWIHHhVIP5kwjp31vZc2ukRn2HYtn9BcefqbGnY=;
 b=e+Ph4M5sexkzNUklyY/3EZXqCqbMVD9LzKBF3vuPme3WR0bcxJYEtl8cXt+KLrZQ7QXTIsoK5jmbsjbnBnHFXpzqO3vT5Nee1lqbC2Uc2yV2MuNPJHwEnv9qn+HITLj0U449zpHgOEb9NRQ2MPYeM0V7YkGLBj0CjPf0AlJDQdY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5912.eurprd08.prod.outlook.com (2603:10a6:20b:29f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Wed, 13 Jan
 2021 20:28:15 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.009; Wed, 13 Jan 2021
 20:28:15 +0000
Subject: Re: [PATCH v2 1/8] iotests/297: Allow checking all Python test files
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210113175752.403022-1-mreitz@redhat.com>
 <20210113175752.403022-2-mreitz@redhat.com>
 <285b6f74-da97-4b4b-70a8-ec09a8c467bb@virtuozzo.com>
Message-ID: <2bb555bc-dfa5-076a-a3c3-b4bb5d1330f0@virtuozzo.com>
Date: Wed, 13 Jan 2021 23:28:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <285b6f74-da97-4b4b-70a8-ec09a8c467bb@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.80]
X-ClientProxiedBy: AM8P191CA0027.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::32) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.80) by
 AM8P191CA0027.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10 via Frontend Transport; Wed, 13 Jan 2021 20:28:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c544683d-5d98-4d85-3804-08d8b801c151
X-MS-TrafficTypeDiagnostic: AS8PR08MB5912:
X-Microsoft-Antispam-PRVS: <AS8PR08MB59126AA541E3A23531546B75C1A90@AS8PR08MB5912.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I/CCSXozAQbxqMdLwywGIrMwoM78rMeEDOxLOYNFB5NU+2zDjiKaf76VW1ajPQo+wC5yguziAMjuwP+fJbirarx/3TbZOJDzrBvdddbb29YD9s8FJpCX8MABCy0Qd2Q6lNSTzKLVfzBwhlL3WCa9GKVohOZcMIY1FCqnksWrKtPU8RpDTMYY4etUmw0/OWdDpL98nit2q7vn7H26xbG8YnjYizuCKeA0BqrWmRf6Q9kYIuhbHZYXl3J0igNRwfIYk85lepYBRmRQEHZGC0zpmcgs55vhFXNzw6kOXC4zEnS0IchX8Sqb5luwOxbAjCgKVKtNqI5Q1MN5NG9MIz5NEantHcEMraQrNyy0jcc3C9LzjdMxnnAH3oW5I4f0hjUMcfYDNc8LBHhJ9734F2QbjIDj5rmnoDH526t70J5opG9ryzisqeekLs9R7z7/v3LeUjF7HDhn0ta0Nww0WQUsow490bPc9orMibRLO791nQk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(346002)(39830400003)(396003)(36756003)(26005)(52116002)(186003)(5660300002)(478600001)(66556008)(16526019)(316002)(956004)(66946007)(2616005)(8676002)(2906002)(66476007)(4326008)(6486002)(31686004)(86362001)(31696002)(16576012)(54906003)(8936002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b2o0MlAyazZSRFFwZHJSVW9ESEFkaSs1Ry84THhyQjltODFNQ0lxQjVJMitS?=
 =?utf-8?B?UTZtTWp2UXZJeUxPN0ZVKzRiMlJ5bm9FOWVqRHBQMDdWRFhOb3FBRkYvYkJU?=
 =?utf-8?B?VkROVEJXTFBDRXBKcyt1MU1aOWZqdWEzT1dUbUI1eEJ0dmc0U0EwL3pMY3Fk?=
 =?utf-8?B?SEtrQU96VGFPTTAvQ056VVd4Q21OV2FKd0YzS1RuQzRyS210WlZLQ0Z6T2wz?=
 =?utf-8?B?UjgrMkxLTWRvZFkvbCs1T3dNUEFQeDVWT3NEUnpkSHNVY0ZHWWppMjNzUTRG?=
 =?utf-8?B?SnZobUt2Zi9iNXROSERhYkk5UitPNWJzenNsdklvMktoV21MNng1czErbERP?=
 =?utf-8?B?Ti9UcnNDbHNlT3ZrL2hGV1ZsV0I2MTUrWWh0RGNEWnFXdnYwZEJlNnBpbDZX?=
 =?utf-8?B?SEJ3UWc4SU0yUUx6SzJTb0FsVEF3NUYybjZEREltYnArVFRUYkdKNzZrLzBK?=
 =?utf-8?B?T1JNaE5DOHRMSXVUaUVzeEZNSEpvdmF4azlpNXpUTzNHWVRiWFdNaWpVd0ZO?=
 =?utf-8?B?Um02c0RHaitBaDM5V0wrN2gvZjk1S29WWmNKbjVuRXlVblFaRFQ1S2dod3Vn?=
 =?utf-8?B?WHQwUTc5bFhyVjNEbmpEQko4cEliSnRtQmpleFNVS2tlVUVmdlExeStOWms3?=
 =?utf-8?B?aWYvd0dLb3djMG9RZiszZmp0S0srY2dlQzRSa3hpc1FmK1pOWjY5cmNzSDdT?=
 =?utf-8?B?OFEyK1BCQkM5ZW9odHBQWWZ1Y0ZTaXhVajZ4R09yZHgzdFlWd0k3YnVRVjF2?=
 =?utf-8?B?d2kxb3FIdndnRVlFWmtVT2FNd0NKWmVuWXpjUEN6VjRhcjd6eW1uNjNpQThZ?=
 =?utf-8?B?UjJVakYvdVhESmh5MkdValFkSTVob2ZuUW9VU0NPYTg3ZDFKMUJVTnJTSmRs?=
 =?utf-8?B?dmE3Nm9yRWZZQXV6ZGVBeUpZNWlyRjk0MGx1OVFwdVJibk0rdFUyZUZQemF4?=
 =?utf-8?B?TDJnSEZwSk5FaUZpRGpFZGRKL1VXSU02eGNlY05McXVIellQR0dCbjJFSEpz?=
 =?utf-8?B?TWlLc3pGZ3I5LzkxaXlhWmN0eE5Yd3YzNTBpK1h6d3RWYzNkQ28yN0tzRklI?=
 =?utf-8?B?cmoweVlWQzJsR3QyZ041YWJOWjI5aTV0ZjZXZG1CRnVXVFcvbHZhRkx4VlNj?=
 =?utf-8?B?UDF5V2Nqc3lxSlZyeDlwZng3REpSbTJXU1FyZEE2c3V3bjB2VmM5anZLVXhy?=
 =?utf-8?B?ZDZPRGE4US9GaWpnUmJNSjFMZFZQc3ViMEhFT2d3TnpmUkhrWCs4WldiRXZO?=
 =?utf-8?B?VFVHWTRReDZ2ZVFIQkhKOGcyVzlaOW1CTERhaWJzeFdEUkt3QWVMWVZjRzE2?=
 =?utf-8?Q?xSIsOPL7mhwUcZPe21wSckm8FJ7db40BSs?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 20:28:14.9543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: c544683d-5d98-4d85-3804-08d8b801c151
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D+aQ2RDMvpSKIfcjsXuxd3C7TXyM2VjrnxKpuEnDP5RxNFQrDdH501DEGWDxrp+suaQ+gxu8Hs34dLZi+KFiFVuWd7QpsxAJ5lG1ceUh14M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5912
Received-SPF: pass client-ip=40.107.21.99;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

13.01.2021 22:27, Vladimir Sementsov-Ogievskiy wrote:
> 13.01.2021 20:57, Max Reitz wrote:
>> I.e., all Python files in the qemu-iotests/ directory.
>>
>> Most files of course do not pass, so there is an extensive skip list for
>> now.  (The only files that do pass are 209, 254, 283, and iotests.py.)
>>
>> (Alternatively, we could have the opposite, i.e. an explicit list of
>> files that we do want to check, but I think it is better to check files
>> by default.)
>>
>> I decided to include the list of files checked in the reference output,
>> so we do not accidentally lose coverage of anything.  That means adding
>> new Python tests will require a change to 297.out, but that should not
>> be a problem.
> 
> I have a parallel series, "Rework iotests/check", one of its aims is drop
> group file, to avoid these endless conflicts in group file when you want
> to send series or when you are porting patches to/from downstream.
> 
> And you are trying to add one another "group" file :) I don't like the idea.
> 
> Why should we loose accidentally the coverage? Logic is extremely simple:
> all files except for the list.
> 

Also.. What about checking python in python :) ? I exercised myself,
rewriting it into python. Take it if you like:
(suddenly, pylint warns about "TODO"s, so I just drop a TODO line.. Probably
  we'll have to suppress this warning in 297)



import os
import shutil
import subprocess

import iotests

iotests.script_initialize()


def is_python_file(filename):
     if filename.endswith('.py'):
         return True

     with open(filename) as f:
         try:
             first_line = f.readline()
             if first_line.startswith('#!') and 'python' in first_line:
                 return True
         except UnicodeDecodeError:  # ignore core files, etc
             pass

     return False


for linter in ('pylint-3', 'mypy'):
     if shutil.which(linter) is None:
         iotests.notrun(f'{linter} not found')

skip_files = (
     '030', '040', '041', '044', '045', '055', '056', '057', '065', '093',
     '096', '118', '124', '129', '132', '136', '139', '147', '148', '149',
     '151', '152', '155', '163', '165', '169', '194', '196', '199', '202',
     '203', '205', '206', '207', '208', '210', '211', '212', '213', '216',
     '218', '219', '222', '224', '228', '234', '235', '236', '237', '238',
     '240', '242', '245', '246', '248', '255', '256', '257', '258', '260',
     '262', '264', '266', '274', '277', '280', '281', '295', '296', '298',
     '299', '300', '302', '303', '304', '307', 'nbd-fault-injector.py',
     'qcow2.py', 'qcow2_format.py', 'qed.py'
)

files = [f for f in (set(os.listdir('.')) - set(skip_files))
          if os.path.isfile(f) and is_python_file(f)]

# We can pass all files to pylint at once...
subprocess.run(['pylint-3', '--score=n'] + files, check=False)

# ...but mypy needs to be called once per file.  Otherwise, it will
# interpret all given files as belonging together (i.e., they may not
# both define the same classes, etc.; most notably, they must not both
# define the __main__ module).
os.environ['MYPYPATH'] = '../../python/'
for file in files:
     p = subprocess.run(['mypy', '--warn-unused-configs',
                         '--disallow-subclassing-any',
                         '--disallow-any-generics',
                         '--disallow-incomplete-defs',
                         '--disallow-untyped-decorators',
                         '--no-implicit-optional', '--warn-redundant-casts',
                         '--warn-unused-ignores', '--no-implicit-reexport',
                         file], check=False,
                        stdout=subprocess.PIPE,
                        stderr=subprocess.STDOUT)

     if p.returncode != 0:
         print(p.stdout)




-- 
Best regards,
Vladimir

