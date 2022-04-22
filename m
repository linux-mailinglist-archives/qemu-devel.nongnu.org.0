Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CF950BD5B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 18:44:04 +0200 (CEST)
Received: from localhost ([::1]:43588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhwO3-0004tQ-IF
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 12:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nhwJQ-0007E5-TO
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:39:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nhwJO-0005QK-Ki
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:39:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650645554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PwDckFG4996ye/5tiedv3NZsWi1J83FZp/B8jlhafnU=;
 b=Un42fOFf3GXrPdCrvwiGhgP7gOXCFH10te3ekkIje2QUsA5+u6puWj2qucG4OthT/sEhUG
 87PDFbV6H4WzdVdon3a84fWGucvtXZG3Wf2z84PySZ6qCWJR7GEwW3Nea7P+9SvMoy6xYO
 Jpsg8Lh7q3gx6hILnY4fegib8aANyBU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-c3bQCoGLMgGXRjxiMK2H5Q-1; Fri, 22 Apr 2022 12:39:12 -0400
X-MC-Unique: c3bQCoGLMgGXRjxiMK2H5Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 m10-20020adfc58a000000b0020ac7ba78b8so788026wrg.14
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PwDckFG4996ye/5tiedv3NZsWi1J83FZp/B8jlhafnU=;
 b=PZCHPW5i9MBAFySyD7BpduVX2Sq6/zr/Vx+XE+D0eQ0XSWQE0PI4ooVgAdNyhm1wQy
 0oAEAVoICbNl9BYDaKkjAi+T4L8KnvOpunp6ZUOf9ighQ9FSaDR1/CXTUjH11OajKKM0
 MXt5X+OFhCaIcMekSNS5+6qmLxVKcpo0nSN+Z6od9NjnPnVSJaogtzNaSQz7DO3llgW9
 9RiTsT2sW8+rEnHtEOZ+tVW5zzMIZg7fYc4h54VWwXpF9MPUD0ZmmIPKRKkUAQq9+ogQ
 FyCLMATuhRX2J3y2wrfASBc5b1yhiPbcVJ2fNb9bCsxw72oIWqkReYyxF65KNE5sE1yK
 /8kw==
X-Gm-Message-State: AOAM531urm8M3VUu+Fh59KbK9nkIaut8rqG6RBGvxgmpDtLfgwbl89KF
 lKe3lPAdGSXl+hiKsPCBPH2kKYey8L6zytRa6Duw0/j9hahEAHkQY9WQrvJOS+ABcSkUTgeKxl4
 35uLzcmqXzvZowfs=
X-Received: by 2002:a05:6000:154c:b0:20a:c753:1878 with SMTP id
 12-20020a056000154c00b0020ac7531878mr4366042wry.308.1650645551480; 
 Fri, 22 Apr 2022 09:39:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyLWosnSk/EzYn0qAKw0EQIckl9/CtUBLUp2Ek4LNROupS7LVOrVxBh5SJcfYbYg1Z5wSbsQ==
X-Received: by 2002:a05:6000:154c:b0:20a:c753:1878 with SMTP id
 12-20020a056000154c00b0020ac7531878mr4366023wry.308.1650645551211; 
 Fri, 22 Apr 2022 09:39:11 -0700 (PDT)
Received: from vian.redhat.com ([2a0c:5a80:1306:2f00:cfcf:62cf:6f38:dd92])
 by smtp.gmail.com with ESMTPSA id
 f189-20020a1c38c6000000b0038ff83b9792sm4853481wma.43.2022.04.22.09.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:39:10 -0700 (PDT)
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: kwolf@redhat.com,
	stefanha@redhat.com,
	berrange@redhat.com
Subject: [PATCH v5 3/3] util/event-loop-base: Introduce options to set the
 thread pool size
Date: Fri, 22 Apr 2022 18:38:57 +0200
Message-Id: <20220422163857.703111-4-nsaenzju@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422163857.703111-1-nsaenzju@redhat.com>
References: <20220422163857.703111-1-nsaenzju@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsaenzju@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: fam@euphon.net, eduardo@habkost.net, qemu-block@nongnu.org,
 michael.roth@amd.com, mtosatti@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, hreitz@redhat.com, pbonzini@redhat.com,
 Nicolas Saenz Julienne <nsaenzju@redhat.com>, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The thread pool regulates itself: when idle, it kills threads until
empty, when in demand, it creates new threads until full. This behaviour
doesn't play well with latency sensitive workloads where the price of
creating a new thread is too high. For example, when paired with qemu's
'-mlock', or using safety features like SafeStack, creating a new thread
has been measured take multiple milliseconds.

In order to mitigate this let's introduce a new 'EventLoopBase'
property to set the thread pool size. The threads will be created during
the pool's initialization or upon updating the property's value, remain
available during its lifetime regardless of demand, and destroyed upon
freeing it. A properly characterized workload will then be able to
configure the pool to avoid any latency spikes.

Signed-off-by: Nicolas Saenz Julienne <nsaenzju@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---

Changes since v4:
 - Remove redundant versioning comments
 - Reword thread-pool-min description

Changes since v3:
 - Rework qom.json to avoid duplication

Changes since v2:
 - Don't wait when decreasing pool size
 - Fix qapi versioning

Changes since v1:
 - Add INT_MAX check
 - Have copy of thread pool sizes in AioContext to properly decouple
   both instances
 - More coherent variable naming
 - Handle case where max_threads decreases
 - Code comments

 event-loop-base.c                | 23 +++++++++++++
 include/block/aio.h              | 10 ++++++
 include/block/thread-pool.h      |  3 ++
 include/sysemu/event-loop-base.h |  4 +++
 iothread.c                       |  3 ++
 qapi/qom.json                    | 10 +++++-
 util/aio-posix.c                 |  1 +
 util/async.c                     | 20 ++++++++++++
 util/main-loop.c                 |  9 ++++++
 util/thread-pool.c               | 55 +++++++++++++++++++++++++++++---
 10 files changed, 133 insertions(+), 5 deletions(-)

diff --git a/event-loop-base.c b/event-loop-base.c
index e7f99a6ec8..d5be4dc6fc 100644
--- a/event-loop-base.c
+++ b/event-loop-base.c
@@ -14,6 +14,7 @@
 #include "qemu/osdep.h"
 #include "qom/object_interfaces.h"
 #include "qapi/error.h"
+#include "block/thread-pool.h"
 #include "sysemu/event-loop-base.h"
 
 typedef struct {
@@ -21,9 +22,22 @@ typedef struct {
     ptrdiff_t offset; /* field's byte offset in EventLoopBase struct */
 } EventLoopBaseParamInfo;
 
+static void event_loop_base_instance_init(Object *obj)
+{
+    EventLoopBase *base = EVENT_LOOP_BASE(obj);
+
+    base->thread_pool_max = THREAD_POOL_MAX_THREADS_DEFAULT;
+}
+
 static EventLoopBaseParamInfo aio_max_batch_info = {
     "aio-max-batch", offsetof(EventLoopBase, aio_max_batch),
 };
+static EventLoopBaseParamInfo thread_pool_min_info = {
+    "thread-pool-min", offsetof(EventLoopBase, thread_pool_min),
+};
+static EventLoopBaseParamInfo thread_pool_max_info = {
+    "thread-pool-max", offsetof(EventLoopBase, thread_pool_max),
+};
 
 static void event_loop_base_get_param(Object *obj, Visitor *v,
         const char *name, void *opaque, Error **errp)
@@ -95,12 +109,21 @@ static void event_loop_base_class_init(ObjectClass *klass, void *class_data)
                               event_loop_base_get_param,
                               event_loop_base_set_param,
                               NULL, &aio_max_batch_info);
+    object_class_property_add(klass, "thread-pool-min", "int",
+                              event_loop_base_get_param,
+                              event_loop_base_set_param,
+                              NULL, &thread_pool_min_info);
+    object_class_property_add(klass, "thread-pool-max", "int",
+                              event_loop_base_get_param,
+                              event_loop_base_set_param,
+                              NULL, &thread_pool_max_info);
 }
 
 static const TypeInfo event_loop_base_info = {
     .name = TYPE_EVENT_LOOP_BASE,
     .parent = TYPE_OBJECT,
     .instance_size = sizeof(EventLoopBase),
+    .instance_init = event_loop_base_instance_init,
     .class_size = sizeof(EventLoopBaseClass),
     .class_init = event_loop_base_class_init,
     .abstract = true,
diff --git a/include/block/aio.h b/include/block/aio.h
index 5634173b12..d128558f1d 100644
--- a/include/block/aio.h
+++ b/include/block/aio.h
@@ -192,6 +192,8 @@ struct AioContext {
     QSLIST_HEAD(, Coroutine) scheduled_coroutines;
     QEMUBH *co_schedule_bh;
 
+    int thread_pool_min;
+    int thread_pool_max;
     /* Thread pool for performing work and receiving completion callbacks.
      * Has its own locking.
      */
@@ -769,4 +771,12 @@ void aio_context_set_poll_params(AioContext *ctx, int64_t max_ns,
 void aio_context_set_aio_params(AioContext *ctx, int64_t max_batch,
                                 Error **errp);
 
+/**
+ * aio_context_set_thread_pool_params:
+ * @ctx: the aio context
+ * @min: min number of threads to have readily available in the thread pool
+ * @min: max number of threads the thread pool can contain
+ */
+void aio_context_set_thread_pool_params(AioContext *ctx, int64_t min,
+                                        int64_t max, Error **errp);
 #endif
diff --git a/include/block/thread-pool.h b/include/block/thread-pool.h
index 7dd7d730a0..2020bcc92d 100644
--- a/include/block/thread-pool.h
+++ b/include/block/thread-pool.h
@@ -20,6 +20,8 @@
 
 #include "block/block.h"
 
+#define THREAD_POOL_MAX_THREADS_DEFAULT         64
+
 typedef int ThreadPoolFunc(void *opaque);
 
 typedef struct ThreadPool ThreadPool;
@@ -33,5 +35,6 @@ BlockAIOCB *thread_pool_submit_aio(ThreadPool *pool,
 int coroutine_fn thread_pool_submit_co(ThreadPool *pool,
         ThreadPoolFunc *func, void *arg);
 void thread_pool_submit(ThreadPool *pool, ThreadPoolFunc *func, void *arg);
+void thread_pool_update_params(ThreadPool *pool, struct AioContext *ctx);
 
 #endif
diff --git a/include/sysemu/event-loop-base.h b/include/sysemu/event-loop-base.h
index fced4c9fea..2748bf6ae1 100644
--- a/include/sysemu/event-loop-base.h
+++ b/include/sysemu/event-loop-base.h
@@ -33,5 +33,9 @@ struct EventLoopBase {
 
     /* AioContext AIO engine parameters */
     int64_t aio_max_batch;
+
+    /* AioContext thread pool parameters */
+    int64_t thread_pool_min;
+    int64_t thread_pool_max;
 };
 #endif
diff --git a/iothread.c b/iothread.c
index 8fa2f3bfb8..529194a566 100644
--- a/iothread.c
+++ b/iothread.c
@@ -174,6 +174,9 @@ static void iothread_set_aio_context_params(EventLoopBase *base, Error **errp)
     aio_context_set_aio_params(iothread->ctx,
                                iothread->parent_obj.aio_max_batch,
                                errp);
+
+    aio_context_set_thread_pool_params(iothread->ctx, base->thread_pool_min,
+                                       base->thread_pool_max, errp);
 }
 
 
diff --git a/qapi/qom.json b/qapi/qom.json
index 51f3acaad8..f1e980d7b1 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -508,10 +508,18 @@
 #                 0 means that the engine will use its default.
 #                 (default: 0)
 #
+# @thread-pool-min: minimum number of threads reserved in the thread pool
+#                   (default:0)
+#
+# @thread-pool-max: maximum number of threads the thread pool can contain
+#                   (default:64)
+#
 # Since: 7.1
 ##
 { 'struct': 'EventLoopBaseProperties',
-  'data': { '*aio-max-batch': 'int' } }
+  'data': { '*aio-max-batch': 'int',
+            '*thread-pool-min': 'int',
+            '*thread-pool-max': 'int' } }
 
 ##
 # @IothreadProperties:
diff --git a/util/aio-posix.c b/util/aio-posix.c
index be0182a3c6..731f3826c0 100644
--- a/util/aio-posix.c
+++ b/util/aio-posix.c
@@ -15,6 +15,7 @@
 
 #include "qemu/osdep.h"
 #include "block/block.h"
+#include "block/thread-pool.h"
 #include "qemu/main-loop.h"
 #include "qemu/rcu.h"
 #include "qemu/rcu_queue.h"
diff --git a/util/async.c b/util/async.c
index 2ea1172f3e..554ba70cca 100644
--- a/util/async.c
+++ b/util/async.c
@@ -563,6 +563,9 @@ AioContext *aio_context_new(Error **errp)
 
     ctx->aio_max_batch = 0;
 
+    ctx->thread_pool_min = 0;
+    ctx->thread_pool_max = THREAD_POOL_MAX_THREADS_DEFAULT;
+
     return ctx;
 fail:
     g_source_destroy(&ctx->source);
@@ -696,3 +699,20 @@ void qemu_set_current_aio_context(AioContext *ctx)
     assert(!get_my_aiocontext());
     set_my_aiocontext(ctx);
 }
+
+void aio_context_set_thread_pool_params(AioContext *ctx, int64_t min,
+                                        int64_t max, Error **errp)
+{
+
+    if (min > max || !max || min > INT_MAX || max > INT_MAX) {
+        error_setg(errp, "bad thread-pool-min/thread-pool-max values");
+        return;
+    }
+
+    ctx->thread_pool_min = min;
+    ctx->thread_pool_max = max;
+
+    if (ctx->thread_pool) {
+        thread_pool_update_params(ctx->thread_pool, ctx);
+    }
+}
diff --git a/util/main-loop.c b/util/main-loop.c
index 5b13f456fa..a0f48186ab 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -30,6 +30,7 @@
 #include "sysemu/replay.h"
 #include "qemu/main-loop.h"
 #include "block/aio.h"
+#include "block/thread-pool.h"
 #include "qemu/error-report.h"
 #include "qemu/queue.h"
 #include "qemu/compiler.h"
@@ -187,12 +188,20 @@ int qemu_init_main_loop(Error **errp)
 
 static void main_loop_update_params(EventLoopBase *base, Error **errp)
 {
+    ERRP_GUARD();
+
     if (!qemu_aio_context) {
         error_setg(errp, "qemu aio context not ready");
         return;
     }
 
     aio_context_set_aio_params(qemu_aio_context, base->aio_max_batch, errp);
+    if (*errp) {
+        return;
+    }
+
+    aio_context_set_thread_pool_params(qemu_aio_context, base->thread_pool_min,
+                                       base->thread_pool_max, errp);
 }
 
 MainLoop *mloop;
diff --git a/util/thread-pool.c b/util/thread-pool.c
index d763cea505..196835b4d3 100644
--- a/util/thread-pool.c
+++ b/util/thread-pool.c
@@ -58,7 +58,6 @@ struct ThreadPool {
     QemuMutex lock;
     QemuCond worker_stopped;
     QemuSemaphore sem;
-    int max_threads;
     QEMUBH *new_thread_bh;
 
     /* The following variables are only accessed from one AioContext. */
@@ -71,8 +70,27 @@ struct ThreadPool {
     int new_threads;     /* backlog of threads we need to create */
     int pending_threads; /* threads created but not running yet */
     bool stopping;
+    int min_threads;
+    int max_threads;
 };
 
+static inline bool back_to_sleep(ThreadPool *pool, int ret)
+{
+    /*
+     * The semaphore timed out, we should exit the loop except when:
+     *  - There is work to do, we raced with the signal.
+     *  - The max threads threshold just changed, we raced with the signal.
+     *  - The thread pool forces a minimum number of readily available threads.
+     */
+    if (ret == -1 && (!QTAILQ_EMPTY(&pool->request_list) ||
+            pool->cur_threads > pool->max_threads ||
+            pool->cur_threads <= pool->min_threads)) {
+            return true;
+    }
+
+    return false;
+}
+
 static void *worker_thread(void *opaque)
 {
     ThreadPool *pool = opaque;
@@ -91,8 +109,9 @@ static void *worker_thread(void *opaque)
             ret = qemu_sem_timedwait(&pool->sem, 10000);
             qemu_mutex_lock(&pool->lock);
             pool->idle_threads--;
-        } while (ret == -1 && !QTAILQ_EMPTY(&pool->request_list));
-        if (ret == -1 || pool->stopping) {
+        } while (back_to_sleep(pool, ret));
+        if (ret == -1 || pool->stopping ||
+            pool->cur_threads > pool->max_threads) {
             break;
         }
 
@@ -294,6 +313,33 @@ void thread_pool_submit(ThreadPool *pool, ThreadPoolFunc *func, void *arg)
     thread_pool_submit_aio(pool, func, arg, NULL, NULL);
 }
 
+void thread_pool_update_params(ThreadPool *pool, AioContext *ctx)
+{
+    qemu_mutex_lock(&pool->lock);
+
+    pool->min_threads = ctx->thread_pool_min;
+    pool->max_threads = ctx->thread_pool_max;
+
+    /*
+     * We either have to:
+     *  - Increase the number available of threads until over the min_threads
+     *    threshold.
+     *  - Decrease the number of available threads until under the max_threads
+     *    threshold.
+     *  - Do nothing. The current number of threads fall in between the min and
+     *    max thresholds. We'll let the pool manage itself.
+     */
+    for (int i = pool->cur_threads; i < pool->min_threads; i++) {
+        spawn_thread(pool);
+    }
+
+    for (int i = pool->cur_threads; i > pool->max_threads; i--) {
+        qemu_sem_post(&pool->sem);
+    }
+
+    qemu_mutex_unlock(&pool->lock);
+}
+
 static void thread_pool_init_one(ThreadPool *pool, AioContext *ctx)
 {
     if (!ctx) {
@@ -306,11 +352,12 @@ static void thread_pool_init_one(ThreadPool *pool, AioContext *ctx)
     qemu_mutex_init(&pool->lock);
     qemu_cond_init(&pool->worker_stopped);
     qemu_sem_init(&pool->sem, 0);
-    pool->max_threads = 64;
     pool->new_thread_bh = aio_bh_new(ctx, spawn_thread_bh_fn, pool);
 
     QLIST_INIT(&pool->head);
     QTAILQ_INIT(&pool->request_list);
+
+    thread_pool_update_params(pool, ctx);
 }
 
 ThreadPool *thread_pool_new(AioContext *ctx)
-- 
2.35.1


