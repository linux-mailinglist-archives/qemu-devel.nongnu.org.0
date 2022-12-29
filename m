Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB358658C10
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 12:07:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAqiT-00072m-CH; Thu, 29 Dec 2022 06:04:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pAqiR-00071z-6q; Thu, 29 Dec 2022 06:04:51 -0500
Received: from mail-bn8nam11on2041.outbound.protection.outlook.com
 ([40.107.236.41] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pAqiO-0006U5-Se; Thu, 29 Dec 2022 06:04:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ze0GTwV9Xzuamu46u348DFIFU+cAm3HELjY+CMhWe0luJKL05UnYdsyK6BHqYgp83IYz1D5ZWvz6Z18wwonqVFbRbNMxLgXp3kWZw00yX5kBXpljmuu7MGD9cegLGO1oSQJmeSb2cuMBQAckrgBJCIT0E05pdiP3oNvm++iSWzgfX+bv0tp8VH2qIdHSJFBdAUvVDpiDiO575PSX0l6ak0WWMn1aafVzySFdSpmp22+8XnO4Z7FL9o0mUbc+g47WbWs9qmm8MSGU1Vb5JxR1/imKJBpz6yOs4BZiII29mn6UXojrIpCxnnH5jbKyQper197Oec7pDGOrsyZdkbHuuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PeadRFKg+YflIWYnHVvIpazrlDFrRpDWA8o045qO/Nw=;
 b=icKcDFN0jG2S10D2FXc7jk7sO9sX47fHAWJpTTvPpjTGUMbJZWyd3MBu880ApD644n+j3yV4VseHWnhFjmGAS7edT7ae7tCrwN8klOeov2MTOFQOn2zXMyTq+qZabqPjfcm63NBNo9w5POiI0HTAUQqy454E8oKKJCWo0aQxpNFt93BiYY6C+92xgN5Ju5LHPsLImiKlvf4zi08qmZWJ9Fnl9I0DcB0Qk12VrmZuOqiND3Lbq83gpB1QhgxkjKragdvBD7QHGUuNNgBvxRR2yL2qNM2ykyvhz66duaYbxUkalfUTx8Vm+57MoAKOgkr38AV5NJ88/YSkSx0wcRxOUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PeadRFKg+YflIWYnHVvIpazrlDFrRpDWA8o045qO/Nw=;
 b=bsDc+yhpbU93t4tOT/fPNSPn0VSZ/Rthl2RulfVlJ5D1lqPBD8djDOPlC705b0LJBDrMHVLo2SdxPQFn/OdpKrAph4hVXTMfQbw4FBJQKLQLYWVfEcdQADn9wAqhZJKb0NMiAjGPxYeSr00p6LcP82JDN/yqSgroV4q5JhvWfdepN8rcY+pVRTvZoDFkPYHRjvjfw1MmkbFLKKsoW9hQ2IOCCyPSqJplETzNVT1r0WvmmPNo05pdwBCEtiyKV5MUiuafEhpvbx0+AiJnjzhmjNxvanCqeve3dAWluC7V0Sgr/016QMw/JkeGMmvoa32MxRcNKM/tvJ7tAlFu4ZnCyw==
Received: from DM6PR10CA0010.namprd10.prod.outlook.com (2603:10b6:5:60::23) by
 PH8PR12MB6770.namprd12.prod.outlook.com (2603:10b6:510:1c5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Thu, 29 Dec
 2022 11:04:43 +0000
Received: from DS1PEPF0000E63F.namprd02.prod.outlook.com
 (2603:10b6:5:60:cafe::ec) by DM6PR10CA0010.outlook.office365.com
 (2603:10b6:5:60::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.17 via Frontend
 Transport; Thu, 29 Dec 2022 11:04:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF0000E63F.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.8 via Frontend Transport; Thu, 29 Dec 2022 11:04:43 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 29 Dec
 2022 03:04:31 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 29 Dec
 2022 03:04:31 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Thu, 29 Dec
 2022 03:04:24 -0800
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
 <maorg@nvidia.com>, Avihai Horon <avihaih@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Joao Martins
 <joao.m.martins@oracle.com>
Subject: [PATCH v5 05/14] vfio/migration: Allow migration without VFIO IOMMU
 dirty tracking support
Date: Thu, 29 Dec 2022 13:03:36 +0200
Message-ID: <20221229110345.12480-6-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20221229110345.12480-1-avihaih@nvidia.com>
References: <20221229110345.12480-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E63F:EE_|PH8PR12MB6770:EE_
X-MS-Office365-Filtering-Correlation-Id: a4d19da4-fe3e-4ce9-4f7d-08dae98c7d45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Utdr9nEmftUt1m8EjJQJYmHLFNTm0kBRN17id5uo8zzsJCiWy2PmxxFgtOEiB1q3QrwsXObFLYP0RLWXpHS5iJSGZXDyJsqWpu4p+zlNhtkyvLf52e8gwA4vz9hyCBSRHViT34CR4At6rMa4CqRfGeIWAk3BZpf/IMKvZDNppa2Xfnd4E8CmSwuz/sMHr3zck3Dy0ZvtaUF0fcNDeVknd3ey9cBYL5gTuZ7UO1BtwUJeB5UbXUmtWTzX+xMNMVarqSqEdg3TS6WLF7HOgoIHlh0V+aCkRQ2Vk/wdtBrXWcpS8UDQHd4400V/QVf3RTCMuNVh2DqKEJRSnggP6hxlhx4siHejtswzEtu/vX06r4CMko10m36yUrei6ObH93sn5Urhx/k0kiQCFm9CNPWzxFEEei0aGEF2uqV1J8sK7EYaEIvE6h7ZI1F2Q+lRCyblINf6cGnsx5HsD/LkrY9fAqcGOxXYH1cCSp+ALUHk6wHHc2V2pa1yuI04KocTCaI/hF/9et36m5dEFLoaXc/1NcFy5NspbU/HY6QAfQBXscYJzd9oS0KnGblP4LTn8c3tQ0tLVD+JQkXiJAp0ZHYEhdP9axduVbg0DnGp8xib6mOjcu8lT0Q2AuXkRoFf1GFXz9jox1z5XS95j56MNhH3iOdbTqAHl+XGrK5OAd3aakcNApEU9Ie1jn3dHPjXi+SFiddeCJ+G+jAiDhYnL28VHpI5UOxNJmwz5UrmELbje4jnWQJGaQz67qdhIW9rHFt6BqHg82RKPzI2wJPMm3ldeslyysxf7JQdiic1zg6Bmq9Tw16UW0YV0i6HjQ8QiqIN
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199015)(40470700004)(46966006)(36840700001)(36860700001)(7636003)(356005)(8936002)(83380400001)(4326008)(8676002)(70586007)(70206006)(7416002)(5660300002)(82740400003)(426003)(47076005)(1076003)(336012)(186003)(26005)(7696005)(2616005)(6666004)(82310400005)(86362001)(316002)(6916009)(40480700001)(2906002)(36756003)(54906003)(41300700001)(40460700003)(478600001)(966005)(14143004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2022 11:04:43.1171 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4d19da4-fe3e-4ce9-4f7d-08dae98c7d45
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E63F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6770
Received-SPF: permerror client-ip=40.107.236.41;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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

The motivation for this patch is the introduction of iommufd [1].
iommufd can directly implement the /dev/vfio/vfio container IOCTLs by
mapping them into its internal ops, allowing the usage of these IOCTLs
over iommufd. However, VFIO IOMMU dirty tracking is not supported by
this VFIO compatibility API.

This patch will allow migration by hosts that use the VFIO compatibility
API and prevent migration regressions caused by the lack of VFIO IOMMU
dirty tracking support.

[1]
https://lore.kernel.org/kvm/0-v6-a196d26f289e+11787-iommufd_jgg@nvidia.com/

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


