Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4183B4404
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 15:05:10 +0200 (CEST)
Received: from localhost ([::1]:46888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwlW9-0006jH-IX
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 09:05:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwlRs-0000lW-FU; Fri, 25 Jun 2021 09:00:44 -0400
Received: from mail-db8eur05on2104.outbound.protection.outlook.com
 ([40.107.20.104]:54361 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwlRh-0006GP-Tu; Fri, 25 Jun 2021 09:00:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MptH1p26mfTtk9QdhDl7RHsDpFyDRyJRwjWxrtb5MjyFjduDyzZs4eqau2IhHHDZ9yXt+UDDGirR+Ej3sGLl/vFxLQFEdDMMaVfUZLzUPUmD3oix5NK7o3wDkI6tse9tJdAzVxVmDrB1xbK4VrOmBKfCfDPSfP4me70DcOmqTijP2br1Ah76XS3kZcOB1JRXQwZ6NF7d9XKXJIEytzlo7qbt/IDHhgGYsl9D74TVvzrh7Haox0meriT0qQO3Qu8bMh/3/MoXVNDO8WCzcNu8UJM0dJ3DFhuLXPFTGdOp5r+0pcjnWZgjuKAW062DH2ORa+AdkF9ejhpLjHIdti2Z9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHF8oUnBI0mTbU4T3yx4Ln+ekOX+8DOwCX7aKrwCIP4=;
 b=eAFKmqFC3ATMxOPHphlo0y+0HOcW7+V4kZ0Cs/SCyhbA8Aqy28KOsi34GIAe4Xx4huND4ilk2+e5WPPD5oex3rD69erJshWgjQF6NPTGlOVLBTyImEnGVSF+fnxl9UVWFq4DRuIqAQMkENaIXVY7xdDpALqUTfs5E2YwrYegGhyDqcOWIsABMGybSRW3wqCLKzqwebP28alBFfFj3lGoBYoSQtWaBpsCUIvlBt6EQ8PPtXp7R19jdTFpl70nc5ZHA6Z3RBgCbSE4pt+77AtQGkIi6cZyBBPCPcSaISmg2L7KGmR8vMP1eXvoFSQ0xgl5hYMmOPLAqTH+sBlvZXGRIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHF8oUnBI0mTbU4T3yx4Ln+ekOX+8DOwCX7aKrwCIP4=;
 b=MBzj1Bq9mNEz7RQnaUC+Tn8dZJFOD4l3UfFLaHQtGZMo1vgx99qSlK/xZiNgJR/OGNDVjc+wjPz79XwWpC3N2Wcd9HprkTKVjIknFIyUODZhSBdPfEhaFcmj2IWI0yMwbx40Ogu0lXj9Jjn1zgjlq2Fi1F76KRWeN8r/JmjwFYQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6134.eurprd08.prod.outlook.com (2603:10a6:20b:291::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Fri, 25 Jun
 2021 13:00:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.023; Fri, 25 Jun 2021
 13:00:30 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 jsnow@redhat.com, vsementsov@virtuozzo.com, pbonzini@redhat.com,
 stefanha@redhat.com, eesposit@redhat.com, peter.maydell@linaro.org
Subject: [PULL 07/10] block-copy: streamline choice of copy_range vs.
 read/write
Date: Fri, 25 Jun 2021 16:00:03 +0300
Message-Id: <20210625130006.276511-8-vsementsov@virtuozzo.com>
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
 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 13:00:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6648543e-1eb7-41e7-ecf2-08d937d935d3
X-MS-TrafficTypeDiagnostic: AS8PR08MB6134:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6134222E493E32055E2933F7C1069@AS8PR08MB6134.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:510;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bp9QLxv1tqeJ3xdMdv/WhusFUAIcNp4Z4AqP+Lq7u62aJotiRjoiIGkTAzevwFJrqapLtngVSwdHiSYF/OnHh30ZgjRyNV3RlgbDGtqh+qcVwhdpk2ZfXczhQNPeoeXC5vpKa6f2Q9fytEYrg43omFoJYVVfdgkgbE/j83BQ4rWOQzb6BO36GnBNtsUrsBPeBCwkdrx1KorlYjoBOQTZSeN+kUYo3OYB4jmAtCAZp0ARXCI7u0j+QzkCnzFj93mmYO1XOS0QbzTUzUPVGv7jrjHcyiqHSP75m74E8ePmYGvw6dSRNDKImX2HnrWBsIWNP9AbiZMnzXlXGlayaWvcKQzOQ0ikMpvrjjMiPLzOEpgI7d+j5UvlSCBNKCinlHLNV0Pj6c3Tz/b6pMN+ELQHM2jvnR2wnsPZ9Cf/lviJO1YokdnAkw4DqzLq4mSByN7Yj+nMi6lCighf0W9G3evIChzFr2PScKUa7+567b7MGd4exnYoc/2La/HUElu8lJ4NQS4OId3AlMA9KrNAqvXdXEdHr6Evts+7U5srAkIS3BeSAY3gcki6nVpwvfjvgZBD8qUTEYJF9eWwGuEDRNhv/8iVTAQM7OZNdmLUVqKDZ5GdpZ4oRewWuW/UvONO9Jz5WOUlCt3F5NQUM0sFdl2FOag8J83fShmKzJpI3+O1vOrrLb9G6RnqGEsvnqoI3GCA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(366004)(136003)(39840400004)(6916009)(6666004)(66556008)(66476007)(2906002)(66946007)(956004)(8936002)(16526019)(8676002)(6506007)(6512007)(26005)(478600001)(2616005)(38350700002)(38100700002)(6486002)(316002)(83380400001)(86362001)(36756003)(5660300002)(30864003)(1076003)(186003)(4326008)(52116002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YCA1mDrrPnEHMVaOn2RWookqpZgBk1AUf3Nn7mwO1mXHwGIG3bYkaFGCqXzI?=
 =?us-ascii?Q?j+y/7vlQ8n4FBe4A049axZkHoSM0E3UyoXFFfDC1rvaMNf9uY1xlFLAWL2Jr?=
 =?us-ascii?Q?fVcn0/HtDi4umbJhh4chdYnUXmaZ1lucuEAb0QKFXDb7rq8x//PIbkEkJ0OA?=
 =?us-ascii?Q?GWYN1r1EOCAQoJA5uiNuMrAjztmwS9mflJ4XFdK0FKWHg6duwYS/UO0gxD2N?=
 =?us-ascii?Q?bs11SGrkaMVPJuR8jQ4NgHBMoua7mWW4vKExz69/slpvhpx/LxAsHvqhSYFm?=
 =?us-ascii?Q?zeOwf2OPy4fqdD4On0u3tJrDa6C1QXeBWYjo6G+q2P1OEVnjp4n7RnZ1vLWw?=
 =?us-ascii?Q?swhsAmYs6AvMqAj54CROD7mevrfPmqvuTAzFWvyKUXM8kAvBuycQopZR0Bus?=
 =?us-ascii?Q?U5wi16CWvApGUJHkoFDFjKVKdrWC8QFylJCpC1wynzLpPXAvdlLAdphq07Mi?=
 =?us-ascii?Q?wCnvAGpESkkCO8bQh5qQaWKyvjflcKZ5TvEVIEDMbL1CfDp0TgpOtINgIZCp?=
 =?us-ascii?Q?J1cy5XrkFXTBD5/D72suLioxQ2pmA5+eb23uRjIqlzftUJz9etLigjlh3U2+?=
 =?us-ascii?Q?Y3RE7sMsWU8yJQn9GJz3A4tcUY1aqlmDxAzqOPW1NF35mzEu9iCg77tHUqHU?=
 =?us-ascii?Q?w0nzd7CCJIpFBA09T9MqdodVUgZrzCaGdN3pyGiXtM6Ky+cTWB0hZtSutAnS?=
 =?us-ascii?Q?92o3+88FnaU59j+1zuUG5EBjrGrLZ4VFN9esYSs6v+pPx5Za+/Dy9PPdDjmG?=
 =?us-ascii?Q?AyfwPBRmDAYgYDcGwWXlw2kmxl2HlyINxcoQemUNx4wij3i/t7BwRP3fdbpO?=
 =?us-ascii?Q?rNQWJsPhVby58Q4eEVD2FGgLqFo7EMsZaVRDuznhPCPT9AV1+35mUO8HALZx?=
 =?us-ascii?Q?78wZMcFXeAWWTdXhvd0lzPzqsRB+4TAaMVSheXB7e1PdwfnOubIdL+ej67pm?=
 =?us-ascii?Q?MKveKOfiMpLaydcxS9gatYc9vxeLPKceYNMrxBuB75oPRAoIoVmtjypuW2ko?=
 =?us-ascii?Q?MTUQgj+BbGFMUQn+6WCO5TW6y8k0bt6C8oBlJv/IGIVMQjrbFKYyS5CK53WM?=
 =?us-ascii?Q?aHwc03XkqXGZrzBNzBxNxtc6fEnvUqy/ij7b+BE8riBwlrElC6k84T2A29Kf?=
 =?us-ascii?Q?HJod6WjdMYq+/nDRwRD75R7onFvLk4ycbSEGDPpDo95+dDRySIQrPUuXkRYt?=
 =?us-ascii?Q?ljNcI5MgcRTOVIdVX76TsnSbGfPRgCO15KEidxkSYCQtPD2CIuVgzTVJZThB?=
 =?us-ascii?Q?FJR/EbUyLf4Ra0p6mHmvxI1y3mx9WVSOBf/HIJtJw5QBLxAgFXT9hX1uprK5?=
 =?us-ascii?Q?sM/v5Yl5nTsZ5bfWbPNVu7BP?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6648543e-1eb7-41e7-ecf2-08d937d935d3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 13:00:30.1382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gBlnl+zIiYMPl7fN6G0k81FsFNgxVtFKkz8RtTdJh1fquh/HlUWn7mpszF3Z5/s7x4Dlr2KkBHtu2GQnONEGEGT8jM1xmYVzxRTXNJW5Jqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6134
Received-SPF: pass client-ip=40.107.20.104;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

From: Paolo Bonzini <pbonzini@redhat.com>

Put the logic to determine the copy size in a separate function, so
that there is a simple state machine for the possible methods of
copying data from one BlockDriverState to the other.

Use .method instead of .copy_range as in-out argument, and
include also .zeroes as an additional copy method.

While at it, store the common computation of block_copy_max_transfer
into a new field of BlockCopyState, and make sure that we always
obey max_transfer; that's more efficient even for the
COPY_RANGE_READ_WRITE case.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210624072043.180494-3-eesposit@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/block-copy.c | 176 +++++++++++++++++++++++----------------------
 1 file changed, 90 insertions(+), 86 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index a437978e35..0a1cf3d0cb 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -28,6 +28,14 @@
 #define BLOCK_COPY_MAX_WORKERS 64
 #define BLOCK_COPY_SLICE_TIME 100000000ULL /* ns */
 
+typedef enum {
+    COPY_READ_WRITE_CLUSTER,
+    COPY_READ_WRITE,
+    COPY_WRITE_ZEROES,
+    COPY_RANGE_SMALL,
+    COPY_RANGE_FULL
+} BlockCopyMethod;
+
 static coroutine_fn int block_copy_task_entry(AioTask *task);
 
 typedef struct BlockCopyCallState {
@@ -64,8 +72,7 @@ typedef struct BlockCopyTask {
     BlockCopyCallState *call_state;
     int64_t offset;
     int64_t bytes;
-    bool zeroes;
-    bool copy_range;
+    BlockCopyMethod method;
     QLIST_ENTRY(BlockCopyTask) list;
     CoQueue wait_queue; /* coroutines blocked on this task */
 } BlockCopyTask;
@@ -86,8 +93,8 @@ typedef struct BlockCopyState {
     BdrvDirtyBitmap *copy_bitmap;
     int64_t in_flight_bytes;
     int64_t cluster_size;
-    bool use_copy_range;
-    int64_t copy_size;
+    BlockCopyMethod method;
+    int64_t max_transfer;
     uint64_t len;
     QLIST_HEAD(, BlockCopyTask) tasks; /* All tasks from all block-copy calls */
     QLIST_HEAD(, BlockCopyCallState) calls;
@@ -149,6 +156,24 @@ static bool coroutine_fn block_copy_wait_one(BlockCopyState *s, int64_t offset,
     return true;
 }
 
+static int64_t block_copy_chunk_size(BlockCopyState *s)
+{
+    switch (s->method) {
+    case COPY_READ_WRITE_CLUSTER:
+        return s->cluster_size;
+    case COPY_READ_WRITE:
+    case COPY_RANGE_SMALL:
+        return MIN(MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER),
+                   s->max_transfer);
+    case COPY_RANGE_FULL:
+        return MIN(MAX(s->cluster_size, BLOCK_COPY_MAX_COPY_RANGE),
+                   s->max_transfer);
+    default:
+        /* Cannot have COPY_WRITE_ZEROES here.  */
+        abort();
+    }
+}
+
 /*
  * Search for the first dirty area in offset/bytes range and create task at
  * the beginning of it.
@@ -158,8 +183,9 @@ static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
                                              int64_t offset, int64_t bytes)
 {
     BlockCopyTask *task;
-    int64_t max_chunk = MIN_NON_ZERO(s->copy_size, call_state->max_chunk);
+    int64_t max_chunk;
 
+    max_chunk = MIN_NON_ZERO(block_copy_chunk_size(s), call_state->max_chunk);
     if (!bdrv_dirty_bitmap_next_dirty_area(s->copy_bitmap,
                                            offset, offset + bytes,
                                            max_chunk, &offset, &bytes))
@@ -183,7 +209,7 @@ static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
         .call_state = call_state,
         .offset = offset,
         .bytes = bytes,
-        .copy_range = s->use_copy_range,
+        .method = s->method,
     };
     qemu_co_queue_init(&task->wait_queue);
     QLIST_INSERT_HEAD(&s->tasks, task, list);
@@ -267,28 +293,28 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
         .len = bdrv_dirty_bitmap_size(copy_bitmap),
         .write_flags = write_flags,
         .mem = shres_create(BLOCK_COPY_MAX_MEM),
+        .max_transfer = QEMU_ALIGN_DOWN(
+                                    block_copy_max_transfer(source, target),
+                                    cluster_size),
     };
 
-    if (block_copy_max_transfer(source, target) < cluster_size) {
+    if (s->max_transfer < cluster_size) {
         /*
          * copy_range does not respect max_transfer. We don't want to bother
          * with requests smaller than block-copy cluster size, so fallback to
          * buffered copying (read and write respect max_transfer on their
          * behalf).
          */
-        s->use_copy_range = false;
-        s->copy_size = cluster_size;
+        s->method = COPY_READ_WRITE_CLUSTER;
     } else if (write_flags & BDRV_REQ_WRITE_COMPRESSED) {
         /* Compression supports only cluster-size writes and no copy-range. */
-        s->use_copy_range = false;
-        s->copy_size = cluster_size;
+        s->method = COPY_READ_WRITE_CLUSTER;
     } else {
         /*
-         * We enable copy-range, but keep small copy_size, until first
+         * If copy range enabled, start with COPY_RANGE_SMALL, until first
          * successful copy_range (look at block_copy_do_copy).
          */
-        s->use_copy_range = use_copy_range;
-        s->copy_size = MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER);
+        s->method = use_copy_range ? COPY_RANGE_SMALL : COPY_READ_WRITE;
     }
 
     ratelimit_init(&s->rate_limit);
@@ -343,17 +369,14 @@ static coroutine_fn int block_copy_task_run(AioTaskPool *pool,
  *
  * No sync here: nor bitmap neighter intersecting requests handling, only copy.
  *
- * @copy_range is an in-out argument: if *copy_range is false, copy_range is not
- * done. If *copy_range is true, copy_range is attempted. If the copy_range
- * attempt fails, the function falls back to the usual read+write and
- * *copy_range is set to false. *copy_range and zeroes must not be true
- * simultaneously.
- *
+ * @method is an in-out argument, so that copy_range can be either extended to
+ * a full-size buffer or disabled if the copy_range attempt fails.  The output
+ * value of @method should be used for subsequent tasks.
  * Returns 0 on success.
  */
 static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
                                            int64_t offset, int64_t bytes,
-                                           bool zeroes, bool *copy_range,
+                                           BlockCopyMethod *method,
                                            bool *error_is_read)
 {
     int ret;
@@ -367,9 +390,9 @@ static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
     assert(offset + bytes <= s->len ||
            offset + bytes == QEMU_ALIGN_UP(s->len, s->cluster_size));
     assert(nbytes < INT_MAX);
-    assert(!(*copy_range && zeroes));
 
-    if (zeroes) {
+    switch (*method) {
+    case COPY_WRITE_ZEROES:
         ret = bdrv_co_pwrite_zeroes(s->target, offset, nbytes, s->write_flags &
                                     ~BDRV_REQ_WRITE_COMPRESSED);
         if (ret < 0) {
@@ -377,76 +400,59 @@ static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
             *error_is_read = false;
         }
         return ret;
-    }
 
-    if (*copy_range) {
+    case COPY_RANGE_SMALL:
+    case COPY_RANGE_FULL:
         ret = bdrv_co_copy_range(s->source, offset, s->target, offset, nbytes,
                                  0, s->write_flags);
-        if (ret < 0) {
-            trace_block_copy_copy_range_fail(s, offset, ret);
-            *copy_range = false;
-            /* Fallback to read+write with allocated buffer */
-        } else {
+        if (ret >= 0) {
+            /* Successful copy-range, increase chunk size.  */
+            *method = COPY_RANGE_FULL;
             return 0;
         }
-    }
 
-    /*
-     * In case of failed copy_range request above, we may proceed with buffered
-     * request larger than BLOCK_COPY_MAX_BUFFER. Still, further requests will
-     * be properly limited, so don't care too much. Moreover the most likely
-     * case (copy_range is unsupported for the configuration, so the very first
-     * copy_range request fails) is handled by setting large copy_size only
-     * after first successful copy_range.
-     */
+        trace_block_copy_copy_range_fail(s, offset, ret);
+        *method = COPY_READ_WRITE;
+        /* Fall through to read+write with allocated buffer */
 
-    bounce_buffer = qemu_blockalign(s->source->bs, nbytes);
+    case COPY_READ_WRITE_CLUSTER:
+    case COPY_READ_WRITE:
+        /*
+         * In case of failed copy_range request above, we may proceed with
+         * buffered request larger than BLOCK_COPY_MAX_BUFFER.
+         * Still, further requests will be properly limited, so don't care too
+         * much. Moreover the most likely case (copy_range is unsupported for
+         * the configuration, so the very first copy_range request fails)
+         * is handled by setting large copy_size only after first successful
+         * copy_range.
+         */
 
-    ret = bdrv_co_pread(s->source, offset, nbytes, bounce_buffer, 0);
-    if (ret < 0) {
-        trace_block_copy_read_fail(s, offset, ret);
-        *error_is_read = true;
-        goto out;
-    }
+        bounce_buffer = qemu_blockalign(s->source->bs, nbytes);
 
-    ret = bdrv_co_pwrite(s->target, offset, nbytes, bounce_buffer,
-                         s->write_flags);
-    if (ret < 0) {
-        trace_block_copy_write_fail(s, offset, ret);
-        *error_is_read = false;
-        goto out;
-    }
+        ret = bdrv_co_pread(s->source, offset, nbytes, bounce_buffer, 0);
+        if (ret < 0) {
+            trace_block_copy_read_fail(s, offset, ret);
+            *error_is_read = true;
+            goto out;
+        }
 
-out:
-    qemu_vfree(bounce_buffer);
+        ret = bdrv_co_pwrite(s->target, offset, nbytes, bounce_buffer,
+                             s->write_flags);
+        if (ret < 0) {
+            trace_block_copy_write_fail(s, offset, ret);
+            *error_is_read = false;
+            goto out;
+        }
 
-    return ret;
-}
+    out:
+        qemu_vfree(bounce_buffer);
+        break;
 
-static void block_copy_handle_copy_range_result(BlockCopyState *s,
-                                                bool is_success)
-{
-    if (!s->use_copy_range) {
-        /* already disabled */
-        return;
+    default:
+        abort();
     }
 
-    if (is_success) {
-        /*
-         * Successful copy-range. Now increase copy_size.  copy_range
-         * does not respect max_transfer (it's a TODO), so we factor
-         * that in here.
-         */
-        s->copy_size =
-                MIN(MAX(s->cluster_size, BLOCK_COPY_MAX_COPY_RANGE),
-                    QEMU_ALIGN_DOWN(block_copy_max_transfer(s->source,
-                                                            s->target),
-                                    s->cluster_size));
-    } else {
-        /* Copy-range failed, disable it. */
-        s->use_copy_range = false;
-        s->copy_size = MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER);
-    }
+    return ret;
 }
 
 static coroutine_fn int block_copy_task_entry(AioTask *task)
@@ -454,13 +460,12 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
     BlockCopyTask *t = container_of(task, BlockCopyTask, task);
     BlockCopyState *s = t->s;
     bool error_is_read = false;
-    bool copy_range = t->copy_range;
+    BlockCopyMethod method = t->method;
     int ret;
 
-    ret = block_copy_do_copy(s, t->offset, t->bytes, t->zeroes,
-                             &copy_range, &error_is_read);
-    if (t->copy_range) {
-        block_copy_handle_copy_range_result(s, copy_range);
+    ret = block_copy_do_copy(s, t->offset, t->bytes, &method, &error_is_read);
+    if (s->method == t->method) {
+        s->method = method;
     }
     if (ret < 0) {
         if (!t->call_state->ret) {
@@ -643,8 +648,7 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
             continue;
         }
         if (ret & BDRV_BLOCK_ZERO) {
-            task->zeroes = true;
-            task->copy_range = false;
+            task->method = COPY_WRITE_ZEROES;
         }
 
         if (!call_state->ignore_ratelimit) {
-- 
2.29.2


