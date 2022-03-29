Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 254FC4EB4FF
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 23:04:16 +0200 (CEST)
Received: from localhost ([::1]:53424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZJ0h-00022c-6l
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 17:04:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIg3-0005ad-6K; Tue, 29 Mar 2022 16:42:55 -0400
Received: from smtp48.i.mail.ru ([94.100.177.108]:59626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIg0-0006nb-55; Tue, 29 Mar 2022 16:42:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=Qlu5TQVlbpbKwvrZesIqeYzt9S5eU71aQtWwAtBTsNg=; 
 t=1648586572;x=1649191972; 
 b=BpVZ7yBD4zMNjfqwyCpjTQqRK72ioBL+92KUlGCRmPB3feduezqkx1CHQJDER+K1/0AYbqMy1e8LHrcKAklcovHfHB+TnWojG7KxwlkKKYeFhqsolt0OxBNNw7x3ZvCPQy0SfcaAvaz2jsfIxa/VH0yAMKdnEpt4YL52BTmrtORrry0YAuinvpVbCeuwRcGd0AKkxFxBzyFZh+jcAIRczZqUvC4s16bacf3zdhhC5m1x+c1WMwhRDuI9LTGmg18NrdhtTb6QnUdKlfAMHwiO+F9GIBd5yvjzpw5dDMyk/sqjPq/6Y0g/C7X59kzbd5at7qQ/u/HvvFcfG+Yvr6gw3w==;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZIfd-000374-TJ; Tue, 29 Mar 2022 23:42:30 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 v.sementsov-og@mail.ru, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v4 23/45] blockdev: refactor transaction to use Transaction API
Date: Tue, 29 Mar 2022 23:40:45 +0300
Message-Id: <20220329204107.411011-24-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329204107.411011-1-v.sementsov-og@mail.ru>
References: <20220329204107.411011-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp48.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD9B83DD81DD066BE64C2837EED01D56C49DA1AB86A7F8FE1DD182A05F5380850404C228DA9ACA6FE273ED037D682E3C552B496D7BB75791CDEB85DC6BE6DCDAA37BFA67DBE985D0073
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7544B1CCE26E01C74EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006377BA6DB23C50317A38638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D822EF8FD9C038863780B75E467BF502116F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7820CF4CC0E318EFB9FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18F04B652EEC242312D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B3733B5EC72352B9FA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FCF4A5F967B28177F93AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F7900637A9B5CFA561830F3FD81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F10D407B19AF7F75057739F23D657EF2BB5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8183A4AFAF3EA6BDC446469D8A8717206BBF593E0A4FA3DD8F5240781EF00141E84B1FB700CF37E14F69C2B6934AE262D3EE7EAB7254005DCED7532B743992DF240BDC6A1CF3F042BAD6DF99611D93F60EFD07623A0E6354027699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34411AA3F52B5778B6598770607427CD83FB5BEC296DEFAA3029C51296FA8BADC7388E83D23675D7D81D7E09C32AA3244C021499FF07F76E47476C1CE87E484688B4DF56057A86259F8D5DD81C2BAB7D1D
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX92LdC94eGas+imftwS6eg==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE9A37DFE606991DEFF16C4A846C183C24922B1C7B4EBC51AEE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
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

We are going to add more block-graph modifying transaction actions,
and block-graph modifying functions are already based on Transaction
API.

Next, we'll need to separately update permissions after several
graph-modifying actions, and this would be simple with help of
Transaction API.

So, now let's just transform what we have into new-style transaction
actions.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 blockdev.c | 317 +++++++++++++++++++++++++++++++----------------------
 1 file changed, 186 insertions(+), 131 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 8197165bb5..65f01a31d1 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1177,10 +1177,7 @@ typedef struct BlkActionState BlkActionState;
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
@@ -1212,6 +1209,12 @@ typedef struct InternalSnapshotState {
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
@@ -1226,8 +1229,8 @@ static int action_check_completion_mode(BlkActionState *s, Error **errp)
     return 0;
 }
 
-static void internal_snapshot_prepare(BlkActionState *common,
-                                      Error **errp)
+static void internal_snapshot_action(BlkActionState *common,
+                                     Transaction *tran, Error **errp)
 {
     Error *local_err = NULL;
     const char *device;
@@ -1246,6 +1249,8 @@ static void internal_snapshot_prepare(BlkActionState *common,
     internal = common->action->u.blockdev_snapshot_internal_sync.data;
     state = DO_UPCAST(InternalSnapshotState, common, common);
 
+    tran_add(tran, &internal_snapshot_drv, state);
+
     /* 1. parse input */
     device = internal->device;
     name = internal->name;
@@ -1330,10 +1335,9 @@ out:
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
@@ -1357,10 +1361,9 @@ static void internal_snapshot_abort(BlkActionState *common)
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
@@ -1373,6 +1376,8 @@ static void internal_snapshot_clean(BlkActionState *common)
     bdrv_drained_end(state->bs);
 
     aio_context_release(aio_context);
+
+    g_free(state);
 }
 
 /* external snapshot private data */
@@ -1383,8 +1388,17 @@ typedef struct ExternalSnapshotState {
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
@@ -1403,6 +1417,8 @@ static void external_snapshot_prepare(BlkActionState *common,
     AioContext *aio_context;
     uint64_t perm, shared;
 
+    tran_add(tran, &external_snapshot_drv, state);
+
     /* 'blockdev-snapshot' and 'blockdev-snapshot-sync' have similar
      * purpose but a different set of parameters */
     switch (action->type) {
@@ -1552,10 +1568,9 @@ out:
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
@@ -1571,10 +1586,9 @@ static void external_snapshot_commit(BlkActionState *common)
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
@@ -1614,10 +1628,9 @@ static void external_snapshot_abort(BlkActionState *common)
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
@@ -1631,6 +1644,8 @@ static void external_snapshot_clean(BlkActionState *common)
     bdrv_unref(state->new_bs);
 
     aio_context_release(aio_context);
+
+    g_free(state);
 }
 
 typedef struct DriveBackupState {
@@ -1645,7 +1660,17 @@ static BlockJob *do_backup_common(BackupCommon *backup,
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
@@ -1661,6 +1686,8 @@ static void drive_backup_prepare(BlkActionState *common, Error **errp)
     bool set_backing_hd = false;
     int ret;
 
+    tran_add(tran, &drive_backup_drv, state);
+
     assert(common->action->type == TRANSACTION_ACTION_KIND_DRIVE_BACKUP);
     backup = common->action->u.drive_backup.data;
 
@@ -1791,9 +1818,9 @@ out:
     aio_context_release(aio_context);
 }
 
-static void drive_backup_commit(BlkActionState *common)
+static void drive_backup_commit(void *opaque)
 {
-    DriveBackupState *state = DO_UPCAST(DriveBackupState, common, common);
+    DriveBackupState *state = opaque;
     AioContext *aio_context;
 
     aio_context = bdrv_get_aio_context(state->bs);
@@ -1805,9 +1832,9 @@ static void drive_backup_commit(BlkActionState *common)
     aio_context_release(aio_context);
 }
 
-static void drive_backup_abort(BlkActionState *common)
+static void drive_backup_abort(void *opaque)
 {
-    DriveBackupState *state = DO_UPCAST(DriveBackupState, common, common);
+    DriveBackupState *state = opaque;
 
     if (state->job) {
         AioContext *aio_context;
@@ -1821,9 +1848,9 @@ static void drive_backup_abort(BlkActionState *common)
     }
 }
 
-static void drive_backup_clean(BlkActionState *common)
+static void drive_backup_clean(void *opaque)
 {
-    DriveBackupState *state = DO_UPCAST(DriveBackupState, common, common);
+    DriveBackupState *state = opaque;
     AioContext *aio_context;
 
     if (!state->bs) {
@@ -1836,6 +1863,8 @@ static void drive_backup_clean(BlkActionState *common)
     bdrv_drained_end(state->bs);
 
     aio_context_release(aio_context);
+
+    g_free(state);
 }
 
 typedef struct BlockdevBackupState {
@@ -1844,7 +1873,17 @@ typedef struct BlockdevBackupState {
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
@@ -1854,6 +1893,8 @@ static void blockdev_backup_prepare(BlkActionState *common, Error **errp)
     AioContext *old_context;
     int ret;
 
+    tran_add(tran, &blockdev_backup_drv, state);
+
     assert(common->action->type == TRANSACTION_ACTION_KIND_BLOCKDEV_BACKUP);
     backup = common->action->u.blockdev_backup.data;
 
@@ -1892,9 +1933,9 @@ static void blockdev_backup_prepare(BlkActionState *common, Error **errp)
     aio_context_release(aio_context);
 }
 
-static void blockdev_backup_commit(BlkActionState *common)
+static void blockdev_backup_commit(void *opaque)
 {
-    BlockdevBackupState *state = DO_UPCAST(BlockdevBackupState, common, common);
+    BlockdevBackupState *state = opaque;
     AioContext *aio_context;
 
     aio_context = bdrv_get_aio_context(state->bs);
@@ -1906,9 +1947,9 @@ static void blockdev_backup_commit(BlkActionState *common)
     aio_context_release(aio_context);
 }
 
-static void blockdev_backup_abort(BlkActionState *common)
+static void blockdev_backup_abort(void *opaque)
 {
-    BlockdevBackupState *state = DO_UPCAST(BlockdevBackupState, common, common);
+    BlockdevBackupState *state = opaque;
 
     if (state->job) {
         AioContext *aio_context;
@@ -1922,9 +1963,9 @@ static void blockdev_backup_abort(BlkActionState *common)
     }
 }
 
-static void blockdev_backup_clean(BlkActionState *common)
+static void blockdev_backup_clean(void *opaque)
 {
-    BlockdevBackupState *state = DO_UPCAST(BlockdevBackupState, common, common);
+    BlockdevBackupState *state = opaque;
     AioContext *aio_context;
 
     if (!state->bs) {
@@ -1937,6 +1978,8 @@ static void blockdev_backup_clean(BlkActionState *common)
     bdrv_drained_end(state->bs);
 
     aio_context_release(aio_context);
+
+    g_free(state);
 }
 
 typedef struct BlockDirtyBitmapState {
@@ -1948,14 +1991,22 @@ typedef struct BlockDirtyBitmapState {
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
@@ -1975,13 +2026,12 @@ static void block_dirty_bitmap_add_prepare(BlkActionState *common,
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
@@ -1990,13 +2040,23 @@ static void block_dirty_bitmap_add_abort(BlkActionState *common)
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
@@ -2017,31 +2077,37 @@ static void block_dirty_bitmap_clear_prepare(BlkActionState *common,
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
@@ -2063,23 +2129,30 @@ static void block_dirty_bitmap_enable_prepare(BlkActionState *common,
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
@@ -2101,23 +2174,30 @@ static void block_dirty_bitmap_disable_prepare(BlkActionState *common,
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
@@ -2129,13 +2209,23 @@ static void block_dirty_bitmap_merge_prepare(BlkActionState *common,
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
@@ -2150,10 +2240,9 @@ static void block_dirty_bitmap_remove_prepare(BlkActionState *common,
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
@@ -2161,21 +2250,28 @@ static void block_dirty_bitmap_remove_abort(BlkActionState *common)
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
@@ -2183,75 +2279,51 @@ static void abort_commit(BlkActionState *common)
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
@@ -2291,11 +2363,8 @@ void qmp_transaction(TransactionActionList *dev_list,
 {
     TransactionActionList *dev_entry = dev_list;
     JobTxn *block_job_txn = NULL;
-    BlkActionState *state, *next;
     Error *local_err = NULL;
-
-    QTAILQ_HEAD(, BlkActionState) snap_bdrv_states;
-    QTAILQ_INIT(&snap_bdrv_states);
+    Transaction *tran = tran_new();
 
     /* Does this transaction get canceled as a group on failure?
      * If not, we don't really need to make a JobTxn.
@@ -2312,6 +2381,7 @@ void qmp_transaction(TransactionActionList *dev_list,
     while (NULL != dev_entry) {
         TransactionAction *dev_info = NULL;
         const BlkActionOps *ops;
+        BlkActionState *state;
 
         dev_info = dev_entry->value;
         dev_entry = dev_entry->next;
@@ -2326,38 +2396,23 @@ void qmp_transaction(TransactionActionList *dev_list,
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
2.35.1


