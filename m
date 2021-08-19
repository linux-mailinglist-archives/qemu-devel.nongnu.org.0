Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 358DB3F1241
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 06:13:09 +0200 (CEST)
Received: from localhost ([::1]:36324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGZQS-0004mL-9D
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 00:13:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mGZOE-0001bg-6J; Thu, 19 Aug 2021 00:10:50 -0400
Received: from mail-dm6nam08on2082.outbound.protection.outlook.com
 ([40.107.102.82]:36928 helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mGZHo-0003KG-HQ; Thu, 19 Aug 2021 00:04:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JDu1fGGf/Qhzsagfkaexp3SC2AfDyTxhyL6vYt/zObxdU5jxjct25M5rIGG6GCjQe3yCA0QMakibZCo5xGSqFgYLU+PON5XVNW8Za4N9mskKtuSmUlKqlWNqXamNuWm6aykxF5P9V8A9VvpuJfGniUkJALwHb46ytEgFKK1RyETV4b6LorgCIweoxOyY5JweZX8DFLy3saYQx9/1FZ4zJ7vE00tFyzJ2Cjb2CfP7t873QxRbBDsq35Mxj3lbSg7UwuGKTd70NNvQ6jfc2fLtxlzMYiuou/e94eglwAgaRD1h/wcHYGYRgV1jrm7T1asM9E7kO8YG5p0gYgRBZgS+qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0WRKEKpg5vg84WeZ0p0EP1QrcUo9MUbdy2Uf7Rs4VA=;
 b=bbk1a8cf59Y1d1I3OE8YDlrynPUF3XokVwa2CCHT54Ik8qTXRu4vp8nx2pBYiwiOvjStl5cPYYjvoOmVsFZd5/fFyaD6Mom9TMDRzf8PEQX/LqKiT8zDzBfmTde1T974N5OVy9ES/+IulieBJ3vjTj488KSPslZ/ZdMw0/Xldr1tJSciaJ5msN5Cxry4DlQhu+JN70FnGl3oBjpcDCRk14N8onHXdewBsHX6cVVFqSNndTQODIY+bzGEi+Ur/m+r48od4wUhOE+1CqHrjH+qgch+yWa29tE+K5LA1S8oZmoM+f/pOA8Kj9NmdnAyWWfXeZOrDfr4Vx63kyC9cZwJVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0WRKEKpg5vg84WeZ0p0EP1QrcUo9MUbdy2Uf7Rs4VA=;
 b=NufM1zSqWSQ9MTJySu87XHhZ90CweGBzOB0QRKqxLL4rKQR/IKRwMbWyEGBd2xh6nf9COi6OSZ6uFTWiSHUNSXkVycvGwhzvFKRNY6u6bqnJLvGBRWTo0EWvsBaFv5p1hQsd+REygRVFphvIWtFDg7Smfpv3adj/ITK9EZPabeE=
Received: from SN7PR18CA0010.namprd18.prod.outlook.com (2603:10b6:806:f3::9)
 by SJ0PR02MB7581.namprd02.prod.outlook.com (2603:10b6:a03:318::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 19 Aug
 2021 04:04:08 +0000
Received: from SN1NAM02FT0014.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:f3:cafe::3a) by SN7PR18CA0010.outlook.office365.com
 (2603:10b6:806:f3::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Thu, 19 Aug 2021 04:04:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0014.mail.protection.outlook.com (10.97.4.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Thu, 19 Aug 2021 04:04:08 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 18 Aug 2021 21:04:00 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 18 Aug 2021 21:04:00 -0700
Received: from [172.19.2.40] (port=52318 helo=xsjtongh40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <tong.ho@xilinx.com>)
 id 1mGZHc-0000M7-OZ; Wed, 18 Aug 2021 21:04:00 -0700
From: Tong Ho <tong.ho@xilinx.com>
To: <qemu-arm@nongnu.org>
Subject: [PATCH 6/9] hw/arm: xlnx-versal: Add Xilinx BBRAM device
Date: Wed, 18 Aug 2021 21:03:05 -0700
Message-ID: <20210819040308.675057-7-tong.ho@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210819040308.675057-1-tong.ho@xilinx.com>
References: <20210819040308.675057-1-tong.ho@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 962a6f1e-c597-487b-8c9f-08d962c664dd
X-MS-TrafficTypeDiagnostic: SJ0PR02MB7581:
X-Microsoft-Antispam-PRVS: <SJ0PR02MB7581F3B52C5DC614B347FFF4CDC09@SJ0PR02MB7581.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:167;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PWth45a+wHqSBfomq2G7bGBndSoyBUv830ShhNXAUn2nofZI832BBsTysA8IUOIddIcOlW9nZrUzCdwq+U+r9GKG4ynKlLp2yQBMJEwYT8eENEZOtrDAj/Jrql5E5V016wJtMpIvjTdJoBS8vOrT6YTlEgD2xh4MeLsRGh87zhPHnBWjDSVZi1FG+2MLkwe/g2N3x4bh2/Ne2gIAS2basuO7PWkuFehjdGLODnEdl0FRLMtWDbGVPjyl8fmRMv7px4GBm3tDJY6KG5Xt8oNlDUnt+VPro+DjMmyYDRX2OKEo+U7kIr3jNiy3EC5rotQAyOdIvvu6O//JaXaTJEifEqRCdkMCe8mTfw+hd7SJ7VJ+PPsYm9sL6gIkPG96HHKAZGydLJhvJh5o4aM+eysOaDjf7KVuxInB6cvM5KXlIlAhs97LLzx+fiTf3iu+lZRWealgvj00lKuQGc8Kf8FRbaHpM8XyGTrB7noerol3ksL5u0EYylBV2jGfs4NIB0J1W3JqWqqkNKZakFeZavdtBum1bd7+DL8+rel7gQgw5Xqvo08+FepdT0CasvR/JecBCrFNFJmTFl3egddIHVISq63Ig8Yn3MdraDBeQA0pqdjNyQd1HvoZsGqaREFzKSkpXEdso2m5+KgidYB4LSz8OzBw9j4jIhJHDZ+Tk/UID43rY4885zlbkPj6OzVVyfcLxwaM6ib01kDoMtb243n6KCw9QOoX9/lfBpLhae06gBM=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(136003)(396003)(346002)(46966006)(36840700001)(8676002)(8936002)(107886003)(356005)(336012)(316002)(36906005)(6916009)(9786002)(7636003)(2906002)(47076005)(426003)(82310400003)(2616005)(44832011)(54906003)(5660300002)(82740400003)(4326008)(1076003)(36756003)(478600001)(70586007)(70206006)(36860700001)(186003)(26005)(7696005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 04:04:08.4113 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 962a6f1e-c597-487b-8c9f-08d962c664dd
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0014.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7581
Received-SPF: pass client-ip=40.107.102.82; envelope-from=tongh@xilinx.com;
 helo=NAM04-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: edgar.iglesias@gmail.com, alistair@alistair23.me, tong.ho@xilinx.com,
 qemu-devel@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Connect the support for Versal Battery-Backed RAM (BBRAM)

Signed-off-by: Tong Ho <tong.ho@xilinx.com>
---
 hw/arm/xlnx-versal-virt.c    | 21 +++++++++++++++++++++
 hw/arm/xlnx-versal.c         | 18 ++++++++++++++++++
 include/hw/arm/xlnx-versal.h |  5 +++++
 3 files changed, 44 insertions(+)

diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 5bca360dce..d9e2a6a853 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -356,6 +356,26 @@ static void fdt_add_rtc_node(VersalVirt *s)
     g_free(name);
 }
 
+static void fdt_add_bbram_node(VersalVirt *s)
+{
+    const char compat[] = TYPE_XLNX_BBRAM;
+    const char interrupt_names[] = "bbram-error";
+    char *name = g_strdup_printf("/bbram@%x", MM_PMC_BBRAM_CTRL);
+
+    qemu_fdt_add_subnode(s->fdt, name);
+
+    qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
+                           GIC_FDT_IRQ_TYPE_SPI, VERSAL_BBRAM_APB_IRQ_0,
+                           GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+    qemu_fdt_setprop(s->fdt, name, "interrupt-names",
+                     interrupt_names, sizeof(interrupt_names));
+    qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
+                                 2, MM_PMC_BBRAM_CTRL,
+                                 2, MM_PMC_BBRAM_CTRL_SIZE);
+    qemu_fdt_setprop(s->fdt, name, "compatible", compat, sizeof(compat));
+    g_free(name);
+}
+
 static void fdt_nop_memory_nodes(void *fdt, Error **errp)
 {
     Error *err = NULL;
@@ -570,6 +590,7 @@ static void versal_virt_init(MachineState *machine)
     fdt_add_usb_xhci_nodes(s);
     fdt_add_sd_nodes(s);
     fdt_add_rtc_node(s);
+    fdt_add_bbram_node(s);
     fdt_add_cpu_nodes(s, psci_conduit);
     fdt_add_clk_node(s, "/clk125", 125000000, s->phandle.clk_125Mhz);
     fdt_add_clk_node(s, "/clk25", 25000000, s->phandle.clk_25Mhz);
diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index fb776834f7..46d7f42a6b 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -312,6 +312,23 @@ static void versal_create_xrams(Versal *s, qemu_irq *pic)
     }
 }
 
+static void versal_create_bbram(Versal *s, qemu_irq *pic)
+{
+    SysBusDevice *sbd;
+
+    object_initialize_child_with_props(OBJECT(s), "bbram", &s->pmc.bbram,
+                                       sizeof(s->pmc.bbram), TYPE_XLNX_BBRAM,
+                                       &error_fatal,
+                                       "crc-zpads", "0",
+                                       NULL);
+    sbd = SYS_BUS_DEVICE(&s->pmc.bbram);
+
+    sysbus_realize(sbd, &error_fatal);
+    memory_region_add_subregion(&s->mr_ps, MM_PMC_BBRAM_CTRL,
+                                sysbus_mmio_get_region(sbd, 0));
+    sysbus_connect_irq(sbd, 0, pic[VERSAL_BBRAM_APB_IRQ_0]);
+}
+
 /* This takes the board allocated linear DDR memory and creates aliases
  * for each split DDR range/aperture on the Versal address map.
  */
@@ -398,6 +415,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
     versal_create_sds(s, pic);
     versal_create_rtc(s, pic);
     versal_create_xrams(s, pic);
+    versal_create_bbram(s, pic);
     versal_map_ddr(s);
     versal_unimp(s);
 
diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index 22a8fa5d11..7719e8c4d2 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -24,6 +24,7 @@
 #include "qom/object.h"
 #include "hw/usb/xlnx-usb-subsystem.h"
 #include "hw/misc/xlnx-versal-xramc.h"
+#include "hw/nvram/xlnx-bbram.h"
 
 #define TYPE_XLNX_VERSAL "xlnx-versal"
 OBJECT_DECLARE_SIMPLE_TYPE(Versal, XLNX_VERSAL)
@@ -79,6 +80,7 @@ struct Versal {
         } iou;
 
         XlnxZynqMPRTC rtc;
+        XlnxBBRam bbram;
     } pmc;
 
     struct {
@@ -105,6 +107,7 @@ struct Versal {
 #define VERSAL_GEM1_WAKE_IRQ_0     59
 #define VERSAL_ADMA_IRQ_0          60
 #define VERSAL_XRAM_IRQ_0          79
+#define VERSAL_BBRAM_APB_IRQ_0     121
 #define VERSAL_RTC_APB_ERR_IRQ     121
 #define VERSAL_SD0_IRQ_0           126
 #define VERSAL_RTC_ALARM_IRQ       142
@@ -170,6 +173,8 @@ struct Versal {
 
 #define MM_PMC_SD0                  0xf1040000U
 #define MM_PMC_SD0_SIZE             0x10000
+#define MM_PMC_BBRAM_CTRL           0xf11f0000
+#define MM_PMC_BBRAM_CTRL_SIZE      0x00050
 #define MM_PMC_CRP                  0xf1260000U
 #define MM_PMC_CRP_SIZE             0x10000
 #define MM_PMC_RTC                  0xf12a0000
-- 
2.25.1


