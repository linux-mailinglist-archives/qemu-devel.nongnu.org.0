Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0FA17B799
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Mar 2020 08:41:50 +0100 (CET)
Received: from localhost ([::1]:60518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jA7cD-0002YL-I2
	for lists+qemu-devel@lfdr.de; Fri, 06 Mar 2020 02:41:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46366)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1jA7ZJ-000585-0k
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 02:38:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1jA7ZG-0008P1-Vy
 for qemu-devel@nongnu.org; Fri, 06 Mar 2020 02:38:48 -0500
Received: from relay.sw.ru ([185.231.240.75]:37988)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1jA7ZC-0007ws-Hl; Fri, 06 Mar 2020 02:38:42 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1jA7Z8-0002Qu-SB; Fri, 06 Mar 2020 10:38:38 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 9/9] block/block-copy: hide structure definitions
Date: Fri,  6 Mar 2020 10:38:31 +0300
Message-Id: <20200306073831.7737-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200306073831.7737-1-vsementsov@virtuozzo.com>
References: <20200306073831.7737-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, andrey.shinkevich@virtuozzo.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hide structure definitions and add explicit API instead, to keep an
eye on the scope of the shared fields.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block-copy.h | 52 +++----------------------------
 block/backup-top.c         |  6 ++--
 block/backup.c             | 25 +++++++--------
 block/block-copy.c         | 63 ++++++++++++++++++++++++++++++++++++--
 4 files changed, 82 insertions(+), 64 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index c46b382cc6..9718c241c9 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -18,56 +18,9 @@
 #include "block/block.h"
 #include "qemu/co-shared-resource.h"
 
-typedef struct BlockCopyInFlightReq {
-    int64_t offset;
-    int64_t bytes;
-    QLIST_ENTRY(BlockCopyInFlightReq) list;
-    CoQueue wait_queue; /* coroutines blocked on this request */
-} BlockCopyInFlightReq;
-
 typedef void (*ProgressBytesCallbackFunc)(int64_t bytes, void *opaque);
 typedef void (*ProgressResetCallbackFunc)(void *opaque);
-typedef struct BlockCopyState {
-    /*
-     * BdrvChild objects are not owned or managed by block-copy. They are
-     * provided by block-copy user and user is responsible for appropriate
-     * permissions on these children.
-     */
-    BdrvChild *source;
-    BdrvChild *target;
-    BdrvDirtyBitmap *copy_bitmap;
-    int64_t in_flight_bytes;
-    int64_t cluster_size;
-    bool use_copy_range;
-    int64_t copy_size;
-    uint64_t len;
-    QLIST_HEAD(, BlockCopyInFlightReq) inflight_reqs;
-
-    BdrvRequestFlags write_flags;
-
-    /*
-     * skip_unallocated:
-     *
-     * Used by sync=top jobs, which first scan the source node for unallocated
-     * areas and clear them in the copy_bitmap.  During this process, the bitmap
-     * is thus not fully initialized: It may still have bits set for areas that
-     * are unallocated and should actually not be copied.
-     *
-     * This is indicated by skip_unallocated.
-     *
-     * In this case, block_copy() will query the source’s allocation status,
-     * skip unallocated regions, clear them in the copy_bitmap, and invoke
-     * block_copy_reset_unallocated() every time it does.
-     */
-    bool skip_unallocated;
-
-    ProgressMeter *progress;
-    /* progress_bytes_callback: called when some copying progress is done. */
-    ProgressBytesCallbackFunc progress_bytes_callback;
-    void *progress_opaque;
-
-    SharedResource *mem;
-} BlockCopyState;
+typedef struct BlockCopyState BlockCopyState;
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
                                      int64_t cluster_size,
@@ -89,4 +42,7 @@ int64_t block_copy_reset_unallocated(BlockCopyState *s,
 int coroutine_fn block_copy(BlockCopyState *s, int64_t offset, int64_t bytes,
                             bool *error_is_read);
 
+BdrvDirtyBitmap *block_copy_dirty_bitmap(BlockCopyState *s);
+void block_copy_set_skip_unallocated(BlockCopyState *s, bool skip);
+
 #endif /* BLOCK_COPY_H */
diff --git a/block/backup-top.c b/block/backup-top.c
index 1bfb360bd3..3b50c06e2c 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -38,6 +38,7 @@ typedef struct BDRVBackupTopState {
     BlockCopyState *bcs;
     BdrvChild *target;
     bool active;
+    int64_t cluster_size;
 } BDRVBackupTopState;
 
 static coroutine_fn int backup_top_co_preadv(
@@ -57,8 +58,8 @@ static coroutine_fn int backup_top_cbw(BlockDriverState *bs, uint64_t offset,
         return 0;
     }
 
-    off = QEMU_ALIGN_DOWN(offset, s->bcs->cluster_size);
-    end = QEMU_ALIGN_UP(offset + bytes, s->bcs->cluster_size);
+    off = QEMU_ALIGN_DOWN(offset, s->cluster_size);
+    end = QEMU_ALIGN_UP(offset + bytes, s->cluster_size);
 
     return block_copy(s->bcs, off, end - off, NULL);
 }
@@ -238,6 +239,7 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
         goto fail;
     }
 
+    state->cluster_size = cluster_size;
     state->bcs = block_copy_state_new(top->backing, state->target,
                                       cluster_size, write_flags, &local_err);
     if (local_err) {
diff --git a/block/backup.c b/block/backup.c
index 8694e0394b..7430ca5883 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -102,7 +102,7 @@ static void backup_cleanup_sync_bitmap(BackupBlockJob *job, int ret)
 
     if (ret < 0 && job->bitmap_mode == BITMAP_SYNC_MODE_ALWAYS) {
         /* If we failed and synced, merge in the bits we didn't copy: */
-        bdrv_dirty_bitmap_merge_internal(bm, job->bcs->copy_bitmap,
+        bdrv_dirty_bitmap_merge_internal(bm, block_copy_dirty_bitmap(job->bcs),
                                          NULL, true);
     }
 }
@@ -145,7 +145,8 @@ void backup_do_checkpoint(BlockJob *job, Error **errp)
         return;
     }
 
-    bdrv_set_dirty_bitmap(backup_job->bcs->copy_bitmap, 0, backup_job->len);
+    bdrv_set_dirty_bitmap(block_copy_dirty_bitmap(backup_job->bcs), 0,
+                          backup_job->len);
 }
 
 static BlockErrorAction backup_error_action(BackupBlockJob *job,
@@ -190,7 +191,7 @@ static int coroutine_fn backup_loop(BackupBlockJob *job)
     BdrvDirtyBitmapIter *bdbi;
     int ret = 0;
 
-    bdbi = bdrv_dirty_iter_new(job->bcs->copy_bitmap);
+    bdbi = bdrv_dirty_iter_new(block_copy_dirty_bitmap(job->bcs));
     while ((offset = bdrv_dirty_iter_next(bdbi)) != -1) {
         do {
             if (yield_and_check(job)) {
@@ -210,14 +211,14 @@ static int coroutine_fn backup_loop(BackupBlockJob *job)
     return ret;
 }
 
-static void backup_init_copy_bitmap(BackupBlockJob *job)
+static void backup_init_bcs_bitmap(BackupBlockJob *job)
 {
     bool ret;
     uint64_t estimate;
+    BdrvDirtyBitmap *bcs_bitmap = block_copy_dirty_bitmap(job->bcs);
 
     if (job->sync_mode == MIRROR_SYNC_MODE_BITMAP) {
-        ret = bdrv_dirty_bitmap_merge_internal(job->bcs->copy_bitmap,
-                                               job->sync_bitmap,
+        ret = bdrv_dirty_bitmap_merge_internal(bcs_bitmap, job->sync_bitmap,
                                                NULL, true);
         assert(ret);
     } else {
@@ -226,12 +227,12 @@ static void backup_init_copy_bitmap(BackupBlockJob *job)
              * We can't hog the coroutine to initialize this thoroughly.
              * Set a flag and resume work when we are able to yield safely.
              */
-            job->bcs->skip_unallocated = true;
+            block_copy_set_skip_unallocated(job->bcs, true);
         }
-        bdrv_set_dirty_bitmap(job->bcs->copy_bitmap, 0, job->len);
+        bdrv_set_dirty_bitmap(bcs_bitmap, 0, job->len);
     }
 
-    estimate = bdrv_get_dirty_count(job->bcs->copy_bitmap);
+    estimate = bdrv_get_dirty_count(bcs_bitmap);
     job_progress_set_remaining(&job->common.job, estimate);
 }
 
@@ -240,7 +241,7 @@ static int coroutine_fn backup_run(Job *job, Error **errp)
     BackupBlockJob *s = container_of(job, BackupBlockJob, common.job);
     int ret = 0;
 
-    backup_init_copy_bitmap(s);
+    backup_init_bcs_bitmap(s);
 
     if (s->sync_mode == MIRROR_SYNC_MODE_TOP) {
         int64_t offset = 0;
@@ -259,12 +260,12 @@ static int coroutine_fn backup_run(Job *job, Error **errp)
 
             offset += count;
         }
-        s->bcs->skip_unallocated = false;
+        block_copy_set_skip_unallocated(s->bcs, false);
     }
 
     if (s->sync_mode == MIRROR_SYNC_MODE_NONE) {
         /*
-         * All bits are set in copy_bitmap to allow any cluster to be copied.
+         * All bits are set in bcs bitmap to allow any cluster to be copied.
          * This does not actually require them to be copied.
          */
         while (!job_is_cancelled(job)) {
diff --git a/block/block-copy.c b/block/block-copy.c
index d66b8eb691..a2d8579ca0 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -24,9 +24,58 @@
 #define BLOCK_COPY_MAX_BUFFER (1 * MiB)
 #define BLOCK_COPY_MAX_MEM (128 * MiB)
 
+typedef struct BlockCopyInFlightReq {
+    int64_t offset;
+    int64_t bytes;
+    QLIST_ENTRY(BlockCopyInFlightReq) list;
+    CoQueue wait_queue; /* coroutines blocked on this request */
+} BlockCopyInFlightReq;
+
+typedef struct BlockCopyState {
+    /*
+     * BdrvChild objects are not owned or managed by block-copy. They are
+     * provided by block-copy user and user is responsible for appropriate
+     * permissions on these children.
+     */
+    BdrvChild *source;
+    BdrvChild *target;
+    BdrvDirtyBitmap *copy_bitmap;
+    int64_t in_flight_bytes;
+    int64_t cluster_size;
+    bool use_copy_range;
+    int64_t copy_size;
+    uint64_t len;
+    QLIST_HEAD(, BlockCopyInFlightReq) inflight_reqs;
+
+    BdrvRequestFlags write_flags;
+
+    /*
+     * skip_unallocated:
+     *
+     * Used by sync=top jobs, which first scan the source node for unallocated
+     * areas and clear them in the copy_bitmap.  During this process, the bitmap
+     * is thus not fully initialized: It may still have bits set for areas that
+     * are unallocated and should actually not be copied.
+     *
+     * This is indicated by skip_unallocated.
+     *
+     * In this case, block_copy() will query the source’s allocation status,
+     * skip unallocated regions, clear them in the copy_bitmap, and invoke
+     * block_copy_reset_unallocated() every time it does.
+     */
+    bool skip_unallocated;
+
+    ProgressMeter *progress;
+    /* progress_bytes_callback: called when some copying progress is done. */
+    ProgressBytesCallbackFunc progress_bytes_callback;
+    void *progress_opaque;
+
+    SharedResource *mem;
+} BlockCopyState;
+
 static BlockCopyInFlightReq *find_conflicting_inflight_req(BlockCopyState *s,
-                                                          int64_t offset,
-                                                          int64_t bytes)
+                                                           int64_t offset,
+                                                           int64_t bytes)
 {
     BlockCopyInFlightReq *req;
 
@@ -516,3 +565,13 @@ int coroutine_fn block_copy(BlockCopyState *s, int64_t offset, int64_t bytes,
 
     return ret;
 }
+
+BdrvDirtyBitmap *block_copy_dirty_bitmap(BlockCopyState *s)
+{
+    return s->copy_bitmap;
+}
+
+void block_copy_set_skip_unallocated(BlockCopyState *s, bool skip)
+{
+    s->skip_unallocated = skip;
+}
-- 
2.21.0


