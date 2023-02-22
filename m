Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 341D069FA6F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 18:51:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUtGE-0000S9-OZ; Wed, 22 Feb 2023 12:50:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtFy-0000KX-Lw
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:50:19 -0500
Received: from mail-dm6nam12on2061d.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::61d]
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtFv-0004UQ-O2
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:50:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nEfx5tTL6TA4yhJsxT1jZjLO2ow9YmGjdjcIp15xDVEHalXvq/G0noD1lWu14fiLfwteP80N5oVxzcXANihdH/Wd5qBD3843v8G5cys2NvLVqanaJ7P2jLKbZywt1aosDUSYw9LRB1dWUWoJzKDUjnlIQF8B/tgjINjkOWJFpUXWbhwGwrlO3rqiPKc4oRxV+3S5r+nDYYNBf4B9pLF69z8uO6ZQzPHbaLMAseQdCWsrdOFt6fk4kRGFU7Sycd85W5ma1L+6ovlcp/4x/FFq7FGeLE3n/AYV1NFl5Evqi1WahEYbKDuA9FKDDoUKwR4nuknQ+NIi490ZMGXIu6AwQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ouPy+EY7bDasn4WSDeDPlkIuxUqS5DN9vVo7w77Qn/I=;
 b=TibvKYuFyKxs1lwnlGNzcb0RzA3G/72p9c52QNwgY0mqrcaZrHcTu5lDmQA8MY+1NgQANa2j+xwlCWSI6DfKGmF3IfwkPPjW2ka4S+ZTBT/W2hwBqSfAC4UBkINdHWWj7oazE7fLXXJcxUHxUapG1L4xcvUIQb+mQcrLuOtrVftHetLSzNzhzhNdmWwyRgtvm40Fv+OQek6eSM6SxcAddc+h0BykwkMVMY+oA9ot3GrkA90I9YPiConChRIFhUPi9HwZMm28poeIOAQKsxYX7sMjSkt8vsb4q/4jP9ri6EJcEimRSBa9mFySbfV++uvT8pV0+a9IRbUqdJz68HGHGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ouPy+EY7bDasn4WSDeDPlkIuxUqS5DN9vVo7w77Qn/I=;
 b=pWNiqI55PGG3yO5EQIMJUidsLViRd/LNkOML/Be+ndMOFCMDVxtNwO5GqvzR4moBigRpvGvPY3SKYk+V+W83LlITomjUB3RLpvZaLK9u1y3iDGPffXld4WeKnCq8gNg4Q75GxYQnUGYIVPCrcYKPmBGxmxfOwX+nCkjNMH1PjgmyT1NEFcX6880cfKLKxMqSQ2PeXHwe+N/vNtyWMmFIlN6NXb/weuZ5U1G4aWTY9e0IVWD5PNposZqg/1OUqv54waYwgXZHZp3XAQM54kychrrF3yoLSEjPjx+lmdSikTO8f6sFBsGAUzYDQ/vIc40n5muNLX1I7EV4GPiBjF114g==
Received: from BL0PR02CA0012.namprd02.prod.outlook.com (2603:10b6:207:3c::25)
 by DS0PR12MB8575.namprd12.prod.outlook.com (2603:10b6:8:164::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.21; Wed, 22 Feb
 2023 17:50:11 +0000
Received: from BL02EPF0000C406.namprd05.prod.outlook.com
 (2603:10b6:207:3c:cafe::aa) by BL0PR02CA0012.outlook.office365.com
 (2603:10b6:207:3c::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19 via Frontend
 Transport; Wed, 22 Feb 2023 17:50:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0000C406.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.14 via Frontend Transport; Wed, 22 Feb 2023 17:50:11 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:49:56 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:49:56 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Wed, 22 Feb
 2023 09:49:51 -0800
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
Subject: [PATCH v2 06/20] vfio/common: Abort migration if dirty log
 start/stop/sync fails
Date: Wed, 22 Feb 2023 19:49:01 +0200
Message-ID: <20230222174915.5647-7-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230222174915.5647-1-avihaih@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C406:EE_|DS0PR12MB8575:EE_
X-MS-Office365-Filtering-Correlation-Id: 7db32cb3-f4d2-4409-f5f0-08db14fd3e9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x6nXQ6YiJ+71F8JpKjvhoQpuv5HfP0oOqVTtwJ+DzmHwlLgQSkfpQ/FKM/rjbFJ7vZO/K5XsCYCD3pJOy5FEw9e/F+Zdke4tQakEn8HxI6ve9aKuJ3q8VqGUb1r6oLvKs6wketr9sSiY792QY5X523ntEEmhC23YiWOhAVV5FJ0k6ef5XVVfns/EUs0Gw1ArJyx/3MXoajswMX9Db/T0N540dGdnKAys8pKPC6Y/8vC1c4quSuLLHO8DXmh1rl5bJdKv9SCDFZAY4Yg5NRZxuvQrJUxbG+7GrTqzxdq38fmkUbDxEqRpIId8TrpA/UiqYbBwBmdqhvyzwT2pEm8lbHj8b/ZU6ne0HROvcylrpPqolaiioYZq5pK95Dvb68FWN/sDJ7cfLhnLP63ETxPCjyS2+ZF6lXX2i7R11tZvWoJvAI4xKF7H9L9yQS7eBUikusTGZbabG1C+Cq9coKwVy7hw+qXSQLwu9olpT3yz296z9Hq4tMP5dP2/O9ZagKpz3syUsI/2RX7v7rzURSGeC+Y1+CZMkijwHv6M00rPJzg1L124e5mBkNVD67l+/wOP5tuHDC2CUNqhTNCB9+/kuYRDmglgTltSiDVmdPOt4cK+aQ3LyZ5QYFA9Ssua3I1EAWSB5n1jHUQTdQOkwr9x4Yr+2C915zVIFgoMaZDOvolxgsxewQVzx2/y3EuV21760c3BBYv6fq+nbde415JHPcf80vPvAL+VcRGqdHwfI/Q=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(39860400002)(396003)(346002)(451199018)(40470700004)(46966006)(36840700001)(41300700001)(5660300002)(2906002)(336012)(7636003)(36860700001)(83380400001)(40480700001)(36756003)(54906003)(4326008)(6916009)(66574015)(2616005)(426003)(47076005)(82740400003)(356005)(1076003)(26005)(6666004)(186003)(316002)(86362001)(40460700003)(7696005)(478600001)(82310400005)(8676002)(70586007)(70206006)(8936002)(7416002)(14143004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 17:50:11.1134 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7db32cb3-f4d2-4409-f5f0-08db14fd3e9f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000C406.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8575
Received-SPF: softfail client-ip=2a01:111:f400:fe59::61d;
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

If VFIO dirty pages log start/stop/sync fails during migration,
migration should be aborted as pages dirtied by VFIO devices might not
be reported properly.

This is not the case today, where in such scenario only an error is
printed.

Fix it by aborting migration in the above scenario.

Fixes: 758b96b61d5c ("vfio/migrate: Move switch of dirty tracking into vfio_memory_listener")
Fixes: b6dd6504e303 ("vfio: Add vfio_listener_log_sync to mark dirty pages")
Fixes: 9e7b0442f23a ("vfio: Add ioctl to get dirty pages bitmap during dma unmap")
Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/vfio/common.c | 53 ++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 45 insertions(+), 8 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 930eda40a1..ac93b85632 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -42,6 +42,7 @@
 #include "migration/migration.h"
 #include "migration/misc.h"
 #include "migration/blocker.h"
+#include "migration/qemu-file.h"
 #include "sysemu/tpm.h"
 
 VFIOGroupList vfio_group_list =
@@ -390,6 +391,19 @@ void vfio_unblock_multiple_devices_migration(void)
     multiple_devices_migration_blocker = NULL;
 }
 
+static void vfio_set_migration_error(int err)
+{
+    MigrationState *ms = migrate_get_current();
+
+    if (migration_is_setup_or_active(ms->state)) {
+        WITH_QEMU_LOCK_GUARD(&ms->qemu_file_lock) {
+            if (ms->to_dst_file) {
+                qemu_file_set_error(ms->to_dst_file, err);
+            }
+        }
+    }
+}
+
 static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
 {
     VFIOGroup *group;
@@ -682,6 +696,7 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
     if (iotlb->target_as != &address_space_memory) {
         error_report("Wrong target AS \"%s\", only system memory is allowed",
                      iotlb->target_as->name ? iotlb->target_as->name : "none");
+        vfio_set_migration_error(-EINVAL);
         return;
     }
 
@@ -716,6 +731,7 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
                          "0x%"HWADDR_PRIx") = %d (%s)",
                          container, iova,
                          iotlb->addr_mask + 1, ret, strerror(-ret));
+            vfio_set_migration_error(ret);
         }
     }
 out:
@@ -1261,7 +1277,7 @@ static void vfio_listener_region_del(MemoryListener *listener,
     }
 }
 
-static void vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
+static int vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
 {
     int ret;
     struct vfio_iommu_type1_dirty_bitmap dirty = {
@@ -1269,7 +1285,7 @@ static void vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
     };
 
     if (!container->dirty_pages_supported) {
-        return;
+        return 0;
     }
 
     if (start) {
@@ -1280,23 +1296,34 @@ static void vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
 
     ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, &dirty);
     if (ret) {
+        ret = -errno;
         error_report("Failed to set dirty tracking flag 0x%x errno: %d",
                      dirty.flags, errno);
     }
+
+    return ret;
 }
 
 static void vfio_listener_log_global_start(MemoryListener *listener)
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
+    int ret;
 
-    vfio_set_dirty_page_tracking(container, true);
+    ret = vfio_set_dirty_page_tracking(container, true);
+    if (ret) {
+        vfio_set_migration_error(ret);
+    }
 }
 
 static void vfio_listener_log_global_stop(MemoryListener *listener)
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
+    int ret;
 
-    vfio_set_dirty_page_tracking(container, false);
+    ret = vfio_set_dirty_page_tracking(container, false);
+    if (ret) {
+        vfio_set_migration_error(ret);
+    }
 }
 
 static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
@@ -1372,19 +1399,18 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
     VFIOContainer *container = giommu->container;
     hwaddr iova = iotlb->iova + giommu->iommu_offset;
     ram_addr_t translated_addr;
+    int ret = -EINVAL;
 
     trace_vfio_iommu_map_dirty_notify(iova, iova + iotlb->addr_mask);
 
     if (iotlb->target_as != &address_space_memory) {
         error_report("Wrong target AS \"%s\", only system memory is allowed",
                      iotlb->target_as->name ? iotlb->target_as->name : "none");
-        return;
+        goto out;
     }
 
     rcu_read_lock();
     if (vfio_get_xlat_addr(iotlb, NULL, &translated_addr, NULL)) {
-        int ret;
-
         ret = vfio_get_dirty_bitmap(container, iova, iotlb->addr_mask + 1,
                                     translated_addr);
         if (ret) {
@@ -1395,6 +1421,11 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
         }
     }
     rcu_read_unlock();
+
+out:
+    if (ret) {
+        vfio_set_migration_error(ret);
+    }
 }
 
 static int vfio_ram_discard_get_dirty_bitmap(MemoryRegionSection *section,
@@ -1487,13 +1518,19 @@ static void vfio_listener_log_sync(MemoryListener *listener,
         MemoryRegionSection *section)
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
+    int ret;
 
     if (vfio_listener_skipped_section(section)) {
         return;
     }
 
     if (vfio_devices_all_dirty_tracking(container)) {
-        vfio_sync_dirty_bitmap(container, section);
+        ret = vfio_sync_dirty_bitmap(container, section);
+        if (ret) {
+            error_report("vfio: Failed to sync dirty bitmap, err: %d (%s)", ret,
+                         strerror(-ret));
+            vfio_set_migration_error(ret);
+        }
     }
 }
 
-- 
2.26.3


