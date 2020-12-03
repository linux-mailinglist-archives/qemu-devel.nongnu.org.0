Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A2A2CD447
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 12:06:56 +0100 (CET)
Received: from localhost ([::1]:56108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkmRr-0001cs-3c
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 06:06:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkmGC-0003ug-Id
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 05:54:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkmG9-00025k-I0
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 05:54:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606992888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/wfd3XRIvWtiYA2iSifvEyxkNNGqk46GcCXw8fZQ1bM=;
 b=CcF1a11cMdPH4GTzZAogS7ioEfD+dcG+3xkWhI3BADtcE0k4v63Xdg9cd7ucn6OxdFL38A
 bdf+lmJBZ1g5KTnr6LwbMzbCDR1zYs1zpyM0fpnvMN6UK+rjFpTIhxqrC87cYkWRhMWOGS
 SVAqetFomS9DeUPwxrMmdcD3/ZaTMdY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-KuxIdmdBOKmqcXMiKwcMoQ-1; Thu, 03 Dec 2020 05:54:45 -0500
X-MC-Unique: KuxIdmdBOKmqcXMiKwcMoQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3680185818E;
 Thu,  3 Dec 2020 10:54:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 306A410016FA;
 Thu,  3 Dec 2020 10:54:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9FDDB9D9D; Thu,  3 Dec 2020 11:54:23 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/12] microvm: add second ioapic
Date: Thu,  3 Dec 2020 11:54:18 +0100
Message-Id: <20201203105423.10431-8-kraxel@redhat.com>
In-Reply-To: <20201203105423.10431-1-kraxel@redhat.com>
References: <20201203105423.10431-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create second ioapic, route virtio-mmio IRQs to it,
allow more virtio-mmio devices (24 instead of 8).

Needs ACPI, enabled by default, can be turned off
using -machine ioapic2=off

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/i386/microvm.h      |  2 ++
 hw/i386/microvm.c              | 56 +++++++++++++++++++++++++++++++---
 tests/qtest/bios-tables-test.c |  8 ++---
 3 files changed, 57 insertions(+), 9 deletions(-)

diff --git a/include/hw/i386/microvm.h b/include/hw/i386/microvm.h
index f1e9db059b85..f25f8374413f 100644
--- a/include/hw/i386/microvm.h
+++ b/include/hw/i386/microvm.h
@@ -72,6 +72,7 @@
 #define MICROVM_MACHINE_PIC                 "pic"
 #define MICROVM_MACHINE_RTC                 "rtc"
 #define MICROVM_MACHINE_PCIE                "pcie"
+#define MICROVM_MACHINE_IOAPIC2             "ioapic2"
 #define MICROVM_MACHINE_ISA_SERIAL          "isa-serial"
 #define MICROVM_MACHINE_OPTION_ROMS         "x-option-roms"
 #define MICROVM_MACHINE_AUTO_KERNEL_CMDLINE "auto-kernel-cmdline"
@@ -90,6 +91,7 @@ struct MicrovmMachineState {
     OnOffAuto pit;
     OnOffAuto rtc;
     OnOffAuto pcie;
+    OnOffAuto ioapic2;
     bool isa_serial;
     bool option_roms;
     bool auto_kernel_cmdline;
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 829b376a1278..56886086133c 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -145,32 +145,53 @@ static void create_gpex(MicrovmMachineState *mms)
     }
 }
 
+static int microvm_ioapics(MicrovmMachineState *mms)
+{
+    if (!x86_machine_is_acpi_enabled(X86_MACHINE(mms))) {
+        return 1;
+    }
+    if (mms->ioapic2 == ON_OFF_AUTO_OFF) {
+        return 1;
+    }
+    return 2;
+}
+
 static void microvm_devices_init(MicrovmMachineState *mms)
 {
     X86MachineState *x86ms = X86_MACHINE(mms);
     ISABus *isa_bus;
     ISADevice *rtc_state;
     GSIState *gsi_state;
+    int ioapics;
     int i;
 
     /* Core components */
-
+    ioapics = microvm_ioapics(mms);
     gsi_state = g_malloc0(sizeof(*gsi_state));
-    x86ms->gsi = qemu_allocate_irqs(gsi_handler, gsi_state, GSI_NUM_PINS);
+    x86ms->gsi = qemu_allocate_irqs(gsi_handler, gsi_state,
+                                    IOAPIC_NUM_PINS * ioapics);
 
     isa_bus = isa_bus_new(NULL, get_system_memory(), get_system_io(),
                           &error_abort);
     isa_bus_irqs(isa_bus, x86ms->gsi);
 
     ioapic_init_gsi(gsi_state, "machine");
+    if (ioapics > 1) {
+        x86ms->ioapic2 = ioapic_init_secondary(gsi_state);
+    }
 
     kvmclock_create(true);
 
     mms->virtio_irq_base = 5;
     mms->virtio_num_transports = 8;
-    if (x86_machine_is_acpi_enabled(x86ms)) {
-        mms->pcie_irq_base = 12;
-        mms->virtio_irq_base = 16;
+    if (x86ms->ioapic2) {
+        mms->pcie_irq_base = 16;    /* 16 -> 19 */
+        /* use second ioapic (24 -> 47) for virtio-mmio irq lines */
+        mms->virtio_irq_base = IO_APIC_SECONDARY_IRQBASE;
+        mms->virtio_num_transports = IOAPIC_NUM_PINS;
+    } else if (x86_machine_is_acpi_enabled(x86ms)) {
+        mms->pcie_irq_base = 12;    /* 12 -> 15 */
+        mms->virtio_irq_base = 16;  /* 16 -> 23 */
     }
 
     for (i = 0; i < mms->virtio_num_transports; i++) {
@@ -544,6 +565,23 @@ static void microvm_machine_set_pcie(Object *obj, Visitor *v, const char *name,
     visit_type_OnOffAuto(v, name, &mms->pcie, errp);
 }
 
+static void microvm_machine_get_ioapic2(Object *obj, Visitor *v, const char *name,
+                                        void *opaque, Error **errp)
+{
+    MicrovmMachineState *mms = MICROVM_MACHINE(obj);
+    OnOffAuto ioapic2 = mms->ioapic2;
+
+    visit_type_OnOffAuto(v, name, &ioapic2, errp);
+}
+
+static void microvm_machine_set_ioapic2(Object *obj, Visitor *v, const char *name,
+                                        void *opaque, Error **errp)
+{
+    MicrovmMachineState *mms = MICROVM_MACHINE(obj);
+
+    visit_type_OnOffAuto(v, name, &mms->ioapic2, errp);
+}
+
 static bool microvm_machine_get_isa_serial(Object *obj, Error **errp)
 {
     MicrovmMachineState *mms = MICROVM_MACHINE(obj);
@@ -620,6 +658,7 @@ static void microvm_machine_initfn(Object *obj)
     mms->pit = ON_OFF_AUTO_AUTO;
     mms->rtc = ON_OFF_AUTO_AUTO;
     mms->pcie = ON_OFF_AUTO_AUTO;
+    mms->ioapic2 = ON_OFF_AUTO_AUTO;
     mms->isa_serial = true;
     mms->option_roms = true;
     mms->auto_kernel_cmdline = true;
@@ -693,6 +732,13 @@ static void microvm_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, MICROVM_MACHINE_PCIE,
         "Enable PCIe");
 
+    object_class_property_add(oc, MICROVM_MACHINE_IOAPIC2, "OnOffAuto",
+                              microvm_machine_get_ioapic2,
+                              microvm_machine_set_ioapic2,
+                              NULL, NULL);
+    object_class_property_set_description(oc, MICROVM_MACHINE_IOAPIC2,
+        "Enable second IO-APIC");
+
     object_class_property_add_bool(oc, MICROVM_MACHINE_ISA_SERIAL,
                                    microvm_machine_get_isa_serial,
                                    microvm_machine_set_isa_serial);
diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index f23a5335a875..0a0ce76ffcf9 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1115,7 +1115,7 @@ static void test_acpi_microvm_tcg(void)
     test_data data;
 
     test_acpi_microvm_prepare(&data);
-    test_acpi_one(" -machine microvm,acpi=on,rtc=off",
+    test_acpi_one(" -machine microvm,acpi=on,ioapic2=off,rtc=off",
                   &data);
     free_test_data(&data);
 }
@@ -1126,7 +1126,7 @@ static void test_acpi_microvm_usb_tcg(void)
 
     test_acpi_microvm_prepare(&data);
     data.variant = ".usb";
-    test_acpi_one(" -machine microvm,acpi=on,usb=on,rtc=off",
+    test_acpi_one(" -machine microvm,acpi=on,ioapic2=off,usb=on,rtc=off",
                   &data);
     free_test_data(&data);
 }
@@ -1137,7 +1137,7 @@ static void test_acpi_microvm_rtc_tcg(void)
 
     test_acpi_microvm_prepare(&data);
     data.variant = ".rtc";
-    test_acpi_one(" -machine microvm,acpi=on,rtc=on",
+    test_acpi_one(" -machine microvm,acpi=on,ioapic2=off,rtc=on",
                   &data);
     free_test_data(&data);
 }
@@ -1149,7 +1149,7 @@ static void test_acpi_microvm_pcie_tcg(void)
     test_acpi_microvm_prepare(&data);
     data.variant = ".pcie";
     data.tcg_only = true; /* need constant host-phys-bits */
-    test_acpi_one(" -machine microvm,acpi=on,rtc=off,pcie=on",
+    test_acpi_one(" -machine microvm,acpi=on,ioapic2=off,rtc=off,pcie=on",
                   &data);
     free_test_data(&data);
 }
-- 
2.27.0


