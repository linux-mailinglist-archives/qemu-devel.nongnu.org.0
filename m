Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2523D465213
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 16:51:30 +0100 (CET)
Received: from localhost ([::1]:52356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msRtJ-0006z2-7b
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 10:51:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1msRjD-00049u-Ko
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 10:41:04 -0500
Received: from mail-dm6nam12on2041.outbound.protection.outlook.com
 ([40.107.243.41]:5728 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1msRjA-0000EM-AM
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 10:41:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=drMZyQnlGuIPg+LOltegRqC7ILIRJyIS9IioOgX3eb+evWUhqPtmFB2zIWDbKeNf2Thomj1t34ZoRFptYMgd+YDYXe2EAoyicggNYHANqP1pGg0EQcF8f8U9136QJCzWW63X4CofZIKqxib09xlBbSL7D2kDWeMP8IqPMmIa4OCS9PM181bkE/rnR4XS38MBFoTG40c56XnUtTJXTytq0oGLuzeuKplZ+i63B8TU0qJZz0gzEz3BmGgjPrn6auAQN/GKcUVkDKK5alkTDiiJGPdbUGctOGr2XxFmZf2UduIVIGv/1WCJSE4HXf72nQyY0b1ZcrBghAh9f3Ita9XLmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlki0tgV6ule3TxKJxdJeq+OTpZhjb4Gyu/3+8bu9y0=;
 b=ML++Z9owVHyqbCDAy3ew12Dhvpwila1tiHHrKRmzByNvTEf9Jsl59AuskWiarh4lUpLK20h0LeEh+dAqF3bILYi5lasLuWKbo4Q4tHUX+qUecgS2a28O6qb0WxV/jh/1kon/qAjBeHl7RyXbmmIiugkp6rryE0y5oDVGBEvzItjamzssGydTE1B9jiZcSMq3QEdtXBIfxYajbV47P14TKBeoSIe04nv2WSy2S0arRrLMY41nEoUzOC0Lqg5zNwvL1z1Am0PD1WShUwGM2TcCIVBzCPyItTRnWyecEt3Pz/4F/nY6KvAiGFBsZyXXM2Vzv8mD3Lt6jecddhsj6JtHNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlki0tgV6ule3TxKJxdJeq+OTpZhjb4Gyu/3+8bu9y0=;
 b=k78/E6BRl9mLZ01edalj4Ds4jKQcCdxEapGoYvSx/ob25Pm4dN1bOQi6SgxvHOQQcXqZ55DgQAsUouOExcrsykNGAd4FtPu+ncDnzTxnJB/wV1aaf3NhRAE8KmYM9sTWKUJ7XQs3yl/RRtyyY5UnYZNmNw9XO/VwQZbX5WuLI84=
Received: from BN9PR03CA0174.namprd03.prod.outlook.com (2603:10b6:408:f4::29)
 by CH2PR02MB6407.namprd02.prod.outlook.com (2603:10b6:610:12::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Wed, 1 Dec
 2021 15:40:55 +0000
Received: from BN1NAM02FT059.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:f4:cafe::ef) by BN9PR03CA0174.outlook.office365.com
 (2603:10b6:408:f4::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Wed, 1 Dec 2021 15:40:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT059.mail.protection.outlook.com (10.13.2.167) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Wed, 1 Dec 2021 15:40:55 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 1 Dec 2021 07:40:40 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 1 Dec 2021 07:40:40 -0800
Received: from [10.23.121.245] (port=59039 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1msRip-0002FY-QU; Wed, 01 Dec 2021 07:40:40 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v4 07/11] hw/arm/xlnx-versal: Connect the OSPI flash memory
 controller model
Date: Wed, 1 Dec 2021 15:40:19 +0000
Message-ID: <20211201154023.13931-8-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211201154023.13931-1-francisco.iglesias@xilinx.com>
References: <20211201154023.13931-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 502e7f5d-5a40-467c-26f1-08d9b4e0f698
X-MS-TrafficTypeDiagnostic: CH2PR02MB6407:
X-Microsoft-Antispam-PRVS: <CH2PR02MB640752CE596E1DE5E2D70F95AD689@CH2PR02MB6407.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:403;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SqsKb1zU2uErFP+r87YOdIR7VfmaV2096WUA+/n5HI2x2m5ZAOU8j9sle/8PJItj0BhWZGFonTjPSrz2Nwslxty7L2rEw0hIYqP5hLTCGoRQqucrkyECfye5A7eihpwBMSnjikb20qkz2G0NEccOf/1hHbgjXmG/JyJyHUpU4fAdZGIPQH7MMBU8EdXVR0xZ8gsQ269QtU9ZrVxBy1nOaDTGlqSEvddMZdkvul156Gu33i9z1NhryzfkY8lnR2gY4c9DpjhJYQ+LPPr/Eoa8Yvp0PKRgkpzNI8nuUU3YjHNNH72/h6so1uzv11CpMG/DtQsbd4+6jtSFKfhvur/GSOdXTM0whZhmBNsMVc1vv/FzYWsF8NGxrnrfcEYyKuhVH4Brzje3CFUL8tduCwgpXh9kk1g7SOJ7nHdSg7I16mGweI3ixlQXzU5TNJf8SwGt4gABXW/GnVqDPEHKvyYh9pqlCCYYkQeNzfYuY2m2SJADtOVVGqS+CWfgjvAp3r3RZ+Q+qLeH6zh0vd5G4RE8B9A56yw/mE9kJ17BCZhrKtHmWCXVQC7QffpaznPwi/1fR6/BaeGfQsAkcA2cquTE3xBqm+XHSjgYrCC6Bn1nA+GDzP7p0SsdhrsqEK7m7E/O/t6TQTGSB/p2pFgocqMIQm4hlR/3Z2pUMxMgVAXUCGrGgqZdMTxTZh2kNvw9nQHY7V416c/3pspZPP6eyPouK4H9tXpWgSvoqrh3Wx5IlQI=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(36840700001)(46966006)(426003)(82310400004)(54906003)(26005)(336012)(9786002)(316002)(1076003)(6666004)(36756003)(2906002)(36860700001)(8676002)(5660300002)(2616005)(4326008)(356005)(70206006)(7696005)(508600001)(47076005)(8936002)(7636003)(6916009)(70586007)(186003)(44832011)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 15:40:55.1070 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 502e7f5d-5a40-467c-26f1-08d9b4e0f698
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT059.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6407
Received-SPF: pass client-ip=40.107.243.41; envelope-from=figlesia@xilinx.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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
 hw/arm/xlnx-versal.c         | 88 ++++++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/xlnx-versal.h | 20 ++++++++++
 2 files changed, 108 insertions(+)

diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index bb13b07e79..c8228afe03 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -24,6 +24,7 @@
 
 #define XLNX_VERSAL_ACPU_TYPE ARM_CPU_TYPE_NAME("cortex-a72")
 #define GEM_REVISION        0x40070106
+#define NUM_OSPI_IRQ_LINES 3
 
 static void versal_create_apu_cpus(Versal *s)
 {
@@ -385,6 +386,92 @@ static void versal_create_pmc_iou_slcr(Versal *s, qemu_irq *pic)
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
+
 /* This takes the board allocated linear DDR memory and creates aliases
  * for each split DDR range/aperture on the Versal address map.
  */
@@ -476,6 +563,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
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


