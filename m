Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 542D43725C8
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:23:05 +0200 (CEST)
Received: from localhost ([::1]:41464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldoSW-0003Jc-CV
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo0U-000644-Gl; Tue, 04 May 2021 01:54:06 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:50977 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo0S-0004qm-FY; Tue, 04 May 2021 01:54:06 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ8CL1MTwz9shn; Tue,  4 May 2021 15:53:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620107598;
 bh=uFVn2kz8KBK8M3OG9zv+1RPO2YvwjFTQNPbOIkUl470=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Nhsy31H6i3u5nK8MsrwAbFJg0JIaqwgJpP3R3Dm3DcwIpEn8x87KhJ9UZfRhh0VmY
 1OcMXtjdk1J4O5+zHNU4CSZyh4PbmC+uhDkxv5ieGARjKMM1TP7iwCiwx15yer7e01
 OiwVCulhgETTzT1wHlqdeceHC2bPU/zCbOfoZACw=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 23/46] vt82c686: Add emulation of VT8231 south bridge
Date: Tue,  4 May 2021 15:52:49 +1000
Message-Id: <20210504055312.306823-24-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504055312.306823-1-david@gibson.dropbear.id.au>
References: <20210504055312.306823-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Add emulation of VT8231 south bridge ISA part based on the similar
VT82C686B but implemented in a separate subclass that holds the
differences while reusing parts that can be shared.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <10abc9f89854e7c980b9731c33d25a2e307e9c4f.1616680239.git.balaton@eik.bme.hu>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/isa/vt82c686.c         | 84 +++++++++++++++++++++++++++++++++++++++
 include/hw/isa/vt82c686.h |  1 +
 include/hw/pci/pci_ids.h  |  1 +
 3 files changed, 86 insertions(+)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index b09bfe3fa2..7b2e90c7e1 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -8,6 +8,9 @@
  *
  * Contributions after 2012-01-13 are licensed under the terms of the
  * GNU GPL, version 2 or (at your option) any later version.
+ *
+ * VT8231 south bridge support and general clean up to allow it
+ * Copyright (c) 2018-2020 BALATON Zoltan
  */
 
 #include "qemu/osdep.h"
@@ -656,6 +659,86 @@ static const TypeInfo vt82c686b_isa_info = {
     .class_init    = vt82c686b_class_init,
 };
 
+/* TYPE_VT8231_ISA */
+
+static void vt8231_write_config(PCIDevice *d, uint32_t addr,
+                                uint32_t val, int len)
+{
+    ViaISAState *s = VIA_ISA(d);
+
+    trace_via_isa_write(addr, val, len);
+    pci_default_write_config(d, addr, val, len);
+    if (addr == 0x50) {
+        /* BIT(2): enable or disable superio config io ports */
+        via_superio_io_enable(s->via_sio, val & BIT(2));
+    }
+}
+
+static void vt8231_isa_reset(DeviceState *dev)
+{
+    ViaISAState *s = VIA_ISA(dev);
+    uint8_t *pci_conf = s->dev.config;
+
+    pci_set_long(pci_conf + PCI_CAPABILITY_LIST, 0x000000c0);
+    pci_set_word(pci_conf + PCI_COMMAND, PCI_COMMAND_IO | PCI_COMMAND_MEMORY |
+                 PCI_COMMAND_MASTER | PCI_COMMAND_SPECIAL);
+    pci_set_word(pci_conf + PCI_STATUS, PCI_STATUS_DEVSEL_MEDIUM);
+
+    pci_conf[0x58] = 0x40; /* Miscellaneous Control 0 */
+    pci_conf[0x67] = 0x08; /* Fast IR Config */
+    pci_conf[0x6b] = 0x01; /* Fast IR I/O Base */
+}
+
+static void vt8231_realize(PCIDevice *d, Error **errp)
+{
+    ViaISAState *s = VIA_ISA(d);
+    DeviceState *dev = DEVICE(d);
+    ISABus *isa_bus;
+    qemu_irq *isa_irq;
+    int i;
+
+    qdev_init_gpio_out(dev, &s->cpu_intr, 1);
+    isa_irq = qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
+    isa_bus = isa_bus_new(dev, get_system_memory(), pci_address_space_io(d),
+                          &error_fatal);
+    isa_bus_irqs(isa_bus, i8259_init(isa_bus, *isa_irq));
+    i8254_pit_init(isa_bus, 0x40, 0, NULL);
+    i8257_dma_init(isa_bus, 0);
+    s->via_sio = VIA_SUPERIO(isa_create_simple(isa_bus, TYPE_VT8231_SUPERIO));
+    mc146818_rtc_init(isa_bus, 2000, NULL);
+
+    for (i = 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
+        if (i < PCI_COMMAND || i >= PCI_REVISION_ID) {
+            d->wmask[i] = 0;
+        }
+    }
+}
+
+static void vt8231_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+
+    k->realize = vt8231_realize;
+    k->config_write = vt8231_write_config;
+    k->vendor_id = PCI_VENDOR_ID_VIA;
+    k->device_id = PCI_DEVICE_ID_VIA_8231_ISA;
+    k->class_id = PCI_CLASS_BRIDGE_ISA;
+    k->revision = 0x10;
+    dc->reset = vt8231_isa_reset;
+    dc->desc = "ISA bridge";
+    dc->vmsd = &vmstate_via;
+    /* Reason: part of VIA VT8231 southbridge, needs to be wired up */
+    dc->user_creatable = false;
+}
+
+static const TypeInfo vt8231_isa_info = {
+    .name          = TYPE_VT8231_ISA,
+    .parent        = TYPE_VIA_ISA,
+    .instance_size = sizeof(ViaISAState),
+    .class_init    = vt8231_class_init,
+};
+
 
 static void vt82c686b_register_types(void)
 {
@@ -667,6 +750,7 @@ static void vt82c686b_register_types(void)
     type_register_static(&vt8231_superio_info);
     type_register_static(&via_isa_info);
     type_register_static(&vt82c686b_isa_info);
+    type_register_static(&vt8231_isa_info);
 }
 
 type_init(vt82c686b_register_types)
diff --git a/include/hw/isa/vt82c686.h b/include/hw/isa/vt82c686.h
index 0692b9a527..0f01aaa471 100644
--- a/include/hw/isa/vt82c686.h
+++ b/include/hw/isa/vt82c686.h
@@ -3,6 +3,7 @@
 
 #define TYPE_VT82C686B_ISA "vt82c686b-isa"
 #define TYPE_VT82C686B_PM "vt82c686b-pm"
+#define TYPE_VT8231_ISA "vt8231-isa"
 #define TYPE_VT8231_PM "vt8231-pm"
 #define TYPE_VIA_AC97 "via-ac97"
 #define TYPE_VIA_MC97 "via-mc97"
diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
index aa3f67eaa4..ac0c23ebc7 100644
--- a/include/hw/pci/pci_ids.h
+++ b/include/hw/pci/pci_ids.h
@@ -210,6 +210,7 @@
 #define PCI_DEVICE_ID_VIA_82C686B_PM     0x3057
 #define PCI_DEVICE_ID_VIA_AC97           0x3058
 #define PCI_DEVICE_ID_VIA_MC97           0x3068
+#define PCI_DEVICE_ID_VIA_8231_ISA       0x8231
 #define PCI_DEVICE_ID_VIA_8231_PM        0x8235
 
 #define PCI_VENDOR_ID_MARVELL            0x11ab
-- 
2.31.1


