Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B8B573145
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 10:37:55 +0200 (CEST)
Received: from localhost ([::1]:56156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBXsY-0002aL-Me
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 04:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oBXZa-0005e2-8O
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 04:18:18 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:37572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oBXZY-0004oN-Et
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 04:18:17 -0400
Received: by mail-ej1-x632.google.com with SMTP id os14so18527539ejb.4
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 01:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+1sam7yfU2WFzJ6rgFfOXPI1HygoETE9geq2jw/N8O8=;
 b=ExxBr2e/e+YwvveFOr5NvnniKknOM7eYGdS2KFdcXeb4tnPoJaWKyuOYzT7m3cXl07
 gQvmkoCO0Ab4BAT1lVOqYepb5lh2RKylPdjBYNJhw1LCcHjmnODZxPGQR5+h05EQd0mX
 vk+uG6r1kYBLj9IyX22zIv2l1+2NVaVRu6SHduma5JwBc2h55F/87d96WHAtjwwvRxE7
 LJC6h3prrAns1LEOGCtxSWllD4aQUlSXeZgj9idBIvgMY//jOywH49e7CwIbfQnXR7rx
 EbNm9OWWCdZPavpdSVeMiruwyeYjAaZA08bS4WrnY9bwVPBYuwCugGXk3Lq/CUlGzfYK
 DR6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+1sam7yfU2WFzJ6rgFfOXPI1HygoETE9geq2jw/N8O8=;
 b=QSUGs3kvbd5upWGRKs1bfAo7hG4AYjxmrDXNM69lvEPAqAMmnKxSAFr1I1mlduSkxh
 Pfbvaoh4NhkYVAEVkIDxV9vHX6UWD+aJPSZIVkhQnz/UV6KR6FKhSbyQYPR5RTTrBmok
 ZI42YPAL0uwEdnGPDD7FWJaqeemgAWI/rYqNswBSpn4C9oUS0MIkejoXf8uXBBA2MSV2
 Z78zTenPTCfUOFeUdIoejeOxWPwEuxc8zM5b1iXnn8boxfauCQzxVqUnq3+djVXQ+M8v
 tZYOX0t3PRWSD8eOccyYUj4MDe3HW99c7ZmcIphQqh7p5FL8MMc/UL1wbHxdmokkw1No
 LXsA==
X-Gm-Message-State: AJIora8clZLgK+Rfqtir+pC16WgZ5KcrOb8AVTePSgZCaLpZSvvDPEsN
 WkEb0r/DKqUu3xLRUkIM7Pdxvu6ZocU=
X-Google-Smtp-Source: AGRyM1uV5KgZY3Ib1XaBug4IGThmSkm8LI8KmB0+oxeu7MNaw/wmiSc5mH9TCRJsw7LKB6zMUH+Wsg==
X-Received: by 2002:a17:907:7fa5:b0:72b:755a:b77e with SMTP id
 qk37-20020a1709077fa500b0072b755ab77emr2231952ejc.474.1657700294946; 
 Wed, 13 Jul 2022 01:18:14 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-183-210-047.77.183.pool.telefonica.de. [77.183.210.47])
 by smtp.gmail.com with ESMTPSA id
 w13-20020aa7dccd000000b00435a62d35b5sm7483431edu.45.2022.07.13.01.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 01:18:14 -0700 (PDT)
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
Subject: [PATCH 05/11] hw/i386/pc: QOM'ify RTC creation
Date: Wed, 13 Jul 2022 10:17:29 +0200
Message-Id: <20220713081735.112016-6-shentey@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220713081735.112016-1-shentey@gmail.com>
References: <20220713081735.112016-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x632.google.com
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

Just like in the real hardware, create the RTC in the southbridges.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc.c                  | 12 ++++++++++--
 hw/i386/pc_piix.c             |  8 ++++++++
 hw/i386/pc_q35.c              |  1 +
 hw/isa/lpc_ich9.c             |  8 ++++++++
 hw/isa/piix3.c                |  7 +++++++
 include/hw/i386/ich9.h        |  2 ++
 include/hw/southbridge/piix.h |  2 ++
 7 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index c3602d166d..eba1c98b5a 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1181,9 +1181,17 @@ void pc_basic_device_init(struct PCMachineState *pcms,
         pit_alt_irq = qdev_get_gpio_in(hpet, HPET_LEGACY_PIT_INT);
         rtc_irq = qdev_get_gpio_in(hpet, HPET_LEGACY_RTC_INT);
     }
-    *rtc_state = mc146818_rtc_init(isa_bus, 2000, rtc_irq);
 
-    qemu_register_boot_set(pc_boot_set, *rtc_state);
+    if (rtc_irq) {
+        qdev_connect_gpio_out(DEVICE(*rtc_state), 0, rtc_irq);
+    } else {
+        uint32_t irq = object_property_get_uint(OBJECT(*rtc_state),
+                                                "irq",
+                                                &error_fatal);
+        isa_connect_gpio_out(*rtc_state, 0, irq);
+    }
+
+    qemu_register_boot_set(pc_boot_set, rtc_state);
 
     if (!xen_enabled() &&
         (x86ms->pit == ON_OFF_AUTO_AUTO || x86ms->pit == ON_OFF_AUTO_ON)) {
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 364c73b1bc..52c550f8b8 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -32,6 +32,7 @@
 #include "hw/i386/pc.h"
 #include "hw/i386/apic.h"
 #include "hw/pci-host/i440fx.h"
+#include "hw/rtc/mc146818rtc.h"
 #include "hw/southbridge/piix.h"
 #include "hw/display/ramfb.h"
 #include "hw/firmware/smbios.h"
@@ -224,12 +225,19 @@ static void pc_init1(MachineState *machine,
         piix3->pic = x86ms->gsi;
         piix3_devfn = piix3->dev.devfn;
         isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
+        rtc_state = ISA_DEVICE(object_resolve_path_component(OBJECT(pci_dev),
+                                                             "rtc"));
         piix4_pm = object_resolve_path_component(OBJECT(pci_dev), "pm");
     } else {
         pci_bus = NULL;
         piix4_pm = NULL;
         isa_bus = isa_bus_new(NULL, get_system_memory(), system_io,
                               &error_abort);
+
+        rtc_state = isa_new(TYPE_MC146818_RTC);
+        qdev_prop_set_int32(DEVICE(rtc_state), "base_year", 2000);
+        isa_realize_and_unref(rtc_state, isa_bus, &error_fatal);
+
         i8257_dma_init(isa_bus, 0);
         pcms->hpet_enabled = false;
     }
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index f96cbd04e2..d850313180 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -230,6 +230,7 @@ static void pc_q35_init(MachineState *machine)
     lpc = pci_create_simple_multifunction(host_bus, PCI_DEVFN(ICH9_LPC_DEV,
                                           ICH9_LPC_FUNC), true,
                                           TYPE_ICH9_LPC_DEVICE);
+    rtc_state = ISA_DEVICE(object_resolve_path_component(OBJECT(lpc), "rtc"));
 
     object_property_add_link(OBJECT(machine), PC_MACHINE_ACPI_DEVICE_PROP,
                              TYPE_HOTPLUG_HANDLER,
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 8694e58b21..0051fa66ab 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -660,6 +660,8 @@ static void ich9_lpc_initfn(Object *obj)
     static const uint8_t acpi_enable_cmd = ICH9_APM_ACPI_ENABLE;
     static const uint8_t acpi_disable_cmd = ICH9_APM_ACPI_DISABLE;
 
+    object_initialize_child(obj, "rtc", &lpc->rtc, TYPE_MC146818_RTC);
+
     object_property_add_uint8_ptr(obj, ACPI_PM_PROP_SCI_INT,
                                   &lpc->sci_gsi, OBJ_PROP_FLAG_READ);
     object_property_add_uint8_ptr(OBJECT(lpc), ACPI_PM_PROP_ACPI_ENABLE_CMD,
@@ -725,6 +727,12 @@ static void ich9_lpc_realize(PCIDevice *d, Error **errp)
     isa_bus_irqs(isa_bus, lpc->gsi);
 
     i8257_dma_init(isa_bus, 0);
+
+    /* RTC */
+    qdev_prop_set_int32(DEVICE(&lpc->rtc), "base_year", 2000);
+    if (!qdev_realize(DEVICE(&lpc->rtc), BUS(isa_bus), errp)) {
+        return;
+    }
 }
 
 static bool ich9_rst_cnt_needed(void *opaque)
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 5db0bbf7b6..afd36178dd 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -315,6 +315,12 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
 
     i8257_dma_init(isa_bus, 0);
 
+    /* RTC */
+    qdev_prop_set_int32(DEVICE(&d->rtc), "base_year", 2000);
+    if (!qdev_realize(DEVICE(&d->rtc), BUS(isa_bus), errp)) {
+        return;
+    }
+
     /* USB */
     if (d->has_usb) {
         qdev_prop_set_int32(DEVICE(&d->uhci), "addr", dev->devfn + 2);
@@ -353,6 +359,7 @@ static void pci_piix3_init(Object *obj)
 {
     PIIX3State *d = PIIX3_PCI_DEVICE(obj);
 
+    object_initialize_child(obj, "rtc", &d->rtc, TYPE_MC146818_RTC);
     object_initialize_child(obj, "uhci", &d->uhci, "piix3-usb-uhci");
 
     object_initialize_child(obj, "pm", &d->pm, TYPE_PIIX4_PM);
diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
index 23ee8e371b..672efc6bce 100644
--- a/include/hw/i386/ich9.h
+++ b/include/hw/i386/ich9.h
@@ -11,6 +11,7 @@
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/ich9.h"
 #include "hw/pci/pci_bus.h"
+#include "hw/rtc/mc146818rtc.h"
 #include "qom/object.h"
 
 void ich9_lpc_set_irq(void *opaque, int irq_num, int level);
@@ -39,6 +40,7 @@ struct ICH9LPCState {
     */
     uint8_t irr[PCI_SLOT_MAX][PCI_NUM_PINS];
 
+    RTCState rtc;
     APMState apm;
     ICH9LPCPMRegs pm;
     uint32_t sci_level; /* track sci level */
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index ee847cb4f2..15b05cfc93 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -15,6 +15,7 @@
 #include "hw/pci/pci.h"
 #include "qom/object.h"
 #include "hw/acpi/piix4.h"
+#include "hw/rtc/mc146818rtc.h"
 #include "hw/usb/hcd-uhci.h"
 
 /* PIRQRC[A:D]: PIRQx Route Control Registers */
@@ -54,6 +55,7 @@ struct PIIXState {
     /* This member isn't used. Just for save/load compatibility */
     int32_t pci_irq_levels_vmstate[PIIX_NUM_PIRQS];
 
+    RTCState rtc;
     UHCIState uhci;
     PIIX4PMState pm;
 
-- 
2.37.1


