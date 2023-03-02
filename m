Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 188436A8B19
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 22:23:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXqNr-0000tE-0M; Thu, 02 Mar 2023 16:22:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pXqNo-0000sJ-JP
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:22:36 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pXqNm-0002Pr-UI
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:22:36 -0500
Received: by mail-ed1-x529.google.com with SMTP id s11so2434201edy.8
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 13:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677792154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E3AbtksDDkEgW154O4FaZBF+XsOlCJCcpo5LHxuITys=;
 b=SbodzgqTXASpdpzrW/p33BHevosp6Xf34vNuqkZ2y6kabsW0vLkcSl/Y9T6M42A5u8
 uJEqeOV2EWGw8Q0LN+EjltfFvXWz7nMY0HOg4veIJs7iwQS6Hpb6heLqquPR3L0FX2u6
 gGmRQFBXilq5eCa13E07ePMCDqNhQeehpNMB49/hr/5EcEtzPo1NbgeJBRnUyxa53xo1
 ZwNO7EV6CrMcS6zSCO8V8OiMUKGFiaNqDRfWnMyF9zhRKWGZJrA+QZfeO8A3d8IU5RKJ
 6HwMQ9RwZ1xpPGQ/2armPRJf+AECE+egXUKgTnr32IVIE4yaDZ68FqbAgLATwQ2v785o
 pVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677792154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E3AbtksDDkEgW154O4FaZBF+XsOlCJCcpo5LHxuITys=;
 b=K6kBARuFGDds2FdhNYWAEP+1AoDEIwaj/MSCDEKs3qUIhnaana413eowu5T4Dtp4CJ
 0nwvbLVdRlHHi3AuQ10ZvgqLOaFAhGlYrmGMByKsa0sJIk1KIFCVPaTeo1dvb+QstZjD
 /blXZxAfUGbx0rGzbAEWruIm4XtYaFoRzMlt3ty9PCxaDfvj7BTGXOQllG73Gfe7KDwb
 yhFfWisIjrF9u4fEqgL7qf5Kek2cdnb/4wcyZR17sL7+jHWB+oP/y0WDH4BSw/hdGdXo
 ZXy2Y9CW1Ap5+iD6r8AwkohpU/uCekKXG6adYmHP5iLnphcTtPiDtUG946sDhFkTl+1X
 NaOQ==
X-Gm-Message-State: AO0yUKWrvayD0EuRHWLLsYUbJa4CgU3emdEIR0QhkkeT9nNUHagZ5hLy
 hGx/YRvUH6x9T3bGprmvcZqvRyB+HfI=
X-Google-Smtp-Source: AK7set+MX29xmLqjZSpu0iLhBwH5+L7t7+5T0s6ldasBy0sZRNpY+Hud2DxQvRc2laf0aucK79xzYg==
X-Received: by 2002:a17:906:2b48:b0:8f8:7a2b:cc0d with SMTP id
 b8-20020a1709062b4800b008f87a2bcc0dmr12981685ejg.47.1677792154009; 
 Thu, 02 Mar 2023 13:22:34 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-092-224-150-004.92.224.pool.telefonica.de. [92.224.150.4])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709062ec400b008f89953b761sm145895eji.3.2023.03.02.13.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 13:22:33 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v8 23/23] hw/isa/piix: Reuse PIIX3 base class' realize method
 in PIIX4
Date: Thu,  2 Mar 2023 22:22:01 +0100
Message-Id: <20230302212201.224360-24-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302212201.224360-1-shentey@gmail.com>
References: <20230302212201.224360-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Resolves duplicate code.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix.c | 78 ++++++++++++++++-----------------------------------
 1 file changed, 24 insertions(+), 54 deletions(-)

diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index 5d4e411e33..945c47b7e9 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -311,17 +311,11 @@ static const MemoryRegionOps rcr_ops = {
     },
 };
 
-static void pci_piix3_realize(PCIDevice *dev, Error **errp)
+static void pci_piix_realize(PCIDevice *dev, const char *uhci_type,
+                             ISABus *isa_bus, Error **errp)
 {
     PIIXState *d = PIIX_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
-    ISABus *isa_bus;
-
-    isa_bus = isa_bus_new(DEVICE(d), pci_address_space(dev),
-                          pci_address_space_io(dev), errp);
-    if (!isa_bus) {
-        return;
-    }
 
     memory_region_init_io(&d->rcr_mem, OBJECT(dev), &rcr_ops, d,
                           "piix-reset-control", 1);
@@ -346,8 +340,7 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
 
     /* USB */
     if (d->has_usb) {
-        object_initialize_child(OBJECT(dev), "uhci", &d->uhci,
-                                TYPE_PIIX3_USB_UHCI);
+        object_initialize_child(OBJECT(dev), "uhci", &d->uhci, uhci_type);
         qdev_prop_set_int32(DEVICE(&d->uhci), "addr", dev->devfn + 2);
         if (!qdev_realize(DEVICE(&d->uhci), BUS(pci_bus), errp)) {
             return;
@@ -442,8 +435,15 @@ static void piix3_realize(PCIDevice *dev, Error **errp)
     ERRP_GUARD();
     PIIXState *piix3 = PIIX_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
+    ISABus *isa_bus;
+
+    isa_bus = isa_bus_new(DEVICE(dev), pci_address_space(dev),
+                          pci_address_space_io(dev), errp);
+    if (!isa_bus) {
+        return;
+    }
 
-    pci_piix3_realize(dev, errp);
+    pci_piix_realize(dev, TYPE_PIIX3_USB_UHCI, isa_bus, errp);
     if (*errp) {
         return;
     }
@@ -483,8 +483,15 @@ static void piix3_xen_realize(PCIDevice *dev, Error **errp)
     ERRP_GUARD();
     PIIXState *piix3 = PIIX_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
+    ISABus *isa_bus;
 
-    pci_piix3_realize(dev, errp);
+    isa_bus = isa_bus_new(DEVICE(dev), pci_address_space(dev),
+                          pci_address_space_io(dev), errp);
+    if (!isa_bus) {
+        return;
+    }
+
+    pci_piix_realize(dev, TYPE_PIIX3_USB_UHCI, isa_bus, errp);
     if (*errp) {
         return;
     }
@@ -525,6 +532,7 @@ static void piix4_request_i8259_irq(void *opaque, int irq, int level)
 
 static void piix4_realize(PCIDevice *dev, Error **errp)
 {
+    ERRP_GUARD();
     PIIXState *s = PIIX_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
     ISABus *isa_bus;
@@ -536,59 +544,21 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
-    memory_region_init_io(&s->rcr_mem, OBJECT(dev), &rcr_ops, s,
-                          "piix-reset-control", 1);
-    memory_region_add_subregion_overlap(pci_address_space_io(dev),
-                                        PIIX_RCR_IOPORT, &s->rcr_mem, 1);
-
     /* initialize i8259 pic */
     i8259_out_irq = qemu_allocate_irqs(piix4_request_i8259_irq, s, 1);
     s->pic = i8259_init(isa_bus, *i8259_out_irq);
 
-    /* initialize ISA irqs */
-    isa_bus_register_input_irqs(isa_bus, s->pic);
+    pci_piix_realize(dev, TYPE_PIIX4_USB_UHCI, isa_bus, errp);
+    if (*errp) {
+        return;
+    }
 
     /* initialize pit */
     i8254_pit_init(isa_bus, 0x40, 0, NULL);
 
-    /* DMA */
-    i8257_dma_init(isa_bus, 0);
-
     /* RTC */
-    qdev_prop_set_int32(DEVICE(&s->rtc), "base_year", 2000);
-    if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
-        return;
-    }
     s->rtc.irq = s->pic[s->rtc.isairq];
 
-    /* IDE */
-    qdev_prop_set_int32(DEVICE(&s->ide), "addr", dev->devfn + 1);
-    if (!qdev_realize(DEVICE(&s->ide), BUS(pci_bus), errp)) {
-        return;
-    }
-
-    /* USB */
-    if (s->has_usb) {
-        object_initialize_child(OBJECT(dev), "uhci", &s->uhci,
-                                TYPE_PIIX4_USB_UHCI);
-        qdev_prop_set_int32(DEVICE(&s->uhci), "addr", dev->devfn + 2);
-        if (!qdev_realize(DEVICE(&s->uhci), BUS(pci_bus), errp)) {
-            return;
-        }
-    }
-
-    /* ACPI controller */
-    if (s->has_acpi) {
-        object_initialize_child(OBJECT(s), "pm", &s->pm, TYPE_PIIX4_PM);
-        qdev_prop_set_int32(DEVICE(&s->pm), "addr", dev->devfn + 3);
-        qdev_prop_set_uint32(DEVICE(&s->pm), "smb_io_base", s->smb_io_base);
-        qdev_prop_set_bit(DEVICE(&s->pm), "smm-enabled", s->smm_enabled);
-        if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
-            return;
-        }
-        qdev_connect_gpio_out(DEVICE(&s->pm), 0, s->pic[9]);
-    }
-
     pci_bus_irqs(pci_bus, piix_set_irq, s, PIIX_NUM_PIRQS);
 }
 
-- 
2.39.2


