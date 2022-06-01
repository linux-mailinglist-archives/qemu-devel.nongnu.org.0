Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D0F53ABED
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 19:31:45 +0200 (CEST)
Received: from localhost ([::1]:50586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwSC8-0001bk-7M
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 13:31:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fkonrad@xilinx.com>)
 id 1nwS4x-0000xA-Oe; Wed, 01 Jun 2022 13:24:19 -0400
Received: from mail-mw2nam10on20617.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::617]:33120
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fkonrad@xilinx.com>)
 id 1nwS4v-00073v-3W; Wed, 01 Jun 2022 13:24:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LOeYMhuGNywE8oTESq/zdhNVtzfl04zyiz8x44LKcpWoC/t82hw9gXacIdI1L+g/lVdQN7co4FnlTucon6MPsY7h/GYle7Jdi5hUf3wnZ3q3aGJgmyD8r4QNDiKL4rscG8McCCZs/O/sh3kqA1HNirESqwuFJKyEc2zN/ZkYF8rNQqsQimitWvHUiHJqXqcURFwXec9pVYY7Iv8yxxmcanTjmS27lQu12uBQeOkICmj7IEfY2Q2bU2+oJPudJTwnT5tWQzkGKW36QTBPWIeYl/3ryfFCIpkxtNQq4iBqsBIz5w4qcc2uo8eb4s/1a0aUTd8HXtA83mRSHiE9MB/hDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=40e6uGXZHzMJvmc3JzOaz9ERIYW0+lPfTKNCnEvlhvg=;
 b=bmOBWiQ2DPYog8ZyB7fZHO6vDswZqPWY/xRv+SD53qIlM/3f5A+YaD4xJ8QXWsdGu94HDCfZaZOATMPRycSP/wT/PIHs6t/BexqBDqtvLk3niK45zBSOGx+U0B7slxquioeM31SwsX1QlXwomUOzSvsSO6pEl4U+VNMh+j7NB+4IJ5NXa5eqbEDGee+/W2MpHtTKd8gHKZ80c85RpXUWCyvmB99GRQGVcx8CSyh4rmhDUB6pXdh1c3K57xqL9u4FqY+ci1Z6VXp9VqCwxNz7fNFNx3XQLnBMF38cWwyxkBaCayFOGc7fygweM/tmnII2076JpEiwHdzDughu25L/pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=40e6uGXZHzMJvmc3JzOaz9ERIYW0+lPfTKNCnEvlhvg=;
 b=XBUyzIzTYsTIID2CgjrxyGE4rUpLpF7sjlux615Yj5/M9hrxpnx5OcKLGdWcqaMu1QTxeXqk46/7u6xc+EIAGcrHUr4NOSO5FB2DkoLJum6rakcV7OT5r/HweHqml3J4Djal59CYA54UMZv53+gQxuvOCqZljruDRTPLmRh98k8=
Received: from DM6PR06CA0040.namprd06.prod.outlook.com (2603:10b6:5:54::17) by
 CH2PR02MB6229.namprd02.prod.outlook.com (2603:10b6:610:1::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.13; Wed, 1 Jun 2022 17:24:13 +0000
Received: from DM3NAM02FT057.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:54:cafe::c1) by DM6PR06CA0040.outlook.office365.com
 (2603:10b6:5:54::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Wed, 1 Jun 2022 17:24:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 DM3NAM02FT057.mail.protection.outlook.com (10.13.5.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5314.12 via Frontend Transport; Wed, 1 Jun 2022 17:24:12 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 1 Jun 2022 18:24:11 +0100
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 1 Jun 2022 18:24:11 +0100
Received: from [172.21.132.221] (port=53720 helo=xdcsswbld02.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <frederic.konrad@xilinx.com>)
 id 1nwS4o-0004Ck-6M; Wed, 01 Jun 2022 18:24:11 +0100
From: <frederic.konrad@xilinx.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <edgar.iglesias@gmail.com>, <alistair@alistair23.me>, <saipava@xilinx.com>,
 <edgari@xilinx.com>, <fkonrad@amd.com>, "Edgar E . Iglesias"
 <edgar.iglesias@amd.com>
Subject: [PATCH v3 4/4] xlnx-zynqmp: fix the irq mapping for the display port
 and its dma
Date: Wed, 1 Jun 2022 18:23:53 +0100
Message-ID: <20220601172353.3220232-5-fkonrad@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220601172353.3220232-1-fkonrad@xilinx.com>
References: <20220601172353.3220232-1-fkonrad@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fdad54b4-cbab-40a0-4808-08da43f38bfe
X-MS-TrafficTypeDiagnostic: CH2PR02MB6229:EE_
X-Microsoft-Antispam-PRVS: <CH2PR02MB6229AB29EAAD5B26DDA1B2CACCDF9@CH2PR02MB6229.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QROWk8btfgO5AjhnSu/4m4RbaLNZCGxMv+Psz7k2jhVo+DRsno21mdy+gwW4g+AKJKkIoLm8j4U+KOpHD+RKx7SZlAsBmEgaWiL6sJh0OA2+/XY11VsvpDyJVaZyF/9/RYUS9OxOPCMor8J/tSDcIYo2KCbSlaNukxJphu1rSTTa4Z7fhd+M555D5/0P//3M5ZQ73cpWSqNFu1wafEyMvi4QfD3VWQHu9roRKRF3njUOl1kBeJBLX7eoOGHwiG3TSh6iTyqvjfxTBwKVdB+QljkCIwHSET0l9vTd9bckJ5w5lqrd1begolHlf8e/uCC1Z1/yNlBL9hlg6N5vaYyAmeKQqONiYa4cltS2irB7Ne2AgVoCibgs8P1bbHaJFgNsIK5jFh7sunjM8AY2ygdQJb/MumlbqUNQBV592KAHEFbR8Rfh1kGGL1dAmm3aCjrwT4bUBqBWuejlwnEZmXzRtMmvmZ5GnNnpWuIXIMjiYt2nNcs2cZFbOOc8ySLdR5s4p+qpJ/5Bke9rKLTupGhfIbYVZmSOlJVrcqj4Smyp8UQ4ZrzlnANAPv8FcWRo8hWZeKMcc1bfVASjXhFY3JQkMaplc2WAqsHrnAuGbyxfEKJYRm7e46pcQHt4vAgcRmweUs/MvzRxNDDSQBjO68JjWqQqszONJWekkKt4sbLLAk9dIFeBjuEO3a9hYzYDhy9WeEP0gsN3hQEjIvUscFO2eQ==
X-Forefront-Antispam-Report: CIP:149.199.80.198; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:xir-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-80-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(2876002)(36756003)(40460700003)(36860700001)(336012)(426003)(47076005)(186003)(1076003)(2906002)(7636003)(8676002)(2616005)(4744005)(83380400001)(82310400005)(8936002)(9786002)(356005)(6666004)(70206006)(26005)(316002)(7696005)(70586007)(4326008)(508600001)(6916009)(54906003)(5660300002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 17:24:12.8970 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdad54b4-cbab-40a0-4808-08da43f38bfe
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.80.198];
 Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT057.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6229
Received-SPF: pass client-ip=2a01:111:f400:7e89::617;
 envelope-from=fkonrad@xilinx.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frederic Konrad <fkonrad@amd.com>

When the display port has been initially implemented the device driver wasn't
using interrupts.  Now that the display port driver waits for vblank interrupt
it has been noticed that the irq mapping is wrong.  So use the value from the
linux device tree and the ultrascale+ reference manual.

Signed-off-by: Frederic Konrad <fkonrad@amd.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
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


