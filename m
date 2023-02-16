Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1474699795
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:38:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSfNo-0003Rf-Gu; Thu, 16 Feb 2023 09:37:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pSfNh-0003Bg-2I
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:37:05 -0500
Received: from mail-mw2nam12on20623.outbound.protection.outlook.com
 ([2a01:111:f400:fe5a::623]
 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pSfNe-0004mj-NY
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:37:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WL0NS1KZ+7iEz3caJZ5b/dB3yGC/fJb572Cs5LqTlTdJ78wdj8B4P4f6bvKYA/x703x9s3T3ubgQGiOAoAxLvbcUfV7BDOrzLrevisj3hpLSCSkZE7ecI6TdlqeazJ/ZGusa7Lq0tvjvDwRFDRBLqwG97GFwP+Y+TefXapTf0a7q8083/WQ+e/5HMYvyxyGMmxTHrtYIHz+l8P4W+u/uoTKVMMT0YCGfwp+4yXZpx59ZVqOHvBJ+dKq9HYdzcWi9fDdZDedtbDAevVNdJObGbnu8+EIOg4DaT5+N7xWgSsFUJUJOv+wuJ1Bg5qUk7HJCu/GcxH4qsUvCO1W74FYWzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBIrjeWbEJyAQj9fYLdsV3v2iH9pz28HhXhBGY0VAdg=;
 b=j2Cu6NCJtA8uHDMxFnY7cSg1clzH0m6Y6si8DKyt5Zkt9IN29qWb7wUGUYTp/selc3imDajoqWMOI41NlX9bFbxmo3qBKyZta2bvKnSfMcuxj28sulSK2s2tdTL8kR2ftx0MqX00baw5jYYEqM7ohYxCS35CoWi8uulqBUMR3mP0ugtxJOBNfn8BZN+zR0uw/Pw2Xc2K8xD+stqQUOwJERlBD/ONLD5rah9+fpJI5wuJjrh8w+ozl1FP5r0Slcv+yxshJMAjjjx5tym3N2j1mh7k6Sg0fhPda2nYqQQ1d/uKsrDcueEGjM1A161aND9BLj9enn606Ix0zbynPzrygg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBIrjeWbEJyAQj9fYLdsV3v2iH9pz28HhXhBGY0VAdg=;
 b=kRkx9th4kSxvtbVj+/yAE6SbYMyV3zx+zGa2LwngRnZXrahcyfBYHvdGunMwlVs0Uj8w7T5WjOzuYoBEOAXXuXc7i31/uN+gcyHmaHTMwgR1VmAMY0YS1gScJdKSnwmVoxU28dpYtacy/qoN7AwOOwwpVfx5iHvbmhI2WzksEBQ102luunKScsr7oXDonDcIsDHoJVy8aVtZxa45CCNMypxW1IXyVE29glb6NaTZK0MPFZZwpopj6pEeWRW4l6EONxDFzsxw+DQ0TmlSEq4ZSf4IfzB17LMcnk7gDzHkWYwQ1ft1EydFHKb44YfQXcwtwbtdQ6hraM7udPUTXhUYCw==
Received: from DS7PR03CA0166.namprd03.prod.outlook.com (2603:10b6:5:3b2::21)
 by IA0PR12MB8254.namprd12.prod.outlook.com (2603:10b6:208:408::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Thu, 16 Feb
 2023 14:36:58 +0000
Received: from DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b2:cafe::8c) by DS7PR03CA0166.outlook.office365.com
 (2603:10b6:5:3b2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13 via Frontend
 Transport; Thu, 16 Feb 2023 14:36:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM6NAM11FT053.mail.protection.outlook.com (10.13.173.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.13 via Frontend Transport; Thu, 16 Feb 2023 14:36:57 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 16 Feb
 2023 06:37:44 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 16 Feb
 2023 06:36:50 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Thu, 16 Feb
 2023 06:36:45 -0800
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v11 03/11] vfio/migration: Allow migration without VFIO IOMMU
 dirty tracking support
Date: Thu, 16 Feb 2023 16:36:22 +0200
Message-ID: <20230216143630.25610-4-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230216143630.25610-1-avihaih@nvidia.com>
References: <20230216143630.25610-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT053:EE_|IA0PR12MB8254:EE_
X-MS-Office365-Filtering-Correlation-Id: 06d515e1-261c-44d6-e7e3-08db102b4204
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f/9XH0WacUkcXBPZ5Pj8wNWu/6TArpansnpnBdvyirTq0lZBkeqB1KbQ4RTFFgOC08Ud4MLcfAfXfeCpRoSizEPIwsbkerzzYT86reCQTySyJTkaQjhLdyuHUgCSX8G0Pcmp89Ac5Vj0B7iEnbeLxGR64PsHnNemtbKqBbVqvNVsEk6B/MuEZk4UTk3CjC+T7qP6lFxQND9AY3zKfeJ7dqokSim3JfBwQsq5GFN1ZY50TTlX2rFkjwHGEdEY6dR6lwsENiIi4DKuTv2EPVWbyzy7PORcVs/xoOR4Nt+Dm+ngTBRFKGHdHpU9LMOQSrTVXawZXtHn1GozPHyXNWuprSoMWppryCcR1rbpgdRMvFp+MDnv55veouWB3Y3ch3cyJFFw69nOpRR+FVro4n3+TPhaMI8+eHLK7Js9UunNgpuMHk+5c0ijgfHm0yahXMH92SnxWIUGp34Y/7RqNCmbzcI32lOirXnJFlOJ6IQ+n6IAKqt+9NS9UefthjlPjLFVfEAwrl8CLUHO5aDvGBalnnNT3ZMSnmvo/3tnmWGMmC5R/pdcSgrWReIdk7DuPgoweESE1xGY+LJF96zriTYCYGD3a7lazXye6H9mod4eHfS9/t8paojbclz5K+6EsKD9ltYkx/efoODdl6GQD3x9/9XClNk5R/fvjkbNP+wKlKj/HsMYjGYQ5KtzbqkQ1dGuKghON34n7rmG389B1WcmS6oP4mR6e6kelBY14n/99hTcpFCVankvYftQnBP6GJy4TPNiIvvWeJOqjK6Q3DXz1g==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199018)(46966006)(36840700001)(40470700004)(7416002)(2906002)(86362001)(2616005)(336012)(47076005)(66574015)(426003)(356005)(40460700003)(36860700001)(83380400001)(82740400003)(7636003)(54906003)(316002)(5660300002)(70586007)(6916009)(8936002)(8676002)(4326008)(70206006)(1076003)(26005)(186003)(36756003)(966005)(478600001)(40480700001)(7696005)(6666004)(41300700001)(82310400005)(14143004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 14:36:57.8906 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06d515e1-261c-44d6-e7e3-08db102b4204
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8254
Received-SPF: softfail client-ip=2a01:111:f400:fe5a::623;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
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
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
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
index 65f3f3bef7..e56eef1ee8 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -858,11 +858,10 @@ int64_t vfio_mig_bytes_transferred(void)
 
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


