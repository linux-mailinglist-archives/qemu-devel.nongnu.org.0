Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1B2536BEF
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 11:31:31 +0200 (CEST)
Received: from localhost ([::1]:36380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nusnC-0006RD-52
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 05:31:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nuscJ-00060A-Ne
 for qemu-devel@nongnu.org; Sat, 28 May 2022 05:20:30 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nuscI-0003zf-6S
 for qemu-devel@nongnu.org; Sat, 28 May 2022 05:20:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FlxBSYYbgWGvB0Al0RAGg0hWxo/c5OHp8+vrO46sS20=; b=ujVflFeZtAVp1Rg0Ra7nUG3VFc
 mA/ffouJQKKfLb8UqQc6jNws6CpmHE9I/OOCJ6HhdjFJMc7ooU5GEb2YUJdewf4rLaSb8MJmeyvtf
 +9zcfI6BHI85sCO0dl2FXxLGM8Del+ALvLPqwVVAsBWyEIL+X01PP5O9FFi2Fzork0oYiRuTZtLsK
 gOJonfmiAmkAocMa2cnLuixuGhab4PjWdDlbCB0ySFSNjQwNYKPRd2NieRXO6S+kwfqIhNcRgz62T
 L2OP6FNDcVuBZv/48pGLMJiIyRqpqbO7B7slEs+2dqB13PkS+qzUbG0lLGWy2ttuzAjIrl2eESiyV
 25EZ4fCl+ncFtkwWDyrAZGDS9XCkFOeJOD4edxecl+ckJ9IwT4ERglqVCZhNFmcXvXp3JFkn8V3ST
 LWgMBfuBkbXABe2zSBwReRds5136cg1YvY3lRaVoj1wpiOPBqLVCAZGzd5TEZOU15upgq9wMN8u9Q
 6JMTtMCfNVrZd3Pbx2teNNuknhOZdOI0N/SlTUZHlDdSyrc4uMpFAazNKcX1ncWYOd/n9RXgMr0+m
 osFbHmEJoZX0t32iBsFFJZUb96ToiTqYW/ztjWtYm1E0Ufp/ATvg0rUeZ00u0565YOFODmr6jVUjX
 y8QyD0N8f57uEaJP55rYJXtIDhRfWc6XAmeE/htZY=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nusb3-0003JL-Uk; Sat, 28 May 2022 10:19:02 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: shentey@gmail.com, mst@redhat.com, marcel.apfelbaum@gmail.com,
 imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, hpoussin@reactos.org, qemu-devel@nongnu.org
Date: Sat, 28 May 2022 10:19:27 +0100
Message-Id: <20220528091934.15520-6-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220528091934.15520-1-mark.cave-ayland@ilande.co.uk>
References: <20220528091934.15520-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 05/12] hw/acpi/piix4: alter piix4_pm_init() to return
 PIIX4PMState
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This exposes the PIIX4_PM device to the caller to allow any qdev gpios to be
mapped outside of piix4_pm_init().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/acpi/piix4.c               | 11 ++++-------
 hw/i386/pc_piix.c             | 10 +++++-----
 hw/isa/piix4.c                |  8 +++++---
 include/hw/southbridge/piix.h |  7 ++++---
 4 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 7ee65b1bff..05c129b6af 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -497,9 +497,9 @@ static void piix4_pm_realize(PCIDevice *dev, Error **errp)
     piix4_pm_add_properties(s);
 }
 
-I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
-                      qemu_irq sci_irq, qemu_irq smi_irq,
-                      int smm_enabled, DeviceState **piix4_pm)
+PIIX4PMState *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
+                            qemu_irq sci_irq, qemu_irq smi_irq,
+                            int smm_enabled)
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
index 578e537b35..0300be5ef4 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -281,14 +281,14 @@ static void pc_init1(MachineState *machine,
     }
 
     if (pcmc->pci_enabled && x86_machine_is_acpi_enabled(X86_MACHINE(pcms))) {
-        DeviceState *piix4_pm;
+        PIIX4PMState *piix4_pm;
 
         smi_irq = qemu_allocate_irq(pc_acpi_smi_interrupt, first_cpu, 0);
         /* TODO: Populate SPD eeprom data.  */
-        pcms->smbus = piix4_pm_init(pci_bus, piix3_devfn + 3, 0xb100,
-                                    x86ms->gsi[9], smi_irq,
-                                    x86_machine_is_smm_enabled(x86ms),
-                                    &piix4_pm);
+        piix4_pm = piix4_pm_init(pci_bus, piix3_devfn + 3, 0xb100,
+                                 x86ms->gsi[9], smi_irq,
+                                 x86_machine_is_smm_enabled(x86ms));
+        pcms->smbus = I2C_BUS(qdev_get_child_bus(DEVICE(piix4_pm), "i2c"));
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
index c5b842b45d..108800ab06 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -14,10 +14,11 @@
 
 #include "hw/pci/pci.h"
 #include "qom/object.h"
+#include "hw/acpi/piix4.h"
 
-I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
-                      qemu_irq sci_irq, qemu_irq smi_irq,
-                      int smm_enabled, DeviceState **piix4_pm);
+PIIX4PMState *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
+                            qemu_irq sci_irq, qemu_irq smi_irq,
+                            int smm_enabled);
 
 /* PIRQRC[A:D]: PIRQx Route Control Registers */
 #define PIIX_PIRQCA 0x60
-- 
2.20.1


