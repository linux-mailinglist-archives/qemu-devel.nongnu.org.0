Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A56E64CBE4
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 15:14:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5S6D-0006N9-S9; Wed, 14 Dec 2022 08:47:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S5C-0004v6-NX
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:46:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p5S5A-0003lF-Te
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 08:46:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671025560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PcZY0YEij9vXG3pq/kdynWi4bBLP6h43ygUupcJ4V8Q=;
 b=iIL1DTby9TdNL6t0p4ujkPCQD1SYGymPfeJ+ix6jaIxqxbx/jOBASy7yxaQ09MuEvNU5yd
 mv4TqNmBNJMfgO/2RIQwwoNZ01QvNlvez29308kwZ5VYjUcG5UKeNzoTYUh7LZqQxkKMIb
 P4zEH9KZmMOYFuOWrJ/A74RnCVo6Aqc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-WeML844SOGaZ1RFELZ3mUA-1; Wed, 14 Dec 2022 08:45:55 -0500
X-MC-Unique: WeML844SOGaZ1RFELZ3mUA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32F693C1068A;
 Wed, 14 Dec 2022 13:45:55 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72B9414171BE;
 Wed, 14 Dec 2022 13:45:54 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 47/51] graph-lock: TSA annotations for lock/unlock functions
Date: Wed, 14 Dec 2022 14:44:49 +0100
Message-Id: <20221214134453.31665-48-kwolf@redhat.com>
In-Reply-To: <20221214134453.31665-1-kwolf@redhat.com>
References: <20221214134453.31665-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20221207131838.239125-15-kwolf@redhat.com>
Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/graph-lock.h | 80 +++++++++++++++++++++++++++++++++-----
 block/graph-lock.c         |  3 ++
 2 files changed, 73 insertions(+), 10 deletions(-)

diff --git a/include/block/graph-lock.h b/include/block/graph-lock.h
index 85e8a53b73..50b7e7b1b6 100644
--- a/include/block/graph-lock.h
+++ b/include/block/graph-lock.h
@@ -21,6 +21,7 @@
 #define GRAPH_LOCK_H
 
 #include "qemu/osdep.h"
+#include "qemu/clang-tsa.h"
 
 #include "qemu/coroutine.h"
 
@@ -57,6 +58,35 @@
  */
 typedef struct BdrvGraphRWlock BdrvGraphRWlock;
 
+/* Dummy lock object to use for Thread Safety Analysis (TSA) */
+typedef struct TSA_CAPABILITY("graph-lock") BdrvGraphLock {
+} BdrvGraphLock;
+
+extern BdrvGraphLock graph_lock;
+
+/*
+ * clang doesn't check consistency in locking annotations between forward
+ * declarations and the function definition. Having the annotation on the
+ * definition, but not the declaration in a header file, may give the reader
+ * a false sense of security because the condition actually remains unchecked
+ * for callers in other source files.
+ *
+ * Therefore, as a convention, for public functions, GRAPH_RDLOCK and
+ * GRAPH_WRLOCK annotations should be present only in the header file.
+ */
+#define GRAPH_WRLOCK TSA_REQUIRES(graph_lock)
+#define GRAPH_RDLOCK TSA_REQUIRES_SHARED(graph_lock)
+
+/*
+ * TSA annotations are not part of function types, so checks are defeated when
+ * using a function pointer. As a workaround, annotate function pointers with
+ * this macro that will require that the lock is at least taken while reading
+ * the pointer. In most cases this is equivalent to actually protecting the
+ * function call.
+ */
+#define GRAPH_RDLOCK_PTR TSA_GUARDED_BY(graph_lock)
+#define GRAPH_WRLOCK_PTR TSA_GUARDED_BY(graph_lock)
+
 /*
  * register_aiocontext:
  * Add AioContext @ctx to the list of AioContext.
@@ -85,14 +115,14 @@ void unregister_aiocontext(AioContext *ctx);
  * This function polls. Callers must not hold the lock of any AioContext other
  * than the current one.
  */
-void bdrv_graph_wrlock(void);
+void bdrv_graph_wrlock(void) TSA_ACQUIRE(graph_lock) TSA_NO_TSA;
 
 /*
  * bdrv_graph_wrunlock:
  * Write finished, reset global has_writer to 0 and restart
  * all readers that are waiting.
  */
-void bdrv_graph_wrunlock(void);
+void bdrv_graph_wrunlock(void) TSA_RELEASE(graph_lock) TSA_NO_TSA;
 
 /*
  * bdrv_graph_co_rdlock:
@@ -116,7 +146,8 @@ void bdrv_graph_wrunlock(void);
  * loop) to take it and wait that the coroutine ends, so that
  * we always signal that a reader is running.
  */
-void coroutine_fn bdrv_graph_co_rdlock(void);
+void coroutine_fn TSA_ACQUIRE_SHARED(graph_lock) TSA_NO_TSA
+bdrv_graph_co_rdlock(void);
 
 /*
  * bdrv_graph_rdunlock:
@@ -124,7 +155,8 @@ void coroutine_fn bdrv_graph_co_rdlock(void);
  * If the writer is waiting for reads to finish (has_writer == 1), signal
  * the writer that we are done via aio_wait_kick() to let it continue.
  */
-void coroutine_fn bdrv_graph_co_rdunlock(void);
+void coroutine_fn TSA_RELEASE_SHARED(graph_lock) TSA_NO_TSA
+bdrv_graph_co_rdunlock(void);
 
 /*
  * bdrv_graph_rd{un}lock_main_loop:
@@ -132,8 +164,11 @@ void coroutine_fn bdrv_graph_co_rdunlock(void);
  * in the main loop. It is just asserting that we are not
  * in a coroutine and in GLOBAL_STATE_CODE.
  */
-void bdrv_graph_rdlock_main_loop(void);
-void bdrv_graph_rdunlock_main_loop(void);
+void TSA_ACQUIRE_SHARED(graph_lock) TSA_NO_TSA
+bdrv_graph_rdlock_main_loop(void);
+
+void TSA_RELEASE_SHARED(graph_lock) TSA_NO_TSA
+bdrv_graph_rdunlock_main_loop(void);
 
 /*
  * assert_bdrv_graph_readable:
@@ -150,6 +185,17 @@ void assert_bdrv_graph_readable(void);
  */
 void assert_bdrv_graph_writable(void);
 
+/*
+ * Calling this function tells TSA that we know that the lock is effectively
+ * taken even though we cannot prove it (yet) with GRAPH_RDLOCK. This can be
+ * useful in intermediate stages of a conversion to using the GRAPH_RDLOCK
+ * macro.
+ */
+static inline void TSA_ASSERT_SHARED(graph_lock) TSA_NO_TSA
+assume_graph_lock(void)
+{
+}
+
 typedef struct GraphLockable { } GraphLockable;
 
 /*
@@ -159,13 +205,21 @@ typedef struct GraphLockable { } GraphLockable;
  */
 #define GML_OBJ_() (&(GraphLockable) { })
 
-static inline GraphLockable *graph_lockable_auto_lock(GraphLockable *x)
+/*
+ * This is not marked as TSA_ACQUIRE() because TSA doesn't understand the
+ * cleanup attribute and would therefore complain that the graph is never
+ * unlocked. TSA_ASSERT() makes sure that the following calls know that we
+ * hold the lock while unlocking is left unchecked.
+ */
+static inline GraphLockable * TSA_ASSERT(graph_lock) TSA_NO_TSA
+graph_lockable_auto_lock(GraphLockable *x)
 {
     bdrv_graph_co_rdlock();
     return x;
 }
 
-static inline void graph_lockable_auto_unlock(GraphLockable *x)
+static inline void TSA_NO_TSA
+graph_lockable_auto_unlock(GraphLockable *x)
 {
     bdrv_graph_co_rdunlock();
 }
@@ -195,14 +249,20 @@ typedef struct GraphLockableMainloop { } GraphLockableMainloop;
  */
 #define GMLML_OBJ_() (&(GraphLockableMainloop) { })
 
-static inline GraphLockableMainloop *
+/*
+ * This is not marked as TSA_ACQUIRE() because TSA doesn't understand the
+ * cleanup attribute and would therefore complain that the graph is never
+ * unlocked. TSA_ASSERT() makes sure that the following calls know that we
+ * hold the lock while unlocking is left unchecked.
+ */
+static inline GraphLockableMainloop * TSA_ASSERT(graph_lock) TSA_NO_TSA
 graph_lockable_auto_lock_mainloop(GraphLockableMainloop *x)
 {
     bdrv_graph_rdlock_main_loop();
     return x;
 }
 
-static inline void
+static inline void TSA_NO_TSA
 graph_lockable_auto_unlock_mainloop(GraphLockableMainloop *x)
 {
     bdrv_graph_rdunlock_main_loop();
diff --git a/block/graph-lock.c b/block/graph-lock.c
index c4d9d2c274..454c31e691 100644
--- a/block/graph-lock.c
+++ b/block/graph-lock.c
@@ -24,6 +24,9 @@
 #include "block/block.h"
 #include "block/block_int.h"
 
+/* Dummy lock object to use for Thread Safety Analysis (TSA) */
+BdrvGraphLock graph_lock;
+
 /* Protects the list of aiocontext and orphaned_reader_count */
 static QemuMutex aio_context_list_lock;
 
-- 
2.38.1


