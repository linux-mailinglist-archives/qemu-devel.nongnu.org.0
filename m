Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EF7532348
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 08:33:44 +0200 (CEST)
Received: from localhost ([::1]:49208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntO6x-0008VL-6w
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 02:33:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ntNt7-0007vq-U0
 for qemu-devel@nongnu.org; Tue, 24 May 2022 02:19:25 -0400
Received: from mga17.intel.com ([192.55.52.151]:41972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ntNt5-0000GZ-AC
 for qemu-devel@nongnu.org; Tue, 24 May 2022 02:19:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653373163; x=1684909163;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MTVZIHubx9UoalfP6fFQLeCYUN615ZIuuSDRJi+Qj+s=;
 b=CF+zIiZD9ktLBOqMwV4tYKqXDH3q//qLXJ+QS9yBwNqLsflyzhc2B+t7
 iKABtNtukJt1/pHqFkxOyBajYef1Wfk+CeW/fNzDEn56JEOt9xIMmh1Nl
 To+c8kN6DeMCT1N1Zid+6ZJqForA0UqGKyxIDG2leVSdeH+gzUAuTiQRQ
 ZOfrc4ls04Fiq4bkNc3e4XdgSB5epyHBAzWbQ/Sal5F3vfFGfcZATmkIN
 BukRr1PiWvnj0ZztIQ8MU0nwEZLJ7MF/IWP1R+pjKBpKVe3A/8OExwetM
 wRWwSnyg64sWXg3873PaqL0s9U9VNY7bfoN2aUuNrNPO6rVCHRDftAO+b w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="253943192"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="253943192"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 23:19:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="601059714"
Received: from leirao-pc.bj.intel.com ([10.238.156.102])
 by orsmga008.jf.intel.com with ESMTP; 23 May 2022 23:19:19 -0700
From: Lei Rao <lei.rao@intel.com>
To: alex.williamson@redhat.com, kevin.tian@intel.com, eddie.dong@intel.com,
 jason.zeng@intel.com, quintela@redhat.com, dgilbert@redhat.com,
 yadong.li@intel.com, yi.l.liu@intel.com
Cc: qemu-devel@nongnu.org,
	Lei Rao <lei.rao@intel.com>
Subject: [RFC PATCH 05/13] vfio/migration: rename functions that relate to the
 In-Band approach
Date: Tue, 24 May 2022 14:18:40 +0800
Message-Id: <20220524061848.1615706-6-lei.rao@intel.com>
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

Rename some functions that are related to the In-Band approach to facilitate
introducing generic vfio live migration layer.

Rename vfio_migration_set_state to vfio_migration_set_state_local,
vfio_save_buffer to vfio_migration_save_buffer_local,
vfio_load_buffer to vfio_migration_load_buffer_local,
vfio_update_pending to vfio_migration_update_pending_local,
vfio_migration_init to vfio_migration_probe_local,
vfio_migration_exit to vfio_migration_exit_local.

Signed-off-by: Lei Rao <lei.rao@intel.com>
Reviewed-by: Eddie Dong <eddie.dong@intel.com>
---
 hw/vfio/migration.c  | 74 +++++++++++++++++++++++---------------------
 hw/vfio/trace-events |  6 ++--
 2 files changed, 42 insertions(+), 38 deletions(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index c2df2caae6..04360e1f17 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -107,8 +107,8 @@ static int vfio_mig_rw(VFIODevice *vbasedev, __u8 *buf, size_t count,
  * an error is returned.
  */
 
-static int vfio_migration_set_state(VFIODevice *vbasedev, uint32_t mask,
-                                    uint32_t value)
+static int vfio_migration_set_state_local(VFIODevice *vbasedev, uint32_t mask,
+                                          uint32_t value)
 {
     VFIOMigration *migration = vbasedev->migration;
     VFIORegion *region = &migration->region;
@@ -193,7 +193,8 @@ static void *get_data_section_size(VFIORegion *region, uint64_t data_offset,
     return ptr;
 }
 
-static int vfio_save_buffer(QEMUFile *f, VFIODevice *vbasedev, uint64_t *size)
+static int vfio_migration_save_buffer_local(QEMUFile *f, VFIODevice *vbasedev,
+                                            uint64_t *size)
 {
     VFIOMigration *migration = vbasedev->migration;
     VFIORegion *region = &migration->region;
@@ -212,8 +213,8 @@ static int vfio_save_buffer(QEMUFile *f, VFIODevice *vbasedev, uint64_t *size)
         return ret;
     }
 
-    trace_vfio_save_buffer(vbasedev->name, data_offset, data_size,
-                           migration->pending_bytes);
+    trace_vfio_save_buffer_local(vbasedev->name, data_offset, data_size,
+                                 migration->pending_bytes);
 
     qemu_put_be64(f, data_size);
     sz = data_size;
@@ -260,8 +261,8 @@ static int vfio_save_buffer(QEMUFile *f, VFIODevice *vbasedev, uint64_t *size)
     return ret;
 }
 
-static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
-                            uint64_t data_size)
+static int vfio_migration_load_buffer_local(QEMUFile *f, VFIODevice *vbasedev,
+                                            uint64_t data_size)
 {
     VFIORegion *region = &vbasedev->migration->region;
     uint64_t data_offset = 0, size, report_size;
@@ -288,7 +289,8 @@ static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
             data_size = 0;
         }
 
-        trace_vfio_load_state_device_data(vbasedev->name, data_offset, size);
+        trace_vfio_load_state_device_data_local(vbasedev->name, data_offset,
+                                                size);
 
         while (size) {
             void *buf;
@@ -331,7 +333,7 @@ static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
     return 0;
 }
 
-static int vfio_update_pending(VFIODevice *vbasedev)
+static int vfio_migration_update_pending_local(VFIODevice *vbasedev)
 {
     VFIOMigration *migration = vbasedev->migration;
     VFIORegion *region = &migration->region;
@@ -449,8 +451,8 @@ static int vfio_save_setup(QEMUFile *f, void *opaque)
         return ret;
     }
 
-    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_MASK,
-                                   VFIO_DEVICE_STATE_V1_SAVING);
+    ret = vfio_migration_set_state_local(vbasedev, VFIO_DEVICE_STATE_MASK,
+                                         VFIO_DEVICE_STATE_V1_SAVING);
     if (ret) {
         error_report("%s: Failed to set state SAVING", vbasedev->name);
         return ret;
@@ -484,7 +486,7 @@ static void vfio_save_pending(QEMUFile *f, void *opaque,
     VFIOMigration *migration = vbasedev->migration;
     int ret;
 
-    ret = vfio_update_pending(vbasedev);
+    ret = vfio_migration_update_pending_local(vbasedev);
     if (ret) {
         return;
     }
@@ -505,7 +507,7 @@ static int vfio_save_iterate(QEMUFile *f, void *opaque)
     qemu_put_be64(f, VFIO_MIG_FLAG_DEV_DATA_STATE);
 
     if (migration->pending_bytes == 0) {
-        ret = vfio_update_pending(vbasedev);
+        ret = vfio_migration_update_pending_local(vbasedev);
         if (ret) {
             return ret;
         }
@@ -518,10 +520,10 @@ static int vfio_save_iterate(QEMUFile *f, void *opaque)
         }
     }
 
-    ret = vfio_save_buffer(f, vbasedev, &data_size);
+    ret = vfio_migration_save_buffer_local(f, vbasedev, &data_size);
     if (ret) {
-        error_report("%s: vfio_save_buffer failed %s", vbasedev->name,
-                     strerror(errno));
+        error_report("%s: vfio_miragion_save_buffer_local failed %s",
+                     vbasedev->name, strerror(errno));
         return ret;
     }
 
@@ -534,8 +536,8 @@ static int vfio_save_iterate(QEMUFile *f, void *opaque)
 
     /*
      * Reset pending_bytes as .save_live_pending is not called during savevm or
-     * snapshot case, in such case vfio_update_pending() at the start of this
-     * function updates pending_bytes.
+     * snapshot case, in such case vfio_migration_update_pending_local() at the
+     * start of this function updates pending_bytes.
      */
     migration->pending_bytes = 0;
     trace_vfio_save_iterate(vbasedev->name, data_size);
@@ -549,22 +551,23 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
     uint64_t data_size;
     int ret;
 
-    ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_V1_RUNNING,
-                                   VFIO_DEVICE_STATE_V1_SAVING);
+    ret = vfio_migration_set_state_local(vbasedev,
+                                         ~VFIO_DEVICE_STATE_V1_RUNNING,
+                                         VFIO_DEVICE_STATE_V1_SAVING);
     if (ret) {
         error_report("%s: Failed to set state STOP and SAVING",
                      vbasedev->name);
         return ret;
     }
 
-    ret = vfio_update_pending(vbasedev);
+    ret = vfio_migration_update_pending_local(vbasedev);
     if (ret) {
         return ret;
     }
 
     while (migration->pending_bytes > 0) {
         qemu_put_be64(f, VFIO_MIG_FLAG_DEV_DATA_STATE);
-        ret = vfio_save_buffer(f, vbasedev, &data_size);
+        ret = vfio_migration_save_buffer_local(f, vbasedev, &data_size);
         if (ret < 0) {
             error_report("%s: Failed to save buffer", vbasedev->name);
             return ret;
@@ -574,7 +577,7 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
             break;
         }
 
-        ret = vfio_update_pending(vbasedev);
+        ret = vfio_migration_update_pending_local(vbasedev);
         if (ret) {
             return ret;
         }
@@ -587,7 +590,8 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
         return ret;
     }
 
-    ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_V1_SAVING, 0);
+    ret = vfio_migration_set_state_local(vbasedev, ~VFIO_DEVICE_STATE_V1_SAVING,
+                                         0);
     if (ret) {
         error_report("%s: Failed to set state STOPPED", vbasedev->name);
         return ret;
@@ -638,7 +642,7 @@ static int vfio_load_setup(QEMUFile *f, void *opaque)
         return ret;
     }
 
-    ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_MASK,
+    ret = vfio_migration_set_state_local(vbasedev, ~VFIO_DEVICE_STATE_MASK,
                                    VFIO_DEVICE_STATE_V1_RESUMING);
     if (ret) {
         error_report("%s: Failed to set state RESUMING", vbasedev->name);
@@ -690,7 +694,7 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
             uint64_t data_size = qemu_get_be64(f);
 
             if (data_size) {
-                ret = vfio_load_buffer(f, vbasedev, data_size);
+                ret = vfio_migration_load_buffer_local(f, vbasedev, data_size);
                 if (ret < 0) {
                     return ret;
                 }
@@ -765,7 +769,7 @@ static void vfio_vmstate_change(void *opaque, bool running, RunState state)
         }
     }
 
-    ret = vfio_migration_set_state(vbasedev, mask, value);
+    ret = vfio_migration_set_state_local(vbasedev, mask, value);
     if (ret) {
         /*
          * Migration should be aborted in this case, but vm_state_notify()
@@ -796,10 +800,10 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
     case MIGRATION_STATUS_CANCELLED:
     case MIGRATION_STATUS_FAILED:
         bytes_transferred = 0;
-        ret = vfio_migration_set_state(vbasedev,
-                                       ~(VFIO_DEVICE_STATE_V1_SAVING |
-                                         VFIO_DEVICE_STATE_V1_RESUMING),
-                                       VFIO_DEVICE_STATE_V1_RUNNING);
+        ret = vfio_migration_set_state_local(vbasedev,
+                                             ~(VFIO_DEVICE_STATE_V1_SAVING |
+                                             VFIO_DEVICE_STATE_V1_RESUMING),
+                                             VFIO_DEVICE_STATE_V1_RUNNING);
         if (ret) {
             error_report("%s: Failed to set state RUNNING", vbasedev->name);
         }
@@ -836,7 +840,7 @@ static int vfio_migration_check(VFIODevice *vbasedev)
     return 0;
 }
 
-static int vfio_migration_init(VFIODevice *vbasedev)
+static int vfio_migration_probe_local(VFIODevice *vbasedev)
 {
     int ret;
     Object *obj;
@@ -890,12 +894,12 @@ static int vfio_migration_init(VFIODevice *vbasedev)
     migration->migration_state.notify = vfio_migration_state_notifier;
     add_migration_state_change_notifier(&migration->migration_state);
 
-    trace_vfio_migration_probe(vbasedev->name, info->index);
+    trace_vfio_migration_probe_local(vbasedev->name, info->index);
     g_free(info);
     return 0;
 
 err:
-    vfio_migration_exit(vbasedev);
+    vfio_migration_exit_local(vbasedev);
     g_free(info);
     return ret;
 }
@@ -919,7 +923,7 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
     vbasedev->migration = g_new0(VFIOMigration, 1);
     vbasedev->migration->vbasedev = vbasedev;
 
-    ret = vfio_migration_init(vbasedev);
+    ret = vfio_migration_probe_local(vbasedev);
     if (ret) {
         goto add_blocker;
     }
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 582882db91..ca85edeb11 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -148,13 +148,13 @@ vfio_display_edid_update(uint32_t prefx, uint32_t prefy) "%ux%u"
 vfio_display_edid_write_error(void) ""
 
 # migration.c
-vfio_migration_probe(const char *name, uint32_t index) " (%s) Region %d"
+vfio_migration_probe_local(const char *name, uint32_t index) " (%s) Region %d"
 vfio_migration_set_state(const char *name, uint32_t state) " (%s) state %d"
 vfio_vmstate_change(const char *name, int running, const char *reason, uint32_t dev_state) " (%s) running %d reason %s device state %d"
 vfio_migration_state_notifier(const char *name, const char *state) " (%s) state %s"
 vfio_save_setup(const char *name) " (%s)"
 vfio_save_cleanup(const char *name) " (%s)"
-vfio_save_buffer(const char *name, uint64_t data_offset, uint64_t data_size, uint64_t pending) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64" pending 0x%"PRIx64
+vfio_save_buffer_local(const char *name, uint64_t data_offset, uint64_t data_size, uint64_t pending) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64" pending 0x%"PRIx64
 vfio_update_pending(const char *name, uint64_t pending) " (%s) pending 0x%"PRIx64
 vfio_save_device_config_state(const char *name) " (%s)"
 vfio_save_pending(const char *name, uint64_t precopy, uint64_t postcopy, uint64_t compatible) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" compatible 0x%"PRIx64
@@ -162,7 +162,7 @@ vfio_save_iterate(const char *name, int data_size) " (%s) data_size %d"
 vfio_save_complete_precopy(const char *name) " (%s)"
 vfio_load_device_config_state(const char *name) " (%s)"
 vfio_load_state(const char *name, uint64_t data) " (%s) data 0x%"PRIx64
-vfio_load_state_device_data(const char *name, uint64_t data_offset, uint64_t data_size) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64
+vfio_load_state_device_data_local(const char *name, uint64_t data_offset, uint64_t data_size) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64
 vfio_load_cleanup(const char *name) " (%s)"
 vfio_get_dirty_bitmap(int fd, uint64_t iova, uint64_t size, uint64_t bitmap_size, uint64_t start) "container fd=%d, iova=0x%"PRIx64" size= 0x%"PRIx64" bitmap_size=0x%"PRIx64" start=0x%"PRIx64
 vfio_iommu_map_dirty_notify(uint64_t iova_start, uint64_t iova_end) "iommu dirty @ 0x%"PRIx64" - 0x%"PRIx64
-- 
2.32.0


