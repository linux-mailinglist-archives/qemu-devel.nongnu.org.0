Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 743264684DB
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 13:41:37 +0100 (CET)
Received: from localhost ([::1]:59518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtUMC-0004HP-IM
	for lists+qemu-devel@lfdr.de; Sat, 04 Dec 2021 07:41:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mtTw5-00005v-Uz
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 07:14:37 -0500
Received: from mail.loongson.cn ([114.242.206.163]:59550 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mtTw3-00007E-67
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 07:14:37 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axysj9Wath8+ECAA--.6122S25; 
 Sat, 04 Dec 2021 20:07:41 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 23/27] hw/loongarch: Add LoongArch ls7a rtc device
 support
Date: Sat,  4 Dec 2021 20:07:21 +0800
Message-Id: <1638619645-11283-24-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9Axysj9Wath8+ECAA--.6122S25
X-Coremail-Antispam: 1UD129KBjvJXoWfGF4kGryfZr13ZFW3AFy7ZFb_yoWkuw4Upr
 WDAryDtF48XF4xGryft3Z7Wr1xJ3Z3Gw1avrs8CwsYkFWrJ348ZFyvv3y3XrWUtFs5X3ya
 qa4rWa9I9a17X3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 philmd@redhat.com, i.qemu@xen0n.name, mark.cave-ayland@ilande.co.uk,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 yangxiaojuan@loongson.cn, alistair.francis@wdc.com, maobibo@loongson.cn,
 pbonzini@redhat.com, richard.henderson@linaro.org, alex.bennee@linaro.org,
 gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch add ls7a rtc device support.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/loongarch/Kconfig       |   1 +
 hw/loongarch/loongson3.c   |   3 +
 hw/rtc/Kconfig             |   3 +
 hw/rtc/ls7a_rtc.c          | 323 +++++++++++++++++++++++++++++++++++++
 hw/rtc/meson.build         |   1 +
 include/hw/pci-host/ls7a.h |   4 +
 6 files changed, 335 insertions(+)
 create mode 100644 hw/rtc/ls7a_rtc.c

diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
index 9ea3b92708..6d3506fee9 100644
--- a/hw/loongarch/Kconfig
+++ b/hw/loongarch/Kconfig
@@ -13,3 +13,4 @@ config LOONGSON3_LS7A
     select LOONGARCH_PCH_PIC
     select LOONGARCH_PCH_MSI
     select LOONGARCH_EXTIOI
+    select LS7A_RTC
diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index e4a02e7c18..f86f83c0b8 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -144,6 +144,9 @@ static PCIBus *loongson3_irq_init(MachineState *machine)
                    qdev_get_gpio_in(pch_pic, LS7A_UART_IRQ - PCH_PIC_IRQ_OFFSET),
                    115200, serial_hd(0), DEVICE_LITTLE_ENDIAN);
 
+    sysbus_create_simple("ls7a_rtc", LS7A_RTC_REG_BASE,
+                         qdev_get_gpio_in(pch_pic, LS7A_RTC_IRQ - PCH_PIC_IRQ_OFFSET));
+
     /* Connect 64 pch_pic irqs to extioi */
     for (int i = 0; i < PCH_PIC_IRQ_NUM; i++) {
         sysbus_connect_irq(d, i, qdev_get_gpio_in(extioi, i));
diff --git a/hw/rtc/Kconfig b/hw/rtc/Kconfig
index f06e133b8a..ba8f7bc202 100644
--- a/hw/rtc/Kconfig
+++ b/hw/rtc/Kconfig
@@ -25,3 +25,6 @@ config SUN4V_RTC
 
 config GOLDFISH_RTC
     bool
+
+config LS7A_RTC
+    bool
diff --git a/hw/rtc/ls7a_rtc.c b/hw/rtc/ls7a_rtc.c
new file mode 100644
index 0000000000..b771db2e62
--- /dev/null
+++ b/hw/rtc/ls7a_rtc.c
@@ -0,0 +1,323 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Loongarch LS7A Real Time Clock emulation
+ *
+ * Copyright (C) 2021 Loongson Technology Corporation Limited
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "hw/sysbus.h"
+#include "hw/irq.h"
+#include "include/hw/register.h"
+#include "qemu/timer.h"
+#include "sysemu/sysemu.h"
+#include "qemu/cutils.h"
+#include "qemu/log.h"
+#include "migration/vmstate.h"
+#include "hw/misc/unimp.h"
+
+#define SYS_TOYTRIM        0x20
+#define SYS_TOYWRITE0      0x24
+#define SYS_TOYWRITE1      0x28
+#define SYS_TOYREAD0       0x2C
+#define SYS_TOYREAD1       0x30
+#define SYS_TOYMATCH0      0x34
+#define SYS_TOYMATCH1      0x38
+#define SYS_TOYMATCH2      0x3C
+#define SYS_RTCCTRL        0x40
+#define SYS_RTCTRIM        0x60
+#define SYS_RTCWRTIE0      0x64
+#define SYS_RTCREAD0       0x68
+#define SYS_RTCMATCH0      0x6C
+#define SYS_RTCMATCH1      0x70
+#define SYS_RTCMATCH2      0x74
+
+/*
+ * Shift bits and filed mask
+ */
+#define TOY_MON_MASK   0x3f
+#define TOY_DAY_MASK   0x1f
+#define TOY_HOUR_MASK  0x1f
+#define TOY_MIN_MASK   0x3f
+#define TOY_SEC_MASK   0x3f
+#define TOY_MSEC_MASK  0xf
+
+#define TOY_MON_SHIFT  26
+#define TOY_DAY_SHIFT  21
+#define TOY_HOUR_SHIFT 16
+#define TOY_MIN_SHIFT  10
+#define TOY_SEC_SHIFT  4
+#define TOY_MSEC_SHIFT 0
+
+#define TOY_MATCH_YEAR_MASK  0x3f
+#define TOY_MATCH_MON_MASK   0xf
+#define TOY_MATCH_DAY_MASK   0x1f
+#define TOY_MATCH_HOUR_MASK  0x1f
+#define TOY_MATCH_MIN_MASK   0x3f
+#define TOY_MATCH_SEC_MASK   0x3f
+
+#define TOY_MATCH_YEAR_SHIFT 26
+#define TOY_MATCH_MON_SHIFT  22
+#define TOY_MATCH_DAY_SHIFT  17
+#define TOY_MATCH_HOUR_SHIFT 12
+#define TOY_MATCH_MIN_SHIFT  6
+#define TOY_MATCH_SEC_SHIFT  0
+
+#define TOY_ENABLE_BIT (1U << 11)
+
+#define TYPE_LS7A_RTC "ls7a_rtc"
+OBJECT_DECLARE_SIMPLE_TYPE(LS7A_RTCState, LS7A_RTC)
+
+typedef struct LS7A_RTCState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion iomem;
+    QEMUTimer *timer;
+    /*
+     * Needed to preserve the tick_count across migration, even if the
+     * absolute value of the rtc_clock is different on the source and
+     * destination.
+     */
+    int64_t offset;
+    int64_t data;
+    int64_t save_alarm_offset;
+    int tidx;
+    uint32_t toymatch[3];
+    uint32_t toytrim;
+    uint32_t cntrctl;
+    uint32_t rtctrim;
+    uint32_t rtccount;
+    uint32_t rtcmatch[3];
+    qemu_irq toy_irq;
+} LS7A_RTCState;
+
+enum {
+    TOYEN = 1UL << 11,
+    RTCEN = 1UL << 13,
+};
+
+static uint64_t ls7a_rtc_read(void *opaque, hwaddr addr, unsigned size)
+{
+    LS7A_RTCState *s = LS7A_RTC(opaque);
+    struct tm tm;
+    unsigned int val;
+
+    val = 0;
+
+    switch (addr) {
+    case SYS_TOYREAD0:
+        qemu_get_timedate(&tm, s->offset);
+        val = (((tm.tm_mon + 1) & TOY_MON_MASK) << TOY_MON_SHIFT)
+        | (((tm.tm_mday) & TOY_DAY_MASK) << TOY_DAY_SHIFT)
+        | (((tm.tm_hour) & TOY_HOUR_MASK) << TOY_HOUR_SHIFT)
+        | (((tm.tm_min) & TOY_MIN_MASK) << TOY_MIN_SHIFT)
+        | (((tm.tm_sec) & TOY_SEC_MASK) << TOY_SEC_SHIFT) | 0x0;
+        break;
+    case SYS_TOYREAD1:
+        qemu_get_timedate(&tm, s->offset);
+        val = tm.tm_year;
+        break;
+    case SYS_TOYMATCH0:
+        val = s->toymatch[0];
+        break;
+    case SYS_TOYMATCH1:
+        val = s->toymatch[1];
+        break;
+    case SYS_TOYMATCH2:
+        val = s->toymatch[2];
+        break;
+    case SYS_RTCCTRL:
+        val = s->cntrctl;
+        break;
+    case SYS_RTCREAD0:
+        val = s->rtccount;
+        break;
+    case SYS_RTCMATCH0:
+        val = s->rtcmatch[0];
+        break;
+    case SYS_RTCMATCH1:
+        val = s->rtcmatch[1];
+        break;
+    case SYS_RTCMATCH2:
+        val = s->rtcmatch[2];
+        break;
+    default:
+        val = 0;
+        break;
+    }
+    return val;
+}
+
+static void ls7a_rtc_write(void *opaque, hwaddr addr,
+                           uint64_t val, unsigned size)
+{
+    LS7A_RTCState *s = LS7A_RTC(opaque);
+    struct tm tm;
+    int64_t alarm_offset, year_diff, expire_time;
+
+    switch (addr) {
+    case SYS_TOYWRITE0:
+        qemu_get_timedate(&tm, s->offset);
+        tm.tm_sec = (val >> TOY_SEC_SHIFT) & TOY_SEC_MASK;
+        tm.tm_min = (val >> TOY_MIN_SHIFT) & TOY_MIN_MASK;
+        tm.tm_hour = (val >> TOY_HOUR_SHIFT) & TOY_HOUR_MASK;
+        tm.tm_mday = ((val >> TOY_DAY_SHIFT) & TOY_DAY_MASK);
+        tm.tm_mon = ((val >> TOY_MON_SHIFT) & TOY_MON_MASK) - 1;
+        s->offset = qemu_timedate_diff(&tm);
+        break;
+    case SYS_TOYWRITE1:
+        qemu_get_timedate(&tm, s->offset);
+        tm.tm_year = val;
+        s->offset = qemu_timedate_diff(&tm);
+        break;
+    case SYS_TOYMATCH0:
+        s->toymatch[0] = val;
+        qemu_get_timedate(&tm, s->offset);
+        tm.tm_sec = (val >> TOY_MATCH_SEC_SHIFT) & TOY_MATCH_SEC_MASK;
+        tm.tm_min = (val >> TOY_MATCH_MIN_SHIFT) & TOY_MATCH_MIN_MASK;
+        tm.tm_hour = ((val >> TOY_MATCH_HOUR_SHIFT) & TOY_MATCH_HOUR_MASK);
+        tm.tm_mday = ((val >> TOY_MATCH_DAY_SHIFT) & TOY_MATCH_DAY_MASK);
+        tm.tm_mon = ((val >> TOY_MATCH_MON_SHIFT) & TOY_MATCH_MON_MASK) - 1;
+        year_diff = ((val >> TOY_MATCH_YEAR_SHIFT) & TOY_MATCH_YEAR_MASK);
+        year_diff = year_diff - (tm.tm_year & TOY_MATCH_YEAR_MASK);
+        tm.tm_year = tm.tm_year + year_diff;
+        alarm_offset = qemu_timedate_diff(&tm) - s->offset;
+        if ((alarm_offset < 0) && (alarm_offset > -5)) {
+                alarm_offset = 0;
+        }
+        expire_time = qemu_clock_get_ms(rtc_clock);
+        expire_time += ((alarm_offset * 1000) + 100);
+        timer_mod(s->timer, expire_time);
+        break;
+    case SYS_TOYMATCH1:
+        s->toymatch[1] = val;
+        break;
+    case SYS_TOYMATCH2:
+        s->toymatch[2] = val;
+        break;
+    case SYS_RTCCTRL:
+        s->cntrctl = val;
+        break;
+    case SYS_RTCWRTIE0:
+        s->rtccount = val;
+        break;
+    case SYS_RTCMATCH0:
+        s->rtcmatch[0] = val;
+        break;
+    case SYS_RTCMATCH1:
+        val = s->rtcmatch[1];
+        break;
+    case SYS_RTCMATCH2:
+        val = s->rtcmatch[2];
+        break;
+    default:
+        break;
+    }
+}
+
+static const MemoryRegionOps ls7a_rtc_ops = {
+    .read = ls7a_rtc_read,
+    .write = ls7a_rtc_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+
+};
+
+static void toy_timer(void *opaque)
+{
+    LS7A_RTCState *s = LS7A_RTC(opaque);
+
+    if (s->cntrctl & TOY_ENABLE_BIT) {
+            qemu_irq_pulse(s->toy_irq);
+    }
+}
+
+static void ls7a_rtc_realize(DeviceState *dev, Error **errp)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    LS7A_RTCState *d = LS7A_RTC(sbd);
+    memory_region_init_io(&d->iomem, NULL, &ls7a_rtc_ops,
+                    (void *)d, "ls7a_rtc", 0x100);
+
+    sysbus_init_irq(sbd, &d->toy_irq);
+
+    sysbus_init_mmio(sbd, &d->iomem);
+    d->timer = timer_new_ms(rtc_clock, toy_timer, d);
+    timer_mod(d->timer, qemu_clock_get_ms(rtc_clock) + 100);
+    d->offset = 0;
+
+    create_unimplemented_device("mmio fallback 1", 0x10013ffc, 0x4);
+}
+
+static int ls7a_rtc_pre_save(void *opaque)
+{
+    LS7A_RTCState *s = LS7A_RTC(opaque);
+    struct tm tm;
+    int64_t year_diff, value;
+
+    value = s->toymatch[0];
+    qemu_get_timedate(&tm, s->offset);
+    tm.tm_sec = (value >> TOY_MATCH_SEC_SHIFT) & TOY_MATCH_SEC_MASK;
+    tm.tm_min = (value >> TOY_MATCH_MIN_SHIFT) & TOY_MATCH_MIN_MASK;
+    tm.tm_hour = ((value >> TOY_MATCH_HOUR_SHIFT) & TOY_MATCH_HOUR_MASK);
+    tm.tm_mday = ((value >> TOY_MATCH_DAY_SHIFT) & TOY_MATCH_DAY_MASK);
+    tm.tm_mon = ((value >> TOY_MATCH_MON_SHIFT) & TOY_MATCH_MON_MASK) - 1;
+    year_diff = ((value >> TOY_MATCH_YEAR_SHIFT) & TOY_MATCH_YEAR_MASK);
+    year_diff = year_diff - (tm.tm_year & TOY_MATCH_YEAR_MASK);
+    tm.tm_year = tm.tm_year + year_diff;
+    s->save_alarm_offset = qemu_timedate_diff(&tm) - s->offset;
+
+    return 0;
+}
+
+static int ls7a_rtc_post_load(void *opaque, int version_id)
+{
+    LS7A_RTCState *s = LS7A_RTC(opaque);
+    int64_t expire_time;
+
+    expire_time = qemu_clock_get_ms(rtc_clock) + (s->save_alarm_offset * 1000);
+    timer_mod(s->timer, expire_time);
+
+    return 0;
+}
+
+static const VMStateDescription vmstate_ls7a_rtc = {
+    .name = "ls7a_rtc",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .pre_save = ls7a_rtc_pre_save,
+    .post_load = ls7a_rtc_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_INT64(offset, LS7A_RTCState),
+        VMSTATE_INT64(save_alarm_offset, LS7A_RTCState),
+        VMSTATE_UINT32(toymatch[0], LS7A_RTCState),
+        VMSTATE_UINT32(cntrctl, LS7A_RTCState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void ls7a_rtc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    dc->vmsd = &vmstate_ls7a_rtc;
+    dc->realize = ls7a_rtc_realize;
+    dc->desc = "ls7a rtc";
+}
+
+static const TypeInfo ls7a_rtc_info = {
+    .name          = TYPE_LS7A_RTC,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(LS7A_RTCState),
+    .class_init    = ls7a_rtc_class_init,
+};
+
+static void ls7a_rtc_register_types(void)
+{
+    type_register_static(&ls7a_rtc_info);
+}
+
+type_init(ls7a_rtc_register_types)
diff --git a/hw/rtc/meson.build b/hw/rtc/meson.build
index 8fd8d8f9a7..1d4870d8c4 100644
--- a/hw/rtc/meson.build
+++ b/hw/rtc/meson.build
@@ -11,6 +11,7 @@ softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_rtc.c'))
 softmmu_ss.add(when: 'CONFIG_SUN4V_RTC', if_true: files('sun4v-rtc.c'))
 softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_rtc.c'))
 softmmu_ss.add(when: 'CONFIG_GOLDFISH_RTC', if_true: files('goldfish_rtc.c'))
+softmmu_ss.add(when: 'CONFIG_LS7A_RTC', if_true: files('ls7a_rtc.c'))
 softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-rtc.c'))
 
 specific_ss.add(when: 'CONFIG_MC146818RTC', if_true: files('mc146818rtc.c'))
diff --git a/include/hw/pci-host/ls7a.h b/include/hw/pci-host/ls7a.h
index 3b9ad1e175..c724b93b6d 100644
--- a/include/hw/pci-host/ls7a.h
+++ b/include/hw/pci-host/ls7a.h
@@ -39,6 +39,10 @@
 
 #define LS7A_UART_IRQ           (PCH_PIC_IRQ_OFFSET + 2)
 #define LS7A_UART_BASE          0x1fe001e0
+#define LS7A_RTC_IRQ            (PCH_PIC_IRQ_OFFSET + 3)
+#define LS7A_MISC_REG_BASE      (LS7A_PCH_REG_BASE + 0x00080000)
+#define LS7A_RTC_REG_BASE       (LS7A_MISC_REG_BASE + 0x00050100)
+#define LS7A_RTC_LEN            0x100
 
 struct LS7APCIState {
     /*< private >*/
-- 
2.27.0


