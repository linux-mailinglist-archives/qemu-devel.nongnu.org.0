Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C42545060
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 17:15:13 +0200 (CEST)
Received: from localhost ([::1]:60952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzJsO-00024y-J2
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 11:15:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nzIT9-0008L2-3P
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 09:45:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nzIT7-0004gf-Ci
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 09:45:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654782300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=socKiO2gGChieqontE2gzzIATZPaTJJpq+zV51PiYOs=;
 b=Ok9CQwf65AbYmoAcYiAuG5Lb9LM9ONoLuWFtTRDEMox10f21OMpUx7oAkxiRn9IHXRn2uS
 ZuluWPbGvO+twQkP9dcwgQ73sBS98vJwFg3UuBzy2NZVtD4z0SgTlW/xpvOXnpGMqOqdh5
 qLVL2RpzvhnPD3wJ3zo5sj7/s9ghHJY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-113-Uo-gn7OmNzycBqlcCIICNA-1; Thu, 09 Jun 2022 09:44:55 -0400
X-MC-Unique: Uo-gn7OmNzycBqlcCIICNA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DACC1C05EB1;
 Thu,  9 Jun 2022 13:44:55 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D305A492C3B;
 Thu,  9 Jun 2022 13:44:54 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 1/2] linux-aio: use LinuxAioState from the running thread
Date: Thu,  9 Jun 2022 09:44:51 -0400
Message-Id: <20220609134452.1146309-2-eesposit@redhat.com>
In-Reply-To: <20220609134452.1146309-1-eesposit@redhat.com>
References: <20220609134452.1146309-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Remove usage of aio_context_acquire by always submitting asynchronous
AIO to the current thread's LinuxAioState.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/file-posix.c  |  3 ++-
 block/linux-aio.c   | 13 ++++++-------
 include/block/aio.h |  4 ----
 3 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 48cd096624..33f92f004a 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2086,7 +2086,8 @@ static int coroutine_fn raw_co_prw(BlockDriverState *bs, uint64_t offset,
 #endif
 #ifdef CONFIG_LINUX_AIO
     } else if (s->use_linux_aio) {
-        LinuxAioState *aio = aio_get_linux_aio(bdrv_get_aio_context(bs));
+        AioContext *ctx = qemu_get_current_aio_context();
+        LinuxAioState *aio = aio_get_linux_aio(ctx);
         assert(qiov->size == bytes);
         return laio_co_submit(bs, aio, s->fd, offset, qiov, type,
                               s->aio_max_batch);
diff --git a/block/linux-aio.c b/block/linux-aio.c
index 4c423fcccf..1d3cc767d1 100644
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
@@ -102,9 +103,8 @@ static void qemu_laio_process_completion(struct qemu_laiocb *laiocb)
      * later.  Coroutines cannot be entered recursively so avoid doing
      * that!
      */
-    if (!qemu_coroutine_entered(laiocb->co)) {
-        aio_co_wake(laiocb->co);
-    }
+    assert(laiocb->co->ctx == laiocb->ctx->aio_context);
+    qemu_coroutine_enter_if_inactive(laiocb->co);
 }
 
 /**
@@ -238,7 +238,6 @@ static void qemu_laio_process_completions_and_submit(LinuxAioState *s)
     if (!s->io_q.plugged && !QSIMPLEQ_EMPTY(&s->io_q.pending)) {
         ioq_submit(s);
     }
-    aio_context_release(s->aio_context);
 }
 
 static void qemu_laio_completion_bh(void *opaque)
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
-- 
2.31.1


