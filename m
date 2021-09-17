Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E162340F1A5
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 07:33:25 +0200 (CEST)
Received: from localhost ([::1]:50358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR6V3-0006um-0X
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 01:33:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mR6MI-0002hF-Nd; Fri, 17 Sep 2021 01:24:22 -0400
Received: from mail-dm6nam11on2078.outbound.protection.outlook.com
 ([40.107.223.78]:10849 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mR6MG-000632-Sl; Fri, 17 Sep 2021 01:24:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AFdNxnw3RGvjwB8fRA/ep74xjl3qFX1ARcKgswWIM4uKeB361WUCdu/lAeDAqi5tjZZEyWUjc3OsJMTG2iGqz+h++1Jl/1iqO/73HorFpNrjVQ4uWc4f/+Z0fF5GWMi1WcXiN6Ox3PlRxA3emwz2fPaJ83IfNhjDVN33pzdA2L77i4Qn1vS7iD9B5cI0Hgk4GQZpPjdKO6PUkgkyyPewX1nliqqsAhNSg9P312ucR9cpm9LcdOVgjISlCeV6kzR5z0ok0hzj4dj5tSmdW5qvaiVvYeoEQOMD8+4H4vpSXkOefn/Ts7ZvEu9j4nvJPza541dytntVINRcEzoI3jvz6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=zGwc9UnhB1o5h+zFcAs1b+jEaSzzcTzLNYtWwq595Tw=;
 b=NIDuZKfetkey38lSoSzL+RiP4bSUNkHVDNBNHJLLIHPzLGBi30Q1Cb4ggN4PzXY1xMb8P0kEHwihw+6KBOleOUSqO1KLHvCdrAQTv1nbDbDGDdXDPMQmJ0Wo3U7lgqcNyBNXazyAjgJMchQI1P2IWFKOAaFfIJBH0VqrMj0N7PXdM/YAttVbCGy+MgGj178hyNZ57MHm+J/U1mSTkWAdILE96RSZp54bpol+72KGqfQXYKFLD3R5MoEb9sFN2T67z00OVa1bqYjbIUl9rcyrPHrPcdobeM2jj835t7nQNlKzcVrp9yE1nitlso9bjGXlCYmkr9XdxW2WdqkqoWfa3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zGwc9UnhB1o5h+zFcAs1b+jEaSzzcTzLNYtWwq595Tw=;
 b=jywZYFujWG1OC+oNsnCV5VFLVQtiDx2Ok44pPsCsSpAIf1zX72v08gqNpwtANW6YvnvXi2+2eUiQ3Rnfn0kBBA7ZpvD32qUW1I+NUtye7+w0QQVHi1kRZaytnKh4Fp/WLfzfpMItEu8JqdK6II3WyCINIt7xhS6KXapxf9wrncM=
Received: from DM3PR12CA0060.namprd12.prod.outlook.com (2603:10b6:0:56::28) by
 BL0PR02MB4754.namprd02.prod.outlook.com (2603:10b6:208:5d::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16; Fri, 17 Sep 2021 05:24:12 +0000
Received: from DM3NAM02FT037.eop-nam02.prod.protection.outlook.com
 (2603:10b6:0:56:cafe::cd) by DM3PR12CA0060.outlook.office365.com
 (2603:10b6:0:56::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Fri, 17 Sep 2021 05:24:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT037.mail.protection.outlook.com (10.13.4.166) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 05:24:12 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 16 Sep 2021 22:24:01 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 16 Sep 2021 22:24:00 -0700
Received: from [172.19.2.40] (port=58118 helo=xsjtongh40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <tong.ho@xilinx.com>)
 id 1mR6Lw-0005Y7-US; Thu, 16 Sep 2021 22:24:00 -0700
From: Tong Ho <tong.ho@xilinx.com>
To: <qemu-arm@nongnu.org>
Subject: [PATCH v3 6/9] hw/arm: xlnx-versal-virt: Add Xilinx eFUSE device
Date: Thu, 16 Sep 2021 22:23:57 -0700
Message-ID: <20210917052400.1249094-7-tong.ho@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917052400.1249094-1-tong.ho@xilinx.com>
References: <20210917052400.1249094-1-tong.ho@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48bbed9c-0bfa-4ecb-8ede-08d9799b6273
X-MS-TrafficTypeDiagnostic: BL0PR02MB4754:
X-Microsoft-Antispam-PRVS: <BL0PR02MB4754AED0EDF2572C25BE60B5CDDD9@BL0PR02MB4754.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:257;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qxSd4mmpNoEoTBJ11wAEiwAC+fKroNmaDsUUK+H0jsmoLIh66wLfvUzFKlCw8jWX5Lu77aJA54MhFsAzFS/O/ls1iu680R1s7GO2bdUYYXo5UyohDXlErvaZ+n6wUGWkHUpstuF/05ttYaQopcLO4aKvJNsQjk8Rlc88nCQogqoC/3CXS31zI4p7q4qLiNoPrMmmufTt/qlWsO2vG2oHMVfxTi9CQOolQreGvNvOXQVkA7bpBV7m8GmHgh2dRF3uqSvb4bvPITeebuYypbM5zfiXOrrXljqpCQUXVbxOAAphwlZenmhvP5OFcGdXYukDzzTLJrfQksYxzKEhO2FAA4sQCUS1AANlZLiOSJHamP/Lt3S3b4COEbC0HemB+UzxeOFCEr6MIKQFTnlnkjNM6pp8zxTV9Ji8H9uP2GGParHstGLQF+PjO8ngTIB3wvlvyLsw/Xw6Dp7M/BqhNBRG8VdxbIEDAFwvWJc9LGBCZw26l4dBw2mDxLGDDUWxLqEO7jkeIUdKCxjgRbbl7E7IB19FZojCec1DXd59+ncR4YEW/o+AT35MR3tKXp4QI3gNLffX7t2sp9HSFDqtP0YVF3gc0dlJdnrg7b+wAVDgiJ5lCQaK3jEWO5pcW7Uig6l6ozuPfqTZbWW9qhEMbLgzRjpt359rYQdnmb27UmFmofjo71quv3r/TBe6p5Ll6LNGgLZ2k0BpPL++cQBF3t5k+CNbxr2lvHkgQ6GOEl7l0SQ=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(46966006)(36840700001)(107886003)(8936002)(1076003)(26005)(8676002)(82310400003)(478600001)(6666004)(2906002)(336012)(4326008)(426003)(70586007)(7696005)(186003)(5660300002)(83380400001)(9786002)(54906003)(44832011)(316002)(36906005)(36860700001)(47076005)(6916009)(356005)(7636003)(36756003)(82740400003)(70206006)(2616005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 05:24:12.7348 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48bbed9c-0bfa-4ecb-8ede-08d9799b6273
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT037.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4754
Received-SPF: pass client-ip=40.107.223.78; envelope-from=tongh@xilinx.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The command argument:
  -drive if=pflash,index=1,...
Can be used to optionally connect the bit array to a
backend storage, such that field-programmed values
in one invocation can be made available to next
invocation.

The backend storage must be a seekable binary file, and
its size must be 3072 bytes or larger. A file with all
binary 0's is a 'blank'.

Signed-off-by: Tong Ho <tong.ho@xilinx.com>
---
 hw/arm/Kconfig               |  1 +
 hw/arm/xlnx-versal-virt.c    | 52 ++++++++++++++++++++++++++++++++++++
 hw/arm/xlnx-versal.c         | 39 +++++++++++++++++++++++++++
 include/hw/arm/xlnx-versal.h | 10 +++++++
 4 files changed, 102 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index f92fb9e568..9edc05782d 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -382,6 +382,7 @@ config XLNX_VERSAL
     select XLNX_ZYNQMP
     select OR_IRQ
     select XLNX_BBRAM
+    select XLNX_EFUSE_VERSAL
 
 config NPCM7XX
     bool
diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index e1c5ead475..d2f55e29b6 100644
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
@@ -542,6 +577,18 @@ static void bbram_attach_drive(XlnxBBRam *dev)
     }
 }
 
+static void efuse_attach_drive(XlnxEFuse *dev)
+{
+    DriveInfo *dinfo;
+    BlockBackend *blk;
+
+    dinfo = drive_get_by_index(IF_PFLASH, 1);
+    blk = dinfo ? blk_by_legacy_dinfo(dinfo) : NULL;
+    if (blk) {
+        qdev_prop_set_drive(DEVICE(dev), "drive", blk);
+    }
+}
+
 static void sd_plugin_card(SDHCIState *sd, DriveInfo *di)
 {
     BlockBackend *blk = di ? blk_by_legacy_dinfo(di) : NULL;
@@ -603,6 +650,8 @@ static void versal_virt_init(MachineState *machine)
     fdt_add_sd_nodes(s);
     fdt_add_rtc_node(s);
     fdt_add_bbram_node(s);
+    fdt_add_efuse_ctrl_node(s);
+    fdt_add_efuse_cache_node(s);
     fdt_add_cpu_nodes(s, psci_conduit);
     fdt_add_clk_node(s, "/clk125", 125000000, s->phandle.clk_125Mhz);
     fdt_add_clk_node(s, "/clk25", 25000000, s->phandle.clk_25Mhz);
@@ -615,6 +664,9 @@ static void versal_virt_init(MachineState *machine)
     /* Attach bbram backend, if given */
     bbram_attach_drive(&s->soc.pmc.bbram);
 
+    /* Attach efuse backend, if given */
+    efuse_attach_drive(&s->soc.pmc.efuse);
+
     /* Plugin SD cards.  */
     for (i = 0; i < ARRAY_SIZE(s->soc.pmc.iou.sd); i++) {
         sd_plugin_card(&s->soc.pmc.iou.sd[i], drive_get_next(IF_SD));
diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index 23451ae012..b2705b6925 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -331,6 +331,44 @@ static void versal_create_bbram(Versal *s, qemu_irq *pic)
     sysbus_connect_irq(sbd, 0, pic[VERSAL_BBRAM_APB_IRQ_0]);
 }
 
+static void versal_realize_efuse_part(Versal *s, Object *dev, hwaddr base)
+{
+    SysBusDevice *part = SYS_BUS_DEVICE(dev);
+
+    object_property_set_link(OBJECT(part), "efuse",
+                             OBJECT(&s->pmc.efuse), &error_abort);
+
+    sysbus_realize(part, &error_abort);
+    memory_region_add_subregion(&s->mr_ps, base,
+                                sysbus_mmio_get_region(part, 0));
+}
+
+static void versal_create_efuse(Versal *s, qemu_irq *pic)
+{
+    Object *bits = OBJECT(&s->pmc.efuse);
+    Object *ctrl = OBJECT(&s->pmc.efuse_ctrl);
+    Object *cache = OBJECT(&s->pmc.efuse_cache);
+
+    object_initialize_child(OBJECT(s), "efuse-ctrl", &s->pmc.efuse_ctrl,
+                            TYPE_XLNX_VERSAL_EFUSE_CTRL);
+
+    object_initialize_child(OBJECT(s), "efuse-cache", &s->pmc.efuse_cache,
+                            TYPE_XLNX_VERSAL_EFUSE_CACHE);
+
+    object_initialize_child_with_props(ctrl, "xlnx-efuse@0", bits,
+                                       sizeof(s->pmc.efuse),
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
@@ -420,6 +458,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
     versal_create_rtc(s, pic);
     versal_create_xrams(s, pic);
     versal_create_bbram(s, pic);
+    versal_create_efuse(s, pic);
     versal_map_ddr(s);
     versal_unimp(s);
 
diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index 1cac613338..895ba12c61 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -25,6 +25,7 @@
 #include "hw/usb/xlnx-usb-subsystem.h"
 #include "hw/misc/xlnx-versal-xramc.h"
 #include "hw/nvram/xlnx-bbram.h"
+#include "hw/nvram/xlnx-versal-efuse.h"
 
 #define TYPE_XLNX_VERSAL "xlnx-versal"
 OBJECT_DECLARE_SIMPLE_TYPE(Versal, XLNX_VERSAL)
@@ -81,6 +82,9 @@ struct Versal {
 
         XlnxZynqMPRTC rtc;
         XlnxBBRam bbram;
+        XlnxEFuse efuse;
+        XlnxVersalEFuseCtrl efuse_ctrl;
+        XlnxVersalEFuseCache efuse_cache;
     } pmc;
 
     struct {
@@ -110,6 +114,7 @@ struct Versal {
 #define VERSAL_BBRAM_APB_IRQ_0     121
 #define VERSAL_RTC_APB_ERR_IRQ     121
 #define VERSAL_SD0_IRQ_0           126
+#define VERSAL_EFUSE_IRQ           139
 #define VERSAL_RTC_ALARM_IRQ       142
 #define VERSAL_RTC_SECONDS_IRQ     143
 
@@ -177,6 +182,11 @@ struct Versal {
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


