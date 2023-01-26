Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F69E67D4BB
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 19:55:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL7LG-00050z-M0; Thu, 26 Jan 2023 13:51:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL7Kj-0004gh-JZ
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:50:57 -0500
Received: from mail-bn7nam10on2079.outbound.protection.outlook.com
 ([40.107.92.79] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL7Kh-0002oY-CD
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:50:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y7RTsDEHCnK4pTAomP5WhlYzDNLAu8Pm/TSgiAXmVIpsn6ONp3Zv3PF+T7Vzbpw4PK8PQ5a0yvp0mvp1JRlpJI3DpbBGDVzcq73VEccb+ZE3Ux/wXH649QUbD0uOFw3yg4ccNguBYcXVA9qO5Lv3XZhzsodWOFNZxo9TdGbRDdLLTHxI++nI85OPanWKqYmIWSWB1eXWxcN/b7a4VkdTdDs48zCe2XZLEVwN5u/mbf5ZDflSBKt9U+MQGweao3ysg/hLwtTHvBwpRZr+AdT9ZxCSZ52VeoKKy0dnwPl8JkOfvf6/Nas6f0oUnQVGrQ8qd/wNiesou8aMosl8mdHkUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHUZ5+DutMpYKJqRocWZ30J9p5qBIDWTIHGKUSpMLGM=;
 b=l/TvXyiT9FCtKwFanzthG3kJrOYyUWDQ+pKUajUTzOzmq39CFlJeCyK93ANDb5YOI+g7xTLZA3BeEYxlkQfXMj8yRf3kZpiQCHuhgcqmKf5sTCO2jcewXtzkKllfTf/hhUMJf4G7HQg1kdyB5whWyiZXKv5B49f/3Jbg97LHjDV2tMrvrp0EcRc61v8YR3PehpxVjY3mu2pgGSe7FqpyoubjeuBWJTHhG2sigcxrim/RaEyO6m0AwtWwIgCm14yMQ0lK/jOM//GPcWNL5hGzYwwp9zSOeSigOileROEljHZgyzBr2MIta7YsabXJFV8zYEILr7LR6t/DQ3CQE1rOZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHUZ5+DutMpYKJqRocWZ30J9p5qBIDWTIHGKUSpMLGM=;
 b=oemzGMmv0Qm9EnjjSvoagw641gBwRTCAvc7AgPvrH/EVsTwpCY/yeNr4rb6biv3NKa5/jEmYtZ4oy/C2hFcq7NlbbIYpbO5EyxOD6pBP2J9UeJM+s08nmrQlT1dSoDq/g57Uq586x+t8M+fwmsF694T2nnW8sPWEqHHAcBENxpkZddtb8eR+1EnJ2a/FfvX4fWfblPChfSBIldCYI47fvw2HQZ+5PgTHo3wS4AVNU9y2ODzt/NDxoM2SGLWoj9hd6T6pAW94AZ3pxU0WcEwgXf/Pt/z7Mxo8UgSs5dFxf9YMNuJUJaGAYt6d1pUmNSak43vZ49LO8D+mooaOQazCkg==
Received: from BN9PR03CA0784.namprd03.prod.outlook.com (2603:10b6:408:13f::9)
 by SA1PR12MB7411.namprd12.prod.outlook.com (2603:10b6:806:2b1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 18:50:42 +0000
Received: from BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13f:cafe::f0) by BN9PR03CA0784.outlook.office365.com
 (2603:10b6:408:13f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22 via Frontend
 Transport; Thu, 26 Jan 2023 18:50:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN8NAM11FT025.mail.protection.outlook.com (10.13.177.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.22 via Frontend Transport; Thu, 26 Jan 2023 18:50:41 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 26 Jan
 2023 10:50:30 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 26 Jan 2023 10:50:29 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport;
 Thu, 26 Jan 2023 10:50:25 -0800
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Peter Xu <peterx@redhat.com>, Jason Wang
 <jasowang@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, "David
 Hildenbrand" <david@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH 08/18] vfio/common: Record DMA mapped IOVA ranges
Date: Thu, 26 Jan 2023 20:49:38 +0200
Message-ID: <20230126184948.10478-9-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230126184948.10478-1-avihaih@nvidia.com>
References: <20230126184948.10478-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT025:EE_|SA1PR12MB7411:EE_
X-MS-Office365-Filtering-Correlation-Id: 26dec0fb-91a0-41eb-8031-08daffce39d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8bf51rHYnkc+FIxRYBK6X74DrEuwqrSNGZhPQe+FIh05AbvWNJfYhVTG4CpZ7W7SEvhTXnqpOeUvSftfKKnsCLBy40LA4MdaxwcnfKlfbZSL8jAXqmTwIy/X4e/YnSHQx4Uj7tfNUCnyqgytvSAIT8SujQsKMsoq2/UnPo8SlJo2UKeWrtlaWK6T2fBn1y0on+YM0auTLWstmvD5DT5da2yOoYBxRFUNmKQ3jpYz6WtMuuo6aW7e4n1v0af88ZvpErQxgtubvSEcEapjdIhUbI58nW6NcCndLhCB2K8mr67HIZp1kc73e67w3R7MikFEo5hC8XCWp+gOGsbcP/WLGDnXfdBimAxQgkNtDK3dEeaOH2OPHsCO+pK620jlVcJjaUdgaI+agjZlbWZa+leqHZF0X+K54SKH2qd6y6Ml8oZCPsie/9ppJypBWhsL+3i+p/ujD0Nix9f28GuWiN6if9NliFi28mFKv1LYKmz5ynsznlNp6oGBdhAsbOd4toabLe8awj9d0DHUv/Q0FhO7cGTUyCslkoA2d4iy3FU+8Yb9/T0mUkztDW+1cZhT3yA5TUKrGuL175xTDMYNYYmUgfVVYsqOilx0frNfX89jR1B7eqdqoqjVkk3IxmiVCrRcSdCCTffT0wFigJCz7BNJEizp8zP5oauKSfYDQBota3FRAQMQJmON4/f/dG6fbgl4KBtzs33I4bPu62chzpem5Q==
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(396003)(39860400002)(346002)(451199018)(46966006)(36840700001)(40470700004)(2906002)(5660300002)(356005)(83380400001)(336012)(426003)(7416002)(86362001)(40480700001)(40460700003)(6666004)(1076003)(82310400005)(70206006)(70586007)(478600001)(6916009)(7696005)(41300700001)(36860700001)(186003)(2616005)(26005)(7636003)(47076005)(316002)(36756003)(54906003)(8936002)(4326008)(8676002)(82740400003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 18:50:41.4855 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26dec0fb-91a0-41eb-8031-08daffce39d3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7411
Received-SPF: softfail client-ip=40.107.92.79; envelope-from=avihaih@nvidia.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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
index 88c2194fb9..d54000d7ae 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -23,6 +23,7 @@
 
 #include "exec/memory.h"
 #include "qemu/queue.h"
+#include "qemu/iova-tree.h"
 #include "qemu/notify.h"
 #include "ui/console.h"
 #include "hw/display/ramfb.h"
@@ -94,6 +95,8 @@ typedef struct VFIOContainer {
     uint64_t max_dirty_bitmap_size;
     unsigned long pgsizes;
     unsigned int dma_max_mappings;
+    IOVATree *mappings;
+    QemuMutex mappings_mutex;
     QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
     QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
     QLIST_HEAD(, VFIOGroup) group_list;
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index e554573eb5..fafc361cea 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -43,6 +43,7 @@
 #include "migration/misc.h"
 #include "migration/qemu-file.h"
 #include "sysemu/tpm.h"
+#include "qemu/iova-tree.h"
 
 VFIOGroupList vfio_group_list =
     QLIST_HEAD_INITIALIZER(vfio_group_list);
@@ -373,6 +374,11 @@ bool vfio_mig_active(void)
     return true;
 }
 
+static bool vfio_have_giommu(VFIOContainer *container)
+{
+    return !QLIST_EMPTY(&container->giommu_list);
+}
+
 static void vfio_set_migration_error(int err)
 {
     MigrationState *ms = migrate_get_current();
@@ -450,6 +456,51 @@ static bool vfio_devices_all_running_and_mig_active(VFIOContainer *container)
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
@@ -550,6 +601,8 @@ static int vfio_dma_unmap(VFIOContainer *container,
                                             DIRTY_CLIENTS_NOCODE);
     }
 
+    vfio_erase_mapping(container, iova, size);
+
     return 0;
 }
 
@@ -563,6 +616,16 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
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
@@ -579,8 +642,12 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
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
@@ -2134,16 +2201,23 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
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
@@ -2279,6 +2353,10 @@ listener_release_exit:
 enable_discards_exit:
     vfio_ram_block_discard_disable(container, false);
 
+destroy_mappings_exit:
+    qemu_mutex_destroy(&container->mappings_mutex);
+    iova_tree_destroy(container->mappings);
+
 free_container_exit:
     g_free(container);
 
@@ -2333,6 +2411,8 @@ static void vfio_disconnect_container(VFIOGroup *group)
         }
 
         trace_vfio_disconnect_container(container->fd);
+        qemu_mutex_destroy(&container->mappings_mutex);
+        iova_tree_destroy(container->mappings);
         close(container->fd);
         g_free(container);
 
-- 
2.26.3


