Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EBA5A9DB1
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 19:05:53 +0200 (CEST)
Received: from localhost ([::1]:35070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTndX-00056p-Vy
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 13:05:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2P-0002Ne-Ld
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:30 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:38604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2J-0001YB-GI
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:27 -0400
Received: by mail-ed1-x52a.google.com with SMTP id a36so19485743edf.5
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 09:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=I53kXzOewMUSv21s1gd8I4HE4s8WT5KVfscPhYxO19A=;
 b=CM26PMiVnWUeGD2Rp0y1nbNIrYCBJndNiOiiCFng6RFWGdcXdCh/1l0QH7WnQDwXy2
 F3dX90MA9URYhZJjFtddTQgb9rEeO7iAlrY2f/N9tpJym+bN6F6vB1jzC1RJX7l+TAZg
 donrfUA8kyYue1tkSy5qHrKt+J0dbdeK/FfLS0YWdhQ2eesI5zGBrWs7SwKFULfTUlNR
 ISRPz6KzJ9J6Y0gNyMUyuFfIzXaN12fLnSaazC5+m9jT89JB8x8z7lIlIyPuD8E4XpIg
 5N/It3Rg0OCyu+KklkeSybLxmANzBPRqUK89ru5NhJ4mVLSI6wQPRt0fYIOvfKadJYUr
 sYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=I53kXzOewMUSv21s1gd8I4HE4s8WT5KVfscPhYxO19A=;
 b=XMdE5AhpiNLREV5NGySvIYkuiQJxD1WHi5eW27hv8h57Bk1jiRZnB4/sySRgh4NNJa
 zLNWxVxdYgvlokK0iOE+TWDDDN0AUSOgwoGB+O54bsa9qALQsCNQ3RoeOckaXldwJpMu
 F13iOlJDyHk6eqc3/EZ9jYxaS1TfkSOjuK2J87PIPVKrfFl8COsxZ4ujrjIADu/Cj+qu
 NDkzNad0e5b0fU3iBQOL/xQ5UE+heGKT0Qai0okjMg6Sq6M0WvcaSGMZA9uM2Tu8O0WF
 4HDE2boSX2gewfGg1gpHyc4TWI2B4Btq6l2Wre30WTBeG9Row6Hm8F+gvlyiGgCIRFTe
 O9MA==
X-Gm-Message-State: ACgBeo0Ny7+0HvfceUKHdSTh7YwzwGYFQMqrzqQjMKhPNoLRRLfPAwRk
 JmhUjOIEtUIPaodDB7s2Y4smJbV6n78=
X-Google-Smtp-Source: AA6agR7CjXT0awGmEjnky9BgPu2YPkPjpj7EZVi1kkfFDwrvgq5zAqzJxgzrU2bloVm2+5HC1nndIg==
X-Received: by 2002:a50:ee0f:0:b0:447:f097:aef with SMTP id
 g15-20020a50ee0f000000b00447f0970aefmr25262582eds.20.1662049640975; 
 Thu, 01 Sep 2022 09:27:20 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa7d306000000b00447c0dcbb99sm1587672edq.83.2022.09.01.09.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 09:27:20 -0700 (PDT)
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
Subject: [PATCH 30/42] hw/isa/piix4: Reuse struct PIIXState from PIIX3
Date: Thu,  1 Sep 2022 18:26:01 +0200
Message-Id: <20220901162613.6939-31-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901162613.6939-1-shentey@gmail.com>
References: <20220901162613.6939-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52a.google.com
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

Now that PIIX4 also uses the "isa-pic" proxy, both implementations
can share the same struct.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix4.c | 61 ++++++++++++++++----------------------------------
 1 file changed, 19 insertions(+), 42 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 128284bd0a..95e4a9f3c1 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -41,34 +41,10 @@
 #include "sysemu/runstate.h"
 #include "qom/object.h"
 
-struct PIIX4State {
-    PCIDevice dev;
-
-    ISAPICState pic;
-    RTCState rtc;
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
-    uint8_t pci_irq_reset_mappings[PIIX_NUM_PIRQS];
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
@@ -113,7 +89,7 @@ static int pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
 
 static void piix4_isa_reset(DeviceState *dev)
 {
-    PIIX4State *d = PIIX4_PCI_DEVICE(dev);
+    PIIXState *d = PIIX_PCI_DEVICE(dev);
     uint8_t *pci_conf = d->dev.config;
 
     pci_conf[0x04] = 0x07; // master, memory and I/O
@@ -148,12 +124,13 @@ static void piix4_isa_reset(DeviceState *dev)
     pci_conf[0xac] = 0x00;
     pci_conf[0xae] = 0x00;
 
+    d->pic_levels = 0; /* not used in PIIX4 */
     d->rcr = 0;
 }
 
 static int piix4_ide_post_load(void *opaque, int version_id)
 {
-    PIIX4State *s = opaque;
+    PIIXState *s = opaque;
 
     if (version_id == 2) {
         s->rcr = 0;
@@ -168,8 +145,8 @@ static const VMStateDescription vmstate_piix4 = {
     .minimum_version_id = 2,
     .post_load = piix4_ide_post_load,
     .fields = (VMStateField[]) {
-        VMSTATE_PCI_DEVICE(dev, PIIX4State),
-        VMSTATE_UINT8_V(rcr, PIIX4State, 3),
+        VMSTATE_PCI_DEVICE(dev, PIIXState),
+        VMSTATE_UINT8_V(rcr, PIIXState, 3),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -177,7 +154,7 @@ static const VMStateDescription vmstate_piix4 = {
 static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,
                             unsigned int len)
 {
-    PIIX4State *s = opaque;
+    PIIXState *s = opaque;
 
     if (val & 4) {
         qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
@@ -189,7 +166,7 @@ static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,
 
 static uint64_t piix4_rcr_read(void *opaque, hwaddr addr, unsigned int len)
 {
-    PIIX4State *s = opaque;
+    PIIXState *s = opaque;
 
     return s->rcr;
 }
@@ -206,7 +183,7 @@ static const MemoryRegionOps piix4_rcr_ops = {
 
 static void piix4_realize(PCIDevice *dev, Error **errp)
 {
-    PIIX4State *s = PIIX4_PCI_DEVICE(dev);
+    PIIXState *s = PIIX_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
     ISABus *isa_bus;
 
@@ -276,7 +253,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
 
 static void piix4_init(Object *obj)
 {
-    PIIX4State *s = PIIX4_PCI_DEVICE(obj);
+    PIIXState *s = PIIX_PCI_DEVICE(obj);
 
     object_initialize_child(obj, "pic", &s->pic, TYPE_ISA_PIC);
     object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
@@ -284,14 +261,14 @@ static void piix4_init(Object *obj)
 }
 
 static Property piix4_props[] = {
-    DEFINE_PROP_UINT32("smb_io_base", PIIX4State, smb_io_base, 0),
-    DEFINE_PROP_UINT8("pirqa", PIIX4State, pci_irq_reset_mappings[0], 0x80),
-    DEFINE_PROP_UINT8("pirqb", PIIX4State, pci_irq_reset_mappings[1], 0x80),
-    DEFINE_PROP_UINT8("pirqc", PIIX4State, pci_irq_reset_mappings[2], 0x80),
-    DEFINE_PROP_UINT8("pirqd", PIIX4State, pci_irq_reset_mappings[3], 0x80),
-    DEFINE_PROP_BOOL("has-acpi", PIIX4State, has_acpi, true),
-    DEFINE_PROP_BOOL("has-usb", PIIX4State, has_usb, true),
-    DEFINE_PROP_BOOL("smm-enabled", PIIX4State, smm_enabled, false),
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
 
@@ -319,7 +296,7 @@ static void piix4_class_init(ObjectClass *klass, void *data)
 static const TypeInfo piix4_info = {
     .name          = TYPE_PIIX4_PCI_DEVICE,
     .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(PIIX4State),
+    .instance_size = sizeof(PIIXState),
     .instance_init = piix4_init,
     .class_init    = piix4_class_init,
     .interfaces = (InterfaceInfo[]) {
-- 
2.37.3


