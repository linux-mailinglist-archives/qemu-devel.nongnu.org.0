Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B2547411A
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 12:08:13 +0100 (CET)
Received: from localhost ([::1]:49920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx5fI-0001an-VD
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 06:08:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mx5bN-0007He-3I
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 06:04:09 -0500
Received: from mail-dm6nam12on2048.outbound.protection.outlook.com
 ([40.107.243.48]:50049 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mx5bJ-0006yr-12
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 06:04:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gLRhs2Is90zsu8kU8dKClHw4n0zrX4oQ+Hcix3JzxjM3Qf07cjN4Sq6EWQv03Gy9Aejy9c6ubJ7QjGJZ+QfHAAY7hP3wDTu9EbZ/h3lZNaPAtJ4/jZdhGOg/VLoN23V/FxxeXuemYrOmOUHtBLU6+7HvqSgmCu/fhtus+Vsn8e1tIepjgULO47xatL3pLtz+VN7hFit6FerU68SfgzaJcuuWcNfNHx21hHPal0soYoR2sfsSBDF7NPCi8g16FQXURa7y1lmExvL6CGW89ztUp+t3MXQmR9+N2D9DPcJVmiiolB1zZlQLLyWqjZfymld0QyXFHiVpnMTIu+xXgBGZfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6ZI8OKz5fFsV1Gj6/qACcSrwlKaWic3Tcnv463yxdk=;
 b=d++kcRfDN3PydH1imDWi87G7HW3/Cqlv8ycN2INJWjC8RB4TvXWF4lPxCbMADmphIxBCmD7WfWhXPr0BPrS4KBsTb7Ko1D/1J7ipiD14b2OG2c4QSGlr4zq4tsZ64ltSI/hWmyh5tDng/szeJ/KovC2252qPdQ85K10wFSnaOxJ5tgt3BxrG/t8i24tkVWihO5GuVT2NM4o+dzUo0un8A5G5S+bnmM/p8/LdjTF4BkqXPUYGI0wt16/T6ZO35MvpVkw/5Zis69BStTXBoEFhZLMVCmy0kbsijM/abMDBbLpKbhZZs16vLGqR32Rbqx+uuuJvd1uFS95gvrU2Wy3Yxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6ZI8OKz5fFsV1Gj6/qACcSrwlKaWic3Tcnv463yxdk=;
 b=oiLq86Q9gfMC7XVbgBZHdwRYWodTFVApcspJU2yK60mFQNpmFpfxKl5kxKN1zWOaUfKApMQnT+ZtJHiy7nyohpxxUkEKeYklWkXAM9/Y+B5c4+fv9AmJ/uT0kKVuK5rQVUlelVj/AQtdTtVC3EJGm+JSC3Z+9wLYg5rSHRej0Pc=
Received: from DS7PR03CA0169.namprd03.prod.outlook.com (2603:10b6:5:3b2::24)
 by CY4PR02MB2279.namprd02.prod.outlook.com (2603:10b6:903:a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.15; Tue, 14 Dec
 2021 11:04:01 +0000
Received: from DM3NAM02FT061.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:3b2:cafe::22) by DS7PR03CA0169.outlook.office365.com
 (2603:10b6:5:3b2::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13 via Frontend
 Transport; Tue, 14 Dec 2021 11:04:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT061.mail.protection.outlook.com (10.13.4.230) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.12 via Frontend Transport; Tue, 14 Dec 2021 11:04:01 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 14 Dec 2021 03:04:01 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 14 Dec 2021 03:04:01 -0800
Received: from [10.23.120.191] (port=54391 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1mx5bE-000F5K-OO; Tue, 14 Dec 2021 03:04:00 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v5 02/12] hw/arm/xlnx-versal: 'Or' the interrupts from the
 BBRAM and RTC models
Date: Tue, 14 Dec 2021 11:03:44 +0000
Message-ID: <20211214110354.21816-3-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211214110354.21816-1-francisco.iglesias@xilinx.com>
References: <20211214110354.21816-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae230781-9228-4bea-9441-08d9bef16f81
X-MS-TrafficTypeDiagnostic: CY4PR02MB2279:EE_
X-Microsoft-Antispam-PRVS: <CY4PR02MB227924E9CBA1DB5176747585AD759@CY4PR02MB2279.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2Vm73OJiVV3h0bKOre4MNIVxn5QEwEpXSnWT4vbBireviyQZTfpCp63vt/f6wgVX1ns9VctnpwZc/81Ro/231+U1cmifIRBPx+XLFmNNTVv9f/8B0emubgrt4mI1Q4d2m9hxY7HK+CmH5T0yBwz/Uo6AyP7gfxCRDpIA/p5jfKdIZyqSoWOqktbyUCYetF9f1smEwI2aiiDhbZKtp75+KUFyra/HEHWSaD6urkkTEv7TfUr1C/yltJGMedsBUyIAs6GJJWrwhQXkqIc6vroIHpiYzKubikdqTLZj5+Y9/1BvJPIKjC7YpXgRXhaJJfxUtMVlKIEAANsDk7Ag/XxQzaMHtmhBHlIqDaEOugrYkPit0WtdCmi69wtN7r9hv5f3JMKQm6zzD3ASHZdYWFwjbP1QPb2I/1aDZS3O6ckTDt072igYn0vKtRvBCELDOQpnf0SyETQw2aPVED28h2EBM/tqnAxHeG969uSbSXHw4aDXqk8zbDtqSnvEdqTEY1x69MOmQ4ILUcRDjs3acgMEGOb/WTauH663GePcuC34t2fcOt+umyM/sfrWA3WP9yLS320yl0R6jEEgG5PKxwUFOK0mLAMITDY5WhVguH6h4rVTWwsI3FBVPaGBm7g9H/j3SjW+yL5UDGGkA9k0Bkv9iRB1qAsmohs3OkYqhLxi6fN8f3cEFmz7DQAoJs6GMouaFV2jDWI2cX3VhNgqwHBlQ5dMYMPsnzzFc9h5jq0h2dlISVfYYY+HXGzMqY9Sl51Uyq0OvptaAD/BV/+QE+o6Gg==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(46966006)(36840700001)(316002)(26005)(6916009)(426003)(70586007)(186003)(8676002)(356005)(83380400001)(70206006)(44832011)(36756003)(1076003)(2616005)(9786002)(36860700001)(82310400004)(7636003)(508600001)(7696005)(5660300002)(336012)(4326008)(47076005)(2906002)(6666004)(8936002)(54906003)(102446001)(170073001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 11:04:01.5857 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae230781-9228-4bea-9441-08d9bef16f81
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT061.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2279
Received-SPF: pass client-ip=40.107.243.48; envelope-from=figlesia@xilinx.com;
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

Add an orgate and 'or' the interrupts from the BBRAM and RTC models.

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
---
 hw/arm/xlnx-versal-virt.c    |  2 +-
 hw/arm/xlnx-versal.c         | 28 ++++++++++++++++++++++++++--
 include/hw/arm/xlnx-versal.h |  5 +++--
 3 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index d2f55e29b6..10483582c7 100644
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
-- 
2.11.0


