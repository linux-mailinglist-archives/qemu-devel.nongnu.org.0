Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C222865347E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 18:02:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p82TC-00030T-0L; Wed, 21 Dec 2022 12:01:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82Sd-0002n8-Ea; Wed, 21 Dec 2022 12:00:57 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82Sb-0008CM-Iy; Wed, 21 Dec 2022 12:00:55 -0500
Received: by mail-ed1-x52f.google.com with SMTP id r26so22844034edc.10;
 Wed, 21 Dec 2022 09:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VwWKR1OMt4vLP6fqIL6c7wco4dMX9lc0xSkQTrYOIRU=;
 b=Wt/j2qzGLoPC55T/6DDO+S4yV0iDRwjovs1Z+CqfGwzrVo+Mo7kQZ8KFuT/J5mS3bW
 G8Yp3a/JMWSn6RuQhR6KnYTyXw67f9s4UjYMzAfrkePUr+WUQ+y6GCnlhAS6QMokxr1T
 V62f77UlmQE2stb5q1OTGLr5L7VM7s5l5TDNlmDfUMFf/mQMENC/9Tw2KCJGgEGyZAp5
 h+hFbpWt2tVlJoyKZV8zKVRAMPQqZrBAWqLZvgUo9MWKfzCJSADcpMOR2Dsow0RDwxIF
 DlmEfMZ8anJaNhKb90gdKfUqk2OS6B/Cf7A776jv+oqAoz6bXiL52OxhHB1MnVP1P1yU
 WTIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VwWKR1OMt4vLP6fqIL6c7wco4dMX9lc0xSkQTrYOIRU=;
 b=w95AC+YYmhjkjuxaNuBd2BdVXJAywaINcoOC+Sq3frQ1maB9u7AwAWsUDVyJAi/ECD
 j6nRk6yvs1bhxFSmOaBPM1pJbMVlX70po6PZbQxrOsvN5GUgWKm+8R4xKJeEqCJLCTwH
 qMcHa/0mtJ7QtMnyCpzmvd+v/z3tAh5hk1P4q2HstUTUhPYnGszju+ptjwA4S2XFbuDd
 1oHCT83CQdYGLeYreShfMqA51AnXJgLqtveEFU9SQJy6J8F5pZL0DKxUtKY4ITZXdx1p
 KAYG4umtyWy2BE5UxURyvb7sMaRcYxSqo4ZaTUcKN3HVwDDcmShmw9s6J7wcq//1tNTL
 ewsw==
X-Gm-Message-State: AFqh2kprmbREmj1cAI+9whiZ7qbO3XFJuyQT5DQ2qFwVzeVeUlJH1cSa
 1wT/7h3EznZ76w+8v9f7FGov3owwxSM=
X-Google-Smtp-Source: AMrXdXuMSwqQiabG38VaJTkkB1cTMyNENz7oQ4GLwIR06zu5D71+kzkL8mlpexMrw+NtPBT6X/iYrg==
X-Received: by 2002:a05:6402:5d6:b0:470:3762:2d83 with SMTP id
 n22-20020a05640205d600b0047037622d83mr2229948edx.36.1671642051236; 
 Wed, 21 Dec 2022 09:00:51 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-092-224-051-061.92.224.pool.telefonica.de. [92.224.51.61])
 by smtp.gmail.com with ESMTPSA id
 n14-20020aa7db4e000000b0047466e46662sm7204019edt.39.2022.12.21.09.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 09:00:50 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v4 05/30] hw/usb/hcd-uhci: Introduce TYPE_ defines for device
 models
Date: Wed, 21 Dec 2022 17:59:38 +0100
Message-Id: <20221221170003.2929-6-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221170003.2929-1-shentey@gmail.com>
References: <20221221170003.2929-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52f.google.com
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

Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-10-shentey@gmail.com>
---
 hw/i386/pc_piix.c |  3 ++-
 hw/i386/pc_q35.c  | 13 +++++++------
 hw/isa/piix4.c    |  2 +-
 hw/usb/hcd-uhci.c | 16 ++++++++--------
 hw/usb/hcd-uhci.h |  4 ++++
 5 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index ecae85a31e..e4bb8994da 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -51,6 +51,7 @@
 #include "exec/memory.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/piix4.h"
+#include "hw/usb/hcd-uhci.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "sysemu/xen.h"
@@ -306,7 +307,7 @@ static void pc_init1(MachineState *machine,
 #endif
 
     if (pcmc->pci_enabled && machine_usb(machine)) {
-        pci_create_simple(pci_bus, piix3_devfn + 2, "piix3-usb-uhci");
+        pci_create_simple(pci_bus, piix3_devfn + 2, TYPE_PIIX3_USB_UHCI);
     }
 
     if (pcmc->pci_enabled && x86_machine_is_acpi_enabled(X86_MACHINE(pcms))) {
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 39f035903c..ed541102f4 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -48,6 +48,7 @@
 #include "hw/ide/pci.h"
 #include "hw/ide/ahci.h"
 #include "hw/usb.h"
+#include "hw/usb/hcd-uhci.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "sysemu/numa.h"
@@ -65,15 +66,15 @@ struct ehci_companions {
 };
 
 static const struct ehci_companions ich9_1d[] = {
-    { .name = "ich9-usb-uhci1", .func = 0, .port = 0 },
-    { .name = "ich9-usb-uhci2", .func = 1, .port = 2 },
-    { .name = "ich9-usb-uhci3", .func = 2, .port = 4 },
+    { .name = TYPE_ICH9_USB_UHCI(1), .func = 0, .port = 0 },
+    { .name = TYPE_ICH9_USB_UHCI(2), .func = 1, .port = 2 },
+    { .name = TYPE_ICH9_USB_UHCI(3), .func = 2, .port = 4 },
 };
 
 static const struct ehci_companions ich9_1a[] = {
-    { .name = "ich9-usb-uhci4", .func = 0, .port = 0 },
-    { .name = "ich9-usb-uhci5", .func = 1, .port = 2 },
-    { .name = "ich9-usb-uhci6", .func = 2, .port = 4 },
+    { .name = TYPE_ICH9_USB_UHCI(4), .func = 0, .port = 0 },
+    { .name = TYPE_ICH9_USB_UHCI(5), .func = 1, .port = 2 },
+    { .name = TYPE_ICH9_USB_UHCI(6), .func = 2, .port = 4 },
 };
 
 static int ehci_create_ich9_with_companions(PCIBus *bus, int slot)
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 6e9434129d..de60ceef73 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -255,7 +255,7 @@ static void piix4_init(Object *obj)
 
     object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
     object_initialize_child(obj, "ide", &s->ide, TYPE_PIIX4_IDE);
-    object_initialize_child(obj, "uhci", &s->uhci, "piix4-usb-uhci");
+    object_initialize_child(obj, "uhci", &s->uhci, TYPE_PIIX4_USB_UHCI);
 
     object_initialize_child(obj, "pm", &s->pm, TYPE_PIIX4_PM);
     qdev_prop_set_uint32(DEVICE(&s->pm), "smb_io_base", 0x1100);
diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
index d1b5657d72..30ae0104bb 100644
--- a/hw/usb/hcd-uhci.c
+++ b/hw/usb/hcd-uhci.c
@@ -1292,56 +1292,56 @@ void uhci_data_class_init(ObjectClass *klass, void *data)
 
 static UHCIInfo uhci_info[] = {
     {
-        .name       = "piix3-usb-uhci",
+        .name      = TYPE_PIIX3_USB_UHCI,
         .vendor_id = PCI_VENDOR_ID_INTEL,
         .device_id = PCI_DEVICE_ID_INTEL_82371SB_2,
         .revision  = 0x01,
         .irq_pin   = 3,
         .unplug    = true,
     },{
-        .name      = "piix4-usb-uhci",
+        .name      = TYPE_PIIX4_USB_UHCI,
         .vendor_id = PCI_VENDOR_ID_INTEL,
         .device_id = PCI_DEVICE_ID_INTEL_82371AB_2,
         .revision  = 0x01,
         .irq_pin   = 3,
         .unplug    = true,
     },{
-        .name      = "ich9-usb-uhci1", /* 00:1d.0 */
+        .name      = TYPE_ICH9_USB_UHCI(1), /* 00:1d.0 */
         .vendor_id = PCI_VENDOR_ID_INTEL,
         .device_id = PCI_DEVICE_ID_INTEL_82801I_UHCI1,
         .revision  = 0x03,
         .irq_pin   = 0,
         .unplug    = false,
     },{
-        .name      = "ich9-usb-uhci2", /* 00:1d.1 */
+        .name      = TYPE_ICH9_USB_UHCI(2), /* 00:1d.1 */
         .vendor_id = PCI_VENDOR_ID_INTEL,
         .device_id = PCI_DEVICE_ID_INTEL_82801I_UHCI2,
         .revision  = 0x03,
         .irq_pin   = 1,
         .unplug    = false,
     },{
-        .name      = "ich9-usb-uhci3", /* 00:1d.2 */
+        .name      = TYPE_ICH9_USB_UHCI(3), /* 00:1d.2 */
         .vendor_id = PCI_VENDOR_ID_INTEL,
         .device_id = PCI_DEVICE_ID_INTEL_82801I_UHCI3,
         .revision  = 0x03,
         .irq_pin   = 2,
         .unplug    = false,
     },{
-        .name      = "ich9-usb-uhci4", /* 00:1a.0 */
+        .name      = TYPE_ICH9_USB_UHCI(4), /* 00:1a.0 */
         .vendor_id = PCI_VENDOR_ID_INTEL,
         .device_id = PCI_DEVICE_ID_INTEL_82801I_UHCI4,
         .revision  = 0x03,
         .irq_pin   = 0,
         .unplug    = false,
     },{
-        .name      = "ich9-usb-uhci5", /* 00:1a.1 */
+        .name      = TYPE_ICH9_USB_UHCI(5), /* 00:1a.1 */
         .vendor_id = PCI_VENDOR_ID_INTEL,
         .device_id = PCI_DEVICE_ID_INTEL_82801I_UHCI5,
         .revision  = 0x03,
         .irq_pin   = 1,
         .unplug    = false,
     },{
-        .name      = "ich9-usb-uhci6", /* 00:1a.2 */
+        .name      = TYPE_ICH9_USB_UHCI(6), /* 00:1a.2 */
         .vendor_id = PCI_VENDOR_ID_INTEL,
         .device_id = PCI_DEVICE_ID_INTEL_82801I_UHCI6,
         .revision  = 0x03,
diff --git a/hw/usb/hcd-uhci.h b/hw/usb/hcd-uhci.h
index c85ab7868e..83e6f548b1 100644
--- a/hw/usb/hcd-uhci.h
+++ b/hw/usb/hcd-uhci.h
@@ -91,4 +91,8 @@ typedef struct UHCIInfo {
 void uhci_data_class_init(ObjectClass *klass, void *data);
 void usb_uhci_common_realize(PCIDevice *dev, Error **errp);
 
+#define TYPE_PIIX3_USB_UHCI "piix3-usb-uhci"
+#define TYPE_PIIX4_USB_UHCI "piix4-usb-uhci"
+#define TYPE_ICH9_USB_UHCI(fn) "ich9-usb-uhci" #fn
+
 #endif
-- 
2.39.0


