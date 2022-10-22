Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D756084FC
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Oct 2022 08:14:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1om7Mk-0007eA-LU; Sat, 22 Oct 2022 01:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1om7Mi-0007dn-8G
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 01:48:12 -0400
Received: from mail-bn8nam11on2040.outbound.protection.outlook.com
 ([40.107.236.40] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1om7Mg-0004ym-Jv
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 01:48:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oKwN17KXjegfRJwjeeF9aE8Qq9BZP+2nTQSELzDzJw4Tv2sVTk3QUtxb9OZ9UcOlaZYOOY3LlbF09AyFBH++t1hNiSSfXMNW8MYCq+yhbWREQh2dAedSycHu/jhZRWqUBux8gVSWmxSGuY/xM2EsbHbpvTLOGyXFXq4k3v/X7ij3YbAWLUzUyX3KxvdBkQ854RFQ4xQ0qtRRG5wLrR0cY5IYAWspEdvZ0NwulNqvErcy6gD4jVr2JlHmE79L/yGTm87AX7f4cJWT/iUP/P14GsnUX0VLeo9/ZehZ8jpLaBAec2H4r8SoAWqC3D2nwYrDuCwpOZG51m6uYCCvQQpC2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3IuEuKqL5PLiY0FUP9orHxSSvcU94weF+afTeFvSRE=;
 b=IEDDoftvKl5jtHoZJ2y+ScZYTBoiRE/gso5mzmY3AnlNuyAw9+P9XhGZQqwibdezOTp4c+AVH6GakpoixWm0OKSFX9gddZRhgs6RmuzMi/zJfwtM5oeZO9uOvNv8V2UwqealNJf/WjZjU9YdvwBOhQh9HG+gxNENM/rx+VMCBkLpbBCUy2YEh5fpvAu4DOSa7AlmfoZ+sg5U3aiU2S6gv0RDz/CM1g8dy9NeCUGsReX1FSMZ3UgnmMorrGkuEbAXuUaWqgX8kWDYhgL0ndvzHxJDMS1FbAmw0vz0xGEiEFEXgmlSAzdigUHE6ETDlfYc6kczjaf07tzwVcokiXuSOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v3IuEuKqL5PLiY0FUP9orHxSSvcU94weF+afTeFvSRE=;
 b=mHopSS8XCFlmmWhbFCFCqFNryxFHK530ITeHJQHE7GY8zADw1UHPSoY/qIL9l+8Eapd6N/vg5cMnnu3JhXiTQMSL5RvLJW1TRnhZqwNAgbtmh0nPsyYpMQ6SXBwbv2EqKsZLEDm/D0zS5m7JSHfWt2P55XWoCuM+r3RfcARSynE=
Received: from BN0PR04CA0131.namprd04.prod.outlook.com (2603:10b6:408:ed::16)
 by CY8PR12MB7436.namprd12.prod.outlook.com (2603:10b6:930:50::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Sat, 22 Oct
 2022 05:48:08 +0000
Received: from BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ed:cafe::26) by BN0PR04CA0131.outlook.office365.com
 (2603:10b6:408:ed::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21 via Frontend
 Transport; Sat, 22 Oct 2022 05:48:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT066.mail.protection.outlook.com (10.13.177.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Sat, 22 Oct 2022 05:48:07 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 22 Oct
 2022 00:48:07 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 22 Oct
 2022 00:48:07 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31 via Frontend
 Transport; Sat, 22 Oct 2022 00:48:06 -0500
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <francisco.iglesias@amd.com>, <edgar.iglesias@amd.com>, Vikram Garhwal
 <vikram.garhwal@amd.com>
Subject: [QEMU][PATCH v2 1/5] MAINTAINERS: Update maintainer's email for
 Xilinx CAN
Date: Fri, 21 Oct 2022 22:47:42 -0700
Message-ID: <20221022054746.28217-2-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221022054746.28217-1-vikram.garhwal@amd.com>
References: <20221022054746.28217-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT066:EE_|CY8PR12MB7436:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b3bc64e-8d0f-493d-c2e7-08dab3f0ff15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XYAXyZAFLTO5gswH9xaPAXU2EzsEGkvpxWNFWkP9ZHYrMzGpIHskCYyZKgmtKLPcoK7YYHzh9gbDD8gjTwCPAmdhbu7/celwDCKhcfzh3R4yXrQem4GULbsvuhFdNMk71FxOIrEoSOMYS/opVWNW0PlFPGIbRELj0q8BhLf9H8B5LzfKqCq+rU8QrZ6xe95rhua7DqvKngwyD0a2R8Gf4huJ8bv87zwJqN3GCeTi7GNEvU8h96vta7msjhYQIs5+jeK/rDrgdD/hjfYjEEvmdO3tmrWOuGLQCBqg3bkZdUfZ4CVzDMxpTEQe+kbPxpEenzSr9aEy1W7JwTKt+27buuWDFPWtVu/XdLAv2bTUXJ8txI8gOtqiKYRSlBFsGltcDOz6G1ZFxVKCfcGSEHUHQ82EAUDIqBhVHEYFaXURUCGVyb9JIzMtS4n0KBZ1yMMZyMrMNY2ErXDPn7rrUzSZkHzsdvATCoNz+wqCIwtaEc9/6obhnto+MzyME60ZhGoDn6qlXFLCtACcSReYEcsqyeIoiAQIINNkh0qM7VWJC8uCDs5fLtamjzDgLixwHd4qmIHSGqDq5BdzJMPPUEkx9g803QDPLXiksBzpDboiREfJDmgFD7L6RIJjdwKM52rUSSk65yrjzNfXEClp2N3OrEpRrZOlXBKToyezp2a+joPIfzmjYoVAe1RrnfeRbyeumNVuH9zGN+KCtmfVn6UH/zpB0YFn65KJF6pN6EW8IN/JoWQd6h8n/WtMfaHjCLNGrp/1oqEnuKgL21UEt009JNkSd5TtfsOL783tJHfvEDehHQk6DN8BRkRkU18ynqlj
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199015)(40470700004)(46966006)(36840700001)(47076005)(5660300002)(40460700003)(2616005)(336012)(36860700001)(81166007)(83380400001)(426003)(82740400003)(82310400005)(356005)(41300700001)(86362001)(70206006)(4744005)(44832011)(4326008)(8676002)(70586007)(26005)(6916009)(8936002)(54906003)(1076003)(316002)(186003)(2906002)(40480700001)(478600001)(6666004)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2022 05:48:07.9016 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b3bc64e-8d0f-493d-c2e7-08dab3f0ff15
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7436
Received-SPF: permerror client-ip=40.107.236.40;
 envelope-from=vikram.garhwal@amd.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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
Reviewed-by: Francisco Iglesias <francisco.iglesias@amd.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e3d5b7e09c..538af2885c 100644
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


