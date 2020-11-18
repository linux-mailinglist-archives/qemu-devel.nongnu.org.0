Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A45B2B8518
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 20:51:19 +0100 (CET)
Received: from localhost ([::1]:51532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfTU6-0005rv-7N
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 14:51:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fnuv@xilinx.com>)
 id 1kfTS2-0004Nv-2V; Wed, 18 Nov 2020 14:49:10 -0500
Received: from mail-mw2nam10on2080.outbound.protection.outlook.com
 ([40.107.94.80]:5761 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fnuv@xilinx.com>)
 id 1kfTRz-0005YX-1W; Wed, 18 Nov 2020 14:49:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HGZjauiJkAziQ3FrmMdQCSqVQ8lRxlkFvJouiHsHg6gM63QRWIrb6fF84rxNodK7npf/K0Gc/4fIjx+hJJjxOCR+t4bBI6rmQxWR2DF3WEFqbcmc05zBm3pGc2n6Y77Y9ZfhuGFHNIFrMuoFpnIPg/NQKqfoNlp/C7V0fnKDqOs7TyDP6sMZER0ZImougS2YB/VoPYJKSdNYNkBzqrfFyFZcqyAtCf1VwoHClvCWJdJa/fdS0dqDuX8RMPm4GR+5EpHgh8JagVK8CeKa2x6z7+8WmNn0N7gnUFPI21DT0cZGXDzcHkl5RqbiqQk0u6Zoax0ntwPM7bzo7gSBuPDzrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JlEP77TEb8SF9MAjy5QJ6aGzR5r/P/0aoihL9r+yD6E=;
 b=kkuba6jsxVu+Ln0dCTLNkj2esaGKhjg2TNxTWLspuOGWbiHjDjSa+TF8+kW8d9cXO8Bzm3dYlcAn0GJWjUYr5XHjolCQSUrpzq0QjtMuHK/C1CL40p3/3uUVZv1n+aAOAIsWN2Me/i7w+gimvZ+n8FFIUxlyatKURxhmAhr7CFgLkrr1MIzA5Ay9v6Z0pnOiZsRw2yvjopXobejq+JrJTE210frxet9/aMXhZlogrxrhmE8fFSTRbiF+z0P419CYKwn9Wnl9J9sOxkYtmZQE9XMzsBTyeTg5gweVbc58yIxPNemgeMNxSPunUkDUUhv2ferfDWMl6iZlWrDhwPWJSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JlEP77TEb8SF9MAjy5QJ6aGzR5r/P/0aoihL9r+yD6E=;
 b=TaZTO3WrsLX2AjM9nd0qGYBKvuHPcGIDQJXSiq3N/9xweXV1/b4JFrkjOjJ6sE48Xuwb4DaeAxDlymHe3WZzhHmG3AyRYE+SNi+JbF/j4YjYykzUt8xzm9HGN+8DvPK1j+gl7QBaqXmDTZCUoReF7BHGVEwzo7WGayWSWp/YZts=
Received: from DM3PR12CA0121.namprd12.prod.outlook.com (2603:10b6:0:51::17) by
 BY5PR02MB7041.namprd02.prod.outlook.com (2603:10b6:a03:237::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Wed, 18 Nov
 2020 19:49:02 +0000
Received: from CY1NAM02FT064.eop-nam02.prod.protection.outlook.com
 (2603:10b6:0:51:cafe::7b) by DM3PR12CA0121.outlook.office365.com
 (2603:10b6:0:51::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Wed, 18 Nov 2020 19:49:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT064.mail.protection.outlook.com (10.152.74.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 19:49:02 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 18 Nov 2020 11:49:00 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 18 Nov 2020 11:49:00 -0800
Received: from [172.19.2.115] (port=52002 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1kfTRs-0003iK-Nl; Wed, 18 Nov 2020 11:49:00 -0800
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v12 2/4] xlnx-zynqmp: Connect Xilinx ZynqMP CAN controllers
Date: Wed, 18 Nov 2020 11:48:44 -0800
Message-ID: <1605728926-352690-3-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605728926-352690-1-git-send-email-fnu.vikram@xilinx.com>
References: <1605728926-352690-1-git-send-email-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13e7f7f5-7bb2-44eb-7570-08d88bfaffc6
X-MS-TrafficTypeDiagnostic: BY5PR02MB7041:
X-Microsoft-Antispam-PRVS: <BY5PR02MB7041F1BD0061B76EAC060E17BCE10@BY5PR02MB7041.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:114;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hJsGCaT80nrjrQkH0xZv/G91l26Fb95JkCetXJFhP4sliCIELd5NVLhC3y8SiJ87C9KScKfQaxtQBZFTnYWO7CgJyv4+ZH5oM+Z+2HmgblwFE3CiqBL6XOzwJpb23M7lYJE733wdYJX/iesWtUSl4JJpb31rFdnZ6FK8vyxvZuFDD+uRafhZKJI5E8EUPBSG8/O/W6xZmeK6tl2tWMeNFb25Yk1zgnXQ4jiLWFsQiQeOpfP26FxXYVFaj9wZ6G3cIdCloMHIuVrDg1hhPugcj+QwYqoI2up6hIsXbZUTGYZCINM86XUBhkPfxJAnPPjXjHOcUfEH7FlzSFq71S2T65SFqvoVq/2PelMaZb7Ls9CdZfmIqoEEi9IFIDMxBaWr+oYUDAPSoMkoSFUeEhbad/pdNdzRVV7iY+XVJ/wawqw=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(346002)(376002)(46966005)(9786002)(47076004)(7636003)(6916009)(7696005)(356005)(82740400003)(8936002)(4326008)(83380400001)(70206006)(70586007)(6666004)(5660300002)(8676002)(36756003)(54906003)(316002)(478600001)(426003)(336012)(186003)(82310400003)(36906005)(26005)(2616005)(2906002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 19:49:02.1576 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e7f7f5-7bb2-44eb-7570-08d88bfaffc6
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT064.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB7041
Received-SPF: pass client-ip=40.107.94.80; envelope-from=fnuv@xilinx.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 14:49:04
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
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
Cc: peter.maydell@linaro.org, Vikram
 Garhwal <fnu.vikram@xilinx.com>, Alistair Francis <alistair@alistair23.me>,
 francisco.iglesias@xilinx.com, "open list:Xilinx ZynqMP
 and..." <qemu-arm@nongnu.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Connect CAN0 and CAN1 on the ZynqMP.

Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 include/hw/arm/xlnx-zynqmp.h |  8 ++++++++
 hw/arm/xlnx-zcu102.c         | 20 ++++++++++++++++++++
 hw/arm/xlnx-zynqmp.c         | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+)

diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 567d0db..6f45387 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -22,6 +22,7 @@
 #include "hw/intc/arm_gic.h"
 #include "hw/net/cadence_gem.h"
 #include "hw/char/cadence_uart.h"
+#include "hw/net/xlnx-zynqmp-can.h"
 #include "hw/ide/ahci.h"
 #include "hw/sd/sdhci.h"
 #include "hw/ssi/xilinx_spips.h"
@@ -33,6 +34,7 @@
 #include "hw/cpu/cluster.h"
 #include "target/arm/cpu.h"
 #include "qom/object.h"
+#include "net/can_emu.h"
 
 #define TYPE_XLNX_ZYNQMP "xlnx,zynqmp"
 OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
@@ -41,6 +43,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
 #define XLNX_ZYNQMP_NUM_RPU_CPUS 2
 #define XLNX_ZYNQMP_NUM_GEMS 4
 #define XLNX_ZYNQMP_NUM_UARTS 2
+#define XLNX_ZYNQMP_NUM_CAN 2
+#define XLNX_ZYNQMP_CAN_REF_CLK (24 * 1000 * 1000)
 #define XLNX_ZYNQMP_NUM_SDHCI 2
 #define XLNX_ZYNQMP_NUM_SPIS 2
 #define XLNX_ZYNQMP_NUM_GDMA_CH 8
@@ -92,6 +96,7 @@ struct XlnxZynqMPState {
 
     CadenceGEMState gem[XLNX_ZYNQMP_NUM_GEMS];
     CadenceUARTState uart[XLNX_ZYNQMP_NUM_UARTS];
+    XlnxZynqMPCANState can[XLNX_ZYNQMP_NUM_CAN];
     SysbusAHCIState sata;
     SDHCIState sdhci[XLNX_ZYNQMP_NUM_SDHCI];
     XilinxSPIPS spi[XLNX_ZYNQMP_NUM_SPIS];
@@ -112,6 +117,9 @@ struct XlnxZynqMPState {
     bool virt;
     /* Has the RPU subsystem?  */
     bool has_rpu;
+
+    /* CAN bus. */
+    CanBusState *canbus[XLNX_ZYNQMP_NUM_CAN];
 };
 
 #endif
diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index ad7fff9..4ef0c51 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -25,6 +25,7 @@
 #include "sysemu/qtest.h"
 #include "sysemu/device_tree.h"
 #include "qom/object.h"
+#include "net/can_emu.h"
 
 struct XlnxZCU102 {
     MachineState parent_obj;
@@ -34,6 +35,8 @@ struct XlnxZCU102 {
     bool secure;
     bool virt;
 
+    CanBusState *canbus[XLNX_ZYNQMP_NUM_CAN];
+
     struct arm_boot_info binfo;
 };
 
@@ -125,6 +128,14 @@ static void xlnx_zcu102_init(MachineState *machine)
     object_property_set_bool(OBJECT(&s->soc), "virtualization", s->virt,
                              &error_fatal);
 
+    for (i = 0; i < XLNX_ZYNQMP_NUM_CAN; i++) {
+        gchar *bus_name = g_strdup_printf("canbus%d", i);
+
+        object_property_set_link(OBJECT(&s->soc), bus_name,
+                                 OBJECT(s->canbus[i]), &error_fatal);
+        g_free(bus_name);
+    }
+
     qdev_realize(DEVICE(&s->soc), NULL, &error_fatal);
 
     /* Create and plug in the SD cards */
@@ -208,6 +219,15 @@ static void xlnx_zcu102_machine_instance_init(Object *obj)
     s->secure = false;
     /* Default to virt (EL2) being disabled */
     s->virt = false;
+    object_property_add_link(obj, "xlnx-zcu102.canbus0", TYPE_CAN_BUS,
+                             (Object **)&s->canbus[0],
+                             object_property_allow_set_link,
+                             0);
+
+    object_property_add_link(obj, "xlnx-zcu102.canbus1", TYPE_CAN_BUS,
+                             (Object **)&s->canbus[1],
+                             object_property_allow_set_link,
+                             0);
 }
 
 static void xlnx_zcu102_machine_class_init(ObjectClass *oc, void *data)
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 7885bb1..8818472 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -81,6 +81,14 @@ static const int uart_intr[XLNX_ZYNQMP_NUM_UARTS] = {
     21, 22,
 };
 
+static const uint64_t can_addr[XLNX_ZYNQMP_NUM_CAN] = {
+    0xFF060000, 0xFF070000,
+};
+
+static const int can_intr[XLNX_ZYNQMP_NUM_CAN] = {
+    23, 24,
+};
+
 static const uint64_t sdhci_addr[XLNX_ZYNQMP_NUM_SDHCI] = {
     0xFF160000, 0xFF170000,
 };
@@ -243,6 +251,11 @@ static void xlnx_zynqmp_init(Object *obj)
                                 TYPE_CADENCE_UART);
     }
 
+    for (i = 0; i < XLNX_ZYNQMP_NUM_CAN; i++) {
+        object_initialize_child(obj, "can[*]", &s->can[i],
+                                TYPE_XLNX_ZYNQMP_CAN);
+    }
+
     object_initialize_child(obj, "sata", &s->sata, TYPE_SYSBUS_AHCI);
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_SDHCI; i++) {
@@ -482,6 +495,23 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
                            gic_spi[uart_intr[i]]);
     }
 
+    for (i = 0; i < XLNX_ZYNQMP_NUM_CAN; i++) {
+        object_property_set_int(OBJECT(&s->can[i]), "ext_clk_freq",
+                                XLNX_ZYNQMP_CAN_REF_CLK, &error_abort);
+
+        object_property_set_link(OBJECT(&s->can[i]), "canbus",
+                                 OBJECT(s->canbus[i]), &error_fatal);
+
+        sysbus_realize(SYS_BUS_DEVICE(&s->can[i]), &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->can[i]), 0, can_addr[i]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->can[i]), 0,
+                           gic_spi[can_intr[i]]);
+    }
+
     object_property_set_int(OBJECT(&s->sata), "num-ports", SATA_NUM_PORTS,
                             &error_abort);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->sata), errp)) {
@@ -619,6 +649,10 @@ static Property xlnx_zynqmp_props[] = {
     DEFINE_PROP_BOOL("has_rpu", XlnxZynqMPState, has_rpu, false),
     DEFINE_PROP_LINK("ddr-ram", XlnxZynqMPState, ddr_ram, TYPE_MEMORY_REGION,
                      MemoryRegion *),
+    DEFINE_PROP_LINK("canbus0", XlnxZynqMPState, canbus[0], TYPE_CAN_BUS,
+                     CanBusState *),
+    DEFINE_PROP_LINK("canbus1", XlnxZynqMPState, canbus[1], TYPE_CAN_BUS,
+                     CanBusState *),
     DEFINE_PROP_END_OF_LIST()
 };
 
-- 
2.7.4


