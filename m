Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC8136B051
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 11:13:44 +0200 (CEST)
Received: from localhost ([::1]:49996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laxJH-0004Ee-GJ
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 05:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1laxHn-0003lL-W4; Mon, 26 Apr 2021 05:12:12 -0400
Received: from mail-vi1eur05on2129.outbound.protection.outlook.com
 ([40.107.21.129]:50497 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1laxHl-0004y1-A7; Mon, 26 Apr 2021 05:12:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q8Ti5TYJblMmixbanAhW8My8YQUSLDw9iAFcMzm6/w7WP3mydoMDDJvz64Mp0BEbk+9jPpUPHNV37NWYW3g3JEB5foNqKV6wbqwIuuDV/agnU/v8ayoMWN6W24gYbXr5bucuorQ20ynZz2RatLKOZwmJE2V8MknuLqpiayGEvQtbjLJtXzsZn0lyFkf4Hq6G11sGQxZpj9IOYD9iOCF23gTW/0WieikmSXHlBulXkDwCt6+LIn06jtv/nL0Mh+CrgF4q3JnjtK6uA9FU52XoYxcGufTPic4igbO3xJxXJ9mjLWCmHno3mMDcYGnFKKjFxmXFS5vB6RtEg6TrEfFODA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOiGrcqMXHfit+GHsG8Z3Pz9coe/gRJRHy3AOx7fvKU=;
 b=dpisMUW5MzV6XzIdbPD7ma5uTmcFoLNL5oXjjqkEBxmyn5D/0V1SWYxiQzFs+wyUfW6OS6X1Cf1Y0BOVaRopD3qpFcuXsa7OFdvUklLh4jar4RBBuli8e7IGmz0khhOTSP9yw2R7ombjVWD15MyswHrIY0FznxQyVg72GbyyL362de5zXdRI7gApYlvuEvzDnBMp+pLFrf7uxR9bxHyUdUKygxpcQS/LF+cSrBGGTKZAsNC1MIs+jomn0pY5GOnHr1sVZL7Qedv+KUWcRXVAo9dWvk0FjM72+jkHpI5PEZgCkBfYun0/SEvtkZ5YXZuEBrF266JtXPe77AA8tM2gOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOiGrcqMXHfit+GHsG8Z3Pz9coe/gRJRHy3AOx7fvKU=;
 b=uzoF+dFezFUw22aE3/bQZQc6zGsX40h9bvRZBhG+FlFw8AmoHtzWEQiBUpuYYA7h14DaRr08QKkKYQ1A5tqhDQVYU2TtptfKktAh+THK9q2e4w4hSPAvpNyd2PY9fcV+POj0t2je72qYiofxtAbWvkpQQge1VYbO3W1SL1e2SlM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4277.eurprd08.prod.outlook.com (2603:10a6:20b:bd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25; Mon, 26 Apr
 2021 09:12:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 09:12:05 +0000
Subject: Re: [PATCH 03/11] block/block-gen.h: bind monitor
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, crosa@redhat.com,
 ehabkost@redhat.com, mreitz@redhat.com, kwolf@redhat.com, philmd@redhat.com
References: <20210423214033.474034-1-vsementsov@virtuozzo.com>
 <20210423214033.474034-4-vsementsov@virtuozzo.com>
 <87mttob6ic.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <e5025132-fa28-a29e-7575-ab26bcf62e7c@virtuozzo.com>
Date: Mon, 26 Apr 2021 12:12:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <87mttob6ic.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: PR3P189CA0088.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.222) by
 PR3P189CA0088.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.22 via Frontend Transport; Mon, 26 Apr 2021 09:12:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5335866d-ad14-4c21-ba4a-08d908935c5a
X-MS-TrafficTypeDiagnostic: AM6PR08MB4277:
X-Microsoft-Antispam-PRVS: <AM6PR08MB42779D4C0BB4F57011DAD0ECC1429@AM6PR08MB4277.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:332;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BiiIMxfOhCh494+yjb/60JgGdDVQ+axWNnb4/7e48scbij/KQx1S2VJGN4KmmFzi72ceXND7fPC/K3X2zoGOFVE96AW9Bhwf+jHoyWC5n0ZAljxiUIsUKXmburn8J1P5FJdEZlTnXOpxN4g42r6rC8AAzbxGWTEZXCBelV0V1m/8FfWb3bCES4BDP11V/o1jsbrfWEbfxymdiqrE4tUWGJjGkF7yttE0/XKZUdrtHhgpc/L+FhMq/WNtpV6Er593h0ZoIX2U+8F50IrLeVMyaBDMEDW/+zSe7GOLiH28IYtRALPysnsoe8k7v3DgBmcEBHX5DMHDaH9s5YEJ7yiXF5D2iqvAx1+6vN4hE8JblRywuI1PwEoolGujjqNQzMtTv08QBShFP+acpXYG05/UBfL7aZdY01hwvOlhjShpB/kj9p7K+4+T3XqdBzGrflhni2EU0W2yU91uvXRIpEIA6JQ/DM+5mEMu5jgHsRvXrb0zLS+tt0JmOONogH07F6mYQrsEMKEsGnkUrslKkmlysg3P7HL0PcZ0wu9vx1N1UYGcWDdTnOqBI37zd1zV84Q77mvEy3uzn++MakaqGc3/Q1r08JTz95Z5ayOZcnl+hLGIOD9v2F1RZnTcSBzXzrkzAPRPY26b653iylL0auFIpVaaJlYABUdxx0/vJCxedeiht/Npfst27z/eEISAizkxziF2oyJUsFdYm5wO7Tx176ljnaeBlZitF8NjgsMstV0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(366004)(376002)(346002)(396003)(136003)(2906002)(8936002)(4326008)(31686004)(38350700002)(38100700002)(6486002)(5660300002)(31696002)(16526019)(6916009)(186003)(66476007)(66556008)(66946007)(86362001)(2616005)(83380400001)(8676002)(52116002)(36756003)(956004)(478600001)(16576012)(26005)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TnhTR2Y0YUhra0RRemxXMEVmdTJ6N3d2TnNrbFhGRDZ1UTMvZWdoN3hXTmNy?=
 =?utf-8?B?R0pDL3VsNzN0S2Z6c3hFZ0toZGswcm9nbXNwZFRxMTZvODFFTWVKQ2ZJNHJY?=
 =?utf-8?B?ckRpYXJpeEFVZXI5SWxURXhqS3IvVGcyVDFvbFFZSTVLRjZSUU9hRWlFZ0Vq?=
 =?utf-8?B?bFdFcHdJcjloYkpUcDArQmVZRkFzNDZ4UG5kL2tyY01MZHBpK1gxaWkzdmtQ?=
 =?utf-8?B?N1g3WE0yR3JIbGpoQ2poZVVoVjFBL25UeG9vT1pHNWY2U3dUa2wwRGM0M012?=
 =?utf-8?B?NGxNeWJ2S0kyNko0RngyVFRjb2ViK1JqREEzVnhBN09Iek1ZZ0tzbG05cjFB?=
 =?utf-8?B?SnRPbCtjVEtDbkVLWTJ3UXlxaHhVNjRMaTdiZmtwVDZYd09xRGZvQmUzM2Mw?=
 =?utf-8?B?OVNyVkNxREVISmZuR1EwbCtVK1cwTG13UjhNeEVSaEZtZ0ZhY0hPWnZvWVI5?=
 =?utf-8?B?dGR3VG1RMk14Z0JwOWVHNXhPMGxORVFVREpaNlJJYnZQZFA0SWxqb3duYk9Q?=
 =?utf-8?B?RlNSa3pXaDU0NDRqSzArTFpNRXZndmFyS0Y0ZXlldm5oWjljL1d5MG5WREw1?=
 =?utf-8?B?VWhCVTJJV25VSU1td0Q5c3VQNzA3RU50ZW9YaE1OdlFuangzZG9JQzJXY3p5?=
 =?utf-8?B?cjR5Z3dOQW5GV0hmM0JjV3BRWDl5ZGhyaTVLV1BlelZ4WGNBWVp5V1grTjYx?=
 =?utf-8?B?MkF4RXV2ZzcrbWpxcy9hYWJyOGc3eDR2RU5hdm9pZmdWQXFHTmU3MyttcWVw?=
 =?utf-8?B?bVRRM1hmMVlQNzcyUFRBVm1IYmxPWlpQZFdHT3VxY0lLQnVxSlRyK2RxbSs0?=
 =?utf-8?B?UXBVMCt5Mk84N0NneHBESjl5SktpT3ZHRTJ2ZmJ0aWlMNjdPSWFmQ2RNV0Vp?=
 =?utf-8?B?TEY0MFNuY3UxaDZnenlhSW51RFprbU5DZmVrQ2pvdWFRbEpaNHhxaUtjK3gv?=
 =?utf-8?B?STRnM3Q2Tmo0cEcwRGxibXdjNG5seXFKNVIxaUNha1ZkYnczc0hYZlJzS0pI?=
 =?utf-8?B?bHBYb2tHYjk4ZWxwaStpb3FXYUJHREY0RFB0bG9vQjh4b3lqZjhBRHA5aW4y?=
 =?utf-8?B?TzBhVnUrSFdNS3pqLzFVUnBRb2FvRlkrZlU0bExnd3VxZmpPRS9jVno2T0gv?=
 =?utf-8?B?dm5GcWE5alBna3VCVEtWcTBmN3RGS0xvQStHWHg2S1djRm1ETWRvbjlodFdl?=
 =?utf-8?B?bUkvZXp6eXk1TXEzQjNrbHdtUm8zQlArVHp6UDRXcWd1aWd4TXVUdG9tL1ZE?=
 =?utf-8?B?bUdWSnFySSsyaTgxS1l1b1NjZkhuMG4rK1VOSzNQczJSV1ZoN0pDb0tidjF5?=
 =?utf-8?B?bU5uTkJONTE4bldOaXg5TDN0RXNsWjF3TWVpL2lvTkZDdGtSYkJreEtWTnpD?=
 =?utf-8?B?elVOb21iZ2dJb0o3NEdxejBHL3FpMlNxMXBnSFpTT1pKaU5PQ2ZyTkp4cTQx?=
 =?utf-8?B?RzFCU1JqZktqb0lqYWN6a216NTd2Z2NhaFVMV3NJR3RpcVVrOWNzaEEzTXEw?=
 =?utf-8?B?Tk5peFZvN3VOK0wzbWZEcFVEelU0ZEpiWDJVUGQ2UndXamJPamxmU1FKdG8r?=
 =?utf-8?B?cXZNZDg3SVFlSThWSERSV242ZUdlY0x3N0x1cDhnNmFVYm16bUJQL21XdjlT?=
 =?utf-8?B?ZVpnVUtCSFVjSW9KL3l5NmdleWJ1Z1l2d0JWQ210MythNUYwRzZVejVseVE1?=
 =?utf-8?B?UmUvOXBnWTk1UkNvcTZBS2p1aCs2bWY5alY0NG84ZWt1Q2dZSUJibmVEb2xq?=
 =?utf-8?Q?lXNPmrLBtAralO9kCmYVfacQYoKZclb8WgynXRG?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5335866d-ad14-4c21-ba4a-08d908935c5a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 09:12:05.3256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xYM98kyw+gUPBn42E2eDIgYggmuYvJcXasr615Jik7wK4MBkEjXxe/SPN7dePvi1bSqRPkWuXgNALyV8mgI89ISp4nmBHDWVy6NzQZIUUok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4277
Received-SPF: pass client-ip=40.107.21.129;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

24.04.2021 08:23, Markus Armbruster wrote:
> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
> 
>> If we have current monitor, let's bind it to wrapper coroutine too.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block/block-gen.h | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/block/block-gen.h b/block/block-gen.h
>> index c1fd3f40de..61f055a8cc 100644
>> --- a/block/block-gen.h
>> +++ b/block/block-gen.h
>> @@ -27,6 +27,7 @@
>>   #define BLOCK_BLOCK_GEN_H
>>   
>>   #include "block/block_int.h"
>> +#include "monitor/monitor.h"
>>   
>>   /* Base structure for argument packing structures */
>>   typedef struct AioPollCo {
>> @@ -38,11 +39,20 @@ typedef struct AioPollCo {
>>   
>>   static inline int aio_poll_co(AioPollCo *s)
>>   {
>> +    Monitor *mon = monitor_cur();
> 
> This gets the currently executing coroutine's monitor from the hash
> table.
> 
>>       assert(!qemu_in_coroutine());
>>   
>> +    if (mon) {
>> +        monitor_set_cur(s->co, mon);
> 
> This writes it back.  No-op, since the coroutine hasn't changed.  Why?

No. s->co != qemu_corotuine_current(), so it's not a write back, but creating a new entry in the hash map. s->co is a new coroutine which we are going to start.

> 
>> +    }
>> +
>>       aio_co_enter(s->ctx, s->co);
>>       AIO_WAIT_WHILE(s->ctx, s->in_progress);
>>   
>> +    if (mon) {
>> +        monitor_set_cur(s->co, NULL);
> 
> This removes s->co's monitor from the hash table.  Why?
> 
>> +    }
>> +
>>       return s->ret;
>>   }
> 

If I comment the new code of this patch (keeping the whole series applied), 249 fails, as error message goes simply to stderr, not to monitor:

249   fail       [11:56:54] [11:56:54]   0.3s   (last: 0.2s)  output mismatch (see 249.out.bad)
--- /work/src/qemu/up/hmp-qemu-io/tests/qemu-iotests/249.out
+++ 249.out.bad
@@ -9,7 +9,8 @@

  { 'execute': 'human-monitor-command',
         'arguments': {'command-line': 'qemu-io none0 "aio_write 0 2k"'}}
-{"return": "Block node is read-onlyrn"}
+QEMU_PROG: Block node is read-only
+{"return": ""}

  === Run block-commit on base using an invalid filter node name

@@ -24,7 +25,8 @@

  { 'execute': 'human-monitor-command',
         'arguments': {'command-line': 'qemu-io none0 "aio_write 0 2k"'}}
-{"return": "Block node is read-onlyrn"}
+QEMU_PROG: Block node is read-only
+{"return": ""}

  === Run block-commit on base using the default filter node name

@@ -43,5 +45,6 @@

  { 'execute': 'human-monitor-command',
         'arguments': {'command-line': 'qemu-io none0 "aio_write 0 2k"'}}
-{"return": "Block node is read-onlyrn"}
+QEMU_PROG: Block node is read-only
+{"return": ""}
  *** done
Failures: 249
Failed 1 of 1 iotests



-- 
Best regards,
Vladimir

