Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3C15B451B
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Sep 2022 10:08:32 +0200 (CEST)
Received: from localhost ([::1]:38900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWvXJ-0004YM-It
	for lists+qemu-devel@lfdr.de; Sat, 10 Sep 2022 04:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1oWtjr-00056o-Hd
 for qemu-devel@nongnu.org; Sat, 10 Sep 2022 02:13:12 -0400
Received: from mail-bn8nam12on2064.outbound.protection.outlook.com
 ([40.107.237.64]:53757 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1oWtjo-00035T-9a
 for qemu-devel@nongnu.org; Sat, 10 Sep 2022 02:13:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=deBQ9dMlaGQmJpbb6lTRulTGdpHif66dcpWzvb9FyYqERGVdETMwtnWmEusnS0FNxM7jjhWPk5REq9r0avFry58/9DBL+yaiIzoIUX1QxWKRKbzDSbFTxbCk7GmIc5EJcatthmtWB4uXRsjr++bkqEBhapmYj7EVuoVRHJpQwdkgC1sVZYDaDYIQwVzdp7kgLTBK3b35x2LK3dtX9TGFe4gy30Cn76rq8C9jEVvjPlVt5yEhaJDwT1KX4CvBnt9zVPHj1BKJBUwEF9RJeujlNTpcwI5m/NBvyG+F5UvZ5G9UXWA4diHzzjZx/krU5/l71CXpxOGBfgxd5ruVzdeW7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KRQ4B+xf0aD3oCcucxws0EAEJozVsQlp4bhnirXLIx0=;
 b=AQ+QmwzVx/MFDplU1g2Y5E+peju5zrPGzV5yEcPkjZELzRxdC+nUO45OxFzXugqBm/fBDA9vp9o6F5y1TBcTvvbKiGBBDAwQ063GZXRM4azfFLP9bOgtSrmEc4kgbK/OFSfBqAuLDxF7rdELWdaVH2RLzyzdpU7ucP8LYfRfcFzz/bWYPqvmX/qaIQNysFztvBbwtU5RJbYqqXJ76NWoaIzgwgW9yVRFXxkNy4A4gzp/eaJiKu6DS6Pyu7nGxo/Nse5n8mjgpGMtTdw/NTx/YopVUIDHcVg98GKs9lPmC8Dy0q4R/UdplG4zvUbNdYlJP0VKVpzqv9m90ZmTd6Tdcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRQ4B+xf0aD3oCcucxws0EAEJozVsQlp4bhnirXLIx0=;
 b=BIlYeW1hUCJBzXkgtVY9VKIOVR8qzWrYnw6S6WSrCXV29wuD7GnbnOgQFd05acu2a2XZ5qt97Qi7HbwX2Ahkzu5ripPRRDOXlEiz9tKWNP40+UdA3Q4LHJ3GOPSzI6zUGCnVzICdNapXZj34S9HYKGZ48huSqsxxVDyIu0U9NtY=
Received: from DM6PR02CA0101.namprd02.prod.outlook.com (2603:10b6:5:1f4::42)
 by DS0PR12MB7607.namprd12.prod.outlook.com (2603:10b6:8:13f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Sat, 10 Sep
 2022 06:13:04 +0000
Received: from DM6NAM11FT070.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1f4:cafe::c8) by DM6PR02CA0101.outlook.office365.com
 (2603:10b6:5:1f4::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Sat, 10 Sep 2022 06:13:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT070.mail.protection.outlook.com (10.13.173.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Sat, 10 Sep 2022 06:13:03 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Sat, 10 Sep
 2022 01:13:01 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Sat, 10 Sep 2022 01:13:01 -0500
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <edgar.iglesias@amd.com>, <francisco.iglesias@amd.com>,
 <vikram.garhwal@amd.com>
Subject: [QEMU][PATCH 1/5] MAINTAINERS: Update maintainer's email for Xilinx
 CAN
Date: Fri, 9 Sep 2022 23:12:48 -0700
Message-ID: <20220910061252.2614-1-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT070:EE_|DS0PR12MB7607:EE_
X-MS-Office365-Filtering-Correlation-Id: d9d15231-1b07-468b-11ea-08da92f3854b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K4c4ySU+NDP3lr2F4oLDp6h/pfUMYsEIaGwx6LmAkONvIzugN5+DjHKj4izUS120/SwAofe0FKWpIWVcCuNfa7GNWVeaeYCOLoMikZN6C5xqxubCTWpmzW7y8tcIdbH51VhC1iuXkz+W2B11DJHXMe8OQf7GMNuQAXrHVCZH+ZT+Xv/urGrIthh3/C5UTHhBCnnTGb0n196ZzSNhsbKlgVxkNxfEUD7RMbW7SfPd+IbfYciB2aQLsNoclZGrIOlO6DTkosuXYA7TDjgRIHoJ64gtLR+7TG9Dg99xW3GRYuihIA1iVDFSKfJohFwifbMnrqw6oUfZiVg7GO6ssLsct5fG4Fzzyw9FDM+5vrZFCQOeT1Gskn+HPWbZIXW4EPd0mny1uePa5SKr5LrmqCg/2jKexv1B84tQA+rsuh50KgzKkZAYKbI1/fFf2oS+PJZ94bnDcEJZg53kWMsFeLBR4O09vlWFW29TMZ64LDyjzKSgcqUH0scg/DKlITxMzdroMV6sTnV/MmNUxZmwCO8c+DyM+bTGzTxOOal2Jv0/e9KIzdsRuKf5mn5X/f8LxFUGO+6oc9dClbpKhdVfR8+1xJ9DO67CXqdvKUnTFcWm2FKk2q/8xBr6jJlcevWQ+W5+P6zqDz6UfJsnTaJIqlm+v6i8RFoSYZjkewHRSD+k7EG0AYCOcxwGXl+cYN+CYjIUvdp881Iu6wKdd54vYxUJdYxtpKxc/P/lXRFSrZCnkepsSJvGDfkdNVc6C59GiGW/M6g2qkKpa56Kjgccl54vCg7eg6PP6j6sPCplw1BcBxhnNPJGwCVnhJhaYKloDZqx
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(346002)(396003)(39860400002)(36840700001)(46966006)(40470700004)(336012)(83380400001)(478600001)(186003)(47076005)(4326008)(8676002)(36756003)(426003)(1076003)(2616005)(6666004)(26005)(41300700001)(54906003)(86362001)(2906002)(82310400005)(40460700003)(70206006)(356005)(316002)(6916009)(36860700001)(70586007)(4744005)(44832011)(5660300002)(8936002)(81166007)(82740400003)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2022 06:13:03.6250 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9d15231-1b07-468b-11ea-08da92f3854b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT070.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7607
Received-SPF: softfail client-ip=40.107.237.64;
 envelope-from=vikram.garhwal@amd.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 10 Sep 2022 03:57:18 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1729c0901c..1d45e92271 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1751,8 +1751,8 @@ F: tests/qtest/intel-hda-test.c
 F: tests/qtest/fuzz-sb16-test.c
 
 Xilinx CAN
-M: Vikram Garhwal <fnu.vikram@xilinx.com>
-M: Francisco Iglesias <francisco.iglesias@xilinx.com>
+M: Vikram Garhwal <vikram.garhwal@amd.com>
+M: Francisco Iglesias <francisco.iglesias@amd.com>
 S: Maintained
 F: hw/net/can/xlnx-*
 F: include/hw/net/xlnx-*
-- 
2.17.1


