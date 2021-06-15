Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D4D3A8A73
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 22:50:39 +0200 (CEST)
Received: from localhost ([::1]:43212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltG18-00058a-K3
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 16:50:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFym-0001dR-2z
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFyh-0000vW-3R
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623790085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vvesYzTVnWk+zsGXmt91yWNRvOaxcLtm5Y9F9yNCWSw=;
 b=CaYjsQwa6n8Pu8KU9L4x0T+ODooVt6Z4KbR+8FRN6SFcBKfT4TS+PT21b33WWmO9Fo7elY
 WgskwZST+ZQvAwcs852DIYCvIR4du5JIIk5cGDAtGhv4DZ9JY/YDtEflSzhxHBRnsx153y
 9jAypdIgeZIR8AwusruSc5PFpNERtN4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-g1njSEudP6GnHSuXNz6a7g-1; Tue, 15 Jun 2021 16:48:04 -0400
X-MC-Unique: g1njSEudP6GnHSuXNz6a7g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AE47100C622;
 Tue, 15 Jun 2021 20:48:03 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-191.phx2.redhat.com [10.3.114.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B5CF5D9E2;
 Tue, 15 Jun 2021 20:47:58 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/34] async: the main AioContext is only "current" if under
 the BQL
Date: Tue, 15 Jun 2021 15:47:23 -0500
Message-Id: <20210615204756.281505-2-eblake@redhat.com>
In-Reply-To: <20210615204756.281505-1-eblake@redhat.com>
References: <20210615204756.281505-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block I/O path" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

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

With this change, the stub qemu_mutex_iothread_locked() must be changed
from true to false.  The previous value of true was needed because the
main thread did not have an AioContext in the thread-local variable,
but now it does have one.

Reported-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210609122234.544153-1-pbonzini@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Tested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
[eblake: tweak commit message per Vladimir's review]
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/block/aio.h   |  5 ++++-
 iothread.c            |  9 +--------
 stubs/iothread-lock.c |  2 +-
 stubs/iothread.c      |  8 --------
 tests/unit/iothread.c |  9 +--------
 util/async.c          | 20 ++++++++++++++++++++
 util/main-loop.c      |  1 +
 stubs/meson.build     |  1 -
 8 files changed, 28 insertions(+), 27 deletions(-)
 delete mode 100644 stubs/iothread.c

diff --git a/include/block/aio.h b/include/block/aio.h
index 5f342267d5ce..10fcae151540 100644
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
index 7f086387be9a..2c5ccd736733 100644
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

diff --git a/stubs/iothread-lock.c b/stubs/iothread-lock.c
index 2a6efad64a16..5b45b7fc8b90 100644
--- a/stubs/iothread-lock.c
+++ b/stubs/iothread-lock.c
@@ -3,7 +3,7 @@

 bool qemu_mutex_iothread_locked(void)
 {
-    return true;
+    return false;
 }

 void qemu_mutex_lock_iothread_impl(const char *file, int line)
diff --git a/stubs/iothread.c b/stubs/iothread.c
deleted file mode 100644
index 8cc9e28c5555..000000000000
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
diff --git a/tests/unit/iothread.c b/tests/unit/iothread.c
index afde12b4efb5..f9b0791084e7 100644
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
index 674dbefb7c24..5d9b7cc1eba2 100644
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
index d9c55df6f5e7..4ae5b23e991e 100644
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
diff --git a/stubs/meson.build b/stubs/meson.build
index 65c22c0568ce..4993797f0550 100644
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
-- 
2.31.1


