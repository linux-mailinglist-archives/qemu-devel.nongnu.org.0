Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEED6A44ED
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:43:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeAP-0007nv-2O; Mon, 27 Feb 2023 09:07:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe9d-0007g9-5K
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:07:06 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe9b-0000E6-3k
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:07:00 -0500
Received: by mail-wm1-x331.google.com with SMTP id p16so4300647wmq.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EGxj4BA7WuTT+dIhFQSBAHpPQ5r9fDzaqonnzDMCb7o=;
 b=aL4bsHUZ/YQWVu9mH0Xj35jFTNOJRl6psyabGa70txZK1zCDSZFbrIm6JQV6MIwyni
 JN1gVLW55BwQFhOpgsXZeLBBBZ0R4N37hj0kO2deOgZ3vP+wo/LRmkX0NSriGxQS+gNg
 aOtgwMkMRw8OdWELseCdgp9aPDvT0Z7TT3JRNahEovVY1xiEwrUHzgVHJkk91rU19bBp
 U23/E7ThNFV2bdeuhtt8lG0TMoXh5O0Vb9oT8uHvvBwR5pxUhTmyp1auFYWBgU9bIFO+
 wTBPF9jsSfupsh4GmqiJvO0bySGahOTh/o3zvaFGFDYiRJW6Wdm4bQi+a97gcIvbf+qb
 m28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EGxj4BA7WuTT+dIhFQSBAHpPQ5r9fDzaqonnzDMCb7o=;
 b=pSa1wU5EoiOitsEjqO4npXgLZ+1S/eqB8Mg7OHDNWOnOZZ7QpjdU4FKp3BKhEUn30y
 SeQ7NeTuImViqYqiqM3fmgc3wid5V9q66esSJxDENbHTMGhmkUSf+h7ck07Ntiu4Mk1c
 GmalWQSkztqOpJMM/pJuSYAi7dtY4dTXS6SC5wvnpoVHUnXY6K0jUEE2n9h39v8xxLtK
 A/3YVWGK8A8U9P3siQLYDLYreA0+wxDKOdiir7jWpUZhWV7EW4s0bEX39Jqi8nfsHHOo
 D0yUsE+++rUCcfKocvVf+Iptx3SdLV34NSPUSkdDztSw6QQZjvJApQF0RWrVN5IvHNpM
 H/aA==
X-Gm-Message-State: AO0yUKWM5BHikN+PzjEUKIgD9SmhlRGjN0hWKZuzvPa/MsKf1tg+YO6B
 ISUxiSRLQRnXT1URTZDPm5uPR4kjY1YRBIGN
X-Google-Smtp-Source: AK7set/qETHRQBNG9/6bUfIWeMT+it8QpZFJ/1oag9tAHmQKIejY09kT1kv34K/MLgiH4AhvyAjYMg==
X-Received: by 2002:a05:600c:4d21:b0:3d9:f769:2115 with SMTP id
 u33-20020a05600c4d2100b003d9f7692115mr18318256wmp.26.1677506817101; 
 Mon, 27 Feb 2023 06:06:57 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 bd12-20020a05600c1f0c00b003e0015c8618sm12916505wmb.6.2023.02.27.06.06.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:06:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 061/126] hw/isa: Rename isa_bus_irqs() ->
 isa_bus_register_input_irqs()
Date: Mon, 27 Feb 2023 15:01:08 +0100
Message-Id: <20230227140213.35084-52-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

isa_bus_irqs() register an array of input IRQs on
the ISA bus. Rename it as isa_bus_register_input_irqs().

Mechanical change using:

 $ sed -i -e 's/isa_bus_irqs/isa_bus_register_input_irqs/g' \
   $(git grep -wl isa_bus_irqs)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230210163744.32182-10-philmd@linaro.org>
---
 hw/hppa/machine.c    | 2 +-
 hw/i386/microvm.c    | 2 +-
 hw/i386/pc_piix.c    | 2 +-
 hw/isa/i82378.c      | 2 +-
 hw/isa/isa-bus.c     | 8 ++++----
 hw/isa/lpc_ich9.c    | 2 +-
 hw/isa/piix4.c       | 2 +-
 hw/isa/vt82c686.c    | 2 +-
 hw/mips/jazz.c       | 2 +-
 hw/ppc/pnv_lpc.c     | 2 +-
 hw/sparc64/sun4u.c   | 2 +-
 include/hw/isa/isa.h | 4 ++--
 12 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 7ac68c943f..8fea5fa6b8 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -98,7 +98,7 @@ static ISABus *hppa_isa_bus(void)
     isa_irqs = i8259_init(isa_bus,
                           /* qemu_allocate_irq(dino_set_isa_irq, s, 0)); */
                           NULL);
-    isa_bus_irqs(isa_bus, isa_irqs);
+    isa_bus_register_input_irqs(isa_bus, isa_irqs);
 
     return isa_bus;
 }
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 29f30dd6d3..fed468a34d 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -174,7 +174,7 @@ static void microvm_devices_init(MicrovmMachineState *mms)
 
     isa_bus = isa_bus_new(NULL, get_system_memory(), get_system_io(),
                           &error_abort);
-    isa_bus_irqs(isa_bus, x86ms->gsi);
+    isa_bus_register_input_irqs(isa_bus, x86ms->gsi);
 
     ioapic_init_gsi(gsi_state, "machine");
     if (ioapics > 1) {
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index df64dd8dcc..7c48ba30e0 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -246,7 +246,7 @@ static void pc_init1(MachineState *machine,
         i8257_dma_init(isa_bus, 0);
         pcms->hpet_enabled = false;
     }
-    isa_bus_irqs(isa_bus, x86ms->gsi);
+    isa_bus_register_input_irqs(isa_bus, x86ms->gsi);
 
     if (x86ms->pic == ON_OFF_AUTO_ON || x86ms->pic == ON_OFF_AUTO_AUTO) {
         pc_i8259_create(isa_bus, gsi_state->i8259_irq);
diff --git a/hw/isa/i82378.c b/hw/isa/i82378.c
index d32653369d..233059c6dc 100644
--- a/hw/isa/i82378.c
+++ b/hw/isa/i82378.c
@@ -89,7 +89,7 @@ static void i82378_realize(PCIDevice *pci, Error **errp)
 
     /* 2 82C59 (irq) */
     s->isa_irqs_in = i8259_init(isabus, s->cpu_intr);
-    isa_bus_irqs(isabus, s->isa_irqs_in);
+    isa_bus_register_input_irqs(isabus, s->isa_irqs_in);
 
     /* 1 82C54 (pit) */
     pit = i8254_pit_init(isabus, 0x40, 0, NULL);
diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 2464357971..ce9999f7f7 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -67,13 +67,13 @@ ISABus *isa_bus_new(DeviceState *dev, MemoryRegion* address_space,
     return isabus;
 }
 
-void isa_bus_irqs(ISABus *bus, qemu_irq *irqs)
+void isa_bus_register_input_irqs(ISABus *bus, qemu_irq *irqs_in)
 {
-    bus->irqs = irqs;
+    bus->irqs_in = irqs_in;
 }
 
 /*
- * isa_get_irq() returns the corresponding qemu_irq entry for the i8259.
+ * isa_get_irq() returns the corresponding input qemu_irq entry for the i8259.
  *
  * This function is only for special cases such as the 'ferr', and
  * temporary use for normal devices until they are converted to qdev.
@@ -82,7 +82,7 @@ qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq)
 {
     assert(!dev || ISA_BUS(qdev_get_parent_bus(DEVICE(dev))) == isabus);
     assert(isairq < ISA_NUM_IRQS);
-    return isabus->irqs[isairq];
+    return isabus->irqs_in[isairq];
 }
 
 void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned isairq)
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 96fd500502..d8303d0322 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -719,7 +719,7 @@ static void ich9_lpc_realize(PCIDevice *d, Error **errp)
 
     qdev_init_gpio_out_named(dev, lpc->gsi, ICH9_GPIO_GSI, IOAPIC_NUM_PINS);
 
-    isa_bus_irqs(isa_bus, lpc->gsi);
+    isa_bus_register_input_irqs(isa_bus, lpc->gsi);
 
     i8257_dma_init(isa_bus, 0);
 
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index de60ceef73..ef24826993 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -212,7 +212,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     s->isa = i8259_init(isa_bus, *i8259_out_irq);
 
     /* initialize ISA irqs */
-    isa_bus_irqs(isa_bus, s->isa);
+    isa_bus_register_input_irqs(isa_bus, s->isa);
 
     /* initialize pit */
     i8254_pit_init(isa_bus, 0x40, 0, NULL);
diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index a913a509f7..52814cc751 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -615,7 +615,7 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     }
 
     s->isa_irqs_in = i8259_init(isa_bus, s->cpu_intr);
-    isa_bus_irqs(isa_bus, s->isa_irqs_in);
+    isa_bus_register_input_irqs(isa_bus, s->isa_irqs_in);
     i8254_pit_init(isa_bus, 0x40, 0, NULL);
     i8257_dma_init(isa_bus, 0);
 
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index 6aefe9a61b..ca4426a92c 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -249,7 +249,7 @@ static void mips_jazz_init(MachineState *machine,
 
     /* ISA devices */
     i8259 = i8259_init(isa_bus, env->irq[4]);
-    isa_bus_irqs(isa_bus, i8259);
+    isa_bus_register_input_irqs(isa_bus, i8259);
     i8257_dma_init(isa_bus, 0);
     pit = i8254_pit_init(isa_bus, 0x40, 0, NULL);
     pcspk_init(isa_new(TYPE_PC_SPEAKER), isa_bus, pit);
diff --git a/hw/ppc/pnv_lpc.c b/hw/ppc/pnv_lpc.c
index 71143b7692..01f44c19eb 100644
--- a/hw/ppc/pnv_lpc.c
+++ b/hw/ppc/pnv_lpc.c
@@ -837,7 +837,7 @@ ISABus *pnv_lpc_isa_create(PnvLpcController *lpc, bool use_cpld, Error **errp)
 
     irqs = qemu_allocate_irqs(handler, lpc, ISA_NUM_IRQS);
 
-    isa_bus_irqs(isa_bus, irqs);
+    isa_bus_register_input_irqs(isa_bus, irqs);
 
     return isa_bus;
 }
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 8fe47e2c22..8a56ba9f98 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -316,7 +316,7 @@ static void ebus_realize(PCIDevice *pci_dev, Error **errp)
 
     /* ISA bus */
     s->isa_irqs_in = qemu_allocate_irqs(ebus_isa_irq_handler, s, ISA_NUM_IRQS);
-    isa_bus_irqs(s->isa_bus, s->isa_irqs_in);
+    isa_bus_register_input_irqs(s->isa_bus, s->isa_irqs_in);
     qdev_init_gpio_out_named(DEVICE(s), s->isa_irqs_out, "isa-irq",
                              ISA_NUM_IRQS);
 
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index 1d3ffec4de..eb920aa710 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -55,7 +55,7 @@ struct ISABus {
 
     MemoryRegion *address_space;
     MemoryRegion *address_space_io;
-    qemu_irq *irqs;
+    qemu_irq *irqs_in;
     IsaDma *dma[2];
 };
 
@@ -69,7 +69,7 @@ struct ISADevice {
 
 ISABus *isa_bus_new(DeviceState *dev, MemoryRegion *address_space,
                     MemoryRegion *address_space_io, Error **errp);
-void isa_bus_irqs(ISABus *bus, qemu_irq *irqs);
+void isa_bus_register_input_irqs(ISABus *bus, qemu_irq *irqs_in);
 void isa_bus_dma(ISABus *bus, IsaDma *dma8, IsaDma *dma16);
 IsaDma *isa_get_dma(ISABus *bus, int nchan);
 ISADevice *isa_new(const char *name);
-- 
2.38.1


