Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD44655B824
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 09:19:57 +0200 (CEST)
Received: from localhost ([::1]:57532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5j2K-000716-RL
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 03:19:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1o5izS-0003gd-84; Mon, 27 Jun 2022 03:16:59 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:43826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1o5izM-0003tO-CN; Mon, 27 Jun 2022 03:16:57 -0400
Received: by mail-ej1-x62b.google.com with SMTP id u15so17112148ejc.10;
 Mon, 27 Jun 2022 00:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tyv5gCJ3AbNyEZF4KCYh7JHG+L/xYML+lJ9AXX6nAzc=;
 b=BBmvYIx/uvdVwqV8ILucW0fTFzPy+zOjAAAU6tX/5xP+Y1X0rEucuRScMU6ggI1QRQ
 iOyj6nsTiWrIGNaJfDBfRWoLrSJf6OLO1qcWR8HJTwS8T0VyrqrOKP/RwKoIr6isUMPP
 ROHo+zHS9kLAzUFWvjUovdZrqGUkMvTfGT2EJEwQsPFFAEQYAi6+IDtxGognggQPorfc
 rTJE8bTw+xirnS4UGv063U0PirfUmioiyDhWByK/XoNYtB50+STsblwL5hOFeXc3dGyQ
 RnHnAZ+a/VIuol4IHNgl8YKCrgZcj1AFT2ntC1dXO9H7ieV6ieHAOVx3rMT1O+ZU3omF
 YGXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tyv5gCJ3AbNyEZF4KCYh7JHG+L/xYML+lJ9AXX6nAzc=;
 b=Yut7U993zmGNgybGmMZv4k1YLv9aI3PpQ2sRPXHLM49SPth907AfLAzXT91FLF3/LU
 6hW1mN4zyA3rEl/CkcIP5DjWryGRgVPNQqLn9gSYizaAjd3gKok87+94DiOURu4hslh6
 ngVoJGeLtrlVk0kovdzL+lyih+GkSVu1qg8qkny2fnlUxD3nJYl9TI/kl/sOS+yO7bF+
 37v0QtyAjd6oLSE4892Hrce3B34+4BGxd/FQcuoZYMeEdCt602xqHnNnd7bITzL2DCLp
 bR6CxEqYsiVBYy/w64yg9UsWvzFf7qxJvBnWRH2NGAfffYgtPOQFKmBMZK4BIc1FzOL+
 O1Qg==
X-Gm-Message-State: AJIora+ixjj8j8nlnx/H/lWMThQvPUNSw/aXXH/mpRAw91yIoc3mfgBt
 8NE29PYrI+wIb/TMAu5UisjBEOMiU8ri6w==
X-Google-Smtp-Source: AGRyM1vGtrs1s3UEkKlQO2agBjmA0wVPfystfaehHuEjvONEoubYSv5gcAC2xDIlQQj2bOS+VvXTnA==
X-Received: by 2002:a17:907:2d86:b0:711:da8b:b579 with SMTP id
 gt6-20020a1709072d8600b00711da8bb579mr11935006ejc.67.1656314207476; 
 Mon, 27 Jun 2022 00:16:47 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-183-075-191.77.183.pool.telefonica.de. [77.183.75.191])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a1709064e5000b007072dc80e06sm4593294ejw.190.2022.06.27.00.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 00:16:47 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 mark.cave-ayland@ilande.co.uk, balaton@eik.bme.hu,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [RFC PATCH 04/10] hw/ide/piix: Avoid the isabus global when wiring
 ISA interrupts for internal devices
Date: Mon, 27 Jun 2022 09:16:05 +0200
Message-Id: <20220627071611.8793-5-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627071611.8793-1-shentey@gmail.com>
References: <20220627071611.8793-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
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

isa_get_irq() currently always uses the "isabus" global to get the
desired qemu_irq. In order to resolve this global, we want
isa_get_irq() to determine the ISABus from its *dev parameter using
isa_bus_from_device(). As a preparation, all callers who pass NULL
as *dev need to be resolved which seems to happen in hw/ide/piix only.

This patch roughly implements the solution outlined in https://
lists.nongnu.org/archive/html/qemu-devel/2020-03/msg01707.html.

In oder to address the PIIX IDE functions being user-creatable, (see
https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg05655.html) a
backwards compatibility quirk is introduced which can be removed after some
deprecation period. The quirk consists of internal devices to opt into new
behavior where the ISA interrupt wiring is performed by the caller rather
than by the device itself. The opt-in can be performed by:

    qdev_prop_set_bit(DEVICE(dev), "user-created", false);

RFC: qdev_init_gpio_in() seems to expose interrupts internal to the device.
Can this be fixed?

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc_piix.c    |  3 +++
 hw/ide/piix.c        | 41 +++++++++++++++++++++++++++++++++++------
 hw/isa/piix4.c       |  3 +++
 include/hw/ide/pci.h |  2 ++
 4 files changed, 43 insertions(+), 6 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 2d146b19c0..e24fbab334 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -253,8 +253,11 @@ static void pc_init1(MachineState *machine,
         PCIDevice *dev;
 
         dev = pci_new_multifunction(piix3_devfn + 1, false, "piix3-ide");
+        qdev_prop_set_bit(DEVICE(dev), "user-created", false);
         pci_realize_and_unref(dev, pci_bus, &error_fatal);
         pci_ide_create_devs(dev);
+        qdev_connect_gpio_out(DEVICE(dev), 0, x86ms->gsi[14]);
+        qdev_connect_gpio_out(DEVICE(dev), 1, x86ms->gsi[15]);
         idebus[0] = qdev_get_child_bus(&dev->qdev, "ide.0");
         idebus[1] = qdev_get_child_bus(&dev->qdev, "ide.1");
         pc_cmos_init(pcms, idebus[0], idebus[1], rtc_state);
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index 21777ecc8b..fbf2756b47 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -103,6 +103,13 @@ static void bmdma_setup_bar(PCIIDEState *d)
     }
 }
 
+static void piix_ide_set_irq(void *opaque, int n, int level)
+{
+    PCIIDEState *d = opaque;
+
+    qemu_set_irq(d->isa_irqs[n], level);
+}
+
 static void piix_ide_reset(DeviceState *dev)
 {
     PCIIDEState *d = PCI_IDE(dev);
@@ -129,14 +136,14 @@ static int pci_piix_init_ports(PCIIDEState *d)
     static const struct {
         int iobase;
         int iobase2;
-        int isairq;
     } port_info[] = {
-        {0x1f0, 0x3f6, 14},
-        {0x170, 0x376, 15},
+        {0x1f0, 0x3f6},
+        {0x170, 0x376},
     };
+    DeviceState *dev = DEVICE(d);
     int i;
 
-    {
+    if (d->user_created) {
         ISABus *isa_bus;
         bool ambiguous;
 
@@ -145,13 +152,18 @@ static int pci_piix_init_ports(PCIIDEState *d)
         if (!isa_bus || ambiguous) {
             return -ENODEV;
         }
+
+        d->isa_irqs[0] = isa_bus->irqs[14];
+        d->isa_irqs[1] = isa_bus->irqs[15];
+    } else {
+        qdev_init_gpio_out(dev, d->isa_irqs, 2);
     }
 
     for (i = 0; i < 2; i++) {
-        ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
+        ide_bus_init(&d->bus[i], sizeof(d->bus[i]), dev, i, 2);
         ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
                         port_info[i].iobase2);
-        ide_init2(&d->bus[i], isa_get_irq(NULL, port_info[i].isairq));
+        ide_init2(&d->bus[i], qdev_get_gpio_in(dev, i));
 
         bmdma_init(&d->bus[i], &d->bmdma[i], d);
         d->bmdma[i].bus = &d->bus[i];
@@ -181,6 +193,14 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
     }
 }
 
+static void pci_piix_ide_init(Object *obj)
+{
+    PCIIDEState *d = PCI_IDE(obj);
+    DeviceState *dev = DEVICE(d);
+
+    qdev_init_gpio_in(dev, piix_ide_set_irq, 2);
+}
+
 static void pci_piix_ide_exitfn(PCIDevice *dev)
 {
     PCIIDEState *d = PCI_IDE(dev);
@@ -192,6 +212,11 @@ static void pci_piix_ide_exitfn(PCIDevice *dev)
     }
 }
 
+static Property piix_ide_properties[] = {
+    DEFINE_PROP_BOOL("user-created", PCIIDEState, user_created, true),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 /* NOTE: for the PIIX3, the IRQs and IOports are hardcoded */
 static void piix3_ide_class_init(ObjectClass *klass, void *data)
 {
@@ -206,11 +231,13 @@ static void piix3_ide_class_init(ObjectClass *klass, void *data)
     k->class_id = PCI_CLASS_STORAGE_IDE;
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
     dc->hotpluggable = false;
+    device_class_set_props(dc, piix_ide_properties);
 }
 
 static const TypeInfo piix3_ide_info = {
     .name          = "piix3-ide",
     .parent        = TYPE_PCI_IDE,
+    .instance_init = pci_piix_ide_init,
     .class_init    = piix3_ide_class_init,
 };
 
@@ -228,11 +255,13 @@ static void piix4_ide_class_init(ObjectClass *klass, void *data)
     k->class_id = PCI_CLASS_STORAGE_IDE;
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
     dc->hotpluggable = false;
+    device_class_set_props(dc, piix_ide_properties);
 }
 
 static const TypeInfo piix4_ide_info = {
     .name          = "piix4-ide",
     .parent        = TYPE_PCI_IDE,
+    .instance_init = pci_piix_ide_init,
     .class_init    = piix4_ide_class_init,
 };
 
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 15f344dbb7..900c77cf68 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -251,10 +251,13 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
 
     /* IDE */
     qdev_prop_set_int32(DEVICE(&s->ide), "addr", dev->devfn + 1);
+    qdev_prop_set_bit(DEVICE(&s->ide), "user-created", false);
     if (!qdev_realize(DEVICE(&s->ide), BUS(pci_bus), errp)) {
         return;
     }
     pci_ide_create_devs(PCI_DEVICE(&s->ide));
+    qdev_connect_gpio_out(DEVICE(&s->ide), 0, s->isa[14]);
+    qdev_connect_gpio_out(DEVICE(&s->ide), 1, s->isa[15]);
 
     /* USB */
     qdev_prop_set_int32(DEVICE(&s->uhci), "addr", dev->devfn + 2);
diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
index d8384e1c42..7ccbfa0a71 100644
--- a/include/hw/ide/pci.h
+++ b/include/hw/ide/pci.h
@@ -49,10 +49,12 @@ struct PCIIDEState {
 
     IDEBus bus[2];
     BMDMAState bmdma[2];
+    qemu_irq isa_irqs[2];
     uint32_t secondary; /* used only for cmd646 */
     MemoryRegion bmdma_bar;
     MemoryRegion cmd_bar[2];
     MemoryRegion data_bar[2];
+    bool user_created;
 };
 
 static inline IDEState *bmdma_active_if(BMDMAState *bmdma)
-- 
2.36.1


