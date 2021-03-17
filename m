Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A7B33F61B
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 17:56:08 +0100 (CET)
Received: from localhost ([::1]:49358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMZSp-00046v-VE
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 12:56:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lMZ8G-0002Kf-0l
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:34:52 -0400
Received: from relay.sw.ru ([185.231.240.75]:50154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lMZ8C-0005CX-QO
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:34:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=bIljFTtGhUariGTdpKMmSt7HxzPiX/72JJgo4/X87FQ=; b=tVuVCXaHwF58
 uBLDSHdPeLo6ZC5zz5RRVubqDZTGMdDBiX3dDRayCCsQvRnLlMuP8SVHos+/TJXzM9Uk8o+mV0YIE
 zw2nHi3Wv0KC7cqxLEbYzY7KOrGKKpWvi5XQACUkx3INYJSOwBfNGZQzGebgD/JKHBPI/sCEO266a
 KmyXE=;
Received: from [192.168.15.248] (helo=andrey-MS-7B54.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lMZ7b-0034yI-PP; Wed, 17 Mar 2021 19:34:11 +0300
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: [RFC PATCH 5/9] migration/snap-tool: Block layer AIO support and file
 utility routines
Date: Wed, 17 Mar 2021 19:32:18 +0300
Message-Id: <20210317163222.182609-6-andrey.gruzdev@virtuozzo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317163222.182609-1-andrey.gruzdev@virtuozzo.com>
References: <20210317163222.182609-1-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.gruzdev@virtuozzo.com; helo=relay.sw.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introducing support for asynchronous block layer requests with in-order
completion guerantee using simple buffer descriptor ring and coroutines.

Added support for opening QEMUFile with VMSTATE area of QCOW2 image as
backing, also introduced several file utility routines.

Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
---
 include/qemu-snap.h |  48 +++++++
 meson.build         |   2 +-
 qemu-snap-io.c      | 325 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 374 insertions(+), 1 deletion(-)
 create mode 100644 qemu-snap-io.c

diff --git a/include/qemu-snap.h b/include/qemu-snap.h
index b6fd779b13..f4b38d6442 100644
--- a/include/qemu-snap.h
+++ b/include/qemu-snap.h
@@ -13,6 +13,11 @@
 #ifndef QEMU_SNAP_H
 #define QEMU_SNAP_H
 
+/* Synthetic value for invalid offset */
+#define INVALID_OFFSET          ((int64_t) -1)
+/* Max. byte count for QEMUFile inplace read */
+#define INPLACE_READ_MAX        (32768 - 4096)
+
 /* Target page size, if not specified explicitly in command-line */
 #define DEFAULT_PAGE_SIZE       4096
 /*
@@ -21,6 +26,31 @@
  */
 #define PAGE_SIZE_MAX           16384
 
+typedef struct AioBufferPool AioBufferPool;
+
+typedef struct AioBufferStatus {
+    /* BDRV operation start offset */
+    int64_t offset;
+    /* BDRV operation byte count or negative error code */
+    int count;
+} AioBufferStatus;
+
+typedef struct AioBuffer {
+    void *data;                 /* Data buffer */
+    int size;                   /* Size of data buffer */
+
+    AioBufferStatus status;     /* Status returned by task->func() */
+} AioBuffer;
+
+typedef struct AioBufferTask {
+    AioBuffer *buffer;          /* AIO buffer */
+
+    int64_t offset;             /* BDRV operation start offset */
+    int size;                   /* BDRV requested transfer size */
+} AioBufferTask;
+
+typedef AioBufferStatus coroutine_fn (*AioBufferFunc)(AioBufferTask *task);
+
 typedef struct SnapSaveState {
     BlockBackend *blk;          /* Block backend */
 } SnapSaveState;
@@ -35,4 +65,22 @@ SnapLoadState *snap_load_get_state(void);
 int coroutine_fn snap_save_state_main(SnapSaveState *sn);
 int coroutine_fn snap_load_state_main(SnapLoadState *sn);
 
+QEMUFile *qemu_fopen_bdrv_vmstate(BlockDriverState *bs, int is_writable);
+
+AioBufferPool *coroutine_fn aio_pool_new(int buf_align, int buf_size, int buf_count);
+void aio_pool_free(AioBufferPool *pool);
+void aio_pool_set_max_in_flight(AioBufferPool *pool, int max_in_flight);
+int aio_pool_status(AioBufferPool *pool);
+
+bool coroutine_fn aio_pool_can_acquire_next(AioBufferPool *pool);
+AioBuffer *coroutine_fn aio_pool_try_acquire_next(AioBufferPool *pool);
+AioBuffer *coroutine_fn aio_pool_wait_compl_next(AioBufferPool *pool);
+void coroutine_fn aio_buffer_release(AioBuffer *buffer);
+
+void coroutine_fn aio_buffer_start_task(AioBuffer *buffer, AioBufferFunc func,
+        int64_t offset, int size);
+
+void file_transfer_to_eof(QEMUFile *f_dst, QEMUFile *f_src);
+void file_transfer_bytes(QEMUFile *f_dst, QEMUFile *f_src, size_t size);
+
 #endif /* QEMU_SNAP_H */
diff --git a/meson.build b/meson.build
index 252c55d6a3..48f2367a5a 100644
--- a/meson.build
+++ b/meson.build
@@ -2324,7 +2324,7 @@ if have_tools
              dependencies: [block, qemuutil], install: true)
   qemu_nbd = executable('qemu-nbd', files('qemu-nbd.c'),
                dependencies: [blockdev, qemuutil, gnutls], install: true)
-  qemu_snap = executable('qemu-snap', files('qemu-snap.c', 'qemu-snap-handlers.c'),
+  qemu_snap = executable('qemu-snap', files('qemu-snap.c', 'qemu-snap-handlers.c', 'qemu-snap-io.c'),
                dependencies: [blockdev, qemuutil, migration], install: true)
 
   subdir('storage-daemon')
diff --git a/qemu-snap-io.c b/qemu-snap-io.c
new file mode 100644
index 0000000000..972c353255
--- /dev/null
+++ b/qemu-snap-io.c
@@ -0,0 +1,325 @@
+/*
+ * QEMU External Snapshot Utility
+ *
+ * Copyright Virtuozzo GmbH, 2021
+ *
+ * Authors:
+ *  Andrey Gruzdev   <andrey.gruzdev@virtuozzo.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * later. See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/coroutine.h"
+#include "qemu/error-report.h"
+#include "sysemu/block-backend.h"
+#include "qapi/error.h"
+#include "migration/qemu-file.h"
+#include "qemu-snap.h"
+
+/*
+ * AIO buffer pool.
+ *
+ * Coroutine-based environment to support concurrent block layer operations
+ * providing pre-allocated data buffers and in-order completion guarantee.
+ *
+ * All routines (with an exception of aio_pool_free()) are required to be
+ * called from the same coroutine in main loop context.
+ *
+ * Call sequence to keep several pending block layer requests:
+ *
+ *   aio_pool_new()                 !
+ *                                  !
+ *   aio_pool_try_acquire_next()    !<------!<------!
+ *   aio_buffer_start_task()        !------>!       !
+ *                                  !               !
+ *   aio_pool_wait_compl_next()     !               !
+ *   aio_buffer_release()           !-------------->!
+ *                                  !
+ *   aio_pool_free()                !
+ *
+ */
+
+/* AIO buffer private struct */
+typedef struct AioBufferImpl {
+    AioBuffer user;             /* Public part */
+    AioBufferPool *pool;        /* Buffer pool */
+
+    bool acquired;              /* Buffer is acquired */
+    bool busy;                  /* Task not complete */
+} AioBufferImpl;
+
+/* AIO task private struct */
+typedef struct AioBufferTaskImpl {
+    AioBufferTask user;         /* Public part */
+    AioBufferFunc func;         /* Task func */
+} AioBufferTaskImpl;
+
+/* AIO buffer pool */
+typedef struct AioBufferPool {
+    int count;                  /* Number of AioBuffer's */
+
+    Coroutine *main_co;         /* Parent coroutine */
+    int status;                 /* Overall pool status */
+
+    /* Index of next buffer to await in-order */
+    int wait_head;
+    /* Index of next buffer to acquire in-order */
+    int acquire_tail;
+
+    /* AioBuffer that is currently awaited for task completion, or NULL */
+    AioBufferImpl *wait_on_buffer;
+
+    int in_flight;              /* AIO requests in-flight */
+    int max_in_flight;          /* Max. AIO in-flight requests */
+
+    AioBufferImpl buffers[];    /* Flex-array of AioBuffer's */
+} AioBufferPool;
+
+/* Wrapper for task->func() to maintain private state */
+static void coroutine_fn aio_buffer_co(void *opaque)
+{
+    AioBufferTaskImpl *task = (AioBufferTaskImpl *) opaque;
+    AioBufferImpl *buffer = (AioBufferImpl *) task->user.buffer;
+    AioBufferPool *pool = buffer->pool;
+
+    buffer->busy = true;
+    buffer->user.status = task->func((AioBufferTask *) task);
+    /* Update pool status in case of an error */
+    if (buffer->user.status.count < 0 && pool->status == 0) {
+        pool->status = buffer->user.status.count;
+    }
+    buffer->busy = false;
+
+    g_free(task);
+
+    if (buffer == pool->wait_on_buffer) {
+        pool->wait_on_buffer = NULL;
+        aio_co_wake(pool->main_co);
+    }
+}
+
+/* Check that aio_pool_try_acquire_next() shall succeed */
+bool coroutine_fn aio_pool_can_acquire_next(AioBufferPool *pool)
+{
+    assert(qemu_coroutine_self() == pool->main_co);
+
+    return (pool->in_flight < pool->max_in_flight) &&
+            !pool->buffers[pool->acquire_tail].acquired;
+}
+
+/* Try to acquire next buffer from the pool */
+AioBuffer *coroutine_fn aio_pool_try_acquire_next(AioBufferPool *pool)
+{
+    AioBufferImpl *buffer;
+
+    assert(qemu_coroutine_self() == pool->main_co);
+
+    if (pool->in_flight >= pool->max_in_flight) {
+        return NULL;
+    }
+
+    buffer = &pool->buffers[pool->acquire_tail];
+    if (!buffer->acquired) {
+        assert(!buffer->busy);
+
+        buffer->acquired = true;
+        pool->acquire_tail = (pool->acquire_tail + 1) % pool->count;
+
+        pool->in_flight++;
+        return (AioBuffer *) buffer;
+    }
+
+    return NULL;
+}
+
+/* Start BDRV task on acquired buffer */
+void coroutine_fn aio_buffer_start_task(AioBuffer *buffer,
+        AioBufferFunc func, int64_t offset, int size)
+{
+    AioBufferImpl *buffer_impl = (AioBufferImpl *) buffer;
+    AioBufferTaskImpl *task;
+
+    assert(qemu_coroutine_self() == buffer_impl->pool->main_co);
+    assert(buffer_impl->acquired && !buffer_impl->busy);
+    assert(size <= buffer->size);
+
+    task = g_new0(AioBufferTaskImpl, 1);
+    task->user.buffer = buffer;
+    task->user.offset = offset;
+    task->user.size = size;
+    task->func = func;
+
+    qemu_coroutine_enter(qemu_coroutine_create(aio_buffer_co, task));
+}
+
+/* Wait for buffer task completion in-order */
+AioBuffer *coroutine_fn aio_pool_wait_compl_next(AioBufferPool *pool)
+{
+    AioBufferImpl *buffer;
+
+    assert(qemu_coroutine_self() == pool->main_co);
+
+    buffer = &pool->buffers[pool->wait_head];
+    if (!buffer->acquired) {
+        return NULL;
+    }
+
+    if (!buffer->busy) {
+restart:
+        pool->wait_head = (pool->wait_head + 1) % pool->count;
+        return (AioBuffer *) buffer;
+    }
+
+    pool->wait_on_buffer = buffer;
+    qemu_coroutine_yield();
+
+    assert(!pool->wait_on_buffer);
+    assert(!buffer->busy);
+
+    goto restart;
+}
+
+/* Release buffer */
+void coroutine_fn aio_buffer_release(AioBuffer *buffer)
+{
+    AioBufferImpl *buffer_impl = (AioBufferImpl *) buffer;
+
+    assert(qemu_coroutine_self() == buffer_impl->pool->main_co);
+    assert(buffer_impl->acquired && !buffer_impl->busy);
+
+    buffer_impl->acquired = false;
+    buffer_impl->pool->in_flight--;
+}
+
+/* Create new AIO buffer pool */
+AioBufferPool *coroutine_fn aio_pool_new(int buf_align,
+        int buf_size, int buf_count)
+{
+    AioBufferPool *pool = g_malloc0(sizeof(AioBufferPool) +
+            buf_count * sizeof(pool->buffers[0]));
+
+    pool->main_co = qemu_coroutine_self();
+
+    pool->count = buf_count;
+    pool->max_in_flight = pool->count;
+
+    for (int i = 0; i < buf_count; i++) {
+        pool->buffers[i].pool = pool;
+        pool->buffers[i].user.data = qemu_memalign(buf_align, buf_size);
+        pool->buffers[i].user.size = buf_size;
+    }
+
+    return pool;
+}
+
+/* Free AIO buffer pool */
+void aio_pool_free(AioBufferPool *pool)
+{
+    for (int i = 0; i < pool->count; i++) {
+        qemu_vfree(pool->buffers[i].user.data);
+    }
+    g_free(pool);
+}
+
+/* Limit the max. number of in-flight BDRV tasks/requests */
+void aio_pool_set_max_in_flight(AioBufferPool *pool, int max_in_flight)
+{
+    assert(max_in_flight > 0);
+    pool->max_in_flight = MIN(max_in_flight, pool->count);
+}
+
+/* Get overall pool operation status */
+int aio_pool_status(AioBufferPool *pool)
+{
+    return pool->status;
+}
+
+static ssize_t bdrv_vmstate_writev_buffer(void *opaque, struct iovec *iov,
+        int iovcnt, int64_t pos, Error **errp)
+{
+    int ret;
+    QEMUIOVector qiov;
+
+    qemu_iovec_init_external(&qiov, iov, iovcnt);
+    ret = bdrv_writev_vmstate((BlockDriverState *) opaque, &qiov, pos);
+    if (ret < 0) {
+        return ret;
+    }
+
+    return qiov.size;
+}
+
+static ssize_t bdrv_vmstate_get_buffer(void *opaque, uint8_t *buf,
+        int64_t pos, size_t size, Error **errp)
+{
+    return bdrv_load_vmstate((BlockDriverState *) opaque, buf, pos, size);
+}
+
+static int bdrv_vmstate_fclose(void *opaque, Error **errp)
+{
+    return bdrv_flush((BlockDriverState *) opaque);
+}
+
+static const QEMUFileOps bdrv_vmstate_read_ops = {
+    .get_buffer     = bdrv_vmstate_get_buffer,
+    .close          = bdrv_vmstate_fclose,
+};
+
+static const QEMUFileOps bdrv_vmstate_write_ops = {
+    .writev_buffer  = bdrv_vmstate_writev_buffer,
+    .close          = bdrv_vmstate_fclose,
+};
+
+/* Create QEMUFile object to access vmstate area of the image */
+QEMUFile *qemu_fopen_bdrv_vmstate(BlockDriverState *bs, int is_writable)
+{
+    if (is_writable) {
+        return qemu_fopen_ops(bs, &bdrv_vmstate_write_ops);
+    }
+    return qemu_fopen_ops(bs, &bdrv_vmstate_read_ops);
+}
+
+/*
+ * Transfer data from source QEMUFile to destination
+ * until we rich EOF on source.
+ */
+void file_transfer_to_eof(QEMUFile *f_dst, QEMUFile *f_src)
+{
+    bool eof = false;
+
+    while (!eof) {
+        const size_t size = INPLACE_READ_MAX;
+        uint8_t *buffer = NULL;
+        size_t count;
+
+        count = qemu_peek_buffer(f_src, &buffer, size, 0);
+        qemu_file_skip(f_src, count);
+        /* Reached stream EOF? */
+        if (count != size) {
+            eof = true;
+        }
+
+        qemu_put_buffer(f_dst, buffer, count);
+    }
+}
+
+/* Transfer given number of bytes from source QEMUFile to destination */
+void file_transfer_bytes(QEMUFile *f_dst, QEMUFile *f_src, size_t size)
+{
+    size_t rest = size;
+
+    while (rest) {
+        uint8_t *ptr = NULL;
+        size_t req_size;
+        size_t count;
+
+        req_size = MIN(rest, INPLACE_READ_MAX);
+        count = qemu_peek_buffer(f_src, &ptr, req_size, 0);
+        qemu_file_skip(f_src, count);
+
+        qemu_put_buffer(f_dst, ptr, count);
+        rest -= count;
+    }
+}
-- 
2.25.1


