Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BED567D4BE
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 19:55:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL7Lo-0006RT-2D; Thu, 26 Jan 2023 13:51:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL7LA-0005Me-OI
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:51:21 -0500
Received: from mail-dm6nam11on20601.outbound.protection.outlook.com
 ([2a01:111:f400:7eaa::601]
 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL7L7-0002vE-HY
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:51:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TqF+KL7fKv4oDeLtE+p9+SbbpDUBO7c2gTx17KCrGY2STkUJj5tAKxHbv+H8s5T+w+E5UyKirQ4dBQglZBWqG2aNa3ceFPOLpkLx0UPhpnVViOq9boxAy5rEugOGhnnSg6IgtHTqLOq9sRqNSUIaMcuvsPBz1SCMFUWAUgax7NmmwG1Z/KbLDL2ukwzuoehaDvdntIVy+1hTjsRpHrRzKEpCOzIoxpYB0ECHNM62pZZbnFFmsUcGusTej2mVv+HgEgzK1/Use3gWYLYU7XMr0ll/d9COMHGfclDqb1dnzSDpa8aFlt1Uz8HTe4oMhYVhX1L2aXLyQhT6UQNl3Exjmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QertlL506fJI6k9SbZ+Jkp8StwMukfuvViPrVm8LCws=;
 b=AaBRdrq3cml+zJrle4KcJ+KpZTWO2kI92FtLJBid8wFlC/mKO1lBP9PkRnuBwedLOAeYCFTlEMnhx2zyLpmmOKrkcS0Br579bkwXycw77N2l0x4JD1Laja28YCfAfTDm2ytgCMavib5zd2kunYvujlymVdwR7sD845Uof879nQKDyavXwdvGfKB7nV/QzgKVtUiLi/rts/2Su2pTn5np8L84hMnSnE4dGwmvZ9Sy+SVlw7ntS1idXDuf3xKykzP9HcQAgAvz5WHvMFtbHm6cNQANbRa/LMzqJ4ad/xKFF+7GI4MGpXLiep76uc9ueSzdrm9cQbjsMEmZsrIugHUljw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QertlL506fJI6k9SbZ+Jkp8StwMukfuvViPrVm8LCws=;
 b=WBRdgC1mTjYOEYTHqj+yYMESyME2JeoBm/falUkk2bXVCXyF/QvHqD0XEa5rRHuWnu2W/2dXuoYKOr8SAW7KsEKqs/PwLiIO9FSYSG5iX+aj2Te6kimWiSt7Ths76F29HUqjN1rwo4tuNKlg29007XRwAsC9tioiS2x7/XbGSIZ5/NoUGql/txtt9DgGL3SSzh+Isx5/a0YhKW/CGh6P5YInOSvT7+QBwMIxFCLTImPB2w/PXWtn2fCPzznGP8S1qea5Rw+AeCPIKT65QzYhd2Exmwlls135+smJjWaizdVCV546v+cT5JTTziQJohehzf1fYhvMXrDtnr3i7xQctA==
Received: from MW3PR05CA0019.namprd05.prod.outlook.com (2603:10b6:303:2b::24)
 by CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Thu, 26 Jan
 2023 18:51:09 +0000
Received: from CO1NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2b:cafe::55) by MW3PR05CA0019.outlook.office365.com
 (2603:10b6:303:2b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Thu, 26 Jan 2023 18:51:09 +0000
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
 15.20.6043.21 via Frontend Transport; Thu, 26 Jan 2023 18:51:09 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 26 Jan
 2023 10:50:57 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 26 Jan 2023 10:50:56 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport;
 Thu, 26 Jan 2023 10:50:52 -0800
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
Subject: [PATCH 14/18] intel-iommu: Implement get_attr() method
Date: Thu, 26 Jan 2023 20:49:44 +0200
Message-ID: <20230126184948.10478-15-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230126184948.10478-1-avihaih@nvidia.com>
References: <20230126184948.10478-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT014:EE_|CY5PR12MB6429:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d541ad8-6ea7-4957-c678-08daffce49c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y4H6jhYRVLHJtUG7E/asE23o0z3VdSKduwrcvMtwZxhWHG2CtcwtKW97RiKvnbM6waB+amXIv/pxoZrB0G3ljAV+ahm9IQ3I6uqZG8omDs23oiq34DK9WHFTWV6o73lYyc7b11tvZWxElR6xWeQ/2vZ+A0A+b2EmOSzGH/+dUV6NL/al/wzH5rIUdp3+5mjukpEuUzt+iPDotrsPWJp6atIZOVsKU6g4USeOyO0M7DERRmi/ZHmtcHdn6RE00anU/jueOplN81lOkSm1w687CCMbnUsKxDPisbUh4BZTVQtxxFRCUv4QiFQtKnfRauG0QzutdIURDGYtDeYx8xdpyb5vvdLFaQL4C40LROhEKXlM8nKHopbjdaEfyZJbiehb8vDOH+IiYZkAf+Pqr+fCLj36VEZ/3ew+cRjWu8DjuV2pcVF1ibK1UCj6WDRUT9dvJ93ffC9+Gc+SfLQLUVz+22qUoXvQZQwOdQy1GJ8Qdn89xLFzuyE8bvdd++fjRK9TL1JK1ddx2sSkRm2hDbkKDLrnNLk/C5otSDukVE8/py3IuCsiDB4WQzCjV0mWYw01MyCayaCwF1ZH3jGQsPty/IwrIzD3OGg8UC9a8bYYgKNkR+IgwMpZQ32EehlhcaZ0B915KKzjusRjNoBcM3ng34cz9D2Oe4qBDtqR3SHUKOZn6mo0rgODA3qBDt303zQyF6843Y4lvCLPTCsY7TSkdA==
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(136003)(376002)(346002)(39860400002)(451199018)(46966006)(40470700004)(36840700001)(5660300002)(36860700001)(86362001)(186003)(2616005)(2906002)(82740400003)(4326008)(7636003)(82310400005)(7416002)(41300700001)(356005)(8936002)(54906003)(40460700003)(40480700001)(426003)(70206006)(8676002)(6666004)(6916009)(316002)(336012)(478600001)(7696005)(47076005)(26005)(70586007)(36756003)(1076003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 18:51:09.1125 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d541ad8-6ea7-4957-c678-08daffce49c0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6429
Received-SPF: softfail client-ip=2a01:111:f400:7eaa::601;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
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

Implement get_attr() method and use the address width property to report
the IOMMU_ATTR_MAX_IOVA attribute.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/i386/intel_iommu.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 98a5c304a7..b0068b0df4 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3841,6 +3841,23 @@ static void vtd_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
     return;
 }
 
+static int vtd_iommu_get_attr(IOMMUMemoryRegion *iommu_mr,
+                              enum IOMMUMemoryRegionAttr attr, void *data)
+{
+    VTDAddressSpace *vtd_as = container_of(iommu_mr, VTDAddressSpace, iommu);
+    IntelIOMMUState *s = vtd_as->iommu_state;
+
+    if (attr == IOMMU_ATTR_MAX_IOVA) {
+        hwaddr *max_iova = data;
+
+        *max_iova = (1ULL << s->aw_bits) - 1;
+
+        return 0;
+    }
+
+    return -EINVAL;
+}
+
 /* Do the initialization. It will also be called when reset, so pay
  * attention when adding new initialization stuff.
  */
@@ -4173,6 +4190,7 @@ static void vtd_iommu_memory_region_class_init(ObjectClass *klass,
     imrc->translate = vtd_iommu_translate;
     imrc->notify_flag_changed = vtd_iommu_notify_flag_changed;
     imrc->replay = vtd_iommu_replay;
+    imrc->get_attr = vtd_iommu_get_attr;
 }
 
 static const TypeInfo vtd_iommu_memory_region_info = {
-- 
2.26.3


