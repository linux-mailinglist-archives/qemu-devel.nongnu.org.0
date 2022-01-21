Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4C8496309
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 17:40:50 +0100 (CET)
Received: from localhost ([::1]:57076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAwy0-0006MP-63
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 11:40:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1nAwox-00012y-5M
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 11:31:28 -0500
Received: from mail-sn1anam02on2057.outbound.protection.outlook.com
 ([40.107.96.57]:6070 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1nAwoq-0000lL-Tj
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 11:31:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KNMmYQb8/3PgoGn8u/JHLca1UqH+IZFAUx2b9v6NuHLcXeiZQ90SEi6EdkIeU82OovtG2zTK1j+pNnnNBtPNbHCXhZV+r+ZenUPRkuMsPLTS9Z4VLfnqU5Yy0WglCtU3b3ViL4QtqNmusfBbPd24db02hM4S4qaAXJbtrdgYUzMvRFyhHWZOEM1DRu8QqxiAX3juJJZ8zZ+XoA6WurkLVbiWxDlczgM/0Cpy4vhsW7rlNzb/YlVATR4Tmp/geSHKioOw0iYuppbB6u5vZ5IVsV81xb8feIIyChHLGc0QgsJbX9hX4nAdL0LznG4cfnrcR2tZq2V+F/xTv92+58qgug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DkpyloXTE5MzFobJzHwk+rl1f88IYeMXw75hzZP8kaE=;
 b=PKKMY7HFkCosB7U0S60yV697Hlebbm+GBrz72GwXtV51IBmoRToc7UX7VqTDzpLcCXBxzeAhOBG3x8q3rvtLTWvLsLaMRfZUnUTix/GjveMMSk+H1UdsTEvbg5jHjs8LUkTJMPl+LuR4+qwLuForkjihKQiAyOGC4a5+qMbj0RBaWjGsrL6Z7iKHO98MASxEP9aR8eM+TzfMP+Ou3+wRkA8VZm9MEC4ud4+MZakW+HqcAuP3xRZ5dO/OXrknVA1vJ5jY1HVPX+cTkiEUsJHoy/fRcihlN7QE6P1pEWURPdyXvuyv6xW1q8mc0KNdyJgacpFIeYQI+fulBr8l62W6NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DkpyloXTE5MzFobJzHwk+rl1f88IYeMXw75hzZP8kaE=;
 b=riUX32TB42AYbO0kjl1urV7uMoZwBTT4Wfejp2pa6H4QA5dw6D2nDcIN4M1/uDkfB+lMbqf9v13YQnXXyxB5aZqXLi5zKkrwQP6u1xR1CcFpXVQIgg3/C9J5r2rbp7PBURd5SDOHu61uJxf6OoJ884X7D00CxzsNdt6BOfold24=
Received: from BN9PR03CA0310.namprd03.prod.outlook.com (2603:10b6:408:112::15)
 by SJ0PR02MB7165.namprd02.prod.outlook.com (2603:10b6:a03:298::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Fri, 21 Jan
 2022 16:11:51 +0000
Received: from BN1NAM02FT047.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:112:cafe::61) by BN9PR03CA0310.outlook.office365.com
 (2603:10b6:408:112::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7 via Frontend
 Transport; Fri, 21 Jan 2022 16:11:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT047.mail.protection.outlook.com (10.13.3.196) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.8 via Frontend Transport; Fri, 21 Jan 2022 16:11:50 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 21 Jan 2022 08:11:48 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 21 Jan 2022 08:11:48 -0800
Received: from [10.23.121.133] (port=62231 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1nAwVw-0002nH-Cs; Fri, 21 Jan 2022 08:11:48 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v7 02/10] hw/arm/xlnx-versal: 'Or' the interrupts from the
 BBRAM and RTC models
Date: Fri, 21 Jan 2022 16:11:33 +0000
Message-ID: <20220121161141.14389-3-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220121161141.14389-1-francisco.iglesias@xilinx.com>
References: <20220121161141.14389-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9eac156d-1aa5-4244-43ba-08d9dcf8bb7a
X-MS-TrafficTypeDiagnostic: SJ0PR02MB7165:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR02MB7165FD74611C035F623BB1FBAD5B9@SJ0PR02MB7165.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9icUV6TjqNy6NBFRcNSGyjjlzkh84lL6JZwQd3c7c36CZme6+YrKFfYrdoGGVgWX0QJCD7FbkiQQxDgizMF7ls793G2og9Z0XxTV3Bd6wSYu7CfW154nHQlEfl7yzXrv72L0n90tt4fFfSOaoTLoh/HKCw5shSjpf1bWxRrU7p8eexcG5tnYEeSTUjrj/q7reWQzNThF4dYlZgiJODG1fqfx7pFFcYXjxMxrvxsiqjupk5qbU1nW0xHkxAzZZf9bnzXnzaDJOZfJCNNcuygX7iExxiHIoPC7B72QBCEJIJm7JrQvWw8s1VvJ4newkCM2ML9GFi6e0WTIVdvDX3uXMJ9b0E6gWV1uergfdhH+QkR/RUJO3Gs2zH064lQH8Y9W69oXdAe9dQUAKybhlBJdwn4UtdgGFf8pgVLiKrzu3HiYdTnwy64TcepENq/xkzwMAEXmK4myLrJdbK1E2YFOcdmv3ytpBlJPCES1iAWWcH4SArH8sSS6ay1mYC/gg19kIfW8Lit3Fp0nqutb3LomYu+jdHJV6BmHDu3pa9xqRpsSmOYEPsk6K6sPZj2yicwDt5BohV+7IJyAMN8RL0zf4bzfiYBQOzhfFzfMq8zWvSuRbFwt5LwXMyPE34b9mjwSAZumseCdbkjyEO+v0NjY5TAvD10w/1LbSh80FuL1EaFrO+IdONlpK4DqNMwNfpYqlSAr6yVQ7pVxgmqSakOFk/vuOS6DxDOs0YK2kV/k6ZKtcRnNRJmC+wWLiY2IQHFXZdf9D4rYo945bYZwU1Dk6A==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(7696005)(186003)(508600001)(1076003)(70206006)(82310400004)(426003)(44832011)(4326008)(8936002)(54906003)(26005)(2616005)(336012)(2906002)(8676002)(7636003)(36756003)(47076005)(316002)(356005)(36860700001)(9786002)(83380400001)(5660300002)(6916009)(6666004)(70586007)(102446001)(170073001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 16:11:50.3581 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eac156d-1aa5-4244-43ba-08d9dcf8bb7a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT047.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7165
Received-SPF: pass client-ip=40.107.96.57; envelope-from=figlesia@xilinx.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
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

Add an orgate and 'or' the interrupts from the BBRAM and RTC models.

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
---
 include/hw/arm/xlnx-versal.h |  5 +++--
 hw/arm/xlnx-versal-virt.c    |  2 +-
 hw/arm/xlnx-versal.c         | 28 ++++++++++++++++++++++++++--
 3 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index 895ba12c61..62fb6f0a68 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -85,6 +85,8 @@ struct Versal {
         XlnxEFuse efuse;
         XlnxVersalEFuseCtrl efuse_ctrl;
         XlnxVersalEFuseCache efuse_cache;
+
+        qemu_or_irq apb_irq_orgate;
     } pmc;
 
     struct {
@@ -111,8 +113,7 @@ struct Versal {
 #define VERSAL_GEM1_WAKE_IRQ_0     59
 #define VERSAL_ADMA_IRQ_0          60
 #define VERSAL_XRAM_IRQ_0          79
-#define VERSAL_BBRAM_APB_IRQ_0     121
-#define VERSAL_RTC_APB_ERR_IRQ     121
+#define VERSAL_PMC_APB_IRQ         121
 #define VERSAL_SD0_IRQ_0           126
 #define VERSAL_EFUSE_IRQ           139
 #define VERSAL_RTC_ALARM_IRQ       142
diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 0c5edc898e..8ea9979710 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -365,7 +365,7 @@ static void fdt_add_bbram_node(VersalVirt *s)
     qemu_fdt_add_subnode(s->fdt, name);
 
     qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
-                           GIC_FDT_IRQ_TYPE_SPI, VERSAL_BBRAM_APB_IRQ_0,
+                           GIC_FDT_IRQ_TYPE_SPI, VERSAL_PMC_APB_IRQ,
                            GIC_FDT_IRQ_FLAGS_LEVEL_HI);
     qemu_fdt_setprop(s->fdt, name, "interrupt-names",
                      interrupt_names, sizeof(interrupt_names));
diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index b2705b6925..fefd00b57c 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -25,6 +25,8 @@
 #define XLNX_VERSAL_ACPU_TYPE ARM_CPU_TYPE_NAME("cortex-a72")
 #define GEM_REVISION        0x40070106
 
+#define VERSAL_NUM_PMC_APB_IRQS 2
+
 static void versal_create_apu_cpus(Versal *s)
 {
     int i;
@@ -260,6 +262,25 @@ static void versal_create_sds(Versal *s, qemu_irq *pic)
     }
 }
 
+static void versal_create_pmc_apb_irq_orgate(Versal *s, qemu_irq *pic)
+{
+    DeviceState *orgate;
+
+    /*
+     * The VERSAL_PMC_APB_IRQ is an 'or' of the interrupts from the following
+     * models:
+     *  - RTC
+     *  - BBRAM
+     */
+    object_initialize_child(OBJECT(s), "pmc-apb-irq-orgate",
+                            &s->pmc.apb_irq_orgate, TYPE_OR_IRQ);
+    orgate = DEVICE(&s->pmc.apb_irq_orgate);
+    object_property_set_int(OBJECT(orgate),
+                            "num-lines", VERSAL_NUM_PMC_APB_IRQS, &error_fatal);
+    qdev_realize(orgate, NULL, &error_fatal);
+    qdev_connect_gpio_out(orgate, 0, pic[VERSAL_PMC_APB_IRQ]);
+}
+
 static void versal_create_rtc(Versal *s, qemu_irq *pic)
 {
     SysBusDevice *sbd;
@@ -277,7 +298,8 @@ static void versal_create_rtc(Versal *s, qemu_irq *pic)
      * TODO: Connect the ALARM and SECONDS interrupts once our RTC model
      * supports them.
      */
-    sysbus_connect_irq(sbd, 1, pic[VERSAL_RTC_APB_ERR_IRQ]);
+    sysbus_connect_irq(sbd, 1,
+                       qdev_get_gpio_in(DEVICE(&s->pmc.apb_irq_orgate), 0));
 }
 
 static void versal_create_xrams(Versal *s, qemu_irq *pic)
@@ -328,7 +350,8 @@ static void versal_create_bbram(Versal *s, qemu_irq *pic)
     sysbus_realize(sbd, &error_fatal);
     memory_region_add_subregion(&s->mr_ps, MM_PMC_BBRAM_CTRL,
                                 sysbus_mmio_get_region(sbd, 0));
-    sysbus_connect_irq(sbd, 0, pic[VERSAL_BBRAM_APB_IRQ_0]);
+    sysbus_connect_irq(sbd, 0,
+                       qdev_get_gpio_in(DEVICE(&s->pmc.apb_irq_orgate), 1));
 }
 
 static void versal_realize_efuse_part(Versal *s, Object *dev, hwaddr base)
@@ -455,6 +478,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
     versal_create_gems(s, pic);
     versal_create_admas(s, pic);
     versal_create_sds(s, pic);
+    versal_create_pmc_apb_irq_orgate(s, pic);
     versal_create_rtc(s, pic);
     versal_create_xrams(s, pic);
     versal_create_bbram(s, pic);
-- 
2.11.0


