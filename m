Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AEF60975B
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 01:52:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omhVG-0008TE-Ec
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 16:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5c-0007Km-FZ; Sat, 22 Oct 2022 11:07:08 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5a-0002KU-Sh; Sat, 22 Oct 2022 11:07:08 -0400
Received: by mail-ed1-x530.google.com with SMTP id r14so16113023edc.7;
 Sat, 22 Oct 2022 08:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RTpOClvzPkztIRM/jCrquvIhowaJtx1x6Tz2AKs9S08=;
 b=QtFDbeU2bIQTKLHhGIt2xG7WxEclU/xAgo0tHaWHYbOsx0/FwAWxuynwst6AUzUk4g
 Xgrdjd8xyEiXfFnMv0nHnGzkqvYUeIhRXz7zYAQEhCN63tGQ4pFRMbFDgm0T57ssssFk
 gLiQuZZcf2dGH1vXfrTAfagZ9xCxwdZxBVCUAZbNCu8Gu7D6+2w5yXUpNDDJObx7yYMI
 bQ6mCKLPd/5BNdLYp5pahFz96si9rKfBxlq+7XDlWhtP+kT0Y5boF6d9UPBpUN2GFhlB
 0wVEKMCpXV3Q9wcLUd+NTPIGc7pNJDzZnzQcelp4wIcwMwNnjapaDyd2CvHFSIxVx7e5
 DJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RTpOClvzPkztIRM/jCrquvIhowaJtx1x6Tz2AKs9S08=;
 b=cXavJpLHE29KKPOujAR6JR9mBvLgZwsdWyKfqUUsUt9gJMFGnJsbnnF7ahXx+Q5CHS
 3tMgFwQ+mn6zPOoH+Lb0ZNpWKY5tIkIe06vpl19qg8Yrs5XblPhBBefziU51iQacBvEY
 ixmwCv7wsqYcHBbjbeOY8b/Vc/hDicKwmALkLUDRZmd0zXoKqAXxFIVadskh0SK7zHW3
 WvBnoSkWvGmEKFM/pA0FgUHjk0Ddsl2r+wUee+Yp2GXbLZsd2RK5sOyKJs8Y4aVv4qGR
 nJMIlx0rZ+d1c1UeZg2OHG/OQD3pnQpmS8TpWt0nG3XgQmiJw/BjGn9OYBci3vfyoAFQ
 miEQ==
X-Gm-Message-State: ACrzQf1jXEojTEoAo9ePhNw8iGqUvkKOUkG1c6HqB/Ro1rxWAQyeogDL
 t+29eftxzODedUMfnzNYLLY5AYwmurUA+Q==
X-Google-Smtp-Source: AMsMyM7o/B8hau+TbKqv08DNbI6Ka6naoRw/s118aNDHgFpLyFzzy5JQTSSEwvZN3mC3xScVgyBQEg==
X-Received: by 2002:a17:907:3ea9:b0:78d:fdf0:88fe with SMTP id
 hs41-20020a1709073ea900b0078dfdf088femr21046792ejc.667.1666451224953; 
 Sat, 22 Oct 2022 08:07:04 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-171-138.77.191.pool.telefonica.de. [77.191.171.138])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00780ab5a9116sm13021558ejx.211.2022.10.22.08.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:07:03 -0700 (PDT)
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
Subject: [PATCH v2 29/43] hw/isa/piix4: Make PIIX4's ACPI and USB functions
 optional
Date: Sat, 22 Oct 2022 17:04:54 +0200
Message-Id: <20221022150508.26830-30-shentey@gmail.com>
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

This aligns PIIX4 with PIIX3.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix4.c  | 44 ++++++++++++++++++++++++++++++++------------
 hw/mips/malta.c |  6 ++++--
 2 files changed, 36 insertions(+), 14 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index a7389ff193..fc698c23be 100644
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
index a4b866a2cf..6339b0d66c 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1400,8 +1400,10 @@ void mips_malta_init(MachineState *machine)
     empty_slot_init("GT64120", 0, 0x20000000);
 
     /* Southbridge */
-    piix4 = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0), true,
-                                            TYPE_PIIX4_PCI_DEVICE);
+    piix4 = pci_new_multifunction(PCI_DEVFN(10, 0), true,
+                                  TYPE_PIIX4_PCI_DEVICE);
+    qdev_prop_set_uint32(DEVICE(piix4), "smb_io_base", 0x1100);
+    pci_realize_and_unref(piix4, pci_bus, &error_fatal);
     isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix4), "isa.0"));
 
     dev = DEVICE(object_resolve_path_component(OBJECT(piix4), "ide"));
-- 
2.38.1


