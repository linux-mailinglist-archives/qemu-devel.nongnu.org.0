Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA1B69FA74
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 18:51:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUtGw-0002RP-Dd; Wed, 22 Feb 2023 12:51:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtGt-00024J-Rj
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:51:15 -0500
Received: from mail-dm6nam10hn2030d.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::30d]
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtGk-0004hI-EV
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:51:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CaD3tmD4HuZoRi9XNDC3AJZjFuCL1fUKR/moR4iZ0aUI8Kt48MoV4S8lDm/TBCjBofVonLX+SqSFtNrvjaRMQjM0tpJBLErgyhh6SAKmTu+JgYrX+cnpE7wzkBBMuDFGwYvf8/1tDr45f4ENHHnt7vz4OBlYAvTZwGkSsWaTR8XOt8lYji4jV/t2b63NkHcHEz8E9NPVeAUlyEgIGC3fdf7RmSz5FJl3a348AH86/R/96PoV1bDmJnwev+a0CUgB0IKuIqjtyJTWBsrmM+RQwokZmmnw5giO89h7Ntwt28DCVcbxQZfovOik9JolhArxR/5Fr+LTdQdNo9rUctnBng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LjYuqeL3uW+7Wy53zNDLXMUQdB4XWmOklx0hNC08KVU=;
 b=TlGf9PnOufQGa/ixrDToG/o3ZWDe/vK2rbw7InfYZDN67fNCDieEYgXEbOt2XDKqRUFXTJzIz3I749ZShma35mBPy07ZyI+Itl/qEnRYN4No0Y6biZVQYgO0dKKGaCQ/8guiwlCOLTnAAwHjTrF1Cya39qT+5YqI7IyKXVxnp0k3y4JmAX5VrXnmmYygGXUAzly3HwHhqgHunHRKAkaCPbUTVDWEjS+f9jwW59oqB33P80wUxf9BvWGNefZrkk5jSXuk4V8S6S8PKfXpi54/CmbEioZQfwtqtqGg6WdgC5XupItLJVWN/80rj0OueNLVdPpwpFGZAIetxRkJF2nbLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LjYuqeL3uW+7Wy53zNDLXMUQdB4XWmOklx0hNC08KVU=;
 b=kZ/Aroa0YHBw03FaDxPBYA4/kmjRXZNOsPGLQzLQA9dADuUfbAX+LAE2nY6NsownnCA10op5DwpNdM2efnhzjcpxtHCiFHkCZ+0aZ3Zm5jG3PRWunZWrflrWdSeKDD4jEZ2PhhpVluIduPT2zj2TwcN+goGcQW/pGOoXlw6LJAntcW8e++EnZAlUIEGenZHWNbkNERwqkKN3b6iArT+WHK2DJqMpjSZiWaEuajs2zyODYDxsPc66PV8YrUfFOl4gtEJz89Tw+T1MPSbh4jrG3bxLm4VOrn9gVhaaL5HPTVGxWw6oMQ8E9RyyPtbV/PH0JZ+O5FvsmoUqd3gOfS8rbw==
Received: from MW4PR04CA0357.namprd04.prod.outlook.com (2603:10b6:303:8a::32)
 by IA0PR12MB7673.namprd12.prod.outlook.com (2603:10b6:208:435::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 17:51:01 +0000
Received: from CO1NAM11FT077.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8a:cafe::ad) by MW4PR04CA0357.outlook.office365.com
 (2603:10b6:303:8a::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.20 via Frontend
 Transport; Wed, 22 Feb 2023 17:51:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT077.mail.protection.outlook.com (10.13.175.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.18 via Frontend Transport; Wed, 22 Feb 2023 17:51:00 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:50:37 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:50:36 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Wed, 22 Feb
 2023 09:50:31 -0800
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
Subject: [PATCH v2 13/20] vfio/common: Add device dirty page bitmap sync
Date: Wed, 22 Feb 2023 19:49:08 +0200
Message-ID: <20230222174915.5647-14-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230222174915.5647-1-avihaih@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT077:EE_|IA0PR12MB7673:EE_
X-MS-Office365-Filtering-Correlation-Id: ae066b1b-4d82-4387-42a9-08db14fd5c41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MZ/7tZiLNkYFxzg4eHBWbJmfrDmYBlQ1V+B4d8A0ZIij/sF/3Dyxca/9BG804zTD1bp3J/tENjqGfdweADkz31aTMXlMxL1gBy23IZBrjYh03gd6OJ5/sCNB7UJaK8c9kJvP/ZdcyQ8GQ3E7493KOfmfGTzIIbq/uT8Ay9mHOzMh+DGDOofT/Hy832uCPBbiHSKH/wQGmr5/O7VTdkA48MYUptisxHjLRjqfK24TrQWmGAwZRnXnrOvZpTvsmKAXuyXiTBgki64/aQd88EmMv2vbSalEwrlx49l8rndFSEgNyzzBreowsmYuzcbItyM9GrJgRhIdbaBcpzaxBIEiqFkuX1Z1lGdlceVQzr45GBWtiTWcPAeHyPHdhClxlxGzIAMRNw8KSGgHzpaFhGb1AibPtU66HclMN3t9/WbhaSbWvQAHmifv3hvwB9PG/jHMuJ9fnDSsCIkYH3YduyS59LoEDgAA85f65dg5J9NlRprtjA6Umi/Zz4IWkx/zST6BLLZGlgY66FkR27t0wrv26cv62OFUnckFQiWWBGQmGX69YTI81N5IBm4kZ+nmPSWcU/zAN/wX9BpYQaJ+gKyafxKXKkEOKSD7r5cbbf9Q9C4gWQ9Z5Z+CGHx+MOIHMNNCmPUxeckM7+sCoax+sH1powijTsWdZ5eQdVwOHY6bh6q/Npa+ayIibfyAV6NJNqssxDZ007MOsUx0Jg4TwqC1W0h/do9X/MfmgS69TeVlaJOGS5oQBxcKAjp0UzPd3LwmxR+9HgW909LvppcfNfL2tmS8H9C6ix0rVmDq0uVuqo0=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(396003)(346002)(39860400002)(5400799012)(451199018)(46966006)(40470700004)(36840700001)(426003)(47076005)(83380400001)(36756003)(2906002)(5660300002)(7416002)(1076003)(54906003)(86362001)(41300700001)(478600001)(6666004)(7696005)(66899018)(82310400005)(36860700001)(34020700004)(7636003)(26005)(2616005)(336012)(40480700001)(186003)(356005)(8676002)(40460700003)(6916009)(316002)(4326008)(8936002)(82740400003)(70586007)(70206006)(14143004)(12100799015);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 17:51:00.9181 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae066b1b-4d82-4387-42a9-08db14fd5c41
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT077.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7673
Received-SPF: softfail client-ip=2a01:111:f400:7e88::30d;
 envelope-from=avihaih@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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

Add device dirty page bitmap sync functionality. This uses the device
DMA logging uAPI to sync dirty page bitmap from the device.

Device dirty page bitmap sync is used only if all devices within a
container support device dirty page tracking.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/vfio/common.c | 95 +++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 86 insertions(+), 9 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 3ab5d8d442..797eb2c26e 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -356,6 +356,9 @@ static void vfio_bitmap_dealloc(VFIOBitmap *vbmap)
     g_free(vbmap);
 }
 
+static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
+                                 uint64_t size, ram_addr_t ram_addr);
+
 bool vfio_mig_active(void)
 {
     VFIOGroup *group;
@@ -631,10 +634,16 @@ static int vfio_dma_unmap(VFIOContainer *container,
         .iova = iova,
         .size = size,
     };
+    bool need_dirty_sync = false;
+    int ret;
 
-    if (iotlb && container->dirty_pages_supported &&
-        vfio_devices_all_running_and_mig_active(container)) {
-        return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
+    if (iotlb && vfio_devices_all_running_and_mig_active(container)) {
+        if (!vfio_devices_all_device_dirty_tracking(container) &&
+            container->dirty_pages_supported) {
+            return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
+        }
+
+        need_dirty_sync = true;
     }
 
     while (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
@@ -660,10 +669,12 @@ static int vfio_dma_unmap(VFIOContainer *container,
         return -errno;
     }
 
-    if (iotlb && vfio_devices_all_running_and_mig_active(container)) {
-        cpu_physical_memory_set_dirty_range(iotlb->translated_addr, size,
-                                            tcg_enabled() ? DIRTY_CLIENTS_ALL :
-                                            DIRTY_CLIENTS_NOCODE);
+    if (need_dirty_sync) {
+        ret = vfio_get_dirty_bitmap(container, iova, size,
+                                    iotlb->translated_addr);
+        if (ret) {
+            return ret;
+        }
     }
 
     vfio_erase_mapping(container, iova, size);
@@ -1633,6 +1644,65 @@ static void vfio_listener_log_global_stop(MemoryListener *listener)
     }
 }
 
+static int vfio_device_dma_logging_report(VFIODevice *vbasedev, hwaddr iova,
+                                          hwaddr size, void *bitmap)
+{
+    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
+                        sizeof(struct vfio_device_feature_dma_logging_report),
+                        sizeof(uint64_t))] = {};
+    struct vfio_device_feature *feature = (struct vfio_device_feature *)buf;
+    struct vfio_device_feature_dma_logging_report *report =
+        (struct vfio_device_feature_dma_logging_report *)feature->data;
+
+    report->iova = iova;
+    report->length = size;
+    report->page_size = qemu_real_host_page_size();
+    report->bitmap = (uint64_t)bitmap;
+
+    feature->argsz = sizeof(buf);
+    feature->flags =
+        VFIO_DEVICE_FEATURE_GET | VFIO_DEVICE_FEATURE_DMA_LOGGING_REPORT;
+
+    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
+        return -errno;
+    }
+
+    return 0;
+}
+
+static int vfio_devices_query_dirty_bitmap(VFIOContainer *container,
+                                           VFIOBitmap *vbmap, hwaddr iova,
+                                           hwaddr size)
+{
+    VFIODevice *vbasedev;
+    VFIOGroup *group;
+    int ret;
+
+    if (vfio_have_giommu(container)) {
+        /* Device dirty page tracking currently doesn't support vIOMMU */
+        bitmap_set(vbmap->bitmap, 0, vbmap->pages);
+
+        return 0;
+    }
+
+    QLIST_FOREACH(group, &container->group_list, container_next) {
+        QLIST_FOREACH(vbasedev, &group->device_list, next) {
+            ret = vfio_device_dma_logging_report(vbasedev, iova, size,
+                                                 vbmap->bitmap);
+            if (ret) {
+                error_report("%s: Failed to get DMA logging report, iova: "
+                             "0x%" HWADDR_PRIx ", size: 0x%" HWADDR_PRIx
+                             ", err: %d (%s)",
+                             vbasedev->name, iova, size, ret, strerror(-ret));
+
+                return ret;
+            }
+        }
+    }
+
+    return 0;
+}
+
 static int vfio_query_dirty_bitmap(VFIOContainer *container, VFIOBitmap *vbmap,
                                    hwaddr iova, hwaddr size)
 {
@@ -1673,10 +1743,12 @@ static int vfio_query_dirty_bitmap(VFIOContainer *container, VFIOBitmap *vbmap,
 static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
                                  uint64_t size, ram_addr_t ram_addr)
 {
+    bool all_device_dirty_tracking =
+        vfio_devices_all_device_dirty_tracking(container);
     VFIOBitmap *vbmap;
     int ret;
 
-    if (!container->dirty_pages_supported) {
+    if (!container->dirty_pages_supported && !all_device_dirty_tracking) {
         cpu_physical_memory_set_dirty_range(ram_addr, size,
                                             tcg_enabled() ? DIRTY_CLIENTS_ALL :
                                             DIRTY_CLIENTS_NOCODE);
@@ -1688,7 +1760,12 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
         return -errno;
     }
 
-    ret = vfio_query_dirty_bitmap(container, vbmap, iova, size);
+    if (all_device_dirty_tracking) {
+        ret = vfio_devices_query_dirty_bitmap(container, vbmap, iova, size);
+    } else {
+        ret = vfio_query_dirty_bitmap(container, vbmap, iova, size);
+    }
+
     if (ret) {
         goto out;
     }
-- 
2.26.3


