Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F437202692
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Jun 2020 23:03:25 +0200 (CEST)
Received: from localhost ([::1]:38532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmke4-0001VC-C2
	for lists+qemu-devel@lfdr.de; Sat, 20 Jun 2020 17:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1jmkXc-0006vo-6Z
 for qemu-devel@nongnu.org; Sat, 20 Jun 2020 16:56:44 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:1181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1jmkXW-0000WA-9Q
 for qemu-devel@nongnu.org; Sat, 20 Jun 2020 16:56:43 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5eee77f80000>; Sat, 20 Jun 2020 13:56:24 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Sat, 20 Jun 2020 13:56:37 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Sat, 20 Jun 2020 13:56:37 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 20 Jun
 2020 20:56:29 +0000
Received: from kwankhede-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Sat, 20 Jun 2020 20:56:21 +0000
From: Kirti Wankhede <kwankhede@nvidia.com>
To: <alex.williamson@redhat.com>, <cjia@nvidia.com>
Subject: [PATCH QEMU v25 14/17] vfio: Add vfio_listener_log_sync to mark dirty
 pages
Date: Sun, 21 Jun 2020 01:51:23 +0530
Message-ID: <1592684486-18511-15-git-send-email-kwankhede@nvidia.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1592684486-18511-1-git-send-email-kwankhede@nvidia.com>
References: <1592684486-18511-1-git-send-email-kwankhede@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1592686584; bh=N/jUjXWsWdLZD+8jlrwaf5har468h4ELMmhLfVIXQHA=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=H+otU3hVNTld1i8AXX90WSU0hTPgJknx+7GqSuMcChXGCeAnkIzoGOGeCWw/jv2zB
 04IeTCBrFiHayXlC68IS+AthVbktOQtCxJyNl388HAJ8kdVHuOqufoO9I6zC3Z7Mwv
 mGXVLtfHpX1ZgtOV+WviPN9MJtAJ3rd0Xj8KohDFuNszb1xH7p/uRLrHvZMm8BkfrX
 N/1KLrvUvTf1u/pCnAlKxZwkjvpuTPRtLykc8es4fox2q5jUctv6c43Phs92f4AgEM
 LD0Hs5sdYVP4VjKDEfldKZ1hEgn4RJa/cAPqCfiyXeDCThLB7GFND5ExvTOOdKnnvZ
 Q9JxtPmmluArw==
Received-SPF: pass client-ip=216.228.121.65; envelope-from=kwankhede@nvidia.com;
 helo=hqnvemgate26.nvidia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/20 16:54:48
X-ACL-Warn: Detected OS   = Windows 7 or 8 [fuzzy]
X-Spam_score_int: -80
X-Spam_score: -8.1
X-Spam_bar: --------
X-Spam_report: (-8.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: cohuck@redhat.com, aik@ozlabs.ru, Zhengxiao.zx@Alibaba-inc.com,
 shuangtai.tst@alibaba-inc.com, qemu-devel@nongnu.org, peterx@redhat.com,
 Kirti Wankhede <kwankhede@nvidia.com>, eauger@redhat.com, yi.l.liu@intel.com,
 quintela@redhat.com, ziye.yang@intel.com, armbru@redhat.com,
 mlevitsk@redhat.com, pasic@linux.ibm.com, felipe@nutanix.com,
 zhi.a.wang@intel.com, kevin.tian@intel.com, yan.y.zhao@intel.com,
 dgilbert@redhat.com, changpeng.liu@intel.com, eskultet@redhat.com,
 Ken.Xue@amd.com, jonathan.davies@nutanix.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vfio_listener_log_sync gets list of dirty pages from container using
VFIO_IOMMU_GET_DIRTY_BITMAP ioctl and mark those pages dirty when all
devices are stopped and saving state.
Return early for the RAM block section of mapped MMIO region.

Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
Reviewed-by: Neo Jia <cjia@nvidia.com>
---
 hw/vfio/common.c     | 130 +++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/trace-events |   1 +
 2 files changed, 131 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 6921a78e9ba5..0518cf228ed5 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -29,6 +29,7 @@
 #include "hw/vfio/vfio.h"
 #include "exec/address-spaces.h"
 #include "exec/memory.h"
+#include "exec/ram_addr.h"
 #include "hw/hw.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
@@ -38,6 +39,7 @@
 #include "sysemu/reset.h"
 #include "trace.h"
 #include "qapi/error.h"
+#include "migration/migration.h"
 
 VFIOGroupList vfio_group_list =
     QLIST_HEAD_INITIALIZER(vfio_group_list);
@@ -288,6 +290,28 @@ const MemoryRegionOps vfio_region_ops = {
 };
 
 /*
+ * Device state interfaces
+ */
+
+static bool vfio_devices_are_stopped_and_saving(void)
+{
+    VFIOGroup *group;
+    VFIODevice *vbasedev;
+
+    QLIST_FOREACH(group, &vfio_group_list, next) {
+        QLIST_FOREACH(vbasedev, &group->device_list, next) {
+            if ((vbasedev->device_state & VFIO_DEVICE_STATE_SAVING) &&
+                !(vbasedev->device_state & VFIO_DEVICE_STATE_RUNNING)) {
+                continue;
+            } else {
+                return false;
+            }
+        }
+    }
+    return true;
+}
+
+/*
  * DMA - Mapping and unmapping for the "type1" IOMMU interface used on x86
  */
 static int vfio_dma_unmap(VFIOContainer *container,
@@ -852,9 +876,115 @@ static void vfio_listener_region_del(MemoryListener *listener,
     }
 }
 
+static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
+                                 uint64_t size, ram_addr_t ram_addr)
+{
+    struct vfio_iommu_type1_dirty_bitmap *dbitmap;
+    struct vfio_iommu_type1_dirty_bitmap_get *range;
+    uint64_t pages;
+    int ret;
+
+    dbitmap = g_malloc0(sizeof(*dbitmap) + sizeof(*range));
+
+    dbitmap->argsz = sizeof(*dbitmap) + sizeof(*range);
+    dbitmap->flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_GET_BITMAP;
+    range = (struct vfio_iommu_type1_dirty_bitmap_get *)&dbitmap->data;
+    range->iova = iova;
+    range->size = size;
+
+    /*
+     * cpu_physical_memory_set_dirty_lebitmap() expects pages in bitmap of
+     * TARGET_PAGE_SIZE to mark those dirty. Hence set bitmap's pgsize to
+     * TARGET_PAGE_SIZE.
+     */
+    range->bitmap.pgsize = TARGET_PAGE_SIZE;
+
+    pages = TARGET_PAGE_ALIGN(range->size) >> TARGET_PAGE_BITS;
+    range->bitmap.size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
+                                         BITS_PER_BYTE;
+    range->bitmap.data = g_try_malloc0(range->bitmap.size);
+    if (!range->bitmap.data) {
+        ret = -ENOMEM;
+        goto err_out;
+    }
+
+    ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, dbitmap);
+    if (ret) {
+        error_report("Failed to get dirty bitmap for iova: 0x%llx "
+                "size: 0x%llx err: %d",
+                range->iova, range->size, errno);
+        goto err_out;
+    }
+
+    cpu_physical_memory_set_dirty_lebitmap((uint64_t *)range->bitmap.data,
+                                            ram_addr, pages);
+
+    trace_vfio_get_dirty_bitmap(container->fd, range->iova, range->size,
+                                range->bitmap.size, ram_addr);
+err_out:
+    g_free(range->bitmap.data);
+    g_free(dbitmap);
+
+    return ret;
+}
+
+static int vfio_sync_dirty_bitmap(MemoryListener *listener,
+                                 MemoryRegionSection *section)
+{
+    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
+    VFIOGuestIOMMU *giommu = NULL;
+    ram_addr_t ram_addr;
+    uint64_t iova, size;
+    int ret = 0;
+
+    if (memory_region_is_iommu(section->mr)) {
+
+        QLIST_FOREACH(giommu, &container->giommu_list, giommu_next) {
+            if (MEMORY_REGION(giommu->iommu) == section->mr &&
+                giommu->n.start == section->offset_within_region) {
+                VFIOIovaRange *iova_range;
+
+                QLIST_FOREACH(iova_range, &giommu->iova_list, next) {
+                    ret = vfio_get_dirty_bitmap(container, iova_range->iova,
+                                        iova_range->size, iova_range->ram_addr);
+                    if (ret) {
+                        break;
+                    }
+                }
+                break;
+            }
+        }
+
+    } else {
+        iova = TARGET_PAGE_ALIGN(section->offset_within_address_space);
+        size = int128_get64(section->size);
+
+        ram_addr = memory_region_get_ram_addr(section->mr) +
+                   section->offset_within_region + iova -
+                   TARGET_PAGE_ALIGN(section->offset_within_address_space);
+
+        ret = vfio_get_dirty_bitmap(container, iova, size, ram_addr);
+    }
+
+    return ret;
+}
+
+static void vfio_listerner_log_sync(MemoryListener *listener,
+        MemoryRegionSection *section)
+{
+    if (vfio_listener_skipped_section(section)) {
+        return;
+    }
+
+    if (vfio_devices_are_stopped_and_saving()) {
+        vfio_sync_dirty_bitmap(listener, section);
+    }
+}
+
 static const MemoryListener vfio_memory_listener = {
     .region_add = vfio_listener_region_add,
     .region_del = vfio_listener_region_del,
+    .log_sync = vfio_listerner_log_sync,
 };
 
 static void vfio_listener_release(VFIOContainer *container)
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 4a4bd3ba9a2a..c61ae4f3ead8 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -160,3 +160,4 @@ vfio_save_complete_precopy(const char *name) " (%s)"
 vfio_load_device_config_state(const char *name) " (%s)"
 vfio_load_state(const char *name, uint64_t data) " (%s) data 0x%"PRIx64
 vfio_load_state_device_data(const char *name, uint64_t data_offset, uint64_t data_size) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64
+vfio_get_dirty_bitmap(int fd, uint64_t iova, uint64_t size, uint64_t bitmap_size, uint64_t start) "container fd=%d, iova=0x%"PRIx64" size= 0x%"PRIx64" bitmap_size=0x%"PRIx64" start=0x%"PRIx64
-- 
2.7.0


