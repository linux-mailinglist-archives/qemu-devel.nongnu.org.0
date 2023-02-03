Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E5F689993
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 14:19:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNvy8-0002rO-Qu; Fri, 03 Feb 2023 08:19:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pNvwn-0002Uu-01
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 08:17:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pNvwi-0005l6-QS
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 08:17:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675430259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5rfukRz4EwI39UCHCn9ZQZjhf9HGOmdDQ8mwzAR/5og=;
 b=ZPrh0ltBlIWqqqJajw6q9MFGcAIurmr1BBs0s+J6lGxmdKU+qjmLBpram+Qld8aVmbcpWM
 10K4uxfPO09ww23nAeY8Hw7S+4y2xqGTHG+9lZCIoX4hvkenIEdKkHrE8OBpHZlT6wz/Co
 Ui3CxJkj2mTWYukipR/sgHdbYeeL5hY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-0v10CpXFPY2Iku6pK-c5pw-1; Fri, 03 Feb 2023 08:17:36 -0500
X-MC-Unique: 0v10CpXFPY2Iku6pK-c5pw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3A4738041D2;
 Fri,  3 Feb 2023 13:17:35 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60BA22026FFF;
 Fri,  3 Feb 2023 13:17:35 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, Julia Suvorova <jusual@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Greg Kurz <groug@kaod.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fam Zheng <fam@euphon.net>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v5 1/4] linux-aio: use LinuxAioState from the running thread
Date: Fri,  3 Feb 2023 08:17:28 -0500
Message-Id: <20230203131731.851116-2-eesposit@redhat.com>
In-Reply-To: <20230203131731.851116-1-eesposit@redhat.com>
References: <20230203131731.851116-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Remove usage of aio_context_acquire by always submitting asynchronous
AIO to the current thread's LinuxAioState.

In order to prevent mistakes from the caller side, avoid passing LinuxAioState
in laio_io_{plug/unplug} and laio_co_submit, and document the functions
to make clear that they work in the current thread's AioContext.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/block/aio.h               |  4 ----
 include/block/raw-aio.h           | 18 ++++++++++++------
 include/sysemu/block-backend-io.h |  6 ++++++
 block/file-posix.c                | 10 +++-------
 block/linux-aio.c                 | 29 +++++++++++++++++------------
 5 files changed, 38 insertions(+), 29 deletions(-)

diff --git a/include/block/aio.h b/include/block/aio.h
index 8fba6a3584..b6b396cfcb 100644
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
index 031a27ba10..d41698ccc5 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -74,8 +74,14 @@ void blk_iostatus_set_err(BlockBackend *blk, int error);
 int blk_get_max_iov(BlockBackend *blk);
 int blk_get_max_hw_iov(BlockBackend *blk);
 
+/*
+ * blk_io_plug/unplug are thread-local operations. This means that multiple
+ * IOThreads can simultaneously call plug/unplug, but the caller must ensure
+ * that each unplug() is called in the same IOThread of the matching plug().
+ */
 void blk_io_plug(BlockBackend *blk);
 void blk_io_unplug(BlockBackend *blk);
+
 AioContext *blk_get_aio_context(BlockBackend *blk);
 BlockAcctStats *blk_get_stats(BlockBackend *blk);
 void *blk_aio_get(const AIOCBInfo *aiocb_info, BlockBackend *blk,
diff --git a/block/file-posix.c b/block/file-posix.c
index fa227d9d14..fa99d1c25a 100644
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
 
@@ -2137,8 +2135,7 @@ static void raw_aio_plug(BlockDriverState *bs)
     BDRVRawState __attribute__((unused)) *s = bs->opaque;
 #ifdef CONFIG_LINUX_AIO
     if (s->use_linux_aio) {
-        LinuxAioState *aio = aio_get_linux_aio(bdrv_get_aio_context(bs));
-        laio_io_plug(bs, aio);
+        laio_io_plug();
     }
 #endif
 #ifdef CONFIG_LINUX_IO_URING
@@ -2154,8 +2151,7 @@ static void raw_aio_unplug(BlockDriverState *bs)
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
2.39.1


