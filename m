Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A39F689996
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 14:21:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNvyC-0002zw-5t; Fri, 03 Feb 2023 08:19:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pNvwq-0002Vl-Ow
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 08:17:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pNvwk-0005le-1A
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 08:17:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675430261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O9Bv7L5vXt/I0uE7sVGGKvpSA0fsYXAr3qGnaj0zbJs=;
 b=EvB2V4jTG31Jj97f+71f5Q4WUWLAmb7PgILFvS62I6pCxqCp/kF9pF91tmWCSz0oGVTgP/
 nov3l9f0hijq+vTyXDQxAU+tJZVtx9mZ/sSiLVv2j5acxzyIKeL7MIKw7wQ7XvlgK95ejX
 YtjNnem76AXzSlscynibygKQXJ5p1Fs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-wGnNWYoFOeGsAxIwenQKTA-1; Fri, 03 Feb 2023 08:17:37 -0500
X-MC-Unique: wGnNWYoFOeGsAxIwenQKTA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8335C80D0E8;
 Fri,  3 Feb 2023 13:17:36 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF9AD2026FFF;
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
Subject: [PATCH v5 2/4] io_uring: use LuringState from the running thread
Date: Fri,  3 Feb 2023 08:17:29 -0500
Message-Id: <20230203131731.851116-3-eesposit@redhat.com>
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
AIO to the current thread's LuringState.

In order to prevent mistakes from the caller side, avoid passing LuringState
in luring_io_{plug/unplug} and luring_co_submit, and document the functions
to make clear that they work in the current thread's AioContext.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/block/aio.h     |  4 ----
 include/block/raw-aio.h | 15 +++++++++++----
 block/file-posix.c      | 12 ++++--------
 block/io_uring.c        | 23 +++++++++++++++--------
 4 files changed, 30 insertions(+), 24 deletions(-)

diff --git a/include/block/aio.h b/include/block/aio.h
index b6b396cfcb..3b7634bef4 100644
--- a/include/block/aio.h
+++ b/include/block/aio.h
@@ -211,10 +211,6 @@ struct AioContext {
     struct LinuxAioState *linux_aio;
 #endif
 #ifdef CONFIG_LINUX_IO_URING
-    /*
-     * State for Linux io_uring.  Uses aio_context_acquire/release for
-     * locking.
-     */
     struct LuringState *linux_io_uring;
 
     /* State for file descriptor monitoring using Linux io_uring */
diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
index db614472e6..e46a29c3f0 100644
--- a/include/block/raw-aio.h
+++ b/include/block/raw-aio.h
@@ -69,12 +69,19 @@ void laio_io_unplug(uint64_t dev_max_batch);
 typedef struct LuringState LuringState;
 LuringState *luring_init(Error **errp);
 void luring_cleanup(LuringState *s);
-int coroutine_fn luring_co_submit(BlockDriverState *bs, LuringState *s, int fd,
-                                uint64_t offset, QEMUIOVector *qiov, int type);
+
+/* luring_co_submit: submit I/O requests in the thread's current AioContext. */
+int coroutine_fn luring_co_submit(BlockDriverState *bs, int fd, uint64_t offset,
+                                  QEMUIOVector *qiov, int type);
 void luring_detach_aio_context(LuringState *s, AioContext *old_context);
 void luring_attach_aio_context(LuringState *s, AioContext *new_context);
-void luring_io_plug(BlockDriverState *bs, LuringState *s);
-void luring_io_unplug(BlockDriverState *bs, LuringState *s);
+
+/*
+ * luring_io_plug/unplug work in the thread's current AioContext, therefore the
+ * caller must ensure that they are paired in the same IOThread.
+ */
+void luring_io_plug(void);
+void luring_io_unplug(void);
 #endif
 
 #ifdef _WIN32
diff --git a/block/file-posix.c b/block/file-posix.c
index fa99d1c25a..b8ee58201c 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2089,9 +2089,8 @@ static int coroutine_fn raw_co_prw(BlockDriverState *bs, uint64_t offset,
         type |= QEMU_AIO_MISALIGNED;
 #ifdef CONFIG_LINUX_IO_URING
     } else if (s->use_linux_io_uring) {
-        LuringState *aio = aio_get_linux_io_uring(bdrv_get_aio_context(bs));
         assert(qiov->size == bytes);
-        return luring_co_submit(bs, aio, s->fd, offset, qiov, type);
+        return luring_co_submit(bs, s->fd, offset, qiov, type);
 #endif
 #ifdef CONFIG_LINUX_AIO
     } else if (s->use_linux_aio) {
@@ -2140,8 +2139,7 @@ static void raw_aio_plug(BlockDriverState *bs)
 #endif
 #ifdef CONFIG_LINUX_IO_URING
     if (s->use_linux_io_uring) {
-        LuringState *aio = aio_get_linux_io_uring(bdrv_get_aio_context(bs));
-        luring_io_plug(bs, aio);
+        luring_io_plug();
     }
 #endif
 }
@@ -2156,8 +2154,7 @@ static void raw_aio_unplug(BlockDriverState *bs)
 #endif
 #ifdef CONFIG_LINUX_IO_URING
     if (s->use_linux_io_uring) {
-        LuringState *aio = aio_get_linux_io_uring(bdrv_get_aio_context(bs));
-        luring_io_unplug(bs, aio);
+        luring_io_unplug();
     }
 #endif
 }
@@ -2181,8 +2178,7 @@ static int coroutine_fn raw_co_flush_to_disk(BlockDriverState *bs)
 
 #ifdef CONFIG_LINUX_IO_URING
     if (s->use_linux_io_uring) {
-        LuringState *aio = aio_get_linux_io_uring(bdrv_get_aio_context(bs));
-        return luring_co_submit(bs, aio, s->fd, 0, NULL, QEMU_AIO_FLUSH);
+        return luring_co_submit(bs, s->fd, 0, NULL, QEMU_AIO_FLUSH);
     }
 #endif
     return raw_thread_pool_submit(bs, handle_aiocb_flush, &acb);
diff --git a/block/io_uring.c b/block/io_uring.c
index 973e15d876..220fb72ae6 100644
--- a/block/io_uring.c
+++ b/block/io_uring.c
@@ -18,6 +18,9 @@
 #include "qapi/error.h"
 #include "trace.h"
 
+/* Only used for assertions.  */
+#include "qemu/coroutine_int.h"
+
 /* io_uring ring size */
 #define MAX_ENTRIES 128
 
@@ -50,10 +53,9 @@ typedef struct LuringState {
 
     struct io_uring ring;
 
-    /* io queue for submit at batch.  Protected by AioContext lock. */
+    /* No locking required, only accessed from AioContext home thread */
     LuringQueue io_q;
 
-    /* I/O completion processing.  Only runs in I/O thread.  */
     QEMUBH *completion_bh;
 } LuringState;
 
@@ -209,6 +211,7 @@ end:
          * eventually runs later. Coroutines cannot be entered recursively
          * so avoid doing that!
          */
+        assert(luringcb->co->ctx == luringcb->aio_context);
         if (!qemu_coroutine_entered(luringcb->co)) {
             aio_co_wake(luringcb->co);
         }
@@ -262,13 +265,11 @@ static int ioq_submit(LuringState *s)
 
 static void luring_process_completions_and_submit(LuringState *s)
 {
-    aio_context_acquire(s->aio_context);
     luring_process_completions(s);
 
     if (!s->io_q.plugged && s->io_q.in_queue > 0) {
         ioq_submit(s);
     }
-    aio_context_release(s->aio_context);
 }
 
 static void qemu_luring_completion_bh(void *opaque)
@@ -306,14 +307,18 @@ static void ioq_init(LuringQueue *io_q)
     io_q->blocked = false;
 }
 
-void luring_io_plug(BlockDriverState *bs, LuringState *s)
+void luring_io_plug(void)
 {
+    AioContext *ctx = qemu_get_current_aio_context();
+    LuringState *s = aio_get_linux_io_uring(ctx);
     trace_luring_io_plug(s);
     s->io_q.plugged++;
 }
 
-void luring_io_unplug(BlockDriverState *bs, LuringState *s)
+void luring_io_unplug(void)
 {
+    AioContext *ctx = qemu_get_current_aio_context();
+    LuringState *s = aio_get_linux_io_uring(ctx);
     assert(s->io_q.plugged);
     trace_luring_io_unplug(s, s->io_q.blocked, s->io_q.plugged,
                            s->io_q.in_queue, s->io_q.in_flight);
@@ -373,10 +378,12 @@ static int luring_do_submit(int fd, LuringAIOCB *luringcb, LuringState *s,
     return 0;
 }
 
-int coroutine_fn luring_co_submit(BlockDriverState *bs, LuringState *s, int fd,
-                                  uint64_t offset, QEMUIOVector *qiov, int type)
+int coroutine_fn luring_co_submit(BlockDriverState *bs, int fd, uint64_t offset,
+                                  QEMUIOVector *qiov, int type)
 {
     int ret;
+    AioContext *ctx = qemu_get_current_aio_context();
+    LuringState *s = aio_get_linux_io_uring(ctx);
     LuringAIOCB luringcb = {
         .co         = qemu_coroutine_self(),
         .ret        = -EINPROGRESS,
-- 
2.39.1


