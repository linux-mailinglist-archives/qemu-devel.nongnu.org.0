Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB76645AB0
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 14:21:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2uKj-0007Z7-E6; Wed, 07 Dec 2022 08:19:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p2uKh-0007Yb-NC
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:19:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p2uKe-0006Q3-Su
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:19:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670419168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xVRqMNpDTCMDMyYFP3Bq9+6icisO8Ubp5BTmTOVNnrc=;
 b=OoBZGIebMZmEUFzY8H4XV5Yz6W5DCqjz6QmXV7O+/sr2bvC1jrzN7NIcpVYUXZEceKR2iL
 8ONXs4ELxzuFpuUecsj6eKILUyafKsDXvLyiiJzQa7+V8m30cVFwIBThnLGhVkCD21fzbT
 zh2+/lyjLdnHFOiMWlrCmErY7AQ7fXk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-210-z2Lvfri2PDGu9c9BlMK65w-1; Wed, 07 Dec 2022 08:19:25 -0500
X-MC-Unique: z2Lvfri2PDGu9c9BlMK65w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5740811E7A;
 Wed,  7 Dec 2022 13:19:24 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4A801121314;
 Wed,  7 Dec 2022 13:19:23 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, vsementsov@yandex-team.ru, qemu-devel@nongnu.org
Subject: [PATCH 02/18] graph-lock: Introduce a lock to protect block graph
 operations
Date: Wed,  7 Dec 2022 14:18:22 +0100
Message-Id: <20221207131838.239125-3-kwolf@redhat.com>
In-Reply-To: <20221207131838.239125-1-kwolf@redhat.com>
References: <20221207131838.239125-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

From: Paolo Bonzini <pbonzini@redhat.com>

Block layer graph operations are always run under BQL in the main loop.
This is proved by the assertion qemu_in_main_thread() and its wrapper
macro GLOBAL_STATE_CODE.

However, there are also concurrent coroutines running in other iothreads
that always try to traverse the graph. Currently this is protected
(among various other things) by the AioContext lock, but once this is
removed, we need to make sure that reads do not happen while modifying
the graph.

We distinguish between writer (main loop, under BQL) that modifies the
graph, and readers (all other coroutines running in various AioContext),
that go through the graph edges, reading ->parents and->children.

The writer (main loop) has "exclusive" access, so it first waits for any
current read to finish, and then prevents incoming ones from entering
while it has the exclusive access.

The readers (coroutines in multiple AioContext) are free to access the
graph as long the writer is not modifying the graph. In case it is, they
go in a CoQueue and sleep until the writer is done.

If a coroutine changes AioContext, the counter in the original and new
AioContext are left intact, since the writer does not care where the
reader is, but only if there is one.

As a result, some AioContexts might have a negative reader count, to
balance the positive count of the AioContext that took the lock.  This
also means that when an AioContext is deleted it may have a nonzero
reader count. In that case we transfer the count to a global shared
counter so that the writer is always aware of all readers.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/aio.h        |   9 ++
 include/block/block_int.h  |   1 +
 include/block/graph-lock.h | 139 ++++++++++++++++++++
 block/graph-lock.c         | 261 +++++++++++++++++++++++++++++++++++++
 block/meson.build          |   1 +
 5 files changed, 411 insertions(+)
 create mode 100644 include/block/graph-lock.h
 create mode 100644 block/graph-lock.c

diff --git a/include/block/aio.h b/include/block/aio.h
index d128558f1d..0f65a3cc9e 100644
--- a/include/block/aio.h
+++ b/include/block/aio.h
@@ -22,6 +22,7 @@
 #include "qemu/event_notifier.h"
 #include "qemu/thread.h"
 #include "qemu/timer.h"
+#include "block/graph-lock.h"
 
 typedef struct BlockAIOCB BlockAIOCB;
 typedef void BlockCompletionFunc(void *opaque, int ret);
@@ -127,6 +128,14 @@ struct AioContext {
     /* Used by AioContext users to protect from multi-threaded access.  */
     QemuRecMutex lock;
 
+    /*
+     * Keep track of readers and writers of the block layer graph.
+     * This is essential to avoid performing additions and removal
+     * of nodes and edges from block graph while some
+     * other thread is traversing it.
+     */
+    BdrvGraphRWlock *bdrv_graph;
+
     /* The list of registered AIO handlers.  Protected by ctx->list_lock. */
     AioHandlerList aio_handlers;
 
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 7d50b6bbd1..b35b0138ed 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -26,6 +26,7 @@
 
 #include "block_int-global-state.h"
 #include "block_int-io.h"
+#include "block/graph-lock.h"
 
 /* DO NOT ADD ANYTHING IN HERE. USE ONE OF THE HEADERS INCLUDED ABOVE */
 
diff --git a/include/block/graph-lock.h b/include/block/graph-lock.h
new file mode 100644
index 0000000000..82edb62cfa
--- /dev/null
+++ b/include/block/graph-lock.h
@@ -0,0 +1,139 @@
+/*
+ * Graph lock: rwlock to protect block layer graph manipulations (add/remove
+ * edges and nodes)
+ *
+ *  Copyright (c) 2022 Red Hat
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef GRAPH_LOCK_H
+#define GRAPH_LOCK_H
+
+#include "qemu/osdep.h"
+
+#include "qemu/coroutine.h"
+
+/**
+ * Graph Lock API
+ * This API provides a rwlock used to protect block layer
+ * graph modifications like edge (BdrvChild) and node (BlockDriverState)
+ * addition and removal.
+ * Currently we have 1 writer only, the Main loop, and many
+ * readers, mostly coroutines running in other AioContext thus other threads.
+ *
+ * We distinguish between writer (main loop, under BQL) that modifies the
+ * graph, and readers (all other coroutines running in various AioContext),
+ * that go through the graph edges, reading
+ * BlockDriverState ->parents and->children.
+ *
+ * The writer (main loop)  has an "exclusive" access, so it first waits for
+ * current read to finish, and then prevents incoming ones from
+ * entering while it has the exclusive access.
+ *
+ * The readers (coroutines in multiple AioContext) are free to
+ * access the graph as long the writer is not modifying the graph.
+ * In case it is, they go in a CoQueue and sleep until the writer
+ * is done.
+ *
+ * If a coroutine changes AioContext, the counter in the original and new
+ * AioContext are left intact, since the writer does not care where is the
+ * reader, but only if there is one.
+ * As a result, some AioContexts might have a negative reader count, to
+ * balance the positive count of the AioContext that took the lock.
+ * This also means that when an AioContext is deleted it may have a nonzero
+ * reader count. In that case we transfer the count to a global shared counter
+ * so that the writer is always aware of all readers.
+ */
+typedef struct BdrvGraphRWlock BdrvGraphRWlock;
+
+/*
+ * register_aiocontext:
+ * Add AioContext @ctx to the list of AioContext.
+ * This list is used to obtain the total number of readers
+ * currently running the graph.
+ */
+void register_aiocontext(AioContext *ctx);
+
+/*
+ * unregister_aiocontext:
+ * Removes AioContext @ctx to the list of AioContext.
+ */
+void unregister_aiocontext(AioContext *ctx);
+
+/*
+ * bdrv_graph_wrlock:
+ * Start an exclusive write operation to modify the graph. This means we are
+ * adding or removing an edge or a node in the block layer graph. Nobody else
+ * is allowed to access the graph.
+ *
+ * Must only be called from outside bdrv_graph_co_rdlock.
+ *
+ * The wrlock can only be taken from the main loop, with BQL held, as only the
+ * main loop is allowed to modify the graph.
+ *
+ * This function polls. Callers must not hold the lock of any AioContext other
+ * than the current one.
+ */
+void bdrv_graph_wrlock(void);
+
+/*
+ * bdrv_graph_wrunlock:
+ * Write finished, reset global has_writer to 0 and restart
+ * all readers that are waiting.
+ */
+void bdrv_graph_wrunlock(void);
+
+/*
+ * bdrv_graph_co_rdlock:
+ * Read the bs graph. This usually means traversing all nodes in
+ * the graph, therefore it can't happen while another thread is
+ * modifying it.
+ * Increases the reader counter of the current aiocontext,
+ * and if has_writer is set, it means that the writer is modifying
+ * the graph, therefore wait in a coroutine queue.
+ * The writer will then wake this coroutine once it is done.
+ *
+ * This lock should be taken from Iothreads (IO_CODE() class of functions)
+ * because it signals the writer that there are some
+ * readers currently running, or waits until the current
+ * write is finished before continuing.
+ * Calling this function from the Main Loop with BQL held
+ * is not necessary, since the Main Loop itself is the only
+ * writer, thus won't be able to read and write at the same time.
+ * The only exception to that is when we can't take the lock in the
+ * function/coroutine itself, and need to delegate the caller (usually main
+ * loop) to take it and wait that the coroutine ends, so that
+ * we always signal that a reader is running.
+ */
+void coroutine_fn bdrv_graph_co_rdlock(void);
+
+/*
+ * bdrv_graph_rdunlock:
+ * Read terminated, decrease the count of readers in the current aiocontext.
+ * If the writer is waiting for reads to finish (has_writer == 1), signal
+ * the writer that we are done via aio_wait_kick() to let it continue.
+ */
+void coroutine_fn bdrv_graph_co_rdunlock(void);
+
+/*
+ * bdrv_graph_rd{un}lock_main_loop:
+ * Just a placeholder to mark where the graph rdlock should be taken
+ * in the main loop. It is just asserting that we are not
+ * in a coroutine and in GLOBAL_STATE_CODE.
+ */
+void bdrv_graph_rdlock_main_loop(void);
+void bdrv_graph_rdunlock_main_loop(void);
+
+#endif /* GRAPH_LOCK_H */
+
diff --git a/block/graph-lock.c b/block/graph-lock.c
new file mode 100644
index 0000000000..e033c6d9ac
--- /dev/null
+++ b/block/graph-lock.c
@@ -0,0 +1,261 @@
+/*
+ * Graph lock: rwlock to protect block layer graph manipulations (add/remove
+ * edges and nodes)
+ *
+ *  Copyright (c) 2022 Red Hat
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/main-loop.h"
+#include "block/graph-lock.h"
+#include "block/block.h"
+#include "block/block_int.h"
+
+/* Protects the list of aiocontext and orphaned_reader_count */
+static QemuMutex aio_context_list_lock;
+
+/* Written and read with atomic operations. */
+static int has_writer;
+
+/*
+ * A reader coroutine could move from an AioContext to another.
+ * If this happens, there is no problem from the point of view of
+ * counters. The problem is that the total count becomes
+ * unbalanced if one of the two AioContexts gets deleted.
+ * The count of readers must remain correct, so the AioContext's
+ * balance is transferred to this glboal variable.
+ * Protected by aio_context_list_lock.
+ */
+static uint32_t orphaned_reader_count;
+
+/* Queue of readers waiting for the writer to finish */
+static CoQueue reader_queue;
+
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
+/*
+ * List of BdrvGraphRWlock. This list ensures that each BdrvGraphRWlock
+ * can safely modify only its own counter, avoid reading/writing
+ * others and thus improving performances by avoiding cacheline bounces.
+ */
+static QTAILQ_HEAD(, BdrvGraphRWlock) aio_context_list =
+    QTAILQ_HEAD_INITIALIZER(aio_context_list);
+
+static void __attribute__((__constructor__)) bdrv_init_graph_lock(void)
+{
+    qemu_mutex_init(&aio_context_list_lock);
+    qemu_co_queue_init(&reader_queue);
+}
+
+void register_aiocontext(AioContext *ctx)
+{
+    ctx->bdrv_graph = g_new0(BdrvGraphRWlock, 1);
+    QEMU_LOCK_GUARD(&aio_context_list_lock);
+    assert(ctx->bdrv_graph->reader_count == 0);
+    QTAILQ_INSERT_TAIL(&aio_context_list, ctx->bdrv_graph, next_aio);
+}
+
+void unregister_aiocontext(AioContext *ctx)
+{
+    QEMU_LOCK_GUARD(&aio_context_list_lock);
+    orphaned_reader_count += ctx->bdrv_graph->reader_count;
+    QTAILQ_REMOVE(&aio_context_list, ctx->bdrv_graph, next_aio);
+    g_free(ctx->bdrv_graph);
+}
+
+static uint32_t reader_count(void)
+{
+    BdrvGraphRWlock *brdv_graph;
+    uint32_t rd;
+
+    QEMU_LOCK_GUARD(&aio_context_list_lock);
+
+    /* rd can temporarly be negative, but the total will *always* be >= 0 */
+    rd = orphaned_reader_count;
+    QTAILQ_FOREACH(brdv_graph, &aio_context_list, next_aio) {
+        rd += qatomic_read(&brdv_graph->reader_count);
+    }
+
+    /* shouldn't overflow unless there are 2^31 readers */
+    assert((int32_t)rd >= 0);
+    return rd;
+}
+
+void bdrv_graph_wrlock(void)
+{
+    GLOBAL_STATE_CODE();
+    assert(!qatomic_read(&has_writer));
+
+    /* Make sure that constantly arriving new I/O doesn't cause starvation */
+    bdrv_drain_all_begin_nopoll();
+
+    /*
+     * reader_count == 0: this means writer will read has_reader as 1
+     * reader_count >= 1: we don't know if writer read has_writer == 0 or 1,
+     *                    but we need to wait.
+     * Wait by allowing other coroutine (and possible readers) to continue.
+     */
+    do {
+        /*
+         * has_writer must be 0 while polling, otherwise we get a deadlock if
+         * any callback involved during AIO_WAIT_WHILE() tries to acquire the
+         * reader lock.
+         */
+        qatomic_set(&has_writer, 0);
+        AIO_WAIT_WHILE(qemu_get_aio_context(), reader_count() >= 1);
+        qatomic_set(&has_writer, 1);
+
+        /*
+         * We want to only check reader_count() after has_writer = 1 is visible
+         * to other threads. That way no more readers can sneak in after we've
+         * determined reader_count() == 0.
+         */
+        smp_mb();
+    } while (reader_count() >= 1);
+
+    bdrv_drain_all_end();
+}
+
+void bdrv_graph_wrunlock(void)
+{
+    GLOBAL_STATE_CODE();
+    QEMU_LOCK_GUARD(&aio_context_list_lock);
+    assert(qatomic_read(&has_writer));
+
+    /*
+     * No need for memory barriers, this works in pair with
+     * the slow path of rdlock() and both take the lock.
+     */
+    qatomic_store_release(&has_writer, 0);
+
+    /* Wake up all coroutine that are waiting to read the graph */
+    qemu_co_enter_all(&reader_queue, &aio_context_list_lock);
+}
+
+void coroutine_fn bdrv_graph_co_rdlock(void)
+{
+    BdrvGraphRWlock *bdrv_graph;
+    bdrv_graph = qemu_get_current_aio_context()->bdrv_graph;
+
+    /* Do not lock if in main thread */
+    if (qemu_in_main_thread()) {
+        return;
+    }
+
+    for (;;) {
+        qatomic_set(&bdrv_graph->reader_count,
+                    bdrv_graph->reader_count + 1);
+        /* make sure writer sees reader_count before we check has_writer */
+        smp_mb();
+
+        /*
+         * has_writer == 0: this means writer will read reader_count as >= 1
+         * has_writer == 1: we don't know if writer read reader_count == 0
+         *                  or > 0, but we need to wait anyways because
+         *                  it will write.
+         */
+        if (!qatomic_read(&has_writer)) {
+            break;
+        }
+
+        /*
+         * Synchronize access with reader_count() in bdrv_graph_wrlock().
+         * Case 1:
+         * If this critical section gets executed first, reader_count will
+         * decrease and the reader will go to sleep.
+         * Then the writer will read reader_count that does not take into
+         * account this reader, and if there's no other reader it will
+         * enter the write section.
+         * Case 2:
+         * If reader_count() critical section gets executed first,
+         * then writer will read reader_count >= 1.
+         * It will wait in AIO_WAIT_WHILE(), but once it releases the lock
+         * we will enter this critical section and call aio_wait_kick().
+         */
+        WITH_QEMU_LOCK_GUARD(&aio_context_list_lock) {
+            /*
+             * Additional check when we use the above lock to synchronize
+             * with bdrv_graph_wrunlock().
+             * Case 1:
+             * If this gets executed first, has_writer is still 1, so we reduce
+             * reader_count and go to sleep.
+             * Then the writer will set has_writer to 0 and wake up all readers,
+             * us included.
+             * Case 2:
+             * If bdrv_graph_wrunlock() critical section gets executed first,
+             * then it will set has_writer to 0 and wake up all other readers.
+             * Then we execute this critical section, and therefore must check
+             * again for has_writer, otherwise we sleep without any writer
+             * actually running.
+             */
+            if (!qatomic_read(&has_writer)) {
+                return;
+            }
+
+            /* slow path where reader sleeps */
+            bdrv_graph->reader_count--;
+            aio_wait_kick();
+            qemu_co_queue_wait(&reader_queue, &aio_context_list_lock);
+        }
+    }
+}
+
+void coroutine_fn bdrv_graph_co_rdunlock(void)
+{
+    BdrvGraphRWlock *bdrv_graph;
+    bdrv_graph = qemu_get_current_aio_context()->bdrv_graph;
+
+    /* Do not lock if in main thread */
+    if (qemu_in_main_thread()) {
+        return;
+    }
+
+    qatomic_store_release(&bdrv_graph->reader_count,
+                          bdrv_graph->reader_count - 1);
+    /* make sure writer sees reader_count before we check has_writer */
+    smp_mb();
+
+    /*
+     * has_writer == 0: this means reader will read reader_count decreased
+     * has_writer == 1: we don't know if writer read reader_count old or
+     *                  new. Therefore, kick again so on next iteration
+     *                  writer will for sure read the updated value.
+     */
+    if (qatomic_read(&has_writer)) {
+        aio_wait_kick();
+    }
+}
+
+void bdrv_graph_rdlock_main_loop(void)
+{
+    GLOBAL_STATE_CODE();
+    assert(!qemu_in_coroutine());
+}
+
+void bdrv_graph_rdunlock_main_loop(void)
+{
+    GLOBAL_STATE_CODE();
+    assert(!qemu_in_coroutine());
+}
diff --git a/block/meson.build b/block/meson.build
index c48a59571e..90011a2805 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -10,6 +10,7 @@ block_ss.add(files(
   'blkverify.c',
   'block-backend.c',
   'block-copy.c',
+  'graph-lock.c',
   'commit.c',
   'copy-on-read.c',
   'preallocate.c',
-- 
2.38.1


