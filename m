Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A930A52D8F3
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 17:48:50 +0200 (CEST)
Received: from localhost ([::1]:33558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nriOP-00038T-PK
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 11:48:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <bounces+SRS=DmMzc=V3@xilinx.onmicrosoft.com>)
 id 1nriFE-0007Xs-5s; Thu, 19 May 2022 11:39:25 -0400
Received: from mail-bn1nam07on2060f.outbound.protection.outlook.com
 ([2a01:111:f400:7eb2::60f]:23553
 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <bounces+SRS=DmMzc=V3@xilinx.onmicrosoft.com>)
 id 1nriF8-0008Rx-9H; Thu, 19 May 2022 11:39:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AmRtXE6USoFGeEslhh34G3OKTckXhijehJkBbNLnmemQ7Vq2jObo96XtA1crrd8Kc6un8WiWvOOTzHicJZdjiVaGtD7/2s8EBqmHqP0A8qVzcKh1EEVW5RgAUldhLbsw4z6UotZDuG+B4pxspoRezhh/1rMzq0T3VlYWai7Q5mtXD9Ne4RqyymqNZnrVcXx5g4DfmaNmSGkMDvaEsiu6EYlttOWdPV74q/UC6Qi4g+fg7pTG+3VxKAJ2xa9kqZsKE3xh9tb3bnVxsrauxZmbbrgwOG9nTOrI/20kff6la3uvdcp8RBxWdPdERlOgGNs2t2ya/2Sqt7ZhmwpQt9P6FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TJTUI8LE4GrkbevW5hQJgSYHGGQ54q8PX7vKxGohbCA=;
 b=mD4Fa2fGn70J8CjAWywe5hGFAp+9oMNRmhsuvr7vRgVaPP5V/u2Zg/KEi+aHBCCO9pFYZV8k8V/TYwth0F5h96iUjjj1spPCPzGdtrRz+8SYlrC+sQbSBGlgqwApTqo/kunwXd7g7lZoyS7PYA8zYQdLireQ56kEBdyrc/pPp/qtKGtJLbdJ5E5vCiy+Q+DIXMgKrHu+c8dpHhAsy04/DSdgTl2HzpK2gBg0OHVU3h+d6iTZV8xV5S6rhcLhioE/I7ebynFCrBoDuRwfDW2iimSkhwFZ4CDRTRjz8JpZLlD7y6MarqZIx1wdVSsv3td5On/Bl/K21mVJZsvoHIbkwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.80.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJTUI8LE4GrkbevW5hQJgSYHGGQ54q8PX7vKxGohbCA=;
 b=dwdm6LRK8BxhrVTaRDRMCjesNG6UNE+sW4+WWcHy5RvyasRkFZJb3DatzfoI1NnfSvV/CPE+4yRpZIsrAd2j7Z4MdrXlo0cXGndF3hTLCbctumzHd2gPgz+/E1SwSSzmOtMcz3cmERAzD+y+y1FI4PwZUT0kD0lY32LJ/r7KA6A=
Received: from BN9P221CA0008.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::30)
 by BL0PR02MB4642.namprd02.prod.outlook.com (2603:10b6:208:40::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.17; Thu, 19 May
 2022 15:39:06 +0000
Received: from BN1NAM02FT033.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:10a:cafe::da) by BN9P221CA0008.outlook.office365.com
 (2603:10b6:408:10a::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14 via Frontend
 Transport; Thu, 19 May 2022 15:39:06 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.80.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.80.198 as permitted sender)
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 BN1NAM02FT033.mail.protection.outlook.com (10.13.3.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Thu, 19 May 2022 15:39:05 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 19 May 2022 16:39:04 +0100
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 19 May 2022 16:39:04 +0100
Received: from [172.21.132.221] (port=36706 helo=xdcsswbld02.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fkonrad@amd.com>)
 id 1nriEy-0007q5-IT; Thu, 19 May 2022 16:39:04 +0100
To: <qemu-devel@nongnu.org>
CC: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <edgar.iglesias@gmail.com>, <alistair@alistair23.me>, <saipava@xilinx.com>,
 <edgari@xilinx.com>, <fkonrad@amd.com>, "Edgar E . Iglesias"
 <edgar.iglesias@amd.com>
Subject: [PATCH v2 4/4] xlnx-zynqmp: fix the irq mapping for the display port
 and its dma
Date: Thu, 19 May 2022 16:38:29 +0100
Message-ID: <20220519153829.356889-5-fkonrad@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519153829.356889-1-fkonrad@amd.com>
References: <20220519153829.356889-1-fkonrad@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4007d633-775a-4248-d819-08da39adb550
X-MS-TrafficTypeDiagnostic: BL0PR02MB4642:EE_
X-Microsoft-Antispam-PRVS: <BL0PR02MB46427C2FF904272E699094AFA6D09@BL0PR02MB4642.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W9Db/oEM+KKNMoF9nZ5kOmQEBAKWn+bW4Ml5Sa9vdJzlj2t6N/9Y4HPseXOiftItggxR5SI1RrZctMEMLxYdF2f95t7HhLf+L8SigCX24EZKbXcCv1LQOVeFtbzIRqnISVrH/3EG+Yoy72nQmAvp6o83bQ8lVl70AU82jhHVXsLOWMkdits3ysUL49dJ2qnCYiSF66a7Zx4eDEi7PKclzpB3BKAXjwfiF4kDwRYomZnE+RNnL80LAgscKLCdW9uNN8wM5sKH8YG4PXmcfNz6+gt/13uHduMuAhSX0H7fWnrr711oPPGvoMpvNu5PTTqn5z4wEuodrkXD/WvpK9Hu5sAdNcH++iF6XmScUd+rJOZruHveO69FLbra++j39Bl9iF7CLnUK9BD+5zY7WV/MfUUxUitNPDi+Ljxf9LiQ3sDpo+CxB8fgpvbsto43SUJUMWaP4M0GA8j877XfxHxFQd8NnGFe4gxqvnkDGNaxKZjrQ1irFx70vIjnSvUIRfITZeLG3PVBG/Il8bhaboV05UOi/HHb+GpwE8XKXgFZLel6thqRWc9rud5I14yAQwjTQT1n59vGyeUyDzZegtdzCLmW9j2eA9MzdAi5MRk26N79Ll9OyS5dQW5EEuUNmvQQAiVCwyLZgyArXiTgcIN8p2axiSMc+Ah/Ipaz3i1+Hmg7HgL2bvOQzB9aSCzeOqY6V4fPvwh8SdvgWXu2Zsmbiw==
X-Forefront-Antispam-Report: CIP:149.199.80.198; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:xir-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-80-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(336012)(54906003)(83380400001)(40460700003)(26005)(6916009)(70586007)(82310400005)(9786002)(47076005)(1076003)(8936002)(508600001)(356005)(86362001)(4744005)(7636003)(5660300002)(316002)(35950700001)(70206006)(2616005)(2906002)(36756003)(4326008)(8676002)(6666004)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 15:39:05.8727 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4007d633-775a-4248-d819-08da39adb550
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.80.198];
 Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT033.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4642
Received-SPF: pass client-ip=2a01:111:f400:7eb2::60f;
 envelope-from=bounces+SRS=DmMzc=V3@xilinx.onmicrosoft.com;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  Frederic Konrad <fkonrad@amd.com>
From:  Frederic Konrad via <qemu-devel@nongnu.org>

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


