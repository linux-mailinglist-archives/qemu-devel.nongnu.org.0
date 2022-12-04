Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC21641F23
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 20:12:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1uKy-0001rx-Sq; Sun, 04 Dec 2022 14:07:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uKw-0001pu-5f; Sun, 04 Dec 2022 14:07:38 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uKu-0001dF-He; Sun, 04 Dec 2022 14:07:37 -0500
Received: by mail-ed1-x52e.google.com with SMTP id c17so4513325edj.13;
 Sun, 04 Dec 2022 11:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DSLjW3VA0QsPo5GoSPbScdOMUaWeiMzvGnTww3C3Afw=;
 b=MFWA0IZFbrSvYZ3AsAF8UCHXY4DpjWsuCnO2pPnhQu1PGSSUh4XRsa2Ailtisk0ueD
 48DipIRbGjpj/DEtRFvIbnOQ/Jio52ME/8EP6i6SL+mSVwzU3E1vpwhz7Tv65I1NCpCl
 LrJ05oANu7OEU/TTYXchsAw5iITuxIElTEuD1iIk+WJXqd/H7Qxfx09Mg37499+KE5E7
 W6OLaY8kN7PsoDYOjgBQjFGDjfoDJpO001ayMPyJtJBsG9W4cz1JtTu7dO6I2j6IMlb4
 8TWVd/b6tC8tKdp6yIEJRs8yJJIhc6Ij9k92J4+crlmko5qvEwUYmdCQFVWwwrTb+sXD
 xY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DSLjW3VA0QsPo5GoSPbScdOMUaWeiMzvGnTww3C3Afw=;
 b=1WY48Ryla6HZGjAgERRXNnbTM4rA13UEq70aQXsF2q8BvhV+26Cm6/qSn6RyzcWGvH
 SONeCKVVJPW0EpPoJJlEFwB20N7wuoUVHiZ5YMZDgvxhqEH0CH7OBAEsL4slY6DdnmXq
 /HSGoQDKwG62PSskwGQLETAx+ZamnbvHSda+nOybQKTV3n9+f7yklewhlIo+kMJ0m/o/
 6r4QQFT8fNWPawlwFQiDbdAR5rvpb6YP4I9n9gBEqcKoqkqa3C82Q1yK9L3LVy4x0SZe
 dEorZKKPDGzCFYFNq1bUpgMVyK/b5NsmZaew7PmCpLC4KI8M//Dc6k3FPoO0BgTB6PMp
 7wLA==
X-Gm-Message-State: ANoB5plbbb5SNe0j77ezBBZlKcI/2SB5Lm7BQd4pffmDmkUVOfpADs8V
 MtYy9N1nLkWkl2xjfFymjGhlNBxnsh4=
X-Google-Smtp-Source: AA0mqf5c8TPNGf2poV3j2R5O7Ny1D8w22mpsxZPDtxHj2L61cUfRlfYeO+Zk/blDelYuFA5BTCUl8Q==
X-Received: by 2002:a05:6402:78e:b0:46c:6f53:bf19 with SMTP id
 d14-20020a056402078e00b0046c6f53bf19mr5464419edy.299.1670180854785; 
 Sun, 04 Dec 2022 11:07:34 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-089-012-182-051.89.12.pool.telefonica.de. [89.12.182.51])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a17090623ea00b00782ee6b34f2sm5359835ejg.183.2022.12.04.11.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 11:07:34 -0800 (PST)
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
Subject: [PATCH 09/32] hw/isa/piix3: Create USB controller in host device
Date: Sun,  4 Dec 2022 20:05:30 +0100
Message-Id: <20221204190553.3274-10-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221204190553.3274-1-shentey@gmail.com>
References: <20221204190553.3274-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
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
Message-Id: <20221022150508.26830-13-shentey@gmail.com>
---
 hw/i386/pc_piix.c             |  7 ++-----
 hw/isa/Kconfig                |  1 +
 hw/isa/piix3.c                | 17 +++++++++++++++++
 include/hw/southbridge/piix.h |  4 ++++
 4 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index b97bff5674..22c1c5404c 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -51,7 +51,6 @@
 #include "exec/memory.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/piix4.h"
-#include "hw/usb/hcd-uhci.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "sysemu/xen.h"
@@ -221,6 +220,8 @@ static void pc_init1(MachineState *machine,
         pcms->bus = pci_bus;
 
         pci_dev = pci_new_multifunction(-1, true, type);
+        object_property_set_bool(OBJECT(pci_dev), "has-usb",
+                                 machine_usb(machine), &error_abort);
         pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
         piix3 = PIIX3_PCI_DEVICE(pci_dev);
         piix3->pic = x86ms->gsi;
@@ -299,10 +300,6 @@ static void pc_init1(MachineState *machine,
     }
 #endif
 
-    if (pcmc->pci_enabled && machine_usb(machine)) {
-        pci_create_simple(pci_bus, piix3_devfn + 2, TYPE_PIIX3_USB_UHCI);
-    }
-
     if (pcmc->pci_enabled && x86_machine_is_acpi_enabled(X86_MACHINE(pcms))) {
         PCIDevice *piix4_pm;
 
diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index af5ec9cd61..97b8ea7c06 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -36,6 +36,7 @@ config PIIX3
     select I8257
     select ISA_BUS
     select MC146818RTC
+    select USB_UHCI
 
 config PIIX4
     bool
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index c68e51ddad..af1c5b9859 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -299,6 +299,7 @@ static const MemoryRegionOps rcr_ops = {
 static void pci_piix3_realize(PCIDevice *dev, Error **errp)
 {
     PIIX3State *d = PIIX3_PCI_DEVICE(dev);
+    PCIBus *pci_bus = pci_get_bus(dev);
     ISABus *isa_bus;
 
     isa_bus = isa_bus_new(DEVICE(d), pci_address_space(dev),
@@ -319,6 +320,16 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
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
@@ -352,6 +363,11 @@ static void pci_piix3_init(Object *obj)
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
@@ -371,6 +387,7 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
      * pc_piix.c's pc_init1()
      */
     dc->user_creatable = false;
+    device_class_set_props(dc, pci_piix3_props);
     adevc->build_dev_aml = build_pci_isa_aml;
 }
 
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index b1fa08dd2b..5367917182 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -15,6 +15,7 @@
 #include "hw/pci/pci.h"
 #include "qom/object.h"
 #include "hw/rtc/mc146818rtc.h"
+#include "hw/usb/hcd-uhci.h"
 
 /* PIRQRC[A:D]: PIRQx Route Control Registers */
 #define PIIX_PIRQCA 0x60
@@ -54,12 +55,15 @@ struct PIIXState {
     int32_t pci_irq_levels_vmstate[PIIX_NUM_PIRQS];
 
     RTCState rtc;
+    UHCIState uhci;
 
     /* Reset Control Register contents */
     uint8_t rcr;
 
     /* IO memory region for Reset Control Register (PIIX_RCR_IOPORT) */
     MemoryRegion rcr_mem;
+
+    bool has_usb;
 };
 typedef struct PIIXState PIIX3State;
 
-- 
2.38.1


