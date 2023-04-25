Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD80C6EDBAA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 08:36:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prCGf-0003yC-1C; Tue, 25 Apr 2023 02:35:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1prCGQ-0003xn-Jp
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 02:34:58 -0400
Received: from mail-dm6nam11on20625.outbound.protection.outlook.com
 ([2a01:111:f400:7eaa::625]
 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1prCGL-0002mX-L3
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 02:34:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hf4NPlN7f0RvaDD3FmE1OKQoHV5Si3xQFe6PBm02u+EUp4rgTaAvZkGHbH/a7oUKJcDp0UmbIwKrBfGT3ghTole/Ogy+riZhQuONxrN0e6P0nlUkGH6tGhemJbCvBnCeinCQyrY2vWA5B9KE/XkwtAIe9OyEa/Im+J2KpK2iNUZmt6u710NVC+XBq74SU2O8GFmxKoTXaO/kMqp12cxo/fgunkZx2Al4BSh6NE920jSDH1ScJd7t32hv7g9lNqDigCCLp4ijrVnYmYExsymWBQ0N4RtoFzrkeT7/zVG/AetQL11yl8Cfx+3hH8o1j79oKApCjRxqYqqsCxVx5FVL2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mt26qO5NDiaNOvAR+2zvWiag0wNy8r91HlHeyR16YQQ=;
 b=jb8/IOI4lYBqKZuaES7PCfqb2wtROjzfFvvQDy6lg69DEUAZFGHub06f6SwMfligo7YlubjSpYmT5d3FQLAAlqoCopS65gKlarjMNm2ihgnssOwkrVpUIs6Q+mnMCk8eb/tWKd9hfqMWYyw0fp2NcOuzfwKm9OpazDgOtjiDgpoz2csvqjBrWUpJBJ9ckjj268ANolUG+vvyXx6jprxKkeVrfA1qdTKSTvXZTfqjWIx6EsX1eZfg0PxlYZYcjfs1xMnI8wMr8ZYogFjsfkqp3qYmXNtquDWHMubXcjZRU5Uw2nANUL5JUC2Hi0E8iHF/bP8XM16c+pF+BDDKGB/FLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mt26qO5NDiaNOvAR+2zvWiag0wNy8r91HlHeyR16YQQ=;
 b=3FnSmvtwo14+PWbohShOta5hhPVvGiXPJAlif77NCMQnASDXCL3zFKhry25q+H/Haozy6ZYy2bnJGOnTIzmFKoTogoeJp4oZVdDfgtxu8pF+NeVeccJP1wFUx6QCQT6nuwaDdjBi3ZLGOOBgMyypBcBPEBjEyDrWNx3g/eIpxoM=
Received: from DS7PR05CA0043.namprd05.prod.outlook.com (2603:10b6:8:2f::22) by
 CY8PR12MB8267.namprd12.prod.outlook.com (2603:10b6:930:7c::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.34; Tue, 25 Apr 2023 06:34:50 +0000
Received: from DS1PEPF0000E651.namprd02.prod.outlook.com
 (2603:10b6:8:2f:cafe::a6) by DS7PR05CA0043.outlook.office365.com
 (2603:10b6:8:2f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.20 via Frontend
 Transport; Tue, 25 Apr 2023 06:34:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0000E651.mail.protection.outlook.com (10.167.18.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.16 via Frontend Transport; Tue, 25 Apr 2023 06:34:50 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 25 Apr
 2023 01:34:49 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 25 Apr 2023 01:34:49 -0500
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <frasse.iglesias@gmail.com>, <vikram.garhwal@amd.com>,
 <peter.maydell@linaro.org>
Subject: [QEMU][PATCH v4 1/4] MAINTAINERS: Include canfd tests under Xilinx CAN
Date: Mon, 24 Apr 2023 23:34:30 -0700
Message-ID: <20230425063433.25803-2-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230425063433.25803-1-vikram.garhwal@amd.com>
References: <20230425063433.25803-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E651:EE_|CY8PR12MB8267:EE_
X-MS-Office365-Filtering-Correlation-Id: cf0011a7-6e05-4a7d-7c0b-08db45572bc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +0HovE7o8grLVUX4WYiP/b22sNAZX9ZeRQz9rdGL1O6a0Q1UtsEBkyIlNi/lL9t3mCqB/EGAHGZMBMt71KEyhsqIFux0Xs+JNVxHZ4QnSrXTbiyJdE0NFMT+Ic1TYNHgwrIC4+IyAxDfVGUlEZ51JdVHPrB3OW+R0qmJz885+EwxPKC499A4JClTmmE0sLfnj9AO73Le60Bz/8jDKomZ8IK31eMftV1iOxqwh2ZjwOoVC4zJsxgetK70HIPDedbxQJyrGgC1RTBC3ImUiW/hsgsVmNbfYUDARFuzZJqTVQ9kmgTaamVXa89ZXvm4qkAVQsUTxsAvG1Fs+PIjXUi7M+xnWhNUKIokDQJWkOicEnbHWx7C30KUBA5bUcGcrBbH6i3ykaBuHsGf7CZRT8Fer35HOIlPvKhmqupe6Ayb2hOYy9YrmMWjnlS7V7bh+biu7p1na8d160IcSO5odDwFl7mw6v0Y++aMBpIygkFgkgb16apq8Y0rCzSreXcdGlj75lOCGXkKY1nUcM1CDVigVH/xZ+17MgNRjEeHFaHz2zk6aruThwBPPUnh09225iNYPtNcjiFCTmY7KfaI2OOPEV8Zl/+06EP4SIxKchpd8+ZBt95TgrKJuRUby+zohCMrrjxjTiUq01RSPgMAYCQjV+qeFsNbluUmMVWVUvI834j3jMCS1McQwP1VH+RCbpwcPw4t01tZbp+bN5HlVcd4Z4yJV8sl5jX6rIYhSqJmR4w=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(39860400002)(136003)(376002)(451199021)(46966006)(40470700004)(36840700001)(186003)(6916009)(4326008)(70586007)(70206006)(82740400003)(2906002)(4744005)(81166007)(356005)(316002)(41300700001)(5660300002)(40460700003)(44832011)(8676002)(8936002)(36756003)(6666004)(82310400005)(54906003)(40480700001)(86362001)(478600001)(26005)(1076003)(2616005)(36860700001)(336012)(426003)(47076005)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 06:34:50.0978 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf0011a7-6e05-4a7d-7c0b-08db45572bc3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E651.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8267
Received-SPF: softfail client-ip=2a01:111:f400:7eaa::625;
 envelope-from=vikram.garhwal@amd.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 24154f5721..c3dbacb615 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1809,7 +1809,7 @@ M: Francisco Iglesias <francisco.iglesias@amd.com>
 S: Maintained
 F: hw/net/can/xlnx-*
 F: include/hw/net/xlnx-*
-F: tests/qtest/xlnx-can-test*
+F: tests/qtest/xlnx-can*-test*
 
 EDU
 M: Jiri Slaby <jslaby@suse.cz>
-- 
2.17.1


