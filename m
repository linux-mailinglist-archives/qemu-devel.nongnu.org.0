Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BD92CD41B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 11:59:13 +0100 (CET)
Received: from localhost ([::1]:33076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkmKO-0000Fn-90
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 05:59:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkmG2-0003kp-9I
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 05:54:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkmG0-0001zy-5A
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 05:54:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606992879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c5n4vmotJft+Wtkexy4IEjv8AjEYe1aQbQhrd4XrR2A=;
 b=RH4TWwk5hcMK2Kkm0dGBrKjtMBEOAlIyosg4Z+/CfXNgOFdXFhg9MvmG54Oarzy925HQUF
 Y1l1jSMbm26Qy1scVr2FOtZQjDD3g1cl8gEwyDhoz1BqD7LU7kb7mgz1l5qAmVPq5q6Rmp
 sPmDYY021iiivcnPPv3QrPDG/u4XqAM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-ZGE4s3qUPMuvrjBDr9EtNA-1; Thu, 03 Dec 2020 05:54:35 -0500
X-MC-Unique: ZGE4s3qUPMuvrjBDr9EtNA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D139185E48F;
 Thu,  3 Dec 2020 10:54:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 32D7F1A7D9;
 Thu,  3 Dec 2020 10:54:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 73E799D92; Thu,  3 Dec 2020 11:54:23 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/12] x86: add support for second ioapic
Date: Thu,  3 Dec 2020 11:54:14 +0100
Message-Id: <20201203105423.10431-4-kraxel@redhat.com>
In-Reply-To: <20201203105423.10431-1-kraxel@redhat.com>
References: <20201203105423.10431-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

Add ioapic_init_secondary to initialize it, wire up
in gsi handling and acpi apic table creation.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/i386/ioapic.h          |  2 ++
 include/hw/i386/ioapic_internal.h |  2 +-
 include/hw/i386/x86.h             |  3 +++
 hw/i386/acpi-common.c             | 10 ++++++++++
 hw/i386/x86.c                     | 21 +++++++++++++++++++++
 5 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/include/hw/i386/ioapic.h b/include/hw/i386/ioapic.h
index 06bfaaeac6b8..ef37b8a9fda1 100644
--- a/include/hw/i386/ioapic.h
+++ b/include/hw/i386/ioapic.h
@@ -22,6 +22,8 @@
 
 #define IOAPIC_NUM_PINS 24
 #define IO_APIC_DEFAULT_ADDRESS 0xfec00000
+#define IO_APIC_SECONDARY_ADDRESS (IO_APIC_DEFAULT_ADDRESS + 0x10000)
+#define IO_APIC_SECONDARY_IRQBASE 24 /* primary 0 -> 23, secondary 24 -> 47 */
 
 #define TYPE_KVM_IOAPIC "kvm-ioapic"
 #define TYPE_IOAPIC "ioapic"
diff --git a/include/hw/i386/ioapic_internal.h b/include/hw/i386/ioapic_internal.h
index 0f9002a2c23e..021e715f1131 100644
--- a/include/hw/i386/ioapic_internal.h
+++ b/include/hw/i386/ioapic_internal.h
@@ -27,7 +27,7 @@
 #include "qemu/notify.h"
 #include "qom/object.h"
 
-#define MAX_IOAPICS                     1
+#define MAX_IOAPICS                     2
 
 #define IOAPIC_LVT_DEST_SHIFT           56
 #define IOAPIC_LVT_DEST_IDX_SHIFT       48
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 739fac50871b..3f9b052cfc34 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -50,6 +50,7 @@ struct X86MachineState {
     ISADevice *rtc;
     FWCfgState *fw_cfg;
     qemu_irq *gsi;
+    DeviceState *ioapic2;
     GMappedFile *initrd_mapped_file;
     HotplugHandler *acpi_dev;
 
@@ -120,10 +121,12 @@ bool x86_machine_is_acpi_enabled(const X86MachineState *x86ms);
 typedef struct GSIState {
     qemu_irq i8259_irq[ISA_NUM_IRQS];
     qemu_irq ioapic_irq[IOAPIC_NUM_PINS];
+    qemu_irq ioapic2_irq[IOAPIC_NUM_PINS];
 } GSIState;
 
 qemu_irq x86_allocate_cpu_irq(void);
 void gsi_handler(void *opaque, int n, int level);
 void ioapic_init_gsi(GSIState *gsi_state, const char *parent_name);
+DeviceState *ioapic_init_secondary(GSIState *gsi_state);
 
 #endif
diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
index 8a769654060e..a6a30e836339 100644
--- a/hw/i386/acpi-common.c
+++ b/hw/i386/acpi-common.c
@@ -103,6 +103,16 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
     io_apic->address = cpu_to_le32(IO_APIC_DEFAULT_ADDRESS);
     io_apic->interrupt = cpu_to_le32(0);
 
+    if (x86ms->ioapic2) {
+        AcpiMadtIoApic *io_apic2;
+        io_apic2 = acpi_data_push(table_data, sizeof *io_apic);
+        io_apic2->type = ACPI_APIC_IO;
+        io_apic2->length = sizeof(*io_apic);
+        io_apic2->io_apic_id = ACPI_BUILD_IOAPIC_ID + 1;
+        io_apic2->address = cpu_to_le32(IO_APIC_SECONDARY_ADDRESS);
+        io_apic2->interrupt = cpu_to_le32(IO_APIC_SECONDARY_IRQBASE);
+    }
+
     if (x86ms->apic_xrupt_override) {
         intsrcovr = acpi_data_push(table_data, sizeof *intsrcovr);
         intsrcovr->type   = ACPI_APIC_XRUPT_OVERRIDE;
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index b67e7b789f89..d68a9eaefc2c 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -598,6 +598,10 @@ void gsi_handler(void *opaque, int n, int level)
     case ISA_NUM_IRQS ... IOAPIC_NUM_PINS - 1:
         qemu_set_irq(s->ioapic_irq[n], level);
         break;
+    case IO_APIC_SECONDARY_IRQBASE
+        ... IO_APIC_SECONDARY_IRQBASE + IOAPIC_NUM_PINS - 1:
+        qemu_set_irq(s->ioapic2_irq[n - IO_APIC_SECONDARY_IRQBASE], level);
+        break;
     }
 }
 
@@ -624,6 +628,23 @@ void ioapic_init_gsi(GSIState *gsi_state, const char *parent_name)
     }
 }
 
+DeviceState *ioapic_init_secondary(GSIState *gsi_state)
+{
+    DeviceState *dev;
+    SysBusDevice *d;
+    unsigned int i;
+
+    dev = qdev_new(TYPE_IOAPIC);
+    d = SYS_BUS_DEVICE(dev);
+    sysbus_realize_and_unref(d, &error_fatal);
+    sysbus_mmio_map(d, 0, IO_APIC_SECONDARY_ADDRESS);
+
+    for (i = 0; i < IOAPIC_NUM_PINS; i++) {
+        gsi_state->ioapic2_irq[i] = qdev_get_gpio_in(dev, i);
+    }
+    return dev;
+}
+
 struct setup_data {
     uint64_t next;
     uint32_t type;
-- 
2.27.0


