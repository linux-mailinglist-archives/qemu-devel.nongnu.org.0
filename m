Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F6B17B791
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Mar 2020 08:40:11 +0100 (CET)
Received: from localhost ([::1]:60476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jA7ac-00076F-6R
	for lists+qemu-devel@lfdr.de; Fri, 06 Mar 2020 02:40:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46279)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1jA7ZH-00053d-Ie
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 02:38:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1jA7ZG-0008KP-2F
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 02:38:47 -0500
Received: from relay.sw.ru ([185.231.240.75]:37958)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1jA7ZC-0007wk-KR; Fri, 06 Mar 2020 02:38:42 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1jA7Z8-0002Qu-86; Fri, 06 Mar 2020 10:38:38 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 3/9] block/block-copy: specialcase first copy_range request
Date: Fri,  6 Mar 2020 10:38:25 +0300
Message-Id: <20200306073831.7737-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200306073831.7737-1-vsementsov@virtuozzo.com>
References: <20200306073831.7737-1-vsementsov@virtuozzo.com>
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
 mreitz@redhat.com, andrey.shinkevich@virtuozzo.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In block_copy_do_copy we fallback to read+write if copy_range failed.
In this case copy_size is larger than defined for buffered IO, and
there is corresponding commit. Still, backup copies data cluster by
cluster, and most of requests are limited to one cluster anyway, so the
only source of this one bad-limited request is copy-before-write
operation.

Further patch will move backup to use block_copy directly, than for
cases where copy_range is not supported, first request will be
oversized in each backup. It's not good, let's change it now.

Fix is simple: just limit first copy_range request like buffer-based
request. If it succeed, set larger copy_range limit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 block/block-copy.c | 41 +++++++++++++++++++++++++++++++----------
 1 file changed, 31 insertions(+), 10 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index e2d7b3b887..ddd61c1652 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -70,16 +70,19 @@ void block_copy_state_free(BlockCopyState *s)
     g_free(s);
 }
 
+static uint32_t block_copy_max_transfer(BdrvChild *source, BdrvChild *target)
+{
+    return MIN_NON_ZERO(INT_MAX,
+                        MIN_NON_ZERO(source->bs->bl.max_transfer,
+                                     target->bs->bl.max_transfer));
+}
+
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
                                      int64_t cluster_size,
                                      BdrvRequestFlags write_flags, Error **errp)
 {
     BlockCopyState *s;
     BdrvDirtyBitmap *copy_bitmap;
-    uint32_t max_transfer =
-            MIN_NON_ZERO(INT_MAX,
-                         MIN_NON_ZERO(source->bs->bl.max_transfer,
-                                      target->bs->bl.max_transfer));
 
     copy_bitmap = bdrv_create_dirty_bitmap(source->bs, cluster_size, NULL,
                                            errp);
@@ -99,7 +102,7 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
         .mem = shres_create(BLOCK_COPY_MAX_MEM),
     };
 
-    if (max_transfer < cluster_size) {
+    if (block_copy_max_transfer(source, target) < cluster_size) {
         /*
          * copy_range does not respect max_transfer. We don't want to bother
          * with requests smaller than block-copy cluster size, so fallback to
@@ -114,12 +117,11 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
         s->copy_size = cluster_size;
     } else {
         /*
-         * copy_range does not respect max_transfer (it's a TODO), so we factor
-         * that in here.
+         * We enable copy-range, but keep small copy_size, until first
+         * successful copy_range (look at block_copy_do_copy).
          */
         s->use_copy_range = true;
-        s->copy_size = MIN(MAX(cluster_size, BLOCK_COPY_MAX_COPY_RANGE),
-                           QEMU_ALIGN_DOWN(max_transfer, cluster_size));
+        s->copy_size = MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER);
     }
 
     QLIST_INIT(&s->inflight_reqs);
@@ -172,6 +174,22 @@ static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
             s->copy_size = MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER);
             /* Fallback to read+write with allocated buffer */
         } else {
+            if (s->use_copy_range) {
+                /*
+                 * Successful copy-range. Now increase copy_size.  copy_range
+                 * does not respect max_transfer (it's a TODO), so we factor
+                 * that in here.
+                 *
+                 * Note: we double-check s->use_copy_range for the case when
+                 * parallel block-copy request unsets it during previous
+                 * bdrv_co_copy_range call.
+                 */
+                s->copy_size =
+                        MIN(MAX(s->cluster_size, BLOCK_COPY_MAX_COPY_RANGE),
+                            QEMU_ALIGN_DOWN(block_copy_max_transfer(s->source,
+                                                                    s->target),
+                                            s->cluster_size));
+            }
             goto out;
         }
     }
@@ -179,7 +197,10 @@ static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
     /*
      * In case of failed copy_range request above, we may proceed with buffered
      * request larger than BLOCK_COPY_MAX_BUFFER. Still, further requests will
-     * be properly limited, so don't care too much.
+     * be properly limited, so don't care too much. Moreover the most likely
+     * case (copy_range is unsupported for the configuration, so the very first
+     * copy_range request fails) is handled by setting large copy_size only
+     * after first successful copy_range.
      */
 
     bounce_buffer = qemu_blockalign(s->source->bs, nbytes);
-- 
2.21.0


