Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5736AA762
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 02:45:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYGxA-00071O-TC; Fri, 03 Mar 2023 20:44:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pYGx9-00071B-LU
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 20:44:51 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pYGx7-0005mQ-Ny
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 20:44:51 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 323LZZTB023780; Sat, 4 Mar 2023 01:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2022-7-12;
 bh=PYvffhJeqghnbX1YeU8rdpMLDEz1j85B0a2RRv4ozZ8=;
 b=xaZnDcizhckqn1dhwcpeMBcQTJRUR0r0dBtrwnSbufkJ6WD0P/ujQ79tUFTXw8eeip89
 vORzQlW6tLeD5C4rLpqozBtB39DNda1997mnxBSpD0RA6BUQMOglDtgZacWqNCpSgvXW
 3yAjqXle6mBBv/luEbHr2+mHbofjl0oK5kS67sw+REsczZEIBh/gn80jBnK+CmHkdp2F
 U2vOD4Pqb0QeUxod4YAvcozd/i8UTlOTI60QgqhnT6NSfX7+4g6A5RU/3B0w1AaKeVc4
 0A+8SWjJHL/8egr4Nh259K0dk7jalfHb+NorF1T2xecUBD32H2jKMBj1tvwio29I7ixr wg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nyba7rhby-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 04 Mar 2023 01:44:48 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 3241Xd8W015487; Sat, 4 Mar 2023 01:44:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3p3ve8g7cv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 04 Mar 2023 01:44:46 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3241YZ0l016769;
 Sat, 4 Mar 2023 01:44:46 GMT
Received: from joaomart-mac.uk.oracle.com (dhcp-10-175-185-117.vpn.oracle.com
 [10.175.185.117])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3p3ve8g73b-8; Sat, 04 Mar 2023 01:44:46 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Cedric Le Goater <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>, Avihai Horon <avihaih@nvidia.com>
Subject: [PATCH v3 07/13] vfio/common: Record DMA mapped IOVA ranges
Date: Sat,  4 Mar 2023 01:43:37 +0000
Message-Id: <20230304014343.33646-8-joao.m.martins@oracle.com>
In-Reply-To: <20230304014343.33646-1-joao.m.martins@oracle.com>
References: <20230304014343.33646-1-joao.m.martins@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-03_07,2023-03-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 suspectscore=0
 adultscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303040011
X-Proofpoint-ORIG-GUID: ylx_mCpb41Gv3mOisAH75_OP5ZVpHTVz
X-Proofpoint-GUID: ylx_mCpb41Gv3mOisAH75_OP5ZVpHTVz
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

According to the device DMA logging uAPI, IOVA ranges to be logged by
the device must be provided all at once upon DMA logging start.

As preparation for the following patches which will add device dirty
page tracking, keep a record of all DMA mapped IOVA ranges so later they
can be used for DMA logging start.

Note that when vIOMMU is enabled DMA mapped IOVA ranges are not tracked.
This is due to the dynamic nature of vIOMMU DMA mapping/unmapping.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 hw/vfio/common.c              | 84 +++++++++++++++++++++++++++++++++++
 hw/vfio/trace-events          |  1 +
 include/hw/vfio/vfio-common.h | 11 +++++
 3 files changed, 96 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index ed908e303dbb..d84e5fd86bb4 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -44,6 +44,7 @@
 #include "migration/blocker.h"
 #include "migration/qemu-file.h"
 #include "sysemu/tpm.h"
+#include "qemu/iova-tree.h"
 
 VFIOGroupList vfio_group_list =
     QLIST_HEAD_INITIALIZER(vfio_group_list);
@@ -1313,11 +1314,94 @@ static int vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
     return ret;
 }
 
+/*
+ * Called for the dirty tracking memory listener to calculate the iova/end
+ * for a given memory region section. The checks here, replicate the logic
+ * in vfio_listener_region_{add,del}() used for the same purpose. And thus
+ * both listener should be kept in sync.
+ */
+static bool vfio_get_section_iova_range(VFIOContainer *container,
+                                        MemoryRegionSection *section,
+                                        hwaddr *out_iova, hwaddr *out_end)
+{
+    Int128 llend;
+    hwaddr iova;
+
+    iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
+    llend = int128_make64(section->offset_within_address_space);
+    llend = int128_add(llend, section->size);
+    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask()));
+
+    if (int128_ge(int128_make64(iova), llend)) {
+        return false;
+    }
+
+    *out_iova = iova;
+    *out_end = int128_get64(llend) - 1;
+    return true;
+}
+
+static void vfio_dirty_tracking_update(MemoryListener *listener,
+                                       MemoryRegionSection *section)
+{
+    VFIOContainer *container = container_of(listener, VFIOContainer,
+                                            tracking_listener);
+    VFIODirtyTrackingRange *range = &container->tracking_range;
+    hwaddr max32 = (1ULL << 32) - 1ULL;
+    hwaddr iova, end;
+
+    if (!vfio_listener_valid_section(section) ||
+        !vfio_get_section_iova_range(container, section, &iova, &end)) {
+        return;
+    }
+
+    WITH_QEMU_LOCK_GUARD(&container->tracking_mutex) {
+        if (iova < max32 && end <= max32) {
+                if (range->min32 > iova) {
+                    range->min32 = iova;
+                }
+                if (range->max32 < end) {
+                    range->max32 = end;
+                }
+                trace_vfio_device_dirty_tracking_update(iova, end,
+                                            range->min32, range->max32);
+        } else {
+                if (!range->min64 || range->min64 > iova) {
+                    range->min64 = iova;
+                }
+                if (range->max64 < end) {
+                    range->max64 = end;
+                }
+                trace_vfio_device_dirty_tracking_update(iova, end,
+                                            range->min64, range->max64);
+        }
+    }
+    return;
+}
+
+static const MemoryListener vfio_dirty_tracking_listener = {
+    .name = "vfio-tracking",
+    .region_add = vfio_dirty_tracking_update,
+};
+
+static void vfio_dirty_tracking_init(VFIOContainer *container)
+{
+    memset(&container->tracking_range, 0, sizeof(container->tracking_range));
+    qemu_mutex_init(&container->tracking_mutex);
+    container->tracking_listener = vfio_dirty_tracking_listener;
+    memory_listener_register(&container->tracking_listener,
+                             container->space->as);
+    memory_listener_unregister(&container->tracking_listener);
+    qemu_mutex_destroy(&container->tracking_mutex);
+}
+
 static void vfio_listener_log_global_start(MemoryListener *listener)
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
     int ret;
 
+    vfio_dirty_tracking_init(container);
+
     ret = vfio_set_dirty_page_tracking(container, true);
     if (ret) {
         vfio_set_migration_error(ret);
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 669d9fe07cd9..d97a6de17921 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -104,6 +104,7 @@ vfio_known_safe_misalignment(const char *name, uint64_t iova, uint64_t offset_wi
 vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uint64_t size, uint64_t page_size) "Region \"%s\" 0x%"PRIx64" size=0x%"PRIx64" is not aligned to 0x%"PRIx64" and cannot be mapped for DMA"
 vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING region_del 0x%"PRIx64" - 0x%"PRIx64
 vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"PRIx64" - 0x%"PRIx64
+vfio_device_dirty_tracking_update(uint64_t start, uint64_t end, uint64_t min, uint64_t max) "section 0x%"PRIx64" - 0x%"PRIx64" -> update [0x%"PRIx64" - 0x%"PRIx64"]"
 vfio_disconnect_container(int fd) "close container->fd=%d"
 vfio_put_group(int fd) "close group->fd=%d"
 vfio_get_device(const char * name, unsigned int flags, unsigned int num_regions, unsigned int num_irqs) "Device %s flags: %u, regions: %u, irqs: %u"
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 87524c64a443..96791add2719 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -23,6 +23,7 @@
 
 #include "exec/memory.h"
 #include "qemu/queue.h"
+#include "qemu/iova-tree.h"
 #include "qemu/notify.h"
 #include "ui/console.h"
 #include "hw/display/ramfb.h"
@@ -68,6 +69,13 @@ typedef struct VFIOMigration {
     size_t data_buffer_size;
 } VFIOMigration;
 
+typedef struct VFIODirtyTrackingRange {
+    hwaddr min32;
+    hwaddr max32;
+    hwaddr min64;
+    hwaddr max64;
+} VFIODirtyTrackingRange;
+
 typedef struct VFIOAddressSpace {
     AddressSpace *as;
     QLIST_HEAD(, VFIOContainer) containers;
@@ -89,6 +97,9 @@ typedef struct VFIOContainer {
     uint64_t max_dirty_bitmap_size;
     unsigned long pgsizes;
     unsigned int dma_max_mappings;
+    VFIODirtyTrackingRange tracking_range;
+    QemuMutex tracking_mutex;
+    MemoryListener tracking_listener;
     QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
     QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
     QLIST_HEAD(, VFIOGroup) group_list;
-- 
2.17.2


