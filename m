Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A58A3BE8
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Aug 2019 18:26:03 +0200 (CEST)
Received: from localhost ([::1]:36054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3jis-00018B-1d
	for lists+qemu-devel@lfdr.de; Fri, 30 Aug 2019 12:26:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48605)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1i3jWB-00006g-7o
 for qemu-devel@nongnu.org; Fri, 30 Aug 2019 12:13:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1i3jW5-0004Uk-7N
 for qemu-devel@nongnu.org; Fri, 30 Aug 2019 12:12:54 -0400
Received: from relay.sw.ru ([185.231.240.75]:60598)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1i3jVs-0004Fi-Q4; Fri, 30 Aug 2019 12:12:38 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1i3jVm-0001X0-85; Fri, 30 Aug 2019 19:12:30 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Date: Fri, 30 Aug 2019 19:12:20 +0300
Message-Id: <20190830161228.54238-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190830161228.54238-1-vsementsov@virtuozzo.com>
References: <20190830161228.54238-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v10 06/14] block: move block_copy from
 block/backup.c to separate file
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 wencongyang2@huawei.com, xiechanglong.d@gmail.com, qemu-devel@nongnu.org,
 armbru@redhat.com, jsnow@redhat.com, stefanha@redhat.com, den@openvz.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split block_copy to separate file, to be cleanly shared with backup-top
filter driver in further commits.

It's a clean movement, the only change is drop "static" from interface
functions.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block-copy.h |  67 ++++++++
 block/backup.c             | 337 +------------------------------------
 block/block-copy.c         | 324 +++++++++++++++++++++++++++++++++++
 block/Makefile.objs        |   1 +
 block/trace-events         |   2 +
 5 files changed, 395 insertions(+), 336 deletions(-)
 create mode 100644 include/block/block-copy.h
 create mode 100644 block/block-copy.c

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
new file mode 100644
index 0000000000..6af82f8c72
--- /dev/null
+++ b/include/block/block-copy.h
@@ -0,0 +1,67 @@
+/*
+ * block_copy API
+ *
+ * Copyright (C) 2013 Proxmox Server Solutions
+ * Copyright (c) 2019 Virtuozzo International GmbH.
+ *
+ * Authors:
+ *  Dietmar Maurer (dietmar@proxmox.com)
+ *  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef BLOCK_COPY_H
+#define BLOCK_COPY_H
+
+#include "block/block.h"
+
+typedef void (*ProgressBytesCallbackFunc)(int64_t bytes, void *opaque);
+typedef void (*ProgressResetCallbackFunc)(void *opaque);
+typedef struct BlockCopyState {
+    BlockBackend *source;
+    BlockBackend *target;
+    BdrvDirtyBitmap *copy_bitmap;
+    int64_t cluster_size;
+    bool use_copy_range;
+    int64_t copy_range_size;
+    uint64_t len;
+
+    BdrvRequestFlags write_flags;
+
+    /*
+     * skip_unallocated: if true, on copy operation firstly reset areas
+     * unallocated in top layer of source (and then of course don't copy
+     * corresponding clusters). If some bytes reset, call
+     * progress_reset_callback.
+     */
+    bool skip_unallocated;
+
+    /* progress_bytes_callback called when some copying progress is done. */
+    ProgressBytesCallbackFunc progress_bytes_callback;
+
+    /*
+     * progress_reset_callback called when some bytes reset from copy_bitmap
+     * (see @skip_unallocated above)
+     */
+    ProgressResetCallbackFunc progress_reset_callback;
+    void *progress_opaque;
+} BlockCopyState;
+
+BlockCopyState *block_copy_state_new(
+        BlockDriverState *source, BlockDriverState *target,
+        int64_t cluster_size, BdrvRequestFlags write_flags,
+        ProgressBytesCallbackFunc progress_bytes_callback,
+        ProgressResetCallbackFunc progress_reset_callback,
+        void *progress_opaque, Error **errp);
+
+void block_copy_state_free(BlockCopyState *s);
+
+int64_t block_copy_reset_unallocated(BlockCopyState *s,
+                                     int64_t offset, int64_t *count);
+
+int coroutine_fn block_copy(BlockCopyState *s, int64_t start, uint64_t bytes,
+                            bool *error_is_read, bool is_write_notifier);
+
+#endif /* BLOCK_COPY_H */
diff --git a/block/backup.c b/block/backup.c
index 7d1188e52a..7f9b81c1fe 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -18,6 +18,7 @@
 #include "block/block_int.h"
 #include "block/blockjob_int.h"
 #include "block/block_backup.h"
+#include "block/block-copy.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qerror.h"
 #include "qemu/ratelimit.h"
@@ -35,38 +36,6 @@ typedef struct CowRequest {
     CoQueue wait_queue; /* coroutines blocked on this request */
 } CowRequest;
 
-typedef void (*ProgressBytesCallbackFunc)(int64_t bytes, void *opaque);
-typedef void (*ProgressResetCallbackFunc)(void *opaque);
-typedef struct BlockCopyState {
-    BlockBackend *source;
-    BlockBackend *target;
-    BdrvDirtyBitmap *copy_bitmap;
-    int64_t cluster_size;
-    bool use_copy_range;
-    int64_t copy_range_size;
-    uint64_t len;
-
-    BdrvRequestFlags write_flags;
-
-    /*
-     * skip_unallocated: if true, on copy operation firstly reset areas
-     * unallocated in top layer of source (and then of course don't copy
-     * corresponding clusters). If some bytes reset, call
-     * progress_reset_callback.
-     */
-    bool skip_unallocated;
-
-    /* progress_bytes_callback called when some copying progress is done. */
-    ProgressBytesCallbackFunc progress_bytes_callback;
-
-    /*
-     * progress_reset_callback called when some bytes reset from copy_bitmap
-     * (see @skip_unallocated above)
-     */
-    ProgressResetCallbackFunc progress_reset_callback;
-    void *progress_opaque;
-} BlockCopyState;
-
 typedef struct BackupBlockJob {
     BlockJob common;
     BlockDriverState *source_bs;
@@ -126,310 +95,6 @@ static void cow_request_end(CowRequest *req)
     qemu_co_queue_restart_all(&req->wait_queue);
 }
 
-static void block_copy_state_free(BlockCopyState *s)
-{
-    if (!s) {
-        return;
-    }
-
-    bdrv_release_dirty_bitmap(blk_bs(s->source), s->copy_bitmap);
-    blk_unref(s->source);
-    blk_unref(s->target);
-    g_free(s);
-}
-
-static BlockCopyState *block_copy_state_new(
-        BlockDriverState *source, BlockDriverState *target,
-        int64_t cluster_size, BdrvRequestFlags write_flags,
-        ProgressBytesCallbackFunc progress_bytes_callback,
-        ProgressResetCallbackFunc progress_reset_callback,
-        void *progress_opaque, Error **errp)
-{
-    BlockCopyState *s;
-    int ret;
-    uint64_t no_resize = BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE |
-                         BLK_PERM_WRITE_UNCHANGED | BLK_PERM_GRAPH_MOD;
-    BdrvDirtyBitmap *copy_bitmap;
-
-    copy_bitmap = bdrv_create_dirty_bitmap(source, cluster_size, NULL, errp);
-    if (!copy_bitmap) {
-        return NULL;
-    }
-    bdrv_disable_dirty_bitmap(copy_bitmap);
-
-    s = g_new(BlockCopyState, 1);
-    *s = (BlockCopyState) {
-        .source = blk_new(bdrv_get_aio_context(source),
-                          BLK_PERM_CONSISTENT_READ, no_resize),
-        .target = blk_new(bdrv_get_aio_context(target),
-                          BLK_PERM_WRITE, no_resize),
-        .copy_bitmap = copy_bitmap,
-        .cluster_size = cluster_size,
-        .len = bdrv_dirty_bitmap_size(copy_bitmap),
-        .write_flags = write_flags,
-        .use_copy_range = !(write_flags & BDRV_REQ_WRITE_COMPRESSED),
-        .progress_bytes_callback = progress_bytes_callback,
-        .progress_reset_callback = progress_reset_callback,
-        .progress_opaque = progress_opaque,
-    };
-
-    s->copy_range_size = QEMU_ALIGN_UP(MIN(blk_get_max_transfer(s->source),
-                                           blk_get_max_transfer(s->target)),
-                                       s->cluster_size);
-
-    /*
-     * We just allow aio context change on our block backends. block_copy() user
-     * (now it's only backup) is responsible for source and target being in same
-     * aio context.
-     */
-    blk_set_disable_request_queuing(s->source, true);
-    blk_set_allow_aio_context_change(s->source, true);
-    blk_set_disable_request_queuing(s->target, true);
-    blk_set_allow_aio_context_change(s->target, true);
-
-    ret = blk_insert_bs(s->source, source, errp);
-    if (ret < 0) {
-        goto fail;
-    }
-
-    ret = blk_insert_bs(s->target, target, errp);
-    if (ret < 0) {
-        goto fail;
-    }
-
-    return s;
-
-fail:
-    block_copy_state_free(s);
-
-    return NULL;
-}
-
-/*
- * Copy range to target with a bounce buffer and return the bytes copied. If
- * error occurred, return a negative error number
- */
-static int coroutine_fn block_copy_with_bounce_buffer(BlockCopyState *s,
-                                                      int64_t start,
-                                                      int64_t end,
-                                                      bool is_write_notifier,
-                                                      bool *error_is_read,
-                                                      void **bounce_buffer)
-{
-    int ret;
-    int nbytes;
-    int read_flags = is_write_notifier ? BDRV_REQ_NO_SERIALISING : 0;
-
-    assert(QEMU_IS_ALIGNED(start, s->cluster_size));
-    bdrv_reset_dirty_bitmap(s->copy_bitmap, start, s->cluster_size);
-    nbytes = MIN(s->cluster_size, s->len - start);
-    if (!*bounce_buffer) {
-        *bounce_buffer = blk_blockalign(s->source, s->cluster_size);
-    }
-
-    ret = blk_co_pread(s->source, start, nbytes, *bounce_buffer, read_flags);
-    if (ret < 0) {
-        trace_block_copy_with_bounce_buffer_read_fail(s, start, ret);
-        if (error_is_read) {
-            *error_is_read = true;
-        }
-        goto fail;
-    }
-
-    ret = blk_co_pwrite(s->target, start, nbytes, *bounce_buffer,
-                        s->write_flags);
-    if (ret < 0) {
-        trace_block_copy_with_bounce_buffer_write_fail(s, start, ret);
-        if (error_is_read) {
-            *error_is_read = false;
-        }
-        goto fail;
-    }
-
-    return nbytes;
-fail:
-    bdrv_set_dirty_bitmap(s->copy_bitmap, start, s->cluster_size);
-    return ret;
-
-}
-
-/*
- * Copy range to target and return the bytes copied. If error occurred, return a
- * negative error number.
- */
-static int coroutine_fn block_copy_with_offload(BlockCopyState *s,
-                                                int64_t start,
-                                                int64_t end,
-                                                bool is_write_notifier)
-{
-    int ret;
-    int nr_clusters;
-    int nbytes;
-    int read_flags = is_write_notifier ? BDRV_REQ_NO_SERIALISING : 0;
-
-    assert(QEMU_IS_ALIGNED(s->copy_range_size, s->cluster_size));
-    assert(QEMU_IS_ALIGNED(start, s->cluster_size));
-    nbytes = MIN(s->copy_range_size, MIN(end, s->len) - start);
-    nr_clusters = DIV_ROUND_UP(nbytes, s->cluster_size);
-    bdrv_reset_dirty_bitmap(s->copy_bitmap, start,
-                            s->cluster_size * nr_clusters);
-    ret = blk_co_copy_range(s->source, start, s->target, start, nbytes,
-                            read_flags, s->write_flags);
-    if (ret < 0) {
-        trace_block_copy_with_offload_fail(s, start, ret);
-        bdrv_set_dirty_bitmap(s->copy_bitmap, start,
-                              s->cluster_size * nr_clusters);
-        return ret;
-    }
-
-    return nbytes;
-}
-
-/*
- * Check if the cluster starting at offset is allocated or not.
- * return via pnum the number of contiguous clusters sharing this allocation.
- */
-static int block_copy_is_cluster_allocated(BlockCopyState *s, int64_t offset,
-                                           int64_t *pnum)
-{
-    BlockDriverState *bs = blk_bs(s->source);
-    int64_t count, total_count = 0;
-    int64_t bytes = s->len - offset;
-    int ret;
-
-    assert(QEMU_IS_ALIGNED(offset, s->cluster_size));
-
-    while (true) {
-        ret = bdrv_is_allocated(bs, offset, bytes, &count);
-        if (ret < 0) {
-            return ret;
-        }
-
-        total_count += count;
-
-        if (ret || count == 0) {
-            /*
-             * ret: partial segment(s) are considered allocated.
-             * otherwise: unallocated tail is treated as an entire segment.
-             */
-            *pnum = DIV_ROUND_UP(total_count, s->cluster_size);
-            return ret;
-        }
-
-        /* Unallocated segment(s) with uncertain following segment(s) */
-        if (total_count >= s->cluster_size) {
-            *pnum = total_count / s->cluster_size;
-            return 0;
-        }
-
-        offset += count;
-        bytes -= count;
-    }
-}
-
-/*
- * Reset bits in copy_bitmap starting at offset if they represent unallocated
- * data in the image. May reset subsequent contiguous bits.
- * @return 0 when the cluster at @offset was unallocated,
- *         1 otherwise, and -ret on error.
- */
-static int64_t block_copy_reset_unallocated(BlockCopyState *s,
-                                            int64_t offset, int64_t *count)
-{
-    int ret;
-    int64_t clusters, bytes;
-
-    ret = block_copy_is_cluster_allocated(s, offset, &clusters);
-    if (ret < 0) {
-        return ret;
-    }
-
-    bytes = clusters * s->cluster_size;
-
-    if (!ret) {
-        bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
-        s->progress_reset_callback(s->progress_opaque);
-    }
-
-    *count = bytes;
-    return ret;
-}
-
-static int coroutine_fn block_copy(BlockCopyState *s,
-                                   int64_t start, uint64_t bytes,
-                                   bool *error_is_read,
-                                   bool is_write_notifier)
-{
-    int ret = 0;
-    int64_t end = bytes + start; /* bytes */
-    void *bounce_buffer = NULL;
-    int64_t status_bytes;
-
-    /*
-     * block_copy() user is responsible for keeping source and target in same
-     * aio context
-     */
-    assert(blk_get_aio_context(s->source) == blk_get_aio_context(s->target));
-
-    assert(QEMU_IS_ALIGNED(start, s->cluster_size));
-    assert(QEMU_IS_ALIGNED(end, s->cluster_size));
-
-    while (start < end) {
-        int64_t dirty_end;
-
-        if (!bdrv_dirty_bitmap_get(s->copy_bitmap, start)) {
-            trace_block_copy_skip(s, start);
-            start += s->cluster_size;
-            continue; /* already copied */
-        }
-
-        dirty_end = bdrv_dirty_bitmap_next_zero(s->copy_bitmap, start,
-                                                (end - start));
-        if (dirty_end < 0) {
-            dirty_end = end;
-        }
-
-        if (s->skip_unallocated) {
-            ret = block_copy_reset_unallocated(s, start, &status_bytes);
-            if (ret == 0) {
-                trace_block_copy_skip_range(s, start, status_bytes);
-                start += status_bytes;
-                continue;
-            }
-            /* Clamp to known allocated region */
-            dirty_end = MIN(dirty_end, start + status_bytes);
-        }
-
-        trace_block_copy_process(s, start);
-
-        if (s->use_copy_range) {
-            ret = block_copy_with_offload(s, start, dirty_end,
-                                          is_write_notifier);
-            if (ret < 0) {
-                s->use_copy_range = false;
-            }
-        }
-        if (!s->use_copy_range) {
-            ret = block_copy_with_bounce_buffer(s, start, dirty_end,
-                                                is_write_notifier,
-                                                error_is_read, &bounce_buffer);
-        }
-        if (ret < 0) {
-            break;
-        }
-
-        start += ret;
-        s->progress_bytes_callback(ret, s->progress_opaque);
-        ret = 0;
-    }
-
-    if (bounce_buffer) {
-        qemu_vfree(bounce_buffer);
-    }
-
-    return ret;
-}
-
 static void backup_progress_bytes_callback(int64_t bytes, void *opaque)
 {
     BackupBlockJob *s = opaque;
diff --git a/block/block-copy.c b/block/block-copy.c
new file mode 100644
index 0000000000..c189318fcf
--- /dev/null
+++ b/block/block-copy.c
@@ -0,0 +1,324 @@
+/*
+ * block_copy API
+ *
+ * Copyright (C) 2013 Proxmox Server Solutions
+ * Copyright (c) 2019 Virtuozzo International GmbH.
+ *
+ * Authors:
+ *  Dietmar Maurer (dietmar@proxmox.com)
+ *  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+
+#include "trace.h"
+#include "qapi/error.h"
+#include "block/block-copy.h"
+#include "sysemu/block-backend.h"
+
+void block_copy_state_free(BlockCopyState *s)
+{
+    if (!s) {
+        return;
+    }
+
+    bdrv_release_dirty_bitmap(blk_bs(s->source), s->copy_bitmap);
+    blk_unref(s->source);
+    blk_unref(s->target);
+    g_free(s);
+}
+
+BlockCopyState *block_copy_state_new(
+        BlockDriverState *source, BlockDriverState *target,
+        int64_t cluster_size, BdrvRequestFlags write_flags,
+        ProgressBytesCallbackFunc progress_bytes_callback,
+        ProgressResetCallbackFunc progress_reset_callback,
+        void *progress_opaque, Error **errp)
+{
+    BlockCopyState *s;
+    int ret;
+    uint64_t no_resize = BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE |
+                         BLK_PERM_WRITE_UNCHANGED | BLK_PERM_GRAPH_MOD;
+    BdrvDirtyBitmap *copy_bitmap;
+
+    copy_bitmap = bdrv_create_dirty_bitmap(source, cluster_size, NULL, errp);
+    if (!copy_bitmap) {
+        return NULL;
+    }
+    bdrv_disable_dirty_bitmap(copy_bitmap);
+
+    s = g_new(BlockCopyState, 1);
+    *s = (BlockCopyState) {
+        .source = blk_new(bdrv_get_aio_context(source),
+                          BLK_PERM_CONSISTENT_READ, no_resize),
+        .target = blk_new(bdrv_get_aio_context(target),
+                          BLK_PERM_WRITE, no_resize),
+        .copy_bitmap = copy_bitmap,
+        .cluster_size = cluster_size,
+        .len = bdrv_dirty_bitmap_size(copy_bitmap),
+        .write_flags = write_flags,
+        .use_copy_range = !(write_flags & BDRV_REQ_WRITE_COMPRESSED),
+        .progress_bytes_callback = progress_bytes_callback,
+        .progress_reset_callback = progress_reset_callback,
+        .progress_opaque = progress_opaque,
+    };
+
+    s->copy_range_size = QEMU_ALIGN_UP(MIN(blk_get_max_transfer(s->source),
+                                           blk_get_max_transfer(s->target)),
+                                       s->cluster_size);
+
+    /*
+     * We just allow aio context change on our block backends. block_copy() user
+     * (now it's only backup) is responsible for source and target being in same
+     * aio context.
+     */
+    blk_set_disable_request_queuing(s->source, true);
+    blk_set_allow_aio_context_change(s->source, true);
+    blk_set_disable_request_queuing(s->target, true);
+    blk_set_allow_aio_context_change(s->target, true);
+
+    ret = blk_insert_bs(s->source, source, errp);
+    if (ret < 0) {
+        goto fail;
+    }
+
+    ret = blk_insert_bs(s->target, target, errp);
+    if (ret < 0) {
+        goto fail;
+    }
+
+    return s;
+
+fail:
+    block_copy_state_free(s);
+
+    return NULL;
+}
+
+/*
+ * Copy range to target with a bounce buffer and return the bytes copied. If
+ * error occurred, return a negative error number
+ */
+static int coroutine_fn block_copy_with_bounce_buffer(BlockCopyState *s,
+                                                      int64_t start,
+                                                      int64_t end,
+                                                      bool is_write_notifier,
+                                                      bool *error_is_read,
+                                                      void **bounce_buffer)
+{
+    int ret;
+    int nbytes;
+    int read_flags = is_write_notifier ? BDRV_REQ_NO_SERIALISING : 0;
+
+    assert(QEMU_IS_ALIGNED(start, s->cluster_size));
+    bdrv_reset_dirty_bitmap(s->copy_bitmap, start, s->cluster_size);
+    nbytes = MIN(s->cluster_size, s->len - start);
+    if (!*bounce_buffer) {
+        *bounce_buffer = blk_blockalign(s->source, s->cluster_size);
+    }
+
+    ret = blk_co_pread(s->source, start, nbytes, *bounce_buffer, read_flags);
+    if (ret < 0) {
+        trace_block_copy_with_bounce_buffer_read_fail(s, start, ret);
+        if (error_is_read) {
+            *error_is_read = true;
+        }
+        goto fail;
+    }
+
+    ret = blk_co_pwrite(s->target, start, nbytes, *bounce_buffer,
+                        s->write_flags);
+    if (ret < 0) {
+        trace_block_copy_with_bounce_buffer_write_fail(s, start, ret);
+        if (error_is_read) {
+            *error_is_read = false;
+        }
+        goto fail;
+    }
+
+    return nbytes;
+fail:
+    bdrv_set_dirty_bitmap(s->copy_bitmap, start, s->cluster_size);
+    return ret;
+
+}
+
+/*
+ * Copy range to target and return the bytes copied. If error occurred, return a
+ * negative error number.
+ */
+static int coroutine_fn block_copy_with_offload(BlockCopyState *s,
+                                                int64_t start,
+                                                int64_t end,
+                                                bool is_write_notifier)
+{
+    int ret;
+    int nr_clusters;
+    int nbytes;
+    int read_flags = is_write_notifier ? BDRV_REQ_NO_SERIALISING : 0;
+
+    assert(QEMU_IS_ALIGNED(s->copy_range_size, s->cluster_size));
+    assert(QEMU_IS_ALIGNED(start, s->cluster_size));
+    nbytes = MIN(s->copy_range_size, MIN(end, s->len) - start);
+    nr_clusters = DIV_ROUND_UP(nbytes, s->cluster_size);
+    bdrv_reset_dirty_bitmap(s->copy_bitmap, start,
+                            s->cluster_size * nr_clusters);
+    ret = blk_co_copy_range(s->source, start, s->target, start, nbytes,
+                            read_flags, s->write_flags);
+    if (ret < 0) {
+        trace_block_copy_with_offload_fail(s, start, ret);
+        bdrv_set_dirty_bitmap(s->copy_bitmap, start,
+                              s->cluster_size * nr_clusters);
+        return ret;
+    }
+
+    return nbytes;
+}
+
+/*
+ * Check if the cluster starting at offset is allocated or not.
+ * return via pnum the number of contiguous clusters sharing this allocation.
+ */
+static int block_copy_is_cluster_allocated(BlockCopyState *s, int64_t offset,
+                                           int64_t *pnum)
+{
+    BlockDriverState *bs = blk_bs(s->source);
+    int64_t count, total_count = 0;
+    int64_t bytes = s->len - offset;
+    int ret;
+
+    assert(QEMU_IS_ALIGNED(offset, s->cluster_size));
+
+    while (true) {
+        ret = bdrv_is_allocated(bs, offset, bytes, &count);
+        if (ret < 0) {
+            return ret;
+        }
+
+        total_count += count;
+
+        if (ret || count == 0) {
+            /*
+             * ret: partial segment(s) are considered allocated.
+             * otherwise: unallocated tail is treated as an entire segment.
+             */
+            *pnum = DIV_ROUND_UP(total_count, s->cluster_size);
+            return ret;
+        }
+
+        /* Unallocated segment(s) with uncertain following segment(s) */
+        if (total_count >= s->cluster_size) {
+            *pnum = total_count / s->cluster_size;
+            return 0;
+        }
+
+        offset += count;
+        bytes -= count;
+    }
+}
+
+/*
+ * Reset bits in copy_bitmap starting at offset if they represent unallocated
+ * data in the image. May reset subsequent contiguous bits.
+ * @return 0 when the cluster at @offset was unallocated,
+ *         1 otherwise, and -ret on error.
+ */
+int64_t block_copy_reset_unallocated(BlockCopyState *s,
+                                     int64_t offset, int64_t *count)
+{
+    int ret;
+    int64_t clusters, bytes;
+
+    ret = block_copy_is_cluster_allocated(s, offset, &clusters);
+    if (ret < 0) {
+        return ret;
+    }
+
+    bytes = clusters * s->cluster_size;
+
+    if (!ret) {
+        bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
+        s->progress_reset_callback(s->progress_opaque);
+    }
+
+    *count = bytes;
+    return ret;
+}
+
+int coroutine_fn block_copy(BlockCopyState *s,
+                            int64_t start, uint64_t bytes,
+                            bool *error_is_read,
+                            bool is_write_notifier)
+{
+    int ret = 0;
+    int64_t end = bytes + start; /* bytes */
+    void *bounce_buffer = NULL;
+    int64_t status_bytes;
+
+    /*
+     * block_copy() user is responsible for keeping source and target in same
+     * aio context
+     */
+    assert(blk_get_aio_context(s->source) == blk_get_aio_context(s->target));
+
+    assert(QEMU_IS_ALIGNED(start, s->cluster_size));
+    assert(QEMU_IS_ALIGNED(end, s->cluster_size));
+
+    while (start < end) {
+        int64_t dirty_end;
+
+        if (!bdrv_dirty_bitmap_get(s->copy_bitmap, start)) {
+            trace_block_copy_skip(s, start);
+            start += s->cluster_size;
+            continue; /* already copied */
+        }
+
+        dirty_end = bdrv_dirty_bitmap_next_zero(s->copy_bitmap, start,
+                                                (end - start));
+        if (dirty_end < 0) {
+            dirty_end = end;
+        }
+
+        if (s->skip_unallocated) {
+            ret = block_copy_reset_unallocated(s, start, &status_bytes);
+            if (ret == 0) {
+                trace_block_copy_skip_range(s, start, status_bytes);
+                start += status_bytes;
+                continue;
+            }
+            /* Clamp to known allocated region */
+            dirty_end = MIN(dirty_end, start + status_bytes);
+        }
+
+        trace_block_copy_process(s, start);
+
+        if (s->use_copy_range) {
+            ret = block_copy_with_offload(s, start, dirty_end,
+                                          is_write_notifier);
+            if (ret < 0) {
+                s->use_copy_range = false;
+            }
+        }
+        if (!s->use_copy_range) {
+            ret = block_copy_with_bounce_buffer(s, start, dirty_end,
+                                                is_write_notifier,
+                                                error_is_read, &bounce_buffer);
+        }
+        if (ret < 0) {
+            break;
+        }
+
+        start += ret;
+        s->progress_bytes_callback(ret, s->progress_opaque);
+        ret = 0;
+    }
+
+    if (bounce_buffer) {
+        qemu_vfree(bounce_buffer);
+    }
+
+    return ret;
+}
diff --git a/block/Makefile.objs b/block/Makefile.objs
index 35f3bca4d9..0b5c635fb2 100644
--- a/block/Makefile.objs
+++ b/block/Makefile.objs
@@ -37,6 +37,7 @@ block-obj-y += write-threshold.o
 block-obj-y += backup.o
 block-obj-$(CONFIG_REPLICATION) += replication.o
 block-obj-y += throttle.o copy-on-read.o
+block-obj-y += block-copy.o
 
 block-obj-y += crypto.o
 
diff --git a/block/trace-events b/block/trace-events
index 453792ed87..15bc00cc28 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -40,6 +40,8 @@ mirror_yield_in_flight(void *s, int64_t offset, int in_flight) "s %p offset %" P
 # backup.c
 backup_do_cow_enter(void *job, int64_t start, int64_t offset, uint64_t bytes) "job %p start %" PRId64 " offset %" PRId64 " bytes %" PRIu64
 backup_do_cow_return(void *job, int64_t offset, uint64_t bytes, int ret) "job %p offset %" PRId64 " bytes %" PRIu64 " ret %d"
+
+# block-copy.c
 block_copy_skip(void *bcs, int64_t start) "job %p start %"PRId64
 block_copy_skip_range(void *bcs, int64_t start, uint64_t bytes) "job %p start %"PRId64" bytes %"PRId64
 block_copy_process(void *bcs, int64_t start) "job %p start %"PRId64
-- 
2.18.0


