Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD51C69FA77
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 18:51:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUtH4-0002qk-E7; Wed, 22 Feb 2023 12:51:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtH0-0002ob-Un
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:51:22 -0500
Received: from mail-bn7nam10on20607.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::607]
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtGy-0004iw-Ef
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:51:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V/oIzcsN7CgycQcef8ClaeEl6ro5OMA6M4J3UL8qtDv+6YAtv7TB4eVIRaBlXrR29arQamzEq8NSWEakYtgYwlE+if04CHzbn8M8VdQdiDhCsKsYDH7Nl3FCKUVWH/ES6cJrNrhxg4JnepaxAurZrdjUYv/vgfcTPXu5TCV6n6Bk8Tfq/EgjffXotQk6fTzc5TsZAmPf/njLeB7x3S/EyGsH/scQ6vyJ2rkG4cUko7NTDwVWkHwjlDFAOdEeF16BeJ7NhvPruE0t0lwSVDtTZKuwcssVgdY/5CoOKcyzeY0yAfla0c74eR/LwPOALKKiyDO+alfhGbqarvG9ENi/oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4f598anREjn3pD2d/AdGIJhZp719+wMiRMww7pzdJAI=;
 b=Jctil+F8GKOB13HEdsAWHCfZFIIv/4vrPp7geW7udylR3RATECnaigKG51iYb+SHiX0mUxtWPxI7ecpP/BRfXXhFttV2FQSMiU6M2XN0pM62s62gVXqfbcXbjA9LnG2/BeeqKbJeQSKZ6JEizn+ZWEjkB8eQNkNxDLpGws+jDpL6FLSwSzhpXME0ef73a9qx5pD/cyLVQqIMEYWMybCnmt/M1dU5gDaFsgc2GNfp0s5ISQj4Ebqf3IZPcmDwr00352nxozZDJF9oFXqFUol6tx5AAiP37trELvfRBwR2PmcfqzrjUqo/7G3PXzUQ/87+1zFJDXZKviO7t1pDGAn9/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4f598anREjn3pD2d/AdGIJhZp719+wMiRMww7pzdJAI=;
 b=eGTHHp0uiZBr4U6hpGPO8nHh+1r0oPsrmarrwkYB+0Bn1TXIGjS4BMfxglx1jysaqh07zkzLUMednuwzsOyp7o9szf99ZYLreC6VJIfCx0qOnt5pSmawAMEAHb22rEraBoZpQkH0irszjctZcPXM0+ZhcuJGOL+z1F57+ZlnFs8qfcmg89PS+Y4azmacw47ksO5JWkSTTQSR03OAZrBgQxotT453D2LAicri+0DCBSHeXbD7D09iVYiKy8V3qZe9PYBP0XAX/Imbme6xzqN74ezOO4yFItECbo0qx9+ZfFATNikN2SasEzoPIb1J9SIlWAC8U7k4n16cdL9Nvz6BIg==
Received: from BN0PR04CA0086.namprd04.prod.outlook.com (2603:10b6:408:ea::31)
 by BY5PR12MB4194.namprd12.prod.outlook.com (2603:10b6:a03:210::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 17:51:16 +0000
Received: from BL02EPF0000C405.namprd05.prod.outlook.com
 (2603:10b6:408:ea:cafe::71) by BN0PR04CA0086.outlook.office365.com
 (2603:10b6:408:ea::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19 via Frontend
 Transport; Wed, 22 Feb 2023 17:51:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0000C405.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.14 via Frontend Transport; Wed, 22 Feb 2023 17:51:15 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:51:00 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:51:00 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Wed, 22 Feb
 2023 09:50:54 -0800
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
Subject: [PATCH v2 17/20] vfio/common: Support device dirty page tracking with
 vIOMMU
Date: Wed, 22 Feb 2023 19:49:12 +0200
Message-ID: <20230222174915.5647-18-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230222174915.5647-1-avihaih@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C405:EE_|BY5PR12MB4194:EE_
X-MS-Office365-Filtering-Correlation-Id: fdcab1d9-660c-4cf6-9914-08db14fd64da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nlJFAM/cTRsbh97mHRpnCldnqrQPLMw1J3fDa+kEzy50p5RPeBCxuziJj7oBXabPxMfAuLSWXdBEziK7aTMUT0x5JlvkmcKTmeorLPfmiNWiEjppI1UXXYtms6wAI8CHESWZrW9pc3varEL5jvD/KCFZSbdUj5RqTXc0dozVSSm0crfhajz/0uHdsgOUIrDWSCPWNpP1hhfWcdBidNlqq4xHq9fXglz7kUwMiOHe7pMGKImo4KEP+wfHxnPBwPgsSO5FkgDLBOqTGGf73u7bkMpQyfiBfIqelke9xjS1xmeX5DQqiQiU4YMuRmayDM9B/g6S+Rh8aS9VVHR5Sloa6frn5tUIBgjODyTJKcAwgjbMNfy4H90xJ4rEwwyPnFEcmJyC54ASoaL5FROgKTXHnJmov66bqCISb66HddwnO64ovItjNBJWvqUY8fVDBZLqzEOkzYFkhxJcZKOejfLLn7neJcl8zQUXOKXPKZPiqTf4XYuppAx/9Rk7V26EOxs20gDPTbqJYvJx8JxBlCrB3zWJORf4S3hV3KVahbdiDhY6hHH3JOuf0WOeCN92rGKjT123ZFC9eslnm8oTEJPRKsXIgeiXyl7c8kbOdTSUHqzehhaEHGKpAhxo/mecfYe3DkR0sNSyaTcAGOq8AidVCdSS7h/h/zhLBh7SuOyFzwJC2x7LD7p0vo2xftmgbgDmkEZe7PTGJWpFxHgffO2ouYZB5PVvn00o9QxiosQwsGk=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(376002)(136003)(346002)(396003)(451199018)(40470700004)(36840700001)(46966006)(186003)(26005)(83380400001)(4326008)(70586007)(6916009)(70206006)(40480700001)(8676002)(8936002)(36756003)(5660300002)(7416002)(2616005)(1076003)(6666004)(7696005)(336012)(478600001)(426003)(47076005)(40460700003)(356005)(41300700001)(54906003)(316002)(86362001)(7636003)(82740400003)(82310400005)(2906002)(36860700001)(14143004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 17:51:15.2354 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdcab1d9-660c-4cf6-9914-08db14fd64da
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000C405.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4194
Received-SPF: softfail client-ip=2a01:111:f400:7e8a::607;
 envelope-from=avihaih@nvidia.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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

Currently, device dirty page tracking with vIOMMU is not supported - RAM
pages are perpetually marked dirty in this case.

When vIOMMU is used, IOVA ranges are DMA mapped/unmapped on the fly as
the vIOMMU maps/unmaps them. These IOVA ranges can potentially be mapped
anywhere in the vIOMMU IOVA space.

Due to this dynamic nature of vIOMMU mapping/unmapping, tracking only
the currently mapped IOVA ranges, as done in the non-vIOMMU case,
doesn't work very well.

Instead, to support device dirty tracking when vIOMMU is enabled, track
the entire vIOMMU IOVA space. If that fails (IOVA space can be rather
big and we might hit HW limitation), try tracking smaller range while
marking untracked ranges dirty.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 include/hw/vfio/vfio-common.h |   2 +
 hw/vfio/common.c              | 196 +++++++++++++++++++++++++++++++---
 2 files changed, 181 insertions(+), 17 deletions(-)

diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 1f21e1fa43..1dc00cabcd 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -95,6 +95,8 @@ typedef struct VFIOContainer {
     unsigned int dma_max_mappings;
     IOVATree *mappings;
     QemuMutex mappings_mutex;
+    /* Represents the range [0, giommu_tracked_range) not inclusive */
+    hwaddr giommu_tracked_range;
     QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
     QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
     QLIST_HEAD(, VFIOGroup) group_list;
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 4a7fff6eeb..1024788bcc 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -45,6 +45,8 @@
 #include "migration/qemu-file.h"
 #include "sysemu/tpm.h"
 #include "qemu/iova-tree.h"
+#include "hw/boards.h"
+#include "hw/mem/memory-device.h"
 
 VFIOGroupList vfio_group_list =
     QLIST_HEAD_INITIALIZER(vfio_group_list);
@@ -430,6 +432,38 @@ void vfio_unblock_multiple_devices_migration(void)
     multiple_devices_migration_blocker = NULL;
 }
 
+static uint64_t vfio_get_ram_size(void)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+    uint64_t plugged_size;
+
+    plugged_size = get_plugged_memory_size();
+    if (plugged_size == (uint64_t)-1) {
+        plugged_size = 0;
+    }
+
+    return ms->ram_size + plugged_size;
+}
+
+static int vfio_iommu_get_max_iova(VFIOContainer *container, hwaddr *max_iova)
+{
+    VFIOGuestIOMMU *giommu;
+    int ret;
+
+    giommu = QLIST_FIRST(&container->giommu_list);
+    if (!giommu) {
+        return -ENOENT;
+    }
+
+    ret = memory_region_iommu_get_attr(giommu->iommu_mr, IOMMU_ATTR_MAX_IOVA,
+                                       max_iova);
+    if (ret) {
+        return ret;
+    }
+
+    return 0;
+}
+
 static bool vfio_have_giommu(VFIOContainer *container)
 {
     return !QLIST_EMPTY(&container->giommu_list);
@@ -1510,7 +1544,8 @@ static gboolean vfio_iova_tree_get_last(DMAMap *map, gpointer data)
 }
 
 static struct vfio_device_feature *
-vfio_device_feature_dma_logging_start_create(VFIOContainer *container)
+vfio_device_feature_dma_logging_start_create(VFIOContainer *container,
+                                             bool giommu)
 {
     struct vfio_device_feature *feature;
     size_t feature_size;
@@ -1529,6 +1564,16 @@ vfio_device_feature_dma_logging_start_create(VFIOContainer *container)
     control = (struct vfio_device_feature_dma_logging_control *)feature->data;
     control->page_size = qemu_real_host_page_size();
 
+    if (giommu) {
+        ranges = g_malloc0(sizeof(*ranges));
+        ranges->iova = 0;
+        ranges->length = container->giommu_tracked_range;
+        control->num_ranges = 1;
+        control->ranges = (uint64_t)ranges;
+
+        return feature;
+    }
+
     QEMU_LOCK_GUARD(&container->mappings_mutex);
 
     /*
@@ -1578,12 +1623,12 @@ static void vfio_device_feature_dma_logging_start_destroy(
     g_free(feature);
 }
 
-static int vfio_devices_dma_logging_start(VFIOContainer *container)
+static int vfio_devices_dma_logging_start(VFIOContainer *container, bool giommu)
 {
     struct vfio_device_feature *feature;
     int ret;
 
-    feature = vfio_device_feature_dma_logging_start_create(container);
+    feature = vfio_device_feature_dma_logging_start_create(container, giommu);
     if (!feature) {
         return -errno;
     }
@@ -1598,18 +1643,128 @@ static int vfio_devices_dma_logging_start(VFIOContainer *container)
     return ret;
 }
 
+typedef struct {
+    hwaddr *ranges;
+    unsigned int ranges_num;
+} VFIOGIOMMUDeviceDTRanges;
+
+/*
+ * This value is used in the second attempt to start device dirty tracking with
+ * vIOMMU, or if the giommu fails to report its max iova.
+ * It should be in the middle, not too big and not too small, allowing devices
+ * with HW limitations to do device dirty tracking while covering a fair amount
+ * of the IOVA space.
+ *
+ * This arbitrary value was chosen becasue it is the minimum value of Intel
+ * IOMMU max IOVA and mlx5 devices support tracking a range of this size.
+ */
+#define VFIO_IOMMU_DEFAULT_MAX_IOVA ((1ULL << 39) - 1)
+
+#define VFIO_IOMMU_RANGES_NUM 3
+static VFIOGIOMMUDeviceDTRanges *
+vfio_iommu_device_dirty_tracking_ranges_create(VFIOContainer *container)
+{
+    hwaddr iommu_max_iova = VFIO_IOMMU_DEFAULT_MAX_IOVA;
+    hwaddr retry_iova;
+    hwaddr ram_size = vfio_get_ram_size();
+    VFIOGIOMMUDeviceDTRanges *dt_ranges;
+    int ret;
+
+    dt_ranges = g_try_new0(VFIOGIOMMUDeviceDTRanges, 1);
+    if (!dt_ranges) {
+        errno = ENOMEM;
+
+        return NULL;
+    }
+
+    dt_ranges->ranges_num = VFIO_IOMMU_RANGES_NUM;
+
+    dt_ranges->ranges = g_try_new0(hwaddr, dt_ranges->ranges_num);
+    if (!dt_ranges->ranges) {
+        g_free(dt_ranges);
+        errno = ENOMEM;
+
+        return NULL;
+    }
+
+    /*
+     * With vIOMMU we try to track the entire IOVA space. As the IOVA space can
+     * be rather big, devices might not be able to track it due to HW
+     * limitations. In that case:
+     * (1) Retry tracking a smaller part of the IOVA space.
+     * (2) Retry tracking a range in the size of the physical memory.
+     */
+    ret = vfio_iommu_get_max_iova(container, &iommu_max_iova);
+    if (!ret) {
+        /* Check 2^64 wrap around */
+        if (!REAL_HOST_PAGE_ALIGN(iommu_max_iova)) {
+            iommu_max_iova -= qemu_real_host_page_size();
+        }
+    }
+
+    retry_iova = MIN(iommu_max_iova / 2, VFIO_IOMMU_DEFAULT_MAX_IOVA);
+
+    dt_ranges->ranges[0] = REAL_HOST_PAGE_ALIGN(iommu_max_iova);
+    dt_ranges->ranges[1] = REAL_HOST_PAGE_ALIGN(retry_iova);
+    dt_ranges->ranges[2] = REAL_HOST_PAGE_ALIGN(MIN(ram_size, retry_iova / 2));
+
+    return dt_ranges;
+}
+
+static void vfio_iommu_device_dirty_tracking_ranges_destroy(
+    VFIOGIOMMUDeviceDTRanges *dt_ranges)
+{
+    g_free(dt_ranges->ranges);
+    g_free(dt_ranges);
+}
+
+static int vfio_devices_start_dirty_page_tracking(VFIOContainer *container)
+{
+    VFIOGIOMMUDeviceDTRanges *dt_ranges;
+    int ret;
+    int i;
+
+    if (!vfio_have_giommu(container)) {
+        return vfio_devices_dma_logging_start(container, false);
+    }
+
+    dt_ranges = vfio_iommu_device_dirty_tracking_ranges_create(container);
+    if (!dt_ranges) {
+        return -errno;
+    }
+
+    for (i = 0; i < dt_ranges->ranges_num; i++) {
+        container->giommu_tracked_range = dt_ranges->ranges[i];
+        ret = vfio_devices_dma_logging_start(container, true);
+        if (!ret) {
+            break;
+        }
+
+        if (i < dt_ranges->ranges_num - 1) {
+            warn_report("Failed to start device dirty tracking with vIOMMU "
+                        "with range of size 0x%" HWADDR_PRIx
+                        ", err: %d. Retrying with range "
+                        "of size 0x%" HWADDR_PRIx,
+                        dt_ranges->ranges[i], ret, dt_ranges->ranges[i + 1]);
+        } else {
+            error_report("Failed to start device dirty tracking with vIOMMU "
+                         "with range of size 0x%" HWADDR_PRIx ", err: %d",
+                         dt_ranges->ranges[i], ret);
+        }
+    }
+
+    vfio_iommu_device_dirty_tracking_ranges_destroy(dt_ranges);
+
+    return ret;
+}
+
 static void vfio_listener_log_global_start(MemoryListener *listener)
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
     int ret;
 
     if (vfio_devices_all_device_dirty_tracking(container)) {
-        if (vfio_have_giommu(container)) {
-            /* Device dirty page tracking currently doesn't support vIOMMU */
-            return;
-        }
-
-        ret = vfio_devices_dma_logging_start(container);
+        ret = vfio_devices_start_dirty_page_tracking(container);
     } else {
         ret = vfio_set_dirty_page_tracking(container, true);
     }
@@ -1627,11 +1782,6 @@ static void vfio_listener_log_global_stop(MemoryListener *listener)
     int ret;
 
     if (vfio_devices_all_device_dirty_tracking(container)) {
-        if (vfio_have_giommu(container)) {
-            /* Device dirty page tracking currently doesn't support vIOMMU */
-            return;
-        }
-
         ret = vfio_devices_dma_logging_stop(container);
     } else {
         ret = vfio_set_dirty_page_tracking(container, false);
@@ -1670,6 +1820,17 @@ static int vfio_device_dma_logging_report(VFIODevice *vbasedev, hwaddr iova,
     return 0;
 }
 
+static bool vfio_iommu_range_is_device_tracked(VFIOContainer *container,
+                                               hwaddr iova, hwaddr size)
+{
+    /* Check for 2^64 wrap around */
+    if (!(iova + size)) {
+        return false;
+    }
+
+    return iova + size <= container->giommu_tracked_range;
+}
+
 static int vfio_devices_query_dirty_bitmap(VFIOContainer *container,
                                            VFIOBitmap *vbmap, hwaddr iova,
                                            hwaddr size)
@@ -1679,10 +1840,11 @@ static int vfio_devices_query_dirty_bitmap(VFIOContainer *container,
     int ret;
 
     if (vfio_have_giommu(container)) {
-        /* Device dirty page tracking currently doesn't support vIOMMU */
-        bitmap_set(vbmap->bitmap, 0, vbmap->pages);
+        if (!vfio_iommu_range_is_device_tracked(container, iova, size)) {
+            bitmap_set(vbmap->bitmap, 0, vbmap->pages);
 
-        return 0;
+            return 0;
+        }
     }
 
     QLIST_FOREACH(group, &container->group_list, container_next) {
-- 
2.26.3


