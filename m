Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D24537A50
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 14:02:26 +0200 (CEST)
Received: from localhost ([::1]:50598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nve6K-0001QW-S6
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 08:02:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvdZK-0000iy-SP
 for qemu-devel@nongnu.org; Mon, 30 May 2022 07:28:18 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:46991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvdZJ-0001OI-0u
 for qemu-devel@nongnu.org; Mon, 30 May 2022 07:28:18 -0400
Received: by mail-pl1-x629.google.com with SMTP id w3so10051245plp.13
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 04:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s3ct9QYXVdcXY/ODEGhXls+lLUAij8uj6IvHUeVOmVU=;
 b=JXh4AE1astdA8zafkAcelFafFQybxfiAhL0hkOD9o2Yaa89nQtjZ4C9OmEOLudBdLh
 aocUynvzk53PSabMH3DvBBjX3NoI6j90I8IUA7RqzhjeGE8NNNDvcxIoU2yU4MQsd+Fs
 K8mV3AApCoyMr5EHg+FebgwQy62soMEsAqnbiq0iPAlKf+bl0BnbSPtF1ZKe2Rgxmmkm
 3flBTPb472Aq8eQv7S2fVTQsDdkvxJCB6jKdvwiMVjiCQUiPkh21AbfvglGteCCmvEus
 BBBd8XBFpkZDuvWXIkT4ffsQnrtWbkwCByUv64L5y3GAD6si7y25yo6NG/PDPO1m5rIp
 1H/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s3ct9QYXVdcXY/ODEGhXls+lLUAij8uj6IvHUeVOmVU=;
 b=BwuH2b+/UI0+fS7XRIuPlYsYux9YXCi4XhZbzUlygxtCthyv5lf7ICWJXHqGTCDYqS
 mfpe9OdJd+zSJK/nDwDfNCQGrm8C4/PTOArbtQZeKE0dGOEpiqEOFNVVjO1KkcAQ31S0
 YWRHl8hnv5Jax3R9+0hQpWGXjPVmltkpWnsDEvMrJ9Zq9N28FIbyqGtgp4CMc4/1PWYo
 O1R2w2wNOXx4h1wipX9gbZq0D+rLTEph61vN/QPkXTRDmQAbGj8gvwpjOVihBRy81Rp8
 Td03zXZlluM9NFkAXgWtMDhlT7bX/ptGVrLKVlq8C/Agx2kNyYugP1YEYssfUblRwoTU
 zhYg==
X-Gm-Message-State: AOAM531uBLpBxFlt1PUH7S/LJcEfHI05YvvB01Scp0yBTWySThRk5imk
 8TrhgGap8pncqGfDhBP9hVY=
X-Google-Smtp-Source: ABdhPJxymtsjhDpakIFZ1dD0VH7rta9FA5TtkR8wKLQtxNDDqf1IjyPaPIkagaT9Cy9DXQUerP11Xw==
X-Received: by 2002:a17:90a:de01:b0:1df:cda5:8332 with SMTP id
 m1-20020a17090ade0100b001dfcda58332mr22591114pjv.123.1653910095655; 
 Mon, 30 May 2022 04:28:15 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a170902ebc100b00163ad74fe4esm2716945plg.70.2022.05.30.04.28.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 May 2022 04:28:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Bernhard Beschow <shentey@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 05/11] hw/acpi/piix4: alter piix4_pm_init() to return
 PIIX4PMState
Date: Mon, 30 May 2022 13:27:12 +0200
Message-Id: <20220530112718.26582-6-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530112718.26582-1-philippe.mathieu.daude@gmail.com>
References: <20220530112718.26582-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

This exposes the PIIX4_PM device to the caller to allow any qdev gpios to be
mapped outside of piix4_pm_init().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220528091934.15520-6-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/acpi/piix4.c               | 11 ++++-------
 hw/i386/pc_piix.c             | 10 +++++-----
 hw/isa/piix4.c                |  8 +++++---
 include/hw/southbridge/piix.h |  7 ++++---
 4 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index c2177c5093..c4cfb75020 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -497,9 +497,9 @@ static void piix4_pm_realize(PCIDevice *dev, Error **errp)
     piix4_pm_add_properties(s);
 }
 
-I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
-                      qemu_irq sci_irq, qemu_irq smi_irq,
-                      bool smm_enabled, DeviceState **piix4_pm)
+PIIX4PMState *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
+                            qemu_irq sci_irq, qemu_irq smi_irq,
+                            bool smm_enabled)
 {
     PCIDevice *pci_dev;
     DeviceState *dev;
@@ -509,9 +509,6 @@ I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
     dev = DEVICE(pci_dev);
     qdev_prop_set_uint32(dev, "smb_io_base", smb_io_base);
     qdev_prop_set_bit(dev, "smm-enabled", smm_enabled);
-    if (piix4_pm) {
-        *piix4_pm = dev;
-    }
 
     s = PIIX4_PM(dev);
     s->irq = sci_irq;
@@ -519,7 +516,7 @@ I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
 
     pci_realize_and_unref(pci_dev, bus, &error_fatal);
 
-    return s->smb.smbus;
+    return s;
 }
 
 static uint64_t gpe_readb(void *opaque, hwaddr addr, unsigned width)
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 578e537b35..891692616b 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -281,14 +281,14 @@ static void pc_init1(MachineState *machine,
     }
 
     if (pcmc->pci_enabled && x86_machine_is_acpi_enabled(X86_MACHINE(pcms))) {
-        DeviceState *piix4_pm;
+        PIIX4PMState *piix4_pm;
 
         smi_irq = qemu_allocate_irq(pc_acpi_smi_interrupt, first_cpu, 0);
+        piix4_pm = piix4_pm_init(pci_bus, piix3_devfn + 3, 0xb100,
+                                 x86ms->gsi[9], smi_irq,
+                                 x86_machine_is_smm_enabled(x86ms));
+        pcms->smbus = I2C_BUS(qdev_get_child_bus(DEVICE(piix4_pm), "i2c"));
         /* TODO: Populate SPD eeprom data.  */
-        pcms->smbus = piix4_pm_init(pci_bus, piix3_devfn + 3, 0xb100,
-                                    x86ms->gsi[9], smi_irq,
-                                    x86_machine_is_smm_enabled(x86ms),
-                                    &piix4_pm);
         smbus_eeprom_init(pcms->smbus, 8, NULL, 0);
 
         object_property_add_link(OBJECT(machine), PC_MACHINE_ACPI_DEVICE_PROP,
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 8607e0ac36..7d9bedd1bb 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -293,6 +293,7 @@ static int pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
 DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
 {
     PIIX4State *s;
+    PIIX4PMState *pms;
     PCIDevice *pci;
     DeviceState *dev;
     int devfn = PCI_DEVFN(10, 0);
@@ -310,9 +311,10 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
 
     pci_create_simple(pci_bus, devfn + 2, "piix4-usb-uhci");
     if (smbus) {
-        *smbus = piix4_pm_init(pci_bus, devfn + 3, 0x1100,
-                               qdev_get_gpio_in_named(dev, "isa", 9),
-                               NULL, 0, NULL);
+        pms = piix4_pm_init(pci_bus, devfn + 3, 0x1100,
+                            qdev_get_gpio_in_named(dev, "isa", 9),
+                            NULL, 0);
+        *smbus = I2C_BUS(qdev_get_child_bus(DEVICE(pms), "i2c"));
     }
 
     pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM_PIRQS);
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 04cbc3fe30..a362ec7484 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -14,10 +14,11 @@
 
 #include "hw/pci/pci.h"
 #include "qom/object.h"
+#include "hw/acpi/piix4.h"
 
-I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
-                      qemu_irq sci_irq, qemu_irq smi_irq,
-                      bool smm_enabled, DeviceState **piix4_pm);
+PIIX4PMState *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
+                            qemu_irq sci_irq, qemu_irq smi_irq,
+                            bool smm_enabled);
 
 /* PIRQRC[A:D]: PIRQx Route Control Registers */
 #define PIIX_PIRQCA 0x60
-- 
2.36.1


