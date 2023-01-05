Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8CD65EEF6
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 15:41:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDRJT-00037X-PR; Thu, 05 Jan 2023 09:33:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRJM-0002wd-3a; Thu, 05 Jan 2023 09:33:40 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRJJ-0006vC-B2; Thu, 05 Jan 2023 09:33:39 -0500
Received: by mail-wr1-x42b.google.com with SMTP id w1so24198838wrt.8;
 Thu, 05 Jan 2023 06:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zr1ioA6SjyrnMmwipMJLcdraYQPIIWJge112HiDfGD4=;
 b=GlttNvZrsvNcLBMIXoX436tchncswlD7zULhhnv6QohmQsoM6XkEZ/nf39DzCSlMIW
 c75RX4o43WywssmIWXgpCUX2u43+y+31OYPkefs5y8lPR/i3le2+N35wZW8UGb0NRFO8
 uTGgMi7RprEse4MK39mDEjWSkc7coLrvkqz29fIvAdu4AaqjqLB0JcvtHlUdNmeGotNk
 SlUunf3qb0yKgt5l08JsdJ1LdL6x0V89lfyIr0uldPk3spnsN2zfbD24w4EXf0vfhPpc
 +ICYpX0Y9xq1XPNHp+I3t9jw2/5BdKX7cLii1WHDc5mbQi/yxJ7lbwqDLxmV1UeANzGS
 bEmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zr1ioA6SjyrnMmwipMJLcdraYQPIIWJge112HiDfGD4=;
 b=S/JpYyKPaPqnNVApys922Xmo68ETFE9G1oIbbpDaOc1olbJYzHoE1rBGi7v6e8X01g
 RuKz+Zs07KZtVQtQ9OTV1c1Z65eg5XMYH4NuJgy5l2EQmzBpwaOLl5cF/YgeLOryE2jp
 +sLhR23ZIzF982ONA4MAV3NZ4fh0MArizXQeT42S/RVRsvtjLzyniTXrPVm2BDcGSnCd
 6gMm3BC4Dy478uRWMqPcrq9LkLO3gCUa18eubh4RL0o94A4yS03qjEiq55vUHn1l9emk
 d2GX40EtdTmT/tdCTW2kIBCwp6yJal+BXCGuZ4/5SIBExaxIUkrYP0ZepTg9peX2cN24
 ljsQ==
X-Gm-Message-State: AFqh2krPfu1w7SFqVL/APUDtPoZhKXChEHfEUlrvuNXLWpak8xGzYTK6
 jiv+x9Jsz/VdmR73fyGOfKoXjLw55pwusQ==
X-Google-Smtp-Source: AMrXdXutBps783Ne8znCDoeITQxI15KH7LSQtGv7y4aB+T8Eo/oucYgZHAT/u6v/qXebEtM9lJs3Bw==
X-Received: by 2002:a5d:6dc4:0:b0:2b4:e5e:1e16 with SMTP id
 d4-20020a5d6dc4000000b002b40e5e1e16mr1336246wrz.35.1672929215889; 
 Thu, 05 Jan 2023 06:33:35 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 bt15-20020a056000080f00b00297dcfdc90fsm12260447wrb.24.2023.01.05.06.33.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 06:33:35 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Ani Sinha <ani@anisinha.ca>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v5 26/31] hw/isa/piix3: Merge hw/isa/piix4.c
Date: Thu,  5 Jan 2023 15:32:23 +0100
Message-Id: <20230105143228.244965-27-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105143228.244965-1-shentey@gmail.com>
References: <20230105143228.244965-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42b.google.com
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

Now that the PIIX3 and PIIX4 device models are sufficiently consolidated,
their implementations can be merged into one file for further
consolidation.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-37-shentey@gmail.com>
---
 hw/isa/{piix3.c => piix.c} | 158 ++++++++++++++++++++
 hw/isa/piix4.c             | 285 -------------------------------------
 MAINTAINERS                |   6 +-
 hw/i386/Kconfig            |   2 +-
 hw/isa/Kconfig             |  12 +-
 hw/isa/meson.build         |   3 +-
 hw/mips/Kconfig            |   2 +-
 7 files changed, 165 insertions(+), 303 deletions(-)
 rename hw/isa/{piix3.c => piix.c} (75%)
 delete mode 100644 hw/isa/piix4.c

diff --git a/hw/isa/piix3.c b/hw/isa/piix.c
similarity index 75%
rename from hw/isa/piix3.c
rename to hw/isa/piix.c
index 4ce1653406..81cb4e64ab 100644
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
@@ -27,6 +28,7 @@
 #include "qapi/error.h"
 #include "hw/dma/i8257.h"
 #include "hw/southbridge/piix.h"
+#include "hw/timer/i8254.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "hw/ide/piix.h"
@@ -81,6 +83,27 @@ static void piix3_set_irq(void *opaque, int pirq, int level)
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
 static PCIINTxRoute piix3_route_intx_pin_to_irq(void *opaque, int pin)
 {
     PIIXState *piix3 = opaque;
@@ -208,6 +231,17 @@ static int piix3_post_load(void *opaque, int version_id)
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
@@ -257,6 +291,17 @@ static const VMStateDescription vmstate_piix3 = {
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
@@ -489,11 +534,124 @@ static const TypeInfo piix3_xen_info = {
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
+    if (!qdev_realize(DEVICE(&s->pic), NULL, errp)) {
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
+    pci_bus_irqs(pci_bus, piix4_set_irq, s, PIIX_NUM_PIRQS);
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
     type_register_static(&piix_pci_type_info);
     type_register_static(&piix3_info);
     type_register_static(&piix3_xen_info);
+    type_register_static(&piix4_info);
 }
 
 type_init(piix3_register_types)
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
deleted file mode 100644
index de7cde192f..0000000000
--- a/hw/isa/piix4.c
+++ /dev/null
@@ -1,285 +0,0 @@
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
-    pci_conf[0x60] = 0x80;
-    pci_conf[0x61] = 0x80;
-    pci_conf[0x62] = 0x80;
-    pci_conf[0x63] = 0x80;
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
-    if (!qdev_realize(DEVICE(&s->pic), NULL, errp)) {
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
-    pci_bus_irqs(pci_bus, piix4_set_irq, s, PIIX_NUM_PIRQS);
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
diff --git a/MAINTAINERS b/MAINTAINERS
index 7a40d4d865..569042c3a1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1236,7 +1236,7 @@ Malta
 M: Philippe Mathieu-Daudé <philmd@linaro.org>
 R: Aurelien Jarno <aurelien@aurel32.net>
 S: Odd Fixes
-F: hw/isa/piix4.c
+F: hw/isa/piix.c
 F: hw/acpi/piix4.c
 F: hw/mips/malta.c
 F: hw/mips/gt64xxx_pci.c
@@ -1654,7 +1654,7 @@ F: hw/pci-host/pam.c
 F: include/hw/pci-host/i440fx.h
 F: include/hw/pci-host/q35.h
 F: include/hw/pci-host/pam.h
-F: hw/isa/piix3.c
+F: hw/isa/piix.c
 F: hw/isa/lpc_ich9.c
 F: hw/i2c/smbus_ich9.c
 F: hw/acpi/piix4.c
@@ -2344,7 +2344,7 @@ PIIX4 South Bridge (i82371AB)
 M: Hervé Poussineau <hpoussin@reactos.org>
 M: Philippe Mathieu-Daudé <philmd@linaro.org>
 S: Maintained
-F: hw/isa/piix4.c
+F: hw/isa/piix.c
 F: include/hw/southbridge/piix.h
 
 Firmware configuration (fw_cfg)
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index 39a35467ca..15442ddbdf 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -74,7 +74,7 @@ config I440FX
     select ACPI_SMBUS
     select I8259
     select PCI_I440FX
-    select PIIX3
+    select PIIX
     select DIMM
     select SMBIOS
     select FW_CFG_DMA
diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index 497cc29beb..847d20423a 100644
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
 
diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
index d156de812c..5b16ff4ed2 100644
--- a/hw/mips/Kconfig
+++ b/hw/mips/Kconfig
@@ -2,7 +2,7 @@ config MALTA
     bool
     select I8259
     select ISA_SUPERIO
-    select PIIX4
+    select PIIX
 
 config MIPSSIM
     bool
-- 
2.39.0


