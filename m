Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F40583FDEEB
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 17:44:45 +0200 (CEST)
Received: from localhost ([::1]:35636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLSPs-00027d-St
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 11:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLRzO-0005H9-SY
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:17:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLRzL-0003l6-S4
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:17:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630509439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qsa9vVTNz8uOC+0s7PqS4ZC9kZqJlEP89F2LBajet8g=;
 b=an+vHe3hLFkxaiZ9VU8aDkhJqEw8Fr7ouqSBrhLfMNmB9SChHUHKzCdOuJLF1djxUcSJvz
 HwZlaOvgkb4wUQfXDpOn/HEhfi7GHJAwG23fWgqGPxw/pO67pTFKJ48+y//PSzHp0W3Jce
 zflYT2bBrrz5oNGdSN8uUOGwvWUgyGM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-5RDFsOGcOKyFYYOPD-PyEg-1; Wed, 01 Sep 2021 11:17:17 -0400
X-MC-Unique: 5RDFsOGcOKyFYYOPD-PyEg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B209106BC6A;
 Wed,  1 Sep 2021 15:17:16 +0000 (UTC)
Received: from localhost (unknown [10.39.193.250])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 99DC46B541;
 Wed,  1 Sep 2021 15:17:15 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 25/56] block: rename backup-top to copy-before-write
Date: Wed,  1 Sep 2021 17:15:48 +0200
Message-Id: <20210901151619.689075-26-hreitz@redhat.com>
In-Reply-To: <20210901151619.689075-1-hreitz@redhat.com>
References: <20210901151619.689075-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We are going to convert backup_top to full featured public filter,
which can be used in separate of backup job. Start from renaming from
"how it used" to "what it does".

While updating comments in 283 iotest, drop and rephrase also things
about ".active", as this field is now dropped, and filter doesn't have
"inactive" mode.

Note that this change may be considered as incompatible interface
change, as backup-top filter format name was visible through
query-block and query-named-block-nodes.

Still, consider the following reasoning:

1. backup-top was never documented, so if someone depends on format
   name (for driver that can't be used other than it is automatically
   inserted on backup job start), it's a kind of "undocumented feature
   use". So I think we are free to change it.

2. There is a hope, that there is no such users: it's a lot more native
   to give a good node-name to backup-top filter if need to operate
   with it somehow, and don't touch format name.

3. Another "incompatible" change in further commit would be moving
   copy-before-write filter from using backing child to file child. And
   this is even more reasonable than renaming: for now all public
   filters are file-child based.

So, it's a risky change, but risk seems small and good interface worth
it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210824083856.17408-6-vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/{backup-top.h => copy-before-write.h} |  28 +++---
 block/backup.c                              |  22 ++---
 block/{backup-top.c => copy-before-write.c} | 100 ++++++++++----------
 MAINTAINERS                                 |   4 +-
 block/meson.build                           |   2 +-
 tests/qemu-iotests/283                      |  35 +++----
 tests/qemu-iotests/283.out                  |   4 +-
 7 files changed, 95 insertions(+), 100 deletions(-)
 rename block/{backup-top.h => copy-before-write.h} (56%)
 rename block/{backup-top.c => copy-before-write.c} (62%)

diff --git a/block/backup-top.h b/block/copy-before-write.h
similarity index 56%
rename from block/backup-top.h
rename to block/copy-before-write.h
index b28b0031c4..5977b7aa31 100644
--- a/block/backup-top.h
+++ b/block/copy-before-write.h
@@ -1,10 +1,10 @@
 /*
- * backup-top filter driver
+ * copy-before-write filter driver
  *
  * The driver performs Copy-Before-Write (CBW) operation: it is injected above
  * some node, and before each write it copies _old_ data to the target node.
  *
- * Copyright (c) 2018-2019 Virtuozzo International GmbH.
+ * Copyright (c) 2018-2021 Virtuozzo International GmbH.
  *
  * Author:
  *  Sementsov-Ogievskiy Vladimir <vsementsov@virtuozzo.com>
@@ -23,20 +23,20 @@
  * along with this program. If not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef BACKUP_TOP_H
-#define BACKUP_TOP_H
+#ifndef COPY_BEFORE_WRITE_H
+#define COPY_BEFORE_WRITE_H
 
 #include "block/block_int.h"
 #include "block/block-copy.h"
 
-BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
-                                         BlockDriverState *target,
-                                         const char *filter_node_name,
-                                         uint64_t cluster_size,
-                                         BackupPerf *perf,
-                                         BdrvRequestFlags write_flags,
-                                         BlockCopyState **bcs,
-                                         Error **errp);
-void bdrv_backup_top_drop(BlockDriverState *bs);
+BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
+                                  BlockDriverState *target,
+                                  const char *filter_node_name,
+                                  uint64_t cluster_size,
+                                  BackupPerf *perf,
+                                  BdrvRequestFlags write_flags,
+                                  BlockCopyState **bcs,
+                                  Error **errp);
+void bdrv_cbw_drop(BlockDriverState *bs);
 
-#endif /* BACKUP_TOP_H */
+#endif /* COPY_BEFORE_WRITE_H */
diff --git a/block/backup.c b/block/backup.c
index bd3614ce70..ac91821b08 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -27,13 +27,13 @@
 #include "qemu/bitmap.h"
 #include "qemu/error-report.h"
 
-#include "block/backup-top.h"
+#include "block/copy-before-write.h"
 
 #define BACKUP_CLUSTER_SIZE_DEFAULT (1 << 16)
 
 typedef struct BackupBlockJob {
     BlockJob common;
-    BlockDriverState *backup_top;
+    BlockDriverState *cbw;
     BlockDriverState *source_bs;
     BlockDriverState *target_bs;
 
@@ -104,7 +104,7 @@ static void backup_clean(Job *job)
 {
     BackupBlockJob *s = container_of(job, BackupBlockJob, common.job);
     block_job_remove_all_bdrv(&s->common);
-    bdrv_backup_top_drop(s->backup_top);
+    bdrv_cbw_drop(s->cbw);
 }
 
 void backup_do_checkpoint(BlockJob *job, Error **errp)
@@ -408,7 +408,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     BackupBlockJob *job = NULL;
     int64_t cluster_size;
     BdrvRequestFlags write_flags;
-    BlockDriverState *backup_top = NULL;
+    BlockDriverState *cbw = NULL;
     BlockCopyState *bcs = NULL;
 
     assert(bs);
@@ -521,22 +521,22 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     write_flags = (bdrv_chain_contains(target, bs) ? BDRV_REQ_SERIALISING : 0) |
                   (compress ? BDRV_REQ_WRITE_COMPRESSED : 0),
 
-    backup_top = bdrv_backup_top_append(bs, target, filter_node_name,
+    cbw = bdrv_cbw_append(bs, target, filter_node_name,
                                         cluster_size, perf,
                                         write_flags, &bcs, errp);
-    if (!backup_top) {
+    if (!cbw) {
         goto error;
     }
 
     /* job->len is fixed, so we can't allow resize */
-    job = block_job_create(job_id, &backup_job_driver, txn, backup_top,
+    job = block_job_create(job_id, &backup_job_driver, txn, cbw,
                            0, BLK_PERM_ALL,
                            speed, creation_flags, cb, opaque, errp);
     if (!job) {
         goto error;
     }
 
-    job->backup_top = backup_top;
+    job->cbw = cbw;
     job->source_bs = bs;
     job->target_bs = target;
     job->on_source_error = on_source_error;
@@ -552,7 +552,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     block_copy_set_progress_meter(bcs, &job->common.job.progress);
     block_copy_set_speed(bcs, speed);
 
-    /* Required permissions are already taken by backup-top target */
+    /* Required permissions are taken by copy-before-write filter target */
     block_job_add_bdrv(&job->common, "target", target, 0, BLK_PERM_ALL,
                        &error_abort);
 
@@ -562,8 +562,8 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     if (sync_bitmap) {
         bdrv_reclaim_dirty_bitmap(sync_bitmap, NULL);
     }
-    if (backup_top) {
-        bdrv_backup_top_drop(backup_top);
+    if (cbw) {
+        bdrv_cbw_drop(cbw);
     }
 
     return NULL;
diff --git a/block/backup-top.c b/block/copy-before-write.c
similarity index 62%
rename from block/backup-top.c
rename to block/copy-before-write.c
index 425e3778be..0dc5a107cf 100644
--- a/block/backup-top.c
+++ b/block/copy-before-write.c
@@ -1,10 +1,10 @@
 /*
- * backup-top filter driver
+ * copy-before-write filter driver
  *
  * The driver performs Copy-Before-Write (CBW) operation: it is injected above
  * some node, and before each write it copies _old_ data to the target node.
  *
- * Copyright (c) 2018-2019 Virtuozzo International GmbH.
+ * Copyright (c) 2018-2021 Virtuozzo International GmbH.
  *
  * Author:
  *  Sementsov-Ogievskiy Vladimir <vsementsov@virtuozzo.com>
@@ -32,25 +32,25 @@
 #include "block/qdict.h"
 #include "block/block-copy.h"
 
-#include "block/backup-top.h"
+#include "block/copy-before-write.h"
 
-typedef struct BDRVBackupTopState {
+typedef struct BDRVCopyBeforeWriteState {
     BlockCopyState *bcs;
     BdrvChild *target;
     int64_t cluster_size;
-} BDRVBackupTopState;
+} BDRVCopyBeforeWriteState;
 
-static coroutine_fn int backup_top_co_preadv(
+static coroutine_fn int cbw_co_preadv(
         BlockDriverState *bs, uint64_t offset, uint64_t bytes,
         QEMUIOVector *qiov, int flags)
 {
     return bdrv_co_preadv(bs->backing, offset, bytes, qiov, flags);
 }
 
-static coroutine_fn int backup_top_cbw(BlockDriverState *bs, uint64_t offset,
-                                       uint64_t bytes, BdrvRequestFlags flags)
+static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
+        uint64_t offset, uint64_t bytes, BdrvRequestFlags flags)
 {
-    BDRVBackupTopState *s = bs->opaque;
+    BDRVCopyBeforeWriteState *s = bs->opaque;
     uint64_t off, end;
 
     if (flags & BDRV_REQ_WRITE_UNCHANGED) {
@@ -63,10 +63,10 @@ static coroutine_fn int backup_top_cbw(BlockDriverState *bs, uint64_t offset,
     return block_copy(s->bcs, off, end - off, true);
 }
 
-static int coroutine_fn backup_top_co_pdiscard(BlockDriverState *bs,
-                                               int64_t offset, int bytes)
+static int coroutine_fn cbw_co_pdiscard(BlockDriverState *bs,
+                                        int64_t offset, int bytes)
 {
-    int ret = backup_top_cbw(bs, offset, bytes, 0);
+    int ret = cbw_do_copy_before_write(bs, offset, bytes, 0);
     if (ret < 0) {
         return ret;
     }
@@ -74,10 +74,10 @@ static int coroutine_fn backup_top_co_pdiscard(BlockDriverState *bs,
     return bdrv_co_pdiscard(bs->backing, offset, bytes);
 }
 
-static int coroutine_fn backup_top_co_pwrite_zeroes(BlockDriverState *bs,
+static int coroutine_fn cbw_co_pwrite_zeroes(BlockDriverState *bs,
         int64_t offset, int bytes, BdrvRequestFlags flags)
 {
-    int ret = backup_top_cbw(bs, offset, bytes, flags);
+    int ret = cbw_do_copy_before_write(bs, offset, bytes, flags);
     if (ret < 0) {
         return ret;
     }
@@ -85,12 +85,12 @@ static int coroutine_fn backup_top_co_pwrite_zeroes(BlockDriverState *bs,
     return bdrv_co_pwrite_zeroes(bs->backing, offset, bytes, flags);
 }
 
-static coroutine_fn int backup_top_co_pwritev(BlockDriverState *bs,
-                                              uint64_t offset,
-                                              uint64_t bytes,
-                                              QEMUIOVector *qiov, int flags)
+static coroutine_fn int cbw_co_pwritev(BlockDriverState *bs,
+                                       uint64_t offset,
+                                       uint64_t bytes,
+                                       QEMUIOVector *qiov, int flags)
 {
-    int ret = backup_top_cbw(bs, offset, bytes, flags);
+    int ret = cbw_do_copy_before_write(bs, offset, bytes, flags);
     if (ret < 0) {
         return ret;
     }
@@ -98,7 +98,7 @@ static coroutine_fn int backup_top_co_pwritev(BlockDriverState *bs,
     return bdrv_co_pwritev(bs->backing, offset, bytes, qiov, flags);
 }
 
-static int coroutine_fn backup_top_co_flush(BlockDriverState *bs)
+static int coroutine_fn cbw_co_flush(BlockDriverState *bs)
 {
     if (!bs->backing) {
         return 0;
@@ -107,7 +107,7 @@ static int coroutine_fn backup_top_co_flush(BlockDriverState *bs)
     return bdrv_co_flush(bs->backing->bs);
 }
 
-static void backup_top_refresh_filename(BlockDriverState *bs)
+static void cbw_refresh_filename(BlockDriverState *bs)
 {
     if (bs->backing == NULL) {
         /*
@@ -120,11 +120,11 @@ static void backup_top_refresh_filename(BlockDriverState *bs)
             bs->backing->bs->filename);
 }
 
-static void backup_top_child_perm(BlockDriverState *bs, BdrvChild *c,
-                                  BdrvChildRole role,
-                                  BlockReopenQueue *reopen_queue,
-                                  uint64_t perm, uint64_t shared,
-                                  uint64_t *nperm, uint64_t *nshared)
+static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
+                           BdrvChildRole role,
+                           BlockReopenQueue *reopen_queue,
+                           uint64_t perm, uint64_t shared,
+                           uint64_t *nperm, uint64_t *nshared)
 {
     if (!(role & BDRV_CHILD_FILTERED)) {
         /*
@@ -149,41 +149,41 @@ static void backup_top_child_perm(BlockDriverState *bs, BdrvChild *c,
     }
 }
 
-BlockDriver bdrv_backup_top_filter = {
-    .format_name = "backup-top",
-    .instance_size = sizeof(BDRVBackupTopState),
+BlockDriver bdrv_cbw_filter = {
+    .format_name = "copy-before-write",
+    .instance_size = sizeof(BDRVCopyBeforeWriteState),
 
-    .bdrv_co_preadv             = backup_top_co_preadv,
-    .bdrv_co_pwritev            = backup_top_co_pwritev,
-    .bdrv_co_pwrite_zeroes      = backup_top_co_pwrite_zeroes,
-    .bdrv_co_pdiscard           = backup_top_co_pdiscard,
-    .bdrv_co_flush              = backup_top_co_flush,
+    .bdrv_co_preadv             = cbw_co_preadv,
+    .bdrv_co_pwritev            = cbw_co_pwritev,
+    .bdrv_co_pwrite_zeroes      = cbw_co_pwrite_zeroes,
+    .bdrv_co_pdiscard           = cbw_co_pdiscard,
+    .bdrv_co_flush              = cbw_co_flush,
 
-    .bdrv_refresh_filename      = backup_top_refresh_filename,
+    .bdrv_refresh_filename      = cbw_refresh_filename,
 
-    .bdrv_child_perm            = backup_top_child_perm,
+    .bdrv_child_perm            = cbw_child_perm,
 
     .is_filter = true,
 };
 
-BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
-                                         BlockDriverState *target,
-                                         const char *filter_node_name,
-                                         uint64_t cluster_size,
-                                         BackupPerf *perf,
-                                         BdrvRequestFlags write_flags,
-                                         BlockCopyState **bcs,
-                                         Error **errp)
+BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
+                                  BlockDriverState *target,
+                                  const char *filter_node_name,
+                                  uint64_t cluster_size,
+                                  BackupPerf *perf,
+                                  BdrvRequestFlags write_flags,
+                                  BlockCopyState **bcs,
+                                  Error **errp)
 {
     ERRP_GUARD();
     int ret;
-    BDRVBackupTopState *state;
+    BDRVCopyBeforeWriteState *state;
     BlockDriverState *top;
     bool appended = false;
 
     assert(source->total_sectors == target->total_sectors);
 
-    top = bdrv_new_open_driver(&bdrv_backup_top_filter, filter_node_name,
+    top = bdrv_new_open_driver(&bdrv_cbw_filter, filter_node_name,
                                BDRV_O_RDWR, errp);
     if (!top) {
         return NULL;
@@ -210,7 +210,7 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
 
     ret = bdrv_append(top, source, errp);
     if (ret < 0) {
-        error_prepend(errp, "Cannot append backup-top filter: ");
+        error_prepend(errp, "Cannot append copy-before-write filter: ");
         goto fail;
     }
     appended = true;
@@ -231,7 +231,7 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
 
 fail:
     if (appended) {
-        bdrv_backup_top_drop(top);
+        bdrv_cbw_drop(top);
     } else {
         bdrv_unref(top);
     }
@@ -241,9 +241,9 @@ fail:
     return NULL;
 }
 
-void bdrv_backup_top_drop(BlockDriverState *bs)
+void bdrv_cbw_drop(BlockDriverState *bs)
 {
-    BDRVBackupTopState *s = bs->opaque;
+    BDRVCopyBeforeWriteState *s = bs->opaque;
 
     bdrv_drop_filter(bs, &error_abort);
 
diff --git a/MAINTAINERS b/MAINTAINERS
index dffcb651f4..973cecc70e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2342,8 +2342,8 @@ F: block/mirror.c
 F: qapi/job.json
 F: block/block-copy.c
 F: include/block/block-copy.c
-F: block/backup-top.h
-F: block/backup-top.c
+F: block/copy-before-write.h
+F: block/copy-before-write.c
 F: include/block/aio_task.h
 F: block/aio_task.c
 F: util/qemu-co-shared-resource.c
diff --git a/block/meson.build b/block/meson.build
index 0450914c7a..66ee11e62c 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -4,7 +4,7 @@ block_ss.add(files(
   'aio_task.c',
   'amend.c',
   'backup.c',
-  'backup-top.c',
+  'copy-before-write.c',
   'blkdebug.c',
   'blklogwrites.c',
   'blkverify.c',
diff --git a/tests/qemu-iotests/283 b/tests/qemu-iotests/283
index 010c22f0a2..a09e0183ae 100755
--- a/tests/qemu-iotests/283
+++ b/tests/qemu-iotests/283
@@ -1,7 +1,7 @@
 #!/usr/bin/env python3
 # group: auto quick
 #
-# Test for backup-top filter permission activation failure
+# Test for copy-before-write filter permission conflict
 #
 # Copyright (c) 2019 Virtuozzo International GmbH.
 #
@@ -31,13 +31,13 @@ size = 1024 * 1024
 """ Test description
 
 When performing a backup, all writes on the source subtree must go through the
-backup-top filter so it can copy all data to the target before it is changed.
-backup-top filter is appended above source node, to achieve this thing, so all
-parents of source node are handled. A configuration with side parents of source
-sub-tree with write permission is unsupported (we'd have append several
-backup-top filter like nodes to handle such parents). The test create an
-example of such configuration and checks that a backup is then not allowed
-(blockdev-backup command should fail).
+copy-before-write filter so it can copy all data to the target before it is
+changed.  copy-before-write filter is appended above source node, to achieve
+this thing, so all parents of source node are handled. A configuration with
+side parents of source sub-tree with write permission is unsupported (we'd have
+append several copy-before-write filter like nodes to handle such parents). The
+test create an example of such configuration and checks that a backup is then
+not allowed (blockdev-backup command should fail).
 
 The configuration:
 
@@ -57,11 +57,10 @@ The configuration:
                         │    base     │ ◀──────────── │ other │
                         └─────────────┘               └───────┘
 
-On activation (see .active field of backup-top state in block/backup-top.c),
-backup-top is going to unshare write permission on its source child. Write
-unsharing will be propagated to the "source->base" link and will conflict with
-other node write permission. So permission update will fail and backup job will
-not be started.
+copy-before-write filter wants to unshare write permission on its source child.
+Write unsharing will be propagated to the "source->base" link and will conflict
+with other node write permission. So permission update will fail and backup job
+will not be started.
 
 Note, that the only thing which prevents backup of running on such
 configuration is default permission propagation scheme. It may be altered by
@@ -99,13 +98,9 @@ vm.qmp_log('blockdev-backup', sync='full', device='source', target='target')
 vm.shutdown()
 
 
-print('\n=== backup-top should be gone after job-finalize ===\n')
+print('\n=== copy-before-write filter should be gone after job-finalize ===\n')
 
-# Check that the backup-top node is gone after job-finalize.
-#
-# During finalization, the node becomes inactive and can no longer
-# function.  If it is still present, new parents might be attached, and
-# there would be no meaningful way to handle their I/O requests.
+# Check that the copy-before-write node is gone after job-finalize.
 
 vm = iotests.VM()
 vm.launch()
@@ -131,7 +126,7 @@ vm.qmp_log('blockdev-backup',
 
 vm.event_wait('BLOCK_JOB_PENDING', 5.0)
 
-# The backup-top filter should still be present prior to finalization
+# The copy-before-write filter should still be present prior to finalization
 assert vm.node_info('backup-filter') is not None
 
 vm.qmp_log('job-finalize', id='backup')
diff --git a/tests/qemu-iotests/283.out b/tests/qemu-iotests/283.out
index c6e12b15c5..f2b7219632 100644
--- a/tests/qemu-iotests/283.out
+++ b/tests/qemu-iotests/283.out
@@ -5,9 +5,9 @@
 {"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "image": "base", "node-name": "other", "take-child-perms": ["write"]}}
 {"return": {}}
 {"execute": "blockdev-backup", "arguments": {"device": "source", "sync": "full", "target": "target"}}
-{"error": {"class": "GenericError", "desc": "Cannot append backup-top filter: Permission conflict on node 'base': permissions 'write' are both required by node 'other' (uses node 'base' as 'image' child) and unshared by node 'source' (uses node 'base' as 'image' child)."}}
+{"error": {"class": "GenericError", "desc": "Cannot append copy-before-write filter: Permission conflict on node 'base': permissions 'write' are both required by node 'other' (uses node 'base' as 'image' child) and unshared by node 'source' (uses node 'base' as 'image' child)."}}
 
-=== backup-top should be gone after job-finalize ===
+=== copy-before-write filter should be gone after job-finalize ===
 
 {"execute": "blockdev-add", "arguments": {"driver": "null-co", "node-name": "source"}}
 {"return": {}}
-- 
2.31.1


