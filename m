Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DBC641F2E
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 20:14:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1uL0-0001sG-7F; Sun, 04 Dec 2022 14:07:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uKy-0001ry-MA; Sun, 04 Dec 2022 14:07:40 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uKw-0001dV-Fp; Sun, 04 Dec 2022 14:07:40 -0500
Received: by mail-ej1-x629.google.com with SMTP id ud5so23067108ejc.4;
 Sun, 04 Dec 2022 11:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iMDljg4bdnHTDez48IPwxbKY0ST6j+J3OlN+OoLwccw=;
 b=b+RViTT7cJNxlrZMARcTSXKfZUNQ475uFYos0U4O53/P53NvqG6tB3V08jJsEHz3OJ
 r7ja1wJedt8Va9kHzFbJ15zSAJrR0fehI5fFlkValPZD5LRv/p2XUjB4w4zdDQZ/38kk
 DFbBTQ5CWb8TSW4xNOW10ehSR/+Wk+vRhY6LLB9i25hA2Qsgi1h0cwXaeKO+ArJzPOYk
 PZTzjmDDMgpFAwhNUMzUopYYTuq4sr/RsSPNss5gTyNQo6DmGLPPkn/nxCPBNbCeii3L
 gH4DBGoGElNXuxeV29jzY9xxs/gnFwUmtHcwt2xNWoRmZlwgsFDY8ISOEEjrVA/dW0k4
 0X5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iMDljg4bdnHTDez48IPwxbKY0ST6j+J3OlN+OoLwccw=;
 b=YW9uDWdGPrhsF8uH1S8DAw75CMOwl8jqqBD4OJki++/Lw64iWqp6B9zU63ibGvQuii
 +0Wb9DNVQ2xZyOuITKwWFgSzPIqNTunbQ+/yAKqfYzRjkTfMzfS0/OFFnPRZr+yfLiiq
 kDxlPV8qreV93caQRLZHcBloLg0dl8owZ7vn3ZyDQ8I594ocvq7AxAwv3P7qg+7PTvbd
 1OxEB2e9lfX/BsfFue2SWlmJnW5lLx6udaTVmMdKMjcnTbuLdrBOt0EnCUzx8mdjS2lj
 B7BuVf9D0dP3932943ECyg68kI/9O+Zz+NMjcgZ65Plk74CqcSl9YuCw7UrM8u17yW6y
 XBbQ==
X-Gm-Message-State: ANoB5pnz/UST9IzwVxRPn1Qc5JLHlIEKkyD46ZMnUSExYRCMuuzFp/d/
 GWn011iM9lzSBWQYIzqOmw99c0iG59w=
X-Google-Smtp-Source: AA0mqf6vHscvk4bmvvz2OCqqjHOZCzi6IGerlD2rPuXPuQq4vMD4mpRxVP7rudF4TuX18VVQGKav1A==
X-Received: by 2002:a17:906:258d:b0:7c0:aea3:a9a8 with SMTP id
 m13-20020a170906258d00b007c0aea3a9a8mr13622723ejb.718.1670180856363; 
 Sun, 04 Dec 2022 11:07:36 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-089-012-182-051.89.12.pool.telefonica.de. [89.12.182.51])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a17090623ea00b00782ee6b34f2sm5359835ejg.183.2022.12.04.11.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 11:07:36 -0800 (PST)
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
Subject: [PATCH 10/32] hw/isa/piix3: Create power management controller in
 host device
Date: Sun,  4 Dec 2022 20:05:31 +0100
Message-Id: <20221204190553.3274-11-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221204190553.3274-1-shentey@gmail.com>
References: <20221204190553.3274-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
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

The power management controller is an integral part of PIIX3 (function
3). So create it as part of the south bridge.

Note that the ACPI function is optional in QEMU. This is why it gets
object_initialize_child()'ed in realize rather than in instance_init.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Message-Id: <20221022150508.26830-14-shentey@gmail.com>
---
 hw/i386/pc_piix.c             | 23 +++++++++++++----------
 hw/isa/Kconfig                |  1 +
 hw/isa/piix3.c                | 14 ++++++++++++++
 include/hw/southbridge/piix.h |  6 ++++++
 4 files changed, 34 insertions(+), 10 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 22c1c5404c..c96d989636 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -46,11 +46,11 @@
 #include "sysemu/kvm.h"
 #include "hw/kvm/clock.h"
 #include "hw/sysbus.h"
+#include "hw/i2c/i2c.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/xen/xen-x86.h"
 #include "exec/memory.h"
 #include "hw/acpi/acpi.h"
-#include "hw/acpi/piix4.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "sysemu/xen.h"
@@ -85,6 +85,7 @@ static void pc_init1(MachineState *machine,
     MemoryRegion *system_io = get_system_io();
     PCIBus *pci_bus;
     ISABus *isa_bus;
+    Object *piix4_pm;
     int piix3_devfn = -1;
     qemu_irq smi_irq;
     GSIState *gsi_state;
@@ -222,6 +223,13 @@ static void pc_init1(MachineState *machine,
         pci_dev = pci_new_multifunction(-1, true, type);
         object_property_set_bool(OBJECT(pci_dev), "has-usb",
                                  machine_usb(machine), &error_abort);
+        object_property_set_bool(OBJECT(pci_dev), "has-acpi",
+                                 x86_machine_is_acpi_enabled(x86ms),
+                                 &error_abort);
+        qdev_prop_set_uint32(DEVICE(pci_dev), "smb_io_base", 0xb100);
+        object_property_set_bool(OBJECT(pci_dev), "smm-enabled",
+                                 x86_machine_is_smm_enabled(x86ms),
+                                 &error_abort);
         pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
         piix3 = PIIX3_PCI_DEVICE(pci_dev);
         piix3->pic = x86ms->gsi;
@@ -229,8 +237,10 @@ static void pc_init1(MachineState *machine,
         isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
         rtc_state = ISA_DEVICE(object_resolve_path_component(OBJECT(pci_dev),
                                                              "rtc"));
+        piix4_pm = object_resolve_path_component(OBJECT(pci_dev), "pm");
     } else {
         pci_bus = NULL;
+        piix4_pm = NULL;
         isa_bus = isa_bus_new(NULL, get_system_memory(), system_io,
                               &error_abort);
 
@@ -300,15 +310,8 @@ static void pc_init1(MachineState *machine,
     }
 #endif
 
-    if (pcmc->pci_enabled && x86_machine_is_acpi_enabled(X86_MACHINE(pcms))) {
-        PCIDevice *piix4_pm;
-
+    if (piix4_pm) {
         smi_irq = qemu_allocate_irq(pc_acpi_smi_interrupt, first_cpu, 0);
-        piix4_pm = pci_new(piix3_devfn + 3, TYPE_PIIX4_PM);
-        qdev_prop_set_uint32(DEVICE(piix4_pm), "smb_io_base", 0xb100);
-        qdev_prop_set_bit(DEVICE(piix4_pm), "smm-enabled",
-                          x86_machine_is_smm_enabled(x86ms));
-        pci_realize_and_unref(piix4_pm, pci_bus, &error_fatal);
 
         qdev_connect_gpio_out(DEVICE(piix4_pm), 0, x86ms->gsi[9]);
         qdev_connect_gpio_out_named(DEVICE(piix4_pm), "smi-irq", 0, smi_irq);
@@ -322,7 +325,7 @@ static void pc_init1(MachineState *machine,
                                  object_property_allow_set_link,
                                  OBJ_PROP_LINK_STRONG);
         object_property_set_link(OBJECT(machine), PC_MACHINE_ACPI_DEVICE_PROP,
-                                 OBJECT(piix4_pm), &error_abort);
+                                 piix4_pm, &error_abort);
     }
 
     if (machine->nvdimms_state->is_enabled) {
diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index 97b8ea7c06..6c154d88c7 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -33,6 +33,7 @@ config PC87312
 
 config PIIX3
     bool
+    select ACPI_PIIX4
     select I8257
     select ISA_BUS
     select MC146818RTC
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index af1c5b9859..cb2d9285ae 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -330,6 +330,17 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
             return;
         }
     }
+
+    /* Power Management */
+    if (d->has_acpi) {
+        object_initialize_child(OBJECT(d), "pm", &d->pm, TYPE_PIIX4_PM);
+        qdev_prop_set_int32(DEVICE(&d->pm), "addr", dev->devfn + 3);
+        qdev_prop_set_uint32(DEVICE(&d->pm), "smb_io_base", d->smb_io_base);
+        qdev_prop_set_bit(DEVICE(&d->pm), "smm-enabled", d->smm_enabled);
+        if (!qdev_realize(DEVICE(&d->pm), BUS(pci_bus), errp)) {
+            return;
+        }
+    }
 }
 
 static void build_pci_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
@@ -364,7 +375,10 @@ static void pci_piix3_init(Object *obj)
 }
 
 static Property pci_piix3_props[] = {
+    DEFINE_PROP_UINT32("smb_io_base", PIIX3State, smb_io_base, 0),
+    DEFINE_PROP_BOOL("has-acpi", PIIX3State, has_acpi, true),
     DEFINE_PROP_BOOL("has-usb", PIIX3State, has_usb, true),
+    DEFINE_PROP_BOOL("smm-enabled", PIIX3State, smm_enabled, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 5367917182..1c291cc954 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -14,6 +14,7 @@
 
 #include "hw/pci/pci.h"
 #include "qom/object.h"
+#include "hw/acpi/piix4.h"
 #include "hw/rtc/mc146818rtc.h"
 #include "hw/usb/hcd-uhci.h"
 
@@ -56,6 +57,9 @@ struct PIIXState {
 
     RTCState rtc;
     UHCIState uhci;
+    PIIX4PMState pm;
+
+    uint32_t smb_io_base;
 
     /* Reset Control Register contents */
     uint8_t rcr;
@@ -63,7 +67,9 @@ struct PIIXState {
     /* IO memory region for Reset Control Register (PIIX_RCR_IOPORT) */
     MemoryRegion rcr_mem;
 
+    bool has_acpi;
     bool has_usb;
+    bool smm_enabled;
 };
 typedef struct PIIXState PIIX3State;
 
-- 
2.38.1


