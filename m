Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEA73381EE
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 00:53:04 +0100 (CET)
Received: from localhost ([::1]:37150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKV71-0004qC-LX
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 18:53:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lKUzW-0003dR-SP
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 18:45:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lKUzT-0003k4-8h
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 18:45:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615506314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K+5BHNLJ1GDq5HpQgwYYofyXEQ19Z/ZU7zJTadj2dU8=;
 b=GaLyTbiS7kxMQOVJ7+XD7+ETudSYyLZcNGVCMFBYpog+4afM94lfb3/+zAEOrwJ/BCTEqz
 Rdaq1191GfvMAyRbC8XME9Hq6j5Q6FSDCpIxjivgeJdXLCPqxwTujfRp0SPxL6OY5Ki9XN
 INGcGJ2l4OkO/Ard62rlOY2+cXh91IU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-if4kdQ9GMzKx6gSUyDCPvw-1; Thu, 11 Mar 2021 18:45:10 -0500
X-MC-Unique: if4kdQ9GMzKx6gSUyDCPvw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27D7784BA1C;
 Thu, 11 Mar 2021 23:44:57 +0000 (UTC)
Received: from gimli.home (ovpn-112-255.phx2.redhat.com [10.3.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC8735D742;
 Thu, 11 Mar 2021 23:44:56 +0000 (UTC)
Subject: [PULL 10/10] vfio/migrate: Move switch of dirty tracking into
 vfio_memory_listener
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 11 Mar 2021 16:44:56 -0700
Message-ID: <161550629637.21070.13637940897895586238.stgit@gimli.home>
In-Reply-To: <161550593889.21070.5662039089881992714.stgit@gimli.home>
References: <161550593889.21070.5662039089881992714.stgit@gimli.home>
User-Agent: StGit/0.21-2-g8ef5
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124;
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


