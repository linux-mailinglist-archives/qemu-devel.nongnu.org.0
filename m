Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04890433A0E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:18:19 +0200 (CEST)
Received: from localhost ([::1]:59066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcqsc-0007Si-1W
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:18:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcqDw-0004xj-It; Tue, 19 Oct 2021 10:36:16 -0400
Received: from mail-dm3nam07on2050.outbound.protection.outlook.com
 ([40.107.95.50]:5566 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mcqDu-0007tr-Hd; Tue, 19 Oct 2021 10:36:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VCS2E7AC2Uiwp3o19TUhNyBX86I2Lp11WRIh+TnlVLEi9R79PrZ7tG3peAW00FPdP+eS8Yi/4ZXJgknA/T+K/5hykS1KXVoHOlMLKTAEHnzEKsMB08Qwe8UkmKOHCmAh4eGOol8a2TZ8IrBM5CMoGqkTPTqfiwbIPv1GH5Kvl4Qpd1zaNbgC7qhrWu1dfKcQLymAMPEbYirgn2dAM7jWxA1Zinw4o6UARRosIM656A2AXVgnJhRNlfNR7iZcaraOTDixCDOxMBlQ/CzHfPBkNTBUtbeil7gBBQIkzO78DOewwZz3LsrvgfIs/5TlYPy5ZF/cyJGqPL9CYfL0w8ioGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6NGYKSW6SbhlkZbb3zVare+HblnWLct1EB2XdNCRTa0=;
 b=RrEULjSHWtD8qVF0vcggaYqN1vMkOcBX/vrxKdn8wIJN6fOz56AAR+J+DiFyv4EQ4rr6vwvjFCUHGZ946N7Co1AOdLKIk/JEDYDza2Ym13eDgeEyhas+VnkukZ7vaX4riPx7XHFJntgbgnB4otI0Fgot3luf+BlwKQBkz9dFzIMqDXnLkIz3l5UM0wc0glC32ySOlRDqeFNJ0Md/uPv/OxtUq073cvlE2kBQvvawLBJ/J7HR1YKwdeOIhpnKivWuGy9WHiHwTXla+b6z+qoFozCgLvanSDlnI3aKg9VFd2I2X5vx0+2Ym5bg2rKUgHXKVABHv2SVGe2OBdkgXDfqEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6NGYKSW6SbhlkZbb3zVare+HblnWLct1EB2XdNCRTa0=;
 b=E3tYr0NbWWQn6QUKovfdaz7cBcVquRVW3ewI0rnq3rRlP4v95NES7hgUmPmEEa3rjDLm7kVX0CTq9e1l/U/OdMNByqCCg9NutK2esJmoli5eMuuq2px12upjXO1wxDeu7/N0C9pbBlwyL1pZjp6WxhM4EFXLoN25jL5Bnf2GIE0=
Received: from DM5PR12CA0051.namprd12.prod.outlook.com (2603:10b6:3:103::13)
 by PH0PR12MB5468.namprd12.prod.outlook.com (2603:10b6:510:ea::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Tue, 19 Oct
 2021 14:36:10 +0000
Received: from DM6NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:103:cafe::57) by DM5PR12CA0051.outlook.office365.com
 (2603:10b6:3:103::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Tue, 19 Oct 2021 14:36:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT052.mail.protection.outlook.com (10.13.172.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 14:36:10 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 09:36:08 -0500
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 VictorV <vv474172261@gmail.com>, Marcel Apfelbaum <marcel@redhat.com>, Yuval
 Shaia <yuval.shaia.ml@gmail.com>
Subject: [PATCH 63/64] pvrdma: Ensure correct input on ring init
 (CVE-2021-3607)
Date: Tue, 19 Oct 2021 09:09:43 -0500
Message-ID: <20211019140944.152419-64-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019140944.152419-1-michael.roth@amd.com>
References: <20211019140944.152419-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 300099b1-a480-4189-f398-08d9930dcb28
X-MS-TrafficTypeDiagnostic: PH0PR12MB5468:
X-Microsoft-Antispam-PRVS: <PH0PR12MB546800457EFC1E61982EDEE595BD9@PH0PR12MB5468.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GDpzft54fC/cHhyuj6cl1cGE8e+qTha+0kE+KjXvAOWSwLrf/hZmVCKWzRM0t1DHVmKaW+2msUTsy32/SPmaH3Xg5EHCeV3zpFRz622VaeKu+jn8XWGOpPPBu4Z8886XoaFtG7Dm+U5jRGV5e+2wpp2JELbqiVzg2N7GF0THVlL26igEhq0XlgV2nkLfYI98g8ZCj/VloWuD7O7WC5ZBGP/rLDRRS2TM0eoIxEXHeUg+ur0cilvmMLWlMrX/VGMARZEqKM5kGFcLZNyM4l0XiUw1KImxpiVHbkdfGSxRelmbbGpbAw1tlmbguu149c4FyY3nGS3avWid6gaQdKhweqAfTzzi7hqKtQCOP5ncEkMxG/gcO3DaoZJrXfczZ5xH9MncPhYSq5rGWm1AJxf6IJ93/QGqYrMieVo0GWizY1QQUYMDR//WwYOZIpfg7RloQf4xHUvlCgHffAhQMAeVSny/dHW44X4hgYWz3Zt+jNJtTv6Gc+BQaUapkAvNRRYULucpuqRofVbe48f2GHbkp96hQamJc6Brk6I8SQVvkbhJA11Sd3iC796x32UgYtk4jVcAXeR5Qvv2t7d0zYdpY+he7OG1dJPKw2g92f/RKazbvEUJAaHe+h6hdKzSvB2kQNmcXBiN9Cw6S7tUWiOLkDMuOdyeat1oz3l8cJ9JJGtaI02JPeZ48jcPsbu6OxwbeyPbn39Dkc5Ry6y2e9NHnitCLd+c8Q18MECPcuPQNUk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(83380400001)(36756003)(16526019)(508600001)(186003)(6666004)(4326008)(316002)(26005)(426003)(47076005)(8676002)(36860700001)(5660300002)(2906002)(82310400003)(70586007)(8936002)(356005)(70206006)(2616005)(336012)(54906003)(81166007)(1076003)(86362001)(44832011)(6916009)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 14:36:10.1213 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 300099b1-a480-4189-f398-08d9930dcb28
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5468
Received-SPF: softfail client-ip=40.107.95.50;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>

Check the guest passed a non zero page count
for pvrdma device ring buffers.

Fixes: CVE-2021-3607
Reported-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
Reviewed-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
Message-Id: <20210630114634.2168872-1-marcel@redhat.com>
Reviewed-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
Tested-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
(cherry picked from commit 32e5703cfea07c91e6e84bcb0313f633bb146534)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/rdma/vmw/pvrdma_main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
index 84ae8024fc..7c0c3551a8 100644
--- a/hw/rdma/vmw/pvrdma_main.c
+++ b/hw/rdma/vmw/pvrdma_main.c
@@ -92,6 +92,11 @@ static int init_dev_ring(PvrdmaRing *ring, PvrdmaRingState **ring_state,
     uint64_t *dir, *tbl;
     int rc = 0;
 
+    if (!num_pages) {
+        rdma_error_report("Ring pages count must be strictly positive");
+        return -EINVAL;
+    }
+
     dir = rdma_pci_dma_map(pci_dev, dir_addr, TARGET_PAGE_SIZE);
     if (!dir) {
         rdma_error_report("Failed to map to page directory (ring %s)", name);
-- 
2.25.1


