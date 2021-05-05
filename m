Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 872CA3735AE
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:39:41 +0200 (CEST)
Received: from localhost ([::1]:43868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leC8C-000474-Gl
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1leC4a-0007ZC-TQ
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:35:56 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57682
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1leC4S-00023i-4U
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:35:56 -0400
Received: from host81-154-26-71.range81-154.btcentralplus.com ([81.154.26.71]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1leC4O-0000OI-HI; Wed, 05 May 2021 08:35:46 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Wed,  5 May 2021 08:35:30 +0100
Message-Id: <20210505073538.11438-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210505073538.11438-1-mark.cave-ayland@ilande.co.uk>
References: <20210505073538.11438-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.154.26.71
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 02/10] hw/sparc/sun4m: Introduce Sun4mMachineClass
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Instead of passing the sun4m_hwdef structure via
machine_init(), store it into the MachineClass.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20210503171303.822501-3-f4bug@amsat.org>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/sparc/sun4m.c | 50 +++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 39 insertions(+), 11 deletions(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 9d07fa43d6..c2bc8a9fa5 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -107,7 +107,16 @@ struct sun4m_hwdef {
     uint8_t nvram_machine_id;
 };
 
+struct Sun4mMachineClass {
+    /*< private >*/
+    MachineClass parent_obj;
+    /*< public >*/
+    const struct sun4m_hwdef *hwdef;
+};
+typedef struct Sun4mMachineClass Sun4mMachineClass;
+
 #define TYPE_SUN4M_MACHINE MACHINE_TYPE_NAME("sun4m-common")
+DECLARE_CLASS_CHECKERS(Sun4mMachineClass, SUN4M_MACHINE, TYPE_SUN4M_MACHINE)
 
 const char *fw_cfg_arch_key_name(uint16_t key)
 {
@@ -839,9 +848,9 @@ static void dummy_fdc_tc(void *opaque, int irq, int level)
 {
 }
 
-static void sun4m_hw_init(const struct sun4m_hwdef *hwdef,
-                          MachineState *machine)
+static void sun4m_hw_init(MachineState *machine)
 {
+    const struct sun4m_hwdef *hwdef = SUN4M_MACHINE_GET_CLASS(machine)->hwdef;
     DeviceState *slavio_intctl;
     unsigned int i;
     Nvram *nvram;
@@ -1368,60 +1377,61 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
 /* SPARCstation 5 hardware initialisation */
 static void ss5_init(MachineState *machine)
 {
-    sun4m_hw_init(&sun4m_hwdefs[0], machine);
+    sun4m_hw_init(machine);
 }
 
 /* SPARCstation 10 hardware initialisation */
 static void ss10_init(MachineState *machine)
 {
-    sun4m_hw_init(&sun4m_hwdefs[1], machine);
+    sun4m_hw_init(machine);
 }
 
 /* SPARCserver 600MP hardware initialisation */
 static void ss600mp_init(MachineState *machine)
 {
-    sun4m_hw_init(&sun4m_hwdefs[2], machine);
+    sun4m_hw_init(machine);
 }
 
 /* SPARCstation 20 hardware initialisation */
 static void ss20_init(MachineState *machine)
 {
-    sun4m_hw_init(&sun4m_hwdefs[3], machine);
+    sun4m_hw_init(machine);
 }
 
 /* SPARCstation Voyager hardware initialisation */
 static void vger_init(MachineState *machine)
 {
-    sun4m_hw_init(&sun4m_hwdefs[4], machine);
+    sun4m_hw_init(machine);
 }
 
 /* SPARCstation LX hardware initialisation */
 static void ss_lx_init(MachineState *machine)
 {
-    sun4m_hw_init(&sun4m_hwdefs[5], machine);
+    sun4m_hw_init(machine);
 }
 
 /* SPARCstation 4 hardware initialisation */
 static void ss4_init(MachineState *machine)
 {
-    sun4m_hw_init(&sun4m_hwdefs[6], machine);
+    sun4m_hw_init(machine);
 }
 
 /* SPARCClassic hardware initialisation */
 static void scls_init(MachineState *machine)
 {
-    sun4m_hw_init(&sun4m_hwdefs[7], machine);
+    sun4m_hw_init(machine);
 }
 
 /* SPARCbook hardware initialisation */
 static void sbook_init(MachineState *machine)
 {
-    sun4m_hw_init(&sun4m_hwdefs[8], machine);
+    sun4m_hw_init(machine);
 }
 
 static void ss5_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
 
     mc->desc = "Sun4m platform, SPARCstation 5";
     mc->init = ss5_init;
@@ -1431,6 +1441,7 @@ static void ss5_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
     mc->default_display = "tcx";
     mc->default_ram_id = "sun4m.ram";
+    smc->hwdef = &sun4m_hwdefs[0];
 }
 
 static const TypeInfo ss5_type = {
@@ -1442,6 +1453,7 @@ static const TypeInfo ss5_type = {
 static void ss10_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
 
     mc->desc = "Sun4m platform, SPARCstation 10";
     mc->init = ss10_init;
@@ -1451,6 +1463,7 @@ static void ss10_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-SuperSparc-II");
     mc->default_display = "tcx";
     mc->default_ram_id = "sun4m.ram";
+    smc->hwdef = &sun4m_hwdefs[1];
 }
 
 static const TypeInfo ss10_type = {
@@ -1462,6 +1475,7 @@ static const TypeInfo ss10_type = {
 static void ss600mp_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
 
     mc->desc = "Sun4m platform, SPARCserver 600MP";
     mc->init = ss600mp_init;
@@ -1471,6 +1485,7 @@ static void ss600mp_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-SuperSparc-II");
     mc->default_display = "tcx";
     mc->default_ram_id = "sun4m.ram";
+    smc->hwdef = &sun4m_hwdefs[2];
 }
 
 static const TypeInfo ss600mp_type = {
@@ -1482,6 +1497,7 @@ static const TypeInfo ss600mp_type = {
 static void ss20_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
 
     mc->desc = "Sun4m platform, SPARCstation 20";
     mc->init = ss20_init;
@@ -1491,6 +1507,7 @@ static void ss20_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-SuperSparc-II");
     mc->default_display = "tcx";
     mc->default_ram_id = "sun4m.ram";
+    smc->hwdef = &sun4m_hwdefs[3];
 }
 
 static const TypeInfo ss20_type = {
@@ -1502,6 +1519,7 @@ static const TypeInfo ss20_type = {
 static void voyager_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
 
     mc->desc = "Sun4m platform, SPARCstation Voyager";
     mc->init = vger_init;
@@ -1510,6 +1528,7 @@ static void voyager_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
     mc->default_display = "tcx";
     mc->default_ram_id = "sun4m.ram";
+    smc->hwdef = &sun4m_hwdefs[4];
 }
 
 static const TypeInfo voyager_type = {
@@ -1521,6 +1540,7 @@ static const TypeInfo voyager_type = {
 static void ss_lx_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
 
     mc->desc = "Sun4m platform, SPARCstation LX";
     mc->init = ss_lx_init;
@@ -1529,6 +1549,7 @@ static void ss_lx_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-MicroSparc-I");
     mc->default_display = "tcx";
     mc->default_ram_id = "sun4m.ram";
+    smc->hwdef = &sun4m_hwdefs[5];
 }
 
 static const TypeInfo ss_lx_type = {
@@ -1540,6 +1561,7 @@ static const TypeInfo ss_lx_type = {
 static void ss4_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
 
     mc->desc = "Sun4m platform, SPARCstation 4";
     mc->init = ss4_init;
@@ -1548,6 +1570,7 @@ static void ss4_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
     mc->default_display = "tcx";
     mc->default_ram_id = "sun4m.ram";
+    smc->hwdef = &sun4m_hwdefs[6];
 }
 
 static const TypeInfo ss4_type = {
@@ -1559,6 +1582,7 @@ static const TypeInfo ss4_type = {
 static void scls_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
 
     mc->desc = "Sun4m platform, SPARCClassic";
     mc->init = scls_init;
@@ -1567,6 +1591,7 @@ static void scls_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-MicroSparc-I");
     mc->default_display = "tcx";
     mc->default_ram_id = "sun4m.ram";
+    smc->hwdef = &sun4m_hwdefs[7];
 }
 
 static const TypeInfo scls_type = {
@@ -1578,6 +1603,7 @@ static const TypeInfo scls_type = {
 static void sbook_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
 
     mc->desc = "Sun4m platform, SPARCbook";
     mc->init = sbook_init;
@@ -1586,6 +1612,7 @@ static void sbook_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-MicroSparc-I");
     mc->default_display = "tcx";
     mc->default_ram_id = "sun4m.ram";
+    smc->hwdef = &sun4m_hwdefs[8];
 }
 
 static const TypeInfo sbook_type = {
@@ -1598,6 +1625,7 @@ static const TypeInfo sun4m_machine_types[] = {
     {
         .name           = TYPE_SUN4M_MACHINE,
         .parent         = TYPE_MACHINE,
+        .class_size     = sizeof(Sun4mMachineClass),
         .abstract       = true,
     }
 };
-- 
2.20.1


