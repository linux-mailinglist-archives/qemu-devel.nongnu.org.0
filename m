Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4046AF2A5
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:54:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZcRT-0004Hm-25; Tue, 07 Mar 2023 13:53:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pZcRL-00040d-6N
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:53:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pZcRI-0002X9-VV
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:53:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678215212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3is1EO+e59R2Efi7xTRQ9Xcwmse/bnNq62voqLfeVvc=;
 b=fHBiobypLQC1hL2Q4ulgtgXQplFnHCY3KADZN5mPDrMeldXZ1ZNxJNCnDeB9P4Li00Umds
 QQQb0Ndw0vs0/cLVeIA8anBk4WvHz9PHjszJB6FewP1SynE/1zJR1qCrBgI3fXDyK0dmbG
 hfhXMarMWO/9Om6rsBvFesrxiICbJ0Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-GBirf9KtNYix63LjOGM_aQ-1; Tue, 07 Mar 2023 13:53:29 -0500
X-MC-Unique: GBirf9KtNYix63LjOGM_aQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A122C3C218A6;
 Tue,  7 Mar 2023 18:53:28 +0000 (UTC)
Received: from [172.30.41.16] (unknown [10.22.16.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 34F83C15BAD;
 Tue,  7 Mar 2023 18:53:28 +0000 (UTC)
Subject: [PULL 12/17] vfio/common: Add device dirty page bitmap sync
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, avihaih@nvidia.com, clg@redhat.com,
 joao.m.martins@oracle.com
Date: Tue, 07 Mar 2023 11:53:27 -0700
Message-ID: <167821520784.619792.11371797274291565.stgit@omen>
In-Reply-To: <167821508699.619792.1719671327865445814.stgit@omen>
References: <167821508699.619792.1719671327865445814.stgit@omen>
User-Agent: StGit/1.5.dev2+g9ce680a52bd9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Joao Martins <joao.m.martins@oracle.com>

Add device dirty page bitmap sync functionality. This uses the device
DMA logging uAPI to sync dirty page bitmap from the device.

Device dirty page bitmap sync is used only if all devices within a
container support device dirty page tracking.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/r/20230307125450.62409-13-joao.m.martins@oracle.com
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/common.c |   88 ++++++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 79 insertions(+), 9 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index ae81af6d3269..334c62585829 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -339,6 +339,9 @@ static int vfio_bitmap_alloc(VFIOBitmap *vbmap, hwaddr size)
     return 0;
 }
 
+static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
+                                 uint64_t size, ram_addr_t ram_addr);
+
 bool vfio_mig_active(void)
 {
     VFIOGroup *group;
@@ -562,10 +565,16 @@ static int vfio_dma_unmap(VFIOContainer *container,
         .iova = iova,
         .size = size,
     };
+    bool need_dirty_sync = false;
+    int ret;
+
+    if (iotlb && vfio_devices_all_running_and_mig_active(container)) {
+        if (!vfio_devices_all_device_dirty_tracking(container) &&
+            container->dirty_pages_supported) {
+            return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
+        }
 
-    if (iotlb && container->dirty_pages_supported &&
-        vfio_devices_all_running_and_mig_active(container)) {
-        return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
+        need_dirty_sync = true;
     }
 
     while (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
@@ -591,10 +600,12 @@ static int vfio_dma_unmap(VFIOContainer *container,
         return -errno;
     }
 
-    if (iotlb && vfio_devices_all_running_and_mig_active(container)) {
-        cpu_physical_memory_set_dirty_range(iotlb->translated_addr, size,
-                                            tcg_enabled() ? DIRTY_CLIENTS_ALL :
-                                            DIRTY_CLIENTS_NOCODE);
+    if (need_dirty_sync) {
+        ret = vfio_get_dirty_bitmap(container, iova, size,
+                                    iotlb->translated_addr);
+        if (ret) {
+            return ret;
+        }
     }
 
     return 0;
@@ -1595,6 +1606,58 @@ static void vfio_listener_log_global_stop(MemoryListener *listener)
     }
 }
 
+static int vfio_device_dma_logging_report(VFIODevice *vbasedev, hwaddr iova,
+                                          hwaddr size, void *bitmap)
+{
+    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
+                        sizeof(struct vfio_device_feature_dma_logging_report),
+                        sizeof(__u64))] = {};
+    struct vfio_device_feature *feature = (struct vfio_device_feature *)buf;
+    struct vfio_device_feature_dma_logging_report *report =
+        (struct vfio_device_feature_dma_logging_report *)feature->data;
+
+    report->iova = iova;
+    report->length = size;
+    report->page_size = qemu_real_host_page_size();
+    report->bitmap = (__u64)(uintptr_t)bitmap;
+
+    feature->argsz = sizeof(buf);
+    feature->flags = VFIO_DEVICE_FEATURE_GET |
+                     VFIO_DEVICE_FEATURE_DMA_LOGGING_REPORT;
+
+    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
+        return -errno;
+    }
+
+    return 0;
+}
+
+static int vfio_devices_query_dirty_bitmap(VFIOContainer *container,
+                                           VFIOBitmap *vbmap, hwaddr iova,
+                                           hwaddr size)
+{
+    VFIODevice *vbasedev;
+    VFIOGroup *group;
+    int ret;
+
+    QLIST_FOREACH(group, &container->group_list, container_next) {
+        QLIST_FOREACH(vbasedev, &group->device_list, next) {
+            ret = vfio_device_dma_logging_report(vbasedev, iova, size,
+                                                 vbmap->bitmap);
+            if (ret) {
+                error_report("%s: Failed to get DMA logging report, iova: "
+                             "0x%" HWADDR_PRIx ", size: 0x%" HWADDR_PRIx
+                             ", err: %d (%s)",
+                             vbasedev->name, iova, size, ret, strerror(-ret));
+
+                return ret;
+            }
+        }
+    }
+
+    return 0;
+}
+
 static int vfio_query_dirty_bitmap(VFIOContainer *container, VFIOBitmap *vbmap,
                                    hwaddr iova, hwaddr size)
 {
@@ -1635,10 +1698,12 @@ static int vfio_query_dirty_bitmap(VFIOContainer *container, VFIOBitmap *vbmap,
 static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
                                  uint64_t size, ram_addr_t ram_addr)
 {
+    bool all_device_dirty_tracking =
+        vfio_devices_all_device_dirty_tracking(container);
     VFIOBitmap vbmap;
     int ret;
 
-    if (!container->dirty_pages_supported) {
+    if (!container->dirty_pages_supported && !all_device_dirty_tracking) {
         cpu_physical_memory_set_dirty_range(ram_addr, size,
                                             tcg_enabled() ? DIRTY_CLIENTS_ALL :
                                             DIRTY_CLIENTS_NOCODE);
@@ -1650,7 +1715,12 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
         return ret;
     }
 
-    ret = vfio_query_dirty_bitmap(container, &vbmap, iova, size);
+    if (all_device_dirty_tracking) {
+        ret = vfio_devices_query_dirty_bitmap(container, &vbmap, iova, size);
+    } else {
+        ret = vfio_query_dirty_bitmap(container, &vbmap, iova, size);
+    }
+
     if (ret) {
         goto out;
     }



