Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D87D52F48C5
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 11:39:01 +0100 (CET)
Received: from localhost ([::1]:51372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzdYK-0004Pa-VG
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 05:39:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzdX2-0003lp-JF; Wed, 13 Jan 2021 05:37:40 -0500
Received: from mail-am6eur05on2119.outbound.protection.outlook.com
 ([40.107.22.119]:4769 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzdWw-0000qP-Ki; Wed, 13 Jan 2021 05:37:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DqrR3S5zyRXbHSGM5za1qlDMk2IPLhozpU9tWZw1UaMMwlnG85jTxhbm9WT1hxMzbLE/fs1hDAI559kz+qRUKE9kbTfnRrTKtdZiwZcDbZBV6AMo8Txo9DsM5wr/MQH26/xGC2KA/gxTHzcAPDrzgdbjCQEw8eyBbAheYmz+0VXPuEtCCM0MsZf2+1lyU+luiFTwWnmm0qbmGzPvDeq81guIWMqIiJqFbkfYZtjUuBjUmEFFl4lxhAiJexIr+NUiEMUn6W8PYhdy+IjErcTLBK/7cg/5RCZaKSAcJCAMKsiyzPR5hFZ6I1hUbPnvWBcwccruJ1sl0pZ/kVoXJHI9LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WYR0+cZ92L24VWFhBwQtpwaUhT9egM/28MINfMLlgiA=;
 b=PsUVAVT3ALKHSBR8P/KDYwxztdWcGocy2jbOnRcP1Acii0NRRAq7P0U4Ej0evOoVXwPoqcrdWnYKTJtTRo8cRaK2dzEfg2cBxyyCMAxH+/wonEzNL8YvLLfAP8sLLWhgLAukdccHMAlRByehM6mb+vAu0AfFD9h0nnEI0C4kLQy2V41gkGNFKxiEuPeg/BHnNLWVXMa3vq9C/m/WvFSiCx8spLdIBO4DMSwzB5JYTx8l3ORo0KLBxgiK220GoVQZPLa9ob3ebjyoYWGI9rUxlUh+mt2zHGg9xNj2nl5kz+taf1Q743+Hb9Sw5WfmKshPDgNwvkO2Jk2pGfPORQJF8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WYR0+cZ92L24VWFhBwQtpwaUhT9egM/28MINfMLlgiA=;
 b=BMNvjfP0PVcnbeC5FyN04Hco/J9HS2CqLdeQib4xirFyYJsw1GOiib5clCX39QCF2KdtWLHFfzNsLlRG+I6931ua7Gc3lp3zt8U7iSO8ZjtLIuMRoFjFOTOG6UTbVHVvl/5k10yS0uh/9MHH4V3GZZefIKvP0kuATAz0clR8P9M=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5495.eurprd08.prod.outlook.com (2603:10a6:20b:104::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Wed, 13 Jan
 2021 10:37:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.009; Wed, 13 Jan 2021
 10:37:30 +0000
Subject: Re: [PATCH v6 07/11] iotests: add findtests.py
To: Kevin Wolf <kwolf@redhat.com>
References: <20210109122631.167314-1-vsementsov@virtuozzo.com>
 <20210109122631.167314-8-vsementsov@virtuozzo.com>
 <20210112164211.GB6075@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <8f4a54a9-25d2-2b5e-dbda-a67696534cbd@virtuozzo.com>
Date: Wed, 13 Jan 2021 13:37:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210112164211.GB6075@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.80]
X-ClientProxiedBy: AM9P192CA0003.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::8) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.80) by
 AM9P192CA0003.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Wed, 13 Jan 2021 10:37:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ecad313-7ef8-4af2-be8b-08d8b7af3af7
X-MS-TrafficTypeDiagnostic: AM7PR08MB5495:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB549570C153F3930D931E2C0CC1A90@AM7PR08MB5495.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mrW2MZBX6hqNV8TMCyGQQjDFZgQc/JulovZuJoYUfuHy6ysFd3WhlqaZzGGC4pazcRMq9hbyen1eJ6oTENIsOmp4eASv16VzwR4dpIkp8GBPsvBXwF0bFPoLnFbkzX7ER9zdRmw9inaBApJZ9tggY+5twxYkEbYan2kUSKryyw5HW0cYp/RbpL8jLT8V70Cgb9brvJh0Q0YxgApIoRSu5Be3/rv0BRr0TCNupwnI+I7YkqC6biy4Yb97ciIL8GiLRM9waDdRfzVCPCDsGk9uIZ/oFp5tuswEwKIZoyjn0+q6AGKhr5L7mGjUdLvnlHRZRfcA3wrtX/zljOESoJaA0KuuZz3tY/FeAuF0sx557UBpxjk2fluctuolug2XuMYyMoHS2VIPL/PeKBXRdm0exs7YbV58cE6E5x0ViYzLhlWE9WDSUOe3UL0Jno0/wucImnoVu1b6WBsrmzGu2UcMOqaY4hIJa0yIXLIQygJo/vO/9PXsC01QqiVAXKK/rnM+q5LzrcgZ6lT6j9esDxHmAvZvb4LYErMJW4Xx0NlfVHaF8bkPB6Hs9Pg5HWUwukaB0nSL/Tvp9DwFbApQQXoWHQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(366004)(39840400004)(2906002)(66476007)(8676002)(36756003)(66946007)(83380400001)(86362001)(186003)(16526019)(31696002)(478600001)(66556008)(26005)(316002)(31686004)(16576012)(956004)(4326008)(52116002)(6916009)(2616005)(30864003)(6486002)(5660300002)(8936002)(2004002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Qm9WQVllQ0VLVHB4YlVOVnZyZG5JSnpReE1jVFVPeGVYUmdJYzJXbUFKNTNw?=
 =?utf-8?B?WS9nSTJMSUhhWmE5clZLdUJjMmE0TGYwcU82MVFkS3FkM2xXOUdRaVJpeUlO?=
 =?utf-8?B?Z2IyT25VRHFkMDVFN2UwLzdUczN3TFdzaVlKeVJ5SkRWSEk5VTFWWjZNRmd6?=
 =?utf-8?B?TGZERHRjY1JnQUJqSDRRR2FKYmxQSjZNaEFWMFRCbnVHZTVxbDVkcWdob2t3?=
 =?utf-8?B?ZXR6bERYOHNVbUlSR3FTUDVseXJ1RWpvVmJtYmNHTGhReWVlaFlESHZ0THc5?=
 =?utf-8?B?aHVUK1YrSVdLOXh5L1Rzckk0cU14eE1pN3VGcVJxUlF2cXp6bXV0MUgxVjhl?=
 =?utf-8?B?V01NeEY2TTFjZUJWZUxZcGV3QUJZOUZBNTAzbVk1WlBYZDEyc3JKWmZtRmdw?=
 =?utf-8?B?WVl1d2I4Q3UyRXZvbUpaL2Q2THAvb01ycjRXUFFZM3NhNWhRL2Rmbm1KZm1a?=
 =?utf-8?B?RkJhQlh6c1AxYzZ0eVlCbEFoQmZOY0Y4OG8xSkNRL2diVEhsZWdIV2s0bXZr?=
 =?utf-8?B?NFJhNm50ZUtkOXdKNGcrNUFvMDNpZG44d0ptYXVFT1d5S1ZtNzEwbWM3aTFz?=
 =?utf-8?B?TlBILzZ6TDhoVHVnTlFYUVFCWVBGNG9SdUp6eWp0QmMzeHd6YmptWHdJN1RO?=
 =?utf-8?B?Y29CV3VPOCtFd25iT0lIYUJyNmFYMmJQcEN1cXdMeFVXWFJiM0RqWDU1NEtX?=
 =?utf-8?B?cmlkU21kc1pldWN4ZGFuUG12VVFDUUFuRXFxYmorVlB6Q0FWNzNNTWN6bEdE?=
 =?utf-8?B?OFFETCtmSXlIMWZJYkRqSytNZ2F3RjBYKzcwNTZ3MFBVcFI3cHBhQUpCT3Vk?=
 =?utf-8?B?L2ZxZUM2emEwVjZnRXUzYVZxeDIyQ2I2SGxiRmh3WTZCNjJ6UXFOUU5MQkJz?=
 =?utf-8?B?c05iRXg2d3BjY0NIbzBoUnlHWHNuemhtRmlvTDQ4UlB0Zk9uUDZtTWFNZVh5?=
 =?utf-8?B?ZjZGVktCODl6VFI0ZnRkWmJMT1dFWXBxeGhoQlladTByMG9NazNPMzVCbVFk?=
 =?utf-8?B?Q1J5RUtTeWZhOVYwc1VGWERwNmFTMm9RZ0VwN3hoL2JBSVFtcW95K1ZDaUdC?=
 =?utf-8?B?bjl2ZEFrOHRlN1pvZTIvYTNTbk5rdFdMT0ppQnRYOURFdzQ0aEhha1VTVlkx?=
 =?utf-8?B?S0tEOTZWZ25IU3RZZlBmOXplbHNxTGtFUTd5czRrbUpvQURSdGQ2d0hZMU9z?=
 =?utf-8?B?bC9oZGpoSG90a1MzZTE5K2JxZ3R0UVFvOUtrSkR1ZWFwaDI4QWFiYlhsckVo?=
 =?utf-8?B?b0pjbkVrN1NZWXhBZFlDeGI0VFV2ZHBCR1BiWHRsMFo0ZEZCODB2ZUxhY3I4?=
 =?utf-8?Q?jRfBR/Cxjojg+HhZ4Y1rzQg5wANLkA/Y59?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 10:37:30.9036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ecad313-7ef8-4af2-be8b-08d8b7af3af7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FWDxUFd9m/+UZzzoVuT0H0ZaoKoG7xM4Lh5Wg+pMJNbsYVIxCudZxInBl/rFtVUovp+xpLYz2kx/543SaRu1liwO4BRQTbyam4TTiayfLR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5495
Received-SPF: pass client-ip=40.107.22.119;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

12.01.2021 19:42, Kevin Wolf wrote:
> Am 09.01.2021 um 13:26 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> Add python script with new logic of searching for tests:
>>
>> Current ./check behavior:
>>   - tests are named [0-9][0-9][0-9]
>>   - tests must be registered in group file (even if test doesn't belong
>>     to any group, like 142)
>>
>> Behavior of findtests.py:
>>   - group file is dropped
>>   - tests are all files in tests/ subdirectory (except for .out files),
>>     so it's not needed more to "register the test", just create it with
>>     appropriate name in tests/ subdirectory. Old names like
>>     [0-9][0-9][0-9] (in root iotests directory) are supported too, but
>>     not recommended for new tests
>>   - groups are parsed from '# group: ' line inside test files
>>   - optional file group.local may be used to define some additional
>>     groups for downstreams
>>   - 'disabled' group is used to temporary disable tests. So instead of
>>     commenting tests in old 'group' file you now can add them to
>>     disabled group with help of 'group.local' file
>>   - selecting test ranges like 5-15 are not supported more
>>     (to support restarting failed ./check command from the middle of the
>>      process, new argument is added: --start-from)
>>
>> Benefits:
>>   - no rebase conflicts in group file on patch porting from branch to
>>     branch
>>   - no conflicts in upstream, when different series want to occupy same
>>     test number
>>   - meaningful names for test files
>>     For example, with digital number, when some person wants to add some
>>     test about block-stream, he most probably will just create a new
>>     test. But if there would be test-block-stream test already, he will
>>     at first look at it and may be just add a test-case into it.
>>     And anyway meaningful names are better.
>>
>> This commit don't update check behavior (which will be don in further
>> commit), still, the documentation changed like new behavior is already
>> here.  Let's live with this small inconsistency for the following few
>> commits, until final change.
>>
>> The file findtests.py is self-executable and may be used for debugging
>> purposes.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   docs/devel/testing.rst          |  50 ++++++-
>>   tests/qemu-iotests/findtests.py | 229 ++++++++++++++++++++++++++++++++
> 
> I extended 297 so that it also checks the newly added Python file, and
> pylint and mypy report some errors:
> 
> +************* Module findtests
> +findtests.py:127:19: W0621: Redefining name 'tests' from outer scope (line 226) (redefined-outer-name)
> +findtests.py:224:8: R1722: Consider using sys.exit() (consider-using-sys-exit)
> +findtests.py:32: error: Missing type parameters for generic type "Iterator"
> +findtests.py:87: error: Function is missing a return type annotation
> +findtests.py:206: error: Function is missing a type annotation for one or more arguments
> 
> I would suggest including a final patch in this series that adds all new
> Python files to the checking in 297.
> 
>> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
>> index 0aa7a13bba..bfb6b65edc 100644
>> --- a/docs/devel/testing.rst
>> +++ b/docs/devel/testing.rst
>> @@ -111,7 +111,7 @@ check-block
>>   -----------
>>   
>>   ``make check-block`` runs a subset of the block layer iotests (the tests that
>> -are in the "auto" group in ``tests/qemu-iotests/group``).
>> +are in the "auto" group).
>>   See the "QEMU iotests" section below for more information.
>>   
>>   GCC gcov support
>> @@ -224,6 +224,54 @@ another application on the host may have locked the file, possibly leading to a
>>   test failure.  If using such devices are explicitly desired, consider adding
>>   ``locking=off`` option to disable image locking.
>>   
>> +Test case groups
>> +----------------
>> +
>> +Test may belong to some groups, you may define it in the comment inside the
>> +test.
> 
> Maybe: "Tests may belong to one or more test groups, which are defined
> in the form of a comment in the test source file."
> 
>>          By convention, test groups are listed in the second line of the test
>> +file, after "#!/..." line, like this:
> 
> "after the "#!/..." line"
> 
>> +
>> +.. code::
>> +
>> +  #!/usr/bin/env python3
>> +  # group: auto quick
>> +  #
>> +  ...
>> +
>> +Additional way of defining groups is creating tests/qemu-iotests/group.local
> 
> "An additional" or "Another".
> "creating the ... file"
> 
>> +file. This should be used only for downstream (this file should never appear
>> +in upstream). This file may be used for defining some downstream test groups
>> +or for temporary disable tests, like this:
> 
> "disabling"
> 
>> +
>> +.. code::
>> +
>> +  # groups for some company downstream process
>> +  #
>> +  # ci - tests to run on build
>> +  # down - our downstream tests, not for upstream
>> +  #
>> +  # Format of each line is:
>> +  # TEST_NAME TEST_GROUP [TEST_GROUP ]...
>> +
>> +  013 ci
>> +  210 disabled
>> +  215 disabled
>> +  our-ugly-workaround-test down ci
>> +
>> +The (not exhaustive) list of groups:
> 
> Maybe just something like this?
> 
> "Note that the following group names have a special meaning:"
> 
>> +
>> +- quick : Tests in this group should finish within some few seconds.
>> +
>> +- auto : Tests in this group are used during "make check" and should be
>> +  runnable in any case. That means they should run with every QEMU binary
>> +  (also non-x86), with every QEMU configuration (i.e. must not fail if
>> +  an optional feature is not compiled in - but reporting a "skip" is ok),
>> +  work at least with the qcow2 file format, work with all kind of host
>> +  filesystems and users (e.g. "nobody" or "root") and must not take too
>> +  much memory and disk space (since CI pipelines tend to fail otherwise).
>> +
>> +- disabled : Tests in this group are disabled and ignored by check.
>> +
>>   .. _docker-ref:
>>   
>>   Docker based tests
>> diff --git a/tests/qemu-iotests/findtests.py b/tests/qemu-iotests/findtests.py
>> new file mode 100755
>> index 0000000000..b053db48e8
>> --- /dev/null
>> +++ b/tests/qemu-iotests/findtests.py
>> @@ -0,0 +1,229 @@
>> +#!/usr/bin/env python3
>> +#
>> +# Parse command line options to define set of tests to run.
>> +#
>> +# Copyright (c) 2020 Virtuozzo International GmbH
>> +#
>> +# This program is free software; you can redistribute it and/or modify
>> +# it under the terms of the GNU General Public License as published by
>> +# the Free Software Foundation; either version 2 of the License, or
>> +# (at your option) any later version.
>> +#
>> +# This program is distributed in the hope that it will be useful,
>> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
>> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> +# GNU General Public License for more details.
>> +#
>> +# You should have received a copy of the GNU General Public License
>> +# along with this program.  If not, see <http://www.gnu.org/licenses/>.
>> +#
>> +
>> +import os
>> +import sys
>> +import glob
>> +import argparse
>> +import re
>> +from collections import defaultdict
>> +from contextlib import contextmanager
>> +from typing import Optional, List, Tuple, Iterator, Set
>> +
>> +
>> +@contextmanager
>> +def chdir(path: Optional[str] = None) -> Iterator:
> 
> As indicated by mypy, this should be Interator[None].
> 
>> +    if path is None:
>> +        yield
>> +        return
>> +
>> +    saved_dir = os.getcwd()
>> +    os.chdir(path)
>> +    try:
>> +        yield
>> +    finally:
>> +        os.chdir(saved_dir)
>> +
>> +
>> +class TestFinder:
>> +    _argparser = None
>> +    @classmethod
>> +    def get_argparser(cls) -> argparse.ArgumentParser:
>> +        if cls._argparser is not None:
>> +            return cls._argparser
>> +
>> +        p = argparse.ArgumentParser(description="= test selecting options =",
>> +                                    add_help=False, usage=argparse.SUPPRESS)
>> +
>> +        p.add_argument('-g', '--groups', metavar='group1,...',
>> +                       help='include tests from these groups')
>> +        p.add_argument('-x', '--exclude-groups', metavar='group1,...',
>> +                       help='exclude tests from these groups')
>> +        p.add_argument('--start-from', metavar='TEST',
>> +                       help='Start from specified test: make sorted sequence '
>> +                       'of tests as usual and then drop tests from the first '
>> +                       'one to TEST (not inclusive). This may be used to '
>> +                       'rerun failed ./check command, starting from the '
>> +                       'middle of the process.')
>> +        p.add_argument('tests', metavar='TEST_FILES', nargs='*',
>> +                       help='tests to run')
>> +
>> +        cls._argparser = p
>> +        return p
>> +
>> +    def __init__(self, test_dir: Optional[str] = None) -> None:
>> +        self.groups = defaultdict(set)
>> +
>> +        with chdir(test_dir):
>> +            self.all_tests = glob.glob('[0-9][0-9][0-9]')
>> +            self.all_tests += [f for f in glob.iglob('tests/*')
>> +                               if not f.endswith('.out') and
>> +                               os.path.isfile(f + '.out')]
>> +
>> +            for t in self.all_tests:
>> +                with open(t) as f:
>> +                    for line in f:
>> +                        if line.startswith('# group: '):
>> +                            for g in line.split()[2:]:
>> +                                self.groups[g].add(t)
> 
> Do we need to allow more than one group comment in a test or could we
> return early here, avoiding to read the whole file?

Hmm, if we defined it's as a "convention", I think we can just check only the second line of the file.

> 
>> +
>> +    def add_group_file(self, fname: str):
>> +        with open(fname) as f:
>> +            for line in f:
>> +                line = line.strip()
>> +
>> +                if (not line) or line[0] == '#':
>> +                    continue
>> +
>> +                words = line.split()
>> +                test_file = words[0]
>> +                groups = words[1:]
>> +
>> +                if test_file not in self.all_tests:
>> +                    print(f'Warning: {fname}: "{test_file}" test is not found.'
>> +                          ' Skip.')
>> +                    continue
> 
> Should test_file be passed through parse_test_name()? I noticed that I
> have to explicitly specify a tests/ prefix in group.local, whereas
> prefixing this on the command line seems to be forbidden.

agree.

> 
>> +                for g in groups:
>> +                    self.groups[g].add(test_file)
>> +
>> +    def parse_test_name(self, name: str) -> str:
>> +        if '/' in name:
>> +            raise ValueError('Paths are unsupported for test selecting, '
>> +                             f'requiring "{name}" is wrong')
>> +
>> +        if re.fullmatch(r'\d+', name):
>> +            # Numbered tests are old naming convetion. We should convert them
>> +            # to three-digit-length, like 1 --> 001.
>> +            name = f'{int(name):03}'
>> +        else:
>> +            # Named tests all should be in tests/ subdirectory
>> +            name = os.path.join('tests', name)
>> +
>> +        if name not in self.all_tests:
>> +            raise ValueError(f'Test "{name}" is not found')
>> +
>> +        return name
> 
> check should probably catch these ValueError exceptions. Currently, you
> get a stack trace, which does include the exception message, but it
> doesn't look very nice.
> 
>> +    def find_tests(self, groups: Optional[List[str]] = None,
>> +                   exclude_groups: Optional[List[str]] = None,
>> +                   tests: Optional[List[str]] = None,
> 
> group and tests seem to be read-only, so this can be simplified to
> 'groups: Sequence[str] = ()' etc. without the explicit handling of None
> below.
> 
> Maybe exclude_groups should then be treated the same for consistency.
> This would mean creating a new list instead of calling .append().

will try.


thanks, I'll take all the suggestions.


-- 
Best regards,
Vladimir

