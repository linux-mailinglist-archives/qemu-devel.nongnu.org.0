Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E0D62C00E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 14:50:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovImp-0000dP-00; Wed, 16 Nov 2022 08:49:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovImm-0000cP-EI
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:49:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovImg-0007zF-Hw
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:49:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668606537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r+63Rvz1O2BCywQdimBwCPmeQIwX6qzesR//g/fyLJg=;
 b=SPpihc3PF58AvlVmOZxUf8QswTJuZUNfXB/XJaCrjLtvFgIzQUH8dNn3dXDlZcZbhs9sJQ
 ZWUVQNcWerNcPKrRO8NFci8Q3hiSu/NTfVstmS70YQbXmmxfIk+4c/tgEl8xNtZ6N3I8/J
 RYUE/1bDosJ9ZvdjBscXXQ2mbZIIYMg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-ZYHaDMSfMM2TShOgAMNDyA-1; Wed, 16 Nov 2022 08:48:53 -0500
X-MC-Unique: ZYHaDMSfMM2TShOgAMNDyA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D45B7185A78B;
 Wed, 16 Nov 2022 13:48:52 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 877054A9254;
 Wed, 16 Nov 2022 13:48:52 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 02/20] graph-lock: introduce BdrvGraphRWlock structure
Date: Wed, 16 Nov 2022 08:48:32 -0500
Message-Id: <20221116134850.3051419-3-eesposit@redhat.com>
In-Reply-To: <20221116134850.3051419-1-eesposit@redhat.com>
References: <20221116134850.3051419-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

Just a wrapper to simplify what is available to the struct AioContext.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/graph-lock.c         | 59 ++++++++++++++++++++++++++------------
 include/block/aio.h        | 12 ++++----
 include/block/graph-lock.h |  1 +
 3 files changed, 48 insertions(+), 24 deletions(-)

diff --git a/block/graph-lock.c b/block/graph-lock.c
index b608a89d7c..c3c6eeedad 100644
--- a/block/graph-lock.c
+++ b/block/graph-lock.c
@@ -44,12 +44,23 @@ static uint32_t orphaned_reader_count;
 /* Queue of readers waiting for the writer to finish */
 static CoQueue reader_queue;
 
+struct BdrvGraphRWlock {
+    /* How many readers are currently reading the graph. */
+    uint32_t reader_count;
+
+    /*
+     * List of BdrvGraphRWlock kept in graph-lock.c
+     * Protected by aio_context_list_lock
+     */
+    QTAILQ_ENTRY(BdrvGraphRWlock) next_aio;
+};
+
 /*
- * List of AioContext. This list ensures that each AioContext
+ * List of BdrvGraphRWlock. This list ensures that each BdrvGraphRWlock
  * can safely modify only its own counter, avoid reading/writing
  * others and thus improving performances by avoiding cacheline bounces.
  */
-static QTAILQ_HEAD(, AioContext) aio_context_list =
+static QTAILQ_HEAD(, BdrvGraphRWlock) aio_context_list =
     QTAILQ_HEAD_INITIALIZER(aio_context_list);
 
 static void __attribute__((__constructor__)) bdrv_init_graph_lock(void)
@@ -60,29 +71,31 @@ static void __attribute__((__constructor__)) bdrv_init_graph_lock(void)
 
 void register_aiocontext(AioContext *ctx)
 {
+    ctx->bdrv_graph = g_new0(BdrvGraphRWlock, 1);
     QEMU_LOCK_GUARD(&aio_context_list_lock);
-    assert(ctx->reader_count == 0);
-    QTAILQ_INSERT_TAIL(&aio_context_list, ctx, next_aio);
+    assert(ctx->bdrv_graph->reader_count == 0);
+    QTAILQ_INSERT_TAIL(&aio_context_list, ctx->bdrv_graph, next_aio);
 }
 
 void unregister_aiocontext(AioContext *ctx)
 {
     QEMU_LOCK_GUARD(&aio_context_list_lock);
-    orphaned_reader_count += ctx->reader_count;
-    QTAILQ_REMOVE(&aio_context_list, ctx, next_aio);
+    orphaned_reader_count += ctx->bdrv_graph->reader_count;
+    QTAILQ_REMOVE(&aio_context_list, ctx->bdrv_graph, next_aio);
+    g_free(ctx->bdrv_graph);
 }
 
 static uint32_t reader_count(void)
 {
-    AioContext *ctx;
+    BdrvGraphRWlock *brdv_graph;
     uint32_t rd;
 
     QEMU_LOCK_GUARD(&aio_context_list_lock);
 
     /* rd can temporarly be negative, but the total will *always* be >= 0 */
     rd = orphaned_reader_count;
-    QTAILQ_FOREACH(ctx, &aio_context_list, next_aio) {
-        rd += qatomic_read(&ctx->reader_count);
+    QTAILQ_FOREACH(brdv_graph, &aio_context_list, next_aio) {
+        rd += qatomic_read(&brdv_graph->reader_count);
     }
 
     /* shouldn't overflow unless there are 2^31 readers */
@@ -138,12 +151,17 @@ void bdrv_graph_wrunlock(void)
 
 void coroutine_fn bdrv_graph_co_rdlock(void)
 {
-    AioContext *aiocontext;
-    aiocontext = qemu_get_current_aio_context();
+    BdrvGraphRWlock *bdrv_graph;
+    bdrv_graph = qemu_get_current_aio_context()->bdrv_graph;
+
+    /* Do not lock if in main thread */
+    if (qemu_in_main_thread()) {
+        return;
+    }
 
     for (;;) {
-        qatomic_set(&aiocontext->reader_count,
-                    aiocontext->reader_count + 1);
+        qatomic_set(&bdrv_graph->reader_count,
+                    bdrv_graph->reader_count + 1);
         /* make sure writer sees reader_count before we check has_writer */
         smp_mb();
 
@@ -192,7 +210,7 @@ void coroutine_fn bdrv_graph_co_rdlock(void)
             }
 
             /* slow path where reader sleeps */
-            aiocontext->reader_count--;
+            bdrv_graph->reader_count--;
             aio_wait_kick();
             qemu_co_queue_wait(&reader_queue, &aio_context_list_lock);
         }
@@ -201,11 +219,16 @@ void coroutine_fn bdrv_graph_co_rdlock(void)
 
 void coroutine_fn bdrv_graph_co_rdunlock(void)
 {
-    AioContext *aiocontext;
-    aiocontext = qemu_get_current_aio_context();
+    BdrvGraphRWlock *bdrv_graph;
+    bdrv_graph = qemu_get_current_aio_context()->bdrv_graph;
+
+    /* Do not lock if in main thread */
+    if (qemu_in_main_thread()) {
+        return;
+    }
 
-    qatomic_store_release(&aiocontext->reader_count,
-                          aiocontext->reader_count - 1);
+    qatomic_store_release(&bdrv_graph->reader_count,
+                          bdrv_graph->reader_count - 1);
     /* make sure writer sees reader_count before we check has_writer */
     smp_mb();
 
diff --git a/include/block/aio.h b/include/block/aio.h
index 8e64f81d01..0f65a3cc9e 100644
--- a/include/block/aio.h
+++ b/include/block/aio.h
@@ -22,6 +22,7 @@
 #include "qemu/event_notifier.h"
 #include "qemu/thread.h"
 #include "qemu/timer.h"
+#include "block/graph-lock.h"
 
 typedef struct BlockAIOCB BlockAIOCB;
 typedef void BlockCompletionFunc(void *opaque, int ret);
@@ -127,14 +128,13 @@ struct AioContext {
     /* Used by AioContext users to protect from multi-threaded access.  */
     QemuRecMutex lock;
 
-    /* How many readers in this AioContext are currently reading the graph. */
-    uint32_t reader_count;
-
     /*
-     * List of AioContext kept in graph-lock.c
-     * Protected by aio_context_list_lock
+     * Keep track of readers and writers of the block layer graph.
+     * This is essential to avoid performing additions and removal
+     * of nodes and edges from block graph while some
+     * other thread is traversing it.
      */
-    QTAILQ_ENTRY(AioContext) next_aio;
+    BdrvGraphRWlock *bdrv_graph;
 
     /* The list of registered AIO handlers.  Protected by ctx->list_lock. */
     AioHandlerList aio_handlers;
diff --git a/include/block/graph-lock.h b/include/block/graph-lock.h
index f975312bb6..fc806aefa3 100644
--- a/include/block/graph-lock.h
+++ b/include/block/graph-lock.h
@@ -53,6 +53,7 @@
  * reader count. In that case we transfer the count to a global shared counter
  * so that the writer is always aware of all readers.
  */
+typedef struct BdrvGraphRWlock BdrvGraphRWlock;
 
 /*
  * register_aiocontext:
-- 
2.31.1


