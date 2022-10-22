Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2445609690
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Oct 2022 23:35:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omhbw-00017n-9T
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 16:30:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5m-0007Nm-6E; Sat, 22 Oct 2022 11:07:18 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5k-0002KU-Gc; Sat, 22 Oct 2022 11:07:18 -0400
Received: by mail-ed1-x530.google.com with SMTP id r14so16114072edc.7;
 Sat, 22 Oct 2022 08:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z07minTOk1rXwVjB17CSKw9aYv/B+jQfGu8WS6wTJWg=;
 b=cP0eJIcab0+VCXZY4ukh72cPLXr/JviZjSWf8OkMqaldJujSTDKrdH1j/B/jYRvxfB
 NWlLO/1T4EuSYjmhilosc3m6XtuEBfzhyS1wb7bbq5iMMbZt8DeVHh1zpRgmMN5CVBLO
 1wMw0w6zSHpYXo+Rn896sYy5nT+37XGCABE0fXbZpIcFZxxCCXrS9JiAheOKT+hsjGNI
 pHMSCFGzW/xJb3YDRnq7k47izQaLe03L6eUPr5FPLSx3eA6WIVBMHy7eUu44umNAvhXW
 XWkc5+jg9sEDA6NehNmZjQ0Oe80r0LX88tWDxLLfEEsswanXtXxsGF2d4wUCiNP3jpUT
 qxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z07minTOk1rXwVjB17CSKw9aYv/B+jQfGu8WS6wTJWg=;
 b=vb/pc2JJ0yRGFjlxGqP8xoz4v5yUMakm74RM/xwA58R1smqPLrwRIdTRrZSqjsQWfN
 4zTIQJ6+g0vhcFRKn+h1a3+ha8A7zoR+/Vx/axs4g6G3iYmNnadCSl+jUt4iUjLssboS
 t0puWh5orHImKKE55fmwoKWDxgtRCERbOrRk2qvWbGVQqRLY3smOLupkiHB3L4DDVK9S
 TEpJl+52I/jhuUK+SAL/zrCJNZ6dEGciPXQ43ldOThtAM2+WHL9xtXc/lYwFwAUuFPfz
 PrK0pq2qZgCZ+PoqUN7TjheEVGSxiimFWAdgbgyiQmL2HeIQA1uQxoQHRjenS6IWETJr
 AFpw==
X-Gm-Message-State: ACrzQf3TsXTb+cwrHQ6kQzAHf0ly3qaaH1o3q1Ddg5amQn2ibDrmt9tK
 7CSjJm/bXQv9vNyWKJOTiOWufKNSHaGUtg==
X-Google-Smtp-Source: AMsMyM5JM+aRrdSGWQmWkIo4TbASwgvoEELIt2cusXku3doUm4H2mZidbwWzjHf6FP4hsNWo7RD6GQ==
X-Received: by 2002:a05:6402:5cd:b0:446:5965:f4af with SMTP id
 n13-20020a05640205cd00b004465965f4afmr22290336edx.12.1666451235043; 
 Sat, 22 Oct 2022 08:07:15 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-171-138.77.191.pool.telefonica.de. [77.191.171.138])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00780ab5a9116sm13021558ejx.211.2022.10.22.08.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:07:14 -0700 (PDT)
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
Subject: [PATCH v2 33/43] hw/isa/piix4: Reuse struct PIIXState from PIIX3
Date: Sat, 22 Oct 2022 17:04:58 +0200
Message-Id: <20221022150508.26830-34-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221022150508.26830-1-shentey@gmail.com>
References: <20221022150508.26830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x530.google.com
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

Now that PIIX4 also uses the "isa-pic" proxy, both implementations
can share the same struct.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix4.c | 61 ++++++++++++++++----------------------------------
 1 file changed, 19 insertions(+), 42 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 8ddff23116..a7d52c5294 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -42,34 +42,10 @@
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
@@ -114,7 +90,7 @@ static int pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
 
 static void piix4_isa_reset(DeviceState *dev)
 {
-    PIIX4State *d = PIIX4_PCI_DEVICE(dev);
+    PIIXState *d = PIIX_PCI_DEVICE(dev);
     uint8_t *pci_conf = d->dev.config;
 
     pci_conf[0x04] = 0x07; // master, memory and I/O
@@ -149,12 +125,13 @@ static void piix4_isa_reset(DeviceState *dev)
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
@@ -169,8 +146,8 @@ static const VMStateDescription vmstate_piix4 = {
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
@@ -178,7 +155,7 @@ static const VMStateDescription vmstate_piix4 = {
 static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,
                             unsigned int len)
 {
-    PIIX4State *s = opaque;
+    PIIXState *s = opaque;
 
     if (val & 4) {
         qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
@@ -190,7 +167,7 @@ static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,
 
 static uint64_t piix4_rcr_read(void *opaque, hwaddr addr, unsigned int len)
 {
-    PIIX4State *s = opaque;
+    PIIXState *s = opaque;
 
     return s->rcr;
 }
@@ -207,7 +184,7 @@ static const MemoryRegionOps piix4_rcr_ops = {
 
 static void piix4_realize(PCIDevice *dev, Error **errp)
 {
-    PIIX4State *s = PIIX4_PCI_DEVICE(dev);
+    PIIXState *s = PIIX_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
     ISABus *isa_bus;
 
@@ -277,7 +254,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
 
 static void piix4_init(Object *obj)
 {
-    PIIX4State *s = PIIX4_PCI_DEVICE(obj);
+    PIIXState *s = PIIX_PCI_DEVICE(obj);
 
     object_initialize_child(obj, "pic", &s->pic, TYPE_ISA_PIC);
     object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
@@ -285,14 +262,14 @@ static void piix4_init(Object *obj)
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
 
@@ -320,7 +297,7 @@ static void piix4_class_init(ObjectClass *klass, void *data)
 static const TypeInfo piix4_info = {
     .name          = TYPE_PIIX4_PCI_DEVICE,
     .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(PIIX4State),
+    .instance_size = sizeof(PIIXState),
     .instance_init = piix4_init,
     .class_init    = piix4_class_init,
     .interfaces = (InterfaceInfo[]) {
-- 
2.38.1


