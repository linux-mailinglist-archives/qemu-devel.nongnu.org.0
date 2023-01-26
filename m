Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E684D67D4A4
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 19:50:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL7KK-0004PJ-7y; Thu, 26 Jan 2023 13:50:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL7KI-0004P4-4u
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:50:22 -0500
Received: from mail-mw2nam12on20611.outbound.protection.outlook.com
 ([2a01:111:f400:fe5a::611]
 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL7KG-0002TF-7o
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:50:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JGISUYGmYu3h0HzFVju+wLmgwNJpeizxNK51bTRM5sTz4X+siXsXLDlUBvWJ8UjtUB2LR2Ar6yL/wuT6eg4MTaPauY2EcYHuSWG3ipJXRC6CrGJlBt1/JulDjvQSaUQnzdYD5GNl0b9ZKVAgilFFPRX+Cjb1y3pCxrM5UAsJbRZt7kaPBWoR+uvUD4vuh0Mq0GxmFDWHfcs5eTOLU2NujDagKCJGx1NIYALlTi9DU7Kww0aOA9MALFlEtawsWNan8zhXQm2Ix2q+NJcA1MDvAGa8Sq/N/k6atS4hI7kh1vh3m9bd27CFrDwH7PfRD3xgBIjon0caTkqt6sDzX71dCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WjBf/rSgs42hm3eLxOhwIYXl87rKvUmqpjFmi0IwVko=;
 b=bcZHFX/ZpGGIJQ1DcVX+xhJXLNPl8gn28FC0Rn6DUHhLoZ7uYbt6KdoJIPtVOp+/0+ksj3vQJ4/CRv0urV42U340oUygkg4KJs6dwpoRfKI6Ou8vKEiB3DHZDOVKK1wrKmncF1XMFMiBEXcFcB4BpKLIullyoxCmiqhW7edF1jXP1NAWo0h7B+RVKadLTHGuR+SsW2td7qqXrl2YncDTYGnodLyqlpLwN01MHGDykhef9J+OfaCLnBo9dffxaJPDJJ42BIj2hVy3b0aDY3qTqGbmKA+m/Q1v95DNCEL/t5TrtjwvLFcpNZlgFA372itDSSQbkWl6Ps2zGdke81j1Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WjBf/rSgs42hm3eLxOhwIYXl87rKvUmqpjFmi0IwVko=;
 b=Fr8KKl83gA8Ndwpi+hR2RKOHZZEEgJrtCQOvAzMj8XarU9RZSlMVYGo3rYjW/Cg5CtBGB/1nySmLHWc7CS8H/sKjNIgJpwRsGKSfU2qjHsuQkTz+leXpclNH7qDA4Xz395bDozin6cGltBDWDX0BQTqa+Ykb1A3MoHgNx0idwjmCcixsfO3HTzI600h7FAd+szhwpQHcYYftCK5Eo370/QhvCznz8TeWg2JnpZIZQcqhC+Be0FcWKIALqoItDaZEcHH3ywuaZ3/NQzeUvxirQqw82hrfk7/TB8cREzFlSBGgoXRmQ5OlBCOldBQ59wowmG0cFZg+gAUiiz8Pwmqjiw==
Received: from DS7PR03CA0269.namprd03.prod.outlook.com (2603:10b6:5:3b3::34)
 by PH7PR12MB5709.namprd12.prod.outlook.com (2603:10b6:510:1e0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Thu, 26 Jan
 2023 18:50:16 +0000
Received: from DM6NAM11FT089.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b3:cafe::58) by DS7PR03CA0269.outlook.office365.com
 (2603:10b6:5:3b3::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22 via Frontend
 Transport; Thu, 26 Jan 2023 18:50:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DM6NAM11FT089.mail.protection.outlook.com (10.13.173.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6023.16 via Frontend Transport; Thu, 26 Jan 2023 18:50:15 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 26 Jan
 2023 10:50:07 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 26 Jan 2023 10:50:06 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport;
 Thu, 26 Jan 2023 10:50:02 -0800
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
Subject: [PATCH 03/18] vfio/common: Fix wrong %m usages
Date: Thu, 26 Jan 2023 20:49:33 +0200
Message-ID: <20230126184948.10478-4-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230126184948.10478-1-avihaih@nvidia.com>
References: <20230126184948.10478-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT089:EE_|PH7PR12MB5709:EE_
X-MS-Office365-Filtering-Correlation-Id: 44af71e7-69dd-4655-9157-08daffce2a08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jAfbmWp4Sx0diaUppNLPk4JW/fb9azmDTl5vQOsEQBpaRgVZYxAtnAR/me5JO6OkeAWvY0ngIFaAtgAK6tWJ/WPavZViLJPc1cDoVaSgYOGm4tEalKZFbDF62v4u5Kbeh+6XI2P8tiw4P+u8CApNl5NNaw5/C9/G0wtz2nfCF1+mRoK9jZK6OAB9eRztF3OGZprMQynhiecAQUs3nsQzXz4HblkU9UIaxuo2XqWVCY4mmDqiSlsU75+lIdsTxa7UIqJAMNJ2eR+J3P2KwbcpGan+NiRXVJEzf7fiyQk+dta8wH11SCrYHfFftxMykRfIC/McraEeOh/r7GMgxu9ucbKRA8IYvXRAtCPtWCSNnamlNL7FixDdFvTiSh8E9CNLpc4B04OnJ3IUhWFur5FV+o1z6X8bxD8eIg/h60YY6Tn5riR+Cg5JuDp+PBSV+GiDE8pQ5C/LW8CDtlxZK3e8gYkELiFemW/aKbcJqAMgZm+X8TpIO5Qr1EQyQrod1tQZilrAMk0/1nRcVCYJfTCXNu2y+W4lUg62zVCiGWqql282djsCtoStg9CanMDnfhMS/ekYrtUr04HLjgw5c65ZD9H9VcL+SP4YFzLm7BcoG9J9ncVgomwbK0kIWFDYga33wEgvjl21ksMUkSrTbCmX3cJGO+Iy9ATdEL0UfZix6sO6ZGTn71+0O6PySheVn7eqymdVx8HDKBA42CDM4ZPPGQ==
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(346002)(376002)(136003)(396003)(451199018)(46966006)(36840700001)(40470700004)(54906003)(478600001)(70586007)(7636003)(40480700001)(36756003)(82740400003)(40460700003)(336012)(316002)(70206006)(2906002)(7696005)(47076005)(2616005)(426003)(4326008)(356005)(8676002)(36860700001)(41300700001)(1076003)(83380400001)(82310400005)(6916009)(6666004)(86362001)(5660300002)(26005)(7416002)(8936002)(186003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 18:50:15.8490 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44af71e7-69dd-4655-9157-08daffce2a08
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT089.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5709
Received-SPF: softfail client-ip=2a01:111:f400:fe5a::611;
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

There are several places where the %m conversion is used if one of
vfio_dma_map(), vfio_dma_unmap() or vfio_get_dirty_bitmap() fail.

The %m usage in these places is wrong since %m relies on errno value while
the above functions don't report errors via errno.

Fix it by using strerror() with the returned value instead.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/vfio/common.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index d892609cf1..643418f6f1 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -656,17 +656,17 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
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
@@ -1048,8 +1048,9 @@ static void vfio_listener_region_add(MemoryListener *listener,
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
@@ -1181,16 +1182,18 @@ static void vfio_listener_region_del(MemoryListener *listener,
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
 
@@ -1337,9 +1340,9 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
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


