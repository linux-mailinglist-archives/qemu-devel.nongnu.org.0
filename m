Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A184967D4B2
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 19:53:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL7ME-0006ex-22; Thu, 26 Jan 2023 13:52:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL7Ku-00052J-Mh
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:51:03 -0500
Received: from mail-co1nam11on20616.outbound.protection.outlook.com
 ([2a01:111:f400:7eab::616]
 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL7Ks-0002tK-Pi
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:51:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OMWP3dMpcv61eJpR+v2RpXWblhdvS+xgjCuXYH/w3Sdgzag5m2VU8iJMbpIRd8Zfd9QH8aFXzDHlb6OO+3SAxqLOnI6kf6deUmPn5XfhZMJA3aGhqO/NhpdHykkaYXwbETr0Wy8N6zPE87Fek/K44wVhBkxgRWjdzc070dgGQfoXHkcH4z5nz52xWlNsMKmtem/jfMl3u9x4ajfLBObSuFgDFuWBVWBzY/Ri503ll9bgt6IeSkYTUUcsd+nhGMCFVm3BRUG39tnb+UeLRrylp6+va2IVJ5iOR107P3e1JM3LcVZrpnUsanPLcLLJ6A5+JfJY1ZyBO/coFMkpm53wCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kSqK6swuTag6Nz82TO12D7shl3s6wvNTutEgUGVwe7o=;
 b=F2bSTRXa09rkuR2dVI0vg9F5y+vzMC3WNKmsBEkUD/5c50swh/MBUuGi85PIJji+5mF5RRd9d4bUr+Si71VbpJ6jy82t4iwo3+raO96jLV4mBGpTWUlikckB7dq/64fj2MzRnnSXRWgcJCB30lAn5FoGm7f1TAoJ0+InXbnPJvrpQpJcedfk8+YbmmkDSo2ILZaJK+s00eyX/kUZb0UXG0uqXXtQgn9Ze9b4bugJ7EA0IpJU2/ZtSMSSJFFti+fYh4RC/Ysz40lgHy2m8IT/ceGe3mofxHEuH8VVukhvrFDpRVgkbE2VwYIXNQhZFzzP1buTfp7tChlwS31/ezj+AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kSqK6swuTag6Nz82TO12D7shl3s6wvNTutEgUGVwe7o=;
 b=izRUqn9v2uZOu5AhXPoV0gnCg9Wz28YDSSVX1s1Db93+mEtCRhz7jBvQfoHKpJpVDBXnWOIHFMDNeyRHiSs4/mkGWs2KMFciHUMnGDQvIOR3qonRCLw3Z6GTFT+Yh+YJBCiDVTc5BJ4bZfXYAxKiuYtyJP4/FwGnU/vvynvJHngQqT9k90Nd8ERGGxMRI6axbci6IvxZPQU/fhk0Eg9r+n1Ukts4Fxxgye9ccIFoZ4x8nX1E9LcZpWU2QAHCVSvcz+L9x+3HWxuYIeYmaZJiOI2AST1Z91L8GVcVxmhcNPmYb5zQhxM4edyXKREc2ON+IDNwsfb3iowtf8HzVLEOuw==
Received: from MW4PR03CA0196.namprd03.prod.outlook.com (2603:10b6:303:b8::21)
 by LV2PR12MB5944.namprd12.prod.outlook.com (2603:10b6:408:14f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Thu, 26 Jan
 2023 18:50:55 +0000
Received: from CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b8:cafe::32) by MW4PR03CA0196.outlook.office365.com
 (2603:10b6:303:b8::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Thu, 26 Jan 2023 18:50:55 +0000
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
 15.20.6043.21 via Frontend Transport; Thu, 26 Jan 2023 18:50:54 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 26 Jan
 2023 10:50:48 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 26 Jan 2023 10:50:47 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport;
 Thu, 26 Jan 2023 10:50:43 -0800
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
Subject: [PATCH 12/18] vfio/common: Extract vIOMMU code from
 vfio_sync_dirty_bitmap()
Date: Thu, 26 Jan 2023 20:49:42 +0200
Message-ID: <20230126184948.10478-13-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230126184948.10478-1-avihaih@nvidia.com>
References: <20230126184948.10478-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT057:EE_|LV2PR12MB5944:EE_
X-MS-Office365-Filtering-Correlation-Id: 9abe5fc3-467e-4134-8f32-08daffce4156
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0M1BruHPP1lnaIbPEdgnAaOFkweDM8ccTVzTPBaW1yK5Es2AKF/eZZdc4O8ElIVHFxuLRq4kYU/HDFsiCi2d+jJe9KnkfrtMhkW1/D+TQxUUEkLR+T1dylsag2HIA37JDXj2NTHLim3j8Ie+8eLQkwA7z4abq9ryHc1N9yRC5HWsV5ZxsIAhyqcZoqPEsHlNIgMxrCbVGfAfA50k0M3fp1+AFLA/SSJityXdzExwYBhopTQTjQKeKEHmHo/NjqcJlWc9CTU8lMOIC7PsOZZqLqLAK6LZ0ZyF+6A8x/Y2SU5PSlsQIjkgihDoVhV0/vzR1NIoDMmnQqwvaI5QA7T0DUOok7LaDFxl+vbHGu3UQElZVjbFol60TpUJsAq8vKsql9V/cKUzYczt6FJztgfdLpXBtIRee5Z57TI+m1SyNaZx0UiVA//C+WD7rxa47tIWC89QlzMg+L7hyOjupDEo0pLvx8gbjNqiF3yCNGFc4IWE49iDCDM9APiFHy4cKd+IoPlETeGmbFOUJT+Lyorpbf9mcbIvqJa3nJVi3wOZ/pl8hQ+JY70VAeFP6CxMJHO+8j5sni+YA2C80ABRSzqgIHjxgu3CKSrW/CsIkCPBZ8RDYyf0zMZN2UkRxmVaKMF1Vju+g/GGwjACWMlpdD/N/BbW1Upxf2pnR0MB8/mcIBHZn52QjiaodA9uIpMOvOO5sChqwEXYaObcLo0XRWYnZd0q7XDzjHzqIl5UdVGmlfA=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(136003)(346002)(376002)(451199018)(36840700001)(46966006)(40470700004)(36860700001)(26005)(356005)(83380400001)(7636003)(5660300002)(82740400003)(7416002)(7696005)(41300700001)(2906002)(86362001)(82310400005)(8936002)(4326008)(40480700001)(40460700003)(316002)(186003)(336012)(8676002)(47076005)(2616005)(478600001)(54906003)(6916009)(70586007)(36756003)(426003)(1076003)(70206006)(14143004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 18:50:54.9790 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9abe5fc3-467e-4134-8f32-08daffce4156
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5944
Received-SPF: softfail client-ip=2a01:111:f400:7eab::616;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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
index 0003f2421d..9792c2c935 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1811,37 +1811,50 @@ static int vfio_sync_ram_discard_listener_dirty_bitmap(VFIOContainer *container,
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


