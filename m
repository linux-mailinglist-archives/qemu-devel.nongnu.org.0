Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F25395671B9
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 17:01:39 +0200 (CEST)
Received: from localhost ([::1]:56866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8k3W-0004BC-UH
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 11:01:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=52tn=XK=kaod.org=clg@ozlabs.org>)
 id 1o8k0Z-00019H-Eg; Tue, 05 Jul 2022 10:58:35 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:54093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=52tn=XK=kaod.org=clg@ozlabs.org>)
 id 1o8k0X-0000zq-2g; Tue, 05 Jul 2022 10:58:35 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Lcm5G66Wgz4xTq;
 Wed,  6 Jul 2022 00:58:26 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lcm5D0FDQz4xhq;
 Wed,  6 Jul 2022 00:58:23 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 1/5] ppc64: Allocate IRQ lines with qdev_init_gpio_in()
Date: Tue,  5 Jul 2022 16:58:10 +0200
Message-Id: <20220705145814.461723-2-clg@kaod.org>
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

This replaces the IRQ array 'irq_inputs' with GPIO lines, the goal
being to remove 'irq_inputs' when all CPUs have been converted.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/intc/xics.c        | 10 ++++++----
 hw/intc/xive.c        |  4 ++--
 hw/ppc/mac_newworld.c |  8 ++++----
 hw/ppc/ppc.c          | 15 +++------------
 4 files changed, 15 insertions(+), 22 deletions(-)

diff --git a/hw/intc/xics.c b/hw/intc/xics.c
index 24e67020dbf3..5b0b4d962427 100644
--- a/hw/intc/xics.c
+++ b/hw/intc/xics.c
@@ -301,23 +301,25 @@ void icp_reset(ICPState *icp)
 static void icp_realize(DeviceState *dev, Error **errp)
 {
     ICPState *icp = ICP(dev);
+    PowerPCCPU *cpu;
     CPUPPCState *env;
     Error *err = NULL;
 
     assert(icp->xics);
     assert(icp->cs);
 
-    env = &POWERPC_CPU(icp->cs)->env;
+    cpu = POWERPC_CPU(icp->cs);
+    env = &cpu->env;
     switch (PPC_INPUT(env)) {
     case PPC_FLAGS_INPUT_POWER7:
-        icp->output = env->irq_inputs[POWER7_INPUT_INT];
+        icp->output = qdev_get_gpio_in(DEVICE(cpu), POWER7_INPUT_INT);
         break;
     case PPC_FLAGS_INPUT_POWER9: /* For SPAPR xics emulation */
-        icp->output = env->irq_inputs[POWER9_INPUT_INT];
+        icp->output = qdev_get_gpio_in(DEVICE(cpu), POWER9_INPUT_INT);
         break;
 
     case PPC_FLAGS_INPUT_970:
-        icp->output = env->irq_inputs[PPC970_INPUT_INT];
+        icp->output = qdev_get_gpio_in(DEVICE(cpu), PPC970_INPUT_INT);
         break;
 
     default:
diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index ae221fed732f..a986b96843e7 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -695,8 +695,8 @@ static void xive_tctx_realize(DeviceState *dev, Error **errp)
     env = &cpu->env;
     switch (PPC_INPUT(env)) {
     case PPC_FLAGS_INPUT_POWER9:
-        tctx->hv_output = env->irq_inputs[POWER9_INPUT_HINT];
-        tctx->os_output = env->irq_inputs[POWER9_INPUT_INT];
+        tctx->hv_output = qdev_get_gpio_in(DEVICE(cpu), POWER9_INPUT_HINT);
+        tctx->os_output = qdev_get_gpio_in(DEVICE(cpu), POWER9_INPUT_INT);
         break;
 
     default:
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index c865921bdc05..22405dd27a7c 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -276,16 +276,16 @@ static void ppc_core99_init(MachineState *machine)
 #if defined(TARGET_PPC64)
         case PPC_FLAGS_INPUT_970:
             openpic_irqs[i].irq[OPENPIC_OUTPUT_INT] =
-                ((qemu_irq *)env->irq_inputs)[PPC970_INPUT_INT];
+                qdev_get_gpio_in(DEVICE(cpu), PPC970_INPUT_INT);
             openpic_irqs[i].irq[OPENPIC_OUTPUT_CINT] =
-                ((qemu_irq *)env->irq_inputs)[PPC970_INPUT_INT];
+                qdev_get_gpio_in(DEVICE(cpu), PPC970_INPUT_INT);
             openpic_irqs[i].irq[OPENPIC_OUTPUT_MCK] =
-                ((qemu_irq *)env->irq_inputs)[PPC970_INPUT_MCP];
+                qdev_get_gpio_in(DEVICE(cpu), PPC970_INPUT_MCP);
             /* Not connected ? */
             openpic_irqs[i].irq[OPENPIC_OUTPUT_DEBUG] = NULL;
             /* Check this */
             openpic_irqs[i].irq[OPENPIC_OUTPUT_RESET] =
-                ((qemu_irq *)env->irq_inputs)[PPC970_INPUT_HRESET];
+                qdev_get_gpio_in(DEVICE(cpu), PPC970_INPUT_HRESET);
             break;
 #endif /* defined(TARGET_PPC64) */
         default:
diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index fea70df45e69..15f2b5f0f07a 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -234,10 +234,7 @@ static void ppc970_set_irq(void *opaque, int pin, int level)
 
 void ppc970_irq_init(PowerPCCPU *cpu)
 {
-    CPUPPCState *env = &cpu->env;
-
-    env->irq_inputs = (void **)qemu_allocate_irqs(&ppc970_set_irq, cpu,
-                                                  PPC970_INPUT_NB);
+    qdev_init_gpio_in(DEVICE(cpu), ppc970_set_irq, PPC970_INPUT_NB);
 }
 
 /* POWER7 internal IRQ controller */
@@ -260,10 +257,7 @@ static void power7_set_irq(void *opaque, int pin, int level)
 
 void ppcPOWER7_irq_init(PowerPCCPU *cpu)
 {
-    CPUPPCState *env = &cpu->env;
-
-    env->irq_inputs = (void **)qemu_allocate_irqs(&power7_set_irq, cpu,
-                                                  POWER7_INPUT_NB);
+    qdev_init_gpio_in(DEVICE(cpu), power7_set_irq, POWER7_INPUT_NB);
 }
 
 /* POWER9 internal IRQ controller */
@@ -292,10 +286,7 @@ static void power9_set_irq(void *opaque, int pin, int level)
 
 void ppcPOWER9_irq_init(PowerPCCPU *cpu)
 {
-    CPUPPCState *env = &cpu->env;
-
-    env->irq_inputs = (void **)qemu_allocate_irqs(&power9_set_irq, cpu,
-                                                  POWER9_INPUT_NB);
+    qdev_init_gpio_in(DEVICE(cpu), power9_set_irq, POWER9_INPUT_NB);
 }
 #endif /* defined(TARGET_PPC64) */
 
-- 
2.35.3


