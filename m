Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 950BB69FA7B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 18:52:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUtGi-00012g-76; Wed, 22 Feb 2023 12:51:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtGW-0000vm-U7
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:50:52 -0500
Received: from mail-dm6nam12hn2030a.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::30a]
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtGU-0004dp-2Y
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:50:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SF7jjATkpn+akOIF1fw4Vrr3xvfgReJ0AQ33fm3vm4voj1Q6JY/NQWqjCysk9kps1M88BrmRrTmPW089vS2sEm/MkjUgXcLQW5U+6TMfjDqWBV41DmBlrKu2dp63D7TwtWv8lQjjmXvbHkm7va2dz55JZX9cw+uTNT8+PkluvOl7OXZmLXKI/6YvKD5VjiRCuROdqfSHwWijZ4Co4bfrouEFqXcF6mgUsLRW95JJjzjdrF4HHJZmeYi3onhRzaKXGryZOwJlWJFtY13Gu5NjHMaqxaGJ0JL3Q6u0kUZ1ygvN8eDDwkeWyxJvsVHzPlVFIQrKYsm0pAehxvxu/qn7FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8w7zw2ymiu/KVwZjfJB71BuHrNJxdSTywyvrDCDXxlM=;
 b=LrvK0xWMS/8pl45hyHHB3OEvwWZtyHdAy6/xGby8OoD5FZXY34uoCNfPUJCyiKoWYyeFyUUkUIo68Nqs6i4jCD5+awCYCbuJjpCVjoILa4n0ojqXE0AYOA3qZcKYXOaLcvxv/PQXvJm6+sX9U+sF3vQmI07DaEBVsowe5z10z+qpf0H0sz3nvT1S/s0FxGuOI20m0LrVh+BAJsmB/6rWn0kyA8D0EwNEbnseOGku+c5b21Lfg5v2ub6bAsrrftgZgFxS7ZlYqYwsmbeDYzNLG+vxVHeaRNLCx+zuoE6+9xB13g+5JXe9nbtmjsWPWpGQGQhghONITzfFDUInz+EAWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8w7zw2ymiu/KVwZjfJB71BuHrNJxdSTywyvrDCDXxlM=;
 b=LQCboAaqEUqsao287Ewsag8Lt8srn7mELF2pRATXxyflRRbjKawiMYCThAnPTlSLnJI1HRIm3d/PhLpiRxfNQNWl7pGUEiAvvX+IFPJdF2Ce/S9WR3/Dj/9HNB3BRvmZZEeak44dpYrbXushyM0pk6YZPX/gSvCnNPEDVnqTuLX5p4q++wCP6kqo3B/Z4X+4KulzHmspF6QsW4Duj8Nz9vUZ6hMZ+C9ZmiMzvIfeXqGLjqwrDXmFU0bHq2wjTz9ZdLHpKCc6S5YVttKrYYFl11xxx+3rzHv/1a3hCLZ6d7EB368QHeMUXpw4AMRR3wAXPxal/FEEQVrtuqU1RSkXCQ==
Received: from MW4PR03CA0234.namprd03.prod.outlook.com (2603:10b6:303:b9::29)
 by DS7PR12MB8321.namprd12.prod.outlook.com (2603:10b6:8:ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 17:50:46 +0000
Received: from CO1NAM11FT087.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b9:cafe::48) by MW4PR03CA0234.outlook.office365.com
 (2603:10b6:303:b9::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21 via Frontend
 Transport; Wed, 22 Feb 2023 17:50:46 +0000
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
 15.20.6134.19 via Frontend Transport; Wed, 22 Feb 2023 17:50:46 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:50:20 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:50:19 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Wed, 22 Feb
 2023 09:50:14 -0800
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
Subject: [PATCH v2 10/20] vfio/common: Record DMA mapped IOVA ranges
Date: Wed, 22 Feb 2023 19:49:05 +0200
Message-ID: <20230222174915.5647-11-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230222174915.5647-1-avihaih@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT087:EE_|DS7PR12MB8321:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ce598b4-a8d2-47cd-8095-08db14fd53ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kF/hyc0NEpp/Lotia4M+cTQkKHw3Oeg3lc2RoG20Ajz0GqVAyPydIytrdnTt+pVtIXMoxqcrB0WSzcswCqsWi7CSUXJkdShakevtxWdbm+nvFbicnDQK/U9dMTqgACE2+O5cJD/yhCOosho6uNhDQxPnl1hBN/Exl+JIb6xcIGunXOgMIwGMra/23EjE+nf0TLOx/E/HZ8ZxwevJ3IOk9ES5Rkpd2mEjjJUnI13kgZaQCH+kjRHiX5tQ+bkn8Swt6P04hLq1AFhTky9FnTxOddAaIGYvTy2TrE/+y2h8XNWgVtng8jfusYHMgEuox7KT273kKRU0ygcMsUj63gVkQu8ElXBOymGRbsFtv6p7GP3gGE73m65DLuGqghjVn6Uzha5KEpKHvxBFuDzoj8X5WWcwQp1K0/VyyB6HRFNyWngRXF6+E43bVHcNbiRNwprA6p+lRvREtTM1k+uGhzloqbtfnbwK41L7Uiq9IBq4uH6Ztu05Ha6WQyA3zkGBFrexegtISLa0xTqAtPMbunWVeDgq2ljokaVNIN6MhSLI8k+dHYRFI1pgRpwcN8mWVjQMvJFb/FAIdQysDZS0driBzcUId8ccqlJlTFXWnlDwV6SrPGzGLoTj9mTYKjjCjBi0A9ep6nY5GFG94srNmPilVhZQnBgbZJRus25AZwFoj26hlK1E//weoQ8tvYE4DDdQNxg8oRKuDoVzUbU5FyD4PuEw5hkzV+TmJHIUlLyQ2PpTTGXBX1n7Szafo38bGv+NHhr+WM5jitkNH80SYGApxA==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(396003)(376002)(136003)(39860400002)(5400799012)(451199018)(46966006)(40470700004)(36840700001)(7696005)(2616005)(5660300002)(34020700004)(36860700001)(7416002)(6666004)(336012)(1076003)(26005)(186003)(54906003)(426003)(478600001)(47076005)(316002)(83380400001)(356005)(8676002)(40460700003)(41300700001)(6916009)(4326008)(40480700001)(8936002)(70586007)(70206006)(7636003)(36756003)(82310400005)(86362001)(82740400003)(2906002)(12100799015);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 17:50:46.4968 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ce598b4-a8d2-47cd-8095-08db14fd53ad
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT087.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8321
Received-SPF: softfail client-ip=2a01:111:f400:fe59::30a;
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

From: Joao Martins <joao.m.martins@oracle.com>

According to the device DMA logging uAPI, IOVA ranges to be logged by
the device must be provided all at once upon DMA logging start.

As preparation for the following patches which will add device dirty
page tracking, keep a record of all DMA mapped IOVA ranges so later they
can be used for DMA logging start.

Note that when vIOMMU is enabled DMA mapped IOVA ranges are not tracked.
This is due to the dynamic nature of vIOMMU DMA mapping/unmapping.
Following patches will address the vIOMMU case specifically.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 include/hw/vfio/vfio-common.h |  3 ++
 hw/vfio/common.c              | 86 +++++++++++++++++++++++++++++++++--
 2 files changed, 86 insertions(+), 3 deletions(-)

diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index ee55d442b4..6f36876ce0 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -23,6 +23,7 @@
 
 #include "exec/memory.h"
 #include "qemu/queue.h"
+#include "qemu/iova-tree.h"
 #include "qemu/notify.h"
 #include "ui/console.h"
 #include "hw/display/ramfb.h"
@@ -92,6 +93,8 @@ typedef struct VFIOContainer {
     uint64_t max_dirty_bitmap_size;
     unsigned long pgsizes;
     unsigned int dma_max_mappings;
+    IOVATree *mappings;
+    QemuMutex mappings_mutex;
     QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
     QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
     QLIST_HEAD(, VFIOGroup) group_list;
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 84f08bdbbb..6041da6c7e 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -44,6 +44,7 @@
 #include "migration/blocker.h"
 #include "migration/qemu-file.h"
 #include "sysemu/tpm.h"
+#include "qemu/iova-tree.h"
 
 VFIOGroupList vfio_group_list =
     QLIST_HEAD_INITIALIZER(vfio_group_list);
@@ -426,6 +427,11 @@ void vfio_unblock_multiple_devices_migration(void)
     multiple_devices_migration_blocker = NULL;
 }
 
+static bool vfio_have_giommu(VFIOContainer *container)
+{
+    return !QLIST_EMPTY(&container->giommu_list);
+}
+
 static void vfio_set_migration_error(int err)
 {
     MigrationState *ms = migrate_get_current();
@@ -499,6 +505,51 @@ static bool vfio_devices_all_running_and_mig_active(VFIOContainer *container)
     return true;
 }
 
+static int vfio_record_mapping(VFIOContainer *container, hwaddr iova,
+                               hwaddr size, bool readonly)
+{
+    DMAMap map = {
+        .iova = iova,
+        .size = size - 1, /* IOVATree is inclusive, so subtract 1 from size */
+        .perm = readonly ? IOMMU_RO : IOMMU_RW,
+    };
+    int ret;
+
+    if (vfio_have_giommu(container)) {
+        return 0;
+    }
+
+    WITH_QEMU_LOCK_GUARD(&container->mappings_mutex) {
+        ret = iova_tree_insert(container->mappings, &map);
+        if (ret) {
+            if (ret == IOVA_ERR_INVALID) {
+                ret = -EINVAL;
+            } else if (ret == IOVA_ERR_OVERLAP) {
+                ret = -EEXIST;
+            }
+        }
+    }
+
+    return ret;
+}
+
+static void vfio_erase_mapping(VFIOContainer *container, hwaddr iova,
+                                hwaddr size)
+{
+    DMAMap map = {
+        .iova = iova,
+        .size = size - 1, /* IOVATree is inclusive, so subtract 1 from size */
+    };
+
+    if (vfio_have_giommu(container)) {
+        return;
+    }
+
+    WITH_QEMU_LOCK_GUARD(&container->mappings_mutex) {
+        iova_tree_remove(container->mappings, map);
+    }
+}
+
 static int vfio_dma_unmap_bitmap(VFIOContainer *container,
                                  hwaddr iova, ram_addr_t size,
                                  IOMMUTLBEntry *iotlb)
@@ -599,6 +650,8 @@ static int vfio_dma_unmap(VFIOContainer *container,
                                             DIRTY_CLIENTS_NOCODE);
     }
 
+    vfio_erase_mapping(container, iova, size);
+
     return 0;
 }
 
@@ -612,6 +665,16 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
         .iova = iova,
         .size = size,
     };
+    int ret;
+
+    ret = vfio_record_mapping(container, iova, size, readonly);
+    if (ret) {
+        error_report("vfio: Failed to record mapping, iova: 0x%" HWADDR_PRIx
+                     ", size: 0x" RAM_ADDR_FMT ", ret: %d (%s)",
+                     iova, size, ret, strerror(-ret));
+
+        return ret;
+    }
 
     if (!readonly) {
         map.flags |= VFIO_DMA_MAP_FLAG_WRITE;
@@ -628,8 +691,12 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
         return 0;
     }
 
+    ret = -errno;
     error_report("VFIO_MAP_DMA failed: %s", strerror(errno));
-    return -errno;
+
+    vfio_erase_mapping(container, iova, size);
+
+    return ret;
 }
 
 static void vfio_host_win_add(VFIOContainer *container,
@@ -2183,16 +2250,23 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     QLIST_INIT(&container->giommu_list);
     QLIST_INIT(&container->hostwin_list);
     QLIST_INIT(&container->vrdl_list);
+    container->mappings = iova_tree_new();
+    if (!container->mappings) {
+        error_setg(errp, "Cannot allocate DMA mappings tree");
+        ret = -ENOMEM;
+        goto free_container_exit;
+    }
+    qemu_mutex_init(&container->mappings_mutex);
 
     ret = vfio_init_container(container, group->fd, errp);
     if (ret) {
-        goto free_container_exit;
+        goto destroy_mappings_exit;
     }
 
     ret = vfio_ram_block_discard_disable(container, true);
     if (ret) {
         error_setg_errno(errp, -ret, "Cannot set discarding of RAM broken");
-        goto free_container_exit;
+        goto destroy_mappings_exit;
     }
 
     switch (container->iommu_type) {
@@ -2328,6 +2402,10 @@ listener_release_exit:
 enable_discards_exit:
     vfio_ram_block_discard_disable(container, false);
 
+destroy_mappings_exit:
+    qemu_mutex_destroy(&container->mappings_mutex);
+    iova_tree_destroy(container->mappings);
+
 free_container_exit:
     g_free(container);
 
@@ -2382,6 +2460,8 @@ static void vfio_disconnect_container(VFIOGroup *group)
         }
 
         trace_vfio_disconnect_container(container->fd);
+        qemu_mutex_destroy(&container->mappings_mutex);
+        iova_tree_destroy(container->mappings);
         close(container->fd);
         g_free(container);
 
-- 
2.26.3


