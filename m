Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C37CE69376A
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 13:46:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRBhx-0004RX-Lt; Sun, 12 Feb 2023 07:43:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRBdJ-0007hA-LP; Sun, 12 Feb 2023 07:39:06 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRBdG-0001Os-34; Sun, 12 Feb 2023 07:39:03 -0500
Received: by mail-ej1-x62c.google.com with SMTP id jg8so25874500ejc.6;
 Sun, 12 Feb 2023 04:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vS4fiiZDks/dbp0gPulU0+AsgMHa5mE2NpcB1Q8zw0o=;
 b=D5lqXZIiUjbp2pMj/vAdrjHL22iwUJ+CDEBPeR8PsQP1v7KArW73E8tsMgWY/nyUXn
 7O4SyP4AmR4qNpzv7tvSsb9RcMfO/uvhqf/7NdMPvBeFq+/TlV0dc8k2ssE6rxODK+G/
 C6Zsv5HSReMdXYXJZPH5dbjl/x8hLtO/6t1pAug88k/5Nfw/OE0O3YrWSygaoZbFCfoK
 QjDok3SLXqp8rC+l3KDWewoeIWP+5mVQRpZ7rJIaGP3qoRyIsRXeIBfGR5ai5qgotQ0I
 R7Rbt3iEEmAzikc+KH6cZsudyIZSwesSKwuyMIda808c8a9Z90TVN+cgN1w0VmVtFfUk
 /XdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vS4fiiZDks/dbp0gPulU0+AsgMHa5mE2NpcB1Q8zw0o=;
 b=gkFRwCfkKaytBteJDOmgLxto3as8ZVvV8HAFBjLY0iSjQqYddgGvo6ygKmC7+Nha1q
 XvmyxMmdHK1VGb1fcZ7f3K9zJUEd4JhOM5+S4SBnhK22DlYycJ2KIOBTfdYqa3q/h3L8
 NlJsIDeUY6zhoSsCMW2wsZV34hJowoIZsfw0G0UTYod1OD7sV4p5mJ9Avj9oXEv1YnHx
 LlYMMDXCYYlUyvQC+cgCrL7PhQWYrWqqQeAU1952wmsLAxZQX4p9Ter/6QM9jQmn551+
 pSvZ/FhiIAIxtUZ8cY5F8ryoAK6dPDSJ/4w4Y1N2V99bCXNWuTkU31/Q4D+kd+sm71xf
 e7ow==
X-Gm-Message-State: AO0yUKWgYQKZxq+35hT6p/NiLLp/ftBMeF/NZ35uU+XlV/Xwojqu2any
 bWhTBIdN0KS5tQcdQBtwZ6K5sqroex0=
X-Google-Smtp-Source: AK7set8ZmoY9fngwxbqjkCYzSrFRMq9nVgpFQcEQwERDUetDiVbsjG5+lPdzLkjKlXlhwJLuv1vZUA==
X-Received: by 2002:a17:907:c683:b0:887:d0e6:fa28 with SMTP id
 ue3-20020a170907c68300b00887d0e6fa28mr23477383ejc.1.1676205539494; 
 Sun, 12 Feb 2023 04:38:59 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-011-172-153.77.11.pool.telefonica.de. [77.11.172.153])
 by smtp.gmail.com with ESMTPSA id
 qw14-20020a170906fcae00b008af1f1bee79sm5233164ejb.9.2023.02.12.04.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 04:38:59 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-arm@nongnu.org, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-ppc@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v7 15/23] hw/isa/piix4: Reuse struct PIIXState from PIIX3
Date: Sun, 12 Feb 2023 13:37:57 +0100
Message-Id: <20230212123805.30799-16-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230212123805.30799-1-shentey@gmail.com>
References: <20230212123805.30799-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
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
index d04b08357a..9619b08817 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -50,6 +50,7 @@ struct PIIXState {
 #endif
     uint64_t pic_levels;
 
+    qemu_irq cpu_intr;
     qemu_irq *pic;
 
     /* This member isn't used. Just for save/load compatibility */
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 9edaa5de3e..df22c81cc2 100644
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
-    isa_bus_irqs(isa_bus, s->isa);
+    isa_bus_irqs(isa_bus, s->pic);
 
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
2.39.1


