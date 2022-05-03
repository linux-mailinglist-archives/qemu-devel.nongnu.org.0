Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDB65188C5
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 17:37:22 +0200 (CEST)
Received: from localhost ([::1]:60128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nluaX-0007bH-2q
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 11:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fkonrad@xilinx.com>)
 id 1nluQx-0003BG-L9; Tue, 03 May 2022 11:27:27 -0400
Received: from mail-bn1nam07on2061c.outbound.protection.outlook.com
 ([2a01:111:f400:7eb2::61c]:26849
 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fkonrad@xilinx.com>)
 id 1nluQv-0003pk-OC; Tue, 03 May 2022 11:27:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UGw+35gjlq4KgJWkKDEBywhGZADfzIkCFT3sSjTC1OlsAWlQlRoMV6OMP+7mrWI5rnLlu8n2Kad3Xx9VbCGMfWBPuD1WpmY5lkoPYWpocRAF5ijM5wlXAvCnqH8Ig1imBUNZ7/kzG8lXuCNRiR+d23bbHTj1d+GB6tmFdcS4m8nwv4bQSYJhYAAcyf2ta1Ye/a2HnDOPL6DOtHW+3mG53Y88+ZSLm+kCX+4igcMYGNHouDc+4lGnJUeXPPLnNEDVffTuOSzYDIbGD9KOb7doMFzunh0klEQ/5wTbbZ0QFSxWGD6gDcNg3qfdT97o8VtmcSGGT5DA8gHmLTj9dJLoFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QCO+F32+RoXokm4SjurhwZBcZIjO6ughu678DMF5GeE=;
 b=bN8m7edSlUY9qRN11LjO2jtSQT54DGQZ3eZbjrF8TvxDJRqtW2zjDldW99DbirQOnpMwL2pFdT1XLGos6K1Tab4QPC2X0qluR1RWhSa2cWikiIhMKAdch0jX/zwWo+fIBd6wMuQcoYC1HdELQ1/BX7Ln9eu+HDNCDChS42bmmGiuou5xdQSy5k8vrV5zNv8ldSGoAjJVz0qzNpNCDwIqFAecKyJwMCxtzPJYu2QFalBhfit6vIniYFzdqztI6M0ggmhqdSInn9na1kTTzVgtdTGphKrinMVpT6IxYK4B0TXyCoDKwHAFip0Plmn9HUy5kwaYkXzbHj+Qm83wgmfYLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QCO+F32+RoXokm4SjurhwZBcZIjO6ughu678DMF5GeE=;
 b=X0IN7li86mNvB30CLer+LOG3LQOaRPL6xfU+5yxLDb8FwAY1pZGaFTQ67HT5rz5x5pDQx3xTQeTsEyt5z19k7DRb3JFec3xxrau98O9OJI93CXEknMKCXMiXpHRGdvVUCcXLN6pDff/AJKCy89y8xY/WKxNvmfUT4h7Y+vKE5T0=
Received: from DS7PR05CA0039.namprd05.prod.outlook.com (2603:10b6:8:2f::16) by
 BYAPR02MB4549.namprd02.prod.outlook.com (2603:10b6:a03:15::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.20; Tue, 3 May 2022 15:27:21 +0000
Received: from DM3NAM02FT053.eop-nam02.prod.protection.outlook.com
 (2603:10b6:8:2f:cafe::89) by DS7PR05CA0039.outlook.office365.com
 (2603:10b6:8:2f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.6 via Frontend
 Transport; Tue, 3 May 2022 15:27:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch02.xlnx.xilinx.com;
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 DM3NAM02FT053.mail.protection.outlook.com (10.13.5.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Tue, 3 May 2022 15:27:20 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 3 May 2022 16:27:20 +0100
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 3 May 2022 16:27:20 +0100
Received: from [172.21.132.221] (port=36824 helo=xdcsswbld02.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <frederic.konrad@xilinx.com>)
 id 1nluQp-0002mH-Dn; Tue, 03 May 2022 16:27:19 +0100
From: <frederic.konrad@xilinx.com>
To: <qemu-devel@nongnu.org>
CC: <alistair@alistair23.me>, <edgar.iglesias@gmail.com>,
 <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
 <sai.pavan.boddu@xilinx.com>, <edgari@xilinx.com>, <fkonrad@amd.com>
Subject: [PATCH v1 4/4] xlnx-zynqmp: fix the irq mapping for the display port
 and its dma
Date: Tue, 3 May 2022 16:25:45 +0100
Message-ID: <20220503152545.1100386-5-fkonrad@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220503152545.1100386-1-fkonrad@xilinx.com>
References: <20220503152545.1100386-1-fkonrad@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7092aabe-96c8-446f-75fc-08da2d196a96
X-MS-TrafficTypeDiagnostic: BYAPR02MB4549:EE_
X-Microsoft-Antispam-PRVS: <BYAPR02MB454955A576750046281672A8CCC09@BYAPR02MB4549.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0Pkfkbf+xMn7Vk2Jb4gcUivLJzP8frnjsfZpnp0+3nc2I4uPE8NYz3gjQ8/r+UtT67XtWGoBkt/EFVukWpc2MWopWfEzCV9w85TxqlMpeTmVRcqdN2sdR75s7X7Xq+pJxiTad7cF957N5Pgm67ioVx/Wb4mH5sErmDyQ5wB7CrfDpA/F6YtNG2e6DCD5VqtyEknaDGJkWOYai19gcLeJW05ORBRK0VPUtIIyQvNEzDMqOHbxf3neYmgAWaYj2mFCS3RjR18Nne2C8Q09dFBhgudCDT2HpX3OKYsYVnFuV/aUnhnKcCyzIyJu9JhX30lRwx+9AnefE3F9eXkJAshigr7zgGkfoBb1/yfrhmwF7+46YkptTMPBoSiMv+/tkD50Y4IOEP2LGjnt2tlOgktiykAHQJqQHIcZ97w01VXunmcdYWzsRuqBFlk8nRhjJUJhIkZ+aQVDRPq7Kb0QTzg4oJW2ZpHI292uq9GjymIGIDrS+bWsIP9wiWMoCZ4/Dc1RkaKuRG5kIEbNA2+eI97OMoMZuE36HvU4GZBxZfR+lT/GSOFg33Qhyhv7hut3bCox/cMjwS8Im2SP+Y3YKKa2U9z3HpjFb6Bh6SXpqtBc3jeY6Nthto5Q2oxICBuQuN3NKP6kgmLoxtaBNb0G2UD3FiZvbUrfQqfDTdxSRn4Y4ui9OLg7R8X2N2odIXCsfJQ4Pa17YZLEVbMK7lWWbWJGNA==
X-Forefront-Antispam-Report: CIP:149.199.80.198; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:xir-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-80-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(54906003)(2876002)(4744005)(2906002)(508600001)(26005)(6916009)(5660300002)(70586007)(8936002)(70206006)(426003)(36756003)(9786002)(1076003)(2616005)(8676002)(4326008)(36860700001)(7636003)(336012)(356005)(83380400001)(82310400005)(40460700003)(47076005)(6666004)(186003)(316002)(7696005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 15:27:20.9055 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7092aabe-96c8-446f-75fc-08da2d196a96
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.80.198];
 Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT053.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4549
Received-SPF: pass client-ip=2a01:111:f400:7eb2::61c;
 envelope-from=fkonrad@xilinx.com;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 03 May 2022 11:33:53 -0400
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

From: Frederic Konrad <fkonrad@amd.com>

When the display port has been initially implemented the device driver wasn't
using interrupts.  Now that the display port driver waits for vblank interrupt
it has been noticed that the irq mapping is wrong.  So use the value from the
linux device tree and the ultrascale+ reference manual.

Signed-off-by: Frederic Konrad <fkonrad@amd.com>
---
 hw/arm/xlnx-zynqmp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 375309e68e..383e177a00 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -60,10 +60,10 @@
 #define SERDES_SIZE         0x20000
 
 #define DP_ADDR             0xfd4a0000
-#define DP_IRQ              113
+#define DP_IRQ              0x77
 
 #define DPDMA_ADDR          0xfd4c0000
-#define DPDMA_IRQ           116
+#define DPDMA_IRQ           0x7a
 
 #define APU_ADDR            0xfd5c0000
 #define APU_IRQ             153
-- 
2.25.1


