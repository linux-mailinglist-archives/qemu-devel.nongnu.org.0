Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 866995A9DB7
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 19:07:02 +0200 (CEST)
Received: from localhost ([::1]:37716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTnef-0007fS-Oe
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 13:07:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2N-0002Jx-Qf
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:28 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:35563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2C-0001UA-B6
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:26 -0400
Received: by mail-ed1-x536.google.com with SMTP id y64so11484133ede.2
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 09:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=zjno28eeqiJDQD8cSUoofO/ILmkJb7ze4KyDRM4MZ/Y=;
 b=j3zk57nAu7Rm6jveZX06R1SaXEdc9MrQsoMF3G8Sg3IbnLTZwDthojWRjSf5sKuIrs
 HQQtOevdbG6Y4R/usAFL0zOsJxEFKxaequOlRNA8ZwoU3759by4sBCbtu3rHMPM30qQI
 UDQd6I4IXiegcCCfsH09X6VWVR6RuO44WkbSZTzmBHaZSw4tuAy9kWEgN5nFv2bnFx5t
 XV4xzEPmEiGJmRXnrfB8RTuRDWxSvOBeqzNOXWDD0gk2rvNfs0Frl6XGzRYbEo/1rxCh
 /5BKMKAHDpe650tuhIlwNA/q3LwweyXupT3JrRDDQQhaS5fOP7ydJhAHrwVn9T7HkBS9
 PKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=zjno28eeqiJDQD8cSUoofO/ILmkJb7ze4KyDRM4MZ/Y=;
 b=FQg9ssZ20QUUgGxkfloEZaWrBzkg6gcrOaf/aCArTwMEl2DXTJBVfRXppX02O9QoQ4
 Yr6jWzAhK+6B84S/Hms7rKfUYiNiPzWgYPEKn3RGVzN9rWJwstheLraxZl4VmtbKkaJS
 xOCzFD1LIoSLHeUkcjfUITUJNP7ouBKjzliAc/wMFHFnfeqAC0n/OK9GKEaJPQrZSD1h
 lQO11t4bAODcyAMnnZx9tQ6mBTsucc6nFJu8qQ7i7No1cfptKge4B1rwqDMZ4ZfGflKM
 9lwf67+3vMCrT0sN3PYJHzU/J18H7g0TnGouP/v5kqp/1EEYRNs6AYgads3MJofo+gf7
 dGlg==
X-Gm-Message-State: ACgBeo1J8bccWW/G5qW8mJpgyv6u6y92ulljMMzZToLTsX19NNVg66Hh
 fN/V0lPFdMZvyMnt7In0gKvexEph4zw=
X-Google-Smtp-Source: AA6agR4qpmNTkh+xiAeChmNTAk0qogoAZgG6d2V755Zu6UGzaeI7VoEy1htuRRxT6YTIRxYwdOKTrg==
X-Received: by 2002:aa7:d385:0:b0:447:d5ec:d452 with SMTP id
 x5-20020aa7d385000000b00447d5ecd452mr26040032edq.231.1662049627547; 
 Thu, 01 Sep 2022 09:27:07 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa7d306000000b00447c0dcbb99sm1587672edq.83.2022.09.01.09.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 09:27:07 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 21/42] hw/isa/piix3: Rename typedef PIIX3State to PIIXState
Date: Thu,  1 Sep 2022 18:25:52 +0200
Message-Id: <20220901162613.6939-22-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901162613.6939-1-shentey@gmail.com>
References: <20220901162613.6939-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
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

This commit marks the finalization of the PIIX3 preparations
to be merged with PIIX4. In particular, PIIXState is prepared
to be reused in piix4.c.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix3.c                | 58 +++++++++++++++++------------------
 include/hw/southbridge/piix.h |  4 +--
 2 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index e5772475be..75705a1fc1 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -37,7 +37,7 @@
 
 #define XEN_PIIX_NUM_PIRQS      128ULL
 
-static void piix3_set_irq_pic(PIIX3State *piix3, int pic_irq)
+static void piix3_set_irq_pic(PIIXState *piix3, int pic_irq)
 {
     qemu_set_irq(piix3->pic.in_irqs[pic_irq],
                  !!(piix3->pic_levels &
@@ -45,7 +45,7 @@ static void piix3_set_irq_pic(PIIX3State *piix3, int pic_irq)
                      (pic_irq * PIIX_NUM_PIRQS))));
 }
 
-static void piix3_set_irq_level_internal(PIIX3State *piix3, int pirq, int level)
+static void piix3_set_irq_level_internal(PIIXState *piix3, int pirq, int level)
 {
     int pic_irq;
     uint64_t mask;
@@ -60,7 +60,7 @@ static void piix3_set_irq_level_internal(PIIX3State *piix3, int pirq, int level)
     piix3->pic_levels |= mask * !!level;
 }
 
-static void piix3_set_irq_level(PIIX3State *piix3, int pirq, int level)
+static void piix3_set_irq_level(PIIXState *piix3, int pirq, int level)
 {
     int pic_irq;
 
@@ -76,7 +76,7 @@ static void piix3_set_irq_level(PIIX3State *piix3, int pirq, int level)
 
 static void piix3_set_irq(void *opaque, int pirq, int level)
 {
-    PIIX3State *piix3 = opaque;
+    PIIXState *piix3 = opaque;
     piix3_set_irq_level(piix3, pirq, level);
 }
 
@@ -93,7 +93,7 @@ static int piix3_pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
 
 static PCIINTxRoute piix3_route_intx_pin_to_irq(void *opaque, int pin)
 {
-    PIIX3State *piix3 = opaque;
+    PIIXState *piix3 = opaque;
     int irq = piix3->dev.config[PIIX_PIRQCA + pin];
     PCIINTxRoute route;
 
@@ -108,7 +108,7 @@ static PCIINTxRoute piix3_route_intx_pin_to_irq(void *opaque, int pin)
 }
 
 /* irq routing is changed. so rebuild bitmap */
-static void piix3_update_irq_levels(PIIX3State *piix3)
+static void piix3_update_irq_levels(PIIXState *piix3)
 {
     PCIBus *bus = pci_get_bus(&piix3->dev);
     int pirq;
@@ -124,7 +124,7 @@ static void piix3_write_config(PCIDevice *dev,
 {
     pci_default_write_config(dev, address, val, len);
     if (ranges_overlap(address, len, PIIX_PIRQCA, 4)) {
-        PIIX3State *piix3 = PIIX3_PCI_DEVICE(dev);
+        PIIXState *piix3 = PIIX_PCI_DEVICE(dev);
         int pic_irq;
 
         pci_bus_fire_intx_routing_notifier(pci_get_bus(&piix3->dev));
@@ -157,7 +157,7 @@ static void piix3_write_config_xen(PCIDevice *dev,
 
 static void piix_reset(DeviceState *dev)
 {
-    PIIX3State *d = PIIX3_PCI_DEVICE(dev);
+    PIIXState *d = PIIX_PCI_DEVICE(dev);
     uint8_t *pci_conf = d->dev.config;
 
     pci_conf[0x04] = 0x07; /* master, memory and I/O */
@@ -198,7 +198,7 @@ static void piix_reset(DeviceState *dev)
 
 static int piix3_post_load(void *opaque, int version_id)
 {
-    PIIX3State *piix3 = opaque;
+    PIIXState *piix3 = opaque;
     int pirq;
 
     /*
@@ -221,7 +221,7 @@ static int piix3_post_load(void *opaque, int version_id)
 static int piix3_pre_save(void *opaque)
 {
     int i;
-    PIIX3State *piix3 = opaque;
+    PIIXState *piix3 = opaque;
 
     for (i = 0; i < ARRAY_SIZE(piix3->pci_irq_levels_vmstate); i++) {
         piix3->pci_irq_levels_vmstate[i] =
@@ -233,7 +233,7 @@ static int piix3_pre_save(void *opaque)
 
 static bool piix3_rcr_needed(void *opaque)
 {
-    PIIX3State *piix3 = opaque;
+    PIIXState *piix3 = opaque;
 
     return (piix3->rcr != 0);
 }
@@ -244,7 +244,7 @@ static const VMStateDescription vmstate_piix3_rcr = {
     .minimum_version_id = 1,
     .needed = piix3_rcr_needed,
     .fields = (VMStateField[]) {
-        VMSTATE_UINT8(rcr, PIIX3State),
+        VMSTATE_UINT8(rcr, PIIXState),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -256,8 +256,8 @@ static const VMStateDescription vmstate_piix3 = {
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
@@ -270,7 +270,7 @@ static const VMStateDescription vmstate_piix3 = {
 
 static void rcr_write(void *opaque, hwaddr addr, uint64_t val, unsigned len)
 {
-    PIIX3State *d = opaque;
+    PIIXState *d = opaque;
 
     if (val & 4) {
         qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
@@ -281,7 +281,7 @@ static void rcr_write(void *opaque, hwaddr addr, uint64_t val, unsigned len)
 
 static uint64_t rcr_read(void *opaque, hwaddr addr, unsigned len)
 {
-    PIIX3State *d = opaque;
+    PIIXState *d = opaque;
 
     return d->rcr;
 }
@@ -298,7 +298,7 @@ static const MemoryRegionOps rcr_ops = {
 
 static void pci_piix3_realize(PCIDevice *dev, Error **errp)
 {
-    PIIX3State *d = PIIX3_PCI_DEVICE(dev);
+    PIIXState *d = PIIX_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
     ISABus *isa_bus;
 
@@ -373,7 +373,7 @@ static void build_pci_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
 
 static void pci_piix3_init(Object *obj)
 {
-    PIIX3State *d = PIIX3_PCI_DEVICE(obj);
+    PIIXState *d = PIIX_PCI_DEVICE(obj);
 
     object_initialize_child(obj, "pic", &d->pic, TYPE_ISA_PIC);
     object_initialize_child(obj, "rtc", &d->rtc, TYPE_MC146818_RTC);
@@ -381,14 +381,14 @@ static void pci_piix3_init(Object *obj)
 }
 
 static Property pci_piix_props[] = {
-    DEFINE_PROP_UINT32("smb_io_base", PIIX3State, smb_io_base, 0),
-    DEFINE_PROP_UINT8("pirqa", PIIX3State, pci_irq_reset_mappings[0], 0x80),
-    DEFINE_PROP_UINT8("pirqb", PIIX3State, pci_irq_reset_mappings[1], 0x80),
-    DEFINE_PROP_UINT8("pirqc", PIIX3State, pci_irq_reset_mappings[2], 0x80),
-    DEFINE_PROP_UINT8("pirqd", PIIX3State, pci_irq_reset_mappings[3], 0x80),
-    DEFINE_PROP_BOOL("has-acpi", PIIX3State, has_acpi, true),
-    DEFINE_PROP_BOOL("has-usb", PIIX3State, has_usb, true),
-    DEFINE_PROP_BOOL("smm-enabled", PIIX3State, smm_enabled, false),
+    DEFINE_PROP_UINT32("smb_io_base", PIIXState, smb_io_base, 0),
+    DEFINE_PROP_UINT8("pirqa", PIIXState, pci_irq_reset_mappings[0], 0x80),
+    DEFINE_PROP_UINT8("pirqb", PIIXState, pci_irq_reset_mappings[1], 0x80),
+    DEFINE_PROP_UINT8("pirqc", PIIXState, pci_irq_reset_mappings[2], 0x80),
+    DEFINE_PROP_UINT8("pirqd", PIIXState, pci_irq_reset_mappings[3], 0x80),
+    DEFINE_PROP_BOOL("has-acpi", PIIXState, has_acpi, true),
+    DEFINE_PROP_BOOL("has-usb", PIIXState, has_usb, true),
+    DEFINE_PROP_BOOL("smm-enabled", PIIXState, smm_enabled, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -418,7 +418,7 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
 static const TypeInfo piix3_pci_type_info = {
     .name = TYPE_PIIX3_PCI_DEVICE,
     .parent = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(PIIX3State),
+    .instance_size = sizeof(PIIXState),
     .instance_init = pci_piix3_init,
     .abstract = true,
     .class_init = pci_piix3_class_init,
@@ -432,7 +432,7 @@ static const TypeInfo piix3_pci_type_info = {
 static void piix3_realize(PCIDevice *dev, Error **errp)
 {
     ERRP_GUARD();
-    PIIX3State *piix3 = PIIX3_PCI_DEVICE(dev);
+    PIIXState *piix3 = PIIX_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
 
     pci_piix3_realize(dev, errp);
@@ -462,7 +462,7 @@ static const TypeInfo piix3_info = {
 static void piix3_xen_realize(PCIDevice *dev, Error **errp)
 {
     ERRP_GUARD();
-    PIIX3State *piix3 = PIIX3_PCI_DEVICE(dev);
+    PIIXState *piix3 = PIIX_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
 
     pci_piix3_realize(dev, errp);
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index ae3b49fe93..c9fa0f1aa6 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -73,10 +73,10 @@ struct PIIXState {
     bool has_usb;
     bool smm_enabled;
 };
-typedef struct PIIXState PIIX3State;
+typedef struct PIIXState PIIXState;
 
 #define TYPE_PIIX3_PCI_DEVICE "pci-piix3"
-DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
+DECLARE_INSTANCE_CHECKER(PIIXState, PIIX_PCI_DEVICE,
                          TYPE_PIIX3_PCI_DEVICE)
 
 #define TYPE_PIIX3_DEVICE "PIIX3"
-- 
2.37.3


