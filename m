Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81387213D97
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 18:31:07 +0200 (CEST)
Received: from localhost ([::1]:52760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrOag-0000nO-Hn
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 12:31:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1jrOHt-0001LF-Ev; Fri, 03 Jul 2020 12:11:41 -0400
Received: from relay.sw.ru ([185.231.240.75]:48378 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1jrOHq-0002ct-IH; Fri, 03 Jul 2020 12:11:40 -0400
Received: from [192.168.15.23] (helo=iris.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.93)
 (envelope-from <den@openvz.org>)
 id 1jrOHf-0005Rg-Ut; Fri, 03 Jul 2020 19:11:28 +0300
From: "Denis V. Lunev" <den@openvz.org>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 6/7] block/io: improve savevm performance
Date: Fri,  3 Jul 2020 19:11:29 +0300
Message-Id: <20200703161130.23772-7-den@openvz.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703161130.23772-1-den@openvz.org>
References: <20200703161130.23772-1-den@openvz.org>
Received-SPF: pass client-ip=185.231.240.75; envelope-from=den@openvz.org;
 helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 12:11:34
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Denis Plotnikov <dplotnikov@virtuozzo.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch does 2 standard basic things:
- it creates intermediate buffer for all writes from QEMU migration code
  to block driver,
- this buffer is sent to disk asynchronously, allowing several writes to
  run in parallel.

Thus bdrv_vmstate_write() is becoming asynchronous. All pending operations
completion are performed in newly invented bdrv_finalize_vmstate().

In general, migration code is fantastically inefficent (by observation),
buffers are not aligned and sent with arbitrary pieces, a lot of time
less than 100 bytes at a chunk, which results in read-modify-write
operations if target file descriptor is opened with O_DIRECT. It should
also be noted that all operations are performed into unallocated image
blocks, which also suffer due to partial writes to such new clusters
even on cached file descriptors.

Snapshot creation time (2 GB Fedora-31 VM running over NVME storage):
                original     fixed
cached:          1.79s       1.27s
non-cached:      3.29s       0.81s

The difference over HDD would be more significant :)

Signed-off-by: Denis V. Lunev <den@openvz.org>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
CC: Kevin Wolf <kwolf@redhat.com>
CC: Max Reitz <mreitz@redhat.com>
CC: Stefan Hajnoczi <stefanha@redhat.com>
CC: Fam Zheng <fam@euphon.net>
CC: Juan Quintela <quintela@redhat.com>
CC: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
CC: Denis Plotnikov <dplotnikov@virtuozzo.com>
---
 block/io.c                | 126 +++++++++++++++++++++++++++++++++++++-
 include/block/block_int.h |   8 +++
 2 files changed, 132 insertions(+), 2 deletions(-)

diff --git a/block/io.c b/block/io.c
index 1f69268361..71a696deb7 100644
--- a/block/io.c
+++ b/block/io.c
@@ -26,6 +26,7 @@
 #include "trace.h"
 #include "sysemu/block-backend.h"
 #include "block/aio-wait.h"
+#include "block/aio_task.h"
 #include "block/blockjob.h"
 #include "block/blockjob_int.h"
 #include "block/block_int.h"
@@ -33,6 +34,7 @@
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
+#include "qemu/units.h"
 #include "sysemu/replay.h"
 
 /* Maximum bounce buffer for copy-on-read and write zeroes, in bytes */
@@ -2640,6 +2642,103 @@ typedef struct BdrvVmstateCo {
     bool                is_read;
 } BdrvVmstateCo;
 
+typedef struct BdrvVMStateTask {
+    AioTask task;
+
+    BlockDriverState *bs;
+    int64_t offset;
+    void *buf;
+    size_t bytes;
+} BdrvVMStateTask;
+
+typedef struct BdrvSaveVMState {
+    AioTaskPool *pool;
+    BdrvVMStateTask *t;
+} BdrvSaveVMState;
+
+
+static coroutine_fn int bdrv_co_vmstate_save_task_entry(AioTask *task)
+{
+    int err = 0;
+    BdrvVMStateTask *t = container_of(task, BdrvVMStateTask, task);
+
+    if (t->bytes != 0) {
+        QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, t->buf, t->bytes);
+
+        bdrv_inc_in_flight(t->bs);
+        err = t->bs->drv->bdrv_save_vmstate(t->bs, &qiov, t->offset);
+        bdrv_dec_in_flight(t->bs);
+    }
+
+    qemu_vfree(t->buf);
+    return err;
+}
+
+static BdrvVMStateTask *bdrv_vmstate_task_create(BlockDriverState *bs,
+                                                 int64_t pos, size_t size)
+{
+    BdrvVMStateTask *t = g_new(BdrvVMStateTask, 1);
+
+    *t = (BdrvVMStateTask) {
+        .task.func = bdrv_co_vmstate_save_task_entry,
+        .buf = qemu_blockalign(bs, size),
+        .offset = pos,
+        .bs = bs,
+    };
+
+    return t;
+}
+
+static int bdrv_co_do_save_vmstate(BlockDriverState *bs, QEMUIOVector *qiov,
+                                   int64_t pos)
+{
+    BdrvSaveVMState *state = bs->savevm_state;
+    BdrvVMStateTask *t;
+    size_t buf_size = MAX(bdrv_get_cluster_size(bs), 1 * MiB);
+    size_t to_copy, off;
+
+    if (state == NULL) {
+        state = g_new(BdrvSaveVMState, 1);
+        *state = (BdrvSaveVMState) {
+            .pool = aio_task_pool_new(BDRV_VMSTATE_WORKERS_MAX),
+            .t = bdrv_vmstate_task_create(bs, pos, buf_size),
+        };
+
+        bs->savevm_state = state;
+    }
+
+    if (aio_task_pool_status(state->pool) < 0) {
+        /*
+         * The operation as a whole is unsuccessful. Prohibit all futher
+         * operations. If we clean here, new useless ops will come again.
+         * Thus we rely on caller for cleanup here.
+         */
+        return aio_task_pool_status(state->pool);
+    }
+
+    t = state->t;
+    if (t->offset + t->bytes != pos) {
+        /* Normally this branch is not reachable from migration */
+        return bs->drv->bdrv_save_vmstate(bs, qiov, pos);
+    }
+
+    off = 0;
+    while (1) {
+        to_copy = MIN(qiov->size - off, buf_size - t->bytes);
+        qemu_iovec_to_buf(qiov, off, t->buf + t->bytes, to_copy);
+        t->bytes += to_copy;
+        if (t->bytes < buf_size) {
+            return 0;
+        }
+
+        aio_task_pool_start_task(state->pool, &t->task);
+
+        pos += to_copy;
+        off += to_copy;
+        state->t = t = bdrv_vmstate_task_create(bs, pos, buf_size);
+    }
+}
+
 static int coroutine_fn
 bdrv_co_rw_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos,
                    bool is_read)
@@ -2655,7 +2754,7 @@ bdrv_co_rw_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos,
         if (is_read) {
             ret = drv->bdrv_load_vmstate(bs, qiov, pos);
         } else {
-            ret = drv->bdrv_save_vmstate(bs, qiov, pos);
+            ret = bdrv_co_do_save_vmstate(bs, qiov, pos);
         }
     } else if (bs->file) {
         ret = bdrv_co_rw_vmstate(bs->file->bs, qiov, pos, is_read);
@@ -2726,7 +2825,30 @@ int bdrv_readv_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos)
 
 static int coroutine_fn bdrv_co_finalize_vmstate(BlockDriverState *bs)
 {
-    return 0;
+    int err;
+    BdrvSaveVMState *state = bs->savevm_state;
+
+    if (bs->drv->bdrv_save_vmstate == NULL && bs->file != NULL) {
+        return bdrv_co_finalize_vmstate(bs->file->bs);
+    }
+    if (state == NULL) {
+        return 0;
+    }
+
+    if (aio_task_pool_status(state->pool) >= 0) {
+        /* We are on success path, commit last chunk if possible */
+        aio_task_pool_start_task(state->pool, &state->t->task);
+    }
+
+    aio_task_pool_wait_all(state->pool);
+    err = aio_task_pool_status(state->pool);
+
+    aio_task_pool_free(state->pool);
+    g_free(state);
+
+    bs->savevm_state = NULL;
+
+    return err;
 }
 
 static int coroutine_fn bdrv_finalize_vmstate_co_entry(void *opaque)
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 791de6a59c..f90f0e8b6a 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -61,6 +61,8 @@
 
 #define BLOCK_PROBE_BUF_SIZE        512
 
+#define BDRV_VMSTATE_WORKERS_MAX    8
+
 enum BdrvTrackedRequestType {
     BDRV_TRACKED_READ,
     BDRV_TRACKED_WRITE,
@@ -784,6 +786,9 @@ struct BdrvChild {
     QLIST_ENTRY(BdrvChild) next_parent;
 };
 
+
+typedef struct BdrvSaveVMState BdrvSaveVMState;
+
 /*
  * Note: the function bdrv_append() copies and swaps contents of
  * BlockDriverStates, so if you add new fields to this struct, please
@@ -947,6 +952,9 @@ struct BlockDriverState {
 
     /* BdrvChild links to this node may never be frozen */
     bool never_freeze;
+
+    /* Intermediate buffer for VM state saving from snapshot creation code */
+    BdrvSaveVMState *savevm_state;
 };
 
 struct BlockBackendRootState {
-- 
2.17.1


