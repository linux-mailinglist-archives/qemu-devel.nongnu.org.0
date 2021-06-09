Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3F93A1444
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 14:24:23 +0200 (CEST)
Received: from localhost ([::1]:46942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqxFu-00027e-4F
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 08:24:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqxEG-0007wl-5T; Wed, 09 Jun 2021 08:22:40 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqxED-0003ea-TO; Wed, 09 Jun 2021 08:22:39 -0400
Received: by mail-wr1-x42e.google.com with SMTP id c9so16573831wrt.5;
 Wed, 09 Jun 2021 05:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iOo/RoxdKbJBRjB8/wwIU0o2mZG4eNOOjQ2zYGMG7RQ=;
 b=s0+tjSJrZs0fNUWhxSrJc+sdm22iDQcWDHxRtAYp01ngqm2S15Gqcuam5EZ/xS6bib
 ePdVI4x/64D2fhZ5P5On/eXbxkg4PWo1lWXPe33psI1WVYhxbcK9IptiPuWpx+iiy7Io
 rw/HRBHl3xBa+UCtVez0VdDRcmkicNQ7HAglNSsoeVg7Wgs0baHs4vWpOLRIdyh/5UPc
 kgwSi5NwaPP97CBnfbrHIl6jEI9PP3QbUxJPBgMViuo+aDBIkCAsaCkCQ4p2zKDJpciD
 +5qrKz3d2IFo5M6aWF5vSu8DNh8pOqtv2aYMbCYkZsq0I5pBvwr8wZqJZcIbzP/2029Q
 CATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=iOo/RoxdKbJBRjB8/wwIU0o2mZG4eNOOjQ2zYGMG7RQ=;
 b=QLn4THhWpwKSPHoC9UjoTciD0YzKtCFaW5CxyHC7rB41C1NTyq3s26LRcBKal7OuEf
 nAEmJBGViTKqhK5XGny5FVZ9DSjD//XXVCrWpxKY4MOhDkZTXT4z1YcIyvk8AH/XfgHb
 OfdIS5szFzleLNPjLRwakig2B6W80HzEs3OIvr1QJJ1htgJI0py6iEl5ViRsztYVt8eH
 TboFXQsBgEIamHeWEy4O/o80+TGhLoLMfufpomw8gwjbD7qsSEmUebj/HNbC9c+2DQ0E
 Qys7uhzNn1kX9/y2KfNNe6/vbPNlzRWsWU0ufvsj0Mge4cXa2QdSBwjqqbt7Z5fuAHYA
 1mXg==
X-Gm-Message-State: AOAM531J0sew+IHI+cUlDgofQmQCBjyww3xh3E/V5e7IdJ6ts05/+GRE
 aOexCJZ6V/+a5U5pAf2zw5+22dw8XbX4Vw==
X-Google-Smtp-Source: ABdhPJyTmqq+p3UCVnJ9d5oyh/dbFtPwZybMqlhhIdpBnSIKmkmc1NG2gzNrpR2fSesNGvK6zw45Ng==
X-Received: by 2002:adf:9031:: with SMTP id h46mr28753539wrh.125.1623241356012; 
 Wed, 09 Jun 2021 05:22:36 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 o18sm5783349wmq.23.2021.06.09.05.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 05:22:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] async: the main AioContext is only "current" if under the
 BQL
Date: Wed,  9 Jun 2021 14:22:34 +0200
Message-Id: <20210609122234.544153-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42e.google.com
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
Cc: eesposit@redhat.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org,
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

With this change, qemu_mutex_iothread_locked() must be changed from
true to false.  The previous value of true was needed because the
main thread did not have an AioContext in the thread-local variable,
but now it does have one.

Reported-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/block/aio.h   |  5 ++++-
 iothread.c            |  9 +--------
 stubs/iothread-lock.c |  2 +-
 stubs/iothread.c      |  8 --------
 stubs/meson.build     |  1 -
 tests/unit/iothread.c |  9 +--------
 util/async.c          | 20 ++++++++++++++++++++
 util/main-loop.c      |  1 +
 8 files changed, 28 insertions(+), 27 deletions(-)
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
 
diff --git a/stubs/iothread-lock.c b/stubs/iothread-lock.c
index 2a6efad64a..5b45b7fc8b 100644
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


