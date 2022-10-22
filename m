Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA2A609A76
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 08:22:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omhiZ-0002Gx-L0
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 16:37:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5u-0007Pp-Fy; Sat, 22 Oct 2022 11:07:26 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5r-0002Nu-OF; Sat, 22 Oct 2022 11:07:26 -0400
Received: by mail-ed1-x533.google.com with SMTP id w8so13818698edc.1;
 Sat, 22 Oct 2022 08:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b85qsEMV/N3kNPdCtsSKNM47zqNqdh3ucQkb83uNYaw=;
 b=V9UtmQ3wMBqO1za1BT385VwOU2YYbITwXBuzeNrFDZPZUEwfS2pnOLNLH0Nw8701NF
 iPn84Px6orAViYSEppz3PZ0Ba8GqIZ3Rwpy55p+o6dU6rH5qEh0oC6qAidCH8IlcAMMk
 1lCqeENgk2tUkonmqPeIo19NsbyLFfd66BSax6gC1U34pFAbujgAUwDfHLbeczi7wY0w
 +RD8CAi3Y7hJOsCr5shoFivkpPxJG6bGTMm3gjM77KSGXpZRnIJTjFspUP/bwB5WBS6k
 UPvSEqBtFYBnlvYsYLeyttIFYnTkRy5DFzy2dtRQcxeQ7szK3cZNiek6Mayr30lfBcX5
 Af9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b85qsEMV/N3kNPdCtsSKNM47zqNqdh3ucQkb83uNYaw=;
 b=2Js/B3jvu+s1ELrkq21/zdraq3vhqc/UrB0q3n/ZY+bBnrt24MzIiA3qUO+vRrGAaW
 1t8QdWg1PisqatgAehr5xHnOI0TR6FUUJPXp1L45+arbVvWKMcRXUNQ1YNzJ/VMhtqS0
 31eqpAA6NITDVVmlCf8erRX3bXEy2UMDWNub6udkJ4jzQ48U7mXcDvX11du0ssK1u/Mz
 D21fhtCMo8LdPjzj1lWIpaU2ckQUvANC+Ru+s5VmuA+DkxBNf9Tqy5QBzknNV0mJVmoW
 34Ia6O/imZotxib3pUNn2DLKbDKr0gKx+jw0MQNZm5pTo1PUhtHmqxFvHImRzXswE4md
 xdug==
X-Gm-Message-State: ACrzQf0ZvK6aQryXVko9jZjqIzJj5zr90YAJbduV4IThAjppQFq4F9yJ
 6oPnF4rAUYH1IZl3gD0Fcy9lmL1r4GEjuw==
X-Google-Smtp-Source: AMsMyM6P65HbTz6l/KSUoOs9S809rQWzNpA7LKa6riwItoEvxFySy91XJEuemSQy57bZgDBIYHGr0Q==
X-Received: by 2002:a17:907:3f90:b0:78d:afad:2a78 with SMTP id
 hr16-20020a1709073f9000b0078dafad2a78mr20738461ejc.68.1666451241542; 
 Sat, 22 Oct 2022 08:07:21 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-171-138.77.191.pool.telefonica.de. [77.191.171.138])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00780ab5a9116sm13021558ejx.211.2022.10.22.08.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:07:20 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 36/43] hw/isa/piix3: Merge hw/isa/piix4.c
Date: Sat, 22 Oct 2022 17:05:01 +0200
Message-Id: <20221022150508.26830-37-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221022150508.26830-1-shentey@gmail.com>
References: <20221022150508.26830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x533.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that the PIIX3 and PIIX4 device models are sufficiently consolidated

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 MAINTAINERS                             |   6 +-
 configs/devices/mips-softmmu/common.mak |   2 +-
 hw/i386/Kconfig                         |   2 +-
 hw/isa/Kconfig                          |  12 +-
 hw/isa/meson.build                      |   3 +-
 hw/isa/{piix3.c => piix.c}              | 185 ++++++++++++++
 hw/isa/piix4.c                          | 315 ------------------------
 7 files changed, 192 insertions(+), 333 deletions(-)
 rename hw/isa/{piix3.c => piix.c} (73%)
 delete mode 100644 hw/isa/piix4.c

diff --git a/MAINTAINERS b/MAINTAINERS
index e3d5b7e09c..f08f095222 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1228,7 +1228,7 @@ Malta
 M: Philippe Mathieu-Daudé <philmd@linaro.org>
 R: Aurelien Jarno <aurelien@aurel32.net>
 S: Odd Fixes
-F: hw/isa/piix4.c
+F: hw/isa/piix.c
 F: hw/acpi/piix4.c
 F: hw/mips/malta.c
 F: hw/mips/gt64xxx_pci.c
@@ -1643,7 +1643,7 @@ F: hw/pci-host/pam.c
 F: include/hw/pci-host/i440fx.h
 F: include/hw/pci-host/q35.h
 F: include/hw/pci-host/pam.h
-F: hw/isa/piix3.c
+F: hw/isa/piix.c
 F: hw/isa/lpc_ich9.c
 F: hw/i2c/smbus_ich9.c
 F: hw/acpi/piix4.c
@@ -2314,7 +2314,7 @@ PIIX4 South Bridge (i82371AB)
 M: Hervé Poussineau <hpoussin@reactos.org>
 M: Philippe Mathieu-Daudé <philmd@linaro.org>
 S: Maintained
-F: hw/isa/piix4.c
+F: hw/isa/piix.c
 F: include/hw/southbridge/piix.h
 
 Firmware configuration (fw_cfg)
diff --git a/configs/devices/mips-softmmu/common.mak b/configs/devices/mips-softmmu/common.mak
index 416161f833..ef3b7390a6 100644
--- a/configs/devices/mips-softmmu/common.mak
+++ b/configs/devices/mips-softmmu/common.mak
@@ -21,7 +21,7 @@ CONFIG_ACPI=y
 CONFIG_ACPI_PIIX4=y
 CONFIG_APM=y
 CONFIG_I8257=y
-CONFIG_PIIX4=y
+CONFIG_PIIX=y
 CONFIG_IDE_ISA=y
 CONFIG_PFLASH_CFI01=y
 CONFIG_I8259=y
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index dd247f215c..295693b32b 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -73,7 +73,7 @@ config I440FX
     select PC_ACPI
     select ACPI_SMBUS
     select PCI_I440FX
-    select PIIX3
+    select PIIX
     select DIMM
     select SMBIOS
     select FW_CFG_DMA
diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index 1aa10f84f2..000c2312ab 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -31,17 +31,7 @@ config PC87312
     select FDC_ISA
     select IDE_ISA
 
-config PIIX3
-    bool
-    select ACPI_PIIX4
-    select I8257
-    select I8259
-    select IDE_PIIX
-    select ISA_BUS
-    select MC146818RTC
-    select USB_UHCI
-
-config PIIX4
+config PIIX
     bool
     # For historical reasons, SuperIO devices are created in the board
     # for PIIX4.
diff --git a/hw/isa/meson.build b/hw/isa/meson.build
index 8bf678ca0a..314bbd0860 100644
--- a/hw/isa/meson.build
+++ b/hw/isa/meson.build
@@ -3,8 +3,7 @@ softmmu_ss.add(when: 'CONFIG_I82378', if_true: files('i82378.c'))
 softmmu_ss.add(when: 'CONFIG_ISA_BUS', if_true: files('isa-bus.c'))
 softmmu_ss.add(when: 'CONFIG_ISA_SUPERIO', if_true: files('isa-superio.c'))
 softmmu_ss.add(when: 'CONFIG_PC87312', if_true: files('pc87312.c'))
-softmmu_ss.add(when: 'CONFIG_PIIX3', if_true: files('piix3.c'))
-softmmu_ss.add(when: 'CONFIG_PIIX4', if_true: files('piix4.c'))
+softmmu_ss.add(when: 'CONFIG_PIIX', if_true: files('piix.c'))
 softmmu_ss.add(when: 'CONFIG_SMC37C669', if_true: files('smc37c669-superio.c'))
 softmmu_ss.add(when: 'CONFIG_VT82C686', if_true: files('vt82c686.c'))
 
diff --git a/hw/isa/piix3.c b/hw/isa/piix.c
similarity index 73%
rename from hw/isa/piix3.c
rename to hw/isa/piix.c
index b02a91c8eb..5123474fab 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix.c
@@ -2,6 +2,7 @@
  * QEMU PIIX PCI ISA Bridge Emulation
  *
  * Copyright (c) 2006 Fabrice Bellard
+ * Copyright (c) 2018 Hervé Poussineau
  *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
  * of this software and associated documentation files (the "Software"), to deal
@@ -26,7 +27,9 @@
 #include "qemu/range.h"
 #include "qapi/error.h"
 #include "hw/dma/i8257.h"
+#include "hw/intc/i8259.h"
 #include "hw/southbridge/piix.h"
+#include "hw/timer/i8254.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "hw/ide/piix.h"
@@ -81,6 +84,27 @@ static void piix3_set_irq(void *opaque, int pirq, int level)
     piix3_set_irq_level(piix3, pirq, level);
 }
 
+static void piix4_set_irq(void *opaque, int irq_num, int level)
+{
+    int i, pic_irq, pic_level;
+    PIIXState *s = opaque;
+    PCIBus *bus = pci_get_bus(&s->dev);
+
+    /* now we change the pic irq level according to the piix irq mappings */
+    /* XXX: optimize */
+    pic_irq = s->dev.config[PIIX_PIRQCA + irq_num];
+    if (pic_irq < ISA_NUM_IRQS) {
+        /* The pic level is the logical OR of all the PCI irqs mapped to it. */
+        pic_level = 0;
+        for (i = 0; i < PIIX_NUM_PIRQS; i++) {
+            if (pic_irq == s->dev.config[PIIX_PIRQCA + i]) {
+                pic_level |= pci_bus_get_irq_level(bus, i);
+            }
+        }
+        qemu_set_irq(s->pic.in_irqs[pic_irq], pic_level);
+    }
+}
+
 /*
  * Return the global irq number corresponding to a given device irq
  * pin. We could also use the bus number to have a more precise mapping.
@@ -92,6 +116,31 @@ static int piix3_pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
     return (pci_intx + slot_addend) & 3;
 }
 
+static int piix4_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
+{
+    int slot;
+
+    slot = PCI_SLOT(pci_dev->devfn);
+
+    switch (slot) {
+    /* PIIX4 USB */
+    case 10:
+        return 3;
+    /* AMD 79C973 Ethernet */
+    case 11:
+        return 1;
+    /* Crystal 4281 Sound */
+    case 12:
+        return 2;
+    /* PCI slot 1 to 4 */
+    case 18 ... 21:
+        return ((slot - 18) + irq_num) & 0x03;
+    /* Unknown device, don't do any translation */
+    default:
+        return irq_num;
+    }
+}
+
 static PCIINTxRoute piix3_route_intx_pin_to_irq(void *opaque, int pin)
 {
     PIIXState *piix3 = opaque;
@@ -219,6 +268,17 @@ static int piix3_post_load(void *opaque, int version_id)
     return 0;
 }
 
+static int piix4_post_load(void *opaque, int version_id)
+{
+    PIIXState *s = opaque;
+
+    if (version_id == 2) {
+        s->rcr = 0;
+    }
+
+    return 0;
+}
+
 static int piix3_pre_save(void *opaque)
 {
     int i;
@@ -268,6 +328,17 @@ static const VMStateDescription vmstate_piix3 = {
     }
 };
 
+static const VMStateDescription vmstate_piix4 = {
+    .name = "PIIX4",
+    .version_id = 3,
+    .minimum_version_id = 2,
+    .post_load = piix4_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_PCI_DEVICE(dev, PIIXState),
+        VMSTATE_UINT8_V(rcr, PIIXState, 3),
+        VMSTATE_END_OF_LIST()
+    }
+};
 
 static void rcr_write(void *opaque, hwaddr addr, uint64_t val, unsigned len)
 {
@@ -495,11 +566,125 @@ static const TypeInfo piix3_xen_info = {
     .class_init    = piix3_xen_class_init,
 };
 
+static void piix4_realize(PCIDevice *dev, Error **errp)
+{
+    PIIXState *s = PIIX_PCI_DEVICE(dev);
+    PCIBus *pci_bus = pci_get_bus(dev);
+    ISABus *isa_bus;
+
+    isa_bus = isa_bus_new(DEVICE(dev), pci_address_space(dev),
+                          pci_address_space_io(dev), errp);
+    if (!isa_bus) {
+        return;
+    }
+
+    memory_region_init_io(&s->rcr_mem, OBJECT(dev), &rcr_ops, s,
+                          "reset-control", 1);
+    memory_region_add_subregion_overlap(pci_address_space_io(dev),
+                                        PIIX_RCR_IOPORT, &s->rcr_mem, 1);
+
+    /* initialize i8259 pic */
+    if (!qdev_realize(DEVICE(&s->pic), BUS(isa_bus), errp)) {
+        return;
+    }
+
+    /* initialize ISA irqs */
+    isa_bus_irqs(isa_bus, s->pic.in_irqs);
+
+    /* initialize pit */
+    i8254_pit_init(isa_bus, 0x40, 0, NULL);
+
+    /* DMA */
+    i8257_dma_init(isa_bus, 0);
+
+    /* RTC */
+    qdev_prop_set_int32(DEVICE(&s->rtc), "base_year", 2000);
+    if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
+        return;
+    }
+    s->rtc.irq = qdev_get_gpio_in(DEVICE(&s->pic), s->rtc.isairq);
+
+    /* IDE */
+    qdev_prop_set_int32(DEVICE(&s->ide), "addr", dev->devfn + 1);
+    if (!qdev_realize(DEVICE(&s->ide), BUS(pci_bus), errp)) {
+        return;
+    }
+
+    /* USB */
+    if (s->has_usb) {
+        object_initialize_child(OBJECT(dev), "uhci", &s->uhci,
+                                TYPE_PIIX4_USB_UHCI);
+        qdev_prop_set_int32(DEVICE(&s->uhci), "addr", dev->devfn + 2);
+        if (!qdev_realize(DEVICE(&s->uhci), BUS(pci_bus), errp)) {
+            return;
+        }
+    }
+
+    /* ACPI controller */
+    if (s->has_acpi) {
+        object_initialize_child(OBJECT(s), "pm", &s->pm, TYPE_PIIX4_PM);
+        qdev_prop_set_int32(DEVICE(&s->pm), "addr", dev->devfn + 3);
+        qdev_prop_set_uint32(DEVICE(&s->pm), "smb_io_base", s->smb_io_base);
+        qdev_prop_set_bit(DEVICE(&s->pm), "smm-enabled", s->smm_enabled);
+        if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
+            return;
+        }
+        qdev_connect_gpio_out(DEVICE(&s->pm), 0,
+                              qdev_get_gpio_in(DEVICE(&s->pic), 9));
+    }
+
+    pci_bus_irqs(pci_bus, piix4_set_irq, piix4_pci_slot_get_pirq, s,
+                 PIIX_NUM_PIRQS);
+}
+
+static void piix4_init(Object *obj)
+{
+    PIIXState *s = PIIX_PCI_DEVICE(obj);
+
+    object_initialize_child(obj, "pic", &s->pic, TYPE_ISA_PIC);
+    object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
+    object_initialize_child(obj, "ide", &s->ide, TYPE_PIIX4_IDE);
+}
+
+static void piix4_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+
+    k->realize = piix4_realize;
+    k->vendor_id = PCI_VENDOR_ID_INTEL;
+    k->device_id = PCI_DEVICE_ID_INTEL_82371AB_0;
+    k->class_id = PCI_CLASS_BRIDGE_ISA;
+    dc->reset = piix_reset;
+    dc->desc = "ISA bridge";
+    dc->vmsd = &vmstate_piix4;
+    /*
+     * Reason: part of PIIX4 southbridge, needs to be wired up,
+     * e.g. by mips_malta_init()
+     */
+    dc->user_creatable = false;
+    dc->hotpluggable = false;
+    device_class_set_props(dc, pci_piix_props);
+}
+
+static const TypeInfo piix4_info = {
+    .name          = TYPE_PIIX4_PCI_DEVICE,
+    .parent        = TYPE_PCI_DEVICE,
+    .instance_size = sizeof(PIIXState),
+    .instance_init = piix4_init,
+    .class_init    = piix4_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+        { },
+    },
+};
+
 static void piix3_register_types(void)
 {
     type_register_static(&piix3_pci_type_info);
     type_register_static(&piix3_info);
     type_register_static(&piix3_xen_info);
+    type_register_static(&piix4_info);
 }
 
 type_init(piix3_register_types)
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
deleted file mode 100644
index dd189fa594..0000000000
--- a/hw/isa/piix4.c
+++ /dev/null
@@ -1,315 +0,0 @@
-/*
- * QEMU PIIX4 PCI Bridge Emulation
- *
- * Copyright (c) 2006 Fabrice Bellard
- * Copyright (c) 2018 Hervé Poussineau
- *
- * Permission is hereby granted, free of charge, to any person obtaining a copy
- * of this software and associated documentation files (the "Software"), to deal
- * in the Software without restriction, including without limitation the rights
- * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
- * copies of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
- * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
- * THE SOFTWARE.
- */
-
-#include "qemu/osdep.h"
-#include "qapi/error.h"
-#include "hw/irq.h"
-#include "hw/southbridge/piix.h"
-#include "hw/pci/pci.h"
-#include "hw/ide/piix.h"
-#include "hw/isa/isa.h"
-#include "hw/intc/i8259.h"
-#include "hw/dma/i8257.h"
-#include "hw/timer/i8254.h"
-#include "hw/rtc/mc146818rtc.h"
-#include "hw/ide/pci.h"
-#include "hw/acpi/piix4.h"
-#include "hw/usb/hcd-uhci.h"
-#include "migration/vmstate.h"
-#include "sysemu/reset.h"
-#include "sysemu/runstate.h"
-#include "qom/object.h"
-
-static void piix4_set_irq(void *opaque, int irq_num, int level)
-{
-    int i, pic_irq, pic_level;
-    PIIXState *s = opaque;
-    PCIBus *bus = pci_get_bus(&s->dev);
-
-    /* now we change the pic irq level according to the piix irq mappings */
-    /* XXX: optimize */
-    pic_irq = s->dev.config[PIIX_PIRQCA + irq_num];
-    if (pic_irq < ISA_NUM_IRQS) {
-        /* The pic level is the logical OR of all the PCI irqs mapped to it. */
-        pic_level = 0;
-        for (i = 0; i < PIIX_NUM_PIRQS; i++) {
-            if (pic_irq == s->dev.config[PIIX_PIRQCA + i]) {
-                pic_level |= pci_bus_get_irq_level(bus, i);
-            }
-        }
-        qemu_set_irq(s->pic.in_irqs[pic_irq], pic_level);
-    }
-}
-
-static int piix4_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
-{
-    int slot;
-
-    slot = PCI_SLOT(pci_dev->devfn);
-
-    switch (slot) {
-    /* PIIX4 USB */
-    case 10:
-        return 3;
-    /* AMD 79C973 Ethernet */
-    case 11:
-        return 1;
-    /* Crystal 4281 Sound */
-    case 12:
-        return 2;
-    /* PCI slot 1 to 4 */
-    case 18 ... 21:
-        return ((slot - 18) + irq_num) & 0x03;
-    /* Unknown device, don't do any translation */
-    default:
-        return irq_num;
-    }
-}
-
-static void piix4_isa_reset(DeviceState *dev)
-{
-    PIIXState *d = PIIX_PCI_DEVICE(dev);
-    uint8_t *pci_conf = d->dev.config;
-
-    pci_conf[0x04] = 0x07; // master, memory and I/O
-    pci_conf[0x05] = 0x00;
-    pci_conf[0x06] = 0x00;
-    pci_conf[0x07] = 0x02; // PCI_status_devsel_medium
-    pci_conf[0x4c] = 0x4d;
-    pci_conf[0x4e] = 0x03;
-    pci_conf[0x4f] = 0x00;
-    pci_conf[PIIX_PIRQCA] = d->pci_irq_reset_mappings[0];
-    pci_conf[PIIX_PIRQCB] = d->pci_irq_reset_mappings[1];
-    pci_conf[PIIX_PIRQCC] = d->pci_irq_reset_mappings[2];
-    pci_conf[PIIX_PIRQCD] = d->pci_irq_reset_mappings[3];
-    pci_conf[0x69] = 0x02;
-    pci_conf[0x70] = 0x80;
-    pci_conf[0x76] = 0x0c;
-    pci_conf[0x77] = 0x0c;
-    pci_conf[0x78] = 0x02;
-    pci_conf[0x79] = 0x00;
-    pci_conf[0x80] = 0x00;
-    pci_conf[0x82] = 0x00;
-    pci_conf[0xa0] = 0x08;
-    pci_conf[0xa2] = 0x00;
-    pci_conf[0xa3] = 0x00;
-    pci_conf[0xa4] = 0x00;
-    pci_conf[0xa5] = 0x00;
-    pci_conf[0xa6] = 0x00;
-    pci_conf[0xa7] = 0x00;
-    pci_conf[0xa8] = 0x0f;
-    pci_conf[0xaa] = 0x00;
-    pci_conf[0xab] = 0x00;
-    pci_conf[0xac] = 0x00;
-    pci_conf[0xae] = 0x00;
-
-    d->pic_levels = 0; /* not used in PIIX4 */
-    d->rcr = 0;
-}
-
-static int piix4_post_load(void *opaque, int version_id)
-{
-    PIIXState *s = opaque;
-
-    if (version_id == 2) {
-        s->rcr = 0;
-    }
-
-    return 0;
-}
-
-static const VMStateDescription vmstate_piix4 = {
-    .name = "PIIX4",
-    .version_id = 3,
-    .minimum_version_id = 2,
-    .post_load = piix4_post_load,
-    .fields = (VMStateField[]) {
-        VMSTATE_PCI_DEVICE(dev, PIIXState),
-        VMSTATE_UINT8_V(rcr, PIIXState, 3),
-        VMSTATE_END_OF_LIST()
-    }
-};
-
-static void rcr_write(void *opaque, hwaddr addr, uint64_t val,
-                            unsigned int len)
-{
-    PIIXState *s = opaque;
-
-    if (val & 4) {
-        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
-        return;
-    }
-
-    s->rcr = val & 2; /* keep System Reset type only */
-}
-
-static uint64_t rcr_read(void *opaque, hwaddr addr, unsigned int len)
-{
-    PIIXState *s = opaque;
-
-    return s->rcr;
-}
-
-static const MemoryRegionOps rcr_ops = {
-    .read = rcr_read,
-    .write = rcr_write,
-    .endianness = DEVICE_LITTLE_ENDIAN,
-    .impl = {
-        .min_access_size = 1,
-        .max_access_size = 1,
-    },
-};
-
-static void piix4_realize(PCIDevice *dev, Error **errp)
-{
-    PIIXState *s = PIIX_PCI_DEVICE(dev);
-    PCIBus *pci_bus = pci_get_bus(dev);
-    ISABus *isa_bus;
-
-    isa_bus = isa_bus_new(DEVICE(dev), pci_address_space(dev),
-                          pci_address_space_io(dev), errp);
-    if (!isa_bus) {
-        return;
-    }
-
-    memory_region_init_io(&s->rcr_mem, OBJECT(dev), &rcr_ops, s,
-                          "reset-control", 1);
-    memory_region_add_subregion_overlap(pci_address_space_io(dev),
-                                        PIIX_RCR_IOPORT, &s->rcr_mem, 1);
-
-    /* initialize i8259 pic */
-    if (!qdev_realize(DEVICE(&s->pic), BUS(isa_bus), errp)) {
-        return;
-    }
-
-    /* initialize ISA irqs */
-    isa_bus_irqs(isa_bus, s->pic.in_irqs);
-
-    /* initialize pit */
-    i8254_pit_init(isa_bus, 0x40, 0, NULL);
-
-    /* DMA */
-    i8257_dma_init(isa_bus, 0);
-
-    /* RTC */
-    qdev_prop_set_int32(DEVICE(&s->rtc), "base_year", 2000);
-    if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
-        return;
-    }
-    s->rtc.irq = qdev_get_gpio_in(DEVICE(&s->pic), s->rtc.isairq);
-
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
-        qdev_connect_gpio_out(DEVICE(&s->pm), 0,
-                              qdev_get_gpio_in(DEVICE(&s->pic), 9));
-    }
-
-    pci_bus_irqs(pci_bus, piix4_set_irq, piix4_pci_slot_get_pirq, s,
-                 PIIX_NUM_PIRQS);
-}
-
-static void piix4_init(Object *obj)
-{
-    PIIXState *s = PIIX_PCI_DEVICE(obj);
-
-    object_initialize_child(obj, "pic", &s->pic, TYPE_ISA_PIC);
-    object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
-    object_initialize_child(obj, "ide", &s->ide, TYPE_PIIX4_IDE);
-}
-
-static Property piix4_props[] = {
-    DEFINE_PROP_UINT32("smb_io_base", PIIXState, smb_io_base, 0),
-    DEFINE_PROP_UINT8("pirqa", PIIXState, pci_irq_reset_mappings[0], 0x80),
-    DEFINE_PROP_UINT8("pirqb", PIIXState, pci_irq_reset_mappings[1], 0x80),
-    DEFINE_PROP_UINT8("pirqc", PIIXState, pci_irq_reset_mappings[2], 0x80),
-    DEFINE_PROP_UINT8("pirqd", PIIXState, pci_irq_reset_mappings[3], 0x80),
-    DEFINE_PROP_BOOL("has-acpi", PIIXState, has_acpi, true),
-    DEFINE_PROP_BOOL("has-usb", PIIXState, has_usb, true),
-    DEFINE_PROP_BOOL("smm-enabled", PIIXState, smm_enabled, false),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
-static void piix4_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
-
-    k->realize = piix4_realize;
-    k->vendor_id = PCI_VENDOR_ID_INTEL;
-    k->device_id = PCI_DEVICE_ID_INTEL_82371AB_0;
-    k->class_id = PCI_CLASS_BRIDGE_ISA;
-    dc->reset = piix4_isa_reset;
-    dc->desc = "ISA bridge";
-    dc->vmsd = &vmstate_piix4;
-    /*
-     * Reason: part of PIIX4 southbridge, needs to be wired up,
-     * e.g. by mips_malta_init()
-     */
-    dc->user_creatable = false;
-    dc->hotpluggable = false;
-    device_class_set_props(dc, piix4_props);
-}
-
-static const TypeInfo piix4_info = {
-    .name          = TYPE_PIIX4_PCI_DEVICE,
-    .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(PIIXState),
-    .instance_init = piix4_init,
-    .class_init    = piix4_class_init,
-    .interfaces = (InterfaceInfo[]) {
-        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
-        { },
-    },
-};
-
-static void piix4_register_types(void)
-{
-    type_register_static(&piix4_info);
-}
-
-type_init(piix4_register_types)
-- 
2.38.1


