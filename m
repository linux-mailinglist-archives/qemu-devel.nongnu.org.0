Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 167706A8B18
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 22:23:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXqNi-0000p8-M1; Thu, 02 Mar 2023 16:22:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pXqNg-0000of-NB
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:22:28 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pXqNe-0002NS-QT
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:22:28 -0500
Received: by mail-ed1-x532.google.com with SMTP id x3so2376732edb.10
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 13:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677792146;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1bjJCHjPopHyUjvHSkW6nz42baGjBGYRhC6rag4UrU8=;
 b=ad8AHzvMB/Z1Uvh2pt64o74blY9fOt7etGjJS812VzQgQypyBl1osbdL/iyrny97vD
 humYg9Uqz01PMmtbr68TlwjRJ/tMBCtWCe2fagZUd4uPoKlb5P8IYcj7iVVzehPSR1+7
 zUnQZFFK6/PlY7bn62svIh20mpYXqcOlXQYKr1ZN3u1WmijvrA6DTto7VI28l3vzem28
 sT77RCEK9IL6/OoNk07NHEGUtQLQQaCAwXJFEpz05m9P/6K5YeBw9Rjjg7CxTe3OlgZO
 Vc3rXhJ7XvFFtnd4lw4fCPJXdmvzBEArZXuVWJy3vCmHH9Tt7iVBTJJLlxYBPeqnigg5
 dbzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677792146;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1bjJCHjPopHyUjvHSkW6nz42baGjBGYRhC6rag4UrU8=;
 b=VuAzvHdAc0t/qchMbJFQp83cHrwGyfSO+nxW1W0T/8ZQMhyd0wYmr2OTIRjAoM6cYZ
 C2L5iMikkxgt6AE7dLeAx235ctiQ7Qx5krCLSSLYcVa0sNkzSjEJ/GS7wB/r4RRayHkr
 a9UTO0DM1iiO3pWgL5jZ8dOyxaXfE1Zu+8wcvGHMBKNWvEYXmiwxA7GSEOGkmYZ9ZUAV
 6liJfYOJezhv6EmT0f6F06shbg6xQWPs4wlbeO6GihF0YL3Q1OZEWGuTraIYJ985/W5d
 jeO2+KHT6JB9B4hKxzrnDm45ZizZ/0BvSyvCfEjjwfaU6qKZ+ck1cpeef5v7E2n4phK9
 YO8Q==
X-Gm-Message-State: AO0yUKWzLO/Zz8pP94VTQd4do6FTwI2WGYNJlBApapVxyNUseUl3ptdg
 p5EE74YsJm8V+cnafihp+YwfHS96XUs=
X-Google-Smtp-Source: AK7set+c+zCQxo5ZiDJROVIuYiTsGJyEhhhnNArKXjcKBG/S09bt040gyDg+1SpcHYEcshNMVRLeig==
X-Received: by 2002:a17:906:4a10:b0:864:223:40b with SMTP id
 w16-20020a1709064a1000b008640223040bmr13967653eju.33.1677792145806; 
 Thu, 02 Mar 2023 13:22:25 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-092-224-150-004.92.224.pool.telefonica.de. [92.224.150.4])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709062ec400b008f89953b761sm145895eji.3.2023.03.02.13.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 13:22:25 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v8 15/23] hw/isa/piix4: Reuse struct PIIXState from PIIX3
Date: Thu,  2 Mar 2023 22:21:53 +0100
Message-Id: <20230302212201.224360-16-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302212201.224360-1-shentey@gmail.com>
References: <20230302212201.224360-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x532.google.com
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

PIIX4 has its own, private PIIX4State structure. PIIX3 has almost the
same structure, provided in a public header. So reuse it and add a
cpu_intr attribute which is only used by PIIX4.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/southbridge/piix.h |  1 +
 hw/isa/piix4.c                | 62 +++++++++++------------------------
 2 files changed, 21 insertions(+), 42 deletions(-)

diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 62fc5ddab9..b60061d2d7 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -50,6 +50,7 @@ struct PIIXState {
 #endif
     uint64_t pic_levels;
 
+    qemu_irq cpu_intr;
     qemu_irq *pic;
 
     /* This member isn't used. Just for save/load compatibility */
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index a88ae859c4..b74b7dc5d3 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -42,33 +42,10 @@
 #include "sysemu/runstate.h"
 #include "qom/object.h"
 
-struct PIIX4State {
-    PCIDevice dev;
-    qemu_irq cpu_intr;
-    qemu_irq *isa;
-
-    MC146818RtcState rtc;
-    PCIIDEState ide;
-    UHCIState uhci;
-    PIIX4PMState pm;
-
-    uint32_t smb_io_base;
-
-    /* Reset Control Register */
-    MemoryRegion rcr_mem;
-    uint8_t rcr;
-
-    bool has_acpi;
-    bool has_usb;
-    bool smm_enabled;
-};
-
-OBJECT_DECLARE_SIMPLE_TYPE(PIIX4State, PIIX4_PCI_DEVICE)
-
 static void piix4_set_irq(void *opaque, int irq_num, int level)
 {
     int i, pic_irq, pic_level;
-    PIIX4State *s = opaque;
+    PIIXState *s = opaque;
     PCIBus *bus = pci_get_bus(&s->dev);
 
     /* now we change the pic irq level according to the piix irq mappings */
@@ -82,13 +59,13 @@ static void piix4_set_irq(void *opaque, int irq_num, int level)
                 pic_level |= pci_bus_get_irq_level(bus, i);
             }
         }
-        qemu_set_irq(s->isa[pic_irq], pic_level);
+        qemu_set_irq(s->pic[pic_irq], pic_level);
     }
 }
 
 static void piix4_isa_reset(DeviceState *dev)
 {
-    PIIX4State *d = PIIX4_PCI_DEVICE(dev);
+    PIIXState *d = PIIX_PCI_DEVICE(dev);
     uint8_t *pci_conf = d->dev.config;
 
     pci_conf[0x04] = 0x07; // master, memory and I/O
@@ -123,12 +100,13 @@ static void piix4_isa_reset(DeviceState *dev)
     pci_conf[0xac] = 0x00;
     pci_conf[0xae] = 0x00;
 
+    d->pic_levels = 0; /* not used in PIIX4 */
     d->rcr = 0;
 }
 
 static int piix4_post_load(void *opaque, int version_id)
 {
-    PIIX4State *s = opaque;
+    PIIXState *s = opaque;
 
     if (version_id == 2) {
         s->rcr = 0;
@@ -143,22 +121,22 @@ static const VMStateDescription vmstate_piix4 = {
     .minimum_version_id = 2,
     .post_load = piix4_post_load,
     .fields = (VMStateField[]) {
-        VMSTATE_PCI_DEVICE(dev, PIIX4State),
-        VMSTATE_UINT8_V(rcr, PIIX4State, 3),
+        VMSTATE_PCI_DEVICE(dev, PIIXState),
+        VMSTATE_UINT8_V(rcr, PIIXState, 3),
         VMSTATE_END_OF_LIST()
     }
 };
 
 static void piix4_request_i8259_irq(void *opaque, int irq, int level)
 {
-    PIIX4State *s = opaque;
+    PIIXState *s = opaque;
     qemu_set_irq(s->cpu_intr, level);
 }
 
 static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,
                             unsigned int len)
 {
-    PIIX4State *s = opaque;
+    PIIXState *s = opaque;
 
     if (val & 4) {
         qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
@@ -170,7 +148,7 @@ static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,
 
 static uint64_t piix4_rcr_read(void *opaque, hwaddr addr, unsigned int len)
 {
-    PIIX4State *s = opaque;
+    PIIXState *s = opaque;
 
     return s->rcr;
 }
@@ -187,7 +165,7 @@ static const MemoryRegionOps piix4_rcr_ops = {
 
 static void piix4_realize(PCIDevice *dev, Error **errp)
 {
-    PIIX4State *s = PIIX4_PCI_DEVICE(dev);
+    PIIXState *s = PIIX_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
     ISABus *isa_bus;
     qemu_irq *i8259_out_irq;
@@ -208,10 +186,10 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
 
     /* initialize i8259 pic */
     i8259_out_irq = qemu_allocate_irqs(piix4_request_i8259_irq, s, 1);
-    s->isa = i8259_init(isa_bus, *i8259_out_irq);
+    s->pic = i8259_init(isa_bus, *i8259_out_irq);
 
     /* initialize ISA irqs */
-    isa_bus_register_input_irqs(isa_bus, s->isa);
+    isa_bus_register_input_irqs(isa_bus, s->pic);
 
     /* initialize pit */
     i8254_pit_init(isa_bus, 0x40, 0, NULL);
@@ -251,7 +229,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
         if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
             return;
         }
-        qdev_connect_gpio_out(DEVICE(&s->pm), 0, s->isa[9]);
+        qdev_connect_gpio_out(DEVICE(&s->pm), 0, s->pic[9]);
     }
 
     pci_bus_irqs(pci_bus, piix4_set_irq, s, PIIX_NUM_PIRQS);
@@ -259,17 +237,17 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
 
 static void piix4_init(Object *obj)
 {
-    PIIX4State *s = PIIX4_PCI_DEVICE(obj);
+    PIIXState *s = PIIX_PCI_DEVICE(obj);
 
     object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
     object_initialize_child(obj, "ide", &s->ide, TYPE_PIIX4_IDE);
 }
 
 static Property piix4_props[] = {
-    DEFINE_PROP_UINT32("smb_io_base", PIIX4State, smb_io_base, 0),
-    DEFINE_PROP_BOOL("has-acpi", PIIX4State, has_acpi, true),
-    DEFINE_PROP_BOOL("has-usb", PIIX4State, has_usb, true),
-    DEFINE_PROP_BOOL("smm-enabled", PIIX4State, smm_enabled, false),
+    DEFINE_PROP_UINT32("smb_io_base", PIIXState, smb_io_base, 0),
+    DEFINE_PROP_BOOL("has-acpi", PIIXState, has_acpi, true),
+    DEFINE_PROP_BOOL("has-usb", PIIXState, has_usb, true),
+    DEFINE_PROP_BOOL("smm-enabled", PIIXState, smm_enabled, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -297,7 +275,7 @@ static void piix4_class_init(ObjectClass *klass, void *data)
 static const TypeInfo piix4_info = {
     .name          = TYPE_PIIX4_PCI_DEVICE,
     .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(PIIX4State),
+    .instance_size = sizeof(PIIXState),
     .instance_init = piix4_init,
     .class_init    = piix4_class_init,
     .interfaces = (InterfaceInfo[]) {
-- 
2.39.2


