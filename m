Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D52D9691135
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 20:22:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQCU4-0004Fy-D1; Thu, 09 Feb 2023 14:21:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pQCTx-0004FN-GQ
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 14:21:21 -0500
Received: from mail-dm6nam12on2060c.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::60c]
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pQCTu-0005Qr-Dq
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 14:21:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Skg2OO2D8UpImb1RatdFS7tS27dTVIHfqknaApR8W6Id6jBycYEZvezKLVqxkKUEUg0MYiREhpj8/7c84Z0KNq0yTQFY1g0fxy5jIkIIS7Nkd5CxEkbKx/dQqpLh3/eQoneD0757kYOqHny2eu7qnHfmFZioaRAFOaSVfLlOCcnptphIBBH9KLtPPXbOIvHF8iVP8XGDBg4P+lG/j6RRLaTyqBV2sughyFkzsfmotMD+DpeqS8W4gaytkoYpzTPwVAe7l1r9SoNj0ngRaTGF0jQSg1fzsdKvSRh0/DrN0SRyHfyF4swDA1koiJnz/BiQKORbOngad3CEjptjfsHsKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gk/qe5dT0khLXSeOtn31D9wpPF7OcWj/lLnUNbI007U=;
 b=Zq6hrDLULwcm57KzOCuHqarWr6rlP2NFLaZO5IjJ5+z4+15DDn1+c+E0PqdZAm8jbmr0hhrsblb4opzfXO+DAs3O7hUN2ICOeSoaRF2Wg8BC0vyrtNEyRuLwqBMQURzMAs6JEPB607K5LFBKD9yAbCiy6aRaULtkVrQJGTRqN8wovY7v4B4F6GXXWsySSFOnujw01Uq2L4timlW2JDa3lr6WM1Hs03Ht//bAeC3RZvEL3QG5k1aB2esv12BUPFzfl05rPugXBFrKB8H+OMYPnARB808a60M1dF3dtg5HeNxjifSbUOKtxBRhlMlSgvrLhMe96bfPRc8ixsn0iHaqHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gk/qe5dT0khLXSeOtn31D9wpPF7OcWj/lLnUNbI007U=;
 b=MaJZmSCNYnI9MaNIQhZ9toNsw+5qSgRO7k+cvtvH5qvumRfmKJkLs6igWYWoUrZvMgEKnn64ed9L965DkPYdutQ6tgLF/cs5GtDNO2jjJq1vnqjrRGZ7evzjSHn1EIzNiIqO5JPOmWx83ntS5dahSn61R9lDMag/jftsU9XeYVmz2IPhDXblJLVEn2GK/s5kXb7MCB/GaGn+HnrPgS6xAecqnI3CKfFUZTY8amKCGuqHiXafBtO76QX9Z8QLhcVrx638A4jcWZGnFAHXZsb8U/itbWAUGlSYFY/9MMkKGquFX/Ly6kg+BgHdcCbDHEhRLK/Lh7MEgDyF3ZX1gmLH8A==
Received: from DM6PR02CA0065.namprd02.prod.outlook.com (2603:10b6:5:177::42)
 by DM4PR12MB7693.namprd12.prod.outlook.com (2603:10b6:8:103::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Thu, 9 Feb
 2023 19:21:13 +0000
Received: from DS1PEPF0000E634.namprd02.prod.outlook.com
 (2603:10b6:5:177:cafe::f9) by DM6PR02CA0065.outlook.office365.com
 (2603:10b6:5:177::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.18 via Frontend
 Transport; Thu, 9 Feb 2023 19:21:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DS1PEPF0000E634.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.16 via Frontend Transport; Thu, 9 Feb 2023 19:21:13 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 9 Feb 2023
 11:21:01 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 9 Feb 2023 11:21:00 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport;
 Thu, 9 Feb 2023 11:20:57 -0800
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
Subject: [PATCH v10 03/12] vfio/migration: Allow migration without VFIO IOMMU
 dirty tracking support
Date: Thu, 9 Feb 2023 21:20:34 +0200
Message-ID: <20230209192043.14885-4-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230209192043.14885-1-avihaih@nvidia.com>
References: <20230209192043.14885-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E634:EE_|DM4PR12MB7693:EE_
X-MS-Office365-Filtering-Correlation-Id: 942ce006-fb38-4036-dbef-08db0ad2cee8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hQrrexPdOePEkNWi8w9ATAlMU1meE5n7wUkqrF9nZTfI7gdmuavyL7kk+nwaMoGaEkFTzWci561fcb8m47PS0n4uew9PPIXE10uVKv3ZoFCN5lPn5VzFfUZV8uQapOmFHk7JBNfAYPK6uMbVFrUgjY5iBRd121s8qRmh7MvDbkozwj3YhqntL/33oFlMJU6gdzr4cAvJZdXErspmuUe5Nzb410K7eL9y0aeIP40JyHxOYqWM4nby30D4biWWvfAu4rToYedzBrdIRaey+Egw2SCxdEyvyReSdIZlco6TaoAUPQkq7oUEPVqbL4b+0FziEODFEgCd50/xZzHN0bbNPAXAcUxBYUUj0XET5wPrEDMRu2nFJplbEk9lWccDXSJ1RkyTItiLgmZmRTo6hwkZssijFESlp54RTaMEmV0yTagkj3XAHxZ0QtW0jiVecrjIEtZ8VL8tVjpTJv1HLfeZscyWoRWCAf+3p+wtgGa/i9MU9d2fhPYgPDaYwnPc1674lFmIqKgS5GAe8aXxptY48VSyeji4Z7Ey4nZ9ppegl+qHWNDGYvV4pfOnqKv20gVjHDItZl6oZANpTJMv61xnXM5Wyeuhh+irGLd41j01J6cwuHB9T18Q/SVscaYxw+Qf2h7m3+ibD28QLyaRv9ugJMiHB96ukSW9qA5M4UEMtt4MUjlhXY6GIfFs+6ZCagwrSCuGYtbmA2obfsme+eU58JkarZuI1Xmmk/dQlF/Qw4mZEbUyQas4vInWgiDz5I57LhsKxSndwQdlsERXmWxkWkD1c6GZt3kDYwyRKwim0CzPegC6gUZj+yHx3/6oI9on
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(39860400002)(396003)(346002)(451199018)(46966006)(36840700001)(40470700004)(40460700003)(86362001)(41300700001)(70586007)(316002)(8676002)(83380400001)(54906003)(5660300002)(6666004)(478600001)(8936002)(4326008)(70206006)(6916009)(1076003)(7416002)(26005)(966005)(47076005)(7696005)(66574015)(336012)(356005)(426003)(36756003)(40480700001)(186003)(82310400005)(7636003)(2906002)(36860700001)(82740400003)(2616005)(14143004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 19:21:13.2427 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 942ce006-fb38-4036-dbef-08db0ad2cee8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E634.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7693
Received-SPF: softfail client-ip=2a01:111:f400:fe59::60c;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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
index 02db30fe8d..c9f3117986 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -861,11 +861,10 @@ int64_t vfio_mig_bytes_transferred(void)
 
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


