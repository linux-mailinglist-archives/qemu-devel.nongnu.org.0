Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C8F67D4BA
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 19:55:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL7LZ-00063X-KA; Thu, 26 Jan 2023 13:51:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL7Kf-0004fI-Kn
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:50:56 -0500
Received: from mail-dm6nam10on20616.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::616]
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL7Kd-0002lW-HQ
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:50:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RK0sQIk0dj4Tl9SLq9XMyG/hTEDQqxWUPJd3siCeugcme0ERGfqeqkO/OJiGdZDrJvIPTrBkW5JmJZoAlYIa1C8NPJo6nIV3MQgTVRQ48Dkavs5p1W9scRtA+bex5E/AewT3rRMlbukMlUrVVMrM/udDrMfTYd2CJ5wgi8DZvIYsYyX9Y01DkDdMOaEaoiyTzahEeZxEuMMePg0Ss2XNTaiyd9IYB9IVuqxhOuZrLW6ZjMPAiPStTfh3JRM5bLj3Wu5TsHideoHkHYBlo33m9jHeIqvajpadXFJjj7l78iwOkc8q/ZJQixBXvzE8/3kSlUFYtEFWC8jVKn8B9GVLww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQ+NskwLHTnpthg5KMKf7zCi+c2zgVf/AnBQH4DHTSA=;
 b=Rhvg+nDGg+BfNX1cRw3G8q+B21ZCubM54ZS89mfYlQhuVvK2OTQboY+XfPY5gb2qk17tUe4Q42F12voItxWPxGBkiIiRXVoAUYafLGgByp3cWd2YHKW86bqpg43gcH6nDLtq1C5Ty6nbN+mt1kFiZ6zmGcEt6KyrVwZn+2QHonz/HbUe+/cU+UIGNM6+mLrFv731M3bUmqwsl2rAeMwBASfvFywDXsDSmCRwLhPofJS6ypzgdBh94ScqfW9eRMpWhW7XmuqHM6ayOBAScyf+V/bVRPGzs95O4irkp3JVl2cMVw4QlV4lCulWFCAnDuK/vIDV90ak++gXL+faFoDBxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQ+NskwLHTnpthg5KMKf7zCi+c2zgVf/AnBQH4DHTSA=;
 b=QZUqkV+zyv1SDaOjvAhNKHtxKszj8PYufxKqrfZRz13AS6mGyUO3zit16W8Nc79zegn8PdLpo0OBB+IujU8inlU5QHDrQo7NAeFOHI01j+DghWiQQn4sBBYv6nJMEFwfUqy5010oxRxr5rAY2/CjhN2sr2/rwAhOZiPriJMznBZ1sg1sgDmVJppc/gqPr48qe8Y7JQPRBByfwBltan5+jyeqgea7zYmP6YICEUvV93NOKDVe2L9g6M7uSgXl7AWhgaYDWnc5gs4lv7zCXA63mWjm23hGdZ/bV6fuDucye66DPm3LgHsZu26mvSN8+qw4kxAkvtfX6W8G1bbfSzewmA==
Received: from MW4PR04CA0297.namprd04.prod.outlook.com (2603:10b6:303:89::32)
 by DM6PR12MB4973.namprd12.prod.outlook.com (2603:10b6:5:1b7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 18:50:40 +0000
Received: from CO1NAM11FT113.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:89:cafe::93) by MW4PR04CA0297.outlook.office365.com
 (2603:10b6:303:89::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Thu, 26 Jan 2023 18:50:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CO1NAM11FT113.mail.protection.outlook.com (10.13.174.180) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.22 via Frontend Transport; Thu, 26 Jan 2023 18:50:39 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 26 Jan
 2023 10:50:39 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 26 Jan 2023 10:50:38 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport;
 Thu, 26 Jan 2023 10:50:34 -0800
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
Subject: [PATCH 10/18] vfio/common: Extract code from vfio_get_dirty_bitmap()
 to new function
Date: Thu, 26 Jan 2023 20:49:40 +0200
Message-ID: <20230126184948.10478-11-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230126184948.10478-1-avihaih@nvidia.com>
References: <20230126184948.10478-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT113:EE_|DM6PR12MB4973:EE_
X-MS-Office365-Filtering-Correlation-Id: 43abef5e-7c8c-42dc-afb1-08daffce3839
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IR7B/r3D5VqR1Kfl+Njp6YyYZkBNCrI+PE2xfMIYdJGghZiRTcZ1KyO8bUALH5DJftWPHE2w8dPaoirN27gsaCSEo5ddPA7+Zrfviyl8+/SI52NnhOpBPRqLEoo4l78ejSQ/TYfqcz8BT2gRkD+ZtdXxWl5GFLfICJP1/aAKZrrsOCcgu7cZaqyq5PYjg0E/fUctW+vN+1spK3lSR9xKmHyoQ6LtPMojnl5tj1WCOJAITlt4QN/XoLE7GWoyFi689O9n+kr9aBXp+V/ed1yVZHvcz95ODdzh+TosMLSA/yZ/L4BZYTsue+iP8ouU6wOHXulhM61DwS3zD//NFxhNGYFiIq06q3Sz7Azv+SZJs5I32CBaOhk+hOq1TIbZDy/KXEjqt3EPVXCKV23i6hcsKBkJnKrGwSLApYh1FuJ1Bc/wE9zjG1/oLlA1SjdbYYww5zvufdzizpGkMLktfMD4Et/PEYlz6plYuAqktRRwssZcDY4DpmvMhl4rqJ2hK9/MbTKoadZ8yohAAf0OG5wp1fM84KxM29ms6UwfgQ69DLAzq9jbzCEeDWpHq3BbW6yKBfk8Y4k533/E5jVfpYDSv3ipVi80/24BYfSkpNLhRRrY8KGf/+G7yEZDegbKC8e/7UEjBaYNcgXCBlRnz4pxTu4GfqYa9WIBgv0hL96mUpgLLKpRY66GdxVG983TXrpgByHmJAihFkcTDHXecpoQUSSuh6GE+ft14nTWcHDuvz8=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199018)(40470700004)(46966006)(36840700001)(66899018)(47076005)(8676002)(40460700003)(36756003)(7696005)(356005)(86362001)(36860700001)(7636003)(2616005)(82310400005)(426003)(26005)(83380400001)(336012)(186003)(54906003)(40480700001)(478600001)(7416002)(5660300002)(6666004)(316002)(1076003)(6916009)(41300700001)(82740400003)(8936002)(70586007)(70206006)(4326008)(2906002)(14143004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 18:50:39.7059 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43abef5e-7c8c-42dc-afb1-08daffce3839
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT113.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4973
Received-SPF: softfail client-ip=2a01:111:f400:7e88::616;
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

Extract the VFIO_IOMMU_DIRTY_PAGES ioctl code in vfio_get_dirty_bitmap()
to its own function.

This will help the code to be more readable after next patch will add
device dirty page bitmap sync functionality.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/vfio/common.c | 53 ++++++++++++++++++++++++++++++------------------
 1 file changed, 33 insertions(+), 20 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 005c060c67..3caa73d6f7 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1584,26 +1584,13 @@ static void vfio_listener_log_global_stop(MemoryListener *listener)
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
@@ -1627,16 +1614,42 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
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


