Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8F2536BED
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 11:29:13 +0200 (CEST)
Received: from localhost ([::1]:34762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nusky-0005Jz-VI
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 05:29:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nuscX-00063X-Ao
 for qemu-devel@nongnu.org; Sat, 28 May 2022 05:20:31 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nuscU-000406-BT
 for qemu-devel@nongnu.org; Sat, 28 May 2022 05:20:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=04Y8d82yWgkSp/ObC+AghMPL0rY6M6+OKt2A64PLjuA=; b=fcVk3LDQpD0FhoYbD5iQMY052b
 AZKIjtvWMdmV3KVYP09+8UiPsYE6zr+Ns+eJWRRkpw3/JaFyrWFCh4iv4Wkzn/zQcUMflVnDjMseN
 hqJLtTF4CtqQcT9kapC2Z7e6vmESgs9qTOR1a7zLfEhUNjMNhx/cvtmdxhrlaEffsMdntpmaPLnA7
 lKtxuPgZYZeYeESEoUws3a3VW14AF2h1Mzvi64oIDSqr2LPR8/zg4W7lqIikBi6B+B43WULpqzy66
 qOusVZdNLfSYnMytbwMgA5fTTCClGR2D5qUReiOnSevN1PdrEj+sMYxcA9o8FvmVoiERmzaQ7ZW5o
 zPmHa4dJBFbuifpRZ8mhxvG0Ifkk+akhiLQbOZ26F+RDi76aJ0r6CAVQVCO0Fg2SLGcKxKqnQFfYa
 JnheWHFeQyq5I0pYG0rtPfWEp7dPZq6XNdQOJ76A0iRbaOmK16kCtvQ6UfnI1KIv/G0osQ08PNtQB
 qdjCBZKz/Bb7jRAqTnsfJ7QgmdB087bKmHV5z4gogu+feU4ssZW/lD7uBjGjPIWysXUJBcgT6/yE0
 Nmtz+/LvQA8GTJsu8v/36OJFop3LvNSwhZZyRMHGOa4t9EtZD4jOcjcGv5cowu2XDAnaR7Si5av5Q
 +iQEufM48plyp5G6PG9CnesrT92c3qTZ2bm3WSwmQ=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nusbD-0003JL-JV; Sat, 28 May 2022 10:19:11 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: shentey@gmail.com, mst@redhat.com, marcel.apfelbaum@gmail.com,
 imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, hpoussin@reactos.org, qemu-devel@nongnu.org
Date: Sat, 28 May 2022 10:19:30 +0100
Message-Id: <20220528091934.15520-9-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220528091934.15520-1-mark.cave-ayland@ilande.co.uk>
References: <20220528091934.15520-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 08/12] hw/acpi/piix4: use qdev gpio to wire up sci_irq
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

The sci_irq can now be wired up directly using a qdev gpio instead of having to
set the IRQ externally in piix4_pm_initfn().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/acpi/piix4.c               | 4 +---
 hw/i386/pc_piix.c             | 4 ++--
 hw/isa/piix4.c                | 6 +++---
 include/hw/southbridge/piix.h | 3 +--
 4 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 454fa34df1..141852b7d4 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -506,8 +506,7 @@ static void piix4_pm_init(Object *obj)
 }
 
 PIIX4PMState *piix4_pm_initfn(PCIBus *bus, int devfn, uint32_t smb_io_base,
-                              qemu_irq sci_irq, qemu_irq smi_irq,
-                              int smm_enabled)
+                              qemu_irq smi_irq, int smm_enabled)
 {
     PCIDevice *pci_dev;
     DeviceState *dev;
@@ -519,7 +518,6 @@ PIIX4PMState *piix4_pm_initfn(PCIBus *bus, int devfn, uint32_t smb_io_base,
     qdev_prop_set_bit(dev, "smm-enabled", smm_enabled);
 
     s = PIIX4_PM(dev);
-    s->irq = sci_irq;
     s->smi_irq = smi_irq;
 
     pci_realize_and_unref(pci_dev, bus, &error_fatal);
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index ae21946981..21e6159166 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -285,9 +285,9 @@ static void pc_init1(MachineState *machine,
 
         smi_irq = qemu_allocate_irq(pc_acpi_smi_interrupt, first_cpu, 0);
         /* TODO: Populate SPD eeprom data.  */
-        piix4_pm = piix4_pm_initfn(pci_bus, piix3_devfn + 3, 0xb100,
-                                   x86ms->gsi[9], smi_irq,
+        piix4_pm = piix4_pm_initfn(pci_bus, piix3_devfn + 3, 0xb100, smi_irq,
                                    x86_machine_is_smm_enabled(x86ms));
+        qdev_connect_gpio_out(DEVICE(piix4_pm), 0, x86ms->gsi[9]);
         pcms->smbus = I2C_BUS(qdev_get_child_bus(DEVICE(piix4_pm), "i2c"));
         smbus_eeprom_init(pcms->smbus, 8, NULL, 0);
 
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 33a7015ea3..0b6ea22143 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -311,9 +311,9 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
 
     pci_create_simple(pci_bus, devfn + 2, "piix4-usb-uhci");
     if (smbus) {
-        pms = piix4_pm_initfn(pci_bus, devfn + 3, 0x1100,
-                              qdev_get_gpio_in_named(dev, "isa", 9),
-                              NULL, 0);
+        pms = piix4_pm_initfn(pci_bus, devfn + 3, 0x1100, NULL, 0);
+        qdev_connect_gpio_out(DEVICE(pms), 0,
+                              qdev_get_gpio_in_named(dev, "isa", 9));
         *smbus = I2C_BUS(qdev_get_child_bus(DEVICE(pms), "i2c"));
     }
 
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 479d88e242..aefdaebc3f 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -17,8 +17,7 @@
 #include "hw/acpi/piix4.h"
 
 PIIX4PMState *piix4_pm_initfn(PCIBus *bus, int devfn, uint32_t smb_io_base,
-                              qemu_irq sci_irq, qemu_irq smi_irq,
-                              int smm_enabled);
+                              qemu_irq smi_irq, int smm_enabled);
 
 /* PIRQRC[A:D]: PIRQx Route Control Registers */
 #define PIIX_PIRQCA 0x60
-- 
2.20.1


