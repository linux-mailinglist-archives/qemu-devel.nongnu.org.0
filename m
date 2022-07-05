Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 442735671B8
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 17:01:20 +0200 (CEST)
Received: from localhost ([::1]:56154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8k3D-0003gv-CS
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 11:01:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=52tn=XK=kaod.org=clg@ozlabs.org>)
 id 1o8k0Z-000194-An; Tue, 05 Jul 2022 10:58:35 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:41469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=52tn=XK=kaod.org=clg@ozlabs.org>)
 id 1o8k0X-000103-1S; Tue, 05 Jul 2022 10:58:35 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Lcm5L15g4z4xhq;
 Wed,  6 Jul 2022 00:58:30 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lcm5H2VSnz4xj1;
 Wed,  6 Jul 2022 00:58:27 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 2/5] ppc/40x: Allocate IRQ lines with qdev_init_gpio_in()
Date: Tue,  5 Jul 2022 16:58:11 +0200
Message-Id: <20220705145814.461723-3-clg@kaod.org>
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
 hw/ppc/ppc.c           |  5 +----
 hw/ppc/ppc405_uc.c     |  4 ++--
 hw/ppc/ppc440_bamboo.c |  4 ++--
 hw/ppc/sam460ex.c      |  4 ++--
 hw/ppc/virtex_ml507.c  | 10 +++++-----
 5 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index 15f2b5f0f07a..8c88d3a4806d 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -422,10 +422,7 @@ static void ppc40x_set_irq(void *opaque, int pin, int level)
 
 void ppc40x_irq_init(PowerPCCPU *cpu)
 {
-    CPUPPCState *env = &cpu->env;
-
-    env->irq_inputs = (void **)qemu_allocate_irqs(&ppc40x_set_irq,
-                                                  cpu, PPC40x_INPUT_NB);
+    qdev_init_gpio_in(DEVICE(cpu), ppc40x_set_irq, PPC40x_INPUT_NB);
 }
 
 /* PowerPC E500 internal IRQ controller */
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 36c8ba6f3c14..d6420c88d3a6 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -1470,9 +1470,9 @@ PowerPCCPU *ppc405ep_init(MemoryRegion *address_space_mem,
     sysbus_realize_and_unref(uicsbd, &error_fatal);
 
     sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_INT,
-                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT]);
+                       qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_INT));
     sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_CINT,
-                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT]);
+                       qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_CINT));
 
     *uicdevp = uicdev;
 
diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index d5973f2484ed..873f930c77da 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -200,9 +200,9 @@ static void bamboo_init(MachineState *machine)
     sysbus_realize_and_unref(uicsbd, &error_fatal);
 
     sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_INT,
-                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT]);
+                       qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_INT));
     sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_CINT,
-                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT]);
+                       qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_CINT));
 
     /* SDRAM controller */
     memset(ram_bases, 0, sizeof(ram_bases));
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 2f24598f55db..7e8da657c2a9 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -334,9 +334,9 @@ static void sam460ex_init(MachineState *machine)
 
         if (i == 0) {
             sysbus_connect_irq(sbd, PPCUIC_OUTPUT_INT,
-                               ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT]);
+                             qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_INT));
             sysbus_connect_irq(sbd, PPCUIC_OUTPUT_CINT,
-                               ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT]);
+                             qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_CINT));
         } else {
             sysbus_connect_irq(sbd, PPCUIC_OUTPUT_INT,
                                qdev_get_gpio_in(uic[0], input_ints[i]));
diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index b67a709ddce2..53b126ff48a6 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -111,9 +111,9 @@ static PowerPCCPU *ppc440_init_xilinx(const char *cpu_type, uint32_t sysclk)
     sysbus_realize_and_unref(uicsbd, &error_fatal);
 
     sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_INT,
-                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT]);
+                       qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_INT));
     sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_CINT,
-                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT]);
+                       qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_CINT));
 
     /* This board doesn't wire anything up to the inputs of the UIC. */
     return cpu;
@@ -213,7 +213,7 @@ static void virtex_init(MachineState *machine)
     CPUPPCState *env;
     hwaddr ram_base = 0;
     DriveInfo *dinfo;
-    qemu_irq irq[32], *cpu_irq;
+    qemu_irq irq[32], cpu_irq;
     int kernel_size;
     int i;
 
@@ -236,12 +236,12 @@ static void virtex_init(MachineState *machine)
                           dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
                           64 * KiB, 1, 0x89, 0x18, 0x0000, 0x0, 1);
 
-    cpu_irq = (qemu_irq *) &env->irq_inputs[PPC40x_INPUT_INT];
+    cpu_irq = qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_INT);
     dev = qdev_new("xlnx.xps-intc");
     qdev_prop_set_uint32(dev, "kind-of-intr", 0);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, INTC_BASEADDR);
-    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, cpu_irq[0]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, cpu_irq);
     for (i = 0; i < 32; i++) {
         irq[i] = qdev_get_gpio_in(dev, i);
     }
-- 
2.35.3


