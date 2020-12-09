Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC222D4348
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 14:33:25 +0100 (CET)
Received: from localhost ([::1]:50522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmzav-0008TH-1o
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 08:33:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kmzZG-0007uS-Mw; Wed, 09 Dec 2020 08:31:42 -0500
Received: from mail-am6eur05on2135.outbound.protection.outlook.com
 ([40.107.22.135]:59361 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kmzZC-0000l0-4i; Wed, 09 Dec 2020 08:31:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i9maEn7EFa24Mcv5QcH3kRUBHQM/cYQSqmADOgTARUUZEbL/7+FSwmnBu/rmTc4vDIogSjsySOa0RshgsJsh0KblQbNTwDgPhmBI/dPJRIl9DJARilLSoGP9/4bugxHx6iX5eUDYUW1lNA9dQ1C8ppdIHE0SqZKupCj+/rx/p/MuBlSXT9pbYOLcnNDlISooe2rkxyILqPjVBeC1jWkaBzBS+fAc4vqT2jtjh9gHjOl8uXjvcAINlOFqRq50s4NA6qFNkEU8IKPnMyb+q7+ohjShWTM74aipZrkWLWOX0cQDAi6RxqO0nMapWzFxhTsxsHqHrx1QYGVfuY9N8Vbqxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hhmorifcWR5vroj68iASTROL7QuG+IT6/KUxV/xIX9Y=;
 b=aQp999ZirTvzZ/TzKdYPTfIcaGPrAIV2D6QFFSdjqwIT0uz4CAp2REdbi8M17Y5VOiNPr9NlbV1yC18KQjXhfAEUp00UjRPceapiBaRUoLbu4h9pCAqb+/UJ0ELprCw1B8twOV/cJcLE5ldyFESpG+DIeQjRaCDVz5E6BueIyrcP5oC1Ts8cOVI1uBngIyjjdyqK9B+YkmEMg/dKZTP0PK80/6fbYk6nEHBdefO8768BDDVrwAUPDA1hXB87AZm6FQtVBzykZY2IJPf5NnInGdlbxS1jZFDVSed6rOQsjFoZcS5uG4HJR9h66/zHYqQfLD2QSh1sprKxnb8oQfO5+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hhmorifcWR5vroj68iASTROL7QuG+IT6/KUxV/xIX9Y=;
 b=AnsV56xM+V9EPdVBlA4TJzz86qPHl4F+uoWNR9K73p08UB6IwU+B44CGTXCgfqsHT4oqUEmxXCx9Qn4Z/A7Uat9FIhq4RQB1ZLsihk59Mdaqb7DXCSY7hiuWe4KB+JrRQDaabYF9tUmbwV47cBSCqDLnTX7rn4i5UaBuwWd65Fw=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3720.eurprd08.prod.outlook.com (2603:10a6:20b:8f::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Wed, 9 Dec
 2020 13:31:34 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.012; Wed, 9 Dec 2020
 13:31:34 +0000
Subject: Re: [PATCH RFC] qemu co-mutex crash / question
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, kwolf@redhat.com, stefanha@redhat.com,
 den@openvz.org
References: <20201209123246.251265-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <0784a161-990a-ba06-2d33-0295327363e2@virtuozzo.com>
Date: Wed, 9 Dec 2020 16:31:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <20201209123246.251265-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM0PR01CA0168.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::37) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.91) by
 AM0PR01CA0168.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 9 Dec 2020 13:31:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25ee4b08-d448-48a0-3ac4-08d89c46bf5f
X-MS-TrafficTypeDiagnostic: AM6PR08MB3720:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB37200F3858E31263491A0B0CC1CC0@AM6PR08MB3720.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oDxUK16rnE/byNptRqq7xviXSWUZHg9U7tavxDQ5j/KxdFGpiagD9jgdKznVUgav2N60O8XHD6MFXZIWOC/IjDBYAxAYK3IHQSkoWRTluJeIkdZUZetzWje16yHJMdrNr6LTYVjrpGrMdU3KIOYssuZ+CBjxSbTI63yaO6MpQ5ruuiZ6xupKXNi792iGEFHCLsE5nWpFpU+BgV/3LwxDIiGHL0uIcp7fhhx9DZFOKe7mzZ5an3ywnpPu69AtldK5m3qNHyOYw6KrWsEee0PZgh/I+P47FLJpLbbQwI5Hw3aWF9WbjxTn6LI6FQA++TgJm9+cTRjaxxawvUkXyeBXctMO9JeuNOyR9M4xeJxP3J4q3LLVrIUydzCHDdQS6USHHcPlnVJZRZI9F4f9KjLAfN+GkPy7q0eRNd8NgLTv8f8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(136003)(66946007)(26005)(16576012)(8936002)(2616005)(86362001)(8676002)(6916009)(66476007)(956004)(31696002)(508600001)(66556008)(107886003)(186003)(52116002)(36756003)(16526019)(30864003)(34490700003)(2906002)(5660300002)(31686004)(4326008)(6486002)(83380400001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?a0djZnNEQ3NpYllrZ3Qra294Y0FhN0tscWlsYWE3WGRseUhUcW5VN2NiL0lZ?=
 =?utf-8?B?Q21LOXRlMDRYK1FxSkxWcEpuL2VOdFZuNnpLOE5UQkVpNFFGRTJtdWdhYVNG?=
 =?utf-8?B?M2Q2R2lXZzlXZTNHRXIyRnkycmY5WmVMbzNNZWpLQUFncW42YXV1TFRGWU5l?=
 =?utf-8?B?NXo3QlBselFVUWIvTlVidzlFdHRGbjhxZzd3bFNwamVnajlrekk2Z293MzJs?=
 =?utf-8?B?UlgwUXY5YlJLUzhxT0xwS2MzbVFPUmJIb0FTM0FhUWVSQVFOTDhrRnZSSFVk?=
 =?utf-8?B?MXBHblZmajhQc0sySWdQOVI5MWxZbWpjcVVxZXg3NmdjdU1ZRzlHSnROQXNL?=
 =?utf-8?B?K1hrWjAxQlR0bTBLTFJIb0dMM25CN01jaU40Tmw2TWlpYU5vdmswN3V2YXBC?=
 =?utf-8?B?U1IvUlFSZVN3VkRtendrN3lCaVFrcjdLT3pLSXRtODZQVURNZGNRbjJvM1la?=
 =?utf-8?B?andBMWg2Zmc3Mk1mdVllL1VkeU1hMHZMSHJ4V09HR0RXRUxQUjVJdHZ6ZzFB?=
 =?utf-8?B?Q3ovVXZDT2JYTXNjcW1Uck14MGhDREEzL0EwRHFEWm12UlUyRE52TXNQV3V1?=
 =?utf-8?B?cW93SWx0Q054L3NGWHpsWEppR09KV0JaOUlQQkhLTFdwaStjdEhqRnFoaEt2?=
 =?utf-8?B?bjNxVFU4enI3cnptYWpBbG9jbEVvdnltTk1vQnBSZ29XZmJWdVVrMVlIeWgx?=
 =?utf-8?B?NnVlaXNUY3NhcmU2dEZGYktpb21oK0NmRThlSXdjcXQ5aDVqVEV2V2dKTmVa?=
 =?utf-8?B?V1hZMXBEQkdGQzRIbi9ON1Y5NVlOVno2M2ZyTXNLZG5Pem40eG1ncm0rMk1S?=
 =?utf-8?B?Q3FjMEZ3dDdMQ1pWTmVKRUNNbDZFV0M5Ykh1VTRTdFBvd2JaVjF1MEtvSndn?=
 =?utf-8?B?bktDbTlXbDU0OCtMMmZkUjltR1QxbWZ1R0RQQWJ4RWVKNVlaWVJlaDFtbVZn?=
 =?utf-8?B?d3YrYk1hK29uTDhjUDcxN3NVajhBRkF3bllBaVc3MWxWOEI1TXBPY05IaFQz?=
 =?utf-8?B?Qy9VK1puVlZQWm91RHNVUkRtODNycWJhUjBFdVkxMXlRVjBSNlZiZ3V0bDU4?=
 =?utf-8?B?aTZmNHNTVzBnbkhqdVFzTmFOeWcrc1BMQUdjbDlKMDdXNy8xSWJqdlJJc3A1?=
 =?utf-8?B?akhxaThweDRXTXo1VUxVclNhMXFuVFI3Qy9sTFJPbFhDWUppOUQ1U1JIYTNY?=
 =?utf-8?B?dDZsbVJsR3pxUjNwOFNkbm1VeHg5bjJaVjBydmxSQUV3bWdTUGNVMk5BYjZu?=
 =?utf-8?B?cnhMckY2N3VMSW41TWJjQUU3SGF1MlZsTi9yUEVoZ0VKMUNONyt5THpCMWhQ?=
 =?utf-8?Q?BHnbKSA2YPibF6xzy9nJd8Q1vlruuauG1h?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 13:31:34.4780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 25ee4b08-d448-48a0-3ac4-08d89c46bf5f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k4NxBRtuRODMMPRavKOMQjtPkqBPv8om2kTnf0hLHpCBBiIEYQnJHVA94CIeKqXNxUVYoG/Y6n686d9IxuqFoHC6oU7FsLFQGTBkY55C2vE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3720
Received-SPF: pass client-ip=40.107.22.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

09.12.2020 15:32, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> I have a coredump of our qemu branch, based on rhev-2.12.0-44.el7_8.2,
> which in turn is based on v2.12.0.. And don't have any kind of
> reproduce.
> 
> The backtrace:
> 
>      #0  aio_co_schedule (ctx=0x0, co=0x55dd539fa340) at util/async.c:455
>      #1  0x000055dd51149716 in aio_co_enter (ctx=<optimized out>, co=<optimized out>) at util/async.c:476
>      #2  0x000055dd511497bc in aio_co_wake (co=<optimized out>) at util/async.c:470
>      #3  0x000055dd5115ea43 in qemu_co_mutex_wake (mutex=0x55dd539c36b0, co=<optimized out>) at util/qemu-coroutine-lock.c:197
>      #4  qemu_co_mutex_unlock (mutex=mutex@entry=0x55dd539c36b0) at util/qemu-coroutine-lock.c:300
>      #5  0x000055dd5109f4e0 in qcow2_co_pwritev_cluster_compressed (qiov=0x7fcbbc972a70, bytes=65536, offset=17582325760, bs=0x55dd539fe000) at block/qcow2.c:4360
>      #6  qcow2_co_pwritev_compressed (bs=0x55dd539fe000, offset=17582325760, bytes=65536, qiov=0x7fcbbc972de0) at block/qcow2.c:4425
>      #7  0x000055dd510d5cd2 in bdrv_driver_pwritev_compressed (qiov=0x7fcbbc972de0, bytes=65536, offset=17582325760, bs=0x55dd539fe000) at block/io.c:1227
>      #8  bdrv_aligned_pwritev (req=req@entry=0x7fcbbc972c60, offset=offset@entry=17582325760, bytes=bytes@entry=65536, align=align@entry=1, qiov=qiov@entry=0x7fcbbc972de0, flags=flags@entry=32, child=0x55dd539cea80,
>          child=0x55dd539cea80) at block/io.c:1850
>      #9  0x000055dd510d6369 in bdrv_co_pwritev (child=0x55dd539cea80, offset=offset@entry=17582325760, bytes=bytes@entry=65536, qiov=qiov@entry=0x7fcbbc972de0, flags=BDRV_REQ_WRITE_COMPRESSED) at block/io.c:2144
>      #10 0x000055dd510c3644 in blk_co_pwritev (blk=0x55dd539fc300, offset=17582325760, bytes=65536, qiov=0x7fcbbc972de0, flags=<optimized out>) at block/block-backend.c:1237
>      #11 0x000055dd510c372c in blk_write_entry (opaque=0x7fcbbc972e00) at block/block-backend.c:1264
>      #12 0x000055dd510c1e18 in blk_prw (blk=0x55dd539fc300, offset=17582325760, buf=buf@entry=0x55dd54a38000 "", bytes=bytes@entry=65536, co_entry=co_entry@entry=0x55dd510c3710 <blk_write_entry>,
>          flags=BDRV_REQ_WRITE_COMPRESSED) at block/block-backend.c:1292
>      #13 0x000055dd510c2f45 in blk_pwrite (blk=<optimized out>, offset=<optimized out>, buf=buf@entry=0x55dd54a38000, count=count@entry=65536, flags=<optimized out>) at block/block-backend.c:1486
>      #14 0x000055dd510ef949 in nbd_handle_request (errp=0x7fcbbc972ef8, data=0x55dd54a38000 "", request=<synthetic pointer>, client=0x55dd539ee420) at nbd/server.c:2264
>      #15 nbd_trip (opaque=0x55dd539ee420) at nbd/server.c:2393
>      #16 0x000055dd5115f72a in coroutine_trampoline (i0=<optimized out>, i1=<optimized out>) at util/coroutine-ucontext.c:116
>      #17 0x00007fcbc5422190 in ?? () from /work/crash-bugs/PSBM-123528/ccpp-2020-12-08-00_59_06-418945/root/lib64/libc.so.6
>      #18 0x00007fcbbca736d0 in ?? ()
>      #19 0x0000000000000000 in ?? ()
>      Backtrace stopped: Cannot access memory at address 0x7fcbbc973000
>      (gdb) p *co
>      $1 = {entry = 0x0, entry_arg = 0x0, caller = 0x0, pool_next = {sle_next = 0x0}, locks_held = 0, ctx = 0x0, scheduled = 0x55dd51195660 <__func__.23793> "aio_co_schedule", co_queue_next = {sqe_next = 0x0},
>        co_queue_wakeup = {sqh_first = 0x0, sqh_last = 0x55dd539f5680}, co_scheduled_next = {sle_next = 0x0}}
> 
> So, it looks like we want to wake up a coroutine on co-mutex unlock,
> but the coroutine is already exited..
> 
> I had no idea what how to debug it, and decided to add some assertions,
> to make sure that coroutine waiting on mutex is entered through
> qemu_co_mutex_unlock, see the patch below.
> 
> Still, when I run make check with this patch applied, I faced a crash
> in ./tests/test-aio-multithread, my assertion fails:
> 
> test-aio-multithread: ../util/qemu-coroutine-lock.c:197: qemu_co_mutex_wake: Assertion `mutex == co->wait_on_mutex' failed.
> 
>      Thread 18 "test-aio-multit" received signal SIGABRT, Aborted.
>      [Switching to Thread 0x7fffe5ffb700 (LWP 24549)]
>      0x00007ffff7063625 in raise () from /lib64/libc.so.6
>      (gdb) bt
>      #0  0x00007ffff7063625 in raise () from /lib64/libc.so.6
>      #1  0x00007ffff704c8d9 in abort () from /lib64/libc.so.6
>      #2  0x00007ffff704c7a9 in __assert_fail_base.cold () from /lib64/libc.so.6
>      #3  0x00007ffff705ba66 in __assert_fail () from /lib64/libc.so.6
>      #4  0x000055555568c153 in qemu_co_mutex_wake (mutex=0x555555771360 <comutex>, co=0x555555803ec0) at ../util/qemu-coroutine-lock.c:197
>      #5  0x000055555568c5a0 in qemu_co_mutex_unlock (mutex=0x555555771360 <comutex>) at ../util/qemu-coroutine-lock.c:307
>      #6  0x000055555557acfd in test_multi_co_mutex_entry (opaque=0x0) at ../tests/test-aio-multithread.c:208
>      #7  0x00005555556bb5d7 in coroutine_trampoline (i0=1434467712, i1=21845) at ../util/coroutine-ucontext.c:173
>      #8  0x00007ffff7078d30 in ?? () from /lib64/libc.so.6
>      #9  0x00007fffffffd850 in ?? ()
>      #10 0x0000000000000000 in ?? ()
>      (gdb) fr 4
>      #4  0x000055555568c153 in qemu_co_mutex_wake (mutex=0x555555771360 <comutex>, co=0x555555803ec0) at ../util/qemu-coroutine-lock.c:197
>      197         assert(mutex == co->wait_on_mutex);
>      (gdb) p mutex
>      $1 = (CoMutex *) 0x555555771360 <comutex>
>      (gdb) p co->wait_on_mutex
>      $2 = (CoMutex *) 0x555555771360 <comutex>
>      (gdb) p mutex == co->wait_on_mutex
>      $3 = 1
> 
> So, it failed, but in gdb the condition is true.. How can that be?
> Does it mean, that assertion crashed prior to set "self->wait_on_mutex = mutex;"?
> But then, we do wake-up a coroutine prior to qemu_coroutine_yield() in
> it, is it correct?
> Or do I need some kind of barrier/atomic-access to make
> co->wait_on_mutex work?
> 
> Hmm, if I move self->wait_on_mutex = mutex before push_waiter:
> 
>      diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
>      index 8af3e70343..a38d5e4bf7 100644
>      --- a/util/qemu-coroutine-lock.c
>      +++ b/util/qemu-coroutine-lock.c
>      @@ -208,6 +208,7 @@ static void coroutine_fn qemu_co_mutex_lock_slowpath(AioContext *ctx,
> 
>           trace_qemu_co_mutex_lock_entry(mutex, self);
>           w.co = self;
>      +    self->wait_on_mutex = mutex;
>           push_waiter(mutex, &w);
> 
>           /* This is the "Responsibility Hand-Off" protocol; a lock() picks from
>      @@ -227,13 +228,13 @@ static void coroutine_fn qemu_co_mutex_lock_slowpath(AioContext *ctx,
>                   assert(to_wake == &w);
>                   mutex->ctx = ctx;
>                   mutex->holder = self;
>      +            self->wait_on_mutex = NULL;
>                   return;
>               }
> 
>               qemu_co_mutex_wake(mutex, co);
>           }
> 
>      -    self->wait_on_mutex = mutex;
>           qemu_coroutine_yield();
>           assert(mutex->holder == self); /* set by qemu_co_mutex_wake() */
>           trace_qemu_co_mutex_lock_return(mutex, self);
> 
> Than it doesn't crash.
> 
> But still.. if in parallel thread qemu_co_mutex_wake() may happen
> during qemu_co_mutex_lock_slowpath() before qemu_coroutine_yield()
> it seems bad.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   include/qemu/coroutine_int.h |  1 +
>   util/qemu-coroutine-lock.c   | 10 +++++++++-
>   util/qemu-coroutine.c        |  6 ++++++
>   3 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/include/qemu/coroutine_int.h b/include/qemu/coroutine_int.h
> index 1da148552f..1fd21b4437 100644
> --- a/include/qemu/coroutine_int.h
> +++ b/include/qemu/coroutine_int.h
> @@ -49,6 +49,7 @@ struct Coroutine {
>       /* Only used when the coroutine has terminated.  */
>       QSLIST_ENTRY(Coroutine) pool_next;
>   
> +    CoMutex *wait_on_mutex;
>       size_t locks_held;
>   
>       /* Only used when the coroutine has yielded.  */
> diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
> index 5816bf8900..8af3e70343 100644
> --- a/util/qemu-coroutine-lock.c
> +++ b/util/qemu-coroutine-lock.c
> @@ -193,6 +193,9 @@ static void coroutine_fn qemu_co_mutex_wake(CoMutex *mutex, Coroutine *co)
>        */
>       smp_read_barrier_depends();
>       mutex->ctx = co->ctx;
> +    mutex->holder = co;
> +    assert(mutex == co->wait_on_mutex);
> +    co->wait_on_mutex = NULL;  /* asserted in qemu_coroutine_enter */
>       aio_co_wake(co);
>   }
>   
> @@ -223,13 +226,16 @@ static void coroutine_fn qemu_co_mutex_lock_slowpath(AioContext *ctx,
>               /* We got the lock ourselves!  */
>               assert(to_wake == &w);
>               mutex->ctx = ctx;
> +            mutex->holder = self;
>               return;
>           }
>   
>           qemu_co_mutex_wake(mutex, co);
>       }
>   
> +    self->wait_on_mutex = mutex;
>       qemu_coroutine_yield();
> +    assert(mutex->holder == self); /* set by qemu_co_mutex_wake() */
>       trace_qemu_co_mutex_lock_return(mutex, self);
>   }
>   
> @@ -266,10 +272,12 @@ retry_fast_path:
>           /* Uncontended.  */
>           trace_qemu_co_mutex_lock_uncontended(mutex, self);
>           mutex->ctx = ctx;
> +        mutex->holder = self;
>       } else {
>           qemu_co_mutex_lock_slowpath(ctx, mutex);
> +        assert(mutex->ctx == ctx);
> +        assert(mutex->holder == self);
>       }
> -    mutex->holder = self;
>       self->locks_held++;
>   }
>   
> diff --git a/util/qemu-coroutine.c b/util/qemu-coroutine.c
> index 38fb6d3084..6c75a8fe41 100644
> --- a/util/qemu-coroutine.c
> +++ b/util/qemu-coroutine.c
> @@ -136,6 +136,12 @@ void qemu_aio_coroutine_enter(AioContext *ctx, Coroutine *co)
>               abort();
>           }
>   
> +        if (to->wait_on_mutex) {
> +            fprintf(stderr, "Co-routine waiting on mutex is entered not by "
> +                    "qemu_co_mutex_wake()\n");
> +            abort();
> +        }
> +
>           to->caller = from;
>           to->ctx = ctx;
>   
> 


may help: all threads bt for this patch applied on master for test-aio-multithread:

Thread 22 (Thread 0x7fffe7fff700 (LWP 260295)):
#0  0x00007ffff711db56 in ppoll () from /lib64/libc.so.6
#1  0x000055555569f99e in qemu_poll_ns (fds=0x7fffe00014c0, nfds=1, timeout=-1) at ../util/qemu-timer.c:337
#2  0x00005555556d3827 in fdmon_poll_wait (ctx=0x7fffe0004e00, ready_list=0x7fffe7ffb660, timeout=-1) at ../util/fdmon-poll.c:80
#3  0x00005555556ca4ed in aio_poll (ctx=0x7fffe0004e00, blocking=true) at ../util/aio-posix.c:607
#4  0x000055555557b8aa in iothread_run (opaque=0x555555803ae0) at ../tests/iothread.c:78
#5  0x00005555556a603e in qemu_thread_start (args=0x5555557dbe80) at ../util/qemu-thread-posix.c:521
#6  0x00007ffff71f94e2 in start_thread () from /lib64/libpthread.so.0
#7  0x00007ffff71286c3 in clone () from /lib64/libc.so.6

Thread 21 (Thread 0x7fffe77fe700 (LWP 260294)):
#0  0x00007ffff711db56 in ppoll () from /lib64/libc.so.6
#1  0x000055555569f99e in qemu_poll_ns (fds=0x7fffd8002290, nfds=1, timeout=-1) at ../util/qemu-timer.c:337
#2  0x00005555556d3827 in fdmon_poll_wait (ctx=0x7fffd8001850, ready_list=0x7fffe77fa660, timeout=-1) at ../util/fdmon-poll.c:80
#3  0x00005555556ca4ed in aio_poll (ctx=0x7fffd8001850, blocking=true) at ../util/aio-posix.c:607
#4  0x000055555557b8aa in iothread_run (opaque=0x5555557ffed0) at ../tests/iothread.c:78
#5  0x00005555556a603e in qemu_thread_start (args=0x5555557dbf40) at ../util/qemu-thread-posix.c:521
#6  0x00007ffff71f94e2 in start_thread () from /lib64/libpthread.so.0
#7  0x00007ffff71286c3 in clone () from /lib64/libc.so.6

Thread 20 (Thread 0x7fffe6ffd700 (LWP 260293)):
#0  0x00007ffff711db56 in ppoll () from /lib64/libc.so.6
#1  0x000055555569f99e in qemu_poll_ns (fds=0x7fffdc002690, nfds=1, timeout=-1) at ../util/qemu-timer.c:337
#2  0x00005555556d3827 in fdmon_poll_wait (ctx=0x7fffdc004250, ready_list=0x7fffe6ff9660, timeout=-1) at ../util/fdmon-poll.c:80
#3  0x00005555556ca4ed in aio_poll (ctx=0x7fffdc004250, blocking=true) at ../util/aio-posix.c:607
#4  0x000055555557b8aa in iothread_run (opaque=0x555555801af0) at ../tests/iothread.c:78
#5  0x00005555556a603e in qemu_thread_start (args=0x5555557dc030) at ../util/qemu-thread-posix.c:521
#6  0x00007ffff71f94e2 in start_thread () from /lib64/libpthread.so.0
#7  0x00007ffff71286c3 in clone () from /lib64/libc.so.6

Thread 19 (Thread 0x7fffe67fc700 (LWP 260292)):
#0  0x00007ffff7063625 in raise () from /lib64/libc.so.6
#1  0x00007ffff704c8d9 in abort () from /lib64/libc.so.6
#2  0x00007ffff704c7a9 in __assert_fail_base.cold () from /lib64/libc.so.6
#3  0x00007ffff705ba66 in __assert_fail () from /lib64/libc.so.6
#4  0x000055555568c153 in qemu_co_mutex_wake (mutex=0x555555771360 <comutex>, co=0x555555803d80) at ../util/qemu-coroutine-lock.c:197
#5  0x000055555568c5a0 in qemu_co_mutex_unlock (mutex=0x555555771360 <comutex>) at ../util/qemu-coroutine-lock.c:307
#6  0x000055555557acfd in test_multi_co_mutex_entry (opaque=0x0) at ../tests/test-aio-multithread.c:208
#7  0x00005555556bb5d7 in coroutine_trampoline (i0=1434468032, i1=21845) at ../util/coroutine-ucontext.c:173
#8  0x00007ffff7078d30 in ?? () from /lib64/libc.so.6
#9  0x00007fffffffd850 in ?? ()
#10 0x0000000000000000 in ?? ()

Thread 18 (Thread 0x7fffe5ffb700 (LWP 260291)):
#0  0x00007ffff711db56 in ppoll () from /lib64/libc.so.6
#1  0x000055555569f99e in qemu_poll_ns (fds=0x7fffd4001ca0, nfds=1, timeout=-1) at ../util/qemu-timer.c:337
#2  0x00005555556d3827 in fdmon_poll_wait (ctx=0x7fffd4004200, ready_list=0x7fffe5ff7660, timeout=-1) at ../util/fdmon-poll.c:80
#3  0x00005555556ca4ed in aio_poll (ctx=0x7fffd4004200, blocking=true) at ../util/aio-posix.c:607
#4  0x000055555557b8aa in iothread_run (opaque=0x5555558027c0) at ../tests/iothread.c:78
#5  0x00005555556a603e in qemu_thread_start (args=0x5555557dbc40) at ../util/qemu-thread-posix.c:521
#6  0x00007ffff71f94e2 in start_thread () from /lib64/libpthread.so.0
#7  0x00007ffff71286c3 in clone () from /lib64/libc.so.6

Thread 2 (Thread 0x7fffecfd7700 (LWP 260275)):
#0  0x00007ffff71231dd in syscall () from /lib64/libc.so.6
#1  0x00005555556a5cc0 in qemu_futex_wait (f=0x555555771bb8 <rcu_call_ready_event>, val=4294967295) at /work/src/qemu/master/include/qemu/futex.h:29
#2  0x00005555556a5e84 in qemu_event_wait (ev=0x555555771bb8 <rcu_call_ready_event>) at ../util/qemu-thread-posix.c:460
#3  0x00005555556a0a42 in call_rcu_thread (opaque=0x0) at ../util/rcu.c:258
#4  0x00005555556a603e in qemu_thread_start (args=0x5555557f1b50) at ../util/qemu-thread-posix.c:521
#5  0x00007ffff71f94e2 in start_thread () from /lib64/libpthread.so.0
#6  0x00007ffff71286c3 in clone () from /lib64/libc.so.6

Thread 1 (Thread 0x7fffed134e80 (LWP 260274)):
#0  0x00007ffff7203f55 in nanosleep () from /lib64/libpthread.so.0
#1  0x00007ffff7f087b7 in g_usleep () from /lib64/libglib-2.0.so.0
#2  0x000055555557ae05 in test_multi_co_mutex (threads=2, seconds=3) at ../tests/test-aio-multithread.c:237
#3  0x000055555557aeff in test_multi_co_mutex_2_3 () at ../tests/test-aio-multithread.c:270
#4  0x00007ffff7f05ace in g_test_run_suite_internal () from /lib64/libglib-2.0.so.0
#5  0x00007ffff7f05874 in g_test_run_suite_internal () from /lib64/libglib-2.0.so.0
#6  0x00007ffff7f05874 in g_test_run_suite_internal () from /lib64/libglib-2.0.so.0
#7  0x00007ffff7f05874 in g_test_run_suite_internal () from /lib64/libglib-2.0.so.0
#8  0x00007ffff7f05fba in g_test_run_suite () from /lib64/libglib-2.0.so.0
#9  0x00007ffff7f05fd5 in g_test_run () from /lib64/libglib-2.0.so.0
#10 0x000055555557b74e in main (argc=1, argv=0x7fffffffe5f8) at ../tests/test-aio-multithread.c:459


-- 
Best regards,
Vladimir

