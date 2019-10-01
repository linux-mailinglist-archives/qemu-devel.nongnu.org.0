Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CED2C357A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 15:23:18 +0200 (CEST)
Received: from localhost ([::1]:42008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFI7Z-0003fz-6g
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 09:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53478)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iFHyx-0004bX-QV
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 09:14:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iFHyw-0006Na-I5
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 09:14:23 -0400
Received: from relay.sw.ru ([185.231.240.75]:60984)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iFHyr-0006DE-9i; Tue, 01 Oct 2019 09:14:19 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iFHyk-00040D-M1; Tue, 01 Oct 2019 16:14:10 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v15 3/5] block/block-copy: split block_copy_set_callbacks
 function
Date: Tue,  1 Oct 2019 16:14:07 +0300
Message-Id: <20191001131409.14202-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191001131409.14202-1-vsementsov@virtuozzo.com>
References: <20191001131409.14202-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, armbru@redhat.com,
 den@openvz.org, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split block_copy_set_callbacks out of block_copy_state_new. It's needed
for further commit: block-copy will use BdrvChildren of backup-top
filter, so it will be created from backup-top filter creation function.
But callbacks will still belong to backup job and will be set in
separate.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block-copy.h | 13 +++++++++----
 block/backup.c             |  6 ++++--
 block/block-copy.c         | 24 +++++++++++++++---------
 3 files changed, 28 insertions(+), 15 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index 962f91056a..340d856246 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -66,12 +66,17 @@ typedef struct BlockCopyState {
     void *progress_opaque;
 } BlockCopyState;
 
-BlockCopyState *block_copy_state_new(
-        BlockDriverState *source, BlockDriverState *target,
-        int64_t cluster_size, BdrvRequestFlags write_flags,
+BlockCopyState *block_copy_state_new(BlockDriverState *source,
+                                     BlockDriverState *target,
+                                     int64_t cluster_size,
+                                     BdrvRequestFlags write_flags,
+                                     Error **errp);
+
+void block_copy_set_callbacks(
+        BlockCopyState *s,
         ProgressBytesCallbackFunc progress_bytes_callback,
         ProgressResetCallbackFunc progress_reset_callback,
-        void *progress_opaque, Error **errp);
+        void *progress_opaque);
 
 void block_copy_state_free(BlockCopyState *s);
 
diff --git a/block/backup.c b/block/backup.c
index b5b7939356..1057ed0a4e 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -478,8 +478,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     job->bitmap_mode = bitmap_mode;
 
     job->bcs = block_copy_state_new(bs, target, cluster_size, write_flags,
-                                    backup_progress_bytes_callback,
-                                    backup_progress_reset_callback, job, errp);
+                                    errp);
     if (!job->bcs) {
         goto error;
     }
@@ -487,6 +486,9 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     job->cluster_size = cluster_size;
     job->len = len;
 
+    block_copy_set_callbacks(job->bcs, backup_progress_bytes_callback,
+                             backup_progress_reset_callback, job);
+
     /* Required permissions are already taken by block-copy-state target */
     block_job_add_bdrv(&job->common, "target", target, 0, BLK_PERM_ALL,
                        &error_abort);
diff --git a/block/block-copy.c b/block/block-copy.c
index 61e5ea5f46..fcb112da14 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -66,12 +66,10 @@ void block_copy_state_free(BlockCopyState *s)
     g_free(s);
 }
 
-BlockCopyState *block_copy_state_new(
-        BlockDriverState *source, BlockDriverState *target,
-        int64_t cluster_size, BdrvRequestFlags write_flags,
-        ProgressBytesCallbackFunc progress_bytes_callback,
-        ProgressResetCallbackFunc progress_reset_callback,
-        void *progress_opaque, Error **errp)
+BlockCopyState *block_copy_state_new(BlockDriverState *source,
+                                     BlockDriverState *target,
+                                     int64_t cluster_size,
+                                     BdrvRequestFlags write_flags, Error **errp)
 {
     BlockCopyState *s;
     int ret;
@@ -95,9 +93,6 @@ BlockCopyState *block_copy_state_new(
         .cluster_size = cluster_size,
         .len = bdrv_dirty_bitmap_size(copy_bitmap),
         .write_flags = write_flags,
-        .progress_bytes_callback = progress_bytes_callback,
-        .progress_reset_callback = progress_reset_callback,
-        .progress_opaque = progress_opaque,
     };
 
     s->copy_range_size = QEMU_ALIGN_DOWN(MIN(blk_get_max_transfer(s->source),
@@ -144,6 +139,17 @@ fail:
     return NULL;
 }
 
+void block_copy_set_callbacks(
+        BlockCopyState *s,
+        ProgressBytesCallbackFunc progress_bytes_callback,
+        ProgressResetCallbackFunc progress_reset_callback,
+        void *progress_opaque)
+{
+    s->progress_bytes_callback = progress_bytes_callback;
+    s->progress_reset_callback = progress_reset_callback;
+    s->progress_opaque = progress_opaque;
+}
+
 /*
  * Copy range to target with a bounce buffer and return the bytes copied. If
  * error occurred, return a negative error number
-- 
2.21.0


