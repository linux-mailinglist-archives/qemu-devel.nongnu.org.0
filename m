Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D8C693751
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 13:41:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRBe4-00080w-BC; Sun, 12 Feb 2023 07:39:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRBd3-0007Zc-C7; Sun, 12 Feb 2023 07:38:51 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRBd1-0001Ip-74; Sun, 12 Feb 2023 07:38:48 -0500
Received: by mail-ej1-x62d.google.com with SMTP id c26so21081371ejz.10;
 Sun, 12 Feb 2023 04:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IgRVLM/mt7yryQedwUf9VWBy63KyxJz4QbXruPMxZ9I=;
 b=TKDmEjp3QVWwzoEQwsLH44hFVDbgToJcZ/L+oxPE4MZQZtVLiGSLvtANNtotiui7Z5
 pb1FiCSNByHr6/zgZkFJklR9VUr5vfuYPxaSC1xBfcytjjj0BPj917+lFVBX+lXc4nrP
 fW+I+oj8tTbcYcfSadQQqDZEoJXuPEd79/fs2e7VWuRs7/0wbZNJCXKVlK0fqrdI8hyG
 3Fpo+lNRJugbkUDIpBHZO/DTZ/1XuZe0FSKaDGxhMEn1pV7BYoVXhcdHvTCz26ITM0lU
 m63xVDxIJnYZvEo5VYBLv/1nFyjLVkCKwiSlLmev7ZrVJ9MEB9AmOr1qBNESBD4lBD3e
 8zDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IgRVLM/mt7yryQedwUf9VWBy63KyxJz4QbXruPMxZ9I=;
 b=dEcB9/itTwmN/cMQqr6XFr4rrh4CWMQCdqL6tR2JO0sxsQuajamsCXg3dQqwhmqI8f
 fDfYnq8vdJ3CCuFtAUjAMTAYWa5KtjNquD32r018sjbfhpKccXn3hOps8UJFFA/id1Km
 SzuHF/bAS+afauvoxjvrXwqcfTWf/8xnoWVptC4IoaDOlfVAfETM8Zg+bfMBnLdNPIG4
 caTF9sZc7TXIhw+SP/rErTJEKBYlO8kdOy1qNvSo7i1KSvDx7Qimm2XzKElIWXX0XK2Z
 74OSCZz9XP8V494efRSQjLsabn8rhE0WkRlwxnFJloczLrbKkmGSxel5k65fD5qkxeaG
 BaEQ==
X-Gm-Message-State: AO0yUKUrZliKYY9zU8zvO6doeg1rNXPvFnvCqw5+kywE+wOdbwDjwSES
 zovkD66I3l8S2k6ZK9ZfeeFNECtSXMU=
X-Google-Smtp-Source: AK7set8YJRbeCkKSIv7w1ebRR0dNhwxatyYCgn4zeAtjY/s62QKgTIyCZ+JWRPpiFlubvO28gsmKEA==
X-Received: by 2002:a17:906:52c4:b0:860:5723:a5e5 with SMTP id
 w4-20020a17090652c400b008605723a5e5mr19558150ejn.69.1676205524318; 
 Sun, 12 Feb 2023 04:38:44 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-011-172-153.77.11.pool.telefonica.de. [77.11.172.153])
 by smtp.gmail.com with ESMTPSA id
 qw14-20020a170906fcae00b008af1f1bee79sm5233164ejb.9.2023.02.12.04.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 04:38:43 -0800 (PST)
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
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v7 05/23] hw/isa/piix3: Create power management controller in
 host device
Date: Sun, 12 Feb 2023 13:37:47 +0100
Message-Id: <20230212123805.30799-6-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230212123805.30799-1-shentey@gmail.com>
References: <20230212123805.30799-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
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
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-14-shentey@gmail.com>
---
 include/hw/southbridge/piix.h |  6 ++++++
 hw/i386/pc_piix.c             | 24 ++++++++++++++----------
 hw/isa/piix3.c                | 14 ++++++++++++++
 hw/isa/Kconfig                |  1 +
 4 files changed, 35 insertions(+), 10 deletions(-)

diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 762709f2fd..b1eaab1d95 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -14,6 +14,7 @@
 
 #include "hw/pci/pci_device.h"
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
 
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 61d8152078..5ea8d4a585 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -46,12 +46,12 @@
 #include "sysemu/kvm.h"
 #include "hw/kvm/clock.h"
 #include "hw/sysbus.h"
+#include "hw/i2c/i2c.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/xen/xen-x86.h"
 #include "hw/xen/xen.h"
 #include "exec/memory.h"
 #include "hw/acpi/acpi.h"
-#include "hw/acpi/piix4.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "sysemu/xen.h"
@@ -97,6 +97,7 @@ static void pc_init1(MachineState *machine,
     MemoryRegion *system_io = get_system_io();
     PCIBus *pci_bus;
     ISABus *isa_bus;
+    Object *piix4_pm;
     int piix3_devfn = -1;
     qemu_irq smi_irq;
     GSIState *gsi_state;
@@ -237,15 +238,25 @@ static void pc_init1(MachineState *machine,
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
+
         piix3 = PIIX3_PCI_DEVICE(pci_dev);
         piix3->pic = x86ms->gsi;
         piix3_devfn = piix3->dev.devfn;
         isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
         rtc_state = ISA_DEVICE(object_resolve_path_component(OBJECT(pci_dev),
                                                              "rtc"));
+        piix4_pm = object_resolve_path_component(OBJECT(pci_dev), "pm");
     } else {
         pci_bus = NULL;
+        piix4_pm = NULL;
         isa_bus = isa_bus_new(NULL, get_system_memory(), system_io,
                               &error_abort);
 
@@ -315,15 +326,8 @@ static void pc_init1(MachineState *machine,
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
@@ -337,7 +341,7 @@ static void pc_init1(MachineState *machine,
                                  object_property_allow_set_link,
                                  OBJ_PROP_LINK_STRONG);
         object_property_set_link(OBJECT(machine), PC_MACHINE_ACPI_DEVICE_PROP,
-                                 OBJECT(piix4_pm), &error_abort);
+                                 piix4_pm, &error_abort);
     }
 
     if (machine->nvdimms_state->is_enabled) {
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 7ae031f2c5..27bd4dbf65 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -319,6 +319,17 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
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
@@ -350,7 +361,10 @@ static void pci_piix3_init(Object *obj)
 }
 
 static Property pci_piix3_props[] = {
+    DEFINE_PROP_UINT32("smb_io_base", PIIX3State, smb_io_base, 0),
+    DEFINE_PROP_BOOL("has-acpi", PIIX3State, has_acpi, true),
     DEFINE_PROP_BOOL("has-usb", PIIX3State, has_usb, true),
+    DEFINE_PROP_BOOL("smm-enabled", PIIX3State, smm_enabled, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index f01bc0dff3..cf79580384 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -33,6 +33,7 @@ config PC87312
 
 config PIIX3
     bool
+    select ACPI_PIIX4
     select I8257
     select ISA_BUS
     select MC146818RTC
-- 
2.39.1


