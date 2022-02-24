Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 957974C2DA9
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 14:56:46 +0100 (CET)
Received: from localhost ([::1]:47926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNEbt-0006yO-Gk
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 08:56:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nNEaI-0006Fz-EC
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 08:55:07 -0500
Received: from mail-eopbgr00126.outbound.protection.outlook.com
 ([40.107.0.126]:2295 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nNEaF-0004No-4x
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 08:55:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LgvZiFpMO8X0I+Xi7hDdfdkPqqOpd72eYMnCOgvuTr0Xv3dixewjFr1IWpDhlqL6EcUDJ8ODDc5NvOx2UgrggXKMB3aEWkqoUjUiFgtuww8GCox+Y2N26QqGN3nC0Bf33K+hKshlYWQBmk99kDsqq2O7cghXvVeozwkgkSfaH/MzHjXyeSuy3lX2vQf/dLjKpyJzqn3XP7l7TAejV1cxLhu6QJjZ86CqQ+W65xIQMZ0YCGmGfV4uiXXjhx8Q8AyJ97qtv/3HjQeUjDBngGGNxNYB3V8kuxFuaIs8ZXxFPMe9MpvWHIZz+AgeREpuE5geAK9UQd+dcvRBCgelV+S+gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qtFOmNqZy7r5i6a8zPmwmAhgZ6arJVgK60AdqilnN4=;
 b=WR+nO5MYJf4c6YKZjdR3rZcvOZvYL3DzuUs0GXPe55hgnSqFFVJ/Efv72blW3VgWcOnd4V4gdUmsl92b9CfG7q889hbH2pkDsCrX8xql12awhRwse7Nlv2ZEnwcnntbQPvGe/PBkCEkxfVtEAH0wXwymZtZMD89RbmLuaSZcN/7dCrJ9z7Hvru/UWZW0iVo3WO4toFuxlCeEnYjJasxdqzYwlWlAd3fVRhFFanXTDzMYdRCAZ9HrIJtabN40xMpZUqK7PHOXpBBWnrxW01sQ0iI84dEsjOC2bd12MumArUkXFd8+IpU3rfF+uBViH0FWq8HKH7n9CAAmxzpxb5iF7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 192.116.190.34) smtp.rcpttodomain=denx.de smtp.mailfrom=neuroblade.ai;
 dmarc=none action=none header.from=neuroblade.ai; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NeuroBlade.onmicrosoft.com; s=selector2-NeuroBlade-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qtFOmNqZy7r5i6a8zPmwmAhgZ6arJVgK60AdqilnN4=;
 b=Ft4IeTy70WRZRkpQRXDiTLfTkaL0xmDWM9tjaAuGRasVrD1N6OFAvHk7i8eQHdSTWUhBA10rcfLKztu+uHRdSXhGNuVM+oQ+WhZoPWc5DfvZEsYVmozfr20JuWI7bbmtBVF4vVWX9MI9BaLwbM7hDO3ZbM97O8yh24KP74ss0fA=
Received: from AS9PR0301CA0047.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::27) by VI1PR09MB2670.eurprd09.prod.outlook.com
 (2603:10a6:803:8a::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.18; Thu, 24 Feb
 2022 13:49:56 +0000
Received: from VE1EUR02FT029.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:469:cafe::67) by AS9PR0301CA0047.outlook.office365.com
 (2603:10a6:20b:469::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19 via Frontend
 Transport; Thu, 24 Feb 2022 13:49:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 192.116.190.34)
 smtp.mailfrom=neuroblade.ai; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=neuroblade.ai;
Received-SPF: Fail (protection.outlook.com: domain of neuroblade.ai does not
 designate 192.116.190.34 as permitted sender)
 receiver=protection.outlook.com; client-ip=192.116.190.34;
 helo=nb-o365.localdomain;
Received: from nb-o365.localdomain (192.116.190.34) by
 VE1EUR02FT029.mail.protection.outlook.com (10.152.12.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.23 via Frontend Transport; Thu, 24 Feb 2022 13:49:55 +0000
Received: from amirgonnen-vm.neuroblade.corp (amirgonnen-vm.neuroblade.corp
 [192.168.3.87])
 by nb-o365.localdomain (Postfix) with ESMTP id EDD491F6C1;
 Thu, 24 Feb 2022 15:49:33 +0200 (IST)
From: Amir Gonnen <amir.gonnen@neuroblade.ai>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>
Subject: [PATCH v2 4/4] hw/nios2: Machine with a Vectored Interrupt Controller
Date: Thu, 24 Feb 2022 15:49:01 +0200
Message-Id: <20220224134901.500007-5-amir.gonnen@neuroblade.ai>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224134901.500007-1-amir.gonnen@neuroblade.ai>
References: <20220224134901.500007-1-amir.gonnen@neuroblade.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bbc507c1-b205-4b7e-56bf-08d9f79c8a6c
X-MS-TrafficTypeDiagnostic: VI1PR09MB2670:EE_
X-Microsoft-Antispam-PRVS: <VI1PR09MB267019B9FF9AD267C0ED6B98EB3D9@VI1PR09MB2670.eurprd09.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: geJbfG/0tCRqRJQGNCKp0bVGtFBHH6KgqrjKFVkv8ICx1tAZ9c4rPAgR38OXvP3DRuH0ZG4zjZsXzrEcaIC20OTVcAnEu+NItgWzh0B1BH3OHKOcUcBqf2F5MGtdPFMAzUjSg5K+ku/9qZUwH5g8m7SX2PGnUC0tuoAE9VrRsrrdKuUSXBHbUmmoMl0zLoWdVvIHvBbiLpG/ZJYUjzgioPuXLDP/CX0AaPhhDKJcYOXqRPtX49O61oKAWWyJa572En2k4ZmyElh5NPydyFa2hSLivG32ytaVhzRxSS519avoVUiAyj533WsctPVH94mCD53fTJm0pG2wBHDvzY7kz8/DulEOkKNByKnH0G42G2oe4SlYwUYVM6a/I3EJP+r2vx0nIhoCpetyVHTOJ13BVVwr7dIPrj3hC9ciBgeEkpKPphikGuDnl4wk8FGlZKrwxhpyNxIU3Tff1+EK/eeRROIcawZc3iQ2bGqI17GfNR9qrD5lmLMPTQFiFHaLX9j3C90v2NxcYuqbJyERkPoo3aZzMad1jRSTarsetalCN5IgaKkfen78nIdp9VraQurnOyBvnDvlfkR6Ip4p/FLcK3cy8QilJKoPDqGpAFiHSxcLNEQ9+KmMrDF4ShTuANkqsP0ksjjKTUSq8YpQw5COmrKhiuG4VAwEIrJ3EyIrucyTdWAoR+6b/N/jk/BkKMgNYSnNqY37dXCxlGmcsur6qyTtcX8hAXR1wbIe0svcvnk=
X-Forefront-Antispam-Report: CIP:192.116.190.34; CTRY:IL; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:nb-o365.localdomain; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(376002)(39840400004)(136003)(346002)(34036004)(396003)(36840700001)(46966006)(110136005)(36860700001)(356005)(82310400004)(44832011)(86362001)(4326008)(508600001)(70206006)(70586007)(8676002)(81166007)(8936002)(6666004)(186003)(316002)(6266002)(2906002)(40480700001)(36756003)(1076003)(5660300002)(83380400001)(26005)(336012)(2616005)(47076005)(107886003)(36900700001)(27056005);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: neuroblade.ai
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 13:49:55.7544 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbc507c1-b205-4b7e-56bf-08d9f79c8a6c
X-MS-Exchange-CrossTenant-Id: 63c61203-65af-4cf8-98e5-d12f35edaefa
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=63c61203-65af-4cf8-98e5-d12f35edaefa; Ip=[192.116.190.34];
 Helo=[nb-o365.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR02FT029.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR09MB2670
Received-SPF: pass client-ip=40.107.0.126;
 envelope-from=amir.gonnen@neuroblade.ai;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 1 file changed, 60 insertions(+), 4 deletions(-)

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
+    Nios2MachineClass *nmc =3D NIOS2_MACHINE_GET_CLASS(machine);
+
     Nios2CPU *cpu;
     DeviceState *dev;
     MemoryRegion *address_space_mem =3D get_system_memory();
@@ -74,8 +87,24 @@ static void nios2_10m50_ghrd_init(MachineState *machine)

     /* Create CPU -- FIXME */
     cpu =3D NIOS2_CPU(cpu_create(TYPE_NIOS2_CPU));
-    for (i =3D 0; i < 32; i++) {
-        irq[i] =3D qdev_get_gpio_in_named(DEVICE(cpu), "IRQ", i);
+
+    if (nmc->vic) {
+        DeviceState *dev =3D qdev_new("nios2-vic");
+
+        object_property_set_link(OBJECT(dev), "cpu", OBJECT(cpu), &error_f=
atal);
+        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+        cpu->intc_present =3D false;
+        qemu_irq cpu_irq =3D qdev_get_gpio_in_named(DEVICE(cpu), "IRQ", 0)=
;
+        sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, cpu_irq);
+        for (int i =3D 0; i < 32; i++) {
+            irq[i] =3D qdev_get_gpio_in(dev, i);
+        }
+        MemoryRegion *dev_mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(dev=
), 0);
+        memory_region_add_subregion(address_space_mem, 0x18002000, dev_mr)=
;
+    } else {
+        for (i =3D 0; i < 32; i++) {
+            irq[i] =3D qdev_get_gpio_in_named(DEVICE(cpu), "IRQ", i);
+        }
     }

     /* Register: Altera 16550 UART */
@@ -105,11 +134,38 @@ static void nios2_10m50_ghrd_init(MachineState *machi=
ne)
                       BINARY_DEVICE_TREE_FILE, NULL);
 }

-static void nios2_10m50_ghrd_machine_init(struct MachineClass *mc)
+static void nios2_10m50_ghrd_machine_class_init(ObjectClass *oc, void *dat=
a)
 {
+    MachineClass *mc =3D MACHINE_CLASS(oc);
+    Nios2MachineClass *nmc =3D NIOS2_MACHINE_CLASS(oc);
     mc->desc =3D "Altera 10M50 GHRD Nios II design";
     mc->init =3D nios2_10m50_ghrd_init;
     mc->is_default =3D true;
+    nmc->vic =3D false;
 }

-DEFINE_MACHINE("10m50-ghrd", nios2_10m50_ghrd_machine_init);
+static void nios2_10m50_ghrd_vic_machine_class_init(ObjectClass *oc, void =
*data)
+{
+    MachineClass *mc =3D MACHINE_CLASS(oc);
+    Nios2MachineClass *nmc =3D NIOS2_MACHINE_CLASS(oc);
+    mc->desc =3D "Altera 10M50 GHRD Nios II design with VIC";
+    mc->init =3D nios2_10m50_ghrd_init;
+    mc->is_default =3D false;
+    nmc->vic =3D true;
+}
+
+static const TypeInfo nios_machine_types[] =3D {
+    {
+        .name          =3D MACHINE_TYPE_NAME("10m50-ghrd"),
+        .parent        =3D TYPE_MACHINE,
+        .class_size    =3D sizeof(Nios2MachineClass),
+        .class_init    =3D nios2_10m50_ghrd_machine_class_init,
+    }, {
+        .name          =3D MACHINE_TYPE_NAME("10m50-ghrd-vic"),
+        .parent        =3D TYPE_MACHINE,
+        .class_size    =3D sizeof(Nios2MachineClass),
+        .class_init    =3D nios2_10m50_ghrd_vic_machine_class_init,
+    }
+};
+
+DEFINE_TYPES(nios_machine_types)
--
2.25.1


The contents of this email message and any attachments are intended solely =
for the addressee(s) and may contain confidential and/or privileged informa=
tion and may be legally protected from disclosure. If you are not the inten=
ded recipient of this message or their agent, or if this message has been a=
ddressed to you in error, please immediately alert the sender by reply emai=
l and then delete this message and any attachments. If you are not the inte=
nded recipient, you are hereby notified that any use, dissemination, copyin=
g, or storage of this message or its attachments is strictly prohibited.

