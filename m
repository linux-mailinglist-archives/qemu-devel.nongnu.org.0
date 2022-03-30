Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 925104ED069
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:49:57 +0200 (CEST)
Received: from localhost ([::1]:58136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZi4a-0002mP-D4
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:49:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZft4-0008Fw-EI
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:54 -0400
Received: from [2a00:1450:4864:20::12f] (port=36447
 helo=mail-lf1-x12f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfsz-0003KW-Ty
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:54 -0400
Received: by mail-lf1-x12f.google.com with SMTP id bt26so38062676lfb.3
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wHEjVA+gzvp0VpNl4sFfu958kbbKJoxEzsV0SpzLrAU=;
 b=t9COrzNX/HzPOqRWnBygAv6aFsE6LP9urhzXaov3UCY5pfRilR8jwEZ2Evf8t3HQBk
 OcG7Aw3lxzOgKC7JZ6zH/o5+l0TYVnF1Q7qWC8KTO8ZNbznEjp1E8sedEumXg6Fb6JVd
 JVE0TWoz8wVrwzOS5KO7YGJ9P1LV5rsAj9n6Oqr3EVgTYEiAgsHj833qzhcch5oWwVYo
 VjsFPGyBwFinrhGAEJT3uUO47fWa8Eai+xZiqPxO8FSJeY5KDek9IzAuivZlr5edUfKw
 IwUwlwFaDxh7JyRMTrGVhrlkuT/NheJg0o0DaOKRxR98jyKn/gLeEhJLxTHHoWNZvyKz
 GdGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wHEjVA+gzvp0VpNl4sFfu958kbbKJoxEzsV0SpzLrAU=;
 b=54pxnihU3f0SSP3vP7/83NBsEKb7OJcIU0+dnIzwTH6AIjnH1JUnSEvBm6WzacY7tD
 p84yKvGn4ySu9GGjcTnM1XPjrAfjFotaJgGrmPGJOGajMSIy6RxnASteTPUdtIrhMD95
 0/i2bm9BfzP7IJc6nCcMtMyIc1KJpBcrkV0EtjYV0Lf6qndn7RaDqrBGznr1l6sXVDON
 0Rm28e7BMfpJywPwEiDcASfa3pu3Vmgd5VM6kM+kumV6LjamOIj4wF23ZltPB1gDhyxN
 /yjDHCqenrQhrLpTDor42gBRjVZWlThRHFqHRv9kH+3WQKsLyvo3kZMyEU1TwSn2jkyR
 Frqg==
X-Gm-Message-State: AOAM531fEflIpTicurJFYKt+feTt3S2iIE7RTp0NlBndxwGTpKuDFOSN
 lWCG2+FTRueozSdHOLalGMDcNQ==
X-Google-Smtp-Source: ABdhPJxLW6c49Cw7JH3LVX3B4B1zQflwlSMtxqqv2cZJ/C316gUYFGaSlcAjk/ViLVqe1KIYRqUX7A==
X-Received: by 2002:a05:6512:3b0e:b0:44a:547d:c8b8 with SMTP id
 f14-20020a0565123b0e00b0044a547dc8b8mr8451041lfv.373.1648675788204; 
 Wed, 30 Mar 2022 14:29:48 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:47 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 27/45] blockdev: qmp_transaction: drop extra generic layer
Date: Thu, 31 Mar 2022 00:28:44 +0300
Message-Id: <20220330212902.590099-28-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x12f.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Mar 2022 19:17:26 -0400
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, hreitz@redhat.com,
 vsementsov@openvz.org
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 blockdev.c | 278 +++++++++++++++++------------------------------------
 1 file changed, 89 insertions(+), 189 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 3c9e826355..a7287bf64f 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1178,54 +1178,8 @@ out_aio_context:
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
- *
- * Always run under BQL.
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
@@ -1238,7 +1192,7 @@ TransactionActionDrv internal_snapshot_drv = {
     .clean = internal_snapshot_clean,
 };
 
-static void internal_snapshot_action(BlkActionState *common,
+static void internal_snapshot_action(BlockdevSnapshotInternal *internal,
                                      Transaction *tran, Error **errp)
 {
     Error *local_err = NULL;
@@ -1248,16 +1202,10 @@ static void internal_snapshot_action(BlkActionState *common,
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
@@ -1385,7 +1333,6 @@ static void internal_snapshot_clean(void *opaque)
 
 /* external snapshot private data */
 typedef struct ExternalSnapshotState {
-    BlkActionState common;
     BlockDriverState *old_bs;
     BlockDriverState *new_bs;
     bool overlay_appended;
@@ -1400,8 +1347,8 @@ TransactionActionDrv external_snapshot_drv = {
     .clean = external_snapshot_clean,
 };
 
-static void external_snapshot_action(BlkActionState *common, Transaction *tran,
-                                     Error **errp)
+static void external_snapshot_action(TransactionAction *action,
+                                     Transaction *tran, Error **errp)
 {
     int ret;
     int flags = 0;
@@ -1414,9 +1361,7 @@ static void external_snapshot_action(BlkActionState *common, Transaction *tran,
     const char *snapshot_ref;
     /* File name of the new image (for 'blockdev-snapshot-sync') */
     const char *new_image_file;
-    ExternalSnapshotState *state =
-                             DO_UPCAST(ExternalSnapshotState, common, common);
-    TransactionAction *action = common->action;
+    ExternalSnapshotState *state = g_new0(ExternalSnapshotState, 1);
     AioContext *aio_context;
     uint64_t perm, shared;
 
@@ -1649,7 +1594,6 @@ static void external_snapshot_clean(void *opaque)
 }
 
 typedef struct DriveBackupState {
-    BlkActionState common;
     BlockDriverState *bs;
     BlockJob *job;
 } DriveBackupState;
@@ -1669,11 +1613,11 @@ TransactionActionDrv drive_backup_drv = {
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
@@ -1688,9 +1632,6 @@ static void drive_backup_action(BlkActionState *common, Transaction *tran,
 
     tran_add(tran, &drive_backup_drv, state);
 
-    assert(common->action->type == TRANSACTION_ACTION_KIND_DRIVE_BACKUP);
-    backup = common->action->u.drive_backup.data;
-
     if (!backup->has_mode) {
         backup->mode = NEW_IMAGE_MODE_ABSOLUTE_PATHS;
     }
@@ -1810,7 +1751,7 @@ static void drive_backup_action(BlkActionState *common, Transaction *tran,
 
     state->job = do_backup_common(qapi_DriveBackup_base(backup),
                                   bs, target_bs, aio_context,
-                                  common->block_job_txn, errp);
+                                  block_job_txn, errp);
 
 unref:
     bdrv_unref(target_bs);
@@ -1868,7 +1809,6 @@ static void drive_backup_clean(void *opaque)
 }
 
 typedef struct BlockdevBackupState {
-    BlkActionState common;
     BlockDriverState *bs;
     BlockJob *job;
 } BlockdevBackupState;
@@ -1882,11 +1822,11 @@ TransactionActionDrv blockdev_backup_drv = {
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
@@ -1895,9 +1835,6 @@ static void blockdev_backup_action(BlkActionState *common, Transaction *tran,
 
     tran_add(tran, &blockdev_backup_drv, state);
 
-    assert(common->action->type == TRANSACTION_ACTION_KIND_BLOCKDEV_BACKUP);
-    backup = common->action->u.blockdev_backup.data;
-
     bs = bdrv_lookup_bs(backup->device, backup->device, errp);
     if (!bs) {
         return;
@@ -1928,7 +1865,7 @@ static void blockdev_backup_action(BlkActionState *common, Transaction *tran,
 
     state->job = do_backup_common(qapi_BlockdevBackup_base(backup),
                                   bs, target_bs, aio_context,
-                                  common->block_job_txn, errp);
+                                  block_job_txn, errp);
 
     aio_context_release(aio_context);
 }
@@ -1983,11 +1920,9 @@ static void blockdev_backup_clean(void *opaque)
 }
 
 typedef struct BlockDirtyBitmapState {
-    BlkActionState common;
     BdrvDirtyBitmap *bitmap;
     BlockDriverState *bs;
     HBitmap *backup;
-    bool prepared;
     bool was_enabled;
 } BlockDirtyBitmapState;
 
@@ -1997,17 +1932,14 @@ TransactionActionDrv block_dirty_bitmap_add_drv = {
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
@@ -2016,7 +1948,8 @@ static void block_dirty_bitmap_add_action(BlkActionState *common,
                                &local_err);
 
     if (!local_err) {
-        state->prepared = true;
+        state->bitmap = block_dirty_bitmap_lookup(action->node, action->name,
+                                                  NULL, &error_abort);
     } else {
         error_propagate(errp, local_err);
     }
@@ -2024,15 +1957,10 @@ static void block_dirty_bitmap_add_action(BlkActionState *common,
 
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
 
@@ -2044,16 +1972,13 @@ TransactionActionDrv block_dirty_bitmap_clear_drv = {
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
@@ -2091,16 +2016,13 @@ TransactionActionDrv block_dirty_bitmap_enable_drv = {
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
@@ -2132,16 +2054,13 @@ TransactionActionDrv block_dirty_bitmap_disable_drv = {
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
@@ -2173,17 +2092,13 @@ TransactionActionDrv block_dirty_bitmap_merge_drv = {
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
@@ -2197,16 +2112,13 @@ TransactionActionDrv block_dirty_bitmap_remove_drv = {
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
@@ -2237,13 +2149,11 @@ static void block_dirty_bitmap_remove_commit(void *opaque)
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
 
@@ -2252,62 +2162,66 @@ static void abort_commit(void *opaque)
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
@@ -2357,21 +2271,7 @@ void qmp_transaction(TransactionActionList *actions,
 
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


