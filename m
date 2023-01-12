Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B30F666D05
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 09:53:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFtJe-0005uy-Vw; Thu, 12 Jan 2023 03:52:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pFtIq-0005gI-H0; Thu, 12 Jan 2023 03:51:18 -0500
Received: from mail-mw2nam12on2071.outbound.protection.outlook.com
 ([40.107.244.71] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pFtIo-0007Z0-9m; Thu, 12 Jan 2023 03:51:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wif2XM9MIJ96/j5ILHMek1fbW0nWBWjiB2yizOnG6maLNPkGwz8jNaY/ndS6X+qapgcp7AV0bRW0h8uvCaAWSHVd4H76ee1YtRAvzvjOkPjktpLW3N4XMOdiXpZVPeS4wAP6xr6sDjDIez15/35jYl40Vt++Y1RqZ5PNuDuY4WFT0Ds+LmKiT3oV5JIZRzEwMoKbZA27enb5I2zGdI3SBDP9gsGfWWATvsn5936jdFU7WH0OYEDfwD7gW9sKpQKaHgrfhPzb/XEGWnMVK7kgiUIIRQG4iQxI8Dy1rodoWxg8baUmjE2SnjZ23jxSrCtYpQk+msW294Engizhpr8Njg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BaJ38liVsUzOA3vHwYlHsSh8cwLPTulKqyW2kq98Nxw=;
 b=D8Wv2lm7BH9mvtJc0QS6mgybxQQidsiRND1JkgluF5M+M9xQkA0FBKKDs+PJgd8C8Eqix1ZzI2/8/OEcQX9qT6BijCWue99A1878FOLhsunRske/OvxhxN9QiuzS/No0syAf8fLSv0THIZLBdfxaJO2R6rxfoVAJ+PObFKxtNhs3/zLJ7uXjQ2QpoFbopWQHKMqOvixlckul36kXxXSec/nCbLOuNVc/RCecH2s+VFFTuRqwBMy2z2N3qwDHpRyIkGE3VoJnHJN5t7/4l+Te+azmqkz5o3r+/rkJnPSOUijav4nNRBXB7ErkwyXoJ18mn4aioqQrTeNfmvcCc3s8DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BaJ38liVsUzOA3vHwYlHsSh8cwLPTulKqyW2kq98Nxw=;
 b=pBBdDaislFyW7BRIryI86xaEkd+dthXbUYFlDI/cwmETgHqGe5d4/HjOaVex5pNDvBYBq6jMPLWuGcxyHMQ3kfjRqNpUxzZhpYacqKoCP0cb3aO97YgOpqIIj3ue9jVYKwr7TmHqtsdgLOOUK7cdMlXlE+aEdAS7qBDBPgd4+xIhPW5J7EN75p9wQSGNBmspFUOepSS6Mure2dDvD2TMfSTpECjDYmC5GsKruYHJfxcrwZti6KusZpXQWTCoS22M1bzRFVSlAUXRX6AOhLHIzbtwbOtCl0SEvD/A7DaV7NUgJ2tyqkh9WUz0HhO4PlBDt3Oj7LEW0Ed9dJ4ALRlxcA==
Received: from DS7PR03CA0016.namprd03.prod.outlook.com (2603:10b6:5:3b8::21)
 by DM4PR12MB5086.namprd12.prod.outlook.com (2603:10b6:5:389::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 12 Jan
 2023 08:51:08 +0000
Received: from DS1PEPF0000E635.namprd02.prod.outlook.com
 (2603:10b6:5:3b8:cafe::73) by DS7PR03CA0016.outlook.office365.com
 (2603:10b6:5:3b8::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Thu, 12 Jan 2023 08:51:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS1PEPF0000E635.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.11 via Frontend Transport; Thu, 12 Jan 2023 08:51:08 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 12 Jan
 2023 00:50:55 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 12 Jan 2023 00:50:54 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport;
 Thu, 12 Jan 2023 00:50:48 -0800
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
Subject: [PATCH v6 04/13] vfio/migration: Allow migration without VFIO IOMMU
 dirty tracking support
Date: Thu, 12 Jan 2023 10:50:11 +0200
Message-ID: <20230112085020.15866-5-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230112085020.15866-1-avihaih@nvidia.com>
References: <20230112085020.15866-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E635:EE_|DM4PR12MB5086:EE_
X-MS-Office365-Filtering-Correlation-Id: 674d9225-07dd-47ef-8ace-08daf47a25b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6z2BgzP6ENhGTdUD7zkQfi7oGdEDH5N1T2+tlBIpmdsrfHEY/PuDj94g1f0KOoFyKw3NhALxvPxTUPbWVcQ6/2j3pP2opsiXHAvO78OrHu6fR1ZF82fvhwcuEsrkd+9GU7/Y9ahHpnbjwD11zgMkSA2mh9rY+iap/Cwu6WHMwGyEqY+v1taO875zdV8BlIpuQcg7/YVFvOq35k1WwHrDVbZJHtKcMis8Ey3tkCoZVlTjYyAHSk/aUYa+E4UCu/Hw4qkChMbYm7ZHC6oYEAkrYMwD9QWbD669wif0UB+XsCOGwgloY+UJU03gF7fgOw5oYIqcfpqoOrP96H9hghMFtknTSJ1EIi792L3r8HRTQO4spzsCE50A+ZMQlZcn9ncr1B3Urw427znJpEokVjjB8hje5owg+45Pz0pTz+ooPjutax7b1hTFPBmeI3z9Eip8k0zDAQ48MIIyg0NR3xCtxnisR6rQImgOy1thOWTV8SYtaT08sGzsBjRx4y0IlqNh2Vvwfgtpw0MaG2pJFYt/SovR85830FVRF97qGONtD1Gex7O27qRXKM6L7nLOSibE5LgfwSfkzgheDoJ1eYgQJKh26oB8l/ohBztS14HbypieeIySZQKVv1Fe3eudBbeaHzvXvbxSm6LFvcC/3muw+feE5Jwjqcz0MKWOhE00fozRn2uKQ9QzPjoYjWjfrpTmJyxO2RoJ39O4iS/11e8KOvB+5JdqiYkLAjCEM/2w355g/zIMJgLgByhH8Pp9BF2T8FEBQ2+7NnaParb2PcW9uaitSMVwR+5/AdWhgmKshSCQHKwnhLKXA31YFywtB0Kg
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199015)(46966006)(40470700004)(36840700001)(82740400003)(478600001)(426003)(356005)(966005)(7636003)(47076005)(41300700001)(1076003)(40460700003)(86362001)(316002)(54906003)(2616005)(70586007)(26005)(336012)(40480700001)(186003)(7696005)(82310400005)(4326008)(36756003)(70206006)(5660300002)(7416002)(36860700001)(2906002)(6666004)(8676002)(6916009)(8936002)(83380400001)(14143004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 08:51:08.0847 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 674d9225-07dd-47ef-8ace-08daf47a25b6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E635.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5086
Received-SPF: softfail client-ip=40.107.244.71;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
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


