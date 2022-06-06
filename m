Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0454853F296
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 01:34:24 +0200 (CEST)
Received: from localhost ([::1]:33520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyMEo-0000rd-RU
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 19:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwZ-0001lp-M3
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:33 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:40553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwX-000461-8R
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:31 -0400
Received: by mail-pf1-x42e.google.com with SMTP id z17so13930314pff.7
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 16:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k0pLwGusBrKjqO/6DrmJdpaXZTOpSw1Vf6Vrqn3KTig=;
 b=cSInBwzpt4wZaC4m/RswTMFG19kT68ud7l+gqicegXf5EPdvrwODdvgVLkr09IL0dL
 fYvanu0z+XIJR8klBSUFneocI0In/EiElUm9BAoKoscoKsVpicOwynwGImghiFGkrXZ3
 rS6zwVWvuxaCWIqCQrn8IMieex44bnG65wJkK5atLvY/2YIFG1yJySFBNyGdkFtyjSxz
 qVnRs6emGRvggsVUh63Uux/oH4FX2eIapUBiP+la39lVfP/YeQYtGa51tBhr6giveJ3V
 XE8bR0DQUXoqQkre2uitsenMKhus5TxpwtCxntGBBR4/0MqJD2NuG6ZVekmZ3YWZnG43
 Gv0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k0pLwGusBrKjqO/6DrmJdpaXZTOpSw1Vf6Vrqn3KTig=;
 b=R34stk3QFD6bEtBM9TedDzaNSyRgQkMg3qN10CEkfVI8ze7wognRsGgvOkNUCijB4M
 gYV0kwydDBT42JxpLB8umH8gDbowdZiGEVWxjG1iwPSAvxdy3KBSL7eoPgsw0EQqay3V
 2Yjsz2VT+GjHaNqEG7e1zEidmoJTrUq4JVStpk+QzxIrAX+j7OImFiCFCV7ibUMWpWfo
 eqoi8QMVuKeVnRorU3RUfBfCuNqFqQc7UkPo930LrHVNAvJ8MtyorbUuL80AWMbEBlUz
 gSY4wTohi3wN2vERhyqpKqOoh0SlFeZBLB5DB9JaUAmoszzb6YGk42dc5uvFO1zmHYwB
 NyrA==
X-Gm-Message-State: AOAM531mFiAzM/KhkCx+Ok2L6wrCnt9XKcJOqPqbk7+1/u6IFVHTZHxo
 GKH52R5onfVtYP74wd/Wy28dkr9lC2Skag==
X-Google-Smtp-Source: ABdhPJx41Rf448WnS1oSGtaZS4/XE84CmQWT1B44HoocRhWGKUr2HgzmncA0dd9QxGAnVmC2KucpVg==
X-Received: by 2002:a63:1209:0:b0:3fc:e453:5424 with SMTP id
 h9-20020a631209000000b003fce4535424mr21384801pgl.131.1654557327791; 
 Mon, 06 Jun 2022 16:15:27 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170902c24200b00162523fdb8fsm10954623plg.252.2022.06.06.16.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 16:15:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 Song Gao <gaosong@loongson.cn>
Subject: [PULL 38/43] hw/loongarch: Add LoongArch ls7a rtc device support
Date: Mon,  6 Jun 2022 16:14:45 -0700
Message-Id: <20220606231450.448443-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606231450.448443-1-richard.henderson@linaro.org>
References: <20220606231450.448443-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

This patch add ls7a rtc device support.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220606124333.2060567-39-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/pci-host/ls7a.h |   4 +
 hw/loongarch/loongson3.c   |   3 +
 hw/rtc/ls7a_rtc.c          | 528 +++++++++++++++++++++++++++++++++++++
 MAINTAINERS                |   1 +
 hw/loongarch/Kconfig       |   1 +
 hw/rtc/Kconfig             |   3 +
 hw/rtc/meson.build         |   1 +
 7 files changed, 541 insertions(+)
 create mode 100644 hw/rtc/ls7a_rtc.c

diff --git a/include/hw/pci-host/ls7a.h b/include/hw/pci-host/ls7a.h
index 5c653527f0..08c5f78be2 100644
--- a/include/hw/pci-host/ls7a.h
+++ b/include/hw/pci-host/ls7a.h
@@ -37,4 +37,8 @@
 #define LS7A_PCI_IRQS           48
 #define LS7A_UART_IRQ           (PCH_PIC_IRQ_OFFSET + 2)
 #define LS7A_UART_BASE          0x1fe001e0
+#define LS7A_RTC_IRQ            (PCH_PIC_IRQ_OFFSET + 3)
+#define LS7A_MISC_REG_BASE      (LS7A_PCH_REG_BASE + 0x00080000)
+#define LS7A_RTC_REG_BASE       (LS7A_MISC_REG_BASE + 0x00050100)
+#define LS7A_RTC_LEN            0x100
 #endif
diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index 7bc17113dc..95984c9086 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -97,6 +97,9 @@ static void loongarch_devices_init(DeviceState *pch_pic)
      * Create some unimplemented devices to emulate this.
      */
     create_unimplemented_device("pci-dma-cfg", 0x1001041c, 0x4);
+    sysbus_create_simple("ls7a_rtc", LS7A_RTC_REG_BASE,
+                         qdev_get_gpio_in(pch_pic,
+                         LS7A_RTC_IRQ - PCH_PIC_IRQ_OFFSET));
 }
 
 static void loongarch_irq_init(LoongArchMachineState *lams)
diff --git a/hw/rtc/ls7a_rtc.c b/hw/rtc/ls7a_rtc.c
new file mode 100644
index 0000000000..fe6710310f
--- /dev/null
+++ b/hw/rtc/ls7a_rtc.c
@@ -0,0 +1,528 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Loongarch LS7A Real Time Clock emulation
+ *
+ * Copyright (C) 2021 Loongson Technology Corporation Limited
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "hw/irq.h"
+#include "include/hw/register.h"
+#include "qemu/timer.h"
+#include "sysemu/sysemu.h"
+#include "qemu/cutils.h"
+#include "qemu/log.h"
+#include "migration/vmstate.h"
+#include "hw/misc/unimp.h"
+#include "sysemu/rtc.h"
+#include "hw/registerfields.h"
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
+#define LS7A_RTC_FREQ     32768
+#define TIMER_NUMS        3
+/*
+ * Shift bits and filed mask
+ */
+
+FIELD(TOY, MON, 26, 6)
+FIELD(TOY, DAY, 21, 5)
+FIELD(TOY, HOUR, 16, 5)
+FIELD(TOY, MIN, 10, 6)
+FIELD(TOY, SEC, 4, 6)
+FIELD(TOY, MSEC, 0, 4)
+
+FIELD(TOY_MATCH, YEAR, 26, 6)
+FIELD(TOY_MATCH, MON, 22, 4)
+FIELD(TOY_MATCH, DAY, 17, 5)
+FIELD(TOY_MATCH, HOUR, 12, 5)
+FIELD(TOY_MATCH, MIN, 6, 6)
+FIELD(TOY_MATCH, SEC, 0, 6)
+
+FIELD(RTC_CTRL, RTCEN, 13, 1)
+FIELD(RTC_CTRL, TOYEN, 11, 1)
+FIELD(RTC_CTRL, EO, 8, 1)
+
+#define TYPE_LS7A_RTC "ls7a_rtc"
+OBJECT_DECLARE_SIMPLE_TYPE(LS7ARtcState, LS7A_RTC)
+
+struct LS7ARtcState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion iomem;
+    /*
+     * Needed to preserve the tick_count across migration, even if the
+     * absolute value of the rtc_clock is different on the source and
+     * destination.
+     */
+    int64_t offset_toy;
+    int64_t offset_rtc;
+    uint64_t save_toy_mon;
+    uint64_t save_toy_year;
+    uint64_t save_rtc;
+    int64_t data;
+    int tidx;
+    uint32_t toymatch[3];
+    uint32_t toytrim;
+    uint32_t cntrctl;
+    uint32_t rtctrim;
+    uint32_t rtccount;
+    uint32_t rtcmatch[3];
+    QEMUTimer *toy_timer[TIMER_NUMS];
+    QEMUTimer *rtc_timer[TIMER_NUMS];
+    qemu_irq irq;
+};
+
+/* switch nanoseconds time to rtc ticks */
+static inline uint64_t ls7a_rtc_ticks(void)
+{
+    return qemu_clock_get_ns(rtc_clock) * LS7A_RTC_FREQ / NANOSECONDS_PER_SECOND;
+}
+
+/* switch rtc ticks to nanoseconds */
+static inline uint64_t ticks_to_ns(uint64_t ticks)
+{
+    return ticks * NANOSECONDS_PER_SECOND / LS7A_RTC_FREQ;
+}
+
+static inline bool toy_enabled(LS7ARtcState *s)
+{
+    return FIELD_EX32(s->cntrctl, RTC_CTRL, TOYEN) &&
+           FIELD_EX32(s->cntrctl, RTC_CTRL, EO);
+}
+
+static inline bool rtc_enabled(LS7ARtcState *s)
+{
+    return FIELD_EX32(s->cntrctl, RTC_CTRL, RTCEN) &&
+           FIELD_EX32(s->cntrctl, RTC_CTRL, EO);
+}
+
+/* parse toy value to struct tm */
+static inline void toy_val_to_time_mon(uint64_t toy_val, struct tm *tm)
+{
+    tm->tm_sec = FIELD_EX32(toy_val, TOY, SEC);
+    tm->tm_min = FIELD_EX32(toy_val, TOY, MIN);
+    tm->tm_hour = FIELD_EX32(toy_val, TOY, HOUR);
+    tm->tm_mday = FIELD_EX32(toy_val, TOY, DAY);
+    tm->tm_mon = FIELD_EX32(toy_val, TOY, MON) - 1;
+}
+
+static inline void toy_val_to_time_year(uint64_t toy_year, struct tm *tm)
+{
+    tm->tm_year = toy_year;
+}
+
+/* parse struct tm to toy value */
+static inline uint64_t toy_time_to_val_mon(struct tm tm)
+{
+    uint64_t val = 0;
+
+    val = FIELD_DP32(val, TOY, MON, tm.tm_mon + 1);
+    val = FIELD_DP32(val, TOY, DAY, tm.tm_mday);
+    val = FIELD_DP32(val, TOY, HOUR, tm.tm_hour);
+    val = FIELD_DP32(val, TOY, MIN, tm.tm_min);
+    val = FIELD_DP32(val, TOY, SEC, tm.tm_sec);
+    return val;
+}
+
+static inline uint64_t toy_time_to_val_year(struct tm tm)
+{
+    uint64_t year;
+
+    year = tm.tm_year;
+    return year;
+}
+
+static inline void toymatch_val_to_time(uint64_t val, struct tm *tm)
+{
+    tm->tm_sec = FIELD_EX32(val, TOY_MATCH, SEC);
+    tm->tm_min = FIELD_EX32(val, TOY_MATCH, MIN);
+    tm->tm_hour = FIELD_EX32(val, TOY_MATCH, HOUR);
+    tm->tm_mday = FIELD_EX32(val, TOY_MATCH, DAY);
+    tm->tm_mon = FIELD_EX32(val, TOY_MATCH, MON) - 1;
+    tm->tm_year += (FIELD_EX32(val, TOY_MATCH, YEAR) - (tm->tm_year & 0x3f));
+}
+
+static void toymatch_write(LS7ARtcState *s, struct tm *tm, uint64_t val, int num)
+{
+    int64_t now, expire_time;
+
+    /* it do not support write when toy disabled */
+    if (toy_enabled(s)) {
+        s->toymatch[num] = val;
+        /* caculate expire time */
+        now = qemu_clock_get_ms(rtc_clock);
+        toymatch_val_to_time(val, tm);
+        expire_time = now + (qemu_timedate_diff(tm) - s->offset_toy) * 1000;
+        timer_mod(s->toy_timer[num], expire_time);
+    }
+}
+
+static void rtcmatch_write(LS7ARtcState *s, uint64_t val, int num)
+{
+    uint64_t expire_ns;
+
+    /* it do not support write when toy disabled */
+    if (rtc_enabled(s)) {
+        s->rtcmatch[num] = val;
+        /* caculate expire time */
+        expire_ns = ticks_to_ns(val) - ticks_to_ns(s->offset_rtc);
+        timer_mod_ns(s->rtc_timer[num], expire_ns);
+    }
+}
+
+static void ls7a_toy_stop(LS7ARtcState *s)
+{
+    int i;
+    struct tm tm;
+    /*
+     * save time when disabled toy,
+     * because toy time not add counters.
+     */
+    qemu_get_timedate(&tm, s->offset_toy);
+    s->save_toy_mon = toy_time_to_val_mon(tm);
+    s->save_toy_year = toy_time_to_val_year(tm);
+
+    /* delete timers, and when re-enabled, recaculate expire time */
+    for (i = 0; i < TIMER_NUMS; i++) {
+        timer_del(s->toy_timer[i]);
+    }
+}
+
+static void ls7a_rtc_stop(LS7ARtcState *s)
+{
+    int i;
+    uint64_t time;
+
+    /* save rtc time */
+    time = ls7a_rtc_ticks() + s->offset_rtc;
+    s->save_rtc = time;
+
+    /* delete timers, and when re-enabled, recaculate expire time */
+    for (i = 0; i < TIMER_NUMS; i++) {
+        timer_del(s->rtc_timer[i]);
+    }
+}
+
+static void ls7a_toy_start(LS7ARtcState *s)
+{
+    int i;
+    uint64_t expire_time, now;
+    struct tm tm;
+    /*
+     * need to recaculate toy offset
+     * and expire time when enable it.
+     */
+    toy_val_to_time_mon(s->save_toy_mon, &tm);
+    toy_val_to_time_year(s->save_toy_year, &tm);
+
+    s->offset_toy = qemu_timedate_diff(&tm);
+    now = qemu_clock_get_ms(rtc_clock);
+
+    /* recaculate expire time and enable timer */
+    for (i = 0; i < TIMER_NUMS; i++) {
+        toymatch_val_to_time(s->toymatch[i], &tm);
+        expire_time = now + (qemu_timedate_diff(&tm) - s->offset_toy) * 1000;
+        timer_mod(s->toy_timer[i], expire_time);
+    }
+}
+
+static void ls7a_rtc_start(LS7ARtcState *s)
+{
+    int i;
+    uint64_t expire_time, now;
+
+    /*
+     * need to recaculate rtc offset
+     * and expire time when enable it.
+     */
+    now = ls7a_rtc_ticks();
+    s->offset_rtc = s->save_rtc - now;
+
+    /* recaculate expire time and enable timer */
+    for (i = 0; i < TIMER_NUMS; i++) {
+        expire_time = ticks_to_ns(s->rtcmatch[i]) - ticks_to_ns(s->offset_rtc);
+        timer_mod_ns(s->rtc_timer[i], expire_time);
+    }
+}
+
+static uint64_t ls7a_rtc_read(void *opaque, hwaddr addr, unsigned size)
+{
+    LS7ARtcState *s = LS7A_RTC(opaque);
+    struct tm tm;
+    int val = 0;
+
+    switch (addr) {
+    case SYS_TOYREAD0:
+        /* if toy disabled, read save toy time */
+        if (toy_enabled(s)) {
+            qemu_get_timedate(&tm, s->offset_toy);
+            val = toy_time_to_val_mon(tm);
+        } else {
+            /* read save mon val */
+            val = s->save_toy_mon;
+        }
+        break;
+    case SYS_TOYREAD1:
+        /* if toy disabled, read save toy time */
+        if (toy_enabled(s)) {
+            qemu_get_timedate(&tm, s->offset_toy);
+            val = tm.tm_year;
+        } else {
+            /* read save year val */
+            val = s->save_toy_year;
+        }
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
+        /* if rtc disabled, read save rtc time */
+        if (rtc_enabled(s)) {
+            val = ls7a_rtc_ticks() + s->offset_rtc;
+        } else {
+            val = s->save_rtc;
+        }
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
+    int old_toyen, old_rtcen, new_toyen, new_rtcen;
+    LS7ARtcState *s = LS7A_RTC(opaque);
+    struct tm tm;
+
+    switch (addr) {
+    case SYS_TOYWRITE0:
+        /* it do not support write when toy disabled */
+        if (toy_enabled(s)) {
+            qemu_get_timedate(&tm, s->offset_toy);
+            tm.tm_sec = FIELD_EX32(val, TOY, SEC);
+            tm.tm_min = FIELD_EX32(val, TOY, MIN);
+            tm.tm_hour = FIELD_EX32(val, TOY, HOUR);
+            tm.tm_mday = FIELD_EX32(val, TOY, DAY);
+            tm.tm_mon = FIELD_EX32(val, TOY, MON) - 1;
+            s->offset_toy = qemu_timedate_diff(&tm);
+        }
+    break;
+    case SYS_TOYWRITE1:
+        if (toy_enabled(s)) {
+            qemu_get_timedate(&tm, s->offset_toy);
+            tm.tm_year = val;
+            s->offset_toy = qemu_timedate_diff(&tm);
+        }
+        break;
+    case SYS_TOYMATCH0:
+        toymatch_write(s, &tm, val, 0);
+        break;
+    case SYS_TOYMATCH1:
+        toymatch_write(s, &tm, val, 1);
+        break;
+    case SYS_TOYMATCH2:
+        toymatch_write(s, &tm, val, 2);
+        break;
+    case SYS_RTCCTRL:
+        /* get old ctrl */
+        old_toyen = toy_enabled(s);
+        old_rtcen = rtc_enabled(s);
+
+        s->cntrctl = val;
+        /* get new ctrl */
+        new_toyen = toy_enabled(s);
+        new_rtcen = rtc_enabled(s);
+
+        /*
+         * we do not consider if EO changed, as it always set at most time.
+         * toy or rtc enabled should start timer. otherwise, stop timer
+         */
+        if (old_toyen != new_toyen) {
+            if (new_toyen) {
+                ls7a_toy_start(s);
+            } else {
+                ls7a_toy_stop(s);
+            }
+        }
+        if (old_rtcen != new_rtcen) {
+            if (new_rtcen) {
+                ls7a_rtc_start(s);
+            } else {
+                ls7a_rtc_stop(s);
+            }
+        }
+        break;
+    case SYS_RTCWRTIE0:
+        if (rtc_enabled(s)) {
+            s->offset_rtc = val - ls7a_rtc_ticks();
+        }
+        break;
+    case SYS_RTCMATCH0:
+        rtcmatch_write(s, val, 0);
+        break;
+    case SYS_RTCMATCH1:
+        rtcmatch_write(s, val, 1);
+        break;
+    case SYS_RTCMATCH2:
+        rtcmatch_write(s, val, 2);
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
+};
+
+static void toy_timer_cb(void *opaque)
+{
+    LS7ARtcState *s = opaque;
+
+    if (toy_enabled(s)) {
+        qemu_irq_pulse(s->irq);
+    }
+}
+
+static void rtc_timer_cb(void *opaque)
+{
+    LS7ARtcState *s = opaque;
+
+    if (rtc_enabled(s)) {
+        qemu_irq_pulse(s->irq);
+    }
+}
+
+static void ls7a_rtc_realize(DeviceState *dev, Error **errp)
+{
+    int i;
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    LS7ARtcState *d = LS7A_RTC(sbd);
+    memory_region_init_io(&d->iomem, NULL, &ls7a_rtc_ops,
+                         (void *)d, "ls7a_rtc", 0x100);
+
+    sysbus_init_irq(sbd, &d->irq);
+
+    sysbus_init_mmio(sbd, &d->iomem);
+    for (i = 0; i < TIMER_NUMS; i++) {
+        d->toymatch[i] = 0;
+        d->rtcmatch[i] = 0;
+        d->toy_timer[i] = timer_new_ms(rtc_clock, toy_timer_cb, d);
+        d->rtc_timer[i] = timer_new_ms(rtc_clock, rtc_timer_cb, d);
+    }
+    d->offset_toy = 0;
+    d->offset_rtc = 0;
+    d->save_toy_mon = 0;
+    d->save_toy_year = 0;
+    d->save_rtc = 0;
+
+    create_unimplemented_device("mmio fallback 1", 0x10013ffc, 0x4);
+}
+
+static int ls7a_rtc_pre_save(void *opaque)
+{
+    LS7ARtcState *s = LS7A_RTC(opaque);
+
+    ls7a_toy_stop(s);
+    ls7a_rtc_stop(s);
+
+    return 0;
+}
+
+static int ls7a_rtc_post_load(void *opaque, int version_id)
+{
+    LS7ARtcState *s = LS7A_RTC(opaque);
+    if (toy_enabled(s)) {
+        ls7a_toy_start(s);
+    }
+
+    if (rtc_enabled(s)) {
+        ls7a_rtc_start(s);
+    }
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
+        VMSTATE_INT64(offset_toy, LS7ARtcState),
+        VMSTATE_INT64(offset_rtc, LS7ARtcState),
+        VMSTATE_UINT64(save_toy_mon, LS7ARtcState),
+        VMSTATE_UINT64(save_toy_year, LS7ARtcState),
+        VMSTATE_UINT64(save_rtc, LS7ARtcState),
+        VMSTATE_UINT32_ARRAY(toymatch, LS7ARtcState, TIMER_NUMS),
+        VMSTATE_UINT32_ARRAY(rtcmatch, LS7ARtcState, TIMER_NUMS),
+        VMSTATE_UINT32(cntrctl, LS7ARtcState),
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
+    .instance_size = sizeof(LS7ARtcState),
+    .class_init    = ls7a_rtc_class_init,
+};
+
+static void ls7a_rtc_register_types(void)
+{
+    type_register_static(&ls7a_rtc_info);
+}
+
+type_init(ls7a_rtc_register_types)
diff --git a/MAINTAINERS b/MAINTAINERS
index 3ce5674da5..e8938db694 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1136,6 +1136,7 @@ F: include/hw/loongarch/virt.h
 F: include/hw/intc/loongarch_*.h
 F: hw/intc/loongarch_*.c
 F: include/hw/pci-host/ls7a.h
+F: hw/rtc/ls7a_rtc.c
 
 M68K Machines
 -------------
diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
index 8552ff4bee..35b6680772 100644
--- a/hw/loongarch/Kconfig
+++ b/hw/loongarch/Kconfig
@@ -13,3 +13,4 @@ config LOONGARCH_VIRT
     select LOONGARCH_PCH_PIC
     select LOONGARCH_PCH_MSI
     select LOONGARCH_EXTIOI
+    select LS7A_RTC
diff --git a/hw/rtc/Kconfig b/hw/rtc/Kconfig
index 730c272bc5..d0d8dda084 100644
--- a/hw/rtc/Kconfig
+++ b/hw/rtc/Kconfig
@@ -27,3 +27,6 @@ config SUN4V_RTC
 
 config GOLDFISH_RTC
     bool
+
+config LS7A_RTC
+    bool
diff --git a/hw/rtc/meson.build b/hw/rtc/meson.build
index 7cecdee5dd..dc33973384 100644
--- a/hw/rtc/meson.build
+++ b/hw/rtc/meson.build
@@ -11,6 +11,7 @@ softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_rtc.c'))
 softmmu_ss.add(when: 'CONFIG_SUN4V_RTC', if_true: files('sun4v-rtc.c'))
 softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_rtc.c'))
 softmmu_ss.add(when: 'CONFIG_GOLDFISH_RTC', if_true: files('goldfish_rtc.c'))
+softmmu_ss.add(when: 'CONFIG_LS7A_RTC', if_true: files('ls7a_rtc.c'))
 softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-rtc.c'))
 
 specific_ss.add(when: 'CONFIG_MC146818RTC', if_true: files('mc146818rtc.c'))
-- 
2.34.1


