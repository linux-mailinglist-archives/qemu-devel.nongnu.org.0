Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2165A86F1
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:46:00 +0200 (CEST)
Received: from localhost ([::1]:38546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTTex-0004qN-RX
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:45:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSpF-0004td-EO; Wed, 31 Aug 2022 14:52:33 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a]:45900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSp9-0008A8-5t; Wed, 31 Aug 2022 14:52:32 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-11ba6e79dd1so26223307fac.12; 
 Wed, 31 Aug 2022 11:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=yl8rm9P+OzNvfgUS/PCOQKxxT/nYduRz+Ku53OyxE/0=;
 b=WOH8GYGJiKGR3RgrlYONyTkcgTNXfZ8KSfFcHrepLY9nXtKG9dUzwPIYMOPUTvNsOd
 AkkqEsY0V7+qEaTs2M36ac01ap7wSRyGbTlDAIpKrPEhmdVQmFlX8O65QHDiMOSdoRTO
 934Xxvar3WmKOMzlpFVZL/7Y3dVHZj+J5+OznaEfxoGrTX1TpxYbNezzJ9K1bpd9GcbQ
 3/bQks3d/9dVyk5mr44b0fg+5x1Z1l53ZFWdSd+d8qk+dnq5qGpj1nRc4thrMYcmleU7
 /T3dShOHnCzx40//oa0mT5WD/6LTjIrenAkV1y3jUFlECk4HFtMAwWz654Ztf2cpFD17
 iCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=yl8rm9P+OzNvfgUS/PCOQKxxT/nYduRz+Ku53OyxE/0=;
 b=cSYGJbZJf63iUhG+mNqp9bG9Lqdor6uQUviLDpFG1dpkpp0nKQy1+amCyoIJCGBXID
 6xOZNMwNvOTCbqiEp3UQHyCAcYNmmPrdFpHdSA/mLqD38nQmL0tGE+/q2M4p3Mm2z6Vb
 /iZkr3HU/TmJakCTGsrXkXtN1oAe+CwOzfXPf/c0P8J0IDmBt/pTq+Haw3O6RKTFgof1
 axbyY+pTvi3hXIX2l9V81lni+KqNSAaEiRXyM5ve7H1biZ8MpWe3iaYNp1ApVoixxqoM
 DhOELV2/CVCGlIvU3mMwvNsHi+dtFVoq8zHKkti/HRpbrXqU50wXGelJ5uYOGVtlPwx1
 Yh0g==
X-Gm-Message-State: ACgBeo0azJOLa7QM1x+WNGxJAz1Ih9eJWchzzqnA04CxKj8fn8VwzXTU
 0sTdvpsgG+GERHcXGAA3DpWh0JTF/7o=
X-Google-Smtp-Source: AA6agR44/RlMN5pkqFJCdTEgbbApp/aUnelrzEYWaaQFR+yqqZ40YPULVvpR+AFhD8g3jUv6t+0T8w==
X-Received: by 2002:a54:4e97:0:b0:345:4cd0:20fd with SMTP id
 c23-20020a544e97000000b003454cd020fdmr1919798oiy.206.1661971945433; 
 Wed, 31 Aug 2022 11:52:25 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:52:25 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PULL 36/60] ppc/ppc405: QOM'ify CPU
Date: Wed, 31 Aug 2022 15:50:10 -0300
Message-Id: <20220831185034.23240-37-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

From: Cédric Le Goater <clg@kaod.org>

Drop the use of ppc4xx_init() and duplicate a bit of code related to
clocks in the SoC realize routine. We will clean that up in the
following patches.

ppc_dcr_init() simply allocates default DCR handlers for the CPU. Maybe
this could be done in model initializer of the CPU families needing it.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <20220809153904.485018-8-clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc405.h         |  2 +-
 hw/ppc/ppc405_boards.c  |  2 +-
 hw/ppc/ppc405_uc.c      | 40 ++++++++++++++++++++++++++++++----------
 hw/ppc/ppc4xx_devs.c    | 32 --------------------------------
 include/hw/ppc/ppc4xx.h |  5 -----
 5 files changed, 32 insertions(+), 49 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index dc862bc861..8cc76cc8b3 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -79,7 +79,7 @@ struct Ppc405SoCState {
     hwaddr ram_size;
 
     uint32_t sysclk;
-    PowerPCCPU *cpu;
+    PowerPCCPU cpu;
     DeviceState *uic;
 };
 
diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index b93e85b5d9..3677793adc 100644
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
index c05ab60436..14a525b2eb 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -1432,22 +1432,41 @@ static void ppc405ep_cpc_init (CPUPPCState *env, clk_setup_t clk_setup[8],
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
+static void ppc405_reset(void *opaque)
+{
+    cpu_reset(CPU(opaque));
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
+    qemu_register_reset(ppc405_reset, &s->cpu);
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
@@ -1464,16 +1483,16 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
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
@@ -1563,6 +1582,7 @@ static const TypeInfo ppc405_types[] = {
         .name           = TYPE_PPC405_SOC,
         .parent         = TYPE_DEVICE,
         .instance_size  = sizeof(Ppc405SoCState),
+        .instance_init  = ppc405_soc_instance_init,
         .class_init     = ppc405_soc_class_init,
     }
 };
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index 737c0896b4..069b511951 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -37,38 +37,6 @@
 #include "qapi/error.h"
 #include "trace.h"
 
-static void ppc4xx_reset(void *opaque)
-{
-    PowerPCCPU *cpu = opaque;
-
-    cpu_reset(CPU(cpu));
-}
-
-/*****************************************************************************/
-/* Generic PowerPC 4xx processor instantiation */
-PowerPCCPU *ppc4xx_init(const char *cpu_type,
-                        clk_setup_t *cpu_clk, clk_setup_t *tb_clk,
-                        uint32_t sysclk)
-{
-    PowerPCCPU *cpu;
-    CPUPPCState *env;
-
-    /* init CPUs */
-    cpu = POWERPC_CPU(cpu_create(cpu_type));
-    env = &cpu->env;
-
-    cpu_clk->cb = NULL; /* We don't care about CPU clock frequency changes */
-    cpu_clk->opaque = env;
-    /* Set time-base frequency to sysclk */
-    tb_clk->cb = ppc_40x_timers_init(env, sysclk, PPC_INTERRUPT_PIT);
-    tb_clk->opaque = env;
-    ppc_dcr_init(env, NULL, NULL);
-    /* Register qemu callbacks */
-    qemu_register_reset(ppc4xx_reset, cpu);
-
-    return cpu;
-}
-
 /*****************************************************************************/
 /* SDRAM controller */
 typedef struct ppc4xx_sdram_t ppc4xx_sdram_t;
diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index 980f964b5a..591e2421a3 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -28,11 +28,6 @@
 #include "hw/ppc/ppc.h"
 #include "exec/memory.h"
 
-/* PowerPC 4xx core initialization */
-PowerPCCPU *ppc4xx_init(const char *cpu_model,
-                        clk_setup_t *cpu_clk, clk_setup_t *tb_clk,
-                        uint32_t sysclk);
-
 void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
                         MemoryRegion ram_memories[],
                         hwaddr ram_bases[], hwaddr ram_sizes[],
-- 
2.37.2


