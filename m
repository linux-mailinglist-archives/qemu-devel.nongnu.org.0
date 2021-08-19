Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C9D3F1242
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 06:13:11 +0200 (CEST)
Received: from localhost ([::1]:36370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGZQU-0004np-6O
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 00:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mGZOD-0001bg-R9; Thu, 19 Aug 2021 00:10:49 -0400
Received: from mail-sn1anam02on2068.outbound.protection.outlook.com
 ([40.107.96.68]:33991 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mGZHo-0003KD-Iy; Thu, 19 Aug 2021 00:04:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OVvprV/RjqmsSm+OVeyhgMnJ5HyAcEE80RqOorrNcQRm44JkK6mCF9mGdTpKukDIZs6iY3QSMw6VS20tFLKx8HkZb9uVtpx/PKqV5UYSqQweJ0wkg06o1qwhuEaqrtmnu3xnOoZoJp8HEVxP8WTfh8lD3ePlQCNtzw2lIBJwuuscw0b9FUI7gwpE7TWePs6tUv29vmN2RlODTF7GG7kxrTWhDo8xIzCxa7S7q4umqZtOppmFq6lhDPwgWR15RhWdb+X9/OavwtmOoUXXUatgCzEWIMGlU6Q5fpg499MKbauPDT/4zjmfEuoMssIfPzxm5XoXKzUBk9HaPJWdQP6+kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5Dcqmb/L/zQUZVX50/Zkml3+jLK8Gp8iYutHlg/0+4=;
 b=ciII91QMTRxJnQ2ZWxfTJlsGEnJ2FOjNskCn74jttVsXM3inTJmdw/Un50SAfPHSVHhzDzAslxNdGr24HeufyObjlZMAC0JzD2JaoUTxIqB6Gwq5lNPnNTS4CR35WWrIEKM1kC0Sq5e/cf+zTvfQUlit5KXApPsiXyaNfE4TGnhOChkVNYztWgTt2o9TuqrIHO73kGglek7y4LJJO/AaGGvnaq2ruyX4zhaOxJYoaQVListTiutJp//nDm+zSqw7n9oJdjl3yYCO+8Ex1A1vCS8zu80SQISi/foILrZcKjqeu3Wtb7EsoA0HCg5nSJQbN2N1WnQK2CZfITtPk+b0+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5Dcqmb/L/zQUZVX50/Zkml3+jLK8Gp8iYutHlg/0+4=;
 b=o6sIJXQh1zh0FWN4d1iYm3oVEsoxIdTzA6MEL9LM12jPYUekREhnMTQYKcDeSG7wk00Qa7PaL6BxMuO/kaEs5jZO7p5ZEwwXjdurtIG0QUSHKkLvaOjMBt96QL80ubHaauiThLZxv7y5JhwJtlRN1m/tTo7udNDqouWTUxXN2mo=
Received: from SN7PR18CA0012.namprd18.prod.outlook.com (2603:10b6:806:f3::35)
 by SN4PR0201MB8808.namprd02.prod.outlook.com (2603:10b6:806:203::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Thu, 19 Aug
 2021 04:04:09 +0000
Received: from SN1NAM02FT0014.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:f3:cafe::12) by SN7PR18CA0012.outlook.office365.com
 (2603:10b6:806:f3::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Thu, 19 Aug 2021 04:04:09 +0000
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
 id 1mGZHc-0000M7-PA; Wed, 18 Aug 2021 21:04:00 -0700
From: Tong Ho <tong.ho@xilinx.com>
To: <qemu-arm@nongnu.org>
Subject: [PATCH 7/9] hw/arm: xlnx-versal: Add Xilinx eFUSE device
Date: Wed, 18 Aug 2021 21:03:06 -0700
Message-ID: <20210819040308.675057-8-tong.ho@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210819040308.675057-1-tong.ho@xilinx.com>
References: <20210819040308.675057-1-tong.ho@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 315376be-910d-4ca0-1d26-08d962c6652a
X-MS-TrafficTypeDiagnostic: SN4PR0201MB8808:
X-Microsoft-Antispam-PRVS: <SN4PR0201MB8808039EF6EBD758C4BEFF35CDC09@SN4PR0201MB8808.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:167;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c5/Ekg5a2TrB22y5wrLbEpaKUCh2zFXDppKrUEyShO7QDRuMbaXDgci3jECkvfseG9uI0pYXwHpsS6jCYlZ4693YMFmkrg4o+kNO/+JH5ynNAK0ZOxpBz0ILGBreTfQXFYVCyZ5bPGWzWvUAgxwqpwf6pxc5PKfcTs3AhGvWNLBPzdDGBMgigLZhtvLYXXrPT7inraL4pbS/0FLEB0WWuDpJ/QwgePzuLm1SbWQuNpj4pMzCNLIGKF30HRhJhQ020PnpKEyPjuVt/xY5kzUKhG8WSJgktLY1wytbwa0sCNTRMsF7OCe1lgoWk5v1A7xBRGnW9lPOS10vHTuLAOL1GI3ePRwKm/losQhEt74KgLtp1R4BfFQLGDOvZw2VY0J/6aDbrhVa8TQvVKHUlfkLamNY/3y6/xI1m5Q9u9YsormDV7gTkEtD9KqeohlAPUY3cGkqy50I/bzBtLTAMRK1VsLh2rYNH25W1luGUy0hayyaefDY8B77ttm9YN4gDuaOA6GOGzcvyrUCEU4gSwN7r3SV7ixLOexFd41ZheSdtlbA9ajmfnjoFYGHH6WmNKZ3u2+MGCmr4whKQlkFrs6ludJTLKlZc1rv+aPFPWBZezrIDU9wVmRdQsZNwyTltvZoB7IxC9kdX/Ua4K6oAFdZMKnv15571sfAtN84v1ipIaLOZv19Iz7qBsjIcV5KWspFm/z8bJT8SQ1hcq4sacddUSUeZ56rHkdto3khbQoVY+w=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39860400002)(376002)(46966006)(36840700001)(36906005)(54906003)(1076003)(8676002)(336012)(82310400003)(9786002)(44832011)(107886003)(82740400003)(316002)(47076005)(8936002)(426003)(2906002)(4326008)(36756003)(6916009)(36860700001)(7696005)(26005)(2616005)(478600001)(186003)(5660300002)(70206006)(356005)(70586007)(7636003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 04:04:08.9131 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 315376be-910d-4ca0-1d26-08d962c6652a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0014.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB8808
Received-SPF: pass client-ip=40.107.96.68; envelope-from=tongh@xilinx.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
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

Connect the support for Versal eFUSE one-time field-programmable
bit array.

Signed-off-by: Tong Ho <tong.ho@xilinx.com>
---
 hw/arm/xlnx-versal-virt.c    | 36 +++++++++++++++++++++++++++++++++
 hw/arm/xlnx-versal.c         | 39 ++++++++++++++++++++++++++++++++++++
 include/hw/arm/xlnx-versal.h | 12 +++++++++++
 3 files changed, 87 insertions(+)

diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index d9e2a6a853..04da6c4517 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -376,6 +376,40 @@ static void fdt_add_bbram_node(VersalVirt *s)
     g_free(name);
 }
 
+static void fdt_add_efuse_ctrl_node(VersalVirt *s)
+{
+    const char compat[] = TYPE_XLNX_VERSAL_EFUSE_CTRL;
+    const char interrupt_names[] = "pmc_efuse";
+    char *name = g_strdup_printf("/pmc_efuse@%x", MM_PMC_EFUSE_CTRL);
+
+    qemu_fdt_add_subnode(s->fdt, name);
+
+    qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
+                           GIC_FDT_IRQ_TYPE_SPI, VERSAL_EFUSE_IRQ,
+                           GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+    qemu_fdt_setprop(s->fdt, name, "interrupt-names",
+                     interrupt_names, sizeof(interrupt_names));
+    qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
+                                 2, MM_PMC_EFUSE_CTRL,
+                                 2, MM_PMC_EFUSE_CTRL_SIZE);
+    qemu_fdt_setprop(s->fdt, name, "compatible", compat, sizeof(compat));
+    g_free(name);
+}
+
+static void fdt_add_efuse_cache_node(VersalVirt *s)
+{
+    const char compat[] = TYPE_XLNX_VERSAL_EFUSE_CACHE;
+    char *name = g_strdup_printf("/xlnx_pmc_efuse_cache@%x", MM_PMC_EFUSE_CACHE);
+
+    qemu_fdt_add_subnode(s->fdt, name);
+
+    qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
+                                 2, MM_PMC_EFUSE_CACHE,
+                                 2, MM_PMC_EFUSE_CACHE_SIZE);
+    qemu_fdt_setprop(s->fdt, name, "compatible", compat, sizeof(compat));
+    g_free(name);
+}
+
 static void fdt_nop_memory_nodes(void *fdt, Error **errp)
 {
     Error *err = NULL;
@@ -591,6 +625,8 @@ static void versal_virt_init(MachineState *machine)
     fdt_add_sd_nodes(s);
     fdt_add_rtc_node(s);
     fdt_add_bbram_node(s);
+    fdt_add_efuse_ctrl_node(s);
+    fdt_add_efuse_cache_node(s);
     fdt_add_cpu_nodes(s, psci_conduit);
     fdt_add_clk_node(s, "/clk125", 125000000, s->phandle.clk_125Mhz);
     fdt_add_clk_node(s, "/clk25", 25000000, s->phandle.clk_25Mhz);
diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index 46d7f42a6b..d278d6e0f4 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -329,6 +329,44 @@ static void versal_create_bbram(Versal *s, qemu_irq *pic)
     sysbus_connect_irq(sbd, 0, pic[VERSAL_BBRAM_APB_IRQ_0]);
 }
 
+static void versal_realize_efuse_part(Versal *s, Object *dev, hwaddr base)
+{
+    SysBusDevice *part = SYS_BUS_DEVICE(dev);
+
+    object_property_set_link(OBJECT(part), "efuse",
+                             OBJECT(&s->pmc.efuse.bits), &error_abort);
+
+    sysbus_realize(part, &error_abort);
+    memory_region_add_subregion(&s->mr_ps, base,
+                                sysbus_mmio_get_region(part, 0));
+}
+
+static void versal_create_efuse(Versal *s, qemu_irq *pic)
+{
+    Object *bits = OBJECT(&s->pmc.efuse.bits);
+    Object *ctrl = OBJECT(&s->pmc.efuse.ctrl);
+    Object *cache = OBJECT(&s->pmc.efuse.cache);
+
+    object_initialize_child(OBJECT(s), "efuse-ctrl", &s->pmc.efuse.ctrl,
+                            TYPE_XLNX_VERSAL_EFUSE_CTRL);
+
+    object_initialize_child(OBJECT(s), "efuse-cache", &s->pmc.efuse.cache,
+                            TYPE_XLNX_VERSAL_EFUSE_CACHE);
+
+    object_initialize_child_with_props(ctrl, "efuse-bits", bits,
+                                       sizeof(s->pmc.efuse.bits),
+                                       TYPE_XLNX_EFUSE, &error_abort,
+                                       "efuse-nr", "3",
+                                       "efuse-size", "8192",
+                                       NULL);
+
+    qdev_realize(DEVICE(bits), NULL, &error_abort);
+    versal_realize_efuse_part(s, ctrl, MM_PMC_EFUSE_CTRL);
+    versal_realize_efuse_part(s, cache, MM_PMC_EFUSE_CACHE);
+
+    sysbus_connect_irq(SYS_BUS_DEVICE(ctrl), 0, pic[VERSAL_EFUSE_IRQ]);
+}
+
 /* This takes the board allocated linear DDR memory and creates aliases
  * for each split DDR range/aperture on the Versal address map.
  */
@@ -416,6 +454,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
     versal_create_rtc(s, pic);
     versal_create_xrams(s, pic);
     versal_create_bbram(s, pic);
+    versal_create_efuse(s, pic);
     versal_map_ddr(s);
     versal_unimp(s);
 
diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index 7719e8c4d2..33b89f00b6 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -25,6 +25,7 @@
 #include "hw/usb/xlnx-usb-subsystem.h"
 #include "hw/misc/xlnx-versal-xramc.h"
 #include "hw/nvram/xlnx-bbram.h"
+#include "hw/nvram/xlnx-versal-efuse.h"
 
 #define TYPE_XLNX_VERSAL "xlnx-versal"
 OBJECT_DECLARE_SIMPLE_TYPE(Versal, XLNX_VERSAL)
@@ -81,6 +82,11 @@ struct Versal {
 
         XlnxZynqMPRTC rtc;
         XlnxBBRam bbram;
+        struct {
+            XlnxVersalEFuseCtrl ctrl;
+            XlnxVersalEFuseCache cache;
+            XLNXEFuse bits;
+        } efuse;
     } pmc;
 
     struct {
@@ -110,6 +116,7 @@ struct Versal {
 #define VERSAL_BBRAM_APB_IRQ_0     121
 #define VERSAL_RTC_APB_ERR_IRQ     121
 #define VERSAL_SD0_IRQ_0           126
+#define VERSAL_EFUSE_IRQ           139
 #define VERSAL_RTC_ALARM_IRQ       142
 #define VERSAL_RTC_SECONDS_IRQ     143
 
@@ -175,6 +182,11 @@ struct Versal {
 #define MM_PMC_SD0_SIZE             0x10000
 #define MM_PMC_BBRAM_CTRL           0xf11f0000
 #define MM_PMC_BBRAM_CTRL_SIZE      0x00050
+#define MM_PMC_EFUSE_CTRL           0xf1240000
+#define MM_PMC_EFUSE_CTRL_SIZE      0x00104
+#define MM_PMC_EFUSE_CACHE          0xf1250000
+#define MM_PMC_EFUSE_CACHE_SIZE     0x00C00
+
 #define MM_PMC_CRP                  0xf1260000U
 #define MM_PMC_CRP_SIZE             0x10000
 #define MM_PMC_RTC                  0xf12a0000
-- 
2.25.1


