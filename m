Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 928AF6025BF
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 09:31:52 +0200 (CEST)
Received: from localhost ([::1]:57610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okh4n-0005My-J3
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 03:31:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okg6L-0005jw-EW
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:29:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okg66-0001FY-Ey
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:29:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666074535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=545NtGfar2C297UFNLSeyfOT/TwBAWg/X/q3zMGhUXA=;
 b=dFyVF6pFcPfY6hQsI6WyZPdmL0BBtxOfP3lmE6Vj0ohaABdLRvDXUpi1vu2mRMzDDGOZmP
 ++aidOYDT7JSCJXvlhdiyWuQ5uIQpBz7op0qGmmPvCpmC+WdVe3rgPPNOs3ueQqvkjnoLn
 LXYoFEROijXkdBRe1zIXv9o5I47wd4o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-gLXF-6EGPcGg-XjT-GE8sw-1; Tue, 18 Oct 2022 02:28:52 -0400
X-MC-Unique: gLXF-6EGPcGg-XjT-GE8sw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 19F5B3C0D18D;
 Tue, 18 Oct 2022 06:28:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 846A41731B;
 Tue, 18 Oct 2022 06:28:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3C75C21E6680; Tue, 18 Oct 2022 08:28:49 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, jsnow@redhat.com, eblake@redhat.com,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org
Subject: [PATCH v2 08/28] qapi block: Elide redundant has_FOO in generated C
Date: Tue, 18 Oct 2022 08:28:29 +0200
Message-Id: <20221018062849.3420573-9-armbru@redhat.com>
In-Reply-To: <20221018062849.3420573-1-armbru@redhat.com>
References: <20221018062849.3420573-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The has_FOO for pointer-valued FOO are redundant, except for arrays.
They are also a nuisance to work with.  Recent commit "qapi: Start to
elide redundant has_FOO in generated C" provided the means to elide
them step by step.  This is the step for qapi/block*.json.

Said commit explains the transformation in more detail.

There is one instance of the Invariant violation mentioned there:
qcow2_signal_corruption() passes false, "" when node_name is an empty
string.  Take care to pass NULL then.

Additionally, helper bdrv_latency_histogram_stats() loses its output
parameters and returns a value instead.

Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-block@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 block/block-backend.c          |   2 +-
 block/copy-before-write.c      |   2 +-
 block/dirty-bitmap.c           |   1 -
 block/export/export.c          |   2 +-
 block/export/vduse-blk.c       |   3 +-
 block/gluster.c                |   3 -
 block/monitor/block-hmp-cmds.c |  48 ++++------
 block/qapi-sysemu.c            |  73 +++++---------
 block/qapi.c                   |  62 +++++-------
 block/qcow.c                   |  10 +-
 block/qcow2.c                  |  18 ++--
 block/qed.c                    |   2 +-
 block/quorum.c                 |   2 +-
 block/rbd.c                    |  15 +--
 block/ssh.c                    |   2 +-
 blockdev-nbd.c                 |   9 +-
 blockdev.c                     | 170 +++++++++++++--------------------
 blockjob.c                     |   2 -
 monitor/hmp-cmds.c             |   3 +-
 nbd/server.c                   |   2 +-
 qemu-img.c                     |  13 ++-
 qemu-nbd.c                     |   2 -
 scripts/qapi/schema.py         |   3 -
 23 files changed, 170 insertions(+), 279 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index aa4adf06ae..b0ef2ea174 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1861,7 +1861,7 @@ static void send_qmp_error_event(BlockBackend *blk,
     BlockDriverState *bs = blk_bs(blk);
 
     optype = is_read ? IO_OPERATION_TYPE_READ : IO_OPERATION_TYPE_WRITE;
-    qapi_event_send_block_io_error(blk_name(blk), !!bs,
+    qapi_event_send_block_io_error(blk_name(blk),
                                    bs ? bdrv_get_node_name(bs) : NULL, optype,
                                    action, blk_iostatus_is_enabled(blk),
                                    error == ENOSPC, strerror(error));
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index afbdd04489..330c812737 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -433,7 +433,7 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
         return -EINVAL;
     }
 
-    if (opts->has_bitmap) {
+    if (opts->bitmap) {
         bitmap = block_dirty_bitmap_lookup(opts->bitmap->node,
                                            opts->bitmap->name, NULL, errp);
         if (!bitmap) {
diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index bf3dc0512a..9c39550698 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -541,7 +541,6 @@ BlockDirtyInfoList *bdrv_query_dirty_bitmaps(BlockDriverState *bs)
 
         info->count = bdrv_get_dirty_count(bm);
         info->granularity = bdrv_dirty_bitmap_granularity(bm);
-        info->has_name = !!bm->name;
         info->name = g_strdup(bm->name);
         info->recording = bdrv_dirty_bitmap_recording(bm);
         info->busy = bdrv_dirty_bitmap_busy(bm);
diff --git a/block/export/export.c b/block/export/export.c
index 4744862915..da7480372c 100644
--- a/block/export/export.c
+++ b/block/export/export.c
@@ -114,7 +114,7 @@ BlockExport *blk_exp_add(BlockExportOptions *export, Error **errp)
     ctx = bdrv_get_aio_context(bs);
     aio_context_acquire(ctx);
 
-    if (export->has_iothread) {
+    if (export->iothread) {
         IOThread *iothread;
         AioContext *new_ctx;
         Error **set_context_errp;
diff --git a/block/export/vduse-blk.c b/block/export/vduse-blk.c
index f101c24c3f..350d6fdaf0 100644
--- a/block/export/vduse-blk.c
+++ b/block/export/vduse-blk.c
@@ -265,8 +265,7 @@ static int vduse_blk_exp_create(BlockExport *exp, BlockExportOptions *opts,
     }
     vblk_exp->num_queues = num_queues;
     vblk_exp->handler.blk = exp->blk;
-    vblk_exp->handler.serial = g_strdup(vblk_opts->has_serial ?
-                                        vblk_opts->serial : "");
+    vblk_exp->handler.serial = g_strdup(vblk_opts->serial ?: "");
     vblk_exp->handler.logical_block_size = logical_block_size;
     vblk_exp->handler.writable = opts->writable;
 
diff --git a/block/gluster.c b/block/gluster.c
index bb1144cf6a..ee40eac28f 100644
--- a/block/gluster.c
+++ b/block/gluster.c
@@ -830,7 +830,6 @@ static int qemu_gluster_open(BlockDriverState *bs,  QDict *options,
     s->logfile = g_strdup(logfile ? logfile : GLUSTER_LOGFILE_DEFAULT);
 
     gconf->logfile = g_strdup(s->logfile);
-    gconf->has_logfile = true;
 
     s->glfs = qemu_gluster_init(gconf, filename, options, errp);
     if (!s->glfs) {
@@ -917,7 +916,6 @@ static int qemu_gluster_reopen_prepare(BDRVReopenState *state,
     gconf->debug = s->debug;
     gconf->has_debug = true;
     gconf->logfile = g_strdup(s->logfile);
-    gconf->has_logfile = true;
 
     /*
      * If 'state->bs->exact_filename' is empty, 'state->options' should contain
@@ -1162,7 +1160,6 @@ static int coroutine_fn qemu_gluster_co_create_opts(BlockDriver *drv,
     if (!gconf->logfile) {
         gconf->logfile = g_strdup(GLUSTER_LOGFILE_DEFAULT);
     }
-    gconf->has_logfile = true;
 
     ret = qemu_gluster_parse(gconf, filename, NULL, errp);
     if (ret < 0) {
diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
index 939a520d17..ea9f28cf48 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -241,7 +241,6 @@ void hmp_drive_mirror(Monitor *mon, const QDict *qdict)
     DriveMirror mirror = {
         .device = (char *)qdict_get_str(qdict, "device"),
         .target = (char *)filename,
-        .has_format = !!format,
         .format = (char *)format,
         .sync = full ? MIRROR_SYNC_MODE_FULL : MIRROR_SYNC_MODE_TOP,
         .has_mode = true,
@@ -270,7 +269,6 @@ void hmp_drive_backup(Monitor *mon, const QDict *qdict)
     DriveBackup backup = {
         .device = (char *)device,
         .target = (char *)filename,
-        .has_format = !!format,
         .format = (char *)format,
         .sync = full ? MIRROR_SYNC_MODE_FULL : MIRROR_SYNC_MODE_TOP,
         .has_mode = true,
@@ -360,9 +358,7 @@ void hmp_snapshot_blkdev(Monitor *mon, const QDict *qdict)
     }
 
     mode = reuse ? NEW_IMAGE_MODE_EXISTING : NEW_IMAGE_MODE_ABSOLUTE_PATHS;
-    qmp_blockdev_snapshot_sync(true, device, false, NULL,
-                               filename, false, NULL,
-                               !!format, format,
+    qmp_blockdev_snapshot_sync(device, NULL, filename, NULL, format,
                                true, mode, &err);
 end:
     hmp_handle_error(mon, err);
@@ -385,8 +381,7 @@ void hmp_snapshot_delete_blkdev_internal(Monitor *mon, const QDict *qdict)
     const char *id = qdict_get_try_str(qdict, "id");
     Error *err = NULL;
 
-    qmp_blockdev_snapshot_delete_internal_sync(device, !!id, id,
-                                               true, name, &err);
+    qmp_blockdev_snapshot_delete_internal_sync(device, id, name, &err);
     hmp_handle_error(mon, err);
 }
 
@@ -427,7 +422,7 @@ void hmp_nbd_server_start(Monitor *mon, const QDict *qdict)
     block_list = qmp_query_block(NULL);
 
     for (info = block_list; info; info = info->next) {
-        if (!info->value->has_inserted) {
+        if (!info->value->inserted) {
             continue;
         }
 
@@ -460,7 +455,6 @@ void hmp_nbd_server_add(Monitor *mon, const QDict *qdict)
 
     NbdServerAddOptions export = {
         .device         = (char *) device,
-        .has_name       = !!name,
         .name           = (char *) name,
         .has_writable   = true,
         .writable       = writable,
@@ -495,7 +489,7 @@ void hmp_block_resize(Monitor *mon, const QDict *qdict)
     int64_t size = qdict_get_int(qdict, "size");
     Error *err = NULL;
 
-    qmp_block_resize(true, device, false, NULL, size, &err);
+    qmp_block_resize(device, NULL, size, &err);
     hmp_handle_error(mon, err);
 }
 
@@ -506,11 +500,10 @@ void hmp_block_stream(Monitor *mon, const QDict *qdict)
     const char *base = qdict_get_try_str(qdict, "base");
     int64_t speed = qdict_get_try_int(qdict, "speed", 0);
 
-    qmp_block_stream(true, device, device, base != NULL, base, false, NULL,
-                     false, NULL, false, NULL,
-                     qdict_haskey(qdict, "speed"), speed, true,
-                     BLOCKDEV_ON_ERROR_REPORT, false, NULL, false, false, false,
-                     false, &error);
+    qmp_block_stream(device, device, base, NULL, NULL, NULL,
+                     qdict_haskey(qdict, "speed"), speed,
+                     true, BLOCKDEV_ON_ERROR_REPORT, NULL,
+                     false, false, false, false, &error);
 
     hmp_handle_error(mon, error);
 }
@@ -534,10 +527,8 @@ void hmp_block_set_io_throttle(Monitor *mon, const QDict *qdict)
      * version has only one, so we must decide which one to pass.
      */
     if (blk_by_name(device)) {
-        throttle.has_device = true;
         throttle.device = device;
     } else {
-        throttle.has_id = true;
         throttle.id = device;
     }
 
@@ -551,7 +542,7 @@ void hmp_eject(Monitor *mon, const QDict *qdict)
     const char *device = qdict_get_str(qdict, "device");
     Error *err = NULL;
 
-    qmp_eject(true, device, false, NULL, true, force, &err);
+    qmp_eject(device, NULL, true, force, &err);
     hmp_handle_error(mon, err);
 }
 
@@ -635,18 +626,18 @@ static void print_block_info(Monitor *mon, BlockInfo *info,
 {
     ImageInfo *image_info;
 
-    assert(!info || !info->has_inserted || info->inserted == inserted);
+    assert(!info || !info->inserted || info->inserted == inserted);
 
     if (info && *info->device) {
         monitor_puts(mon, info->device);
-        if (inserted && inserted->has_node_name) {
+        if (inserted && inserted->node_name) {
             monitor_printf(mon, " (%s)", inserted->node_name);
         }
     } else {
         assert(info || inserted);
         monitor_puts(mon,
-                     inserted && inserted->has_node_name ? inserted->node_name
-                     : info && info->has_qdev ? info->qdev
+                     inserted && inserted->node_name ? inserted->node_name
+                     : info && info->qdev ? info->qdev
                      : "<anonymous>");
     }
 
@@ -661,7 +652,7 @@ static void print_block_info(Monitor *mon, BlockInfo *info,
     }
 
     if (info) {
-        if (info->has_qdev) {
+        if (info->qdev) {
             monitor_printf(mon, "    Attached to:      %s\n", info->qdev);
         }
         if (info->has_io_status && info->io_status != BLOCK_DEVICE_IO_STATUS_OK) {
@@ -686,7 +677,7 @@ static void print_block_info(Monitor *mon, BlockInfo *info,
                    inserted->cache->direct ? ", direct" : "",
                    inserted->cache->no_flush ? ", ignore flushes" : "");
 
-    if (inserted->has_backing_file) {
+    if (inserted->backing_file) {
         monitor_printf(mon,
                        "    Backing file:     %s "
                        "(chain depth: %" PRId64 ")\n",
@@ -735,7 +726,7 @@ static void print_block_info(Monitor *mon, BlockInfo *info,
         image_info = inserted->image;
         while (1) {
                 bdrv_image_info_dump(image_info);
-            if (image_info->has_backing_image) {
+            if (image_info->backing_image) {
                 image_info = image_info->backing_image;
             } else {
                 break;
@@ -769,8 +760,7 @@ void hmp_info_block(Monitor *mon, const QDict *qdict)
             monitor_printf(mon, "\n");
         }
 
-        print_block_info(mon, info->value, info->value->has_inserted
-                                           ? info->value->inserted : NULL,
+        print_block_info(mon, info->value, info->value->inserted,
                          verbose);
         printed = true;
     }
@@ -784,7 +774,7 @@ void hmp_info_block(Monitor *mon, const QDict *qdict)
     /* Print node information */
     blockdev_list = qmp_query_named_block_nodes(false, false, NULL);
     for (blockdev = blockdev_list; blockdev; blockdev = blockdev->next) {
-        assert(blockdev->value->has_node_name);
+        assert(blockdev->value->node_name);
         if (device && strcmp(device, blockdev->value->node_name)) {
             continue;
         }
@@ -805,7 +795,7 @@ void hmp_info_blockstats(Monitor *mon, const QDict *qdict)
     stats_list = qmp_query_blockstats(false, false, NULL);
 
     for (stats = stats_list; stats; stats = stats->next) {
-        if (!stats->value->has_device) {
+        if (!stats->value->device) {
             continue;
         }
 
diff --git a/block/qapi-sysemu.c b/block/qapi-sysemu.c
index 680c7ee342..0c7a1423de 100644
--- a/block/qapi-sysemu.c
+++ b/block/qapi-sysemu.c
@@ -116,8 +116,8 @@ static int do_open_tray(const char *blk_name, const char *qdev_id,
     return 0;
 }
 
-void qmp_blockdev_open_tray(bool has_device, const char *device,
-                            bool has_id, const char *id,
+void qmp_blockdev_open_tray(const char *device,
+                            const char *id,
                             bool has_force, bool force,
                             Error **errp)
 {
@@ -127,9 +127,7 @@ void qmp_blockdev_open_tray(bool has_device, const char *device,
     if (!has_force) {
         force = false;
     }
-    rc = do_open_tray(has_device ? device : NULL,
-                      has_id ? id : NULL,
-                      force, &local_err);
+    rc = do_open_tray(device, id, force, &local_err);
     if (rc && rc != -ENOSYS && rc != -EINPROGRESS) {
         error_propagate(errp, local_err);
         return;
@@ -137,16 +135,13 @@ void qmp_blockdev_open_tray(bool has_device, const char *device,
     error_free(local_err);
 }
 
-void qmp_blockdev_close_tray(bool has_device, const char *device,
-                             bool has_id, const char *id,
+void qmp_blockdev_close_tray(const char *device,
+                             const char *id,
                              Error **errp)
 {
     BlockBackend *blk;
     Error *local_err = NULL;
 
-    device = has_device ? device : NULL;
-    id = has_id ? id : NULL;
-
     blk = qmp_get_blk(device, id, errp);
     if (!blk) {
         return;
@@ -173,17 +168,14 @@ void qmp_blockdev_close_tray(bool has_device, const char *device,
     }
 }
 
-static void blockdev_remove_medium(bool has_device, const char *device,
-                                   bool has_id, const char *id, Error **errp)
+static void blockdev_remove_medium(const char *device, const char *id,
+                                   Error **errp)
 {
     BlockBackend *blk;
     BlockDriverState *bs;
     AioContext *aio_context;
     bool has_attached_device;
 
-    device = has_device ? device : NULL;
-    id = has_id ? id : NULL;
-
     blk = qmp_get_blk(device, id, errp);
     if (!blk) {
         return;
@@ -232,7 +224,7 @@ out:
 
 void qmp_blockdev_remove_medium(const char *id, Error **errp)
 {
-    blockdev_remove_medium(false, NULL, true, id, errp);
+    blockdev_remove_medium(NULL, id, errp);
 }
 
 static void qmp_blockdev_insert_anon_medium(BlockBackend *blk,
@@ -280,16 +272,13 @@ static void qmp_blockdev_insert_anon_medium(BlockBackend *blk,
     }
 }
 
-static void blockdev_insert_medium(bool has_device, const char *device,
-                                   bool has_id, const char *id,
+static void blockdev_insert_medium(const char *device, const char *id,
                                    const char *node_name, Error **errp)
 {
     BlockBackend *blk;
     BlockDriverState *bs;
 
-    blk = qmp_get_blk(has_device ? device : NULL,
-                      has_id ? id : NULL,
-                      errp);
+    blk = qmp_get_blk(device, id, errp);
     if (!blk) {
         return;
     }
@@ -311,13 +300,13 @@ static void blockdev_insert_medium(bool has_device, const char *device,
 void qmp_blockdev_insert_medium(const char *id, const char *node_name,
                                 Error **errp)
 {
-    blockdev_insert_medium(false, NULL, true, id, node_name, errp);
+    blockdev_insert_medium(NULL, id, node_name, errp);
 }
 
-void qmp_blockdev_change_medium(bool has_device, const char *device,
-                                bool has_id, const char *id,
+void qmp_blockdev_change_medium(const char *device,
+                                const char *id,
                                 const char *filename,
-                                bool has_format, const char *format,
+                                const char *format,
                                 bool has_force, bool force,
                                 bool has_read_only,
                                 BlockdevChangeReadOnlyMode read_only,
@@ -331,9 +320,7 @@ void qmp_blockdev_change_medium(bool has_device, const char *device,
     QDict *options = NULL;
     Error *err = NULL;
 
-    blk = qmp_get_blk(has_device ? device : NULL,
-                      has_id ? id : NULL,
-                      errp);
+    blk = qmp_get_blk(device, id, errp);
     if (!blk) {
         goto fail;
     }
@@ -370,7 +357,7 @@ void qmp_blockdev_change_medium(bool has_device, const char *device,
     detect_zeroes = blk_get_detect_zeroes_from_root_state(blk);
     qdict_put_str(options, "detect-zeroes", detect_zeroes ? "on" : "off");
 
-    if (has_format) {
+    if (format) {
         qdict_put_str(options, "driver", format);
     }
 
@@ -379,9 +366,7 @@ void qmp_blockdev_change_medium(bool has_device, const char *device,
         goto fail;
     }
 
-    rc = do_open_tray(has_device ? device : NULL,
-                      has_id ? id : NULL,
-                      force, &err);
+    rc = do_open_tray(device, id, force, &err);
     if (rc && rc != -ENOSYS) {
         error_propagate(errp, err);
         goto fail;
@@ -389,7 +374,7 @@ void qmp_blockdev_change_medium(bool has_device, const char *device,
     error_free(err);
     err = NULL;
 
-    blockdev_remove_medium(has_device, device, has_id, id, &err);
+    blockdev_remove_medium(device, id, &err);
     if (err) {
         error_propagate(errp, err);
         goto fail;
@@ -401,7 +386,7 @@ void qmp_blockdev_change_medium(bool has_device, const char *device,
         goto fail;
     }
 
-    qmp_blockdev_close_tray(has_device, device, has_id, id, errp);
+    qmp_blockdev_close_tray(device, id, errp);
 
 fail:
     /* If the medium has been inserted, the device has its own reference, so
@@ -410,8 +395,7 @@ fail:
     bdrv_unref(medium_bs);
 }
 
-void qmp_eject(bool has_device, const char *device,
-               bool has_id, const char *id,
+void qmp_eject(const char *device, const char *id,
                bool has_force, bool force, Error **errp)
 {
     Error *local_err = NULL;
@@ -421,16 +405,14 @@ void qmp_eject(bool has_device, const char *device,
         force = false;
     }
 
-    rc = do_open_tray(has_device ? device : NULL,
-                      has_id ? id : NULL,
-                      force, &local_err);
+    rc = do_open_tray(device, id, force, &local_err);
     if (rc && rc != -ENOSYS) {
         error_propagate(errp, local_err);
         return;
     }
     error_free(local_err);
 
-    blockdev_remove_medium(has_device, device, has_id, id, errp);
+    blockdev_remove_medium(device, id, errp);
 }
 
 /* throttling disk I/O limits */
@@ -441,9 +423,7 @@ void qmp_block_set_io_throttle(BlockIOThrottle *arg, Error **errp)
     BlockBackend *blk;
     AioContext *aio_context;
 
-    blk = qmp_get_blk(arg->has_device ? arg->device : NULL,
-                      arg->has_id ? arg->id : NULL,
-                      errp);
+    blk = qmp_get_blk(arg->device, arg->id, errp);
     if (!blk) {
         return;
     }
@@ -516,11 +496,8 @@ void qmp_block_set_io_throttle(BlockIOThrottle *arg, Error **errp)
         /* Enable I/O limits if they're not enabled yet, otherwise
          * just update the throttling group. */
         if (!blk_get_public(blk)->throttle_group_member.throttle_state) {
-            blk_io_limits_enable(blk,
-                                 arg->has_group ? arg->group :
-                                 arg->has_device ? arg->device :
-                                 arg->id);
-        } else if (arg->has_group) {
+            blk_io_limits_enable(blk, arg->group ?: arg->device ?: arg->id);
+        } else if (arg->group) {
             blk_io_limits_update_group(blk, arg->group);
         }
         /* Set the new throttling configuration */
diff --git a/block/qapi.c b/block/qapi.c
index cf557e3aea..fea808425b 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -71,13 +71,11 @@ BlockDeviceInfo *bdrv_block_device_info(BlockBackend *blk,
     };
 
     if (bs->node_name[0]) {
-        info->has_node_name = true;
         info->node_name = g_strdup(bs->node_name);
     }
 
     backing = bdrv_cow_bs(bs);
     if (backing) {
-        info->has_backing_file = true;
         info->backing_file = g_strdup(backing->filename);
     }
 
@@ -139,7 +137,6 @@ BlockDeviceInfo *bdrv_block_device_info(BlockBackend *blk,
         info->has_iops_size = cfg.op_size;
         info->iops_size = cfg.op_size;
 
-        info->has_group = true;
         info->group =
             g_strdup(throttle_group_get_name(&blkp->throttle_group_member));
     }
@@ -170,7 +167,6 @@ BlockDeviceInfo *bdrv_block_device_info(BlockBackend *blk,
              */
             info->backing_file_depth++;
             bs0 = bdrv_filter_or_cow_bs(bs0);
-            (*p_image_info)->has_backing_image = true;
             p_image_info = &((*p_image_info)->backing_image);
         } else {
             break;
@@ -301,26 +297,21 @@ void bdrv_query_image_info(BlockDriverState *bs,
         qapi_free_ImageInfo(info);
         goto out;
     }
-    info->has_format_specific = info->format_specific != NULL;
-
     backing_filename = bs->backing_file;
     if (backing_filename[0] != '\0') {
         char *backing_filename2;
 
         info->backing_filename = g_strdup(backing_filename);
-        info->has_backing_filename = true;
         backing_filename2 = bdrv_get_full_backing_filename(bs, NULL);
 
         /* Always report the full_backing_filename if present, even if it's the
          * same as backing_filename. That they are same is useful info. */
         if (backing_filename2) {
             info->full_backing_filename = g_strdup(backing_filename2);
-            info->has_full_backing_filename = true;
         }
 
         if (bs->backing_format[0]) {
             info->backing_filename_format = g_strdup(bs->backing_format);
-            info->has_backing_filename_format = true;
         }
         g_free(backing_filename2);
     }
@@ -367,7 +358,6 @@ static void bdrv_query_info(BlockBackend *blk, BlockInfo **p_info,
 
     qdev = blk_get_attached_dev_id(blk);
     if (qdev && *qdev) {
-        info->has_qdev = true;
         info->qdev = qdev;
     } else {
         g_free(qdev);
@@ -384,7 +374,6 @@ static void bdrv_query_info(BlockBackend *blk, BlockInfo **p_info,
     }
 
     if (bs && bs->drv) {
-        info->has_inserted = true;
         info->inserted = bdrv_block_device_info(blk, bs, false, errp);
         if (info->inserted == NULL) {
             goto err;
@@ -411,23 +400,26 @@ static uint64List *uint64_list(uint64_t *list, int size)
     return out_list;
 }
 
-static void bdrv_latency_histogram_stats(BlockLatencyHistogram *hist,
-                                         bool *not_null,
-                                         BlockLatencyHistogramInfo **info)
+static BlockLatencyHistogramInfo *
+bdrv_latency_histogram_stats(BlockLatencyHistogram *hist)
 {
-    *not_null = hist->bins != NULL;
-    if (*not_null) {
-        *info = g_new0(BlockLatencyHistogramInfo, 1);
+    BlockLatencyHistogramInfo *info;
 
-        (*info)->boundaries = uint64_list(hist->boundaries, hist->nbins - 1);
-        (*info)->bins = uint64_list(hist->bins, hist->nbins);
+    if (!hist->bins) {
+        return NULL;
     }
+
+    info = g_new0(BlockLatencyHistogramInfo, 1);
+    info->boundaries = uint64_list(hist->boundaries, hist->nbins - 1);
+    info->bins = uint64_list(hist->bins, hist->nbins);
+    return info;
 }
 
 static void bdrv_query_blk_stats(BlockDeviceStats *ds, BlockBackend *blk)
 {
     BlockAcctStats *stats = blk_get_stats(blk);
     BlockAcctTimedStats *ts = NULL;
+    BlockLatencyHistogram *hgram;
 
     ds->rd_bytes = stats->nr_bytes[BLOCK_ACCT_READ];
     ds->wr_bytes = stats->nr_bytes[BLOCK_ACCT_WRITE];
@@ -493,15 +485,13 @@ static void bdrv_query_blk_stats(BlockDeviceStats *ds, BlockBackend *blk)
         QAPI_LIST_PREPEND(ds->timed_stats, dev_stats);
     }
 
-    bdrv_latency_histogram_stats(&stats->latency_histogram[BLOCK_ACCT_READ],
-                                 &ds->has_rd_latency_histogram,
-                                 &ds->rd_latency_histogram);
-    bdrv_latency_histogram_stats(&stats->latency_histogram[BLOCK_ACCT_WRITE],
-                                 &ds->has_wr_latency_histogram,
-                                 &ds->wr_latency_histogram);
-    bdrv_latency_histogram_stats(&stats->latency_histogram[BLOCK_ACCT_FLUSH],
-                                 &ds->has_flush_latency_histogram,
-                                 &ds->flush_latency_histogram);
+    hgram = stats->latency_histogram;
+    ds->rd_latency_histogram
+        = bdrv_latency_histogram_stats(&hgram[BLOCK_ACCT_READ]);
+    ds->wr_latency_histogram
+        = bdrv_latency_histogram_stats(&hgram[BLOCK_ACCT_WRITE]);
+    ds->flush_latency_histogram
+        = bdrv_latency_histogram_stats(&hgram[BLOCK_ACCT_FLUSH]);
 }
 
 static BlockStats *bdrv_query_bds_stats(BlockDriverState *bs,
@@ -526,16 +516,12 @@ static BlockStats *bdrv_query_bds_stats(BlockDriverState *bs,
     }
 
     if (bdrv_get_node_name(bs)[0]) {
-        s->has_node_name = true;
         s->node_name = g_strdup(bdrv_get_node_name(bs));
     }
 
     s->stats->wr_highest_offset = stat64_get(&bs->wr_highest_offset);
 
     s->driver_specific = bdrv_get_specific_stats(bs);
-    if (s->driver_specific) {
-        s->has_driver_specific = true;
-    }
 
     parent_child = bdrv_primary_child(bs);
     if (!parent_child ||
@@ -564,7 +550,6 @@ static BlockStats *bdrv_query_bds_stats(BlockDriverState *bs,
         }
     }
     if (parent_child) {
-        s->has_parent = true;
         s->parent = bdrv_query_bds_stats(parent_child->bs, blk_level);
     }
 
@@ -575,7 +560,6 @@ static BlockStats *bdrv_query_bds_stats(BlockDriverState *bs,
          * compatibility to when we put bs0->backing here, which might
          * be either)
          */
-        s->has_backing = true;
         s->backing = bdrv_query_bds_stats(filter_or_cow_bs, blk_level);
     }
 
@@ -640,12 +624,10 @@ BlockStatsList *qmp_query_blockstats(bool has_query_nodes,
 
             aio_context_acquire(ctx);
             s = bdrv_query_bds_stats(blk_bs(blk), true);
-            s->has_device = true;
             s->device = g_strdup(blk_name(blk));
 
             qdev = blk_get_attached_dev_id(blk);
             if (qdev && *qdev) {
-                s->has_qdev = true;
                 s->qdev = qdev;
             } else {
                 g_free(qdev);
@@ -822,16 +804,16 @@ void bdrv_image_info_dump(ImageInfo *info)
         qemu_printf("cleanly shut down: no\n");
     }
 
-    if (info->has_backing_filename) {
+    if (info->backing_filename) {
         qemu_printf("backing file: %s", info->backing_filename);
-        if (!info->has_full_backing_filename) {
+        if (!info->full_backing_filename) {
             qemu_printf(" (cannot determine actual path)");
         } else if (strcmp(info->backing_filename,
                           info->full_backing_filename) != 0) {
             qemu_printf(" (actual path: %s)", info->full_backing_filename);
         }
         qemu_printf("\n");
-        if (info->has_backing_filename_format) {
+        if (info->backing_filename_format) {
             qemu_printf("backing file format: %s\n",
                         info->backing_filename_format);
         }
@@ -865,7 +847,7 @@ void bdrv_image_info_dump(ImageInfo *info)
         }
     }
 
-    if (info->has_format_specific) {
+    if (info->format_specific) {
         qemu_printf("Format specific information:\n");
         bdrv_image_info_specific_dump(info->format_specific);
     }
diff --git a/block/qcow.c b/block/qcow.c
index 311aaa8705..6374380e77 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -825,7 +825,7 @@ static int coroutine_fn qcow_co_create(BlockdevCreateOptions *opts,
         return -EINVAL;
     }
 
-    if (qcow_opts->has_encrypt &&
+    if (qcow_opts->encrypt &&
         qcow_opts->encrypt->format != Q_CRYPTO_BLOCK_FORMAT_QCOW)
     {
         error_setg(errp, "Unsupported encryption format");
@@ -853,7 +853,7 @@ static int coroutine_fn qcow_co_create(BlockdevCreateOptions *opts,
     header.size = cpu_to_be64(total_size);
     header_size = sizeof(header);
     backing_filename_len = 0;
-    if (qcow_opts->has_backing_file) {
+    if (qcow_opts->backing_file) {
         if (strcmp(qcow_opts->backing_file, "fat:")) {
             header.backing_file_offset = cpu_to_be64(header_size);
             backing_filename_len = strlen(qcow_opts->backing_file);
@@ -861,7 +861,7 @@ static int coroutine_fn qcow_co_create(BlockdevCreateOptions *opts,
             header_size += backing_filename_len;
         } else {
             /* special backing file for vvfat */
-            qcow_opts->has_backing_file = false;
+            qcow_opts->backing_file = NULL;
         }
         header.cluster_bits = 9; /* 512 byte cluster to avoid copying
                                     unmodified sectors */
@@ -876,7 +876,7 @@ static int coroutine_fn qcow_co_create(BlockdevCreateOptions *opts,
 
     header.l1_table_offset = cpu_to_be64(header_size);
 
-    if (qcow_opts->has_encrypt) {
+    if (qcow_opts->encrypt) {
         header.crypt_method = cpu_to_be32(QCOW_CRYPT_AES);
 
         crypto = qcrypto_block_create(qcow_opts->encrypt, "encrypt.",
@@ -895,7 +895,7 @@ static int coroutine_fn qcow_co_create(BlockdevCreateOptions *opts,
         goto exit;
     }
 
-    if (qcow_opts->has_backing_file) {
+    if (qcow_opts->backing_file) {
         ret = blk_pwrite(qcow_blk, sizeof(header), backing_filename_len,
                          qcow_opts->backing_file, 0);
         if (ret < 0) {
diff --git a/block/qcow2.c b/block/qcow2.c
index b57f7cc8ee..2ee3aa12d2 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -3508,7 +3508,7 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
     if (!qcow2_opts->has_preallocation) {
         qcow2_opts->preallocation = PREALLOC_MODE_OFF;
     }
-    if (qcow2_opts->has_backing_file &&
+    if (qcow2_opts->backing_file &&
         qcow2_opts->preallocation != PREALLOC_MODE_OFF &&
         !qcow2_opts->extended_l2)
     {
@@ -3517,7 +3517,7 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
         ret = -EINVAL;
         goto out;
     }
-    if (qcow2_opts->has_backing_fmt && !qcow2_opts->has_backing_file) {
+    if (qcow2_opts->has_backing_fmt && !qcow2_opts->backing_file) {
         error_setg(errp, "Backing format cannot be used without backing file");
         ret = -EINVAL;
         goto out;
@@ -3558,7 +3558,7 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
         ret = -EINVAL;
         goto out;
     }
-    if (qcow2_opts->data_file_raw && qcow2_opts->has_backing_file) {
+    if (qcow2_opts->data_file_raw && qcow2_opts->backing_file) {
         error_setg(errp, "Backing file and data-file-raw cannot be used at "
                    "the same time");
         ret = -EINVAL;
@@ -3584,7 +3584,7 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
          * backing file when specifying data_file_raw is an error
          * anyway.
          */
-        assert(!qcow2_opts->has_backing_file);
+        assert(!qcow2_opts->backing_file);
     }
 
     if (qcow2_opts->data_file) {
@@ -3752,7 +3752,7 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
     }
 
     /* Want a backing file? There you go. */
-    if (qcow2_opts->has_backing_file) {
+    if (qcow2_opts->backing_file) {
         const char *backing_format = NULL;
 
         if (qcow2_opts->has_backing_fmt) {
@@ -3770,7 +3770,7 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
     }
 
     /* Want encryption? There you go. */
-    if (qcow2_opts->has_encrypt) {
+    if (qcow2_opts->encrypt) {
         ret = qcow2_set_up_encryption(blk_bs(blk), qcow2_opts->encrypt, errp);
         if (ret < 0) {
             goto out;
@@ -5195,7 +5195,6 @@ static ImageInfoSpecific *qcow2_get_specific_info(BlockDriverState *bs,
             .refcount_bits      = s->refcount_bits,
             .has_bitmaps        = !!bitmaps,
             .bitmaps            = bitmaps,
-            .has_data_file      = !!s->image_data_file,
             .data_file          = g_strdup(s->image_data_file),
             .has_data_file_raw  = has_data_file(bs),
             .data_file_raw      = data_file_is_raw(bs),
@@ -5226,7 +5225,6 @@ static ImageInfoSpecific *qcow2_get_specific_info(BlockDriverState *bs,
         memset(&encrypt_info->u, 0, sizeof(encrypt_info->u));
         qapi_free_QCryptoBlockInfo(encrypt_info);
 
-        spec_info->u.qcow2.data->has_encrypt = true;
         spec_info->u.qcow2.data->encrypt = qencrypt;
     }
 
@@ -5846,7 +5844,7 @@ static int coroutine_fn qcow2_co_amend(BlockDriverState *bs,
     BDRVQcow2State *s = bs->opaque;
     int ret = 0;
 
-    if (qopts->has_encrypt) {
+    if (qopts->encrypt) {
         if (!s->crypto) {
             error_setg(errp, "image is not encrypted, can't amend");
             return -EOPNOTSUPP;
@@ -5911,7 +5909,7 @@ void qcow2_signal_corruption(BlockDriverState *bs, bool fatal, int64_t offset,
 
     node_name = bdrv_get_node_name(bs);
     qapi_event_send_block_image_corrupted(bdrv_get_device_name(bs),
-                                          *node_name != '\0', node_name,
+                                          *node_name ? node_name : NULL,
                                           message, offset >= 0, offset,
                                           size >= 0, size,
                                           fatal);
diff --git a/block/qed.c b/block/qed.c
index bda00e6257..ccbafa154a 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -698,7 +698,7 @@ static int coroutine_fn bdrv_qed_co_create(BlockdevCreateOptions *opts,
         goto out;
     }
 
-    if (qed_opts->has_backing_file) {
+    if (qed_opts->backing_file) {
         header.features |= QED_F_BACKING_FILE;
         header.backing_filename_offset = sizeof(le_header);
         header.backing_filename_size = strlen(qed_opts->backing_file);
diff --git a/block/quorum.c b/block/quorum.c
index f9e6539ceb..7f21c03f1f 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -202,7 +202,7 @@ static void quorum_report_bad(QuorumOpType type, uint64_t offset,
         msg = strerror(-ret);
     }
 
-    qapi_event_send_quorum_report_bad(type, !!msg, msg, node_name, start_sector,
+    qapi_event_send_quorum_report_bad(type, msg, node_name, start_sector,
                                       end_sector - start_sector);
 }
 
diff --git a/block/rbd.c b/block/rbd.c
index f826410f40..d809b8e0a3 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -536,7 +536,7 @@ static int qemu_rbd_do_create(BlockdevCreateOptions *options,
     int ret;
 
     assert(options->driver == BLOCKDEV_DRIVER_RBD);
-    if (opts->location->has_snapshot) {
+    if (opts->location->snapshot) {
         error_setg(errp, "Can't use snapshot name for image creation");
         return -EINVAL;
     }
@@ -574,7 +574,7 @@ static int qemu_rbd_do_create(BlockdevCreateOptions *options,
     }
 
 #ifdef LIBRBD_SUPPORTS_ENCRYPTION
-    if (opts->has_encrypt) {
+    if (opts->encrypt) {
         rbd_image_t image;
 
         ret = rbd_open(io_ctx, opts->location->image, &image, NULL);
@@ -686,7 +686,6 @@ static int coroutine_fn qemu_rbd_co_create_opts(BlockDriver *drv,
         goto exit;
     }
     rbd_opts->encrypt     = encrypt;
-    rbd_opts->has_encrypt = !!encrypt;
 
     /*
      * Caution: while qdict_get_try_str() is fine, getting non-string
@@ -697,11 +696,8 @@ static int coroutine_fn qemu_rbd_co_create_opts(BlockDriver *drv,
     loc = rbd_opts->location;
     loc->pool        = g_strdup(qdict_get_try_str(options, "pool"));
     loc->conf        = g_strdup(qdict_get_try_str(options, "conf"));
-    loc->has_conf    = !!loc->conf;
     loc->user        = g_strdup(qdict_get_try_str(options, "user"));
-    loc->has_user    = !!loc->user;
     loc->q_namespace = g_strdup(qdict_get_try_str(options, "namespace"));
-    loc->has_q_namespace = !!loc->q_namespace;
     loc->image       = g_strdup(qdict_get_try_str(options, "image"));
     keypairs         = qdict_get_try_str(options, "=keyvalue-pairs");
 
@@ -767,7 +763,6 @@ static int qemu_rbd_connect(rados_t *cluster, rados_ioctx_t *io_ctx,
             return -EINVAL;
         }
         opts->key_secret = g_strdup(secretid);
-        opts->has_key_secret = true;
     }
 
     mon_host = qemu_rbd_mon_host(opts, &local_err);
@@ -785,7 +780,7 @@ static int qemu_rbd_connect(rados_t *cluster, rados_ioctx_t *io_ctx,
 
     /* try default location when conf=NULL, but ignore failure */
     r = rados_conf_read_file(*cluster, opts->conf);
-    if (opts->has_conf && r < 0) {
+    if (opts->conf && r < 0) {
         error_setg_errno(errp, -r, "error reading conf file %s", opts->conf);
         goto failed_shutdown;
     }
@@ -833,7 +828,7 @@ static int qemu_rbd_connect(rados_t *cluster, rados_ioctx_t *io_ctx,
     }
 
 #ifdef HAVE_RBD_NAMESPACE_EXISTS
-    if (opts->has_q_namespace && strlen(opts->q_namespace) > 0) {
+    if (opts->q_namespace && strlen(opts->q_namespace) > 0) {
         bool exists;
 
         r = rbd_namespace_exists(*io_ctx, opts->q_namespace, &exists);
@@ -991,7 +986,7 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
         goto failed_open;
     }
 
-    if (opts->has_encrypt) {
+    if (opts->encrypt) {
 #ifdef LIBRBD_SUPPORTS_ENCRYPTION
         r = qemu_rbd_encryption_load(s->image, opts->encrypt, errp);
         if (r < 0) {
diff --git a/block/ssh.c b/block/ssh.c
index a2dc646536..2d2dac5f88 100644
--- a/block/ssh.c
+++ b/block/ssh.c
@@ -643,7 +643,7 @@ static int connect_to_ssh(BDRVSSHState *s, BlockdevOptionsSsh *opts,
     unsigned int port = 0;
     int new_sock = -1;
 
-    if (opts->has_user) {
+    if (opts->user) {
         s->user = g_strdup(opts->user);
     } else {
         s->user = g_strdup(g_get_user_name());
diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index 012256bb02..213012435f 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -173,8 +173,8 @@ void nbd_server_start_options(NbdServerOptions *arg, Error **errp)
 }
 
 void qmp_nbd_server_start(SocketAddressLegacy *addr,
-                          bool has_tls_creds, const char *tls_creds,
-                          bool has_tls_authz, const char *tls_authz,
+                          const char *tls_creds,
+                          const char *tls_authz,
                           bool has_max_connections, uint32_t max_connections,
                           Error **errp)
 {
@@ -200,8 +200,7 @@ void qmp_nbd_server_add(NbdServerAddOptions *arg, Error **errp)
      * block-export-add would default to the node-name, but we may have to use
      * the device name as a default here for compatibility.
      */
-    if (!arg->has_name) {
-        arg->has_name = true;
+    if (!arg->name) {
         arg->name = g_strdup(arg->device);
     }
 
@@ -215,7 +214,7 @@ void qmp_nbd_server_add(NbdServerAddOptions *arg, Error **errp)
     };
     QAPI_CLONE_MEMBERS(BlockExportOptionsNbdBase, &export_opts->u.nbd,
                        qapi_NbdServerAddOptions_base(arg));
-    if (arg->has_bitmap) {
+    if (arg->bitmap) {
         BlockDirtyBitmapOrStr *el = g_new(BlockDirtyBitmapOrStr, 1);
 
         *el = (BlockDirtyBitmapOrStr) {
diff --git a/blockdev.c b/blockdev.c
index a32bafc07a..6a3b8cdbc6 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1051,23 +1051,17 @@ static void blockdev_do_action(TransactionAction *action, Error **errp)
     qmp_transaction(&list, false, NULL, errp);
 }
 
-void qmp_blockdev_snapshot_sync(bool has_device, const char *device,
-                                bool has_node_name, const char *node_name,
+void qmp_blockdev_snapshot_sync(const char *device, const char *node_name,
                                 const char *snapshot_file,
-                                bool has_snapshot_node_name,
                                 const char *snapshot_node_name,
-                                bool has_format, const char *format,
+                                const char *format,
                                 bool has_mode, NewImageMode mode, Error **errp)
 {
     BlockdevSnapshotSync snapshot = {
-        .has_device = has_device,
         .device = (char *) device,
-        .has_node_name = has_node_name,
         .node_name = (char *) node_name,
         .snapshot_file = (char *) snapshot_file,
-        .has_snapshot_node_name = has_snapshot_node_name,
         .snapshot_node_name = (char *) snapshot_node_name,
-        .has_format = has_format,
         .format = (char *) format,
         .has_mode = has_mode,
         .mode = mode,
@@ -1109,9 +1103,7 @@ void qmp_blockdev_snapshot_internal_sync(const char *device,
 }
 
 SnapshotInfo *qmp_blockdev_snapshot_delete_internal_sync(const char *device,
-                                                         bool has_id,
                                                          const char *id,
-                                                         bool has_name,
                                                          const char *name,
                                                          Error **errp)
 {
@@ -1129,14 +1121,6 @@ SnapshotInfo *qmp_blockdev_snapshot_delete_internal_sync(const char *device,
     aio_context = bdrv_get_aio_context(bs);
     aio_context_acquire(aio_context);
 
-    if (!has_id) {
-        id = NULL;
-    }
-
-    if (!has_name) {
-        name = NULL;
-    }
-
     if (!id && !name) {
         error_setg(errp, "Name or id must be provided");
         goto out_aio_context;
@@ -1450,8 +1434,8 @@ static void external_snapshot_prepare(BlkActionState *common,
     case TRANSACTION_ACTION_KIND_BLOCKDEV_SNAPSHOT_SYNC:
         {
             BlockdevSnapshotSync *s = action->u.blockdev_snapshot_sync.data;
-            device = s->has_device ? s->device : NULL;
-            node_name = s->has_node_name ? s->node_name : NULL;
+            device = s->device;
+            node_name = s->node_name;
             new_image_file = s->snapshot_file;
             snapshot_ref = NULL;
         }
@@ -1495,10 +1479,9 @@ static void external_snapshot_prepare(BlkActionState *common,
 
     if (action->type == TRANSACTION_ACTION_KIND_BLOCKDEV_SNAPSHOT_SYNC) {
         BlockdevSnapshotSync *s = action->u.blockdev_snapshot_sync.data;
-        const char *format = s->has_format ? s->format : "qcow2";
+        const char *format = s->format ?: "qcow2";
         enum NewImageMode mode;
-        const char *snapshot_node_name =
-            s->has_snapshot_node_name ? s->snapshot_node_name : NULL;
+        const char *snapshot_node_name = s->snapshot_node_name;
 
         if (node_name && !snapshot_node_name) {
             error_setg(errp, "New overlay node-name missing");
@@ -1717,7 +1700,7 @@ static void drive_backup_prepare(BlkActionState *common, Error **errp)
     /* Paired with .clean() */
     bdrv_drained_begin(bs);
 
-    if (!backup->has_format) {
+    if (!backup->format) {
         backup->format = backup->mode == NEW_IMAGE_MODE_EXISTING ?
                          NULL : (char *) bs->drv->format_name;
     }
@@ -2380,9 +2363,7 @@ exit:
         }
         g_free(state);
     }
-    if (!has_props) {
-        qapi_free_TransactionProperties(props);
-    }
+    qapi_free_TransactionProperties(props);
     job_txn_unref(block_job_txn);
 }
 
@@ -2411,8 +2392,7 @@ BlockDirtyBitmapSha256 *qmp_x_debug_block_dirty_bitmap_sha256(const char *node,
     return ret;
 }
 
-void coroutine_fn qmp_block_resize(bool has_device, const char *device,
-                                   bool has_node_name, const char *node_name,
+void coroutine_fn qmp_block_resize(const char *device, const char *node_name,
                                    int64_t size, Error **errp)
 {
     Error *local_err = NULL;
@@ -2420,9 +2400,7 @@ void coroutine_fn qmp_block_resize(bool has_device, const char *device,
     BlockDriverState *bs;
     AioContext *old_ctx;
 
-    bs = bdrv_lookup_bs(has_device ? device : NULL,
-                        has_node_name ? node_name : NULL,
-                        &local_err);
+    bs = bdrv_lookup_bs(device, node_name, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         return;
@@ -2457,14 +2435,14 @@ void coroutine_fn qmp_block_resize(bool has_device, const char *device,
     bdrv_co_unlock(bs);
 }
 
-void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
-                      bool has_base, const char *base,
-                      bool has_base_node, const char *base_node,
-                      bool has_backing_file, const char *backing_file,
-                      bool has_bottom, const char *bottom,
+void qmp_block_stream(const char *job_id, const char *device,
+                      const char *base,
+                      const char *base_node,
+                      const char *backing_file,
+                      const char *bottom,
                       bool has_speed, int64_t speed,
                       bool has_on_error, BlockdevOnError on_error,
-                      bool has_filter_node_name, const char *filter_node_name,
+                      const char *filter_node_name,
                       bool has_auto_finalize, bool auto_finalize,
                       bool has_auto_dismiss, bool auto_dismiss,
                       Error **errp)
@@ -2476,19 +2454,19 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
     Error *local_err = NULL;
     int job_flags = JOB_DEFAULT;
 
-    if (has_base && has_base_node) {
+    if (base && base_node) {
         error_setg(errp, "'base' and 'base-node' cannot be specified "
                    "at the same time");
         return;
     }
 
-    if (has_base && has_bottom) {
+    if (base && bottom) {
         error_setg(errp, "'base' and 'bottom' cannot be specified "
                    "at the same time");
         return;
     }
 
-    if (has_bottom && has_base_node) {
+    if (bottom && base_node) {
         error_setg(errp, "'bottom' and 'base-node' cannot be specified "
                    "at the same time");
         return;
@@ -2506,7 +2484,7 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
     aio_context = bdrv_get_aio_context(bs);
     aio_context_acquire(aio_context);
 
-    if (has_base) {
+    if (base) {
         base_bs = bdrv_find_backing_image(bs, base);
         if (base_bs == NULL) {
             error_setg(errp, "Can't find '%s' in the backing chain", base);
@@ -2515,7 +2493,7 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
         assert(bdrv_get_aio_context(base_bs) == aio_context);
     }
 
-    if (has_base_node) {
+    if (base_node) {
         base_bs = bdrv_lookup_bs(NULL, base_node, errp);
         if (!base_bs) {
             goto out;
@@ -2529,7 +2507,7 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
         bdrv_refresh_filename(base_bs);
     }
 
-    if (has_bottom) {
+    if (bottom) {
         bottom_bs = bdrv_lookup_bs(NULL, bottom, errp);
         if (!bottom_bs) {
             goto out;
@@ -2554,7 +2532,7 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
     /*
      * Check for op blockers in the whole chain between bs and base (or bottom)
      */
-    iter_end = has_bottom ? bdrv_filter_or_cow_bs(bottom_bs) : base_bs;
+    iter_end = bottom ? bdrv_filter_or_cow_bs(bottom_bs) : base_bs;
     for (iter = bs; iter && iter != iter_end;
          iter = bdrv_filter_or_cow_bs(iter))
     {
@@ -2565,7 +2543,7 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
 
     /* if we are streaming the entire chain, the result will have no backing
      * file, and specifying one is therefore an error */
-    if (base_bs == NULL && has_backing_file) {
+    if (!base_bs && backing_file) {
         error_setg(errp, "backing file specified, but streaming the "
                          "entire chain");
         goto out;
@@ -2578,7 +2556,7 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
         job_flags |= JOB_MANUAL_DISMISS;
     }
 
-    stream_start(has_job_id ? job_id : NULL, bs, base_bs, backing_file,
+    stream_start(job_id, bs, base_bs, backing_file,
                  bottom_bs, job_flags, has_speed ? speed : 0, on_error,
                  filter_node_name, &local_err);
     if (local_err) {
@@ -2592,15 +2570,15 @@ out:
     aio_context_release(aio_context);
 }
 
-void qmp_block_commit(bool has_job_id, const char *job_id, const char *device,
-                      bool has_base_node, const char *base_node,
-                      bool has_base, const char *base,
-                      bool has_top_node, const char *top_node,
-                      bool has_top, const char *top,
-                      bool has_backing_file, const char *backing_file,
+void qmp_block_commit(const char *job_id, const char *device,
+                      const char *base_node,
+                      const char *base,
+                      const char *top_node,
+                      const char *top,
+                      const char *backing_file,
                       bool has_speed, int64_t speed,
                       bool has_on_error, BlockdevOnError on_error,
-                      bool has_filter_node_name, const char *filter_node_name,
+                      const char *filter_node_name,
                       bool has_auto_finalize, bool auto_finalize,
                       bool has_auto_dismiss, bool auto_dismiss,
                       Error **errp)
@@ -2619,9 +2597,6 @@ void qmp_block_commit(bool has_job_id, const char *job_id, const char *device,
     if (!has_on_error) {
         on_error = BLOCKDEV_ON_ERROR_REPORT;
     }
-    if (!has_filter_node_name) {
-        filter_node_name = NULL;
-    }
     if (has_auto_finalize && !auto_finalize) {
         job_flags |= JOB_MANUAL_FINALIZE;
     }
@@ -2657,10 +2632,10 @@ void qmp_block_commit(bool has_job_id, const char *job_id, const char *device,
     /* default top_bs is the active layer */
     top_bs = bs;
 
-    if (has_top_node && has_top) {
+    if (top_node && top) {
         error_setg(errp, "'top-node' and 'top' are mutually exclusive");
         goto out;
-    } else if (has_top_node) {
+    } else if (top_node) {
         top_bs = bdrv_lookup_bs(NULL, top_node, errp);
         if (top_bs == NULL) {
             goto out;
@@ -2670,7 +2645,7 @@ void qmp_block_commit(bool has_job_id, const char *job_id, const char *device,
                        top_node);
             goto out;
         }
-    } else if (has_top && top) {
+    } else if (top) {
         /* This strcmp() is just a shortcut, there is no need to
          * refresh @bs's filename.  If it mismatches,
          * bdrv_find_backing_image() will do the refresh and may still
@@ -2687,10 +2662,10 @@ void qmp_block_commit(bool has_job_id, const char *job_id, const char *device,
 
     assert(bdrv_get_aio_context(top_bs) == aio_context);
 
-    if (has_base_node && has_base) {
+    if (base_node && base) {
         error_setg(errp, "'base-node' and 'base' are mutually exclusive");
         goto out;
-    } else if (has_base_node) {
+    } else if (base_node) {
         base_bs = bdrv_lookup_bs(NULL, base_node, errp);
         if (base_bs == NULL) {
             goto out;
@@ -2700,7 +2675,7 @@ void qmp_block_commit(bool has_job_id, const char *job_id, const char *device,
                        base_node);
             goto out;
         }
-    } else if (has_base && base) {
+    } else if (base) {
         base_bs = bdrv_find_backing_image(top_bs, base);
         if (base_bs == NULL) {
             error_setg(errp, "Can't find '%s' in the backing chain", base);
@@ -2742,7 +2717,7 @@ void qmp_block_commit(bool has_job_id, const char *job_id, const char *device,
     if (top_perm & BLK_PERM_WRITE ||
         bdrv_skip_filters(top_bs) == bdrv_skip_filters(bs))
     {
-        if (has_backing_file) {
+        if (backing_file) {
             if (bdrv_skip_filters(top_bs) == bdrv_skip_filters(bs)) {
                 error_setg(errp, "'backing-file' specified,"
                                  " but 'top' is the active layer");
@@ -2752,7 +2727,7 @@ void qmp_block_commit(bool has_job_id, const char *job_id, const char *device,
             }
             goto out;
         }
-        if (!has_job_id) {
+        if (!job_id) {
             /*
              * Emulate here what block_job_create() does, because it
              * is possible that @bs != @top_bs (the block job should
@@ -2768,8 +2743,8 @@ void qmp_block_commit(bool has_job_id, const char *job_id, const char *device,
         if (bdrv_op_is_blocked(overlay_bs, BLOCK_OP_TYPE_COMMIT_TARGET, errp)) {
             goto out;
         }
-        commit_start(has_job_id ? job_id : NULL, bs, base_bs, top_bs, job_flags,
-                     speed, on_error, has_backing_file ? backing_file : NULL,
+        commit_start(job_id, bs, base_bs, top_bs, job_flags,
+                     speed, on_error, backing_file,
                      filter_node_name, &local_err);
     }
     if (local_err != NULL) {
@@ -2802,9 +2777,6 @@ static BlockJob *do_backup_common(BackupCommon *backup,
     if (!backup->has_on_target_error) {
         backup->on_target_error = BLOCKDEV_ON_ERROR_REPORT;
     }
-    if (!backup->has_job_id) {
-        backup->job_id = NULL;
-    }
     if (!backup->has_auto_finalize) {
         backup->auto_finalize = true;
     }
@@ -2830,7 +2802,7 @@ static BlockJob *do_backup_common(BackupCommon *backup,
     if ((backup->sync == MIRROR_SYNC_MODE_BITMAP) ||
         (backup->sync == MIRROR_SYNC_MODE_INCREMENTAL)) {
         /* done before desugaring 'incremental' to print the right message */
-        if (!backup->has_bitmap) {
+        if (!backup->bitmap) {
             error_setg(errp, "must provide a valid bitmap name for "
                        "'%s' sync mode", MirrorSyncMode_str(backup->sync));
             return NULL;
@@ -2851,7 +2823,7 @@ static BlockJob *do_backup_common(BackupCommon *backup,
         backup->bitmap_mode = BITMAP_SYNC_MODE_ON_SUCCESS;
     }
 
-    if (backup->has_bitmap) {
+    if (backup->bitmap) {
         bmap = bdrv_find_dirty_bitmap(bs, backup->bitmap);
         if (!bmap) {
             error_setg(errp, "Bitmap '%s' could not be found", backup->bitmap);
@@ -2884,7 +2856,7 @@ static BlockJob *do_backup_common(BackupCommon *backup,
         }
     }
 
-    if (!backup->has_bitmap && backup->has_bitmap_mode) {
+    if (!backup->bitmap && backup->has_bitmap_mode) {
         error_setg(errp, "Cannot specify bitmap sync mode without a bitmap");
         return NULL;
     }
@@ -2944,7 +2916,7 @@ void qmp_blockdev_backup(BlockdevBackup *backup, Error **errp)
  **/
 static void blockdev_mirror_common(const char *job_id, BlockDriverState *bs,
                                    BlockDriverState *target,
-                                   bool has_replaces, const char *replaces,
+                                   const char *replaces,
                                    enum MirrorSyncMode sync,
                                    BlockMirrorBackingMode backing_mode,
                                    bool zero_target,
@@ -2956,7 +2928,6 @@ static void blockdev_mirror_common(const char *job_id, BlockDriverState *bs,
                                    bool has_on_target_error,
                                    BlockdevOnError on_target_error,
                                    bool has_unmap, bool unmap,
-                                   bool has_filter_node_name,
                                    const char *filter_node_name,
                                    bool has_copy_mode, MirrorCopyMode copy_mode,
                                    bool has_auto_finalize, bool auto_finalize,
@@ -2984,9 +2955,6 @@ static void blockdev_mirror_common(const char *job_id, BlockDriverState *bs,
     if (!has_unmap) {
         unmap = true;
     }
-    if (!has_filter_node_name) {
-        filter_node_name = NULL;
-    }
     if (!has_copy_mode) {
         copy_mode = MIRROR_COPY_MODE_BACKGROUND;
     }
@@ -3019,16 +2987,15 @@ static void blockdev_mirror_common(const char *job_id, BlockDriverState *bs,
         sync = MIRROR_SYNC_MODE_FULL;
     }
 
-    if (!has_replaces) {
+    if (!replaces) {
         /* We want to mirror from @bs, but keep implicit filters on top */
         unfiltered_bs = bdrv_skip_implicit_filters(bs);
         if (unfiltered_bs != bs) {
             replaces = unfiltered_bs->node_name;
-            has_replaces = true;
         }
     }
 
-    if (has_replaces) {
+    if (replaces) {
         BlockDriverState *to_replace_bs;
         AioContext *replace_aio_context;
         int64_t bs_size, replace_size;
@@ -3065,7 +3032,7 @@ static void blockdev_mirror_common(const char *job_id, BlockDriverState *bs,
      * and will allow to check whether the node still exist at mirror completion
      */
     mirror_start(job_id, bs, target,
-                 has_replaces ? replaces : NULL, job_flags,
+                 replaces, job_flags,
                  speed, granularity, buf_size, sync, backing_mode, zero_target,
                  on_source_error, on_target_error, unmap, filter_node_name,
                  copy_mode, errp);
@@ -3103,7 +3070,7 @@ void qmp_drive_mirror(DriveMirror *arg, Error **errp)
         arg->mode = NEW_IMAGE_MODE_ABSOLUTE_PATHS;
     }
 
-    if (!arg->has_format) {
+    if (!arg->format) {
         format = (arg->mode == NEW_IMAGE_MODE_EXISTING
                   ? NULL : bs->drv->format_name);
     }
@@ -3123,8 +3090,8 @@ void qmp_drive_mirror(DriveMirror *arg, Error **errp)
         goto out;
     }
 
-    if (arg->has_replaces) {
-        if (!arg->has_node_name) {
+    if (arg->replaces) {
+        if (!arg->node_name) {
             error_setg(errp, "a node-name must be provided when replacing a"
                              " named node of the graph");
             goto out;
@@ -3174,7 +3141,7 @@ void qmp_drive_mirror(DriveMirror *arg, Error **errp)
     }
 
     options = qdict_new();
-    if (arg->has_node_name) {
+    if (arg->node_name) {
         qdict_put_str(options, "node-name", arg->node_name);
     }
     if (format) {
@@ -3209,8 +3176,8 @@ void qmp_drive_mirror(DriveMirror *arg, Error **errp)
     aio_context_release(old_context);
     aio_context_acquire(aio_context);
 
-    blockdev_mirror_common(arg->has_job_id ? arg->job_id : NULL, bs, target_bs,
-                           arg->has_replaces, arg->replaces, arg->sync,
+    blockdev_mirror_common(arg->job_id, bs, target_bs,
+                           arg->replaces, arg->sync,
                            backing_mode, zero_target,
                            arg->has_speed, arg->speed,
                            arg->has_granularity, arg->granularity,
@@ -3218,7 +3185,7 @@ void qmp_drive_mirror(DriveMirror *arg, Error **errp)
                            arg->has_on_source_error, arg->on_source_error,
                            arg->has_on_target_error, arg->on_target_error,
                            arg->has_unmap, arg->unmap,
-                           false, NULL,
+                           NULL,
                            arg->has_copy_mode, arg->copy_mode,
                            arg->has_auto_finalize, arg->auto_finalize,
                            arg->has_auto_dismiss, arg->auto_dismiss,
@@ -3228,9 +3195,9 @@ out:
     aio_context_release(aio_context);
 }
 
-void qmp_blockdev_mirror(bool has_job_id, const char *job_id,
+void qmp_blockdev_mirror(const char *job_id,
                          const char *device, const char *target,
-                         bool has_replaces, const char *replaces,
+                         const char *replaces,
                          MirrorSyncMode sync,
                          bool has_speed, int64_t speed,
                          bool has_granularity, uint32_t granularity,
@@ -3239,7 +3206,6 @@ void qmp_blockdev_mirror(bool has_job_id, const char *job_id,
                          BlockdevOnError on_source_error,
                          bool has_on_target_error,
                          BlockdevOnError on_target_error,
-                         bool has_filter_node_name,
                          const char *filter_node_name,
                          bool has_copy_mode, MirrorCopyMode copy_mode,
                          bool has_auto_finalize, bool auto_finalize,
@@ -3280,15 +3246,14 @@ void qmp_blockdev_mirror(bool has_job_id, const char *job_id,
         goto out;
     }
 
-    blockdev_mirror_common(has_job_id ? job_id : NULL, bs, target_bs,
-                           has_replaces, replaces, sync, backing_mode,
+    blockdev_mirror_common(job_id, bs, target_bs,
+                           replaces, sync, backing_mode,
                            zero_target, has_speed, speed,
                            has_granularity, granularity,
                            has_buf_size, buf_size,
                            has_on_source_error, on_source_error,
                            has_on_target_error, on_target_error,
-                           true, true,
-                           has_filter_node_name, filter_node_name,
+                           true, true, filter_node_name,
                            has_copy_mode, copy_mode,
                            has_auto_finalize, auto_finalize,
                            has_auto_dismiss, auto_dismiss,
@@ -3560,7 +3525,7 @@ void qmp_blockdev_reopen(BlockdevOptionsList *reopen_list, Error **errp)
         QDict *qdict;
 
         /* Check for the selected node name */
-        if (!options->has_node_name) {
+        if (!options->node_name) {
             error_setg(errp, "node-name not specified");
             goto fail;
         }
@@ -3665,8 +3630,7 @@ static BdrvChild *bdrv_find_child(BlockDriverState *parent_bs,
     return NULL;
 }
 
-void qmp_x_blockdev_change(const char *parent, bool has_child,
-                           const char *child, bool has_node,
+void qmp_x_blockdev_change(const char *parent, const char *child,
                            const char *node, Error **errp)
 {
     BlockDriverState *parent_bs, *new_bs = NULL;
@@ -3677,8 +3641,8 @@ void qmp_x_blockdev_change(const char *parent, bool has_child,
         return;
     }
 
-    if (has_child == has_node) {
-        if (has_child) {
+    if (!child == !node) {
+        if (child) {
             error_setg(errp, "The parameters child and node are in conflict");
         } else {
             error_setg(errp, "Either child or node must be specified");
@@ -3686,7 +3650,7 @@ void qmp_x_blockdev_change(const char *parent, bool has_child,
         return;
     }
 
-    if (has_child) {
+    if (child) {
         p_child = bdrv_find_child(parent_bs, child);
         if (!p_child) {
             error_setg(errp, "Node '%s' does not have child '%s'",
@@ -3696,7 +3660,7 @@ void qmp_x_blockdev_change(const char *parent, bool has_child,
         bdrv_del_child(parent_bs, p_child, errp);
     }
 
-    if (has_node) {
+    if (node) {
         new_bs = bdrv_find_node(node);
         if (!new_bs) {
             error_setg(errp, "Node '%s' not found", node);
diff --git a/blockjob.c b/blockjob.c
index bdf20a0e35..a5766da220 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -343,7 +343,6 @@ BlockJobInfo *block_job_query_locked(BlockJob *job, Error **errp)
     info->auto_finalize = job->job.auto_finalize;
     info->auto_dismiss  = job->job.auto_dismiss;
     if (job->job.ret) {
-        info->has_error = true;
         info->error = job->job.err ?
                         g_strdup(error_get_pretty(job->job.err)) :
                         g_strdup(strerror(-job->job.ret));
@@ -403,7 +402,6 @@ static void block_job_event_completed_locked(Notifier *n, void *opaque)
                                         progress_total,
                                         progress_current,
                                         job->speed,
-                                        !!msg,
                                         msg);
 }
 
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index bab86c5537..cdfb804925 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1517,8 +1517,7 @@ void hmp_change(Monitor *mon, const QDict *qdict)
             }
         }
 
-        qmp_blockdev_change_medium(true, device, false, NULL, target,
-                                   !!arg, arg, true, force,
+        qmp_blockdev_change_medium(device, NULL, target, arg, true, force,
                                    !!read_only, read_only_mode,
                                    &err);
     }
diff --git a/nbd/server.c b/nbd/server.c
index ada16089f3..f25b3032fd 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -1653,7 +1653,7 @@ static int nbd_export_create(BlockExport *blk_exp, BlockExportOptions *exp_args,
         return -EINVAL;
     }
 
-    if (!arg->has_name) {
+    if (!arg->name) {
         arg->name = exp_args->node_name;
     }
 
diff --git a/qemu-img.c b/qemu-img.c
index ace3adf8ae..92e326ba5c 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -2915,15 +2915,15 @@ static ImageInfoList *collect_image_info_list(bool image_opts,
         image_opts = false;
 
         if (chain) {
-            if (info->has_full_backing_filename) {
+            if (info->full_backing_filename) {
                 filename = info->full_backing_filename;
-            } else if (info->has_backing_filename) {
+            } else if (info->backing_filename) {
                 error_report("Could not determine absolute backing filename,"
                              " but backing filename '%s' present",
                              info->backing_filename);
                 goto err;
             }
-            if (info->has_backing_filename_format) {
+            if (info->backing_filename_format) {
                 fmt = info->backing_filename_format;
             }
         }
@@ -3046,7 +3046,7 @@ static int dump_map_entry(OutputFormat output_format, MapEntry *e,
             printf("%#-16"PRIx64"%#-16"PRIx64"%#-16"PRIx64"%s\n",
                    e->start, e->length,
                    e->has_offset ? e->offset : 0,
-                   e->has_filename ? e->filename : "");
+                   e->filename ?: "");
         }
         /* This format ignores the distinction between 0, ZERO and ZERO|DATA.
          * Modify the flags here to allow more coalescing.
@@ -3127,7 +3127,6 @@ static int get_block_status(BlockDriverState *bs, int64_t offset,
         .has_offset = has_offset,
         .depth = depth,
         .present = !!(ret & BDRV_BLOCK_ALLOCATED),
-        .has_filename = filename,
         .filename = filename,
     };
 
@@ -3143,11 +3142,11 @@ static inline bool entry_mergeable(const MapEntry *curr, const MapEntry *next)
         curr->data != next->data ||
         curr->depth != next->depth ||
         curr->present != next->present ||
-        curr->has_filename != next->has_filename ||
+        !curr->filename != !next->filename ||
         curr->has_offset != next->has_offset) {
         return false;
     }
-    if (curr->has_filename && strcmp(curr->filename, next->filename)) {
+    if (curr->filename && strcmp(curr->filename, next->filename)) {
         return false;
     }
     if (curr->has_offset && curr->offset + curr->length != next->offset) {
diff --git a/qemu-nbd.c b/qemu-nbd.c
index 0cd5aa6f02..6ff45308a9 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -1107,9 +1107,7 @@ int main(int argc, char **argv)
         .has_writable       = true,
         .writable           = !readonly,
         .u.nbd = {
-            .has_name             = true,
             .name                 = g_strdup(export_name),
-            .has_description      = !!export_description,
             .description          = g_strdup(export_description),
             .has_bitmaps          = !!bitmaps,
             .bitmaps              = bitmaps,
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 8db1c2caef..a205aae1e3 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -759,9 +759,6 @@ def need_has(self):
         assert self.type
         # Temporary hack to support dropping the has_FOO in reviewable chunks
         opt_out = [
-            'qapi/block-core.json',
-            'qapi/block-export.json',
-            'qapi/block.json',
             'qapi/char.json',
             'qapi/crypto.json',
             'qapi/dump.json',
-- 
2.37.2


