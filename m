Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB38C69FA80
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 18:52:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUtGE-0000OL-77; Wed, 22 Feb 2023 12:50:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtFw-0000KR-SW
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:50:19 -0500
Received: from mail-bn8nam11on20600.outbound.protection.outlook.com
 ([2a01:111:f400:7eae::600]
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtFv-0004UM-3e
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:50:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5zYrkoLKG2NSIDI6SZFKSdZGNeQmZ7mXT4KM99XNcoT6ZCEHerbcPax7N7dhAhE4azbTmMP/WLMQutdtB8vUhovxssio6xNBeUghqbBSi2+LBm1y5p8wdq0/EYIBAa4H0JEln9/LLxiU+9mwGaG31/Ei/4RaAwUp0waITEitIXGrf6w5loNVrA7OLL1vVvkVmA8Ddfc86iFBSHiLuBS/KQkAqzIT+mYMvoXvBHEvMwCiD/oIkyZcaHwkyrsxGrJlwup4u3SDN+uNjfj0k+lMws66hasfHc+cTPukYQazaOZgQrUXc2HZxM3acCaCCrN1EzpdzGi73jtoAgXl0kpjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+xCzB/Nt9FY/rO0YUCNnQRxutaJkP2rKNzqTJl2iL8=;
 b=fAO5Z+JsifsBel9X2UyZQGcCtfCbAy3ehpH7GX3Lzn9WDos+9GqS5YRtVPn+5lvQ7SGd5850cc9dbXhQDmL2zTpUCyd75MBICJx8w3fa3u1WoyQFkOE3b38zzFc06RGoT9refm/XwCTveDEaXiHPjBSvvCGLny/Zev5490pfvgiGei7GNuiTWwcuKpbCwgyTZiP0BbcaNVBzXf4CvOG1XmotDCgqWmF4H7/Gz+aB9faEJJ1xUPwbgcJHX8Q19/OM6sM6ZUkDs96ioFhNfQLFD+6CXq9LLN5M7U406bQWqU0hzB1IoOveT1fxM6Qrb9GSt3O9P4i3t1lfvesOnqYSZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+xCzB/Nt9FY/rO0YUCNnQRxutaJkP2rKNzqTJl2iL8=;
 b=Ril5G40Z+i7r6LjEjgKQVKhRHWAmvON4NwelCM2bW/TeCPg3STXpXNWN4MxDvsRvH/AI2ypTnGXnhLUFF6rx5Cmy+rySLVoO9lKVJVGJbdFj5xZhtj03m/mksFyr8l/0QGQO5v4mw667/I8WJYybpTtiIe+L//Z5P2laaY/mSPzQlrhRv8jfI8ohWSE24HuzmPNyD/v5RlpWgidmExzORLsaoMq32Ca7vWLVafbz4K62zfogFfWZi5dCBSHah2g/pTSbkpBCNUhp0PdglRI5o8w+SBSy/36GJKFd0k/vrGdE6npYj0e81OKrbQPcomi6vCvNO9dm4r1VoTifkQG/Zg==
Received: from BN9PR03CA0707.namprd03.prod.outlook.com (2603:10b6:408:ef::22)
 by SN7PR12MB8060.namprd12.prod.outlook.com (2603:10b6:806:343::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20; Wed, 22 Feb
 2023 17:50:08 +0000
Received: from BL02EPF0000C407.namprd05.prod.outlook.com
 (2603:10b6:408:ef:cafe::b4) by BN9PR03CA0707.outlook.office365.com
 (2603:10b6:408:ef::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.23 via Frontend
 Transport; Wed, 22 Feb 2023 17:50:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0000C407.mail.protection.outlook.com (10.167.241.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.14 via Frontend Transport; Wed, 22 Feb 2023 17:50:08 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:49:51 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:49:50 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Wed, 22 Feb
 2023 09:49:45 -0800
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
Subject: [PATCH v2 05/20] vfio/common: Fix wrong %m usages
Date: Wed, 22 Feb 2023 19:49:00 +0200
Message-ID: <20230222174915.5647-6-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230222174915.5647-1-avihaih@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C407:EE_|SN7PR12MB8060:EE_
X-MS-Office365-Filtering-Correlation-Id: aa137e8d-59db-4ae8-809e-08db14fd3cdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QlU+lJL6QZMTsXLUsz/RWcdnSYlCaaMMgSiPKgXJYMnUWPMPAYaLnSdGerntB7TsEVI8J9dZDFn9eoANO5EGDX88hdd/Rrm5eN201fJ4rwV/VRhErOPcQ2EKvR/qu+5l5tQqR6mAT5qG/iWQH2kdR5mwS73shgDEFQHwuhy4gYs4KHD4oBk9eWtFUdAB5F4xHC1CQUowbPd6d6hpb1SCjacW0NKL9frw9F8T7+4q7ywMcVYt7b/b0Kp7s34aC6FnD7c8NESKXzwdl67DxWd7zFOYhDus84sDF9jFz7aJ/2+7xam36aH1mM6FGZOZLjbl67slrGQyxAvti0zKjpCpnZK+5JhF4PSbpbTT0bUtUhKZZtOm2Q3+yUBINIynTwJPSd4NnGZvwUOgVHHF5u+mAHN2msrGBveWejaR/5WZK28JguN/qfAL2yM1c24yHpU249dozALB+wvjA/uw05FD3cJzNJy9dEaFgPqNVFbecpQgXgiypXcVmxpvDi3h8GF3n3lXa3JyrV+9xOpZ5OJ/wKbYb81BpdMxdWffJeB2+vS1XJ0hJOkBiMI/pb8+V7S94GRFvlKvROrn77TIvHl79A8VWZ0/hMIu5oUeiID3a9RymtIJ0Bv/sRrTVErCjp56Y2vmkbtOMeDUwkkmiGp7L4g6MweYWaS04lG6xsyJTpCrlxb4D9X2WKnXSLT3JXCyAdGHABw8tZLGVPV4UUozZQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(376002)(136003)(346002)(396003)(451199018)(36840700001)(46966006)(40470700004)(26005)(6666004)(186003)(7696005)(83380400001)(2616005)(336012)(54906003)(1076003)(478600001)(316002)(7636003)(70206006)(4326008)(2906002)(8936002)(8676002)(6916009)(41300700001)(70586007)(7416002)(5660300002)(82740400003)(36860700001)(40460700003)(40480700001)(36756003)(82310400005)(47076005)(426003)(356005)(86362001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 17:50:08.1325 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa137e8d-59db-4ae8-809e-08db14fd3cdb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000C407.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8060
Received-SPF: softfail client-ip=2a01:111:f400:7eae::600;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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

There are several places where the %m conversion is used if one of
vfio_dma_map(), vfio_dma_unmap() or vfio_get_dirty_bitmap() fail.

The %m usage in these places is wrong since %m relies on errno value while
the above functions don't report errors via errno.

Fix it by using strerror() with the returned value instead.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/vfio/common.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 27db71427e..930eda40a1 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -705,17 +705,17 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
                            read_only);
         if (ret) {
             error_report("vfio_dma_map(%p, 0x%"HWADDR_PRIx", "
-                         "0x%"HWADDR_PRIx", %p) = %d (%m)",
+                         "0x%"HWADDR_PRIx", %p) = %d (%s)",
                          container, iova,
-                         iotlb->addr_mask + 1, vaddr, ret);
+                         iotlb->addr_mask + 1, vaddr, ret, strerror(-ret));
         }
     } else {
         ret = vfio_dma_unmap(container, iova, iotlb->addr_mask + 1, iotlb);
         if (ret) {
             error_report("vfio_dma_unmap(%p, 0x%"HWADDR_PRIx", "
-                         "0x%"HWADDR_PRIx") = %d (%m)",
+                         "0x%"HWADDR_PRIx") = %d (%s)",
                          container, iova,
-                         iotlb->addr_mask + 1, ret);
+                         iotlb->addr_mask + 1, ret, strerror(-ret));
         }
     }
 out:
@@ -1097,8 +1097,9 @@ static void vfio_listener_region_add(MemoryListener *listener,
                        vaddr, section->readonly);
     if (ret) {
         error_setg(&err, "vfio_dma_map(%p, 0x%"HWADDR_PRIx", "
-                   "0x%"HWADDR_PRIx", %p) = %d (%m)",
-                   container, iova, int128_get64(llsize), vaddr, ret);
+                   "0x%"HWADDR_PRIx", %p) = %d (%s)",
+                   container, iova, int128_get64(llsize), vaddr, ret,
+                   strerror(-ret));
         if (memory_region_is_ram_device(section->mr)) {
             /* Allow unexpected mappings not to be fatal for RAM devices */
             error_report_err(err);
@@ -1230,16 +1231,18 @@ static void vfio_listener_region_del(MemoryListener *listener,
             ret = vfio_dma_unmap(container, iova, int128_get64(llsize), NULL);
             if (ret) {
                 error_report("vfio_dma_unmap(%p, 0x%"HWADDR_PRIx", "
-                             "0x%"HWADDR_PRIx") = %d (%m)",
-                             container, iova, int128_get64(llsize), ret);
+                             "0x%"HWADDR_PRIx") = %d (%s)",
+                             container, iova, int128_get64(llsize), ret,
+                             strerror(-ret));
             }
             iova += int128_get64(llsize);
         }
         ret = vfio_dma_unmap(container, iova, int128_get64(llsize), NULL);
         if (ret) {
             error_report("vfio_dma_unmap(%p, 0x%"HWADDR_PRIx", "
-                         "0x%"HWADDR_PRIx") = %d (%m)",
-                         container, iova, int128_get64(llsize), ret);
+                         "0x%"HWADDR_PRIx") = %d (%s)",
+                         container, iova, int128_get64(llsize), ret,
+                         strerror(-ret));
         }
     }
 
@@ -1386,9 +1389,9 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
                                     translated_addr);
         if (ret) {
             error_report("vfio_iommu_map_dirty_notify(%p, 0x%"HWADDR_PRIx", "
-                         "0x%"HWADDR_PRIx") = %d (%m)",
-                         container, iova,
-                         iotlb->addr_mask + 1, ret);
+                         "0x%"HWADDR_PRIx") = %d (%s)",
+                         container, iova, iotlb->addr_mask + 1, ret,
+                         strerror(-ret));
         }
     }
     rcu_read_unlock();
-- 
2.26.3


