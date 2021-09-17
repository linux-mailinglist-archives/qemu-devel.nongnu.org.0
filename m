Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 492E940F19B
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 07:28:32 +0200 (CEST)
Received: from localhost ([::1]:36278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR6QI-0005nl-N4
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 01:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mR6MA-0002O8-7I; Fri, 17 Sep 2021 01:24:14 -0400
Received: from mail-dm6nam12on2044.outbound.protection.outlook.com
 ([40.107.243.44]:13312 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mR6M6-0005vC-57; Fri, 17 Sep 2021 01:24:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GussRz3Sw3ZOmEFdn7Th23f+bmJT/oR6iL6tFidOoNId65dmwpB9Uo7ozv59ugYGnl3R9pozjS0Osu7iasukZQidq72LPkv6OqkB9az0e+byG913Ol3JTQFiBN90a+83QwdPWdZyb7+dYT1KHzxSWwevhBigdqIX4wa9LEAKM/pzLdHxn7onX7gadtjy3jOZTkVvaW9JMcW5LP9G+V6cI25EEh2jMLviK4Dyz2JA7WXgr7L+F3OLqAPBxHHSAEoulbmn74q9aGscVW6lfXfO22jEkOdDv7agwz48wFCLurIjpZgaU8whhCPvUEL4vgtn5VFv6St+RurWNgBBmIxoIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=c3P8YB8cLQTp4AWXVyThGp96CN4/DArFrdENJ8fk9Gg=;
 b=Brigq9Ng4SrRq1QVgH9DzELGvY5cuFnTvZMIzx07fXvwHnKXiHDHJ5WNZ9CyyiAs48cRTPVAsymVmnlDpFZvkkv8QKA3X1KmhL8XBu3V+FvWrTpZrRIFuVoF2am53IS3Sy39peCU8DERYzzavBOrhd77btZOJjWy12wWnpVrMPUxJcDIezs56/iJBjheDiLjkjmHi/0PDsQ+3rqe+K9ouKQ8BxZ2U8C7vFsiIN4WXoeewgwfVL1hOJXLyBcbktFMNt79ijTTz4vtV+ZI68Kg0HhinQPp+17XyOJaa3k2ZxnIDsHVckq0Co1Xq1mkYaRMQV8b2hmmguKXYMU1lhYrcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c3P8YB8cLQTp4AWXVyThGp96CN4/DArFrdENJ8fk9Gg=;
 b=jJSbBMC2XvB387WLJgT09/dZWKlLtjZspJQ94HU9dEc4zZq3DbXt0iB6sfTBnUMs0Q8u+eddO6nkTmWUdQWsEUtr86AVPsRTpiHjnTcgC/KBhJaq9yVQAotMZR86ZuK9PIzieoy/VnqrKHBRmiJyL3L6smFKaS83rVhy7M5CllI=
Received: from DM3PR12CA0057.namprd12.prod.outlook.com (2603:10b6:0:56::25) by
 SN1PR02MB3774.namprd02.prod.outlook.com (2603:10b6:802:30::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.18; Fri, 17 Sep 2021 05:24:04 +0000
Received: from DM3NAM02FT037.eop-nam02.prod.protection.outlook.com
 (2603:10b6:0:56:cafe::6e) by DM3PR12CA0057.outlook.office365.com
 (2603:10b6:0:56::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Fri, 17 Sep 2021 05:24:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT037.mail.protection.outlook.com (10.13.4.166) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 05:24:04 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 16 Sep 2021 22:24:00 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 16 Sep 2021 22:24:00 -0700
Received: from [172.19.2.40] (port=58118 helo=xsjtongh40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <tong.ho@xilinx.com>)
 id 1mR6Lw-0005Y7-Ts; Thu, 16 Sep 2021 22:24:00 -0700
From: Tong Ho <tong.ho@xilinx.com>
To: <qemu-arm@nongnu.org>
Subject: [PATCH v3 5/9] hw/arm: xlnx-versal-virt: Add Xilinx BBRAM device
Date: Thu, 16 Sep 2021 22:23:56 -0700
Message-ID: <20210917052400.1249094-6-tong.ho@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917052400.1249094-1-tong.ho@xilinx.com>
References: <20210917052400.1249094-1-tong.ho@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16d2295d-ed8e-472d-1cbe-08d9799b5d4a
X-MS-TrafficTypeDiagnostic: SN1PR02MB3774:
X-Microsoft-Antispam-PRVS: <SN1PR02MB37749505198611D2C0BD7813CDDD9@SN1PR02MB3774.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:257;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vCZjlzCxK1GRIdDfwepm9s0U1gnSYlJ6abAy3bf9irthpvbBU62TLsyVg5Dr/zzqQo0gDKPNBqTV6pPcy09hxM6N/Mycgylu6ZEt3Cju5jb0GrypU3m9XpWL5eyFNehSbK/dCALtuwkgmDDRpzBtiXOreiESlECwkPWyMfZOFOBMhrBC1oj3Ahy/qwYKztuSAR99NaoGcdL5FHco4GCD/ewOFHdZDMalRh21aJ6Oya71HITRcOhHlc+5zrpc4EZYEfnx6OBmNY1zyt72MxYjRcXyUH7CoE/bdcawpFm8JYK8g2slEtHloYZ4XRoqKnb9rRuAHSpEyWCz5KzmFdLs+d0k/3bUEoiC01O6T+rte6ncYoSx1LYvHUbFk8rEm/ii43+wf2a3XZfSKXEbHigpvu6UFCdDse4Z4AOX86r9eewEIVwhguKnVZvsOZ/yz591LZZSiuGMvSmp/CXI/sNspgG6upfTyWL25jz3He8gr9l9X/BjhQ14xOZJhdjMkIHcvg4w0oTF3J6JqjafbSLN3W7ViF3mnMMxb46mE34cuOt0vO7hKLDZFlWlxstABej1EeiWI6sUppODNYufbF8z/XoXxXeC76TEySSsftR1OCRFD1VI7H/ubhmCXeapsay5sIwUemdgGkCwW6k8KtxRGSdcUvJLuHNZcKSy5eVeh/tzhdBn6ZQyQtXdPrhLqt1eoaXhefu+ccF7B+8R5ZfGl5x9onEozpyDC6n6+ZW7c0U=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(36840700001)(46966006)(47076005)(36756003)(26005)(356005)(2616005)(478600001)(6666004)(83380400001)(2906002)(70586007)(7696005)(36860700001)(44832011)(5660300002)(82310400003)(36906005)(9786002)(7636003)(54906003)(4326008)(336012)(8936002)(70206006)(6916009)(8676002)(426003)(1076003)(316002)(82740400003)(107886003)(186003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 05:24:04.0756 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d2295d-ed8e-472d-1cbe-08d9799b5d4a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT037.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB3774
Received-SPF: pass client-ip=40.107.243.44; envelope-from=tongh@xilinx.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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

Connect the support for Versal Battery-Backed RAM (BBRAM)

The command argument:
  -drive if=pflash,index=0,...
Can be used to optionally connect the bbram to a backend
storage, such that field-programmed values in one
invocation can be made available to next invocation.

The backend storage must be a seekable binary file, and
its size must be 36 bytes or larger. A file with all
binary 0's is a 'blank'.

Signed-off-by: Tong Ho <tong.ho@xilinx.com>
---
 hw/arm/Kconfig               |  1 +
 hw/arm/xlnx-versal-virt.c    | 36 ++++++++++++++++++++++++++++++++++++
 hw/arm/xlnx-versal.c         | 18 ++++++++++++++++++
 include/hw/arm/xlnx-versal.h |  5 +++++
 4 files changed, 60 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 78fdd1b935..f92fb9e568 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -381,6 +381,7 @@ config XLNX_VERSAL
     select XLNX_ZDMA
     select XLNX_ZYNQMP
     select OR_IRQ
+    select XLNX_BBRAM
 
 config NPCM7XX
     bool
diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 5bca360dce..e1c5ead475 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -356,6 +356,26 @@ static void fdt_add_rtc_node(VersalVirt *s)
     g_free(name);
 }
 
+static void fdt_add_bbram_node(VersalVirt *s)
+{
+    const char compat[] = TYPE_XLNX_BBRAM;
+    const char interrupt_names[] = "bbram-error";
+    char *name = g_strdup_printf("/bbram@%x", MM_PMC_BBRAM_CTRL);
+
+    qemu_fdt_add_subnode(s->fdt, name);
+
+    qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
+                           GIC_FDT_IRQ_TYPE_SPI, VERSAL_BBRAM_APB_IRQ_0,
+                           GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+    qemu_fdt_setprop(s->fdt, name, "interrupt-names",
+                     interrupt_names, sizeof(interrupt_names));
+    qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
+                                 2, MM_PMC_BBRAM_CTRL,
+                                 2, MM_PMC_BBRAM_CTRL_SIZE);
+    qemu_fdt_setprop(s->fdt, name, "compatible", compat, sizeof(compat));
+    g_free(name);
+}
+
 static void fdt_nop_memory_nodes(void *fdt, Error **errp)
 {
     Error *err = NULL;
@@ -510,6 +530,18 @@ static void create_virtio_regions(VersalVirt *s)
     }
 }
 
+static void bbram_attach_drive(XlnxBBRam *dev)
+{
+    DriveInfo *dinfo;
+    BlockBackend *blk;
+
+    dinfo = drive_get_by_index(IF_PFLASH, 0);
+    blk = dinfo ? blk_by_legacy_dinfo(dinfo) : NULL;
+    if (blk) {
+        qdev_prop_set_drive(DEVICE(dev), "drive", blk);
+    }
+}
+
 static void sd_plugin_card(SDHCIState *sd, DriveInfo *di)
 {
     BlockBackend *blk = di ? blk_by_legacy_dinfo(di) : NULL;
@@ -570,6 +602,7 @@ static void versal_virt_init(MachineState *machine)
     fdt_add_usb_xhci_nodes(s);
     fdt_add_sd_nodes(s);
     fdt_add_rtc_node(s);
+    fdt_add_bbram_node(s);
     fdt_add_cpu_nodes(s, psci_conduit);
     fdt_add_clk_node(s, "/clk125", 125000000, s->phandle.clk_125Mhz);
     fdt_add_clk_node(s, "/clk25", 25000000, s->phandle.clk_25Mhz);
@@ -579,6 +612,9 @@ static void versal_virt_init(MachineState *machine)
     memory_region_add_subregion_overlap(get_system_memory(),
                                         0, &s->soc.fpd.apu.mr, 0);
 
+    /* Attach bbram backend, if given */
+    bbram_attach_drive(&s->soc.pmc.bbram);
+
     /* Plugin SD cards.  */
     for (i = 0; i < ARRAY_SIZE(s->soc.pmc.iou.sd); i++) {
         sd_plugin_card(&s->soc.pmc.iou.sd[i], drive_get_next(IF_SD));
diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index 547a26603a..23451ae012 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -314,6 +314,23 @@ static void versal_create_xrams(Versal *s, qemu_irq *pic)
     }
 }
 
+static void versal_create_bbram(Versal *s, qemu_irq *pic)
+{
+    SysBusDevice *sbd;
+
+    object_initialize_child_with_props(OBJECT(s), "bbram", &s->pmc.bbram,
+                                       sizeof(s->pmc.bbram), TYPE_XLNX_BBRAM,
+                                       &error_fatal,
+                                       "crc-zpads", "0",
+                                       NULL);
+    sbd = SYS_BUS_DEVICE(&s->pmc.bbram);
+
+    sysbus_realize(sbd, &error_fatal);
+    memory_region_add_subregion(&s->mr_ps, MM_PMC_BBRAM_CTRL,
+                                sysbus_mmio_get_region(sbd, 0));
+    sysbus_connect_irq(sbd, 0, pic[VERSAL_BBRAM_APB_IRQ_0]);
+}
+
 /* This takes the board allocated linear DDR memory and creates aliases
  * for each split DDR range/aperture on the Versal address map.
  */
@@ -402,6 +419,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
     versal_create_sds(s, pic);
     versal_create_rtc(s, pic);
     versal_create_xrams(s, pic);
+    versal_create_bbram(s, pic);
     versal_map_ddr(s);
     versal_unimp(s);
 
diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index 9b79051747..1cac613338 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -24,6 +24,7 @@
 #include "qom/object.h"
 #include "hw/usb/xlnx-usb-subsystem.h"
 #include "hw/misc/xlnx-versal-xramc.h"
+#include "hw/nvram/xlnx-bbram.h"
 
 #define TYPE_XLNX_VERSAL "xlnx-versal"
 OBJECT_DECLARE_SIMPLE_TYPE(Versal, XLNX_VERSAL)
@@ -79,6 +80,7 @@ struct Versal {
         } iou;
 
         XlnxZynqMPRTC rtc;
+        XlnxBBRam bbram;
     } pmc;
 
     struct {
@@ -105,6 +107,7 @@ struct Versal {
 #define VERSAL_GEM1_WAKE_IRQ_0     59
 #define VERSAL_ADMA_IRQ_0          60
 #define VERSAL_XRAM_IRQ_0          79
+#define VERSAL_BBRAM_APB_IRQ_0     121
 #define VERSAL_RTC_APB_ERR_IRQ     121
 #define VERSAL_SD0_IRQ_0           126
 #define VERSAL_RTC_ALARM_IRQ       142
@@ -172,6 +175,8 @@ struct Versal {
 
 #define MM_PMC_SD0                  0xf1040000U
 #define MM_PMC_SD0_SIZE             0x10000
+#define MM_PMC_BBRAM_CTRL           0xf11f0000
+#define MM_PMC_BBRAM_CTRL_SIZE      0x00050
 #define MM_PMC_CRP                  0xf1260000U
 #define MM_PMC_CRP_SIZE             0x10000
 #define MM_PMC_RTC                  0xf12a0000
-- 
2.25.1


