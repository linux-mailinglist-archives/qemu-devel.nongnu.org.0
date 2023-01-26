Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF85067D4BF
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 19:55:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL7LL-0005uv-KA; Thu, 26 Jan 2023 13:51:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL7LG-0005Zm-Vq
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:51:23 -0500
Received: from mail-sn1nam02on2060a.outbound.protection.outlook.com
 ([2a01:111:f400:7ea9::60a]
 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL7LE-0002wP-VC
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:51:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hr1wTGQOH+yye5pxMKiJ59z5y3LyT8KsoYM6I67VNVJJ4rqs86ZmJaaKFHwT8LsIbIwnD7rWBeGDagqUA9AbPgQqB5AgG1x66F3+bsc6V8jMaUnjEbJBQqaPSo0LlbMd6YgAmvH9VKaSoSXx0AsiOET9huu3IZu7Dbgai7c/ZQ1McC83aA9aCc9sP2KtWgYr2AX4TEnadB86wHGCUR8HRSSbYQc/BaJjO3fBMaqSzaaL9/n1j75XV6SYArY02QdaN9lOhK/QxFfPs3InWPrifsvfJMtNnObpOhp9cr8TLcDb9YrPN5ux7Zn5tFHbLHvs6qIKRZKR/ojHJi33kqTWsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/A8ipv6Lf7VuO3oB5cyO3T7DidUjD5L14Pjy0wSW5M=;
 b=mfccVmbIQTIwc9ngRihgJMfj+xWzvmDbnnukv5uJAgFtwZyj6GNAuM2tLH8zRybPgf8WJYcPNvJqCNHHT+e17fg06zSYY2h4fwI1K+evltOsEw89MtB1Ekwf3oeatwUmiG5NdvB+6Af9c95hvHdZqOAiHaLvF3n01hMUyzCyc3xXmvvPktar7Y8X58TySThMIf81Lwvpa+FRW4/IXv4sX7IAN0a8btxNU/BoMdsP1lXXHoZSF9Q88UA8ZiNxG1VEA3uBYuPaNFZ2k8bFTF/5mRgVThulyplHgeclyIPl/E/WadVckAmXF18Yfu53NAneWTCvDGnekRJ2xL/LffjTdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/A8ipv6Lf7VuO3oB5cyO3T7DidUjD5L14Pjy0wSW5M=;
 b=Nn91ga9NSplZUxRgxv+GiNIJhBjA/RrvDqTaaMesdDk6IsMDlHiLxKmkg4giSm0LCsmye5mrQE4ptL/yNCk21RpeMUUeRsr4Md+ICjWiopRjD/v/lkMKqKdbsd229HnT/HobKB9ya/ZfSqRdSsy4iXtfYbN0fzxrhXrCXgZ1pfAf6CXaUjSipcmoUYUS02I8xOkbWXUKBlRaIZPeIwAvwHedtP6m9DX+XIWtaf4aAYuNB970ArLODjdeQu3UObaRPRr35oi4whMKyFK1oyaswXPoXrBjiufvluuEHM41J1xP9OmW8kyXtWs9awQ0e/1Jh+vXLF6tu27iVcoR72v7wQ==
Received: from DM6PR11CA0044.namprd11.prod.outlook.com (2603:10b6:5:14c::21)
 by DM6PR12MB4057.namprd12.prod.outlook.com (2603:10b6:5:213::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 18:51:16 +0000
Received: from DM6NAM11FT073.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:14c:cafe::86) by DM6PR11CA0044.outlook.office365.com
 (2603:10b6:5:14c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.17 via Frontend
 Transport; Thu, 26 Jan 2023 18:51:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DM6NAM11FT073.mail.protection.outlook.com (10.13.173.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.17 via Frontend Transport; Thu, 26 Jan 2023 18:51:16 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 26 Jan
 2023 10:51:06 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 26 Jan 2023 10:51:05 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport;
 Thu, 26 Jan 2023 10:51:01 -0800
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
Subject: [PATCH 16/18] vfio/common: Optimize device dirty page tracking with
 vIOMMU
Date: Thu, 26 Jan 2023 20:49:46 +0200
Message-ID: <20230126184948.10478-17-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230126184948.10478-1-avihaih@nvidia.com>
References: <20230126184948.10478-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT073:EE_|DM6PR12MB4057:EE_
X-MS-Office365-Filtering-Correlation-Id: 02a72282-4d94-4b9d-398c-08daffce4e3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ov/HlA/Ia8JrdtuFCiCC2F1TQYMBmz8KzWlbKLoq2Q7H9dtqrfTC9heeWmSYurstHn2fX7EnPPcCY+o0U83vETA8lH9zaBSUI9X6lrBDu4qMPQHDambzKGsFZRq88n+gC3Lac+6fvbqCSaVOk2ZMQ2qDyKbMhltiKC8hB2nUsljzlxL4coL2PkTc2mLyyaIa6mFN20HhhMjPvpuwqb+UUYmqTKOJa9KEf858PvzbzCCihol3DJR87vwbo1bcu7nMjFS6VKk8pYx9/yJI9XWXRXzlAbsvZ3BoC0O7EsCTvXZnQMMki0JJHxEWnMEAsNMov1vb9hthc/EzrhRiyJrAIpvuUHvplwslIX9iWKzjbD7Kab9rDnGuJYuH2M/vaWmELgX+t3oNXTRVMDfOV7vUaCMPxjWsdIkgyKGAWwFOgi2UnG9um1wDxT4RXftWv3rHbyfQAPlLcoZQOfo8lyZm80VNjUQ73nDSGGxeccy32TDPjjdRL6JSDiYKKGNO70jl3HgSw2cTvlJe/lGAzxUehGKwMu1ytvQJ8u7xE4jyihreCmeheM8StaiyzEPbAc5AGdaEVLf+BmJwYJFCkJhlG3aG50QGIGtYywPAK8f+9kocgZh2xIac3fnd9ocefx0BDx0G2n9SamtvL4ukwjpXqkywBBhZr5+mDa0L5gIxeqK3Z/BzjMXDw8bCVHz6oPWWD5sZJjGn6GnxR7XkocvySzIkaV99YsfbRUE0MruXckc=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(346002)(39860400002)(136003)(376002)(451199018)(36840700001)(40470700004)(46966006)(66899018)(47076005)(8676002)(86362001)(36756003)(7696005)(40460700003)(40480700001)(356005)(7636003)(36860700001)(426003)(2616005)(26005)(336012)(83380400001)(82310400005)(186003)(5660300002)(478600001)(7416002)(6666004)(316002)(54906003)(1076003)(82740400003)(70206006)(70586007)(41300700001)(8936002)(6916009)(2906002)(4326008)(14143004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 18:51:16.6208 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a72282-4d94-4b9d-398c-08daffce4e3f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT073.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4057
Received-SPF: softfail client-ip=2a01:111:f400:7ea9::60a;
 envelope-from=avihaih@nvidia.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
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

When vIOMMU is enabled, syncing dirty page bitmaps is done by replaying
the vIOMMU mappings and querying the dirty bitmap for each mapping.

With device dirty tracking this causes a lot of overhead, since the HW
is queried many times (even with small idle guest this can end up with
thousands of calls to HW).

Optimize this by de-coupling dirty bitmap query from vIOMMU replay.
Now a single dirty bitmap is queried per vIOMMU MR section, which is
then used for all corresponding vIOMMU mappings within that MR section.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/vfio/common.c | 85 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 83 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index c3a27cbbd5..4f27cd669f 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1848,8 +1848,42 @@ out:
 typedef struct {
     IOMMUNotifier n;
     VFIOGuestIOMMU *giommu;
+    VFIOBitmap *vbmap;
 } vfio_giommu_dirty_notifier;
 
+static int vfio_iommu_set_dirty_bitmap(VFIOContainer *container,
+                                       vfio_giommu_dirty_notifier *gdn,
+                                       hwaddr iova, hwaddr size,
+                                       ram_addr_t ram_addr)
+{
+    VFIOBitmap *vbmap = gdn->vbmap;
+    VFIOBitmap *dst_vbmap;
+    hwaddr start_iova = REAL_HOST_PAGE_ALIGN(gdn->n.start);
+    hwaddr copy_offset;
+
+    dst_vbmap = vfio_bitmap_alloc(size);
+    if (!dst_vbmap) {
+        return -errno;
+    }
+
+    if (!vfio_iommu_range_is_device_tracked(container, iova, size)) {
+        bitmap_set(dst_vbmap->bitmap, 0, dst_vbmap->pages);
+
+        goto out;
+    }
+
+    copy_offset = (iova - start_iova) / qemu_real_host_page_size();
+    bitmap_copy_with_src_offset(dst_vbmap->bitmap, vbmap->bitmap, copy_offset,
+                                dst_vbmap->pages);
+
+out:
+    cpu_physical_memory_set_dirty_lebitmap(dst_vbmap->bitmap, ram_addr,
+                                           dst_vbmap->pages);
+    vfio_bitmap_dealloc(dst_vbmap);
+
+    return 0;
+}
+
 static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
 {
     vfio_giommu_dirty_notifier *gdn = container_of(n,
@@ -1870,8 +1904,15 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
 
     rcu_read_lock();
     if (vfio_get_xlat_addr(iotlb, NULL, &translated_addr, NULL)) {
-        ret = vfio_get_dirty_bitmap(container, iova, iotlb->addr_mask + 1,
-                                    translated_addr);
+        if (gdn->vbmap) {
+            ret = vfio_iommu_set_dirty_bitmap(container, gdn, iova,
+                                              iotlb->addr_mask + 1,
+                                              translated_addr);
+        } else {
+            ret = vfio_get_dirty_bitmap(container, iova, iotlb->addr_mask + 1,
+                                        translated_addr);
+        }
+
         if (ret) {
             error_report("vfio_iommu_map_dirty_notify(%p, 0x%"HWADDR_PRIx", "
                          "0x%"HWADDR_PRIx") = %d (%s)",
@@ -1935,6 +1976,7 @@ static int vfio_sync_iommu_dirty_bitmap(VFIOContainer *container,
 {
     VFIOGuestIOMMU *giommu;
     bool found = false;
+    VFIOBitmap *vbmap = NULL;
     Int128 llend;
     vfio_giommu_dirty_notifier gdn;
     int idx;
@@ -1952,6 +1994,7 @@ static int vfio_sync_iommu_dirty_bitmap(VFIOContainer *container,
     }
 
     gdn.giommu = giommu;
+    gdn.vbmap = NULL;
     idx = memory_region_iommu_attrs_to_index(giommu->iommu_mr,
                                              MEMTXATTRS_UNSPECIFIED);
 
@@ -1959,11 +2002,49 @@ static int vfio_sync_iommu_dirty_bitmap(VFIOContainer *container,
                        section->size);
     llend = int128_sub(llend, int128_one());
 
+    /*
+     * Optimize device dirty tracking if the MR section is at least partially
+     * tracked. Optimization is done by querying a single dirty bitmap for the
+     * entire range instead of querying dirty bitmap for each vIOMMU mapping.
+     */
+    if (vfio_devices_all_device_dirty_tracking(container)) {
+        hwaddr start = REAL_HOST_PAGE_ALIGN(section->offset_within_region);
+        hwaddr end = int128_get64(llend);
+        hwaddr size;
+        int ret;
+
+        if (start >= container->giommu_tracked_range) {
+            goto notifier_init;
+        }
+
+        size = REAL_HOST_PAGE_ALIGN(
+            MIN(container->giommu_tracked_range - 1, end) - start);
+
+        vbmap = vfio_bitmap_alloc(size);
+        if (!vbmap) {
+            return -errno;
+        }
+
+        ret = vfio_devices_query_dirty_bitmap(container, vbmap, start, size);
+        if (ret) {
+            vfio_bitmap_dealloc(vbmap);
+
+            return ret;
+        }
+
+        gdn.vbmap = vbmap;
+    }
+
+notifier_init:
     iommu_notifier_init(&gdn.n, vfio_iommu_map_dirty_notify, IOMMU_NOTIFIER_MAP,
                         section->offset_within_region, int128_get64(llend),
                         idx);
     memory_region_iommu_replay(giommu->iommu_mr, &gdn.n);
 
+    if (vbmap) {
+        vfio_bitmap_dealloc(vbmap);
+    }
+
     return 0;
 }
 
-- 
2.26.3


