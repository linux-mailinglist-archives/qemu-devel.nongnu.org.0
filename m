Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFC548ED26
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 16:32:19 +0100 (CET)
Received: from localhost ([::1]:44012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8OYt-0005Fh-28
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 10:32:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1n8OVe-0002FM-Og
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:28:58 -0500
Received: from mail-dm6nam11on2048.outbound.protection.outlook.com
 ([40.107.223.48]:53928 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1n8OVb-0007VU-68
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:28:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZtVbbFJ5hRgmaQOgaRu3UJWaVnWPuOS/ZMqEdoqZ8lmVMESVchWmsIN0RLTJuyhc3kXMIRORHpLWarCgiNihQrTB4wgfelU9stE19PkZ9p3pSJzVQV5LxbsKRI5E9vdd2ruTg1fPQP0OrNNxq23PBJAZV/FBM9yOuBhVV1h0069yGQmbhMGxyeeF9jMHMRlXP+8nKJYV6Nnh6PHJSUmxrTLzUzxkodB2Ng7/Nqi8CvL6qRtkLh6zGLk3/OG9/7qHoPYJgUPiPo4Qu217rKLQmWjjsdOMby2vpEmSDgYkxFjZeAnKfWpFAhNFAxjdB9bKgTe36Nqnf4MW7LLfiSh/Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wr7h1ThejwxZfCgWGXvOmDJEqR7kut/zVJbIkHC4YNI=;
 b=GO4Lb5Ev/SYtpFVNCOCeZcHKLMCd6rAMABwf25tvt9uKhMW+1eVNclEwxfjViKMJFAbo0YxlntaY8EXEIjqxfD/W+SwlNEJ6/F81JGCG8H7zrGnfF6SVJ8tD2xvRCbDKg3dmFLGCYuyx9ap43Sm/BvEBFQZR8edYp1cvwtvWr4MB0jHTeKdn6MsZiCvbv5STAlX4J/9jNFd6K2O4YbxA/R8pKn98hXEBIDcCsQJ6uM64ZjsU1qhItvPvIfxclEp5quQVq9bxdhg/7yb9RPu8ko6f25b8yeuyjbfUoWyPp3CEJsTWFpfqk9NQAuCT2wjODk149Aul0oVTZMym1bz0iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wr7h1ThejwxZfCgWGXvOmDJEqR7kut/zVJbIkHC4YNI=;
 b=pDB3wR3FBjRPhEpUJ8pBJav+v7WXZK1j4YsMbpBYGVnkxawLcdcjP5+jIcznyEEkC9HYZMBXtZUX5GtgPkaQSR/m+lqq/8/03BnpQnaSi/a92W0/5Q6IvZfWi4iS9RpqKCesyxbCCszGgUTtm5UCDIixGPQqav8/POAc+tGHNzw=
Received: from BN1PR13CA0017.namprd13.prod.outlook.com (2603:10b6:408:e2::22)
 by CO1PR02MB8460.namprd02.prod.outlook.com (2603:10b6:303:158::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Fri, 14 Jan
 2022 15:28:51 +0000
Received: from BN1NAM02FT051.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:e2:cafe::c8) by BN1PR13CA0017.outlook.office365.com
 (2603:10b6:408:e2::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.3 via Frontend
 Transport; Fri, 14 Jan 2022 15:28:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT051.mail.protection.outlook.com (10.13.2.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4888.9 via Frontend Transport; Fri, 14 Jan 2022 15:28:50 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 14 Jan 2022 07:28:48 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 14 Jan 2022 07:28:48 -0800
Received: from [10.23.121.163] (port=49859 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1n8OVU-0004L4-Dh; Fri, 14 Jan 2022 07:28:48 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v6 02/12] hw/arm/xlnx-versal: 'Or' the interrupts from the
 BBRAM and RTC models
Date: Fri, 14 Jan 2022 15:28:31 +0000
Message-ID: <20220114152841.1740-3-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220114152841.1740-1-francisco.iglesias@xilinx.com>
References: <20220114152841.1740-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2391f8da-be05-44a3-a873-08d9d7729124
X-MS-TrafficTypeDiagnostic: CO1PR02MB8460:EE_
X-Microsoft-Antispam-PRVS: <CO1PR02MB8460C4A5C817FC1E38093C4DAD549@CO1PR02MB8460.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:454;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8EAnZi9+NZAlpDdiigyaWI4Qv4eO0+6U43Fof/cbxIf1u0CW/fpde11G9ROLs73ZSEi/xA8yT25wjQS7mH6OnziBrgYSV0vQhVRUMO0AG7KFj72qq8TQhKbchkvzvCgA7khPq3wJKdm7v4LFtaEtcsy5AnIaczSXDkJRgK5DXDwZvdXQeLnHVwH5c5nsqPEiQ0XozwHxVNQVfSTA57kRvBNP5paHTrNTzA6ZRPoGRHMfxbtygYC/ciU1DSPTv6Hm2JeeAyVS0ExAt1TMDPWJITX+bdWSI87dxoreU+VagNRSgVajeZxlEL9HUzAfgEd9DBxjSNwgefXaorVr3OIGYhmKvzH4yLksoVK5OAu8QFSxIq1MxJJyivLbeVlRZvo4T6TUaQIZcQnurdqc3ns4uc+k5oBcGdjmMa/hCys1ljTGoq9uxhxTHOf9ceWpSZ/pTA4TIFvaXzclQ98iZMGV2pD755VCfRt+2YwHVDuw76bvSWoYbCArcjfdNfFIocq9OFbZpY0dxIQvDPvnVhPJ2Z4gCFIGxQk00VHCYAsYZgZTLxdd34GIOJGwZKQaAYp6kYInx/Dom9XhcQZYVc+4XxIO8RpHzeZkXVSjXZkm3i5nOaldxZrpxaOHMQFMw4N4FKL/qUFpjCJuZL8DPwahDD8KFp1rxD62oQdbFDNFDeLYpY3468zjChXRTsVTgbcE3qVrhAnUluxm6HfXnOkGrs0hw5R+Qro97c88/+S49Tg+oKtIbxRzABUUr/E0OSjzl9L3W5NS8m5MO+MTMjqOSA==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(26005)(8936002)(83380400001)(5660300002)(2616005)(54906003)(6666004)(2906002)(70206006)(44832011)(82310400004)(6916009)(316002)(9786002)(36860700001)(508600001)(336012)(47076005)(186003)(36756003)(426003)(356005)(1076003)(7636003)(4326008)(7696005)(70586007)(8676002)(102446001)(170073001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 15:28:50.9572 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2391f8da-be05-44a3-a873-08d9d7729124
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT051.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR02MB8460
Received-SPF: pass client-ip=40.107.223.48; envelope-from=figlesia@xilinx.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
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
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/xlnx-versal-virt.c    |  2 +-
 hw/arm/xlnx-versal.c         | 28 ++++++++++++++++++++++++++--
 include/hw/arm/xlnx-versal.h |  5 +++--
 3 files changed, 30 insertions(+), 5 deletions(-)

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


