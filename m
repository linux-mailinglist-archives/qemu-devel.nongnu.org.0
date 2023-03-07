Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 382566ADF60
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 13:59:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZWr6-0005Ov-86; Tue, 07 Mar 2023 07:55:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZWr4-0005Om-5I
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:55:46 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZWr2-00054D-BK
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:55:45 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 327846pE017250; Tue, 7 Mar 2023 12:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2022-7-12;
 bh=XOiVz9M/WFngl5j8R3/dZ/LeCA/WyHhtvPJBNq+AI8A=;
 b=H/WJdmpX54a5V9qEJNG9ijzCeq5PKeqSew9i6562yoZh5vTK9LApAXpmbG1rxcW7rkE2
 RLJ4SKXa/JxAUjhLuch+SO/OcEyz76a5Jhx1MAbkfiYd0LKRdhkoUgvnYTWxp5cqpras
 eYp5at5C+5Xi7KsDI2Moci4LOrq0HKHTXGiVWR1fJfypGZ+H2s71rdnNsrkhD9Qdb/FC
 yZ9d+KFcXO0vD0g4U/tWVUhKfrwrwOVftmAHEHjj4sHu97B2RWIZnVRcbq1VDRBHVWlM
 S94vRsu/oJFsYta9AUPaB4oopcP4YbSztGXCvj3/aV/QSzGthFi4Rp9gUkWg+8JIJHiq Lg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p417cdcsx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 12:55:43 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 327CUN5G026608; Tue, 7 Mar 2023 12:55:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4u1eyeq2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 12:55:42 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 327CtV57004358;
 Tue, 7 Mar 2023 12:55:42 GMT
Received: from joaomart-mac.uk.oracle.com (dhcp-10-175-196-64.vpn.oracle.com
 [10.175.196.64])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3p4u1eyefv-5; Tue, 07 Mar 2023 12:55:41 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Cedric Le Goater <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v5 04/15] vfio/common: Add VFIOBitmap and alloc function
Date: Tue,  7 Mar 2023 12:54:39 +0000
Message-Id: <20230307125450.62409-5-joao.m.martins@oracle.com>
In-Reply-To: <20230307125450.62409-1-joao.m.martins@oracle.com>
References: <20230307125450.62409-1-joao.m.martins@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-07_06,2023-03-07_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 bulkscore=0
 adultscore=0 suspectscore=0 spamscore=0 mlxlogscore=939 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303070117
X-Proofpoint-GUID: VB3w6WePYf-otBitPcI5ko9zihSZ5EsI
X-Proofpoint-ORIG-GUID: VB3w6WePYf-otBitPcI5ko9zihSZ5EsI
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

From: Avihai Horon <avihaih@nvidia.com>

There are already two places where dirty page bitmap allocation and
calculations are done in open code.

To avoid code duplication, introduce VFIOBitmap struct and corresponding
alloc function and use them where applicable.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/vfio/common.c | 73 +++++++++++++++++++++++++++++-------------------
 1 file changed, 44 insertions(+), 29 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 4c801513136a..cec3de08d2b4 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -320,6 +320,25 @@ const MemoryRegionOps vfio_region_ops = {
  * Device state interfaces
  */
 
+typedef struct {
+    unsigned long *bitmap;
+    hwaddr size;
+    hwaddr pages;
+} VFIOBitmap;
+
+static int vfio_bitmap_alloc(VFIOBitmap *vbmap, hwaddr size)
+{
+    vbmap->pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size();
+    vbmap->size = ROUND_UP(vbmap->pages, sizeof(__u64) * BITS_PER_BYTE) /
+                                         BITS_PER_BYTE;
+    vbmap->bitmap = g_try_malloc0(vbmap->size);
+    if (!vbmap->bitmap) {
+        return -ENOMEM;
+    }
+
+    return 0;
+}
+
 bool vfio_mig_active(void)
 {
     VFIOGroup *group;
@@ -468,9 +487,14 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
 {
     struct vfio_iommu_type1_dma_unmap *unmap;
     struct vfio_bitmap *bitmap;
-    uint64_t pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size();
+    VFIOBitmap vbmap;
     int ret;
 
+    ret = vfio_bitmap_alloc(&vbmap, size);
+    if (ret) {
+        return ret;
+    }
+
     unmap = g_malloc0(sizeof(*unmap) + sizeof(*bitmap));
 
     unmap->argsz = sizeof(*unmap) + sizeof(*bitmap);
@@ -484,35 +508,28 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
      * qemu_real_host_page_size to mark those dirty. Hence set bitmap_pgsize
      * to qemu_real_host_page_size.
      */
-
     bitmap->pgsize = qemu_real_host_page_size();
-    bitmap->size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
-                   BITS_PER_BYTE;
+    bitmap->size = vbmap.size;
+    bitmap->data = (__u64 *)vbmap.bitmap;
 
-    if (bitmap->size > container->max_dirty_bitmap_size) {
-        error_report("UNMAP: Size of bitmap too big 0x%"PRIx64,
-                     (uint64_t)bitmap->size);
+    if (vbmap.size > container->max_dirty_bitmap_size) {
+        error_report("UNMAP: Size of bitmap too big 0x%"PRIx64, vbmap.size);
         ret = -E2BIG;
         goto unmap_exit;
     }
 
-    bitmap->data = g_try_malloc0(bitmap->size);
-    if (!bitmap->data) {
-        ret = -ENOMEM;
-        goto unmap_exit;
-    }
-
     ret = ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, unmap);
     if (!ret) {
-        cpu_physical_memory_set_dirty_lebitmap((unsigned long *)bitmap->data,
-                iotlb->translated_addr, pages);
+        cpu_physical_memory_set_dirty_lebitmap(vbmap.bitmap,
+                iotlb->translated_addr, vbmap.pages);
     } else {
         error_report("VFIO_UNMAP_DMA with DIRTY_BITMAP : %m");
     }
 
-    g_free(bitmap->data);
 unmap_exit:
     g_free(unmap);
+    g_free(vbmap.bitmap);
+
     return ret;
 }
 
@@ -1329,7 +1346,7 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
 {
     struct vfio_iommu_type1_dirty_bitmap *dbitmap;
     struct vfio_iommu_type1_dirty_bitmap_get *range;
-    uint64_t pages;
+    VFIOBitmap vbmap;
     int ret;
 
     if (!container->dirty_pages_supported) {
@@ -1339,6 +1356,11 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
         return 0;
     }
 
+    ret = vfio_bitmap_alloc(&vbmap, size);
+    if (ret) {
+        return ret;
+    }
+
     dbitmap = g_malloc0(sizeof(*dbitmap) + sizeof(*range));
 
     dbitmap->argsz = sizeof(*dbitmap) + sizeof(*range);
@@ -1353,15 +1375,8 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
      * to qemu_real_host_page_size.
      */
     range->bitmap.pgsize = qemu_real_host_page_size();
-
-    pages = REAL_HOST_PAGE_ALIGN(range->size) / qemu_real_host_page_size();
-    range->bitmap.size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
-                                         BITS_PER_BYTE;
-    range->bitmap.data = g_try_malloc0(range->bitmap.size);
-    if (!range->bitmap.data) {
-        ret = -ENOMEM;
-        goto err_out;
-    }
+    range->bitmap.size = vbmap.size;
+    range->bitmap.data = (__u64 *)vbmap.bitmap;
 
     ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, dbitmap);
     if (ret) {
@@ -1372,14 +1387,14 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
         goto err_out;
     }
 
-    cpu_physical_memory_set_dirty_lebitmap((unsigned long *)range->bitmap.data,
-                                            ram_addr, pages);
+    cpu_physical_memory_set_dirty_lebitmap(vbmap.bitmap, ram_addr,
+                                           vbmap.pages);
 
     trace_vfio_get_dirty_bitmap(container->fd, range->iova, range->size,
                                 range->bitmap.size, ram_addr);
 err_out:
-    g_free(range->bitmap.data);
     g_free(dbitmap);
+    g_free(vbmap.bitmap);
 
     return ret;
 }
-- 
2.17.2


