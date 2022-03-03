Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 415EE4CC259
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 17:11:32 +0100 (CET)
Received: from localhost ([::1]:34594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPo39-0001GW-B4
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 11:11:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nPnn4-0004ks-JK
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:54:54 -0500
Received: from [2a01:111:f400:7d00::70f] (port=7905
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nPnn2-0005Mq-UY
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:54:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hSY0vAkAUB4I1+G9NN51J6XDzBB8dYk5cJxxX1ddvNA1c8bfeuWPINzZgLHueXJq9P4KQdsjmaEvHMsdQH2hbiqlwlNKHcafjcpZ5gQiA95d6DPF6CrOcQxMOdfACTuTcOhcngvi/lkfjQXje6ZkRccwwFFIYDMqVd0JEIBgLq/ettPpO8fvK7HHsuyDietcceVOxS61piw7kxLjDn7oYl6a8M4BXxLEign4Ym1yG5nEM7ckZUhxy4PCBhVp9PBV3PYXsTA7ZGcrdvXZySHfj7xJDLcEXOnl6CJ1RUrum+G4Unk1253c1iEeZg6Xbp/+aQqOEfiPriuAoWWKDHO1HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wPSVYKVE+bOznm2xZGglxeOAZMqhgEfH1a1c8UMIJnU=;
 b=ciEaYQwLRv00uV7LEA4CT/+9DH3u/fZsAmOB6bIffhgQQzuNeASjLnkdf12WebSN0YyVHUxj98Zljhj+jPbK0vvFRGEg1wfXICmGVcKpBCBzyamaKcoOWkq8Iq9ZXp3/8r9ukok7wi1DI3lII6drsbQpsswM0UEwcSDcd/MXCQAVk2nC9sqSYtradTTkb2LQwQr1bMGvD/6MWpKc5SN/1ru9s211BgjFE5iYHoCjNRSZjUEGhHe8Em7jVl55eIzP939p4avY+UKV9DFUnKb6FQ9pOQvjajgYWto2DwSweAQlJdXaLCQO51lxZ2I4WdKIzqN4LiUhgICfXJJKVw5nOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 192.116.190.34) smtp.rcpttodomain=denx.de smtp.mailfrom=neuroblade.ai;
 dmarc=none action=none header.from=neuroblade.ai; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=neuroblade.ai;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wPSVYKVE+bOznm2xZGglxeOAZMqhgEfH1a1c8UMIJnU=;
 b=rc4lczrPCioxP8LBo8Q3qCIwWxcqTfe/9KvJg1dqO006FgBg/zYuvCMCOJgOUlK6/uXzE+oDJi+KEy6CJ4xhv6Lv3AV2Si12s90w82CIRa1Tt7hEvT0VTH/m2b1LE5J9h9pPlbWA6rLLF1mclxxPs67a79i5ShP4WML0/JQI8ZU=
Received: from AS9PR07CA0015.eurprd07.prod.outlook.com (2603:10a6:20b:46c::19)
 by VI1PR09MB4334.eurprd09.prod.outlook.com (2603:10a6:800:15b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 15:39:16 +0000
Received: from AM5EUR02FT015.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:46c:cafe::2d) by AS9PR07CA0015.outlook.office365.com
 (2603:10a6:20b:46c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.4 via Frontend
 Transport; Thu, 3 Mar 2022 15:39:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 192.116.190.34)
 smtp.mailfrom=neuroblade.ai; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=neuroblade.ai;
Received-SPF: Fail (protection.outlook.com: domain of neuroblade.ai does not
 designate 192.116.190.34 as permitted sender)
 receiver=protection.outlook.com; client-ip=192.116.190.34;
 helo=nb-o365.localdomain;
Received: from nb-o365.localdomain (192.116.190.34) by
 AM5EUR02FT015.mail.protection.outlook.com (10.152.8.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.14 via Frontend Transport; Thu, 3 Mar 2022 15:39:16 +0000
Received: from amirgonnen-vm.neuroblade.corp (amirgonnen-vm.neuroblade.corp
 [192.168.3.87])
 by nb-o365.localdomain (Postfix) with ESMTP id 8662C21303;
 Thu,  3 Mar 2022 17:38:59 +0200 (IST)
From: Amir Gonnen <amir.gonnen@neuroblade.ai>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 5/5] hw/nios2: Machine with a Vectored Interrupt Controller
Date: Thu,  3 Mar 2022 17:39:06 +0200
Message-Id: <20220303153906.2024748-6-amir.gonnen@neuroblade.ai>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303153906.2024748-1-amir.gonnen@neuroblade.ai>
References: <20220303153906.2024748-1-amir.gonnen@neuroblade.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: dea22d16-1dfc-4b41-5c3c-08d9fd2bf9e3
X-MS-TrafficTypeDiagnostic: VI1PR09MB4334:EE_
X-Microsoft-Antispam-PRVS: <VI1PR09MB433485EC593E5907C16E58E4EB049@VI1PR09MB4334.eurprd09.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HhMkvN3pXNNFK5FNdwt4rqYNmdM6DFAhYwPIN/sf+F/obKYhNnDWG5eQsB8AtKdyxT28knlPEOct3fF5XQE8bMMgYxhAllCygOy+8H62qPLnKb/TSIfp/6JTEcKDMtq5c8Hy8I2aPwyPkWea/ejsaIGP8ZjPlylRCe7wc0UuD98GGRrHe6hRt3dT3jGWRGPyXMuE0W2Bsbl5NmbAinHEkZs5ZbPDyfWZ1OFKKJU1nX9eHEFHEz14PybWCYwP+1Ssu6hlNEB3/H6fpkQGg2o+Qm8Zd3/3fNgT+QfjmEvjOl5xVw3trm5rT37rIQmlNXHxPB1nsR/xRuhQqMCXfKgZ/aS9YOaButZQeUuFDV4E5Ed2JJwry8PWjfTF4YyuOPKLsD5S1+OUknQcVP0MutAZYWBqkZ+M+Z6SL9/D0VLl4mxCPMI5C1Uvpt4FByw7Hlbk35CjJj22UzGzDUj2et5J/7C6SsROKz/CRt+lG95x0xgQVNxMHwxAJTNaThgCLwaI/wOk+UNLpKFj5zODAY49hVDLB1/IKFlaLt2ePS1p0Wi1RsQDeHR1nqo8g0ZwhG9Qt4u32PCBTjwxyzYCVfm4KXbH7HrSC9BG9TYPRCj6rMjH/5seSUxfdQqeInHu8bZQghpUp5qSTKWFfBVtCLXei2soWThybmcEKLf/pflL2xPez07mEdf0RoyhJqEZGSqMJe+w83Y78soMsNx2RM1EM7vzHA3d+wzu9iJcFWnGhro=
X-Forefront-Antispam-Report: CIP:192.116.190.34; CTRY:IL; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:nb-o365.localdomain; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(376002)(346002)(396003)(39840400004)(136003)(46966006)(36840700001)(26005)(82310400004)(2906002)(36756003)(6266002)(1076003)(36860700001)(186003)(6666004)(336012)(83380400001)(4326008)(107886003)(5660300002)(44832011)(47076005)(8936002)(70586007)(70206006)(86362001)(8676002)(2616005)(508600001)(110136005)(40480700001)(81166007)(356005)(316002)(36900700001)(27056005);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: neuroblade.ai
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 15:39:16.5765 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dea22d16-1dfc-4b41-5c3c-08d9fd2bf9e3
X-MS-Exchange-CrossTenant-Id: 63c61203-65af-4cf8-98e5-d12f35edaefa
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=63c61203-65af-4cf8-98e5-d12f35edaefa; Ip=[192.116.190.34];
 Helo=[nb-o365.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR02FT015.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR09MB4334
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::70f
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::70f;
 envelope-from=amir.gonnen@neuroblade.ai;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Amir Gonnen <amir.gonnen@neuroblade.ai>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Demonstrate how to use nios2 VIC on a machine.
Introduce a new machine "10m50-ghrd-vic" which is based on "10m50-ghrd"
with a VIC attached and internal interrupt controller removed.

When VIC is present, irq0 connects the VIC to the cpu, intc_present
is set to false to disable the internal interrupt controller, and the
devices on the machine are attached to the VIC (and not directly to cpu).
To allow VIC update EIC fields, we set the "cpu" property of the VIC
with a reference to the nios2 cpu.

Signed-off-by: Amir Gonnen <amir.gonnen@neuroblade.ai>
---
 hw/nios2/10m50_devboard.c | 64 ++++++++++++++++++++++++++++++++++++---
 hw/nios2/Kconfig          |  1 +
 2 files changed, 61 insertions(+), 4 deletions(-)

diff --git a/hw/nios2/10m50_devboard.c b/hw/nios2/10m50_devboard.c
index 3d1205b8bd..9f62a2993f 100644
--- a/hw/nios2/10m50_devboard.c
+++ b/hw/nios2/10m50_devboard.c
@@ -36,10 +36,23 @@
 
 #include "boot.h"
 
+#define TYPE_NIOS2_MACHINE  MACHINE_TYPE_NAME("10m50-ghrd")
+typedef struct Nios2MachineClass Nios2MachineClass;
+DECLARE_OBJ_CHECKERS(MachineState, Nios2MachineClass,
+                     NIOS2_MACHINE, TYPE_NIOS2_MACHINE)
+
 #define BINARY_DEVICE_TREE_FILE    "10m50-devboard.dtb"
 
+struct Nios2MachineClass {
+    MachineClass parent_obj;
+
+    bool vic;
+};
+
 static void nios2_10m50_ghrd_init(MachineState *machine)
 {
+    Nios2MachineClass *nmc = NIOS2_MACHINE_GET_CLASS(machine);
+
     Nios2CPU *cpu;
     DeviceState *dev;
     MemoryRegion *address_space_mem = get_system_memory();
@@ -74,8 +87,24 @@ static void nios2_10m50_ghrd_init(MachineState *machine)
 
     /* Create CPU -- FIXME */
     cpu = NIOS2_CPU(cpu_create(TYPE_NIOS2_CPU));
-    for (i = 0; i < 32; i++) {
-        irq[i] = qdev_get_gpio_in_named(DEVICE(cpu), "IRQ", i);
+
+    if (nmc->vic) {
+        DeviceState *dev = qdev_new("nios2-vic");
+
+        object_property_set_link(OBJECT(dev), "cpu", OBJECT(cpu), &error_fatal);
+        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+        cpu->intc_present = false;
+        qemu_irq cpu_irq = qdev_get_gpio_in_named(DEVICE(cpu), "IRQ", 0);
+        sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, cpu_irq);
+        for (int i = 0; i < 32; i++) {
+            irq[i] = qdev_get_gpio_in(dev, i);
+        }
+        MemoryRegion *dev_mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
+        memory_region_add_subregion(address_space_mem, 0x18002000, dev_mr);
+    } else {
+        for (i = 0; i < 32; i++) {
+            irq[i] = qdev_get_gpio_in_named(DEVICE(cpu), "IRQ", i);
+        }
     }
 
     /* Register: Altera 16550 UART */
@@ -105,11 +134,38 @@ static void nios2_10m50_ghrd_init(MachineState *machine)
                       BINARY_DEVICE_TREE_FILE, NULL);
 }
 
-static void nios2_10m50_ghrd_machine_init(struct MachineClass *mc)
+static void nios2_10m50_ghrd_machine_class_init(ObjectClass *oc, void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+    Nios2MachineClass *nmc = NIOS2_MACHINE_CLASS(oc);
     mc->desc = "Altera 10M50 GHRD Nios II design";
     mc->init = nios2_10m50_ghrd_init;
     mc->is_default = true;
+    nmc->vic = false;
 }
 
-DEFINE_MACHINE("10m50-ghrd", nios2_10m50_ghrd_machine_init);
+static void nios2_10m50_ghrd_vic_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    Nios2MachineClass *nmc = NIOS2_MACHINE_CLASS(oc);
+    mc->desc = "Altera 10M50 GHRD Nios II design with VIC";
+    mc->init = nios2_10m50_ghrd_init;
+    mc->is_default = false;
+    nmc->vic = true;
+}
+
+static const TypeInfo nios_machine_types[] = {
+    {
+        .name          = MACHINE_TYPE_NAME("10m50-ghrd"),
+        .parent        = TYPE_MACHINE,
+        .class_size    = sizeof(Nios2MachineClass),
+        .class_init    = nios2_10m50_ghrd_machine_class_init,
+    }, {
+        .name          = MACHINE_TYPE_NAME("10m50-ghrd-vic"),
+        .parent        = TYPE_MACHINE,
+        .class_size    = sizeof(Nios2MachineClass),
+        .class_init    = nios2_10m50_ghrd_vic_machine_class_init,
+    }
+};
+
+DEFINE_TYPES(nios_machine_types)
diff --git a/hw/nios2/Kconfig b/hw/nios2/Kconfig
index b10ea640da..4748ae27b6 100644
--- a/hw/nios2/Kconfig
+++ b/hw/nios2/Kconfig
@@ -3,6 +3,7 @@ config NIOS2_10M50
     select NIOS2
     select SERIAL
     select ALTERA_TIMER
+    select NIOS2_VIC
 
 config NIOS2_GENERIC_NOMMU
     bool
-- 
2.25.1


