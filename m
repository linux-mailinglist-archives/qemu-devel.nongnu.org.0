Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C03D3A11B8
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 12:54:51 +0200 (CEST)
Received: from localhost ([::1]:54888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqvrG-0003e8-HU
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 06:54:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqvpj-00029H-JG; Wed, 09 Jun 2021 06:53:16 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:40713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqvph-0003Dv-Rm; Wed, 09 Jun 2021 06:53:15 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 b145-20020a1c80970000b029019c8c824054so3962556wmd.5; 
 Wed, 09 Jun 2021 03:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QBxnPrRaKz2N62pP8jGwNRtDRnQqlBaiFmgHGNBpNv8=;
 b=RfWFmDco1tyT4z0+N//k0JGsA04fqpoRJyxKQyddkRMswZkMp6gb3BZks0JTVDLQAL
 yFmSqJVbKCmr96j+xQodw5GLck/3XTpBAJ26u/G92p1c1xSA/Lz2zL0dAJ+KyurZRI0f
 US8IEcfUnqslAEmhrNeQXT74f7bEYrVea2BclnMWsVP7hKfqVh36C4cVkLFjaM8HAuJ3
 w4mTnFMwCLHyxz2ea5FYYGD9+AadVXp1b1EeKOfHfVxomiF1ZdEtDUGBQ2/ks1hc5ddw
 EFy9faWxIKy1PRBqWn6Ta/1zNhZ9f+IBW5aUMB+Tu9y/nvSL0hwpQlRgDIo3cKLHpZlS
 1Wrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=QBxnPrRaKz2N62pP8jGwNRtDRnQqlBaiFmgHGNBpNv8=;
 b=k7ZJGXvUu6XkuiWhZE5NucVUOB861Xn71K8yLF32+gf65akNa4QttTbxXwt5o9tn+l
 oDlNyCawiYn6aYuVSXXqr49DtTwgewhwgiAqkRmV60HwQfijpMfDewxpOk38PMmYoSu1
 DcnXczpaP7n+ZfjkxgOmJZiK8crUvBxoGxwDTfozysqFG4pUnGyUBcUxA4QHgwgCZ8mn
 D8ye6exYxuRbEWKN78OfQH9izFoxjd6c84ppjot/sX2HkB178N3tZeMbNPe8g5wbmLRQ
 /OhJcQ3OcCvMnG4GFZ5MtRuHRZ67uMu7Xhj4ycjm/VwGM18r8GvocnKCUSYc5+ccF3vZ
 Enkg==
X-Gm-Message-State: AOAM530dT0DZzKS8UrgJVTAIp42xsTLLFX/j6J47Fjm9+EA85b38wEPp
 LFyed7GsX+n5pExiTGmws+sh8xYV1vjTIg==
X-Google-Smtp-Source: ABdhPJzhQXKobpMNNB/V5JqJhvZ6Eo3gwY4zGVWppQjN0SbWKoTfOyRbb8saxXp1c9LC+zf3u5sG9A==
X-Received: by 2002:a05:600c:3b10:: with SMTP id
 m16mr8994566wms.55.1623235991469; 
 Wed, 09 Jun 2021 03:53:11 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 s1sm5875829wmj.8.2021.06.09.03.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 03:53:11 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] async: the main AioContext is only "current" if under the BQL
Date: Wed,  9 Jun 2021 12:53:09 +0200
Message-Id: <20210609105309.529896-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: eesposit@redhat.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If we want to wake up a coroutine from a worker thread, aio_co_wake()
currently does not work.  In that scenario, aio_co_wake() calls
aio_co_enter(), but there is no current AioContext and therefore
qemu_get_current_aio_context() returns the main thread.  aio_co_wake()
then attempts to call aio_context_acquire() instead of going through
aio_co_schedule().

The default case of qemu_get_current_aio_context() was added to cover
synchronous I/O started from the vCPU thread, but the main and vCPU
threads are quite different.  The main thread is an I/O thread itself,
only running a more complicated event loop; the vCPU thread instead
is essentially a worker thread that occasionally calls
qemu_mutex_lock_iothread().  It is only in those critical sections
that it acts as if it were the home thread of the main AioContext.

Therefore, this patch detaches qemu_get_current_aio_context() from
iothreads, which is a useless complication.  The AioContext pointer
is stored directly in the thread-local variable, including for the
main loop.  Worker threads (including vCPU threads) optionally behave
as temporary home threads if they have taken the big QEMU lock,
but if that is not the case they will always schedule coroutines
on remote threads via aio_co_schedule().

Reported-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/block/aio.h   |  5 ++++-
 iothread.c            |  9 +--------
 stubs/iothread.c      |  8 --------
 stubs/meson.build     |  1 -
 tests/unit/iothread.c |  9 +--------
 util/async.c          | 20 ++++++++++++++++++++
 util/main-loop.c      |  1 +
 7 files changed, 27 insertions(+), 26 deletions(-)
 delete mode 100644 stubs/iothread.c

diff --git a/include/block/aio.h b/include/block/aio.h
index 5f342267d5..10fcae1515 100644
--- a/include/block/aio.h
+++ b/include/block/aio.h
@@ -691,10 +691,13 @@ void aio_co_enter(AioContext *ctx, struct Coroutine *co);
  * Return the AioContext whose event loop runs in the current thread.
  *
  * If called from an IOThread this will be the IOThread's AioContext.  If
- * called from another thread it will be the main loop AioContext.
+ * called from the main thread or with the "big QEMU lock" taken it
+ * will be the main loop AioContext.
  */
 AioContext *qemu_get_current_aio_context(void);
 
+void qemu_set_current_aio_context(AioContext *ctx);
+
 /**
  * aio_context_setup:
  * @ctx: the aio context
diff --git a/iothread.c b/iothread.c
index 7f086387be..2c5ccd7367 100644
--- a/iothread.c
+++ b/iothread.c
@@ -39,13 +39,6 @@ DECLARE_CLASS_CHECKERS(IOThreadClass, IOTHREAD,
 #define IOTHREAD_POLL_MAX_NS_DEFAULT 0ULL
 #endif
 
-static __thread IOThread *my_iothread;
-
-AioContext *qemu_get_current_aio_context(void)
-{
-    return my_iothread ? my_iothread->ctx : qemu_get_aio_context();
-}
-
 static void *iothread_run(void *opaque)
 {
     IOThread *iothread = opaque;
@@ -56,7 +49,7 @@ static void *iothread_run(void *opaque)
      * in this new thread uses glib.
      */
     g_main_context_push_thread_default(iothread->worker_context);
-    my_iothread = iothread;
+    qemu_set_current_aio_context(iothread->ctx);
     iothread->thread_id = qemu_get_thread_id();
     qemu_sem_post(&iothread->init_done_sem);
 
diff --git a/stubs/iothread.c b/stubs/iothread.c
deleted file mode 100644
index 8cc9e28c55..0000000000
--- a/stubs/iothread.c
+++ /dev/null
@@ -1,8 +0,0 @@
-#include "qemu/osdep.h"
-#include "block/aio.h"
-#include "qemu/main-loop.h"
-
-AioContext *qemu_get_current_aio_context(void)
-{
-    return qemu_get_aio_context();
-}
diff --git a/stubs/meson.build b/stubs/meson.build
index 65c22c0568..4993797f05 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -16,7 +16,6 @@ stub_ss.add(files('fw_cfg.c'))
 stub_ss.add(files('gdbstub.c'))
 stub_ss.add(files('get-vm-name.c'))
 stub_ss.add(when: 'CONFIG_LINUX_IO_URING', if_true: files('io_uring.c'))
-stub_ss.add(files('iothread.c'))
 stub_ss.add(files('iothread-lock.c'))
 stub_ss.add(files('isa-bus.c'))
 stub_ss.add(files('is-daemonized.c'))
diff --git a/tests/unit/iothread.c b/tests/unit/iothread.c
index afde12b4ef..f9b0791084 100644
--- a/tests/unit/iothread.c
+++ b/tests/unit/iothread.c
@@ -30,13 +30,6 @@ struct IOThread {
     bool stopping;
 };
 
-static __thread IOThread *my_iothread;
-
-AioContext *qemu_get_current_aio_context(void)
-{
-    return my_iothread ? my_iothread->ctx : qemu_get_aio_context();
-}
-
 static void iothread_init_gcontext(IOThread *iothread)
 {
     GSource *source;
@@ -54,9 +47,9 @@ static void *iothread_run(void *opaque)
 
     rcu_register_thread();
 
-    my_iothread = iothread;
     qemu_mutex_lock(&iothread->init_done_lock);
     iothread->ctx = aio_context_new(&error_abort);
+    qemu_set_current_aio_context(iothread->ctx);
 
     /*
      * We must connect the ctx to a GMainContext, because in older versions
diff --git a/util/async.c b/util/async.c
index 674dbefb7c..5d9b7cc1eb 100644
--- a/util/async.c
+++ b/util/async.c
@@ -649,3 +649,23 @@ void aio_context_release(AioContext *ctx)
 {
     qemu_rec_mutex_unlock(&ctx->lock);
 }
+
+static __thread AioContext *my_aiocontext;
+
+AioContext *qemu_get_current_aio_context(void)
+{
+    if (my_aiocontext) {
+        return my_aiocontext;
+    }
+    if (qemu_mutex_iothread_locked()) {
+        /* Possibly in a vCPU thread.  */
+        return qemu_get_aio_context();
+    }
+    return NULL;
+}
+
+void qemu_set_current_aio_context(AioContext *ctx)
+{
+    assert(!my_aiocontext);
+    my_aiocontext = ctx;
+}
diff --git a/util/main-loop.c b/util/main-loop.c
index d9c55df6f5..4ae5b23e99 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -170,6 +170,7 @@ int qemu_init_main_loop(Error **errp)
     if (!qemu_aio_context) {
         return -EMFILE;
     }
+    qemu_set_current_aio_context(qemu_aio_context);
     qemu_notify_bh = qemu_bh_new(notify_event_cb, NULL);
     gpollfds = g_array_new(FALSE, FALSE, sizeof(GPollFD));
     src = aio_get_g_source(qemu_aio_context);
-- 
2.31.1


