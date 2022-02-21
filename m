Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 072C14BDB3F
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 18:22:14 +0100 (CET)
Received: from localhost ([::1]:43376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMCO4-0004FV-EZ
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 12:22:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nMCEl-00072J-N0
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 12:12:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nMCEi-0005ur-6p
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 12:12:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645463538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PweICzkg7iqWmqMCYZ05Eafm0ti4bT50puqRffePbpQ=;
 b=ITKl3eLLRdhMFBg9MyTFmEpM0BjCdXmgWnT1PwLz050yavjXHAKi4E9kLbjpj4D6ddWq49
 /u/IwIin/V+OkeB7VgXBuH90zxfYox9E6W3dPWk+33J4dUdfiqOnq91TzrdJhdjl2armwr
 zHGXrGljdd7V69qENApmPsyzeacm9vg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-81-FIVoJTYnOMuAZbUqRdUz4g-1; Mon, 21 Feb 2022 12:12:17 -0500
X-MC-Unique: FIVoJTYnOMuAZbUqRdUz4g-1
Received: by mail-wm1-f70.google.com with SMTP id
 k36-20020a05600c1ca400b0037ddae32528so4590559wms.6
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 09:12:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PweICzkg7iqWmqMCYZ05Eafm0ti4bT50puqRffePbpQ=;
 b=57JPuIu+5FRe9VDwky0GrDz5uYumkDUhgMbrPb7Tsq9HiuqrQEvzxWF1o9dJUJmWhj
 A2qnz8mxo41FWbnF++MIHSqnnfysj7VtOtN8s8XzCkhFgj+figNFm8CBZD0WOuyylvks
 LI8U5Qt7OB7+Tma5md2aO7wMWQEANsBwBqk0uPZ07Q69kES3A44LnfVGkGB5iCHzep0a
 ApPfOn0JXAsby8YRBbff8YBbCPvuBlvVNHIyoZnVV1ckYxqpVzoJmICQ5h4iu3a/44RP
 ACoBGGyOKiNc3v51OYeGruVWzgggTEhvcAjz9bt5s4T8mQlDEygFcrJCsQ4iq2XckkV5
 gJzg==
X-Gm-Message-State: AOAM530EAPU1rndwxm+ukJQSLqMX5+sb2x3xIHlwEU/BjZL3vCRFxUxH
 UpoH0fu7Eqk64eU72kz3iDXBSfnQkczZIFHhB4pxjpsgxGd0F8WQfS8ZGRYbCiLjc1HqBqVV/wS
 GWNrQ+JuACTVjjyM=
X-Received: by 2002:a5d:6da8:0:b0:1e3:c0b:153d with SMTP id
 u8-20020a5d6da8000000b001e30c0b153dmr16126191wrs.658.1645463535989; 
 Mon, 21 Feb 2022 09:12:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhbhnVwOaHQnutTaVxYLtYGz1ur1KfKKg9cwOIGiAqgJupgdQBnlx7xQwoKOfJXEzkVZQPPQ==
X-Received: by 2002:a5d:6da8:0:b0:1e3:c0b:153d with SMTP id
 u8-20020a5d6da8000000b001e30c0b153dmr16126175wrs.658.1645463535720; 
 Mon, 21 Feb 2022 09:12:15 -0800 (PST)
Received: from vian.redhat.com ([2a0c:5a80:1204:1500:37e7:8150:d9df:36f])
 by smtp.gmail.com with ESMTPSA id a10sm24402149wri.74.2022.02.21.09.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 09:12:15 -0800 (PST)
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: kwolf@redhat.com,
	stefanha@redhat.com,
	berrange@redhat.com
Subject: [PATCH 3/3] util/event-loop: Introduce options to set the thread pool
 size
Date: Mon, 21 Feb 2022 18:08:45 +0100
Message-Id: <20220221170843.849084-4-nsaenzju@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221170843.849084-1-nsaenzju@redhat.com>
References: <20220221170843.849084-1-nsaenzju@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsaenzju@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=nsaenzju@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

In order to mitigate this let's introduce a new 'EventLoopBackend'
property to set the thread pool size. The threads will be created during
the pool's initialization, remain available during its lifetime
regardless of demand, and destroyed upon freeing it. A properly
characterized workload will then be able to configure the pool to avoid
any latency spike.

Signed-off-by: Nicolas Saenz Julienne <nsaenzju@redhat.com>
---
 include/block/aio.h | 11 +++++++++++
 qapi/qom.json       |  4 +++-
 util/async.c        |  3 +++
 util/event-loop.c   | 15 ++++++++++++++-
 util/event-loop.h   |  4 ++++
 util/main-loop.c    | 13 +++++++++++++
 util/thread-pool.c  | 41 +++++++++++++++++++++++++++++++++++++----
 7 files changed, 85 insertions(+), 6 deletions(-)

diff --git a/include/block/aio.h b/include/block/aio.h
index 5634173b12..331483d1d1 100644
--- a/include/block/aio.h
+++ b/include/block/aio.h
@@ -192,6 +192,8 @@ struct AioContext {
     QSLIST_HEAD(, Coroutine) scheduled_coroutines;
     QEMUBH *co_schedule_bh;
 
+    int pool_min;
+    int pool_max;
     /* Thread pool for performing work and receiving completion callbacks.
      * Has its own locking.
      */
@@ -769,4 +771,13 @@ void aio_context_set_poll_params(AioContext *ctx, int64_t max_ns,
 void aio_context_set_aio_params(AioContext *ctx, int64_t max_batch,
                                 Error **errp);
 
+/**
+ * aio_context_set_thread_pool_params:
+ * @ctx: the aio context
+ * @min: Thread pool's min size, 0 by default
+ * @max: Thread pool's max size, 64 by default
+ */
+void aio_context_set_thread_pool_params(AioContext *ctx, uint64_t min,
+                                        uint64_t max, Error **errp);
+
 #endif
diff --git a/qapi/qom.json b/qapi/qom.json
index e7730ef62f..79c141b6bf 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -526,7 +526,9 @@
   'data': { '*poll-max-ns': 'int',
             '*poll-grow': 'int',
             '*poll-shrink': 'int',
-            '*aio-max-batch': 'int' } }
+            '*aio-max-batch': 'int',
+            '*thread-pool-min': 'int',
+            '*thread-pool-max': 'int' } }
 
 ##
 # @MemoryBackendProperties:
diff --git a/util/async.c b/util/async.c
index 08d25feef5..58ef2e2ee5 100644
--- a/util/async.c
+++ b/util/async.c
@@ -562,6 +562,9 @@ AioContext *aio_context_new(Error **errp)
 
     ctx->aio_max_batch = 0;
 
+    ctx->pool_min = 0;
+    ctx->pool_max = 64;
+
     return ctx;
 fail:
     g_source_destroy(&ctx->source);
diff --git a/util/event-loop.c b/util/event-loop.c
index c0ddd61f20..f2532e7d31 100644
--- a/util/event-loop.c
+++ b/util/event-loop.c
@@ -51,6 +51,12 @@ static EventLoopBackendParamInfo poll_shrink_info = {
 static EventLoopBackendParamInfo aio_max_batch_info = {
     "aio-max-batch", offsetof(EventLoopBackend, aio_max_batch),
 };
+static EventLoopBackendParamInfo thread_pool_min_info = {
+    "thread-pool-min", offsetof(EventLoopBackend, thread_pool_min),
+};
+static EventLoopBackendParamInfo thread_pool_max_info = {
+    "thread-pool-max", offsetof(EventLoopBackend, thread_pool_max),
+};
 
 static void event_loop_backend_get_param(Object *obj, Visitor *v,
         const char *name, void *opaque, Error **errp)
@@ -84,7 +90,6 @@ static void event_loop_backend_set_param(Object *obj, Visitor *v,
     *field = value;
 
     return;
-
 }
 
 static void
@@ -132,6 +137,14 @@ static void event_loop_backend_class_init(ObjectClass *klass, void *class_data)
                               event_loop_backend_get_param,
                               event_loop_backend_set_param,
                               NULL, &aio_max_batch_info);
+    object_class_property_add(klass, "thread-pool-min", "int",
+                              event_loop_backend_get_param,
+                              event_loop_backend_set_param,
+                              NULL, &thread_pool_min_info);
+    object_class_property_add(klass, "thread-pool-max", "int",
+                              event_loop_backend_get_param,
+                              event_loop_backend_set_param,
+                              NULL, &thread_pool_max_info);
 }
 
 static const TypeInfo event_loop_backend_info = {
diff --git a/util/event-loop.h b/util/event-loop.h
index 34cf9309af..0f4255ee7b 100644
--- a/util/event-loop.h
+++ b/util/event-loop.h
@@ -37,5 +37,9 @@ struct EventLoopBackend {
 
     /* AioContext AIO engine parameters */
     int64_t aio_max_batch;
+
+    /* AioContext thread pool parameters */
+    int64_t thread_pool_min;
+    int64_t thread_pool_max;
 };
 #endif
diff --git a/util/main-loop.c b/util/main-loop.c
index 395fd9bd3e..266a9c72d8 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -190,12 +190,25 @@ MainLoop *mloop;
 static void main_loop_init(EventLoopBackend *bc, Error **errp)
 {
     MainLoop *m = MAIN_LOOP(bc);
+    Error *local_error = NULL;
+
+    if (!qemu_aio_context) {
+        error_setg(errp, "qemu aio context not ready");
+        return;
+    }
 
     if (mloop) {
         error_setg(errp, "only one main-loop instance allowed");
         return;
     }
 
+    aio_context_set_thread_pool_params(qemu_aio_context, bc->thread_pool_min,
+                                       bc->thread_pool_max, &local_error);
+    if (local_error) {
+        error_propagate(errp, local_error);
+        return;
+    }
+
     mloop = m;
     return;
 }
diff --git a/util/thread-pool.c b/util/thread-pool.c
index d763cea505..95c339cb00 100644
--- a/util/thread-pool.c
+++ b/util/thread-pool.c
@@ -21,6 +21,7 @@
 #include "trace.h"
 #include "block/thread-pool.h"
 #include "qemu/main-loop.h"
+#include "qapi/error.h"
 
 static void do_spawn_thread(ThreadPool *pool);
 
@@ -58,7 +59,6 @@ struct ThreadPool {
     QemuMutex lock;
     QemuCond worker_stopped;
     QemuSemaphore sem;
-    int max_threads;
     QEMUBH *new_thread_bh;
 
     /* The following variables are only accessed from one AioContext. */
@@ -76,6 +76,7 @@ struct ThreadPool {
 static void *worker_thread(void *opaque)
 {
     ThreadPool *pool = opaque;
+    AioContext *ctx = pool->ctx;
 
     qemu_mutex_lock(&pool->lock);
     pool->pending_threads--;
@@ -91,7 +92,8 @@ static void *worker_thread(void *opaque)
             ret = qemu_sem_timedwait(&pool->sem, 10000);
             qemu_mutex_lock(&pool->lock);
             pool->idle_threads--;
-        } while (ret == -1 && !QTAILQ_EMPTY(&pool->request_list));
+        } while (ret == -1 && (!QTAILQ_EMPTY(&pool->request_list) ||
+                 pool->cur_threads <= ctx->pool_min));
         if (ret == -1 || pool->stopping) {
             break;
         }
@@ -244,6 +246,7 @@ BlockAIOCB *thread_pool_submit_aio(ThreadPool *pool,
         ThreadPoolFunc *func, void *arg,
         BlockCompletionFunc *cb, void *opaque)
 {
+    AioContext *ctx = pool->ctx;
     ThreadPoolElement *req;
 
     req = qemu_aio_get(&thread_pool_aiocb_info, NULL, cb, opaque);
@@ -257,7 +260,7 @@ BlockAIOCB *thread_pool_submit_aio(ThreadPool *pool,
     trace_thread_pool_submit(pool, req, arg);
 
     qemu_mutex_lock(&pool->lock);
-    if (pool->idle_threads == 0 && pool->cur_threads < pool->max_threads) {
+    if (pool->idle_threads == 0 && pool->cur_threads < ctx->pool_max) {
         spawn_thread(pool);
     }
     QTAILQ_INSERT_TAIL(&pool->request_list, req, reqs);
@@ -306,11 +309,16 @@ static void thread_pool_init_one(ThreadPool *pool, AioContext *ctx)
     qemu_mutex_init(&pool->lock);
     qemu_cond_init(&pool->worker_stopped);
     qemu_sem_init(&pool->sem, 0);
-    pool->max_threads = 64;
     pool->new_thread_bh = aio_bh_new(ctx, spawn_thread_bh_fn, pool);
 
     QLIST_INIT(&pool->head);
     QTAILQ_INIT(&pool->request_list);
+
+    qemu_mutex_lock(&pool->lock);
+    for (int i = pool->cur_threads; i < ctx->pool_min; i++) {
+        spawn_thread(pool);
+    }
+    qemu_mutex_unlock(&pool->lock);
 }
 
 ThreadPool *thread_pool_new(AioContext *ctx)
@@ -350,3 +358,28 @@ void thread_pool_free(ThreadPool *pool)
     qemu_mutex_destroy(&pool->lock);
     g_free(pool);
 }
+
+void aio_context_set_thread_pool_params(AioContext *ctx, uint64_t min,
+                                        uint64_t max, Error **errp)
+{
+    ThreadPool *pool = ctx->thread_pool;
+
+    if (min > max || !max) {
+        error_setg(errp, "bad thread-pool-min/thread-pool-max values");
+        return;
+    }
+
+    if (pool) {
+        qemu_mutex_lock(&pool->lock);
+    }
+
+    ctx->pool_min = min;
+    ctx->pool_max = max;
+
+    if (pool) {
+        for (int i = pool->cur_threads; i < ctx->pool_min; i++) {
+            spawn_thread(pool);
+        }
+        qemu_mutex_unlock(&pool->lock);
+    }
+}
-- 
2.35.1


