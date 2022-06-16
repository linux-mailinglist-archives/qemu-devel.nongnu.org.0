Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DEF54E05E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 13:56:08 +0200 (CEST)
Received: from localhost ([::1]:40666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1o6Z-0007fl-VJ
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 07:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1o1neO-0001n9-N0
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 07:27:02 -0400
Received: from mout-u-107.mailbox.org ([2001:67c:2050:101:465::107]:58240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1o1neM-0001E0-C6
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 07:27:00 -0400
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-u-107.mailbox.org (Postfix) with ESMTPS id 4LP0Hx3skWz9sQL;
 Thu, 16 Jun 2022 13:26:53 +0200 (CEST)
From: Lev Kujawski <lkujaw@member.fsf.org>
To: qemu-devel@nongnu.org
Cc: Lev Kujawski <lkujaw@member.fsf.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH] hw/i386/postcard.c: New ISA POST card device
Date: Thu, 16 Jun 2022 11:26:44 +0000
Message-Id: <20220616112644.752277-1-lkujaw@member.fsf.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2050:101:465::107;
 envelope-from=lkujaw@member.fsf.org; helo=mout-u-107.mailbox.org
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Move the ioport80 memory functionality within hw/i386/pc.c into a new
ISA POST card device capable of being instantiated at different ports.

Emulate actual i440FX hardware by storing the value written to the
port, regardless of the presence of a POST card, a behavior relied
upon by firmware for these systems (e.g., AMIBIOS) to track the state
of the boot process.

To aid firmware debugging, allow for tracing POST card values,
mimicking the [new value, old value] display format of actual cards.

Tested with AMIBIOS.

Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
---
 hw/i386/Kconfig            |   5 ++
 hw/i386/meson.build        |   1 +
 hw/i386/pc.c               |  25 +------
 hw/i386/postcard.c         | 149 +++++++++++++++++++++++++++++++++++++
 hw/i386/trace-events       |   3 +
 include/hw/i386/postcard.h |  35 +++++++++
 6 files changed, 195 insertions(+), 23 deletions(-)
 create mode 100644 hw/i386/postcard.c
 create mode 100644 include/hw/i386/postcard.h

diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index d22ac4a4b9..17979e5c0d 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -10,6 +10,10 @@ config SGX
     bool
     depends on KVM
 
+config POST_CARD
+    bool
+    depends on ISA_BUS
+
 config PC
     bool
     imply APPLESMC
@@ -40,6 +44,7 @@ config PC
     select PCSPK
     select I8257
     select MC146818RTC
+    select POST_CARD
     # For ACPI builder:
     select SERIAL_ISA
     select ACPI_PCI
diff --git a/hw/i386/meson.build b/hw/i386/meson.build
index 213e2e82b3..c883e8ec9a 100644
--- a/hw/i386/meson.build
+++ b/hw/i386/meson.build
@@ -28,6 +28,7 @@ i386_ss.add(when: 'CONFIG_PC', if_true: files(
   'port92.c'))
 i386_ss.add(when: 'CONFIG_X86_FW_OVMF', if_true: files('pc_sysfw_ovmf.c'),
                                         if_false: files('pc_sysfw_ovmf-stubs.c'))
+i386_ss.add(when: 'CONFIG_POST_CARD', if_true: files('postcard.c'))
 
 subdir('kvm')
 subdir('xen')
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 774cb2bf07..c179e38a61 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -32,6 +32,7 @@
 #include "hw/i386/topology.h"
 #include "hw/i386/fw_cfg.h"
 #include "hw/i386/vmport.h"
+#include "hw/i386/postcard.h"
 #include "sysemu/cpus.h"
 #include "hw/block/fdc.h"
 #include "hw/ide.h"
@@ -403,16 +404,6 @@ GSIState *pc_gsi_create(qemu_irq **irqs, bool pci_enabled)
     return s;
 }
 
-static void ioport80_write(void *opaque, hwaddr addr, uint64_t data,
-                           unsigned size)
-{
-}
-
-static uint64_t ioport80_read(void *opaque, hwaddr addr, unsigned size)
-{
-    return 0xffffffffffffffffULL;
-}
-
 /* MSDOS compatibility mode FPU exception support */
 static void ioportF0_write(void *opaque, hwaddr addr, uint64_t data,
                            unsigned size)
@@ -1059,16 +1050,6 @@ DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci_bus)
     return dev;
 }
 
-static const MemoryRegionOps ioport80_io_ops = {
-    .write = ioport80_write,
-    .read = ioport80_read,
-    .endianness = DEVICE_NATIVE_ENDIAN,
-    .impl = {
-        .min_access_size = 1,
-        .max_access_size = 1,
-    },
-};
-
 static const MemoryRegionOps ioportF0_io_ops = {
     .write = ioportF0_write,
     .read = ioportF0_read,
@@ -1139,12 +1120,10 @@ void pc_basic_device_init(struct PCMachineState *pcms,
     qemu_irq pit_alt_irq = NULL;
     qemu_irq rtc_irq = NULL;
     ISADevice *pit = NULL;
-    MemoryRegion *ioport80_io = g_new(MemoryRegion, 1);
     MemoryRegion *ioportF0_io = g_new(MemoryRegion, 1);
     X86MachineState *x86ms = X86_MACHINE(pcms);
 
-    memory_region_init_io(ioport80_io, NULL, &ioport80_io_ops, NULL, "ioport80", 1);
-    memory_region_add_subregion(isa_bus->address_space_io, 0x80, ioport80_io);
+    (void)post_card_init(isa_bus, POST_CARD_PORT_DEFAULT);
 
     memory_region_init_io(ioportF0_io, NULL, &ioportF0_io_ops, NULL, "ioportF0", 1);
     memory_region_add_subregion(isa_bus->address_space_io, 0xf0, ioportF0_io);
diff --git a/hw/i386/postcard.c b/hw/i386/postcard.c
new file mode 100644
index 0000000000..c9fa263510
--- /dev/null
+++ b/hw/i386/postcard.c
@@ -0,0 +1,149 @@
+/*
+ * QEMU PC System Emulator
+ *
+ * Copyright (c) 2003-2004 Fabrice Bellard
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "exec/memory.h"
+#include "qapi/error.h"
+#include "qom/object.h"
+#include "migration/vmstate.h"
+#include "hw/qdev-properties.h"
+#include "trace.h"
+#include "hw/i386/postcard.h"
+
+struct POSTCardState {
+    ISADevice parent_obj;
+
+    MemoryRegion io;
+    uint16_t port;
+    uint8_t mem;
+};
+
+#define TYPE_POST_CARD "post-card"
+OBJECT_DECLARE_SIMPLE_TYPE(POSTCardState, POST_CARD)
+
+static uint64_t
+post_card_read(void *opaque, hwaddr addr, unsigned size)
+{
+    POSTCardState *s = opaque;
+    uint64_t val;
+
+    memset(&val, s->mem, sizeof(val));
+    return val;
+}
+
+static void
+post_card_write(void *opaque, hwaddr addr, uint64_t data, unsigned size)
+{
+    POSTCardState *s = opaque;
+    const uint8_t val = data & 0xff;
+
+    if (val != s->mem) {
+        trace_post_card_write(val, s->mem);
+        s->mem = val;
+    }
+}
+
+static const MemoryRegionOps post_card_ops = {
+    .read = post_card_read,
+    .write = post_card_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static void
+post_card_reset(DeviceState *dev)
+{
+    POSTCardState *s = POST_CARD(dev);
+    s->mem = 0;
+}
+
+static void
+post_card_realize(DeviceState *dev, Error **errp)
+{
+    ISADevice *isadev = ISA_DEVICE(dev);
+    POSTCardState *s = POST_CARD(dev);
+
+    memory_region_init_io(&s->io, OBJECT(s), &post_card_ops,
+                          s, TYPE_POST_CARD, 1);
+    isa_register_ioport(isadev, &s->io, s->port);
+    post_card_reset(dev);
+}
+
+static Property post_card_properties[] = {
+    DEFINE_PROP_UINT16("iobase", POSTCardState, port,
+                       POST_CARD_PORT_DEFAULT),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static const VMStateDescription post_card_vmstate = {
+    .name = TYPE_POST_CARD,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT16(port, POSTCardState),
+        VMSTATE_UINT8(mem, POSTCardState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void
+post_card_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->desc = "ISA POST card";
+    dc->realize = post_card_realize;
+    dc->reset = post_card_reset;
+    dc->vmsd = &post_card_vmstate;
+    device_class_set_props(dc, post_card_properties);
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+}
+
+static const TypeInfo post_card_info = {
+    .name          = TYPE_POST_CARD,
+    .parent        = TYPE_ISA_DEVICE,
+    .instance_size = sizeof(POSTCardState),
+    .class_init    = post_card_class_init,
+};
+
+ISADevice *
+post_card_init(ISABus *bus, uint16_t iobase)
+{
+    DeviceState *dev;
+    ISADevice *isadev;
+
+    isadev = isa_new(TYPE_POST_CARD);
+    dev = DEVICE(isadev);
+    qdev_prop_set_uint16(dev, "iobase", iobase);
+    isa_realize_and_unref(isadev, bus, &error_fatal);
+
+    return isadev;
+}
+
+static void
+post_card_register_types(void)
+{
+    type_register_static(&post_card_info);
+}
+
+type_init(post_card_register_types)
diff --git a/hw/i386/trace-events b/hw/i386/trace-events
index e49814dd64..443c2a9d6a 100644
--- a/hw/i386/trace-events
+++ b/hw/i386/trace-events
@@ -119,3 +119,6 @@ x86_pic_interrupt(int irqn, int level) "PIC interrupt #%d level:%d"
 # port92.c
 port92_read(uint8_t val) "port92: read 0x%02x"
 port92_write(uint8_t val) "port92: write 0x%02x"
+
+# postcard.c
+post_card_write(uint8_t new_val, uint8_t old_val) "[%.2x %.2x]"
diff --git a/include/hw/i386/postcard.h b/include/hw/i386/postcard.h
new file mode 100644
index 0000000000..ae8cdb704a
--- /dev/null
+++ b/include/hw/i386/postcard.h
@@ -0,0 +1,35 @@
+/*
+ * QEMU PC System Emulator
+ *
+ * Copyright (c) 2003-2004 Fabrice Bellard
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef HW_I386_POSTCARD_H
+#define HW_I386_POSTCARD_H
+
+#include "hw/isa/isa.h"
+
+#define POST_CARD_PORT_DEFAULT 0x80
+
+ISADevice *
+post_card_init(ISABus *bus, uint16_t iobase);
+
+#endif /* HW_I386_POSTCARD_H */
-- 
2.34.1


