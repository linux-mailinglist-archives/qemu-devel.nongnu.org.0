Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE1845B87D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 11:39:17 +0100 (CET)
Received: from localhost ([::1]:46378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mppgL-0003HH-3P
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 05:39:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mppKK-0002Fc-1B
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:16:32 -0500
Received: from mail-mw2nam12on2083.outbound.protection.outlook.com
 ([40.107.244.83]:33216 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mppKG-00032i-Tb
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:16:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mySFvyuDV/JuK0A7elyNilzNBYymn/fEr57P6ZvaL6zy1JE+gqI0MS2LlEjJ8dwtr/8EyQInSLOF2tcyTPy63xCO8sHX+6wndaxLIVzjl0QyZISStIee2eXB3QXg82scQB0vhwuZJ5jY9E4AFsMNIrf+94jqegyYDydUttBrJTCQbm+HC9BQ823FmL0jbZTtuxjVLTmM5GedpjucafD6fNw2QyHzzOLRRfQS1bPTqliQpGF8diFUMcQb3BvhMIY5EXxNKz7hafIWJr3ApOcDzfLTiP6aMiXxirC07QBU3pfQP3dyTHLWQEqUUUuOrvQe/k1fScQQIxG1+rod5hzGWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/hKrXNO/Yfbkhr4SOaNiwaKTBcTMy+YhUBRTq2vYY8=;
 b=l6y4LDJsQwCadEYl65O3HrIfOc2IYLY75i8uPrWRRLAY/WCFipBvHZrfv59sf2VU7JLyWHRQGqz1u8MZrQ2upN0Nx+6F/57nGoXitDVO0d2jfoPm5/mSVV9sSKrAiwLXrnqAFZ8qsdbUC/78cw1+MitBnv/hW8JnGNJca13CwZa4/yQbwx9Dx/IH+suojAByYhKcF6gURBDDQ2VdmOd32LHSRtbAph5q/AhkAUF4wrhbZjSQQWSo0HFgBNq6n/DtscslZyyNFZTAnGgOiPpGaS5+3MafU6zzXx9449iGIYezdkWHHfT8VtRm3Nv2ZZ7p5CxyqVAp5Iepaq/aW+7qjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/hKrXNO/Yfbkhr4SOaNiwaKTBcTMy+YhUBRTq2vYY8=;
 b=o0vJrHoG/enA4lFhLHd/tQW4XEIywGlSBfZyBag/qJ05W70Gxc6Ms3EjsgePsYYyaSJ2FEq7YdNZGNoMUJohYEBMPkPipNRyhLetOcCt3YQzVu3LVYGxAjMTCKoxP1qqnlNpq1cV0wU3Q2idT2lwcwPXYuYUQvm5h5h/xk7z3dg=
Received: from SN4PR0401CA0026.namprd04.prod.outlook.com
 (2603:10b6:803:2a::12) by MWHPR02MB3343.namprd02.prod.outlook.com
 (2603:10b6:301:63::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Wed, 24 Nov
 2021 10:16:25 +0000
Received: from SN1NAM02FT0038.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:2a:cafe::7b) by SN4PR0401CA0026.outlook.office365.com
 (2603:10b6:803:2a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.19 via Frontend
 Transport; Wed, 24 Nov 2021 10:16:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0038.mail.protection.outlook.com (10.97.5.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Wed, 24 Nov 2021 10:16:25 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 24 Nov 2021 02:16:11 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 24 Nov 2021 02:16:11 -0800
Received: from [10.23.121.192] (port=50645 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1mppJz-00036z-6S; Wed, 24 Nov 2021 02:16:11 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 07/10] hw/arm/xlnx-versal: Connect the OSPI flash memory
 controller model
Date: Wed, 24 Nov 2021 10:15:52 +0000
Message-ID: <20211124101555.1410-8-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211124101555.1410-1-francisco.iglesias@xilinx.com>
References: <20211124101555.1410-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a2742f0-6268-44a2-a43a-08d9af3378fb
X-MS-TrafficTypeDiagnostic: MWHPR02MB3343:
X-Microsoft-Antispam-PRVS: <MWHPR02MB3343D0D4C4396E6AE0FF37F1AD619@MWHPR02MB3343.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:403;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9A6twYUAjGLypbjutr4eYIImIsUS0f5C0F1Mp5z4BMnH5IXh3W7PxOH2oG7qNewiNYa8ahHHWSN/J+W349nUuRdxOa5S2tSMfl5y8IoCu/dqG6zus/SyojcTeVdj2V+5ejSa7CjZG1CXPDRYgtXv3Seudl0l14rG02oLaVfxq/6vNf11JzwQqow1QiZjnOiXF75PyU3Ng+Hdwuowwa1eZh+XAE5e44ptZklkks22qvH/7xPeheg6FadAbRWnE6qegj5EArsByhigGiRXKRZmlj2DaBS1Ao/hzvwlwSqViawLK3yCuwMRQDbw5WmHI5TCMPkgWw1oWZnCHBf5uh24vmCuV8Ps0MUo9QT8r2aXMfeX4uRnl3Zho2harjcr/m08SqgpZN+0v7VQw93mx1DldcGAlP0ssb5tcQMhUL5RqQEnnkMhAHPDDUsYdVKhkl1Hf/ejI/gVtcvLt2kecgGk1c/DL1jsT+R0sCwJj7rQ5RzabKOc4cXWCWwhqjBMsbClHON+oVBs7lQHjg/TM6zB0y7SHHG4Y/s972rW7i4TarMUZ6RFqXxKXQ/1LS3TxstfikISvg1pfUXOVavp5HF7evNE11a1fDzZ4csmTffphJ/OAK1Aan99dEXL4OzCJqPjj431mHywKQ9em/cL5FrME4c9U7CkDCD4A7CynfFutmWxEQ09AV3pzbQ/iSR71VDCUqNgNlo++pkL0kuiEtt7hBjdkBiPC7TTWTNtsU+ah0M=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(36840700001)(46966006)(36756003)(26005)(2906002)(82310400004)(356005)(186003)(2616005)(7696005)(6666004)(6916009)(9786002)(44832011)(70586007)(54906003)(336012)(70206006)(426003)(316002)(47076005)(8936002)(1076003)(7636003)(8676002)(508600001)(36860700001)(4326008)(5660300002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 10:16:25.6796 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a2742f0-6268-44a2-a43a-08d9af3378fb
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0038.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB3343
Received-SPF: pass client-ip=40.107.244.83; envelope-from=figlesia@xilinx.com;
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

Connect the OSPI flash memory controller model (including the source and
destination DMA).

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/arm/xlnx-versal.c         | 87 ++++++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/xlnx-versal.h | 20 ++++++++++
 2 files changed, 107 insertions(+)

diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index 08e250945f..20c82bff01 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -24,6 +24,7 @@
 
 #define XLNX_VERSAL_ACPU_TYPE ARM_CPU_TYPE_NAME("cortex-a72")
 #define GEM_REVISION        0x40070106
+#define NUM_OSPI_IRQ_LINES 3
 
 static void versal_create_apu_cpus(Versal *s)
 {
@@ -385,6 +386,91 @@ static void versal_create_pmc_iou_slcr(Versal *s, qemu_irq *pic)
     sysbus_connect_irq(sbd, 0, pic[VERSAL_PMC_IOU_SLCR_IRQ]);
 }
 
+static void versal_create_ospi(Versal *s, qemu_irq *pic)
+{
+    SysBusDevice *sbd;
+    MemoryRegion *mr_dac;
+
+    memory_region_init(&s->pmc.iou.ospi.linear_mr, OBJECT(s),
+                       "versal-ospi-linear-mr" , MM_PMC_OSPI_DAC_SIZE);
+
+    object_initialize_child(OBJECT(s), "versal-ospi", &s->pmc.iou.ospi.ospi,
+                            TYPE_XILINX_VERSAL_OSPI);
+
+    mr_dac = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->pmc.iou.ospi.ospi), 1);
+    memory_region_add_subregion(&s->pmc.iou.ospi.linear_mr, 0x0, mr_dac);
+
+    /* Create the OSPI destination DMA */
+    object_initialize_child(OBJECT(s), "versal-ospi-dma-dst",
+                            &s->pmc.iou.ospi.dma_dst,
+                            TYPE_XLNX_CSU_DMA);
+
+    object_property_set_link(OBJECT(&s->pmc.iou.ospi.dma_dst),
+                            "dma", OBJECT(get_system_memory()),
+                             &error_abort);
+
+    sbd = SYS_BUS_DEVICE(&s->pmc.iou.ospi.dma_dst);
+    sysbus_realize(sbd, &error_fatal);
+
+    memory_region_add_subregion(&s->mr_ps, MM_PMC_OSPI_DMA_DST,
+                                sysbus_mmio_get_region(sbd, 0));
+
+    /* Create the OSPI source DMA */
+    object_initialize_child(OBJECT(s), "versal-ospi-dma-src",
+                            &s->pmc.iou.ospi.dma_src,
+                            TYPE_XLNX_CSU_DMA);
+
+    object_property_set_bool(OBJECT(&s->pmc.iou.ospi.dma_src), "is-dst",
+                             false, &error_abort);
+
+    object_property_set_link(OBJECT(&s->pmc.iou.ospi.dma_src),
+                            "dma", OBJECT(mr_dac), &error_abort);
+
+    object_property_set_link(OBJECT(&s->pmc.iou.ospi.dma_src),
+                            "stream-connected-dma",
+                             OBJECT(&s->pmc.iou.ospi.dma_dst),
+                             &error_abort);
+
+    sbd = SYS_BUS_DEVICE(&s->pmc.iou.ospi.dma_src);
+    sysbus_realize(sbd, &error_fatal);
+
+    memory_region_add_subregion(&s->mr_ps, MM_PMC_OSPI_DMA_SRC,
+                                sysbus_mmio_get_region(sbd, 0));
+
+    /* Realize the OSPI */
+    object_property_set_link(OBJECT(&s->pmc.iou.ospi.ospi), "dma-src",
+                             OBJECT(&s->pmc.iou.ospi.dma_src), &error_abort);
+
+    sbd = SYS_BUS_DEVICE(&s->pmc.iou.ospi.ospi);
+    sysbus_realize(sbd, &error_fatal);
+
+    memory_region_add_subregion(&s->mr_ps, MM_PMC_OSPI,
+                                sysbus_mmio_get_region(sbd, 0));
+
+    memory_region_add_subregion(&s->mr_ps, MM_PMC_OSPI_DAC,
+                                &s->pmc.iou.ospi.linear_mr);
+
+    /* ospi_mux_sel */
+    qdev_connect_gpio_out(DEVICE(&s->pmc.iou.slcr), 3,
+                          qdev_get_gpio_in(DEVICE(&s->pmc.iou.ospi.ospi), 0));
+
+    /* OSPI irq */
+    object_initialize_child(OBJECT(s), "ospi-irq",
+                            &s->pmc.iou.ospi.irq, TYPE_OR_IRQ);
+    object_property_set_int(OBJECT(&s->pmc.iou.ospi.irq),
+                            "num-lines", NUM_OSPI_IRQ_LINES, &error_fatal);
+    qdev_realize(DEVICE(&s->pmc.iou.ospi.irq), NULL, &error_fatal);
+
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->pmc.iou.ospi.ospi), 0,
+                       qdev_get_gpio_in(DEVICE(&s->pmc.iou.ospi.irq), 0));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->pmc.iou.ospi.dma_src), 0,
+                       qdev_get_gpio_in(DEVICE(&s->pmc.iou.ospi.irq), 1));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->pmc.iou.ospi.dma_dst), 0,
+                       qdev_get_gpio_in(DEVICE(&s->pmc.iou.ospi.irq), 2));
+
+    qdev_connect_gpio_out(DEVICE(&s->pmc.iou.ospi.irq), 0,
+                          pic[VERSAL_OSPI_IRQ]);
+}
 
 /* This takes the board allocated linear DDR memory and creates aliases
  * for each split DDR range/aperture on the Versal address map.
@@ -477,6 +563,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
     versal_create_bbram(s, pic);
     versal_create_efuse(s, pic);
     versal_create_pmc_iou_slcr(s, pic);
+    versal_create_ospi(s, pic);
     versal_map_ddr(s);
     versal_unimp(s);
 
diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index 729c093dfc..d5c9c3900b 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -26,6 +26,8 @@
 #include "hw/misc/xlnx-versal-xramc.h"
 #include "hw/nvram/xlnx-bbram.h"
 #include "hw/nvram/xlnx-versal-efuse.h"
+#include "hw/ssi/xlnx-versal-ospi.h"
+#include "hw/dma/xlnx_csu_dma.h"
 #include "hw/misc/xlnx-versal-pmc-iou-slcr.h"
 
 #define TYPE_XLNX_VERSAL "xlnx-versal"
@@ -80,6 +82,14 @@ struct Versal {
         struct {
             SDHCIState sd[XLNX_VERSAL_NR_SDS];
             XlnxVersalPmcIouSlcr slcr;
+
+            struct {
+                XlnxVersalOspi ospi;
+                XlnxCSUDMA dma_src;
+                XlnxCSUDMA dma_dst;
+                MemoryRegion linear_mr;
+                qemu_or_irq irq;
+            } ospi;
         } iou;
 
         XlnxZynqMPRTC rtc;
@@ -116,6 +126,7 @@ struct Versal {
 #define VERSAL_BBRAM_APB_IRQ_0     121
 #define VERSAL_RTC_APB_ERR_IRQ     121
 #define VERSAL_PMC_IOU_SLCR_IRQ    121
+#define VERSAL_OSPI_IRQ            124
 #define VERSAL_SD0_IRQ_0           126
 #define VERSAL_EFUSE_IRQ           139
 #define VERSAL_RTC_ALARM_IRQ       142
@@ -184,6 +195,15 @@ struct Versal {
 #define MM_PMC_PMC_IOU_SLCR         0xf1060000
 #define MM_PMC_PMC_IOU_SLCR_SIZE    0x10000
 
+#define MM_PMC_OSPI                 0xf1010000
+#define MM_PMC_OSPI_SIZE            0x10000
+
+#define MM_PMC_OSPI_DAC             0xc0000000
+#define MM_PMC_OSPI_DAC_SIZE        0x20000000
+
+#define MM_PMC_OSPI_DMA_DST         0xf1011800
+#define MM_PMC_OSPI_DMA_SRC         0xf1011000
+
 #define MM_PMC_SD0                  0xf1040000U
 #define MM_PMC_SD0_SIZE             0x10000
 #define MM_PMC_BBRAM_CTRL           0xf11f0000
-- 
2.11.0


