Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D34375671CD
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 17:03:42 +0200 (CEST)
Received: from localhost ([::1]:34024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8k5V-0007uJ-VI
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 11:03:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=52tn=XK=kaod.org=clg@ozlabs.org>)
 id 1o8k0f-0001Qn-Uy; Tue, 05 Jul 2022 10:58:42 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:36193
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=52tn=XK=kaod.org=clg@ozlabs.org>)
 id 1o8k0e-00011a-7I; Tue, 05 Jul 2022 10:58:41 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Lcm5S5St0z4xj4;
 Wed,  6 Jul 2022 00:58:36 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lcm5P6wXHz4xj3;
 Wed,  6 Jul 2022 00:58:33 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 4/5] ppc/e500: Allocate IRQ lines with qdev_init_gpio_in()
Date: Tue,  5 Jul 2022 16:58:13 +0200
Message-Id: <20220705145814.461723-5-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220705145814.461723-1-clg@kaod.org>
References: <20220705145814.461723-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=52tn=XK=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/e500.c | 8 ++++----
 hw/ppc/ppc.c  | 5 +----
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 7f7f5b345260..757cfaa62f8a 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -861,7 +861,6 @@ void ppce500_init(MachineState *machine)
     for (i = 0; i < smp_cpus; i++) {
         PowerPCCPU *cpu;
         CPUState *cs;
-        qemu_irq *input;
 
         cpu = POWERPC_CPU(object_new(machine->cpu_type));
         env = &cpu->env;
@@ -885,9 +884,10 @@ void ppce500_init(MachineState *machine)
             firstenv = env;
         }
 
-        input = (qemu_irq *)env->irq_inputs;
-        irqs[i].irq[OPENPIC_OUTPUT_INT] = input[PPCE500_INPUT_INT];
-        irqs[i].irq[OPENPIC_OUTPUT_CINT] = input[PPCE500_INPUT_CINT];
+        irqs[i].irq[OPENPIC_OUTPUT_INT] =
+            qdev_get_gpio_in(DEVICE(cpu), PPCE500_INPUT_INT);
+        irqs[i].irq[OPENPIC_OUTPUT_CINT] =
+            qdev_get_gpio_in(DEVICE(cpu), PPCE500_INPUT_CINT);
         env->spr_cb[SPR_BOOKE_PIR].default_value = cs->cpu_index = i;
         env->mpic_iack = pmc->ccsrbar_base + MPC8544_MPIC_REGS_OFFSET + 0xa0;
 
diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index 161e5f9087b7..690f448cb941 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -474,10 +474,7 @@ static void ppce500_set_irq(void *opaque, int pin, int level)
 
 void ppce500_irq_init(PowerPCCPU *cpu)
 {
-    CPUPPCState *env = &cpu->env;
-
-    env->irq_inputs = (void **)qemu_allocate_irqs(&ppce500_set_irq,
-                                                  cpu, PPCE500_INPUT_NB);
+    qdev_init_gpio_in(DEVICE(cpu), ppce500_set_irq, PPCE500_INPUT_NB);
 }
 
 /* Enable or Disable the E500 EPR capability */
-- 
2.35.3


