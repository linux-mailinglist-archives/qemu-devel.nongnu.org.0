Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCC463D261
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 10:47:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0Jek-0003PU-ED; Wed, 30 Nov 2022 04:45:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1p0JeT-0003Oe-Lm; Wed, 30 Nov 2022 04:45:13 -0500
Received: from mail-co1nam11on20621.outbound.protection.outlook.com
 ([2a01:111:f400:7eab::621]
 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1p0JeP-00031D-HE; Wed, 30 Nov 2022 04:45:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V5asJwgryHxcUayxt9yYZVdadgIDWTh/gWDvrRN8gZfi2vLBfmx0vQKN77MwbogLfv8cXi/iOS2p31WHEuzo8pbssN/8hJj7wdHOi6AgFoRiwBE2NwU2Dm40Lb9C+alMH3wXP8Amv+42dqiUvgvffMDnZTPk4YX21ccrR++hlCF7wj+LpKN5GO7HK6b9SccnDmm1Jo5YFnXPEi8dszKHsPR33+vpibUYO0UrS60JSXLhxgbiYXgA/LqclKvyh7+E6zhaWNktP+33aM4BC0e4zlTO5owsJ1yFmLpdBOxNZphk/xP2Ih8eKt740ez7V5029paQd/sJ+wPB7yPdGUExZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wy48OPsRa/mOtsvQQ6UDa7t/N5MKEjaFzUZq2RwPJDY=;
 b=F4MSo9KjhjsDUSIGuxVNT+twx6OuD287RSRgPp0+yVIXBukR4RbLXpKqhONB9uiT6lcKjHXoI7rFvp5y9lVgO1bi726OBEqhw09yVGATj4JJacoSzgtmQzjf5vUuAQLfcMyoXrX3DuJGSob1w0WzUxTip+lmROjOwLGz4LZbPXyZN0Li9L/d0U/gq4dMUSsdCRRuJ1kkVJUrRZeQF+MynXbTN97FRBpSA0TEJczZ0SDsG08OpB4qyUX2Qq2Teu6lYDMYS7HzeI0tSKzV6gv2/d6A5jijYHEj0Edvr170nMjwvCkRUh2aZ7fkqcKoFzm5lm6wZISdxRXxRP8m5oYIOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wy48OPsRa/mOtsvQQ6UDa7t/N5MKEjaFzUZq2RwPJDY=;
 b=DIN880FoG0u9yTxr0G5L5oyhNrlnfQS7/LPsthyT+ikkGf1OXurQMfqXavzr8ert1v2erGB4L631xqK9REo6y36yfyGq2cXN+/FmChwnlcvQOTwQfZaa/0df55vWForMe0C4/nRXhjILyINliaxPg+mg30q2IafGVXwU6Ir3rflO0DJGfhzL/JGQN/ScddAZIrDxBF9PP2jW6tIfldBQtjaA7MndQEF9Zp6NAvwhiVD22TdNx01yGDTz8ALzr8KinmnODyJRVoF6TwVdyxD6wwThbwJ+6NxrpjjJQuwSuvDUKLxVoS1Xwj8A4+ozVgETbInaHqdHwkl6D2iox1xKww==
Received: from MW4PR04CA0094.namprd04.prod.outlook.com (2603:10b6:303:83::9)
 by DM6PR12MB4532.namprd12.prod.outlook.com (2603:10b6:5:2af::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 09:45:05 +0000
Received: from CO1NAM11FT081.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:83:cafe::28) by MW4PR04CA0094.outlook.office365.com
 (2603:10b6:303:83::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23 via Frontend
 Transport; Wed, 30 Nov 2022 09:45:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1NAM11FT081.mail.protection.outlook.com (10.13.174.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.8 via Frontend Transport; Wed, 30 Nov 2022 09:45:04 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 30 Nov
 2022 01:44:52 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 30 Nov
 2022 01:44:51 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Wed, 30 Nov
 2022 01:44:44 -0800
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Richard Henderson
 <richard.henderson@linaro.org>, David Hildenbrand <david@redhat.com>, "Ilya
 Leoshkevich" <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, "Juan
 Quintela" <quintela@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck
 <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, Eric Blake
 <eblake@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>, John Snow <jsnow@redhat.com>,
 <qemu-s390x@nongnu.org>, <qemu-block@nongnu.org>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Shay Drory <shayd@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v4 04/14] vfio/migration: Allow migration without VFIO IOMMU
 dirty tracking support
Date: Wed, 30 Nov 2022 11:44:04 +0200
Message-ID: <20221130094414.27247-5-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20221130094414.27247-1-avihaih@nvidia.com>
References: <20221130094414.27247-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT081:EE_|DM6PR12MB4532:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b13f4aa-3340-44f6-4abe-08dad2b78f18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kWYGXfsdzgD96NjHaIuVYQ9uUmHIUajuT3K/GnHdczYsB3TcNnzW+UOL6Um9CDUvfk3R2ZF5+ZgskNzbLDu9VFGCzEuW9+UsL4bgWGwllk3wvgiHNZ3yYKFpgq93ScCuXrNeYdSQh3RRagxkYva8CGtuzvOGfflU+SeFp9mDL711RtFJIdjq4I4pdY59YtPqImRiR34FyODrV9Vk0NNAercgMqpvxsFi/HF3+v1d0ZV2u4st6z1RbqgIajwImqts1lZb6Rpv3L3XN4wcWiMHkbGhO4kr+k65YMOR5HPaorKhkIm8MQsFVlwIO5f8AU6lycxQd0whocV6kqrFN0m9mTPUCDDEh/IK3QqVOYMLlSU9ehNLVemRyt8VJ2pDAIIJ2sEUNtO+l89MFtAFlG4tLS+2oHJoOaYac18MVol6QJbhaC/Vk3JwZyJJ5f7QSB1zkIkmDw1tQxC8HzInxHcq+Gp2Uzz+vNyBEtOuJugnwAyntq0eH2ad+ml9spdeg4J1BII2yWP9SuihQyeKd2ct4E5E4mP6kyKENl+WAthzSEAxcu7lT/X/r8sdiztKJr+rV1e9llUPIo9W5/r41ktgHg+LYkpayzJYdyQE36v6Pcj3rAdCqEdcJxnfxjxONO1/85SFzLHtg2rVRdr2tEIQsYMJN4GnmNEygjrjngBjnKzRiBTT3ES/sLXDPx88Qv6sVYyQD4Jq6Q0h9VosknejesamNPMz03OAi1SvJ4R6BEisEwhui6bHDObfLGIzWGvDiGMkSR+LqOtSwloONZHNtO/xMyzkvBuNlR43z0MM8UXsa36f6hpZl5+LXlz7gmGt
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199015)(36840700001)(46966006)(40470700004)(2906002)(7696005)(966005)(478600001)(40460700003)(356005)(40480700001)(7636003)(36756003)(86362001)(6666004)(1076003)(26005)(82740400003)(47076005)(83380400001)(426003)(186003)(2616005)(336012)(41300700001)(70586007)(70206006)(4326008)(36860700001)(8676002)(5660300002)(8936002)(7416002)(82310400005)(316002)(6916009)(54906003)(14143004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 09:45:04.6366 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b13f4aa-3340-44f6-4abe-08dad2b78f18
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT081.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4532
Received-SPF: softfail client-ip=2a01:111:f400:7eab::621;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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

Currently, if IOMMU of a VFIO container doesn't support dirty page
tracking, migration is blocked. This is because a DMA-able VFIO device
can dirty RAM pages without updating QEMU about it, thus breaking the
migration.

However, this doesn't mean that migration can't be done at all.
In such case, allow migration and let QEMU VFIO code mark the entire
bitmap dirty.

This guarantees that all pages that might have gotten dirty are reported
back, and thus guarantees a valid migration even without VFIO IOMMU
dirty tracking support.

The motivation for this patch is the future introduction of iommufd [1].
iommufd will directly implement the /dev/vfio/vfio container IOCTLs by
mapping them into its internal ops, allowing the usage of these IOCTLs
over iommufd. However, VFIO IOMMU dirty tracking will not be supported
by this VFIO compatibility API.

This patch will allow migration by hosts that use the VFIO compatibility
API and prevent migration regressions caused by the lack of VFIO IOMMU
dirty tracking support.

[1] https://lore.kernel.org/kvm/0-v2-f9436d0bde78+4bb-iommufd_jgg@nvidia.com/

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/vfio/common.c    | 100 ++++++++++++++++++++++++++------------------
 hw/vfio/migration.c |   3 +-
 2 files changed, 61 insertions(+), 42 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 130e5d1dc7..67104e2fc2 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -397,51 +397,61 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
                                  IOMMUTLBEntry *iotlb)
 {
     struct vfio_iommu_type1_dma_unmap *unmap;
-    struct vfio_bitmap *bitmap;
+    struct vfio_bitmap *vbitmap;
+    unsigned long *bitmap;
+    uint64_t bitmap_size;
     uint64_t pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size();
     int ret;
 
-    unmap = g_malloc0(sizeof(*unmap) + sizeof(*bitmap));
+    unmap = g_malloc0(sizeof(*unmap) + sizeof(*vbitmap));
 
-    unmap->argsz = sizeof(*unmap) + sizeof(*bitmap);
+    unmap->argsz = sizeof(*unmap);
     unmap->iova = iova;
     unmap->size = size;
-    unmap->flags |= VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP;
-    bitmap = (struct vfio_bitmap *)&unmap->data;
 
+    bitmap_size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
+                  BITS_PER_BYTE;
+    bitmap = g_try_malloc0(bitmap_size);
+    if (!bitmap) {
+        ret = -ENOMEM;
+        goto unmap_exit;
+    }
+
+    if (!container->dirty_pages_supported) {
+        bitmap_set(bitmap, 0, pages);
+        goto do_unmap;
+    }
+
+    unmap->argsz += sizeof(*vbitmap);
+    unmap->flags = VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP;
+
+    vbitmap = (struct vfio_bitmap *)&unmap->data;
+    vbitmap->data = (__u64 *)bitmap;
     /*
      * cpu_physical_memory_set_dirty_lebitmap() supports pages in bitmap of
      * qemu_real_host_page_size to mark those dirty. Hence set bitmap_pgsize
      * to qemu_real_host_page_size.
      */
+    vbitmap->pgsize = qemu_real_host_page_size();
+    vbitmap->size = bitmap_size;
 
-    bitmap->pgsize = qemu_real_host_page_size();
-    bitmap->size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
-                   BITS_PER_BYTE;
-
-    if (bitmap->size > container->max_dirty_bitmap_size) {
-        error_report("UNMAP: Size of bitmap too big 0x%"PRIx64,
-                     (uint64_t)bitmap->size);
+    if (bitmap_size > container->max_dirty_bitmap_size) {
+        error_report("UNMAP: Size of bitmap too big 0x%"PRIx64, bitmap_size);
         ret = -E2BIG;
         goto unmap_exit;
     }
 
-    bitmap->data = g_try_malloc0(bitmap->size);
-    if (!bitmap->data) {
-        ret = -ENOMEM;
-        goto unmap_exit;
-    }
-
+do_unmap:
     ret = ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, unmap);
     if (!ret) {
-        cpu_physical_memory_set_dirty_lebitmap((unsigned long *)bitmap->data,
-                iotlb->translated_addr, pages);
+        cpu_physical_memory_set_dirty_lebitmap(bitmap, iotlb->translated_addr,
+                                               pages);
     } else {
         error_report("VFIO_UNMAP_DMA with DIRTY_BITMAP : %m");
     }
 
-    g_free(bitmap->data);
 unmap_exit:
+    g_free(bitmap);
     g_free(unmap);
     return ret;
 }
@@ -460,8 +470,7 @@ static int vfio_dma_unmap(VFIOContainer *container,
         .size = size,
     };
 
-    if (iotlb && container->dirty_pages_supported &&
-        vfio_devices_all_running_and_saving(container)) {
+    if (iotlb && vfio_devices_all_running_and_saving(container)) {
         return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
     }
 
@@ -1201,6 +1210,10 @@ static void vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
         .argsz = sizeof(dirty),
     };
 
+    if (!container->dirty_pages_supported) {
+        return;
+    }
+
     if (start) {
         dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_START;
     } else {
@@ -1231,11 +1244,26 @@ static void vfio_listener_log_global_stop(MemoryListener *listener)
 static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
                                  uint64_t size, ram_addr_t ram_addr)
 {
-    struct vfio_iommu_type1_dirty_bitmap *dbitmap;
+    struct vfio_iommu_type1_dirty_bitmap *dbitmap = NULL;
     struct vfio_iommu_type1_dirty_bitmap_get *range;
+    unsigned long *bitmap;
+    uint64_t bitmap_size;
     uint64_t pages;
     int ret;
 
+    pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size();
+    bitmap_size = ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
+                                  BITS_PER_BYTE;
+    bitmap = g_try_malloc0(bitmap_size);
+    if (!bitmap) {
+        return -ENOMEM;
+    }
+
+    if (!container->dirty_pages_supported) {
+        bitmap_set(bitmap, 0, pages);
+        goto set_dirty;
+    }
+
     dbitmap = g_malloc0(sizeof(*dbitmap) + sizeof(*range));
 
     dbitmap->argsz = sizeof(*dbitmap) + sizeof(*range);
@@ -1250,15 +1278,8 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
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
+    range->bitmap.size = bitmap_size;
+    range->bitmap.data = (__u64 *)bitmap;
 
     ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, dbitmap);
     if (ret) {
@@ -1268,13 +1289,13 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
         goto err_out;
     }
 
-    cpu_physical_memory_set_dirty_lebitmap((unsigned long *)range->bitmap.data,
-                                            ram_addr, pages);
+set_dirty:
+    cpu_physical_memory_set_dirty_lebitmap(bitmap, ram_addr, pages);
 
-    trace_vfio_get_dirty_bitmap(container->fd, range->iova, range->size,
-                                range->bitmap.size, ram_addr);
+    trace_vfio_get_dirty_bitmap(container->fd, iova, size, bitmap_size,
+                                ram_addr);
 err_out:
-    g_free(range->bitmap.data);
+    g_free(bitmap);
     g_free(dbitmap);
 
     return ret;
@@ -1409,8 +1430,7 @@ static void vfio_listener_log_sync(MemoryListener *listener,
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
 
-    if (vfio_listener_skipped_section(section) ||
-        !container->dirty_pages_supported) {
+    if (vfio_listener_skipped_section(section)) {
         return;
     }
 
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 09fe7c1de2..552c2313b2 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -860,11 +860,10 @@ int64_t vfio_mig_bytes_transferred(void)
 
 int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
 {
-    VFIOContainer *container = vbasedev->group->container;
     struct vfio_region_info *info = NULL;
     int ret = -ENOTSUP;
 
-    if (!vbasedev->enable_migration || !container->dirty_pages_supported) {
+    if (!vbasedev->enable_migration) {
         goto add_blocker;
     }
 
-- 
2.26.3


