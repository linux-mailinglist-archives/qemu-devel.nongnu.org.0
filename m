Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 029DC32DCAE
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 23:04:11 +0100 (CET)
Received: from localhost ([::1]:37230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHw4o-00060i-0M
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 17:04:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHw2A-00048x-8q
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 17:01:26 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:53541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHw27-00013i-JS
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 17:01:26 -0500
Received: from localhost.localdomain ([82.252.139.98]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MQy0N-1l625L2DkF-00O2W2; Thu, 04 Mar 2021 23:01:08 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/5] char: add goldfish-tty
Date: Thu,  4 Mar 2021 23:01:00 +0100
Message-Id: <20210304220104.2574112-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210304220104.2574112-1-laurent@vivier.eu>
References: <20210304220104.2574112-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6sb6N36O6k3ySX9oRKfd626f7Jv/sd82o6cmuBShU92M3sZmczm
 9cJbPdLaDixNWe8xqWjRh0DDuffSCTi8nDyK1jjymZvy5HABCt2oNFyWqYOfWEFRViTbdQA
 wxldXBjqQmCmATn7aAvu7bCsBW/f74X74Y3jV8J2j1NRTYovg3TcG3XAJjsVZl6s5cfcDaF
 6VleHfFhA6XHVUMw1kqUA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lc7n8xLTR7Q=:/V8vXYRpuwPkCWrwvgHd86
 airDHk5yZb0Y5EHY15SVisj0yt4XorLQ/hq5M6nELGrdgJo0Y54kQdZCEuuLih8K8Gs0ziMpr
 6p4HXaGrqWaR77Q5a8gN61Ktl+nDNB+QWuGPe/1CvoY2xofzWAl3KYpdLsCjXafnIp/hATecr
 lTmOgBmr501IIuJZlGdALIk53YCccxI/aA0GILzkJy5Qv+ah/wpUnuOlreLE3VnEjSK9nNsaU
 8amEicVVPAv34MzDjhPVvqMQhGK13QD/MSKWAs1jz3NiX7HGwFfbYixC4xBZB4MBPLU79kFJL
 bmlIdXyKTrxij/mxhofIXVPvTwhmRrA2myPJDOaYWRFUVFxAYtbQGAaRm+iwqWuvsqLXYkW3K
 7GPGe154hgl1Gz3EOxEWoda1DprFAoCM9Bu0WgEvVpsu27iEOoJtWhlYqWxdXO0xpBv4PmIM+
 8A9AL+p0Ng==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the goldfish tty device as defined in

https://android.googlesource.com/platform/external/qemu/+/master/docs/GOLDFISH-VIRTUAL-HARDWARE.TXT

and based on the kernel driver code:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/tty/goldfish.c

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/char/goldfish_tty.h |  36 +++++
 hw/char/goldfish_tty.c         | 266 +++++++++++++++++++++++++++++++++
 hw/char/Kconfig                |   3 +
 hw/char/meson.build            |   2 +
 hw/char/trace-events           |   9 ++
 5 files changed, 316 insertions(+)
 create mode 100644 include/hw/char/goldfish_tty.h
 create mode 100644 hw/char/goldfish_tty.c

diff --git a/include/hw/char/goldfish_tty.h b/include/hw/char/goldfish_tty.h
new file mode 100644
index 000000000000..84d78f8cff54
--- /dev/null
+++ b/include/hw/char/goldfish_tty.h
@@ -0,0 +1,36 @@
+/*
+ * SPDX-License-Identifer: GPL-2.0-or-later
+ *
+ * Goldfish TTY
+ *
+ * (c) 2020 Laurent Vivier <laurent@vivier.eu>
+ *
+ */
+
+#ifndef HW_CHAR_GOLDFISH_TTY_H
+#define HW_CHAR_GOLDFISH_TTY_H
+
+#include "chardev/char-fe.h"
+
+#define TYPE_GOLDFISH_TTY "goldfish_tty"
+OBJECT_DECLARE_SIMPLE_TYPE(GoldfishTTYState, GOLDFISH_TTY)
+
+#define GOLFISH_TTY_BUFFER_SIZE 128
+
+struct GoldfishTTYState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion iomem;
+    qemu_irq irq;
+    CharBackend chr;
+
+    uint32_t data_len;
+    uint64_t data_ptr;
+    bool int_enabled;
+
+    uint32_t data_in_count;
+    uint8_t data_in[GOLFISH_TTY_BUFFER_SIZE];
+    uint8_t data_out[GOLFISH_TTY_BUFFER_SIZE];
+};
+
+#endif
diff --git a/hw/char/goldfish_tty.c b/hw/char/goldfish_tty.c
new file mode 100644
index 000000000000..73d9cfd0e10e
--- /dev/null
+++ b/hw/char/goldfish_tty.c
@@ -0,0 +1,266 @@
+/*
+ * SPDX-License-Identifer: GPL-2.0-or-later
+ *
+ * Goldfish TTY
+ *
+ * (c) 2020 Laurent Vivier <laurent@vivier.eu>
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "hw/irq.h"
+#include "hw/qdev-properties-system.h"
+#include "hw/sysbus.h"
+#include "migration/vmstate.h"
+#include "chardev/char-fe.h"
+#include "qemu/log.h"
+#include "trace.h"
+#include "exec/address-spaces.h"
+#include "hw/char/goldfish_tty.h"
+
+/* registers */
+
+enum {
+    REG_PUT_CHAR      = 0x00,
+    REG_BYTES_READY   = 0x04,
+    REG_CMD           = 0x08,
+    REG_DATA_PTR      = 0x10,
+    REG_DATA_LEN      = 0x14,
+    REG_DATA_PTR_HIGH = 0x18,
+    REG_VERSION       = 0x20,
+};
+
+/* commands */
+
+enum {
+    CMD_INT_DISABLE   = 0x00,
+    CMD_INT_ENABLE    = 0x01,
+    CMD_WRITE_BUFFER  = 0x02,
+    CMD_READ_BUFFER   = 0x03,
+};
+
+static uint64_t goldfish_tty_read(void *opaque, hwaddr addr,
+                                  unsigned size)
+{
+    GoldfishTTYState *s = opaque;
+    uint64_t value = 0;
+
+    switch (addr) {
+    case REG_BYTES_READY:
+        value = s->data_in_count;
+        break;
+    case REG_VERSION:
+        value = 0;
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: unimplemented register read 0x%02"HWADDR_PRIx"\n",
+                      __func__, addr);
+        break;
+    }
+
+    trace_goldfish_tty_read(s, addr, size, value);
+
+    return value;
+}
+
+static void goldfish_tty_cmd(GoldfishTTYState *s, uint32_t cmd)
+{
+    int to_copy;
+
+    switch (cmd) {
+    case CMD_INT_DISABLE:
+        if (s->int_enabled) {
+            if (s->data_in_count) {
+                qemu_set_irq(s->irq, 0);
+            }
+            s->int_enabled = false;
+        }
+        break;
+    case CMD_INT_ENABLE:
+        if (!s->int_enabled) {
+            if (s->data_in_count) {
+                qemu_set_irq(s->irq, 1);
+            }
+            s->int_enabled = true;
+        }
+        break;
+    case CMD_WRITE_BUFFER:
+        to_copy = s->data_len;
+        while (to_copy) {
+            int len;
+
+            len = MIN(GOLFISH_TTY_BUFFER_SIZE, to_copy);
+
+            address_space_rw(&address_space_memory, s->data_ptr,
+                             MEMTXATTRS_UNSPECIFIED, s->data_out, len, 0);
+            to_copy -= len;
+            qemu_chr_fe_write_all(&s->chr, s->data_out, len);
+        }
+        break;
+    case CMD_READ_BUFFER:
+        to_copy = MIN(s->data_len, s->data_in_count);
+        address_space_rw(&address_space_memory, s->data_ptr,
+                         MEMTXATTRS_UNSPECIFIED, s->data_in, to_copy, 1);
+        s->data_in_count -= to_copy;
+        memmove(s->data_in, s->data_in + to_copy, s->data_in_count);
+        if (s->int_enabled && !s->data_in_count) {
+            qemu_set_irq(s->irq, 0);
+        }
+        break;
+    }
+}
+
+static void goldfish_tty_write(void *opaque, hwaddr addr,
+                               uint64_t value, unsigned size)
+{
+    GoldfishTTYState *s = opaque;
+    unsigned char c;
+
+    trace_goldfish_tty_write(s, addr, size, value);
+
+    switch (addr) {
+    case REG_PUT_CHAR:
+        c = value;
+        qemu_chr_fe_write_all(&s->chr, &c, sizeof(c));
+        break;
+    case REG_CMD:
+        goldfish_tty_cmd(s, value);
+        break;
+    case REG_DATA_PTR:
+        s->data_ptr = value;
+        break;
+    case REG_DATA_PTR_HIGH:
+        s->data_ptr = (value << 32) | (uint32_t)s->data_ptr;
+        break;
+    case REG_DATA_LEN:
+        s->data_len = value;
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: unimplemented register write 0x%02"HWADDR_PRIx"\n",
+                      __func__, addr);
+        break;
+    }
+}
+
+static const MemoryRegionOps goldfish_tty_ops = {
+    .read = goldfish_tty_read,
+    .write = goldfish_tty_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid.max_access_size = 4,
+    .impl.max_access_size = 4,
+};
+
+static int goldfish_tty_can_receive(void *opaque)
+{
+    GoldfishTTYState *s = opaque;
+    int available = GOLFISH_TTY_BUFFER_SIZE - s->data_in_count;
+
+    trace_goldfish_tty_can_receive(s, available);
+
+    return available;
+}
+
+static void goldfish_tty_receive(void *opaque, const uint8_t *buffer, int size)
+{
+    GoldfishTTYState *s = opaque;
+
+    trace_goldfish_tty_receive(s, size);
+
+    g_assert(size <= GOLFISH_TTY_BUFFER_SIZE - s->data_in_count);
+
+    memcpy(s->data_in + s->data_in_count, buffer, size);
+    s->data_in_count += size;
+
+    if (s->int_enabled && s->data_in_count) {
+        qemu_set_irq(s->irq, 1);
+    }
+}
+
+static void goldfish_tty_reset(DeviceState *dev)
+{
+    GoldfishTTYState *s = GOLDFISH_TTY(dev);
+
+    trace_goldfish_tty_reset(s);
+
+    memset(s->data_in, 0, GOLFISH_TTY_BUFFER_SIZE);
+    memset(s->data_out, 0, GOLFISH_TTY_BUFFER_SIZE);
+    s->data_in_count = 0;
+    s->int_enabled = false;
+    s->data_ptr = 0;
+    s->data_len = 0;
+}
+
+static void goldfish_tty_realize(DeviceState *dev, Error **errp)
+{
+    GoldfishTTYState *s = GOLDFISH_TTY(dev);
+
+    trace_goldfish_tty_realize(s);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &goldfish_tty_ops, s,
+                          "goldfish_tty", 0x24);
+
+    if (qemu_chr_fe_backend_connected(&s->chr)) {
+        qemu_chr_fe_set_handlers(&s->chr, goldfish_tty_can_receive,
+                                 goldfish_tty_receive, NULL, NULL,
+                                 s, NULL, true);
+    }
+}
+
+static const VMStateDescription vmstate_goldfish_tty = {
+    .name = "goldfish_tty",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(data_len, GoldfishTTYState),
+        VMSTATE_UINT64(data_ptr, GoldfishTTYState),
+        VMSTATE_BOOL(int_enabled, GoldfishTTYState),
+        VMSTATE_UINT32(data_in_count, GoldfishTTYState),
+        VMSTATE_BUFFER(data_in, GoldfishTTYState),
+        VMSTATE_BUFFER(data_out, GoldfishTTYState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static Property goldfish_tty_properties[] = {
+    DEFINE_PROP_CHR("chardev", GoldfishTTYState, chr),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void goldfish_tty_instance_init(Object *obj)
+{
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
+    GoldfishTTYState *s = GOLDFISH_TTY(obj);
+
+    trace_goldfish_tty_instance_init(s);
+
+    sysbus_init_mmio(dev, &s->iomem);
+    sysbus_init_irq(dev, &s->irq);
+}
+
+static void goldfish_tty_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    device_class_set_props(dc, goldfish_tty_properties);
+    dc->reset = goldfish_tty_reset;
+    dc->realize = goldfish_tty_realize;
+    dc->vmsd = &vmstate_goldfish_tty;
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
+}
+
+static const TypeInfo goldfish_tty_info = {
+    .name = TYPE_GOLDFISH_TTY,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .class_init = goldfish_tty_class_init,
+    .instance_init = goldfish_tty_instance_init,
+    .instance_size = sizeof(GoldfishTTYState),
+};
+
+static void goldfish_tty_register_types(void)
+{
+    type_register_static(&goldfish_tty_info);
+}
+
+type_init(goldfish_tty_register_types)
diff --git a/hw/char/Kconfig b/hw/char/Kconfig
index 939bc4475883..a8bf0c6a7708 100644
--- a/hw/char/Kconfig
+++ b/hw/char/Kconfig
@@ -61,3 +61,6 @@ config MCHP_PFSOC_MMUART
 
 config SIFIVE_UART
     bool
+
+config GOLDFISH_TTY
+    bool
diff --git a/hw/char/meson.build b/hw/char/meson.build
index 196ac91fa29a..69d974873606 100644
--- a/hw/char/meson.build
+++ b/hw/char/meson.build
@@ -39,3 +39,5 @@ specific_ss.add(when: 'CONFIG_HTIF', if_true: files('riscv_htif.c'))
 specific_ss.add(when: 'CONFIG_TERMINAL3270', if_true: files('terminal3270.c'))
 specific_ss.add(when: 'CONFIG_VIRTIO', if_true: files('virtio-serial-bus.c'))
 specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('spapr_vty.c'))
+
+specific_ss.add(when: 'CONFIG_GOLDFISH_TTY', if_true: files('goldfish_tty.c'))
diff --git a/hw/char/trace-events b/hw/char/trace-events
index 81026f661277..dc7fb717e13b 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -20,6 +20,15 @@ virtio_console_flush_buf(unsigned int port, size_t len, ssize_t ret) "port %u, i
 virtio_console_chr_read(unsigned int port, int size) "port %u, size %d"
 virtio_console_chr_event(unsigned int port, int event) "port %u, event %d"
 
+# goldfish_tty.c
+goldfish_tty_read(void *dev, unsigned int addr, unsigned int size, uint64_t value) "tty: %p reg: 0x%02x size: %d value: 0x%"PRIx64
+goldfish_tty_write(void *dev, unsigned int addr, unsigned int size, uint64_t value) "tty: %p reg: 0x%02x size: %d value: 0x%"PRIx64
+goldfish_tty_can_receive(void *dev, unsigned int available) "tty: %p available: %u"
+goldfish_tty_receive(void *dev, unsigned int size) "tty: %p size: %u"
+goldfish_tty_reset(void *dev) "tty: %p"
+goldfish_tty_realize(void *dev) "tty: %p"
+goldfish_tty_instance_init(void *dev) "tty: %p"
+
 # grlib_apbuart.c
 grlib_apbuart_event(int event) "event:%d"
 grlib_apbuart_writel_unknown(uint64_t addr, uint32_t value) "addr 0x%"PRIx64" value 0x%x"
-- 
2.29.2


