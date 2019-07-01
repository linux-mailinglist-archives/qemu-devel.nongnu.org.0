Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D12CC4A73A
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 18:42:24 +0200 (CEST)
Received: from localhost ([::1]:59734 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdHBf-0002Wp-5C
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 12:42:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34201)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hdGFe-0007QF-5m
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 11:42:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hdGFX-0005rU-5M
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 11:42:22 -0400
Received: from relay.sw.ru ([185.231.240.75]:38512)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1hdGFT-0005VY-BY; Tue, 18 Jun 2019 11:42:17 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1hdGFH-0002Sc-Jm; Tue, 18 Jun 2019 18:42:03 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Tue, 18 Jun 2019 18:42:00 +0300
Message-Id: <20190618154202.89107-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190618154202.89107-1-vsementsov@virtuozzo.com>
References: <20190618154202.89107-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v2 1/3] block: implement BDRV_REQ_PREFETCH
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
Cc: kwolf@redhat.com, fam@euphon.net, vsementsov@virtuozzo.com,
 mreitz@redhat.com, stefanha@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do effective copy-on-read request when we don't need data actually. It
will be used for block-stream and NBD_CMD_CACHE.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block.h |  8 +++++++-
 block/io.c            | 18 ++++++++++++------
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index f9415ed740..a063ee135b 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -88,8 +88,14 @@ typedef enum {
      * fallback. */
     BDRV_REQ_NO_FALLBACK        = 0x100,
 
+    /*
+     * BDRV_REQ_PREFETCH may be used only together with BDRV_REQ_COPY_ON_READ
+     * on read request and means that caller don't really need data to be
+     * written to qiov parameter which may be NULL.
+     */
+    BDRV_REQ_PREFETCH  = 0x200,
     /* Mask of valid flags */
-    BDRV_REQ_MASK               = 0x1ff,
+    BDRV_REQ_MASK               = 0x3ff,
 } BdrvRequestFlags;
 
 typedef struct BlockSizes {
diff --git a/block/io.c b/block/io.c
index 9ba1bada36..a232243de3 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1104,7 +1104,8 @@ bdrv_driver_pwritev_compressed(BlockDriverState *bs, uint64_t offset,
 }
 
 static int coroutine_fn bdrv_co_do_copy_on_readv(BdrvChild *child,
-        int64_t offset, unsigned int bytes, QEMUIOVector *qiov)
+        int64_t offset, unsigned int bytes, QEMUIOVector *qiov,
+        int flags)
 {
     BlockDriverState *bs = child->bs;
 
@@ -1215,9 +1216,11 @@ static int coroutine_fn bdrv_co_do_copy_on_readv(BdrvChild *child,
                 goto err;
             }
 
-            qemu_iovec_from_buf(qiov, progress, bounce_buffer + skip_bytes,
-                                pnum - skip_bytes);
-        } else {
+            if (!(flags & BDRV_REQ_PREFETCH)) {
+                qemu_iovec_from_buf(qiov, progress, bounce_buffer + skip_bytes,
+                                    pnum - skip_bytes);
+            }
+        } else if (!(flags & BDRV_REQ_PREFETCH)) {
             /* Read directly into the destination */
             qemu_iovec_init(&local_qiov, qiov->niov);
             qemu_iovec_concat(&local_qiov, qiov, progress, pnum - skip_bytes);
@@ -1268,7 +1271,8 @@ static int coroutine_fn bdrv_aligned_preadv(BdrvChild *child,
      * potential fallback support, if we ever implement any read flags
      * to pass through to drivers.  For now, there aren't any
      * passthrough flags.  */
-    assert(!(flags & ~(BDRV_REQ_NO_SERIALISING | BDRV_REQ_COPY_ON_READ)));
+    assert(!(flags & ~(BDRV_REQ_NO_SERIALISING | BDRV_REQ_COPY_ON_READ |
+                       BDRV_REQ_PREFETCH)));
 
     /* Handle Copy on Read and associated serialisation */
     if (flags & BDRV_REQ_COPY_ON_READ) {
@@ -1296,7 +1300,9 @@ static int coroutine_fn bdrv_aligned_preadv(BdrvChild *child,
         }
 
         if (!ret || pnum != bytes) {
-            ret = bdrv_co_do_copy_on_readv(child, offset, bytes, qiov);
+            ret = bdrv_co_do_copy_on_readv(child, offset, bytes, qiov, flags);
+            goto out;
+        } else if (flags & BDRV_REQ_PREFETCH) {
             goto out;
         }
     }
-- 
2.18.0


