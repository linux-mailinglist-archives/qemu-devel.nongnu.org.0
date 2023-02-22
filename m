Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B4C69FA81
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 18:52:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUtHE-0003Hg-8k; Wed, 22 Feb 2023 12:51:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtHB-0003Ad-KW
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:51:33 -0500
Received: from mail-co1nam11hn20308.outbound.protection.outlook.com
 ([2a01:111:f400:7eab::308]
 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtH8-0004lV-9K
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:51:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IHL276+Mtf+OrJEo4Fq0ZSJ4RNQstAWRRV2uVh5L8D0vqsVZiKmWs0p+9fnf3FTH5mUNnqlpiBCL3nAP4AbE4FySYS3rD3ePM6SD62Q0Xxcu+RePR05b/trmiaaloQgLhkFxEDC3lLl6gqsuQI0RaRSaffk/8Tr35O/cyAzjLgzt5vWPtqtt9MYYBtMkYI+ggnfN7KemI/bEvRrRfaf1cbqW2VRPHX3GTpBzJy5hCBq6EagDibmmRzhVQGU7KAL5X6RSbIhLjU8ZtDnNyJjixeecO4J/Tpp8nvRsbQH11bbWMG6rY4ve3oOVQLx4677+KxV1K8ZML46ozVZpwysxoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJqTmy46TePv2SKu05LaGX4Z/E0vByKnojWPlTFt+zk=;
 b=M33ZJgfvIA+thpzWlyu6BoAljYutzdoXQdUN5WdykqcFXQFGeba9/CZ5PcLedQlfM75RwJY+LmMN+HnmBRANg+sYeN81tX7nI+vaRvkc6DVGgeTNAzDUqZst8AYl0t71RSlmEI80cGeNHwXsF1IYwPpvzkiNVXEiK3SjnpdGRDVoHwsZAksGlhaiXFhddjuWGDYx8+jDWn1un1lXDkSfTmO07FOsgmBLVsTexGZBENlipGcHJHu1seuGwVWPY0EyztpqsecudQSGaQYZlVkMjDfGCkdcap4xVEjc7Hkdaay0B16jgh7D78ORYQKUeqryJBxZvB9PxikvRWVsEWraIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJqTmy46TePv2SKu05LaGX4Z/E0vByKnojWPlTFt+zk=;
 b=n9fAHBcBLOEdpUUH7oGqd15QPcfSXHZPhmjR39q6HV5ppukha/ZEAs8b0s/sywuu9/khR9fBkfN33a3u2tHRnzjPDGBPa03YxeDv6qDmGs8+TRYFve4VCtnFoq7mpWP52I05pZ06Ajc7YLnl75BrBRdFvpjEXFeV/3W3ZrBnDPgA2zHCkEcHCsCnLg/Xi3DtBCU0jdkP8k/semxZGaa0oQrdHwlAo7FM9Tac8+9H8/Eh3HKae7WGZf36SYgtx/bQaEEg2ozFEDkTXd9dbOvlGPZjFdL/ImP2beeU5W+Tn56Uo9AdhlRbO0O1qWOk6zecPbOd7Gf8aThxWavsXSZwpg==
Received: from MW4PR03CA0226.namprd03.prod.outlook.com (2603:10b6:303:b9::21)
 by BL1PR12MB5093.namprd12.prod.outlook.com (2603:10b6:208:309::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Wed, 22 Feb
 2023 17:51:25 +0000
Received: from CO1NAM11FT087.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b9:cafe::dc) by MW4PR03CA0226.outlook.office365.com
 (2603:10b6:303:b9::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19 via Frontend
 Transport; Wed, 22 Feb 2023 17:51:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT087.mail.protection.outlook.com (10.13.174.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.19 via Frontend Transport; Wed, 22 Feb 2023 17:51:25 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:51:06 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:51:05 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Wed, 22 Feb
 2023 09:51:00 -0800
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
Subject: [PATCH v2 18/20] vfio/common: Optimize device dirty page tracking
 with vIOMMU
Date: Wed, 22 Feb 2023 19:49:13 +0200
Message-ID: <20230222174915.5647-19-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230222174915.5647-1-avihaih@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT087:EE_|BL1PR12MB5093:EE_
X-MS-Office365-Filtering-Correlation-Id: b7c841c1-be44-44ea-d2f1-08db14fd6ac5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kxh5lEmF6nZ+P+i4Tfb8WXf5PZRpxsBxW0MIrP0UbkZwdQp+kxwq/xrgFwH30AMKMhbAQEmwcvygj6HRqG3wyEcYCX396YDJt1sDj9I7zFh7sncekufKJKD66oT2lO7Kiw12M2nIqcrBXoP8JmEeCwBNVKY5AiZSF0jIMyJ4sixR9ic4N/jIoCao6fwHexiGKxGOeB2ihkvMfntCGP7XFuMn9DhBiflyo4aN3v93bvNmoYU6qN852VTgXr5Auve1dzVed0o2WLYbwDCpPztxwZJRkA4X1VAuFre9PY49wVIYm7cSyDyRZ712+P+acQBsVbQArTJegzHC/AW8OX8bJLKBmfqrWlCoF3E6LW+vI6lW4xFLblhGdUgzgo57qXmDTdBhDC04BhCNvCif6Qz77xb9d6ppQwBnid7OjgippNnq+cCxmEhxzXjdqY+8irySZbhy/m6o4Y/sXYQ8oDObBBTsqr/DMqVAFZ9KdCi23BYBu83K/Df+CULY9WCkgUvgZWajeWRTDgevBlnAWBH0qg+yd82A1UqHi7JuTlOMOlUUqamjCBSGjV9xzh13yVxxMfaZ0d1sBOKnk7UKoctV/iePg5WS6iRXsqXZRlohSd+lJJv0N+/zzLcdDvMKFuBTbmVHsWhySxGf0Y++NBMyK4escsNNJvjtuixkT9ZHnpTgzTtNHI4lsAem8v01ITkWT5yb1LZSU6xGTz13/xJJfTXvLVpsADNOtb9uggSRbS+ofrR89+4DKS0tEYi4YsksMUGpbIcCNkYCSWfRcQLSwi6RvECmjXZw96C7WOf+Ozo=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(396003)(39860400002)(346002)(376002)(5400799012)(451199018)(46966006)(40470700004)(36840700001)(66899018)(82310400005)(83380400001)(316002)(47076005)(336012)(54906003)(426003)(36756003)(6916009)(7636003)(82740400003)(34020700004)(70586007)(36860700001)(8676002)(6666004)(70206006)(2616005)(26005)(186003)(1076003)(40460700003)(7696005)(41300700001)(5660300002)(4326008)(7416002)(478600001)(8936002)(2906002)(40480700001)(86362001)(356005)(14143004)(12100799015);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 17:51:25.2750 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7c841c1-be44-44ea-d2f1-08db14fd6ac5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT087.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5093
Received-SPF: softfail client-ip=2a01:111:f400:7eab::308;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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
index 1024788bcc..f16a57d42b 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1946,8 +1946,42 @@ out:
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
@@ -1968,8 +2002,15 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
 
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
@@ -2033,6 +2074,7 @@ static int vfio_sync_iommu_dirty_bitmap(VFIOContainer *container,
 {
     VFIOGuestIOMMU *giommu;
     bool found = false;
+    VFIOBitmap *vbmap = NULL;
     Int128 llend;
     vfio_giommu_dirty_notifier gdn;
     int idx;
@@ -2050,6 +2092,7 @@ static int vfio_sync_iommu_dirty_bitmap(VFIOContainer *container,
     }
 
     gdn.giommu = giommu;
+    gdn.vbmap = NULL;
     idx = memory_region_iommu_attrs_to_index(giommu->iommu_mr,
                                              MEMTXATTRS_UNSPECIFIED);
 
@@ -2057,11 +2100,49 @@ static int vfio_sync_iommu_dirty_bitmap(VFIOContainer *container,
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


