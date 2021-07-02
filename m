Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5453E3B9DE9
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 11:11:47 +0200 (CEST)
Received: from localhost ([::1]:52678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzFD8-0005h4-72
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 05:11:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1lzFBP-0002w7-9Y
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 05:09:59 -0400
Received: from kerio.kamp.de ([195.62.97.192]:54451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1lzFBK-0006Y4-Fp
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 05:09:59 -0400
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Fri, 2 Jul 2021 11:09:42 +0200
Received: (qmail 37499 invoked from network); 2 Jul 2021 09:09:43 -0000
Received: from lieven-pc.kamp-intra.net (HELO lieven-pc)
 (relay@kamp.de@::ffff:172.21.12.60)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES256-GCM-SHA384 encrypted) ESMTPA;
 2 Jul 2021 09:09:43 -0000
Received: by lieven-pc (Postfix, from userid 1060)
 id C127813DD28; Fri,  2 Jul 2021 11:09:43 +0200 (CEST)
From: Peter Lieven <pl@kamp.de>
To: qemu-block@nongnu.org
Subject: [PATCH V4 4/6] block/rbd: migrate from aio to coroutines
Date: Fri,  2 Jul 2021 11:09:33 +0200
Message-Id: <20210702090935.15300-5-pl@kamp.de>
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

Signed-off-by: Peter Lieven <pl@kamp.de>
---
 block/rbd.c | 252 +++++++++++++++++++---------------------------------
 1 file changed, 90 insertions(+), 162 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index 1f8dc84079..be0471944a 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -66,22 +66,6 @@ typedef enum {
     RBD_AIO_FLUSH
 } RBDAIOCmd;
 
-typedef struct RBDAIOCB {
-    BlockAIOCB common;
-    int64_t ret;
-    QEMUIOVector *qiov;
-    RBDAIOCmd cmd;
-    int error;
-    struct BDRVRBDState *s;
-} RBDAIOCB;
-
-typedef struct RADOSCB {
-    RBDAIOCB *acb;
-    struct BDRVRBDState *s;
-    int64_t size;
-    int64_t ret;
-} RADOSCB;
-
 typedef struct BDRVRBDState {
     rados_t cluster;
     rados_ioctx_t io_ctx;
@@ -93,6 +77,13 @@ typedef struct BDRVRBDState {
     uint64_t object_size;
 } BDRVRBDState;
 
+typedef struct RBDTask {
+    BlockDriverState *bs;
+    Coroutine *co;
+    bool complete;
+    int64_t ret;
+} RBDTask;
+
 static int qemu_rbd_connect(rados_t *cluster, rados_ioctx_t *io_ctx,
                             BlockdevOptionsRbd *opts, bool cache,
                             const char *keypairs, const char *secretid,
@@ -325,13 +316,6 @@ static int qemu_rbd_set_keypairs(rados_t cluster, const char *keypairs_json,
     return ret;
 }
 
-static void qemu_rbd_memset(RADOSCB *rcb, int64_t offs)
-{
-    RBDAIOCB *acb = rcb->acb;
-    iov_memset(acb->qiov->iov, acb->qiov->niov, offs, 0,
-               acb->qiov->size - offs);
-}
-
 /* FIXME Deprecate and remove keypairs or make it available in QMP. */
 static int qemu_rbd_do_create(BlockdevCreateOptions *options,
                               const char *keypairs, const char *password_secret,
@@ -450,46 +434,6 @@ exit:
     return ret;
 }
 
-/*
- * This aio completion is being called from rbd_finish_bh() and runs in qemu
- * BH context.
- */
-static void qemu_rbd_complete_aio(RADOSCB *rcb)
-{
-    RBDAIOCB *acb = rcb->acb;
-    int64_t r;
-
-    r = rcb->ret;
-
-    if (acb->cmd != RBD_AIO_READ) {
-        if (r < 0) {
-            acb->ret = r;
-            acb->error = 1;
-        } else if (!acb->error) {
-            acb->ret = rcb->size;
-        }
-    } else {
-        if (r < 0) {
-            qemu_rbd_memset(rcb, 0);
-            acb->ret = r;
-            acb->error = 1;
-        } else if (r < rcb->size) {
-            qemu_rbd_memset(rcb, r);
-            if (!acb->error) {
-                acb->ret = rcb->size;
-            }
-        } else if (!acb->error) {
-            acb->ret = r;
-        }
-    }
-
-    g_free(rcb);
-
-    acb->common.cb(acb->common.opaque, (acb->ret > 0 ? 0 : acb->ret));
-
-    qemu_aio_unref(acb);
-}
-
 static char *qemu_rbd_mon_host(BlockdevOptionsRbd *opts, Error **errp)
 {
     const char **vals;
@@ -826,89 +770,59 @@ static int qemu_rbd_resize(BlockDriverState *bs, uint64_t size)
     return 0;
 }
 
-static const AIOCBInfo rbd_aiocb_info = {
-    .aiocb_size = sizeof(RBDAIOCB),
-};
-
-static void rbd_finish_bh(void *opaque)
+static void qemu_rbd_finish_bh(void *opaque)
 {
-    RADOSCB *rcb = opaque;
-    qemu_rbd_complete_aio(rcb);
+    RBDTask *task = opaque;
+    task->complete = 1;
+    aio_co_wake(task->co);
 }
 
 /*
- * This is the callback function for rbd_aio_read and _write
+ * This is the completion callback function for all rbd aio calls
+ * started from qemu_rbd_start_co().
  *
  * Note: this function is being called from a non qemu thread so
  * we need to be careful about what we do here. Generally we only
  * schedule a BH, and do the rest of the io completion handling
- * from rbd_finish_bh() which runs in a qemu context.
+ * from qemu_rbd_finish_bh() which runs in a qemu context.
  */
-static void rbd_finish_aiocb(rbd_completion_t c, RADOSCB *rcb)
+static void qemu_rbd_completion_cb(rbd_completion_t c, RBDTask *task)
 {
-    RBDAIOCB *acb = rcb->acb;
-
-    rcb->ret = rbd_aio_get_return_value(c);
+    task->ret = rbd_aio_get_return_value(c);
     rbd_aio_release(c);
-
-    replay_bh_schedule_oneshot_event(bdrv_get_aio_context(acb->common.bs),
-                                     rbd_finish_bh, rcb);
+    aio_bh_schedule_oneshot(bdrv_get_aio_context(task->bs),
+                            qemu_rbd_finish_bh, task);
 }
 
-static BlockAIOCB *rbd_start_aio(BlockDriverState *bs,
-                                 int64_t off,
-                                 QEMUIOVector *qiov,
-                                 int64_t size,
-                                 BlockCompletionFunc *cb,
-                                 void *opaque,
-                                 RBDAIOCmd cmd)
+static int coroutine_fn qemu_rbd_start_co(BlockDriverState *bs,
+                                          uint64_t offset,
+                                          uint64_t bytes,
+                                          QEMUIOVector *qiov,
+                                          int flags,
+                                          RBDAIOCmd cmd)
 {
-    RBDAIOCB *acb;
-    RADOSCB *rcb = NULL;
+    BDRVRBDState *s = bs->opaque;
+    RBDTask task = { .bs = bs, .co = qemu_coroutine_self() };
     rbd_completion_t c;
     int r;
 
-    BDRVRBDState *s = bs->opaque;
-
-    acb = qemu_aio_get(&rbd_aiocb_info, bs, cb, opaque);
-    acb->cmd = cmd;
-    acb->qiov = qiov;
-    assert(!qiov || qiov->size == size);
+    assert(!qiov || qiov->size == bytes);
 
-    rcb = g_new(RADOSCB, 1);
-
-    acb->ret = 0;
-    acb->error = 0;
-    acb->s = s;
-
-    rcb->acb = acb;
-    rcb->s = acb->s;
-    rcb->size = size;
-    r = rbd_aio_create_completion(rcb, (rbd_callback_t) rbd_finish_aiocb, &c);
+    r = rbd_aio_create_completion(&task,
+                                  (rbd_callback_t) qemu_rbd_completion_cb, &c);
     if (r < 0) {
-        goto failed;
+        return r;
     }
 
     switch (cmd) {
-    case RBD_AIO_WRITE:
-        /*
-         * RBD APIs don't allow us to write more than actual size, so in order
-         * to support growing images, we resize the image before write
-         * operations that exceed the current size.
-         */
-        if (off + size > s->image_size) {
-            r = qemu_rbd_resize(bs, off + size);
-            if (r < 0) {
-                goto failed_completion;
-            }
-        }
-        r = rbd_aio_writev(s->image, qiov->iov, qiov->niov, off, c);
-        break;
     case RBD_AIO_READ:
-        r = rbd_aio_readv(s->image, qiov->iov, qiov->niov, off, c);
+        r = rbd_aio_readv(s->image, qiov->iov, qiov->niov, offset, c);
+        break;
+    case RBD_AIO_WRITE:
+        r = rbd_aio_writev(s->image, qiov->iov, qiov->niov, offset, c);
         break;
     case RBD_AIO_DISCARD:
-        r = rbd_aio_discard(s->image, off, size, c);
+        r = rbd_aio_discard(s->image, offset, bytes, c);
         break;
     case RBD_AIO_FLUSH:
         r = rbd_aio_flush(s->image, c);
@@ -918,44 +832,69 @@ static BlockAIOCB *rbd_start_aio(BlockDriverState *bs,
     }
 
     if (r < 0) {
-        goto failed_completion;
+        error_report("rbd request failed early: cmd %d offset %" PRIu64
+                     " bytes %" PRIu64 " flags %d r %d (%s)", cmd, offset,
+                     bytes, flags, r, strerror(-r));
+        rbd_aio_release(c);
+        return r;
     }
-    return &acb->common;
 
-failed_completion:
-    rbd_aio_release(c);
-failed:
-    g_free(rcb);
+    while (!task.complete) {
+        qemu_coroutine_yield();
+    }
 
-    qemu_aio_unref(acb);
-    return NULL;
+    if (task.ret < 0) {
+        error_report("rbd request failed: cmd %d offset %" PRIu64 " bytes %"
+                     PRIu64 " flags %d task.ret %" PRIi64 " (%s)", cmd, offset,
+                     bytes, flags, task.ret, strerror(-task.ret));
+        return task.ret;
+    }
+
+    /* zero pad short reads */
+    if (cmd == RBD_AIO_READ && task.ret < qiov->size) {
+        qemu_iovec_memset(qiov, task.ret, 0, qiov->size - task.ret);
+    }
+
+    return 0;
+}
+
+static int
+coroutine_fn qemu_rbd_co_preadv(BlockDriverState *bs, uint64_t offset,
+                               uint64_t bytes, QEMUIOVector *qiov,
+                               int flags)
+{
+    return qemu_rbd_start_co(bs, offset, bytes, qiov, flags, RBD_AIO_READ);
 }
 
-static BlockAIOCB *qemu_rbd_aio_preadv(BlockDriverState *bs,
-                                       uint64_t offset, uint64_t bytes,
-                                       QEMUIOVector *qiov, int flags,
-                                       BlockCompletionFunc *cb,
-                                       void *opaque)
+static int
+coroutine_fn qemu_rbd_co_pwritev(BlockDriverState *bs, uint64_t offset,
+                                 uint64_t bytes, QEMUIOVector *qiov,
+                                 int flags)
 {
-    return rbd_start_aio(bs, offset, qiov, bytes, cb, opaque,
-                         RBD_AIO_READ);
+    BDRVRBDState *s = bs->opaque;
+    /*
+     * RBD APIs don't allow us to write more than actual size, so in order
+     * to support growing images, we resize the image before write
+     * operations that exceed the current size.
+     */
+    if (offset + bytes > s->image_size) {
+        int r = qemu_rbd_resize(bs, offset + bytes);
+        if (r < 0) {
+            return r;
+        }
+    }
+    return qemu_rbd_start_co(bs, offset, bytes, qiov, flags, RBD_AIO_WRITE);
 }
 
-static BlockAIOCB *qemu_rbd_aio_pwritev(BlockDriverState *bs,
-                                        uint64_t offset, uint64_t bytes,
-                                        QEMUIOVector *qiov, int flags,
-                                        BlockCompletionFunc *cb,
-                                        void *opaque)
+static int coroutine_fn qemu_rbd_co_flush(BlockDriverState *bs)
 {
-    return rbd_start_aio(bs, offset, qiov, bytes, cb, opaque,
-                         RBD_AIO_WRITE);
+    return qemu_rbd_start_co(bs, 0, 0, NULL, 0, RBD_AIO_FLUSH);
 }
 
-static BlockAIOCB *qemu_rbd_aio_flush(BlockDriverState *bs,
-                                      BlockCompletionFunc *cb,
-                                      void *opaque)
+static int coroutine_fn qemu_rbd_co_pdiscard(BlockDriverState *bs,
+                                             int64_t offset, int count)
 {
-    return rbd_start_aio(bs, 0, NULL, 0, cb, opaque, RBD_AIO_FLUSH);
+    return qemu_rbd_start_co(bs, offset, count, NULL, 0, RBD_AIO_DISCARD);
 }
 
 static int qemu_rbd_getinfo(BlockDriverState *bs, BlockDriverInfo *bdi)
@@ -1114,16 +1053,6 @@ static int qemu_rbd_snap_list(BlockDriverState *bs,
     return snap_count;
 }
 
-static BlockAIOCB *qemu_rbd_aio_pdiscard(BlockDriverState *bs,
-                                         int64_t offset,
-                                         int bytes,
-                                         BlockCompletionFunc *cb,
-                                         void *opaque)
-{
-    return rbd_start_aio(bs, offset, NULL, bytes, cb, opaque,
-                         RBD_AIO_DISCARD);
-}
-
 static void coroutine_fn qemu_rbd_co_invalidate_cache(BlockDriverState *bs,
                                                       Error **errp)
 {
@@ -1187,11 +1116,10 @@ static BlockDriver bdrv_rbd = {
     .bdrv_co_truncate       = qemu_rbd_co_truncate,
     .protocol_name          = "rbd",
 
-    .bdrv_aio_preadv        = qemu_rbd_aio_preadv,
-    .bdrv_aio_pwritev       = qemu_rbd_aio_pwritev,
-
-    .bdrv_aio_flush         = qemu_rbd_aio_flush,
-    .bdrv_aio_pdiscard      = qemu_rbd_aio_pdiscard,
+    .bdrv_co_preadv         = qemu_rbd_co_preadv,
+    .bdrv_co_pwritev        = qemu_rbd_co_pwritev,
+    .bdrv_co_flush_to_disk  = qemu_rbd_co_flush,
+    .bdrv_co_pdiscard       = qemu_rbd_co_pdiscard,
 
     .bdrv_snapshot_create   = qemu_rbd_snap_create,
     .bdrv_snapshot_delete   = qemu_rbd_snap_remove,
-- 
2.17.1



