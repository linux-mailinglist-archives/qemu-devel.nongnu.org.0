Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C46662D87
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 18:49:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEvuN-0003Vk-2F; Mon, 09 Jan 2023 12:26:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtj-0002l8-5W; Mon, 09 Jan 2023 12:25:23 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtg-000131-8P; Mon, 09 Jan 2023 12:25:22 -0500
Received: by mail-ej1-x635.google.com with SMTP id u19so21852749ejm.8;
 Mon, 09 Jan 2023 09:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CxUcKaThBl8AYC0m74VCf/oU271ubQWNI8NJL87KmlU=;
 b=nbE0Y8MAXgQfRGIeFQjBKv+1oXUBmsvbDl8soYUtvUfsfuJ2CEDvKRrjq1Is7icsuX
 m40NqvRzDLBjx20LV4icimpSaMhNMeqx1eVm91lWCwIYHeqSbI9lb4a1cdFvIMogv9Xg
 2rF7iaJEXYcCAWJcXwqMh8kcVkbM6dSSrAfwbDK1X2bvYckdU7FzJ+7bmOL5/p15ZX+A
 oyExY/u6sVWBSJ16NEQjbRl5nMPUQk6X8OTZSDGUw98dEO92oiA9o/19b8tOXPZlBVl8
 dsHl66nZv8EVuinNLbVCgNBPs71CoiYeRHbliS/4wHLNy+KFzBzVUeDfTlLHWEHC7k1a
 dU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CxUcKaThBl8AYC0m74VCf/oU271ubQWNI8NJL87KmlU=;
 b=OdFgJgOI9UFeKrqnYZJYHESTR2AJo4siFYhHIjKxxu0qEuwht4zteHeg2uy3bQNWhO
 5PjDNpEj5c7BxZ5L0OM6L0io8LMyaQunu6S4KIFgRbLptGZYhaF4U83DfLGKSXbLbwIh
 tKDEMfcKDXe8/xSMlhULTE33f1WHezqoobbTSK80QwbV3IzTiP8n7mwGPqhXtc9yzZ4Z
 Xt7LV8gScZI054+vfjplQZxnv9944KSGaxIt5ElDohKhZfKK1EHmE8XhKYFmyp5mEu7h
 O08/EggNJAekU2vYzHjVyJuhWTh2d6fOYQnOt5gE5jLL3PYs5xScisuxdpRaMEbYTpir
 83qg==
X-Gm-Message-State: AFqh2krecnUMShkS4BtxXkBA4zYWw+qjmbOgBKGTg9RIuXqzn67NB9A7
 0uI7yDCojeRFfglBVIyEanlgVS/iQLqw4Q==
X-Google-Smtp-Source: AMrXdXvzHm7it/MPNA6Qi7zD9jAap7fLTR4r0x+sGHYNQzBC9NK10t1t9mePrlKXnq+7PeLZy1Fb9Q==
X-Received: by 2002:a17:906:30ca:b0:7c1:6091:e73 with SMTP id
 b10-20020a17090630ca00b007c160910e73mr57130259ejb.1.1673285117989; 
 Mon, 09 Jan 2023 09:25:17 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b00846734faa9asm3925625ejo.164.2023.01.09.09.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 09:25:17 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v6 22/33] hw/isa/piix3: Drop the "3" from PIIX base class
Date: Mon,  9 Jan 2023 18:23:35 +0100
Message-Id: <20230109172347.1830-23-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109172347.1830-1-shentey@gmail.com>
References: <20230109172347.1830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x635.google.com
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

This commit marks the finalization of the PIIX3 preparations
to be merged with PIIX4. In particular, PIIXState is prepared
to be reused in piix4.c.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-25-shentey@gmail.com>
---
 include/hw/southbridge/piix.h |  6 ++--
 hw/isa/piix3.c                | 60 +++++++++++++++++------------------
 2 files changed, 32 insertions(+), 34 deletions(-)

diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index f48cfd7936..907c3568b6 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -72,11 +72,9 @@ struct PIIXState {
     bool has_usb;
     bool smm_enabled;
 };
-typedef struct PIIXState PIIX3State;
 
-#define TYPE_PIIX3_PCI_DEVICE "pci-piix3"
-DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
-                         TYPE_PIIX3_PCI_DEVICE)
+#define TYPE_PIIX_PCI_DEVICE "pci-piix"
+OBJECT_DECLARE_SIMPLE_TYPE(PIIXState, PIIX_PCI_DEVICE)
 
 #define TYPE_PIIX3_DEVICE "PIIX3"
 #define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index d674130fc9..4ce1653406 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -38,7 +38,7 @@
 
 #define XEN_PIIX_NUM_PIRQS      128ULL
 
-static void piix3_set_irq_pic(PIIX3State *piix3, int pic_irq)
+static void piix3_set_irq_pic(PIIXState *piix3, int pic_irq)
 {
     qemu_set_irq(piix3->pic.in_irqs[pic_irq],
                  !!(piix3->pic_levels &
@@ -46,7 +46,7 @@ static void piix3_set_irq_pic(PIIX3State *piix3, int pic_irq)
                      (pic_irq * PIIX_NUM_PIRQS))));
 }
 
-static void piix3_set_irq_level_internal(PIIX3State *piix3, int pirq, int level)
+static void piix3_set_irq_level_internal(PIIXState *piix3, int pirq, int level)
 {
     int pic_irq;
     uint64_t mask;
@@ -61,7 +61,7 @@ static void piix3_set_irq_level_internal(PIIX3State *piix3, int pirq, int level)
     piix3->pic_levels |= mask * !!level;
 }
 
-static void piix3_set_irq_level(PIIX3State *piix3, int pirq, int level)
+static void piix3_set_irq_level(PIIXState *piix3, int pirq, int level)
 {
     int pic_irq;
 
@@ -77,13 +77,13 @@ static void piix3_set_irq_level(PIIX3State *piix3, int pirq, int level)
 
 static void piix3_set_irq(void *opaque, int pirq, int level)
 {
-    PIIX3State *piix3 = opaque;
+    PIIXState *piix3 = opaque;
     piix3_set_irq_level(piix3, pirq, level);
 }
 
 static PCIINTxRoute piix3_route_intx_pin_to_irq(void *opaque, int pin)
 {
-    PIIX3State *piix3 = opaque;
+    PIIXState *piix3 = opaque;
     int irq = piix3->dev.config[PIIX_PIRQCA + pin];
     PCIINTxRoute route;
 
@@ -98,7 +98,7 @@ static PCIINTxRoute piix3_route_intx_pin_to_irq(void *opaque, int pin)
 }
 
 /* irq routing is changed. so rebuild bitmap */
-static void piix3_update_irq_levels(PIIX3State *piix3)
+static void piix3_update_irq_levels(PIIXState *piix3)
 {
     PCIBus *bus = pci_get_bus(&piix3->dev);
     int pirq;
@@ -114,7 +114,7 @@ static void piix3_write_config(PCIDevice *dev,
 {
     pci_default_write_config(dev, address, val, len);
     if (ranges_overlap(address, len, PIIX_PIRQCA, 4)) {
-        PIIX3State *piix3 = PIIX3_PCI_DEVICE(dev);
+        PIIXState *piix3 = PIIX_PCI_DEVICE(dev);
         int pic_irq;
 
         pci_bus_fire_intx_routing_notifier(pci_get_bus(&piix3->dev));
@@ -147,7 +147,7 @@ static void piix3_write_config_xen(PCIDevice *dev,
 
 static void piix_reset(DeviceState *dev)
 {
-    PIIX3State *d = PIIX3_PCI_DEVICE(dev);
+    PIIXState *d = PIIX_PCI_DEVICE(dev);
     uint8_t *pci_conf = d->dev.config;
 
     pci_conf[0x04] = 0x07; /* master, memory and I/O */
@@ -188,7 +188,7 @@ static void piix_reset(DeviceState *dev)
 
 static int piix3_post_load(void *opaque, int version_id)
 {
-    PIIX3State *piix3 = opaque;
+    PIIXState *piix3 = opaque;
     int pirq;
 
     /*
@@ -211,7 +211,7 @@ static int piix3_post_load(void *opaque, int version_id)
 static int piix3_pre_save(void *opaque)
 {
     int i;
-    PIIX3State *piix3 = opaque;
+    PIIXState *piix3 = opaque;
 
     for (i = 0; i < ARRAY_SIZE(piix3->pci_irq_levels_vmstate); i++) {
         piix3->pci_irq_levels_vmstate[i] =
@@ -223,7 +223,7 @@ static int piix3_pre_save(void *opaque)
 
 static bool piix3_rcr_needed(void *opaque)
 {
-    PIIX3State *piix3 = opaque;
+    PIIXState *piix3 = opaque;
 
     return (piix3->rcr != 0);
 }
@@ -234,7 +234,7 @@ static const VMStateDescription vmstate_piix3_rcr = {
     .minimum_version_id = 1,
     .needed = piix3_rcr_needed,
     .fields = (VMStateField[]) {
-        VMSTATE_UINT8(rcr, PIIX3State),
+        VMSTATE_UINT8(rcr, PIIXState),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -246,8 +246,8 @@ static const VMStateDescription vmstate_piix3 = {
     .post_load = piix3_post_load,
     .pre_save = piix3_pre_save,
     .fields = (VMStateField[]) {
-        VMSTATE_PCI_DEVICE(dev, PIIX3State),
-        VMSTATE_INT32_ARRAY_V(pci_irq_levels_vmstate, PIIX3State,
+        VMSTATE_PCI_DEVICE(dev, PIIXState),
+        VMSTATE_INT32_ARRAY_V(pci_irq_levels_vmstate, PIIXState,
                               PIIX_NUM_PIRQS, 3),
         VMSTATE_END_OF_LIST()
     },
@@ -260,7 +260,7 @@ static const VMStateDescription vmstate_piix3 = {
 
 static void rcr_write(void *opaque, hwaddr addr, uint64_t val, unsigned len)
 {
-    PIIX3State *d = opaque;
+    PIIXState *d = opaque;
 
     if (val & 4) {
         qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
@@ -271,7 +271,7 @@ static void rcr_write(void *opaque, hwaddr addr, uint64_t val, unsigned len)
 
 static uint64_t rcr_read(void *opaque, hwaddr addr, unsigned len)
 {
-    PIIX3State *d = opaque;
+    PIIXState *d = opaque;
 
     return d->rcr;
 }
@@ -288,7 +288,7 @@ static const MemoryRegionOps rcr_ops = {
 
 static void pci_piix3_realize(PCIDevice *dev, Error **errp)
 {
-    PIIX3State *d = PIIX3_PCI_DEVICE(dev);
+    PIIXState *d = PIIX_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
     ISABus *isa_bus;
 
@@ -374,7 +374,7 @@ static void build_pci_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
 
 static void pci_piix3_init(Object *obj)
 {
-    PIIX3State *d = PIIX3_PCI_DEVICE(obj);
+    PIIXState *d = PIIX_PCI_DEVICE(obj);
 
     object_initialize_child(obj, "pic", &d->pic, TYPE_ISA_PIC);
     object_initialize_child(obj, "rtc", &d->rtc, TYPE_MC146818_RTC);
@@ -382,10 +382,10 @@ static void pci_piix3_init(Object *obj)
 }
 
 static Property pci_piix_props[] = {
-    DEFINE_PROP_UINT32("smb_io_base", PIIX3State, smb_io_base, 0),
-    DEFINE_PROP_BOOL("has-acpi", PIIX3State, has_acpi, true),
-    DEFINE_PROP_BOOL("has-usb", PIIX3State, has_usb, true),
-    DEFINE_PROP_BOOL("smm-enabled", PIIX3State, smm_enabled, false),
+    DEFINE_PROP_UINT32("smb_io_base", PIIXState, smb_io_base, 0),
+    DEFINE_PROP_BOOL("has-acpi", PIIXState, has_acpi, true),
+    DEFINE_PROP_BOOL("has-usb", PIIXState, has_usb, true),
+    DEFINE_PROP_BOOL("smm-enabled", PIIXState, smm_enabled, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -412,10 +412,10 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
     adevc->build_dev_aml = build_pci_isa_aml;
 }
 
-static const TypeInfo piix3_pci_type_info = {
-    .name = TYPE_PIIX3_PCI_DEVICE,
+static const TypeInfo piix_pci_type_info = {
+    .name = TYPE_PIIX_PCI_DEVICE,
     .parent = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(PIIX3State),
+    .instance_size = sizeof(PIIXState),
     .instance_init = pci_piix3_init,
     .abstract = true,
     .class_init = pci_piix3_class_init,
@@ -429,7 +429,7 @@ static const TypeInfo piix3_pci_type_info = {
 static void piix3_realize(PCIDevice *dev, Error **errp)
 {
     ERRP_GUARD();
-    PIIX3State *piix3 = PIIX3_PCI_DEVICE(dev);
+    PIIXState *piix3 = PIIX_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
 
     pci_piix3_realize(dev, errp);
@@ -451,14 +451,14 @@ static void piix3_class_init(ObjectClass *klass, void *data)
 
 static const TypeInfo piix3_info = {
     .name          = TYPE_PIIX3_DEVICE,
-    .parent        = TYPE_PIIX3_PCI_DEVICE,
+    .parent        = TYPE_PIIX_PCI_DEVICE,
     .class_init    = piix3_class_init,
 };
 
 static void piix3_xen_realize(PCIDevice *dev, Error **errp)
 {
     ERRP_GUARD();
-    PIIX3State *piix3 = PIIX3_PCI_DEVICE(dev);
+    PIIXState *piix3 = PIIX_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
 
     pci_piix3_realize(dev, errp);
@@ -485,13 +485,13 @@ static void piix3_xen_class_init(ObjectClass *klass, void *data)
 
 static const TypeInfo piix3_xen_info = {
     .name          = TYPE_PIIX3_XEN_DEVICE,
-    .parent        = TYPE_PIIX3_PCI_DEVICE,
+    .parent        = TYPE_PIIX_PCI_DEVICE,
     .class_init    = piix3_xen_class_init,
 };
 
 static void piix3_register_types(void)
 {
-    type_register_static(&piix3_pci_type_info);
+    type_register_static(&piix_pci_type_info);
     type_register_static(&piix3_info);
     type_register_static(&piix3_xen_info);
 }
-- 
2.39.0


