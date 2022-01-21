Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F06194962A8
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 17:15:32 +0100 (CET)
Received: from localhost ([::1]:50706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAwZY-0007c7-2O
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 11:15:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1nAwWA-0005DL-9K
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 11:12:02 -0500
Received: from mail-bn8nam12on2076.outbound.protection.outlook.com
 ([40.107.237.76]:65249 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1nAwW5-00066w-3O
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 11:12:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GXacYl2/cbPf7Tbxzo1ZGjiYPcejnYbN7maUv1U7Ut4bHiuEKHZe+gPqaiaCbkR/ghXRYst2qLtn2RnBYSpFWuw3OvWDZGFZtYI4KppDQpIumZ6Eh2DAeJBK6XWzNbnahkp5CvKShfIXu6+LvZ2XE0TwWTsSC+r3Atxl3jIecLFMGkaZ5SmN5Smyxg3UEtJOWYoOcuybXC3yJZfQXPxae1h0KN/oFugVQnys0KLdiZXRk9yzXhgD1tAieQGAqKE2ZOvYOeho3PuE7pXaA4LdSuS17bmep5/EYjvBk3OpEyjpnApXhRwn/okx0KWUG2k0H1JceSUzkJzguDBd9AvP0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9aksEtVRW/DZBBq+1g70mk1b8ZuctpMr9Rgp0f7Yf8=;
 b=DKbwc5g/C7WZM8TJW7D5lpUDqiN0Jjh9IbTPAqfZOwEOfTP5tclD9fuG2NN9jyivJllbAEUUhYxPZG831Rz+1zLzezL2l3KW0d7la0lCw8dwaBD1v7KTwV+d0Y/OuWMvjPzvTYq3np21glT3xsPTZ/VtdQP46edjCzr59+Mlb4KXjt4nN9fpyeYjljjVoKCSy+bIPsbT3qEi5hksEXqABZz5MJ0JoPtRnjYBO1Gx3j4yrdBY2+ly92Z3b0FsDM69+LFCGZWUk8B55cu0EgVFJyAHu4CiPcg8KIJS0SpSA2wYomH7GLJlukCOeA92f7BHSLLf/sTFJ/AHHB692TJzDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9aksEtVRW/DZBBq+1g70mk1b8ZuctpMr9Rgp0f7Yf8=;
 b=MFfck9Au/m6fIr5w5S+bIOcHe2pfKtY1VR41y7+fsJbPbDdMxGp2DXQnzLTWM41EX/TNhtUWBWJqd392QKVUw1p3Q7WWy9MTDlwa7ZNDecPTxmALzl7bukWlN8dlW9LfJv8mw2PjsmQW2IDhzQZBUDwH/Ko0gGbQ7phsC+rod6k=
Received: from DM5PR21CA0043.namprd21.prod.outlook.com (2603:10b6:3:ed::29) by
 BN6PR02MB2609.namprd02.prod.outlook.com (2603:10b6:404:53::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.10; Fri, 21 Jan 2022 16:11:53 +0000
Received: from DM3NAM02FT032.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:ed:cafe::55) by DM5PR21CA0043.outlook.office365.com
 (2603:10b6:3:ed::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.9 via Frontend
 Transport; Fri, 21 Jan 2022 16:11:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT032.mail.protection.outlook.com (10.13.5.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.8 via Frontend Transport; Fri, 21 Jan 2022 16:11:53 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 21 Jan 2022 08:11:46 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 21 Jan 2022 08:11:46 -0800
Received: from [10.23.121.133] (port=62231 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1nAwVu-0002nH-1d; Fri, 21 Jan 2022 08:11:46 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v7 01/10] hw/misc: Add a model of Versal's PMC SLCR
Date: Fri, 21 Jan 2022 16:11:32 +0000
Message-ID: <20220121161141.14389-2-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220121161141.14389-1-francisco.iglesias@xilinx.com>
References: <20220121161141.14389-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b777a24-ca3b-442a-0785-08d9dcf8bd34
X-MS-TrafficTypeDiagnostic: BN6PR02MB2609:EE_
X-Microsoft-Antispam-PRVS: <BN6PR02MB26098912AFB7F5042B731483AD5B9@BN6PR02MB2609.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TucFbQwyKZacCMHvddGpL363iFUI7YZ7dkVLUjmqtCDFkgfuYyDOjjiprIxTqXA6nvP8x4jSTNZ8IH3e3RfF4Pp1/TaCmBhbSMOCzhYoHzGn5EOYCChXAxatQX7CN5PTVO/u5QBn4bGHWs7qocKnd71PAg0voBwsL67RuuTpKAXq/AwE3DvIxDhUcJupfFlubIVFzARBCC6u0Ijr6vInjYFGAoGEQh08hhCU7ZQCLXRtqNVr23Z8tN9JQwUO6IVH5DuSZCpGpDAlw4LBY/EwGm5bVAopVLL3aoc/lPgj+Th4EcfTuUBLYA/L8XI+VLHW6aY+hLftG/itSdKbCjkJaUXPJV6lCYT8RC01oQ92zJDwsTP16XIpZuTt35iZ6YAfheAM/7bnX4222j+cQ1kps0iXwY1f49nc2YjxbXHIIW1Ek6zpoGjtJJs7ON7dUaliuvFIOWg+83Z6eW9rVS7bdyUVXNCJ4A2QhkAZphaiJbsjiAVjnD7x/6NKMg+RKKgvRMhiRcee3vWsjeOGabxX8eOgwSrwNQIoX+hdznzVnbtj++ShXcjG4TFKqc2vA8Cfh2MBOnv+EnzuQCpZAA2Z6MFRIOUf/OOoYJs2GYeKgRo8NYe/eoXMiVq1c8kVXqWcgNnNCPWsk9m16nXRQu/VkhIXOADwDncxdvbQU37djIfP4idhDhEnIxMD19GGaHlKlJTnGYsvYHBE3LjUu2vZO0e3FvuadpcCUWsLs28kQTyiaJ7Uae1ng8R2HsgqBfSAGmS4HhR3wOkL3ACAlenXTwAmSYfsHW80Zv13GFWT3b1V0ytPQdLL3WoX72YVoTU+uQDTeQvyz1PPDStGG2cHxLbAmKFwsoUHDUhO+83XY4J9dzlioVFmOKqmcwhirCV4
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(426003)(7636003)(8676002)(8936002)(1076003)(2906002)(186003)(4326008)(30864003)(316002)(356005)(47076005)(336012)(26005)(966005)(9786002)(6916009)(83380400001)(5660300002)(44832011)(36860700001)(6666004)(7696005)(2616005)(54906003)(36756003)(70206006)(70586007)(508600001)(82310400004)(102446001)(559001)(579004)(309714004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 16:11:53.3002 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b777a24-ca3b-442a-0785-08d9dcf8bd34
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT032.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2609
Received-SPF: pass client-ip=40.107.237.76; envelope-from=figlesia@xilinx.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 frasse.iglesias@gmail.com, alistair@alistair23.me, alistair23@gmail.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a model of Versal's PMC SLCR (system-level control registers).

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
---
 include/hw/misc/xlnx-versal-pmc-iou-slcr.h |   78 ++
 hw/misc/xlnx-versal-pmc-iou-slcr.c         | 1446 ++++++++++++++++++++++++++++
 hw/misc/meson.build                        |    5 +-
 3 files changed, 1528 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/misc/xlnx-versal-pmc-iou-slcr.h
 create mode 100644 hw/misc/xlnx-versal-pmc-iou-slcr.c

diff --git a/include/hw/misc/xlnx-versal-pmc-iou-slcr.h b/include/hw/misc/xlnx-versal-pmc-iou-slcr.h
new file mode 100644
index 0000000000..ab4e4b4f18
--- /dev/null
+++ b/include/hw/misc/xlnx-versal-pmc-iou-slcr.h
@@ -0,0 +1,78 @@
+/*
+ * Header file for the Xilinx Versal's PMC IOU SLCR
+ *
+ * Copyright (C) 2021 Xilinx Inc
+ * Written by Edgar E. Iglesias <edgar.iglesias@xilinx.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+/*
+ * This is a model of Xilinx Versal's PMC I/O Peripheral Control and Status
+ * module documented in Versal's Technical Reference manual [1] and the Versal
+ * ACAP Register reference [2].
+ *
+ * References:
+ *
+ * [1] Versal ACAP Technical Reference Manual,
+ *     https://www.xilinx.com/support/documentation/architecture-manuals/am011-versal-acap-trm.pdf
+ *
+ * [2] Versal ACAP Register Reference,
+ *     https://www.xilinx.com/html_docs/registers/am012/am012-versal-register-reference.html#mod___pmc_iop_slcr.html
+ *
+ * QEMU interface:
+ * + sysbus MMIO region 0: MemoryRegion for the device's registers
+ * + sysbus IRQ 0: PMC (AXI and APB) parity error interrupt detected by the PMC
+ *   I/O peripherals.
+ * + sysbus IRQ 1: Device interrupt.
+ * + Named GPIO output "sd-emmc-sel[0]": Enables 0: SD mode or 1: eMMC mode on
+ *   SD/eMMC controller 0.
+ * + Named GPIO output "sd-emmc-sel[1]": Enables 0: SD mode or 1: eMMC mode on
+ *   SD/eMMC controller 1.
+ * + Named GPIO output "qspi-ospi-mux-sel": Selects 0: QSPI linear region or 1:
+ *   OSPI linear region.
+ * + Named GPIO output "ospi-mux-sel": Selects 0: OSPI Indirect access mode or
+ *   1: OSPI direct access mode.
+ */
+
+#ifndef XILINX_VERSAL_PMC_IOU_SLCR_H
+#define XILINX_VERSAL_PMC_IOU_SLCR_H
+
+#include "hw/register.h"
+
+#define TYPE_XILINX_VERSAL_PMC_IOU_SLCR "xlnx.versal-pmc-iou-slcr"
+
+OBJECT_DECLARE_SIMPLE_TYPE(XlnxVersalPmcIouSlcr, XILINX_VERSAL_PMC_IOU_SLCR)
+
+#define XILINX_VERSAL_PMC_IOU_SLCR_R_MAX (0x828 / 4 + 1)
+
+struct XlnxVersalPmcIouSlcr {
+    SysBusDevice parent_obj;
+    MemoryRegion iomem;
+    qemu_irq irq_parity_imr;
+    qemu_irq irq_imr;
+    qemu_irq sd_emmc_sel[2];
+    qemu_irq qspi_ospi_mux_sel;
+    qemu_irq ospi_mux_sel;
+
+    uint32_t regs[XILINX_VERSAL_PMC_IOU_SLCR_R_MAX];
+    RegisterInfo regs_info[XILINX_VERSAL_PMC_IOU_SLCR_R_MAX];
+};
+
+#endif /* XILINX_VERSAL_PMC_IOU_SLCR_H */
diff --git a/hw/misc/xlnx-versal-pmc-iou-slcr.c b/hw/misc/xlnx-versal-pmc-iou-slcr.c
new file mode 100644
index 0000000000..07b7ebc217
--- /dev/null
+++ b/hw/misc/xlnx-versal-pmc-iou-slcr.c
@@ -0,0 +1,1446 @@
+/*
+ * QEMU model of Versal's PMC IOU SLCR (system level control registers)
+ *
+ * Copyright (c) 2021 Xilinx Inc.
+ * Written by Edgar E. Iglesias <edgar.iglesias@xilinx.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "hw/register.h"
+#include "hw/irq.h"
+#include "qemu/bitops.h"
+#include "qemu/log.h"
+#include "migration/vmstate.h"
+#include "hw/qdev-properties.h"
+#include "hw/misc/xlnx-versal-pmc-iou-slcr.h"
+
+#ifndef XILINX_VERSAL_PMC_IOU_SLCR_ERR_DEBUG
+#define XILINX_VERSAL_PMC_IOU_SLCR_ERR_DEBUG 0
+#endif
+
+REG32(MIO_PIN_0, 0x0)
+    FIELD(MIO_PIN_0, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_0, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_0, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_0, L0_SEL, 1, 2)
+REG32(MIO_PIN_1, 0x4)
+    FIELD(MIO_PIN_1, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_1, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_1, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_1, L0_SEL, 1, 2)
+REG32(MIO_PIN_2, 0x8)
+    FIELD(MIO_PIN_2, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_2, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_2, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_2, L0_SEL, 1, 2)
+REG32(MIO_PIN_3, 0xc)
+    FIELD(MIO_PIN_3, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_3, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_3, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_3, L0_SEL, 1, 2)
+REG32(MIO_PIN_4, 0x10)
+    FIELD(MIO_PIN_4, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_4, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_4, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_4, L0_SEL, 1, 2)
+REG32(MIO_PIN_5, 0x14)
+    FIELD(MIO_PIN_5, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_5, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_5, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_5, L0_SEL, 1, 2)
+REG32(MIO_PIN_6, 0x18)
+    FIELD(MIO_PIN_6, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_6, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_6, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_6, L0_SEL, 1, 2)
+REG32(MIO_PIN_7, 0x1c)
+    FIELD(MIO_PIN_7, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_7, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_7, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_7, L0_SEL, 1, 2)
+REG32(MIO_PIN_8, 0x20)
+    FIELD(MIO_PIN_8, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_8, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_8, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_8, L0_SEL, 1, 2)
+REG32(MIO_PIN_9, 0x24)
+    FIELD(MIO_PIN_9, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_9, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_9, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_9, L0_SEL, 1, 2)
+REG32(MIO_PIN_10, 0x28)
+    FIELD(MIO_PIN_10, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_10, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_10, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_10, L0_SEL, 1, 2)
+REG32(MIO_PIN_11, 0x2c)
+    FIELD(MIO_PIN_11, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_11, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_11, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_11, L0_SEL, 1, 2)
+REG32(MIO_PIN_12, 0x30)
+    FIELD(MIO_PIN_12, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_12, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_12, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_12, L0_SEL, 1, 2)
+REG32(MIO_PIN_13, 0x34)
+    FIELD(MIO_PIN_13, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_13, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_13, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_13, L0_SEL, 1, 2)
+REG32(MIO_PIN_14, 0x38)
+    FIELD(MIO_PIN_14, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_14, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_14, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_14, L0_SEL, 1, 2)
+REG32(MIO_PIN_15, 0x3c)
+    FIELD(MIO_PIN_15, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_15, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_15, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_15, L0_SEL, 1, 2)
+REG32(MIO_PIN_16, 0x40)
+    FIELD(MIO_PIN_16, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_16, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_16, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_16, L0_SEL, 1, 2)
+REG32(MIO_PIN_17, 0x44)
+    FIELD(MIO_PIN_17, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_17, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_17, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_17, L0_SEL, 1, 2)
+REG32(MIO_PIN_18, 0x48)
+    FIELD(MIO_PIN_18, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_18, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_18, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_18, L0_SEL, 1, 2)
+REG32(MIO_PIN_19, 0x4c)
+    FIELD(MIO_PIN_19, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_19, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_19, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_19, L0_SEL, 1, 2)
+REG32(MIO_PIN_20, 0x50)
+    FIELD(MIO_PIN_20, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_20, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_20, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_20, L0_SEL, 1, 2)
+REG32(MIO_PIN_21, 0x54)
+    FIELD(MIO_PIN_21, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_21, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_21, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_21, L0_SEL, 1, 2)
+REG32(MIO_PIN_22, 0x58)
+    FIELD(MIO_PIN_22, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_22, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_22, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_22, L0_SEL, 1, 2)
+REG32(MIO_PIN_23, 0x5c)
+    FIELD(MIO_PIN_23, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_23, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_23, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_23, L0_SEL, 1, 2)
+REG32(MIO_PIN_24, 0x60)
+    FIELD(MIO_PIN_24, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_24, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_24, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_24, L0_SEL, 1, 2)
+REG32(MIO_PIN_25, 0x64)
+    FIELD(MIO_PIN_25, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_25, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_25, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_25, L0_SEL, 1, 2)
+REG32(MIO_PIN_26, 0x68)
+    FIELD(MIO_PIN_26, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_26, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_26, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_26, L0_SEL, 1, 2)
+REG32(MIO_PIN_27, 0x6c)
+    FIELD(MIO_PIN_27, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_27, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_27, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_27, L0_SEL, 1, 2)
+REG32(MIO_PIN_28, 0x70)
+    FIELD(MIO_PIN_28, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_28, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_28, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_28, L0_SEL, 1, 2)
+REG32(MIO_PIN_29, 0x74)
+    FIELD(MIO_PIN_29, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_29, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_29, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_29, L0_SEL, 1, 2)
+REG32(MIO_PIN_30, 0x78)
+    FIELD(MIO_PIN_30, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_30, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_30, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_30, L0_SEL, 1, 2)
+REG32(MIO_PIN_31, 0x7c)
+    FIELD(MIO_PIN_31, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_31, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_31, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_31, L0_SEL, 1, 2)
+REG32(MIO_PIN_32, 0x80)
+    FIELD(MIO_PIN_32, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_32, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_32, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_32, L0_SEL, 1, 2)
+REG32(MIO_PIN_33, 0x84)
+    FIELD(MIO_PIN_33, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_33, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_33, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_33, L0_SEL, 1, 2)
+REG32(MIO_PIN_34, 0x88)
+    FIELD(MIO_PIN_34, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_34, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_34, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_34, L0_SEL, 1, 2)
+REG32(MIO_PIN_35, 0x8c)
+    FIELD(MIO_PIN_35, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_35, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_35, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_35, L0_SEL, 1, 2)
+REG32(MIO_PIN_36, 0x90)
+    FIELD(MIO_PIN_36, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_36, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_36, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_36, L0_SEL, 1, 2)
+REG32(MIO_PIN_37, 0x94)
+    FIELD(MIO_PIN_37, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_37, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_37, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_37, L0_SEL, 1, 2)
+REG32(MIO_PIN_38, 0x98)
+    FIELD(MIO_PIN_38, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_38, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_38, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_38, L0_SEL, 1, 2)
+REG32(MIO_PIN_39, 0x9c)
+    FIELD(MIO_PIN_39, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_39, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_39, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_39, L0_SEL, 1, 2)
+REG32(MIO_PIN_40, 0xa0)
+    FIELD(MIO_PIN_40, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_40, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_40, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_40, L0_SEL, 1, 2)
+REG32(MIO_PIN_41, 0xa4)
+    FIELD(MIO_PIN_41, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_41, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_41, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_41, L0_SEL, 1, 2)
+REG32(MIO_PIN_42, 0xa8)
+    FIELD(MIO_PIN_42, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_42, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_42, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_42, L0_SEL, 1, 2)
+REG32(MIO_PIN_43, 0xac)
+    FIELD(MIO_PIN_43, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_43, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_43, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_43, L0_SEL, 1, 2)
+REG32(MIO_PIN_44, 0xb0)
+    FIELD(MIO_PIN_44, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_44, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_44, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_44, L0_SEL, 1, 2)
+REG32(MIO_PIN_45, 0xb4)
+    FIELD(MIO_PIN_45, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_45, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_45, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_45, L0_SEL, 1, 2)
+REG32(MIO_PIN_46, 0xb8)
+    FIELD(MIO_PIN_46, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_46, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_46, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_46, L0_SEL, 1, 2)
+REG32(MIO_PIN_47, 0xbc)
+    FIELD(MIO_PIN_47, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_47, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_47, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_47, L0_SEL, 1, 2)
+REG32(MIO_PIN_48, 0xc0)
+    FIELD(MIO_PIN_48, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_48, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_48, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_48, L0_SEL, 1, 2)
+REG32(MIO_PIN_49, 0xc4)
+    FIELD(MIO_PIN_49, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_49, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_49, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_49, L0_SEL, 1, 2)
+REG32(MIO_PIN_50, 0xc8)
+    FIELD(MIO_PIN_50, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_50, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_50, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_50, L0_SEL, 1, 2)
+REG32(MIO_PIN_51, 0xcc)
+    FIELD(MIO_PIN_51, L3_SEL, 7, 3)
+    FIELD(MIO_PIN_51, L2_SEL, 5, 2)
+    FIELD(MIO_PIN_51, L1_SEL, 3, 2)
+    FIELD(MIO_PIN_51, L0_SEL, 1, 2)
+REG32(BNK0_EN_RX, 0x100)
+    FIELD(BNK0_EN_RX, BNK0_EN_RX, 0, 26)
+REG32(BNK0_SEL_RX0, 0x104)
+REG32(BNK0_SEL_RX1, 0x108)
+    FIELD(BNK0_SEL_RX1, BNK0_SEL_RX, 0, 20)
+REG32(BNK0_EN_RX_SCHMITT_HYST, 0x10c)
+    FIELD(BNK0_EN_RX_SCHMITT_HYST, BNK0_EN_RX_SCHMITT_HYST, 0, 26)
+REG32(BNK0_EN_WK_PD, 0x110)
+    FIELD(BNK0_EN_WK_PD, BNK0_EN_WK_PD, 0, 26)
+REG32(BNK0_EN_WK_PU, 0x114)
+    FIELD(BNK0_EN_WK_PU, BNK0_EN_WK_PU, 0, 26)
+REG32(BNK0_SEL_DRV0, 0x118)
+REG32(BNK0_SEL_DRV1, 0x11c)
+    FIELD(BNK0_SEL_DRV1, BNK0_SEL_DRV, 0, 20)
+REG32(BNK0_SEL_SLEW, 0x120)
+    FIELD(BNK0_SEL_SLEW, BNK0_SEL_SLEW, 0, 26)
+REG32(BNK0_EN_DFT_OPT_INV, 0x124)
+    FIELD(BNK0_EN_DFT_OPT_INV, BNK0_EN_DFT_OPT_INV, 0, 26)
+REG32(BNK0_EN_PAD2PAD_LOOPBACK, 0x128)
+    FIELD(BNK0_EN_PAD2PAD_LOOPBACK, BNK0_EN_PAD2PAD_LOOPBACK, 0, 13)
+REG32(BNK0_RX_SPARE0, 0x12c)
+REG32(BNK0_RX_SPARE1, 0x130)
+    FIELD(BNK0_RX_SPARE1, BNK0_RX_SPARE, 0, 20)
+REG32(BNK0_TX_SPARE0, 0x134)
+REG32(BNK0_TX_SPARE1, 0x138)
+    FIELD(BNK0_TX_SPARE1, BNK0_TX_SPARE, 0, 20)
+REG32(BNK0_SEL_EN1P8, 0x13c)
+    FIELD(BNK0_SEL_EN1P8, BNK0_SEL_EN1P8, 0, 1)
+REG32(BNK0_EN_B_POR_DETECT, 0x140)
+    FIELD(BNK0_EN_B_POR_DETECT, BNK0_EN_B_POR_DETECT, 0, 1)
+REG32(BNK0_LPF_BYP_POR_DETECT, 0x144)
+    FIELD(BNK0_LPF_BYP_POR_DETECT, BNK0_LPF_BYP_POR_DETECT, 0, 1)
+REG32(BNK0_EN_LATCH, 0x148)
+    FIELD(BNK0_EN_LATCH, BNK0_EN_LATCH, 0, 1)
+REG32(BNK0_VBG_LPF_BYP_B, 0x14c)
+    FIELD(BNK0_VBG_LPF_BYP_B, BNK0_VBG_LPF_BYP_B, 0, 1)
+REG32(BNK0_EN_AMP_B, 0x150)
+    FIELD(BNK0_EN_AMP_B, BNK0_EN_AMP_B, 0, 2)
+REG32(BNK0_SPARE_BIAS, 0x154)
+    FIELD(BNK0_SPARE_BIAS, BNK0_SPARE_BIAS, 0, 4)
+REG32(BNK0_DRIVER_BIAS, 0x158)
+    FIELD(BNK0_DRIVER_BIAS, BNK0_DRIVER_BIAS, 0, 15)
+REG32(BNK0_VMODE, 0x15c)
+    FIELD(BNK0_VMODE, BNK0_VMODE, 0, 1)
+REG32(BNK0_SEL_AUX_IO_RX, 0x160)
+    FIELD(BNK0_SEL_AUX_IO_RX, BNK0_SEL_AUX_IO_RX, 0, 26)
+REG32(BNK0_EN_TX_HS_MODE, 0x164)
+    FIELD(BNK0_EN_TX_HS_MODE, BNK0_EN_TX_HS_MODE, 0, 26)
+REG32(MIO_MST_TRI0, 0x200)
+    FIELD(MIO_MST_TRI0, PIN_25_TRI, 25, 1)
+    FIELD(MIO_MST_TRI0, PIN_24_TRI, 24, 1)
+    FIELD(MIO_MST_TRI0, PIN_23_TRI, 23, 1)
+    FIELD(MIO_MST_TRI0, PIN_22_TRI, 22, 1)
+    FIELD(MIO_MST_TRI0, PIN_21_TRI, 21, 1)
+    FIELD(MIO_MST_TRI0, PIN_20_TRI, 20, 1)
+    FIELD(MIO_MST_TRI0, PIN_19_TRI, 19, 1)
+    FIELD(MIO_MST_TRI0, PIN_18_TRI, 18, 1)
+    FIELD(MIO_MST_TRI0, PIN_17_TRI, 17, 1)
+    FIELD(MIO_MST_TRI0, PIN_16_TRI, 16, 1)
+    FIELD(MIO_MST_TRI0, PIN_15_TRI, 15, 1)
+    FIELD(MIO_MST_TRI0, PIN_14_TRI, 14, 1)
+    FIELD(MIO_MST_TRI0, PIN_13_TRI, 13, 1)
+    FIELD(MIO_MST_TRI0, PIN_12_TRI, 12, 1)
+    FIELD(MIO_MST_TRI0, PIN_11_TRI, 11, 1)
+    FIELD(MIO_MST_TRI0, PIN_10_TRI, 10, 1)
+    FIELD(MIO_MST_TRI0, PIN_09_TRI, 9, 1)
+    FIELD(MIO_MST_TRI0, PIN_08_TRI, 8, 1)
+    FIELD(MIO_MST_TRI0, PIN_07_TRI, 7, 1)
+    FIELD(MIO_MST_TRI0, PIN_06_TRI, 6, 1)
+    FIELD(MIO_MST_TRI0, PIN_05_TRI, 5, 1)
+    FIELD(MIO_MST_TRI0, PIN_04_TRI, 4, 1)
+    FIELD(MIO_MST_TRI0, PIN_03_TRI, 3, 1)
+    FIELD(MIO_MST_TRI0, PIN_02_TRI, 2, 1)
+    FIELD(MIO_MST_TRI0, PIN_01_TRI, 1, 1)
+    FIELD(MIO_MST_TRI0, PIN_00_TRI, 0, 1)
+REG32(MIO_MST_TRI1, 0x204)
+    FIELD(MIO_MST_TRI1, PIN_51_TRI, 25, 1)
+    FIELD(MIO_MST_TRI1, PIN_50_TRI, 24, 1)
+    FIELD(MIO_MST_TRI1, PIN_49_TRI, 23, 1)
+    FIELD(MIO_MST_TRI1, PIN_48_TRI, 22, 1)
+    FIELD(MIO_MST_TRI1, PIN_47_TRI, 21, 1)
+    FIELD(MIO_MST_TRI1, PIN_46_TRI, 20, 1)
+    FIELD(MIO_MST_TRI1, PIN_45_TRI, 19, 1)
+    FIELD(MIO_MST_TRI1, PIN_44_TRI, 18, 1)
+    FIELD(MIO_MST_TRI1, PIN_43_TRI, 17, 1)
+    FIELD(MIO_MST_TRI1, PIN_42_TRI, 16, 1)
+    FIELD(MIO_MST_TRI1, PIN_41_TRI, 15, 1)
+    FIELD(MIO_MST_TRI1, PIN_40_TRI, 14, 1)
+    FIELD(MIO_MST_TRI1, PIN_39_TRI, 13, 1)
+    FIELD(MIO_MST_TRI1, PIN_38_TRI, 12, 1)
+    FIELD(MIO_MST_TRI1, PIN_37_TRI, 11, 1)
+    FIELD(MIO_MST_TRI1, PIN_36_TRI, 10, 1)
+    FIELD(MIO_MST_TRI1, PIN_35_TRI, 9, 1)
+    FIELD(MIO_MST_TRI1, PIN_34_TRI, 8, 1)
+    FIELD(MIO_MST_TRI1, PIN_33_TRI, 7, 1)
+    FIELD(MIO_MST_TRI1, PIN_32_TRI, 6, 1)
+    FIELD(MIO_MST_TRI1, PIN_31_TRI, 5, 1)
+    FIELD(MIO_MST_TRI1, PIN_30_TRI, 4, 1)
+    FIELD(MIO_MST_TRI1, PIN_29_TRI, 3, 1)
+    FIELD(MIO_MST_TRI1, PIN_28_TRI, 2, 1)
+    FIELD(MIO_MST_TRI1, PIN_27_TRI, 1, 1)
+    FIELD(MIO_MST_TRI1, PIN_26_TRI, 0, 1)
+REG32(BNK1_EN_RX, 0x300)
+    FIELD(BNK1_EN_RX, BNK1_EN_RX, 0, 26)
+REG32(BNK1_SEL_RX0, 0x304)
+REG32(BNK1_SEL_RX1, 0x308)
+    FIELD(BNK1_SEL_RX1, BNK1_SEL_RX, 0, 20)
+REG32(BNK1_EN_RX_SCHMITT_HYST, 0x30c)
+    FIELD(BNK1_EN_RX_SCHMITT_HYST, BNK1_EN_RX_SCHMITT_HYST, 0, 26)
+REG32(BNK1_EN_WK_PD, 0x310)
+    FIELD(BNK1_EN_WK_PD, BNK1_EN_WK_PD, 0, 26)
+REG32(BNK1_EN_WK_PU, 0x314)
+    FIELD(BNK1_EN_WK_PU, BNK1_EN_WK_PU, 0, 26)
+REG32(BNK1_SEL_DRV0, 0x318)
+REG32(BNK1_SEL_DRV1, 0x31c)
+    FIELD(BNK1_SEL_DRV1, BNK1_SEL_DRV, 0, 20)
+REG32(BNK1_SEL_SLEW, 0x320)
+    FIELD(BNK1_SEL_SLEW, BNK1_SEL_SLEW, 0, 26)
+REG32(BNK1_EN_DFT_OPT_INV, 0x324)
+    FIELD(BNK1_EN_DFT_OPT_INV, BNK1_EN_DFT_OPT_INV, 0, 26)
+REG32(BNK1_EN_PAD2PAD_LOOPBACK, 0x328)
+    FIELD(BNK1_EN_PAD2PAD_LOOPBACK, BNK1_EN_PAD2PAD_LOOPBACK, 0, 13)
+REG32(BNK1_RX_SPARE0, 0x32c)
+REG32(BNK1_RX_SPARE1, 0x330)
+    FIELD(BNK1_RX_SPARE1, BNK1_RX_SPARE, 0, 20)
+REG32(BNK1_TX_SPARE0, 0x334)
+REG32(BNK1_TX_SPARE1, 0x338)
+    FIELD(BNK1_TX_SPARE1, BNK1_TX_SPARE, 0, 20)
+REG32(BNK1_SEL_EN1P8, 0x33c)
+    FIELD(BNK1_SEL_EN1P8, BNK1_SEL_EN1P8, 0, 1)
+REG32(BNK1_EN_B_POR_DETECT, 0x340)
+    FIELD(BNK1_EN_B_POR_DETECT, BNK1_EN_B_POR_DETECT, 0, 1)
+REG32(BNK1_LPF_BYP_POR_DETECT, 0x344)
+    FIELD(BNK1_LPF_BYP_POR_DETECT, BNK1_LPF_BYP_POR_DETECT, 0, 1)
+REG32(BNK1_EN_LATCH, 0x348)
+    FIELD(BNK1_EN_LATCH, BNK1_EN_LATCH, 0, 1)
+REG32(BNK1_VBG_LPF_BYP_B, 0x34c)
+    FIELD(BNK1_VBG_LPF_BYP_B, BNK1_VBG_LPF_BYP_B, 0, 1)
+REG32(BNK1_EN_AMP_B, 0x350)
+    FIELD(BNK1_EN_AMP_B, BNK1_EN_AMP_B, 0, 2)
+REG32(BNK1_SPARE_BIAS, 0x354)
+    FIELD(BNK1_SPARE_BIAS, BNK1_SPARE_BIAS, 0, 4)
+REG32(BNK1_DRIVER_BIAS, 0x358)
+    FIELD(BNK1_DRIVER_BIAS, BNK1_DRIVER_BIAS, 0, 15)
+REG32(BNK1_VMODE, 0x35c)
+    FIELD(BNK1_VMODE, BNK1_VMODE, 0, 1)
+REG32(BNK1_SEL_AUX_IO_RX, 0x360)
+    FIELD(BNK1_SEL_AUX_IO_RX, BNK1_SEL_AUX_IO_RX, 0, 26)
+REG32(BNK1_EN_TX_HS_MODE, 0x364)
+    FIELD(BNK1_EN_TX_HS_MODE, BNK1_EN_TX_HS_MODE, 0, 26)
+REG32(SD0_CLK_CTRL, 0x400)
+    FIELD(SD0_CLK_CTRL, SDIO0_FBCLK_SEL, 2, 1)
+    FIELD(SD0_CLK_CTRL, SDIO0_RX_SRC_SEL, 0, 2)
+REG32(SD0_CTRL_REG, 0x404)
+    FIELD(SD0_CTRL_REG, SD0_EMMC_SEL, 0, 1)
+REG32(SD0_CONFIG_REG1, 0x410)
+    FIELD(SD0_CONFIG_REG1, SD0_BASECLK, 7, 8)
+    FIELD(SD0_CONFIG_REG1, SD0_TUNIGCOUNT, 1, 6)
+    FIELD(SD0_CONFIG_REG1, SD0_ASYNCWKPENA, 0, 1)
+REG32(SD0_CONFIG_REG2, 0x414)
+    FIELD(SD0_CONFIG_REG2, SD0_SLOTTYPE, 12, 2)
+    FIELD(SD0_CONFIG_REG2, SD0_ASYCINTR, 11, 1)
+    FIELD(SD0_CONFIG_REG2, SD0_64BIT, 10, 1)
+    FIELD(SD0_CONFIG_REG2, SD0_1P8V, 9, 1)
+    FIELD(SD0_CONFIG_REG2, SD0_3P0V, 8, 1)
+    FIELD(SD0_CONFIG_REG2, SD0_3P3V, 7, 1)
+    FIELD(SD0_CONFIG_REG2, SD0_SUSPRES, 6, 1)
+    FIELD(SD0_CONFIG_REG2, SD0_SDMA, 5, 1)
+    FIELD(SD0_CONFIG_REG2, SD0_HIGHSPEED, 4, 1)
+    FIELD(SD0_CONFIG_REG2, SD0_ADMA2, 3, 1)
+    FIELD(SD0_CONFIG_REG2, SD0_8BIT, 2, 1)
+    FIELD(SD0_CONFIG_REG2, SD0_MAXBLK, 0, 2)
+REG32(SD0_CONFIG_REG3, 0x418)
+    FIELD(SD0_CONFIG_REG3, SD0_TUNINGSDR50, 10, 1)
+    FIELD(SD0_CONFIG_REG3, SD0_RETUNETMR, 6, 4)
+    FIELD(SD0_CONFIG_REG3, SD0_DDRIVER, 5, 1)
+    FIELD(SD0_CONFIG_REG3, SD0_CDRIVER, 4, 1)
+    FIELD(SD0_CONFIG_REG3, SD0_ADRIVER, 3, 1)
+    FIELD(SD0_CONFIG_REG3, SD0_DDR50, 2, 1)
+    FIELD(SD0_CONFIG_REG3, SD0_SDR104, 1, 1)
+    FIELD(SD0_CONFIG_REG3, SD0_SDR50, 0, 1)
+REG32(SD0_INITPRESET, 0x41c)
+    FIELD(SD0_INITPRESET, SD0_INITPRESET, 0, 13)
+REG32(SD0_DSPPRESET, 0x420)
+    FIELD(SD0_DSPPRESET, SD0_DSPPRESET, 0, 13)
+REG32(SD0_HSPDPRESET, 0x424)
+    FIELD(SD0_HSPDPRESET, SD0_HSPDPRESET, 0, 13)
+REG32(SD0_SDR12PRESET, 0x428)
+    FIELD(SD0_SDR12PRESET, SD0_SDR12PRESET, 0, 13)
+REG32(SD0_SDR25PRESET, 0x42c)
+    FIELD(SD0_SDR25PRESET, SD0_SDR25PRESET, 0, 13)
+REG32(SD0_SDR50PRSET, 0x430)
+    FIELD(SD0_SDR50PRSET, SD0_SDR50PRESET, 0, 13)
+REG32(SD0_SDR104PRST, 0x434)
+    FIELD(SD0_SDR104PRST, SD0_SDR104PRESET, 0, 13)
+REG32(SD0_DDR50PRESET, 0x438)
+    FIELD(SD0_DDR50PRESET, SD0_DDR50PRESET, 0, 13)
+REG32(SD0_MAXCUR1P8, 0x43c)
+    FIELD(SD0_MAXCUR1P8, SD0_MAXCUR1P8, 0, 8)
+REG32(SD0_MAXCUR3P0, 0x440)
+    FIELD(SD0_MAXCUR3P0, SD0_MAXCUR3P0, 0, 8)
+REG32(SD0_MAXCUR3P3, 0x444)
+    FIELD(SD0_MAXCUR3P3, SD0_MAXCUR3P3, 0, 8)
+REG32(SD0_DLL_CTRL, 0x448)
+    FIELD(SD0_DLL_CTRL, SD0_CLKSTABLE_CFG, 9, 1)
+    FIELD(SD0_DLL_CTRL, SD0_DLL_CFG, 5, 4)
+    FIELD(SD0_DLL_CTRL, SD0_DLL_PSDONE, 4, 1)
+    FIELD(SD0_DLL_CTRL, SD0_DLL_OVF, 3, 1)
+    FIELD(SD0_DLL_CTRL, SD0_DLL_RST, 2, 1)
+    FIELD(SD0_DLL_CTRL, SD0_DLL_TESTMODE, 1, 1)
+    FIELD(SD0_DLL_CTRL, SD0_DLL_LOCK, 0, 1)
+REG32(SD0_CDN_CTRL, 0x44c)
+    FIELD(SD0_CDN_CTRL, SD0_CDN_CTRL, 0, 1)
+REG32(SD0_DLL_TEST, 0x450)
+    FIELD(SD0_DLL_TEST, DLL_DIV, 16, 8)
+    FIELD(SD0_DLL_TEST, DLL_TX_SEL, 9, 7)
+    FIELD(SD0_DLL_TEST, DLL_RX_SEL, 0, 9)
+REG32(SD0_RX_TUNING_SEL, 0x454)
+    FIELD(SD0_RX_TUNING_SEL, SD0_RX_SEL, 0, 9)
+REG32(SD0_DLL_DIV_MAP0, 0x458)
+    FIELD(SD0_DLL_DIV_MAP0, DIV_3, 24, 8)
+    FIELD(SD0_DLL_DIV_MAP0, DIV_2, 16, 8)
+    FIELD(SD0_DLL_DIV_MAP0, DIV_1, 8, 8)
+    FIELD(SD0_DLL_DIV_MAP0, DIV_0, 0, 8)
+REG32(SD0_DLL_DIV_MAP1, 0x45c)
+    FIELD(SD0_DLL_DIV_MAP1, DIV_7, 24, 8)
+    FIELD(SD0_DLL_DIV_MAP1, DIV_6, 16, 8)
+    FIELD(SD0_DLL_DIV_MAP1, DIV_5, 8, 8)
+    FIELD(SD0_DLL_DIV_MAP1, DIV_4, 0, 8)
+REG32(SD0_IOU_COHERENT_CTRL, 0x460)
+    FIELD(SD0_IOU_COHERENT_CTRL, SD0_AXI_COH, 0, 4)
+REG32(SD0_IOU_INTERCONNECT_ROUTE, 0x464)
+    FIELD(SD0_IOU_INTERCONNECT_ROUTE, SD0, 0, 1)
+REG32(SD0_IOU_RAM, 0x468)
+    FIELD(SD0_IOU_RAM, EMASA0, 6, 1)
+    FIELD(SD0_IOU_RAM, EMAB0, 3, 3)
+    FIELD(SD0_IOU_RAM, EMAA0, 0, 3)
+REG32(SD0_IOU_INTERCONNECT_QOS, 0x46c)
+    FIELD(SD0_IOU_INTERCONNECT_QOS, SD0_QOS, 0, 4)
+REG32(SD1_CLK_CTRL, 0x480)
+    FIELD(SD1_CLK_CTRL, SDIO1_FBCLK_SEL, 1, 1)
+    FIELD(SD1_CLK_CTRL, SDIO1_RX_SRC_SEL, 0, 1)
+REG32(SD1_CTRL_REG, 0x484)
+    FIELD(SD1_CTRL_REG, SD1_EMMC_SEL, 0, 1)
+REG32(SD1_CONFIG_REG1, 0x490)
+    FIELD(SD1_CONFIG_REG1, SD1_BASECLK, 7, 8)
+    FIELD(SD1_CONFIG_REG1, SD1_TUNIGCOUNT, 1, 6)
+    FIELD(SD1_CONFIG_REG1, SD1_ASYNCWKPENA, 0, 1)
+REG32(SD1_CONFIG_REG2, 0x494)
+    FIELD(SD1_CONFIG_REG2, SD1_SLOTTYPE, 12, 2)
+    FIELD(SD1_CONFIG_REG2, SD1_ASYCINTR, 11, 1)
+    FIELD(SD1_CONFIG_REG2, SD1_64BIT, 10, 1)
+    FIELD(SD1_CONFIG_REG2, SD1_1P8V, 9, 1)
+    FIELD(SD1_CONFIG_REG2, SD1_3P0V, 8, 1)
+    FIELD(SD1_CONFIG_REG2, SD1_3P3V, 7, 1)
+    FIELD(SD1_CONFIG_REG2, SD1_SUSPRES, 6, 1)
+    FIELD(SD1_CONFIG_REG2, SD1_SDMA, 5, 1)
+    FIELD(SD1_CONFIG_REG2, SD1_HIGHSPEED, 4, 1)
+    FIELD(SD1_CONFIG_REG2, SD1_ADMA2, 3, 1)
+    FIELD(SD1_CONFIG_REG2, SD1_8BIT, 2, 1)
+    FIELD(SD1_CONFIG_REG2, SD1_MAXBLK, 0, 2)
+REG32(SD1_CONFIG_REG3, 0x498)
+    FIELD(SD1_CONFIG_REG3, SD1_TUNINGSDR50, 10, 1)
+    FIELD(SD1_CONFIG_REG3, SD1_RETUNETMR, 6, 4)
+    FIELD(SD1_CONFIG_REG3, SD1_DDRIVER, 5, 1)
+    FIELD(SD1_CONFIG_REG3, SD1_CDRIVER, 4, 1)
+    FIELD(SD1_CONFIG_REG3, SD1_ADRIVER, 3, 1)
+    FIELD(SD1_CONFIG_REG3, SD1_DDR50, 2, 1)
+    FIELD(SD1_CONFIG_REG3, SD1_SDR104, 1, 1)
+    FIELD(SD1_CONFIG_REG3, SD1_SDR50, 0, 1)
+REG32(SD1_INITPRESET, 0x49c)
+    FIELD(SD1_INITPRESET, SD1_INITPRESET, 0, 13)
+REG32(SD1_DSPPRESET, 0x4a0)
+    FIELD(SD1_DSPPRESET, SD1_DSPPRESET, 0, 13)
+REG32(SD1_HSPDPRESET, 0x4a4)
+    FIELD(SD1_HSPDPRESET, SD1_HSPDPRESET, 0, 13)
+REG32(SD1_SDR12PRESET, 0x4a8)
+    FIELD(SD1_SDR12PRESET, SD1_SDR12PRESET, 0, 13)
+REG32(SD1_SDR25PRESET, 0x4ac)
+    FIELD(SD1_SDR25PRESET, SD1_SDR25PRESET, 0, 13)
+REG32(SD1_SDR50PRSET, 0x4b0)
+    FIELD(SD1_SDR50PRSET, SD1_SDR50PRESET, 0, 13)
+REG32(SD1_SDR104PRST, 0x4b4)
+    FIELD(SD1_SDR104PRST, SD1_SDR104PRESET, 0, 13)
+REG32(SD1_DDR50PRESET, 0x4b8)
+    FIELD(SD1_DDR50PRESET, SD1_DDR50PRESET, 0, 13)
+REG32(SD1_MAXCUR1P8, 0x4bc)
+    FIELD(SD1_MAXCUR1P8, SD1_MAXCUR1P8, 0, 8)
+REG32(SD1_MAXCUR3P0, 0x4c0)
+    FIELD(SD1_MAXCUR3P0, SD1_MAXCUR3P0, 0, 8)
+REG32(SD1_MAXCUR3P3, 0x4c4)
+    FIELD(SD1_MAXCUR3P3, SD1_MAXCUR3P3, 0, 8)
+REG32(SD1_DLL_CTRL, 0x4c8)
+    FIELD(SD1_DLL_CTRL, SD1_CLKSTABLE_CFG, 9, 1)
+    FIELD(SD1_DLL_CTRL, SD1_DLL_CFG, 5, 4)
+    FIELD(SD1_DLL_CTRL, SD1_DLL_PSDONE, 4, 1)
+    FIELD(SD1_DLL_CTRL, SD1_DLL_OVF, 3, 1)
+    FIELD(SD1_DLL_CTRL, SD1_DLL_RST, 2, 1)
+    FIELD(SD1_DLL_CTRL, SD1_DLL_TESTMODE, 1, 1)
+    FIELD(SD1_DLL_CTRL, SD1_DLL_LOCK, 0, 1)
+REG32(SD1_CDN_CTRL, 0x4cc)
+    FIELD(SD1_CDN_CTRL, SD1_CDN_CTRL, 0, 1)
+REG32(SD1_DLL_TEST, 0x4d0)
+    FIELD(SD1_DLL_TEST, DLL_DIV, 16, 8)
+    FIELD(SD1_DLL_TEST, DLL_TX_SEL, 9, 7)
+    FIELD(SD1_DLL_TEST, DLL_RX_SEL, 0, 9)
+REG32(SD1_RX_TUNING_SEL, 0x4d4)
+    FIELD(SD1_RX_TUNING_SEL, SD1_RX_SEL, 0, 9)
+REG32(SD1_DLL_DIV_MAP0, 0x4d8)
+    FIELD(SD1_DLL_DIV_MAP0, DIV_3, 24, 8)
+    FIELD(SD1_DLL_DIV_MAP0, DIV_2, 16, 8)
+    FIELD(SD1_DLL_DIV_MAP0, DIV_1, 8, 8)
+    FIELD(SD1_DLL_DIV_MAP0, DIV_0, 0, 8)
+REG32(SD1_DLL_DIV_MAP1, 0x4dc)
+    FIELD(SD1_DLL_DIV_MAP1, DIV_7, 24, 8)
+    FIELD(SD1_DLL_DIV_MAP1, DIV_6, 16, 8)
+    FIELD(SD1_DLL_DIV_MAP1, DIV_5, 8, 8)
+    FIELD(SD1_DLL_DIV_MAP1, DIV_4, 0, 8)
+REG32(SD1_IOU_COHERENT_CTRL, 0x4e0)
+    FIELD(SD1_IOU_COHERENT_CTRL, SD1_AXI_COH, 0, 4)
+REG32(SD1_IOU_INTERCONNECT_ROUTE, 0x4e4)
+    FIELD(SD1_IOU_INTERCONNECT_ROUTE, SD1, 0, 1)
+REG32(SD1_IOU_RAM, 0x4e8)
+    FIELD(SD1_IOU_RAM, EMASA0, 6, 1)
+    FIELD(SD1_IOU_RAM, EMAB0, 3, 3)
+    FIELD(SD1_IOU_RAM, EMAA0, 0, 3)
+REG32(SD1_IOU_INTERCONNECT_QOS, 0x4ec)
+    FIELD(SD1_IOU_INTERCONNECT_QOS, SD1_QOS, 0, 4)
+REG32(OSPI_QSPI_IOU_AXI_MUX_SEL, 0x504)
+    FIELD(OSPI_QSPI_IOU_AXI_MUX_SEL, OSPI_MUX_SEL, 1, 1)
+    FIELD(OSPI_QSPI_IOU_AXI_MUX_SEL, QSPI_OSPI_MUX_SEL, 0, 1)
+REG32(QSPI_IOU_COHERENT_CTRL, 0x508)
+    FIELD(QSPI_IOU_COHERENT_CTRL, QSPI_AXI_COH, 0, 4)
+REG32(QSPI_IOU_INTERCONNECT_ROUTE, 0x50c)
+    FIELD(QSPI_IOU_INTERCONNECT_ROUTE, QSPI, 0, 1)
+REG32(QSPI_IOU_RAM, 0x510)
+    FIELD(QSPI_IOU_RAM, EMASA1, 13, 1)
+    FIELD(QSPI_IOU_RAM, EMAB1, 10, 3)
+    FIELD(QSPI_IOU_RAM, EMAA1, 7, 3)
+    FIELD(QSPI_IOU_RAM, EMASA0, 6, 1)
+    FIELD(QSPI_IOU_RAM, EMAB0, 3, 3)
+    FIELD(QSPI_IOU_RAM, EMAA0, 0, 3)
+REG32(QSPI_IOU_INTERCONNECT_QOS, 0x514)
+    FIELD(QSPI_IOU_INTERCONNECT_QOS, QSPI_QOS, 0, 4)
+REG32(OSPI_IOU_COHERENT_CTRL, 0x530)
+    FIELD(OSPI_IOU_COHERENT_CTRL, OSPI_AXI_COH, 0, 4)
+REG32(OSPI_IOU_INTERCONNECT_ROUTE, 0x534)
+    FIELD(OSPI_IOU_INTERCONNECT_ROUTE, OSPI, 0, 1)
+REG32(OSPI_IOU_RAM, 0x538)
+    FIELD(OSPI_IOU_RAM, EMAS0, 5, 1)
+    FIELD(OSPI_IOU_RAM, EMAW0, 3, 2)
+    FIELD(OSPI_IOU_RAM, EMA0, 0, 3)
+REG32(OSPI_IOU_INTERCONNECT_QOS, 0x53c)
+    FIELD(OSPI_IOU_INTERCONNECT_QOS, OSPI_QOS, 0, 4)
+REG32(OSPI_REFCLK_DLY_CTRL, 0x540)
+    FIELD(OSPI_REFCLK_DLY_CTRL, DLY1, 3, 2)
+    FIELD(OSPI_REFCLK_DLY_CTRL, DLY0, 0, 3)
+REG32(CUR_PWR_ST, 0x600)
+    FIELD(CUR_PWR_ST, U2PMU, 0, 2)
+REG32(CONNECT_ST, 0x604)
+    FIELD(CONNECT_ST, U2PMU, 0, 1)
+REG32(PW_STATE_REQ, 0x608)
+    FIELD(PW_STATE_REQ, BIT_1_0, 0, 2)
+REG32(HOST_U2_PORT_DISABLE, 0x60c)
+    FIELD(HOST_U2_PORT_DISABLE, BIT_0, 0, 1)
+REG32(DBG_U2PMU, 0x610)
+REG32(DBG_U2PMU_EXT1, 0x614)
+REG32(DBG_U2PMU_EXT2, 0x618)
+    FIELD(DBG_U2PMU_EXT2, BIT_67_64, 0, 4)
+REG32(PME_GEN_U2PMU, 0x61c)
+    FIELD(PME_GEN_U2PMU, BIT_0, 0, 1)
+REG32(PWR_CONFIG_USB2, 0x620)
+    FIELD(PWR_CONFIG_USB2, STRAP, 0, 30)
+REG32(PHY_HUB, 0x624)
+    FIELD(PHY_HUB, VBUS_CTRL, 1, 1)
+    FIELD(PHY_HUB, OVER_CURRENT, 0, 1)
+REG32(CTRL, 0x700)
+    FIELD(CTRL, SLVERR_ENABLE, 0, 1)
+REG32(ISR, 0x800)
+    FIELD(ISR, ADDR_DECODE_ERR, 0, 1)
+REG32(IMR, 0x804)
+    FIELD(IMR, ADDR_DECODE_ERR, 0, 1)
+REG32(IER, 0x808)
+    FIELD(IER, ADDR_DECODE_ERR, 0, 1)
+REG32(IDR, 0x80c)
+    FIELD(IDR, ADDR_DECODE_ERR, 0, 1)
+REG32(ITR, 0x810)
+    FIELD(ITR, ADDR_DECODE_ERR, 0, 1)
+REG32(PARITY_ISR, 0x814)
+    FIELD(PARITY_ISR, PERR_AXI_SD1_IOU, 12, 1)
+    FIELD(PARITY_ISR, PERR_AXI_SD0_IOU, 11, 1)
+    FIELD(PARITY_ISR, PERR_AXI_QSPI_IOU, 10, 1)
+    FIELD(PARITY_ISR, PERR_AXI_OSPI_IOU, 9, 1)
+    FIELD(PARITY_ISR, PERR_IOU_SD1, 8, 1)
+    FIELD(PARITY_ISR, PERR_IOU_SD0, 7, 1)
+    FIELD(PARITY_ISR, PERR_IOU_QSPI1, 6, 1)
+    FIELD(PARITY_ISR, PERR_IOUSLCR_SECURE_APB, 5, 1)
+    FIELD(PARITY_ISR, PERR_IOUSLCR_APB, 4, 1)
+    FIELD(PARITY_ISR, PERR_QSPI0_APB, 3, 1)
+    FIELD(PARITY_ISR, PERR_OSPI_APB, 2, 1)
+    FIELD(PARITY_ISR, PERR_I2C_APB, 1, 1)
+    FIELD(PARITY_ISR, PERR_GPIO_APB, 0, 1)
+REG32(PARITY_IMR, 0x818)
+    FIELD(PARITY_IMR, PERR_AXI_SD1_IOU, 12, 1)
+    FIELD(PARITY_IMR, PERR_AXI_SD0_IOU, 11, 1)
+    FIELD(PARITY_IMR, PERR_AXI_QSPI_IOU, 10, 1)
+    FIELD(PARITY_IMR, PERR_AXI_OSPI_IOU, 9, 1)
+    FIELD(PARITY_IMR, PERR_IOU_SD1, 8, 1)
+    FIELD(PARITY_IMR, PERR_IOU_SD0, 7, 1)
+    FIELD(PARITY_IMR, PERR_IOU_QSPI1, 6, 1)
+    FIELD(PARITY_IMR, PERR_IOUSLCR_SECURE_APB, 5, 1)
+    FIELD(PARITY_IMR, PERR_IOUSLCR_APB, 4, 1)
+    FIELD(PARITY_IMR, PERR_QSPI0_APB, 3, 1)
+    FIELD(PARITY_IMR, PERR_OSPI_APB, 2, 1)
+    FIELD(PARITY_IMR, PERR_I2C_APB, 1, 1)
+    FIELD(PARITY_IMR, PERR_GPIO_APB, 0, 1)
+REG32(PARITY_IER, 0x81c)
+    FIELD(PARITY_IER, PERR_AXI_SD1_IOU, 12, 1)
+    FIELD(PARITY_IER, PERR_AXI_SD0_IOU, 11, 1)
+    FIELD(PARITY_IER, PERR_AXI_QSPI_IOU, 10, 1)
+    FIELD(PARITY_IER, PERR_AXI_OSPI_IOU, 9, 1)
+    FIELD(PARITY_IER, PERR_IOU_SD1, 8, 1)
+    FIELD(PARITY_IER, PERR_IOU_SD0, 7, 1)
+    FIELD(PARITY_IER, PERR_IOU_QSPI1, 6, 1)
+    FIELD(PARITY_IER, PERR_IOUSLCR_SECURE_APB, 5, 1)
+    FIELD(PARITY_IER, PERR_IOUSLCR_APB, 4, 1)
+    FIELD(PARITY_IER, PERR_QSPI0_APB, 3, 1)
+    FIELD(PARITY_IER, PERR_OSPI_APB, 2, 1)
+    FIELD(PARITY_IER, PERR_I2C_APB, 1, 1)
+    FIELD(PARITY_IER, PERR_GPIO_APB, 0, 1)
+REG32(PARITY_IDR, 0x820)
+    FIELD(PARITY_IDR, PERR_AXI_SD1_IOU, 12, 1)
+    FIELD(PARITY_IDR, PERR_AXI_SD0_IOU, 11, 1)
+    FIELD(PARITY_IDR, PERR_AXI_QSPI_IOU, 10, 1)
+    FIELD(PARITY_IDR, PERR_AXI_OSPI_IOU, 9, 1)
+    FIELD(PARITY_IDR, PERR_IOU_SD1, 8, 1)
+    FIELD(PARITY_IDR, PERR_IOU_SD0, 7, 1)
+    FIELD(PARITY_IDR, PERR_IOU_QSPI1, 6, 1)
+    FIELD(PARITY_IDR, PERR_IOUSLCR_SECURE_APB, 5, 1)
+    FIELD(PARITY_IDR, PERR_IOUSLCR_APB, 4, 1)
+    FIELD(PARITY_IDR, PERR_QSPI0_APB, 3, 1)
+    FIELD(PARITY_IDR, PERR_OSPI_APB, 2, 1)
+    FIELD(PARITY_IDR, PERR_I2C_APB, 1, 1)
+    FIELD(PARITY_IDR, PERR_GPIO_APB, 0, 1)
+REG32(PARITY_ITR, 0x824)
+    FIELD(PARITY_ITR, PERR_AXI_SD1_IOU, 12, 1)
+    FIELD(PARITY_ITR, PERR_AXI_SD0_IOU, 11, 1)
+    FIELD(PARITY_ITR, PERR_AXI_QSPI_IOU, 10, 1)
+    FIELD(PARITY_ITR, PERR_AXI_OSPI_IOU, 9, 1)
+    FIELD(PARITY_ITR, PERR_IOU_SD1, 8, 1)
+    FIELD(PARITY_ITR, PERR_IOU_SD0, 7, 1)
+    FIELD(PARITY_ITR, PERR_IOU_QSPI1, 6, 1)
+    FIELD(PARITY_ITR, PERR_IOUSLCR_SECURE_APB, 5, 1)
+    FIELD(PARITY_ITR, PERR_IOUSLCR_APB, 4, 1)
+    FIELD(PARITY_ITR, PERR_QSPI0_APB, 3, 1)
+    FIELD(PARITY_ITR, PERR_OSPI_APB, 2, 1)
+    FIELD(PARITY_ITR, PERR_I2C_APB, 1, 1)
+    FIELD(PARITY_ITR, PERR_GPIO_APB, 0, 1)
+REG32(WPROT0, 0x828)
+    FIELD(WPROT0, ACTIVE, 0, 1)
+
+static void parity_imr_update_irq(XlnxVersalPmcIouSlcr *s)
+{
+    bool pending = s->regs[R_PARITY_ISR] & ~s->regs[R_PARITY_IMR];
+    qemu_set_irq(s->irq_parity_imr, pending);
+}
+
+static void parity_isr_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxVersalPmcIouSlcr *s = XILINX_VERSAL_PMC_IOU_SLCR(reg->opaque);
+    parity_imr_update_irq(s);
+}
+
+static uint64_t parity_ier_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxVersalPmcIouSlcr *s = XILINX_VERSAL_PMC_IOU_SLCR(reg->opaque);
+    uint32_t val = val64;
+
+    s->regs[R_PARITY_IMR] &= ~val;
+    parity_imr_update_irq(s);
+    return 0;
+}
+
+static uint64_t parity_idr_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxVersalPmcIouSlcr *s = XILINX_VERSAL_PMC_IOU_SLCR(reg->opaque);
+    uint32_t val = val64;
+
+    s->regs[R_PARITY_IMR] |= val;
+    parity_imr_update_irq(s);
+    return 0;
+}
+
+static uint64_t parity_itr_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxVersalPmcIouSlcr *s = XILINX_VERSAL_PMC_IOU_SLCR(reg->opaque);
+    uint32_t val = val64;
+
+    s->regs[R_PARITY_ISR] |= val;
+    parity_imr_update_irq(s);
+    return 0;
+}
+
+static void imr_update_irq(XlnxVersalPmcIouSlcr *s)
+{
+    bool pending = s->regs[R_ISR] & ~s->regs[R_IMR];
+    qemu_set_irq(s->irq_imr, pending);
+}
+
+static void isr_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxVersalPmcIouSlcr *s = XILINX_VERSAL_PMC_IOU_SLCR(reg->opaque);
+    imr_update_irq(s);
+}
+
+static uint64_t ier_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxVersalPmcIouSlcr *s = XILINX_VERSAL_PMC_IOU_SLCR(reg->opaque);
+    uint32_t val = val64;
+
+    s->regs[R_IMR] &= ~val;
+    imr_update_irq(s);
+    return 0;
+}
+
+static uint64_t idr_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxVersalPmcIouSlcr *s = XILINX_VERSAL_PMC_IOU_SLCR(reg->opaque);
+    uint32_t val = val64;
+
+    s->regs[R_IMR] |= val;
+    imr_update_irq(s);
+    return 0;
+}
+
+static uint64_t itr_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxVersalPmcIouSlcr *s = XILINX_VERSAL_PMC_IOU_SLCR(reg->opaque);
+    uint32_t val = val64;
+
+    s->regs[R_ISR] |= val;
+    imr_update_irq(s);
+    return 0;
+}
+
+static uint64_t sd0_ctrl_reg_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxVersalPmcIouSlcr *s = XILINX_VERSAL_PMC_IOU_SLCR(reg->opaque);
+    uint32_t prev = ARRAY_FIELD_EX32(s->regs, SD0_CTRL_REG, SD0_EMMC_SEL);
+
+    if (prev != (val64 & R_SD0_CTRL_REG_SD0_EMMC_SEL_MASK)) {
+        qemu_set_irq(s->sd_emmc_sel[0], !!val64);
+    }
+
+    return val64;
+}
+
+static uint64_t sd1_ctrl_reg_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxVersalPmcIouSlcr *s = XILINX_VERSAL_PMC_IOU_SLCR(reg->opaque);
+    uint32_t prev = ARRAY_FIELD_EX32(s->regs, SD1_CTRL_REG, SD1_EMMC_SEL);
+
+    if (prev != (val64 & R_SD1_CTRL_REG_SD1_EMMC_SEL_MASK)) {
+        qemu_set_irq(s->sd_emmc_sel[1], !!val64);
+    }
+
+    return val64;
+}
+
+static uint64_t ospi_qspi_iou_axi_mux_sel_prew(RegisterInfo *reg,
+                                               uint64_t val64)
+{
+    XlnxVersalPmcIouSlcr *s = XILINX_VERSAL_PMC_IOU_SLCR(reg->opaque);
+    uint32_t val32 = (uint32_t) val64;
+    uint8_t ospi_mux_sel = FIELD_EX32(val32, OSPI_QSPI_IOU_AXI_MUX_SEL,
+                                      OSPI_MUX_SEL);
+    uint8_t qspi_ospi_mux_sel = FIELD_EX32(val32, OSPI_QSPI_IOU_AXI_MUX_SEL,
+                                      QSPI_OSPI_MUX_SEL);
+
+    if (ospi_mux_sel !=
+        ARRAY_FIELD_EX32(s->regs, OSPI_QSPI_IOU_AXI_MUX_SEL, OSPI_MUX_SEL)) {
+        qemu_set_irq(s->ospi_mux_sel, !!ospi_mux_sel);
+    }
+
+    if (qspi_ospi_mux_sel !=
+        ARRAY_FIELD_EX32(s->regs, OSPI_QSPI_IOU_AXI_MUX_SEL,
+                         QSPI_OSPI_MUX_SEL)) {
+        qemu_set_irq(s->qspi_ospi_mux_sel, !!qspi_ospi_mux_sel);
+    }
+
+    return val64;
+}
+
+static RegisterAccessInfo pmc_iou_slcr_regs_info[] = {
+    {   .name = "MIO_PIN_0",  .addr = A_MIO_PIN_0,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_1",  .addr = A_MIO_PIN_1,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_2",  .addr = A_MIO_PIN_2,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_3",  .addr = A_MIO_PIN_3,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_4",  .addr = A_MIO_PIN_4,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_5",  .addr = A_MIO_PIN_5,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_6",  .addr = A_MIO_PIN_6,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_7",  .addr = A_MIO_PIN_7,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_8",  .addr = A_MIO_PIN_8,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_9",  .addr = A_MIO_PIN_9,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_10",  .addr = A_MIO_PIN_10,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_11",  .addr = A_MIO_PIN_11,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_12",  .addr = A_MIO_PIN_12,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_13",  .addr = A_MIO_PIN_13,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_14",  .addr = A_MIO_PIN_14,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_15",  .addr = A_MIO_PIN_15,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_16",  .addr = A_MIO_PIN_16,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_17",  .addr = A_MIO_PIN_17,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_18",  .addr = A_MIO_PIN_18,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_19",  .addr = A_MIO_PIN_19,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_20",  .addr = A_MIO_PIN_20,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_21",  .addr = A_MIO_PIN_21,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_22",  .addr = A_MIO_PIN_22,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_23",  .addr = A_MIO_PIN_23,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_24",  .addr = A_MIO_PIN_24,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_25",  .addr = A_MIO_PIN_25,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_26",  .addr = A_MIO_PIN_26,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_27",  .addr = A_MIO_PIN_27,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_28",  .addr = A_MIO_PIN_28,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_29",  .addr = A_MIO_PIN_29,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_30",  .addr = A_MIO_PIN_30,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_31",  .addr = A_MIO_PIN_31,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_32",  .addr = A_MIO_PIN_32,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_33",  .addr = A_MIO_PIN_33,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_34",  .addr = A_MIO_PIN_34,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_35",  .addr = A_MIO_PIN_35,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_36",  .addr = A_MIO_PIN_36,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_37",  .addr = A_MIO_PIN_37,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_38",  .addr = A_MIO_PIN_38,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_39",  .addr = A_MIO_PIN_39,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_40",  .addr = A_MIO_PIN_40,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_41",  .addr = A_MIO_PIN_41,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_42",  .addr = A_MIO_PIN_42,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_43",  .addr = A_MIO_PIN_43,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_44",  .addr = A_MIO_PIN_44,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_45",  .addr = A_MIO_PIN_45,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_46",  .addr = A_MIO_PIN_46,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_47",  .addr = A_MIO_PIN_47,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_48",  .addr = A_MIO_PIN_48,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_49",  .addr = A_MIO_PIN_49,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_50",  .addr = A_MIO_PIN_50,
+        .rsvd = 0xfffffc01,
+    },{ .name = "MIO_PIN_51",  .addr = A_MIO_PIN_51,
+        .rsvd = 0xfffffc01,
+    },{ .name = "BNK0_EN_RX",  .addr = A_BNK0_EN_RX,
+        .reset = 0x3ffffff,
+        .rsvd = 0xfc000000,
+    },{ .name = "BNK0_SEL_RX0",  .addr = A_BNK0_SEL_RX0,
+        .reset = 0xffffffff,
+    },{ .name = "BNK0_SEL_RX1",  .addr = A_BNK0_SEL_RX1,
+        .reset = 0xfffff,
+        .rsvd = 0xfff00000,
+    },{ .name = "BNK0_EN_RX_SCHMITT_HYST",  .addr = A_BNK0_EN_RX_SCHMITT_HYST,
+        .rsvd = 0xfc000000,
+    },{ .name = "BNK0_EN_WK_PD",  .addr = A_BNK0_EN_WK_PD,
+        .rsvd = 0xfc000000,
+    },{ .name = "BNK0_EN_WK_PU",  .addr = A_BNK0_EN_WK_PU,
+        .reset = 0x3ffffff,
+        .rsvd = 0xfc000000,
+    },{ .name = "BNK0_SEL_DRV0",  .addr = A_BNK0_SEL_DRV0,
+        .reset = 0xffffffff,
+    },{ .name = "BNK0_SEL_DRV1",  .addr = A_BNK0_SEL_DRV1,
+        .reset = 0xfffff,
+        .rsvd = 0xfff00000,
+    },{ .name = "BNK0_SEL_SLEW",  .addr = A_BNK0_SEL_SLEW,
+        .rsvd = 0xfc000000,
+    },{ .name = "BNK0_EN_DFT_OPT_INV",  .addr = A_BNK0_EN_DFT_OPT_INV,
+        .rsvd = 0xfc000000,
+    },{ .name = "BNK0_EN_PAD2PAD_LOOPBACK",
+        .addr = A_BNK0_EN_PAD2PAD_LOOPBACK,
+        .rsvd = 0xffffe000,
+    },{ .name = "BNK0_RX_SPARE0",  .addr = A_BNK0_RX_SPARE0,
+    },{ .name = "BNK0_RX_SPARE1",  .addr = A_BNK0_RX_SPARE1,
+        .rsvd = 0xfff00000,
+    },{ .name = "BNK0_TX_SPARE0",  .addr = A_BNK0_TX_SPARE0,
+    },{ .name = "BNK0_TX_SPARE1",  .addr = A_BNK0_TX_SPARE1,
+        .rsvd = 0xfff00000,
+    },{ .name = "BNK0_SEL_EN1P8",  .addr = A_BNK0_SEL_EN1P8,
+        .rsvd = 0xfffffffe,
+    },{ .name = "BNK0_EN_B_POR_DETECT",  .addr = A_BNK0_EN_B_POR_DETECT,
+        .rsvd = 0xfffffffe,
+    },{ .name = "BNK0_LPF_BYP_POR_DETECT",  .addr = A_BNK0_LPF_BYP_POR_DETECT,
+        .reset = 0x1,
+        .rsvd = 0xfffffffe,
+    },{ .name = "BNK0_EN_LATCH",  .addr = A_BNK0_EN_LATCH,
+        .rsvd = 0xfffffffe,
+    },{ .name = "BNK0_VBG_LPF_BYP_B",  .addr = A_BNK0_VBG_LPF_BYP_B,
+        .reset = 0x1,
+        .rsvd = 0xfffffffe,
+    },{ .name = "BNK0_EN_AMP_B",  .addr = A_BNK0_EN_AMP_B,
+        .rsvd = 0xfffffffc,
+    },{ .name = "BNK0_SPARE_BIAS",  .addr = A_BNK0_SPARE_BIAS,
+        .rsvd = 0xfffffff0,
+    },{ .name = "BNK0_DRIVER_BIAS",  .addr = A_BNK0_DRIVER_BIAS,
+        .rsvd = 0xffff8000,
+    },{ .name = "BNK0_VMODE",  .addr = A_BNK0_VMODE,
+        .rsvd = 0xfffffffe,
+        .ro = 0x1,
+    },{ .name = "BNK0_SEL_AUX_IO_RX",  .addr = A_BNK0_SEL_AUX_IO_RX,
+        .rsvd = 0xfc000000,
+    },{ .name = "BNK0_EN_TX_HS_MODE",  .addr = A_BNK0_EN_TX_HS_MODE,
+        .rsvd = 0xfc000000,
+    },{ .name = "MIO_MST_TRI0",  .addr = A_MIO_MST_TRI0,
+        .reset = 0x3ffffff,
+        .rsvd = 0xfc000000,
+    },{ .name = "MIO_MST_TRI1",  .addr = A_MIO_MST_TRI1,
+        .reset = 0x3ffffff,
+        .rsvd = 0xfc000000,
+    },{ .name = "BNK1_EN_RX",  .addr = A_BNK1_EN_RX,
+        .reset = 0x3ffffff,
+        .rsvd = 0xfc000000,
+    },{ .name = "BNK1_SEL_RX0",  .addr = A_BNK1_SEL_RX0,
+        .reset = 0xffffffff,
+    },{ .name = "BNK1_SEL_RX1",  .addr = A_BNK1_SEL_RX1,
+        .reset = 0xfffff,
+        .rsvd = 0xfff00000,
+    },{ .name = "BNK1_EN_RX_SCHMITT_HYST",  .addr = A_BNK1_EN_RX_SCHMITT_HYST,
+        .rsvd = 0xfc000000,
+    },{ .name = "BNK1_EN_WK_PD",  .addr = A_BNK1_EN_WK_PD,
+        .rsvd = 0xfc000000,
+    },{ .name = "BNK1_EN_WK_PU",  .addr = A_BNK1_EN_WK_PU,
+        .reset = 0x3ffffff,
+        .rsvd = 0xfc000000,
+    },{ .name = "BNK1_SEL_DRV0",  .addr = A_BNK1_SEL_DRV0,
+        .reset = 0xffffffff,
+    },{ .name = "BNK1_SEL_DRV1",  .addr = A_BNK1_SEL_DRV1,
+        .reset = 0xfffff,
+        .rsvd = 0xfff00000,
+    },{ .name = "BNK1_SEL_SLEW",  .addr = A_BNK1_SEL_SLEW,
+        .rsvd = 0xfc000000,
+    },{ .name = "BNK1_EN_DFT_OPT_INV",  .addr = A_BNK1_EN_DFT_OPT_INV,
+        .rsvd = 0xfc000000,
+    },{ .name = "BNK1_EN_PAD2PAD_LOOPBACK",
+        .addr = A_BNK1_EN_PAD2PAD_LOOPBACK,
+        .rsvd = 0xffffe000,
+    },{ .name = "BNK1_RX_SPARE0",  .addr = A_BNK1_RX_SPARE0,
+    },{ .name = "BNK1_RX_SPARE1",  .addr = A_BNK1_RX_SPARE1,
+        .rsvd = 0xfff00000,
+    },{ .name = "BNK1_TX_SPARE0",  .addr = A_BNK1_TX_SPARE0,
+    },{ .name = "BNK1_TX_SPARE1",  .addr = A_BNK1_TX_SPARE1,
+        .rsvd = 0xfff00000,
+    },{ .name = "BNK1_SEL_EN1P8",  .addr = A_BNK1_SEL_EN1P8,
+        .rsvd = 0xfffffffe,
+    },{ .name = "BNK1_EN_B_POR_DETECT",  .addr = A_BNK1_EN_B_POR_DETECT,
+        .rsvd = 0xfffffffe,
+    },{ .name = "BNK1_LPF_BYP_POR_DETECT",  .addr = A_BNK1_LPF_BYP_POR_DETECT,
+        .reset = 0x1,
+        .rsvd = 0xfffffffe,
+    },{ .name = "BNK1_EN_LATCH",  .addr = A_BNK1_EN_LATCH,
+        .rsvd = 0xfffffffe,
+    },{ .name = "BNK1_VBG_LPF_BYP_B",  .addr = A_BNK1_VBG_LPF_BYP_B,
+        .reset = 0x1,
+        .rsvd = 0xfffffffe,
+    },{ .name = "BNK1_EN_AMP_B",  .addr = A_BNK1_EN_AMP_B,
+        .rsvd = 0xfffffffc,
+    },{ .name = "BNK1_SPARE_BIAS",  .addr = A_BNK1_SPARE_BIAS,
+        .rsvd = 0xfffffff0,
+    },{ .name = "BNK1_DRIVER_BIAS",  .addr = A_BNK1_DRIVER_BIAS,
+        .rsvd = 0xffff8000,
+    },{ .name = "BNK1_VMODE",  .addr = A_BNK1_VMODE,
+        .rsvd = 0xfffffffe,
+        .ro = 0x1,
+    },{ .name = "BNK1_SEL_AUX_IO_RX",  .addr = A_BNK1_SEL_AUX_IO_RX,
+        .rsvd = 0xfc000000,
+    },{ .name = "BNK1_EN_TX_HS_MODE",  .addr = A_BNK1_EN_TX_HS_MODE,
+        .rsvd = 0xfc000000,
+    },{ .name = "SD0_CLK_CTRL",  .addr = A_SD0_CLK_CTRL,
+        .rsvd = 0xfffffff8,
+    },{ .name = "SD0_CTRL_REG",  .addr = A_SD0_CTRL_REG,
+        .rsvd = 0xfffffffe,
+        .pre_write = sd0_ctrl_reg_prew,
+    },{ .name = "SD0_CONFIG_REG1",  .addr = A_SD0_CONFIG_REG1,
+        .reset = 0x3250,
+        .rsvd = 0xffff8000,
+    },{ .name = "SD0_CONFIG_REG2",  .addr = A_SD0_CONFIG_REG2,
+        .reset = 0xffc,
+        .rsvd = 0xffffc000,
+    },{ .name = "SD0_CONFIG_REG3",  .addr = A_SD0_CONFIG_REG3,
+        .reset = 0x407,
+        .rsvd = 0xfffff800,
+    },{ .name = "SD0_INITPRESET",  .addr = A_SD0_INITPRESET,
+        .reset = 0x100,
+        .rsvd = 0xffffe000,
+    },{ .name = "SD0_DSPPRESET",  .addr = A_SD0_DSPPRESET,
+        .reset = 0x4,
+        .rsvd = 0xffffe000,
+    },{ .name = "SD0_HSPDPRESET",  .addr = A_SD0_HSPDPRESET,
+        .reset = 0x2,
+        .rsvd = 0xffffe000,
+    },{ .name = "SD0_SDR12PRESET",  .addr = A_SD0_SDR12PRESET,
+        .reset = 0x4,
+        .rsvd = 0xffffe000,
+    },{ .name = "SD0_SDR25PRESET",  .addr = A_SD0_SDR25PRESET,
+        .reset = 0x2,
+        .rsvd = 0xffffe000,
+    },{ .name = "SD0_SDR50PRSET",  .addr = A_SD0_SDR50PRSET,
+        .reset = 0x1,
+        .rsvd = 0xffffe000,
+    },{ .name = "SD0_SDR104PRST",  .addr = A_SD0_SDR104PRST,
+        .rsvd = 0xffffe000,
+    },{ .name = "SD0_DDR50PRESET",  .addr = A_SD0_DDR50PRESET,
+        .reset = 0x2,
+        .rsvd = 0xffffe000,
+    },{ .name = "SD0_MAXCUR1P8",  .addr = A_SD0_MAXCUR1P8,
+        .rsvd = 0xffffff00,
+    },{ .name = "SD0_MAXCUR3P0",  .addr = A_SD0_MAXCUR3P0,
+        .rsvd = 0xffffff00,
+    },{ .name = "SD0_MAXCUR3P3",  .addr = A_SD0_MAXCUR3P3,
+        .rsvd = 0xffffff00,
+    },{ .name = "SD0_DLL_CTRL",  .addr = A_SD0_DLL_CTRL,
+        .reset = 0x1,
+        .rsvd = 0xfffffc00,
+        .ro = 0x19,
+    },{ .name = "SD0_CDN_CTRL",  .addr = A_SD0_CDN_CTRL,
+        .rsvd = 0xfffffffe,
+    },{ .name = "SD0_DLL_TEST",  .addr = A_SD0_DLL_TEST,
+        .rsvd = 0xff000000,
+    },{ .name = "SD0_RX_TUNING_SEL",  .addr = A_SD0_RX_TUNING_SEL,
+        .rsvd = 0xfffffe00,
+        .ro = 0x1ff,
+    },{ .name = "SD0_DLL_DIV_MAP0",  .addr = A_SD0_DLL_DIV_MAP0,
+        .reset = 0x50505050,
+    },{ .name = "SD0_DLL_DIV_MAP1",  .addr = A_SD0_DLL_DIV_MAP1,
+        .reset = 0x50505050,
+    },{ .name = "SD0_IOU_COHERENT_CTRL",  .addr = A_SD0_IOU_COHERENT_CTRL,
+        .rsvd = 0xfffffff0,
+    },{ .name = "SD0_IOU_INTERCONNECT_ROUTE",
+        .addr = A_SD0_IOU_INTERCONNECT_ROUTE,
+        .rsvd = 0xfffffffe,
+    },{ .name = "SD0_IOU_RAM",  .addr = A_SD0_IOU_RAM,
+        .reset = 0x24,
+        .rsvd = 0xffffff80,
+    },{ .name = "SD0_IOU_INTERCONNECT_QOS",
+        .addr = A_SD0_IOU_INTERCONNECT_QOS,
+        .rsvd = 0xfffffff0,
+    },{ .name = "SD1_CLK_CTRL",  .addr = A_SD1_CLK_CTRL,
+        .rsvd = 0xfffffffc,
+    },{ .name = "SD1_CTRL_REG",  .addr = A_SD1_CTRL_REG,
+        .rsvd = 0xfffffffe,
+        .pre_write = sd1_ctrl_reg_prew,
+    },{ .name = "SD1_CONFIG_REG1",  .addr = A_SD1_CONFIG_REG1,
+        .reset = 0x3250,
+        .rsvd = 0xffff8000,
+    },{ .name = "SD1_CONFIG_REG2",  .addr = A_SD1_CONFIG_REG2,
+        .reset = 0xffc,
+        .rsvd = 0xffffc000,
+    },{ .name = "SD1_CONFIG_REG3",  .addr = A_SD1_CONFIG_REG3,
+        .reset = 0x407,
+        .rsvd = 0xfffff800,
+    },{ .name = "SD1_INITPRESET",  .addr = A_SD1_INITPRESET,
+        .reset = 0x100,
+        .rsvd = 0xffffe000,
+    },{ .name = "SD1_DSPPRESET",  .addr = A_SD1_DSPPRESET,
+        .reset = 0x4,
+        .rsvd = 0xffffe000,
+    },{ .name = "SD1_HSPDPRESET",  .addr = A_SD1_HSPDPRESET,
+        .reset = 0x2,
+        .rsvd = 0xffffe000,
+    },{ .name = "SD1_SDR12PRESET",  .addr = A_SD1_SDR12PRESET,
+        .reset = 0x4,
+        .rsvd = 0xffffe000,
+    },{ .name = "SD1_SDR25PRESET",  .addr = A_SD1_SDR25PRESET,
+        .reset = 0x2,
+        .rsvd = 0xffffe000,
+    },{ .name = "SD1_SDR50PRSET",  .addr = A_SD1_SDR50PRSET,
+        .reset = 0x1,
+        .rsvd = 0xffffe000,
+    },{ .name = "SD1_SDR104PRST",  .addr = A_SD1_SDR104PRST,
+        .rsvd = 0xffffe000,
+    },{ .name = "SD1_DDR50PRESET",  .addr = A_SD1_DDR50PRESET,
+        .reset = 0x2,
+        .rsvd = 0xffffe000,
+    },{ .name = "SD1_MAXCUR1P8",  .addr = A_SD1_MAXCUR1P8,
+        .rsvd = 0xffffff00,
+    },{ .name = "SD1_MAXCUR3P0",  .addr = A_SD1_MAXCUR3P0,
+        .rsvd = 0xffffff00,
+    },{ .name = "SD1_MAXCUR3P3",  .addr = A_SD1_MAXCUR3P3,
+        .rsvd = 0xffffff00,
+    },{ .name = "SD1_DLL_CTRL",  .addr = A_SD1_DLL_CTRL,
+        .reset = 0x1,
+        .rsvd = 0xfffffc00,
+        .ro = 0x19,
+    },{ .name = "SD1_CDN_CTRL",  .addr = A_SD1_CDN_CTRL,
+        .rsvd = 0xfffffffe,
+    },{ .name = "SD1_DLL_TEST",  .addr = A_SD1_DLL_TEST,
+        .rsvd = 0xff000000,
+    },{ .name = "SD1_RX_TUNING_SEL",  .addr = A_SD1_RX_TUNING_SEL,
+        .rsvd = 0xfffffe00,
+        .ro = 0x1ff,
+    },{ .name = "SD1_DLL_DIV_MAP0",  .addr = A_SD1_DLL_DIV_MAP0,
+        .reset = 0x50505050,
+    },{ .name = "SD1_DLL_DIV_MAP1",  .addr = A_SD1_DLL_DIV_MAP1,
+        .reset = 0x50505050,
+    },{ .name = "SD1_IOU_COHERENT_CTRL",  .addr = A_SD1_IOU_COHERENT_CTRL,
+        .rsvd = 0xfffffff0,
+    },{ .name = "SD1_IOU_INTERCONNECT_ROUTE",
+        .addr = A_SD1_IOU_INTERCONNECT_ROUTE,
+        .rsvd = 0xfffffffe,
+    },{ .name = "SD1_IOU_RAM",  .addr = A_SD1_IOU_RAM,
+        .reset = 0x24,
+        .rsvd = 0xffffff80,
+    },{ .name = "SD1_IOU_INTERCONNECT_QOS",
+        .addr = A_SD1_IOU_INTERCONNECT_QOS,
+        .rsvd = 0xfffffff0,
+    },{ .name = "OSPI_QSPI_IOU_AXI_MUX_SEL",
+        .addr = A_OSPI_QSPI_IOU_AXI_MUX_SEL,
+        .reset = 0x1,
+        .rsvd = 0xfffffffc,
+        .pre_write = ospi_qspi_iou_axi_mux_sel_prew,
+    },{ .name = "QSPI_IOU_COHERENT_CTRL",  .addr = A_QSPI_IOU_COHERENT_CTRL,
+        .rsvd = 0xfffffff0,
+    },{ .name = "QSPI_IOU_INTERCONNECT_ROUTE",
+        .addr = A_QSPI_IOU_INTERCONNECT_ROUTE,
+        .rsvd = 0xfffffffe,
+    },{ .name = "QSPI_IOU_RAM",  .addr = A_QSPI_IOU_RAM,
+        .reset = 0x1224,
+        .rsvd = 0xffffc000,
+    },{ .name = "QSPI_IOU_INTERCONNECT_QOS",
+        .addr = A_QSPI_IOU_INTERCONNECT_QOS,
+        .rsvd = 0xfffffff0,
+    },{ .name = "OSPI_IOU_COHERENT_CTRL",  .addr = A_OSPI_IOU_COHERENT_CTRL,
+        .rsvd = 0xfffffff0,
+    },{ .name = "OSPI_IOU_INTERCONNECT_ROUTE",
+        .addr = A_OSPI_IOU_INTERCONNECT_ROUTE,
+        .rsvd = 0xfffffffe,
+    },{ .name = "OSPI_IOU_RAM",  .addr = A_OSPI_IOU_RAM,
+        .reset = 0xa,
+        .rsvd = 0xffffffc0,
+    },{ .name = "OSPI_IOU_INTERCONNECT_QOS",
+        .addr = A_OSPI_IOU_INTERCONNECT_QOS,
+        .rsvd = 0xfffffff0,
+    },{ .name = "OSPI_REFCLK_DLY_CTRL",  .addr = A_OSPI_REFCLK_DLY_CTRL,
+        .reset = 0x13,
+        .rsvd = 0xffffffe0,
+    },{ .name = "CUR_PWR_ST",  .addr = A_CUR_PWR_ST,
+        .rsvd = 0xfffffffc,
+        .ro = 0x3,
+    },{ .name = "CONNECT_ST",  .addr = A_CONNECT_ST,
+        .rsvd = 0xfffffffe,
+        .ro = 0x1,
+    },{ .name = "PW_STATE_REQ",  .addr = A_PW_STATE_REQ,
+        .rsvd = 0xfffffffc,
+    },{ .name = "HOST_U2_PORT_DISABLE",  .addr = A_HOST_U2_PORT_DISABLE,
+        .rsvd = 0xfffffffe,
+    },{ .name = "DBG_U2PMU",  .addr = A_DBG_U2PMU,
+        .ro = 0xffffffff,
+    },{ .name = "DBG_U2PMU_EXT1",  .addr = A_DBG_U2PMU_EXT1,
+        .ro = 0xffffffff,
+    },{ .name = "DBG_U2PMU_EXT2",  .addr = A_DBG_U2PMU_EXT2,
+        .rsvd = 0xfffffff0,
+        .ro = 0xf,
+    },{ .name = "PME_GEN_U2PMU",  .addr = A_PME_GEN_U2PMU,
+        .rsvd = 0xfffffffe,
+        .ro = 0x1,
+    },{ .name = "PWR_CONFIG_USB2",  .addr = A_PWR_CONFIG_USB2,
+        .rsvd = 0xc0000000,
+    },{ .name = "PHY_HUB",  .addr = A_PHY_HUB,
+        .rsvd = 0xfffffffc,
+        .ro = 0x2,
+    },{ .name = "CTRL",  .addr = A_CTRL,
+    },{ .name = "ISR",  .addr = A_ISR,
+        .w1c = 0x1,
+        .post_write = isr_postw,
+    },{ .name = "IMR",  .addr = A_IMR,
+        .reset = 0x1,
+        .ro = 0x1,
+    },{ .name = "IER",  .addr = A_IER,
+        .pre_write = ier_prew,
+    },{ .name = "IDR",  .addr = A_IDR,
+        .pre_write = idr_prew,
+    },{ .name = "ITR",  .addr = A_ITR,
+        .pre_write = itr_prew,
+    },{ .name = "PARITY_ISR",  .addr = A_PARITY_ISR,
+        .w1c = 0x1fff,
+        .post_write = parity_isr_postw,
+    },{ .name = "PARITY_IMR",  .addr = A_PARITY_IMR,
+        .reset = 0x1fff,
+        .ro = 0x1fff,
+    },{ .name = "PARITY_IER",  .addr = A_PARITY_IER,
+        .pre_write = parity_ier_prew,
+    },{ .name = "PARITY_IDR",  .addr = A_PARITY_IDR,
+        .pre_write = parity_idr_prew,
+    },{ .name = "PARITY_ITR",  .addr = A_PARITY_ITR,
+        .pre_write = parity_itr_prew,
+    },{ .name = "WPROT0",  .addr = A_WPROT0,
+        .reset = 0x1,
+    }
+};
+
+static void xlnx_versal_pmc_iou_slcr_reset_init(Object *obj, ResetType type)
+{
+    XlnxVersalPmcIouSlcr *s = XILINX_VERSAL_PMC_IOU_SLCR(obj);
+    unsigned int i;
+
+    for (i = 0; i < ARRAY_SIZE(s->regs_info); ++i) {
+        register_reset(&s->regs_info[i]);
+    }
+}
+
+static void xlnx_versal_pmc_iou_slcr_reset_hold(Object *obj)
+{
+    XlnxVersalPmcIouSlcr *s = XILINX_VERSAL_PMC_IOU_SLCR(obj);
+
+    parity_imr_update_irq(s);
+    imr_update_irq(s);
+
+    /*
+     * Setup OSPI_QSPI mux
+     * By default axi slave interface is enabled for ospi-dma
+     */
+    qemu_set_irq(s->ospi_mux_sel, 0);
+    qemu_set_irq(s->qspi_ospi_mux_sel, 1);
+}
+
+static const MemoryRegionOps pmc_iou_slcr_ops = {
+    .read = register_read_memory,
+    .write = register_write_memory,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+};
+
+static void xlnx_versal_pmc_iou_slcr_realize(DeviceState *dev, Error **errp)
+{
+    XlnxVersalPmcIouSlcr *s = XILINX_VERSAL_PMC_IOU_SLCR(dev);
+
+    qdev_init_gpio_out_named(dev, s->sd_emmc_sel, "sd-emmc-sel", 2);
+    qdev_init_gpio_out_named(dev, &s->qspi_ospi_mux_sel,
+                             "qspi-ospi-mux-sel", 1);
+    qdev_init_gpio_out_named(dev, &s->ospi_mux_sel, "ospi-mux-sel", 1);
+}
+
+static void xlnx_versal_pmc_iou_slcr_init(Object *obj)
+{
+    XlnxVersalPmcIouSlcr *s = XILINX_VERSAL_PMC_IOU_SLCR(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    RegisterInfoArray *reg_array;
+
+    memory_region_init(&s->iomem, obj, TYPE_XILINX_VERSAL_PMC_IOU_SLCR,
+                       XILINX_VERSAL_PMC_IOU_SLCR_R_MAX * 4);
+    reg_array =
+        register_init_block32(DEVICE(obj), pmc_iou_slcr_regs_info,
+                              ARRAY_SIZE(pmc_iou_slcr_regs_info),
+                              s->regs_info, s->regs,
+                              &pmc_iou_slcr_ops,
+                              XILINX_VERSAL_PMC_IOU_SLCR_ERR_DEBUG,
+                              XILINX_VERSAL_PMC_IOU_SLCR_R_MAX * 4);
+    memory_region_add_subregion(&s->iomem,
+                                0x0,
+                                &reg_array->mem);
+    sysbus_init_mmio(sbd, &s->iomem);
+    sysbus_init_irq(sbd, &s->irq_parity_imr);
+    sysbus_init_irq(sbd, &s->irq_imr);
+}
+
+static const VMStateDescription vmstate_pmc_iou_slcr = {
+    .name = TYPE_XILINX_VERSAL_PMC_IOU_SLCR,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, XlnxVersalPmcIouSlcr,
+                             XILINX_VERSAL_PMC_IOU_SLCR_R_MAX),
+        VMSTATE_END_OF_LIST(),
+    }
+};
+
+static void xlnx_versal_pmc_iou_slcr_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+
+    dc->realize = xlnx_versal_pmc_iou_slcr_realize;
+    dc->vmsd = &vmstate_pmc_iou_slcr;
+    rc->phases.enter = xlnx_versal_pmc_iou_slcr_reset_init;
+    rc->phases.hold  = xlnx_versal_pmc_iou_slcr_reset_hold;
+}
+
+static const TypeInfo xlnx_versal_pmc_iou_slcr_info = {
+    .name          = TYPE_XILINX_VERSAL_PMC_IOU_SLCR,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(XlnxVersalPmcIouSlcr),
+    .class_init    = xlnx_versal_pmc_iou_slcr_class_init,
+    .instance_init = xlnx_versal_pmc_iou_slcr_init,
+};
+
+static void xlnx_versal_pmc_iou_slcr_register_types(void)
+{
+    type_register_static(&xlnx_versal_pmc_iou_slcr_info);
+}
+
+type_init(xlnx_versal_pmc_iou_slcr_register_types)
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index d1a1169108..6dcbe044f3 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -84,7 +84,10 @@ softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files(
 ))
 softmmu_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_misc.c'))
 softmmu_ss.add(when: 'CONFIG_ZYNQ', if_true: files('zynq_slcr.c'))
-softmmu_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal-xramc.c'))
+softmmu_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files(
+  'xlnx-versal-xramc.c',
+  'xlnx-versal-pmc-iou-slcr.c',
+))
 softmmu_ss.add(when: 'CONFIG_STM32F2XX_SYSCFG', if_true: files('stm32f2xx_syscfg.c'))
 softmmu_ss.add(when: 'CONFIG_STM32F4XX_SYSCFG', if_true: files('stm32f4xx_syscfg.c'))
 softmmu_ss.add(when: 'CONFIG_STM32F4XX_EXTI', if_true: files('stm32f4xx_exti.c'))
-- 
2.11.0


