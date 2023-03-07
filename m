Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 372686ADF6A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 14:01:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZWrT-0006IE-An; Tue, 07 Mar 2023 07:56:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZWrP-00068n-SP
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:56:07 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZWrN-00057G-6P
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:56:07 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 327842Rf017163; Tue, 7 Mar 2023 12:56:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2022-7-12;
 bh=yTQFnRhuMnhAdRFDlEuktm6GXenp18YNPnq3q4EXUgg=;
 b=ubU3aibawlw8tH9A96DF7fa8PBleQUERDaGV7aJVRToXSXU6otnZM/NYNx/lvaryhe0R
 skA5lXFlKjziNSobxKqhDGl8NN03jwxG6TseWsT4HU0jEjkv0dNc6B8LkKQsDBiqGL4p
 UN2eIelRQPCH636WjVBm5zdETzhzVswj0M6BeEnV1MHrQWwt3DAN9/2fC2RchtT/3pcc
 Y0d125Gr7SJy6hkvImPaiRz/kBaMhjSL1ijMmsPR1ij15NqGSOHOYETq9N+ghNQkK7dj
 pYB5WHfu5O3G2FP4qEY9nNO/S/6KRAIb3p5tQtxyN6tOgt/MrTvRVKyf67mi8RksFvLZ xA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p417cdctj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 12:56:04 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 327CHHoh029152; Tue, 7 Mar 2023 12:56:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4u1eyf1t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 12:56:03 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 327CtV5N004358;
 Tue, 7 Mar 2023 12:56:03 GMT
Received: from joaomart-mac.uk.oracle.com (dhcp-10-175-196-64.vpn.oracle.com
 [10.175.196.64])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3p4u1eyefv-13; Tue, 07 Mar 2023 12:56:02 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Cedric Le Goater <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v5 12/15] vfio/common: Add device dirty page bitmap sync
Date: Tue,  7 Mar 2023 12:54:47 +0000
Message-Id: <20230307125450.62409-13-joao.m.martins@oracle.com>
In-Reply-To: <20230307125450.62409-1-joao.m.martins@oracle.com>
References: <20230307125450.62409-1-joao.m.martins@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-07_06,2023-03-07_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 bulkscore=0
 adultscore=0 suspectscore=0 spamscore=0 mlxlogscore=947 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303070117
X-Proofpoint-GUID: MTvietXVkPS50XFv4RPfxfMGKvlWoE6x
X-Proofpoint-ORIG-GUID: MTvietXVkPS50XFv4RPfxfMGKvlWoE6x
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

Add device dirty page bitmap sync functionality. This uses the device
DMA logging uAPI to sync dirty page bitmap from the device.

Device dirty page bitmap sync is used only if all devices within a
container support device dirty page tracking.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 hw/vfio/common.c | 88 +++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 79 insertions(+), 9 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 1f97a8a3db18..2639b393a781 100644
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
-- 
2.17.2


