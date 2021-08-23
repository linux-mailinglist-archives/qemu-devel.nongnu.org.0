Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD613F4FF8
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 19:55:49 +0200 (CEST)
Received: from localhost ([::1]:48358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIEAh-000118-Rk
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 13:55:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mIE4o-0004rB-AK; Mon, 23 Aug 2021 13:49:38 -0400
Received: from mail-mw2nam10on2043.outbound.protection.outlook.com
 ([40.107.94.43]:12850 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mIE4j-0001BC-CH; Mon, 23 Aug 2021 13:49:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f1QeyXI3rQzTX9xE2ioyvY6CAk6Q3T7zFvAyE8Brn1cZGLdb2FOVNwMbO8M9hzsVUuL3A+mn5tviLW0N2zbHorXxTkMWHa2Eb2Q5Fn2wv3kTwQSI+IHA5ALvTp01bYJGta4MqcnML3FiWW0DiEV67q5KyMxVQk8zJ1HRn8cUKzL5aLWUW3DKT/5cTnFCmYFbOOYR7TOqdEQKg5oHlTVQxxCt76PukRiEnOADPx0eRZYA1JRutZf66QwZyDoYFhUOSSesVHztTWJyH2MdrBi7Z2y74LTIngUBOQjYCILPemIVSA+ZRnXt893s8lZXovCOk2bXXY6CwFjNP1nJ/5GakA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vx6wlvE/Jk7i0c4jSnZdVToc2JYOR7VcN31T3N1v2HU=;
 b=hX6J+Jf6jpPDiAlXomG/tX6tXVB/yoBkg6uvbrs6Sbrq/qTZvWU3mOR2hSp5ZcAOqoK9tuiIC5U3jQ7vIMb8OXlFEIXHa5O+QmP+WB+XEJHw2elApjvSITKbsPgrwHy9Y6SXdt6WhfVu0U1D1HJLaZeY3tSVD2SUAjgEjDxb/dnUPyaUvjjST7NRLvWN9B+puPuvhQUvtu2nyfx60I1dmBhqvbvT2yrF6K/hA29RAWX0DhMnQCcvh08CC9vzQkEOwIID8d1D0MNxvvFJgK7hARyhJJmQEZiIu4nDvgt33DRQf3lHaOP0yQEPJVSlcgShvK5UEZMYr2agpG5JAMMCaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vx6wlvE/Jk7i0c4jSnZdVToc2JYOR7VcN31T3N1v2HU=;
 b=AKloILGNYEhbkQTmViV+ZNgqCUmTPme/HfFe9eIlIGHu5o6KrQYul78oZpEWHRcbmWxv4PGx4Kw0HGlMPJeYl+42vP9/Yc70eoz5bxDEsj/+fHTU3tT1V/kiQpzQUUF+ih+quZsgvrYAvjfYIgeZ/06Vu/aJUzXhoW98Rj+3OLo=
Received: from DM5PR22CA0008.namprd22.prod.outlook.com (2603:10b6:3:101::18)
 by SN6PR02MB4574.namprd02.prod.outlook.com (2603:10b6:805:b0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 17:49:30 +0000
Received: from DM3NAM02FT008.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:101:cafe::ec) by DM5PR22CA0008.outlook.office365.com
 (2603:10b6:3:101::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Mon, 23 Aug 2021 17:49:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT008.mail.protection.outlook.com (10.13.5.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 17:49:30 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 23 Aug 2021 10:49:24 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 23 Aug 2021 10:49:24 -0700
Received: from [172.19.2.40] (port=46976 helo=xsjtongh40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <tong.ho@xilinx.com>)
 id 1mIE4a-0007u4-R1; Mon, 23 Aug 2021 10:49:24 -0700
From: Tong Ho <tong.ho@xilinx.com>
To: <qemu-arm@nongnu.org>
Subject: [PATCH v2 6/9] hw/arm: xlnx-versal: Add Xilinx eFUSE device
Date: Mon, 23 Aug 2021 10:49:21 -0700
Message-ID: <20210823174924.201669-7-tong.ho@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823174924.201669-1-tong.ho@xilinx.com>
References: <20210823174924.201669-1-tong.ho@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe332b0f-69af-4f01-95fa-08d9665e5bb6
X-MS-TrafficTypeDiagnostic: SN6PR02MB4574:
X-Microsoft-Antispam-PRVS: <SN6PR02MB45748D9530AA7041FC6D79A8CDC49@SN6PR02MB4574.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:167;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nr+1fq8JzKHurbmEGFesaCO2M1Ft15V5A6zSaRPi6spSGCMkpoadpjScXeXElxy7NRDhmnhm6njSonFuQA/Rm8agt1qnOV8/XGLgn2kYEet+eFq0SP950AOZyBqmW2B2yrlzjkFlKAiDJjCKWFatUPHLA/ZaICnrOxFV4ZP5d6bxbds5jgtdbSWsi4dACoujSs2mAb+xFLjAXOdH46ndF9tRXv1/dgmRAhW5ovp0aqnlilTdENUKvmo1o/0mirykFr7YtXhbWYUFBkTNatTnxGFcq0kcdW6EKXFVE0lYwoIYMEErSdJOrgcH0/b/gpj/rR1WeOze8mWffTTqFnEnbM+Q7JSiJ33xfXQeZpV/U+U7fyWOLqmEmC8F/eQ/R5Gp4FyHI1vi3hWznEHsFNEfRXHn2emuJv3DjGXFCPHcZc/8lN9kLv/I5xycLQ2Wws8lPE+hLDblPr758lCiez8ywXIU7vrNM/P0JI/pcIacqPCkoIdWAhrRJmnVznPOSv2n7V/NltH/GjWDXdTSqCKgtK+sm4jcHlIFgtlmYVS/DeBD0Yg3C+exsS0Hswps4vvEfZofhMESAzT0rFLSpFsD+lvJ2zN5aF3ughmWLmhaoJmTOY2glgHhsUzcr39TGhe0ZGk9syRUSITDeAR5ObpOMKOKCNYVVZjGLtY1h5hYrWtOa6sOAvw+gvJ/B53GbJXVoYU4C/eUH4djuAQ02QOG/4jhOO7O/XCtDtNbSv7IV4I=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(346002)(376002)(136003)(36840700001)(46966006)(47076005)(82740400003)(356005)(7636003)(36756003)(82310400003)(6666004)(1076003)(54906003)(7696005)(107886003)(36906005)(2616005)(8936002)(2906002)(316002)(8676002)(9786002)(6916009)(26005)(186003)(4326008)(5660300002)(70206006)(478600001)(426003)(70586007)(336012)(36860700001)(44832011)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 17:49:30.0367 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe332b0f-69af-4f01-95fa-08d9665e5bb6
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT008.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4574
Received-SPF: pass client-ip=40.107.94.43; envelope-from=tongh@xilinx.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: edgar.iglesias@gmail.com, alistair@alistair23.me, tong.ho@xilinx.com,
 qemu-devel@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Connect the support for Versal eFUSE one-time field-programmable
bit array.

Signed-off-by: Tong Ho <tong.ho@xilinx.com>
---
 hw/arm/xlnx-versal-virt.c    | 37 ++++++++++++++++++++++++++++++++++
 hw/arm/xlnx-versal.c         | 39 ++++++++++++++++++++++++++++++++++++
 include/hw/arm/xlnx-versal.h | 12 +++++++++++
 3 files changed, 88 insertions(+)

diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index d9e2a6a853..5c72b9ba4b 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -376,6 +376,41 @@ static void fdt_add_bbram_node(VersalVirt *s)
     g_free(name);
 }
 
+static void fdt_add_efuse_ctrl_node(VersalVirt *s)
+{
+    const char compat[] = TYPE_XLNX_VERSAL_EFUSE_CTRL;
+    const char interrupt_names[] = "pmc_efuse";
+    char *name = g_strdup_printf("/pmc_efuse@%x", MM_PMC_EFUSE_CTRL);
+
+    qemu_fdt_add_subnode(s->fdt, name);
+
+    qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
+                           GIC_FDT_IRQ_TYPE_SPI, VERSAL_EFUSE_IRQ,
+                           GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+    qemu_fdt_setprop(s->fdt, name, "interrupt-names",
+                     interrupt_names, sizeof(interrupt_names));
+    qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
+                                 2, MM_PMC_EFUSE_CTRL,
+                                 2, MM_PMC_EFUSE_CTRL_SIZE);
+    qemu_fdt_setprop(s->fdt, name, "compatible", compat, sizeof(compat));
+    g_free(name);
+}
+
+static void fdt_add_efuse_cache_node(VersalVirt *s)
+{
+    const char compat[] = TYPE_XLNX_VERSAL_EFUSE_CACHE;
+    char *name = g_strdup_printf("/xlnx_pmc_efuse_cache@%x",
+                                 MM_PMC_EFUSE_CACHE);
+
+    qemu_fdt_add_subnode(s->fdt, name);
+
+    qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
+                                 2, MM_PMC_EFUSE_CACHE,
+                                 2, MM_PMC_EFUSE_CACHE_SIZE);
+    qemu_fdt_setprop(s->fdt, name, "compatible", compat, sizeof(compat));
+    g_free(name);
+}
+
 static void fdt_nop_memory_nodes(void *fdt, Error **errp)
 {
     Error *err = NULL;
@@ -591,6 +626,8 @@ static void versal_virt_init(MachineState *machine)
     fdt_add_sd_nodes(s);
     fdt_add_rtc_node(s);
     fdt_add_bbram_node(s);
+    fdt_add_efuse_ctrl_node(s);
+    fdt_add_efuse_cache_node(s);
     fdt_add_cpu_nodes(s, psci_conduit);
     fdt_add_clk_node(s, "/clk125", 125000000, s->phandle.clk_125Mhz);
     fdt_add_clk_node(s, "/clk25", 25000000, s->phandle.clk_25Mhz);
diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index 46d7f42a6b..d278d6e0f4 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -329,6 +329,44 @@ static void versal_create_bbram(Versal *s, qemu_irq *pic)
     sysbus_connect_irq(sbd, 0, pic[VERSAL_BBRAM_APB_IRQ_0]);
 }
 
+static void versal_realize_efuse_part(Versal *s, Object *dev, hwaddr base)
+{
+    SysBusDevice *part = SYS_BUS_DEVICE(dev);
+
+    object_property_set_link(OBJECT(part), "efuse",
+                             OBJECT(&s->pmc.efuse.bits), &error_abort);
+
+    sysbus_realize(part, &error_abort);
+    memory_region_add_subregion(&s->mr_ps, base,
+                                sysbus_mmio_get_region(part, 0));
+}
+
+static void versal_create_efuse(Versal *s, qemu_irq *pic)
+{
+    Object *bits = OBJECT(&s->pmc.efuse.bits);
+    Object *ctrl = OBJECT(&s->pmc.efuse.ctrl);
+    Object *cache = OBJECT(&s->pmc.efuse.cache);
+
+    object_initialize_child(OBJECT(s), "efuse-ctrl", &s->pmc.efuse.ctrl,
+                            TYPE_XLNX_VERSAL_EFUSE_CTRL);
+
+    object_initialize_child(OBJECT(s), "efuse-cache", &s->pmc.efuse.cache,
+                            TYPE_XLNX_VERSAL_EFUSE_CACHE);
+
+    object_initialize_child_with_props(ctrl, "efuse-bits", bits,
+                                       sizeof(s->pmc.efuse.bits),
+                                       TYPE_XLNX_EFUSE, &error_abort,
+                                       "efuse-nr", "3",
+                                       "efuse-size", "8192",
+                                       NULL);
+
+    qdev_realize(DEVICE(bits), NULL, &error_abort);
+    versal_realize_efuse_part(s, ctrl, MM_PMC_EFUSE_CTRL);
+    versal_realize_efuse_part(s, cache, MM_PMC_EFUSE_CACHE);
+
+    sysbus_connect_irq(SYS_BUS_DEVICE(ctrl), 0, pic[VERSAL_EFUSE_IRQ]);
+}
+
 /* This takes the board allocated linear DDR memory and creates aliases
  * for each split DDR range/aperture on the Versal address map.
  */
@@ -416,6 +454,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
     versal_create_rtc(s, pic);
     versal_create_xrams(s, pic);
     versal_create_bbram(s, pic);
+    versal_create_efuse(s, pic);
     versal_map_ddr(s);
     versal_unimp(s);
 
diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index 7719e8c4d2..33b89f00b6 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -25,6 +25,7 @@
 #include "hw/usb/xlnx-usb-subsystem.h"
 #include "hw/misc/xlnx-versal-xramc.h"
 #include "hw/nvram/xlnx-bbram.h"
+#include "hw/nvram/xlnx-versal-efuse.h"
 
 #define TYPE_XLNX_VERSAL "xlnx-versal"
 OBJECT_DECLARE_SIMPLE_TYPE(Versal, XLNX_VERSAL)
@@ -81,6 +82,11 @@ struct Versal {
 
         XlnxZynqMPRTC rtc;
         XlnxBBRam bbram;
+        struct {
+            XlnxVersalEFuseCtrl ctrl;
+            XlnxVersalEFuseCache cache;
+            XLNXEFuse bits;
+        } efuse;
     } pmc;
 
     struct {
@@ -110,6 +116,7 @@ struct Versal {
 #define VERSAL_BBRAM_APB_IRQ_0     121
 #define VERSAL_RTC_APB_ERR_IRQ     121
 #define VERSAL_SD0_IRQ_0           126
+#define VERSAL_EFUSE_IRQ           139
 #define VERSAL_RTC_ALARM_IRQ       142
 #define VERSAL_RTC_SECONDS_IRQ     143
 
@@ -175,6 +182,11 @@ struct Versal {
 #define MM_PMC_SD0_SIZE             0x10000
 #define MM_PMC_BBRAM_CTRL           0xf11f0000
 #define MM_PMC_BBRAM_CTRL_SIZE      0x00050
+#define MM_PMC_EFUSE_CTRL           0xf1240000
+#define MM_PMC_EFUSE_CTRL_SIZE      0x00104
+#define MM_PMC_EFUSE_CACHE          0xf1250000
+#define MM_PMC_EFUSE_CACHE_SIZE     0x00C00
+
 #define MM_PMC_CRP                  0xf1260000U
 #define MM_PMC_CRP_SIZE             0x10000
 #define MM_PMC_RTC                  0xf12a0000
-- 
2.25.1


