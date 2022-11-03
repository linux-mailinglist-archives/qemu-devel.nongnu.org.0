Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EF361841E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:20:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqcw1-0002VC-LV; Thu, 03 Nov 2022 12:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oqcuP-0000k9-5K; Thu, 03 Nov 2022 12:17:37 -0400
Received: from mail-bn8nam12on2068.outbound.protection.outlook.com
 ([40.107.237.68] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oqcuM-00084b-95; Thu, 03 Nov 2022 12:17:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZ/rEKBe97sdBhFt6GG2g/pz2dOKeqmo8zk1xn2ILDAnu3xYOg11E72fq+HYNQn5zd+jS7oizrmLMYLQWjfi09mwgbZFrsG60OaoWDC/rusuZj152QSXFL3DDsedJG4Ek9Vot0/LJMZP45qwGmQ4+0QcMQs8A+mHHCLwwzaACncH6Jh3vCtw4AHBMbhedDnGcGRZLoWiS64AMRQYDvLrYyBCHmEJ12aYQokwu/oegF79KzqG+IUccCPQ0Z89CO5NEMfAkEfkc56PoRqBuR8ehk/6sABlmXm0iRs8XRCurrv1EhWa4Vc4pmLv7X82abz7Aa/Mu8Hk1N5gUie0BQX2mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3kkFJovwULQFMdhS9M5tLi/WA21wjs74WNpMiNAozo=;
 b=YC7EFiNjCEl7EK6XTYCVlOwQfV1gSOjgkdiRdxJX6Rg2MwENH/4qF7m0Hyz2qWJkczzoumEGEKx6oY057OL+bZnncyQBPfnFF6s09tzffuDVX7LNeXItcveagHmn1mFAZThLBZm2MJGgwJRjyacvz5/TrkMcEb80Hcvvr63PnDlgqwApDC0uzznatM7cwl3swlfLRg4OOjWwOqEJUvEir5/q3GL/Hn4e9MSiaTjpvrd/qyqAbSRpsrwnAOR2vWoH8mPF2d1L0GtNfMyna2k/fauuTDpXJggOBmGdHJavBG0OECu90EqZz3jHAviXblEJi5VTTbGxa8zUKGR5N5GLDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3kkFJovwULQFMdhS9M5tLi/WA21wjs74WNpMiNAozo=;
 b=a6X6jYZk9IYbSjR0VoI7a5M8Ec90wbzv0gbL+y7uO+ggMxO8k/qS7uKmH+Zp4LsIHggE1G8VEn9bj4Kvko93xWTDLDRRgMmUqUSYbdVi1P3E1eBoKJSErsUhLTSRSgMaNGJ9maVBHBz+NeRndpp9w/UKg9LUiuvL7034lNu7Vj9xP00Vfhp+VUmKi2UfnVLUyTEyM1/9wRKQ3rnznKFhDv28KqqNN27jQi5I3xfnwa3+Ni04ZOAufQJZAPkdEQvphLL7I60/P85GAJgW0hi8Q9CpHNfY1sWdrf3kihGceH61weAmSGlVBaPwPbTzf/ieMNn2XEkWfxXFzvSN2faPOw==
Received: from MW2PR16CA0029.namprd16.prod.outlook.com (2603:10b6:907::42) by
 SA3PR12MB7952.namprd12.prod.outlook.com (2603:10b6:806:316::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.22; Thu, 3 Nov 2022 16:17:29 +0000
Received: from CO1NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:0:cafe::d1) by MW2PR16CA0029.outlook.office365.com
 (2603:10b6:907::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19 via Frontend
 Transport; Thu, 3 Nov 2022 16:17:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1NAM11FT065.mail.protection.outlook.com (10.13.174.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Thu, 3 Nov 2022 16:17:28 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Thu, 3 Nov 2022
 09:17:23 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 3 Nov 2022 09:17:22 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server id 15.2.986.29 via Frontend Transport;
 Thu, 3 Nov 2022 09:17:15 -0700
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
 <qemu-s390x@nongnu.org>, <qemu-block@nongnu.org>, Kunkun Jiang
 <jiangkunkun@huawei.com>, "Zhang, Chen" <chen.zhang@intel.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Shay Drory <shayd@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v3 07/17] vfio/migration: Allow migration without VFIO IOMMU
 dirty tracking support
Date: Thu, 3 Nov 2022 18:16:10 +0200
Message-ID: <20221103161620.13120-8-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20221103161620.13120-1-avihaih@nvidia.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT065:EE_|SA3PR12MB7952:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d576ee0-d41b-43d7-4fa3-08dabdb6e721
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y0i1LiCxflaUN/XrGuMZ5yk8Nweq2lVoQZ6nKhE9VJcW9vgJ8n1wtNlvRPkw+RUzoApqJY7zDcu/ShVqTxaO7NK1B4kLccTS9xbwetuhNK1hoiMuVUWrgAtHjDHcggWm8t9PYr87fYohjkD4u6TL5iavr73en15YXzaO9H0EHqQZ7efhafEcGEIgvZ1kp8X5PuN/VBCCyh5krkMROWnWniCwqpF3Lchj1JIkPn4hgNW6ej/QRnHp0j8nIKr4EkWpekme5aLr8MMBjDm/rR7IFzpamgcMdhbDwBzdiFwEAMneTH2pqGDccO2DCA1O8KmpOfQJgmYMjbLh7ibYCaVxrcj5wD2N05zkixdy03UzkpWwAD52S1aPIo9yHw86C4YLKolfMIaRIWYdZsnpablaBNNshnap0bmg8y+xB8F1OPw4eteykV7RIKEmVIeieNvrByng6mf2gKs8gtBqN+xhgaFni0+b3rmnmWFzxnMQnRF/7DinkTy1+w4SijvCH0AP6epbqulIcIjQbwakp66BAsdF5S/aY4FyO/LH4dgzyzvnR5rK6/ooCy8uEfgHrZcL+Q1Aig41RuRxRGiV0xxsy+JrvF8L1Je6F6kB7UFnpq+CAsfcyvupBomhM04twEeet4rHFoLDujUPyAhNPV7BQRVXyoNo3q2dEKoLsp3iSJ4n7W6zaYnZWAnR/rxmkuzknw5P2JnfyNkFFykhebOrk4varPMM/0KH6XxW/5zUoAGkEv0a2NRJhTQv2iar5lpaa23jLmMA08CauGiqgGqKsgnwcJjC8Vvdoq4p+wB1hom6/wb568/+Ed/4ZEYvWZharBEyHr9VefjqUwx9SjdwIiTCjTXawvB13LK6G7KN+HH3vjVovIifh3xzzvFIlPbu
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(2906002)(86362001)(70586007)(70206006)(40460700003)(26005)(7696005)(41300700001)(8676002)(6916009)(316002)(54906003)(8936002)(7416002)(4326008)(5660300002)(36860700001)(36756003)(82310400005)(966005)(478600001)(83380400001)(2616005)(426003)(47076005)(6666004)(356005)(336012)(40480700001)(7636003)(82740400003)(1076003)(186003)(14143004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 16:17:28.4514 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d576ee0-d41b-43d7-4fa3-08dabdb6e721
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7952
Received-SPF: softfail client-ip=40.107.237.68;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
 hw/vfio/common.c    | 84 +++++++++++++++++++++++++++++++++++++--------
 hw/vfio/migration.c |  3 +-
 2 files changed, 70 insertions(+), 17 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 6b5d8c0bf6..5470dbcb04 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -392,6 +392,41 @@ static bool vfio_devices_all_running_and_saving(VFIOContainer *container)
     return true;
 }
 
+static int vfio_dma_unmap_mark_dirty(VFIOContainer *container, hwaddr iova,
+                                     hwaddr size, IOMMUTLBEntry *iotlb)
+{
+    struct vfio_iommu_type1_dma_unmap unmap = {
+        .argsz = sizeof(unmap),
+        .flags = 0,
+        .iova = iova,
+        .size = size,
+    };
+    unsigned long *bitmap;
+    uint64_t pages;
+    int ret;
+
+    pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size();
+    bitmap = g_try_malloc0(ROUND_UP(pages, sizeof(__u64) * BITS_PER_BYTE) /
+                           BITS_PER_BYTE);
+    if (!bitmap) {
+        return -ENOMEM;
+    }
+
+    ret = ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap);
+    if (ret) {
+        error_report("VFIO_UNMAP_DMA failed : %m");
+        g_free(bitmap);
+        return ret;
+    }
+
+    bitmap_set(bitmap, 0, pages);
+    cpu_physical_memory_set_dirty_lebitmap(bitmap, iotlb->translated_addr,
+                                           pages);
+    g_free(bitmap);
+
+    return 0;
+}
+
 static int vfio_dma_unmap_bitmap(VFIOContainer *container,
                                  hwaddr iova, ram_addr_t size,
                                  IOMMUTLBEntry *iotlb)
@@ -401,6 +436,10 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
     uint64_t pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size();
     int ret;
 
+    if (!container->dirty_pages_supported) {
+        return vfio_dma_unmap_mark_dirty(container, iova, size, iotlb);
+    }
+
     unmap = g_malloc0(sizeof(*unmap) + sizeof(*bitmap));
 
     unmap->argsz = sizeof(*unmap) + sizeof(*bitmap);
@@ -460,8 +499,7 @@ static int vfio_dma_unmap(VFIOContainer *container,
         .size = size,
     };
 
-    if (iotlb && container->dirty_pages_supported &&
-        vfio_devices_all_running_and_saving(container)) {
+    if (iotlb && vfio_devices_all_running_and_saving(container)) {
         return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
     }
 
@@ -1274,14 +1312,18 @@ static void vfio_listener_log_global_start(MemoryListener *listener)
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
 
-    vfio_set_dirty_page_tracking(container, true);
+    if (container->dirty_pages_supported) {
+        vfio_set_dirty_page_tracking(container, true);
+    }
 }
 
 static void vfio_listener_log_global_stop(MemoryListener *listener)
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
 
-    vfio_set_dirty_page_tracking(container, false);
+    if (container->dirty_pages_supported) {
+        vfio_set_dirty_page_tracking(container, false);
+    }
 }
 
 static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
@@ -1289,9 +1331,29 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
 {
     struct vfio_iommu_type1_dirty_bitmap *dbitmap;
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
+        cpu_physical_memory_set_dirty_lebitmap(bitmap, ram_addr, pages);
+        trace_vfio_get_dirty_bitmap(container->fd, iova, size, bitmap_size,
+                                    ram_addr);
+        g_free(bitmap);
+
+        return 0;
+    }
+
     dbitmap = g_malloc0(sizeof(*dbitmap) + sizeof(*range));
 
     dbitmap->argsz = sizeof(*dbitmap) + sizeof(*range);
@@ -1306,15 +1368,8 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
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
+    range->bitmap.data = (void *)bitmap;
 
     ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, dbitmap);
     if (ret) {
@@ -1465,8 +1520,7 @@ static void vfio_listener_log_sync(MemoryListener *listener,
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
 
-    if (vfio_listener_skipped_section(section) ||
-        !container->dirty_pages_supported) {
+    if (vfio_listener_skipped_section(section)) {
         return;
     }
 
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index f5e72c7ac1..99ffb75782 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -857,11 +857,10 @@ int64_t vfio_mig_bytes_transferred(void)
 
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
2.21.3


