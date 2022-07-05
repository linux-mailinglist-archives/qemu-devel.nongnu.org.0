Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 353F15671CE
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 17:04:01 +0200 (CEST)
Received: from localhost ([::1]:34978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8k5o-00006w-8x
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 11:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=52tn=XK=kaod.org=clg@ozlabs.org>)
 id 1o8k0c-0001IA-4c; Tue, 05 Jul 2022 10:58:38 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:43359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=52tn=XK=kaod.org=clg@ozlabs.org>)
 id 1o8k0a-00010j-4P; Tue, 05 Jul 2022 10:58:37 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Lcm5P3GXVz4xj1;
 Wed,  6 Jul 2022 00:58:33 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lcm5L4lH3z4xj2;
 Wed,  6 Jul 2022 00:58:30 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 3/5] ppc/6xx: Allocate IRQ lines with qdev_init_gpio_in()
Date: Tue,  5 Jul 2022 16:58:12 +0200
Message-Id: <20220705145814.461723-4-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220705145814.461723-1-clg@kaod.org>
References: <20220705145814.461723-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=52tn=XK=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/mac_newworld.c  | 8 ++++----
 hw/ppc/mac_oldworld.c  | 2 +-
 hw/ppc/pegasos2.c      | 2 +-
 hw/ppc/ppc.c           | 5 +----
 hw/ppc/prep.c          | 2 +-
 hw/ppc/prep_systemio.c | 2 +-
 6 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 22405dd27a7c..cf7eb7239129 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -262,16 +262,16 @@ static void ppc_core99_init(MachineState *machine)
         switch (PPC_INPUT(env)) {
         case PPC_FLAGS_INPUT_6xx:
             openpic_irqs[i].irq[OPENPIC_OUTPUT_INT] =
-                ((qemu_irq *)env->irq_inputs)[PPC6xx_INPUT_INT];
+                qdev_get_gpio_in(DEVICE(cpu), PPC6xx_INPUT_INT);
             openpic_irqs[i].irq[OPENPIC_OUTPUT_CINT] =
-                ((qemu_irq *)env->irq_inputs)[PPC6xx_INPUT_INT];
+                 qdev_get_gpio_in(DEVICE(cpu), PPC6xx_INPUT_INT);
             openpic_irqs[i].irq[OPENPIC_OUTPUT_MCK] =
-                ((qemu_irq *)env->irq_inputs)[PPC6xx_INPUT_MCP];
+                qdev_get_gpio_in(DEVICE(cpu), PPC6xx_INPUT_MCP);
             /* Not connected ? */
             openpic_irqs[i].irq[OPENPIC_OUTPUT_DEBUG] = NULL;
             /* Check this */
             openpic_irqs[i].irq[OPENPIC_OUTPUT_RESET] =
-                ((qemu_irq *)env->irq_inputs)[PPC6xx_INPUT_HRESET];
+                qdev_get_gpio_in(DEVICE(cpu), PPC6xx_INPUT_HRESET);
             break;
 #if defined(TARGET_PPC64)
         case PPC_FLAGS_INPUT_970:
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index d62fdf0db3fe..03732ca7ed08 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -271,7 +271,7 @@ static void ppc_heathrow_init(MachineState *machine)
         case PPC_FLAGS_INPUT_6xx:
             /* XXX: we register only 1 output pin for heathrow PIC */
             qdev_connect_gpio_out(pic_dev, 0,
-                ((qemu_irq *)env->irq_inputs)[PPC6xx_INPUT_INT]);
+                              qdev_get_gpio_in(DEVICE(cpu), PPC6xx_INPUT_INT));
             break;
         default:
             error_report("Bus model not supported on OldWorld Mac machine");
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 9411ca6b16b1..61f4263953ba 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -155,7 +155,7 @@ static void pegasos2_init(MachineState *machine)
 
     /* Marvell Discovery II system controller */
     pm->mv = DEVICE(sysbus_create_simple(TYPE_MV64361, -1,
-                             ((qemu_irq *)env->irq_inputs)[PPC6xx_INPUT_INT]));
+                          qdev_get_gpio_in(DEVICE(pm->cpu), PPC6xx_INPUT_INT)));
     pci_bus = mv64361_get_pci_bus(pm->mv, 1);
 
     /* VIA VT8231 South Bridge (multifunction PCI device) */
diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index 8c88d3a4806d..161e5f9087b7 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -154,10 +154,7 @@ static void ppc6xx_set_irq(void *opaque, int pin, int level)
 
 void ppc6xx_irq_init(PowerPCCPU *cpu)
 {
-    CPUPPCState *env = &cpu->env;
-
-    env->irq_inputs = (void **)qemu_allocate_irqs(&ppc6xx_set_irq, cpu,
-                                                  PPC6xx_INPUT_NB);
+    qdev_init_gpio_in(DEVICE(cpu), ppc6xx_set_irq, PPC6xx_INPUT_NB);
 }
 
 #if defined(TARGET_PPC64)
diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index a1cd4505cc9d..f08714f2ecba 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -275,7 +275,7 @@ static void ibm_40p_init(MachineState *machine)
     /* PCI -> ISA bridge */
     i82378_dev = DEVICE(pci_create_simple(pci_bus, PCI_DEVFN(11, 0), "i82378"));
     qdev_connect_gpio_out(i82378_dev, 0,
-                          cpu->env.irq_inputs[PPC6xx_INPUT_INT]);
+                          qdev_get_gpio_in(DEVICE(cpu), PPC6xx_INPUT_INT));
     sysbus_connect_irq(pcihost, 0, qdev_get_gpio_in(i82378_dev, 15));
     isa_bus = ISA_BUS(qdev_get_child_bus(i82378_dev, "isa.0"));
 
diff --git a/hw/ppc/prep_systemio.c b/hw/ppc/prep_systemio.c
index 8c9b8dd67b74..5a56f155f506 100644
--- a/hw/ppc/prep_systemio.c
+++ b/hw/ppc/prep_systemio.c
@@ -262,7 +262,7 @@ static void prep_systemio_realize(DeviceState *dev, Error **errp)
     qemu_set_irq(s->non_contiguous_io_map_irq,
                  s->iomap_type & PORT0850_IOMAP_NONCONTIGUOUS);
     cpu = POWERPC_CPU(first_cpu);
-    s->softreset_irq = cpu->env.irq_inputs[PPC6xx_INPUT_HRESET];
+    s->softreset_irq = qdev_get_gpio_in(DEVICE(cpu), PPC6xx_INPUT_HRESET);
 
     isa_register_portio_list(isa, &s->portio, 0x0, ppc_io800_port_list, s,
                              "systemio800");
-- 
2.35.3


