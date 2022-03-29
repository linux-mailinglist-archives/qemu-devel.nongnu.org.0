Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC554EB513
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 23:13:15 +0200 (CEST)
Received: from localhost ([::1]:43172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZJ9O-0005oG-Iv
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 17:13:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIgP-0006Op-8C; Tue, 29 Mar 2022 16:43:18 -0400
Received: from smtp48.i.mail.ru ([94.100.177.108]:45182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIgL-0006qR-Ds; Tue, 29 Mar 2022 16:43:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=JiRBCEl7cebTIKn9UY94r+DTBULvwItqjoAmTopfVBQ=; 
 t=1648586593;x=1649191993; 
 b=L78BMorxvE8zmWMVSXGejOMo20O1MejY9yU5h0wZYXIcUMiNqHui11d9b69xIaXY3iRHqCzS1nf8YsmZQAzH7THX5zTMV5HBd6KxBjswH/ciEV9nloIVSPfDYoxGdZqcm99AuQCM3F1HjziI32jZNqBa5iV9CkN7qSkZxFv24cbNpw8/WsPYbA2l/mvGVyrW1L6Z5/BFg/xxsT/xBnmVcD8J4Rxqb5SipzPSehO51Nv7QAIMejHeYpzFXN31vxKsIJ1m5WOHc4sh59MVHwQxZXJbRzKhjucu5c/V5zcJDyHLTBuN/RVQv+DJDXChoobJQhnlk3JPTej11k8SQlq6tA==;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZIfz-000374-2U; Tue, 29 Mar 2022 23:42:51 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 v.sementsov-og@mail.ru, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v4 27/45] blockdev: qmp_transaction: drop extra generic layer
Date: Tue, 29 Mar 2022 23:40:49 +0300
Message-Id: <20220329204107.411011-28-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329204107.411011-1-v.sementsov-og@mail.ru>
References: <20220329204107.411011-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp48.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD9B83DD81DD066BE64C2837EED01D56C49DA1AB86A7F8FE1DD182A05F5380850404C228DA9ACA6FE273ECE37D64966F68ADAD47800E75BE36A2CEAACC5D22C19D2B8068055F63B3CC1
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE70043D879A87EF1BCEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063798FF8892961A0B3C8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D823919098ED410A00100EFD7D232B94996F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE74796267E12EBBF229FA2833FD35BB23D9E625A9149C048EE9ECD01F8117BC8BEA471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F446042972877693876707352033AC447995A7AD18CB629EEF1311BF91D2E47CDBA5A96583BA9C0B312567BB2376E601842F6C81A19E625A9149C048EEC8105B04EFE07628148812EF9080FC94D8FC6C240DEA7642DBF02ECDB25306B2B78CF848AE20165D0A6AB1C7CE11FEE360910C30DCD593B1040F9FF01DFDA4A8C4224003CC836476EA7A3FFF5B025636E2021AF6380DFAD1A18204E546F3947CB11811A4A51E3B096D1867E19FE1407959CC434672EE6371089D37D7C0E48F6C8AA50765F7900637E2D9485159F398E1EFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8183A4AFAF3EA6BDC446469D8A8717206BBF593E0A4FA3DD8F5FBF4E410523AA9F63330F090400096159C2B6934AE262D3EE7EAB7254005DCED7532B743992DF240BDC6A1CF3F042BAD6DF99611D93F60EFD07623A0E6354027699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D340EEB18E491831571B9BBE7935A0EC2B3E9337B9A7F0DDDD5A7B0151B93CCE6FD341F02C16B1F81CE1D7E09C32AA3244C020A99FF07F76E475E20E704D1B5887A408A6A02710B73048D5DD81C2BAB7D1D
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX92LdC94eGY85rYMLOkcdw==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE9A37DFE606991DEF3049A062A9E7ABC9675F8345C19CC290E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.108;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp48.i.mail.ru
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's simplify things:

First, actions generally don't need and access to common
BlkActionState structure. The only exclusion are backup actions that
need block_job_txn.

Next, for transaction actions of Transaction API is more native to
allocated state structure in the action itself.

So, do the following transformation:

1. Let all actions be represented by a function with corresponding
   structure as arguments.

2. Instead of array-map marshaller, let's make a function, that calls
   corresponding action directly.

3. BlkActionOps and BlkActionState structures become unused

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 blockdev.c | 276 +++++++++++++++++------------------------------------
 1 file changed, 89 insertions(+), 187 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 404ba4a394..30a5b27b28 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1157,52 +1157,8 @@ out_aio_context:
     return NULL;
 }
 
-/* New and old BlockDriverState structs for atomic group operations */
-
-typedef struct BlkActionState BlkActionState;
-
-/**
- * BlkActionOps:
- * Table of operations that define an Action.
- *
- * @instance_size: Size of state struct, in bytes.
- * @prepare: Prepare the work, must NOT be NULL.
- * @commit: Commit the changes, can be NULL.
- * @abort: Abort the changes on fail, can be NULL.
- * @clean: Clean up resources after all transaction actions have called
- *         commit() or abort(). Can be NULL.
- *
- * Only prepare() may fail. In a single transaction, only one of commit() or
- * abort() will be called. clean() will always be called if it is present.
- */
-typedef struct BlkActionOps {
-    size_t instance_size;
-    void (*action)(BlkActionState *common, Transaction *tran, Error **errp);
-} BlkActionOps;
-
-/**
- * BlkActionState:
- * Describes one Action's state within a Transaction.
- *
- * @action: QAPI-defined enum identifying which Action to perform.
- * @ops: Table of ActionOps this Action can perform.
- * @block_job_txn: Transaction which this action belongs to.
- * @entry: List membership for all Actions in this Transaction.
- *
- * This structure must be arranged as first member in a subclassed type,
- * assuming that the compiler will also arrange it to the same offsets as the
- * base class.
- */
-struct BlkActionState {
-    TransactionAction *action;
-    const BlkActionOps *ops;
-    JobTxn *block_job_txn;
-    QTAILQ_ENTRY(BlkActionState) entry;
-};
-
 /* internal snapshot private data */
 typedef struct InternalSnapshotState {
-    BlkActionState common;
     BlockDriverState *bs;
     QEMUSnapshotInfo sn;
     bool created;
@@ -1215,7 +1171,7 @@ TransactionActionDrv internal_snapshot_drv = {
     .clean = internal_snapshot_clean,
 };
 
-static void internal_snapshot_action(BlkActionState *common,
+static void internal_snapshot_action(BlockdevSnapshotInternal *internal,
                                      Transaction *tran, Error **errp)
 {
     Error *local_err = NULL;
@@ -1225,16 +1181,10 @@ static void internal_snapshot_action(BlkActionState *common,
     QEMUSnapshotInfo old_sn, *sn;
     bool ret;
     qemu_timeval tv;
-    BlockdevSnapshotInternal *internal;
-    InternalSnapshotState *state;
+    InternalSnapshotState *state = g_new0(InternalSnapshotState, 1);
     AioContext *aio_context;
     int ret1;
 
-    g_assert(common->action->type ==
-             TRANSACTION_ACTION_KIND_BLOCKDEV_SNAPSHOT_INTERNAL_SYNC);
-    internal = common->action->u.blockdev_snapshot_internal_sync.data;
-    state = DO_UPCAST(InternalSnapshotState, common, common);
-
     tran_add(tran, &internal_snapshot_drv, state);
 
     device = internal->device;
@@ -1362,7 +1312,6 @@ static void internal_snapshot_clean(void *opaque)
 
 /* external snapshot private data */
 typedef struct ExternalSnapshotState {
-    BlkActionState common;
     BlockDriverState *old_bs;
     BlockDriverState *new_bs;
     bool overlay_appended;
@@ -1377,8 +1326,8 @@ TransactionActionDrv external_snapshot_drv = {
     .clean = external_snapshot_clean,
 };
 
-static void external_snapshot_action(BlkActionState *common, Transaction *tran,
-                                     Error **errp)
+static void external_snapshot_action(TransactionAction *action,
+                                     Transaction *tran, Error **errp)
 {
     int ret;
     int flags = 0;
@@ -1391,9 +1340,7 @@ static void external_snapshot_action(BlkActionState *common, Transaction *tran,
     const char *snapshot_ref;
     /* File name of the new image (for 'blockdev-snapshot-sync') */
     const char *new_image_file;
-    ExternalSnapshotState *state =
-                             DO_UPCAST(ExternalSnapshotState, common, common);
-    TransactionAction *action = common->action;
+    ExternalSnapshotState *state = g_new0(ExternalSnapshotState, 1);
     AioContext *aio_context;
     uint64_t perm, shared;
 
@@ -1626,7 +1573,6 @@ static void external_snapshot_clean(void *opaque)
 }
 
 typedef struct DriveBackupState {
-    BlkActionState common;
     BlockDriverState *bs;
     BlockJob *job;
 } DriveBackupState;
@@ -1646,11 +1592,11 @@ TransactionActionDrv drive_backup_drv = {
     .clean = drive_backup_clean,
 };
 
-static void drive_backup_action(BlkActionState *common, Transaction *tran,
-                                Error **errp)
+static void drive_backup_action(DriveBackup *backup,
+                                JobTxn *block_job_txn,
+                                Transaction *tran, Error **errp)
 {
-    DriveBackupState *state = DO_UPCAST(DriveBackupState, common, common);
-    DriveBackup *backup;
+    DriveBackupState *state = g_new0(DriveBackupState, 1);
     BlockDriverState *bs;
     BlockDriverState *target_bs;
     BlockDriverState *source = NULL;
@@ -1665,9 +1611,6 @@ static void drive_backup_action(BlkActionState *common, Transaction *tran,
 
     tran_add(tran, &drive_backup_drv, state);
 
-    assert(common->action->type == TRANSACTION_ACTION_KIND_DRIVE_BACKUP);
-    backup = common->action->u.drive_backup.data;
-
     if (!backup->has_mode) {
         backup->mode = NEW_IMAGE_MODE_ABSOLUTE_PATHS;
     }
@@ -1787,7 +1730,7 @@ static void drive_backup_action(BlkActionState *common, Transaction *tran,
 
     state->job = do_backup_common(qapi_DriveBackup_base(backup),
                                   bs, target_bs, aio_context,
-                                  common->block_job_txn, errp);
+                                  block_job_txn, errp);
 
 unref:
     bdrv_unref(target_bs);
@@ -1845,7 +1788,6 @@ static void drive_backup_clean(void *opaque)
 }
 
 typedef struct BlockdevBackupState {
-    BlkActionState common;
     BlockDriverState *bs;
     BlockJob *job;
 } BlockdevBackupState;
@@ -1859,11 +1801,11 @@ TransactionActionDrv blockdev_backup_drv = {
     .clean = blockdev_backup_clean,
 };
 
-static void blockdev_backup_action(BlkActionState *common, Transaction *tran,
-                                   Error **errp)
+static void blockdev_backup_action(BlockdevBackup *backup,
+                                   JobTxn *block_job_txn,
+                                   Transaction *tran, Error **errp)
 {
-    BlockdevBackupState *state = DO_UPCAST(BlockdevBackupState, common, common);
-    BlockdevBackup *backup;
+    BlockdevBackupState *state = g_new0(BlockdevBackupState, 1);
     BlockDriverState *bs;
     BlockDriverState *target_bs;
     AioContext *aio_context;
@@ -1872,9 +1814,6 @@ static void blockdev_backup_action(BlkActionState *common, Transaction *tran,
 
     tran_add(tran, &blockdev_backup_drv, state);
 
-    assert(common->action->type == TRANSACTION_ACTION_KIND_BLOCKDEV_BACKUP);
-    backup = common->action->u.blockdev_backup.data;
-
     bs = bdrv_lookup_bs(backup->device, backup->device, errp);
     if (!bs) {
         return;
@@ -1905,7 +1844,7 @@ static void blockdev_backup_action(BlkActionState *common, Transaction *tran,
 
     state->job = do_backup_common(qapi_BlockdevBackup_base(backup),
                                   bs, target_bs, aio_context,
-                                  common->block_job_txn, errp);
+                                  block_job_txn, errp);
 
     aio_context_release(aio_context);
 }
@@ -1960,11 +1899,9 @@ static void blockdev_backup_clean(void *opaque)
 }
 
 typedef struct BlockDirtyBitmapState {
-    BlkActionState common;
     BdrvDirtyBitmap *bitmap;
     BlockDriverState *bs;
     HBitmap *backup;
-    bool prepared;
     bool was_enabled;
 } BlockDirtyBitmapState;
 
@@ -1974,17 +1911,14 @@ TransactionActionDrv block_dirty_bitmap_add_drv = {
     .clean = g_free,
 };
 
-static void block_dirty_bitmap_add_action(BlkActionState *common,
+static void block_dirty_bitmap_add_action(BlockDirtyBitmapAdd *action,
                                           Transaction *tran, Error **errp)
 {
     Error *local_err = NULL;
-    BlockDirtyBitmapAdd *action;
-    BlockDirtyBitmapState *state = DO_UPCAST(BlockDirtyBitmapState,
-                                             common, common);
+    BlockDirtyBitmapState *state = g_new0(BlockDirtyBitmapState, 1);
 
     tran_add(tran, &block_dirty_bitmap_add_drv, state);
 
-    action = common->action->u.block_dirty_bitmap_add.data;
     /* AIO context taken and released within qmp_block_dirty_bitmap_add */
     qmp_block_dirty_bitmap_add(action->node, action->name,
                                action->has_granularity, action->granularity,
@@ -1993,7 +1927,8 @@ static void block_dirty_bitmap_add_action(BlkActionState *common,
                                &local_err);
 
     if (!local_err) {
-        state->prepared = true;
+        state->bitmap = block_dirty_bitmap_lookup(action->node, action->name,
+                                                  NULL, &error_abort);
     } else {
         error_propagate(errp, local_err);
     }
@@ -2001,15 +1936,10 @@ static void block_dirty_bitmap_add_action(BlkActionState *common,
 
 static void block_dirty_bitmap_add_abort(void *opaque)
 {
-    BlockDirtyBitmapAdd *action;
     BlockDirtyBitmapState *state = opaque;
 
-    action = state->common.action->u.block_dirty_bitmap_add.data;
-    /* Should not be able to fail: IF the bitmap was added via .prepare(),
-     * then the node reference and bitmap name must have been valid.
-     */
-    if (state->prepared) {
-        qmp_block_dirty_bitmap_remove(action->node, action->name, &error_abort);
+    if (state->bitmap) {
+        bdrv_release_dirty_bitmap(state->bitmap);
     }
 }
 
@@ -2021,16 +1951,13 @@ TransactionActionDrv block_dirty_bitmap_clear_drv = {
     .clean = g_free,
 };
 
-static void block_dirty_bitmap_clear_action(BlkActionState *common,
+static void block_dirty_bitmap_clear_action(BlockDirtyBitmap *action,
                                             Transaction *tran, Error **errp)
 {
-    BlockDirtyBitmapState *state = DO_UPCAST(BlockDirtyBitmapState,
-                                             common, common);
-    BlockDirtyBitmap *action;
+    BlockDirtyBitmapState *state = g_new0(BlockDirtyBitmapState, 1);
 
     tran_add(tran, &block_dirty_bitmap_clear_drv, state);
 
-    action = common->action->u.block_dirty_bitmap_clear.data;
     state->bitmap = block_dirty_bitmap_lookup(action->node,
                                               action->name,
                                               &state->bs,
@@ -2068,16 +1995,13 @@ TransactionActionDrv block_dirty_bitmap_enable_drv = {
     .clean = g_free,
 };
 
-static void block_dirty_bitmap_enable_action(BlkActionState *common,
+static void block_dirty_bitmap_enable_action(BlockDirtyBitmap *action,
                                              Transaction *tran, Error **errp)
 {
-    BlockDirtyBitmap *action;
-    BlockDirtyBitmapState *state = DO_UPCAST(BlockDirtyBitmapState,
-                                             common, common);
+    BlockDirtyBitmapState *state = g_new0(BlockDirtyBitmapState, 1);
 
     tran_add(tran, &block_dirty_bitmap_enable_drv, state);
 
-    action = common->action->u.block_dirty_bitmap_enable.data;
     state->bitmap = block_dirty_bitmap_lookup(action->node,
                                               action->name,
                                               NULL,
@@ -2109,16 +2033,13 @@ TransactionActionDrv block_dirty_bitmap_disable_drv = {
     .clean = g_free,
 };
 
-static void block_dirty_bitmap_disable_action(BlkActionState *common,
+static void block_dirty_bitmap_disable_action(BlockDirtyBitmap *action,
                                               Transaction *tran, Error **errp)
 {
-    BlockDirtyBitmap *action;
-    BlockDirtyBitmapState *state = DO_UPCAST(BlockDirtyBitmapState,
-                                             common, common);
+    BlockDirtyBitmapState *state = g_new0(BlockDirtyBitmapState, 1);
 
     tran_add(tran, &block_dirty_bitmap_disable_drv, state);
 
-    action = common->action->u.block_dirty_bitmap_disable.data;
     state->bitmap = block_dirty_bitmap_lookup(action->node,
                                               action->name,
                                               NULL,
@@ -2150,17 +2071,13 @@ TransactionActionDrv block_dirty_bitmap_merge_drv = {
     .clean = g_free,
 };
 
-static void block_dirty_bitmap_merge_action(BlkActionState *common,
+static void block_dirty_bitmap_merge_action(BlockDirtyBitmapMerge *action,
                                             Transaction *tran, Error **errp)
 {
-    BlockDirtyBitmapMerge *action;
-    BlockDirtyBitmapState *state = DO_UPCAST(BlockDirtyBitmapState,
-                                             common, common);
+    BlockDirtyBitmapState *state = g_new0(BlockDirtyBitmapState, 1);
 
     tran_add(tran, &block_dirty_bitmap_merge_drv, state);
 
-    action = common->action->u.block_dirty_bitmap_merge.data;
-
     state->bitmap = block_dirty_bitmap_merge(action->node, action->target,
                                              action->bitmaps, &state->backup,
                                              errp);
@@ -2174,16 +2091,13 @@ TransactionActionDrv block_dirty_bitmap_remove_drv = {
     .clean = g_free,
 };
 
-static void block_dirty_bitmap_remove_action(BlkActionState *common,
+static void block_dirty_bitmap_remove_action(BlockDirtyBitmap *action,
                                              Transaction *tran, Error **errp)
 {
-    BlockDirtyBitmap *action;
-    BlockDirtyBitmapState *state = DO_UPCAST(BlockDirtyBitmapState,
-                                             common, common);
+    BlockDirtyBitmapState *state = g_new0(BlockDirtyBitmapState, 1);
 
     tran_add(tran, &block_dirty_bitmap_remove_drv, state);
 
-    action = common->action->u.block_dirty_bitmap_remove.data;
 
     state->bitmap = block_dirty_bitmap_remove(action->node, action->name,
                                               false, &state->bs, errp);
@@ -2214,13 +2128,11 @@ static void block_dirty_bitmap_remove_commit(void *opaque)
 static void abort_commit(void *opaque);
 TransactionActionDrv abort_drv = {
     .commit = abort_commit,
-    .clean = g_free,
 };
 
-static void abort_action(BlkActionState *common, Transaction *tran,
-                         Error **errp)
+static void abort_action(Transaction *tran, Error **errp)
 {
-    tran_add(tran, &abort_drv, common);
+    tran_add(tran, &abort_drv, NULL);
     error_setg(errp, "Transaction aborted using Abort action");
 }
 
@@ -2229,62 +2141,66 @@ static void abort_commit(void *opaque)
     g_assert_not_reached(); /* this action never succeeds */
 }
 
-static const BlkActionOps actions_map[] = {
-    [TRANSACTION_ACTION_KIND_BLOCKDEV_SNAPSHOT] = {
-        .instance_size = sizeof(ExternalSnapshotState),
-        .action  = external_snapshot_action,
-    },
-    [TRANSACTION_ACTION_KIND_BLOCKDEV_SNAPSHOT_SYNC] = {
-        .instance_size = sizeof(ExternalSnapshotState),
-        .action  = external_snapshot_action,
-    },
-    [TRANSACTION_ACTION_KIND_DRIVE_BACKUP] = {
-        .instance_size = sizeof(DriveBackupState),
-        .action = drive_backup_action,
-    },
-    [TRANSACTION_ACTION_KIND_BLOCKDEV_BACKUP] = {
-        .instance_size = sizeof(BlockdevBackupState),
-        .action = blockdev_backup_action,
-    },
-    [TRANSACTION_ACTION_KIND_ABORT] = {
-        .instance_size = sizeof(BlkActionState),
-        .action = abort_action,
-    },
-    [TRANSACTION_ACTION_KIND_BLOCKDEV_SNAPSHOT_INTERNAL_SYNC] = {
-        .instance_size = sizeof(InternalSnapshotState),
-        .action  = internal_snapshot_action,
-    },
-    [TRANSACTION_ACTION_KIND_BLOCK_DIRTY_BITMAP_ADD] = {
-        .instance_size = sizeof(BlockDirtyBitmapState),
-        .action = block_dirty_bitmap_add_action,
-    },
-    [TRANSACTION_ACTION_KIND_BLOCK_DIRTY_BITMAP_CLEAR] = {
-        .instance_size = sizeof(BlockDirtyBitmapState),
-        .action = block_dirty_bitmap_clear_action,
-    },
-    [TRANSACTION_ACTION_KIND_BLOCK_DIRTY_BITMAP_ENABLE] = {
-        .instance_size = sizeof(BlockDirtyBitmapState),
-        .action = block_dirty_bitmap_enable_action,
-    },
-    [TRANSACTION_ACTION_KIND_BLOCK_DIRTY_BITMAP_DISABLE] = {
-        .instance_size = sizeof(BlockDirtyBitmapState),
-        .action = block_dirty_bitmap_disable_action,
-    },
-    [TRANSACTION_ACTION_KIND_BLOCK_DIRTY_BITMAP_MERGE] = {
-        .instance_size = sizeof(BlockDirtyBitmapState),
-        .action = block_dirty_bitmap_merge_action,
-    },
-    [TRANSACTION_ACTION_KIND_BLOCK_DIRTY_BITMAP_REMOVE] = {
-        .instance_size = sizeof(BlockDirtyBitmapState),
-        .action = block_dirty_bitmap_remove_action,
-    },
-    /* Where are transactions for MIRROR, COMMIT and STREAM?
+static void transaction_action(TransactionAction *act, JobTxn *block_job_txn,
+                               Transaction *tran, Error **errp)
+{
+    switch (act->type) {
+    case TRANSACTION_ACTION_KIND_BLOCKDEV_SNAPSHOT:
+    case TRANSACTION_ACTION_KIND_BLOCKDEV_SNAPSHOT_SYNC:
+        external_snapshot_action(act, tran, errp);
+        return;
+    case TRANSACTION_ACTION_KIND_DRIVE_BACKUP:
+        drive_backup_action(act->u.drive_backup.data,
+                            block_job_txn, tran, errp);
+        return;
+    case TRANSACTION_ACTION_KIND_BLOCKDEV_BACKUP:
+        blockdev_backup_action(act->u.blockdev_backup.data,
+                               block_job_txn, tran, errp);
+        return;
+    case TRANSACTION_ACTION_KIND_ABORT:
+        abort_action(tran, errp);
+        return;
+    case TRANSACTION_ACTION_KIND_BLOCKDEV_SNAPSHOT_INTERNAL_SYNC:
+        internal_snapshot_action(act->u.blockdev_snapshot_internal_sync.data,
+                                 tran, errp);
+        return;
+    case TRANSACTION_ACTION_KIND_BLOCK_DIRTY_BITMAP_ADD:
+        block_dirty_bitmap_add_action(act->u.block_dirty_bitmap_add.data,
+                                      tran, errp);
+        return;
+    case TRANSACTION_ACTION_KIND_BLOCK_DIRTY_BITMAP_CLEAR:
+        block_dirty_bitmap_clear_action(act->u.block_dirty_bitmap_clear.data,
+                                        tran, errp);
+        return;
+    case TRANSACTION_ACTION_KIND_BLOCK_DIRTY_BITMAP_ENABLE:
+        block_dirty_bitmap_enable_action(act->u.block_dirty_bitmap_enable.data,
+                                         tran, errp);
+        return;
+    case TRANSACTION_ACTION_KIND_BLOCK_DIRTY_BITMAP_DISABLE:
+        block_dirty_bitmap_disable_action(
+                act->u.block_dirty_bitmap_disable.data, tran, errp);
+        return;
+    case TRANSACTION_ACTION_KIND_BLOCK_DIRTY_BITMAP_MERGE:
+        block_dirty_bitmap_merge_action(act->u.block_dirty_bitmap_merge.data,
+                                        tran, errp);
+        return;
+    case TRANSACTION_ACTION_KIND_BLOCK_DIRTY_BITMAP_REMOVE:
+        block_dirty_bitmap_remove_action(act->u.block_dirty_bitmap_remove.data,
+                                         tran, errp);
+        return;
+    /*
+     * Where are transactions for MIRROR, COMMIT and STREAM?
      * Although these blockjobs use transaction callbacks like the backup job,
      * these jobs do not necessarily adhere to transaction semantics.
      * These jobs may not fully undo all of their actions on abort, nor do they
      * necessarily work in transactions with more than one job in them.
      */
-};
+    case TRANSACTION_ACTION_KIND__MAX:
+    default:
+        g_assert_not_reached();
+    };
+}
+
 
 /*
  * 'Atomic' group operations.  The operations are performed as a set, and if
@@ -2330,21 +2246,7 @@ void qmp_transaction(TransactionActionList *actions,
 
     /* We don't do anything in this loop that commits us to the operations */
     for (act = actions; act; act = act->next) {
-        TransactionAction *dev_info = act->value;
-        const BlkActionOps *ops;
-        BlkActionState *state;
-
-        assert(dev_info->type < ARRAY_SIZE(actions_map));
-
-        ops = &actions_map[dev_info->type];
-        assert(ops->instance_size > 0);
-
-        state = g_malloc0(ops->instance_size);
-        state->ops = ops;
-        state->action = dev_info;
-        state->block_job_txn = block_job_txn;
-
-        state->ops->action(state, tran, &local_err);
+        transaction_action(act->value, block_job_txn, tran, &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
             goto delete_and_fail;
-- 
2.35.1


