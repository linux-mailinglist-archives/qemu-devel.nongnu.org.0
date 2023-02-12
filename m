Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8A769374B
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 13:40:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRBdF-0007Zi-Jo; Sun, 12 Feb 2023 07:39:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRBcx-0007Z1-Ej; Sun, 12 Feb 2023 07:38:43 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRBcu-0001IU-Qn; Sun, 12 Feb 2023 07:38:43 -0500
Received: by mail-ej1-x633.google.com with SMTP id ml19so26032170ejb.0;
 Sun, 12 Feb 2023 04:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c1Na9cciasVrkgG2lgTIflwBSXkta5QHNZUnEEg6Lr4=;
 b=Hsj6EKOmeK+R+VkIueD8UrBgAiiEgkHDEcS+O564iF3qBnC7enNZ4IMb10t8j+YQud
 +9iv3NRS0j+CI4IUg17xkeYhDGqaab4PQxMy2IDUYtbRTBYWiLi1UKTCN3x7uZDqPPXE
 YkBxT9QkoSIxwg/HWW98X6Ynj5HCQbwI/MUA5Voku0gUqykF28CFSozM6OobMCd1MD0P
 4W/LhPNCdGhjKfhpynepFfxxZzRytYbpegKJLm632UlXQ977U0rgt7rbsSzaOUXgf4TJ
 dhQQxDNI0TgGA8huPeBQTvv94+fJNoOn7PEnmRh6vUslaThbfuRFgvIVV0mGM4PvIF4a
 h9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c1Na9cciasVrkgG2lgTIflwBSXkta5QHNZUnEEg6Lr4=;
 b=M5sB2p2VmZNQW/hvmPkqrqTkcr+wyqhaKYAR4OTmRrvZl6l0WbiQ2ZuJ4FU05OOb27
 zS2k9XDMvnZVj5W9PfuRuTcqo84tmyxB9QHBKmJhZKpbDwggHARk6rxjRgj+N1Frlc05
 kTgTkUCMvBWcuT1UiwlQ6ut3xCI401Bi+tlRb9ZbIhPVQepw/daTFGlHZc2V0PwMHRHf
 GYc22mFHlzbVH0v6kXTs1dkYNm8/FiycbWmUHL67FLk59lpbZR/oXzZKtoAHEyL/hXmU
 UGK4SM9ySyombHnyNJ+/zxEDxDQFyIEj2tLjvKw7KmcGwsOHeSWfi6iIuDwbLuvtlkSi
 g4wA==
X-Gm-Message-State: AO0yUKVks5r4IHFM4vZvXjEL45wS8lKAH2Wm9hA/wyySbxX2bTwSoH/2
 bddcoCEfp8rtmDx/PtXP9soxOlJ6g+I=
X-Google-Smtp-Source: AK7set+TJBdeykzc90lXd3xJrEhNo7DOL96JgiiAbjW/2dpRK+OjOxVLIiSlN4+uJbalMki6/czzAg==
X-Received: by 2002:a17:907:8b8b:b0:8aa:f2f2:7543 with SMTP id
 tb11-20020a1709078b8b00b008aaf2f27543mr23772244ejc.29.1676205518129; 
 Sun, 12 Feb 2023 04:38:38 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-011-172-153.77.11.pool.telefonica.de. [77.11.172.153])
 by smtp.gmail.com with ESMTPSA id
 qw14-20020a170906fcae00b008af1f1bee79sm5233164ejb.9.2023.02.12.04.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 04:38:37 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-arm@nongnu.org, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-ppc@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Bernhard Beschow <shentey@gmail.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v7 01/23] hw/i386/pc: Create RTC controllers in south bridges
Date: Sun, 12 Feb 2023 13:37:43 +0100
Message-Id: <20230212123805.30799-2-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230212123805.30799-1-shentey@gmail.com>
References: <20230212123805.30799-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
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

Just like in the real hardware (and in PIIX4), create the RTC
controllers in the south bridges.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20221022150508.26830-11-shentey@gmail.com>
---
 include/hw/i386/ich9.h        |  2 ++
 include/hw/southbridge/piix.h |  4 ++++
 hw/i386/pc.c                  | 12 +++++++++++-
 hw/i386/pc_piix.c             |  8 ++++++++
 hw/i386/pc_q35.c              |  1 +
 hw/isa/lpc_ich9.c             |  8 ++++++++
 hw/isa/piix3.c                | 15 +++++++++++++++
 hw/isa/Kconfig                |  2 ++
 8 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
index 222781e8b9..dab309d5e3 100644
--- a/include/hw/i386/ich9.h
+++ b/include/hw/i386/ich9.h
@@ -7,6 +7,7 @@
 #include "hw/isa/apm.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/ich9.h"
+#include "hw/rtc/mc146818rtc.h"
 #include "qom/object.h"
 
 void ich9_lpc_set_irq(void *opaque, int irq_num, int level);
@@ -35,6 +36,7 @@ struct ICH9LPCState {
     */
     uint8_t irr[PCI_SLOT_MAX][PCI_NUM_PINS];
 
+    RTCState rtc;
     APMState apm;
     ICH9LPCPMRegs pm;
     uint32_t sci_level; /* track sci level */
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 0bf48e936d..b06d26fa11 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -13,6 +13,8 @@
 #define HW_SOUTHBRIDGE_PIIX_H
 
 #include "hw/pci/pci_device.h"
+#include "qom/object.h"
+#include "hw/rtc/mc146818rtc.h"
 
 /* PIRQRC[A:D]: PIRQx Route Control Registers */
 #define PIIX_PIRQCA 0x60
@@ -51,6 +53,8 @@ struct PIIXState {
     /* This member isn't used. Just for save/load compatibility */
     int32_t pci_irq_levels_vmstate[PIIX_NUM_PIRQS];
 
+    RTCState rtc;
+
     /* Reset Control Register contents */
     uint8_t rcr;
 
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 6e592bd969..44daa36338 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1304,7 +1304,17 @@ void pc_basic_device_init(struct PCMachineState *pcms,
         pit_alt_irq = qdev_get_gpio_in(hpet, HPET_LEGACY_PIT_INT);
         rtc_irq = qdev_get_gpio_in(hpet, HPET_LEGACY_RTC_INT);
     }
-    *rtc_state = mc146818_rtc_init(isa_bus, 2000, rtc_irq);
+
+    if (rtc_irq) {
+        qdev_connect_gpio_out(DEVICE(*rtc_state), 0, rtc_irq);
+    } else {
+        uint32_t irq = object_property_get_uint(OBJECT(*rtc_state),
+                                                "irq",
+                                                &error_fatal);
+        isa_connect_gpio_out(*rtc_state, 0, irq);
+    }
+    object_property_add_alias(OBJECT(pcms), "rtc-time", OBJECT(*rtc_state),
+                              "date");
 
     qemu_register_boot_set(pc_boot_set, *rtc_state);
 
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index df64dd8dcc..8f894714e5 100644
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
@@ -239,10 +240,17 @@ static void pc_init1(MachineState *machine,
         piix3->pic = x86ms->gsi;
         piix3_devfn = piix3->dev.devfn;
         isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
+        rtc_state = ISA_DEVICE(object_resolve_path_component(OBJECT(pci_dev),
+                                                             "rtc"));
     } else {
         pci_bus = NULL;
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
index 66cd718b70..3b1a0d0cfd 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -239,6 +239,7 @@ static void pc_q35_init(MachineState *machine)
     lpc = pci_create_simple_multifunction(host_bus, PCI_DEVFN(ICH9_LPC_DEV,
                                           ICH9_LPC_FUNC), true,
                                           TYPE_ICH9_LPC_DEVICE);
+    rtc_state = ISA_DEVICE(object_resolve_path_component(OBJECT(lpc), "rtc"));
 
     object_property_add_link(OBJECT(machine), PC_MACHINE_ACPI_DEVICE_PROP,
                              TYPE_HOTPLUG_HANDLER,
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 1fba3c210c..b9efae0797 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -663,6 +663,8 @@ static void ich9_lpc_initfn(Object *obj)
     static const uint8_t acpi_enable_cmd = ICH9_APM_ACPI_ENABLE;
     static const uint8_t acpi_disable_cmd = ICH9_APM_ACPI_DISABLE;
 
+    object_initialize_child(obj, "rtc", &lpc->rtc, TYPE_MC146818_RTC);
+
     object_property_add_uint8_ptr(obj, ACPI_PM_PROP_SCI_INT,
                                   &lpc->sci_gsi, OBJ_PROP_FLAG_READ);
     object_property_add_uint8_ptr(OBJECT(lpc), ACPI_PM_PROP_ACPI_ENABLE_CMD,
@@ -728,6 +730,12 @@ static void ich9_lpc_realize(PCIDevice *d, Error **errp)
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
index a9cb39bf21..f9103ea45a 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -28,6 +28,7 @@
 #include "hw/dma/i8257.h"
 #include "hw/southbridge/piix.h"
 #include "hw/irq.h"
+#include "hw/qdev-properties.h"
 #include "hw/isa/isa.h"
 #include "hw/xen/xen.h"
 #include "sysemu/runstate.h"
@@ -301,6 +302,12 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
                                         PIIX_RCR_IOPORT, &d->rcr_mem, 1);
 
     i8257_dma_init(isa_bus, 0);
+
+    /* RTC */
+    qdev_prop_set_int32(DEVICE(&d->rtc), "base_year", 2000);
+    if (!qdev_realize(DEVICE(&d->rtc), BUS(isa_bus), errp)) {
+        return;
+    }
 }
 
 static void build_pci_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
@@ -324,6 +331,13 @@ static void build_pci_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
     qbus_build_aml(bus, scope);
 }
 
+static void pci_piix3_init(Object *obj)
+{
+    PIIX3State *d = PIIX3_PCI_DEVICE(obj);
+
+    object_initialize_child(obj, "rtc", &d->rtc, TYPE_MC146818_RTC);
+}
+
 static void pci_piix3_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -350,6 +364,7 @@ static const TypeInfo piix3_pci_type_info = {
     .name = TYPE_PIIX3_PCI_DEVICE,
     .parent = TYPE_PCI_DEVICE,
     .instance_size = sizeof(PIIX3State),
+    .instance_init = pci_piix3_init,
     .abstract = true,
     .class_init = pci_piix3_class_init,
     .interfaces = (InterfaceInfo[]) {
diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index 0156a66889..c10cbc5fc1 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -35,6 +35,7 @@ config PIIX3
     bool
     select I8257
     select ISA_BUS
+    select MC146818RTC
 
 config PIIX4
     bool
@@ -79,3 +80,4 @@ config LPC_ICH9
     select I8257
     select ISA_BUS
     select ACPI_ICH9
+    select MC146818RTC
-- 
2.39.1


