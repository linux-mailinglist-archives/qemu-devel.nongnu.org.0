Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D55C6611032
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 13:58:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooNzY-0002kO-Sl; Fri, 28 Oct 2022 07:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ooNyd-0001ka-RA; Fri, 28 Oct 2022 07:56:44 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ooNyZ-0006NI-S1; Fri, 28 Oct 2022 07:56:43 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id F085475A15D;
 Fri, 28 Oct 2022 13:56:31 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CCBBA75A150; Fri, 28 Oct 2022 13:56:31 +0200 (CEST)
Message-Id: <01e51bd77babbc3d0653df0b6ef43807348bd34c.1666957578.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1666957578.git.balaton@eik.bme.hu>
References: <cover.1666957578.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v6 15/19] mac_newworld: Add machine types for different mac99
 configs
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Fri, 28 Oct 2022 13:56:31 +0200 (CEST)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The mac99 machine emulates different machines depending on machine
properties or even if it is run as qemu-system-ppc64 or
qemu-system-ppc. This is very confusing for users and many hours were
lost trying to explain it or finding out why commands users came up
with are not working as expected. (E.g. Windows users might think
qemu-system-ppc64 is just the 64 bit version of qemu-system-ppc and
then fail to boot a 32 bit OS with -M mac99 trying to follow an
example that had qemu-system-ppc.) To avoid such confusion, add
explicit machine types for the different configs which will work the
same with both qemu-system-ppc and qemu-system-ppc64 and also make the
command line clearer for new users.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/mac_newworld.c | 94 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 601ea518f8..50b783d851 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -649,9 +649,103 @@ static const TypeInfo core99_machine_info = {
     },
 };
 
+static void powermac3_1_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    core99_machine_class_init(oc, data);
+    mc->desc = "Apple Power Mac G4 AGP (Sawtooth)";
+    mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("7400_v2.9");
+}
+
+static void powermac3_1_instance_init(Object *obj)
+{
+    Core99MachineState *cms = CORE99_MACHINE(obj);
+
+    cms->via_config = CORE99_VIA_CONFIG_PMU;
+    return;
+}
+
+static const TypeInfo powermac3_1_machine_info = {
+    .name          = MACHINE_TYPE_NAME("powermac3_1"),
+    .parent        = TYPE_MACHINE,
+    .class_init    = powermac3_1_machine_class_init,
+    .instance_init = powermac3_1_instance_init,
+    .instance_size = sizeof(Core99MachineState),
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_FW_PATH_PROVIDER },
+        { }
+    },
+};
+
+static void powerbook3_2_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    core99_machine_class_init(oc, data);
+    mc->desc = "Apple PowerBook G4 Titanium (Mercury)";
+    mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("7400_v2.9");
+}
+
+static void powerbook3_2_instance_init(Object *obj)
+{
+    Core99MachineState *cms = CORE99_MACHINE(obj);
+
+    cms->via_config = CORE99_VIA_CONFIG_PMU_ADB;
+    return;
+}
+
+static const TypeInfo powerbook3_2_machine_info = {
+    .name          = MACHINE_TYPE_NAME("powerbook3_2"),
+    .parent        = TYPE_MACHINE,
+    .class_init    = powerbook3_2_machine_class_init,
+    .instance_init = powerbook3_2_instance_init,
+    .instance_size = sizeof(Core99MachineState),
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_FW_PATH_PROVIDER },
+        { }
+    },
+};
+
+#ifdef TARGET_PPC64
+static void powermac7_3_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    core99_machine_class_init(oc, data);
+    mc->desc = "Apple Power Mac G5 (Niagara)";
+    mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("970fx_v3.1");
+}
+
+static void powermac7_3_instance_init(Object *obj)
+{
+    Core99MachineState *cms = CORE99_MACHINE(obj);
+
+    cms->via_config = CORE99_VIA_CONFIG_PMU;
+    return;
+}
+
+static const TypeInfo powermac7_3_machine_info = {
+    .name          = MACHINE_TYPE_NAME("powermac7_3"),
+    .parent        = TYPE_MACHINE,
+    .class_init    = powermac7_3_machine_class_init,
+    .instance_init = powermac7_3_instance_init,
+    .instance_size = sizeof(Core99MachineState),
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_FW_PATH_PROVIDER },
+        { }
+    },
+};
+#endif
+
 static void mac_machine_register_types(void)
 {
     type_register_static(&core99_machine_info);
+    type_register_static(&powermac3_1_machine_info);
+    type_register_static(&powerbook3_2_machine_info);
+#ifdef TARGET_PPC64
+    type_register_static(&powermac7_3_machine_info);
+#endif
 }
 
 type_init(mac_machine_register_types)
-- 
2.30.6


