Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE38569FA72
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 18:51:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUtGk-0001Si-KD; Wed, 22 Feb 2023 12:51:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtGg-00018I-4u
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:51:03 -0500
Received: from mail-bn8nam12hn2032c.outbound.protection.outlook.com
 ([2a01:111:f400:fe5b::32c]
 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtGe-0004gO-3i
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:51:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oy5G/QaNEC/+4QGxm7rXV1mMi0iOBgKMjH9mTNSz97D5yX2xliJYgB8oYYyWTtWmMlXxNUXo2pTbsquRBvcUeEpvklKqWWJwB4udjNuOgSqxlZtUk1Q4LpOtBHSF3qfLOK6r+GBm2sjohNf3md3RTcmKOanQYNfC3YcuEIRx2D+clMT+A+oytPZ2Q4hBCW6iEByhOWPfdy/p0kzby/Ls9ctzJraNZy+3DIqgac96h8hZIuGB1q4iC2pueZfoMd6c8r4CFHqT6h+/lkqfAmO+3yPr7AYAqM9dzOtFARTDcfDYTmEHf/AgOkHEITfBIJNwHY29YYpXIjhlhdiTFI+22g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wRhfPjoGAzjNOGDndAf9hTbw3NCGkhDTCYNw83QQs8k=;
 b=JAVhHuJr87lL6Rvb6P5VW7h/m2kXNNXQySHV0iKEvQx8fB6cTSUWl82kzAjRGRyrUWwVlwoSu90P6cuMwarvatJrWTgeXeY2zQwJCQZVeYtMKBB8UnbulSjHNJVqQftl5cj6iFQQ0CqLIEYNOpyU0PNkZBf9wRArUuK1QlTsrnlDAQDO6FpTxoO1ytsNNVKO6YTZDjOBbHecj3lmBcrXNkpyklQk43I+J5RF/dPSBfC7AQruP+dUSBlDmh6U545v4i7YlEYd2kuKEpXV7NiWxYyBR8XO+gNlv/NanAPCFFKTazzKfVCcrhCl6k2UEJpmEvTd9ch4z0BE4ht4LZtAOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wRhfPjoGAzjNOGDndAf9hTbw3NCGkhDTCYNw83QQs8k=;
 b=hp0kFU8UVj8Yd4RZTYdTXi0rt0gEfbj0c7lmYgLdmhDpltp/d/Y9ALkAsGzMVU/4wqe8NAI3RDO3UVxrKmgtobODv9WmxcvvT2WInHMcWWsbJuZfgfsLu0EcrJ/BSo1MgGAqtxG2lP26mT+STUiFxvx74HGbvlfAIw8pACSTt1hVqJkg39MZSwOe0KTo5RpU5KnXoVraFM+EB4IaQ25EsVQU8HLgDaPmaa7RZ3z0H5pTI7NOBOvOZ7jXsmO2WyPPUky0lcl+RUNqqKoKW+Pw1ifowgOKovWE8h+WjszSiIGrpIp87cjgC6rze7rTkw53DLQ/v7VoHNqsfSP7tZVLVg==
Received: from MW4P222CA0008.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::13)
 by SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 17:50:57 +0000
Received: from CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:114:cafe::90) by MW4P222CA0008.outlook.office365.com
 (2603:10b6:303:114::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19 via Frontend
 Transport; Wed, 22 Feb 2023 17:50:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT043.mail.protection.outlook.com (10.13.174.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.20 via Frontend Transport; Wed, 22 Feb 2023 17:50:56 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:50:31 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:50:31 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Wed, 22 Feb
 2023 09:50:25 -0800
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
Subject: [PATCH v2 12/20] vfio/common: Extract code from
 vfio_get_dirty_bitmap() to new function
Date: Wed, 22 Feb 2023 19:49:07 +0200
Message-ID: <20230222174915.5647-13-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230222174915.5647-1-avihaih@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT043:EE_|SA0PR12MB4510:EE_
X-MS-Office365-Filtering-Correlation-Id: 953b4672-1012-4dbe-7369-08db14fd59aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QMSF/Zr5M1M+01jBQhI9QuZ5jLL/Jaj+rL2vMzTCuJvzlZpeCZSeItT8DiobSgkAK4pnC4qV8/DSjN9jvCZPsnJz0TdBvmgRB2ZYAV9fnOfTlaaalVfjcYIbO8AJjOj+FwL98iExUvkJhLTLDcFQL0inRvjquv8d6RjRFz8kgTmIh6HbRMX4XzOCJ3nWtuc3DQUGdWHFuOClRJdnXpDbBFF2J9bB3/gBBdp3brweKMfP3QQJROoKPOTWChY93AiootxeLExTrRYJm7Ca3qpWLl373BqqcSPpcjumnWeMbX9xParSIOkEk+kyc8IWKBIWm3JUCJFulMOtD0KumacZkgAl3GfnehCAkJ/EbV7sEKf0DSnhIdhr4j1qioz1Xd6DFCwa57P23tBy5diT/mHjjYRBV2CrZflRVsFJZeImXjFz8wZVxwajQ3sTfGDf+VLb0COEjxFD1dfBxw84dxF2CGOBpJQDz4o7zQiRF5xAMyqkarzOtNuavRQR/xS9kQ2jfibWHDZ6tG+UWE9/4ZDfn8aNyiMRMZQxxnChlvgDUyJbnnwh+RE0FWFUzlbj9Wt9vGIha3HlKKEpyNTbovdoiE+tsnGa3tEasIW6kJ6T+GGa4HlAfCFQnVV8e/oD7GhnUTArLCHXilIMXpU26uN/7u56RUMzvJBN+xWUv7hLFuJCIot6qrL96as4B8ULZaM9lH0zfZaye39t8Ot/tR+sqBrLC7EBsCdNQFHboBMGidyKr9x4v9C/nLaEhmejgFjcj/7t3pxiHADIRJFBjGN6WZ+FnBx1jvEvbrpBVFk+Of8=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199018)(5400799012)(40470700004)(46966006)(36840700001)(66899018)(82310400005)(40460700003)(36860700001)(1076003)(34020700004)(426003)(47076005)(83380400001)(7696005)(36756003)(7636003)(6666004)(316002)(82740400003)(54906003)(356005)(2616005)(40480700001)(478600001)(186003)(336012)(26005)(2906002)(7416002)(8936002)(41300700001)(5660300002)(6916009)(8676002)(4326008)(70206006)(70586007)(86362001)(14143004)(12100799015);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 17:50:56.5744 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 953b4672-1012-4dbe-7369-08db14fd59aa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4510
Received-SPF: softfail client-ip=2a01:111:f400:fe5b::32c;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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

Extract the VFIO_IOMMU_DIRTY_PAGES ioctl code in vfio_get_dirty_bitmap()
to its own function.

This will help the code to be more readable after next patch will add
device dirty page bitmap sync functionality.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/vfio/common.c | 53 ++++++++++++++++++++++++++++++------------------
 1 file changed, 33 insertions(+), 20 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 740153e7d7..3ab5d8d442 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1633,26 +1633,13 @@ static void vfio_listener_log_global_stop(MemoryListener *listener)
     }
 }
 
-static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
-                                 uint64_t size, ram_addr_t ram_addr)
+static int vfio_query_dirty_bitmap(VFIOContainer *container, VFIOBitmap *vbmap,
+                                   hwaddr iova, hwaddr size)
 {
     struct vfio_iommu_type1_dirty_bitmap *dbitmap;
     struct vfio_iommu_type1_dirty_bitmap_get *range;
-    VFIOBitmap *vbmap;
     int ret;
 
-    if (!container->dirty_pages_supported) {
-        cpu_physical_memory_set_dirty_range(ram_addr, size,
-                                            tcg_enabled() ? DIRTY_CLIENTS_ALL :
-                                            DIRTY_CLIENTS_NOCODE);
-        return 0;
-    }
-
-    vbmap = vfio_bitmap_alloc(size);
-    if (!vbmap) {
-        return -errno;
-    }
-
     dbitmap = g_malloc0(sizeof(*dbitmap) + sizeof(*range));
 
     dbitmap->argsz = sizeof(*dbitmap) + sizeof(*range);
@@ -1676,16 +1663,42 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
         error_report("Failed to get dirty bitmap for iova: 0x%"PRIx64
                 " size: 0x%"PRIx64" err: %d", (uint64_t)range->iova,
                 (uint64_t)range->size, errno);
-        goto err_out;
+    }
+
+    g_free(dbitmap);
+
+    return ret;
+}
+
+static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
+                                 uint64_t size, ram_addr_t ram_addr)
+{
+    VFIOBitmap *vbmap;
+    int ret;
+
+    if (!container->dirty_pages_supported) {
+        cpu_physical_memory_set_dirty_range(ram_addr, size,
+                                            tcg_enabled() ? DIRTY_CLIENTS_ALL :
+                                            DIRTY_CLIENTS_NOCODE);
+        return 0;
+    }
+
+    vbmap = vfio_bitmap_alloc(size);
+    if (!vbmap) {
+        return -errno;
+    }
+
+    ret = vfio_query_dirty_bitmap(container, vbmap, iova, size);
+    if (ret) {
+        goto out;
     }
 
     cpu_physical_memory_set_dirty_lebitmap(vbmap->bitmap, ram_addr,
                                            vbmap->pages);
 
-    trace_vfio_get_dirty_bitmap(container->fd, range->iova, range->size,
-                                range->bitmap.size, ram_addr);
-err_out:
-    g_free(dbitmap);
+    trace_vfio_get_dirty_bitmap(container->fd, iova, size, vbmap->size,
+                                ram_addr);
+out:
     vfio_bitmap_dealloc(vbmap);
 
     return ret;
-- 
2.26.3


