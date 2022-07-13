Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7277857312C
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 10:33:22 +0200 (CEST)
Received: from localhost ([::1]:47518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBXo9-0004wx-HH
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 04:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oBXZZ-0005dz-8B
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 04:18:18 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:40614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oBXZX-0004o8-DX
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 04:18:16 -0400
Received: by mail-ej1-x62d.google.com with SMTP id dn9so18489971ejc.7
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 01:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2+YBaKMq3piBlzakX+dKs1zm6noavo7c3COk08077mQ=;
 b=JTY6OuKboy54SmrxPcV35EzXoDeaF0INvM3zOLD6zCL1Yt7BUfmu+d+cugfmI/1ahc
 liZ05hv/UcfjdMhfOxLyHEHTd770f+790Zq84Bg01LIbJamtjU89j906m/BlaIR1IJAo
 7/R+1xwB5+XRNMdligK4puSSQ0CeaU2M58u8vBvlmVJQvxALoc3VsQZbKBMXznV0K7lL
 9pyM5qLb3gSTcI2O9pd3rDyKCEMA5aQAIdgBFZe5J5YBYEqZLqgGKX+dJU3zl0Gvpn2e
 scW1YeRcEjc+aGz5xtTLxJFWyj63ahsY/vLvBYHlTo0C8Cbdp9Zri/IBzPDC5vIEizkF
 bL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2+YBaKMq3piBlzakX+dKs1zm6noavo7c3COk08077mQ=;
 b=gTtLAb2mjQHhI2zzAfWyeK66Rw2kkU2HWHKSQ8XFueQGZwSeHXkda/YN4IS1sOKzGe
 rUNFCdt7gOgDY5jQNwmRYc0MG4yoWFzHR/fb8/nf0lcEMsrZiGOWGnCV5yKhfl8obE4n
 pJZF26ra1+uKoV4qMZJJ/3Lh79ITr+rDTLYD0i/KdHR6u/drLN/uXyHa3NeO3Ff5s0Z/
 2Sz3L3YNh8rQOgpvzZKjuWU6oqp2tMeQvCaEbJtLOmOcWlR/2ouY5CD3GufqvBPHWezE
 dJPxU0f03f083YplnucPXOJDyQvGxDe7nNO6hariT25tCxOUA9dJOxMlFtMny3Iy0BPW
 AKtw==
X-Gm-Message-State: AJIora+vxOe9rCMoatDk1gwJTA4Iojuhouc9QFvDnZZEFFQRRfUo6+9K
 IKAY3R/jwrNv9i+umh5kPbrd3nA/Dmk=
X-Google-Smtp-Source: AGRyM1sgm5EaVhuQZ+7dXlP3ORS1FuA5vw214CIh46mapVLJuPBgiVuzIuqKQdfMiqawFwa619blbw==
X-Received: by 2002:a17:907:97c2:b0:72b:9ec4:9a60 with SMTP id
 js2-20020a17090797c200b0072b9ec49a60mr1287809ejc.154.1657700293900; 
 Wed, 13 Jul 2022 01:18:13 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-183-210-047.77.183.pool.telefonica.de. [77.183.210.47])
 by smtp.gmail.com with ESMTPSA id
 w13-20020aa7dccd000000b00435a62d35b5sm7483431edu.45.2022.07.13.01.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 01:18:13 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 04/11] hw/isa/piix3: QOM'ify ACPI controller creation
Date: Wed, 13 Jul 2022 10:17:28 +0200
Message-Id: <20220713081735.112016-5-shentey@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220713081735.112016-1-shentey@gmail.com>
References: <20220713081735.112016-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The ACPI controller is an integral part of PIIX3 (function 3). So create
it as part of the southbridge.

Note that the ACPI function is optional in QEMU. This is why it gets
unparented if it is disabled, otherwiese QEMU will abort with:

  src/hw/core/qdev.c:357: qdev_assert_realized_properly_cb: Assertion `dev->realized' failed

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc_piix.c             | 22 ++++++++++++----------
 hw/isa/piix3.c                | 16 ++++++++++++++++
 include/hw/southbridge/piix.h |  3 +++
 3 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 96dc0db729..364c73b1bc 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -44,11 +44,11 @@
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
@@ -83,6 +83,7 @@ static void pc_init1(MachineState *machine,
     MemoryRegion *system_io = get_system_io();
     PCIBus *pci_bus;
     ISABus *isa_bus;
+    Object *piix4_pm;
     int piix3_devfn = -1;
     qemu_irq smi_irq;
     GSIState *gsi_state;
@@ -212,13 +213,21 @@ static void pc_init1(MachineState *machine,
         pci_dev = pci_new_multifunction(-1, true, type);
         object_property_set_bool(OBJECT(pci_dev), "has-usb",
                                  machine_usb(machine), &error_abort);
+        object_property_set_bool(OBJECT(pci_dev), "has-acpi",
+                                 x86_machine_is_acpi_enabled(x86ms),
+                                 &error_abort);
+        object_property_set_bool(OBJECT(pci_dev), "smm-enabled",
+                                 x86_machine_is_smm_enabled(x86ms),
+                                 &error_abort);
         pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
         piix3 = PIIX3_PCI_DEVICE(pci_dev);
         piix3->pic = x86ms->gsi;
         piix3_devfn = piix3->dev.devfn;
         isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
+        piix4_pm = object_resolve_path_component(OBJECT(pci_dev), "pm");
     } else {
         pci_bus = NULL;
+        piix4_pm = NULL;
         isa_bus = isa_bus_new(NULL, get_system_memory(), system_io,
                               &error_abort);
         i8257_dma_init(isa_bus, 0);
@@ -283,15 +292,8 @@ static void pc_init1(MachineState *machine,
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
@@ -305,7 +307,7 @@ static void pc_init1(MachineState *machine,
                                  object_property_allow_set_link,
                                  OBJ_PROP_LINK_STRONG);
         object_property_set_link(OBJECT(machine), PC_MACHINE_ACPI_DEVICE_PROP,
-                                 OBJECT(piix4_pm), &error_abort);
+                                 piix4_pm, &error_abort);
     }
 
     if (machine->nvdimms_state->is_enabled) {
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index dd512cca84..5db0bbf7b6 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -324,6 +324,16 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
     } else {
         object_unparent(OBJECT(&d->uhci));
     }
+
+    /* ACPI */
+    if (d->has_acpi) {
+        qdev_prop_set_int32(DEVICE(&d->pm), "addr", dev->devfn + 3);
+        if (!qdev_realize(DEVICE(&d->pm), BUS(pci_bus), errp)) {
+            return;
+        }
+    } else {
+        object_unparent(OBJECT(&d->pm));
+    }
 }
 
 static void build_pci_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
@@ -344,9 +354,15 @@ static void pci_piix3_init(Object *obj)
     PIIX3State *d = PIIX3_PCI_DEVICE(obj);
 
     object_initialize_child(obj, "uhci", &d->uhci, "piix3-usb-uhci");
+
+    object_initialize_child(obj, "pm", &d->pm, TYPE_PIIX4_PM);
+    qdev_prop_set_uint32(DEVICE(&d->pm), "smb_io_base", 0xb100);
+    object_property_add_alias(obj, "smm-enabled",
+                              OBJECT(&d->pm), "smm-enabled");
 }
 
 static Property pci_piix3_props[] = {
+    DEFINE_PROP_BOOL("has-acpi", PIIX3State, has_acpi, true),
     DEFINE_PROP_BOOL("has-usb", PIIX3State, has_usb, true),
     DEFINE_PROP_END_OF_LIST(),
 };
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 115311d932..ee847cb4f2 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -14,6 +14,7 @@
 
 #include "hw/pci/pci.h"
 #include "qom/object.h"
+#include "hw/acpi/piix4.h"
 #include "hw/usb/hcd-uhci.h"
 
 /* PIRQRC[A:D]: PIRQx Route Control Registers */
@@ -54,6 +55,7 @@ struct PIIXState {
     int32_t pci_irq_levels_vmstate[PIIX_NUM_PIRQS];
 
     UHCIState uhci;
+    PIIX4PMState pm;
 
     /* Reset Control Register contents */
     uint8_t rcr;
@@ -61,6 +63,7 @@ struct PIIXState {
     /* IO memory region for Reset Control Register (PIIX_RCR_IOPORT) */
     MemoryRegion rcr_mem;
 
+    bool has_acpi;
     bool has_usb;
 };
 typedef struct PIIXState PIIX3State;
-- 
2.37.1


