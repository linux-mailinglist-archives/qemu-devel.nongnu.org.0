Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D99467D4BC
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 19:55:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL7MD-0006ec-Sj; Thu, 26 Jan 2023 13:52:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL7LD-0005Q3-8Z
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:51:21 -0500
Received: from mail-dm6nam10on2058.outbound.protection.outlook.com
 ([40.107.93.58] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL7L9-0002vX-Bu
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:51:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mdb1IgGlKBA3jNWxym3UX+TEVOP1ahYI6RtF1uHH5xUNcA5zkXm2zJ0s/sJDsG8d0ypinqbwe2oq6LztnkCBWnB3lkBqzqHMVYfxQbwif5zuDl/vdhRMY1v+VM4GxDOIQqpzd5TGMbV6x+T2cIjnX9p5VLyWh/ins55Cugiu/PBbNJ5YJy29dnPcrQBeFad3F8K92zvJCqfNdYHnwajORkcoiJc9nsDiRjuDYYCXtPxqdc/570tbCKdhQwF7awHJ73kARn/7ZkIHRw96LA1uX76VQ1SNWnNF3NbbFCPF73QXdDKvObiKpD6a+eTfOHGG0OPvuIKNUnOCpoR0Zqo1LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j5yF22RW/SrZOIWrGxgv6eqD3vJgAmcuK9WMhCuu+6Q=;
 b=PU0WYT7S1tcN8g4t4rjYkoCvltvAKaMOdqKIoeAojNIIjFpajaGwBrHIjOtefsrFpTWsgGBY3S73Y1YMj15ufl7aQrZ2JwpMiT3caaoimccvbhs55C7X9ejVyokDpwegt12CQVwgUeq4hg9YA05vFDJG+YqXmtSHJSfwH7O1jdM8XpQQ/z5MBIp/1JPp6dbOZ5edr5pg+BIR+wJOGwNq/G9ccOTObtrwlNa8b5bl5wyNfAmmK5hdI1kiesN5giYl+o79afTbPBNjJTIJf27XK2mPh9jWMmY3M1uDW4M2bqQ4SFyhQeH1mmTIY6L18cj5RB5VrEnl38Ri+c5mzi9ASw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j5yF22RW/SrZOIWrGxgv6eqD3vJgAmcuK9WMhCuu+6Q=;
 b=lyGyYz8QnEEvL+WcrBJdhWtKY1GqGGJf7fqsl9zHgZ03N/ipFha0C0ojEihgnTwoxOT0AwEU7yaQywLuOG4TVEZWCLaOrvUmqDZxG3vEso/shzyFSTx6+zuEOCMDgjRcNFtFNCKiusDnPWTKefNBV96NZ526M+h2DcpTaDOhqHD1D7dIVvlPxF4jG9pUf7+2PCXThK92lvxeGiPUaJSSYojm/lTrA42Uw4YYQpKxJaiKrF6+2MUibZ5qqd5/s8w0aL3OoGaWcFF9R5DePXDDOUIuIMO6gqiTX8xLG7CCqJvQ2fgQkPdHoLLz0wh0pjRZesUooe3l1WqlEmXF/ym/Qg==
Received: from MW3PR05CA0008.namprd05.prod.outlook.com (2603:10b6:303:2b::13)
 by PH8PR12MB7303.namprd12.prod.outlook.com (2603:10b6:510:220::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 18:51:12 +0000
Received: from CO1NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2b:cafe::1a) by MW3PR05CA0008.outlook.office365.com
 (2603:10b6:303:2b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22 via Frontend
 Transport; Thu, 26 Jan 2023 18:51:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CO1NAM11FT014.mail.protection.outlook.com (10.13.175.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.21 via Frontend Transport; Thu, 26 Jan 2023 18:51:12 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 26 Jan
 2023 10:51:01 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 26 Jan 2023 10:51:01 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport;
 Thu, 26 Jan 2023 10:50:57 -0800
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
Subject: [PATCH 15/18] vfio/common: Support device dirty page tracking with
 vIOMMU
Date: Thu, 26 Jan 2023 20:49:45 +0200
Message-ID: <20230126184948.10478-16-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230126184948.10478-1-avihaih@nvidia.com>
References: <20230126184948.10478-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT014:EE_|PH8PR12MB7303:EE_
X-MS-Office365-Filtering-Correlation-Id: 641d6370-0ea1-4936-d4be-08daffce4b79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N0BVoAVUQ0xMowC6I9zUg7SIPanvjQtzdXOnGFBy/+GAAKP/Nc0WATpy9N8sKK1vZsD0nuQsy+BcIU2eVlWZqKC5yP6vP9XHGg6AMKCmUEdsO89VIlu1L24jNQdDmN/bNW5+u3A3EPolBLJOo4kd36PdGjxxv6mENKKzdc2YWKVkA0enzOxChQkYY2bjBVMIQYhIeCfCNCidPiQTTME9ePyR5Mq4VaXteiDrY3wxZhRFrPpvtD7iC8iW+O4bmkyGRBanshkW2wzxIaN8gj9jPsjhX2JHzTBufZdcDjTC61Ys9XhQ/Qi+3IrhEgBsyXZX/o9ox7/mc2ysr+R9HwqrnoCnYeTF54xGv8eembN0y3Ro6IbfWHNsceJ04g2U9/PlY/pqAXseJVOz6N/YHj7zfWmBIQsx7HCAhQoeloqEwo54TE2w6qsNSZj9v2MjwxYSwprMC90/nuBM1LJA8636axy73Bw9eHlcvWUkJ3EYYpyGvVbSfwLMQK3glOrjZ6eJI/VKsLyscIoHs2QYvKf8kziBe5tFN3R0BlPz8AtWtA2IfhGSsWpWoJg0znHx4pGQF305oZEki/ZUivjL+6wcw4ocCc/8BtOq7f7mc2YXbDOF6sg53JcXqe3dLwZ4TUi2pkc+df5tVmV1lkqrg+Lsp7KSILHVI964LZuwfpomaKUyRS4T16UARVyvUMTDewaOFIGMIjXSldYUhZbaOd42e5GeI1VOIda6/AHTTRfsVso=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(376002)(39860400002)(136003)(346002)(451199018)(46966006)(36840700001)(40470700004)(2906002)(426003)(36860700001)(336012)(83380400001)(5660300002)(41300700001)(8936002)(7416002)(8676002)(478600001)(2616005)(1076003)(4326008)(26005)(186003)(6666004)(86362001)(40460700003)(356005)(82740400003)(47076005)(40480700001)(7636003)(70586007)(6916009)(70206006)(36756003)(54906003)(7696005)(82310400005)(316002)(14143004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 18:51:12.0030 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 641d6370-0ea1-4936-d4be-08daffce4b79
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7303
Received-SPF: softfail client-ip=40.107.93.58; envelope-from=avihaih@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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
 hw/vfio/common.c              | 153 ++++++++++++++++++++++++++++++----
 2 files changed, 138 insertions(+), 17 deletions(-)

diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index cde6ffb9d6..15109c311d 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -97,6 +97,8 @@ typedef struct VFIOContainer {
     unsigned int dma_max_mappings;
     IOVATree *mappings;
     QemuMutex mappings_mutex;
+    /* Represents the range [0, giommu_tracked_range) not inclusive */
+    hwaddr giommu_tracked_range;
     QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
     QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
     QLIST_HEAD(, VFIOGroup) group_list;
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 9792c2c935..c3a27cbbd5 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -44,6 +44,8 @@
 #include "migration/qemu-file.h"
 #include "sysemu/tpm.h"
 #include "qemu/iova-tree.h"
+#include "hw/boards.h"
+#include "hw/mem/memory-device.h"
 
 VFIOGroupList vfio_group_list =
     QLIST_HEAD_INITIALIZER(vfio_group_list);
@@ -377,6 +379,38 @@ bool vfio_mig_active(void)
     return true;
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
+static int vfio_giommu_get_max_iova(VFIOContainer *container, hwaddr *max_iova)
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
@@ -1456,7 +1490,8 @@ static gboolean vfio_iova_tree_get_last(DMAMap *map, gpointer data)
 }
 
 static struct vfio_device_feature *
-vfio_device_feature_dma_logging_start_create(VFIOContainer *container)
+vfio_device_feature_dma_logging_start_create(VFIOContainer *container,
+                                             bool giommu)
 {
     struct vfio_device_feature *feature;
     size_t feature_size;
@@ -1475,6 +1510,16 @@ vfio_device_feature_dma_logging_start_create(VFIOContainer *container)
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
@@ -1524,12 +1569,12 @@ static void vfio_device_feature_dma_logging_start_destroy(
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
@@ -1544,18 +1589,85 @@ static int vfio_devices_dma_logging_start(VFIOContainer *container)
     return ret;
 }
 
+/*
+ * This value is used in the second attempt to start device dirty tracking with
+ * vIOMMU, if the first attempt fails. It should be in the middle, not too big
+ * and not too small, allowing devices with HW limitations to do device dirty
+ * tracking while covering a fair amount of the IOVA space.
+ *
+ * This arbitrary value was chosen becasue it is the minimum value of Intel
+ * IOMMU max IOVA and mlx5 device supports tracking a range of this size.
+ */
+#define VFIO_GIOMMU_RETRY_IOVA ((1ULL << 39) - 1)
+
+#define VFIO_GIOMMU_RETRY_COUNT 3
+static int vfio_devices_start_dirty_page_tracking(VFIOContainer *container)
+{
+    hwaddr giommu_max_iova, iova_size, iova_retry_size, ram_size;
+    hwaddr iova_to_track[VFIO_GIOMMU_RETRY_COUNT] = {};
+    int ret;
+    int i;
+
+    if (!vfio_have_giommu(container)) {
+        return vfio_devices_dma_logging_start(container, false);
+    }
+
+    /*
+     * With vIOMMU we try to track the entire IOVA space. As the IOVA space can
+     * be rather big, devices might not be able to track it due to HW
+     * limitations. Therefore, retry tracking smaller ranges as follows:
+     * (1) Retry tracking a smaller part of the IOVA space.
+     * (2) Retry tracking a range in the size of the physical memory.
+     * (3) If all fail, give up.
+     */
+    ret = vfio_giommu_get_max_iova(container, &giommu_max_iova);
+    if (!ret && !REAL_HOST_PAGE_ALIGN(giommu_max_iova)) {
+        giommu_max_iova -= qemu_real_host_page_size();
+    }
+
+    iova_size = ret ? 0 : giommu_max_iova;
+    iova_retry_size = iova_size ? MIN(VFIO_GIOMMU_RETRY_IOVA, iova_size / 2) :
+                                  VFIO_GIOMMU_RETRY_IOVA;
+    ram_size = vfio_get_ram_size();
+
+    iova_to_track[0] = REAL_HOST_PAGE_ALIGN(iova_size);
+    iova_to_track[1] = REAL_HOST_PAGE_ALIGN(iova_retry_size);
+    iova_to_track[2] = REAL_HOST_PAGE_ALIGN(MIN(ram_size, iova_retry_size / 2));
+
+    for (i = 0; i < VFIO_GIOMMU_RETRY_COUNT; i++) {
+        if (!iova_to_track[i]) {
+            continue;
+        }
+
+        container->giommu_tracked_range = iova_to_track[i];
+        ret = vfio_devices_dma_logging_start(container, true);
+        if (!ret) {
+            break;
+        }
+
+        if (i < VFIO_GIOMMU_RETRY_COUNT - 1) {
+            warn_report("Failed to start device dirty tracking with vIOMMU "
+                        "with range of size 0x%" HWADDR_PRIx
+                        ", err: %d. Retrying with range "
+                        "of size 0x%" HWADDR_PRIx,
+                        iova_to_track[i], ret, iova_to_track[i + 1]);
+        } else {
+            error_report("Failed to start device dirty tracking with vIOMMU "
+                         "with range of size 0x%" HWADDR_PRIx ", err: %d",
+                         iova_to_track[i], ret);
+        }
+    }
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
@@ -1573,11 +1685,6 @@ static void vfio_listener_log_global_stop(MemoryListener *listener)
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
@@ -1616,6 +1723,17 @@ static int vfio_device_dma_logging_report(VFIODevice *vbasedev, hwaddr iova,
     return 0;
 }
 
+static bool vfio_iommu_range_is_device_tracked(VFIOContainer *container,
+                                               hwaddr iova, hwaddr size)
+{
+    /* Check overflow */
+    if (iova + size < iova) {
+        return false;
+    }
+
+    return iova + size <= container->giommu_tracked_range;
+}
+
 static int vfio_devices_query_dirty_bitmap(VFIOContainer *container,
                                            VFIOBitmap *vbmap, hwaddr iova,
                                            hwaddr size)
@@ -1625,10 +1743,11 @@ static int vfio_devices_query_dirty_bitmap(VFIOContainer *container,
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


