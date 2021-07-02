Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 127903B9DED
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 11:14:10 +0200 (CEST)
Received: from localhost ([::1]:60196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzFFR-0002WK-1B
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 05:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1lzFBO-0002u7-BY
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 05:09:58 -0400
Received: from kerio.kamp.de ([195.62.97.192]:54450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1lzFBK-0006Y2-Fp
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 05:09:58 -0400
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Fri, 2 Jul 2021 11:09:41 +0200
Received: (qmail 37493 invoked from network); 2 Jul 2021 09:09:43 -0000
Received: from lieven-pc.kamp-intra.net (HELO lieven-pc)
 (relay@kamp.de@::ffff:172.21.12.60)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPA;
 2 Jul 2021 09:09:43 -0000
Received: by lieven-pc (Postfix, from userid 1060)
 id B677F13DD23; Fri,  2 Jul 2021 11:09:43 +0200 (CEST)
From: Peter Lieven <pl@kamp.de>
To: qemu-block@nongnu.org
Subject: [PATCH V4 1/6] block/rbd: bump librbd requirement to luminous release
Date: Fri,  2 Jul 2021 11:09:30 +0200
Message-Id: <20210702090935.15300-2-pl@kamp.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210702090935.15300-1-pl@kamp.de>
References: <20210702090935.15300-1-pl@kamp.de>
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, idryomov@redhat.com, berrange@redhat.com,
 Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org, ct@flyingcircus.io,
 pbonzini@redhat.com, idryomov@gmail.com, mreitz@redhat.com,
 dillaman@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

even luminous (version 12.2) is unmaintained for over 3 years now.
Bump the requirement to get rid of the ifdef'ry in the code.
Qemu 6.1 dropped the support for RHEL-7 which was the last supported
OS that required an older librbd.

Signed-off-by: Peter Lieven <pl@kamp.de>
---
 block/rbd.c | 120 ++++------------------------------------------------
 meson.build |   7 ++-
 2 files changed, 13 insertions(+), 114 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index 26f64cce7c..6b1cbe1d75 100644
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
 
@@ -342,13 +326,9 @@ static int qemu_rbd_set_keypairs(rados_t cluster, const char *keypairs_json,
 
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
@@ -504,13 +484,6 @@ static void qemu_rbd_complete_aio(RADOSCB *rcb)
 
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
@@ -878,28 +851,6 @@ static void rbd_finish_aiocb(rbd_completion_t c, RADOSCB *rcb)
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
@@ -922,21 +873,6 @@ static BlockAIOCB *rbd_start_aio(BlockDriverState *bs,
 
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
@@ -950,7 +886,7 @@ static BlockAIOCB *rbd_start_aio(BlockDriverState *bs,
     }
 
     switch (cmd) {
-    case RBD_AIO_WRITE: {
+    case RBD_AIO_WRITE:
         /*
          * RBD APIs don't allow us to write more than actual size, so in order
          * to support growing images, we resize the image before write
@@ -962,25 +898,16 @@ static BlockAIOCB *rbd_start_aio(BlockDriverState *bs,
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
@@ -995,9 +922,6 @@ failed_completion:
     rbd_aio_release(c);
 failed:
     g_free(rcb);
-    if (!LIBRBD_USE_IOVEC) {
-        qemu_vfree(acb->bounce);
-    }
 
     qemu_aio_unref(acb);
     return NULL;
@@ -1023,7 +947,6 @@ static BlockAIOCB *qemu_rbd_aio_pwritev(BlockDriverState *bs,
                          RBD_AIO_WRITE);
 }
 
-#ifdef LIBRBD_SUPPORTS_AIO_FLUSH
 static BlockAIOCB *qemu_rbd_aio_flush(BlockDriverState *bs,
                                       BlockCompletionFunc *cb,
                                       void *opaque)
@@ -1031,20 +954,6 @@ static BlockAIOCB *qemu_rbd_aio_flush(BlockDriverState *bs,
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
@@ -1210,7 +1119,6 @@ static int qemu_rbd_snap_list(BlockDriverState *bs,
     return snap_count;
 }
 
-#ifdef LIBRBD_SUPPORTS_DISCARD
 static BlockAIOCB *qemu_rbd_aio_pdiscard(BlockDriverState *bs,
                                          int64_t offset,
                                          int bytes,
@@ -1220,9 +1128,7 @@ static BlockAIOCB *qemu_rbd_aio_pdiscard(BlockDriverState *bs,
     return rbd_start_aio(bs, offset, NULL, bytes, cb, opaque,
                          RBD_AIO_DISCARD);
 }
-#endif
 
-#ifdef LIBRBD_SUPPORTS_INVALIDATE
 static void coroutine_fn qemu_rbd_co_invalidate_cache(BlockDriverState *bs,
                                                       Error **errp)
 {
@@ -1232,7 +1138,6 @@ static void coroutine_fn qemu_rbd_co_invalidate_cache(BlockDriverState *bs,
         error_setg_errno(errp, -r, "Failed to invalidate the cache");
     }
 }
-#endif
 
 static QemuOptsList qemu_rbd_create_opts = {
     .name = "rbd-create-opts",
@@ -1290,23 +1195,14 @@ static BlockDriver bdrv_rbd = {
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
diff --git a/meson.build b/meson.build
index db6789af9c..eb150c70f7 100644
--- a/meson.build
+++ b/meson.build
@@ -706,13 +706,16 @@ if not get_option('rbd').auto() or have_block
       int main(void) {
         rados_t cluster;
         rados_create(&cluster, NULL);
+        #if LIBRBD_VERSION_CODE < LIBRBD_VERSION(1, 12, 0)
+        #error
+        #endif
         return 0;
       }''', dependencies: [librbd, librados])
       rbd = declare_dependency(dependencies: [librbd, librados])
     elif get_option('rbd').enabled()
-      error('could not link librados')
+      error('librbd >= 1.12.0 required')
     else
-      warning('could not link librados, disabling')
+      warning('librbd >= 1.12.0 not found, disabling rbd support')
     endif
   endif
 endif
-- 
2.17.1



