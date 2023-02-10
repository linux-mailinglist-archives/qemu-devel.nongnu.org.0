Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C928692370
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:38:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQWQG-0001hv-Hw; Fri, 10 Feb 2023 11:38:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQWQ5-0001Z6-LN
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:38:42 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQWPy-0000If-16
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:38:40 -0500
Received: by mail-wr1-x42e.google.com with SMTP id o18so5641164wrj.3
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 08:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kTPaflOC6+oM6trEZJQXYf+7BQUWtjQrjMlU/xZObQI=;
 b=lV8gKKERQhQIbIjAcFgfOLY1bTun3ZEipDoBHYh8j7s4SfvICup4qNU8Ijm2NiwuEq
 klJ82qe8W97tOgIjfLkGcJ2l3a+gO6mo1y6Bzmi2w4HUBtRngUG3q/Pl2EM6SdRg0aBx
 bgNDoiQUuseLtqXk0ohIXhpa+zpN7zkSMfC/zzUFW+QSTHALFmnKf2Ac4ZbifFLyyvyy
 DJ+jCgCcwDYJ8+sW3yWUkr6Q1IlOmHTuVcht8LWAbYdh7zGLLWBO6lIQg18dS4LBP4Ef
 p90Z/L87vdxBx7mlNWl2GnbMNa9sh42lVJfcgSA6tjpHKJIO7htCKx2JBHEhtUbCq0Xu
 zgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kTPaflOC6+oM6trEZJQXYf+7BQUWtjQrjMlU/xZObQI=;
 b=kPEbfpQUN1ofr1BQVR6pBcuhcZgUaiF6x74NuzEEeBAN/KlHE558MYyvwoWUyD6eWq
 awt8RTzC25a3Jo/h5sZN4DqwWjlnWJMAR36TywiTYQz6noiMVLT98pIThtb2Qfz6PRs4
 yKxUkzwXKBs60bBBCpnVPY428MQWcyHRAVPuY/BRROrC/769148zesTZuSLnwUJH8JyC
 x6DbHU+rkybe67ASBuUuZrNPVIyxZnkegBOd2DgvaU2CohIRGMWhWnaEzkj660C1VRFg
 mH8VDzoO4tKd5ppJKdX2EJkzSIHZmyJaVNFFCWG6Yq4MpdQQ1K2lxGgR28n3G9Sdj9j9
 ZLMg==
X-Gm-Message-State: AO0yUKX19UgUFFRwhsRk1ZW5yAnIooNT33JUsZkw3JQVoSTVjtZNLfzW
 jvid9nN3I9HtcTyg6uf4mTvqTGUERLA1vWyD
X-Google-Smtp-Source: AK7set9Mpm9uxCMorBLRzPKSQlcHbK+sA0ERtZQ79XqE6pqneJlmAyD8xmUkBjYD/wnjR5bYZzUZhg==
X-Received: by 2002:a5d:528f:0:b0:2bf:d285:b787 with SMTP id
 c15-20020a5d528f000000b002bfd285b787mr13767125wrv.56.1676047111833; 
 Fri, 10 Feb 2023 08:38:31 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a1c7c02000000b003df30c94850sm8498689wmc.25.2023.02.10.08.38.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Feb 2023 08:38:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Helge Deller <deller@gmx.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH 09/11] hw/isa: Rename isa_bus_irqs() ->
 isa_bus_register_input_irqs()
Date: Fri, 10 Feb 2023 17:37:42 +0100
Message-Id: <20230210163744.32182-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230210163744.32182-1-philmd@linaro.org>
References: <20230210163744.32182-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
index 5bd99379e9..d19826f96e 100644
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
index 1fba3c210c..cda2f5621e 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -725,7 +725,7 @@ static void ich9_lpc_realize(PCIDevice *d, Error **errp)
 
     qdev_init_gpio_out_named(dev, lpc->gsi, ICH9_GPIO_GSI, GSI_NUM_PINS);
 
-    isa_bus_irqs(isa_bus, lpc->gsi);
+    isa_bus_register_input_irqs(isa_bus, lpc->gsi);
 
     i8257_dma_init(isa_bus, 0);
 }
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
index fc7898006c..3b09c93a92 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -249,7 +249,7 @@ static void mips_jazz_init(MachineState *machine,
 
     /* ISA devices */
     isa_irqs_in = i8259_init(isa_bus, env->irq[4]);
-    isa_bus_irqs(isa_bus, isa_irqs_in);
+    isa_bus_register_input_irqs(isa_bus, isa_irqs_in);
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
index 1691364011..0aa36d4115 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -59,7 +59,7 @@ struct ISABus {
 
     MemoryRegion *address_space;
     MemoryRegion *address_space_io;
-    qemu_irq *irqs;
+    qemu_irq *irqs_in;
     IsaDma *dma[2];
 };
 
@@ -73,7 +73,7 @@ struct ISADevice {
 
 ISABus *isa_bus_new(DeviceState *dev, MemoryRegion *address_space,
                     MemoryRegion *address_space_io, Error **errp);
-void isa_bus_irqs(ISABus *bus, qemu_irq *irqs);
+void isa_bus_register_input_irqs(ISABus *bus, qemu_irq *irqs_in);
 void isa_bus_dma(ISABus *bus, IsaDma *dma8, IsaDma *dma16);
 IsaDma *isa_get_dma(ISABus *bus, int nchan);
 ISADevice *isa_new(const char *name);
-- 
2.38.1


