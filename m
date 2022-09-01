Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C37435A9D89
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 18:53:20 +0200 (CEST)
Received: from localhost ([::1]:41822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTnRP-0004Ny-VV
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 12:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2N-0002K1-S6
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:28 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:35460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2C-0001Tm-B9
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:26 -0400
Received: by mail-ej1-x62b.google.com with SMTP id og21so35829985ejc.2
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 09:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=oQBXM0jZm/4vrXDCw0I1YhZPppOIT89c2uqndTrQlA4=;
 b=MGsEW5UzfYlINgMdqdb8IyP2eWdB2pVPEhderaoyHdIk+/BQ8+hUScc5Qa8zD8szOH
 ugh6LTZ4oGfJIyd6jZ7qVwBmL+l1BhlXDaIGo82EzBCdRP/Kk5eZO8qIq8Q1+zlSUymO
 LOVxzO5rTee5D1AeZsnjjYjBXBwKoNQ9APbqdYEh4XLXJVgYyRJ4KdmcgLIionz086RD
 djSMaguiWkBoRDH4XDLva8Kn+SL9hVVIJWJL9TYiRinB4z3ffBzxOueqzDzreDne0ffY
 VXmPB4KpmboB8Kapp6jWxdV/KrYnE+Mv2rYpS7buXKZxtRi+fYenhjfNtIrosjNrK3d8
 JvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=oQBXM0jZm/4vrXDCw0I1YhZPppOIT89c2uqndTrQlA4=;
 b=RDHtIhuXM1vPPaULtlIbZhndRvdcYDTMTrVf+eysd4FJNqEWvDoj6Uwyhlisr3OcIY
 gxmgG6Zn3F7I8KK8k1oZhYzdpZMgvF4i32PRPDUmmxZzFih7rt1eG8UvMjYvU07Awy9E
 4ZwDXmiVjZKEGYEqccWuUzWsKmkuO81N2ksJtGuIo12uL5L6x16g67t8hQa5szL2Vrmt
 HIk63NrrPC4SGq2xDYRaWOtr5qhUnwxm1/xVYkQ/nUO3GF2HVvdvvqiSaELlxepwrvVu
 AWukDGitCT3IKEyjp7Q5DeLILQLEyeNA2xb8xzYVWHCFza0Z6PCBbg20M6dof1G3awaz
 P3GA==
X-Gm-Message-State: ACgBeo3Cu4yUtTDJ8qpblxwcQ/Y7jT0vgFedKhi7JOAK6mNdaUTefw7C
 gKyWLAN5EmhU2tLaS8tkhxBbg8d6Xf4=
X-Google-Smtp-Source: AA6agR64Dnwmf9+SRYaK5Sn1CqiRNd0TxUpnim/dmpKAmoCdanoIgKl1b10YRRZ+tS3b4iO7mqrTUw==
X-Received: by 2002:a17:907:7b8e:b0:741:5903:9307 with SMTP id
 ne14-20020a1709077b8e00b0074159039307mr17057688ejc.201.1662049632519; 
 Thu, 01 Sep 2022 09:27:12 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa7d306000000b00447c0dcbb99sm1587672edq.83.2022.09.01.09.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 09:27:12 -0700 (PDT)
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
Subject: [PATCH 26/42] hw/isa/piix4: Make PIIX4's ACPI and USB functions
 optional
Date: Thu,  1 Sep 2022 18:25:57 +0200
Message-Id: <20220901162613.6939-27-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901162613.6939-1-shentey@gmail.com>
References: <20220901162613.6939-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
index 67881e3a75..ed9eca715f 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -50,9 +50,16 @@ struct PIIX4State {
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
@@ -258,17 +265,26 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     }
 
     /* USB */
-    qdev_prop_set_int32(DEVICE(&s->uhci), "addr", dev->devfn + 2);
-    if (!qdev_realize(DEVICE(&s->uhci), BUS(pci_bus), errp)) {
-        return;
+    if (s->has_usb) {
+        object_initialize_child(OBJECT(dev), "uhci", &s->uhci,
+                                "piix4-usb-uhci");
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
@@ -279,13 +295,16 @@ static void piix4_init(Object *obj)
 
     object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
     object_initialize_child(obj, "ide", &s->ide, "piix4-ide");
-    object_initialize_child(obj, "uhci", &s->uhci, "piix4-usb-uhci");
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
@@ -304,6 +323,7 @@ static void piix4_class_init(ObjectClass *klass, void *data)
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
2.37.3


