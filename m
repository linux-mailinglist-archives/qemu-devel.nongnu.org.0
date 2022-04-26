Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EC150F6FE
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 11:06:48 +0200 (CEST)
Received: from localhost ([::1]:45870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njH9j-00030t-8u
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 05:06:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1njGvA-00073s-94
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 04:51:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1njGv7-0000fb-Oh
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 04:51:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650963101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ybqeLj928KxsoJnODD+n8vlkCVYf+o9rlKL+Gb4eDw=;
 b=JB2Iv+tEjkPasjzlzSxHjgXLNxE+Le2aYJRNz+pG4nKBAHhNHOgRPjvlGg1/uYHHWThNm6
 jRnB81vMczJOq1QxbeLz7UCJ+BOFwk+bNKFICQ8hubJ46FQvo+bLUzRqod+LXLy9N4zu9x
 feIYyJb4vi/jzg6J6neYZtClQPfpz68=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-E001ejmhOyCKTMW4Ete3ZA-1; Tue, 26 Apr 2022 04:51:39 -0400
X-MC-Unique: E001ejmhOyCKTMW4Ete3ZA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 18C241E12D37;
 Tue, 26 Apr 2022 08:51:24 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 530BC40D2824;
 Tue, 26 Apr 2022 08:51:18 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH v2 3/8] block: introduce a lock to protect graph operations
Date: Tue, 26 Apr 2022 04:51:09 -0400
Message-Id: <20220426085114.199647-4-eesposit@redhat.com>
In-Reply-To: <20220426085114.199647-1-eesposit@redhat.com>
References: <20220426085114.199647-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

block layer graph operations are always run under BQL in the
main loop. This is proved by the assertion qemu_in_main_thread()
and its wrapper macro GLOBAL_STATE_CODE.
However, there are also concurrent coroutines running in other
iothreads that always try to traverse the graph.
Currently this is protected (among various other things) by
the AioContext lock, but once this is removed we need to make
sure that reads do not happen while modifying the graph.

We distinguish between writer (main loop, under BQL) that modifies the
graph, and readers (all other coroutines running in various AioContext),
that go through the graph edges, reading ->parents and->children.

The writer (main loop)  has an "exclusive" access, so it first waits for
current read to finish, and then prevents incoming ones from
entering while it has the exclusive access.

The readers (coroutines in multiple AioContext) are free to
access the graph as long the writer is not modifying the graph.
In case it is, they go in a CoQueue and sleep until the writer
is done.

If a coroutine changes AioContext, the counter in the original and new
AioContext are left intact, since the writer does not care where is the
reader, but only if there is one.
If instead the original AioContext gets deleted, we need to transfer the
current amount of readers in a global shared counter, so that the writer
is always aware of all readers.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/graph-lock.c         | 216 +++++++++++++++++++++++++++++++++++++
 block/meson.build          |   1 +
 include/block/aio.h        |   9 ++
 include/block/block_int.h  |   1 +
 include/block/graph-lock.h |  56 ++++++++++
 5 files changed, 283 insertions(+)
 create mode 100644 block/graph-lock.c
 create mode 100644 include/block/graph-lock.h

diff --git a/block/graph-lock.c b/block/graph-lock.c
new file mode 100644
index 0000000000..a2904ff6d8
--- /dev/null
+++ b/block/graph-lock.c
@@ -0,0 +1,216 @@
+/*
+ * CPU thread main loop - common bits for user and system mode emulation
+ *
+ *  Copyright (c) 2003-2005 Fabrice Bellard
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
+/* Protects the list of aiocontext and global_reader_count */
+static QemuMutex aio_context_list_lock;
+
+/* Written under aio_context_list_lock, read with atomic operations. */
+static int has_writer;
+
+/*
+ * A reader coroutine could move from an AioContext to another.
+ * If this happens, there is no problem from the point of view of
+ * counters. The problem is when the original AioContext where it
+ * took the rdlock gets deleted. We can't lose the counter of
+ * readers that are still running, so transfer it to this
+ * global variable.
+ * Protected by aio_context_list_lock.
+ */
+static uint32_t global_reader_count;
+
+/* Queue of readers waiting for the writer to finish */
+static CoQueue exclusive_resume;
+
+/*
+ * List of AioContext. This list ensures that each AioContext
+ * can safely modify only its own counter, avoid reading/writing
+ * others and thus improving performances by avoidind cacheline bounces.
+ */
+static QTAILQ_HEAD(, AioContext) aio_context_list =
+    QTAILQ_HEAD_INITIALIZER(aio_context_list);
+
+static void __attribute__((__constructor__)) bdrv_init_graph_lock(void)
+{
+    qemu_mutex_init(&aio_context_list_lock);
+    qemu_co_queue_init(&exclusive_resume);
+}
+
+void register_aiocontext(AioContext *ctx)
+{
+    QEMU_LOCK_GUARD(&aio_context_list_lock);
+    assert(ctx->reader_count == 0);
+    QTAILQ_INSERT_TAIL(&aio_context_list, ctx, next_aio);
+}
+
+void unregister_aiocontext(AioContext *ctx)
+{
+    QEMU_LOCK_GUARD(&aio_context_list_lock);
+    global_reader_count += ctx->reader_count;
+    QTAILQ_REMOVE(&aio_context_list, ctx, next_aio);
+}
+
+static uint32_t reader_count(void)
+{
+    AioContext *ctx;
+    uint32_t rd;
+
+    QEMU_LOCK_GUARD(&aio_context_list_lock);
+
+    /* rd can temporarly be negative, but the will *always* >= 0 */
+    rd = global_reader_count;
+    QTAILQ_FOREACH(ctx, &aio_context_list, next_aio) {
+        rd += qatomic_read(&ctx->reader_count);
+    }
+
+    /* shouldn't overflow unless there are 2^31 readers */
+    assert((int32_t)rd >= 0);
+    return rd;
+}
+
+/*
+ * Start an exclusive write operation.
+ * Must only be called from outside bdrv_graph_co_rdlock.
+ */
+void bdrv_graph_wrlock(void)
+{
+    GLOBAL_STATE_CODE();
+    assert(!has_writer);
+
+    qatomic_set(&has_writer, 1);
+    /* make sure all readers read has_writer = 1 */
+    smp_mb();
+
+    /*
+     * reader_count == 0: this means writer will read has_reader as 1
+     * reader_count >= 1: we don't know if writer read has_writer == 0 or 1,
+     *                    but we need to wait.
+     * Wait by allowing other coroutine (and possible readers) to continue.
+     */
+    AIO_WAIT_WHILE(qemu_get_aio_context(), reader_count() >= 1);
+}
+
+/* Finish an exclusive write operation.  */
+void bdrv_graph_wrunlock(void)
+{
+    GLOBAL_STATE_CODE();
+    QEMU_LOCK_GUARD(&aio_context_list_lock);
+    assert(has_writer);
+
+    /*
+     * No need for memory barriers, this works in pair with
+     * the slow path of rdlock() and both take the lock.
+     */
+    qatomic_store_release(&has_writer, 0);
+
+    /* Wake up all coroutine that are waiting to read the graph */
+    qemu_co_queue_restart_all_lockable(&exclusive_resume,
+                                       &aio_context_list_lock);
+}
+
+/* Wait for exclusive write to finish, and begin reading graph.  */
+void coroutine_fn bdrv_graph_co_rdlock(void)
+{
+    AioContext *aiocontext;
+    aiocontext = qemu_get_current_aio_context();
+
+    for (;;) {
+        qatomic_set(&aiocontext->reader_count,
+                    aiocontext->reader_count + 1);
+        /* make sure writer sees reader_count */
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
+            aiocontext->reader_count--;
+            aio_wait_kick();
+            qemu_co_queue_wait(&exclusive_resume, &aio_context_list_lock);
+        }
+    }
+}
+
+/* Mark bs as not reading anymore, and release pending exclusive ops.  */
+void coroutine_fn bdrv_graph_co_rdunlock(void)
+{
+    AioContext *aiocontext;
+    aiocontext = qemu_get_current_aio_context();
+
+    qatomic_store_release(&aiocontext->reader_count,
+                          aiocontext->reader_count - 1);
+    /* make sure writer sees reader_count */
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
diff --git a/block/meson.build b/block/meson.build
index e42bcb58d5..32ecf5c864 100644
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
diff --git a/include/block/aio.h b/include/block/aio.h
index 5634173b12..cb7d1f95cc 100644
--- a/include/block/aio.h
+++ b/include/block/aio.h
@@ -127,6 +127,15 @@ struct AioContext {
     /* Used by AioContext users to protect from multi-threaded access.  */
     QemuRecMutex lock;
 
+    /* How many readers in this AioContext are currently reading the graph. */
+    uint32_t reader_count;
+
+    /*
+     * List of AioContext kept in graph-lock.c
+     * Protected by aio_context_list_lock
+     */
+    QTAILQ_ENTRY(AioContext) next_aio;
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
index 0000000000..f171ba0527
--- /dev/null
+++ b/include/block/graph-lock.h
@@ -0,0 +1,56 @@
+#ifndef BLOCK_LOCK_H
+#define BLOCK_LOCK_H
+
+#include "qemu/osdep.h"
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
+ * Modify the graph. Nobody else is allowed to access the graph.
+ * Set global has_writer to 1, so that the next readers will wait
+ * that writer is done in a coroutine queue.
+ * Then keep track of the running readers by counting what is the total
+ * amount of readers (sum of all aiocontext readers), and wait until
+ * they all finish with AIO_WAIT_WHILE.
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
+ * Read the bs graph. Increases the reader counter of the current aiocontext,
+ * and if has_writer is set, it means that the writer is modifying
+ * the graph, therefore wait in a coroutine queue.
+ * The writer will then wake this coroutine once it is done.
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
+#endif /* BLOCK_LOCK_H */
+
-- 
2.31.1


