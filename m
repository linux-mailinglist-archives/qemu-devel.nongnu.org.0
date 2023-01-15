Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CB366B374
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 19:38:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH7s0-0007JR-Nz; Sun, 15 Jan 2023 13:36:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pH7ry-0007IQ-Ns; Sun, 15 Jan 2023 13:36:38 -0500
Received: from mail-bn8nam12on2044.outbound.protection.outlook.com
 ([40.107.237.44] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pH7rw-0007ci-OQ; Sun, 15 Jan 2023 13:36:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nAg14JLBxuRLJtob9VETi/+MCXMHLAX4rn2hDIpYyDxvJdon5WwRzVx9hDV0FAajcDakaGz/5r1cv/OY8DR/TYpNnEzcpy3UTzrYHqBju+fNB766NXfzZZqYvm909OJaRd5+rKQfV8y+ZtNRBi8IIEJbnG75e9ynuSprMQJh8+lL9MH3kZBoy2KhwMYg3QqY/D0ngNaFoUuEnj1DZC2f17Xy7zd4SextiKY4IWH6GddcJlzYBL/0knTTophZOx9CFfSx8QC1Goa8hmok/+OON5zThDpuvozGXXTyY3A8mwlnXGBnivnQN5LgXiwqW2UtA0P4Fp9/2bGibEVRovnnSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BaJ38liVsUzOA3vHwYlHsSh8cwLPTulKqyW2kq98Nxw=;
 b=l18Rxcmud9WjV0S4jwW2TKcciK0MJYigQjOOsK4OwSsfKIpW94fTUkmQrO40WbIBKvwQN8Zjhkkv3HqLDE311eK+rcC2sTVWjA+R3w9e8Dw40l3JPfisB/VakkNM3thjbvK748IFpO4KoKO39lgjCWL0Ay3Jij704M/E0HLEMqnh1+7S/XlxnL62p+PGFiD1hgSls0u5/Bd4zxWdP3d1GwbJTxmMCf+vDmpje2vH60ASaknqLniU3CW9ndORjjnC79tjlZVaZYjUEOrQFvFWgPxTfelmdTuD64Ey+GUH23XGz7FSn5NP/CaQpUBnMMNJOP+taQCzFyEHHwk2xSASmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BaJ38liVsUzOA3vHwYlHsSh8cwLPTulKqyW2kq98Nxw=;
 b=uNW6PjeVBjoXNR4qAVA8ix6ETlBzy9gNsf3emPovxDDfrCAO+I6XKDMlQbJiHOfXivz7vxSSqII53QZZ/OFPlolmWNoe+EJSZNPKX/GjHZX//olN+s398UUb+7fxs7UNCyuHZKjKOElBGse1ch6A2q6qFFurXyJXKPlbrlVsq7B90eBaBLvwa9R3MGlaijFh+/OSATZojjk08WLgaso5WUGs/0O1NOODh5DOiVSRHPPxX72m1SGWlG4Qj/cfBaaUbvZkrjtB4EHLeW1xpkiLwgnMr2zBo7KTmbK41ahQ16LEEPhdj4Jzj9hkHQ5tPQ6VNwHNxHTPCQUCDxoYPNo2qw==
Received: from DS7PR03CA0323.namprd03.prod.outlook.com (2603:10b6:8:2b::12) by
 LV2PR12MB5917.namprd12.prod.outlook.com (2603:10b6:408:175::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Sun, 15 Jan
 2023 18:36:32 +0000
Received: from DM6NAM11FT081.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2b:cafe::7e) by DS7PR03CA0323.outlook.office365.com
 (2603:10b6:8:2b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Sun, 15 Jan 2023 18:36:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DM6NAM11FT081.mail.protection.outlook.com (10.13.172.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Sun, 15 Jan 2023 18:36:31 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Sun, 15 Jan
 2023 10:36:31 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Sun, 15 Jan 2023 10:36:30 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport;
 Sun, 15 Jan 2023 10:36:24 -0800
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 <qemu-s390x@nongnu.org>, <qemu-block@nongnu.org>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Avihai Horon <avihaih@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Joao Martins
 <joao.m.martins@oracle.com>
Subject: [PATCH v7 04/13] vfio/migration: Allow migration without VFIO IOMMU
 dirty tracking support
Date: Sun, 15 Jan 2023 20:35:47 +0200
Message-ID: <20230115183556.7691-5-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230115183556.7691-1-avihaih@nvidia.com>
References: <20230115183556.7691-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT081:EE_|LV2PR12MB5917:EE_
X-MS-Office365-Filtering-Correlation-Id: d4e8eb9e-97ba-43eb-d1ea-08daf7276c51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YUNDn4xWvplS8YI+9jrKeK/u8gROFwOd4B2CwTfXXI+ifTbHcEBClHfTXfomJjCq7KCDu+NvJ/dCTOpBz+3jWbzEBaYwBUjag/21Q5KRsb9VT3kx3lZpNdA+pdTYroUVjIJfufK6krCwje40VNAgy6MpoEZCBmPoIT3nKJtRRhtPYKiN8A6/hUAf0I1yixZxXEbaASV4DCFF+MN/yPjoc3H9575KVAZmVjj2TgHByWYI6xeB2Arfe8xtaTAodn1g4OV7sdzktumhHFqtn9nlyORAVPlOf2aQUNfWooLIMKPi/vfStO96skYlgbX3xW7wT3XJkrq2Ch/70923HHJ7l/wT+P4Ku2ArWH+7x3YF9IUdpwcyEpIm0ArglUugyKFNhcXB1D4qt1bh9zKiINitwyyIl0vqEpw2sySUAiDdCyWpsER1uulK5C+/VKYooK/M5GnlQrgabBB9t8WHFsj1wlDbF0sSSwT8K3TgmJYjmIp7kI17IPtbaaB5iyCaYGOsq0sV3TSJ9WypHuMOhkdwM7Ck3HhPrtx4sWdwShgsryZF9wz9pQFmzxcMKcbmysBRK2Ec1imdwSLa4Ex5nxP8GHG+CvmYf/bptHut911qUnbLice4Ek2HPsf2WEYIK5NWwYfw2HQkoCeyZwy3meVHFPdkbywCHjkm4cARwMz8iQ01x2Lv8oi74rE4Qk3Pn4j8HBNDXsBdzVD++0xi4OwF7mc0ho18wM23tgdFmDqHtGLRZKCKVUZVnWgDa/U9SCQ5EhU+WQHxl80RniXMM/4uFjE2OOJlKGmTT6mqoyyec3ObqI8Baz8ZT5XYHIQXBq7y
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(136003)(346002)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(36756003)(356005)(86362001)(4326008)(8936002)(6916009)(70206006)(70586007)(8676002)(2906002)(5660300002)(7416002)(82740400003)(36860700001)(7636003)(83380400001)(478600001)(40460700003)(7696005)(966005)(54906003)(6666004)(316002)(40480700001)(82310400005)(41300700001)(2616005)(426003)(1076003)(47076005)(336012)(26005)(186003)(14143004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2023 18:36:31.8183 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e8eb9e-97ba-43eb-d1ea-08daf7276c51
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT081.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5917
Received-SPF: softfail client-ip=40.107.237.44;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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
In such case, allow migration and let QEMU VFIO code mark all pages
dirty.

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
 hw/vfio/common.c    | 20 ++++++++++++++++++--
 hw/vfio/migration.c |  3 +--
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 130e5d1dc7..f6dd571549 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -488,6 +488,12 @@ static int vfio_dma_unmap(VFIOContainer *container,
         return -errno;
     }
 
+    if (iotlb && vfio_devices_all_running_and_saving(container)) {
+        cpu_physical_memory_set_dirty_range(iotlb->translated_addr, size,
+                                            tcg_enabled() ? DIRTY_CLIENTS_ALL :
+                                            DIRTY_CLIENTS_NOCODE);
+    }
+
     return 0;
 }
 
@@ -1201,6 +1207,10 @@ static void vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
         .argsz = sizeof(dirty),
     };
 
+    if (!container->dirty_pages_supported) {
+        return;
+    }
+
     if (start) {
         dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_START;
     } else {
@@ -1236,6 +1246,13 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
     uint64_t pages;
     int ret;
 
+    if (!container->dirty_pages_supported) {
+        cpu_physical_memory_set_dirty_range(ram_addr, size,
+                                            tcg_enabled() ? DIRTY_CLIENTS_ALL :
+                                            DIRTY_CLIENTS_NOCODE);
+        return 0;
+    }
+
     dbitmap = g_malloc0(sizeof(*dbitmap) + sizeof(*range));
 
     dbitmap->argsz = sizeof(*dbitmap) + sizeof(*range);
@@ -1409,8 +1426,7 @@ static void vfio_listener_log_sync(MemoryListener *listener,
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


