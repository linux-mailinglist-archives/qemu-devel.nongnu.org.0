Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6283735AF
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:39:42 +0200 (CEST)
Received: from localhost ([::1]:43986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leC8D-0004AD-UR
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:39:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1leC4Z-0007YG-RZ
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:35:55 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57690
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1leC4U-00025f-1k
 for qemu-devel@nongnu.org; Wed, 05 May 2021 03:35:55 -0400
Received: from host81-154-26-71.range81-154.btcentralplus.com ([81.154.26.71]
 helo=kentang.home) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1leC4Q-0000OI-O4; Wed, 05 May 2021 08:35:48 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Wed,  5 May 2021 08:35:31 +0100
Message-Id: <20210505073538.11438-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210505073538.11438-1-mark.cave-ayland@ilande.co.uk>
References: <20210505073538.11438-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.154.26.71
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 03/10] hw/sparc/sun4m: Factor out sun4m_machine_class_init()
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

Factor out the class_init code common to all machines
to sun4m_machine_class_init().

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20210503171303.822501-4-f4bug@amsat.org>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/sparc/sun4m.c | 103 ++++-------------------------------------------
 1 file changed, 8 insertions(+), 95 deletions(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index c2bc8a9fa5..56f927e66c 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -1374,58 +1374,15 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
     },
 };
 
-/* SPARCstation 5 hardware initialisation */
-static void ss5_init(MachineState *machine)
+static void sun4m_machine_class_init(ObjectClass *oc, void *data)
 {
-    sun4m_hw_init(machine);
-}
-
-/* SPARCstation 10 hardware initialisation */
-static void ss10_init(MachineState *machine)
-{
-    sun4m_hw_init(machine);
-}
-
-/* SPARCserver 600MP hardware initialisation */
-static void ss600mp_init(MachineState *machine)
-{
-    sun4m_hw_init(machine);
-}
-
-/* SPARCstation 20 hardware initialisation */
-static void ss20_init(MachineState *machine)
-{
-    sun4m_hw_init(machine);
-}
-
-/* SPARCstation Voyager hardware initialisation */
-static void vger_init(MachineState *machine)
-{
-    sun4m_hw_init(machine);
-}
-
-/* SPARCstation LX hardware initialisation */
-static void ss_lx_init(MachineState *machine)
-{
-    sun4m_hw_init(machine);
-}
-
-/* SPARCstation 4 hardware initialisation */
-static void ss4_init(MachineState *machine)
-{
-    sun4m_hw_init(machine);
-}
-
-/* SPARCClassic hardware initialisation */
-static void scls_init(MachineState *machine)
-{
-    sun4m_hw_init(machine);
-}
+    MachineClass *mc = MACHINE_CLASS(oc);
 
-/* SPARCbook hardware initialisation */
-static void sbook_init(MachineState *machine)
-{
-    sun4m_hw_init(machine);
+    mc->init = sun4m_hw_init;
+    mc->block_default_type = IF_SCSI;
+    mc->default_boot_order = "c";
+    mc->default_display = "tcx";
+    mc->default_ram_id = "sun4m.ram";
 }
 
 static void ss5_class_init(ObjectClass *oc, void *data)
@@ -1434,13 +1391,8 @@ static void ss5_class_init(ObjectClass *oc, void *data)
     Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
 
     mc->desc = "Sun4m platform, SPARCstation 5";
-    mc->init = ss5_init;
-    mc->block_default_type = IF_SCSI;
     mc->is_default = true;
-    mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
-    mc->default_display = "tcx";
-    mc->default_ram_id = "sun4m.ram";
     smc->hwdef = &sun4m_hwdefs[0];
 }
 
@@ -1456,13 +1408,8 @@ static void ss10_class_init(ObjectClass *oc, void *data)
     Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
 
     mc->desc = "Sun4m platform, SPARCstation 10";
-    mc->init = ss10_init;
-    mc->block_default_type = IF_SCSI;
     mc->max_cpus = 4;
-    mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-SuperSparc-II");
-    mc->default_display = "tcx";
-    mc->default_ram_id = "sun4m.ram";
     smc->hwdef = &sun4m_hwdefs[1];
 }
 
@@ -1478,13 +1425,8 @@ static void ss600mp_class_init(ObjectClass *oc, void *data)
     Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
 
     mc->desc = "Sun4m platform, SPARCserver 600MP";
-    mc->init = ss600mp_init;
-    mc->block_default_type = IF_SCSI;
     mc->max_cpus = 4;
-    mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-SuperSparc-II");
-    mc->default_display = "tcx";
-    mc->default_ram_id = "sun4m.ram";
     smc->hwdef = &sun4m_hwdefs[2];
 }
 
@@ -1500,13 +1442,8 @@ static void ss20_class_init(ObjectClass *oc, void *data)
     Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
 
     mc->desc = "Sun4m platform, SPARCstation 20";
-    mc->init = ss20_init;
-    mc->block_default_type = IF_SCSI;
     mc->max_cpus = 4;
-    mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-SuperSparc-II");
-    mc->default_display = "tcx";
-    mc->default_ram_id = "sun4m.ram";
     smc->hwdef = &sun4m_hwdefs[3];
 }
 
@@ -1522,12 +1459,7 @@ static void voyager_class_init(ObjectClass *oc, void *data)
     Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
 
     mc->desc = "Sun4m platform, SPARCstation Voyager";
-    mc->init = vger_init;
-    mc->block_default_type = IF_SCSI;
-    mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
-    mc->default_display = "tcx";
-    mc->default_ram_id = "sun4m.ram";
     smc->hwdef = &sun4m_hwdefs[4];
 }
 
@@ -1543,12 +1475,7 @@ static void ss_lx_class_init(ObjectClass *oc, void *data)
     Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
 
     mc->desc = "Sun4m platform, SPARCstation LX";
-    mc->init = ss_lx_init;
-    mc->block_default_type = IF_SCSI;
-    mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-MicroSparc-I");
-    mc->default_display = "tcx";
-    mc->default_ram_id = "sun4m.ram";
     smc->hwdef = &sun4m_hwdefs[5];
 }
 
@@ -1564,12 +1491,7 @@ static void ss4_class_init(ObjectClass *oc, void *data)
     Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
 
     mc->desc = "Sun4m platform, SPARCstation 4";
-    mc->init = ss4_init;
-    mc->block_default_type = IF_SCSI;
-    mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
-    mc->default_display = "tcx";
-    mc->default_ram_id = "sun4m.ram";
     smc->hwdef = &sun4m_hwdefs[6];
 }
 
@@ -1585,12 +1507,7 @@ static void scls_class_init(ObjectClass *oc, void *data)
     Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
 
     mc->desc = "Sun4m platform, SPARCClassic";
-    mc->init = scls_init;
-    mc->block_default_type = IF_SCSI;
-    mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-MicroSparc-I");
-    mc->default_display = "tcx";
-    mc->default_ram_id = "sun4m.ram";
     smc->hwdef = &sun4m_hwdefs[7];
 }
 
@@ -1606,12 +1523,7 @@ static void sbook_class_init(ObjectClass *oc, void *data)
     Sun4mMachineClass *smc = SUN4M_MACHINE_CLASS(mc);
 
     mc->desc = "Sun4m platform, SPARCbook";
-    mc->init = sbook_init;
-    mc->block_default_type = IF_SCSI;
-    mc->default_boot_order = "c";
     mc->default_cpu_type = SPARC_CPU_TYPE_NAME("TI-MicroSparc-I");
-    mc->default_display = "tcx";
-    mc->default_ram_id = "sun4m.ram";
     smc->hwdef = &sun4m_hwdefs[8];
 }
 
@@ -1626,6 +1538,7 @@ static const TypeInfo sun4m_machine_types[] = {
         .name           = TYPE_SUN4M_MACHINE,
         .parent         = TYPE_MACHINE,
         .class_size     = sizeof(Sun4mMachineClass),
+        .class_init     = sun4m_machine_class_init,
         .abstract       = true,
     }
 };
-- 
2.20.1


