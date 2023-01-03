Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0201465BC78
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 09:50:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCcyb-0001dq-B1; Tue, 03 Jan 2023 03:48:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCcy3-0001aK-NW
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 03:48:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pCcy1-0007WJ-SQ
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 03:48:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672735696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W4J5XF+GdZZ0UzQNX2tdo924NG6UaFX7Rr6HkoV0EVo=;
 b=YH4eC3N3a40tlhcvMm0idGs77IuXO/affVatBg9QMFioQy1PU47r12lj7y9zzrmL6zbWY5
 +IIeE3dlUxUk+y6bvcJRR61xqGcCCzq9QYLGmAMPcadwfx6WsNmrRs3LoO7/0GexLZrcFi
 JL9Qe16Tw5ff/XApj8OfBpcbupQo/Og=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-PcL2CAAnPROun5EdeIGXkQ-1; Tue, 03 Jan 2023 03:48:11 -0500
X-MC-Unique: PcL2CAAnPROun5EdeIGXkQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7766D380673B;
 Tue,  3 Jan 2023 08:48:10 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A72AD40C1141;
 Tue,  3 Jan 2023 08:48:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Michael S Tsirkin <mst@redhat.com>,
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH 1/6] hw/i386/pc: Create RTC controllers in south bridges
Date: Tue,  3 Jan 2023 09:47:56 +0100
Message-Id: <20230103084801.20437-2-thuth@redhat.com>
In-Reply-To: <20230103084801.20437-1-thuth@redhat.com>
References: <20230103084801.20437-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

Just like in the real hardware (and in PIIX4), create the RTC
controllers in the south bridges.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-11-shentey@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/i386/ich9.h        |  2 ++
 include/hw/southbridge/piix.h |  3 +++
 hw/i386/pc.c                  | 12 +++++++++++-
 hw/i386/pc_piix.c             |  8 ++++++++
 hw/i386/pc_q35.c              |  1 +
 hw/isa/lpc_ich9.c             |  8 ++++++++
 hw/isa/piix3.c                | 15 +++++++++++++++
 hw/isa/Kconfig                |  2 ++
 8 files changed, 50 insertions(+), 1 deletion(-)

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
 
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index d489ecc0d1..448557333b 100644
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
index b48047f50c..87aab3d853 100644
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
@@ -223,10 +224,17 @@ static void pc_init1(MachineState *machine,
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
index 67ceb04bcc..6a36e6bb12 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -238,6 +238,7 @@ static void pc_q35_init(MachineState *machine)
     lpc = pci_create_simple_multifunction(host_bus, PCI_DEVFN(ICH9_LPC_DEV,
                                           ICH9_LPC_FUNC), true,
                                           TYPE_ICH9_LPC_DEVICE);
+    rtc_state = ISA_DEVICE(object_resolve_path_component(OBJECT(lpc), "rtc"));
 
     object_property_add_link(OBJECT(machine), PC_MACHINE_ACPI_DEVICE_PROP,
                              TYPE_HOTPLUG_HANDLER,
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 8d541e2b54..498175c1cc 100644
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
-- 
2.31.1


