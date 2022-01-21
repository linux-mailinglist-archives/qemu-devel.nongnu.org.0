Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF76C4962AA
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 17:15:51 +0100 (CET)
Received: from localhost ([::1]:51258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAwZq-000809-U2
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 11:15:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1nAwWS-0005Sw-6f
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 11:12:20 -0500
Received: from mail-mw2nam12on2065.outbound.protection.outlook.com
 ([40.107.244.65]:21568 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1nAwWQ-00068L-0E
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 11:12:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RTMUk8tdx4Puie2J0Bc2GFCo66NVAa/ixwUnX2F7Ncuw8cSVfSEvkufrAOzoBY8OBHjr9ETQoL0dHRBVFC4S7SdQD0PvZXE9EfPZR9f4rM85jPBpi8MocTMlrCO6hR5Mw/Z1eFAe++zAHrT8g74PLp3iFvFVptLYnslkEWmfxzOxVKSYz7YISM7NfIhg1Ssc5HzmibT8yG4Cf4ggd59ZK9vUQQeCfH+Pq5S6oGa083buz9tKiQ8aZd1m5gqzNQxW9Ef5I+vhoBg3B2TGvNkSJKhGcoWh9HBBBSiVRAlkPMaxCxypS1fz/swMzWiVFc0JYEk7egGFgvhHhjJv3ndmhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5w7EXF2ELMypq/v1pCQ/8kfl/RVgvl7WRs9pW7TF9D0=;
 b=NFj/TibRwX/t6HRbJKDrWC8FipJzPhoeKbstZp0+pSq1N2/cqQBuFUhoEH0hlW3tNVx86TLNdSpQmsXPTBTgt+8a5LRzdboaQtQUOi2cSjlOD1YLsmJ3AIYWROu7B6JhkCKAOo5p9ceIqruq/HrHGnF+Lem8qRes3wHTjzRTyLjvgfSrb7fQ7idf85OEfU8wcqew57+MN9uyE1OZRsUImd2B4RHh0EMgqv2/NQr9zsJXAmAbrCpQpDUi4OoCo5YHwGtXnzJgmx0TlEFYurvJxIYyZy5WoVWEjuqNaQSQZ/jcklkR45e8Jq2ukIAKR6+7Au0DJ73OUAaZztaA2w4/+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5w7EXF2ELMypq/v1pCQ/8kfl/RVgvl7WRs9pW7TF9D0=;
 b=K5/Rpi2JfijNLnt36qaJ5JBPQuGPjcWnPejczSpep37G4emBS4qQc94qweqCsfV0DXIFgpdXicEwrOSQBlsyFMSt+oZpj19pWzwMSke+8+tvQnzvZdvo+UKpYtYu8cA4yT0xhlqE28v1d+bva0f3ho3dv3e8j9kK5EiG2OwShHw=
Received: from DS7PR03CA0085.namprd03.prod.outlook.com (2603:10b6:5:3bb::30)
 by MW4PR02MB7315.namprd02.prod.outlook.com (2603:10b6:303:77::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Fri, 21 Jan
 2022 16:12:15 +0000
Received: from DM3NAM02FT062.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:3bb:cafe::7a) by DS7PR03CA0085.outlook.office365.com
 (2603:10b6:5:3bb::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7 via Frontend
 Transport; Fri, 21 Jan 2022 16:12:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT062.mail.protection.outlook.com (10.13.5.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.8 via Frontend Transport; Fri, 21 Jan 2022 16:12:15 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 21 Jan 2022 08:11:50 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 21 Jan 2022 08:11:50 -0800
Received: from [10.23.121.133] (port=62231 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1nAwVy-0002nH-Co; Fri, 21 Jan 2022 08:11:50 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v7 03/10] hw/arm/xlnx-versal: Connect Versal's PMC SLCR
Date: Fri, 21 Jan 2022 16:11:34 +0000
Message-ID: <20220121161141.14389-4-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220121161141.14389-1-francisco.iglesias@xilinx.com>
References: <20220121161141.14389-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71b53384-d9b6-42d4-d8eb-08d9dcf8ca47
X-MS-TrafficTypeDiagnostic: MW4PR02MB7315:EE_
X-Microsoft-Antispam-PRVS: <MW4PR02MB7315C087E83EC6703B78DE20AD5B9@MW4PR02MB7315.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:462;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VAwbdSeuoty0q4Aeq0eZJv+MrRxSho/Ytcxk9HeqroPJfZr/xfhRj+we93jM+QFp2Wd1RKDjluRjR7UMtn5GEtdFYpe4nKpUQ/VxOuwsklLSdYlN7N3EP2JaIgra751rcc1+lbHXipBLdCvhhkEGvuHCZ3HbSkBuWjtgW1eFJ0zMKODxSnWbYbxh6VjbfpItXf3MikdaHz3Uw725YZWVdQ5INCcJim06j5MWG8ZAl+nEvsDCXghMXj7NiIF1EggyywrDLQi/a7Ua9wUW10b0OiiK1NKIbee5KwPU9Kryp2tuxVIHwBHWBLYxF3CZIrZ4HmfL+LS7Og/f97QH4kauQ76H6YBA4VDaTpEZPB4NUyrSFOvCC4Hm5NPY2SyMC5/R0JvuGMnD5FgUtmJu2XYT6+s+I0PVJxLS46os08G2PgjMj3/NOIaerYHzh5T8cQkvUfoyfvQKZgg+i52p7onHzP/sBSNU1/KSsONcwQDMH5lZXxUqXw96vTqr6kdhNcg6qp97VHKqmbQq45Kn8zEk62UnFVqNHbG/EgYSBOLyzMkotSN/c7U7tHHlb5OGcPXGEQQEoXqz81xsP2PJ98yFWpNzo0WpHKEyiZwb7LlAzYz7/lk1PC9gbr9Xa0d39JU7gnEQ3qDYnUYPa6eBO5xI6phcYuCsClFBGQuxNUVqLli+6M1jiRxQTtygpJCqSxbbVN4Uz1AlhcKGde4v8CWaT9DbDJtR+MIITdxoPk0XSYU=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(7636003)(8936002)(4326008)(356005)(6666004)(83380400001)(508600001)(426003)(336012)(47076005)(9786002)(36756003)(82310400004)(2616005)(54906003)(7696005)(36860700001)(70586007)(26005)(70206006)(186003)(1076003)(6916009)(44832011)(2906002)(5660300002)(8676002)(316002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 16:12:15.2404 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71b53384-d9b6-42d4-d8eb-08d9dcf8ca47
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT062.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7315
Received-SPF: pass client-ip=40.107.244.65; envelope-from=figlesia@xilinx.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 frasse.iglesias@gmail.com, alistair@alistair23.me, alistair23@gmail.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Connect Versal's PMC SLCR (system-level control registers) model.

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Reviewed-by: Luc Michel <luc@lmichel.fr>
---
 include/hw/arm/xlnx-versal.h |  5 ++++
 hw/arm/xlnx-versal.c         | 71 +++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 75 insertions(+), 1 deletion(-)

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
 
-- 
2.11.0


