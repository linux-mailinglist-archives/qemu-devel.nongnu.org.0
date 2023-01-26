Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB9B67D4A9
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 19:51:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL7Ka-0004Yp-3l; Thu, 26 Jan 2023 13:50:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL7KX-0004YD-SS
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:50:37 -0500
Received: from mail-dm6nam11on2086.outbound.protection.outlook.com
 ([40.107.223.86] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL7KV-0002di-KW
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:50:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bvTgBxfO6dDDfG6iNO+Z4zw/lZin0UdpXFLEMfbNwv1n8rgxHJG25PsOVRa7pRET9gDQphBjwNca/5pOyUVMac5FPNM4SOnhz07OK3nIcpMBTf33Fd8iCDZkgVCDdk3TNtJNbS9mKKRfN2bc0qMkMhyywuo347Jgl+ZYwpKe64lzN2di+jOLfyZXIiFsOyPmrHHkV1y0t2LS1v/aKjJBgtAofcH7CdqA2bOzAZbidBLRTAq3PD189lA31vazBNlsJXeuIMZghUll1oqPW84Y+U8ATRnT/ubwLHkEVExGMlX4wjX3+3209NdKKKB3VleD9kiszlKyeZfYm83T5FO4/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/uiyTM0m3IoX61iU1bXPh+iEIQYz5WiCCIPcMEA0xY=;
 b=PtHHBpX4Va1ZyhioCRpq0R7YXZ/R2QNaO8m4em6yDlgGleTH7S+ir4qDxUkU1Lgt66C393fopFC/CwmTLaAuP6eUYD1MpaUKbvlulgk64tRu357vcqplCNMVtXYOXtKzFNzrAYmncW5YC53TRGZDqHuABf18SH8lBvq/oQ0DVcxzNW9NIcLIpvZHSzxSYu8V1KvSSogcgbpIvUTG6RVq7Hx/clrqAf+BJVU7Tf27azn32cyak60DftvKcneFZvDFt08A0yIXBwytM2zVFSvIMwyP1Cs2R1NMTIBJahSu7r7y7lhC32OrSQ7oMoyK9G5z/UVeoT+kA2ulbSF1NHqmnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/uiyTM0m3IoX61iU1bXPh+iEIQYz5WiCCIPcMEA0xY=;
 b=gzZcOoYLokbRfGEWIP5PM8rZ7pqtkkg7YemRU4XY7buIFyqAizmmXVT6mJTQyK5QyftFD2UpXZzVfL8uE3sdE58E/jzaGQBS8gdhDmElBUy/IsRGUWbKWO1vhqT86RxcTxj24lgDQDFgdF0e62TZTSe9evFFWKw1/rEOwO0YGUAlixg4kWHuk9m3A+AB1wb14NlecIwLQMgRw4nkblwuqUMukoXjpu5Lostzy4zvcxxj34xubSmj2KqtdPEzZmzVfWkRHT+boe837glgfyAA1N3XyOa7guOBE+QmcSp+hG40HK4ZSRnnBPJPaW6r7uIsFeRoWF7xwLQZluxqC4OiHg==
Received: from BN9PR03CA0792.namprd03.prod.outlook.com (2603:10b6:408:13f::17)
 by PH7PR12MB6834.namprd12.prod.outlook.com (2603:10b6:510:1b4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 18:50:32 +0000
Received: from BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13f:cafe::75) by BN9PR03CA0792.outlook.office365.com
 (2603:10b6:408:13f::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22 via Frontend
 Transport; Thu, 26 Jan 2023 18:50:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN8NAM11FT025.mail.protection.outlook.com (10.13.177.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.22 via Frontend Transport; Thu, 26 Jan 2023 18:50:31 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 26 Jan
 2023 10:50:16 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 26 Jan 2023 10:50:15 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport;
 Thu, 26 Jan 2023 10:50:11 -0800
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Peter Xu <peterx@redhat.com>, Jason Wang
 <jasowang@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, "David
 Hildenbrand" <david@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH 05/18] vfio/common: Add VFIOBitmap and (de)alloc functions
Date: Thu, 26 Jan 2023 20:49:35 +0200
Message-ID: <20230126184948.10478-6-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230126184948.10478-1-avihaih@nvidia.com>
References: <20230126184948.10478-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT025:EE_|PH7PR12MB6834:EE_
X-MS-Office365-Filtering-Correlation-Id: 76da9b2f-fa43-49d7-ca1d-08daffce3380
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hBuZulqTmWd95tXcH/MEnFizgI3MH6iv0qvlqM/ruwGqDxziscj0k5GixmgQ9ygK8Bh4doGyy2dJQlBmlJ4GLh2gWAUG1MZtjpmLV2Zc+Wf8gQbsWOTU0rkaYq7iq4E9Nz0Rw/CDnen3L1wNP0ajHr+7CjeX90RZs7MsM/gv02i4or3swFlD0/SP9LzB0HDhZ7xrrotCEXyjp1QjQ6K5djY4gUcCbfpSJFRu0jIDmDj/QEnSjO84o3ckOyR3eJFgtKYYV7b6g9EuNwwopu1BuWtXOCxOVKElA+YvkB20tGulZVTCbIUzSGe7Owk8nrTQ7O3wcKz1m2SVbHur9R/USGS42yH5/zkYMBOcsck3fw3sXX8ct8wOVD6u4Lm6duEAYFpgJwSKSa8iR041No+kd84GMSDOWJpN+obTgEUQ8Bcn8tut7xOhCpNKecUMy98Buef5jeE3N4Bo8R/lbZY3OZ5Pi8AEdGWZNY3PILCYKbCMC0ocB7Vd/U8pwYimFMGHH2dRX66/A9HBkg5d3efTjyfY2fLE95EFWMoW+icNWcSK42nV6tWuMid1RW0GT1fX8KTI6E8hpP2jAa6mKVOSZvgS1U5mtPv53dlRVLDPxxmM75g+x5oR/Fj4BjlXu2I84Ft5l82N3ajJ+va95XQ3A/rQR3W4udjfU0Syo/KRuK8KkO6RVkmm4etkq9uvwzodDtVCrjy9paYM5sg1CRy//A==
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(346002)(39860400002)(396003)(451199018)(40470700004)(46966006)(36840700001)(82310400005)(356005)(1076003)(2616005)(36860700001)(7636003)(40460700003)(2906002)(316002)(478600001)(82740400003)(54906003)(36756003)(8936002)(7696005)(41300700001)(66899018)(86362001)(40480700001)(426003)(83380400001)(186003)(26005)(6666004)(336012)(4326008)(70586007)(5660300002)(70206006)(7416002)(8676002)(6916009)(47076005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 18:50:31.6739 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76da9b2f-fa43-49d7-ca1d-08daffce3380
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6834
Received-SPF: softfail client-ip=40.107.223.86;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

There are already two places where dirty page bitmap allocation and
calculations are done in open code. With device dirty page tracking
being added in next patches, there are going to be even more places.

To avoid code duplication, introduce VFIOBitmap struct and corresponding
alloc and dealloc functions and use them where applicable.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/vfio/common.c | 89 ++++++++++++++++++++++++++++++++----------------
 1 file changed, 60 insertions(+), 29 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 8e8ffbc046..e554573eb5 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -319,6 +319,41 @@ const MemoryRegionOps vfio_region_ops = {
  * Device state interfaces
  */
 
+typedef struct {
+    unsigned long *bitmap;
+    hwaddr size;
+    hwaddr pages;
+} VFIOBitmap;
+
+static VFIOBitmap *vfio_bitmap_alloc(hwaddr size)
+{
+    VFIOBitmap *vbmap = g_try_new0(VFIOBitmap, 1);
+    if (!vbmap) {
+        errno = ENOMEM;
+
+        return NULL;
+    }
+
+    vbmap->pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size();
+    vbmap->size =  ROUND_UP(vbmap->pages, sizeof(__u64) * BITS_PER_BYTE) /
+                                          BITS_PER_BYTE;
+    vbmap->bitmap = g_try_malloc0(vbmap->size);
+    if (!vbmap->bitmap) {
+        g_free(vbmap);
+        errno = ENOMEM;
+
+        return NULL;
+    }
+
+    return vbmap;
+}
+
+static void vfio_bitmap_dealloc(VFIOBitmap *vbmap)
+{
+    g_free(vbmap->bitmap);
+    g_free(vbmap);
+}
+
 bool vfio_mig_active(void)
 {
     VFIOGroup *group;
@@ -421,9 +456,14 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
 {
     struct vfio_iommu_type1_dma_unmap *unmap;
     struct vfio_bitmap *bitmap;
-    uint64_t pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size();
+    VFIOBitmap *vbmap;
     int ret;
 
+    vbmap = vfio_bitmap_alloc(size);
+    if (!vbmap) {
+        return -errno;
+    }
+
     unmap = g_malloc0(sizeof(*unmap) + sizeof(*bitmap));
 
     unmap->argsz = sizeof(*unmap) + sizeof(*bitmap);
@@ -437,35 +477,28 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
      * qemu_real_host_page_size to mark those dirty. Hence set bitmap_pgsize
      * to qemu_real_host_page_size.
      */
-
     bitmap->pgsize = qemu_real_host_page_size();
-    bitmap->size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
-                   BITS_PER_BYTE;
+    bitmap->size = vbmap->size;
+    bitmap->data = (__u64 *)vbmap->bitmap;
 
-    if (bitmap->size > container->max_dirty_bitmap_size) {
-        error_report("UNMAP: Size of bitmap too big 0x%"PRIx64,
-                     (uint64_t)bitmap->size);
+    if (vbmap->size > container->max_dirty_bitmap_size) {
+        error_report("UNMAP: Size of bitmap too big 0x%"PRIx64, vbmap->size);
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
+        cpu_physical_memory_set_dirty_lebitmap(vbmap->bitmap,
+                iotlb->translated_addr, vbmap->pages);
     } else {
         error_report("VFIO_UNMAP_DMA with DIRTY_BITMAP : %m");
     }
 
-    g_free(bitmap->data);
 unmap_exit:
     g_free(unmap);
+    vfio_bitmap_dealloc(vbmap);
+
     return ret;
 }
 
@@ -1282,7 +1315,7 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
 {
     struct vfio_iommu_type1_dirty_bitmap *dbitmap;
     struct vfio_iommu_type1_dirty_bitmap_get *range;
-    uint64_t pages;
+    VFIOBitmap *vbmap;
     int ret;
 
     if (!container->dirty_pages_supported) {
@@ -1292,6 +1325,11 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
         return 0;
     }
 
+    vbmap = vfio_bitmap_alloc(size);
+    if (!vbmap) {
+        return -errno;
+    }
+
     dbitmap = g_malloc0(sizeof(*dbitmap) + sizeof(*range));
 
     dbitmap->argsz = sizeof(*dbitmap) + sizeof(*range);
@@ -1306,15 +1344,8 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
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
+    range->bitmap.size = vbmap->size;
+    range->bitmap.data = (__u64 *)vbmap->bitmap;
 
     ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, dbitmap);
     if (ret) {
@@ -1325,14 +1356,14 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
         goto err_out;
     }
 
-    cpu_physical_memory_set_dirty_lebitmap((unsigned long *)range->bitmap.data,
-                                            ram_addr, pages);
+    cpu_physical_memory_set_dirty_lebitmap(vbmap->bitmap, ram_addr,
+                                           vbmap->pages);
 
     trace_vfio_get_dirty_bitmap(container->fd, range->iova, range->size,
                                 range->bitmap.size, ram_addr);
 err_out:
-    g_free(range->bitmap.data);
     g_free(dbitmap);
+    vfio_bitmap_dealloc(vbmap);
 
     return ret;
 }
-- 
2.26.3


