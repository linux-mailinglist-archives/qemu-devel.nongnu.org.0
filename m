Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D796331545
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:53:06 +0100 (CET)
Received: from localhost ([::1]:35868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJK41-0003Ee-9O
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:53:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkj-0006Vs-V2
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:11 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:45084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkX-00073O-8T
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:09 -0500
Received: by mail-wr1-x444.google.com with SMTP id e10so12290814wro.12
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hzCBae+gfjSr9Yt0LBdhhwRJqpzRUSj35vuxxJkeMLk=;
 b=UI7K4b3X9mu29j9CXqLNS9k5cYyKh1EOu6xEzJ+5Zt42/ft4oquLrF/khuV5SXpDmk
 Y1b5TFkLn1FnHZhwTBzi9+e3O7GmGqvV1sdlNzn2vRKtUo31khxjZBX/7QlQRYaoIZ4y
 D5iWqr0fuoYBC53zRRAJCfJ9REX9j5sKrVU8+aLZluqzLUaUbNbfq+wCr2MPWOHgaX0y
 9VaynpeH/GaaMgSBkV7up5YkIgpuoT10paMEk6gxQ1XLMUMqLgZnb6yyyBED81hP0oQI
 +r+4hQeutwul+C/cuVt7piY8moFIB6ed11zjEr1cussUOr04oeNSqgNOdV6w0PU5m1x8
 etyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hzCBae+gfjSr9Yt0LBdhhwRJqpzRUSj35vuxxJkeMLk=;
 b=P5vXP7xHZzk1os26HZMyaU7bpOY/f31NL5bKpbhr/aEVveGjtIGVDIQNYelOtMmh44
 o6n+sM9H4jJ2N9sgM2jr1Xku0vZTqol0bQEc2UjuT0K7GHLkOYsIWxuJLtsYV0fyAbff
 cMjd1QyuBaG7yvIyzFLCLIM7GGHhSIpUu5Kt2t8mtSwc9iRXbeD0l8NiIy2A7eDTj/n6
 2tz01I5iq7ZfzANA3KSmAqMP/Y/CXMxPA2fo5udgRqtULuaoAhmbo/dWetA7bB2EBhWR
 bPJ5zLKg4Kad9MQodeH1tNe3GybZ2LU4N3GuLcvWr8GJ23M/wDKSUaqF0pcHCvPqFT08
 Akow==
X-Gm-Message-State: AOAM530RzzsJUEE4qs9MwqSePDPNLJZb73+ofF/mlF5G3zWXVp4sQ33M
 wJULCN8JdLnJH7TZaAdLbHTEBBLjyppYjw==
X-Google-Smtp-Source: ABdhPJyLlmHXGMYWZy8Ilvi9t4geltbuJ22ywTv21vHBfIxb9dGFEPY5NUHjpfyRJNC4ppwbowd7nA==
X-Received: by 2002:adf:ee92:: with SMTP id b18mr22795835wro.275.1615224775887; 
 Mon, 08 Mar 2021 09:32:55 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.32.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:32:55 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/54] hw/timer/sse-timer: Model the SSE Subsystem System Timer
Date: Mon,  8 Mar 2021 17:32:02 +0000
Message-Id: <20210308173244.20710-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The SSE-300 includes some timers which are a different kind to
those in the SSE-200. Model them.

These timers are documented in the SSE-123 Example Subsystem
Technical Reference Manual:
 https://developer.arm.com/documentation/101370/latest/

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210219144617.4782-13-peter.maydell@linaro.org
---
 include/hw/timer/sse-timer.h |  53 ++++
 hw/timer/sse-timer.c         | 470 +++++++++++++++++++++++++++++++++++
 MAINTAINERS                  |   2 +
 hw/arm/Kconfig               |   1 +
 hw/timer/Kconfig             |   3 +
 hw/timer/meson.build         |   1 +
 hw/timer/trace-events        |   5 +
 7 files changed, 535 insertions(+)
 create mode 100644 include/hw/timer/sse-timer.h
 create mode 100644 hw/timer/sse-timer.c

diff --git a/include/hw/timer/sse-timer.h b/include/hw/timer/sse-timer.h
new file mode 100644
index 00000000000..b4ee8e7f6c4
--- /dev/null
+++ b/include/hw/timer/sse-timer.h
@@ -0,0 +1,53 @@
+/*
+ * Arm SSE Subsystem System Timer
+ *
+ * Copyright (c) 2020 Linaro Limited
+ * Written by Peter Maydell
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 or
+ * (at your option) any later version.
+ */
+
+/*
+ * This is a model of the "System timer" which is documented in
+ * the Arm SSE-123 Example Subsystem Technical Reference Manual:
+ * https://developer.arm.com/documentation/101370/latest/
+ *
+ * QEMU interface:
+ *  + QOM property "counter": link property to be set to the
+ *    TYPE_SSE_COUNTER timestamp counter device this timer runs off
+ *  + sysbus MMIO region 0: the register bank
+ *  + sysbus IRQ 0: timer interrupt
+ */
+
+#ifndef SSE_TIMER_H
+#define SSE_TIMER_H
+
+#include "hw/sysbus.h"
+#include "qom/object.h"
+#include "hw/timer/sse-counter.h"
+
+#define TYPE_SSE_TIMER "sse-timer"
+OBJECT_DECLARE_SIMPLE_TYPE(SSETimer, SSE_TIMER)
+
+struct SSETimer {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion iomem;
+    qemu_irq irq;
+    SSECounter *counter;
+    QEMUTimer timer;
+    Notifier counter_notifier;
+
+    uint32_t cntfrq;
+    uint32_t cntp_ctl;
+    uint64_t cntp_cval;
+    uint64_t cntp_aival;
+    uint32_t cntp_aival_ctl;
+    uint32_t cntp_aival_reload;
+};
+
+#endif
diff --git a/hw/timer/sse-timer.c b/hw/timer/sse-timer.c
new file mode 100644
index 00000000000..8dbe6ac651e
--- /dev/null
+++ b/hw/timer/sse-timer.c
@@ -0,0 +1,470 @@
+/*
+ * Arm SSE Subsystem System Timer
+ *
+ * Copyright (c) 2020 Linaro Limited
+ * Written by Peter Maydell
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 or
+ * (at your option) any later version.
+ */
+
+/*
+ * This is a model of the "System timer" which is documented in
+ * the Arm SSE-123 Example Subsystem Technical Reference Manual:
+ * https://developer.arm.com/documentation/101370/latest/
+ *
+ * The timer is based around a simple 64-bit incrementing counter
+ * (readable from CNTPCT_HI/LO). The timer fires when
+ *  Counter - CompareValue >= 0.
+ * The CompareValue is guest-writable, via CNTP_CVAL_HI/LO.
+ * CNTP_TVAL is an alternative view of the CompareValue defined by
+ *  TimerValue = CompareValue[31:0] - Counter[31:0]
+ * which can be both read and written.
+ * This part is similar to the generic timer in an Arm A-class CPU.
+ *
+ * The timer also has a separate auto-increment timer. When this
+ * timer is enabled, then the AutoIncrValue is set to:
+ *  AutoIncrValue = Reload + Counter
+ * and this timer fires when
+ *  Counter - AutoIncrValue >= 0
+ * at which point, an interrupt is generated and the new AutoIncrValue
+ * is calculated.
+ * When the auto-increment timer is enabled, interrupt generation
+ * via the compare/timervalue registers is disabled.
+ */
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/timer.h"
+#include "qapi/error.h"
+#include "trace.h"
+#include "hw/timer/sse-timer.h"
+#include "hw/timer/sse-counter.h"
+#include "hw/sysbus.h"
+#include "hw/irq.h"
+#include "hw/registerfields.h"
+#include "hw/clock.h"
+#include "hw/qdev-clock.h"
+#include "hw/qdev-properties.h"
+#include "migration/vmstate.h"
+
+REG32(CNTPCT_LO, 0x0)
+REG32(CNTPCT_HI, 0x4)
+REG32(CNTFRQ, 0x10)
+REG32(CNTP_CVAL_LO, 0x20)
+REG32(CNTP_CVAL_HI, 0x24)
+REG32(CNTP_TVAL, 0x28)
+REG32(CNTP_CTL, 0x2c)
+    FIELD(CNTP_CTL, ENABLE, 0, 1)
+    FIELD(CNTP_CTL, IMASK, 1, 1)
+    FIELD(CNTP_CTL, ISTATUS, 2, 1)
+REG32(CNTP_AIVAL_LO, 0x40)
+REG32(CNTP_AIVAL_HI, 0x44)
+REG32(CNTP_AIVAL_RELOAD, 0x48)
+REG32(CNTP_AIVAL_CTL, 0x4c)
+    FIELD(CNTP_AIVAL_CTL, EN, 0, 1)
+    FIELD(CNTP_AIVAL_CTL, CLR, 1, 1)
+REG32(CNTP_CFG, 0x50)
+    FIELD(CNTP_CFG, AIVAL, 0, 4)
+#define R_CNTP_CFG_AIVAL_IMPLEMENTED 1
+REG32(PID4, 0xFD0)
+REG32(PID5, 0xFD4)
+REG32(PID6, 0xFD8)
+REG32(PID7, 0xFDC)
+REG32(PID0, 0xFE0)
+REG32(PID1, 0xFE4)
+REG32(PID2, 0xFE8)
+REG32(PID3, 0xFEC)
+REG32(CID0, 0xFF0)
+REG32(CID1, 0xFF4)
+REG32(CID2, 0xFF8)
+REG32(CID3, 0xFFC)
+
+/* PID/CID values */
+static const int timer_id[] = {
+    0x04, 0x00, 0x00, 0x00, /* PID4..PID7 */
+    0xb7, 0xb0, 0x0b, 0x00, /* PID0..PID3 */
+    0x0d, 0xf0, 0x05, 0xb1, /* CID0..CID3 */
+};
+
+static bool sse_is_autoinc(SSETimer *s)
+{
+    return (s->cntp_aival_ctl & R_CNTP_AIVAL_CTL_EN_MASK) != 0;
+}
+
+static bool sse_enabled(SSETimer *s)
+{
+    return (s->cntp_ctl & R_CNTP_CTL_ENABLE_MASK) != 0;
+}
+
+static uint64_t sse_cntpct(SSETimer *s)
+{
+    /* Return the CNTPCT value for the current time */
+    return sse_counter_for_timestamp(s->counter,
+                                     qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
+}
+
+static bool sse_timer_status(SSETimer *s)
+{
+    /*
+     * Return true if timer condition is met. This is used for both
+     * the CNTP_CTL.ISTATUS bit and for whether (unless masked) we
+     * assert our IRQ.
+     * The documentation is unclear about the behaviour of ISTATUS when
+     * in autoincrement mode; we assume that it follows CNTP_AIVAL_CTL.CLR
+     * (ie whether the autoincrement timer is asserting the interrupt).
+     */
+    if (!sse_enabled(s)) {
+        return false;
+    }
+
+    if (sse_is_autoinc(s)) {
+        return s->cntp_aival_ctl & R_CNTP_AIVAL_CTL_CLR_MASK;
+    } else {
+        return sse_cntpct(s) >= s->cntp_cval;
+    }
+}
+
+static void sse_update_irq(SSETimer *s)
+{
+    bool irqstate = (!(s->cntp_ctl & R_CNTP_CTL_IMASK_MASK) &&
+                     sse_timer_status(s));
+
+    qemu_set_irq(s->irq, irqstate);
+}
+
+static void sse_set_timer(SSETimer *s, uint64_t nexttick)
+{
+    /* Set the timer to expire at nexttick */
+    uint64_t expiry = sse_counter_tick_to_time(s->counter, nexttick);
+
+    if (expiry <= INT64_MAX) {
+        timer_mod_ns(&s->timer, expiry);
+    } else {
+        /*
+         * nexttick is so far in the future that it would overflow the
+         * signed 64-bit range of a QEMUTimer. Since timer_mod_ns()
+         * expiry times are absolute, not relative, we are never going
+         * to be able to set the timer to this value, so we must just
+         * assume that guest execution can never run so long that it
+         * reaches the theoretical point when the timer fires.
+         * This is also the code path for "counter is not running",
+         * which is signalled by expiry == UINT64_MAX.
+         */
+        timer_del(&s->timer);
+    }
+}
+
+static void sse_recalc_timer(SSETimer *s)
+{
+    /* Recalculate the normal timer */
+    uint64_t count, nexttick;
+
+    if (sse_is_autoinc(s)) {
+        return;
+    }
+
+    if (!sse_enabled(s)) {
+        timer_del(&s->timer);
+        return;
+    }
+
+    count = sse_cntpct(s);
+
+    if (count >= s->cntp_cval) {
+        /*
+         * Timer condition already met. In theory we have a transition when
+         * the count rolls back over to 0, but that is so far in the future
+         * that it is not representable as a timer_mod() expiry, so in
+         * fact sse_set_timer() will always just delete the timer.
+         */
+        nexttick = UINT64_MAX;
+    } else {
+        /* Next transition is when count hits cval */
+        nexttick = s->cntp_cval;
+    }
+    sse_set_timer(s, nexttick);
+    sse_update_irq(s);
+}
+
+static void sse_autoinc(SSETimer *s)
+{
+    /* Auto-increment the AIVAL, and set the timer accordingly */
+    s->cntp_aival = sse_cntpct(s) + s->cntp_aival_reload;
+    sse_set_timer(s, s->cntp_aival);
+}
+
+static void sse_timer_cb(void *opaque)
+{
+    SSETimer *s = SSE_TIMER(opaque);
+
+    if (sse_is_autoinc(s)) {
+        uint64_t count = sse_cntpct(s);
+
+        if (count >= s->cntp_aival) {
+            /* Timer condition met, set CLR and do another autoinc */
+            s->cntp_aival_ctl |= R_CNTP_AIVAL_CTL_CLR_MASK;
+            s->cntp_aival = count + s->cntp_aival_reload;
+        }
+        sse_set_timer(s, s->cntp_aival);
+        sse_update_irq(s);
+    } else {
+        sse_recalc_timer(s);
+    }
+}
+
+static uint64_t sse_timer_read(void *opaque, hwaddr offset, unsigned size)
+{
+    SSETimer *s = SSE_TIMER(opaque);
+    uint64_t r;
+
+    switch (offset) {
+    case A_CNTPCT_LO:
+        r = extract64(sse_cntpct(s), 0, 32);
+        break;
+    case A_CNTPCT_HI:
+        r = extract64(sse_cntpct(s), 32, 32);
+        break;
+    case A_CNTFRQ:
+        r = s->cntfrq;
+        break;
+    case A_CNTP_CVAL_LO:
+        r = extract64(s->cntp_cval, 0, 32);
+        break;
+    case A_CNTP_CVAL_HI:
+        r = extract64(s->cntp_cval, 32, 32);
+        break;
+    case A_CNTP_TVAL:
+        r = extract64(s->cntp_cval - sse_cntpct(s), 0, 32);
+        break;
+    case A_CNTP_CTL:
+        r = s->cntp_ctl;
+        if (sse_timer_status(s)) {
+            r |= R_CNTP_CTL_ISTATUS_MASK;
+        }
+        break;
+    case A_CNTP_AIVAL_LO:
+        r = extract64(s->cntp_aival, 0, 32);
+        break;
+    case A_CNTP_AIVAL_HI:
+        r = extract64(s->cntp_aival, 32, 32);
+        break;
+    case A_CNTP_AIVAL_RELOAD:
+        r = s->cntp_aival_reload;
+        break;
+    case A_CNTP_AIVAL_CTL:
+        /*
+         * All the bits of AIVAL_CTL are documented as WO, but this is probably
+         * a documentation error. We implement them as readable.
+         */
+        r = s->cntp_aival_ctl;
+        break;
+    case A_CNTP_CFG:
+        r = R_CNTP_CFG_AIVAL_IMPLEMENTED << R_CNTP_CFG_AIVAL_SHIFT;
+        break;
+    case A_PID4 ... A_CID3:
+        r = timer_id[(offset - A_PID4) / 4];
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "SSE System Timer read: bad offset 0x%x",
+                      (unsigned) offset);
+        r = 0;
+        break;
+    }
+
+    trace_sse_timer_read(offset, r, size);
+    return r;
+}
+
+static void sse_timer_write(void *opaque, hwaddr offset, uint64_t value,
+                            unsigned size)
+{
+    SSETimer *s = SSE_TIMER(opaque);
+
+    trace_sse_timer_write(offset, value, size);
+
+    switch (offset) {
+    case A_CNTFRQ:
+        s->cntfrq = value;
+        break;
+    case A_CNTP_CVAL_LO:
+        s->cntp_cval = deposit64(s->cntp_cval, 0, 32, value);
+        sse_recalc_timer(s);
+        break;
+    case A_CNTP_CVAL_HI:
+        s->cntp_cval = deposit64(s->cntp_cval, 32, 32, value);
+        sse_recalc_timer(s);
+        break;
+    case A_CNTP_TVAL:
+        s->cntp_cval = sse_cntpct(s) + sextract64(value, 0, 32);
+        sse_recalc_timer(s);
+        break;
+    case A_CNTP_CTL:
+    {
+        uint32_t old_ctl = s->cntp_ctl;
+        value &= R_CNTP_CTL_ENABLE_MASK | R_CNTP_CTL_IMASK_MASK;
+        s->cntp_ctl = value;
+        if ((old_ctl ^ s->cntp_ctl) & R_CNTP_CTL_ENABLE_MASK) {
+            if (sse_enabled(s)) {
+                if (sse_is_autoinc(s)) {
+                    sse_autoinc(s);
+                } else {
+                    sse_recalc_timer(s);
+                }
+            }
+        }
+        sse_update_irq(s);
+        break;
+    }
+    case A_CNTP_AIVAL_RELOAD:
+        s->cntp_aival_reload = value;
+        break;
+    case A_CNTP_AIVAL_CTL:
+    {
+        uint32_t old_ctl = s->cntp_aival_ctl;
+
+        /* EN bit is writeable; CLR bit is write-0-to-clear, write-1-ignored */
+        s->cntp_aival_ctl &= ~R_CNTP_AIVAL_CTL_EN_MASK;
+        s->cntp_aival_ctl |= value & R_CNTP_AIVAL_CTL_EN_MASK;
+        if (!(value & R_CNTP_AIVAL_CTL_CLR_MASK)) {
+            s->cntp_aival_ctl &= ~R_CNTP_AIVAL_CTL_CLR_MASK;
+        }
+        if ((old_ctl ^ s->cntp_aival_ctl) & R_CNTP_AIVAL_CTL_EN_MASK) {
+            /* Auto-increment toggled on/off */
+            if (sse_enabled(s)) {
+                if (sse_is_autoinc(s)) {
+                    sse_autoinc(s);
+                } else {
+                    sse_recalc_timer(s);
+                }
+            }
+        }
+        sse_update_irq(s);
+        break;
+    }
+    case A_CNTPCT_LO:
+    case A_CNTPCT_HI:
+    case A_CNTP_CFG:
+    case A_CNTP_AIVAL_LO:
+    case A_CNTP_AIVAL_HI:
+    case A_PID4 ... A_CID3:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "SSE System Timer write: write to RO offset 0x%x\n",
+                      (unsigned)offset);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "SSE System Timer write: bad offset 0x%x\n",
+                      (unsigned)offset);
+        break;
+    }
+}
+
+static const MemoryRegionOps sse_timer_ops = {
+    .read = sse_timer_read,
+    .write = sse_timer_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
+};
+
+static void sse_timer_reset(DeviceState *dev)
+{
+    SSETimer *s = SSE_TIMER(dev);
+
+    trace_sse_timer_reset();
+
+    timer_del(&s->timer);
+    s->cntfrq = 0;
+    s->cntp_ctl = 0;
+    s->cntp_cval = 0;
+    s->cntp_aival = 0;
+    s->cntp_aival_ctl = 0;
+    s->cntp_aival_reload = 0;
+}
+
+static void sse_timer_counter_callback(Notifier *notifier, void *data)
+{
+    SSETimer *s = container_of(notifier, SSETimer, counter_notifier);
+
+    /* System counter told us we need to recalculate */
+    if (sse_enabled(s)) {
+        if (sse_is_autoinc(s)) {
+            sse_set_timer(s, s->cntp_aival);
+        } else {
+            sse_recalc_timer(s);
+        }
+    }
+}
+
+static void sse_timer_init(Object *obj)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    SSETimer *s = SSE_TIMER(obj);
+
+    memory_region_init_io(&s->iomem, obj, &sse_timer_ops,
+                          s, "sse-timer", 0x1000);
+    sysbus_init_mmio(sbd, &s->iomem);
+    sysbus_init_irq(sbd, &s->irq);
+}
+
+static void sse_timer_realize(DeviceState *dev, Error **errp)
+{
+    SSETimer *s = SSE_TIMER(dev);
+
+    if (!s->counter) {
+        error_setg(errp, "counter property was not set");
+    }
+
+    s->counter_notifier.notify = sse_timer_counter_callback;
+    sse_counter_register_consumer(s->counter, &s->counter_notifier);
+
+    timer_init_ns(&s->timer, QEMU_CLOCK_VIRTUAL, sse_timer_cb, s);
+}
+
+static const VMStateDescription sse_timer_vmstate = {
+    .name = "sse-timer",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_TIMER(timer, SSETimer),
+        VMSTATE_UINT32(cntfrq, SSETimer),
+        VMSTATE_UINT32(cntp_ctl, SSETimer),
+        VMSTATE_UINT64(cntp_cval, SSETimer),
+        VMSTATE_UINT64(cntp_aival, SSETimer),
+        VMSTATE_UINT32(cntp_aival_ctl, SSETimer),
+        VMSTATE_UINT32(cntp_aival_reload, SSETimer),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static Property sse_timer_properties[] = {
+    DEFINE_PROP_LINK("counter", SSETimer, counter, TYPE_SSE_COUNTER, SSECounter *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void sse_timer_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = sse_timer_realize;
+    dc->vmsd = &sse_timer_vmstate;
+    dc->reset = sse_timer_reset;
+    device_class_set_props(dc, sse_timer_properties);
+}
+
+static const TypeInfo sse_timer_info = {
+    .name = TYPE_SSE_TIMER,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(SSETimer),
+    .instance_init = sse_timer_init,
+    .class_init = sse_timer_class_init,
+};
+
+static void sse_timer_register_types(void)
+{
+    type_register_static(&sse_timer_info);
+}
+
+type_init(sse_timer_register_types);
diff --git a/MAINTAINERS b/MAINTAINERS
index 68c37957cfe..ea206fc900e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -753,6 +753,8 @@ F: hw/misc/armsse-mhu.c
 F: include/hw/misc/armsse-mhu.h
 F: hw/timer/sse-counter.c
 F: include/hw/timer/sse-counter.h
+F: hw/timer/sse-timer.c
+F: include/hw/timer/sse-timer.h
 F: docs/system/arm/mps2.rst
 
 Musca
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index a23992a47c8..5b3bd1e866b 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -521,6 +521,7 @@ config ARMSSE
     select TZ_PPC
     select UNIMP
     select SSE_COUNTER
+    select SSE_TIMER
 
 config ARMSSE_CPUID
     bool
diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
index e103c8872ab..726be4f82ca 100644
--- a/hw/timer/Kconfig
+++ b/hw/timer/Kconfig
@@ -45,5 +45,8 @@ config RENESAS_CMT
 config SSE_COUNTER
     bool
 
+config SSE_TIMER
+    bool
+
 config AVR_TIMER16
     bool
diff --git a/hw/timer/meson.build b/hw/timer/meson.build
index 79a3012349d..91ab2aa803f 100644
--- a/hw/timer/meson.build
+++ b/hw/timer/meson.build
@@ -33,6 +33,7 @@ softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_systmr.c'))
 softmmu_ss.add(when: 'CONFIG_SH4', if_true: files('sh_timer.c'))
 softmmu_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_timer.c'))
 softmmu_ss.add(when: 'CONFIG_SSE_COUNTER', if_true: files('sse-counter.c'))
+softmmu_ss.add(when: 'CONFIG_SSE_TIMER', if_true: files('sse-timer.c'))
 softmmu_ss.add(when: 'CONFIG_STM32F2XX_TIMER', if_true: files('stm32f2xx_timer.c'))
 softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_timer.c'))
 
diff --git a/hw/timer/trace-events b/hw/timer/trace-events
index bb9c1000878..f8b9db25c27 100644
--- a/hw/timer/trace-events
+++ b/hw/timer/trace-events
@@ -100,3 +100,8 @@ sse_counter_control_write(uint64_t offset, uint64_t data, unsigned size) "SSE sy
 sse_counter_status_read(uint64_t offset, uint64_t data, unsigned size) "SSE system counter status frame read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 sse_counter_status_write(uint64_t offset, uint64_t data, unsigned size) "SSE system counter status frame write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 sse_counter_reset(void) "SSE system counter: reset"
+
+# sse_timer.c
+sse_timer_read(uint64_t offset, uint64_t data, unsigned size) "SSE system timer read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
+sse_timer_write(uint64_t offset, uint64_t data, unsigned size) "SSE system timer write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
+sse_timer_reset(void) "SSE system timer: reset"
-- 
2.20.1


