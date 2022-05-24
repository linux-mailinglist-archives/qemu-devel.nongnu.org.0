Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 073FD532367
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 08:42:00 +0200 (CEST)
Received: from localhost ([::1]:56898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntOEw-0006Ik-W1
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 02:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ntNtf-0000A2-Ob
 for qemu-devel@nongnu.org; Tue, 24 May 2022 02:20:00 -0400
Received: from mga17.intel.com ([192.55.52.151]:42016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ntNtd-0000NA-Sl
 for qemu-devel@nongnu.org; Tue, 24 May 2022 02:19:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653373197; x=1684909197;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cE6E4Jc2xo4pfVcaXlXSw4DTF9+/qGTREWZwt/36f30=;
 b=OUlCTIhqYyPo4xxCB+FUgnQ3RAwYycPc5rLwWQenEK8TZtq+uu4I16tt
 z7YqTyT7YxzGJW1wAIi+9ThB2V1mfPaZZWctm7BrAATWR0umi/SJbvVgX
 yeMAeLjgPkAePW3a1ud01vQv79p4HEIbb2a3wDeIyUzbkdXR+FP5UYDTW
 c+2ymtk2TtYKV0LARGR/g0L1Eog93Otu/SErvyhWOSHmq5F1ccEkwl+o9
 5zhSC21qN+VcpM4Uh8O/Ftkod8PZdJjxoq2M0/1PNVMsVijtn6UjmYNOZ
 7B8V7nxtY04F8mKuFK9lZbPcDjaSgVduSqBh77FnMio4dKi6evCuC1lRx Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="253943301"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="253943301"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 23:19:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="601059911"
Received: from leirao-pc.bj.intel.com ([10.238.156.102])
 by orsmga008.jf.intel.com with ESMTP; 23 May 2022 23:19:53 -0700
From: Lei Rao <lei.rao@intel.com>
To: alex.williamson@redhat.com, kevin.tian@intel.com, eddie.dong@intel.com,
 jason.zeng@intel.com, quintela@redhat.com, dgilbert@redhat.com,
 yadong.li@intel.com, yi.l.liu@intel.com
Cc: qemu-devel@nongnu.org,
	Lei Rao <lei.rao@intel.com>
Subject: [RFC PATCH 13/13] vfio/migration: make the region and plugin member
 of struct VFIOMigration to be a union
Date: Tue, 24 May 2022 14:18:48 +0800
Message-Id: <20220524061848.1615706-14-lei.rao@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220524061848.1615706-1-lei.rao@intel.com>
References: <20220524061848.1615706-1-lei.rao@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=lei.rao@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Since a VFIO device either uses In-Band or Out-of-Band live migration. So, the
region and plugin in VFIOMigration can be put into a union.

Signed-off-by: Lei Rao <lei.rao@intel.com>
Reviewed-by: Eddie Dong <eddie.dong@intel.com>
---
 hw/vfio/migration-local.c     | 33 ++++++++++++++++++---------------
 include/hw/vfio/vfio-common.h |  6 ++++--
 2 files changed, 22 insertions(+), 17 deletions(-)

diff --git a/hw/vfio/migration-local.c b/hw/vfio/migration-local.c
index 46c8baed50..13d1abee5a 100644
--- a/hw/vfio/migration-local.c
+++ b/hw/vfio/migration-local.c
@@ -98,7 +98,7 @@ static int vfio_migration_set_state_local(VFIODevice *vbasedev, uint32_t mask,
                                           uint32_t value)
 {
     VFIOMigration *migration = vbasedev->migration;
-    VFIORegion *region = &migration->region;
+    VFIORegion *region = migration->region;
     off_t dev_state_off = region->fd_offset +
                           VFIO_MIG_STRUCT_OFFSET(device_state);
     uint32_t device_state;
@@ -184,7 +184,7 @@ static int vfio_migration_save_buffer_local(QEMUFile *f, VFIODevice *vbasedev,
                                             uint64_t *size)
 {
     VFIOMigration *migration = vbasedev->migration;
-    VFIORegion *region = &migration->region;
+    VFIORegion *region = migration->region;
     uint64_t data_offset = 0, data_size = 0, sz;
     int ret;
 
@@ -250,7 +250,7 @@ static int vfio_migration_save_buffer_local(QEMUFile *f, VFIODevice *vbasedev,
 static int vfio_migration_load_buffer_local(QEMUFile *f, VFIODevice *vbasedev,
                                             uint64_t data_size)
 {
-    VFIORegion *region = &vbasedev->migration->region;
+    VFIORegion *region = vbasedev->migration->region;
     uint64_t data_offset = 0, size, report_size;
     int ret;
 
@@ -322,7 +322,7 @@ static int vfio_migration_load_buffer_local(QEMUFile *f, VFIODevice *vbasedev,
 static int vfio_migration_update_pending_local(VFIODevice *vbasedev)
 {
     VFIOMigration *migration = vbasedev->migration;
-    VFIORegion *region = &migration->region;
+    VFIORegion *region = migration->region;
     uint64_t pending_bytes = 0;
     int ret;
 
@@ -342,8 +342,8 @@ static void vfio_migration_cleanup_local(VFIODevice *vbasedev)
 {
     VFIOMigration *migration = vbasedev->migration;
 
-    if (migration->region.mmaps) {
-        vfio_region_unmap(&migration->region);
+    if (migration->region->mmaps) {
+        vfio_region_unmap(migration->region);
     }
 }
 
@@ -352,14 +352,14 @@ static int vfio_migration_save_setup_local(VFIODevice *vbasedev)
     VFIOMigration *migration = vbasedev->migration;
     int ret = -1;
 
-    if (migration->region.mmaps) {
+    if (migration->region->mmaps) {
         /*
          * Calling vfio_region_mmap() from migration thread. Memory API called
          * from this function require locking the iothread when called from
          * outside the main loop thread.
          */
         qemu_mutex_lock_iothread();
-        ret = vfio_region_mmap(&migration->region);
+        ret = vfio_region_mmap(migration->region);
         qemu_mutex_unlock_iothread();
         if (ret) {
             error_report("%s: Failed to mmap VFIO migration region: %s",
@@ -375,11 +375,11 @@ static int vfio_migration_load_setup_local(VFIODevice *vbasedev)
     VFIOMigration *migration = vbasedev->migration;
     int ret = -1;
 
-    if (migration->region.mmaps) {
-        ret = vfio_region_mmap(&migration->region);
+    if (migration->region->mmaps) {
+        ret = vfio_region_mmap(migration->region);
         if (ret) {
             error_report("%s: Failed to mmap VFIO migration region %d: %s",
-                         vbasedev->name, migration->region.nr,
+                         vbasedev->name, migration->region->nr,
                          strerror(-ret));
             error_report("%s: Falling back to slow path", vbasedev->name);
         }
@@ -391,8 +391,10 @@ static void vfio_migration_exit_local(VFIODevice *vbasedev)
 {
     VFIOMigration *migration = vbasedev->migration;
 
-    vfio_region_exit(&migration->region);
-    vfio_region_finalize(&migration->region);
+    vfio_region_exit(migration->region);
+    vfio_region_finalize(migration->region);
+    g_free(migration->region);
+    migration->region = NULL;
 }
 
 static VFIOMigrationOps vfio_local_method = {
@@ -426,7 +428,8 @@ int vfio_migration_probe_local(VFIODevice *vbasedev)
         return -EINVAL;
     }
 
-    ret = vfio_region_setup(obj, vbasedev, &vbasedev->migration->region,
+    migration->region = g_new0(VFIORegion, 1);
+    ret = vfio_region_setup(obj, vbasedev, vbasedev->migration->region,
                             info->index, "migration");
     if (ret) {
         error_report("%s: Failed to setup VFIO migration region %d: %s",
@@ -434,7 +437,7 @@ int vfio_migration_probe_local(VFIODevice *vbasedev)
         goto err;
     }
 
-    if (!vbasedev->migration->region.size) {
+    if (!vbasedev->migration->region->size) {
         error_report("%s: Invalid zero-sized VFIO migration region %d",
                      vbasedev->name, info->index);
         ret = -EINVAL;
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 2ea016a894..bded2b4908 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -78,9 +78,11 @@ typedef struct VFIOMigrationOps VFIOMigrationOps;
 typedef struct VFIOMigration {
     struct VFIODevice *vbasedev;
     VMChangeStateEntry *vm_state;
-    VFIORegion region;
     VFIOMigrationOps *ops;
-    VFIOMigrationPlugin *plugin;
+    union {
+        VFIORegion *region;
+        VFIOMigrationPlugin *plugin;
+    };
     uint32_t device_state;
     int vm_running;
     Notifier migration_state;
-- 
2.32.0


