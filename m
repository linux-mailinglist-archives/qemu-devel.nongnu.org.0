Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9955267671C
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Jan 2023 16:22:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJFey-00024l-MK; Sat, 21 Jan 2023 10:20:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pJFex-00022i-3r; Sat, 21 Jan 2023 10:19:59 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pJFev-0005f2-AS; Sat, 21 Jan 2023 10:19:58 -0500
Received: by mail-ej1-x62f.google.com with SMTP id vw16so20722320ejc.12;
 Sat, 21 Jan 2023 07:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jF2YbH83rQHIAsKAnE6+qCRm8caF9fDfl5YrEUOpfs8=;
 b=i/ckuqdpdZMjzOhptRJaUN4A9ExKOSgR0F2RQI/85wbTZ+DqGOjP6hK+4SB9M42VhQ
 WTFr/p4wdRe6sJxvwmyU3uWV5GOrz3vlvfRZhezlVGKTrxOgEDV2zgWPS8Hpy5BPEjry
 s06SOurfXCBe8AmyPrrcHUHvdZChlGeyn1S09M4GRs0wKJA2kVKMewgPD0EhEq73XVma
 IfF8xWok4UGERmduUQnaK40gnkrfDoeKVzlOR7dKWi78dQFvPJ4qrENEJV1PEm36FaUO
 ykGtIV09cgCKAcj3LAerWpfqRTWJi3Db2No4Xt88dq+PgXYCrdW5EKy8zYrYBTezFp1K
 H67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jF2YbH83rQHIAsKAnE6+qCRm8caF9fDfl5YrEUOpfs8=;
 b=Kcyqcf7vjkIjzDVvPaQXj5J3O4mceWwC5bEUEc6/G52MYTvPQUEmNW3qZvY3eY/cWx
 phj64ExtkJwvuxghXUEcO4nJJcFjLX1VSIyAJq7AM5mCMidtvGdXRc807yilqOmVYpFB
 0l2iU0LhSGi0uiTq4s6Zhl6CuG+SFAFXhGRYh8IBD3AC0cyyl3pVcDLxmgEuN0eSDL0s
 +0jlwKcLA1GycpTOl0kpAZwjp0bS888PQhDbHoMHTfAsiaZq55hpQbnkc67hIgsFdBPZ
 LRnwHnLenag0EL38/unv3j4JHHyySvgaiw87ouSoJQVJ7pMu2HbOSb7JlBnDW2MxdC3/
 K9cA==
X-Gm-Message-State: AFqh2koVbsDo5AA5xhuNw5yFgBGUmu1iroumcQXtP/bUaS98Y/h2JcoN
 PrI4wO3nxu6ci0po5WpsPe7xMxF/ZMBwmQ==
X-Google-Smtp-Source: AMrXdXucI1XjEIQAxgdB8ffB3/UhYgFBq5P4XRONDOz7Ip8u6yUhrtyko5ATjpiy1FYUXKlYABwexw==
X-Received: by 2002:a17:907:7da0:b0:871:89ac:decb with SMTP id
 oz32-20020a1709077da000b0087189acdecbmr26089475ejc.76.1674314395497; 
 Sat, 21 Jan 2023 07:19:55 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 20-20020a170906101400b0085ff05d5dbdsm14162567ejm.173.2023.01.21.07.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Jan 2023 07:19:55 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-trivial@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 2/7] hw/isa/isa-bus: Turn isa_build_aml() into
 qbus_build_aml()
Date: Sat, 21 Jan 2023 16:19:36 +0100
Message-Id: <20230121151941.24120-3-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230121151941.24120-1-shentey@gmail.com>
References: <20230121151941.24120-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62f.google.com
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

Frees isa-bus.c from implicit ACPI dependency.

While at it, resolve open coding of qbus_build_aml() in piix3 and ich9.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/acpi/acpi_aml_interface.h |  3 +++
 include/hw/isa/isa.h                 |  1 -
 hw/acpi/acpi_interface.c             | 10 ++++++++++
 hw/i2c/smbus_ich9.c                  |  5 +----
 hw/i386/acpi-microvm.c               |  3 ++-
 hw/isa/isa-bus.c                     | 10 ----------
 hw/isa/lpc_ich9.c                    |  5 +----
 hw/isa/piix3.c                       |  5 +----
 8 files changed, 18 insertions(+), 24 deletions(-)

diff --git a/include/hw/acpi/acpi_aml_interface.h b/include/hw/acpi/acpi_aml_interface.h
index 436da069d6..11748a8866 100644
--- a/include/hw/acpi/acpi_aml_interface.h
+++ b/include/hw/acpi/acpi_aml_interface.h
@@ -3,6 +3,7 @@
 
 #include "qom/object.h"
 #include "hw/acpi/aml-build.h"
+#include "hw/qdev-core.h"
 
 #define TYPE_ACPI_DEV_AML_IF "acpi-dev-aml-interface"
 typedef struct AcpiDevAmlIfClass AcpiDevAmlIfClass;
@@ -46,4 +47,6 @@ static inline void call_dev_aml_func(DeviceState *dev, Aml *scope)
     }
 }
 
+void qbus_build_aml(BusState *bus, Aml *scope);
+
 #endif
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index 6c8a8a92cb..25acd5c34c 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -86,7 +86,6 @@ bool isa_realize_and_unref(ISADevice *dev, ISABus *bus, Error **errp);
 ISADevice *isa_create_simple(ISABus *bus, const char *name);
 
 ISADevice *isa_vga_init(ISABus *bus);
-void isa_build_aml(ISABus *bus, Aml *scope);
 
 /**
  * isa_register_ioport: Install an I/O port region on the ISA bus.
diff --git a/hw/acpi/acpi_interface.c b/hw/acpi/acpi_interface.c
index c668d361f6..8637ff18fc 100644
--- a/hw/acpi/acpi_interface.c
+++ b/hw/acpi/acpi_interface.c
@@ -2,6 +2,7 @@
 #include "hw/acpi/acpi_dev_interface.h"
 #include "hw/acpi/acpi_aml_interface.h"
 #include "qemu/module.h"
+#include "qemu/queue.h"
 
 void acpi_send_event(DeviceState *dev, AcpiEventStatusBits event)
 {
@@ -12,6 +13,15 @@ void acpi_send_event(DeviceState *dev, AcpiEventStatusBits event)
     }
 }
 
+void qbus_build_aml(BusState *bus, Aml *scope)
+{
+    BusChild *kid;
+
+    QTAILQ_FOREACH(kid, &bus->children, sibling) {
+        call_dev_aml_func(DEVICE(kid->child), scope);
+    }
+}
+
 static void register_types(void)
 {
     static const TypeInfo acpi_dev_if_info = {
diff --git a/hw/i2c/smbus_ich9.c b/hw/i2c/smbus_ich9.c
index ee50ba1f2c..52ba77f3fc 100644
--- a/hw/i2c/smbus_ich9.c
+++ b/hw/i2c/smbus_ich9.c
@@ -97,13 +97,10 @@ static void ich9_smbus_realize(PCIDevice *d, Error **errp)
 
 static void build_ich9_smb_aml(AcpiDevAmlIf *adev, Aml *scope)
 {
-    BusChild *kid;
     ICH9SMBState *s = ICH9_SMB_DEVICE(adev);
     BusState *bus = BUS(s->smb.smbus);
 
-    QTAILQ_FOREACH(kid, &bus->children, sibling) {
-            call_dev_aml_func(DEVICE(kid->child), scope);
-    }
+    qbus_build_aml(bus, scope);
 }
 
 static void ich9_smb_class_init(ObjectClass *klass, void *data)
diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index fb09185cbd..a075360d85 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -26,6 +26,7 @@
 
 #include "exec/memory.h"
 #include "hw/acpi/acpi.h"
+#include "hw/acpi/acpi_aml_interface.h"
 #include "hw/acpi/aml-build.h"
 #include "hw/acpi/bios-linker-loader.h"
 #include "hw/acpi/generic_event_device.h"
@@ -129,7 +130,7 @@ build_dsdt_microvm(GArray *table_data, BIOSLinker *linker,
 
     sb_scope = aml_scope("_SB");
     fw_cfg_add_acpi_dsdt(sb_scope, x86ms->fw_cfg);
-    isa_build_aml(ISA_BUS(isabus), sb_scope);
+    qbus_build_aml(BUS(isabus), sb_scope);
     build_ged_aml(sb_scope, GED_DEVICE, x86ms->acpi_dev,
                   GED_MMIO_IRQ, AML_SYSTEM_MEMORY, GED_MMIO_BASE);
     acpi_dsdt_add_power_button(sb_scope);
diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 1bee1a47f1..f155b80010 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -24,7 +24,6 @@
 #include "hw/sysbus.h"
 #include "sysemu/sysemu.h"
 #include "hw/isa/isa.h"
-#include "hw/acpi/acpi_aml_interface.h"
 
 static ISABus *isabus;
 
@@ -188,15 +187,6 @@ ISADevice *isa_vga_init(ISABus *bus)
     }
 }
 
-void isa_build_aml(ISABus *bus, Aml *scope)
-{
-    BusChild *kid;
-
-    QTAILQ_FOREACH(kid, &bus->parent_obj.children, sibling) {
-        call_dev_aml_func(DEVICE(kid->child), scope);
-    }
-}
-
 static void isabus_bridge_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 8d541e2b54..1fba3c210c 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -813,7 +813,6 @@ static void ich9_send_gpe(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
 static void build_ich9_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
 {
     Aml *field;
-    BusChild *kid;
     ICH9LPCState *s = ICH9_LPC_DEVICE(adev);
     BusState *bus = BUS(s->isa_bus);
     Aml *sb_scope = aml_scope("\\_SB");
@@ -835,9 +834,7 @@ static void build_ich9_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
     aml_append(sb_scope, field);
     aml_append(scope, sb_scope);
 
-    QTAILQ_FOREACH(kid, &bus->children, sibling) {
-            call_dev_aml_func(DEVICE(kid->child), scope);
-    }
+    qbus_build_aml(bus, scope);
 }
 
 static void ich9_lpc_class_init(ObjectClass *klass, void *data)
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 283b971ec4..a9cb39bf21 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -306,7 +306,6 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
 static void build_pci_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
 {
     Aml *field;
-    BusChild *kid;
     Aml *sb_scope = aml_scope("\\_SB");
     BusState *bus = qdev_get_child_bus(DEVICE(adev), "isa.0");
 
@@ -322,9 +321,7 @@ static void build_pci_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
     aml_append(sb_scope, field);
     aml_append(scope, sb_scope);
 
-    QTAILQ_FOREACH(kid, &bus->children, sibling) {
-        call_dev_aml_func(DEVICE(kid->child), scope);
-    }
+    qbus_build_aml(bus, scope);
 }
 
 static void pci_piix3_class_init(ObjectClass *klass, void *data)
-- 
2.39.1


