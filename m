Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 432F9613771
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:09:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUOU-0000qv-7U; Mon, 31 Oct 2022 08:59:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1opUOP-0000ay-Jo
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:59:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1opUOM-0005Yz-L1
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:59:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667221190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qQThV+fUcJRrtXJxSn27WyaKT9Jj6FVB+W+O11nWELE=;
 b=SQ5FuvC6xnYgECrPfpLFyj4GbjOjGhf9W5S6Xuna1aLjzUeLHV8pp9JLYql+QntW48KEhW
 c+g+JKtjxZL4ZQA1pxtY/hcN/YbFIw0L1Xx9EFU6PxmeVQneRQY2xQWwelRu7MagMpzaXT
 csTVwu+LYkyvExdZxg9Ydreqwjy/qcE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-Oya3amb2NOuc6XyEVyT2FA-1; Mon, 31 Oct 2022 08:59:46 -0400
X-MC-Unique: Oya3amb2NOuc6XyEVyT2FA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C4178027EC;
 Mon, 31 Oct 2022 12:59:46 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09A242024CC0;
 Mon, 31 Oct 2022 12:59:46 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Julia Suvorova <jusual@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v4 1/3] linux-aio: use LinuxAioState from the running thread
Date: Mon, 31 Oct 2022 08:59:34 -0400
Message-Id: <20221031125936.3458740-2-eesposit@redhat.com>
In-Reply-To: <20221031125936.3458740-1-eesposit@redhat.com>
References: <20221031125936.3458740-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Paolo Bonzini <pbonzini@redhat.com>

Remove usage of aio_context_acquire by always submitting asynchronous
AIO to the current thread's LinuxAioState.

In order to prevent mistakes from the caller side, avoid passing LinuxAioState
in laio_io_{plug/unplug} and laio_co_submit.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/file-posix.c      | 10 +++-------
 block/linux-aio.c       | 29 +++++++++++++++++------------
 include/block/aio.h     |  4 ----
 include/block/raw-aio.h | 10 ++++------
 4 files changed, 24 insertions(+), 29 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 23acffb9a4..23fe98eb3e 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2099,10 +2099,8 @@ static int coroutine_fn raw_co_prw(BlockDriverState *bs, uint64_t offset,
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
 
@@ -2142,8 +2140,7 @@ static void raw_aio_plug(BlockDriverState *bs)
     BDRVRawState __attribute__((unused)) *s = bs->opaque;
 #ifdef CONFIG_LINUX_AIO
     if (s->use_linux_aio) {
-        LinuxAioState *aio = aio_get_linux_aio(bdrv_get_aio_context(bs));
-        laio_io_plug(bs, aio);
+        laio_io_plug();
     }
 #endif
 #ifdef CONFIG_LINUX_IO_URING
@@ -2159,8 +2156,7 @@ static void raw_aio_unplug(BlockDriverState *bs)
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
index d2cfb7f523..d4983aa8fc 100644
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
+    /* All data is only used in one I/O thread.  */
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
diff --git a/include/block/aio.h b/include/block/aio.h
index d128558f1d..8bb5eea4a9 100644
--- a/include/block/aio.h
+++ b/include/block/aio.h
@@ -200,10 +200,6 @@ struct AioContext {
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
index 21fc10c4c9..f0f14f14f8 100644
--- a/include/block/raw-aio.h
+++ b/include/block/raw-aio.h
@@ -50,14 +50,12 @@
 typedef struct LinuxAioState LinuxAioState;
 LinuxAioState *laio_init(Error **errp);
 void laio_cleanup(LinuxAioState *s);
-int coroutine_fn laio_co_submit(BlockDriverState *bs, LinuxAioState *s, int fd,
-                                uint64_t offset, QEMUIOVector *qiov, int type,
-                                uint64_t dev_max_batch);
+int coroutine_fn laio_co_submit(int fd, uint64_t offset, QEMUIOVector *qiov,
+                                int type, uint64_t dev_max_batch);
 void laio_detach_aio_context(LinuxAioState *s, AioContext *old_context);
 void laio_attach_aio_context(LinuxAioState *s, AioContext *new_context);
-void laio_io_plug(BlockDriverState *bs, LinuxAioState *s);
-void laio_io_unplug(BlockDriverState *bs, LinuxAioState *s,
-                    uint64_t dev_max_batch);
+void laio_io_plug(void);
+void laio_io_unplug(uint64_t dev_max_batch);
 #endif
 /* io_uring.c - Linux io_uring implementation */
 #ifdef CONFIG_LINUX_IO_URING
-- 
2.31.1


