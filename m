Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DFA474141
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 12:14:52 +0100 (CET)
Received: from localhost ([::1]:35412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx5lj-0002b6-Ve
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 06:14:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mx5ba-0007jC-Li
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 06:04:26 -0500
Received: from mail-mw2nam12on2074.outbound.protection.outlook.com
 ([40.107.244.74]:8896 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mx5bY-00070y-DU
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 06:04:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ErF37sciyoml8ljLg9fkrLC03tTLI9tArHpoa3mKrovqI5xhKZkHI/mLGxoOqLeCXE3Jq2rz1mCBMYmtK0pek5e74U8J0JJiMdOd55i0DLjL7aSVO5rKb9w3ZXTqQMEueQXCwHTEyDsnuTIn7eGaPQz6q3fVYYxr3D501zoeVOcFZYDZvcggMDhnUCAKsztux4A771UwFVqNul6NgbzAtkTnK4UN3KdcXa/FzrG1YPJQiBaFbEfKPvKUOKIHWV9ei7BDCMNZlk0prRqSJEbFi4f6K6mKrfUaAhZ77v4nC6LRn6rYDYK9XPBjZJrPL7B877AFjZh38tlRKi12mFR9mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q7nRtyuxR3wBkljsjqDSXRpXx5/qC13X16VLNLvNT90=;
 b=jIikU1pL6C2YkZsacxfL5/fia4TIUE7i5t3nHHtHgY/ij2JT6hqCt6I1Rsb7eilQ4epttFjvjpaSAPC+UL67j6z0DQnU4m7qSWR9LkuguAk8LkrubQ3CIWyIzONZ2LbPW6rz94DN3of7kKt3wDLrdyoI6oH2GyE3vWxiuxmg409xnkEzlD5b09r2o5kaqPas5o1OcXTDO46FEw8A83ksf87luVzouzK0JxR4iOK5qcOlqXn6xJ+gyulHoAXy8cf+/ovWkLdeNOMIj2DbG5QUrUvTR6lPpDhV/nMheyJ7QcbH7eV5dny7aCEmYh8uDm/h7Hko/cqytpmcfro2qJbWFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q7nRtyuxR3wBkljsjqDSXRpXx5/qC13X16VLNLvNT90=;
 b=lnply4JviruHBtQwY+D/nIot716ExHPFd/5T1eOlIOMv2/U+xPyFxICu8PtfYxxh2KFpfgxVnShvlBclCozgYjSdqUttIaPcoFs0rE7y9w88wSRSv5clWrV3KXMk4+UgZUtm0Tt/YlLFvkJ0ee8mHltqwtgYJg9bANFbFgWRi04=
Received: from DS7PR03CA0167.namprd03.prod.outlook.com (2603:10b6:5:3b2::22)
 by SJ0PR02MB7501.namprd02.prod.outlook.com (2603:10b6:a03:2a1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 11:04:16 +0000
Received: from DM3NAM02FT061.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:3b2:cafe::8d) by DS7PR03CA0167.outlook.office365.com
 (2603:10b6:5:3b2::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16 via Frontend
 Transport; Tue, 14 Dec 2021 11:04:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT061.mail.protection.outlook.com (10.13.4.230) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.12 via Frontend Transport; Tue, 14 Dec 2021 11:04:16 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 14 Dec 2021 03:04:02 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 14 Dec 2021 03:04:02 -0800
Received: from [10.23.120.191] (port=54391 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1mx5bG-000F5K-IR; Tue, 14 Dec 2021 03:04:02 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v5 03/12] hw/arm/xlnx-versal: Connect Versal's PMC SLCR
Date: Tue, 14 Dec 2021 11:03:45 +0000
Message-ID: <20211214110354.21816-4-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211214110354.21816-1-francisco.iglesias@xilinx.com>
References: <20211214110354.21816-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ebf1c9c-1abe-40b3-665f-08d9bef1783b
X-MS-TrafficTypeDiagnostic: SJ0PR02MB7501:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR02MB750168580FB6B4373B18CD2BAD759@SJ0PR02MB7501.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:462;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sh0hqHxSABZi+NFNDmIZOEK2nsafpv+o1UBAJGOKMguHjfAM0tcTG5NHkSHwkK5lrDAR8wnPy/yUCX3046L9yRKHgVdso9krrkkB7WcNm4w6ubLCAy2/bGX9MM2DGc32UeeZB62WhiiPRn9NiKI2s56UFQ5+uYWV1x7DdUEw01KcB+7G7hka9NCfl7A3C5iK4xJ3v6sZK3gmH2ULvGk/SP/k3T4pS3eHmFl1ikG8nG7JTsg72hFxae2bvy7YOVAtLG3g128HtFsXvlCC29A5FktcCl8e9f/Hj1rFnBpbYfW+Ny1+YHSpFliQ+S7cUTrvCqWubKI53EZY2aKjLfJlug+A3ugiNcI5fLTqV5FvKbc+qMf48Gvo5HHTb+lyTXPIA00ZnV5HD1c60BwGxD9gpCKKUfWHlOLP+83szEhGW+82+zTYbcOFFjhysN6XkB5CDyfKobGaMPzyopmybxgARYMqMDzO1prd4ekCx6/uV1+uXPCAZe6+50mXTKnEsQwkfRfsQOUrK034y6OePqcMxFozKuh236w0Paeyffc7ryYrJW0Xrm/+wTsDKce4rLQqTXZBHN2uZyHf/a/nToElXWICVZspaLSO2kQQteOHubGkEAV8pJVr/UOmR2nhWUeU7erD/LaRZtuJBLsqKUDOW+1DdazicB/pIL9luDmPRrqD0oxaL/F7VhI9xRRdC9/zXKhw4lzD0/I3cVJtl4hS7XAVW2JKHn6zMlGnneRrJOU=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(36840700001)(46966006)(316002)(47076005)(8936002)(2906002)(82310400004)(8676002)(83380400001)(5660300002)(44832011)(336012)(356005)(6916009)(426003)(36756003)(9786002)(4326008)(70206006)(2616005)(186003)(7696005)(1076003)(70586007)(6666004)(508600001)(7636003)(36860700001)(26005)(54906003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 11:04:16.2252 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ebf1c9c-1abe-40b3-665f-08d9bef1783b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT061.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7501
Received-SPF: pass client-ip=40.107.244.74; envelope-from=figlesia@xilinx.com;
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
index fefd00b57c..753dc6159b 100644
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
+                  "controller %d is not yet unimplemented\n", n);
+}
+
+static void versal_unimp_qspi_ospi_mux_sel(void *opaque, int n, int level)
+{
+    qemu_log_mask(LOG_UNIMP,
+                  "Selecting between enabling the QSPI or OSPI linear address "
+                  "region is not yet unimplemented\n");
+}
+
+static void versal_unimp_irq_parity_imr(void *opaque, int n, int level)
+{
+    qemu_log_mask(LOG_UNIMP,
+                  "PMC SLCR parity interrupt behaviour "
+                  "is not yet unimplemented\n");
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


