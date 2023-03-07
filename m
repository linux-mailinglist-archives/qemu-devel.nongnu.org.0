Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C6C6ADF42
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 13:56:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZWrJ-0005cL-5v; Tue, 07 Mar 2023 07:56:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZWrG-0005bj-Sg
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:55:58 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZWrF-00056P-4E
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:55:58 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32783kni010510; Tue, 7 Mar 2023 12:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2022-7-12;
 bh=lqN+cTyBJoQc9qOSubsecppyC3ndUXvrVoAak4ksuik=;
 b=Pd6z3OP+sLePZHqnHn//hFFZ+GnnsGMoaKlVFZs9+D1+tFAO9HqbWbR9MbXfYIzCcMZE
 2a1xABTE/7zncbvxd3gDH2/Cc/1emZ7PWGQccyhH/ssLE671GGT5nXxbOg+RybK0F0NE
 ZFq9L/0dkpZoY5IrmWpUnYAzo7r/bo7FUoK2So15P+qmfxODN7wVqhvT10XB9uSPhm8z
 8G7QL1du8PKR9PuyJa40uptks89OBlXPDJqVRJiEUh2IIhHU3nZOBSa3Sd+4tCqn+I4M
 861Yngr16kwSjnAMUdjVLo6jDUmMlEjwlQ1U65d9uKMRFiGP2yPcsCLmcPERZ2+eeqDM aA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p4180wbkx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 12:55:56 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 327CHHod029152; Tue, 7 Mar 2023 12:55:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4u1eyevw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 12:55:55 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 327CtV5H004358;
 Tue, 7 Mar 2023 12:55:55 GMT
Received: from joaomart-mac.uk.oracle.com (dhcp-10-175-196-64.vpn.oracle.com
 [10.175.196.64])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3p4u1eyefv-10; Tue, 07 Mar 2023 12:55:54 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Cedric Le Goater <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v5 09/15] vfio/common: Record DMA mapped IOVA ranges
Date: Tue,  7 Mar 2023 12:54:44 +0000
Message-Id: <20230307125450.62409-10-joao.m.martins@oracle.com>
In-Reply-To: <20230307125450.62409-1-joao.m.martins@oracle.com>
References: <20230307125450.62409-1-joao.m.martins@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-07_06,2023-03-07_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 bulkscore=0
 adultscore=0 suspectscore=0 spamscore=0 mlxlogscore=832 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303070117
X-Proofpoint-ORIG-GUID: aEekxBcub_gwuuocutQCB9uPnjtisS4s
X-Proofpoint-GUID: aEekxBcub_gwuuocutQCB9uPnjtisS4s
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
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
 hw/vfio/common.c     | 85 ++++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/trace-events |  1 +
 2 files changed, 86 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 63831eab78a1..811502dbc97c 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1325,11 +1325,96 @@ static int vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
     return ret;
 }
 
+typedef struct VFIODirtyRanges {
+    hwaddr min32;
+    hwaddr max32;
+    hwaddr min64;
+    hwaddr max64;
+} VFIODirtyRanges;
+
+typedef struct VFIODirtyRangesListener {
+    VFIOContainer *container;
+    VFIODirtyRanges ranges;
+    MemoryListener listener;
+} VFIODirtyRangesListener;
+
+static void vfio_dirty_tracking_update(MemoryListener *listener,
+                                       MemoryRegionSection *section)
+{
+    VFIODirtyRangesListener *dirty = container_of(listener,
+                                                  VFIODirtyRangesListener,
+                                                  listener);
+    VFIODirtyRanges *range = &dirty->ranges;
+    hwaddr iova, end, *min, *max;
+
+    if (!vfio_listener_valid_section(section, "tracking_update") ||
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
+    min = (end <= UINT32_MAX) ? &range->min32 : &range->min64;
+    max = (end <= UINT32_MAX) ? &range->max32 : &range->max64;
+
+    if (*min > iova) {
+        *min = iova;
+    }
+    if (*max < end) {
+        *max = end;
+    }
+
+    trace_vfio_device_dirty_tracking_update(iova, end, *min, *max);
+    return;
+}
+
+static const MemoryListener vfio_dirty_tracking_listener = {
+    .name = "vfio-tracking",
+    .region_add = vfio_dirty_tracking_update,
+};
+
+static void vfio_dirty_tracking_init(VFIOContainer *container,
+                                     VFIODirtyRanges *ranges)
+{
+    VFIODirtyRangesListener dirty;
+
+    memset(&dirty, 0, sizeof(dirty));
+    dirty.ranges.min32 = UINT32_MAX;
+    dirty.ranges.min64 = UINT64_MAX;
+    dirty.listener = vfio_dirty_tracking_listener;
+    dirty.container = container;
+
+    memory_listener_register(&dirty.listener,
+                             container->space->as);
+
+    *ranges = dirty.ranges;
+
+    /*
+     * The memory listener is synchronous, and used to calculate the range
+     * to dirty tracking. Unregister it after we are done as we are not
+     * interested in any follow-up updates.
+     */
+    memory_listener_unregister(&dirty.listener);
+}
+
 static void vfio_listener_log_global_start(MemoryListener *listener)
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
+    VFIODirtyRanges ranges;
     int ret;
 
+    vfio_dirty_tracking_init(container, &ranges);
+
     ret = vfio_set_dirty_page_tracking(container, true);
     if (ret) {
         vfio_set_migration_error(ret);
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 7173e6a5c721..dd9fd7b9bddb 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -103,6 +103,7 @@ vfio_listener_region_add_ram(uint64_t iova_start, uint64_t iova_end, void *vaddr
 vfio_known_safe_misalignment(const char *name, uint64_t iova, uint64_t offset_within_region, uintptr_t page_size) "Region \"%s\" iova=0x%"PRIx64" offset_within_region=0x%"PRIx64" qemu_real_host_page_size=0x%"PRIxPTR
 vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uint64_t size, uint64_t page_size) "Region \"%s\" 0x%"PRIx64" size=0x%"PRIx64" is not aligned to 0x%"PRIx64" and cannot be mapped for DMA"
 vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"PRIx64" - 0x%"PRIx64
+vfio_device_dirty_tracking_update(uint64_t start, uint64_t end, uint64_t min, uint64_t max) "section 0x%"PRIx64" - 0x%"PRIx64" -> update [0x%"PRIx64" - 0x%"PRIx64"]"
 vfio_disconnect_container(int fd) "close container->fd=%d"
 vfio_put_group(int fd) "close group->fd=%d"
 vfio_get_device(const char * name, unsigned int flags, unsigned int num_regions, unsigned int num_irqs) "Device %s flags: %u, regions: %u, irqs: %u"
-- 
2.17.2


