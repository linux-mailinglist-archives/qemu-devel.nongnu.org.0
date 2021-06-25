Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FC43B4434
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 15:15:07 +0200 (CEST)
Received: from localhost ([::1]:44988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwlfm-0008Du-8m
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 09:15:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwlSA-0000vn-PX; Fri, 25 Jun 2021 09:01:03 -0400
Received: from mail-vi1eur05on2128.outbound.protection.outlook.com
 ([40.107.21.128]:11041 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwlS1-0006HJ-Qa; Fri, 25 Jun 2021 09:01:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iF91mWKR04xqi+oMrk9ZZiw4xNMkVU3V5eXvwaxh78F3WyHGoOVxxHSxEFzMqdnYzUjQ60RAHb/E2iD0T32d902yV7gfrCDdVD4SPLa/0/njbj2CtXOd3C/x95YmUhtY/KTi4+4539q8/F+mX7sFg8qh6Sh1h2F3a3AVBoJhoIc5ssGDRZX5BJIakoS3Vtv3JztvlCJd9u9EFkkY8EsKMOaJ9PbC+rmqBEwnEb2Rz1uD4xs9TdzsME2suhUF2ngWF+3sdzSWu7PApicUQ1QG3pV7RJ9GBU9Rw7ahvlPhNPTkval3sxMYCg0JXVwysT8InN5gOLulven/V61C1plZ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EzHk2FiluR6rLUOwIgXPlILRFFYRPAt15EX+WkhL4PQ=;
 b=WHRaxOmcF3As9ZfiJZe7UIgC9+w36aNWaXZ5zddTtX5i4AEKd8bTbso436tjbiOzy6rp9aMqVR8PilIOt7kknWh0xa2LxSNlnwDlhFkg5LHiFuhhVNVq+ZlccQRcgK/n8x0cu94JrAyGa206mmXgTmk1jHr/gSj0RzOhE7XY1ENf3lZxid3g4SJYMI1Lr+apbu0Ehfq729AabnpDHTMsJcam5Bwe1USLGg/myFiAElaTftOUHTr9L03+lqxcTtpNx1byg5BsOJ5ElrXnEed4mE97Zs7mpNnmm0qWu5uQg7JkXRoNjvMfdO7CXHfNbtqF3Gj5xg/AYuj34C0PKoT6Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EzHk2FiluR6rLUOwIgXPlILRFFYRPAt15EX+WkhL4PQ=;
 b=H71w/QtbGtn1mf1UN/nCvDOGQeKErnjLOkP0JIszNQ+8VGLf9hKvJFNiuOkFGq4h7+ct7ZP+6qVI5+AMn+e9c/7uR7Te2PAlLu8rsURkCKO328H5ermIvm9NQ3LUL3vxZig6lV7PPvyHeiyBbHZe27kX8DxnwKNgxI5gLA9DfK0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1652.eurprd08.prod.outlook.com (2603:10a6:203:3c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Fri, 25 Jun
 2021 13:00:34 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.023; Fri, 25 Jun 2021
 13:00:34 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 jsnow@redhat.com, vsementsov@virtuozzo.com, pbonzini@redhat.com,
 stefanha@redhat.com, eesposit@redhat.com, peter.maydell@linaro.org
Subject: [PULL 10/10] block-copy: atomic .cancelled and .finished fields in
 BlockCopyCallState
Date: Fri, 25 Jun 2021 16:00:06 +0300
Message-Id: <20210625130006.276511-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210625130006.276511-1-vsementsov@virtuozzo.com>
References: <20210625130006.276511-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR0202CA0024.eurprd02.prod.outlook.com
 (2603:10a6:3:8c::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.221) by
 HE1PR0202CA0024.eurprd02.prod.outlook.com (2603:10a6:3:8c::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 13:00:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 816fe3fe-64b8-4508-340a-08d937d9382f
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1652:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1652DB2654137CDDC336DE11C1069@AM5PR0801MB1652.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:151;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lj41cubOO/h4aEYj2TOdgBCuKsGDn2Z/KRqLr+Lwhmm/1GqJKKtmRHKAVekQc3gmBGI9ea1z2Z/ZFFx7+653pKbtatR5JhXE9YPerVWuv66RDzC+f2q4/gcO9AQ179I/i9eeL9/WQj47p7Cov6cTwG4Tm28iWr+JIS32PBJ9dEJ7QrS0ZDoC5sorT9sfxVJVwrEB7dRCrdzopRHsx8nOXKk5fWofGwmDjHDJ6jCITkxrMQHXQLuAlheMqp1oP5p/fwk/sdxL8fU1pSlTFZbcK5lxEGsMyL9KRXINnWb5lrnRWOBbU8ZWHzSiPBs/nia9nuYF1wkucIMUMARYWEiybHdCcFrqmIQ04wmKbBQMp0tGRw7+P3CBQm/v9dtMRHqShdXLFonDOtFkvRK0B/S6BQwrHGKWTN2fGgARL7iJvb5qDzAWj+khY16/9TGKBH3Sq3CCW9s+DUCWjedATuXjDuBGQQPxI4XzDkoYXk4vgYnXaSgkoRQIGmeBdcjCYVJeYa7SNU2t+81c3aIS9/aZ2jikfofHDO5V0AtxjO/izCTSYAobhu7eAG2RnRlNLKBx5lbNj4xK0O8DOScKiY1VWUnZ47LWIBfF/g33WLOS5A4+TGBaIREKeaTgE6SY5UYy480vQvdLK92q2xfPxKKEpHWTfZfdTwbH4WlHl0WYxMySAtvauD6RY4nE6ujjmLdvegM5rX2Yzn8nwXro6XMl0KLd2BVeqg1naVlHl/R/SrI3NFf9ywsU6RfuGPRGbLm1RM5fSC7cgCoWhbDh63Xqwg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(396003)(136003)(366004)(376002)(38100700002)(38350700002)(52116002)(956004)(8676002)(66556008)(2616005)(66476007)(6666004)(2906002)(316002)(8936002)(66946007)(186003)(6506007)(16526019)(26005)(4326008)(478600001)(1076003)(6916009)(6486002)(5660300002)(6512007)(83380400001)(36756003)(86362001)(69590400013)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?01zo33/RK/JDqN4wDGaaQlWkvsMDFMpDcq/dYsX/L6lz/mLedaZyGItUkdcj?=
 =?us-ascii?Q?jnaofQehcpD+g1VtqOMN+pC8JyaHHO3WJOfAWo0Z4XglOxPzLpmf/cwcIcIa?=
 =?us-ascii?Q?1VN9apgBoVx/sfh7obrcVR/JC4Ah1QVpEli/A/7vKRNkIz5VNaH4sv+Q2a6c?=
 =?us-ascii?Q?QGLHYGoQQmX/tdmdVfYvIcDw/DXqm+9SGV4Bvo9Pb4i2nZuRwr+TqYVul/hh?=
 =?us-ascii?Q?/OjaLBUy7vYNcNIg020r6FMXgzVO/+gyL9SQDK5ZF1YIXopjVC2Ym++H3EGZ?=
 =?us-ascii?Q?1Nt6t+fPztBvhXEE2srpCeWq2gOSn1VR526zLw/uBj8w5mG83YZhfzn6c3hX?=
 =?us-ascii?Q?44La8yYzExTqiDrlnnxtWy1o5kd3knApTIxLiXZ9WZ1tur8BMEdZ/tyCZ/WE?=
 =?us-ascii?Q?v/1n/9SUmEBUFqKU0Dox6TiQQaLkvhFgzmYOJgmqUd5P6RrPJyNmRN5qbrTL?=
 =?us-ascii?Q?CI/ZCLMJnG3t0PdbY7fqlYK0m3P2gHOUJAWyoOS7i+GyJ3SS6DQvrPg1GjJg?=
 =?us-ascii?Q?Wccjy1VOqUfMIXCu0zeTbvULrmVjF2om/GyilZHbB/N8ySdp9/7YpHH1uF8V?=
 =?us-ascii?Q?IOuEDSigCLThUvS8zdurB5BNkFJIvkP6IpePU1B4VIKrHmpZrcWt950bRVcv?=
 =?us-ascii?Q?PFyr/p5lL45TREGUBK87N9G1dBjWMjbL4Fbjr+O+2hdVyBLdPaf20b308lvE?=
 =?us-ascii?Q?4ugwXvO8HBycsicLeqGHc9zrKBUGyeQoECv+IVYGQLTUnmuyC0Ok7kRzjq7u?=
 =?us-ascii?Q?LynO7ztJf77VyDRaUTKc76m55bs5gXI5CyK5Orr66lyE3yQGp3VhxCTGFqSs?=
 =?us-ascii?Q?2Ez/UlPtKA+g5qsI+X5zYcE4nu+J1+lgrGOIBhKuP9ByTB/afyfWJ+uj8wTA?=
 =?us-ascii?Q?HklEoBxWXAFcrqqDu7E7V0w+zgMZgq7C/KADd0Pb/bSpaQrLGjmmRkmbRA3C?=
 =?us-ascii?Q?6MMlOu2fZm1V+SPp19VGKFuyKLdPAJvHF2hntONJ3LZFzhrvYnxsnCGnrM6B?=
 =?us-ascii?Q?JK2V+3FykVyQtFmDFvLBvT1hRa6MTkt+dnELIsgFwoh8NZbIRK6iKGkT6GgW?=
 =?us-ascii?Q?19+WVast0fUX1o+s/uLctHgIV2Rh8JBujLEq+mus4F66jrgzqgjK+Fp/Reke?=
 =?us-ascii?Q?wHgeapfPmgOuFDYYNn+GwnlvvCQJG3MYxY0Lj5HB+zOtiTx6zRoIulHb6q1/?=
 =?us-ascii?Q?fvYjZmHgS5doEZkZHmOevBGWY9z9Smlqqyk5yi4LSRmyZMaPgzIl6jiAp+K6?=
 =?us-ascii?Q?kyo5lcgW+WnuuzWjEl2z/KnxtPqM6cgjwkSBZ2V6cOsu05BuSE0drwCNnki0?=
 =?us-ascii?Q?wWLUQAl+XcEz5D+6fkep1mrI?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 816fe3fe-64b8-4508-340a-08d937d9382f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 13:00:34.1277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UUeAHHRO+jgUrZuydYe83bgUZO1MQgo/C++cimXOEbhhe8IwidyygHdktOTXsvgo5ZOyq8FJInUH5EoGP7tNJhFJAM7vjh5vFnQ4C0R8ac4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1652
Received-SPF: pass client-ip=40.107.21.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

By adding acquire/release pairs, we ensure that .ret and .error_is_read
fields are written by block_copy_dirty_clusters before .finished is true,
and that they are read by API user after .finished is true.

The atomic here are necessary because the fields are concurrently modified
in coroutines, and read outside.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20210624072043.180494-6-eesposit@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block-copy.h |  2 ++
 block/block-copy.c         | 37 ++++++++++++++++++++++---------------
 2 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index 338f2ea7fd..5c8278895c 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -18,6 +18,8 @@
 #include "block/block.h"
 #include "qemu/co-shared-resource.h"
 
+/* All APIs are thread-safe */
+
 typedef void (*BlockCopyAsyncCallbackFunc)(void *opaque);
 typedef struct BlockCopyState BlockCopyState;
 typedef struct BlockCopyCallState BlockCopyCallState;
diff --git a/block/block-copy.c b/block/block-copy.c
index f3550d0825..0becad52da 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -52,9 +52,9 @@ typedef struct BlockCopyCallState {
     Coroutine *co;
 
     /* Fields whose state changes throughout the execution */
-    bool finished;
+    bool finished; /* atomic */
     QemuCoSleep sleep; /* TODO: protect API with a lock */
-    bool cancelled;
+    bool cancelled; /* atomic */
     /* To reference all call states from BlockCopyState */
     QLIST_ENTRY(BlockCopyCallState) list;
 
@@ -667,7 +667,8 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
     assert(QEMU_IS_ALIGNED(offset, s->cluster_size));
     assert(QEMU_IS_ALIGNED(bytes, s->cluster_size));
 
-    while (bytes && aio_task_pool_status(aio) == 0 && !call_state->cancelled) {
+    while (bytes && aio_task_pool_status(aio) == 0 &&
+           !qatomic_read(&call_state->cancelled)) {
         BlockCopyTask *task;
         int64_t status_bytes;
 
@@ -779,7 +780,7 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
     do {
         ret = block_copy_dirty_clusters(call_state);
 
-        if (ret == 0 && !call_state->cancelled) {
+        if (ret == 0 && !qatomic_read(&call_state->cancelled)) {
             WITH_QEMU_LOCK_GUARD(&s->lock) {
                 /*
                  * Check that there is no task we still need to
@@ -815,9 +816,9 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
          * 2. We have waited for some intersecting block-copy request
          *    It may have failed and produced new dirty bits.
          */
-    } while (ret > 0 && !call_state->cancelled);
+    } while (ret > 0 && !qatomic_read(&call_state->cancelled));
 
-    call_state->finished = true;
+    qatomic_store_release(&call_state->finished, true);
 
     if (call_state->cb) {
         call_state->cb(call_state->cb_opaque);
@@ -880,44 +881,50 @@ void block_copy_call_free(BlockCopyCallState *call_state)
         return;
     }
 
-    assert(call_state->finished);
+    assert(qatomic_read(&call_state->finished));
     g_free(call_state);
 }
 
 bool block_copy_call_finished(BlockCopyCallState *call_state)
 {
-    return call_state->finished;
+    return qatomic_read(&call_state->finished);
 }
 
 bool block_copy_call_succeeded(BlockCopyCallState *call_state)
 {
-    return call_state->finished && !call_state->cancelled &&
-        call_state->ret == 0;
+    return qatomic_load_acquire(&call_state->finished) &&
+           !qatomic_read(&call_state->cancelled) &&
+           call_state->ret == 0;
 }
 
 bool block_copy_call_failed(BlockCopyCallState *call_state)
 {
-    return call_state->finished && !call_state->cancelled &&
-        call_state->ret < 0;
+    return qatomic_load_acquire(&call_state->finished) &&
+           !qatomic_read(&call_state->cancelled) &&
+           call_state->ret < 0;
 }
 
 bool block_copy_call_cancelled(BlockCopyCallState *call_state)
 {
-    return call_state->cancelled;
+    return qatomic_read(&call_state->cancelled);
 }
 
 int block_copy_call_status(BlockCopyCallState *call_state, bool *error_is_read)
 {
-    assert(call_state->finished);
+    assert(qatomic_load_acquire(&call_state->finished));
     if (error_is_read) {
         *error_is_read = call_state->error_is_read;
     }
     return call_state->ret;
 }
 
+/*
+ * Note that cancelling and finishing are racy.
+ * User can cancel a block-copy that is already finished.
+ */
 void block_copy_call_cancel(BlockCopyCallState *call_state)
 {
-    call_state->cancelled = true;
+    qatomic_set(&call_state->cancelled, true);
     block_copy_kick(call_state);
 }
 
-- 
2.29.2


