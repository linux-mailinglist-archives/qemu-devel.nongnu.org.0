Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59652641F1F
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 20:10:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1uKr-0001mY-Oy; Sun, 04 Dec 2022 14:07:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uKq-0001mD-Lz; Sun, 04 Dec 2022 14:07:32 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uKo-0001cG-JT; Sun, 04 Dec 2022 14:07:32 -0500
Received: by mail-ej1-x632.google.com with SMTP id n20so23134038ejh.0;
 Sun, 04 Dec 2022 11:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IJq1Ucn+VVeqqpkB9YPt71C5Kv2BL3f3dT/zXJbfztA=;
 b=jOrsPvNNs+N3jml49k5FhH6urggBqYyLn+vfXCo/3qzSSNT2krNuspCIIlEIZEfgKR
 l7kr4EVXj4vu0rhOjfZScjmFWcjc9AMt83ekC1pYdW1nAe+X4wljzjXHrsMA8JRGwLxJ
 wdTJrfHdF2N7kz/SEt3AMB4NzR2ZJ4fGH1FnMm+98nVm9b85p8UdpjCsyAWIuGqFJr76
 T2NGaAJNDhqDnQOEzzBeTkSWIh7Kn0+dSEGNgxm0jgZ19A5K/esedyOo4VNk/gzvkVcB
 5oGvGwFzYDqymxTS9WP6gY0csHvODAZIeixICda6WyoikoPNJrQ65e3R/hknqswTW6WX
 3nVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IJq1Ucn+VVeqqpkB9YPt71C5Kv2BL3f3dT/zXJbfztA=;
 b=RegCwsFPRLN7Ezf6HDaIEOBKcRZdYFa5uHb2Kzl5bAoj9x0zOMsx1LO1DxaDSdi5+m
 h7vPraJUYyS+iJt2E59c8hPR/X5geOAbr9BL3MRGgfOvtcHh/Uv9mnDt2kFJbjZ2L5XY
 NEwNYFaB186Bx2qrdr2IGxg4Jzw65ntPIAMYg+2mnbAMmlxkQrK8xULb6BLTH+S7dprn
 wgnT1/bub0ZCE4jTHs3qDHk+17kVxUMU6SDYz50VpYCMxolIDCfjB95PGsU+AMvBOyPW
 NiWPy8FR5GGc/UTFrpnJqQaoshE0U2bSWLh8X389Xa/FLJm3QMrySoRy+kxBX7ScS2P7
 69Xw==
X-Gm-Message-State: ANoB5pmIz/ImWl3RzzX8PG97+twrTzWQUtl9J29gebTReay6ZoYQp0VS
 dWQQvOK15PRO7NtoqxZ0QQjnrU6umsg=
X-Google-Smtp-Source: AA0mqf4ECkIsmGaNXwEe3nxnrLjEh06euKbWBout3QHLgdOt8j0jTsxs42Jqkv9oqWgqQ0/kripjHg==
X-Received: by 2002:a17:907:8749:b0:7c0:7c6c:d484 with SMTP id
 qo9-20020a170907874900b007c07c6cd484mr1300399ejc.752.1670180848703; 
 Sun, 04 Dec 2022 11:07:28 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-089-012-182-051.89.12.pool.telefonica.de. [89.12.182.51])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a17090623ea00b00782ee6b34f2sm5359835ejg.183.2022.12.04.11.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 11:07:28 -0800 (PST)
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
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH 06/32] hw/usb/hcd-uhci: Introduce TYPE_ defines for device
 models
Date: Sun,  4 Dec 2022 20:05:27 +0100
Message-Id: <20221204190553.3274-7-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221204190553.3274-1-shentey@gmail.com>
References: <20221204190553.3274-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x632.google.com
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
Message-Id: <20221022150508.26830-10-shentey@gmail.com>
---
 hw/i386/pc_piix.c |  3 ++-
 hw/i386/pc_q35.c  | 13 +++++++------
 hw/isa/piix4.c    |  2 +-
 hw/usb/hcd-uhci.c | 16 ++++++++--------
 hw/usb/hcd-uhci.h |  4 ++++
 5 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index e26509a935..caa983d76e 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -50,6 +50,7 @@
 #include "exec/memory.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/piix4.h"
+#include "hw/usb/hcd-uhci.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "sysemu/xen.h"
@@ -291,7 +292,7 @@ static void pc_init1(MachineState *machine,
 #endif
 
     if (pcmc->pci_enabled && machine_usb(machine)) {
-        pci_create_simple(pci_bus, piix3_devfn + 2, "piix3-usb-uhci");
+        pci_create_simple(pci_bus, piix3_devfn + 2, TYPE_PIIX3_USB_UHCI);
     }
 
     if (pcmc->pci_enabled && x86_machine_is_acpi_enabled(X86_MACHINE(pcms))) {
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index a496bd6e74..1da6d34339 100644
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
index 0d23e11a39..aceb21ee3e 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -280,7 +280,7 @@ static void piix4_init(Object *obj)
 
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
2.38.1


