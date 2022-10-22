Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 721D1608546
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 08:51:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1om7N3-0007lD-Q4; Sat, 22 Oct 2022 01:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1om7Mw-0007gg-So
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 01:48:30 -0400
Received: from mail-bn7nam10on2043.outbound.protection.outlook.com
 ([40.107.92.43] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1om7Mu-00051A-9g
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 01:48:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KGg0KraZgo1pDMAv1TUk5Q8soAZAxdppZ+2E5RUZN/5xO+OnK8+jUEJIPkZRQ1mBq0V7J4a8Gtxr1b6LP0hOSsyxKyWHHDYcWvTZ33wd1lPrPv4oI6WOhrXcc3ZaEOYAk6kBecHxWLmVwM2Fcur+v0zFrtR19m1vLAcQCfAUPVfVuT3WYLCDGxaxfrj7ZJDU3/7S5f78R0RHeB4TQvb2Sevh/ZLQoM16LAN6Y2wFpv/S7qGt7T2Sf+uyPwKHnu/IiWoQBshkcxc/iThiKz4nzX6Nu26U/CNvuTqcDbn7/xga3ItBdZLVL21VEddykN8VN7unP4Vgp8Bcm9845n01zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wFFeqCggaCo+JVnwpjYlKY/h65rVHjmDtdYYlTjBZk0=;
 b=jyQBSQAeYMdlHyyVI+RgSlH6Ntf9HALiG4lStLYGhrCEGX3xlc/bQXzlja6defx7e8PfInTIVsueEKyqzB5GtsbD3ocCcar8ZJgSStEA7fARHqxUOZNBLSuy0sJ7Tf0BNd1+KkQvS+SnQ2w347cXHra3eGT8XejstgjtqCYSugqX4Mfy5UtG6tTWKq2VfO9im9HucXJT6PT+mOeGbbxC9WSOAfbUY98pi8iuVE/P3GyBl4GdaH7wOeGeH2vAVu72frrQMtO267OopiaDfyElrFYNADm8eLwJXS0hVspfuS92zDu+zDGoBxcXvqMsNhUj7p2RRo9fx/QKTV6cJCTBxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wFFeqCggaCo+JVnwpjYlKY/h65rVHjmDtdYYlTjBZk0=;
 b=eftMTDtTeLP0LANxwmwexavf1WXg3FhQLuVP3bXcgMLOYZwWLEEkIjZJ9ALdN91NVj866zPsXI3rqOVaZ5Zn/7bD/X7gMsscGVeOoP2jXg/7qyc/AI3kSGqCI5zdi+BDJxn9gNMEI1xKepFQq73H356zF7gOKdyPTuXQU8RLPZs=
Received: from BN9PR03CA0192.namprd03.prod.outlook.com (2603:10b6:408:f9::17)
 by CH2PR12MB4037.namprd12.prod.outlook.com (2603:10b6:610:7a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Sat, 22 Oct
 2022 05:48:20 +0000
Received: from BN8NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f9:cafe::fa) by BN9PR03CA0192.outlook.office365.com
 (2603:10b6:408:f9::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23 via Frontend
 Transport; Sat, 22 Oct 2022 05:48:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT004.mail.protection.outlook.com (10.13.176.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Sat, 22 Oct 2022 05:48:19 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 22 Oct
 2022 00:48:19 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Sat, 22 Oct 2022 00:48:18 -0500
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <francisco.iglesias@amd.com>, <edgar.iglesias@amd.com>, Vikram Garhwal
 <vikram.garhwal@amd.com>
Subject: [QEMU][PATCH v2 5/5] MAINTAINERS: Include canfd tests under Xilinx CAN
Date: Fri, 21 Oct 2022 22:47:46 -0700
Message-ID: <20221022054746.28217-6-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221022054746.28217-1-vikram.garhwal@amd.com>
References: <20221022054746.28217-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT004:EE_|CH2PR12MB4037:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e558fcf-9f92-4c2b-56a1-08dab3f10609
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zbBMVASK+O1Q/tvCOWF/lJXDJbRx0E+xzQtr7FNBFqehaJqvQkel7bKVCg4aH14GbMm2wdpHfV96Qd2owzLUGlAjU1BjpvqOoRgMzK2bQkoGBGLui1zd/3m/4NhtYwvoGrM2+JrEBp5hcQYl3uxXj/2a88ltMM8u140Vc8XJ4HbCwb3M8rOGzz82YgXwY5+DPsDrEDeXvQlbWZEN6lC7MARjn5ayftG79OIVwlUzfOfmwEFzTnJ/sPeTAjsY7INWx8FkruT7MEdFmXVrzc3iNYKwWj79n7rXQap4fSfN6MOWS0n2/muRafJ5h15Y5rdJazytIvgH+2HBLuzn3uTvasloQ36+fhN+Dm3WTFild/VhFbt5tAEMf+18/BYSgTV5GgvDoKMwLzAwcweu9gb+HlFyuap5BK2Jj6029Cp+U8copFihpkfUAMrpSG3iIYpr2MtntuYi8s0SOCP9wQ0d5DTc6w8iOb1JXS/uJA8+B6q4EZDuT4laN3aloMkvcq1FnMgH45CNNjRNu4PVIf5B+oPgFQ4yKJbdKaUbB80iQCtjpnI7ZdZUAR/eDk4M6/UA1yrEBcU3YGw6QBetQV2OpFmNsL7dy3ki+8KMTj/Su3uPTlJi1t6J1m8XMoPHLbjrdpoDVMp3UkEdlXw8LoLuofGv0VVpO8LqajSS2OgnRVFb/mydPWAm9stpArNOoL/QPLAl8ygJ8Y9YXmX95SubkW0K04wMZtn/CMmnxrQbzOTJgo+yTUn6zjR/z7yOGaZy39qN1/yTHrPt49Ptsbg0rVpMmN2beA6GzTz2UgwppfPK/pmx/M3FxEDVcHY7Ah+2
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(396003)(376002)(136003)(451199015)(40470700004)(46966006)(36840700001)(47076005)(81166007)(40480700001)(356005)(41300700001)(4326008)(40460700003)(26005)(86362001)(8676002)(70586007)(4744005)(5660300002)(82310400005)(478600001)(6916009)(8936002)(44832011)(6666004)(70206006)(36860700001)(2616005)(316002)(82740400003)(54906003)(36756003)(83380400001)(336012)(1076003)(186003)(426003)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2022 05:48:19.5643 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e558fcf-9f92-4c2b-56a1-08dab3f10609
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4037
Received-SPF: permerror client-ip=40.107.92.43;
 envelope-from=vikram.garhwal@amd.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 538af2885c..a642026361 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1756,7 +1756,7 @@ M: Francisco Iglesias <francisco.iglesias@amd.com>
 S: Maintained
 F: hw/net/can/xlnx-*
 F: include/hw/net/xlnx-*
-F: tests/qtest/xlnx-can-test*
+F: tests/qtest/xlnx-can*-test*
 
 EDU
 M: Jiri Slaby <jslaby@suse.cz>
-- 
2.17.1


