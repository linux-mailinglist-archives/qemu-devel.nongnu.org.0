Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A200132DCAD
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 23:04:08 +0100 (CET)
Received: from localhost ([::1]:36892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHw4l-0005rn-90
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 17:04:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHw2B-000499-3i
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 17:01:27 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:42087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHw28-00014z-02
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 17:01:26 -0500
Received: from localhost.localdomain ([82.252.139.98]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N62mG-1lp0fu1cE4-016P5h; Thu, 04 Mar 2021 23:01:10 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/5] m68k: add a system controller
Date: Thu,  4 Mar 2021 23:01:03 +0100
Message-Id: <20210304220104.2574112-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210304220104.2574112-1-laurent@vivier.eu>
References: <20210304220104.2574112-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:tPA5RuqitP2h1Q+DuP/nuUDUC+hxb3TrwfbpJvUF2hU8l1tEPX8
 f/AiRWsVsyUd3epuTWXwg/HhJhk2LzKXgbDXwzAgKgoMFfStpoc6i/n+aJmRgtfejGfBSYD
 thM488F1lZIMxDm1q/zRfEnWHG1lD4fnmRn3Tc0fF/u1i9AlJpOocsTQNAkiNSclOfLWkEs
 udUamUEGjIJ0/DHhJ8MNQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MYHIDOj2BR4=:Fhs7KLzzgMOFFJbVgW5f7S
 w0FSHsYOrLKfC8EldtO1ksI8RzfE9AYTK07jb85sfUoiwCsONyqExhPG/9t5Lctl8idjar1Wa
 TyeSNdUwQKuoiJT1nSoAJmKpHp5QEVBFkLtlSAkB17Bk2ijWi8WVeBT5vqvswPDA+W6LjrwOO
 hStKD9CGhyIQj+AGKH8pWwHW4EuHsM1i7C30d9cz6EO4l8R4YAMVHthLzTMhEx5JYkoE0Dv9a
 ImoUkm4b+cv177kLsCWwrX4pstaFwCujdchhvQTdGhbb5wY9XcNzCQHVX0j4SnUB//wN85xc/
 iZ4MwLIiK1IW3ca2MQhiFB18D1GX58PdMWqKFCjGt0MfM7fTtZVV+/nWVIa9H4Upz+D4qUxHJ
 gJbkhHocDdJW1PSYvZqVnQmyW40tJ7Ab0Xkx//WHN73fWxQb4ed6jYUimG7TffComfb7lPWKY
 BjsS5F3qkw==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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

Add a system controller for the m68k-virt machine.
This controller allows the kernel to power off or reset the machine.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/misc/m68k_virt_ctrl.h |  22 +++++
 hw/misc/m68k_virt_ctrl.c         | 152 +++++++++++++++++++++++++++++++
 hw/misc/Kconfig                  |   3 +
 hw/misc/meson.build              |   3 +
 hw/misc/trace-events             |   7 ++
 5 files changed, 187 insertions(+)
 create mode 100644 include/hw/misc/m68k_virt_ctrl.h
 create mode 100644 hw/misc/m68k_virt_ctrl.c

diff --git a/include/hw/misc/m68k_virt_ctrl.h b/include/hw/misc/m68k_virt_ctrl.h
new file mode 100644
index 000000000000..1db7960e5477
--- /dev/null
+++ b/include/hw/misc/m68k_virt_ctrl.h
@@ -0,0 +1,22 @@
+/*
+ * SPDX-License-Identifer: GPL-2.0-or-later
+ *
+ * Virt m68k system Controller
+ */
+
+#ifndef M68K_VIRT_CTRL_H
+#define M68K_VIRT_CTRL_H
+
+#define TYPE_M68K_VIRT_CTRL "m68k-virt-ctrl"
+OBJECT_DECLARE_SIMPLE_TYPE(M68KVirtCtrlState, M68K_VIRT_CTRL)
+
+struct M68KVirtCtrlState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion iomem;
+    qemu_irq irq;
+
+    uint32_t irq_enabled;
+};
+
+#endif
diff --git a/hw/misc/m68k_virt_ctrl.c b/hw/misc/m68k_virt_ctrl.c
new file mode 100644
index 000000000000..fb34aa10211a
--- /dev/null
+++ b/hw/misc/m68k_virt_ctrl.c
@@ -0,0 +1,152 @@
+/*
+ * SPDX-License-Identifer: GPL-2.0-or-later
+ *
+ * Virt m68k system Controller
+ */
+
+#include "qemu/osdep.h"
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+#include "hw/sysbus.h"
+#include "migration/vmstate.h"
+#include "qemu/log.h"
+#include "trace.h"
+#include "sysemu/runstate.h"
+#include "hw/misc/m68k_virt_ctrl.h"
+
+enum {
+    REG_FEATURES = 0x00,
+    REG_CMD      = 0x04,
+};
+
+#define FEAT_POWER_CTRL 0x00000001
+
+enum {
+    CMD_NOOP,
+    CMD_RESET,
+    CMD_HALT,
+    CMD_PANIC,
+};
+
+static uint64_t m68k_virt_ctrl_read(void *opaque, hwaddr addr,
+                                    unsigned size)
+{
+    M68KVirtCtrlState *s = opaque;
+    uint64_t value = 0;
+
+    switch (addr) {
+    case REG_FEATURES:
+        value = FEAT_POWER_CTRL;
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: unimplemented register read 0x%02"HWADDR_PRIx"\n",
+                      __func__, addr);
+        break;
+    }
+
+    trace_m68k_virt_ctrl_write(s, addr, size, value);
+
+    return value;
+}
+
+static void m68k_virt_ctrl_write(void *opaque, hwaddr addr,
+                                 uint64_t value, unsigned size)
+{
+    M68KVirtCtrlState *s = opaque;
+
+    trace_m68k_virt_ctrl_write(s, addr, size, value);
+
+    switch (addr) {
+    case REG_CMD:
+        switch (value) {
+        case CMD_NOOP:
+            break;
+        case CMD_RESET:
+            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+            break;
+        case CMD_HALT:
+            qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+            break;
+        case CMD_PANIC:
+            qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_PANIC);
+            break;
+        }
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "%s: unimplemented register write 0x%02"HWADDR_PRIx"\n",
+                      __func__, addr);
+        break;
+    }
+}
+
+static const MemoryRegionOps m68k_virt_ctrl_ops = {
+    .read = m68k_virt_ctrl_read,
+    .write = m68k_virt_ctrl_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid.max_access_size = 4,
+    .impl.max_access_size = 4,
+};
+
+static void m68k_virt_ctrl_reset(DeviceState *dev)
+{
+    M68KVirtCtrlState *s = M68K_VIRT_CTRL(dev);
+
+    trace_m68k_virt_ctrl_reset(s);
+}
+
+static void m68k_virt_ctrl_realize(DeviceState *dev, Error **errp)
+{
+    M68KVirtCtrlState *s = M68K_VIRT_CTRL(dev);
+
+    trace_m68k_virt_ctrl_instance_init(s);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &m68k_virt_ctrl_ops, s,
+                          "m68k-virt-ctrl", 0x100);
+}
+
+static const VMStateDescription vmstate_m68k_virt_ctrl = {
+    .name = "m68k-virt-ctrl",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(irq_enabled, M68KVirtCtrlState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void m68k_virt_ctrl_instance_init(Object *obj)
+{
+    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
+    M68KVirtCtrlState *s = M68K_VIRT_CTRL(obj);
+
+    trace_m68k_virt_ctrl_instance_init(s);
+
+    sysbus_init_mmio(dev, &s->iomem);
+    sysbus_init_irq(dev, &s->irq);
+}
+
+static void m68k_virt_ctrl_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->reset = m68k_virt_ctrl_reset;
+    dc->realize = m68k_virt_ctrl_realize;
+    dc->vmsd = &vmstate_m68k_virt_ctrl;
+}
+
+static const TypeInfo m68k_virt_ctrl_info = {
+    .name = TYPE_M68K_VIRT_CTRL,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .class_init = m68k_virt_ctrl_class_init,
+    .instance_init = m68k_virt_ctrl_instance_init,
+    .instance_size = sizeof(M68KVirtCtrlState),
+};
+
+static void m68k_virt_ctrl_register_types(void)
+{
+    type_register_static(&m68k_virt_ctrl_info);
+}
+
+type_init(m68k_virt_ctrl_register_types)
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 19c216f3efb0..9abf021ace0e 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -174,4 +174,7 @@ config SIFIVE_U_OTP
 config SIFIVE_U_PRCI
     bool
 
+config M68K_VIRT_CTRL
+    bool
+
 source macio/Kconfig
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 629283957fcc..49b9e3c05e7a 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -24,6 +24,9 @@ softmmu_ss.add(when: 'CONFIG_ARM11SCU', if_true: files('arm11scu.c'))
 # Mac devices
 softmmu_ss.add(when: 'CONFIG_MOS6522', if_true: files('mos6522.c'))
 
+# virt m68k devices
+softmmu_ss.add(when: 'CONFIG_M68K_VIRT_CTRL', if_true: files('m68k_virt_ctrl.c'))
+
 # RISC-V devices
 softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_DMC', if_true: files('mchp_pfsoc_dmc.c'))
 softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_IOSCB', if_true: files('mchp_pfsoc_ioscb.c'))
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index d626b9d7a7c6..d326fb1d1a56 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -243,3 +243,10 @@ pca955x_gpio_change(const char *description, unsigned id, unsigned prev_state, u
 bcm2835_cprman_read(uint64_t offset, uint64_t value) "offset:0x%" PRIx64 " value:0x%" PRIx64
 bcm2835_cprman_write(uint64_t offset, uint64_t value) "offset:0x%" PRIx64 " value:0x%" PRIx64
 bcm2835_cprman_write_invalid_magic(uint64_t offset, uint64_t value) "offset:0x%" PRIx64 " value:0x%" PRIx64
+
+# m68k_virt_ctrl.c
+m68k_virt_ctrl_read(void *dev, unsigned int addr, unsigned int size, uint64_t value) "ctrl: %p reg: 0x%02x size: %d value: 0x%"PRIx64
+m68k_virt_ctrl_write(void *dev, unsigned int addr, unsigned int size, uint64_t value) "ctrl: %p reg: 0x%02x size: %d value: 0x%"PRIx64
+m68k_virt_ctrl_reset(void *dev) "ctrl: %p"
+m68k_virt_ctrl_realize(void *dev) "ctrl: %p"
+m68k_virt_ctrl_instance_init(void *dev) "ctrl: %p"
-- 
2.29.2


