Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF129662CE1
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 18:36:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEvtW-0002cL-Tq; Mon, 09 Jan 2023 12:25:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtS-0002XC-6m; Mon, 09 Jan 2023 12:25:06 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtP-00012N-RD; Mon, 09 Jan 2023 12:25:05 -0500
Received: by mail-ej1-x630.google.com with SMTP id cf18so15589680ejb.5;
 Mon, 09 Jan 2023 09:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PbEEYbX4NaIwLmsFYjtNVSJvUS1kjPfAvN1bwZmGWzk=;
 b=DQgFdlZCuRIHi+V33qMNIGwRixcbhabzrTkKUhhEQeIlxArEaCMkY0k/gC+tojBDJN
 WJCUfpjl34GYZaHgb6TiE0yLzn6aY+iBP72quOh3vzzEWuOcGHaBPxb8rLoBX88p4tPr
 6Z+9ik34VHM5x5UQxV6A4QPq57CWf3SLC3NimDncZVV5a3QOLMbrLgrH41LNpyBXcrHA
 w+nyvDSoxiyJiRU6rf1BlrJxV39CDrGDLb2z7X2jjXm80Ha2U2ilc1fK//P297J6vwh1
 d5EJ0bvqHwAzWdYv/KSb81djrIcMLodJ61eatUepxjkzTTFAfPC30m/fzPdS3ZtOx+8M
 lsow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PbEEYbX4NaIwLmsFYjtNVSJvUS1kjPfAvN1bwZmGWzk=;
 b=3nqafOpN2GDi/ciELUCH8kaFKxOxJhxN6BuS/nx5KzxYe66rsZl6wqmwruLP63bePr
 uWQ0hI++Sje2kHVvllbKcysCk2kgkVU7rVblJBYUtWuganjF2MjAHslLOi3w0d5LO2fO
 2nKqoBxwNUGDBwDaIpCAefb7on1ErYUtpJMDdyXoYZvjoUJPS8k8NRZ2fJelNoA/5Y/+
 3rArdKWHftjkx5PMQP2OqQbdBTcHIAa5g/wWnRA7SgLPc57bnxm2ah91w7KkcL64SLtl
 2I/k95Xl0FVAdlBK7s/95O16ZfB/uhqLGwXO5VigIbLLef4xoiBdJ0U1Jsov5ranyQ51
 8b8g==
X-Gm-Message-State: AFqh2krbAq0bJ8hXyryKSjc0vognbCZVzjVDHy/+oTC0oyJ8YwjvWYi4
 1aYYNnzbgPvtWIkWD7n7xAjwB3YHeWqueA==
X-Google-Smtp-Source: AMrXdXsA5PVIZp91rbklXL4DkHxPTYHmz9SZmA5TUn2Ws3KzA8ZpDnsaOSRPn8f8QJnS/ig20qaUYA==
X-Received: by 2002:a17:907:c786:b0:7ad:a797:5bb9 with SMTP id
 tz6-20020a170907c78600b007ada7975bb9mr78631589ejc.29.1673285101032; 
 Mon, 09 Jan 2023 09:25:01 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b00846734faa9asm3925625ejo.164.2023.01.09.09.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 09:25:00 -0800 (PST)
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
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v6 08/33] hw/usb/hcd-uhci: Introduce TYPE_ defines for device
 models
Date: Mon,  9 Jan 2023 18:23:21 +0100
Message-Id: <20230109172347.1830-9-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109172347.1830-1-shentey@gmail.com>
References: <20230109172347.1830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x630.google.com
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
 hw/usb/hcd-uhci.h |  4 ++++
 hw/i386/pc_piix.c |  3 ++-
 hw/i386/pc_q35.c  | 13 +++++++------
 hw/isa/piix4.c    |  2 +-
 hw/usb/hcd-uhci.c | 16 ++++++++--------
 5 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/hw/usb/hcd-uhci.h b/hw/usb/hcd-uhci.h
index 5843af504a..e0fdb98ef1 100644
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
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index bb3b10557f..df64dd8dcc 100644
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
@@ -305,7 +306,7 @@ static void pc_init1(MachineState *machine,
 #endif
 
     if (pcmc->pci_enabled && machine_usb(machine)) {
-        pci_create_simple(pci_bus, piix3_devfn + 2, "piix3-usb-uhci");
+        pci_create_simple(pci_bus, piix3_devfn + 2, TYPE_PIIX3_USB_UHCI);
     }
 
     if (pcmc->pci_enabled && x86_machine_is_acpi_enabled(X86_MACHINE(pcms))) {
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 65ea226211..83c57c6eb1 100644
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
-- 
2.39.0


