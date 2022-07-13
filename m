Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F1157318F
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 10:49:50 +0200 (CEST)
Received: from localhost ([::1]:44758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBY44-0006Hq-Qj
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 04:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oBXZY-0005dY-52
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 04:18:16 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:44547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oBXZW-0004nr-9y
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 04:18:15 -0400
Received: by mail-ed1-x530.google.com with SMTP id m16so13083216edb.11
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 01:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GG5bkcTJ/ZyZ9QoHxkY/kklFd5clnYhDbXnHDz0jhbA=;
 b=GL5nXKnF+zB7r/fD9z3uABoOlaD1TFbva2/bhLvJXKkzOnmC/8F44P67CnJtRlt310
 J2j0Q9+aVmHrMRNk2IwiIofeHd96zt593qJ5FRYmIm2J60E1e/sY2PRq+RK9rbLlWevo
 jkfyFMj5tm6mJge95Jz3HeLfCIvxPzPn8w6t93dKYEVPvqjqGqxXfNZoqzH+VkEHVPN4
 B2/9GeSk5tBY6iG96b051/s0iwJlOiZ235ixzrPoMEiazKjb1GXOY1IcGgDlD6GPfrYV
 7HT/GWdyJI5RGr5SLqDedZTyMr5etV+jZEg0xp1xNsaeE3lec97AvUmM5bMvTHCcFsNz
 WYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GG5bkcTJ/ZyZ9QoHxkY/kklFd5clnYhDbXnHDz0jhbA=;
 b=isfa3JhtdQrv/K5WjJWOhXHdqIPnhhOXFvfbfP35Bc9BF99b46N5OKB4w3DpBR2t6j
 H5QGmB8bvpOFqh1i5R3R1kE046Pt7YRDTQbKI7OQq0rVUv+qQxJzXwrGXpy/VLs/u/b7
 Aa+H7tz6W4uuD9dlKnRSbTWoYlzz/DOt/R5BWOT+yOBOoVWNxS+Qi5CFFcPzpiXPVTNN
 QfZDDHe6++USEQ81sBPQFHYzSMtY/Edh9XWOh9gIJJQbwHgChk74D5AW6xUtBhOxCrSY
 pPt6jCx6GG2Pomp1mu+ZKXOYMD1yG2urNxL6bgztIntzDMXbx5WwYrGuiZuJeSyj4bWH
 Px9Q==
X-Gm-Message-State: AJIora/UfX4mDNmwtC8XSuBBSWqimSMAPZ9mwqNvUZyl64+K0GkaHEKC
 IbAtEPZ4e7damicMkiy6c9pE7L6E71k=
X-Google-Smtp-Source: AGRyM1tyHwzCrGJsGJBZZ5+fAdYkrdu4IadgOxUZASeQ2LWgWcVAfU02ftHheOHQmFoUisY7GGyKjw==
X-Received: by 2002:a05:6402:150d:b0:43a:2cac:ca24 with SMTP id
 f13-20020a056402150d00b0043a2cacca24mr3188761edw.110.1657700292866; 
 Wed, 13 Jul 2022 01:18:12 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-183-210-047.77.183.pool.telefonica.de. [77.183.210.47])
 by smtp.gmail.com with ESMTPSA id
 w13-20020aa7dccd000000b00435a62d35b5sm7483431edu.45.2022.07.13.01.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 01:18:12 -0700 (PDT)
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
Subject: [PATCH 03/11] hw/isa/piix3: QOM'ify USB controller creation
Date: Wed, 13 Jul 2022 10:17:27 +0200
Message-Id: <20220713081735.112016-4-shentey@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220713081735.112016-1-shentey@gmail.com>
References: <20220713081735.112016-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x530.google.com
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

The USB controller is an integral part of PIIX3 (function 2). So create
it as part of the southbridge.

Note that the USB function is optional in QEMU. This is why it gets
unparented if it is disabled, otherwiese QEMU will abort with:

  src/hw/core/qdev.c:357: qdev_assert_realized_properly_cb: Assertion `dev->realized' failed

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc_piix.c             |  6 ++----
 hw/isa/piix3.c                | 26 ++++++++++++++++++++++++++
 include/hw/southbridge/piix.h |  5 +++++
 3 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index f129da29ac..96dc0db729 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -210,6 +210,8 @@ static void pc_init1(MachineState *machine,
         pcms->bus = pci_bus;
 
         pci_dev = pci_new_multifunction(-1, true, type);
+        object_property_set_bool(OBJECT(pci_dev), "has-usb",
+                                 machine_usb(machine), &error_abort);
         pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
         piix3 = PIIX3_PCI_DEVICE(pci_dev);
         piix3->pic = x86ms->gsi;
@@ -281,10 +283,6 @@ static void pc_init1(MachineState *machine,
     }
 #endif
 
-    if (pcmc->pci_enabled && machine_usb(machine)) {
-        pci_create_simple(pci_bus, piix3_devfn + 2, "piix3-usb-uhci");
-    }
-
     if (pcmc->pci_enabled && x86_machine_is_acpi_enabled(X86_MACHINE(pcms))) {
         PCIDevice *piix4_pm;
 
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 44a9998752..dd512cca84 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -27,6 +27,7 @@
 #include "qapi/error.h"
 #include "hw/dma/i8257.h"
 #include "hw/southbridge/piix.h"
+#include "hw/ide/pci.h"
 #include "hw/irq.h"
 #include "hw/isa/isa.h"
 #include "hw/xen/xen.h"
@@ -296,6 +297,7 @@ static const MemoryRegionOps rcr_ops = {
 static void pci_piix3_realize(PCIDevice *dev, Error **errp)
 {
     PIIX3State *d = PIIX3_PCI_DEVICE(dev);
+    PCIBus *pci_bus = pci_get_bus(dev);
     ISABus *isa_bus;
 
     isa_bus = isa_bus_new(DEVICE(d), get_system_memory(),
@@ -312,6 +314,16 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
     qemu_register_reset(piix3_reset, d);
 
     i8257_dma_init(isa_bus, 0);
+
+    /* USB */
+    if (d->has_usb) {
+        qdev_prop_set_int32(DEVICE(&d->uhci), "addr", dev->devfn + 2);
+        if (!qdev_realize(DEVICE(&d->uhci), BUS(pci_bus), errp)) {
+            return;
+        }
+    } else {
+        object_unparent(OBJECT(&d->uhci));
+    }
 }
 
 static void build_pci_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
@@ -327,6 +339,18 @@ static void build_pci_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
     }
 }
 
+static void pci_piix3_init(Object *obj)
+{
+    PIIX3State *d = PIIX3_PCI_DEVICE(obj);
+
+    object_initialize_child(obj, "uhci", &d->uhci, "piix3-usb-uhci");
+}
+
+static Property pci_piix3_props[] = {
+    DEFINE_PROP_BOOL("has-usb", PIIX3State, has_usb, true),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void pci_piix3_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -345,12 +369,14 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
      * pc_piix.c's pc_init1()
      */
     dc->user_creatable = false;
+    device_class_set_props(dc, pci_piix3_props);
     adevc->build_dev_aml = build_pci_isa_aml;
 }
 
 static const TypeInfo piix3_pci_type_info = {
     .name = TYPE_PIIX3_PCI_DEVICE,
     .parent = TYPE_PCI_DEVICE,
+    .instance_init  = pci_piix3_init,
     .instance_size = sizeof(PIIX3State),
     .abstract = true,
     .class_init = pci_piix3_class_init,
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 2693778b23..115311d932 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -14,6 +14,7 @@
 
 #include "hw/pci/pci.h"
 #include "qom/object.h"
+#include "hw/usb/hcd-uhci.h"
 
 /* PIRQRC[A:D]: PIRQx Route Control Registers */
 #define PIIX_PIRQCA 0x60
@@ -52,11 +53,15 @@ struct PIIXState {
     /* This member isn't used. Just for save/load compatibility */
     int32_t pci_irq_levels_vmstate[PIIX_NUM_PIRQS];
 
+    UHCIState uhci;
+
     /* Reset Control Register contents */
     uint8_t rcr;
 
     /* IO memory region for Reset Control Register (PIIX_RCR_IOPORT) */
     MemoryRegion rcr_mem;
+
+    bool has_usb;
 };
 typedef struct PIIXState PIIX3State;
 
-- 
2.37.1


