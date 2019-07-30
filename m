Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 040FB7AAC5
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 16:20:21 +0200 (CEST)
Received: from localhost ([::1]:33398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsSzC-0003qP-18
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 10:20:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59352)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hsSxV-0002IH-I1
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 10:18:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1hsSxT-0002ho-NR
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 10:18:33 -0400
Received: from relay.sw.ru ([185.231.240.75]:49374)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1hsSxT-0002g9-Fa; Tue, 30 Jul 2019 10:18:31 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1hsSxP-0000jQ-J9; Tue, 30 Jul 2019 17:18:27 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Tue, 30 Jul 2019 17:18:23 +0300
Message-Id: <20190730141826.709849-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190730141826.709849-1-vsementsov@virtuozzo.com>
References: <20190730141826.709849-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v2 1/4] block: introduce aio task pool
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, armbru@redhat.com,
 mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Common interface for aio task loops. To be used for improving
performance of synchronous io loops in qcow2, block-stream,
copy-on-read, and may be other places.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/aio_task.h    |  52 +++++++++++++++++++
 block/aio_task.c    | 119 ++++++++++++++++++++++++++++++++++++++++++++
 block/Makefile.objs |   2 +
 3 files changed, 173 insertions(+)
 create mode 100644 block/aio_task.h
 create mode 100644 block/aio_task.c

diff --git a/block/aio_task.h b/block/aio_task.h
new file mode 100644
index 0000000000..933af1d8e7
--- /dev/null
+++ b/block/aio_task.h
@@ -0,0 +1,52 @@
+/*
+ * Aio tasks loops
+ *
+ * Copyright (c) 2019 Virtuozzo International GmbH.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef BLOCK_AIO_TASK_H
+#define BLOCK_AIO_TASK_H
+
+#include "qemu/coroutine.h"
+
+typedef struct AioTaskPool AioTaskPool;
+typedef struct AioTask AioTask;
+typedef int (*AioTaskFunc)(AioTask *task);
+struct AioTask {
+    AioTaskPool *pool;
+    AioTaskFunc func;
+    int ret;
+};
+
+/*
+ * aio_task_pool_new
+ *
+ * The caller is responsible to g_free AioTaskPool pointer after use.
+ */
+AioTaskPool *aio_task_pool_new(int max_busy_tasks);
+int aio_task_pool_status(AioTaskPool *pool);
+bool aio_task_pool_empty(AioTaskPool *pool);
+void aio_task_pool_start_task(AioTaskPool *pool, AioTask *task);
+void aio_task_pool_wait_slot(AioTaskPool *pool);
+void aio_task_pool_wait_one(AioTaskPool *pool);
+void aio_task_pool_wait_all(AioTaskPool *pool);
+
+#endif /* BLOCK_AIO_TASK_H */
diff --git a/block/aio_task.c b/block/aio_task.c
new file mode 100644
index 0000000000..807be8deb5
--- /dev/null
+++ b/block/aio_task.c
@@ -0,0 +1,119 @@
+/*
+ * Aio tasks loops
+ *
+ * Copyright (c) 2019 Virtuozzo International GmbH.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "block/aio.h"
+#include "aio_task.h"
+
+struct AioTaskPool {
+    Coroutine *main_co;
+    int status;
+    int max_busy_tasks;
+    int busy_tasks;
+    bool wait_done;
+};
+
+static void aio_task_co(void *opaque)
+{
+    AioTask *task = opaque;
+    AioTaskPool *pool = task->pool;
+
+    assert(pool->busy_tasks < pool->max_busy_tasks);
+    pool->busy_tasks++;
+
+    task->ret = task->func(task);
+
+    pool->busy_tasks--;
+
+    if (task->ret < 0 && pool->status == 0) {
+        pool->status = task->ret;
+    }
+
+    g_free(task);
+
+    if (pool->wait_done) {
+        pool->wait_done = false;
+        aio_co_wake(pool->main_co);
+    }
+}
+
+void aio_task_pool_wait_one(AioTaskPool *pool)
+{
+    assert(pool->busy_tasks > 0);
+    assert(qemu_coroutine_self() == pool->main_co);
+
+    pool->wait_done = true;
+    qemu_coroutine_yield();
+
+    assert(!pool->wait_done);
+    assert(pool->busy_tasks < pool->max_busy_tasks);
+}
+
+void aio_task_pool_wait_slot(AioTaskPool *pool)
+{
+    if (pool->busy_tasks < pool->max_busy_tasks) {
+        return;
+    }
+
+    aio_task_pool_wait_one(pool);
+}
+
+void aio_task_pool_wait_all(AioTaskPool *pool)
+{
+    while (pool->busy_tasks > 0) {
+        aio_task_pool_wait_one(pool);
+    }
+}
+
+void aio_task_pool_start_task(AioTaskPool *pool, AioTask *task)
+{
+    aio_task_pool_wait_slot(pool);
+
+    task->pool = pool;
+    qemu_coroutine_enter(qemu_coroutine_create(aio_task_co, task));
+}
+
+AioTaskPool *aio_task_pool_new(int max_busy_tasks)
+{
+    AioTaskPool *pool = g_new0(AioTaskPool, 1);
+
+    pool->main_co = qemu_coroutine_self();
+    pool->max_busy_tasks = max_busy_tasks;
+
+    return pool;
+}
+
+int aio_task_pool_status(AioTaskPool *pool)
+{
+    if (!pool) {
+        return 0; /* Sugar for lazy allocation of aio pool */
+    }
+
+    return pool->status;
+}
+
+bool aio_task_pool_empty(AioTaskPool *pool)
+{
+    return pool->busy_tasks == 0;
+}
diff --git a/block/Makefile.objs b/block/Makefile.objs
index 35f3bca4d9..c2eb8c8769 100644
--- a/block/Makefile.objs
+++ b/block/Makefile.objs
@@ -40,6 +40,8 @@ block-obj-y += throttle.o copy-on-read.o
 
 block-obj-y += crypto.o
 
+block-obj-y += aio_task.o
+
 common-obj-y += stream.o
 
 nfs.o-libs         := $(LIBNFS_LIBS)
-- 
2.18.0


