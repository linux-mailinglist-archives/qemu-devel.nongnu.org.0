Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6206EE2B4
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 15:19:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prIVl-0007LJ-40; Tue, 25 Apr 2023 09:15:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prIVG-0006QF-HV
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:14:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prIUt-0006aI-6V
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:14:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682428457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dGMhJc4Z+y3jNPXYlhCA33o3xlODKuTB/fJNiO26q/s=;
 b=I+VNNQJg7bbpZnGkKtfxU0TpQCgg+P1NH0/MYo7UbVTFwKoEtNjZeirPWNUiBmNSW+lEaj
 BOwBWbP6Io+3X9pIcH73IMbCvoj899YHtpa4Oqd5A2LxaL2zIUuRB2eoLXZGsgDFLndTT5
 6ncwV0+7iGoz6Q4yMkvI8vXhVzzxN9c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-E9HyaMcyPMuWHQEdwK6Xvg-1; Tue, 25 Apr 2023 09:14:16 -0400
X-MC-Unique: E9HyaMcyPMuWHQEdwK6Xvg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA5F3185A7A9;
 Tue, 25 Apr 2023 13:14:15 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D56040C2064;
 Tue, 25 Apr 2023 13:14:15 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 12/25] linux-aio: use LinuxAioState from the running thread
Date: Tue, 25 Apr 2023 15:13:46 +0200
Message-Id: <20230425131359.259007-13-kwolf@redhat.com>
In-Reply-To: <20230425131359.259007-1-kwolf@redhat.com>
References: <20230425131359.259007-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Remove usage of aio_context_acquire by always submitting asynchronous
AIO to the current thread's LinuxAioState.

In order to prevent mistakes from the caller side, avoid passing LinuxAioState
in laio_io_{plug/unplug} and laio_co_submit, and document the functions
to make clear that they work in the current thread's AioContext.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20230203131731.851116-2-eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/aio.h               |  4 ----
 include/block/raw-aio.h           | 18 ++++++++++++------
 include/sysemu/block-backend-io.h |  5 +++++
 block/file-posix.c                | 10 +++-------
 block/linux-aio.c                 | 29 +++++++++++++++++------------
 5 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/include/block/aio.h b/include/block/aio.h
index 543717f294..9e53aabba6 100644
--- a/include/block/aio.h
+++ b/include/block/aio.h
@@ -208,10 +208,6 @@ struct AioContext {
     struct ThreadPool *thread_pool;
 
 #ifdef CONFIG_LINUX_AIO
-    /*
-     * State for native Linux AIO.  Uses aio_context_acquire/release for
-     * locking.
-     */
     struct LinuxAioState *linux_aio;
 #endif
 #ifdef CONFIG_LINUX_IO_URING
diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
index f8cda9df91..db614472e6 100644
--- a/include/block/raw-aio.h
+++ b/include/block/raw-aio.h
@@ -49,14 +49,20 @@
 typedef struct LinuxAioState LinuxAioState;
 LinuxAioState *laio_init(Error **errp);
 void laio_cleanup(LinuxAioState *s);
-int coroutine_fn laio_co_submit(BlockDriverState *bs, LinuxAioState *s, int fd,
-                                uint64_t offset, QEMUIOVector *qiov, int type,
-                                uint64_t dev_max_batch);
+
+/* laio_co_submit: submit I/O requests in the thread's current AioContext. */
+int coroutine_fn laio_co_submit(int fd, uint64_t offset, QEMUIOVector *qiov,
+                                int type, uint64_t dev_max_batch);
+
 void laio_detach_aio_context(LinuxAioState *s, AioContext *old_context);
 void laio_attach_aio_context(LinuxAioState *s, AioContext *new_context);
-void laio_io_plug(BlockDriverState *bs, LinuxAioState *s);
-void laio_io_unplug(BlockDriverState *bs, LinuxAioState *s,
-                    uint64_t dev_max_batch);
+
+/*
+ * laio_io_plug/unplug work in the thread's current AioContext, therefore the
+ * caller must ensure that they are paired in the same IOThread.
+ */
+void laio_io_plug(void);
+void laio_io_unplug(uint64_t dev_max_batch);
 #endif
 /* io_uring.c - Linux io_uring implementation */
 #ifdef CONFIG_LINUX_IO_URING
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index bb25493ba1..851a44de96 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -90,6 +90,11 @@ void blk_iostatus_set_err(BlockBackend *blk, int error);
 int blk_get_max_iov(BlockBackend *blk);
 int blk_get_max_hw_iov(BlockBackend *blk);
 
+/*
+ * blk_io_plug/unplug are thread-local operations. This means that multiple
+ * IOThreads can simultaneously call plug/unplug, but the caller must ensure
+ * that each unplug() is called in the same IOThread of the matching plug().
+ */
 void coroutine_fn blk_co_io_plug(BlockBackend *blk);
 void co_wrapper blk_io_plug(BlockBackend *blk);
 
diff --git a/block/file-posix.c b/block/file-posix.c
index c2dee3f056..1b4342822b 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2095,10 +2095,8 @@ static int coroutine_fn raw_co_prw(BlockDriverState *bs, uint64_t offset,
 #endif
 #ifdef CONFIG_LINUX_AIO
     } else if (s->use_linux_aio) {
-        LinuxAioState *aio = aio_get_linux_aio(bdrv_get_aio_context(bs));
         assert(qiov->size == bytes);
-        return laio_co_submit(bs, aio, s->fd, offset, qiov, type,
-                              s->aio_max_batch);
+        return laio_co_submit(s->fd, offset, qiov, type, s->aio_max_batch);
 #endif
     }
 
@@ -2137,8 +2135,7 @@ static void coroutine_fn raw_co_io_plug(BlockDriverState *bs)
     BDRVRawState __attribute__((unused)) *s = bs->opaque;
 #ifdef CONFIG_LINUX_AIO
     if (s->use_linux_aio) {
-        LinuxAioState *aio = aio_get_linux_aio(bdrv_get_aio_context(bs));
-        laio_io_plug(bs, aio);
+        laio_io_plug();
     }
 #endif
 #ifdef CONFIG_LINUX_IO_URING
@@ -2154,8 +2151,7 @@ static void coroutine_fn raw_co_io_unplug(BlockDriverState *bs)
     BDRVRawState __attribute__((unused)) *s = bs->opaque;
 #ifdef CONFIG_LINUX_AIO
     if (s->use_linux_aio) {
-        LinuxAioState *aio = aio_get_linux_aio(bdrv_get_aio_context(bs));
-        laio_io_unplug(bs, aio, s->aio_max_batch);
+        laio_io_unplug(s->aio_max_batch);
     }
 #endif
 #ifdef CONFIG_LINUX_IO_URING
diff --git a/block/linux-aio.c b/block/linux-aio.c
index d2cfb7f523..fc50cdd1bf 100644
--- a/block/linux-aio.c
+++ b/block/linux-aio.c
@@ -16,6 +16,9 @@
 #include "qemu/coroutine.h"
 #include "qapi/error.h"
 
+/* Only used for assertions.  */
+#include "qemu/coroutine_int.h"
+
 #include <libaio.h>
 
 /*
@@ -56,10 +59,8 @@ struct LinuxAioState {
     io_context_t ctx;
     EventNotifier e;
 
-    /* io queue for submit at batch.  Protected by AioContext lock. */
+    /* No locking required, only accessed from AioContext home thread */
     LaioQueue io_q;
-
-    /* I/O completion processing.  Only runs in I/O thread.  */
     QEMUBH *completion_bh;
     int event_idx;
     int event_max;
@@ -102,6 +103,7 @@ static void qemu_laio_process_completion(struct qemu_laiocb *laiocb)
      * later.  Coroutines cannot be entered recursively so avoid doing
      * that!
      */
+    assert(laiocb->co->ctx == laiocb->ctx->aio_context);
     if (!qemu_coroutine_entered(laiocb->co)) {
         aio_co_wake(laiocb->co);
     }
@@ -232,13 +234,11 @@ static void qemu_laio_process_completions(LinuxAioState *s)
 
 static void qemu_laio_process_completions_and_submit(LinuxAioState *s)
 {
-    aio_context_acquire(s->aio_context);
     qemu_laio_process_completions(s);
 
     if (!s->io_q.plugged && !QSIMPLEQ_EMPTY(&s->io_q.pending)) {
         ioq_submit(s);
     }
-    aio_context_release(s->aio_context);
 }
 
 static void qemu_laio_completion_bh(void *opaque)
@@ -354,14 +354,19 @@ static uint64_t laio_max_batch(LinuxAioState *s, uint64_t dev_max_batch)
     return max_batch;
 }
 
-void laio_io_plug(BlockDriverState *bs, LinuxAioState *s)
+void laio_io_plug(void)
 {
+    AioContext *ctx = qemu_get_current_aio_context();
+    LinuxAioState *s = aio_get_linux_aio(ctx);
+
     s->io_q.plugged++;
 }
 
-void laio_io_unplug(BlockDriverState *bs, LinuxAioState *s,
-                    uint64_t dev_max_batch)
+void laio_io_unplug(uint64_t dev_max_batch)
 {
+    AioContext *ctx = qemu_get_current_aio_context();
+    LinuxAioState *s = aio_get_linux_aio(ctx);
+
     assert(s->io_q.plugged);
     s->io_q.plugged--;
 
@@ -411,15 +416,15 @@ static int laio_do_submit(int fd, struct qemu_laiocb *laiocb, off_t offset,
     return 0;
 }
 
-int coroutine_fn laio_co_submit(BlockDriverState *bs, LinuxAioState *s, int fd,
-                                uint64_t offset, QEMUIOVector *qiov, int type,
-                                uint64_t dev_max_batch)
+int coroutine_fn laio_co_submit(int fd, uint64_t offset, QEMUIOVector *qiov,
+                                int type, uint64_t dev_max_batch)
 {
     int ret;
+    AioContext *ctx = qemu_get_current_aio_context();
     struct qemu_laiocb laiocb = {
         .co         = qemu_coroutine_self(),
         .nbytes     = qiov->size,
-        .ctx        = s,
+        .ctx        = aio_get_linux_aio(ctx),
         .ret        = -EINPROGRESS,
         .is_read    = (type == QEMU_AIO_READ),
         .qiov       = qiov,
-- 
2.40.0


