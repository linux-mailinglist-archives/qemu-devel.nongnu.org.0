Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 078CD6A8B2E
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 22:25:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXqNX-0000ib-GN; Thu, 02 Mar 2023 16:22:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pXqNV-0000iB-QK
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:22:17 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pXqNU-0002PR-29
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:22:17 -0500
Received: by mail-ed1-x530.google.com with SMTP id cy23so2334292edb.12
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 13:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677792134;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y41UvMnIatwWqFteR/xANmtD3xyJlgOqGq4xgeg4yro=;
 b=ENmwvi1iGUiAaoa2QwqxpnA2rY7v7lVINFR72jfWB1HJQnu4OI3qOICbQeg/rW7vgW
 nsm9Hfxay+Yx8urLD64xvRrvhvkBjBl4j88ymGCc1EGpRMTV9tOPWC+tqoXDKIEJy1bI
 k1ShISUNFF1SaP+gFxDmAl7SQ4ELMoBFK7lW2B0EPrCG50/3BVv0KuNEnP/NxIscIJAF
 ZdAhzQ2LCs82C24aY6HeAoMEh8b+PVw7oyJfEHfDXSv/wmgE6xM1EM2Qx6r0htNDmuO/
 Yd60I9KAlzmOqgSb5TIt2wBrUNT0uccIlfra18g/Nbn98NaOnX4tsVbDGkdVECNJKvvs
 MISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677792134;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y41UvMnIatwWqFteR/xANmtD3xyJlgOqGq4xgeg4yro=;
 b=tdRnCCwkPhYHbux/4UfFOEU/uv1Kvsxr4DkYOTqoFcDLLbTwIxZ5jSvQTDCgdgesDg
 p4GJEoiYseKWXcV/aYodz5EMlP1Hz2Rif3M4dEK/xIxdknl04RzIVmfwSQGa84vWt8HO
 DhZanJNGjnIj3wG33gWoNHSKz9BIXqDV1nQWOAF3w6OGcROF59244Jyk14bLZsWgSNhl
 Tkii1LGNVE1mhrEU4pv3/UeFRn+e10/97vc/PzzXFuEmT+ZEbPXZUg7+UzWP5x9xiysk
 X5+d7Sng8fIjYDRIYMghrH8M0mjVUw2keOgPmwFqOGtyGSIAYcI1wgXyz/YB9ZwmcG4j
 of5A==
X-Gm-Message-State: AO0yUKU5j2B4LfJ54KUVemyDozHsdbqTgO4bCWOOe5XTCU9Y1aXN7eYj
 8GBiHTHliBgsbMtAqhQWxx8MW85eyAY=
X-Google-Smtp-Source: AK7set8//kSpTiG41P2UaXiEKNUw+HVIrONT+DmpsDa3XTy+WABMgQpGAUkLYGjYWFT1bgJOFxpI7g==
X-Received: by 2002:a17:906:dac7:b0:8f4:809e:faee with SMTP id
 xi7-20020a170906dac700b008f4809efaeemr4941945ejb.19.1677792134285; 
 Thu, 02 Mar 2023 13:22:14 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-092-224-150-004.92.224.pool.telefonica.de. [92.224.150.4])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709062ec400b008f89953b761sm145895eji.3.2023.03.02.13.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 13:22:13 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v8 04/23] hw/isa/piix3: Create USB controller in host device
Date: Thu,  2 Mar 2023 22:21:42 +0100
Message-Id: <20230302212201.224360-5-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302212201.224360-1-shentey@gmail.com>
References: <20230302212201.224360-1-shentey@gmail.com>
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The USB controller is an integral part of PIIX3 (function 2). So create
it as part of the south bridge.

Note that the USB function is optional in QEMU. This is why it gets
object_initialize_child()'ed in realize rather than in instance_init.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-13-shentey@gmail.com>
---
 include/hw/southbridge/piix.h |  4 ++++
 hw/i386/pc_piix.c             |  7 ++-----
 hw/isa/piix3.c                | 17 +++++++++++++++++
 hw/isa/Kconfig                |  1 +
 4 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 9333221ced..7b9819ece5 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -15,6 +15,7 @@
 #include "hw/pci/pci_device.h"
 #include "qom/object.h"
 #include "hw/rtc/mc146818rtc.h"
+#include "hw/usb/hcd-uhci.h"
 
 /* PIRQRC[A:D]: PIRQx Route Control Registers */
 #define PIIX_PIRQCA 0x60
@@ -54,12 +55,15 @@ struct PIIXState {
     int32_t pci_irq_levels_vmstate[PIIX_NUM_PIRQS];
 
     MC146818RtcState rtc;
+    UHCIState uhci;
 
     /* Reset Control Register contents */
     uint8_t rcr;
 
     /* IO memory region for Reset Control Register (PIIX_RCR_IOPORT) */
     MemoryRegion rcr_mem;
+
+    bool has_usb;
 };
 typedef struct PIIXState PIIX3State;
 
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index b9d475a226..3a6a54bf50 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -53,7 +53,6 @@
 #include "exec/memory.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/piix4.h"
-#include "hw/usb/hcd-uhci.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "sysemu/xen.h"
@@ -237,6 +236,8 @@ static void pc_init1(MachineState *machine,
         pcms->bus = pci_bus;
 
         pci_dev = pci_new_multifunction(-1, true, type);
+        object_property_set_bool(OBJECT(pci_dev), "has-usb",
+                                 machine_usb(machine), &error_abort);
         pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
         piix3 = PIIX3_PCI_DEVICE(pci_dev);
         piix3->pic = x86ms->gsi;
@@ -315,10 +316,6 @@ static void pc_init1(MachineState *machine,
     }
 #endif
 
-    if (pcmc->pci_enabled && machine_usb(machine)) {
-        pci_create_simple(pci_bus, piix3_devfn + 2, TYPE_PIIX3_USB_UHCI);
-    }
-
     if (pcmc->pci_enabled && x86_machine_is_acpi_enabled(X86_MACHINE(pcms))) {
         PCIDevice *piix4_pm;
 
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index f9103ea45a..7ae031f2c5 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -288,6 +288,7 @@ static const MemoryRegionOps rcr_ops = {
 static void pci_piix3_realize(PCIDevice *dev, Error **errp)
 {
     PIIX3State *d = PIIX3_PCI_DEVICE(dev);
+    PCIBus *pci_bus = pci_get_bus(dev);
     ISABus *isa_bus;
 
     isa_bus = isa_bus_new(DEVICE(d), pci_address_space(dev),
@@ -308,6 +309,16 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
     if (!qdev_realize(DEVICE(&d->rtc), BUS(isa_bus), errp)) {
         return;
     }
+
+    /* USB */
+    if (d->has_usb) {
+        object_initialize_child(OBJECT(dev), "uhci", &d->uhci,
+                                TYPE_PIIX3_USB_UHCI);
+        qdev_prop_set_int32(DEVICE(&d->uhci), "addr", dev->devfn + 2);
+        if (!qdev_realize(DEVICE(&d->uhci), BUS(pci_bus), errp)) {
+            return;
+        }
+    }
 }
 
 static void build_pci_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
@@ -338,6 +349,11 @@ static void pci_piix3_init(Object *obj)
     object_initialize_child(obj, "rtc", &d->rtc, TYPE_MC146818_RTC);
 }
 
+static Property pci_piix3_props[] = {
+    DEFINE_PROP_BOOL("has-usb", PIIX3State, has_usb, true),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void pci_piix3_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -357,6 +373,7 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
      * pc_piix.c's pc_init1()
      */
     dc->user_creatable = false;
+    device_class_set_props(dc, pci_piix3_props);
     adevc->build_dev_aml = build_pci_isa_aml;
 }
 
diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index c10cbc5fc1..f01bc0dff3 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -36,6 +36,7 @@ config PIIX3
     select I8257
     select ISA_BUS
     select MC146818RTC
+    select USB_UHCI
 
 config PIIX4
     bool
-- 
2.39.2


