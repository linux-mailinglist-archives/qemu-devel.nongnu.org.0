Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 277BA645003
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 01:10:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2hzf-0006ry-2H; Tue, 06 Dec 2022 19:08:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1p2hzc-0006or-2F; Tue, 06 Dec 2022 19:08:56 -0500
Received: from mail-mw2nam10on2061d.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::61d]
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1p2hzV-00008h-UH; Tue, 06 Dec 2022 19:08:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RTsUdsa2W4mPUZ54HX2AjtoIot7CMq/uIfcHwWmET02IzOKSWqB30mLZ35bpnlT95WGFkJibfZrZ5eKKOwq0sU77E0zW6NjQjPIeBxa7kyICk+r21pz28amUkCFcLqLh+O1vACBrFyzH/tMpennbLqZWzBAvSfxF/N7j7W0AMRBf4xhDd1BsphyPzlE032DgfksHt+OtGAukwfP6f2fTCUaGIASYY6fGHDcRaSEluUb5S5qla/o5jerOqa08xwT4UOBG0KqrYC+A38egGC11IP7fJyHqjpy4I+DGMb7lPh76vEKR2bE45Yvv62oaywpW0+1lvKHmdn1qrqN+arO0UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rD+0ciH7TjjgpwMFM/ZqnTOFSYmEFzGkAum1rmsd560=;
 b=iVAFyoTgnb3oFAV8Wz/VSUYnTY7vpL3Mq1wCF+Dpsi8zYFJf+Zh8IMfdeY579d2NaLcrbugli0izyJnuD4vYDQjtzy5xOSivP15m4bA31kDf8/hzbMv+D2/Kn1WooNcsaYtRW4rhHfLsVtKpOQ887sJ/uJiTcV2KAjp9hb3o0V/iLvqvI62ZdGvpEGJkE1FAnCGRv3qko86tteb3kCk0/lTNEewukhFVSutvEGfKnt8kknL7vu+FQ6rBqKMXBX2AGcjpThwjUEzndCW007nOFKaSW361aXi5rSKSYQ4Hmz3bwTvfsyETycQ3OwMpIbPAgZxEYQgE6QnemIoRsCtjdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xilinx.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rD+0ciH7TjjgpwMFM/ZqnTOFSYmEFzGkAum1rmsd560=;
 b=NC6YegrToG41WZLIKIssn/9lK6eAwfb4wNvVzfBM378HC2m5WBrnhIfc/4onPSxkQ8W9oS81lcgishxWm6GG94cJDhd4M32GtoYse3hHwWZXpjjlOnxyQ7Ksxsjjig72wN7n4AgaXwC95kvVBGkj/mbTZ1Icm7zf2HSJ2Fo8Kyw=
Received: from BN0PR04CA0187.namprd04.prod.outlook.com (2603:10b6:408:e9::12)
 by DM8PR12MB5413.namprd12.prod.outlook.com (2603:10b6:8:3b::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.14; Wed, 7 Dec 2022 00:08:45 +0000
Received: from BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e9:cafe::fa) by BN0PR04CA0187.outlook.office365.com
 (2603:10b6:408:e9::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Wed, 7 Dec 2022 00:08:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT065.mail.protection.outlook.com (10.13.177.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.14 via Frontend Transport; Wed, 7 Dec 2022 00:08:45 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Dec
 2022 18:08:44 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Dec
 2022 18:08:44 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 6 Dec 2022 18:08:43 -0600
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-dev@xilinx.com>
CC: <francisco.iglesias@amd.com>, <peter.maydell@linaro.org>,
 <vikram.garhwal@amd.com>, Alistair Francis <alistair@alistair23.me>, "Edgar
 E. Iglesias" <edgar.iglesias@gmail.com>, "open list:Xilinx ZynqMP and..."
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [QEMU][PATCH v3 3/4] xlnx-zynqmp: Connect Xilinx VERSAL CANFD
 controllers
Date: Tue, 6 Dec 2022 16:08:24 -0800
Message-ID: <20221207000825.7303-5-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221207000825.7303-1-vikram.garhwal@amd.com>
References: <20221207000825.7303-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT065:EE_|DM8PR12MB5413:EE_
X-MS-Office365-Filtering-Correlation-Id: cf7a2179-a554-4223-b156-08dad7e734f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jDcW9KKg5MBFfR7XQ+WO+F1z9yzhCA0qy/MMUvJ4wPcw3I92rW9Bd0qQ6eMSjOdMpt0e4DIPiqj+ODrL97ksLsole3H5q4Jsk+vv/uf/vhhLX0sTbzI/DBQK6iFSN8D2PItcJ/Lw5DGzvxAlGh8gdXf19I7w01PCSzqgfGL+30w0mTmiDwiciR+93uvuAdfPREOIRqYL4UWH1swffsWQKpDO7/AKCHe3qYuZsXR8Er2dOiXobgj1j1wUGZ8OuAOnVaqwBQlXtkoaxutQeOwlk+47FKdc2Ud+smY7XxgMjyss19fQxIyjnXw9ZbcWbOzEll7cXqV62XzyzD12ol79yv9d5i7GiIxuc9IqYmgXYpj2du0AUcwUTj7GRj+FRRQclxAYd8nm+7/IROgVT5alvK2+cgu+HXAoC1JgFr6y3SuTLQ/XUBZLSy4eODYdtEvNvDLLHEH5LHqFwO/scKq37IVDclvpqox69tnDGdXGH9jiFLFmGU6vpPf+plrY2R+RiENdL/+omS1m2y4oV6lLWtgfJVQUiY/ytMssgTCIvapcmNVKWG5W76OJdBLJQNvWrnfgfEygOplC1x77KutmtYEcfWOvKM8PQG7IS6nGHh4IpzR7YvUYdBYpy7jsZvFMTpKTlYqx+FK+SYEyaR/JFrM3+IFOYDPxRwPqmvMe9YQX1bHH+b5G0cdnzTdwN8NXiWY7JlPMY0jujlqfZqU9rkjYptZbGC6t7CuWYpAK6Rc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(39860400002)(136003)(396003)(451199015)(46966006)(40470700004)(36840700001)(36756003)(54906003)(356005)(86362001)(81166007)(8936002)(41300700001)(2906002)(6862004)(4326008)(40460700003)(44832011)(5660300002)(478600001)(83380400001)(36860700001)(70206006)(316002)(2616005)(70586007)(82740400003)(40480700001)(82310400005)(8676002)(47076005)(1076003)(336012)(426003)(6666004)(26005)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 00:08:45.2008 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf7a2179-a554-4223-b156-08dad7e734f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5413
Received-SPF: softfail client-ip=2a01:111:f400:7e89::61d;
 envelope-from=vikram.garhwal@amd.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Connect CANFD0 and CANFD1 on the Versal-virt machine and update xlnx-versal-virt
document with CANFD command line examples.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 docs/system/arm/xlnx-versal-virt.rst | 31 ++++++++++++++++++
 hw/arm/xlnx-versal-virt.c            | 48 ++++++++++++++++++++++++++++
 hw/arm/xlnx-versal.c                 | 37 +++++++++++++++++++++
 include/hw/arm/xlnx-versal.h         | 12 +++++++
 4 files changed, 128 insertions(+)

diff --git a/docs/system/arm/xlnx-versal-virt.rst b/docs/system/arm/xlnx-versal-virt.rst
index 92ad10d2da..372e4249f0 100644
--- a/docs/system/arm/xlnx-versal-virt.rst
+++ b/docs/system/arm/xlnx-versal-virt.rst
@@ -34,6 +34,7 @@ Implemented devices:
 - DDR memory
 - BBRAM (36 bytes of Battery-backed RAM)
 - eFUSE (3072 bytes of one-time field-programmable bit array)
+- 2 CANFDs
 
 QEMU does not yet model any other devices, including the PL and the AI Engine.
 
@@ -224,3 +225,33 @@ To use a different index value, N, from default of 1, add:
 
   Better yet, do not use actual product data when running guest image
   on this Xilinx Versal Virt board.
+
+Using CANFDs for Versal Virt
+""""""""""""""""""""""""""""
+Versal CANFD controller is developed based on SocketCAN and QEMU CAN bus
+implementation. Bus connection and socketCAN connection for each CAN module
+can be set through command lines.
+
+To connect both CANFD0 and CANFD1 on the same bus:
+
+.. code-block:: bash
+
+    -object can-bus,id=canbus -machine canbus0=canbus -machine canbus1=canbus
+
+To connect CANFD0 and CANFD1 to separate buses:
+
+.. code-block:: bash
+
+    -object can-bus,id=canbus0 -object can-bus,id=canbus1 \
+    -machine canbus0=canbus0 -machine canbus1=canbus1
+
+SocketCAN interface can connect to a Physical or a Virtual CAN interfaces on
+host machine. Please check this document to learn about CAN interface on Linux:
+docs/system/devices/can.rst
+
+To connect CANFD0 and CANFD1 to host machine's CAN interface can0:
+
+.. code-block:: bash
+
+    -object can-bus,id=canbus -machine canbus0=canbus -machine canbus1=canbus
+    -object can-host-socketcan,id=canhost0,if=can0,canbus=canbus
diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 37fc9b919c..963ace861e 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -40,9 +40,11 @@ struct VersalVirt {
         uint32_t clk_25Mhz;
         uint32_t usb;
         uint32_t dwc;
+        uint32_t canfd[2];
     } phandle;
     struct arm_boot_info binfo;
 
+    CanBusState *canbus[XLNX_VERSAL_NR_CANFD];
     struct {
         bool secure;
     } cfg;
@@ -235,6 +237,33 @@ static void fdt_add_uart_nodes(VersalVirt *s)
     }
 }
 
+static void fdt_add_canfd_nodes(VersalVirt *s)
+{
+    uint64_t addrs[] = { MM_CANFD0, MM_CANFD1 };
+    uint32_t size[] = { MM_CANFD0_SIZE, MM_CANFD1_SIZE };
+    unsigned int irqs[] = { VERSAL_CANFD0_IRQ_0, VERSAL_CANFD1_IRQ_0 };
+    int i;
+
+    /* Create and connect CANFD0 and CANFD1 nodes to canbus0. */
+    for (i = 0; i < ARRAY_SIZE(addrs); i++) {
+        char *name = g_strdup_printf("/canfd@%" PRIx64, addrs[i]);
+        qemu_fdt_add_subnode(s->fdt, name);
+        qemu_fdt_setprop_cell(s->fdt, name, "rx-fifo0", 0x40);
+        qemu_fdt_setprop_cell(s->fdt, name, "enable-rx-fifo1", 0x1);
+        qemu_fdt_setprop_cell(s->fdt, name, "rx-fifo1", 0x40);
+
+        qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
+                               GIC_FDT_IRQ_TYPE_SPI, irqs[i],
+                               GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+        qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
+                                     2, addrs[i], 2, size[i]);
+        qemu_fdt_setprop_string(s->fdt, name, "compatible",
+                                "xlnx,versal-canfd");
+
+        g_free(name);
+    }
+}
+
 static void fdt_add_fixed_link_nodes(VersalVirt *s, char *gemname,
                                      uint32_t phandle)
 {
@@ -639,12 +668,17 @@ static void versal_virt_init(MachineState *machine)
                             TYPE_XLNX_VERSAL);
     object_property_set_link(OBJECT(&s->soc), "ddr", OBJECT(machine->ram),
                              &error_abort);
+    object_property_set_link(OBJECT(&s->soc), "canbus0", OBJECT(s->canbus[0]),
+                             &error_abort);
+    object_property_set_link(OBJECT(&s->soc), "canbus1", OBJECT(s->canbus[1]),
+                             &error_abort);
     sysbus_realize(SYS_BUS_DEVICE(&s->soc), &error_fatal);
 
     fdt_create(s);
     create_virtio_regions(s);
     fdt_add_gem_nodes(s);
     fdt_add_uart_nodes(s);
+    fdt_add_canfd_nodes(s);
     fdt_add_gic_nodes(s);
     fdt_add_timer_nodes(s);
     fdt_add_zdma_nodes(s);
@@ -712,6 +746,20 @@ static void versal_virt_init(MachineState *machine)
 
 static void versal_virt_machine_instance_init(Object *obj)
 {
+    VersalVirt *s = XLNX_VERSAL_VIRT_MACHINE(obj);
+
+    /*
+     * User can set canbus0 and canbus1 properties to can-bus object and connect
+     * to socketcan(optional) interface via command line.
+     */
+    object_property_add_link(obj, "canbus0", TYPE_CAN_BUS,
+                             (Object **)&s->canbus[0],
+                             object_property_allow_set_link,
+                             0);
+    object_property_add_link(obj, "canbus1", TYPE_CAN_BUS,
+                             (Object **)&s->canbus[1],
+                             object_property_allow_set_link,
+                             0);
 }
 
 static void versal_virt_machine_class_init(ObjectClass *oc, void *data)
diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index 57276e1506..44b0eaf0c8 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -185,6 +185,38 @@ static void versal_create_uarts(Versal *s, qemu_irq *pic)
     }
 }
 
+static void versal_create_canfds(Versal *s, qemu_irq *pic)
+{
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(s->lpd.iou.canfd); i++) {
+        static const int irqs[] = { VERSAL_CANFD0_IRQ_0, VERSAL_CANFD1_IRQ_0};
+        static const uint64_t addrs[] = { MM_CANFD0, MM_CANFD1 };
+        char *name = g_strdup_printf("canfd%d", i);
+        SysBusDevice *sbd;
+        MemoryRegion *mr;
+
+        object_initialize_child(OBJECT(s), name, &s->lpd.iou.canfd[i],
+                                TYPE_XILINX_CANFD);
+        sbd = SYS_BUS_DEVICE(&s->lpd.iou.canfd[i]);
+
+        object_property_set_int(OBJECT(&s->lpd.iou.canfd[i]), "ext_clk_freq",
+                                XLNX_VERSAL_CANFD_REF_CLK , &error_abort);
+
+        object_property_set_link(OBJECT(&s->lpd.iou.canfd[i]), "canfdbus",
+                                 OBJECT(s->lpd.iou.canbus[i]),
+                                 &error_abort);
+
+        sysbus_realize(sbd, &error_fatal);
+
+        mr = sysbus_mmio_get_region(sbd, 0);
+        memory_region_add_subregion(&s->mr_ps, addrs[i], mr);
+
+        sysbus_connect_irq(sbd, 0, pic[irqs[i]]);
+        g_free(name);
+    }
+}
+
 static void versal_create_usbs(Versal *s, qemu_irq *pic)
 {
     DeviceState *dev;
@@ -719,6 +751,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
     versal_create_apu_gic(s, pic);
     versal_create_rpu_cpus(s);
     versal_create_uarts(s, pic);
+    versal_create_canfds(s, pic);
     versal_create_usbs(s, pic);
     versal_create_gems(s, pic);
     versal_create_admas(s, pic);
@@ -758,6 +791,10 @@ static void versal_init(Object *obj)
 static Property versal_properties[] = {
     DEFINE_PROP_LINK("ddr", Versal, cfg.mr_ddr, TYPE_MEMORY_REGION,
                      MemoryRegion *),
+    DEFINE_PROP_LINK("canbus0", Versal, lpd.iou.canbus[0],
+                      TYPE_CAN_BUS, CanBusState *),
+    DEFINE_PROP_LINK("canbus1", Versal, lpd.iou.canbus[1],
+                      TYPE_CAN_BUS, CanBusState *),
     DEFINE_PROP_END_OF_LIST()
 };
 
diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index cbe8a19c10..97e63a1b0e 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -31,6 +31,7 @@
 #include "hw/dma/xlnx_csu_dma.h"
 #include "hw/misc/xlnx-versal-crl.h"
 #include "hw/misc/xlnx-versal-pmc-iou-slcr.h"
+#include "hw/net/xlnx-versal-canfd.h"
 
 #define TYPE_XLNX_VERSAL "xlnx-versal"
 OBJECT_DECLARE_SIMPLE_TYPE(Versal, XLNX_VERSAL)
@@ -43,6 +44,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(Versal, XLNX_VERSAL)
 #define XLNX_VERSAL_NR_SDS     2
 #define XLNX_VERSAL_NR_XRAM    4
 #define XLNX_VERSAL_NR_IRQS    192
+#define XLNX_VERSAL_NR_CANFD   2
+#define XLNX_VERSAL_CANFD_REF_CLK (24 * 1000 * 1000)
 
 struct Versal {
     /*< private >*/
@@ -73,6 +76,8 @@ struct Versal {
             CadenceGEMState gem[XLNX_VERSAL_NR_GEMS];
             XlnxZDMA adma[XLNX_VERSAL_NR_ADMAS];
             VersalUsb2 usb;
+            CanBusState *canbus[XLNX_VERSAL_NR_CANFD];
+            XlnxVersalCANFDState canfd[XLNX_VERSAL_NR_CANFD];
         } iou;
 
         /* Real-time Processing Unit.  */
@@ -133,6 +138,8 @@ struct Versal {
 #define VERSAL_CRL_IRQ             10
 #define VERSAL_UART0_IRQ_0         18
 #define VERSAL_UART1_IRQ_0         19
+#define VERSAL_CANFD0_IRQ_0        20
+#define VERSAL_CANFD1_IRQ_0        21
 #define VERSAL_USB0_IRQ_0          22
 #define VERSAL_GEM0_IRQ_0          56
 #define VERSAL_GEM0_WAKE_IRQ_0     57
@@ -163,6 +170,11 @@ struct Versal {
 #define MM_UART1                    0xff010000U
 #define MM_UART1_SIZE               0x10000
 
+#define MM_CANFD0                   0xff060000
+#define MM_CANFD0_SIZE              0x10000
+#define MM_CANFD1                   0xff070000
+#define MM_CANFD1_SIZE              0x10000
+
 #define MM_GEM0                     0xff0c0000U
 #define MM_GEM0_SIZE                0x10000
 #define MM_GEM1                     0xff0d0000U
-- 
2.17.1


