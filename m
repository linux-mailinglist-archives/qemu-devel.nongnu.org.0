Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 184DA49F274
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 05:23:56 +0100 (CET)
Received: from localhost ([::1]:34738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDInj-000552-6f
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 23:23:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nDIC6-0008Vc-E3
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:45:57 -0500
Received: from mail.loongson.cn ([114.242.206.163]:40760 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nDIBz-0002Nm-DL
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:45:00 -0500
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxGuCMZvNhWCkFAA--.15604S30; 
 Fri, 28 Jan 2022 11:44:38 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v5 28/30] hw/loongarch: Add LoongArch acpi support
Date: Thu, 27 Jan 2022 22:44:10 -0500
Message-Id: <20220128034412.1262452-29-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220128034412.1262452-1-yangxiaojuan@loongson.cn>
References: <20220128034412.1262452-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxGuCMZvNhWCkFAA--.15604S30
X-Coremail-Antispam: 1UD129KBjvAXoWDWF1UKrWxJrWxWw4UJr1UZFb_yoWrCr1rGo
 W3JFWrGw40qr129rZYkr1DZayxWrykKF4DAr93GF4qka1xCw4UGryfKwn5uw12yFn0kryx
 XFySqwnxA397CF18n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUUUUUU=
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: mark.cave-ayland@ilande.co.uk, richard.henderson@linaro.org,
 Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a simple acpi model for LoongArch cpu
More complex functions will be added later

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/acpi/Kconfig                  |   4 +
 hw/acpi/ls7a.c                   | 374 ++++++++++++++++++
 hw/acpi/meson.build              |   1 +
 hw/loongarch/Kconfig             |   2 +
 hw/loongarch/acpi-build.c        | 636 +++++++++++++++++++++++++++++++
 hw/loongarch/loongson3.c         |  61 ++-
 hw/loongarch/meson.build         |   1 +
 include/hw/acpi/ls7a.h           |  53 +++
 include/hw/loongarch/loongarch.h |   6 +
 include/hw/pci-host/ls7a.h       |   5 +
 10 files changed, 1141 insertions(+), 2 deletions(-)
 create mode 100644 hw/acpi/ls7a.c
 create mode 100644 hw/loongarch/acpi-build.c
 create mode 100644 include/hw/acpi/ls7a.h

diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
index 622b0b50b7..30f887d479 100644
--- a/hw/acpi/Kconfig
+++ b/hw/acpi/Kconfig
@@ -11,6 +11,10 @@ config ACPI_X86
     select ACPI_PIIX4
     select ACPI_PCIHP
 
+config ACPI_LOONGARCH
+    bool
+    select ACPI
+
 config ACPI_X86_ICH
     bool
     select ACPI_X86
diff --git a/hw/acpi/ls7a.c b/hw/acpi/ls7a.c
new file mode 100644
index 0000000000..cc658422dd
--- /dev/null
+++ b/hw/acpi/ls7a.c
@@ -0,0 +1,374 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * LoongArch ACPI implementation
+ *
+ * Copyright (C) 2021 Loongson Technology Corporation Limited
+ */
+
+#include "qemu/osdep.h"
+#include "sysemu/sysemu.h"
+#include "hw/hw.h"
+#include "hw/irq.h"
+#include "sysemu/reset.h"
+#include "sysemu/runstate.h"
+#include "hw/acpi/acpi.h"
+#include "hw/acpi/ls7a.h"
+#include "hw/nvram/fw_cfg.h"
+#include "qemu/config-file.h"
+#include "qapi/opts-visitor.h"
+#include "qapi/qapi-events-run-state.h"
+#include "qapi/error.h"
+#include "hw/pci-host/ls7a.h"
+#include "hw/mem/pc-dimm.h"
+#include "hw/mem/nvdimm.h"
+#include "migration/vmstate.h"
+
+static void ls7a_pm_update_sci_fn(ACPIREGS *regs)
+{
+    LS7APMState *pm = container_of(regs, LS7APMState, acpi_regs);
+    acpi_update_sci(&pm->acpi_regs, pm->irq);
+}
+
+static uint64_t ls7a_gpe_readb(void *opaque, hwaddr addr, unsigned width)
+{
+    LS7APMState *pm = opaque;
+    return acpi_gpe_ioport_readb(&pm->acpi_regs, addr);
+}
+
+static void ls7a_gpe_writeb(void *opaque, hwaddr addr, uint64_t val,
+                            unsigned width)
+{
+    LS7APMState *pm = opaque;
+    acpi_gpe_ioport_writeb(&pm->acpi_regs, addr, val);
+    acpi_update_sci(&pm->acpi_regs, pm->irq);
+}
+
+static const MemoryRegionOps ls7a_gpe_ops = {
+    .read = ls7a_gpe_readb,
+    .write = ls7a_gpe_writeb,
+    .valid.min_access_size = 1,
+    .valid.max_access_size = 8,
+    .impl.min_access_size = 1,
+    .impl.max_access_size = 1,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
+#define VMSTATE_GPE_ARRAY(_field, _state)                            \
+ {                                                                   \
+     .name       = (stringify(_field)),                              \
+     .version_id = 0,                                                \
+     .num        = ACPI_GPE0_LEN,                                    \
+     .info       = &vmstate_info_uint8,                              \
+     .size       = sizeof(uint8_t),                                  \
+     .flags      = VMS_ARRAY | VMS_POINTER,                          \
+     .offset     = vmstate_offset_pointer(_state, _field, uint8_t),  \
+ }
+
+static uint64_t ls7a_reset_readw(void *opaque, hwaddr addr, unsigned width)
+{
+    return 0;
+}
+
+static void ls7a_reset_writew(void *opaque, hwaddr addr, uint64_t val,
+                              unsigned width)
+{
+    if (val & 1) {
+        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+        return;
+    }
+}
+
+static const MemoryRegionOps ls7a_reset_ops = {
+    .read = ls7a_reset_readw,
+    .write = ls7a_reset_writew,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
+const VMStateDescription vmstate_ls7a_pm = {
+    .name = "ls7a_pm",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT16(acpi_regs.pm1.evt.sts, LS7APMState),
+        VMSTATE_UINT16(acpi_regs.pm1.evt.en, LS7APMState),
+        VMSTATE_UINT16(acpi_regs.pm1.cnt.cnt, LS7APMState),
+        VMSTATE_TIMER_PTR(acpi_regs.tmr.timer, LS7APMState),
+        VMSTATE_INT64(acpi_regs.tmr.overflow_time, LS7APMState),
+        VMSTATE_GPE_ARRAY(acpi_regs.gpe.sts, LS7APMState),
+        VMSTATE_GPE_ARRAY(acpi_regs.gpe.en, LS7APMState),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static inline int64_t acpi_pm_tmr_get_clock(void)
+{
+    return muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL), PM_TIMER_FREQUENCY,
+                    NANOSECONDS_PER_SECOND);
+}
+
+static uint32_t acpi_pm_tmr_get(ACPIREGS *ar)
+{
+    uint32_t d = acpi_pm_tmr_get_clock();
+    return d & 0xffffff;
+}
+
+static void acpi_pm_tmr_timer(void *opaque)
+{
+    ACPIREGS *ar = opaque;
+    qemu_system_wakeup_request(QEMU_WAKEUP_REASON_PMTIMER, NULL);
+    ar->tmr.update_sci(ar);
+}
+
+static uint64_t acpi_pm_tmr_read(void *opaque, hwaddr addr, unsigned width)
+{
+    return acpi_pm_tmr_get(opaque);
+}
+
+static void acpi_pm_tmr_write(void *opaque, hwaddr addr, uint64_t val,
+                              unsigned width)
+{
+}
+
+static const MemoryRegionOps acpi_pm_tmr_ops = {
+    .read = acpi_pm_tmr_read,
+    .write = acpi_pm_tmr_write,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
+static void ls7a_pm_tmr_init(ACPIREGS *ar, acpi_update_sci_fn update_sci,
+                             MemoryRegion *parent, uint64_t offset)
+{
+    ar->tmr.update_sci = update_sci;
+    ar->tmr.timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, acpi_pm_tmr_timer, ar);
+    memory_region_init_io(&ar->tmr.io, memory_region_owner(parent),
+                          &acpi_pm_tmr_ops, ar, "acpi-tmr", 4);
+    memory_region_add_subregion(parent, offset, &ar->tmr.io);
+}
+
+static void acpi_pm1_evt_write_sts(ACPIREGS *ar, uint16_t val)
+{
+    uint16_t pm1_sts = acpi_pm1_evt_get_sts(ar);
+    if (pm1_sts & val & ACPI_BITMASK_TIMER_STATUS) {
+        /* if TMRSTS is reset, then compute the new overflow time */
+        acpi_pm_tmr_calc_overflow_time(ar);
+    }
+    ar->pm1.evt.sts &= ~val;
+}
+
+static uint64_t acpi_pm_evt_read(void *opaque, hwaddr addr, unsigned width)
+{
+    ACPIREGS *ar = opaque;
+    switch (addr) {
+    case 0:
+        return acpi_pm1_evt_get_sts(ar);
+    case 4:
+        return ar->pm1.evt.en;
+    default:
+        return 0;
+    }
+}
+
+static void acpi_pm1_evt_write_en(ACPIREGS *ar, uint16_t val)
+{
+    ar->pm1.evt.en = val;
+    qemu_system_wakeup_enable(QEMU_WAKEUP_REASON_RTC,
+                              val & ACPI_BITMASK_RT_CLOCK_ENABLE);
+    qemu_system_wakeup_enable(QEMU_WAKEUP_REASON_PMTIMER,
+                              val & ACPI_BITMASK_TIMER_ENABLE);
+}
+
+static void acpi_pm_evt_write(void *opaque, hwaddr addr, uint64_t val,
+                              unsigned width)
+{
+    ACPIREGS *ar = opaque;
+    switch (addr) {
+    case 0:
+        acpi_pm1_evt_write_sts(ar, val);
+        ar->pm1.evt.update_sci(ar);
+        break;
+    case 4:
+        acpi_pm1_evt_write_en(ar, val);
+        ar->pm1.evt.update_sci(ar);
+        break;
+    }
+}
+
+static const MemoryRegionOps acpi_pm_evt_ops = {
+    .read = acpi_pm_evt_read,
+    .write = acpi_pm_evt_write,
+    .valid.min_access_size = 1,
+    .valid.max_access_size = 4,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
+static void ls7a_pm1_evt_init(ACPIREGS *ar, acpi_update_sci_fn update_sci,
+                              MemoryRegion *parent, uint64_t offset)
+{
+    ar->pm1.evt.update_sci = update_sci;
+    memory_region_init_io(&ar->pm1.evt.io, memory_region_owner(parent),
+                          &acpi_pm_evt_ops, ar, "acpi-evt", 8);
+    memory_region_add_subregion(parent, offset, &ar->pm1.evt.io);
+}
+
+static uint64_t acpi_pm_cnt_read(void *opaque, hwaddr addr, unsigned width)
+{
+    ACPIREGS *ar = opaque;
+    return ar->pm1.cnt.cnt;
+}
+
+/* ACPI PM1aCNT */
+static void acpi_pm1_cnt_write(ACPIREGS *ar, uint16_t val)
+{
+    ar->pm1.cnt.cnt = val & ~(ACPI_BITMASK_SLEEP_ENABLE);
+
+    if (val & ACPI_BITMASK_SLEEP_ENABLE) {
+        /* Change suspend type */
+        uint16_t sus_typ = (val >> 10) & 7;
+        switch (sus_typ) {
+        /* Not support s3 s4 yet */
+        case 7: /* Soft power off */
+            qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+            break;
+        default:
+            break;
+        }
+    }
+}
+
+static void acpi_pm_cnt_write(void *opaque, hwaddr addr, uint64_t val,
+                              unsigned width)
+{
+    acpi_pm1_cnt_write(opaque, val);
+}
+
+static const MemoryRegionOps acpi_pm_cnt_ops = {
+    .read = acpi_pm_cnt_read,
+    .write = acpi_pm_cnt_write,
+    .valid.min_access_size = 1,
+    .valid.max_access_size = 4,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
+static void acpi_notify_wakeup(Notifier *notifier, void *data)
+{
+    ACPIREGS *ar = container_of(notifier, ACPIREGS, wakeup);
+    WakeupReason *reason = data;
+
+    switch (*reason) {
+    case QEMU_WAKEUP_REASON_RTC:
+        ar->pm1.evt.sts |=
+            (ACPI_BITMASK_WAKE_STATUS | ACPI_BITMASK_RT_CLOCK_STATUS);
+        break;
+    case QEMU_WAKEUP_REASON_PMTIMER:
+        ar->pm1.evt.sts |=
+            (ACPI_BITMASK_WAKE_STATUS | ACPI_BITMASK_TIMER_STATUS);
+        break;
+    case QEMU_WAKEUP_REASON_OTHER:
+        /*
+         * ACPI_BITMASK_WAKE_STATUS should be set on resume.
+         * Pretend that resume was caused by power button
+         */
+        ar->pm1.evt.sts |=
+            (ACPI_BITMASK_WAKE_STATUS | ACPI_BITMASK_POWER_BUTTON_STATUS);
+        break;
+    default:
+        break;
+    }
+}
+
+static void ls7a_pm1_cnt_init(ACPIREGS *ar, MemoryRegion *parent,
+                              uint64_t offset)
+{
+    ar->wakeup.notify = acpi_notify_wakeup;
+    qemu_register_wakeup_notifier(&ar->wakeup);
+    memory_region_init_io(&ar->pm1.cnt.io, memory_region_owner(parent),
+                          &acpi_pm_cnt_ops, ar, "acpi-cnt", 4);
+    memory_region_add_subregion(parent, offset, &ar->pm1.cnt.io);
+}
+
+static void ls7a_pm_reset(DeviceState *d)
+{
+    LS7APMState *pm = LS7A_PM(d);
+
+    acpi_pm1_evt_reset(&pm->acpi_regs);
+    acpi_pm1_cnt_reset(&pm->acpi_regs);
+    acpi_pm_tmr_reset(&pm->acpi_regs);
+    acpi_gpe_reset(&pm->acpi_regs);
+
+    acpi_update_sci(&pm->acpi_regs, pm->irq);
+}
+
+static void pm_powerdown_req(Notifier *n, void *opaque)
+{
+    LS7APMState *pm = container_of(n, LS7APMState, powerdown_notifier);
+
+    acpi_pm1_evt_power_down(&pm->acpi_regs);
+}
+
+void ls7a_pm_init(DeviceState *ls7a_pm, qemu_irq pm_irq)
+{
+    LS7APMState *pm = LS7A_PM(ls7a_pm);
+    pm->irq = pm_irq;
+}
+
+static void ls7a_pm_realize(DeviceState *dev, Error **errp)
+{
+    LS7APMState *pm = LS7A_PM(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+
+    /*
+     * ls7a board acpi hardware info, including
+     * acpi system io base address
+     * acpi gpe length
+     * acpi sci irq number
+     */
+
+    memory_region_init(&pm->iomem, OBJECT(pm), "ls7a_pm", ACPI_IO_SIZE);
+    sysbus_init_mmio(sbd, &pm->iomem);
+
+    ls7a_pm_tmr_init(&pm->acpi_regs, ls7a_pm_update_sci_fn,
+                     &pm->iomem, LS7A_PM_TMR_BLK);
+    ls7a_pm1_evt_init(&pm->acpi_regs, ls7a_pm_update_sci_fn,
+                      &pm->iomem, LS7A_PM_EVT_BLK);
+    ls7a_pm1_cnt_init(&pm->acpi_regs, &pm->iomem, LS7A_PM_CNT_BLK);
+
+    acpi_gpe_init(&pm->acpi_regs, ACPI_GPE0_LEN);
+    memory_region_init_io(&pm->iomem_gpe, OBJECT(pm), &ls7a_gpe_ops, pm,
+                          "acpi-gpe0", ACPI_GPE0_LEN);
+    sysbus_init_mmio(sbd, &pm->iomem_gpe);
+
+    memory_region_init_io(&pm->iomem_reset, OBJECT(pm),
+                          &ls7a_reset_ops, pm, "acpi-reset", 4);
+    sysbus_init_mmio(sbd, &pm->iomem_reset);
+
+    pm->powerdown_notifier.notify = pm_powerdown_req;
+    qemu_register_powerdown_notifier(&pm->powerdown_notifier);
+}
+
+static void ls7a_pm_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = ls7a_pm_realize;
+    dc->reset = ls7a_pm_reset;
+    dc->desc = "PM";
+    dc->vmsd = &vmstate_ls7a_pm;
+}
+
+static const TypeInfo ls7a_pm_info = {
+    .name          = TYPE_LS7A_PM,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(LS7APMState),
+    .class_init    = ls7a_pm_class_init,
+};
+
+static void ls7a_pm_register_types(void)
+{
+    type_register_static(&ls7a_pm_info);
+}
+
+type_init(ls7a_pm_register_types)
diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
index adf6347bc4..52f851d52b 100644
--- a/hw/acpi/meson.build
+++ b/hw/acpi/meson.build
@@ -25,6 +25,7 @@ acpi_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true: files('ich9.c', 'tco.c'))
 acpi_ss.add(when: 'CONFIG_IPMI', if_true: files('ipmi.c'), if_false: files('ipmi-stub.c'))
 acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))
 acpi_ss.add(when: 'CONFIG_TPM', if_true: files('tpm.c'))
+acpi_ss.add(when: 'CONFIG_ACPI_LOONGARCH', if_true: files('ls7a.c'))
 softmmu_ss.add(when: 'CONFIG_ACPI', if_false: files('acpi-stub.c', 'aml-build-stub.c', 'ghes-stub.c'))
 softmmu_ss.add_all(when: 'CONFIG_ACPI', if_true: acpi_ss)
 softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-stub.c', 'aml-build-stub.c',
diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
index 6e24e112b3..d3c8f8768e 100644
--- a/hw/loongarch/Kconfig
+++ b/hw/loongarch/Kconfig
@@ -15,6 +15,8 @@ config LOONGSON3_LS7A
     select LS7A_RTC
     select FW_CFG_LOONGARCH
     select SMBIOS
+    select ACPI_LOONGARCH
+    select ACPI_PCI
 
 config FW_CFG_LOONGARCH
     bool
diff --git a/hw/loongarch/acpi-build.c b/hw/loongarch/acpi-build.c
new file mode 100644
index 0000000000..60e00aec09
--- /dev/null
+++ b/hw/loongarch/acpi-build.c
@@ -0,0 +1,636 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Support for generating ACPI tables and passing them to Guests
+ *
+ * Copyright (C) 2021 Loongson Technology Corporation Limited
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/bitmap.h"
+#include "hw/pci/pci.h"
+#include "hw/core/cpu.h"
+#include "target/loongarch/cpu.h"
+#include "hw/acpi/acpi-defs.h"
+#include "hw/acpi/acpi.h"
+#include "hw/nvram/fw_cfg.h"
+#include "hw/acpi/bios-linker-loader.h"
+#include "migration/vmstate.h"
+#include "hw/mem/memory-device.h"
+#include "sysemu/reset.h"
+
+/* Supported chipsets: */
+#include "hw/pci-host/ls7a.h"
+#include "hw/loongarch/loongarch.h"
+#include "hw/acpi/aml-build.h"
+
+#include "hw/acpi/utils.h"
+#include "hw/acpi/pci.h"
+
+#include "qom/qom-qobject.h"
+
+#include "hw/acpi/ls7a.h"
+
+#define ACPI_BUILD_ALIGN_SIZE             0x1000
+#define ACPI_BUILD_TABLE_SIZE             0x20000
+
+#ifdef DEBUG_ACPI_BUILD
+#define ACPI_BUILD_DPRINTF(fmt, ...)        \
+    do {printf("ACPI_BUILD: " fmt, ## __VA_ARGS__); } while (0)
+#else
+#define ACPI_BUILD_DPRINTF(fmt, ...)
+#endif
+
+static void init_common_fadt_data(AcpiFadtData *data)
+{
+    AmlAddressSpace as = AML_AS_SYSTEM_MEMORY;
+    uint64_t base = LS7A_ACPI_REG_BASE;
+    AcpiFadtData fadt = {
+        .rev = 3,
+        .flags =
+            (1 << ACPI_FADT_F_WBINVD) |
+            (1 << ACPI_FADT_F_PROC_C1) |
+            (1 << ACPI_FADT_F_SLP_BUTTON) |
+            (1 << ACPI_FADT_F_TMR_VAL_EXT) |
+            (1 << ACPI_FADT_F_RESET_REG_SUP),
+        /* C2 state not supported */
+        .plvl2_lat = 0xfff,
+        /* C3 state not supported */
+        .plvl3_lat = 0xfff,
+        .smi_cmd = 0x00,
+        .sci_int = ACPI_SCI_IRQ,
+        .acpi_enable_cmd = 0x00,
+        .acpi_disable_cmd = 0x00,
+        .pm1a_evt = { .space_id = as, .bit_width = 8 * 8,
+                      .address = base + LS7A_PM_EVT_BLK },
+        .pm1a_cnt = { .space_id = as, .bit_width = 4 * 8,
+                      .address = base + LS7A_PM_CNT_BLK },
+        .pm_tmr = { .space_id = as, .bit_width = 4 * 8,
+                    .address = base + LS7A_PM_TMR_BLK },
+        .gpe0_blk = { .space_id = as, .bit_width = 8 * 8,
+                      .address = base + LS7A_GPE0_STS_REG},
+        .reset_reg = { .space_id = as, .bit_width = 4 * 8,
+                       .address = base + LS7A_GPE0_RESET_REG},
+        .reset_val = 0x1,
+    };
+    *data = fadt;
+}
+
+static void acpi_align_size(GArray *blob, unsigned align)
+{
+    /*
+     * Align size to multiple of given size. This reduces the chance
+     * we need to change size in the future (breaking cross version migration).
+     */
+    g_array_set_size(blob, ROUND_UP(acpi_data_len(blob), align));
+}
+
+/*
+ * ACPI spec 1.0b,
+ * 5.2.6 Firmware ACPI Control Structure
+ */
+static void
+build_facs(GArray *table_data)
+{
+    const char *sig = "FACS";
+    const uint8_t reserved[40] = {};
+
+    g_array_append_vals(table_data, sig, 4); /* Signature */
+    build_append_int_noprefix(table_data, 64, 4); /* Length */
+    build_append_int_noprefix(table_data, 0, 4); /* Hardware Signature */
+    build_append_int_noprefix(table_data, 0, 4); /* Firmware Waking Vector */
+    build_append_int_noprefix(table_data, 0, 4); /* Global Lock */
+    build_append_int_noprefix(table_data, 0, 4); /* Flags */
+    g_array_append_vals(table_data, reserved, 40); /* Reserved */
+}
+
+static void
+build_madt(GArray *table_data, BIOSLinker *linker, LoongArchMachineState *lams)
+{
+    MachineState *ms = MACHINE(lams);
+    int i;
+    AcpiTable table = { .sig = "APIC", .rev = 1, .oem_id = lams->oem_id,
+                        .oem_table_id = lams->oem_table_id };
+
+    acpi_table_begin(&table, table_data);
+
+    /* Local APIC Address */
+    build_append_int_noprefix(table_data, 0, 4);
+    build_append_int_noprefix(table_data, 1 /* PCAT_COMPAT */, 4); /* Flags */
+
+    for (i = 0; i < ms->smp.cpus; i++) {
+        /* Rev 1.0b, Table 5-13 Processor Core Interrupt Controller Structure */
+        build_append_int_noprefix(table_data, 17, 1);    /* Type */
+        build_append_int_noprefix(table_data, 15, 1);    /* Length */
+        build_append_int_noprefix(table_data, 1, 1);     /* Version */
+        build_append_int_noprefix(table_data, i + 1, 4); /* ACPI Processor ID */
+        build_append_int_noprefix(table_data, i, 4);     /* Core ID */
+        build_append_int_noprefix(table_data, 1, 4);     /* Flags */
+    }
+
+    /* Rev 1.0b, Table 5-13 Extend I/O Interrupt Controller Structure */
+    build_append_int_noprefix(table_data, 20, 1);        /* Type */
+    build_append_int_noprefix(table_data, 13, 1);        /* Length */
+    build_append_int_noprefix(table_data, 1, 1);         /* Version */
+    build_append_int_noprefix(table_data, 3, 1);         /* Cascade */
+    build_append_int_noprefix(table_data, 0, 1);         /* Node */
+    build_append_int_noprefix(table_data, 0xffff, 8);    /* Node map */
+
+    /* Rev 1.0b, Table 5-13 MSI Interrupt Controller Structure */
+    build_append_int_noprefix(table_data, 21, 1);        /* Type */
+    build_append_int_noprefix(table_data, 19, 1);        /* Length */
+    build_append_int_noprefix(table_data, 1, 1);         /* Version */
+    build_append_int_noprefix(table_data, 0x2ff00000, 8);/* Address */
+    build_append_int_noprefix(table_data, 0x40, 4);      /* Start */
+    build_append_int_noprefix(table_data, 0xc0, 4);      /* Count */
+
+    /* Rev 1.0b, Table 5-13 Bridge I/O Interrupt Controller Structure */
+    build_append_int_noprefix(table_data, 22, 1);        /* Type */
+    build_append_int_noprefix(table_data, 17, 1);        /* Length */
+    build_append_int_noprefix(table_data, 1, 1);         /* Version */
+    build_append_int_noprefix(table_data, 0x10000000, 8);/* Address */
+    build_append_int_noprefix(table_data, 0x1000, 2);    /* Size */
+    build_append_int_noprefix(table_data, 0, 2);         /* Id */
+    build_append_int_noprefix(table_data, 0x40, 2);      /* Base */
+
+    acpi_table_end(linker, &table);
+}
+
+/*
+ * ACPI spec, Revision 3.0
+ * 5.2.15 System Resource Affinity Table (SRAT)
+ */
+static void
+build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
+{
+    uint64_t i, mem_len, mem_base;
+    LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
+    MachineState *ms = MACHINE(lams);
+    AcpiTable table = { .sig = "SRAT", .rev = 1, .oem_id = lams->oem_id,
+                        .oem_table_id = lams->oem_table_id };
+
+    acpi_table_begin(&table, table_data);
+    build_append_int_noprefix(table_data, 1, 4); /* Reserved */
+    build_append_int_noprefix(table_data, 0, 8); /* Reserved */
+
+    for (i = 0; i < ms->smp.cpus; ++i) {
+        /* 5.2.15.1 Processor Local APIC/SAPIC Affinity Structure */
+        build_append_int_noprefix(table_data, 0, 1);  /* Type  */
+        build_append_int_noprefix(table_data, 16, 1); /* Length */
+        /* Proximity Domain [7:0] */
+        build_append_int_noprefix(table_data, 0, 1);
+        build_append_int_noprefix(table_data, i, 1); /* APIC ID */
+        /* Flags, Table 5-36 */
+        build_append_int_noprefix(table_data, 1, 4);
+        build_append_int_noprefix(table_data, 0, 1); /* Local SAPIC EID */
+        /* Proximity Domain [31:8] */
+        build_append_int_noprefix(table_data, 0, 3);
+        build_append_int_noprefix(table_data, 0, 4); /* Reserved */
+    }
+
+    mem_base = 0;
+    mem_len = 0x10000000;
+    build_srat_memory(table_data, mem_base, mem_len,
+                        0, MEM_AFFINITY_ENABLED);
+
+    mem_base = 0x90000000;
+    mem_len = machine->ram_size - 0x10000000;
+    build_srat_memory(table_data, mem_base, mem_len,
+                            0, MEM_AFFINITY_ENABLED);
+
+    acpi_table_end(linker, &table);
+}
+
+typedef
+struct AcpiBuildState {
+    /* Copy of table in RAM (for patching). */
+    MemoryRegion *table_mr;
+    /* Is table patched? */
+    uint8_t patched;
+    void *rsdp;
+    MemoryRegion *rsdp_mr;
+    MemoryRegion *linker_mr;
+} AcpiBuildState;
+
+static void build_ls7a_pci0_int(Aml *table)
+{
+    Aml *sb_scope = aml_scope("_SB");
+    Aml *pci0_scope = aml_scope("PCI0");
+    Aml *prt_pkg = aml_varpackage(128);
+    int slot, pin;
+
+    for (slot = 0; slot < PCI_SLOT_MAX; slot++) {
+        for (pin = 0; pin < PCI_NUM_PINS; pin++) {
+            Aml *pkg = aml_package(4);
+            aml_append(pkg, aml_int((slot << 16) | 0xFFFF));
+            aml_append(pkg, aml_int(pin));
+            aml_append(pkg, aml_int(0));
+            aml_append(pkg, aml_int(80 + (slot * 4 + pin) % LS7A_PCI_IRQS));
+            aml_append(prt_pkg, pkg);
+        }
+    }
+    aml_append(pci0_scope, aml_name_decl("_PRT", prt_pkg));
+    aml_append(sb_scope, pci0_scope);
+    aml_append(table, sb_scope);
+}
+
+static void build_dbg_aml(Aml *table)
+{
+    Aml *field;
+    Aml *method;
+    Aml *while_ctx;
+    Aml *scope = aml_scope("\\");
+    Aml *buf = aml_local(0);
+    Aml *len = aml_local(1);
+    Aml *idx = aml_local(2);
+
+    aml_append(scope,
+       aml_operation_region("DBG", AML_SYSTEM_IO, aml_int(0x0402), 0x01));
+    field = aml_field("DBG", AML_BYTE_ACC, AML_NOLOCK, AML_PRESERVE);
+    aml_append(field, aml_named_field("DBGB", 8));
+    aml_append(scope, field);
+
+    method = aml_method("DBUG", 1, AML_NOTSERIALIZED);
+
+    aml_append(method, aml_to_hexstring(aml_arg(0), buf));
+    aml_append(method, aml_to_buffer(buf, buf));
+    aml_append(method, aml_subtract(aml_sizeof(buf), aml_int(1), len));
+    aml_append(method, aml_store(aml_int(0), idx));
+
+    while_ctx = aml_while(aml_lless(idx, len));
+    aml_append(while_ctx,
+        aml_store(aml_derefof(aml_index(buf, idx)), aml_name("DBGB")));
+    aml_append(while_ctx, aml_increment(idx));
+    aml_append(method, while_ctx);
+    aml_append(method, aml_store(aml_int(0x0A), aml_name("DBGB")));
+    aml_append(scope, method);
+    aml_append(table, scope);
+}
+
+static Aml *build_ls7a_osc_method(void)
+{
+    Aml *if_ctx;
+    Aml *if_ctx2;
+    Aml *else_ctx;
+    Aml *method;
+    Aml *a_cwd1 = aml_name("CDW1");
+    Aml *a_ctrl = aml_local(0);
+
+    method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
+    aml_append(method, aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
+
+    if_ctx = aml_if(aml_equal(
+        aml_arg(0), aml_touuid("33DB4D5B-1FF7-401C-9657-7441C03DD766")));
+    aml_append(if_ctx, aml_create_dword_field(aml_arg(3), aml_int(4), "CDW2"));
+    aml_append(if_ctx, aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
+    aml_append(if_ctx, aml_store(aml_name("CDW3"), a_ctrl));
+
+    /*
+     * Always allow native PME, AER (no dependencies)
+     * Allow SHPC (PCI bridges can have SHPC controller)
+     */
+    aml_append(if_ctx, aml_and(a_ctrl, aml_int(0x1F), a_ctrl));
+
+    if_ctx2 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(1))));
+    /* Unknown revision */
+    aml_append(if_ctx2, aml_or(a_cwd1, aml_int(0x08), a_cwd1));
+    aml_append(if_ctx, if_ctx2);
+
+    if_ctx2 = aml_if(aml_lnot(aml_equal(aml_name("CDW3"), a_ctrl)));
+    /* Capabilities bits were masked */
+    aml_append(if_ctx2, aml_or(a_cwd1, aml_int(0x10), a_cwd1));
+    aml_append(if_ctx, if_ctx2);
+
+    /* Update DWORD3 in the buffer */
+    aml_append(if_ctx, aml_store(a_ctrl, aml_name("CDW3")));
+    aml_append(method, if_ctx);
+
+    else_ctx = aml_else();
+    /* Unrecognized UUID */
+    aml_append(else_ctx, aml_or(a_cwd1, aml_int(4), a_cwd1));
+    aml_append(method, else_ctx);
+
+    aml_append(method, aml_return(aml_arg(3)));
+    return method;
+}
+
+static void build_ls7a_uart_device_aml(Aml *table)
+{
+    Aml *dev;
+    Aml *crs;
+    Aml *pkg0, *pkg1, *pkg2;
+    uint32_t uart_irq = LS7A_UART_IRQ;
+
+    Aml *scope = aml_scope("_SB");
+    dev = aml_device("COMA");
+    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0501")));
+    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
+    aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
+    crs = aml_resource_template();
+    aml_append(crs,
+        aml_qword_memory(AML_POS_DECODE, AML_MIN_FIXED, AML_MAX_FIXED,
+                         AML_NON_CACHEABLE, AML_READ_WRITE,
+                         0, 0x1FE001E0, 0x1FE001E7, 0, 0x8));
+    aml_append(crs, aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
+                                  AML_SHARED, &uart_irq, 1));
+    aml_append(dev, aml_name_decl("_CRS", crs));
+    pkg0 = aml_package(0x2);
+    aml_append(pkg0, aml_int(0x05F5E100));
+    aml_append(pkg0, aml_string("clock-frenquency"));
+    pkg1 = aml_package(0x1);
+    aml_append(pkg1, pkg0);
+    pkg2 = aml_package(0x2);
+    aml_append(pkg2, aml_touuid("DAFFD814-6EBA-4D8C-8A91-BC9BBF4AA301"));
+    aml_append(pkg2, pkg1);
+    aml_append(dev, aml_name_decl("_DSD", pkg2));
+    aml_append(scope, dev);
+    aml_append(table, scope);
+}
+
+static void
+build_dsdt(GArray *table_data, BIOSLinker *linker, MachineState *machine)
+{
+    Aml *dsdt, *sb_scope, *scope, *dev, *crs, *pkg;
+    uint64_t base = LS7A_ACPI_REG_BASE;
+    int root_bus_limit = 0x7F;
+    LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
+    AcpiTable table = { .sig = "DSDT", .rev = 1, .oem_id = lams->oem_id,
+                        .oem_table_id = lams->oem_table_id };
+
+    acpi_table_begin(&table, table_data);
+
+    dsdt = init_aml_allocator();
+
+    build_dbg_aml(dsdt);
+
+    sb_scope = aml_scope("_SB");
+    dev = aml_device("PCI0");
+    aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
+    aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
+    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
+    aml_append(dev, aml_name_decl("_BBN", aml_int(0)));
+    aml_append(dev, aml_name_decl("_UID", aml_int(1)));
+    aml_append(dev, build_ls7a_osc_method());
+    aml_append(sb_scope, dev);
+    aml_append(dsdt, sb_scope);
+
+    build_ls7a_pci0_int(dsdt);
+    build_ls7a_uart_device_aml(dsdt);
+
+    scope =  aml_scope("_GPE");
+    {
+        aml_append(scope, aml_name_decl("_HID", aml_string("ACPI0006")));
+    }
+    aml_append(dsdt, scope);
+
+    scope = aml_scope("\\_SB.PCI0");
+    /* Build PCI0._CRS */
+    crs = aml_resource_template();
+    aml_append(crs,
+        aml_word_bus_number(AML_MIN_FIXED, AML_MAX_FIXED, AML_POS_DECODE,
+                            0x0000, 0x0, root_bus_limit,
+                            0x0000, root_bus_limit + 1));
+    aml_append(crs,
+        aml_dword_io(AML_MIN_FIXED, AML_MAX_FIXED,
+                    AML_POS_DECODE, AML_ENTIRE_RANGE,
+                    0x0000, 0x0000, 0xFFFF, 0x18000000, 0x10000));
+    aml_append(crs,
+        aml_dword_memory(AML_POS_DECODE, AML_MIN_FIXED, AML_MAX_FIXED,
+                         AML_CACHEABLE, AML_READ_WRITE,
+                         0, LS7A_PCI_MEM_BASE,
+                         LS7A_PCI_MEM_BASE + LS7A_PCI_MEM_SIZE - 1,
+                         0, LS7A_PCI_MEM_BASE));
+    aml_append(scope, aml_name_decl("_CRS", crs));
+
+    /* Reserve GPE0 block resources */
+    dev = aml_device("GPE0");
+    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A06")));
+    aml_append(dev, aml_name_decl("_UID", aml_string("GPE0 resources")));
+    /* Device present, functioning, decoding, not shown in UI */
+    aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
+    crs = aml_resource_template();
+    aml_append(crs,
+        aml_dword_memory(AML_POS_DECODE, AML_MIN_FIXED, AML_MAX_FIXED,
+                        AML_CACHEABLE, AML_READ_WRITE,
+                        0, base + LS7A_GPE0_STS_REG,
+                        base + LS7A_GPE0_STS_REG + 0x3, 0, 0x4));
+    aml_append(dev, aml_name_decl("_CRS", crs));
+    aml_append(scope, dev);
+    aml_append(dsdt, scope);
+
+    scope = aml_scope("\\");
+    pkg = aml_package(4);
+    aml_append(pkg, aml_int(7)); /* PM1a_CNT.SLP_TYP */
+    aml_append(pkg, aml_int(7)); /* PM1b_CNT.SLP_TYP not impl. */
+    aml_append(pkg, aml_int(0)); /* Reserved */
+    aml_append(pkg, aml_int(0)); /* Reserved */
+    aml_append(scope, aml_name_decl("_S5", pkg));
+    aml_append(dsdt, scope);
+
+    /* Copy AML table into ACPI tables blob and patch header there */
+    g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
+    acpi_table_end(linker, &table);
+    free_aml_allocator();
+}
+
+static void acpi_build(AcpiBuildTables *tables, MachineState *machine)
+{
+    LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
+    GArray *table_offsets;
+    AcpiFadtData fadt_data;
+    unsigned facs, rsdt, fadt, dsdt;
+    uint8_t *u;
+    size_t aml_len = 0;
+    GArray *tables_blob = tables->table_data;
+
+    init_common_fadt_data(&fadt_data);
+
+    table_offsets = g_array_new(false, true, sizeof(uint32_t));
+    ACPI_BUILD_DPRINTF("init ACPI tables\n");
+
+    bios_linker_loader_alloc(tables->linker,
+                             ACPI_BUILD_TABLE_FILE, tables_blob,
+                             64, false);
+
+    /*
+     * FACS is pointed to by FADT.
+     * We place it first since it's the only table that has alignment
+     * requirements.
+     */
+    facs = tables_blob->len;
+    build_facs(tables_blob);
+
+    /* DSDT is pointed to by FADT */
+    dsdt = tables_blob->len;
+    build_dsdt(tables_blob, tables->linker, machine);
+
+    /*
+     * Count the size of the DSDT, we will need it for
+     * legacy sizing of ACPI tables.
+     */
+    aml_len += tables_blob->len - dsdt;
+
+    /* ACPI tables pointed to by RSDT */
+    fadt = tables_blob->len;
+    acpi_add_table(table_offsets, tables_blob);
+    fadt_data.facs_tbl_offset = &facs;
+    fadt_data.dsdt_tbl_offset = &dsdt;
+    fadt_data.xdsdt_tbl_offset = &dsdt;
+    build_fadt(tables_blob, tables->linker, &fadt_data,
+               lams->oem_id, lams->oem_table_id);
+    aml_len += tables_blob->len - fadt;
+
+    acpi_add_table(table_offsets, tables_blob);
+    build_madt(tables_blob, tables->linker, lams);
+
+    acpi_add_table(table_offsets, tables_blob);
+    build_srat(tables_blob, tables->linker, machine);
+
+    acpi_add_table(table_offsets, tables_blob);
+    {
+        AcpiMcfgInfo mcfg = {
+           .base = cpu_to_le64(LS_PCIECFG_BASE),
+           .size = cpu_to_le64(LS_PCIECFG_SIZE),
+        };
+        build_mcfg(tables_blob, tables->linker, &mcfg, lams->oem_id,
+                   lams->oem_table_id);
+    }
+
+    /* Add tables supplied by user (if any) */
+    for (u = acpi_table_first(); u; u = acpi_table_next(u)) {
+        unsigned len = acpi_table_len(u);
+
+        acpi_add_table(table_offsets, tables_blob);
+        g_array_append_vals(tables_blob, u, len);
+    }
+
+    /* RSDT is pointed to by RSDP */
+    rsdt = tables_blob->len;
+    build_rsdt(tables_blob, tables->linker, table_offsets,
+               lams->oem_id, lams->oem_table_id);
+
+    /* RSDP is in FSEG memory, so allocate it separately */
+    {
+        AcpiRsdpData rsdp_data = {
+            .revision = 0,
+            .oem_id = lams->oem_id,
+            .xsdt_tbl_offset = NULL,
+            .rsdt_tbl_offset = &rsdt,
+        };
+        build_rsdp(tables->rsdp, tables->linker, &rsdp_data);
+    }
+
+    /*
+     * The align size is 128, warn if 64k is not enough therefore
+     * the align size could be resized.
+     */
+    if (tables_blob->len > ACPI_BUILD_TABLE_SIZE / 2) {
+        warn_report("ACPI table size %u exceeds %d bytes,"
+                    " migration may not work",
+                    tables_blob->len, ACPI_BUILD_TABLE_SIZE / 2);
+        error_printf("Try removing CPUs, NUMA nodes, memory slots"
+                     " or PCI bridges.");
+    }
+
+    acpi_align_size(tables->linker->cmd_blob, ACPI_BUILD_ALIGN_SIZE);
+
+    /* Cleanup memory that's no longer used. */
+    g_array_free(table_offsets, true);
+}
+
+static void acpi_ram_update(MemoryRegion *mr, GArray *data)
+{
+    uint32_t size = acpi_data_len(data);
+
+    /*
+     * Make sure RAM size is correct - in case it got changed
+     * e.g. by migration
+     */
+    memory_region_ram_resize(mr, size, &error_abort);
+
+    memcpy(memory_region_get_ram_ptr(mr), data->data, size);
+    memory_region_set_dirty(mr, 0, size);
+}
+
+static void acpi_build_update(void *build_opaque)
+{
+    AcpiBuildState *build_state = build_opaque;
+    AcpiBuildTables tables;
+
+    /* No state to update or already patched? Nothing to do. */
+    if (!build_state || build_state->patched) {
+        return;
+    }
+    build_state->patched = 1;
+
+    acpi_build_tables_init(&tables);
+
+    acpi_build(&tables, MACHINE(qdev_get_machine()));
+
+    acpi_ram_update(build_state->table_mr, tables.table_data);
+    acpi_ram_update(build_state->rsdp_mr, tables.rsdp);
+    acpi_ram_update(build_state->linker_mr, tables.linker->cmd_blob);
+
+    acpi_build_tables_cleanup(&tables, true);
+}
+
+static void acpi_build_reset(void *build_opaque)
+{
+    AcpiBuildState *build_state = build_opaque;
+    build_state->patched = 0;
+}
+
+static const VMStateDescription vmstate_acpi_build = {
+    .name = "acpi_build",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8(patched, AcpiBuildState),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+void loongarch_acpi_setup(LoongArchMachineState *lams)
+{
+    AcpiBuildTables tables;
+    AcpiBuildState *build_state;
+
+    if (!lams->fw_cfg) {
+        ACPI_BUILD_DPRINTF("No fw cfg. Bailing out.\n");
+        return;
+    }
+
+    if (!loongarch_is_acpi_enabled(lams)) {
+        ACPI_BUILD_DPRINTF("ACPI disabled. Bailing out.\n");
+        return;
+    }
+
+    build_state = g_malloc0(sizeof *build_state);
+
+    acpi_build_tables_init(&tables);
+    acpi_build(&tables, MACHINE(lams));
+
+    /* Now expose it all to Guest */
+    build_state->table_mr = acpi_add_rom_blob(acpi_build_update,
+                                              build_state, tables.table_data,
+                                              ACPI_BUILD_TABLE_FILE);
+    assert(build_state->table_mr != NULL);
+
+    build_state->linker_mr =
+        acpi_add_rom_blob(acpi_build_update, build_state,
+                          tables.linker->cmd_blob, ACPI_BUILD_LOADER_FILE);
+
+    build_state->rsdp_mr = acpi_add_rom_blob(acpi_build_update,
+                                             build_state, tables.rsdp,
+                                             ACPI_BUILD_RSDP_FILE);
+
+    qemu_register_reset(acpi_build_reset, build_state);
+    acpi_build_reset(build_state);
+    vmstate_register(NULL, 0, &vmstate_acpi_build, build_state);
+
+    /*
+     * Cleanup tables but don't free the memory: we track it
+     * in build_state.
+     */
+    acpi_build_tables_cleanup(&tables, false);
+}
diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index e5181e6fe6..a4dd2509c4 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -30,6 +30,8 @@
 #include "hw/misc/unimp.h"
 #include "hw/loongarch/fw_cfg.h"
 #include "hw/firmware/smbios.h"
+#include "hw/acpi/aml-build.h"
+#include "qapi/qapi-visit-common.h"
 
 #include "target/loongarch/cpu.h"
 
@@ -138,6 +140,7 @@ void loongarch_machine_done(Notifier *notifier, void *data)
 {
     LoongArchMachineState *lams = container_of(notifier,
                                         LoongArchMachineState, machine_done);
+    loongarch_acpi_setup(lams);
     loongarch_build_smbios(lams);
 }
 
@@ -211,10 +214,10 @@ static void loongarch_cpu_set_irq(void *opaque, int irq, int level)
 
 static void loongarch_devices_init(DeviceState *pch_pic)
 {
-    DeviceState *pciehost;
+    DeviceState *pciehost, *ls7a_pm;
     SysBusDevice *d;
     PCIBus *pci_bus;
-    MemoryRegion *pio_alias;
+    MemoryRegion *pio_alias, *pm_reg;
     int i;
 
     pciehost = qdev_new(TYPE_LS7A_HOST_DEVICE);
@@ -276,6 +279,19 @@ static void loongarch_devices_init(DeviceState *pch_pic)
     sysbus_create_simple("ls7a_rtc", LS7A_RTC_REG_BASE,
                          qdev_get_gpio_in(pch_pic,
                          LS7A_RTC_IRQ - PCH_PIC_IRQ_OFFSET));
+
+    /* Init pm */
+    ls7a_pm = qdev_new(TYPE_LS7A_PM);
+    d = SYS_BUS_DEVICE(ls7a_pm);
+    sysbus_realize_and_unref(d, &error_fatal);
+    ls7a_pm_init(ls7a_pm, qdev_get_gpio_in(pch_pic,
+                                           ACPI_SCI_IRQ - PCH_PIC_IRQ_OFFSET));
+    pm_reg = sysbus_mmio_get_region(d, 0);
+    memory_region_add_subregion(get_system_memory(), ACPI_IO_BASE, pm_reg);
+    memory_region_add_subregion(pm_reg, LS7A_GPE0_STS_REG,
+                                sysbus_mmio_get_region(d, 1));
+    memory_region_add_subregion(pm_reg, LS7A_GPE0_RESET_REG,
+                                sysbus_mmio_get_region(d, 2));
 }
 
 static void loongarch_irq_init(LoongArchMachineState *lams)
@@ -468,6 +484,40 @@ static void loongarch_init(MachineState *machine)
     loongarch_irq_init(lams);
 }
 
+bool loongarch_is_acpi_enabled(LoongArchMachineState *lams)
+{
+    if (lams->acpi == ON_OFF_AUTO_OFF) {
+        return false;
+    }
+    return true;
+}
+
+static void loongarch_get_acpi(Object *obj, Visitor *v, const char *name,
+                               void *opaque, Error **errp)
+{
+    LoongArchMachineState *lams = LOONGARCH_MACHINE(obj);
+    OnOffAuto acpi = lams->acpi;
+
+    visit_type_OnOffAuto(v, name, &acpi, errp);
+}
+
+static void loongarch_set_acpi(Object *obj, Visitor *v, const char *name,
+                               void *opaque, Error **errp)
+{
+    LoongArchMachineState *lams = LOONGARCH_MACHINE(obj);
+
+    visit_type_OnOffAuto(v, name, &lams->acpi, errp);
+}
+
+static void loongarch_machine_initfn(Object *obj)
+{
+    LoongArchMachineState *lams = LOONGARCH_MACHINE(obj);
+
+    lams->acpi = ON_OFF_AUTO_AUTO;
+    lams->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
+    lams->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
+}
+
 static void loongarch_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -484,6 +534,12 @@ static void loongarch_class_init(ObjectClass *oc, void *data)
     mc->block_default_type = IF_VIRTIO;
     mc->default_boot_order = "c";
     mc->no_cdrom = 1;
+
+    object_class_property_add(oc, "acpi", "OnOffAuto",
+        loongarch_get_acpi, loongarch_set_acpi,
+        NULL, NULL);
+    object_class_property_set_description(oc, "acpi",
+        "Enable ACPI");
 }
 
 static const TypeInfo loongarch_machine_types[] = {
@@ -491,6 +547,7 @@ static const TypeInfo loongarch_machine_types[] = {
         .name           = TYPE_LOONGARCH_MACHINE,
         .parent         = TYPE_MACHINE,
         .instance_size  = sizeof(LoongArchMachineState),
+        .instance_init = loongarch_machine_initfn,
         .class_init     = loongarch_class_init,
     }
 };
diff --git a/hw/loongarch/meson.build b/hw/loongarch/meson.build
index fed69dfb62..94e0e976d7 100644
--- a/hw/loongarch/meson.build
+++ b/hw/loongarch/meson.build
@@ -1,5 +1,6 @@
 loongarch_ss = ss.source_set()
 loongarch_ss.add(when: 'CONFIG_LOONGSON3_LS7A', if_true: files('loongson3.c'))
 loongarch_ss.add(when: 'CONFIG_FW_CFG_LOONGARCH', if_true: files('fw_cfg.c'))
+loongarch_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-build.c'))
 
 hw_arch += {'loongarch': loongarch_ss}
diff --git a/include/hw/acpi/ls7a.h b/include/hw/acpi/ls7a.h
new file mode 100644
index 0000000000..28fe23c8a3
--- /dev/null
+++ b/include/hw/acpi/ls7a.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QEMU GMCH/LS7A PCI PM Emulation
+ *
+ * Copyright (C) 2021 Loongson Technology Corporation Limited
+ */
+
+#ifndef HW_ACPI_LS7A_H
+#define HW_ACPI_LS7A_H
+
+#include "hw/acpi/acpi.h"
+#include "hw/sysbus.h"
+
+#define LS7A_ACPI_IO_BASE         0x800
+#define LS7A_ACPI_IO_SIZE         0x100
+#define LS7A_PM_EVT_BLK           (0x0C) /* 4 bytes */
+#define LS7A_PM_CNT_BLK           (0x14) /* 2 bytes */
+#define LS7A_GPE0_STS_REG         (0x28) /* 4 bytes */
+#define LS7A_GPE0_ENA_REG         (0x2C) /* 4 bytes */
+#define LS7A_GPE0_RESET_REG       (0x30) /* 4 bytes */
+#define LS7A_PM_TMR_BLK           (0x18) /* 4 bytes */
+#define LS7A_GPE0_LEN             (8)
+#define ACPI_IO_BASE              (LS7A_ACPI_REG_BASE)
+#define ACPI_GPE0_LEN             (LS7A_GPE0_LEN)
+#define ACPI_IO_SIZE              (LS7A_ACPI_IO_SIZE)
+#define ACPI_SCI_IRQ              (LS7A_SCI_IRQ)
+
+typedef struct LS7APMState {
+    SysBusDevice parent_obj;
+    /*
+     * In ls7a spec says that pm1_cnt register is 32bit width and
+     * that the upper 16bits are reserved and unused.
+     * PM1a_CNT_BLK = 2 in FADT so it is defined as uint16_t.
+     */
+    ACPIREGS acpi_regs;
+
+    MemoryRegion iomem;
+    MemoryRegion iomem_gpe;
+    MemoryRegion iomem_reset;
+
+    qemu_irq irq;      /* SCI */
+
+    uint32_t pm_io_base;
+    Notifier powerdown_notifier;
+} LS7APMState;
+
+#define TYPE_LS7A_PM "ls7a_pm"
+DECLARE_INSTANCE_CHECKER(struct LS7APMState, LS7A_PM, TYPE_LS7A_PM)
+
+void ls7a_pm_init(DeviceState *ls7a_pm, qemu_irq irq);
+
+extern const VMStateDescription vmstate_ls7a_pm;
+#endif /* HW_ACPI_LS7A_H */
diff --git a/include/hw/loongarch/loongarch.h b/include/hw/loongarch/loongarch.h
index d746d0eee2..85278fc4b8 100644
--- a/include/hw/loongarch/loongarch.h
+++ b/include/hw/loongarch/loongarch.h
@@ -58,9 +58,15 @@ typedef struct LoongArchMachineState {
     /* State for other subsystems/APIs: */
     Notifier machine_done;
     FWCfgState  *fw_cfg;
+    OnOffAuto   acpi;
+    char        *oem_id;
+    char        *oem_table_id;
 } LoongArchMachineState;
 
 #define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("loongson3-ls7a")
 DECLARE_INSTANCE_CHECKER(LoongArchMachineState, LOONGARCH_MACHINE,
                          TYPE_LOONGARCH_MACHINE)
+
+bool loongarch_is_acpi_enabled(LoongArchMachineState *lams);
+void loongarch_acpi_setup(LoongArchMachineState *lams);
 #endif
diff --git a/include/hw/pci-host/ls7a.h b/include/hw/pci-host/ls7a.h
index d7d0cac049..cac72d0351 100644
--- a/include/hw/pci-host/ls7a.h
+++ b/include/hw/pci-host/ls7a.h
@@ -11,6 +11,7 @@
 #include "hw/pci/pci.h"
 #include "hw/pci/pcie_host.h"
 #include "hw/pci-host/pam.h"
+#include "hw/acpi/ls7a.h"
 #include "qemu/units.h"
 #include "qemu/range.h"
 #include "qom/object.h"
@@ -24,6 +25,8 @@
 #define LS7A_PCI_IO_BASE         0x18004000UL
 #define LS7A_PCI_IO_SIZE         0xC000
 #define LS7A_PCI_IO_OFFSET       0x4000
+#define LS7A_PCI_MEM_BASE        0x40000000UL
+#define LS7A_PCI_MEM_SIZE        0x40000000UL
 
 #define LS7A_PCH_REG_BASE       0x10000000UL
 #define LS7A_IOAPIC_REG_BASE    (LS7A_PCH_REG_BASE)
@@ -44,6 +47,8 @@
 #define LS7A_MISC_REG_BASE      (LS7A_PCH_REG_BASE + 0x00080000)
 #define LS7A_RTC_REG_BASE       (LS7A_MISC_REG_BASE + 0x00050100)
 #define LS7A_RTC_LEN            0x100
+#define LS7A_ACPI_REG_BASE      (LS7A_MISC_REG_BASE + 0x00050000)
+#define LS7A_SCI_IRQ            (PCH_PIC_IRQ_OFFSET + 4)
 
 struct LS7APCIState {
     /*< private >*/
-- 
2.27.0


