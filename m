Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD27536C04
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 11:38:50 +0200 (CEST)
Received: from localhost ([::1]:43868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nusuH-0003Wq-J9
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 05:38:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nuscX-00063e-BO
 for qemu-devel@nongnu.org; Sat, 28 May 2022 05:20:32 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nuscU-000409-Bj
 for qemu-devel@nongnu.org; Sat, 28 May 2022 05:20:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TGPKGL/b8AjkYtrsAPewjw4j3UciNisjbuTwvEHpaSY=; b=vR9OByJAuTRvuyFX153Wi/tU59
 d9TsGSaEsn5XoRoGwG2ZV1UK4SFA6tOfChD09F6Zy89Bl0+JQk6Eek/kfhcrdJd18qUBZ2PapqaiR
 Okdrkczu3S1nRIB0I6tWWhWeGLIydAwZzGE8ydif6UuHsDtLHmPEw/veCk3I/t0pRpmnXHBZfZbdS
 dHK4i24I0YtZFf7p4vWVSDNuvFuNt/KlN8x8HhvMoJ7mSIM1T/vUtdSYvNbP8GWdvu2dVYr4uNjDk
 ayQuXzp6i4jd6ijXBm9KPUtH8F7pyMEWqs1dzWt68sLjoLEbrViQwieNiPLpFQ+Skn+XiipHs6Ves
 ZQU3FG/qignIdb3dTuH/ul5oJcN6fOQhEF4DYw05GwBBFAlmSy+ssU/tofWNLVtBRWOZuyt+HeOGr
 Vy3N8YsoHDcz3zv3DEXhcHPmpyQ2t9JCzsaA56BQNc01EBFmgzIKHKqeCdO/PXNGCqEYRjBLqqs+E
 k/czrvgml7BF+jqbEsCRByx6Vw68z8A5lQn4tUo5ssWYuNJqAYf9z1AqZERczLtLStBgssRgwmfW+
 ljvEMU30DfVdEJZUa68p7dkogXmLRIudFSjheO95bkfV8jKx3OrlAmgAugbnvtCaygDsF4zV/PECU
 E43ygrs6Wzg2uHGx0w9yEN7Er78KdmyhKB5eGK4ko=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nusbI-0003JL-1w; Sat, 28 May 2022 10:19:12 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: shentey@gmail.com, mst@redhat.com, marcel.apfelbaum@gmail.com,
 imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, hpoussin@reactos.org, qemu-devel@nongnu.org
Date: Sat, 28 May 2022 10:19:31 +0100
Message-Id: <20220528091934.15520-10-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220528091934.15520-1-mark.cave-ayland@ilande.co.uk>
References: <20220528091934.15520-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 09/12] hw/acpi/piix4: use qdev gpio to wire up smi_irq
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

The smi_irq can now be wired up directly using a qdev gpio instead of having to
set the IRQ externally in piix4_pm_initfn().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/acpi/piix4.c               | 3 +--
 hw/i386/pc_piix.c             | 3 ++-
 hw/isa/piix4.c                | 2 +-
 include/hw/southbridge/piix.h | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 141852b7d4..fd20e1eccc 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -506,7 +506,7 @@ static void piix4_pm_init(Object *obj)
 }
 
 PIIX4PMState *piix4_pm_initfn(PCIBus *bus, int devfn, uint32_t smb_io_base,
-                              qemu_irq smi_irq, int smm_enabled)
+                              int smm_enabled)
 {
     PCIDevice *pci_dev;
     DeviceState *dev;
@@ -518,7 +518,6 @@ PIIX4PMState *piix4_pm_initfn(PCIBus *bus, int devfn, uint32_t smb_io_base,
     qdev_prop_set_bit(dev, "smm-enabled", smm_enabled);
 
     s = PIIX4_PM(dev);
-    s->smi_irq = smi_irq;
 
     pci_realize_and_unref(pci_dev, bus, &error_fatal);
 
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 21e6159166..82696fc707 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -285,9 +285,10 @@ static void pc_init1(MachineState *machine,
 
         smi_irq = qemu_allocate_irq(pc_acpi_smi_interrupt, first_cpu, 0);
         /* TODO: Populate SPD eeprom data.  */
-        piix4_pm = piix4_pm_initfn(pci_bus, piix3_devfn + 3, 0xb100, smi_irq,
+        piix4_pm = piix4_pm_initfn(pci_bus, piix3_devfn + 3, 0xb100,
                                    x86_machine_is_smm_enabled(x86ms));
         qdev_connect_gpio_out(DEVICE(piix4_pm), 0, x86ms->gsi[9]);
+        qdev_connect_gpio_out_named(DEVICE(piix4_pm), "smi-irq", 0, smi_irq);
         pcms->smbus = I2C_BUS(qdev_get_child_bus(DEVICE(piix4_pm), "i2c"));
         smbus_eeprom_init(pcms->smbus, 8, NULL, 0);
 
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 0b6ea22143..775e15eb20 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -311,7 +311,7 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
 
     pci_create_simple(pci_bus, devfn + 2, "piix4-usb-uhci");
     if (smbus) {
-        pms = piix4_pm_initfn(pci_bus, devfn + 3, 0x1100, NULL, 0);
+        pms = piix4_pm_initfn(pci_bus, devfn + 3, 0x1100, 0);
         qdev_connect_gpio_out(DEVICE(pms), 0,
                               qdev_get_gpio_in_named(dev, "isa", 9));
         *smbus = I2C_BUS(qdev_get_child_bus(DEVICE(pms), "i2c"));
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index aefdaebc3f..d284475f07 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -17,7 +17,7 @@
 #include "hw/acpi/piix4.h"
 
 PIIX4PMState *piix4_pm_initfn(PCIBus *bus, int devfn, uint32_t smb_io_base,
-                              qemu_irq smi_irq, int smm_enabled);
+                              int smm_enabled);
 
 /* PIRQRC[A:D]: PIRQx Route Control Registers */
 #define PIIX_PIRQCA 0x60
-- 
2.20.1


