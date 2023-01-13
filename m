Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7874669D0B
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 17:00:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMII-00034k-V4; Fri, 13 Jan 2023 10:48:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMI5-0002sj-09
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:48:26 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMHz-0006XF-L7
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:48:22 -0500
Received: by mail-wr1-x436.google.com with SMTP id t5so17054828wrq.1
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gGd9eOsU7rweNW2/1pgo2+qNNDc66xrcChI/4DrvO/Q=;
 b=gCji1OLkNOvyZVuo7nYe7wVmBx+keoQrxxtXP+eMBi18s1JBljr7ET1c9YETkL0ZDV
 V0+w2W8JSfs3RQmidDQUGsb8KWF6HMGz6CyQcK7aofiFz00AqjGa8EYf9T2kKtREUPdm
 yiG5xP6lrcJdWbtZjNIjdfPl4TJmfoQiBtmdYsQuGJz/LP3w0HrBFeO7ovkWKqqVZ7la
 ayFfRIuF73120LI1L+flwtDzf9b2aVUmKFM6HIRVlb8T2QH5IV10IXmVVy5c9IJI3UMC
 jlJEJDUxlB3Gr5h8FNLFQw5gadN5SDNZphopM/3dPbMfffzG4StpZjL7dYmnULCUQniM
 SqWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gGd9eOsU7rweNW2/1pgo2+qNNDc66xrcChI/4DrvO/Q=;
 b=I0AXPa8L2ewF5BEZv6E719bTDDQPGBiU7VmX56ZnzWOQUJEeOwsDJ/OZcPaYyYzn2y
 46xH9/K0dE36hRvlrgNgBxMDYAGIFA8e2n8QwRXlO4lgvPtm/2abL7yLxB5m0a0M0pxn
 WAzEVlCUYBocoNzIHMtOpdr1z3dqFaY18RkIVTW/RF9+DXNFyQq9BRs2MAHNQbn3cvHN
 msynjYI31TlU57knRqzUNo06zR/dtjiF/hanH2uVT+mKOE69QulGJV+gD49BF/UO+dGt
 0FT4xqRy0GDFgsfB2sA0Bz/HtA6oCJf9PkITr5rwHODT2TTdAOQSvpur/i1qSHukDtHX
 4LxQ==
X-Gm-Message-State: AFqh2kpE9NQPmQk/lCy0k4o/ZNAG+BoA5NXbwkOpsmjvKgPgtSwT22vF
 CoH4x4he4BMoY6ASAPP6+dLoZpLIPwP9DRBr
X-Google-Smtp-Source: AMrXdXsRUAV5+A5YFpJ5FjO5P8h3TsZ93nuNoikWeiHJy8/mK+tOUSpaNWZeB2hBsrV2y/NxFrEJ8A==
X-Received: by 2002:a5d:5948:0:b0:2bb:f255:6bb4 with SMTP id
 e8-20020a5d5948000000b002bbf2556bb4mr159563wri.25.1673624898738; 
 Fri, 13 Jan 2023 07:48:18 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m5-20020adfdc45000000b002428c4fb16asm19705578wrj.10.2023.01.13.07.48.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:48:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PULL 34/46] hw/usb/hcd-uhci: Introduce TYPE_ defines for device
 models
Date: Fri, 13 Jan 2023 16:45:20 +0100
Message-Id: <20230113154532.49979-35-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Bernhard Beschow <shentey@gmail.com>

Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221204190553.3274-7-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc_piix.c |  3 ++-
 hw/i386/pc_q35.c  | 13 +++++++------
 hw/isa/piix4.c    |  2 +-
 hw/usb/hcd-uhci.c | 16 ++++++++--------
 hw/usb/hcd-uhci.h |  4 ++++
 5 files changed, 22 insertions(+), 16 deletions(-)

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
-- 
2.38.1


