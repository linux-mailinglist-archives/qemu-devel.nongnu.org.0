Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A58D848ED51
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 16:44:05 +0100 (CET)
Received: from localhost ([::1]:41140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8OkG-0005r4-Po
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 10:44:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1n8OVs-0002kg-NO
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:29:12 -0500
Received: from mail-dm6nam10on2051.outbound.protection.outlook.com
 ([40.107.93.51]:47166 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1n8OVq-0007X8-NR
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:29:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XqzdBvCXsMFMPP0tRcAiqCJfNy4rWt9627Y6Kh4Q7TAYMDw9vhGhH615imuAXg7aVRxWCGZRbxqmUhl5TTTHoPR+sNn2HBU89k2KW0KCBVGIgCsiIvcspa5U9nwvXVYMdorUdK8DKFW5Pd3THChzI2AsmmhJelkCdxBx4otr24/0AOhEXX12NOPMZIeFFDyFGS/j+/GmK3lXqhtt1gy1xpFxWdIUBpBSkcPyMNoDWgKQAZF1hVQn8jfDzyZsjhE+6sgTyad6XuPVoh/M3/7cy2mAMpVFN77YMCr7PazZzlxdjK8c9VoEjmekppWZqgDbD9xKDu+CI8uiJcQVAF1zWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+0TvUKxZjMTJ7OBbNT6W1WOFAtCgADIrUqDL4jX7qPo=;
 b=OSNMaiT22Sg7MIFO5kTFCKqDMV3fnG50Y7VdyzbfuDjI++1lEu/btFowASpWvdSWYQ9dd2zIv48JpBxyqAZwk+qJizC++RwYRX3hTCmQL56i/r2VdqqMk1ysnjNGO6yuc2uYHzoaPvd7I5HIm7cFSTa51EsL5VXE/GzBL8uN9dnrFDc8f7T8bhlifJckD9U99qasJRRc7qtfm+AHHcKGYlKM0J7YQrnJQboobmagE3qxDN/pcTT8peQ8v0HiS0xOWGANJDiX1QFEsUiI0KNXD6QsD8ImawvQgytrV3fe9nDnOofgoowGfyBVlJj3UC/y8jePkuIt2iX0QGFnYpdS9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+0TvUKxZjMTJ7OBbNT6W1WOFAtCgADIrUqDL4jX7qPo=;
 b=IRDl2j4XtachReNxCKLY9Yq5tHd5002A1U9UAjK3Rta3UiRYjberdHqRppPW560o1DlO5H4P4GjLowkz5pG0K5bmwCU0+nAe+TA58Lt8NEqxVCZxdpkX425f2C4YoZftvC2c/YY7W0yfhLrsSGS1dkgoivQsAKlJL6HsFnef1Pg=
Received: from BN0PR02CA0015.namprd02.prod.outlook.com (2603:10b6:408:e4::20)
 by CO6PR02MB7716.namprd02.prod.outlook.com (2603:10b6:303:b2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Fri, 14 Jan
 2022 15:29:01 +0000
Received: from BN1NAM02FT017.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:e4:cafe::84) by BN0PR02CA0015.outlook.office365.com
 (2603:10b6:408:e4::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9 via Frontend
 Transport; Fri, 14 Jan 2022 15:29:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT017.mail.protection.outlook.com (10.13.2.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4888.9 via Frontend Transport; Fri, 14 Jan 2022 15:29:01 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 14 Jan 2022 07:28:59 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 14 Jan 2022 07:28:59 -0800
Received: from [10.23.121.163] (port=49859 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1n8OVf-0004L4-NR; Fri, 14 Jan 2022 07:28:59 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v6 08/12] hw/arm/xlnx-versal: Connect the OSPI flash memory
 controller model
Date: Fri, 14 Jan 2022 15:28:37 +0000
Message-ID: <20220114152841.1740-9-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220114152841.1740-1-francisco.iglesias@xilinx.com>
References: <20220114152841.1740-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ffa16995-e723-45c1-b442-08d9d7729755
X-MS-TrafficTypeDiagnostic: CO6PR02MB7716:EE_
X-Microsoft-Antispam-PRVS: <CO6PR02MB7716D9BF66E5346AE06E8088AD549@CO6PR02MB7716.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:403;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TNY1mhlxJhd0IWo4A+mk+Om9IoV5C1lmnsfdsvTpwomyLSzqpHFxi2h/8jJxVmw2QPeFrSblKQOP1LyVBkXxTP880g7OWplitaLhjl3NxgIK9iGKnlvBkp62FRW68XJc4OvVyJWLXANDZ7i/XxO4etaCwTKksYbItNQYiYGoPjz4weu0nWKWWTdPg754JTTcnjW07IcC3SbIMJpb36XMuqB9sl0Ld7lKd9+FkVkr3P8fENdILYiFbtS34FJ3cHN3Z8BPlpRuFBBj90U1LX8GVy0QgktTH2JQIsSpZvXauLo2nM1lbaOYzOKbm+fv0xeBVxJtHcbYksYt1r0NAt7agctPwSX81wUj6Q6Pkp0Fpkhk9wQjrf03F/shgFs+//iB7IXxSG6gbSHkHpS+0AeTRf9CjQgK9YZvVyfnXtMth6D30UgIUREuQ0TCzWXYyVLAFEN5GpMsYubOGM5ZLKJId0mCyDzMUD/ZtzaL94oExEJLZakp8X0caInURYTp1FXoQTBOTX3eKWTr/XKMEnuq+XDRtQe3a2mJ08xYuaklSRRAQ8QZGhUy3IbD8sHrnfeCPBPTgQP+RZ4VHFDQ+JDiFuNHWSMiwQKOUPlI8/KMKZ/DuUrqLEzqFJogDsmtBpOliUmka3clpmGQl982ovjLdc93NZsTr2r/3vSIwO+mS7NR/QudlazPAb/Z2MqBvmrAhDlPuhPysevF64Ik6eX5uFXhXHb6WCA4o5YaZOmc+pc=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(336012)(47076005)(508600001)(7696005)(70586007)(4326008)(356005)(1076003)(186003)(36756003)(426003)(7636003)(54906003)(8676002)(2616005)(2906002)(6666004)(8936002)(26005)(5660300002)(9786002)(316002)(36860700001)(82310400004)(44832011)(70206006)(6916009)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 15:29:01.3449 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffa16995-e723-45c1-b442-08d9d7729755
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT017.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7716
Received-SPF: pass client-ip=40.107.93.51; envelope-from=figlesia@xilinx.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/xlnx-versal.c         | 93 ++++++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/xlnx-versal.h | 20 ++++++++++
 2 files changed, 113 insertions(+)

diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index c8c0c102c7..ab58bebfd2 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -28,6 +28,7 @@
 #define GEM_REVISION        0x40070106
 
 #define VERSAL_NUM_PMC_APB_IRQS 3
+#define NUM_OSPI_IRQ_LINES 3
 
 static void versal_create_apu_cpus(Versal *s)
 {
@@ -412,6 +413,97 @@ static void versal_create_pmc_iou_slcr(Versal *s, qemu_irq *pic)
                        qdev_get_gpio_in(DEVICE(&s->pmc.apb_irq_orgate), 2));
 }
 
+static void versal_create_ospi(Versal *s, qemu_irq *pic)
+{
+    SysBusDevice *sbd;
+    MemoryRegion *mr_dac;
+    qemu_irq ospi_mux_sel;
+    DeviceState *orgate;
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
+    ospi_mux_sel = qdev_get_gpio_in_named(DEVICE(&s->pmc.iou.ospi.ospi),
+                                          "ospi-mux-sel", 0);
+    qdev_connect_gpio_out_named(DEVICE(&s->pmc.iou.slcr), "ospi-mux-sel", 0,
+                                ospi_mux_sel);
+
+    /* OSPI irq */
+    object_initialize_child(OBJECT(s), "ospi-irq-orgate",
+                            &s->pmc.iou.ospi.irq_orgate, TYPE_OR_IRQ);
+    object_property_set_int(OBJECT(&s->pmc.iou.ospi.irq_orgate),
+                            "num-lines", NUM_OSPI_IRQ_LINES, &error_fatal);
+
+    orgate = DEVICE(&s->pmc.iou.ospi.irq_orgate);
+    qdev_realize(orgate, NULL, &error_fatal);
+
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->pmc.iou.ospi.ospi), 0,
+                       qdev_get_gpio_in(orgate, 0));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->pmc.iou.ospi.dma_src), 0,
+                       qdev_get_gpio_in(orgate, 1));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->pmc.iou.ospi.dma_dst), 0,
+                       qdev_get_gpio_in(orgate, 2));
+
+    qdev_connect_gpio_out(orgate, 0, pic[VERSAL_OSPI_IRQ]);
+}
+
 /* This takes the board allocated linear DDR memory and creates aliases
  * for each split DDR range/aperture on the Versal address map.
  */
@@ -552,6 +644,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
     versal_create_bbram(s, pic);
     versal_create_efuse(s, pic);
     versal_create_pmc_iou_slcr(s, pic);
+    versal_create_ospi(s, pic);
     versal_map_ddr(s);
     versal_unimp(s);
 
diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index 811df73350..1b5ad4de80 100644
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
+                qemu_or_irq irq_orgate;
+            } ospi;
         } iou;
 
         XlnxZynqMPRTC rtc;
@@ -116,6 +126,7 @@ struct Versal {
 #define VERSAL_ADMA_IRQ_0          60
 #define VERSAL_XRAM_IRQ_0          79
 #define VERSAL_PMC_APB_IRQ         121
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


