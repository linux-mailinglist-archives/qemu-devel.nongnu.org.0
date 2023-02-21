Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 792EA69E3F6
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 16:52:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUUqr-0006Qb-Mu; Tue, 21 Feb 2023 10:46:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pUUqq-0006PO-1H; Tue, 21 Feb 2023 10:46:44 -0500
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pUUql-0003RP-Q6; Tue, 21 Feb 2023 10:46:43 -0500
Received: from mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:8923:0:640:c717:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 0AA415F935;
 Tue, 21 Feb 2023 18:46:29 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:b584::1:19])
 by mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id IksB910KfuQ0-3efK2Rz3; Tue, 21 Feb 2023 18:46:27 +0300
X-Yandex-Fwd: 1
Authentication-Results: mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net;
 dkim=pass
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 alexander.ivanov@virtuozzo.com, den@openvz.org,
 Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Subject: [PATCH v6 1/5] blockdev: refactor transaction to use Transaction API
Date: Tue, 21 Feb 2023 18:46:13 +0300
Message-Id: <20230221154617.745341-2-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230221154617.745341-1-vsementsov@yandex-team.ru>
References: <20230221154617.745341-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>

We are going to add more block-graph modifying transaction actions,
and block-graph modifying functions are already based on Transaction
API.

Next, we'll need to separately update permissions after several
graph-modifying actions, and this would be simple with help of
Transaction API.

So, now let's just transform what we have into new-style transaction
actions.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 blockdev.c | 317 +++++++++++++++++++++++++++++++----------------------
 1 file changed, 186 insertions(+), 131 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index d7b5c18f0a..293f6a958e 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1200,10 +1200,7 @@ typedef struct BlkActionState BlkActionState;
  */
 typedef struct BlkActionOps {
     size_t instance_size;
-    void (*prepare)(BlkActionState *common, Error **errp);
-    void (*commit)(BlkActionState *common);
-    void (*abort)(BlkActionState *common);
-    void (*clean)(BlkActionState *common);
+    void (*action)(BlkActionState *common, Transaction *tran, Error **errp);
 } BlkActionOps;
 
 /**
@@ -1235,6 +1232,12 @@ typedef struct InternalSnapshotState {
     bool created;
 } InternalSnapshotState;
 
+static void internal_snapshot_abort(void *opaque);
+static void internal_snapshot_clean(void *opaque);
+TransactionActionDrv internal_snapshot_drv = {
+    .abort = internal_snapshot_abort,
+    .clean = internal_snapshot_clean,
+};
 
 static int action_check_completion_mode(BlkActionState *s, Error **errp)
 {
@@ -1249,8 +1252,8 @@ static int action_check_completion_mode(BlkActionState *s, Error **errp)
     return 0;
 }
 
-static void internal_snapshot_prepare(BlkActionState *common,
-                                      Error **errp)
+static void internal_snapshot_action(BlkActionState *common,
+                                     Transaction *tran, Error **errp)
 {
     Error *local_err = NULL;
     const char *device;
@@ -1269,6 +1272,8 @@ static void internal_snapshot_prepare(BlkActionState *common,
     internal = common->action->u.blockdev_snapshot_internal_sync.data;
     state = DO_UPCAST(InternalSnapshotState, common, common);
 
+    tran_add(tran, &internal_snapshot_drv, state);
+
     /* 1. parse input */
     device = internal->device;
     name = internal->name;
@@ -1353,10 +1358,9 @@ out:
     aio_context_release(aio_context);
 }
 
-static void internal_snapshot_abort(BlkActionState *common)
+static void internal_snapshot_abort(void *opaque)
 {
-    InternalSnapshotState *state =
-                             DO_UPCAST(InternalSnapshotState, common, common);
+    InternalSnapshotState *state = opaque;
     BlockDriverState *bs = state->bs;
     QEMUSnapshotInfo *sn = &state->sn;
     AioContext *aio_context;
@@ -1380,10 +1384,9 @@ static void internal_snapshot_abort(BlkActionState *common)
     aio_context_release(aio_context);
 }
 
-static void internal_snapshot_clean(BlkActionState *common)
+static void internal_snapshot_clean(void *opaque)
 {
-    InternalSnapshotState *state = DO_UPCAST(InternalSnapshotState,
-                                             common, common);
+    InternalSnapshotState *state = opaque;
     AioContext *aio_context;
 
     if (!state->bs) {
@@ -1396,6 +1399,8 @@ static void internal_snapshot_clean(BlkActionState *common)
     bdrv_drained_end(state->bs);
 
     aio_context_release(aio_context);
+
+    g_free(state);
 }
 
 /* external snapshot private data */
@@ -1406,8 +1411,17 @@ typedef struct ExternalSnapshotState {
     bool overlay_appended;
 } ExternalSnapshotState;
 
-static void external_snapshot_prepare(BlkActionState *common,
-                                      Error **errp)
+static void external_snapshot_commit(void *opaque);
+static void external_snapshot_abort(void *opaque);
+static void external_snapshot_clean(void *opaque);
+TransactionActionDrv external_snapshot_drv = {
+    .commit = external_snapshot_commit,
+    .abort = external_snapshot_abort,
+    .clean = external_snapshot_clean,
+};
+
+static void external_snapshot_action(BlkActionState *common, Transaction *tran,
+                                     Error **errp)
 {
     int ret;
     int flags = 0;
@@ -1426,6 +1440,8 @@ static void external_snapshot_prepare(BlkActionState *common,
     AioContext *aio_context;
     uint64_t perm, shared;
 
+    tran_add(tran, &external_snapshot_drv, state);
+
     /* 'blockdev-snapshot' and 'blockdev-snapshot-sync' have similar
      * purpose but a different set of parameters */
     switch (action->type) {
@@ -1578,10 +1594,9 @@ out:
     aio_context_release(aio_context);
 }
 
-static void external_snapshot_commit(BlkActionState *common)
+static void external_snapshot_commit(void *opaque)
 {
-    ExternalSnapshotState *state =
-                             DO_UPCAST(ExternalSnapshotState, common, common);
+    ExternalSnapshotState *state = opaque;
     AioContext *aio_context;
 
     aio_context = bdrv_get_aio_context(state->old_bs);
@@ -1597,10 +1612,9 @@ static void external_snapshot_commit(BlkActionState *common)
     aio_context_release(aio_context);
 }
 
-static void external_snapshot_abort(BlkActionState *common)
+static void external_snapshot_abort(void *opaque)
 {
-    ExternalSnapshotState *state =
-                             DO_UPCAST(ExternalSnapshotState, common, common);
+    ExternalSnapshotState *state = opaque;
     if (state->new_bs) {
         if (state->overlay_appended) {
             AioContext *aio_context;
@@ -1640,10 +1654,9 @@ static void external_snapshot_abort(BlkActionState *common)
     }
 }
 
-static void external_snapshot_clean(BlkActionState *common)
+static void external_snapshot_clean(void *opaque)
 {
-    ExternalSnapshotState *state =
-                             DO_UPCAST(ExternalSnapshotState, common, common);
+    ExternalSnapshotState *state = opaque;
     AioContext *aio_context;
 
     if (!state->old_bs) {
@@ -1657,6 +1670,8 @@ static void external_snapshot_clean(BlkActionState *common)
     bdrv_unref(state->new_bs);
 
     aio_context_release(aio_context);
+
+    g_free(state);
 }
 
 typedef struct DriveBackupState {
@@ -1671,7 +1686,17 @@ static BlockJob *do_backup_common(BackupCommon *backup,
                                   AioContext *aio_context,
                                   JobTxn *txn, Error **errp);
 
-static void drive_backup_prepare(BlkActionState *common, Error **errp)
+static void drive_backup_commit(void *opaque);
+static void drive_backup_abort(void *opaque);
+static void drive_backup_clean(void *opaque);
+TransactionActionDrv drive_backup_drv = {
+    .commit = drive_backup_commit,
+    .abort = drive_backup_abort,
+    .clean = drive_backup_clean,
+};
+
+static void drive_backup_action(BlkActionState *common, Transaction *tran,
+                                Error **errp)
 {
     DriveBackupState *state = DO_UPCAST(DriveBackupState, common, common);
     DriveBackup *backup;
@@ -1688,6 +1713,8 @@ static void drive_backup_prepare(BlkActionState *common, Error **errp)
     bool set_backing_hd = false;
     int ret;
 
+    tran_add(tran, &drive_backup_drv, state);
+
     assert(common->action->type == TRANSACTION_ACTION_KIND_DRIVE_BACKUP);
     backup = common->action->u.drive_backup.data;
 
@@ -1818,9 +1845,9 @@ out:
     aio_context_release(aio_context);
 }
 
-static void drive_backup_commit(BlkActionState *common)
+static void drive_backup_commit(void *opaque)
 {
-    DriveBackupState *state = DO_UPCAST(DriveBackupState, common, common);
+    DriveBackupState *state = opaque;
     AioContext *aio_context;
 
     aio_context = bdrv_get_aio_context(state->bs);
@@ -1832,18 +1859,18 @@ static void drive_backup_commit(BlkActionState *common)
     aio_context_release(aio_context);
 }
 
-static void drive_backup_abort(BlkActionState *common)
+static void drive_backup_abort(void *opaque)
 {
-    DriveBackupState *state = DO_UPCAST(DriveBackupState, common, common);
+    DriveBackupState *state = opaque;
 
     if (state->job) {
         job_cancel_sync(&state->job->job, true);
     }
 }
 
-static void drive_backup_clean(BlkActionState *common)
+static void drive_backup_clean(void *opaque)
 {
-    DriveBackupState *state = DO_UPCAST(DriveBackupState, common, common);
+    DriveBackupState *state = opaque;
     AioContext *aio_context;
 
     if (!state->bs) {
@@ -1856,6 +1883,8 @@ static void drive_backup_clean(BlkActionState *common)
     bdrv_drained_end(state->bs);
 
     aio_context_release(aio_context);
+
+    g_free(state);
 }
 
 typedef struct BlockdevBackupState {
@@ -1864,7 +1893,17 @@ typedef struct BlockdevBackupState {
     BlockJob *job;
 } BlockdevBackupState;
 
-static void blockdev_backup_prepare(BlkActionState *common, Error **errp)
+static void blockdev_backup_commit(void *opaque);
+static void blockdev_backup_abort(void *opaque);
+static void blockdev_backup_clean(void *opaque);
+TransactionActionDrv blockdev_backup_drv = {
+    .commit = blockdev_backup_commit,
+    .abort = blockdev_backup_abort,
+    .clean = blockdev_backup_clean,
+};
+
+static void blockdev_backup_action(BlkActionState *common, Transaction *tran,
+                                   Error **errp)
 {
     BlockdevBackupState *state = DO_UPCAST(BlockdevBackupState, common, common);
     BlockdevBackup *backup;
@@ -1874,6 +1913,8 @@ static void blockdev_backup_prepare(BlkActionState *common, Error **errp)
     AioContext *old_context;
     int ret;
 
+    tran_add(tran, &blockdev_backup_drv, state);
+
     assert(common->action->type == TRANSACTION_ACTION_KIND_BLOCKDEV_BACKUP);
     backup = common->action->u.blockdev_backup.data;
 
@@ -1912,9 +1953,9 @@ static void blockdev_backup_prepare(BlkActionState *common, Error **errp)
     aio_context_release(aio_context);
 }
 
-static void blockdev_backup_commit(BlkActionState *common)
+static void blockdev_backup_commit(void *opaque)
 {
-    BlockdevBackupState *state = DO_UPCAST(BlockdevBackupState, common, common);
+    BlockdevBackupState *state = opaque;
     AioContext *aio_context;
 
     aio_context = bdrv_get_aio_context(state->bs);
@@ -1926,18 +1967,18 @@ static void blockdev_backup_commit(BlkActionState *common)
     aio_context_release(aio_context);
 }
 
-static void blockdev_backup_abort(BlkActionState *common)
+static void blockdev_backup_abort(void *opaque)
 {
-    BlockdevBackupState *state = DO_UPCAST(BlockdevBackupState, common, common);
+    BlockdevBackupState *state = opaque;
 
     if (state->job) {
         job_cancel_sync(&state->job->job, true);
     }
 }
 
-static void blockdev_backup_clean(BlkActionState *common)
+static void blockdev_backup_clean(void *opaque)
 {
-    BlockdevBackupState *state = DO_UPCAST(BlockdevBackupState, common, common);
+    BlockdevBackupState *state = opaque;
     AioContext *aio_context;
 
     if (!state->bs) {
@@ -1950,6 +1991,8 @@ static void blockdev_backup_clean(BlkActionState *common)
     bdrv_drained_end(state->bs);
 
     aio_context_release(aio_context);
+
+    g_free(state);
 }
 
 typedef struct BlockDirtyBitmapState {
@@ -1961,14 +2004,22 @@ typedef struct BlockDirtyBitmapState {
     bool was_enabled;
 } BlockDirtyBitmapState;
 
-static void block_dirty_bitmap_add_prepare(BlkActionState *common,
-                                           Error **errp)
+static void block_dirty_bitmap_add_abort(void *opaque);
+TransactionActionDrv block_dirty_bitmap_add_drv = {
+    .abort = block_dirty_bitmap_add_abort,
+    .clean = g_free,
+};
+
+static void block_dirty_bitmap_add_action(BlkActionState *common,
+                                          Transaction *tran, Error **errp)
 {
     Error *local_err = NULL;
     BlockDirtyBitmapAdd *action;
     BlockDirtyBitmapState *state = DO_UPCAST(BlockDirtyBitmapState,
                                              common, common);
 
+    tran_add(tran, &block_dirty_bitmap_add_drv, state);
+
     if (action_check_completion_mode(common, errp) < 0) {
         return;
     }
@@ -1988,13 +2039,12 @@ static void block_dirty_bitmap_add_prepare(BlkActionState *common,
     }
 }
 
-static void block_dirty_bitmap_add_abort(BlkActionState *common)
+static void block_dirty_bitmap_add_abort(void *opaque)
 {
     BlockDirtyBitmapAdd *action;
-    BlockDirtyBitmapState *state = DO_UPCAST(BlockDirtyBitmapState,
-                                             common, common);
+    BlockDirtyBitmapState *state = opaque;
 
-    action = common->action->u.block_dirty_bitmap_add.data;
+    action = state->common.action->u.block_dirty_bitmap_add.data;
     /* Should not be able to fail: IF the bitmap was added via .prepare(),
      * then the node reference and bitmap name must have been valid.
      */
@@ -2003,13 +2053,23 @@ static void block_dirty_bitmap_add_abort(BlkActionState *common)
     }
 }
 
-static void block_dirty_bitmap_clear_prepare(BlkActionState *common,
-                                             Error **errp)
+static void block_dirty_bitmap_restore(void *opaque);
+static void block_dirty_bitmap_free_backup(void *opaque);
+TransactionActionDrv block_dirty_bitmap_clear_drv = {
+    .abort = block_dirty_bitmap_restore,
+    .commit = block_dirty_bitmap_free_backup,
+    .clean = g_free,
+};
+
+static void block_dirty_bitmap_clear_action(BlkActionState *common,
+                                            Transaction *tran, Error **errp)
 {
     BlockDirtyBitmapState *state = DO_UPCAST(BlockDirtyBitmapState,
                                              common, common);
     BlockDirtyBitmap *action;
 
+    tran_add(tran, &block_dirty_bitmap_clear_drv, state);
+
     if (action_check_completion_mode(common, errp) < 0) {
         return;
     }
@@ -2030,31 +2090,37 @@ static void block_dirty_bitmap_clear_prepare(BlkActionState *common,
     bdrv_clear_dirty_bitmap(state->bitmap, &state->backup);
 }
 
-static void block_dirty_bitmap_restore(BlkActionState *common)
+static void block_dirty_bitmap_restore(void *opaque)
 {
-    BlockDirtyBitmapState *state = DO_UPCAST(BlockDirtyBitmapState,
-                                             common, common);
+    BlockDirtyBitmapState *state = opaque;
 
     if (state->backup) {
         bdrv_restore_dirty_bitmap(state->bitmap, state->backup);
     }
 }
 
-static void block_dirty_bitmap_free_backup(BlkActionState *common)
+static void block_dirty_bitmap_free_backup(void *opaque)
 {
-    BlockDirtyBitmapState *state = DO_UPCAST(BlockDirtyBitmapState,
-                                             common, common);
+    BlockDirtyBitmapState *state = opaque;
 
     hbitmap_free(state->backup);
 }
 
-static void block_dirty_bitmap_enable_prepare(BlkActionState *common,
-                                              Error **errp)
+static void block_dirty_bitmap_enable_abort(void *opaque);
+TransactionActionDrv block_dirty_bitmap_enable_drv = {
+    .abort = block_dirty_bitmap_enable_abort,
+    .clean = g_free,
+};
+
+static void block_dirty_bitmap_enable_action(BlkActionState *common,
+                                             Transaction *tran, Error **errp)
 {
     BlockDirtyBitmap *action;
     BlockDirtyBitmapState *state = DO_UPCAST(BlockDirtyBitmapState,
                                              common, common);
 
+    tran_add(tran, &block_dirty_bitmap_enable_drv, state);
+
     if (action_check_completion_mode(common, errp) < 0) {
         return;
     }
@@ -2076,23 +2142,30 @@ static void block_dirty_bitmap_enable_prepare(BlkActionState *common,
     bdrv_enable_dirty_bitmap(state->bitmap);
 }
 
-static void block_dirty_bitmap_enable_abort(BlkActionState *common)
+static void block_dirty_bitmap_enable_abort(void *opaque)
 {
-    BlockDirtyBitmapState *state = DO_UPCAST(BlockDirtyBitmapState,
-                                             common, common);
+    BlockDirtyBitmapState *state = opaque;
 
     if (!state->was_enabled) {
         bdrv_disable_dirty_bitmap(state->bitmap);
     }
 }
 
-static void block_dirty_bitmap_disable_prepare(BlkActionState *common,
-                                               Error **errp)
+static void block_dirty_bitmap_disable_abort(void *opaque);
+TransactionActionDrv block_dirty_bitmap_disable_drv = {
+    .abort = block_dirty_bitmap_disable_abort,
+    .clean = g_free,
+};
+
+static void block_dirty_bitmap_disable_action(BlkActionState *common,
+                                              Transaction *tran, Error **errp)
 {
     BlockDirtyBitmap *action;
     BlockDirtyBitmapState *state = DO_UPCAST(BlockDirtyBitmapState,
                                              common, common);
 
+    tran_add(tran, &block_dirty_bitmap_disable_drv, state);
+
     if (action_check_completion_mode(common, errp) < 0) {
         return;
     }
@@ -2114,23 +2187,30 @@ static void block_dirty_bitmap_disable_prepare(BlkActionState *common,
     bdrv_disable_dirty_bitmap(state->bitmap);
 }
 
-static void block_dirty_bitmap_disable_abort(BlkActionState *common)
+static void block_dirty_bitmap_disable_abort(void *opaque)
 {
-    BlockDirtyBitmapState *state = DO_UPCAST(BlockDirtyBitmapState,
-                                             common, common);
+    BlockDirtyBitmapState *state = opaque;
 
     if (state->was_enabled) {
         bdrv_enable_dirty_bitmap(state->bitmap);
     }
 }
 
-static void block_dirty_bitmap_merge_prepare(BlkActionState *common,
-                                             Error **errp)
+TransactionActionDrv block_dirty_bitmap_merge_drv = {
+    .commit = block_dirty_bitmap_free_backup,
+    .abort = block_dirty_bitmap_restore,
+    .clean = g_free,
+};
+
+static void block_dirty_bitmap_merge_action(BlkActionState *common,
+                                            Transaction *tran, Error **errp)
 {
     BlockDirtyBitmapMerge *action;
     BlockDirtyBitmapState *state = DO_UPCAST(BlockDirtyBitmapState,
                                              common, common);
 
+    tran_add(tran, &block_dirty_bitmap_merge_drv, state);
+
     if (action_check_completion_mode(common, errp) < 0) {
         return;
     }
@@ -2142,13 +2222,23 @@ static void block_dirty_bitmap_merge_prepare(BlkActionState *common,
                                              errp);
 }
 
-static void block_dirty_bitmap_remove_prepare(BlkActionState *common,
-                                              Error **errp)
+static void block_dirty_bitmap_remove_commit(void *opaque);
+static void block_dirty_bitmap_remove_abort(void *opaque);
+TransactionActionDrv block_dirty_bitmap_remove_drv = {
+    .commit = block_dirty_bitmap_remove_commit,
+    .abort = block_dirty_bitmap_remove_abort,
+    .clean = g_free,
+};
+
+static void block_dirty_bitmap_remove_action(BlkActionState *common,
+                                             Transaction *tran, Error **errp)
 {
     BlockDirtyBitmap *action;
     BlockDirtyBitmapState *state = DO_UPCAST(BlockDirtyBitmapState,
                                              common, common);
 
+    tran_add(tran, &block_dirty_bitmap_remove_drv, state);
+
     if (action_check_completion_mode(common, errp) < 0) {
         return;
     }
@@ -2163,10 +2253,9 @@ static void block_dirty_bitmap_remove_prepare(BlkActionState *common,
     }
 }
 
-static void block_dirty_bitmap_remove_abort(BlkActionState *common)
+static void block_dirty_bitmap_remove_abort(void *opaque)
 {
-    BlockDirtyBitmapState *state = DO_UPCAST(BlockDirtyBitmapState,
-                                             common, common);
+    BlockDirtyBitmapState *state = opaque;
 
     if (state->bitmap) {
         bdrv_dirty_bitmap_skip_store(state->bitmap, false);
@@ -2174,21 +2263,28 @@ static void block_dirty_bitmap_remove_abort(BlkActionState *common)
     }
 }
 
-static void block_dirty_bitmap_remove_commit(BlkActionState *common)
+static void block_dirty_bitmap_remove_commit(void *opaque)
 {
-    BlockDirtyBitmapState *state = DO_UPCAST(BlockDirtyBitmapState,
-                                             common, common);
+    BlockDirtyBitmapState *state = opaque;
 
     bdrv_dirty_bitmap_set_busy(state->bitmap, false);
     bdrv_release_dirty_bitmap(state->bitmap);
 }
 
-static void abort_prepare(BlkActionState *common, Error **errp)
+static void abort_commit(void *opaque);
+TransactionActionDrv abort_drv = {
+    .commit = abort_commit,
+    .clean = g_free,
+};
+
+static void abort_action(BlkActionState *common, Transaction *tran,
+                         Error **errp)
 {
+    tran_add(tran, &abort_drv, common);
     error_setg(errp, "Transaction aborted using Abort action");
 }
 
-static void abort_commit(BlkActionState *common)
+static void abort_commit(void *opaque)
 {
     g_assert_not_reached(); /* this action never succeeds */
 }
@@ -2196,75 +2292,51 @@ static void abort_commit(BlkActionState *common)
 static const BlkActionOps actions[] = {
     [TRANSACTION_ACTION_KIND_BLOCKDEV_SNAPSHOT] = {
         .instance_size = sizeof(ExternalSnapshotState),
-        .prepare  = external_snapshot_prepare,
-        .commit   = external_snapshot_commit,
-        .abort = external_snapshot_abort,
-        .clean = external_snapshot_clean,
+        .action  = external_snapshot_action,
     },
     [TRANSACTION_ACTION_KIND_BLOCKDEV_SNAPSHOT_SYNC] = {
         .instance_size = sizeof(ExternalSnapshotState),
-        .prepare  = external_snapshot_prepare,
-        .commit   = external_snapshot_commit,
-        .abort = external_snapshot_abort,
-        .clean = external_snapshot_clean,
+        .action  = external_snapshot_action,
     },
     [TRANSACTION_ACTION_KIND_DRIVE_BACKUP] = {
         .instance_size = sizeof(DriveBackupState),
-        .prepare = drive_backup_prepare,
-        .commit = drive_backup_commit,
-        .abort = drive_backup_abort,
-        .clean = drive_backup_clean,
+        .action = drive_backup_action,
     },
     [TRANSACTION_ACTION_KIND_BLOCKDEV_BACKUP] = {
         .instance_size = sizeof(BlockdevBackupState),
-        .prepare = blockdev_backup_prepare,
-        .commit = blockdev_backup_commit,
-        .abort = blockdev_backup_abort,
-        .clean = blockdev_backup_clean,
+        .action = blockdev_backup_action,
     },
     [TRANSACTION_ACTION_KIND_ABORT] = {
         .instance_size = sizeof(BlkActionState),
-        .prepare = abort_prepare,
-        .commit = abort_commit,
+        .action = abort_action,
     },
     [TRANSACTION_ACTION_KIND_BLOCKDEV_SNAPSHOT_INTERNAL_SYNC] = {
         .instance_size = sizeof(InternalSnapshotState),
-        .prepare  = internal_snapshot_prepare,
-        .abort = internal_snapshot_abort,
-        .clean = internal_snapshot_clean,
+        .action  = internal_snapshot_action,
     },
     [TRANSACTION_ACTION_KIND_BLOCK_DIRTY_BITMAP_ADD] = {
         .instance_size = sizeof(BlockDirtyBitmapState),
-        .prepare = block_dirty_bitmap_add_prepare,
-        .abort = block_dirty_bitmap_add_abort,
+        .action = block_dirty_bitmap_add_action,
     },
     [TRANSACTION_ACTION_KIND_BLOCK_DIRTY_BITMAP_CLEAR] = {
         .instance_size = sizeof(BlockDirtyBitmapState),
-        .prepare = block_dirty_bitmap_clear_prepare,
-        .commit = block_dirty_bitmap_free_backup,
-        .abort = block_dirty_bitmap_restore,
+        .action = block_dirty_bitmap_clear_action,
     },
     [TRANSACTION_ACTION_KIND_BLOCK_DIRTY_BITMAP_ENABLE] = {
         .instance_size = sizeof(BlockDirtyBitmapState),
-        .prepare = block_dirty_bitmap_enable_prepare,
-        .abort = block_dirty_bitmap_enable_abort,
+        .action = block_dirty_bitmap_enable_action,
     },
     [TRANSACTION_ACTION_KIND_BLOCK_DIRTY_BITMAP_DISABLE] = {
         .instance_size = sizeof(BlockDirtyBitmapState),
-        .prepare = block_dirty_bitmap_disable_prepare,
-        .abort = block_dirty_bitmap_disable_abort,
+        .action = block_dirty_bitmap_disable_action,
     },
     [TRANSACTION_ACTION_KIND_BLOCK_DIRTY_BITMAP_MERGE] = {
         .instance_size = sizeof(BlockDirtyBitmapState),
-        .prepare = block_dirty_bitmap_merge_prepare,
-        .commit = block_dirty_bitmap_free_backup,
-        .abort = block_dirty_bitmap_restore,
+        .action = block_dirty_bitmap_merge_action,
     },
     [TRANSACTION_ACTION_KIND_BLOCK_DIRTY_BITMAP_REMOVE] = {
         .instance_size = sizeof(BlockDirtyBitmapState),
-        .prepare = block_dirty_bitmap_remove_prepare,
-        .commit = block_dirty_bitmap_remove_commit,
-        .abort = block_dirty_bitmap_remove_abort,
+        .action = block_dirty_bitmap_remove_action,
     },
     /* Where are transactions for MIRROR, COMMIT and STREAM?
      * Although these blockjobs use transaction callbacks like the backup job,
@@ -2306,14 +2378,11 @@ void qmp_transaction(TransactionActionList *dev_list,
     TransactionActionList *dev_entry = dev_list;
     bool has_props = !!props;
     JobTxn *block_job_txn = NULL;
-    BlkActionState *state, *next;
     Error *local_err = NULL;
+    Transaction *tran = tran_new();
 
     GLOBAL_STATE_CODE();
 
-    QTAILQ_HEAD(, BlkActionState) snap_bdrv_states;
-    QTAILQ_INIT(&snap_bdrv_states);
-
     /* Does this transaction get canceled as a group on failure?
      * If not, we don't really need to make a JobTxn.
      */
@@ -2329,6 +2398,7 @@ void qmp_transaction(TransactionActionList *dev_list,
     while (NULL != dev_entry) {
         TransactionAction *dev_info = NULL;
         const BlkActionOps *ops;
+        BlkActionState *state;
 
         dev_info = dev_entry->value;
         dev_entry = dev_entry->next;
@@ -2343,38 +2413,23 @@ void qmp_transaction(TransactionActionList *dev_list,
         state->action = dev_info;
         state->block_job_txn = block_job_txn;
         state->txn_props = props;
-        QTAILQ_INSERT_TAIL(&snap_bdrv_states, state, entry);
 
-        state->ops->prepare(state, &local_err);
+        state->ops->action(state, tran, &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
             goto delete_and_fail;
         }
     }
 
-    QTAILQ_FOREACH(state, &snap_bdrv_states, entry) {
-        if (state->ops->commit) {
-            state->ops->commit(state);
-        }
-    }
+    tran_commit(tran);
 
     /* success */
     goto exit;
 
 delete_and_fail:
     /* failure, and it is all-or-none; roll back all operations */
-    QTAILQ_FOREACH_REVERSE(state, &snap_bdrv_states, entry) {
-        if (state->ops->abort) {
-            state->ops->abort(state);
-        }
-    }
+    tran_abort(tran);
 exit:
-    QTAILQ_FOREACH_SAFE(state, &snap_bdrv_states, entry, next) {
-        if (state->ops->clean) {
-            state->ops->clean(state);
-        }
-        g_free(state);
-    }
     if (!has_props) {
         qapi_free_TransactionProperties(props);
     }
-- 
2.34.1


