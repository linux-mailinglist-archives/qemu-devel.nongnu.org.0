Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8DF6AD463
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 03:05:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZMg5-0006t3-RB; Mon, 06 Mar 2023 21:03:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZMg4-0006sq-LW
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:03:44 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZMg0-0004wr-8F
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:03:44 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326NxVEv007719; Tue, 7 Mar 2023 02:03:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2022-7-12;
 bh=PxHDPVIQjHL8XFixusSmQZEvlQhds06ZnieTZQGjNKU=;
 b=Qkke71A8Z+8/S5iK9QJ3AYEXf8XKl7PW0FLOAJT/QgtUWazZ11vzz2dZHVktExg+UeVa
 Fn30bRnREr9ueo2/euZGSf/xWfmF0zIoon5i9Thw9jKNuCzEa9xZlzvVOH60/aSwoKiu
 avVayWXevWGsilRy00QNEmct+ioUsltTai995kFYSzA1iOFcN973NbUURmUFDT4rSf9U
 yLuI4rFYSerfX0uerpXKYsaqxnUOEv80GKb8eBFYEsKT8yHDkg+BFDSMJ6MYWrQB/mQx
 t/E3vg6+tY4MYP003tNZcEYhzLKrsQUB7/vAwQdYgJwt19xTdCQSgfLElbC98eBWtQFn 8Q== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p4161vdxp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 02:03:38 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 3271fLw9037432; Tue, 7 Mar 2023 02:03:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4txdubxc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 02:03:37 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3272356E016763;
 Tue, 7 Mar 2023 02:03:36 GMT
Received: from joaomart-mac.uk.oracle.com (dhcp-10-175-187-101.vpn.oracle.com
 [10.175.187.101])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3p4txdubf4-9; Tue, 07 Mar 2023 02:03:36 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Cedric Le Goater <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v4 08/14] vfio/common: Record DMA mapped IOVA ranges
Date: Tue,  7 Mar 2023 02:02:52 +0000
Message-Id: <20230307020258.58215-9-joao.m.martins@oracle.com>
In-Reply-To: <20230307020258.58215-1-joao.m.martins@oracle.com>
References: <20230307020258.58215-1-joao.m.martins@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 mlxlogscore=943 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303070017
X-Proofpoint-GUID: RqnppRBWl2LonxXyStQHPixO3X7pXBG0
X-Proofpoint-ORIG-GUID: RqnppRBWl2LonxXyStQHPixO3X7pXBG0
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

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 hw/vfio/common.c              | 76 +++++++++++++++++++++++++++++++++++
 hw/vfio/trace-events          |  1 +
 include/hw/vfio/vfio-common.h | 13 ++++++
 3 files changed, 90 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 3a6491dbc523..a9b1fc999121 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1334,11 +1334,87 @@ static int vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
     return ret;
 }
 
+static void vfio_dirty_tracking_update(MemoryListener *listener,
+                                       MemoryRegionSection *section)
+{
+    VFIODirtyRanges *dirty = container_of(listener, VFIODirtyRanges, listener);
+    VFIODirtyTrackingRange *range = &dirty->ranges;
+    hwaddr max32 = UINT32_MAX - 1ULL;
+    hwaddr iova, end;
+
+    if (!vfio_listener_valid_section(section) ||
+        !vfio_get_section_iova_range(dirty->container, section,
+                                     &iova, &end, NULL)) {
+        return;
+    }
+
+    /*
+     * The address space passed to the dirty tracker is reduced to two ranges:
+     * one for 32-bit DMA ranges, and another one for 64-bit DMA ranges.
+     * The underlying reports of dirty will query a sub-interval of each of
+     * these ranges.
+     *
+     * The purpose of the dual range handling is to handle known cases of big
+     * holes in the address space, like the x86 AMD 1T hole. The alternative
+     * would be an IOVATree but that has a much bigger runtime overhead and
+     * unnecessary complexity.
+     */
+    if (iova < max32 && end <= max32) {
+        if (range->min32 > iova) {
+            range->min32 = iova;
+        }
+        if (range->max32 < end) {
+            range->max32 = end;
+        }
+        trace_vfio_device_dirty_tracking_update(iova, end,
+                                    range->min32, range->max32);
+    } else {
+        if (!range->min64 || range->min64 > iova) {
+            range->min64 = iova;
+        }
+        if (range->max64 < end) {
+            range->max64 = end;
+        }
+        trace_vfio_device_dirty_tracking_update(iova, end,
+                                    range->min64, range->max64);
+    }
+
+    return;
+}
+
+static const MemoryListener vfio_dirty_tracking_listener = {
+    .name = "vfio-tracking",
+    .region_add = vfio_dirty_tracking_update,
+};
+
+static void vfio_dirty_tracking_init(VFIOContainer *container,
+                                     VFIODirtyRanges *dirty)
+{
+    memset(dirty, 0, sizeof(*dirty));
+    dirty->ranges.min32 = UINT32_MAX;
+    dirty->ranges.min64 = UINT64_MAX;
+    dirty->listener = vfio_dirty_tracking_listener;
+    dirty->container = container;
+
+    memory_listener_register(&dirty->listener,
+                             container->space->as);
+
+    /*
+     * The memory listener is synchronous, and used to calculate the range
+     * to dirty tracking. Unregister it after we are done as we are not
+     * interested in any follow-up updates.
+     */
+    memory_listener_unregister(&dirty->listener);
+}
+
 static void vfio_listener_log_global_start(MemoryListener *listener)
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
+    VFIODirtyRanges dirty;
     int ret;
 
+    vfio_dirty_tracking_init(container, &dirty);
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
index 87524c64a443..0f84136cceb5 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -96,6 +96,19 @@ typedef struct VFIOContainer {
     QLIST_ENTRY(VFIOContainer) next;
 } VFIOContainer;
 
+typedef struct VFIODirtyTrackingRange {
+    hwaddr min32;
+    hwaddr max32;
+    hwaddr min64;
+    hwaddr max64;
+} VFIODirtyTrackingRange;
+
+typedef struct VFIODirtyRanges {
+    VFIOContainer *container;
+    VFIODirtyTrackingRange ranges;
+    MemoryListener listener;
+} VFIODirtyRanges;
+
 typedef struct VFIOGuestIOMMU {
     VFIOContainer *container;
     IOMMUMemoryRegion *iommu_mr;
-- 
2.17.2


