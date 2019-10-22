Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B355E02C3
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 13:22:41 +0200 (CEST)
Received: from localhost ([::1]:53482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMsFM-0000yB-1Y
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 07:22:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44047)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iMsB4-0004BJ-RC
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 07:18:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iMsB3-0007hf-Ht
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 07:18:14 -0400
Received: from relay.sw.ru ([185.231.240.75]:51914)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iMsB0-0007dm-HG; Tue, 22 Oct 2019 07:18:10 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iMsAx-0003JX-07; Tue, 22 Oct 2019 14:18:07 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 6/6] block/block-copy: increase buffered copy request
Date: Tue, 22 Oct 2019 14:18:05 +0300
Message-Id: <20191022111805.3432-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191022111805.3432-1-vsementsov@virtuozzo.com>
References: <20191022111805.3432-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No reason to limit buffered copy to one cluster. Let's allow up to 1
MiB.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block-copy.h |  2 +-
 block/block-copy.c         | 48 +++++++++++++++++++++++++-------------
 2 files changed, 33 insertions(+), 17 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index edcdf0072d..0a161724d7 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -38,7 +38,7 @@ typedef struct BlockCopyState {
     BdrvDirtyBitmap *copy_bitmap;
     int64_t cluster_size;
     bool use_copy_range;
-    int64_t copy_range_size;
+    int64_t copy_size;
     uint64_t len;
     QLIST_HEAD(, BlockCopyInFlightReq) inflight_reqs;
 
diff --git a/block/block-copy.c b/block/block-copy.c
index 7f0ebb58f8..c39cc9cffe 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -21,6 +21,7 @@
 #include "qemu/units.h"
 
 #define BLOCK_COPY_MAX_COPY_RANGE (16 * MiB)
+#define BLOCK_COPY_MAX_BUFFER (1 * MiB)
 #define BLOCK_COPY_MAX_MEM (128 * MiB)
 
 static void coroutine_fn block_copy_wait_inflight_reqs(BlockCopyState *s,
@@ -75,10 +76,8 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
 {
     BlockCopyState *s;
     BdrvDirtyBitmap *copy_bitmap;
-
-    /* Ignore BLOCK_COPY_MAX_COPY_RANGE if requested cluster_size is larger */
     uint32_t max_transfer =
-            MIN_NON_ZERO(MAX(cluster_size, BLOCK_COPY_MAX_COPY_RANGE),
+            MIN_NON_ZERO(INT_MAX,
                          MIN_NON_ZERO(source->bs->bl.max_transfer,
                                       target->bs->bl.max_transfer));
 
@@ -100,17 +99,28 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
         .mem = shres_create(BLOCK_COPY_MAX_MEM),
     };
 
-    s->copy_range_size = QEMU_ALIGN_DOWN(max_transfer, cluster_size),
-    /*
-     * Set use_copy_range, consider the following:
-     * 1. Compression is not supported for copy_range.
-     * 2. copy_range does not respect max_transfer (it's a TODO), so we factor
-     *    that in here. If max_transfer is smaller than the job->cluster_size,
-     *    we do not use copy_range (in that case it's zero after aligning down
-     *    above).
-     */
-    s->use_copy_range =
-        !(write_flags & BDRV_REQ_WRITE_COMPRESSED) && s->copy_range_size > 0;
+    if (max_transfer < cluster_size) {
+        /*
+         * copy_range does not respect max_transfer. We don't want to bother
+         * with requests smaller than block-copy cluster size, so fallback to
+         * buffered copying (read and write respect max_transfer on their
+         * behalf).
+         */
+        s->use_copy_range = false;
+        s->copy_size = cluster_size;
+    } else if (write_flags & BDRV_REQ_WRITE_COMPRESSED) {
+        /* Compression is not supported for copy_range */
+        s->use_copy_range = false;
+        s->copy_size = MAX(cluster_size, BLOCK_COPY_MAX_BUFFER);
+    } else {
+        /*
+         * copy_range does not respect max_transfer (it's a TODO), so we factor
+         * that in here.
+         */
+        s->use_copy_range = true;
+        s->copy_size = MIN(MAX(cluster_size, BLOCK_COPY_MAX_COPY_RANGE),
+                           QEMU_ALIGN_DOWN(max_transfer, cluster_size));
+    }
 
     QLIST_INIT(&s->inflight_reqs);
 
@@ -156,12 +166,19 @@ static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
         if (ret < 0) {
             trace_block_copy_copy_range_fail(s, start, ret);
             s->use_copy_range = false;
+            s->copy_size = MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER);
             /* Fallback to read+write with allocated buffer */
         } else {
             goto out;
         }
     }
 
+    /*
+     * In case of failed copy_range request above, we may proceed with buffered
+     * request larger than BLOCK_COPY_MAX_BUFFER. Still, further requests will
+     * be properly limited, so don't care too much.
+     */
+
     bounce_buffer = qemu_blockalign(s->source->bs, nbytes);
 
     ret = bdrv_co_pread(s->source, start, nbytes, bounce_buffer, 0);
@@ -290,8 +307,7 @@ int coroutine_fn block_copy(BlockCopyState *s,
             continue; /* already copied */
         }
 
-        chunk_end = MIN(end, start + (s->use_copy_range ?
-                                      s->copy_range_size : s->cluster_size));
+        chunk_end = MIN(end, start + s->copy_size);
 
         next_zero = bdrv_dirty_bitmap_next_zero(s->copy_bitmap, start,
                                                 chunk_end - start);
-- 
2.21.0


