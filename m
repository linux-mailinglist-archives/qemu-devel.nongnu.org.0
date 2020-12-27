Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D462E31F3
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Dec 2020 17:56:52 +0100 (CET)
Received: from localhost ([::1]:49638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktZLf-00046Y-Uh
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 11:56:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1ktZIt-0002VW-3M
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 11:53:59 -0500
Received: from kerio.kamp.de ([195.62.97.192]:34018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1ktZIq-0007ZP-Kd
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 11:53:58 -0500
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 17:42:42 +0100
Received: (qmail 22368 invoked from network); 27 Dec 2020 16:42:44 -0000
Received: from lieven-pc.kamp-intra.net (HELO lieven-pc)
 (relay@kamp.de@::ffff:172.21.12.60)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPA;
 27 Dec 2020 16:42:44 -0000
Received: by lieven-pc (Postfix, from userid 1060)
 id 5536513D855; Sun, 27 Dec 2020 17:42:44 +0100 (CET)
From: Peter Lieven <pl@kamp.de>
To: qemu-block@nongnu.org
Subject: [PATCH 1/7] block/rbd: bump librbd requirement to luminous release
Date: Sun, 27 Dec 2020 17:42:30 +0100
Message-Id: <20201227164236.10143-2-pl@kamp.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201227164236.10143-1-pl@kamp.de>
References: <20201227164236.10143-1-pl@kamp.de>
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org,
 ct@flyingcircus.io, mreitz@redhat.com, dillaman@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

even luminous (version 12.2) is unmaintained for over 3 years now.
Bump the requirement to get rid of the ifdef'ry in the code.

Signed-off-by: Peter Lieven <pl@kamp.de>
---
 block/rbd.c | 120 ++++------------------------------------------------
 configure   |   7 +--
 2 files changed, 12 insertions(+), 115 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index 9bd2bce716..650e27c351 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -55,24 +55,10 @@
  * leading "\".
  */
 
-/* rbd_aio_discard added in 0.1.2 */
-#if LIBRBD_VERSION_CODE >= LIBRBD_VERSION(0, 1, 2)
-#define LIBRBD_SUPPORTS_DISCARD
-#else
-#undef LIBRBD_SUPPORTS_DISCARD
-#endif
-
 #define OBJ_MAX_SIZE (1UL << OBJ_DEFAULT_OBJ_ORDER)
 
 #define RBD_MAX_SNAPS 100
 
-/* The LIBRBD_SUPPORTS_IOVEC is defined in librbd.h */
-#ifdef LIBRBD_SUPPORTS_IOVEC
-#define LIBRBD_USE_IOVEC 1
-#else
-#define LIBRBD_USE_IOVEC 0
-#endif
-
 typedef enum {
     RBD_AIO_READ,
     RBD_AIO_WRITE,
@@ -84,7 +70,6 @@ typedef struct RBDAIOCB {
     BlockAIOCB common;
     int64_t ret;
     QEMUIOVector *qiov;
-    char *bounce;
     RBDAIOCmd cmd;
     int error;
     struct BDRVRBDState *s;
@@ -94,7 +79,6 @@ typedef struct RADOSCB {
     RBDAIOCB *acb;
     struct BDRVRBDState *s;
     int64_t size;
-    char *buf;
     int64_t ret;
 } RADOSCB;
 
@@ -332,13 +316,9 @@ static int qemu_rbd_set_keypairs(rados_t cluster, const char *keypairs_json,
 
 static void qemu_rbd_memset(RADOSCB *rcb, int64_t offs)
 {
-    if (LIBRBD_USE_IOVEC) {
-        RBDAIOCB *acb = rcb->acb;
-        iov_memset(acb->qiov->iov, acb->qiov->niov, offs, 0,
-                   acb->qiov->size - offs);
-    } else {
-        memset(rcb->buf + offs, 0, rcb->size - offs);
-    }
+    RBDAIOCB *acb = rcb->acb;
+    iov_memset(acb->qiov->iov, acb->qiov->niov, offs, 0,
+               acb->qiov->size - offs);
 }
 
 /* FIXME Deprecate and remove keypairs or make it available in QMP. */
@@ -493,13 +473,6 @@ static void qemu_rbd_complete_aio(RADOSCB *rcb)
 
     g_free(rcb);
 
-    if (!LIBRBD_USE_IOVEC) {
-        if (acb->cmd == RBD_AIO_READ) {
-            qemu_iovec_from_buf(acb->qiov, 0, acb->bounce, acb->qiov->size);
-        }
-        qemu_vfree(acb->bounce);
-    }
-
     acb->common.cb(acb->common.opaque, (acb->ret > 0 ? 0 : acb->ret));
 
     qemu_aio_unref(acb);
@@ -866,28 +839,6 @@ static void rbd_finish_aiocb(rbd_completion_t c, RADOSCB *rcb)
                                      rbd_finish_bh, rcb);
 }
 
-static int rbd_aio_discard_wrapper(rbd_image_t image,
-                                   uint64_t off,
-                                   uint64_t len,
-                                   rbd_completion_t comp)
-{
-#ifdef LIBRBD_SUPPORTS_DISCARD
-    return rbd_aio_discard(image, off, len, comp);
-#else
-    return -ENOTSUP;
-#endif
-}
-
-static int rbd_aio_flush_wrapper(rbd_image_t image,
-                                 rbd_completion_t comp)
-{
-#ifdef LIBRBD_SUPPORTS_AIO_FLUSH
-    return rbd_aio_flush(image, comp);
-#else
-    return -ENOTSUP;
-#endif
-}
-
 static BlockAIOCB *rbd_start_aio(BlockDriverState *bs,
                                  int64_t off,
                                  QEMUIOVector *qiov,
@@ -910,21 +861,6 @@ static BlockAIOCB *rbd_start_aio(BlockDriverState *bs,
 
     rcb = g_new(RADOSCB, 1);
 
-    if (!LIBRBD_USE_IOVEC) {
-        if (cmd == RBD_AIO_DISCARD || cmd == RBD_AIO_FLUSH) {
-            acb->bounce = NULL;
-        } else {
-            acb->bounce = qemu_try_blockalign(bs, qiov->size);
-            if (acb->bounce == NULL) {
-                goto failed;
-            }
-        }
-        if (cmd == RBD_AIO_WRITE) {
-            qemu_iovec_to_buf(acb->qiov, 0, acb->bounce, qiov->size);
-        }
-        rcb->buf = acb->bounce;
-    }
-
     acb->ret = 0;
     acb->error = 0;
     acb->s = s;
@@ -938,7 +874,7 @@ static BlockAIOCB *rbd_start_aio(BlockDriverState *bs,
     }
 
     switch (cmd) {
-    case RBD_AIO_WRITE: {
+    case RBD_AIO_WRITE:
         /*
          * RBD APIs don't allow us to write more than actual size, so in order
          * to support growing images, we resize the image before write
@@ -950,25 +886,16 @@ static BlockAIOCB *rbd_start_aio(BlockDriverState *bs,
                 goto failed_completion;
             }
         }
-#ifdef LIBRBD_SUPPORTS_IOVEC
-            r = rbd_aio_writev(s->image, qiov->iov, qiov->niov, off, c);
-#else
-            r = rbd_aio_write(s->image, off, size, rcb->buf, c);
-#endif
+        r = rbd_aio_writev(s->image, qiov->iov, qiov->niov, off, c);
         break;
-    }
     case RBD_AIO_READ:
-#ifdef LIBRBD_SUPPORTS_IOVEC
-            r = rbd_aio_readv(s->image, qiov->iov, qiov->niov, off, c);
-#else
-            r = rbd_aio_read(s->image, off, size, rcb->buf, c);
-#endif
+        r = rbd_aio_readv(s->image, qiov->iov, qiov->niov, off, c);
         break;
     case RBD_AIO_DISCARD:
-        r = rbd_aio_discard_wrapper(s->image, off, size, c);
+        r = rbd_aio_discard(s->image, off, size, c);
         break;
     case RBD_AIO_FLUSH:
-        r = rbd_aio_flush_wrapper(s->image, c);
+        r = rbd_aio_flush(s->image, c);
         break;
     default:
         r = -EINVAL;
@@ -983,9 +910,6 @@ failed_completion:
     rbd_aio_release(c);
 failed:
     g_free(rcb);
-    if (!LIBRBD_USE_IOVEC) {
-        qemu_vfree(acb->bounce);
-    }
 
     qemu_aio_unref(acb);
     return NULL;
@@ -1011,7 +935,6 @@ static BlockAIOCB *qemu_rbd_aio_pwritev(BlockDriverState *bs,
                          RBD_AIO_WRITE);
 }
 
-#ifdef LIBRBD_SUPPORTS_AIO_FLUSH
 static BlockAIOCB *qemu_rbd_aio_flush(BlockDriverState *bs,
                                       BlockCompletionFunc *cb,
                                       void *opaque)
@@ -1019,20 +942,6 @@ static BlockAIOCB *qemu_rbd_aio_flush(BlockDriverState *bs,
     return rbd_start_aio(bs, 0, NULL, 0, cb, opaque, RBD_AIO_FLUSH);
 }
 
-#else
-
-static int qemu_rbd_co_flush(BlockDriverState *bs)
-{
-#if LIBRBD_VERSION_CODE >= LIBRBD_VERSION(0, 1, 1)
-    /* rbd_flush added in 0.1.1 */
-    BDRVRBDState *s = bs->opaque;
-    return rbd_flush(s->image);
-#else
-    return 0;
-#endif
-}
-#endif
-
 static int qemu_rbd_getinfo(BlockDriverState *bs, BlockDriverInfo *bdi)
 {
     BDRVRBDState *s = bs->opaque;
@@ -1198,7 +1107,6 @@ static int qemu_rbd_snap_list(BlockDriverState *bs,
     return snap_count;
 }
 
-#ifdef LIBRBD_SUPPORTS_DISCARD
 static BlockAIOCB *qemu_rbd_aio_pdiscard(BlockDriverState *bs,
                                          int64_t offset,
                                          int bytes,
@@ -1208,9 +1116,7 @@ static BlockAIOCB *qemu_rbd_aio_pdiscard(BlockDriverState *bs,
     return rbd_start_aio(bs, offset, NULL, bytes, cb, opaque,
                          RBD_AIO_DISCARD);
 }
-#endif
 
-#ifdef LIBRBD_SUPPORTS_INVALIDATE
 static void coroutine_fn qemu_rbd_co_invalidate_cache(BlockDriverState *bs,
                                                       Error **errp)
 {
@@ -1220,7 +1126,6 @@ static void coroutine_fn qemu_rbd_co_invalidate_cache(BlockDriverState *bs,
         error_setg_errno(errp, -r, "Failed to invalidate the cache");
     }
 }
-#endif
 
 static QemuOptsList qemu_rbd_create_opts = {
     .name = "rbd-create-opts",
@@ -1278,23 +1183,14 @@ static BlockDriver bdrv_rbd = {
     .bdrv_aio_preadv        = qemu_rbd_aio_preadv,
     .bdrv_aio_pwritev       = qemu_rbd_aio_pwritev,
 
-#ifdef LIBRBD_SUPPORTS_AIO_FLUSH
     .bdrv_aio_flush         = qemu_rbd_aio_flush,
-#else
-    .bdrv_co_flush_to_disk  = qemu_rbd_co_flush,
-#endif
-
-#ifdef LIBRBD_SUPPORTS_DISCARD
     .bdrv_aio_pdiscard      = qemu_rbd_aio_pdiscard,
-#endif
 
     .bdrv_snapshot_create   = qemu_rbd_snap_create,
     .bdrv_snapshot_delete   = qemu_rbd_snap_remove,
     .bdrv_snapshot_list     = qemu_rbd_snap_list,
     .bdrv_snapshot_goto     = qemu_rbd_snap_rollback,
-#ifdef LIBRBD_SUPPORTS_INVALIDATE
     .bdrv_co_invalidate_cache = qemu_rbd_co_invalidate_cache,
-#endif
 
     .strong_runtime_opts    = qemu_rbd_strong_runtime_opts,
 };
diff --git a/configure b/configure
index c228f7c21e..e07f80cab4 100755
--- a/configure
+++ b/configure
@@ -3663,8 +3663,9 @@ if test "$rbd" != "no" ; then
 #include <stdio.h>
 #include <rbd/librbd.h>
 int main(void) {
-    rados_t cluster;
-    rados_create(&cluster, NULL);
+#if LIBRBD_VERSION_CODE < LIBRBD_VERSION(1, 12, 0)
+#error
+#endif
     return 0;
 }
 EOF
@@ -3673,7 +3674,7 @@ EOF
     rbd=yes
   else
     if test "$rbd" = "yes" ; then
-      feature_not_found "rados block device" "Install librbd/ceph devel"
+      feature_not_found "rados block device" "Install librbd/ceph devel (>= 12.0.0)"
     fi
     rbd=no
   fi
-- 
2.17.1



