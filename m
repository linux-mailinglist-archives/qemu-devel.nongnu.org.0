Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 725D867D4B8
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 19:55:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL7Lb-0006Fa-BJ; Thu, 26 Jan 2023 13:51:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL7L0-0005F3-Tb
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:51:09 -0500
Received: from mail-mw2nam12on20630.outbound.protection.outlook.com
 ([2a01:111:f400:fe5a::630]
 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL7Ky-0002uK-EE
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:51:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+xzKnoMFqIou52X4NVp0n383oPFF7lQYwxQe5FhpoHMyy3FdLJEc7W5viXhF4jBpdr6ItaNS6hGMibDlHtzUq1Z5pSMacKvMFXBfVOmP76NxVWEIKJ6CRCRvUqTDBEESFfLnqgMv2BFKShYvj3bUX65i+tLz9LXyrX8QeOgG5+OjbpvjE/0dPAw0Na/fxiB3xNOLFPt39FIgyChqvhKYLsFx00Qui6ANKFJL0pb2FkX4q6DOo1n0+PIaeAKkoVxT4Xi/TyXHwJ6qZUZKc1FN1Bx8OH8GBJbsKiLgaQI8W2UOypPbxj7t9eE12xDYTaOU0Z0+2kY+1KZhYg+vk7+VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IW2YpEbwYjtEzjPon1/scu8kulvXmZs+gcjsw+mhPxg=;
 b=AhP2Jig8udIRJ/eOjFuyyh/OrzCbLjY1h0D4P2ShhMaXExF8e0ghBLAl58JcYJ+ecrQFJlH9t95KlNu0lkkESsfnFf1b7QhWXHFgiALfLrtYojEtzgfDAk8NuXrXIJrin8M6XEMlhViFQd8Uh1KXn/JL6IzCCgO6tmQQFemORJkixJiBiT2ZZYI6dB2DGcjDCNqvqU9KUQtHNEPy6BOrssgpGTU6JzTPw+aZGaaYIjKC8FqwcV5jUZ1ccsVQYJ6nCVshFtkbN+wCmWiOmhzmOc+OZSgRQuUvKk896NlQszfJHm7ech5LMwKz/Nbs1ggIyAfJS9cYiP3qWT85oAwrOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IW2YpEbwYjtEzjPon1/scu8kulvXmZs+gcjsw+mhPxg=;
 b=LH4+vW3OeS+9u4VDJUdUer/AyC4cqE3huI6Qk5UP16rHDmNk/JcBjqYbxJXPpcZHzo7bQ3t9CIRQ96w9QUtClQasCE3d2s7/IOJe2I55s9Yx6ink9vwwndYw6qU6qE4fILhxtBQRO1q/a127XeKf2FXxrhdnNxJNF/NI/4x8ehq3Zm5MDhJSX2Y5GFlDnyNFd3hKMO8TrHjnPKvIV4v901qy1IVooNftTJdhxiBlXziWlfXxJ5eNyx2iXobs3TW782922LjIHWM5YwPLFqG0E+s4+sJMdy5ev0JR6r48EAcDpvCbUtJCj+ei1D60wkn7fzTbo64P33nEgBW7IL+t5g==
Received: from MW4PR03CA0201.namprd03.prod.outlook.com (2603:10b6:303:b8::26)
 by CH3PR12MB8546.namprd12.prod.outlook.com (2603:10b6:610:15f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Thu, 26 Jan
 2023 18:50:49 +0000
Received: from CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b8:cafe::a2) by MW4PR03CA0201.outlook.office365.com
 (2603:10b6:303:b8::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22 via Frontend
 Transport; Thu, 26 Jan 2023 18:50:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CO1NAM11FT057.mail.protection.outlook.com (10.13.174.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.21 via Frontend Transport; Thu, 26 Jan 2023 18:50:48 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 26 Jan
 2023 10:50:43 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 26 Jan 2023 10:50:43 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport;
 Thu, 26 Jan 2023 10:50:39 -0800
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
Subject: [PATCH 11/18] vfio/common: Add device dirty page bitmap sync
Date: Thu, 26 Jan 2023 20:49:41 +0200
Message-ID: <20230126184948.10478-12-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230126184948.10478-1-avihaih@nvidia.com>
References: <20230126184948.10478-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT057:EE_|CH3PR12MB8546:EE_
X-MS-Office365-Filtering-Correlation-Id: e679f3b1-0582-4da5-de9e-08daffce3dbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u+4DLvm/Cd3b2Q2wKlmgzSgv8q24BRmibZgwRgQCtiGP3KqjUNd17cf7jmWiMfMLHAAmmJ7ybMwQRiSh9LjTJnuCtQbc2yk7PUF2z+C+mWdJReb2/xWpeKo0TI6dS1ES37jQYk2X1bkqOckQOhAWTGMameDDCew6QMLxay9mLOue9jo/qKn4qCUS05ksZxPM12vHZ5acSVde48805WEO17O3PWwJwLvkDIi9g/MesQ1J7RDM6boccSRmXpJq80VteGM5VkuV0eAaW44QNylc4U8kLc6Bs//DYzVO9K0EGUJGArBttEDFxYxMDfALpbZ22e118lTEXHVQzLO4Llo4U3Vu/P+HTwNhVg7be2SMgYlrXAksc59SsHQJNO4H/v8LojaEP/7HiUtc6h239jPlqaDUlSq32PWRgU8Tyf0H8IfZgS4eSGmeMRQpNGae+jnYQf8ptrO9zU2Rna4YnUhuPFybLn74qtepmFejgezjH/77O3yCwvaqxbTN5ApdTVL7OjMGM37GHq5JAod5LhbA6kd6N4wOiqGGLU+iFnYG6BZcDgWMAeI8gXJdzRS6NyutQVzEgLleTsb352w9P8qpxtnuF5u7GFsKNWgLAIQi+0t7m3pAStc1nZjAoLfkB589KjBo2MNGKJk0vWVm8c+MzvDfv5Sa1MGXuU7d2vQ2mtEwFDzHCeu+S8lPdE6GazOAPCA/dh+jwfOl5ey/CmyFz9AxHYtmcQqaKGALK4HbfYE=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(136003)(346002)(39860400002)(451199018)(40470700004)(46966006)(36840700001)(316002)(47076005)(82310400005)(86362001)(40480700001)(36756003)(40460700003)(356005)(36860700001)(7636003)(54906003)(82740400003)(7416002)(2906002)(8676002)(66899018)(6916009)(41300700001)(4326008)(70206006)(70586007)(8936002)(5660300002)(186003)(26005)(1076003)(2616005)(7696005)(83380400001)(426003)(6666004)(478600001)(336012)(14143004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 18:50:48.9477 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e679f3b1-0582-4da5-de9e-08daffce3dbb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8546
Received-SPF: softfail client-ip=2a01:111:f400:fe5a::630;
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

From: Joao Martins <joao.m.martins@oracle.com>

Add device dirty page bitmap sync functionality. This uses the device
DMA logging uAPI to sync dirty page bitmap from the device.

Device dirty page bitmap sync is used only if all devices within a
container support device dirty page tracking.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/vfio/common.c | 93 ++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 82 insertions(+), 11 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 3caa73d6f7..0003f2421d 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -355,6 +355,9 @@ static void vfio_bitmap_dealloc(VFIOBitmap *vbmap)
     g_free(vbmap);
 }
 
+static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
+                                 uint64_t size, ram_addr_t ram_addr);
+
 bool vfio_mig_active(void)
 {
     VFIOGroup *group;
@@ -582,10 +585,19 @@ static int vfio_dma_unmap(VFIOContainer *container,
         .iova = iova,
         .size = size,
     };
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
+        ret = vfio_get_dirty_bitmap(container, iova, size,
+                                    iotlb->translated_addr);
+        if (ret) {
+            return ret;
+        }
     }
 
     while (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
@@ -611,12 +623,6 @@ static int vfio_dma_unmap(VFIOContainer *container,
         return -errno;
     }
 
-    if (iotlb && vfio_devices_all_running_and_mig_active(container)) {
-        cpu_physical_memory_set_dirty_range(iotlb->translated_addr, size,
-                                            tcg_enabled() ? DIRTY_CLIENTS_ALL :
-                                            DIRTY_CLIENTS_NOCODE);
-    }
-
     vfio_erase_mapping(container, iova, size);
 
     return 0;
@@ -1584,6 +1590,65 @@ static void vfio_listener_log_global_stop(MemoryListener *listener)
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
@@ -1627,7 +1692,8 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
     VFIOBitmap *vbmap;
     int ret;
 
-    if (!container->dirty_pages_supported) {
+    if (!container->dirty_pages_supported &&
+        !vfio_devices_all_device_dirty_tracking(container)) {
         cpu_physical_memory_set_dirty_range(ram_addr, size,
                                             tcg_enabled() ? DIRTY_CLIENTS_ALL :
                                             DIRTY_CLIENTS_NOCODE);
@@ -1639,7 +1705,12 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
         return -errno;
     }
 
-    ret = vfio_query_dirty_bitmap(container, vbmap, iova, size);
+    if (vfio_devices_all_device_dirty_tracking(container)) {
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


