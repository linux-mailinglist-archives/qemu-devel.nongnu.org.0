Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AD53C23F4
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 15:04:35 +0200 (CEST)
Received: from localhost ([::1]:48998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1qBE-0001z2-Gl
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 09:04:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1pyM-0003AQ-Ee
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:51:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1pyK-0003P3-CK
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:51:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625835071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tT+cGUHDGnf1Vv/6DyrKIouJ9Z2O3pOCdqwg34D+RoM=;
 b=jOKk1w3DZ7g96Dy5FRFkj9NjmSQHOYaXP+Uc6C/mDCjgwU3gy2ZXrxVM6vfqsvrjmmdPp+
 915ANd9H/7DTWgU8eX3u6L5Any/OALPdn623lw53iSKJrGS5jwI+95isJeETdciznzES7Y
 oxF34LqcVoaVJqLdOl95XyzVskUQgQc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-by8N-imyPEmy0N8nh_DAxA-1; Fri, 09 Jul 2021 08:51:08 -0400
X-MC-Unique: by8N-imyPEmy0N8nh_DAxA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B0188015F5;
 Fri,  9 Jul 2021 12:51:07 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-113-203.ams2.redhat.com [10.36.113.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D86C360843;
 Fri,  9 Jul 2021 12:51:04 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 06/28] block/rbd: migrate from aio to coroutines
Date: Fri,  9 Jul 2021 14:50:13 +0200
Message-Id: <20210709125035.191321-7-kwolf@redhat.com>
In-Reply-To: <20210709125035.191321-1-kwolf@redhat.com>
References: <20210709125035.191321-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Lieven <pl@kamp.de>

Signed-off-by: Peter Lieven <pl@kamp.de>
Reviewed-by: Ilya Dryomov <idryomov@gmail.com>
Message-Id: <20210702172356.11574-5-idryomov@gmail.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/rbd.c | 252 +++++++++++++++++++---------------------------------
 1 file changed, 90 insertions(+), 162 deletions(-)

diff --git a/block/rbd.c b/block/rbd.c
index e2028d3db5..380ad28861 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -78,22 +78,6 @@ typedef enum {
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
@@ -105,6 +89,13 @@ typedef struct BDRVRBDState {
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
@@ -337,13 +328,6 @@ static int qemu_rbd_set_keypairs(rados_t cluster, const char *keypairs_json,
     return ret;
 }
 
-static void qemu_rbd_memset(RADOSCB *rcb, int64_t offs)
-{
-    RBDAIOCB *acb = rcb->acb;
-    iov_memset(acb->qiov->iov, acb->qiov->niov, offs, 0,
-               acb->qiov->size - offs);
-}
-
 #ifdef LIBRBD_SUPPORTS_ENCRYPTION
 static int qemu_rbd_convert_luks_options(
         RbdEncryptionOptionsLUKSBase *luks_opts,
@@ -733,46 +717,6 @@ exit:
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
@@ -1122,89 +1066,59 @@ static int qemu_rbd_resize(BlockDriverState *bs, uint64_t size)
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
-
-    rcb = g_new(RADOSCB, 1);
+    assert(!qiov || qiov->size == bytes);
 
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
@@ -1214,44 +1128,69 @@ static BlockAIOCB *rbd_start_aio(BlockDriverState *bs,
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
@@ -1450,16 +1389,6 @@ static int qemu_rbd_snap_list(BlockDriverState *bs,
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
@@ -1540,11 +1469,10 @@ static BlockDriver bdrv_rbd = {
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
2.31.1


