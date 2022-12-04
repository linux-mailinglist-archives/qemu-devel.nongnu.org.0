Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E78641F14
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 20:09:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1uLN-000299-Hu; Sun, 04 Dec 2022 14:08:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uLH-00025h-96; Sun, 04 Dec 2022 14:07:59 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uLF-0001gV-KZ; Sun, 04 Dec 2022 14:07:59 -0500
Received: by mail-ej1-x62d.google.com with SMTP id vp12so23071454ejc.8;
 Sun, 04 Dec 2022 11:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CLbea0eRm68E2OkRszy+B9fYD0xummejhGMyYqUKMwQ=;
 b=fsdsY8nupUHTJO+qQJBCqzPwVfcE/RJFJwqIuIRk2RrJm/R5lZJkQeRM0GWdCVHFik
 hgWKya1vQLfJBRkiwIcmWK+rH+QgIEwvhhE0p4CPFGd8+yLwpXNZ6PZmAKesQjd6SfX9
 MKguDZAUC+s1E/ibQxrP1Jg81hUoExKHx83pp9hvxfFZJQ42tYJpXXRBDXpBXCQfe5pO
 OVNLi2JTF8HCWhWr+qrAP9Syt918UNUBZQODdwCHAhSX0IlBuiCpitgHulCAZ5K8ypfv
 H8fR2n7OZiZhuloCn4txT7XTgb6qwX2BkSoKfgAAOjfJBa5Nz0ejnpNumZzP3W9J9+TQ
 IB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CLbea0eRm68E2OkRszy+B9fYD0xummejhGMyYqUKMwQ=;
 b=D50/Vo7hAXyXaKzgiE2H1UYBlY70lfm2NXARDrJtjzx6ReVtwBoOwtOLw9UsuYjHK0
 /tTNzAkWsQ8JV3i1q7NZOi0nHTPzJZiqmZfivbOuHVb378VWxJr4ZErh4cLeDAuOEIHV
 Vs7dAikk7VOlFzmt+Rg7BBtc/bnHB/aAJyWjR44meFjED4TM7hm4D0ipD++xE1ZeUFVa
 KVWrHs0MeX/ULLazcAYwjZRtpW+yA4rx4m+ySjw3dFDQkqLqwvpH3veIVnRWQZW4grq/
 WXOfn8Sa0BXMkkZWNFjzbIRn+qLuC+AZP1htTVjyRL4O2NJEb/GT8Q5MBlcumarIArXz
 8inA==
X-Gm-Message-State: ANoB5pkdEHcKKmoqMmU7jVKhRvC1abe6KhT16xozUbFvDB3sSkKLKQGb
 7usvJha3Ma7etxew4/r/8aSARMnTmBI=
X-Google-Smtp-Source: AA0mqf5r94LOSQrUhfF48xJ1qa3HgHAE5+I95PbhCe1Kgh3nNH0eKIEV4RdlMrQwASTShlYW23QQyg==
X-Received: by 2002:a17:906:ae4c:b0:7c0:cc80:8eba with SMTP id
 lf12-20020a170906ae4c00b007c0cc808ebamr7541992ejb.576.1670180874186; 
 Sun, 04 Dec 2022 11:07:54 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-089-012-182-051.89.12.pool.telefonica.de. [89.12.182.51])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a17090623ea00b00782ee6b34f2sm5359835ejg.183.2022.12.04.11.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 11:07:53 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 20/32] hw/isa/piix4: Make PIIX4's ACPI and USB functions
 optional
Date: Sun,  4 Dec 2022 20:05:41 +0100
Message-Id: <20221204190553.3274-21-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221204190553.3274-1-shentey@gmail.com>
References: <20221204190553.3274-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
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

This aligns PIIX4 with PIIX3.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Message-Id: <20221022150508.26830-30-shentey@gmail.com>
---
 hw/isa/piix4.c  | 44 ++++++++++++++++++++++++++++++++------------
 hw/mips/malta.c |  6 ++++--
 2 files changed, 36 insertions(+), 14 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index aceb21ee3e..24d943c609 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -51,9 +51,16 @@ struct PIIX4State {
     PCIIDEState ide;
     UHCIState uhci;
     PIIX4PMState pm;
+
+    uint32_t smb_io_base;
+
     /* Reset Control Register */
     MemoryRegion rcr_mem;
     uint8_t rcr;
+
+    bool has_acpi;
+    bool has_usb;
+    bool smm_enabled;
 };
 
 OBJECT_DECLARE_SIMPLE_TYPE(PIIX4State, PIIX4_PCI_DEVICE)
@@ -259,17 +266,26 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     }
 
     /* USB */
-    qdev_prop_set_int32(DEVICE(&s->uhci), "addr", dev->devfn + 2);
-    if (!qdev_realize(DEVICE(&s->uhci), BUS(pci_bus), errp)) {
-        return;
+    if (s->has_usb) {
+        object_initialize_child(OBJECT(dev), "uhci", &s->uhci,
+                                TYPE_PIIX4_USB_UHCI);
+        qdev_prop_set_int32(DEVICE(&s->uhci), "addr", dev->devfn + 2);
+        if (!qdev_realize(DEVICE(&s->uhci), BUS(pci_bus), errp)) {
+            return;
+        }
     }
 
     /* ACPI controller */
-    qdev_prop_set_int32(DEVICE(&s->pm), "addr", dev->devfn + 3);
-    if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
-        return;
+    if (s->has_acpi) {
+        object_initialize_child(OBJECT(s), "pm", &s->pm, TYPE_PIIX4_PM);
+        qdev_prop_set_int32(DEVICE(&s->pm), "addr", dev->devfn + 3);
+        qdev_prop_set_uint32(DEVICE(&s->pm), "smb_io_base", s->smb_io_base);
+        qdev_prop_set_bit(DEVICE(&s->pm), "smm-enabled", s->smm_enabled);
+        if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
+            return;
+        }
+        qdev_connect_gpio_out(DEVICE(&s->pm), 0, s->isa[9]);
     }
-    qdev_connect_gpio_out(DEVICE(&s->pm), 0, s->isa[9]);
 
     pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM_PIRQS);
 }
@@ -280,13 +296,16 @@ static void piix4_init(Object *obj)
 
     object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
     object_initialize_child(obj, "ide", &s->ide, TYPE_PIIX4_IDE);
-    object_initialize_child(obj, "uhci", &s->uhci, TYPE_PIIX4_USB_UHCI);
-
-    object_initialize_child(obj, "pm", &s->pm, TYPE_PIIX4_PM);
-    qdev_prop_set_uint32(DEVICE(&s->pm), "smb_io_base", 0x1100);
-    qdev_prop_set_bit(DEVICE(&s->pm), "smm-enabled", 0);
 }
 
+static Property piix4_props[] = {
+    DEFINE_PROP_UINT32("smb_io_base", PIIX4State, smb_io_base, 0),
+    DEFINE_PROP_BOOL("has-acpi", PIIX4State, has_acpi, true),
+    DEFINE_PROP_BOOL("has-usb", PIIX4State, has_usb, true),
+    DEFINE_PROP_BOOL("smm-enabled", PIIX4State, smm_enabled, false),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void piix4_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -305,6 +324,7 @@ static void piix4_class_init(ObjectClass *klass, void *data)
      */
     dc->user_creatable = false;
     dc->hotpluggable = false;
+    device_class_set_props(dc, piix4_props);
 }
 
 static const TypeInfo piix4_info = {
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index c3dcd43f37..4d0251ee12 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1422,8 +1422,10 @@ void mips_malta_init(MachineState *machine)
     empty_slot_init("GT64120", 0, 0x20000000);
 
     /* Southbridge */
-    piix4 = pci_create_simple_multifunction(pci_bus, PIIX4_PCI_DEVFN, true,
-                                            TYPE_PIIX4_PCI_DEVICE);
+    piix4 = pci_new_multifunction(PIIX4_PCI_DEVFN, true,
+                                  TYPE_PIIX4_PCI_DEVICE);
+    qdev_prop_set_uint32(DEVICE(piix4), "smb_io_base", 0x1100);
+    pci_realize_and_unref(piix4, pci_bus, &error_fatal);
     isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix4), "isa.0"));
 
     dev = DEVICE(object_resolve_path_component(OBJECT(piix4), "ide"));
-- 
2.38.1


