Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7992DF540
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Dec 2020 12:33:21 +0100 (CET)
Received: from localhost ([::1]:55886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqwxk-0003QZ-Sm
	for lists+qemu-devel@lfdr.de; Sun, 20 Dec 2020 06:33:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqwr8-0005EY-C1
 for qemu-devel@nongnu.org; Sun, 20 Dec 2020 06:26:30 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:56185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqwr3-0005Rs-23
 for qemu-devel@nongnu.org; Sun, 20 Dec 2020 06:26:30 -0500
Received: from localhost.localdomain ([82.252.144.198]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mrggc-1kL8DB2zS8-00ngkP; Sun, 20 Dec 2020 12:26:21 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/7] m68k: add a system controller
Date: Sun, 20 Dec 2020 12:26:13 +0100
Message-Id: <20201220112615.933036-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201220112615.933036-1-laurent@vivier.eu>
References: <20201220112615.933036-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lGUxuMEBce8Vr0OCLR3uvW4TarXsnNPwzy7A05ankZ6JDz855EX
 icLzGbo1v/oTvksDm1hiVF7ewrEV51926LqeO1vKexPQFxVO3TDenEhBJb3e66q02nFpnIR
 NAxAmEu4RQqVnxv28iLBdEtgOhM3MSo2lNeZbMzyQxGxvrwDl9hBKYFtnNF+43H745KVp4j
 TTDJqGroYlzHN9taDWp9w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:m1FSk4STp6w=:7Tn5tdfQYoxJx343FEpB6B
 JTA9lZLqAROltEoevEuRykubAsbFv+DZsvL0Ogws0cMiq3oplFTSofhTdhI36Ja4b6beQ9mbw
 uxjTWxKW/yaoRk3Q3bPFzNwjAhNFSu00+h0DNAfx7Hk5LVZZ8PlhKkQJs/yMstCJgIBNHJUqw
 55T3vs0SSpsT5Ii/J5wJFzl216IKg0WFPMhRit+86dxrynwwduKasUgF6vJO+SmHN+0/2lvtb
 onLxOAdmJrZq9MQOOh+i3B9xmXJ05R5cm2DjQDqTlB4e3HWxFY5ChrNa50SFxFLTccLNe/8oN
 r7xqiwZJwNUXxCBE+7epG8h30GN5SljxLHba0xiHT8s90XhoYr2iW5pcaJogMn1aUPWahdNyf
 xtVPsHa5tKCOoV4NjvXx2ilX2RTEzZt8xcFs6JG3H45/+xVZBrsA1snNwaAy01IG1bmuYnY1d
 LR6QTydEFQ==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
index cf18ac08e666..62fdabb5fb85 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -164,4 +164,7 @@ config SIFIVE_U_OTP
 config SIFIVE_U_PRCI
     bool
 
+config M68K_VIRT_CTRL
+    bool
+
 source macio/Kconfig
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index ce15ffceb958..3e8aebc8eb72 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -23,6 +23,9 @@ softmmu_ss.add(when: 'CONFIG_ARM11SCU', if_true: files('arm11scu.c'))
 # Mac devices
 softmmu_ss.add(when: 'CONFIG_MOS6522', if_true: files('mos6522.c'))
 
+# virt m68k devices
+softmmu_ss.add(when: 'CONFIG_M68K_VIRT_CTRL', if_true: files('m68k_virt_ctrl.c'))
+
 # RISC-V devices
 softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_DMC', if_true: files('mchp_pfsoc_dmc.c'))
 softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_IOSCB', if_true: files('mchp_pfsoc_ioscb.c'))
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index b5118acd3fd5..f8a4b74d8154 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -237,3 +237,10 @@ pca955x_gpio_change(const char *description, unsigned id, unsigned prev_state, u
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


