Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E55162FF49E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 20:36:18 +0100 (CET)
Received: from localhost ([::1]:37570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2fkf-0005fK-Rp
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 14:36:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2fep-0008ET-Jj; Thu, 21 Jan 2021 14:30:15 -0500
Received: from mail-eopbgr140111.outbound.protection.outlook.com
 ([40.107.14.111]:64258 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2fek-0006f3-Oj; Thu, 21 Jan 2021 14:30:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GEPllxBZnsDtwuvz0xLnM3sJ+IUwTRMKT2Et6hsnkICMBpLf+scn0LWksEiZPu7gI4eBcbYu52IgtZmwJoRl+j0xEV/ydCvylXX7VMBkumRQYSVXRLvt1eeXPqii7xPkifY1Z8t1QXTKOnoDtYEq5VjdYdtmJh2H1HRNunZ1CMIgnVknGmVWZzhn/5Cif5YQWU/0cP1ORZ0ofTCqZis/9vJD5+Vnad3PWp7WFHa8IhEcCqldsjuH3cpcFW6NJcYwgRu6vOiZQevJooGbUUNs2dGtGd0HxtEBb5XT921mYEA84RW7rIw8dqnK3Rc2RLWZsHxPXP0/8SFqxmw/TKMXhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1bdKBjlJ7xe0x/CRL09X+MXGTCh9vSAgg901edcOmAQ=;
 b=a3k+T87tj81ZoL2jz8d7HgvgmWYJO09wWRsa9SC+NaMo/6EXrIJBGCZRJ4hntEG7Nx+oyQshAgmYDzZOzq+7uWQgF1Hjijprmam8t7bo3PEIypYfy+cJmp9bmmTZmagbr3OHsPlWAneidoF7M30HwvxklZ0uTsFKVJA/lB04jO4bWP9ufzdls6fbdaYeJHnI+IPDj1S4C1z6H2PSIftwKtNlP7cfR1+N3637Y3meAzlwIpiM9uE/iJO1HSJ/r5MxIbEy/3nuzD1NYye4lvhapyBgoBluwxapBdlZX3UcVoi+VqzJkgN2CD89btVG+YvnK5FMIomyQobe2Zog8PXzRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1bdKBjlJ7xe0x/CRL09X+MXGTCh9vSAgg901edcOmAQ=;
 b=EtCDvMqocmJg/ACkimoSaZEhY/0iD8C/wU3X/soGh4y0Y4TtH7KTSYHP9NnA1Sy3+4X+6B2BEkQPewZpspmc4KTmPXQjKWtUAY49SiFE7zQ2K9PRuAjVYV3Y+r9RwCSPBUYhYTZ1qNE/UXY8Rv0nw8PNhsz5f4Q9Zp+0eQkKbzw=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4023.eurprd08.prod.outlook.com (2603:10a6:20b:a6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Thu, 21 Jan
 2021 19:30:02 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.014; Thu, 21 Jan 2021
 19:30:02 +0000
Subject: Re: [PATCH 07/11] iotests/264: move to python unittest
To: Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org
References: <20201118180433.11931-1-vsementsov@virtuozzo.com>
 <20201118180433.11931-8-vsementsov@virtuozzo.com>
 <bf712fde-61ed-f0b8-c895-13a4486d82cb@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <c3e66896-867c-81eb-c28b-e98f85a8c368@virtuozzo.com>
Date: Thu, 21 Jan 2021 22:29:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <bf712fde-61ed-f0b8-c895-13a4486d82cb@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.101]
X-ClientProxiedBy: AM3PR03CA0054.eurprd03.prod.outlook.com
 (2603:10a6:207:5::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.101) by
 AM3PR03CA0054.eurprd03.prod.outlook.com (2603:10a6:207:5::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Thu, 21 Jan 2021 19:30:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 737fcab5-6015-4eae-ee33-08d8be42f2d4
X-MS-TrafficTypeDiagnostic: AM6PR08MB4023:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4023B85D20BEE8873C526022C1A10@AM6PR08MB4023.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pHz+NTEjSttWwtdQYArCdDn/8TbUCPzPvA79PfsP7ZO9FzHyW21pJGknWAs5nmzXB0DjCAKxsDKAcCDgLhXNmlMmKt/sUGNede9aFSYvfl9ysm1Ry6N81s9gUptdsMO4Cgpwbj3zvbjJxDu1UC1eLgnuoXOSHFXxOjLV75/HUNv0kkL4g75F59nCH01lUtKZ+7BsqQdSo56cixKzb7KvKWZKaH/sUmZkBR0qkPdJ6dlSBS25A9/ey+SlVblyAvv0pGKZCz0kFzYUw+9qd4x0ONNizDdYV1zrCs7l4uHrTP14N6lez1R1+60+xQ8yleoVxvPW1MICDwkCRORh+G6x/JccuZYSSOkjDrcJezUdS0jyRIaRfAjlZQZb3xcOuKOFwYHTNuFKMkYcFQmfhnLONNoh1o9u3eUzIIsBG8wLKgyBinoFAs6m22rTWI1Cme1cMERg20WszBgiAMvmc18ivFMZKcSNtWA2DO+J+2YJBWU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(346002)(376002)(39840400004)(8676002)(2906002)(6486002)(8936002)(316002)(26005)(186003)(31686004)(31696002)(52116002)(86362001)(107886003)(16576012)(4326008)(2616005)(66476007)(5660300002)(66556008)(83380400001)(16526019)(36756003)(66946007)(478600001)(956004)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YzFLcmNDVlRXU1V4Y1V2Qk9jWTFqdHFKNnNQeUZSeGVXZVRzMkEzb20xZDdL?=
 =?utf-8?B?ckxyWW5YYU9zUFN6ODllVkkvNkVWT2Zzd21KdmhIOUJLb0xUN1pobkc1QThR?=
 =?utf-8?B?MWE1eWZ6Q29kRmxibmpHeC83aHFJNVM5a2dCVm1ob0QyMkt2N3g3L3RRaHdv?=
 =?utf-8?B?TitXekQwQmpzRUdITGxvSTFqUE9TcXZHSmQ5cnZxdnpoWWNHcmVoRGw3cjNI?=
 =?utf-8?B?MitDQmJHYzdsT0ZJNWdTU2RodEpnZWRyeDdPZ3pQZmtOb1piREt0L0k4dTlY?=
 =?utf-8?B?SksvdFJ1aHIyODQyODNrWDUxaDc0bk1aeUpqTjhsaDFJRERwMlZTa2FkSlpJ?=
 =?utf-8?B?TjZJdWxUV2NVTUNIM016bXIzNUR1bDVwTlpKNlZZOFFFOWtNZldDV1JHTkRl?=
 =?utf-8?B?RkkwRXhiNEs2T2E0aHp2QkVlQmczbVFsTlBSRzFaOTlSemVYSmlzbXFQd3lW?=
 =?utf-8?B?bEs2ckN1bitFUXIyV1N0ZXBrTURYd0xPOUJKeE5nb3A5VTVCMFFXbXlqSUsr?=
 =?utf-8?B?NWd5cWw3dFdMZEZ3N2ZsL0ZHK2dCR2l3SFF1YmhBbXFvODJHbk9jYlVWcmlw?=
 =?utf-8?B?cTN5QWhqcml5U2NBYWlMOXFHTXZGWHlwZi9IVDZOZXdBZDNzRjAxUVQyTG1z?=
 =?utf-8?B?ZjlSazl2NmxUb3Iza0JKTFo2L04yU05xSjJQSEtvMHY4SUE2VXcwSHlRTVYz?=
 =?utf-8?B?QmtkM1I5QU1LL1dnQnFWVVFXQXE3NUE1WU1MckdweUplQ2V3MjcvSkxZWGMy?=
 =?utf-8?B?RkppaWwwZHovNjVhS0dMd2pOaHdVQmNGTUxyMXJFNXc3WmJaZmVzM0NLQWpo?=
 =?utf-8?B?T1BRT0p1UXRrYytEc2Z3V0hpK2Z2R0lGbEx0c29nL0NTL2VOZmlBRnZSTjds?=
 =?utf-8?B?djlqVDBsZDUyMS96QVQxNXRrbm0rTTFkZi9vRzBWdVowUzlHYlZYSjRhdzlV?=
 =?utf-8?B?Y3hOa3JFcmlPV0sxY09kQTFTVkR3OGRNVzNxZnJ0ajFRazQybXVYWnJ3d01j?=
 =?utf-8?B?YWFuc2hkOGFOVVZoU0doUUpBOEdDWldzdkNhTVlleWZObFA4U0FjZHk1dTh2?=
 =?utf-8?B?RlhkU3MxQjRJY2VuYTkxem1aNlhvRm5oVmZZWWE3L1c5UDMvaXRSRHZpL1Ja?=
 =?utf-8?B?QnI5SFBIUld2b0V3bVBWMXVHQytUdjlWTVFicTVGbGw5TUloc3g0UWh2MGZM?=
 =?utf-8?B?dzNYL2RIQlBmVDBQYUxxeWRPdzRsU2ZiY2ltZUZDZHpTSHFjaUF3emlma0hY?=
 =?utf-8?B?ZUF0eEFDSG9mem5wZE56VjNKb3QxeFdOSitiNEJ5T2EwWkVmWksyWGV1Sitx?=
 =?utf-8?Q?zaFi7064haGQIw6GcAW2ZJpxcDf0+wDqrS?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 737fcab5-6015-4eae-ee33-08d8be42f2d4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 19:30:02.5678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gMWof4kqnFafxysXq5eqLwLgSnyASf9sH7+ZJLlIe2rgqhusGxx24GViM0hcTpZwlyO5tpp5kllr4S8TLkt1Wv92C04QOeJ0rsJ9t6E8l3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4023
Received-SPF: pass client-ip=40.107.14.111;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

21.01.2021 04:17, Eric Blake wrote:
> On 11/18/20 12:04 PM, Vladimir Sementsov-Ogievskiy wrote:
>> We are going to add more test cases, so use the library supporting test
>> cases.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   tests/qemu-iotests/264     | 93 ++++++++++++++++++++++----------------
>>   tests/qemu-iotests/264.out | 20 ++------
>>   2 files changed, 58 insertions(+), 55 deletions(-)
>>
> 
>> +++ b/tests/qemu-iotests/264.out
>> @@ -1,15 +1,5 @@
>> -Start NBD server
>> -{"execute": "blockdev-add", "arguments": {"driver": "raw", "file": {"driver": "nbd", "reconnect-delay": 10, "server": {"path": "TEST_DIR/PID-nbd-sock", "type": "unix"}}, "node-name": "backup0"}}
>> -{"return": {}}
>> -{"execute": "blockdev-backup", "arguments": {"device": "drive0", "speed": 1048576, "sync": "full", "target": "backup0"}}
>> -{"return": {}}
>> -Backup job is started
>> -Kill NBD server
>> -Backup job is still in progress
>> -{"execute": "block-job-set-speed", "arguments": {"device": "drive0", "speed": 0}}
>> -{"return": {}}
>> -Start NBD server
>> -Backup completed: 5242880
>> -{"execute": "blockdev-del", "arguments": {"node-name": "backup0"}}
>> -{"return": {}}
>> -Kill NBD server
>> +.
>> +----------------------------------------------------------------------
>> +Ran 1 tests
>> +
>> +OK
> 
> I find it a shame that the expected output no longer shows what was
> executed.  But the test still passes, and if it makes it easier for you
> to extend the test in a later patch, I won't stand in the way (this is
> more an indication that by stripping the useful output, I'm no longer in
> as decent a position to help debug if the test starts failing).
> 

Still, what is executed is understandable from the test itself.. And IMHO, debugging python unittests is simpler: you get the stack, and immediately see what happens. When with output-checking tests, you should first understand, what is the statement corresponding to the wrong output. It's not saying about the fact that with unittests I can simply test only one test-case (that's the reason, why I think that tests with several testcases must be written as unittest tests). And debugging output-checking tests with a lot of test-cases inside is always a pain for me.

Another benefit of unittest: on failure test immediately finishes. With output-checking tests, test continue to execute, and may produce unnecessary not-matching log, or hang, or anything else.

Another drawback of output-cheking tests: they often test too much unrelated things. Sometimes it's good: you can catch some unrelated bug :) But often it's a pain: you have to modify test outputs when creating new features or changing the behaviour actually unrelated to what the test actually want to test.

Python unittests are more difficult to write, as you should understand what exactly you want/should to check.. When with output-checking tests you can just log everything. But in general I'm for python unittests.

Still I think sometimes about supporting output for python-unitests based tests (not loosing the ability to execute test-cases in separate, may be .out file per test-case?), it may be a good compromise.

> Reviewed-by: Eric Blake <eblake@redhat.com>
> 


-- 
Best regards,
Vladimir

