Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F7D4D7F30
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 10:54:41 +0100 (CET)
Received: from localhost ([::1]:45192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nThPU-0007qa-UJ
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 05:54:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTh3s-00087E-5e; Mon, 14 Mar 2022 05:32:21 -0400
Received: from [2a00:1450:4864:20::329] (port=51729
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTh3p-000874-UT; Mon, 14 Mar 2022 05:32:19 -0400
Received: by mail-wm1-x329.google.com with SMTP id q20so8921478wmq.1;
 Mon, 14 Mar 2022 02:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5gKynCMYyRNRTzQclqK3xFMvugJIfkouCQrKO97fTI4=;
 b=WZiPNWaiGbpN+9Pp2TgnEssqPq6a9zrMCRdoeEOw6D/GWIpXapQSNwbYLceWPf4+8T
 YnxJnRoBYxG7C0Xq0c2au6houlv7kaM+3zocLKNgOOgpvLzd3ZIPxa0Q0ruL5ZgibVgQ
 jSe3Vl5tmgDMzqei/N9Nctab3m+/Sn+3H+sHfua/SueAqL4+JBRQ6w1fnBKm7mxz0wa/
 0orxS9hzqq4GocYZkdXWsQN2EPVtUwKAzBR9pjg+q816NM0+4SCSBDXQO6vDZx5gzkjz
 zE4AERdmQjxKz6RTOr3pf8gE/YRk9d/n7FlA8ctgcKOABfQzSq/QFHg75Fl8fxUvTthW
 FLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5gKynCMYyRNRTzQclqK3xFMvugJIfkouCQrKO97fTI4=;
 b=SQP9IZHOm4/xdSD8FYLGgUFywKpRHM3D4qeTly4HdDuEw74+eOzTNUS3QIhf9WWS9L
 1cd6CnLLJHO8IVu5tOgRi/LwqFnifCCJUAbs85eWx89dhdEs56G7n+HzesnYUODVDbbi
 BcL/pIbVWTlXEHYd6KkyYLQN+FMBl7gPZBzDmoBJVqfT+wkw9JQvzXUkrqqAFvfvjZ14
 zUmiB3bkwB9rc36DvrdzREZcsuopOCu9H52Bi/aYzNKyF+p2cAKMY7OHGHmpU4X3ky+x
 P/Ulrd84J50itM5ii40kmAsCzk++c2ysG4suvUYLXqr9AvmNIWrsCY9dJXOuXPz2coI8
 2NTw==
X-Gm-Message-State: AOAM531w+e4qeKELQTuBLr1tsW6a465vZWKYYnr5szREPvI0ywHH49rl
 GQ7tWq13DO3Qkz0Mbz+VcmzRKwW4Uog=
X-Google-Smtp-Source: ABdhPJyez6RJGmYyN90MhV/5NxgGRfoke0e31FjTx1+vLcIlyeMO9FdHgRBEKlZbZTgjBHJ3j45a1w==
X-Received: by 2002:a7b:c150:0:b0:389:95ee:4a20 with SMTP id
 z16-20020a7bc150000000b0038995ee4a20mr16829799wmi.145.1647250335942; 
 Mon, 14 Mar 2022 02:32:15 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l7-20020adfe9c7000000b001f06f8ec92dsm12707517wrn.30.2022.03.14.02.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 02:32:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH experiment 13/16] disable some code
Date: Mon, 14 Mar 2022 10:32:00 +0100
Message-Id: <20220314093203.1420404-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314093203.1420404-1-pbonzini@redhat.com>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: kwolf@redhat.com, hreitz@redhat.com, berrange@redhat.com,
 qemu-block@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Disable a lot of code that I can't be bothered to convert right now.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/coroutine.h    |  2 ++
 qapi/qmp-dispatch.c         |  2 ++
 tests/unit/meson.build      |  2 +-
 tests/unit/test-coroutine.c |  6 ++++++
 util/async.c                |  2 ++
 util/meson.build            | 10 +++++-----
 util/qemu-coroutine-lock.c  |  2 ++
 util/qemu-coroutine-sleep.c |  2 ++
 util/thread-pool.c          |  2 ++
 9 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index 428e97d946..ac9891502e 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -200,6 +200,7 @@ typedef struct CoQueue {
  */
 void qemu_co_queue_init(CoQueue *queue);
 
+#if 0
 /**
  * Adds the current coroutine to the CoQueue and transfers control to the
  * caller of the coroutine.  The mutex is unlocked during the wait and
@@ -208,6 +209,7 @@ void qemu_co_queue_init(CoQueue *queue);
 #define qemu_co_queue_wait(queue, lock) \
     qemu_co_queue_wait_impl(queue, QEMU_MAKE_CO_LOCKABLE(lock))
 void coroutine_fn qemu_co_queue_wait_impl(CoQueue *queue, QemuCoLockable *lock);
+#endif
 
 /**
  * Removes the next coroutine from the CoQueue, and wake it up.
diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
index d378bccac7..6a4633c133 100644
--- a/qapi/qmp-dispatch.c
+++ b/qapi/qmp-dispatch.c
@@ -235,7 +235,9 @@ QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
         };
         aio_bh_schedule_oneshot(qemu_get_aio_context(), do_qmp_dispatch_bh,
                                 &data);
+#if 0
         qemu_coroutine_yield();
+#endif
     }
     qobject_unref(args);
     if (err) {
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 96b295263e..4ca5fdb699 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -61,7 +61,7 @@ endif
 
 if have_block
   tests += {
-    'test-coroutine': [testblock],
+    'test-coroutine': [],
     'test-aio': [testblock],
     'test-aio-multithread': [testblock],
     'test-throttle': [testblock],
diff --git a/tests/unit/test-coroutine.c b/tests/unit/test-coroutine.c
index 82e22db070..c230c2fa6e 100644
--- a/tests/unit/test-coroutine.c
+++ b/tests/unit/test-coroutine.c
@@ -16,6 +16,7 @@
 #include "qemu/coroutine_int.h"
 #include "qemu/lockable.h"
 
+#if 0
 /*
  * Check that qemu_in_coroutine() works
  */
@@ -638,11 +639,13 @@ static void perf_cost(void)
                    duration, ops,
                    (unsigned long)(1000000000.0 * duration / maxcycles));
 }
+#endif
 
 int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
 
+#if 0
     /* This test assumes there is a freelist and marks freed coroutine memory
      * with a sentinel value.  If there is no freelist this would legitimately
      * crash, so skip it.
@@ -650,7 +653,9 @@ int main(int argc, char **argv)
     if (CONFIG_COROUTINE_POOL) {
         g_test_add_func("/basic/no-dangling-access", test_no_dangling_access);
     }
+#endif
 
+#if 0
     g_test_add_func("/basic/lifecycle", test_lifecycle);
     g_test_add_func("/basic/yield", test_yield);
     g_test_add_func("/basic/nesting", test_nesting);
@@ -669,5 +674,6 @@ int main(int argc, char **argv)
         g_test_add_func("/perf/function-call", perf_baseline);
         g_test_add_func("/perf/cost", perf_cost);
     }
+#endif
     return g_test_run();
 }
diff --git a/util/async.c b/util/async.c
index 2ea1172f3e..95a9e0f95f 100644
--- a/util/async.c
+++ b/util/async.c
@@ -595,6 +595,7 @@ void aio_co_schedule(AioContext *ctx, Coroutine *co)
     aio_context_unref(ctx);
 }
 
+#if 0
 typedef struct AioCoRescheduleSelf {
     Coroutine *co;
     AioContext *new_ctx;
@@ -624,6 +625,7 @@ void coroutine_fn aio_co_reschedule_self(AioContext *new_ctx)
         qemu_coroutine_yield();
     }
 }
+#endif
 
 void aio_co_wake(struct Coroutine *co)
 {
diff --git a/util/meson.build b/util/meson.build
index f6ee74ad0c..30949cd481 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -76,13 +76,13 @@ if have_block
   util_ss.add(files('lockcnt.c'))
   util_ss.add(files('main-loop.c'))
   util_ss.add(files('nvdimm-utils.c'))
-  util_ss.add(files('qemu-coroutine.c', 'qemu-coroutine-lock.c', 'qemu-coroutine-io.c'))
-  util_ss.add(when: 'CONFIG_LINUX', if_true: [
-    files('vhost-user-server.c'), vhost_user
-  ])
+  util_ss.add(files('qemu-coroutine.c', 'qemu-coroutine-lock.c')) # 'qemu-coroutine-io.c'
+# util_ss.add(when: 'CONFIG_LINUX', if_true: [
+#   files('vhost-user-server.c'), vhost_user
+# ])
   util_ss.add(files('block-helpers.c'))
   util_ss.add(files('qemu-coroutine-sleep.c'))
-  util_ss.add(files('qemu-co-shared-resource.c'))
+# util_ss.add(files('qemu-co-shared-resource.c'))
   util_ss.add(files('thread-pool.c', 'qemu-timer.c'))
   util_ss.add(files('readline.c'))
   util_ss.add(files('throttle.c'))
diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
index 3f12b53a31..d6c0565ba5 100644
--- a/util/qemu-coroutine-lock.c
+++ b/util/qemu-coroutine-lock.c
@@ -34,6 +34,7 @@
 #include "block/aio.h"
 #include "trace.h"
 
+#if 0
 void qemu_co_queue_init(CoQueue *queue)
 {
     QSIMPLEQ_INIT(&queue->entries);
@@ -465,3 +466,4 @@ void qemu_co_rwlock_upgrade(CoRwlock *lock)
         assert(lock->owners == -1);
     }
 }
+#endif
diff --git a/util/qemu-coroutine-sleep.c b/util/qemu-coroutine-sleep.c
index 571ab521ff..b5bfb4ad18 100644
--- a/util/qemu-coroutine-sleep.c
+++ b/util/qemu-coroutine-sleep.c
@@ -17,6 +17,7 @@
 #include "qemu/timer.h"
 #include "block/aio.h"
 
+#if 0
 static const char *qemu_co_sleep_ns__scheduled = "qemu_co_sleep_ns";
 
 void qemu_co_sleep_wake(QemuCoSleep *w)
@@ -78,3 +79,4 @@ void coroutine_fn qemu_co_sleep_ns_wakeable(QemuCoSleep *w,
     qemu_co_sleep(w);
     timer_del(&ts);
 }
+#endif
diff --git a/util/thread-pool.c b/util/thread-pool.c
index d763cea505..f621f69a91 100644
--- a/util/thread-pool.c
+++ b/util/thread-pool.c
@@ -266,6 +266,7 @@ BlockAIOCB *thread_pool_submit_aio(ThreadPool *pool,
     return &req->common;
 }
 
+#if 0
 typedef struct ThreadPoolCo {
     Coroutine *co;
     int ret;
@@ -288,6 +289,7 @@ int coroutine_fn thread_pool_submit_co(ThreadPool *pool, ThreadPoolFunc *func,
     qemu_coroutine_yield();
     return tpc.ret;
 }
+#endif
 
 void thread_pool_submit(ThreadPool *pool, ThreadPoolFunc *func, void *arg)
 {
-- 
2.35.1



