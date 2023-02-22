Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDBF69FA76
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 18:51:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUtGI-0000SW-9E; Wed, 22 Feb 2023 12:50:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtG0-0000Kg-EQ
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:50:21 -0500
Received: from mail-bn1nam02on20619.outbound.protection.outlook.com
 ([2a01:111:f400:7eb2::619]
 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtFx-0004Uj-K8
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:50:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lix7baJpas14X+8W/M6ZSTSsXEBtqiKsmPMQblMFrJUtMtpU7IsrqeSg5BYk6cMgnHi83Ebg/BIU7+yKV+3aQbh2FH9Q2v5yv7fZ0MFAf98TQ1rOI76rjK9MgCQAKcG8OGyGJAOzvvaaP/cJGGpBeC5BK/XtSvWXIoiN3A800vyfY+QxsY7w6emjAB7e9NNFNOO1dn7SjrxNf0zSBRss2nvHW60hsOOSbVFQQ302yEBvnI3b9HstJuEUdGZjUcoUdczNMQ9d4X6tdJiXJ3dCNtz6LWxcAdri+FvadtAJsZq+dyjdZ7T9KItBQXl4yr59i4eNNcqi+8foE/9EGgR+XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RWBesjB5UlqC9AzGy47xkg8lmKzGZV5hbhYfN6Uze8A=;
 b=iPoaNNAuBZKIxYA2Tl+5Xf25VHrhSqCbfEA9yOeCZJjO2pTh/yLFQTRsc8SJz+A7Xnpo6HQ/JBcKz4eXjWQ5l7SnMNuAJ1OuEMVB8zb0cLuK/14kZ/bRS9XboXi5gaIH1cEjS98dw22dZsrWXDHQg+nE8GZO3TTWM3pyK+mIFWn6bvKai3w3JpD0vex5awZoa1b8cYs22NaYN0j/1L28KQClhkiwkmxJjAGgK7E1vsY7ixNCPimtSCTsVpeJ5X9dz1q7DBq9NpunRWpKwq+jXu+lj8zVcp9G8ozFqAQC+xKVgVeQQf+bVP2hYrro8pmWjqPCAk1sTqx0GuPL9ggJ5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RWBesjB5UlqC9AzGy47xkg8lmKzGZV5hbhYfN6Uze8A=;
 b=EtuBHlBaDNADET/GKOCIxjcqUptkjULGuaQAGIIMCFWStLPE0F8M20IMg+HzpK1itM2adRhWaeB8qiZL6EyPxh/xBjjRSPQlIaCngF8fwFuyfQH4Q44rBgvHxM3bvduvv43C4JLk/6H69f48WlLmRNIH+XUjwqK86pZMgs5pxrLbx0ip1DT/qU4smEczL4LrazrtrWjmqOyuSqcfgGmaVtP58B+JrwLzW9nJROy+nn9ob1n6jHaUlf3dIQb6Gnm4Wlv8a1cncyUH21QlyBd42F7pbXLB3fp2sZiHZqYr5ZMjjrje2PYYckrpB4TVZACpsbroqLHTnmQip2zjFpwshw==
Received: from BN9PR03CA0711.namprd03.prod.outlook.com (2603:10b6:408:ef::26)
 by PH7PR12MB6564.namprd12.prod.outlook.com (2603:10b6:510:210::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Wed, 22 Feb
 2023 17:50:14 +0000
Received: from BL02EPF0000C407.namprd05.prod.outlook.com
 (2603:10b6:408:ef:cafe::eb) by BN9PR03CA0711.outlook.office365.com
 (2603:10b6:408:ef::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19 via Frontend
 Transport; Wed, 22 Feb 2023 17:50:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0000C407.mail.protection.outlook.com (10.167.241.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.14 via Frontend Transport; Wed, 22 Feb 2023 17:50:14 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:50:02 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:50:02 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Wed, 22 Feb
 2023 09:49:56 -0800
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>, "Jason
 Wang" <jasowang@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, "David
 Hildenbrand" <david@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v2 07/20] vfio/common: Add VFIOBitmap and (de)alloc functions
Date: Wed, 22 Feb 2023 19:49:02 +0200
Message-ID: <20230222174915.5647-8-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230222174915.5647-1-avihaih@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C407:EE_|PH7PR12MB6564:EE_
X-MS-Office365-Filtering-Correlation-Id: fb7e7cca-fe86-4687-94e6-08db14fd4097
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v8DURMl0vK/GE3y0dYFBIuhaGkzRS2KZbGHVo2TPshnWMs0mYlp0UhFCO/HNDYy/ZxNiywYQrSXttF0v8ZYklhOB3MmSIkGlENlfhGLTH6Wqa0hLsuelc5Mf2wQjKauDafxfMQZ4EWV+UAAfemFbtZWByxhp4yPXacZ5zBbiGzHy0zH8xx5NGz+ZH+kIIymIcTRth6brM+diT47/FAiUojd2mM4J6d6TGMbazweFZ84/VdH5BSPvp6BNQtWWF9arw1QoVe/AKdNKM87OzIrGE02rq1qUygucTo0guvFZyBL3GEoL8G2WYN/TRx5j9KKmUxfnX/D/P5+IUlBjUKRtwYZnVS/ZJjrfYyS0hN9EB9DfhYYANGEVJPkqlOdmNP3xTOUJSid3IsU5gSF31OiPLmc2mU1rklua7vV48pmh4fxCp5Kxtkk/MXtzn+8x8WN6a54W+j5xwcD9hMQvtMmTeRWb1vgyMxjcGL65045LgTEF42Nwaai9deQDYX5iB6qnOF0meSf+g/VoruRr29Z0aJgSqzQuGIT0SrruaQkcXzMakuUU94cC2ogQj56LSsDJ3AuSrNWPfqVBocSJ9cHs7HiNs5Fvk08ZtzS4HDLxLuS9ahShSerOcPbPAqhL0uJlKdfjt9Lycfaes1DE12Q4Z7Zpd9iXMpK6jbUB+947Jj9ckV2o8SEHpiY7f+YgkTTT2NeIvXUCfq6MNjtoM05A1Q==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199018)(36840700001)(40470700004)(46966006)(26005)(47076005)(8936002)(336012)(83380400001)(36860700001)(41300700001)(356005)(40480700001)(7636003)(2906002)(426003)(86362001)(82740400003)(82310400005)(36756003)(40460700003)(6666004)(5660300002)(7416002)(2616005)(1076003)(6916009)(186003)(70206006)(4326008)(70586007)(8676002)(54906003)(316002)(478600001)(7696005)(66899018);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 17:50:14.4139 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb7e7cca-fe86-4687-94e6-08db14fd4097
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000C407.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6564
Received-SPF: softfail client-ip=2a01:111:f400:7eb2::619;
 envelope-from=avihaih@nvidia.com;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index ac93b85632..84f08bdbbb 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -320,6 +320,41 @@ const MemoryRegionOps vfio_region_ops = {
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
+    vbmap->size = ROUND_UP(vbmap->pages, sizeof(__u64) * BITS_PER_BYTE) /
+                                         BITS_PER_BYTE;
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
@@ -470,9 +505,14 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
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
@@ -486,35 +526,28 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
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
 
@@ -1331,7 +1364,7 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
 {
     struct vfio_iommu_type1_dirty_bitmap *dbitmap;
     struct vfio_iommu_type1_dirty_bitmap_get *range;
-    uint64_t pages;
+    VFIOBitmap *vbmap;
     int ret;
 
     if (!container->dirty_pages_supported) {
@@ -1341,6 +1374,11 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
         return 0;
     }
 
+    vbmap = vfio_bitmap_alloc(size);
+    if (!vbmap) {
+        return -errno;
+    }
+
     dbitmap = g_malloc0(sizeof(*dbitmap) + sizeof(*range));
 
     dbitmap->argsz = sizeof(*dbitmap) + sizeof(*range);
@@ -1355,15 +1393,8 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
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
@@ -1374,14 +1405,14 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
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


