Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D56B69FA79
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 18:51:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUtGq-0001hI-Ta; Wed, 22 Feb 2023 12:51:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtGk-0001XJ-6o
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:51:06 -0500
Received: from mail-dm6nam10on20603.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::603]
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtGi-0004gm-2e
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:51:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JPlZIctUrziSo/MrpRyFQ1GUKr+88PeE3FJ7CXeOoM7LbFZm3olc/7CzoFnIV8oOeJ0h6k9N2SYP0NTrgiCVLGNWUJ+5bdMrnwtHHOAihacK0EFWWVdql93vT/41uIjqGf9hjPvVYA/jdFitCQ/u15k8Xu8t3mN0QjwEoe6Hzv5x1/E4+FVL2Ryu+21GtzHV6ZFCV4nveeReNz8uyttImxBwfr/kFUr/nKsa/D/cKd2Sib+JGCc1rco8i3LdkV7K3XT2AocizY9NJq/2Yc6f9q7Xq4v73MUttJGycaNj7JZzyLgq6mbqWQtdnI//RuLanUQsAyUeJGA4ioMBr39+/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gM/3mxEWLiI68YZL+YmuiSddmce59bvGTMzbqaTB6WI=;
 b=YhFzI9kVJAvhHpSSemR/tNHsAQE+eNEaarvhcN5t3bnTgiaQfPS+LstwzqINcIp/kR1Zp7Q1IBeP/hTqAFVYBc1KXvZtc08WDmMzaXwJ54U3f3mUgx7i8FsauZOWxMTyIuqva35FGV/M7QijJNMEKTTJvqkw/zk4pWJoW0x7K84gh6S7sHpDTLf9HsKPabABWBPN8HBtmQMpPuMkzJNddTRn1/7OrXZXYk0QF2Mx9jNArtav7C/BjP+8d3QelKTZB0/zeBDph0O2beo3dPHK8MZkK2fR5TrN1RXGPB8f04++cUBuKJlTnznOdXG2dF+Oe4mhLLIz6NAwEvySbOZXwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gM/3mxEWLiI68YZL+YmuiSddmce59bvGTMzbqaTB6WI=;
 b=ebaGBmzjyRyFkY6eH+dYAd2eEbRMiPvqkbKIl/qB605vBBLS2JM4obdQRyA52t4CXycLAGA3ajWmCwrPnfyM/sUPjpHsq/FdXWrO0c13retYS3ifWXE/7b8NWZtz13d0jURWsjqv0r457+2FAYdUs6FJM35sk1vV64KDstgDs45w0kctrKsBalO8XXVJfGIeb94h1pXDkzRJ3zJXPeSNHt9u2o9AhiHwy//IIg3pEB7lESsWQzeXhfFPkmh87DLqYd8SwFDL3gM4kGz//UkzMnoO6p/ChcGOiPvKlmFpk0cZo3tIzMQ4OUdeq0hV55RVAFnsk/IQ0HmQOE8OlcIEww==
Received: from BN0PR04CA0147.namprd04.prod.outlook.com (2603:10b6:408:ed::32)
 by DM4PR12MB7501.namprd12.prod.outlook.com (2603:10b6:8:113::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20; Wed, 22 Feb
 2023 17:50:59 +0000
Received: from BL02EPF0000C403.namprd05.prod.outlook.com
 (2603:10b6:408:ed:cafe::54) by BN0PR04CA0147.outlook.office365.com
 (2603:10b6:408:ed::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21 via Frontend
 Transport; Wed, 22 Feb 2023 17:50:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0000C403.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.14 via Frontend Transport; Wed, 22 Feb 2023 17:50:59 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:50:43 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:50:42 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Wed, 22 Feb
 2023 09:50:37 -0800
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
Subject: [PATCH v2 14/20] vfio/common: Extract vIOMMU code from
 vfio_sync_dirty_bitmap()
Date: Wed, 22 Feb 2023 19:49:09 +0200
Message-ID: <20230222174915.5647-15-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230222174915.5647-1-avihaih@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C403:EE_|DM4PR12MB7501:EE_
X-MS-Office365-Filtering-Correlation-Id: 49773ebd-b981-4982-6596-08db14fd5b5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +X2IMFlfU/QecwkgcvyqxRjrn+feY2LZvOmd/44HGyRMUEL5LMSMQwl0aCsZkV9ylbo+lf5MQ+YFlNs/PvgW//gkyM3Giq5/shgyzQDqYU+J8pZ1HmMXWw2/41ZDe2eqfwsmqCkJPoVmh2qfm/BDG7WJndv7wgoM9wj9V71+LNvQOvX6noppamCpMgWTkCMpyXjZAo/McibZamtlmGAjRU+D3JmLT2KayeRbTQy3GPtWa9v99xVFlD1Ttur6/0MP6HG2kZMCvbirYldDLiiL5z/e2c+7O9euxrfFq7B6KEiJFmaY18Atrldql4RMe3pEyRExcbpPZFbOY9jRlfxqeWvAdh/m0hC+IAWhS0VxFLzPztLel+fpt3uOe4kmvTD0H9TeyUnZEOOcxq7ETiL8Mn2tkH3tJ/0yexVC458KFsaT8xXiR1jHMu7qNCQc+uBD85qO2RSKdA53iVfEK+QFOj4Jtc+e+nLXFPTvEtzmGRAH0zP4Q++Q4qlKbpxlDHZ/A3MpMsl1ZYtXcKOFECyWiwCovljdrrcArtYV2H+OCKdFWRF0zxya5xL9SYpSndKDbYP/O9o5NBs7MYisuykxcdEcsRGiXFhCPGnJImKOECiXr0Xc1PQU0jZn+WPr5AzWBKMAUGr7t7UDcwzVFFQQYMax951OU+S7qmfm2ykXvd8UYHXeJwZvCD/q8g7S5g3FgjGeup/x+UFLe/FGLdE5C/Nr845DW0KeF/wGNUcZbxo=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(39860400002)(346002)(376002)(396003)(451199018)(36840700001)(40470700004)(46966006)(2906002)(186003)(26005)(41300700001)(356005)(82740400003)(6666004)(1076003)(7636003)(2616005)(7696005)(5660300002)(7416002)(36860700001)(8936002)(316002)(478600001)(40460700003)(8676002)(70586007)(336012)(40480700001)(6916009)(82310400005)(70206006)(4326008)(54906003)(83380400001)(86362001)(47076005)(36756003)(426003)(14143004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 17:50:59.3154 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49773ebd-b981-4982-6596-08db14fd5b5d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000C403.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7501
Received-SPF: softfail client-ip=2a01:111:f400:7e88::603;
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

Extract vIOMMU code from vfio_sync_dirty_bitmap() to a new function and
restructure the code.

This is done as preparation for the following patches which will add
vIOMMU support to device dirty page tracking. No functional changes
intended.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/vfio/common.c | 63 +++++++++++++++++++++++++++++-------------------
 1 file changed, 38 insertions(+), 25 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 797eb2c26e..4a7fff6eeb 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1866,37 +1866,50 @@ static int vfio_sync_ram_discard_listener_dirty_bitmap(VFIOContainer *container,
                                                 &vrdl);
 }
 
+static int vfio_sync_iommu_dirty_bitmap(VFIOContainer *container,
+                                        MemoryRegionSection *section)
+{
+    VFIOGuestIOMMU *giommu;
+    bool found = false;
+    Int128 llend;
+    vfio_giommu_dirty_notifier gdn;
+    int idx;
+
+    QLIST_FOREACH(giommu, &container->giommu_list, giommu_next) {
+        if (MEMORY_REGION(giommu->iommu_mr) == section->mr &&
+            giommu->n.start == section->offset_within_region) {
+            found = true;
+            break;
+        }
+    }
+
+    if (!found) {
+        return 0;
+    }
+
+    gdn.giommu = giommu;
+    idx = memory_region_iommu_attrs_to_index(giommu->iommu_mr,
+                                             MEMTXATTRS_UNSPECIFIED);
+
+    llend = int128_add(int128_make64(section->offset_within_region),
+                       section->size);
+    llend = int128_sub(llend, int128_one());
+
+    iommu_notifier_init(&gdn.n, vfio_iommu_map_dirty_notify, IOMMU_NOTIFIER_MAP,
+                        section->offset_within_region, int128_get64(llend),
+                        idx);
+    memory_region_iommu_replay(giommu->iommu_mr, &gdn.n);
+
+    return 0;
+}
+
 static int vfio_sync_dirty_bitmap(VFIOContainer *container,
                                   MemoryRegionSection *section)
 {
     ram_addr_t ram_addr;
 
     if (memory_region_is_iommu(section->mr)) {
-        VFIOGuestIOMMU *giommu;
-
-        QLIST_FOREACH(giommu, &container->giommu_list, giommu_next) {
-            if (MEMORY_REGION(giommu->iommu_mr) == section->mr &&
-                giommu->n.start == section->offset_within_region) {
-                Int128 llend;
-                vfio_giommu_dirty_notifier gdn = { .giommu = giommu };
-                int idx = memory_region_iommu_attrs_to_index(giommu->iommu_mr,
-                                                       MEMTXATTRS_UNSPECIFIED);
-
-                llend = int128_add(int128_make64(section->offset_within_region),
-                                   section->size);
-                llend = int128_sub(llend, int128_one());
-
-                iommu_notifier_init(&gdn.n,
-                                    vfio_iommu_map_dirty_notify,
-                                    IOMMU_NOTIFIER_MAP,
-                                    section->offset_within_region,
-                                    int128_get64(llend),
-                                    idx);
-                memory_region_iommu_replay(giommu->iommu_mr, &gdn.n);
-                break;
-            }
-        }
-        return 0;
+        return vfio_sync_iommu_dirty_bitmap(container, section);
     } else if (memory_region_has_ram_discard_manager(section->mr)) {
         return vfio_sync_ram_discard_listener_dirty_bitmap(container, section);
     }
-- 
2.26.3


