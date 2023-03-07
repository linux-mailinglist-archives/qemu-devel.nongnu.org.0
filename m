Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7576AD464
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 03:05:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZMfm-0006qB-8i; Mon, 06 Mar 2023 21:03:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZMfj-0006pB-S5
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:03:23 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZMfi-0004vq-2O
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:03:23 -0500
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326NwvMu022239; Tue, 7 Mar 2023 02:03:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2022-7-12;
 bh=5w+UzqUbMx72jclmr5DPxhul0r8RPY8u0pJnKNlmPBc=;
 b=uBxyy+l7NGEGFziJdI4NF1Qq+Kjs9F2Y5zhoLFBSWSBhyjQbSIFvXxjhvveJlexksArn
 cH5HJxMrS0MWCqNpWPpCvusXbmfr92PJ3Y81oyfUACJonjU1d96bokSO7GZWJSpF/tZf
 gi5HgYYU0ZaQ4LarSE4lezQNwKjyOfLUVUPnHMmRj9AOhUcE9rfq8wO0UW2Fj9/OWrtV
 0jcTs7IqoPddCyF5M2tMdH32ugv4PBo6XUVT/WyEK+urIGiDS3lFnUovL0jeN3fao3v/
 tYMMS4eeqtCXrQ93Qxct0nJ8oQISqFAIV2plQ+DCUg5BUv9Fivca1TXlRKyqE653ZRlF 1A== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p415hvfny-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 02:03:21 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 3271svPk037115; Tue, 7 Mar 2023 02:03:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4txdubpk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 02:03:20 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32723566016763;
 Tue, 7 Mar 2023 02:03:19 GMT
Received: from joaomart-mac.uk.oracle.com (dhcp-10-175-187-101.vpn.oracle.com
 [10.175.187.101])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3p4txdubf4-5; Tue, 07 Mar 2023 02:03:19 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Cedric Le Goater <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v4 04/14] vfio/common: Add VFIOBitmap and alloc function
Date: Tue,  7 Mar 2023 02:02:48 +0000
Message-Id: <20230307020258.58215-5-joao.m.martins@oracle.com>
In-Reply-To: <20230307020258.58215-1-joao.m.martins@oracle.com>
References: <20230307020258.58215-1-joao.m.martins@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303070016
X-Proofpoint-GUID: 05cykTDuLbYrQSE6x7rxvbo_hbLotKHY
X-Proofpoint-ORIG-GUID: 05cykTDuLbYrQSE6x7rxvbo_hbLotKHY
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
calculations are done in open code. With device dirty page tracking
being added in next patches, there are going to be even more places.

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


