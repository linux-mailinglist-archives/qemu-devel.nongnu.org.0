Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5822F0D44
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 08:37:04 +0100 (CET)
Received: from localhost ([::1]:35892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyrl9-0006Kp-4T
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 02:37:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kyrjF-0005gM-Ae; Mon, 11 Jan 2021 02:35:05 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kyrjB-0005Kf-S3; Mon, 11 Jan 2021 02:35:04 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DDlnS18f9z7Sdj;
 Mon, 11 Jan 2021 15:33:48 +0800 (CST)
Received: from DESKTOP-5IS4806.china.huawei.com (10.174.184.42) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Mon, 11 Jan 2021 15:34:40 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: Kirti Wankhede <kwankhede@nvidia.com>, Alex Williamson
 <alex.williamson@redhat.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH] vfio/migrate: Move switch of dirty tracking into
 vfio_memory_listener
Date: Mon, 11 Jan 2021 15:34:39 +0800
Message-ID: <20210111073439.20236-1-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.184.42]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=zhukeqian1@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, wanghaibin.wang@huawei.com,
 jiangkunkun@huawei.com, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For now the switch of vfio dirty page tracking is integrated into
the vfio_save_handler, it causes some problems [1].

The object of dirty tracking is guest memory, but the object of
the vfio_save_handler is device state. This mixed logic produces
unnecessary coupling and conflicts:

1. Coupling: Their saving granule is different (perVM vs perDevice).
   vfio will enable dirty_page_tracking for each devices, actually
   once is enough.
2. Conflicts: The ram_save_setup() traverses all memory_listeners
   to execute their log_start() and log_sync() hooks to get the
   first round dirty bitmap, which is used by the bulk stage of
   ram saving. However, it can't get dirty bitmap from vfio, as
   @savevm_ram_handlers is registered before @vfio_save_handler.

Move the switch of vfio dirty_page_tracking into vfio_memory_listener
can solve above problems. Besides, Do not require devices in SAVING
state for vfio_sync_dirty_bitmap().

[1] https://www.spinics.net/lists/kvm/msg229967.html

Reported-by: Zenghui Yu <yuzenghui@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
---
 hw/vfio/common.c    | 53 +++++++++++++++++++++++++++++++++++++--------
 hw/vfio/migration.c | 35 ------------------------------
 2 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 6ff1daa763..9128cd7ee1 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -311,7 +311,7 @@ bool vfio_mig_active(void)
     return true;
 }
 
-static bool vfio_devices_all_saving(VFIOContainer *container)
+static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
 {
     VFIOGroup *group;
     VFIODevice *vbasedev;
@@ -329,13 +329,8 @@ static bool vfio_devices_all_saving(VFIOContainer *container)
                 return false;
             }
 
-            if (migration->device_state & VFIO_DEVICE_STATE_SAVING) {
-                if ((vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF)
-                    && (migration->device_state & VFIO_DEVICE_STATE_RUNNING)) {
-                        return false;
-                }
-                continue;
-            } else {
+            if ((vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF)
+                && (migration->device_state & VFIO_DEVICE_STATE_RUNNING)) {
                 return false;
             }
         }
@@ -987,6 +982,44 @@ static void vfio_listener_region_del(MemoryListener *listener,
     }
 }
 
+static void vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
+{
+    int ret;
+    struct vfio_iommu_type1_dirty_bitmap dirty = {
+        .argsz = sizeof(dirty),
+    };
+
+    if (start) {
+        dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_START;
+    } else {
+        dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_STOP;
+    }
+
+    ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, &dirty);
+    if (ret) {
+        error_report("Failed to set dirty tracking flag 0x%x errno: %d",
+                     dirty.flags, errno);
+    }
+}
+
+static void vfio_listener_log_start(MemoryListener *listener,
+                                    MemoryRegionSection *section,
+                                    int old, int new)
+{
+    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
+
+    vfio_set_dirty_page_tracking(container, true);
+}
+
+static void vfio_listener_log_stop(MemoryListener *listener,
+                                   MemoryRegionSection *section,
+                                   int old, int new)
+{
+    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
+
+    vfio_set_dirty_page_tracking(container, false);
+}
+
 static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
                                  uint64_t size, ram_addr_t ram_addr)
 {
@@ -1128,7 +1161,7 @@ static void vfio_listerner_log_sync(MemoryListener *listener,
         return;
     }
 
-    if (vfio_devices_all_saving(container)) {
+    if (vfio_devices_all_dirty_tracking(container)) {
         vfio_sync_dirty_bitmap(container, section);
     }
 }
@@ -1136,6 +1169,8 @@ static void vfio_listerner_log_sync(MemoryListener *listener,
 static const MemoryListener vfio_memory_listener = {
     .region_add = vfio_listener_region_add,
     .region_del = vfio_listener_region_del,
+    .log_start = vfio_listener_log_start,
+    .log_stop = vfio_listener_log_stop,
     .log_sync = vfio_listerner_log_sync,
 };
 
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 00daa50ed8..c0f646823a 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -395,40 +395,10 @@ static int vfio_load_device_config_state(QEMUFile *f, void *opaque)
     return qemu_file_get_error(f);
 }
 
-static int vfio_set_dirty_page_tracking(VFIODevice *vbasedev, bool start)
-{
-    int ret;
-    VFIOMigration *migration = vbasedev->migration;
-    VFIOContainer *container = vbasedev->group->container;
-    struct vfio_iommu_type1_dirty_bitmap dirty = {
-        .argsz = sizeof(dirty),
-    };
-
-    if (start) {
-        if (migration->device_state & VFIO_DEVICE_STATE_SAVING) {
-            dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_START;
-        } else {
-            return -EINVAL;
-        }
-    } else {
-            dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_STOP;
-    }
-
-    ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, &dirty);
-    if (ret) {
-        error_report("Failed to set dirty tracking flag 0x%x errno: %d",
-                     dirty.flags, errno);
-        return -errno;
-    }
-    return ret;
-}
-
 static void vfio_migration_cleanup(VFIODevice *vbasedev)
 {
     VFIOMigration *migration = vbasedev->migration;
 
-    vfio_set_dirty_page_tracking(vbasedev, false);
-
     if (migration->region.mmaps) {
         vfio_region_unmap(&migration->region);
     }
@@ -469,11 +439,6 @@ static int vfio_save_setup(QEMUFile *f, void *opaque)
         return ret;
     }
 
-    ret = vfio_set_dirty_page_tracking(vbasedev, true);
-    if (ret) {
-        return ret;
-    }
-
     qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
 
     ret = qemu_file_get_error(f);
-- 
2.19.1


