Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F3D641F1D
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 20:10:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1uKu-0001nk-7k; Sun, 04 Dec 2022 14:07:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uKs-0001n5-IV; Sun, 04 Dec 2022 14:07:34 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uKq-0001ch-Jw; Sun, 04 Dec 2022 14:07:34 -0500
Received: by mail-ed1-x52e.google.com with SMTP id f7so13056115edc.6;
 Sun, 04 Dec 2022 11:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tU4iV5+3mv7YEG/Owr1VeCDUbVIp+8xvdYog5RuPpXM=;
 b=GxYzxhv+bD4kMo1rscMTrd72/L7FMqq+iRrmJ8/0XnMTqLjCMwsnrEvKcI2n3bL37t
 H1AyssPIYMWnS/vanLfj0wQpgs8iq4eNH5bUwO1x8wjVcZDwsH98xBqfxUc7BIO/T5e5
 BOmzma4TcKqUlay0LEtXc4kZGiclgtlBWhuu6X6JlQVTP43nXM+n4ebtE7tcnuS6slDl
 qHNG8F5xscELsciA8bDdyzELF3e6siToWkZ0+9PAXgD4UWd1aJsLb7wdeedsL4/NH/Le
 Hgea/oQSDvmEjUZktn1bJbSZf0er0/1bISvARdkfU7Yj7O/WamksDJyc+l7UXyk3bOY3
 rL6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tU4iV5+3mv7YEG/Owr1VeCDUbVIp+8xvdYog5RuPpXM=;
 b=GrsA3cQWZfdmbpBQySsPlfA1Pw0+RkSFDo84td2KSTvF+eM80MEzi0AWy6tN6johl6
 nLs5gdSy5voWmNiHWyYMCu0t5HNNcXznRhpPoGAYWKm6EjEBylUXJ7pX3rHzqrLysN8T
 NaZNcDiRGmBwq4fo6tKtWYkmn8CGCf1Q8ZDmLTREYAX+JA8jXFWlcEyO3hEhR5YjCbV5
 1UgD1neXwLF6UVjJkMmLnQThfSRF3z7QDtSZ61Zp2reuvTbNdU2JMMupfq6/Owmkk24/
 xn5uejuD3CipqpervF08rrBYtn8mH3UF/2L0tpfm2TtTBrimXvtgT/NcgWBxMOmZBgRJ
 kCXg==
X-Gm-Message-State: ANoB5pnuQCn3PRkU12awXQGAVGYT/ldXd4YQMTXlNi0xC5VofrobSStD
 8PER3kqKT/0R2/+mBc2iQrZIA57vKmo=
X-Google-Smtp-Source: AA0mqf5hntAjvC+JCN0dVjV8iZgbWCVc5tBpIDtak39AhkVK+xWQ81MQKZNncDi9wNgPWTIRbfWMaw==
X-Received: by 2002:aa7:cc04:0:b0:463:1a0c:4dd1 with SMTP id
 q4-20020aa7cc04000000b004631a0c4dd1mr63649006edt.137.1670180850274; 
 Sun, 04 Dec 2022 11:07:30 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-089-012-182-051.89.12.pool.telefonica.de. [89.12.182.51])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a17090623ea00b00782ee6b34f2sm5359835ejg.183.2022.12.04.11.07.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 11:07:29 -0800 (PST)
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
Subject: [PATCH 07/32] hw/i386/pc: Create RTC controllers in south bridges
Date: Sun,  4 Dec 2022 20:05:28 +0100
Message-Id: <20221204190553.3274-8-shentey@gmail.com>
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

Just like in the real hardware (and in PIIX4), create the RTC
controllers in the south bridges.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Message-Id: <20221022150508.26830-11-shentey@gmail.com>
---
 hw/i386/pc.c                  | 12 +++++++++++-
 hw/i386/pc_piix.c             |  8 ++++++++
 hw/i386/pc_q35.c              |  1 +
 hw/isa/Kconfig                |  2 ++
 hw/isa/lpc_ich9.c             |  8 ++++++++
 hw/isa/piix3.c                | 15 +++++++++++++++
 include/hw/i386/ich9.h        |  2 ++
 include/hw/southbridge/piix.h |  3 +++
 8 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 546b703cb4..9379cf4374 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1299,7 +1299,17 @@ void pc_basic_device_init(struct PCMachineState *pcms,
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
index caa983d76e..7de2f1092b 100644
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
@@ -225,10 +226,17 @@ static void pc_init1(MachineState *machine,
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
index 1da6d34339..b5cd876dc2 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -239,6 +239,7 @@ static void pc_q35_init(MachineState *machine)
     lpc = pci_create_simple_multifunction(host_bus, PCI_DEVFN(ICH9_LPC_DEV,
                                           ICH9_LPC_FUNC), true,
                                           TYPE_ICH9_LPC_DEVICE);
+    rtc_state = ISA_DEVICE(object_resolve_path_component(OBJECT(lpc), "rtc"));
 
     object_property_add_link(OBJECT(machine), PC_MACHINE_ACPI_DEVICE_PROP,
                              TYPE_HOTPLUG_HANDLER,
diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index 18b5c6bf3f..af5ec9cd61 100644
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
     select ISA_BUS
     select ACPI_SMBUS
     select ACPI_X86_ICH
+    select MC146818RTC
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 6c44cc9767..eb230a1a23 100644
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
index eabad7ba58..c68e51ddad 100644
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
@@ -312,6 +313,12 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
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
@@ -338,6 +345,13 @@ static void build_pci_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
     }
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
@@ -364,6 +378,7 @@ static const TypeInfo piix3_pci_type_info = {
     .name = TYPE_PIIX3_PCI_DEVICE,
     .parent = TYPE_PCI_DEVICE,
     .instance_size = sizeof(PIIX3State),
+    .instance_init = pci_piix3_init,
     .abstract = true,
     .class_init = pci_piix3_class_init,
     .interfaces = (InterfaceInfo[]) {
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
index 2693778b23..b1fa08dd2b 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -14,6 +14,7 @@
 
 #include "hw/pci/pci.h"
 #include "qom/object.h"
+#include "hw/rtc/mc146818rtc.h"
 
 /* PIRQRC[A:D]: PIRQx Route Control Registers */
 #define PIIX_PIRQCA 0x60
@@ -52,6 +53,8 @@ struct PIIXState {
     /* This member isn't used. Just for save/load compatibility */
     int32_t pci_irq_levels_vmstate[PIIX_NUM_PIRQS];
 
+    RTCState rtc;
+
     /* Reset Control Register contents */
     uint8_t rcr;
 
-- 
2.38.1


