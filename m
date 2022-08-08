Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3D758C6A8
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 12:43:23 +0200 (CEST)
Received: from localhost ([::1]:57496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL0ED-0005ew-Ha
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 06:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=c6th=YM=kaod.org=clg@ozlabs.org>)
 id 1oKzzQ-0005Fg-Co; Mon, 08 Aug 2022 06:28:04 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:36959
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=c6th=YM=kaod.org=clg@ozlabs.org>)
 id 1oKzzO-0001Qo-5L; Mon, 08 Aug 2022 06:28:04 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4M1XTY0t3Rz4xV7;
 Mon,  8 Aug 2022 20:28:01 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4M1XTW0fqRz4xTy;
 Mon,  8 Aug 2022 20:27:58 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v3 07/22] ppc/ppc405: QOM'ify CPU
Date: Mon,  8 Aug 2022 12:27:19 +0200
Message-Id: <20220808102734.133084-8-clg@kaod.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808102734.133084-1-clg@kaod.org>
References: <20220808102734.133084-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=c6th=YM=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_LOW=-0.7,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Drop the use of ppc4xx_init() and duplicate a bit of code related to
clocks in the SoC realize routine. We will clean that up in the
following patches.

ppc_dcr_init() simply allocates default DCR handlers for the CPU. Maybe
this could be done in model initializer of the CPU families needing it.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405.h         |  2 +-
 include/hw/ppc/ppc4xx.h |  1 +
 hw/ppc/ppc405_boards.c  |  2 +-
 hw/ppc/ppc405_uc.c      | 35 +++++++++++++++++++++++++----------
 hw/ppc/ppc4xx_devs.c    |  2 +-
 5 files changed, 29 insertions(+), 13 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index dc862bc8614c..8cc76cc8b3fe 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -79,7 +79,7 @@ struct Ppc405SoCState {
     hwaddr ram_size;
 
     uint32_t sysclk;
-    PowerPCCPU *cpu;
+    PowerPCCPU cpu;
     DeviceState *uic;
 };
 
diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index 980f964b5a91..021376c2d260 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -29,6 +29,7 @@
 #include "exec/memory.h"
 
 /* PowerPC 4xx core initialization */
+void ppc4xx_reset(void *opaque);
 PowerPCCPU *ppc4xx_init(const char *cpu_model,
                         clk_setup_t *cpu_clk, clk_setup_t *tb_clk,
                         uint32_t sysclk);
diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 0b39ff08bd65..5ba12d60bc00 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -313,7 +313,7 @@ static void ppc405_init(MachineState *machine)
 
     /* Load ELF kernel and rootfs.cpio */
     } else if (kernel_filename && !machine->firmware) {
-        boot_from_kernel(machine, ppc405->soc.cpu);
+        boot_from_kernel(machine, &ppc405->soc.cpu);
     }
 }
 
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index abcc2537140c..fa3853df2233 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -1432,22 +1432,36 @@ static void ppc405ep_cpc_init (CPUPPCState *env, clk_setup_t clk_setup[8],
 #endif
 }
 
+static void ppc405_soc_instance_init(Object *obj)
+{
+    Ppc405SoCState *s = PPC405_SOC(obj);
+
+    object_initialize_child(obj, "cpu", &s->cpu,
+                            POWERPC_CPU_TYPE_NAME("405ep"));
+}
+
 static void ppc405_soc_realize(DeviceState *dev, Error **errp)
 {
     Ppc405SoCState *s = PPC405_SOC(dev);
-    clk_setup_t clk_setup[PPC405EP_CLK_NB], tlb_clk_setup;
+    clk_setup_t clk_setup[PPC405EP_CLK_NB];
     qemu_irq dma_irqs[4], gpt_irqs[5], mal_irqs[4];
     CPUPPCState *env;
 
     memset(clk_setup, 0, sizeof(clk_setup));
 
     /* init CPUs */
-    s->cpu = ppc4xx_init(POWERPC_CPU_TYPE_NAME("405ep"),
-                      &clk_setup[PPC405EP_CPU_CLK],
-                      &tlb_clk_setup, s->sysclk);
-    env = &s->cpu->env;
-    clk_setup[PPC405EP_CPU_CLK].cb = tlb_clk_setup.cb;
-    clk_setup[PPC405EP_CPU_CLK].opaque = tlb_clk_setup.opaque;
+    if (!qdev_realize(DEVICE(&s->cpu), NULL, errp)) {
+        return;
+    }
+    qemu_register_reset(ppc4xx_reset, &s->cpu);
+
+    env = &s->cpu.env;
+
+    clk_setup[PPC405EP_CPU_CLK].cb =
+        ppc_40x_timers_init(env, s->sysclk, PPC_INTERRUPT_PIT);
+    clk_setup[PPC405EP_CPU_CLK].opaque = env;
+
+    ppc_dcr_init(env, NULL, NULL);
 
     /* CPU control */
     ppc405ep_cpc_init(env, clk_setup, s->sysclk);
@@ -1464,16 +1478,16 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     /* Universal interrupt controller */
     s->uic = qdev_new(TYPE_PPC_UIC);
 
-    object_property_set_link(OBJECT(s->uic), "cpu", OBJECT(s->cpu),
+    object_property_set_link(OBJECT(s->uic), "cpu", OBJECT(&s->cpu),
                              &error_fatal);
     if (!sysbus_realize(SYS_BUS_DEVICE(s->uic), errp)) {
         return;
     }
 
     sysbus_connect_irq(SYS_BUS_DEVICE(s->uic), PPCUIC_OUTPUT_INT,
-                       qdev_get_gpio_in(DEVICE(s->cpu), PPC40x_INPUT_INT));
+                       qdev_get_gpio_in(DEVICE(&s->cpu), PPC40x_INPUT_INT));
     sysbus_connect_irq(SYS_BUS_DEVICE(s->uic), PPCUIC_OUTPUT_CINT,
-                       qdev_get_gpio_in(DEVICE(s->cpu), PPC40x_INPUT_CINT));
+                       qdev_get_gpio_in(DEVICE(&s->cpu), PPC40x_INPUT_CINT));
 
     /* SDRAM controller */
         /* XXX 405EP has no ECC interrupt */
@@ -1562,6 +1576,7 @@ static const TypeInfo ppc405_types[] = {
         .name           = TYPE_PPC405_SOC,
         .parent         = TYPE_DEVICE,
         .instance_size  = sizeof(Ppc405SoCState),
+        .instance_init  = ppc405_soc_instance_init,
         .class_init     = ppc405_soc_class_init,
     }
 };
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index 737c0896b4f8..f20098cf417c 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -37,7 +37,7 @@
 #include "qapi/error.h"
 #include "trace.h"
 
-static void ppc4xx_reset(void *opaque)
+void ppc4xx_reset(void *opaque)
 {
     PowerPCCPU *cpu = opaque;
 
-- 
2.37.1


