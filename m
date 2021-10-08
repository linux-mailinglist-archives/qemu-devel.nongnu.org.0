Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D20F2426595
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 10:04:56 +0200 (CEST)
Received: from localhost ([::1]:48502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYksB-0008RD-GR
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 04:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mYkqA-0006M3-BA; Fri, 08 Oct 2021 04:02:51 -0400
Received: from mail-dm6nam11on2070.outbound.protection.outlook.com
 ([40.107.223.70]:8437 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuemingl@nvidia.com>)
 id 1mYkq6-0003xJ-Pn; Fri, 08 Oct 2021 04:02:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ONAxG9MKTE1x7YcK7GGV5k0ggyhGKtWkDfN1TuFcjXCZb0yVTaVkYh4j0GZDzWC34evOZdZj0U5VyNqdAtXCg6jDAW8NBAMeCovE/VXJEcsKdfErsnSYHoo7PXWHrNEuO8SJ9XeCcHq8IZRdkt5qEo9poWq0NRa5nFxlEyk11SL8BkoSkX4HalQZ0NvpIXLq+OYQJj5WqAKh0V/sKGOESbnPserGm387H5njZfKp8fOxC/9J52bdI7FhQO5a/EYai/oNBK3qfN7IeS2axOBRFSJVY/2F5ia7d9tmJfdB7fXBtenwJHnQfhsxGwV+oqImX0ReLLNOGK/U7AFmw9+19g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujaDpiY8m+qcqAHwvUHEYFnf185LDlZrVFbVpiRs/Xw=;
 b=Y53C7QNg7Zdq3xChV318xMXvvUnPOYYWGnnF2ElWaio4VTlcZePSJVlpg42Cm8ddeXNXu4BisMuP1kVFt7BDgmljjpTBZRbKLlKKw3wtCdTBVTW5GUqW/5kJcCzLfLY5pQzO+B6FgSwxhJMdghkusDvf/GKUWcVOzd24gV/jwDF7dNQj/S7IlRz80Lpa0n+7tA4XLAZNOVFEOIKwV+IISR0WcEyRcMi9wXgigdhem3r5tKLDX0hay7ye6gLt64foUCmV47cj78yFqfsquZZQ/zdsuTyd3SZpJ+moHD885nzcGqOTi/wxG5zMeHBWGfTLNq4VU4Ejme8yalIKXfft9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=bytedance.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujaDpiY8m+qcqAHwvUHEYFnf185LDlZrVFbVpiRs/Xw=;
 b=UXBolexTT7TYWBfoLMHJrLJjKPNA2mFp7aLc7f9woFKiC4eO8jMhw8lejAL55Y08g7ZhZIUDlDslK2lu1eUwK7BzyI4gxYlue8c7QfJAluTI2qhrsowJw15vqipOiDpjJABF2L5lucHTG4kkzYEg1zYyik5mC14J50KdaN08e2TohX6LFYmuTnb4ugvrNpCttX9ibbXonUkaG0DZtwBPWoOka43mX2+cRQRwvR7Dw6fJ0GXEV1/SYJmXEc0MleccWOwCFicsZ9OYDTsMp0GEWIBGEa0/XUb7M3VJ3Mu3oaf8s5gKcG6aKUrVYCLeZsHGduG3G4E4XbU44qpGBMgrrw==
Received: from DM6PR06CA0099.namprd06.prod.outlook.com (2603:10b6:5:336::32)
 by BN6PR12MB1427.namprd12.prod.outlook.com (2603:10b6:404:20::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Fri, 8 Oct
 2021 08:02:43 +0000
Received: from DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:336:cafe::8b) by DM6PR06CA0099.outlook.office365.com
 (2603:10b6:5:336::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19 via Frontend
 Transport; Fri, 8 Oct 2021 08:02:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; bytedance.com; dkim=none (message not signed)
 header.d=none;bytedance.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT046.mail.protection.outlook.com (10.13.172.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4587.18 via Frontend Transport; Fri, 8 Oct 2021 08:02:43 +0000
Received: from nvidia.com (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 8 Oct
 2021 08:02:41 +0000
From: Xueming Li <xuemingl@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: <xuemingl@nvidia.com>, <qemu-stable@nongnu.org>, <tiwei.bie@intel.com>,
 Yuwei Zhang <zhangyuwei.9149@bytedance.com>, "Michael S. Tsirkin"
 <mst@redhat.com>
Subject: [PATCH v0] vhost-user: fix duplicated notifier MR init
Date: Fri, 8 Oct 2021 16:02:15 +0800
Message-ID: <20211008080215.590292-1-xuemingl@nvidia.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d341589f-e146-4c77-4680-08d98a3201c9
X-MS-TrafficTypeDiagnostic: BN6PR12MB1427:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1427E80D8DE15AF74B68BC49A1B29@BN6PR12MB1427.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:51;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rdPISgh8aTjtGSRvbWDoHQM+YgcnWZqgzS9/R59z1J1uhGGwSM34I7npGlR4W1ASOHOYz/R82HLeIvuB2TyQP1YLznrgv+750fHoYURqbPa3Xq8sUrEQ89PPywLH1r+4/X12LKvK1k1glofUC/U0IG6mgUpglfiWGMDI678JYyAvghDTov38FIg+khT5YrCwU1zGIq/Zn55swe2mhf4eYkKfEzAyV+5u5PsidIpDaBQ6VmNm15il/QBSfSiyt3jFDL4m12ZDV2yJZ/R2rDdj6f1Zxc7mn+LPU2Dm3cyvRr2l6rhnaArMTEwKXTdB0rIyRUUhsreEpJ1Y92YDX2/tna9+LTTrBJJJPEEjkJaXKdd+6r3akWyZPta8ghnwUNl0OJLYSc8fNasPhn0D4N5sx9VuuUrOfrVT/xXgZJnKJCbRbmuCROsD6zew24p07sYWceP6B8yf4ASiAHgL8PTN7ybpGzoo328Pp1vgWxxNQnPn9FlbBaAs6NiwgZMqR/S5MFUk2cvK97hOLHAoJlVsKUvZcsMGlyFg7l6fX3q5b70jSa4UEn4MTHDQml/tuecQxFzIePLxzxzlkdZrlfKpvDNOrFqeunWY4PR/ppKk6HpuQYuAhCOPNJliV90fRn0nd3EAe5ojZvQpmq7supQEE88vKyK9UaZjtreLdSWCI7vF1GWx5TDdgUFczqnYlTAvjzKJQ2NZtwBgn7BLI2hTjw==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(316002)(2906002)(336012)(86362001)(2616005)(83380400001)(54906003)(82310400003)(4326008)(7696005)(7636003)(5660300002)(70206006)(1076003)(426003)(8936002)(16526019)(70586007)(55016002)(186003)(47076005)(26005)(36756003)(508600001)(6286002)(36860700001)(356005)(6666004)(6916009)(8676002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 08:02:43.1472 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d341589f-e146-4c77-4680-08d98a3201c9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1427
Received-SPF: softfail client-ip=40.107.223.70;
 envelope-from=xuemingl@nvidia.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In case of device resume after suspend, VQ notifier MR still valid.
Duplicated registrations explode memory block list and slow down device
resume.

Fixes: 44866521bd6e ("vhost-user: support registering external host notifiers")
Cc: tiwei.bie@intel.com
Cc: qemu-stable@nongnu.org
Cc: Yuwei Zhang <zhangyuwei.9149@bytedance.com>

Signed-off-by: Xueming Li <xuemingl@nvidia.com>
---
 hw/virtio/vhost-user.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 2c8556237f..bf6e50223c 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1526,8 +1526,9 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
 
     name = g_strdup_printf("vhost-user/host-notifier@%p mmaps[%d]",
                            user, queue_idx);
-    memory_region_init_ram_device_ptr(&n->mr, OBJECT(vdev), name,
-                                      page_size, addr);
+    if (!n->mr.ram) /* Don't init again after suspend. */
+        memory_region_init_ram_device_ptr(&n->mr, OBJECT(vdev), name,
+                                          page_size, addr);
     g_free(name);
 
     if (virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, true)) {
-- 
2.33.0


