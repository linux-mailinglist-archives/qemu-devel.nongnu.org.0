Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F12C681B83
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:30:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMacH-0002Eo-UQ; Mon, 30 Jan 2023 15:19:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMacG-0002Eg-0N
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:19:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMacE-0006oe-7K
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:18:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675109937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jaPYbY+TOTXG6farNIfDPH9H5HcURYebioCLnFhwY6c=;
 b=EtHDHJL8YyZwQ0O3dF9KLG5GMUiL2Gz/aXaP/AeWaliKvbv6OEY7V5skfysefvgsyME2yB
 fYXiTRG8Owc0FKlCrgvN75/+tYe9VGsRg7ylGR+GKydEvKb1fZGfKiD2S6DerWQqjedj1y
 HKQK980sEYha1nyA91fDRXFLsQi1Jw8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-483-p81tQEqeOs6uwKazaG_xxw-1; Mon, 30 Jan 2023 15:18:56 -0500
X-MC-Unique: p81tQEqeOs6uwKazaG_xxw-1
Received: by mail-ed1-f71.google.com with SMTP id
 w3-20020a056402268300b00487e0d9b53fso9008915edd.10
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:18:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jaPYbY+TOTXG6farNIfDPH9H5HcURYebioCLnFhwY6c=;
 b=XJb9GI7eb0cTgReDtyBTVWcmPhUmczFAV6k8qNWFaoHZRbH5ReLj9JYAkBudofzl0W
 hEyPYuyyM7JqZ4utCEvqX/iy3Aya5X0yMwJGiRFWdl7KeIQr409p0E4bqAl4VhowJeE3
 bAB0YTW1+ZVeMhf5uRLRairoXcI81iuyaoXgvKGOW/lra/4nWKTBkbXigjGY+r2TXIQU
 Zkm5NJjUiZN5RTvFztjm5EWwtNaAo3drblKYU5IC4bxWC+OxaK7ZjZ53TQXFLu/dTkXl
 bKepK2YJftouNc6crJ+QlCfWwRtBdsMPHNAjDY+ySdEWzoi+y3JjQzya9/UWcyCTyVEc
 7SXQ==
X-Gm-Message-State: AO0yUKWnxdnVZ4dQNbSdf6GEnggvmgN7Dm4u9MF54aulQbnl6vvoqKb9
 yYSTkjMqQXaLA6cuDTQbRRi7AtkqwaZsBqTFSYFugFNQHuLBDmkBR/2zij1Pabb0UqibTPuZX7V
 YYoPn3SYK2plSfOaUvnGAIhBFkF8E28ikfolbufiSO8pFHTFbrWHhiUzflKAn
X-Received: by 2002:a17:906:6a14:b0:88b:f8e5:3318 with SMTP id
 qw20-20020a1709066a1400b0088bf8e53318mr336487ejc.38.1675109934098; 
 Mon, 30 Jan 2023 12:18:54 -0800 (PST)
X-Google-Smtp-Source: AK7set8k3YCElWAXor9uGCJQrYnAM+CbaIO+msnlt/iRWCxphbenF2IoFhJb2GP3L0fZBq8P6cwnaA==
X-Received: by 2002:a17:906:6a14:b0:88b:f8e5:3318 with SMTP id
 qw20-20020a1709066a1400b0088bf8e53318mr336453ejc.38.1675109933816; 
 Mon, 30 Jan 2023 12:18:53 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 t12-20020a1709063e4c00b0088a9e083318sm1046908eji.168.2023.01.30.12.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:18:53 -0800 (PST)
Date: Mon, 30 Jan 2023 15:18:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 03/56] hw/isa/isa-bus: Turn isa_build_aml() into
 qbus_build_aml()
Message-ID: <20230130201810.11518-4-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Bernhard Beschow <shentey@gmail.com>

Frees isa-bus.c from implicit ACPI dependency.

While at it, resolve open coding of qbus_build_aml() in piix3 and ich9.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230121151941.24120-3-shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
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
MST


