Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBB84369CB
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 19:54:57 +0200 (CEST)
Received: from localhost ([::1]:47828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdcHH-0005QQ-I3
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 13:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mdc4L-0003Uk-0s
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 13:41:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mdc4I-0005v4-FG
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 13:41:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634838089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jwfusEod3SGucplJpzy3MoGR0ErcwacZdRU5rUJ2290=;
 b=WHA8TDpWd7Ac7gt4nke5amm2TqKevgGHQJDl9zb+AGUBB0HzOjBHfbcBbFQfQOV9Ts1LA3
 2hqJOWyuJlM0qDiDAfc54yxLak6sSAmaDgF7BL8xGHGE1J7zpW4TpZERdL/c6Wyjq6aYrs
 GIxEiLe2V+JBhpqT4T/gGCt4BLet+JA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-BwZGDZr7MHyYy85VTm4A_g-1; Thu, 21 Oct 2021 13:41:26 -0400
X-MC-Unique: BwZGDZr7MHyYy85VTm4A_g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74BF4802682;
 Thu, 21 Oct 2021 17:41:24 +0000 (UTC)
Received: from localhost (unknown [10.39.195.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E936E17C58;
 Thu, 21 Oct 2021 17:41:17 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 1/1] coroutine: resize pool periodically instead of limiting
 size
Date: Thu, 21 Oct 2021 18:41:04 +0100
Message-Id: <20211021174104.52826-2-stefanha@redhat.com>
In-Reply-To: <20211021174104.52826-1-stefanha@redhat.com>
References: <20211021174104.52826-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Honghao Wang <wanghonghao@bytedance.com>,
 qemu-block@nongnu.org, Tingting Mao <timao@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>, Serge Guelton <sguelton@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It was reported that enabling SafeStack reduces IOPS significantly
(>25%) with the following fio benchmark on virtio-blk using a NVMe host
block device:

  # fio --rw=randrw --bs=4k --iodepth=64 --runtime=1m --direct=1 \
	--filename=/dev/vdb --name=job1 --ioengine=libaio --thread \
	--group_reporting --numjobs=16 --time_based \
        --output=/tmp/fio_result

Serge Guelton and I found that SafeStack is not really at fault, it just
increases the cost of coroutine creation. This fio workload exhausts the
coroutine pool and coroutine creation becomes a bottleneck. Previous
work by Honghao Wang also pointed to excessive coroutine creation.

Creating new coroutines is expensive due to allocating new stacks with
mmap(2) and mprotect(2). Currently there are thread-local and global
pools that recycle old Coroutine objects and their stacks but the
hardcoded size limit of 64 for thread-local pools and 128 for the global
pool is insufficient for the fio benchmark shown above.

This patch changes the coroutine pool algorithm to a simple thread-local
pool without a maximum size limit. Threads periodically shrink the pool
down to a size sufficient for the maximum observed number of coroutines.

The global pool is removed by this patch. It can help to hide the fact
that local pools are easily exhausted, but it's doesn't fix the root
cause. I don't think there is a need for a global pool because QEMU's
threads are long-lived, so let's keep things simple.

Performance of the above fio benchmark is as follows:

      Before   After
IOPS     60k     97k

Memory usage varies over time as needed by the workload:

            VSZ (KB)             RSS (KB)
Before fio  4705248              843128
During fio  5747668 (+ ~100 MB)  849280
After fio   4694996 (- ~100 MB)  845184

This confirms that coroutines are indeed being freed when no longer
needed.

Thanks to Serge Guelton for working on identifying the bottleneck with
me!

Reported-by: Tingting Mao <timao@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-id: 20210913153524.1190696-1-stefanha@redhat.com
Cc: Serge Guelton <sguelton@redhat.com>
Cc: Honghao Wang <wanghonghao@bytedance.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Daniele Buono <dbuono@linux.vnet.ibm.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

[Moved atexit notifier to coroutine_delete() after GitLab CI reported a
memory leak in tests/unit/test-aio-multithread because the Coroutine
object was created in the main thread but runs in an IOThread (where
it's also deleted).
--Stefan]
---
 include/qemu/coroutine-pool-timer.h | 36 ++++++++++++++++
 include/qemu/coroutine.h            |  7 ++++
 iothread.c                          |  6 +++
 util/coroutine-pool-timer.c         | 35 ++++++++++++++++
 util/main-loop.c                    |  5 +++
 util/qemu-coroutine.c               | 64 ++++++++++++++++-------------
 util/meson.build                    |  1 +
 7 files changed, 125 insertions(+), 29 deletions(-)
 create mode 100644 include/qemu/coroutine-pool-timer.h
 create mode 100644 util/coroutine-pool-timer.c

diff --git a/include/qemu/coroutine-pool-timer.h b/include/qemu/coroutine-pool-timer.h
new file mode 100644
index 0000000000..c0b520ce99
--- /dev/null
+++ b/include/qemu/coroutine-pool-timer.h
@@ -0,0 +1,36 @@
+/*
+ * QEMU coroutine pool timer
+ *
+ * Copyright (c) 2021 Red Hat, Inc.
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
+ * See the COPYING.LIB file in the top-level directory.
+ *
+ */
+#ifndef COROUTINE_POOL_TIMER_H
+#define COROUTINE_POOL_TIMER_H
+
+#include "qemu/osdep.h"
+#include "block/aio.h"
+
+/**
+ * A timer that periodically resizes this thread's coroutine pool, freeing
+ * memory if there are too many unused coroutines.
+ *
+ * Threads that make heavy use of coroutines should use this. Failure to resize
+ * the coroutine pool can lead to large amounts of memory sitting idle and
+ * never being used after the first time.
+ */
+typedef struct {
+    QEMUTimer *timer;
+} CoroutinePoolTimer;
+
+/* Call this before the thread runs the AioContext */
+void coroutine_pool_timer_init(CoroutinePoolTimer *pt, AioContext *ctx);
+
+/* Call this before the AioContext from the init function is destroyed */
+void coroutine_pool_timer_cleanup(CoroutinePoolTimer *pt);
+
+#endif /* COROUTINE_POOL_TIMER_H */
diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index 4829ff373d..fdb2955ff9 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -122,6 +122,13 @@ bool qemu_in_coroutine(void);
  */
 bool qemu_coroutine_entered(Coroutine *co);
 
+/**
+ * Optionally call this function periodically to shrink the thread-local pool
+ * down. Spiky workloads can create many coroutines and then never reach that
+ * level again. Shrinking the pool reclaims memory in this case.
+ */
+void qemu_coroutine_pool_periodic_resize(void);
+
 /**
  * Provides a mutex that can be used to synchronise coroutines
  */
diff --git a/iothread.c b/iothread.c
index 0f98af0f2a..f0a73705ec 100644
--- a/iothread.c
+++ b/iothread.c
@@ -23,6 +23,7 @@
 #include "qemu/error-report.h"
 #include "qemu/rcu.h"
 #include "qemu/main-loop.h"
+#include "qemu/coroutine-pool-timer.h"
 
 typedef ObjectClass IOThreadClass;
 
@@ -42,6 +43,7 @@ DECLARE_CLASS_CHECKERS(IOThreadClass, IOTHREAD,
 static void *iothread_run(void *opaque)
 {
     IOThread *iothread = opaque;
+    CoroutinePoolTimer co_pool_timer;
 
     rcu_register_thread();
     /*
@@ -53,6 +55,8 @@ static void *iothread_run(void *opaque)
     iothread->thread_id = qemu_get_thread_id();
     qemu_sem_post(&iothread->init_done_sem);
 
+    coroutine_pool_timer_init(&co_pool_timer, iothread->ctx);
+
     while (iothread->running) {
         /*
          * Note: from functional-wise the g_main_loop_run() below can
@@ -74,6 +78,8 @@ static void *iothread_run(void *opaque)
         }
     }
 
+    coroutine_pool_timer_cleanup(&co_pool_timer);
+
     g_main_context_pop_thread_default(iothread->worker_context);
     rcu_unregister_thread();
     return NULL;
diff --git a/util/coroutine-pool-timer.c b/util/coroutine-pool-timer.c
new file mode 100644
index 0000000000..36d3216718
--- /dev/null
+++ b/util/coroutine-pool-timer.c
@@ -0,0 +1,35 @@
+/*
+ * QEMU coroutine pool timer
+ *
+ * Copyright (c) 2021 Red Hat, Inc.
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
+ * See the COPYING.LIB file in the top-level directory.
+ *
+ */
+#include "qemu/coroutine-pool-timer.h"
+
+static void coroutine_pool_timer_cb(void *opaque)
+{
+    CoroutinePoolTimer *pt = opaque;
+    int64_t expiry_time_ns = qemu_clock_get_ns(QEMU_CLOCK_REALTIME) +
+                             15 * NANOSECONDS_PER_SECOND;
+
+    qemu_coroutine_pool_periodic_resize();
+    timer_mod(pt->timer, expiry_time_ns);
+}
+
+void coroutine_pool_timer_init(CoroutinePoolTimer *pt, AioContext *ctx)
+{
+    pt->timer = aio_timer_new(ctx, QEMU_CLOCK_REALTIME, SCALE_NS,
+                              coroutine_pool_timer_cb, pt);
+    coroutine_pool_timer_cb(pt);
+}
+
+void coroutine_pool_timer_cleanup(CoroutinePoolTimer *pt)
+{
+    timer_free(pt->timer);
+    pt->timer = NULL;
+}
diff --git a/util/main-loop.c b/util/main-loop.c
index 06b18b195c..23342e2215 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -33,6 +33,7 @@
 #include "qemu/error-report.h"
 #include "qemu/queue.h"
 #include "qemu/compiler.h"
+#include "qemu/coroutine-pool-timer.h"
 
 #ifndef _WIN32
 #include <sys/wait.h>
@@ -131,6 +132,7 @@ static int qemu_signal_init(Error **errp)
 
 static AioContext *qemu_aio_context;
 static QEMUBH *qemu_notify_bh;
+static CoroutinePoolTimer main_loop_co_pool_timer;
 
 static void notify_event_cb(void *opaque)
 {
@@ -181,6 +183,9 @@ int qemu_init_main_loop(Error **errp)
     g_source_set_name(src, "io-handler");
     g_source_attach(src, NULL);
     g_source_unref(src);
+
+    coroutine_pool_timer_init(&main_loop_co_pool_timer, qemu_aio_context);
+
     return 0;
 }
 
diff --git a/util/qemu-coroutine.c b/util/qemu-coroutine.c
index 38fb6d3084..d9dc8b38db 100644
--- a/util/qemu-coroutine.c
+++ b/util/qemu-coroutine.c
@@ -21,14 +21,19 @@
 #include "block/aio.h"
 
 enum {
-    POOL_BATCH_SIZE = 64,
+    /*
+     * qemu_coroutine_pool_periodic_resize() keeps at least this many
+     * coroutines around.
+     */
+    ALLOC_POOL_MIN = 64,
 };
 
+
 /** Free list to speed up creation */
-static QSLIST_HEAD(, Coroutine) release_pool = QSLIST_HEAD_INITIALIZER(pool);
-static unsigned int release_pool_size;
 static __thread QSLIST_HEAD(, Coroutine) alloc_pool = QSLIST_HEAD_INITIALIZER(pool);
 static __thread unsigned int alloc_pool_size;
+static __thread unsigned int num_coroutines;
+static __thread unsigned int max_coroutines_this_slice;
 static __thread Notifier coroutine_pool_cleanup_notifier;
 
 static void coroutine_pool_cleanup(Notifier *n, void *value)
@@ -48,27 +53,15 @@ Coroutine *qemu_coroutine_create(CoroutineEntry *entry, void *opaque)
 
     if (CONFIG_COROUTINE_POOL) {
         co = QSLIST_FIRST(&alloc_pool);
-        if (!co) {
-            if (release_pool_size > POOL_BATCH_SIZE) {
-                /* Slow path; a good place to register the destructor, too.  */
-                if (!coroutine_pool_cleanup_notifier.notify) {
-                    coroutine_pool_cleanup_notifier.notify = coroutine_pool_cleanup;
-                    qemu_thread_atexit_add(&coroutine_pool_cleanup_notifier);
-                }
-
-                /* This is not exact; there could be a little skew between
-                 * release_pool_size and the actual size of release_pool.  But
-                 * it is just a heuristic, it does not need to be perfect.
-                 */
-                alloc_pool_size = qatomic_xchg(&release_pool_size, 0);
-                QSLIST_MOVE_ATOMIC(&alloc_pool, &release_pool);
-                co = QSLIST_FIRST(&alloc_pool);
-            }
-        }
         if (co) {
             QSLIST_REMOVE_HEAD(&alloc_pool, pool_next);
             alloc_pool_size--;
         }
+
+        num_coroutines++;
+        if (num_coroutines > max_coroutines_this_slice) {
+            max_coroutines_this_slice = num_coroutines;
+        }
     }
 
     if (!co) {
@@ -86,21 +79,34 @@ static void coroutine_delete(Coroutine *co)
     co->caller = NULL;
 
     if (CONFIG_COROUTINE_POOL) {
-        if (release_pool_size < POOL_BATCH_SIZE * 2) {
-            QSLIST_INSERT_HEAD_ATOMIC(&release_pool, co, pool_next);
-            qatomic_inc(&release_pool_size);
-            return;
-        }
-        if (alloc_pool_size < POOL_BATCH_SIZE) {
-            QSLIST_INSERT_HEAD(&alloc_pool, co, pool_next);
-            alloc_pool_size++;
-            return;
+        if (!coroutine_pool_cleanup_notifier.notify) {
+            coroutine_pool_cleanup_notifier.notify = coroutine_pool_cleanup;
+            qemu_thread_atexit_add(&coroutine_pool_cleanup_notifier);
         }
+
+        num_coroutines--;
+        QSLIST_INSERT_HEAD(&alloc_pool, co, pool_next);
+        alloc_pool_size++;
+        return;
     }
 
     qemu_coroutine_delete(co);
 }
 
+void qemu_coroutine_pool_periodic_resize(void)
+{
+    unsigned pool_size_target =
+        MAX(ALLOC_POOL_MIN, max_coroutines_this_slice) - num_coroutines;
+    max_coroutines_this_slice = num_coroutines;
+
+    while (alloc_pool_size > pool_size_target) {
+        Coroutine *co = QSLIST_FIRST(&alloc_pool);
+        QSLIST_REMOVE_HEAD(&alloc_pool, pool_next);
+        qemu_coroutine_delete(co);
+        alloc_pool_size--;
+    }
+}
+
 void qemu_aio_coroutine_enter(AioContext *ctx, Coroutine *co)
 {
     QSIMPLEQ_HEAD(, Coroutine) pending = QSIMPLEQ_HEAD_INITIALIZER(pending);
diff --git a/util/meson.build b/util/meson.build
index 05b593055a..ac03e87955 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -65,6 +65,7 @@ if have_block
   util_ss.add(files('buffer.c'))
   util_ss.add(files('bufferiszero.c'))
   util_ss.add(files('coroutine-@0@.c'.format(config_host['CONFIG_COROUTINE_BACKEND'])))
+  util_ss.add(files('coroutine-pool-timer.c'))
   util_ss.add(files('hbitmap.c'))
   util_ss.add(files('hexdump.c'))
   util_ss.add(files('iova-tree.c'))
-- 
2.31.1


