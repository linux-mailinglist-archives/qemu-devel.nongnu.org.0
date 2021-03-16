Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC4133DB62
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 18:48:57 +0100 (CET)
Received: from localhost ([::1]:49812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMDoO-0003EE-OA
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 13:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lMDAk-00050T-Uo
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:07:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lMDAi-00060L-Tr
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:07:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615914475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K+5BHNLJ1GDq5HpQgwYYofyXEQ19Z/ZU7zJTadj2dU8=;
 b=YXjv/ZZ7UQmBU9PBpwWIz8Az6GDoglbIV+w5Aiv8Q1u1ylg/+lO1172NH1BKcyRkiVlH2B
 A1VmKnTKGrCpL6M87qHD/NUIjm1zOJsj6wRHJlTlKf377EP0ITTwSAWE/SKW4rBH/lqJAB
 7ofbcE+v10upsvmAJWHYMn0+bZmBgRE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-0y3UiZ1wNuKU_HAkREVz7g-1; Tue, 16 Mar 2021 13:07:52 -0400
X-MC-Unique: 0y3UiZ1wNuKU_HAkREVz7g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F05F801596;
 Tue, 16 Mar 2021 17:07:51 +0000 (UTC)
Received: from rhel8vm.home.shazbot.org (ovpn-115-65.phx2.redhat.com
 [10.3.115.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 260105C1A3;
 Tue, 16 Mar 2021 17:07:48 +0000 (UTC)
Subject: [PULL 10/10] vfio/migrate: Move switch of dirty tracking into
 vfio_memory_listener
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 16 Mar 2021 11:07:48 -0600
Message-ID: <161591446879.135549.13699828622046019656.stgit@rhel8vm.home.shazbot.org>
In-Reply-To: <161591414009.135549.5804863877511053803.stgit@rhel8vm.home.shazbot.org>
References: <161591414009.135549.5804863877511053803.stgit@rhel8vm.home.shazbot.org>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keqian Zhu <zhukeqian1@huawei.com>

For now the switch of vfio dirty page tracking is integrated into
@vfio_save_handler. The reason is that some PCI vendor driver may
start to track dirty base on _SAVING state of device, so if dirty
tracking is started before setting device state, vfio will report
full-dirty to QEMU.

However, the dirty bmap of all ramblocks are fully set when setup
ram saving, so it's not matter whether the device is in _SAVING
state when start vfio dirty tracking.

Moreover, this logic causes some problems [1]. The object of dirty
tracking is guest memory, but the object of @vfio_save_handler is
device state, which produces unnecessary coupling and conflicts:

1. Coupling: Their saving granule is different (perVM vs perDevice).
   vfio will enable dirty_page_tracking for each devices, actually
   once is enough.

2. Conflicts: The ram_save_setup() traverses all memory_listeners
   to execute their log_start() and log_sync() hooks to get the
   first round dirty bitmap, which is used by the bulk stage of
   ram saving. However, as vfio dirty tracking is not yet started,
   it can't get dirty bitmap from vfio. Then we give up the chance
   to handle vfio dirty page at bulk stage.

Move the switch of vfio dirty_page_tracking into vfio_memory_listener
can solve above problems. Besides, Do not require devices in SAVING
state for vfio_sync_dirty_bitmap().

[1] https://www.spinics.net/lists/kvm/msg229967.html

Reported-by: Zenghui Yu <yuzenghui@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210309031913.11508-1-zhukeqian1@huawei.com>
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/common.c    |   49 ++++++++++++++++++++++++++++++++++++++++---------
 hw/vfio/migration.c |   35 -----------------------------------
 2 files changed, 40 insertions(+), 44 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index ad08dfd729b9..ae5654fcdb8d 100644
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
@@ -989,6 +984,40 @@ static void vfio_listener_region_del(MemoryListener *listener,
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
+static void vfio_listener_log_global_start(MemoryListener *listener)
+{
+    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
+
+    vfio_set_dirty_page_tracking(container, true);
+}
+
+static void vfio_listener_log_global_stop(MemoryListener *listener)
+{
+    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
+
+    vfio_set_dirty_page_tracking(container, false);
+}
+
 static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
                                  uint64_t size, ram_addr_t ram_addr)
 {
@@ -1130,7 +1159,7 @@ static void vfio_listener_log_sync(MemoryListener *listener,
         return;
     }
 
-    if (vfio_devices_all_saving(container)) {
+    if (vfio_devices_all_dirty_tracking(container)) {
         vfio_sync_dirty_bitmap(container, section);
     }
 }
@@ -1138,6 +1167,8 @@ static void vfio_listener_log_sync(MemoryListener *listener,
 static const MemoryListener vfio_memory_listener = {
     .region_add = vfio_listener_region_add,
     .region_del = vfio_listener_region_del,
+    .log_global_start = vfio_listener_log_global_start,
+    .log_global_stop = vfio_listener_log_global_stop,
     .log_sync = vfio_listener_log_sync,
 };
 
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index eafb778947c3..384576cfc051 100644
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



