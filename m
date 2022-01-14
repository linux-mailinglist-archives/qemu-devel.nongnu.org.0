Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3FF48ED27
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 16:32:21 +0100 (CET)
Received: from localhost ([::1]:43970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8OYt-0005Dl-2j
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 10:32:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1n8OVd-0002CI-3X
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:28:57 -0500
Received: from mail-dm3nam07on2066.outbound.protection.outlook.com
 ([40.107.95.66]:32768 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1n8OVb-0007VT-3L
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:28:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MAYVYu17OSrt8BcQG36fDAz6bQ0gKdMMpViKr4KJOR/4Ph17TCNtxCuVTxJU2O7FomMYAReGx3xZ6Hk0b+/BqKmDljENwX5j3tLnqZ806+X9ey/lPd9PHiAX2rvhiaA1EEkNlhYewiVos2RKWTfZhrnsPYXe2BuPcNCIft2jtRtCAxEaAV1gj+0G1DgyIt7jHmt6Q2+L7gGANR/LX/hPE7RfzI+HFhf7jU2iYJ8z0WO1QO5dkzTkfUlxqWePINkbYtbsZhDrrN2o7PD2QLQPCrystbIMc3NQ9jKH9mKTfft3DhmFnaTBej/2WX6Db3CYZW8tnC8xAuwDrcFqM1NuaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1DzpYDr14GHkFV7NlXVceG6Dhe/kEGK3851mmFY+jnU=;
 b=mp1xe5g8rkmpiEuNRmkHDgkMwpHqnkm8laJn+60zPzIy9fBRb+XuaoWAl7vD6LizcDnpBbTe8mjfdjKxYHAxtWSiNQ25yWWqZPpcrEITN2IAUoTmbs2sEluuuDb7Vv9T4OfvLl95Qx7cSqrcZEZ/Bel0KZAbewlYXdlKjl08CKR7CLcvUKkQe4rl4/HAdkp/NcrxYGmFwuABR3+updXBy2R6p00KKRVQ2VCnhaLXeg3DxfVW06+VCBE1LYIf0m2OOANW5arGAA6FfKmAYXHDIjN5YjEEVaNV0H3tQEWHL/e+uJTm168Y3HVI3ICsrz+cQFLi/jhE5y6vTlYgshfZCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DzpYDr14GHkFV7NlXVceG6Dhe/kEGK3851mmFY+jnU=;
 b=RnVxgjqSTroGMtjAW/7BjSe9AB8WIj1KJ/a9l4PwqT2hSS/OEifhyABse3S80uqeBNbm9+dW25+e4vV5OGMaRVbZzvxG+OeaQJBa6onz5RANEjLWO90HZRQKiAbpvQ2fTZ480YEJM88+VDXVVELzHa85XP0bXRQLCLsw/A6VplE=
Received: from SA9PR13CA0171.namprd13.prod.outlook.com (2603:10b6:806:28::26)
 by BN8PR02MB5921.namprd02.prod.outlook.com (2603:10b6:408:b7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Fri, 14 Jan
 2022 15:28:52 +0000
Received: from SN1NAM02FT0032.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:28:cafe::76) by SA9PR13CA0171.outlook.office365.com
 (2603:10b6:806:28::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.3 via Frontend
 Transport; Fri, 14 Jan 2022 15:28:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0032.mail.protection.outlook.com (10.97.5.58) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4888.9 via Frontend Transport; Fri, 14 Jan 2022 15:28:51 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 14 Jan 2022 07:28:50 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 14 Jan 2022 07:28:50 -0800
Received: from [10.23.121.163] (port=49859 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1n8OVW-0004L4-8M; Fri, 14 Jan 2022 07:28:50 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v6 03/12] hw/arm/xlnx-versal: Connect Versal's PMC SLCR
Date: Fri, 14 Jan 2022 15:28:32 +0000
Message-ID: <20220114152841.1740-4-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220114152841.1740-1-francisco.iglesias@xilinx.com>
References: <20220114152841.1740-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a17f6a32-e03e-48dd-56c6-08d9d7729176
X-MS-TrafficTypeDiagnostic: BN8PR02MB5921:EE_
X-Microsoft-Antispam-PRVS: <BN8PR02MB5921890ADF6DCB7F6B3278F8AD549@BN8PR02MB5921.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:462;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h3GUAnGsDzmjqLKbMHZUmX3hgKo3cNAzHubol2BAZToNK+zdcGqIfwOtU14iHT5TainiPgT18f6dIacef/6WwOiirDZnkqMt0ZqBtIrN+H9PIvx3BQAhV/CA3c4e84k/U46CSud2bOFUcPhZOESXZtgBm9TiEDZheYpLBSWaTg14h+GP6pEzxg3LJs/DhqXQ3/83b4bL8f+GyN1sPR6wMd3IA0gHdhsFR6vaVSI3cPh+M/1ax5dkr6Argw6SFBlsuwaGE+EF1aJ/uW9qS1EK0wEXhGuwXK6S4D4FrOtyT4a48za/c+aZ/YBV1NHtwjtEZAqfPW7AIWODAZlJZSvctZN7/lrIypptN/oEITgpEBK4GCKHc5dUVqkw42YtHxmJZ+ZSZIRgyF2N8HaqjJzeFnhxxFNUMoP8O5V0MBZh3bsofRudF4nbe0m77L/WtVs/wkUJowXTKmcFm7ev5qteN3o9vfR7Xiv5wzAOj+sx4G9/W73TDtkOlimX+7ViVygl5g/d6va1gFSZE3bG/H2LgM8fzhbIqTFuTBDmCV7qOekdDRXF8taE5pqJCGlGfgZRmoc9yIckSzPjaoeEoIAh41guoO1I7ou83Qzv0pdUwro++DZueUPRQb1QfFScH8cfxg7NFudGDL0MtSwYkb6XYmGv3SH/qn3ZHVluyHR/oBp2u90/IMxakGNfprfGGF9uh7FGTzDD2GFSd1QomzSJVBlQi+wVbNbwnnG5IMnoRAA=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(54906003)(2906002)(1076003)(82310400004)(7696005)(426003)(5660300002)(36756003)(7636003)(9786002)(36860700001)(336012)(4326008)(6916009)(508600001)(316002)(8676002)(26005)(8936002)(70586007)(356005)(70206006)(44832011)(47076005)(186003)(2616005)(6666004)(83380400001)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 15:28:51.5550 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a17f6a32-e03e-48dd-56c6-08d9d7729176
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0032.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR02MB5921
Received-SPF: pass client-ip=40.107.95.66; envelope-from=figlesia@xilinx.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
 frasse.iglesias@gmail.com, alistair@alistair23.me, alistair23@gmail.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Connect Versal's PMC SLCR (system-level control registers) model.

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
---
 hw/arm/xlnx-versal.c         | 71 +++++++++++++++++++++++++++++++++++++++++++-
 include/hw/arm/xlnx-versal.h |  5 ++++
 2 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index fefd00b57c..c8c0c102c7 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -21,11 +21,13 @@
 #include "kvm_arm.h"
 #include "hw/misc/unimp.h"
 #include "hw/arm/xlnx-versal.h"
+#include "qemu/log.h"
+#include "hw/sysbus.h"
 
 #define XLNX_VERSAL_ACPU_TYPE ARM_CPU_TYPE_NAME("cortex-a72")
 #define GEM_REVISION        0x40070106
 
-#define VERSAL_NUM_PMC_APB_IRQS 2
+#define VERSAL_NUM_PMC_APB_IRQS 3
 
 static void versal_create_apu_cpus(Versal *s)
 {
@@ -271,6 +273,7 @@ static void versal_create_pmc_apb_irq_orgate(Versal *s, qemu_irq *pic)
      * models:
      *  - RTC
      *  - BBRAM
+     *  - PMC SLCR
      */
     object_initialize_child(OBJECT(s), "pmc-apb-irq-orgate",
                             &s->pmc.apb_irq_orgate, TYPE_OR_IRQ);
@@ -392,6 +395,23 @@ static void versal_create_efuse(Versal *s, qemu_irq *pic)
     sysbus_connect_irq(SYS_BUS_DEVICE(ctrl), 0, pic[VERSAL_EFUSE_IRQ]);
 }
 
+static void versal_create_pmc_iou_slcr(Versal *s, qemu_irq *pic)
+{
+    SysBusDevice *sbd;
+
+    object_initialize_child(OBJECT(s), "versal-pmc-iou-slcr", &s->pmc.iou.slcr,
+                            TYPE_XILINX_VERSAL_PMC_IOU_SLCR);
+
+    sbd = SYS_BUS_DEVICE(&s->pmc.iou.slcr);
+    sysbus_realize(sbd, &error_fatal);
+
+    memory_region_add_subregion(&s->mr_ps, MM_PMC_PMC_IOU_SLCR,
+                                sysbus_mmio_get_region(sbd, 0));
+
+    sysbus_connect_irq(sbd, 0,
+                       qdev_get_gpio_in(DEVICE(&s->pmc.apb_irq_orgate), 2));
+}
+
 /* This takes the board allocated linear DDR memory and creates aliases
  * for each split DDR range/aperture on the Versal address map.
  */
@@ -448,8 +468,31 @@ static void versal_unimp_area(Versal *s, const char *name,
     memory_region_add_subregion(mr, base, mr_dev);
 }
 
+static void versal_unimp_sd_emmc_sel(void *opaque, int n, int level)
+{
+    qemu_log_mask(LOG_UNIMP,
+                  "Selecting between enabling SD mode or eMMC mode on "
+                  "controller %d is not yet implemented\n", n);
+}
+
+static void versal_unimp_qspi_ospi_mux_sel(void *opaque, int n, int level)
+{
+    qemu_log_mask(LOG_UNIMP,
+                  "Selecting between enabling the QSPI or OSPI linear address "
+                  "region is not yet implemented\n");
+}
+
+static void versal_unimp_irq_parity_imr(void *opaque, int n, int level)
+{
+    qemu_log_mask(LOG_UNIMP,
+                  "PMC SLCR parity interrupt behaviour "
+                  "is not yet implemented\n");
+}
+
 static void versal_unimp(Versal *s)
 {
+    qemu_irq gpio_in;
+
     versal_unimp_area(s, "psm", &s->mr_ps,
                         MM_PSM_START, MM_PSM_END - MM_PSM_START);
     versal_unimp_area(s, "crl", &s->mr_ps,
@@ -464,6 +507,31 @@ static void versal_unimp(Versal *s)
                         MM_IOU_SCNTR, MM_IOU_SCNTR_SIZE);
     versal_unimp_area(s, "iou-scntr-seucre", &s->mr_ps,
                         MM_IOU_SCNTRS, MM_IOU_SCNTRS_SIZE);
+
+    qdev_init_gpio_in_named(DEVICE(s), versal_unimp_sd_emmc_sel,
+                            "sd-emmc-sel-dummy", 2);
+    qdev_init_gpio_in_named(DEVICE(s), versal_unimp_qspi_ospi_mux_sel,
+                            "qspi-ospi-mux-sel-dummy", 1);
+    qdev_init_gpio_in_named(DEVICE(s), versal_unimp_irq_parity_imr,
+                            "irq-parity-imr-dummy", 1);
+
+    gpio_in = qdev_get_gpio_in_named(DEVICE(s), "sd-emmc-sel-dummy", 0);
+    qdev_connect_gpio_out_named(DEVICE(&s->pmc.iou.slcr), "sd-emmc-sel", 0,
+                                gpio_in);
+
+    gpio_in = qdev_get_gpio_in_named(DEVICE(s), "sd-emmc-sel-dummy", 1);
+    qdev_connect_gpio_out_named(DEVICE(&s->pmc.iou.slcr), "sd-emmc-sel", 1,
+                                gpio_in);
+
+    gpio_in = qdev_get_gpio_in_named(DEVICE(s), "qspi-ospi-mux-sel-dummy", 0);
+    qdev_connect_gpio_out_named(DEVICE(&s->pmc.iou.slcr),
+                                "qspi-ospi-mux-sel", 0,
+                                gpio_in);
+
+    gpio_in = qdev_get_gpio_in_named(DEVICE(s), "irq-parity-imr-dummy", 0);
+    qdev_connect_gpio_out_named(DEVICE(&s->pmc.iou.slcr),
+                                SYSBUS_DEVICE_GPIO_IRQ, 0,
+                                gpio_in);
 }
 
 static void versal_realize(DeviceState *dev, Error **errp)
@@ -483,6 +551,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
     versal_create_xrams(s, pic);
     versal_create_bbram(s, pic);
     versal_create_efuse(s, pic);
+    versal_create_pmc_iou_slcr(s, pic);
     versal_map_ddr(s);
     versal_unimp(s);
 
diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index 62fb6f0a68..811df73350 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -26,6 +26,7 @@
 #include "hw/misc/xlnx-versal-xramc.h"
 #include "hw/nvram/xlnx-bbram.h"
 #include "hw/nvram/xlnx-versal-efuse.h"
+#include "hw/misc/xlnx-versal-pmc-iou-slcr.h"
 
 #define TYPE_XLNX_VERSAL "xlnx-versal"
 OBJECT_DECLARE_SIMPLE_TYPE(Versal, XLNX_VERSAL)
@@ -78,6 +79,7 @@ struct Versal {
     struct {
         struct {
             SDHCIState sd[XLNX_VERSAL_NR_SDS];
+            XlnxVersalPmcIouSlcr slcr;
         } iou;
 
         XlnxZynqMPRTC rtc;
@@ -179,6 +181,9 @@ struct Versal {
 #define MM_FPD_FPD_APU              0xfd5c0000
 #define MM_FPD_FPD_APU_SIZE         0x100
 
+#define MM_PMC_PMC_IOU_SLCR         0xf1060000
+#define MM_PMC_PMC_IOU_SLCR_SIZE    0x10000
+
 #define MM_PMC_SD0                  0xf1040000U
 #define MM_PMC_SD0_SIZE             0x10000
 #define MM_PMC_BBRAM_CTRL           0xf11f0000
-- 
2.11.0


