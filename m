Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA32E4A87E0
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 16:42:07 +0100 (CET)
Received: from localhost ([::1]:55518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFeFK-0008OT-97
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 10:42:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1nFeCE-0007gT-Ap
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 10:38:55 -0500
Received: from mail-mw2nam10on2064.outbound.protection.outlook.com
 ([40.107.94.64]:28769 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1nFeCB-00028V-R4
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 10:38:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ny3pRPJD/dDjt3pA0s+a/1yoo8HJlwvVLTpG05synTFSZk2rckf6Yb/XBkPCmZj/vJrkU2n9iyRZlBEfggUoehkogVW1dHQa3oE25VFWcYPidKC9MsIMh0RhQNo3TXO95MmyQ1H7jSRgo9Xm5/SWOrZm/yVBiW0OqO0oYQx35eThVPDaeHjhA9WNoD5iPs4Hp6dqJOYzRTqzkatZMjXm439yeshZ0w/8oOaeMp70m+4IRkp5B0NexM8cHe+p20FbSmfa9fyn6ZmfY2s7LCXKnZfl/ifPzZTVGjPdoqVz8NG1E/VF+TbQ0+/MwT9wDWhlajHmAqxKXXAmUTLG+ltqew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OIjNk5AdO4wSNXj+TwjnZ5HAvBT9MiiSg77EH7R9sQg=;
 b=EyVqyPIz+VXImjGcxEA9Rk8e1ObYXUNzdyQ7AgPWAiZ0iQwnCERs3u4RoMyr0DAqGWbLi9om3wfaTn8Es8ntJSKlwXlL6Wgy8PwBaW7OfvUXOvozsWS3fvZuBimIqjSSxGl7A/165UCCef7i37++VzzpCnbtp/z4y4qs1tY49FerGJqSR736OoaZNn2QBEBGjCE2Jia4tffgWhgU/wjlE8hY5AoZ7ySEqJ7YvtEhgMnqwFhyPt3PwVjirStdCITQ1sJeIEIVVIIg1pOYzYHVBsfo8Tu1n7wenFEBTHUYcd8+1FujMex9gEytRJVT1jzzTe8c+GlpGAssIqLMx5Z/hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OIjNk5AdO4wSNXj+TwjnZ5HAvBT9MiiSg77EH7R9sQg=;
 b=d9pu3LaxRwg10AAd5UX1TB7Y84Xq/2tjr5i4vBgoCkMyR8fJ2r1DCaguzh4MHfaIdTbdiVD9Jz4uTQqkq02jTBo2oysUQEqXKfb95XHMUd5PpWBvft2vLcfIwwOuhdr1gJbkjvLkjP0ZfF6OQMQGlZG+Jn75PQvJIec4+7GYyrQ=
Received: from SN6PR05CA0032.namprd05.prod.outlook.com (2603:10b6:805:de::45)
 by SA1PR02MB8654.namprd02.prod.outlook.com (2603:10b6:806:1fd::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 15:17:46 +0000
Received: from SN1NAM02FT0041.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:de:cafe::2e) by SN6PR05CA0032.outlook.office365.com
 (2603:10b6:805:de::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.6 via Frontend
 Transport; Thu, 3 Feb 2022 15:17:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0041.mail.protection.outlook.com (10.97.5.44) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Thu, 3 Feb 2022 15:17:46 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 3 Feb 2022 07:17:45 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 3 Feb 2022 07:17:45 -0800
Received: from [10.23.120.1] (port=49652 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1nFdrl-0006To-2R; Thu, 03 Feb 2022 07:17:45 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v1] hw/arm/xlnx-zynqmp: 'Or' the QSPI / QSPI DMA IRQs
Date: Thu, 3 Feb 2022 15:17:42 +0000
Message-ID: <20220203151742.1457-1-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c1716d4-dbcc-450b-2bb2-08d9e728550c
X-MS-TrafficTypeDiagnostic: SA1PR02MB8654:EE_
X-Microsoft-Antispam-PRVS: <SA1PR02MB8654BB262B5B779D07CC5D1AAD289@SA1PR02MB8654.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:773;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 59LGij1hjGZGsIb19n4luCAvpjnljJphJqEvMwD6ounJERPBG6dmcXFawNt5ron2XQGdUnLEFZgLVHJZezrue5Or0NPEq1bo22+s53VaFPbEYV+DF0se1PLqhsK9Cv0PtZCV6lDPxBTNtH01wslGr+1ODBUHzFobiC4I15bVOmMVcI1fIVq2xj1U8oKw4MurLrh7vFQvZ3i2njXkl/PKWAqgxLZPDcoZQtcteFJWQG/iFcnDPR5Acx1UixCk7/WYmYgBAllypbpmbo/jbm8KYNkN1MwCptPVt6+nPeP3ogFWy+Bi0E+MQx0Q0wexxrqeOPtCcIkyYL9kNp6wBotA+VOt+xfrt/CUElY5dPO3H/Uhl5cjU0KbkwKnmtb/kTAp3mHEZgBlFjjmT/FFPZzWriq8iZfYG1mRldYfayZKkfUsoiwkHN8bqcbpVmG7xX3f29GbAwvPWC9BKGJsSlgiuPw/44LBNQH73/ktPy1l4syNagpNn6DxQ59b376mAL2GpjNitjEViiRJeFhC3zMlNBXbIg50a/UGoXdNvzUuMsYiJoEcsun8jksUMyQ0mPyl6fKAC8sIoa7lO+RPsBgADyn0qtJ/5xRBbvmyZSOHYohRL8tnV3CFW8M2Lsbe6mdEmwHEePCaz2XKRxyV0YYtCLMQTqdkJ6GC97iD8MSBIfaO50ZPFcMLSZ0lbgRF3F2V5Lq1rQHHKEW8ECLJYiSGoQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(8936002)(8676002)(356005)(5660300002)(4326008)(82310400004)(70586007)(70206006)(7636003)(9786002)(54906003)(40460700003)(6916009)(47076005)(316002)(2906002)(36860700001)(2616005)(44832011)(26005)(186003)(1076003)(6666004)(336012)(426003)(7696005)(508600001)(36756003)(83380400001)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 15:17:46.0423 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c1716d4-dbcc-450b-2bb2-08d9e728550c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0041.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR02MB8654
Received-SPF: pass client-ip=40.107.94.64; envelope-from=figlesia@xilinx.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: edgar.iglesias@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, luc@lmichel.fr, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'Or' the IRQs coming from the QSPI and QSPI DMA models. This is done for
avoiding the situation where one of the models incorrectly deasserts an
interrupt asserted from the other model (which will result in that the IRQ
is lost and will not reach guest SW).

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
---

Hi,

I noted this after receiving a review comment (from Peter Maydell) on a similar
issue on the Versal machine while working on the OSPI series.

Best regards,
Francisco Iglesias


 include/hw/arm/xlnx-zynqmp.h |  2 ++
 hw/arm/xlnx-zynqmp.c         | 14 ++++++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 062e637fe4..9424f81c37 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -38,6 +38,7 @@
 #include "hw/dma/xlnx_csu_dma.h"
 #include "hw/nvram/xlnx-bbram.h"
 #include "hw/nvram/xlnx-zynqmp-efuse.h"
+#include "hw/or-irq.h"
 
 #define TYPE_XLNX_ZYNQMP "xlnx-zynqmp"
 OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
@@ -122,6 +123,7 @@ struct XlnxZynqMPState {
     XlnxZDMA gdma[XLNX_ZYNQMP_NUM_GDMA_CH];
     XlnxZDMA adma[XLNX_ZYNQMP_NUM_ADMA_CH];
     XlnxCSUDMA qspi_dma;
+    qemu_or_irq qspi_irq_orgate;
 
     char *boot_cpu;
     ARMCPU *boot_cpu_ptr;
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 1c52a575aa..5fbf38c466 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -50,6 +50,7 @@
 #define LQSPI_ADDR          0xc0000000
 #define QSPI_IRQ            15
 #define QSPI_DMA_ADDR       0xff0f0800
+#define NUM_QSPI_IRQ_LINES  2
 
 #define DP_ADDR             0xfd4a0000
 #define DP_IRQ              113
@@ -362,6 +363,8 @@ static void xlnx_zynqmp_init(Object *obj)
     }
 
     object_initialize_child(obj, "qspi-dma", &s->qspi_dma, TYPE_XLNX_CSU_DMA);
+    object_initialize_child(obj, "qspi-irq-orgate",
+                            &s->qspi_irq_orgate, TYPE_OR_IRQ);
 }
 
 static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
@@ -709,6 +712,11 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
                            gic_spi[adma_ch_intr[i]]);
     }
 
+    object_property_set_int(OBJECT(&s->qspi_irq_orgate),
+                            "num-lines", NUM_QSPI_IRQ_LINES, &error_fatal);
+    qdev_realize(DEVICE(&s->qspi_irq_orgate), NULL, &error_fatal);
+    qdev_connect_gpio_out(DEVICE(&s->qspi_irq_orgate), 0, gic_spi[QSPI_IRQ]);
+
     if (!object_property_set_link(OBJECT(&s->qspi_dma), "dma",
                                   OBJECT(system_memory), errp)) {
         return;
@@ -718,7 +726,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     }
 
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi_dma), 0, QSPI_DMA_ADDR);
-    sysbus_connect_irq(SYS_BUS_DEVICE(&s->qspi_dma), 0, gic_spi[QSPI_IRQ]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->qspi_dma), 0,
+                       qdev_get_gpio_in(DEVICE(&s->qspi_irq_orgate), 0));
 
     if (!object_property_set_link(OBJECT(&s->qspi), "stream-connected-dma",
                                   OBJECT(&s->qspi_dma), errp)) {
@@ -729,7 +738,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi), 0, QSPI_ADDR);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi), 1, LQSPI_ADDR);
-    sysbus_connect_irq(SYS_BUS_DEVICE(&s->qspi), 0, gic_spi[QSPI_IRQ]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->qspi), 0,
+                       qdev_get_gpio_in(DEVICE(&s->qspi_irq_orgate), 1));
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_QSPI_BUS; i++) {
         g_autofree gchar *bus_name = g_strdup_printf("qspi%d", i);
-- 
2.11.0


