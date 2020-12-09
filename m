Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AD02D422B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 13:34:54 +0100 (CET)
Received: from localhost ([::1]:44298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmygH-0007mx-Ok
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 07:34:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kmyer-0007Gb-6O; Wed, 09 Dec 2020 07:33:25 -0500
Received: from mail-eopbgr80131.outbound.protection.outlook.com
 ([40.107.8.131]:28390 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kmyen-0006o3-SM; Wed, 09 Dec 2020 07:33:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FWtk9CjMDxOIQ5mAlLxImVoe/NQfVO5Z3EHAtDscTSd50eGFVcLjl0EtNTBPZ8AvTk50HzESTTMEfAZrccJNQqrQ0xbW6mDAI+2GN0Y9wvquNdFSUxzCUU6YJzwWqc7j3NPbJPt7dsR6pcdZWYrlOftBmDlAbrVkuJMfArogoTMtJapoI0tDAB756PIFNa0l7Iq+Bx6yfjnwYgHJDh9c6PCBwR1GFrlSD0u9a0f0ZMYxnE1fI7jbYi0ISR5ta8afrrJqvgO08kxjTtBRMebStQLrRnXPlpNQTXElP+i/nD01DD8+jU5F+qY5kwg3jlRcurOHRueJFAy4xCKQa9UiWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMsoWYqL6odBG2XXGmEOvbHAH/R4OV59M9zWK33fYuU=;
 b=CdV3KD3vQen4F2TBt1+LtpetAl5Ao8tdNCDh6JFntWNQGQ82h9xDwi+8Ch/9lCC+ecUmhyhvSBRsAp1RLsV16ttVjx7lpUyUWGfVXed1DJh2atkO9JkixSjy2vLzJA0elpqL+wQO0MYMo7YKpDSlEOZnBGwS/hg2gJYC7NVPZbzERZFa2s1i9UfrzJvoEzJWp92JVSpo1ZSJkzjqsXh9atxRkQWsqjyGU+Z9Zu0AkcmEvAZKdxt2sqZt3ZVwxM2lDqlcREPPhy9hAju+NdhkRd5sWgYaazpdGWWGizOBBVE2eFmc+gcWYVtVTNlRkxdj+ub7282dlwAOaxsyYMNFhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMsoWYqL6odBG2XXGmEOvbHAH/R4OV59M9zWK33fYuU=;
 b=SnS/66i/5hYhHfCeQ6tW8n+4ba6QkdsQno4gid3hLl9EgrGaXutMsRZUrKDGqccrZ+pd18cxLHtf3G7+38bYweMTrcreufMsD+AvCQ0LQJ2zoi31LohU9mSiWfh67Dbw8TueaZDnwV+3moCoDsR+EeIL8GjH7L/Q4NHLj6CKNoc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4021.eurprd08.prod.outlook.com (2603:10a6:20b:aa::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.29; Wed, 9 Dec
 2020 12:33:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.012; Wed, 9 Dec 2020
 12:33:18 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, kwolf@redhat.com, stefanha@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH RFC] qemu co-mutex crash / question
Date: Wed,  9 Dec 2020 15:32:46 +0300
Message-Id: <20201209123246.251265-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.25.4
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM0PR10CA0033.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.91) by
 AM0PR10CA0033.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 9 Dec 2020 12:33:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2e7fc9e-8e27-4f4b-5a72-08d89c3e9b57
X-MS-TrafficTypeDiagnostic: AM6PR08MB4021:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB402189E7B1BCD7D89F6B3071C1CC0@AM6PR08MB4021.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HP1VeV7k6Xv+4UVPZJ4epep1Y3j9zKiSQaIKapWo3DcIFYd46pVErkCvDm6J151O+dHaSR0omr9Rlctmp0ZZJj6ewVpe8g+dJ8W7u6RDvOfRcDm8E954nRTdUpUjfLSAesDYe7JcN2URuKxh6/t6zzLVY5H+JUv+jVocHXFkmfpui4Rgec7nBppowSF2SULmQDBP7Wop7rZPGHbx3nbpTFkTW0BU0tX79FgYGsTyU9dQ9l/M95/gatSfPQU9tQf46MN7N+xtB0gTtvR6iEwrjicEYHY6jvrGgmaatzrirNHcKIvcffeOUre8K78Gqb+hkG0NWq0OMUXLkHzfOTas8Vv1Xd4jBZf+HL1FXB4Owofb6Jm6dqUhTufxLHqksYh7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(136003)(6666004)(83380400001)(66556008)(66946007)(8936002)(6512007)(8676002)(5660300002)(66476007)(2616005)(186003)(16526019)(36756003)(26005)(956004)(34490700003)(6506007)(6486002)(2906002)(86362001)(508600001)(6916009)(107886003)(1076003)(52116002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?d/3m+fBL4gxPJvICX2yoeTickl63eHBRifQFYqDpcCPvsj/4+u/MUlpVFuO7?=
 =?us-ascii?Q?JFF4klTFCNQioeM3sxdnrWNTVsnpJb5WjbrcYc5XAofNhVy/Hm2t2smwDhNN?=
 =?us-ascii?Q?0X6nQ9wSNqyJw3vIwxS4ToNvKvM4FoGPiFUXl/DoBYNQpDuhr5UfgsUJqxYW?=
 =?us-ascii?Q?H33Nf/bbQnjeWNGVAuE7ojA7KfpVuoOVERAqWpt1KsSbS7opex5vEuSRWNPD?=
 =?us-ascii?Q?uC+rJ/JjnfvN5HbaSWrCV5kB0AHnlMX7aOxPEJVic9GLAv0Apmzeh3Sqk9mA?=
 =?us-ascii?Q?mWDGry2ogJWu8X+g2n6+ltfse8WuOlu+4+imF7Fes2c+mg6ah2oK4bzETibA?=
 =?us-ascii?Q?GNENfDhkt4IYVBKUX6PpIOYssXJCWD2POPF81bQ8NHuHgQhZSqyksCleHdRm?=
 =?us-ascii?Q?Ww5GK/AKVLFa0UxFC5f4QfVOEzGdR7G/c8832tYKhjfb/LXa16zth6tRrXBH?=
 =?us-ascii?Q?Vk8MrQJhH7Yoytf9K5fzVl6zLFvhEeZPFIc94uXWNYnKhwkiNXk1aW7t/aYH?=
 =?us-ascii?Q?WE0GPerXIm9NEQX6ZTL3XpSz76SjJgfIxWg6R7eJ8yOpsa+6c6xDkT87LqJ6?=
 =?us-ascii?Q?TioBRdnD+HQ+OOMmLAtzB4x4b2HpJVlGvg39r9wI3ISL0WnnWD8LSCqXttyB?=
 =?us-ascii?Q?qEv1BvigspnVkjqpUWmRwPBG1MK/aKZbBM2xlFfVqDQ0TmJc5f/JKGjPN1X+?=
 =?us-ascii?Q?RHdTHQE0Gq0agS0iYLiEEx3jdk6mMH1b4M0vICA4bOR7cxZqRIDQc+3xp8kS?=
 =?us-ascii?Q?mrZYRGlkUm1HfwZuX2WPqRKcz33fnue8SUYzljnxTIJpUCI9olHu53tjoWIE?=
 =?us-ascii?Q?qxjduFeWChbLPTawb8KxOEc1zVR30P0LS1szOj7XurKU4qbyc1FUlsFVnFeQ?=
 =?us-ascii?Q?IuL/z7laMgtd60kJTj437G+9gSpXFceULvRSBLksEs8Y8Hru3vHDmkqBvk/7?=
 =?us-ascii?Q?v/XwqrJBlrw/pg2esVhcU3rFcjroacBaTz1595rkYRhqatNsGNFOccoIJ3Vz?=
 =?us-ascii?Q?tT7x?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 12:33:17.9719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: f2e7fc9e-8e27-4f4b-5a72-08d89c3e9b57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w9J2tNk44pnjuBe6DLua/75AmfxE5eK5HBmFvGpSCArZFFG9W1Ip8MJtc0ggUnF63lRQY6e5oaYBqupZ1b7j8kKqFh8YrOK+OWWV3YFTKQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4021
Received-SPF: pass client-ip=40.107.8.131;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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

Hi all!

I have a coredump of our qemu branch, based on rhev-2.12.0-44.el7_8.2,
which in turn is based on v2.12.0.. And don't have any kind of
reproduce.

The backtrace:

    #0  aio_co_schedule (ctx=0x0, co=0x55dd539fa340) at util/async.c:455
    #1  0x000055dd51149716 in aio_co_enter (ctx=<optimized out>, co=<optimized out>) at util/async.c:476
    #2  0x000055dd511497bc in aio_co_wake (co=<optimized out>) at util/async.c:470
    #3  0x000055dd5115ea43 in qemu_co_mutex_wake (mutex=0x55dd539c36b0, co=<optimized out>) at util/qemu-coroutine-lock.c:197
    #4  qemu_co_mutex_unlock (mutex=mutex@entry=0x55dd539c36b0) at util/qemu-coroutine-lock.c:300
    #5  0x000055dd5109f4e0 in qcow2_co_pwritev_cluster_compressed (qiov=0x7fcbbc972a70, bytes=65536, offset=17582325760, bs=0x55dd539fe000) at block/qcow2.c:4360
    #6  qcow2_co_pwritev_compressed (bs=0x55dd539fe000, offset=17582325760, bytes=65536, qiov=0x7fcbbc972de0) at block/qcow2.c:4425
    #7  0x000055dd510d5cd2 in bdrv_driver_pwritev_compressed (qiov=0x7fcbbc972de0, bytes=65536, offset=17582325760, bs=0x55dd539fe000) at block/io.c:1227
    #8  bdrv_aligned_pwritev (req=req@entry=0x7fcbbc972c60, offset=offset@entry=17582325760, bytes=bytes@entry=65536, align=align@entry=1, qiov=qiov@entry=0x7fcbbc972de0, flags=flags@entry=32, child=0x55dd539cea80,
        child=0x55dd539cea80) at block/io.c:1850
    #9  0x000055dd510d6369 in bdrv_co_pwritev (child=0x55dd539cea80, offset=offset@entry=17582325760, bytes=bytes@entry=65536, qiov=qiov@entry=0x7fcbbc972de0, flags=BDRV_REQ_WRITE_COMPRESSED) at block/io.c:2144
    #10 0x000055dd510c3644 in blk_co_pwritev (blk=0x55dd539fc300, offset=17582325760, bytes=65536, qiov=0x7fcbbc972de0, flags=<optimized out>) at block/block-backend.c:1237
    #11 0x000055dd510c372c in blk_write_entry (opaque=0x7fcbbc972e00) at block/block-backend.c:1264
    #12 0x000055dd510c1e18 in blk_prw (blk=0x55dd539fc300, offset=17582325760, buf=buf@entry=0x55dd54a38000 "", bytes=bytes@entry=65536, co_entry=co_entry@entry=0x55dd510c3710 <blk_write_entry>,
        flags=BDRV_REQ_WRITE_COMPRESSED) at block/block-backend.c:1292
    #13 0x000055dd510c2f45 in blk_pwrite (blk=<optimized out>, offset=<optimized out>, buf=buf@entry=0x55dd54a38000, count=count@entry=65536, flags=<optimized out>) at block/block-backend.c:1486
    #14 0x000055dd510ef949 in nbd_handle_request (errp=0x7fcbbc972ef8, data=0x55dd54a38000 "", request=<synthetic pointer>, client=0x55dd539ee420) at nbd/server.c:2264
    #15 nbd_trip (opaque=0x55dd539ee420) at nbd/server.c:2393
    #16 0x000055dd5115f72a in coroutine_trampoline (i0=<optimized out>, i1=<optimized out>) at util/coroutine-ucontext.c:116
    #17 0x00007fcbc5422190 in ?? () from /work/crash-bugs/PSBM-123528/ccpp-2020-12-08-00_59_06-418945/root/lib64/libc.so.6
    #18 0x00007fcbbca736d0 in ?? ()
    #19 0x0000000000000000 in ?? ()
    Backtrace stopped: Cannot access memory at address 0x7fcbbc973000
    (gdb) p *co
    $1 = {entry = 0x0, entry_arg = 0x0, caller = 0x0, pool_next = {sle_next = 0x0}, locks_held = 0, ctx = 0x0, scheduled = 0x55dd51195660 <__func__.23793> "aio_co_schedule", co_queue_next = {sqe_next = 0x0},
      co_queue_wakeup = {sqh_first = 0x0, sqh_last = 0x55dd539f5680}, co_scheduled_next = {sle_next = 0x0}}

So, it looks like we want to wake up a coroutine on co-mutex unlock,
but the coroutine is already exited..

I had no idea what how to debug it, and decided to add some assertions,
to make sure that coroutine waiting on mutex is entered through
qemu_co_mutex_unlock, see the patch below.

Still, when I run make check with this patch applied, I faced a crash
in ./tests/test-aio-multithread, my assertion fails:

test-aio-multithread: ../util/qemu-coroutine-lock.c:197: qemu_co_mutex_wake: Assertion `mutex == co->wait_on_mutex' failed.

    Thread 18 "test-aio-multit" received signal SIGABRT, Aborted.
    [Switching to Thread 0x7fffe5ffb700 (LWP 24549)]
    0x00007ffff7063625 in raise () from /lib64/libc.so.6
    (gdb) bt
    #0  0x00007ffff7063625 in raise () from /lib64/libc.so.6
    #1  0x00007ffff704c8d9 in abort () from /lib64/libc.so.6
    #2  0x00007ffff704c7a9 in __assert_fail_base.cold () from /lib64/libc.so.6
    #3  0x00007ffff705ba66 in __assert_fail () from /lib64/libc.so.6
    #4  0x000055555568c153 in qemu_co_mutex_wake (mutex=0x555555771360 <comutex>, co=0x555555803ec0) at ../util/qemu-coroutine-lock.c:197
    #5  0x000055555568c5a0 in qemu_co_mutex_unlock (mutex=0x555555771360 <comutex>) at ../util/qemu-coroutine-lock.c:307
    #6  0x000055555557acfd in test_multi_co_mutex_entry (opaque=0x0) at ../tests/test-aio-multithread.c:208
    #7  0x00005555556bb5d7 in coroutine_trampoline (i0=1434467712, i1=21845) at ../util/coroutine-ucontext.c:173
    #8  0x00007ffff7078d30 in ?? () from /lib64/libc.so.6
    #9  0x00007fffffffd850 in ?? ()
    #10 0x0000000000000000 in ?? ()
    (gdb) fr 4
    #4  0x000055555568c153 in qemu_co_mutex_wake (mutex=0x555555771360 <comutex>, co=0x555555803ec0) at ../util/qemu-coroutine-lock.c:197
    197         assert(mutex == co->wait_on_mutex);
    (gdb) p mutex
    $1 = (CoMutex *) 0x555555771360 <comutex>
    (gdb) p co->wait_on_mutex
    $2 = (CoMutex *) 0x555555771360 <comutex>
    (gdb) p mutex == co->wait_on_mutex
    $3 = 1

So, it failed, but in gdb the condition is true.. How can that be?
Does it mean, that assertion crashed prior to set "self->wait_on_mutex = mutex;"?
But then, we do wake-up a coroutine prior to qemu_coroutine_yield() in
it, is it correct?
Or do I need some kind of barrier/atomic-access to make
co->wait_on_mutex work?

Hmm, if I move self->wait_on_mutex = mutex before push_waiter:

    diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
    index 8af3e70343..a38d5e4bf7 100644
    --- a/util/qemu-coroutine-lock.c
    +++ b/util/qemu-coroutine-lock.c
    @@ -208,6 +208,7 @@ static void coroutine_fn qemu_co_mutex_lock_slowpath(AioContext *ctx,

         trace_qemu_co_mutex_lock_entry(mutex, self);
         w.co = self;
    +    self->wait_on_mutex = mutex;
         push_waiter(mutex, &w);

         /* This is the "Responsibility Hand-Off" protocol; a lock() picks from
    @@ -227,13 +228,13 @@ static void coroutine_fn qemu_co_mutex_lock_slowpath(AioContext *ctx,
                 assert(to_wake == &w);
                 mutex->ctx = ctx;
                 mutex->holder = self;
    +            self->wait_on_mutex = NULL;
                 return;
             }

             qemu_co_mutex_wake(mutex, co);
         }

    -    self->wait_on_mutex = mutex;
         qemu_coroutine_yield();
         assert(mutex->holder == self); /* set by qemu_co_mutex_wake() */
         trace_qemu_co_mutex_lock_return(mutex, self);

Than it doesn't crash.

But still.. if in parallel thread qemu_co_mutex_wake() may happen
during qemu_co_mutex_lock_slowpath() before qemu_coroutine_yield()
it seems bad.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/qemu/coroutine_int.h |  1 +
 util/qemu-coroutine-lock.c   | 10 +++++++++-
 util/qemu-coroutine.c        |  6 ++++++
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/include/qemu/coroutine_int.h b/include/qemu/coroutine_int.h
index 1da148552f..1fd21b4437 100644
--- a/include/qemu/coroutine_int.h
+++ b/include/qemu/coroutine_int.h
@@ -49,6 +49,7 @@ struct Coroutine {
     /* Only used when the coroutine has terminated.  */
     QSLIST_ENTRY(Coroutine) pool_next;
 
+    CoMutex *wait_on_mutex;
     size_t locks_held;
 
     /* Only used when the coroutine has yielded.  */
diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
index 5816bf8900..8af3e70343 100644
--- a/util/qemu-coroutine-lock.c
+++ b/util/qemu-coroutine-lock.c
@@ -193,6 +193,9 @@ static void coroutine_fn qemu_co_mutex_wake(CoMutex *mutex, Coroutine *co)
      */
     smp_read_barrier_depends();
     mutex->ctx = co->ctx;
+    mutex->holder = co;
+    assert(mutex == co->wait_on_mutex);
+    co->wait_on_mutex = NULL;  /* asserted in qemu_coroutine_enter */
     aio_co_wake(co);
 }
 
@@ -223,13 +226,16 @@ static void coroutine_fn qemu_co_mutex_lock_slowpath(AioContext *ctx,
             /* We got the lock ourselves!  */
             assert(to_wake == &w);
             mutex->ctx = ctx;
+            mutex->holder = self;
             return;
         }
 
         qemu_co_mutex_wake(mutex, co);
     }
 
+    self->wait_on_mutex = mutex;
     qemu_coroutine_yield();
+    assert(mutex->holder == self); /* set by qemu_co_mutex_wake() */
     trace_qemu_co_mutex_lock_return(mutex, self);
 }
 
@@ -266,10 +272,12 @@ retry_fast_path:
         /* Uncontended.  */
         trace_qemu_co_mutex_lock_uncontended(mutex, self);
         mutex->ctx = ctx;
+        mutex->holder = self;
     } else {
         qemu_co_mutex_lock_slowpath(ctx, mutex);
+        assert(mutex->ctx == ctx);
+        assert(mutex->holder == self);
     }
-    mutex->holder = self;
     self->locks_held++;
 }
 
diff --git a/util/qemu-coroutine.c b/util/qemu-coroutine.c
index 38fb6d3084..6c75a8fe41 100644
--- a/util/qemu-coroutine.c
+++ b/util/qemu-coroutine.c
@@ -136,6 +136,12 @@ void qemu_aio_coroutine_enter(AioContext *ctx, Coroutine *co)
             abort();
         }
 
+        if (to->wait_on_mutex) {
+            fprintf(stderr, "Co-routine waiting on mutex is entered not by "
+                    "qemu_co_mutex_wake()\n");
+            abort();
+        }
+
         to->caller = from;
         to->ctx = ctx;
 
-- 
2.25.4


