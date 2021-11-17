Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0478B4548AC
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 15:25:56 +0100 (CET)
Received: from localhost ([::1]:52088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnLsp-0005CP-5J
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 09:25:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mnLmT-0000fH-E3
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 09:19:21 -0500
Received: from mail-co1nam11on2089.outbound.protection.outlook.com
 ([40.107.220.89]:1591 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mnLmR-0004Yp-73
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 09:19:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ShjfqHCIhIpYUPVBf3lyVc32ih7QoM39ZdfwaaKEpH1YA06dDxNBqBDXmbQtkCuJ56CZShEB6SRSoznYdk9FKoDM8TEm+njYWnCiINSfCx8mbjVyM/GkjAX1KDcl20ZEUG6IGwf7wyUPWeRT0kmwsqcrU5nVCcRPii5pgj+trUUScF67FT1KpKc57s5/QnMPJ1KvYft1cbUK8ALpI0P96IzAoBSt56OjnDDppH2vcdB5MnH1hI2xsvWvOG7NMo4kd9cPJKT6RN/WealPCrb+PtvKQ2Ib8T9D1GNF0jrHQ7F+FQjYqncshQngIdO+Iqgm3If2SVrcV43oAYFTB68D1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uaoCgJZhIqrD1VihSMCVsMalxL7VOi+THTxQ10lTBy0=;
 b=Oi81NWwg1JcvqRPTjSsKI4pCZDq7+KAR4PxJMsLghGh88qpNXOpB1WYGFDA6Mwpy6rNDLqEj5Zop7tJLS6stT1xZmvRRRdIOsLTUnxlCaRo4KgWnMoYABmVHAmSBa7JlHzJ4hPNu34cDT8S6cPuVA1KE84Y6DZavhYFI7gTR3vZU3nqTnSr4uUKOU985GDwH9PdHKOHdp0wPof1taLcIkTuJi0rMF3v+3hKEfczcHqGxSj8ASBw0nA3HQsgFI2leHTuqOLeLAkYfOGWIkNZD1s/30D5yERRL38KLGHSzDrhSr2LkhDjMATrzs1g4XgXBkI9NQLbWNILmkMQA6Rqaag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uaoCgJZhIqrD1VihSMCVsMalxL7VOi+THTxQ10lTBy0=;
 b=QKnPUfsKFaO5Nr96a84GbHpIAsnP66Qt7kyy8Rkr0zz9Bi+jEWCJlgppCW+vnuTd47o9TdOsLFaBn2AmnUOhX2tYVNxsLFZQ7puOhNyCVPe+2OQaONCpBbZxLV4ytqaWRUs0FSEdiXbxthYqlr3qwUq5Ezj/BZ5/6/wQrdCBHLE=
Received: from BN9PR03CA0790.namprd03.prod.outlook.com (2603:10b6:408:13f::15)
 by DM6PR02MB5291.namprd02.prod.outlook.com (2603:10b6:5:45::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Wed, 17 Nov
 2021 14:19:16 +0000
Received: from BN1NAM02FT048.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:13f:cafe::4a) by BN9PR03CA0790.outlook.office365.com
 (2603:10b6:408:13f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Wed, 17 Nov 2021 14:19:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT048.mail.protection.outlook.com (10.13.2.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.19 via Frontend Transport; Wed, 17 Nov 2021 14:19:15 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 17 Nov 2021 06:18:55 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 17 Nov 2021 06:18:55 -0800
Received: from [10.23.121.164] (port=52602 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1mnLm3-000Dy8-MG; Wed, 17 Nov 2021 06:18:55 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v1 7/9] hw/arm/xlnx-versal: Connect the OSPI flash memory
 controller model
Date: Wed, 17 Nov 2021 14:18:39 +0000
Message-ID: <20211117141841.4696-8-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211117141841.4696-1-francisco.iglesias@xilinx.com>
References: <20211117141841.4696-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c329c3b3-a3c9-4efd-d980-08d9a9d53cab
X-MS-TrafficTypeDiagnostic: DM6PR02MB5291:
X-Microsoft-Antispam-PRVS: <DM6PR02MB5291969D3590C596A8BFF106AD9A9@DM6PR02MB5291.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:403;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /L3p6/IlZc+r2B0VbDSWIKDoXRMDBvpRKN+HOXpfNiuFHFmQ0Uwx8LGizuMA5c0awh3etWK7NBx57XG4aeD9A2SPgk9wcuRmPdwHk6t2dWtb9dq47bUuKIOd/IQSeYWURNC6+xUarFKL+E81AFVuIulzf4gwjig0WkD0iG7kexjy1axUrNwaX95fdfmi70eRTvuH2zX8jPH+0/nAZpQyfzwaR/3s6liC5Sz4vmYhUSu7KvRImzPcG0aNGyNlZ/tB6bAKEeAUJJASjhmGT9Ex1TFdqPpUQZlbN5ybw5TgDIxxLsEVWCtSzgdXK+Ggfxo+jS+GqJ2lyT+uJ1F3FoAeXUoH3x3jIf6hp7/mzHwoan0refvObsr/AWjzz+YxYpANAGD/UxQUpJxBikSUfvaT5UnlUrKtu4jRTnWTZNBJXqgFg608M7iSBM6clbgQiCoFyWse4khX6egTozEP7H1GKifFYurC9jYWZZ6MedgodtuJhRuH4rWvYBS1Ea+VK+Ekaa92rf9MH6KF2b01vZz2gXiGIqQXO3aa+CxoZ5lwXGJBA1GIRRDk2NDLyNUz6CcarBPDKQcMbmbgBTVjuMHqcjbiQOXexw0wwPj87RyzM2gHHHYa2h4B58DzGpCgg+MHzefU+yZVYnVB11kkaXuy8wxSrb1nZzex81tpqPKkReM0brDewjvSzzW9pK+rIBb8q1CpN7BfevIPzmbvTqOKyEaygCM0zcp8HX2PLV27zhI=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(46966006)(36840700001)(426003)(4326008)(336012)(5660300002)(47076005)(36756003)(44832011)(6916009)(36860700001)(8936002)(2906002)(26005)(7696005)(36906005)(70206006)(70586007)(82310400003)(356005)(8676002)(2616005)(9786002)(508600001)(6666004)(1076003)(316002)(54906003)(7636003)(186003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 14:19:15.9170 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c329c3b3-a3c9-4efd-d980-08d9a9d53cab
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT048.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5291
Received-SPF: pass client-ip=40.107.220.89; envelope-from=figlesia@xilinx.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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
Cc: edgar.iglesias@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, peter.maydell@linaro.org, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Connect the OSPI flash memory controller model (including the source and
destination DMA).

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
---
 hw/arm/xlnx-versal.c         | 89 ++++++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/xlnx-versal.h | 18 +++++++++
 2 files changed, 107 insertions(+)

diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index 08e250945f..f8e94a50fd 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -24,6 +24,7 @@
 
 #define XLNX_VERSAL_ACPU_TYPE ARM_CPU_TYPE_NAME("cortex-a72")
 #define GEM_REVISION        0x40070106
+#define NUM_OSPI_IRQ_LINES 3
 
 static void versal_create_apu_cpus(Versal *s)
 {
@@ -385,6 +386,93 @@ static void versal_create_pmc_iou_slcr(Versal *s, qemu_irq *pic)
     sysbus_connect_irq(sbd, 0, pic[VERSAL_PMC_IOU_SLCR_IRQ]);
 }
 
+static void versal_create_ospi(Versal *s, qemu_irq *pic)
+{
+    SysBusDevice *sbd;
+    MemoryRegion *mr_dac;
+
+    memory_region_init(&s->pmc.iou.lospi_mr, OBJECT(s),
+                       "versal-lospi_mr" , MM_PMC_OSPI_DAC_SIZE);
+
+    object_initialize_child(OBJECT(s), "versal-ospi", &s->pmc.iou.ospi,
+                            TYPE_XILINX_VERSAL_OSPI);
+
+    mr_dac = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->pmc.iou.ospi), 1);
+    memory_region_add_subregion(&s->pmc.iou.lospi_mr, 0x0, mr_dac);
+
+    /* Create the OSPI destination DMA */
+    object_initialize_child(OBJECT(s), "versal-ospi-dma-dst",
+                            &s->pmc.iou.ospi_dma_dst,
+                            TYPE_XLNX_CSU_DMA);
+
+    object_property_set_link(OBJECT(&s->pmc.iou.ospi_dma_dst),
+                            "dma", OBJECT(get_system_memory()),
+                             &error_abort);
+
+    sbd = SYS_BUS_DEVICE(&s->pmc.iou.ospi_dma_dst);
+    sysbus_realize(sbd, &error_fatal);
+
+    memory_region_add_subregion(&s->mr_ps, MM_PMC_OSPI_DMA_DST,
+        sysbus_mmio_get_region(sbd, 0));
+
+    sysbus_connect_irq(SYS_BUS_DEVICE(sbd), 0, pic[VERSAL_OSPI_IRQ]);
+
+    /* Create the OSPI source DMA */
+    object_initialize_child(OBJECT(s), "versal-ospi-dma-src",
+                            &s->pmc.iou.ospi_dma_src,
+                            TYPE_XLNX_CSU_DMA);
+
+    object_property_set_bool(OBJECT(&s->pmc.iou.ospi_dma_src), "is-dst",
+                             false, &error_abort);
+
+    object_property_set_link(OBJECT(&s->pmc.iou.ospi_dma_src),
+                            "dma", OBJECT(mr_dac), &error_abort);
+
+    object_property_set_link(OBJECT(&s->pmc.iou.ospi_dma_src),
+                            "stream-connected-dma",
+                             OBJECT(&s->pmc.iou.ospi_dma_dst),
+                             &error_abort);
+
+    sbd = SYS_BUS_DEVICE(&s->pmc.iou.ospi_dma_src);
+    sysbus_realize(sbd, &error_fatal);
+
+    memory_region_add_subregion(&s->mr_ps, MM_PMC_OSPI_DMA_SRC,
+        sysbus_mmio_get_region(sbd, 0));
+
+    /* Create the OSPI */
+    object_property_set_link(OBJECT(&s->pmc.iou.ospi), "dma-src",
+                             OBJECT(&s->pmc.iou.ospi_dma_src), &error_abort);
+
+    sbd = SYS_BUS_DEVICE(&s->pmc.iou.ospi);
+    sysbus_realize(sbd, &error_fatal);
+
+    memory_region_add_subregion(&s->mr_ps, MM_PMC_OSPI,
+        sysbus_mmio_get_region(sbd, 0));
+
+    memory_region_add_subregion(&s->mr_ps, MM_PMC_OSPI_DAC,
+                                &s->pmc.iou.lospi_mr);
+
+    /* ospi_mux_sel */
+    qdev_connect_gpio_out(DEVICE(&s->pmc.iou.slcr), 3,
+                          qdev_get_gpio_in(DEVICE(&s->pmc.iou.ospi), 0));
+
+    /* OSPI irq */
+    object_initialize_child(OBJECT(s), "ospi-irq",
+                            &s->pmc.iou.ospi_irq, TYPE_OR_IRQ);
+    object_property_set_int(OBJECT(&s->pmc.iou.ospi_irq),
+                            "num-lines", NUM_OSPI_IRQ_LINES, &error_fatal);
+    qdev_realize(DEVICE(&s->pmc.iou.ospi_irq), NULL, &error_fatal);
+
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->pmc.iou.ospi), 0,
+                       qdev_get_gpio_in(DEVICE(&s->pmc.iou.ospi_irq), 0));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->pmc.iou.ospi_dma_src), 0,
+                       qdev_get_gpio_in(DEVICE(&s->pmc.iou.ospi_irq), 1));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->pmc.iou.ospi_dma_dst), 0,
+                       qdev_get_gpio_in(DEVICE(&s->pmc.iou.ospi_irq), 2));
+
+    qdev_connect_gpio_out(DEVICE(&s->pmc.iou.ospi_irq), 0,
+                          pic[VERSAL_OSPI_IRQ]);
+}
 
 /* This takes the board allocated linear DDR memory and creates aliases
  * for each split DDR range/aperture on the Versal address map.
@@ -477,6 +565,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
     versal_create_bbram(s, pic);
     versal_create_efuse(s, pic);
     versal_create_pmc_iou_slcr(s, pic);
+    versal_create_ospi(s, pic);
     versal_map_ddr(s);
     versal_unimp(s);
 
diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index 729c093dfc..dae15db352 100644
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
@@ -80,6 +82,12 @@ struct Versal {
         struct {
             SDHCIState sd[XLNX_VERSAL_NR_SDS];
             XlnxVersalPmcIouSlcr slcr;
+
+            XlnxVersalOspi ospi;
+            XlnxCSUDMA ospi_dma_src;
+            XlnxCSUDMA ospi_dma_dst;
+            MemoryRegion lospi_mr;
+            qemu_or_irq ospi_irq;
         } iou;
 
         XlnxZynqMPRTC rtc;
@@ -116,6 +124,7 @@ struct Versal {
 #define VERSAL_BBRAM_APB_IRQ_0     121
 #define VERSAL_RTC_APB_ERR_IRQ     121
 #define VERSAL_PMC_IOU_SLCR_IRQ    121
+#define VERSAL_OSPI_IRQ            124
 #define VERSAL_SD0_IRQ_0           126
 #define VERSAL_EFUSE_IRQ           139
 #define VERSAL_RTC_ALARM_IRQ       142
@@ -184,6 +193,15 @@ struct Versal {
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


