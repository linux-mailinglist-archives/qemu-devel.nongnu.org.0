Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F688331572
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:04:59 +0100 (CET)
Received: from localhost ([::1]:39326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJKFW-00082H-Fw
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:04:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkj-0006VT-RX
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:11 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:39868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkW-00072i-FA
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:08 -0500
Received: by mail-wm1-x341.google.com with SMTP id
 124-20020a1c00820000b029010b871409cfso4290733wma.4
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cQkY8QTpzyInpCrjGpdaAsuGDlO7ayn66i4iSF8MNPU=;
 b=H6ddp1YCgbYn+oBxEgoQFO4EY5ujEQD+1vRY5wmtxUzchAnvz5/c5BZDw+3plyu2II
 ll8pfIoWaZBZZPIxmVUOS+vAjXuWMc9q3dZPAc3mLgKCn90lxLAhMP0K+xr+fbWmYOil
 yesAnrqXY4ZJuPiUvzumlUJTdHpVv2jxHG3dq0pJL2BehcWQ/4Q+NXD9H5Wg+Cbl3YZ3
 jrCYr8TVYPokVOyjvP0JG+BDRAzAaeWOAFm4UqF8EPXWB1k0S1jEYOxfXINWjTsqyv4Y
 SmCqQwuUIZMOtQc0kSvKmq6N4egdDR+7BlfQzqowsiosrPtgeaXjaEzL7eefgvWVIm93
 dV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cQkY8QTpzyInpCrjGpdaAsuGDlO7ayn66i4iSF8MNPU=;
 b=UV8M66rEnR+cZ3pwKI2r5yI0iWJG/Ey2S0m3VS+VJ6InsewLd0ivrBIUvRoDwLseSZ
 IflBWuG/baqnT6tEUEIQKRmt5N9nUrk/WWsPIz3oU9RQVgYIT+QWH4WzeVKQprcL+IqM
 MRIKTLmaHo/ZdD3CNOCheuMargQ9InXRtj6j3DlX7WtR8Vb2+WHlwKNXv5s7TibHmn19
 v8AL9WB1ic0lfdkxY2Bw7Bp98gpa71LYqZyw0ED6sEnfjhCffL1PNwC+6b90WVE9mDxY
 rgqqZfy4z9b0F3emzKDDWn4ZRsJu8yz3GZMQ4fB25bShURw+kMjL6wFLe5MdHIdfq8LQ
 /LUw==
X-Gm-Message-State: AOAM532PrzlRWtwHcZo4ZbFuc4twmMavyyGC7C9x/E9FEW1v6cGOBe08
 lpIFMMxoYpGkqQw/xEhKKDgrbYfkYO60WA==
X-Google-Smtp-Source: ABdhPJysDMcgFrlQv0ajmb49t6kOpTPPrpNR73N14eHLlFQojze6cmwnLjLfEjNlPw2a74qGdFjbvg==
X-Received: by 2002:a7b:c04c:: with SMTP id u12mr23657326wmc.9.1615224774953; 
 Mon, 08 Mar 2021 09:32:54 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.32.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:32:54 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/54] hw/timer/sse-counter: Model the SSE Subsystem System
 Counter
Date: Mon,  8 Mar 2021 17:32:01 +0000
Message-Id: <20210308173244.20710-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x341.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The SSE-300 includes a counter module; implement a model of it.

This counter is documented in the SSE-123 Example Subsystem
Technical Reference Manual:
 https://developer.arm.com/documentation/101370/latest/

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210219144617.4782-12-peter.maydell@linaro.org
---
 include/hw/timer/sse-counter.h | 105 ++++++++
 hw/timer/sse-counter.c         | 474 +++++++++++++++++++++++++++++++++
 MAINTAINERS                    |   2 +
 hw/arm/Kconfig                 |   1 +
 hw/timer/Kconfig               |   3 +
 hw/timer/meson.build           |   1 +
 hw/timer/trace-events          |   7 +
 7 files changed, 593 insertions(+)
 create mode 100644 include/hw/timer/sse-counter.h
 create mode 100644 hw/timer/sse-counter.c

diff --git a/include/hw/timer/sse-counter.h b/include/hw/timer/sse-counter.h
new file mode 100644
index 00000000000..b433e58d370
--- /dev/null
+++ b/include/hw/timer/sse-counter.h
@@ -0,0 +1,105 @@
+/*
+ * Arm SSE Subsystem System Counter
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
+ * This is a model of the "System counter" which is documented in
+ * the Arm SSE-123 Example Subsystem Technical Reference Manual:
+ * https://developer.arm.com/documentation/101370/latest/
+ *
+ * QEMU interface:
+ *  + Clock input "CLK": clock
+ *  + sysbus MMIO region 0: the control register frame
+ *  + sysbus MMIO region 1: the status register frame
+ *
+ * Consumers of the system counter's timestamp, such as the SSE
+ * System Timer device, can also use the APIs sse_counter_for_timestamp(),
+ * sse_counter_tick_to_time() and sse_counter_register_consumer() to
+ * interact with an instance of the System Counter. Generally the
+ * consumer device should have a QOM link property which the board
+ * code can set to the appropriate instance of the system counter.
+ */
+
+#ifndef SSE_COUNTER_H
+#define SSE_COUNTER_H
+
+#include "hw/sysbus.h"
+#include "qom/object.h"
+#include "qemu/notify.h"
+
+#define TYPE_SSE_COUNTER "sse-counter"
+OBJECT_DECLARE_SIMPLE_TYPE(SSECounter, SSE_COUNTER)
+
+struct SSECounter {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion control_mr;
+    MemoryRegion status_mr;
+    Clock *clk;
+    NotifierList notifier_list;
+
+    uint32_t cntcr;
+    uint32_t cntscr0;
+
+    /*
+     * These are used for handling clock frequency changes: they are a
+     * tuple of (QEMU_CLOCK_VIRTUAL timestamp, CNTCV at that time),
+     * taken when the clock frequency changes. sse_cntcv() needs them
+     * to calculate the current CNTCV.
+     */
+    uint64_t ns_then;
+    uint64_t ticks_then;
+};
+
+/*
+ * These functions are the interface by which a consumer of
+ * the system timestamp (such as the SSE system timer device)
+ * can communicate with the SSECounter.
+ */
+
+/**
+ * sse_counter_for_timestamp:
+ * @counter: SSECounter
+ * @ns: timestamp of QEMU_CLOCK_VIRTUAL in nanoseconds
+ *
+ * Returns the value of the timestamp counter at the specified
+ * point in time (assuming that no changes to scale factor, enable, etc
+ * happen in the meantime).
+ */
+uint64_t sse_counter_for_timestamp(SSECounter *counter, uint64_t ns);
+
+/**
+ * sse_counter_tick_to_time:
+ * @counter: SSECounter
+ * @tick: tick value
+ *
+ * Returns the time (a QEMU_CLOCK_VIRTUAL timestamp in nanoseconds)
+ * when the timestamp counter will reach the specified tick count.
+ * If the counter is not currently running, returns UINT64_MAX.
+ */
+uint64_t sse_counter_tick_to_time(SSECounter *counter, uint64_t tick);
+
+/**
+ * sse_counter_register_consumer:
+ * @counter: SSECounter
+ * @notifier: Notifier which is notified on counter changes
+ *
+ * Registers @notifier with the SSECounter. When the counter's
+ * configuration changes in a way that might invalidate information
+ * previously returned via sse_counter_for_timestamp() or
+ * sse_counter_tick_to_time(), the notifier will be called.
+ * Devices which consume the timestamp counter can use this as
+ * a cue to recalculate timer events.
+ */
+void sse_counter_register_consumer(SSECounter *counter, Notifier *notifier);
+
+#endif
diff --git a/hw/timer/sse-counter.c b/hw/timer/sse-counter.c
new file mode 100644
index 00000000000..0384051f151
--- /dev/null
+++ b/hw/timer/sse-counter.c
@@ -0,0 +1,474 @@
+/*
+ * Arm SSE Subsystem System Counter
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
+ * This is a model of the "System counter" which is documented in
+ * the Arm SSE-123 Example Subsystem Technical Reference Manual:
+ * https://developer.arm.com/documentation/101370/latest/
+ *
+ * The system counter is a non-stop 64-bit up-counter. It provides
+ * this count value to other devices like the SSE system timer,
+ * which are driven by this system timestamp rather than directly
+ * from a clock. Internally to the counter the count is actually
+ * 88-bit precision (64.24 fixed point), with a programmable scale factor.
+ *
+ * The hardware has the optional feature that it supports dynamic
+ * clock switching, where two clock inputs are connected, and which
+ * one is used is selected via a CLKSEL input signal. Since the
+ * users of this device in QEMU don't use this feature, we only model
+ * the HWCLKSW=0 configuration.
+ */
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/timer.h"
+#include "qapi/error.h"
+#include "trace.h"
+#include "hw/timer/sse-counter.h"
+#include "hw/sysbus.h"
+#include "hw/irq.h"
+#include "hw/registerfields.h"
+#include "hw/clock.h"
+#include "hw/qdev-clock.h"
+#include "migration/vmstate.h"
+
+/* Registers in the control frame */
+REG32(CNTCR, 0x0)
+    FIELD(CNTCR, EN, 0, 1)
+    FIELD(CNTCR, HDBG, 1, 1)
+    FIELD(CNTCR, SCEN, 2, 1)
+    FIELD(CNTCR, INTRMASK, 3, 1)
+    FIELD(CNTCR, PSLVERRDIS, 4, 1)
+    FIELD(CNTCR, INTRCLR, 5, 1)
+/*
+ * Although CNTCR defines interrupt-related bits, the counter doesn't
+ * appear to actually have an interrupt output. So INTRCLR is
+ * effectively a RAZ/WI bit, as are the reserved bits [31:6].
+ */
+#define CNTCR_VALID_MASK (R_CNTCR_EN_MASK | R_CNTCR_HDBG_MASK | \
+                          R_CNTCR_SCEN_MASK | R_CNTCR_INTRMASK_MASK | \
+                          R_CNTCR_PSLVERRDIS_MASK)
+REG32(CNTSR, 0x4)
+REG32(CNTCV_LO, 0x8)
+REG32(CNTCV_HI, 0xc)
+REG32(CNTSCR, 0x10) /* Aliased with CNTSCR0 */
+REG32(CNTID, 0x1c)
+    FIELD(CNTID, CNTSC, 0, 4)
+    FIELD(CNTID, CNTCS, 16, 1)
+    FIELD(CNTID, CNTSELCLK, 17, 2)
+    FIELD(CNTID, CNTSCR_OVR, 19, 1)
+REG32(CNTSCR0, 0xd0)
+REG32(CNTSCR1, 0xd4)
+
+/* Registers in the status frame */
+REG32(STATUS_CNTCV_LO, 0x0)
+REG32(STATUS_CNTCV_HI, 0x4)
+
+/* Standard ID registers, present in both frames */
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
+static const int control_id[] = {
+    0x04, 0x00, 0x00, 0x00, /* PID4..PID7 */
+    0xba, 0xb0, 0x0b, 0x00, /* PID0..PID3 */
+    0x0d, 0xf0, 0x05, 0xb1, /* CID0..CID3 */
+};
+
+static const int status_id[] = {
+    0x04, 0x00, 0x00, 0x00, /* PID4..PID7 */
+    0xbb, 0xb0, 0x0b, 0x00, /* PID0..PID3 */
+    0x0d, 0xf0, 0x05, 0xb1, /* CID0..CID3 */
+};
+
+static void sse_counter_notify_users(SSECounter *s)
+{
+    /*
+     * Notify users of the count timestamp that they may
+     * need to recalculate.
+     */
+    notifier_list_notify(&s->notifier_list, NULL);
+}
+
+static bool sse_counter_enabled(SSECounter *s)
+{
+    return (s->cntcr & R_CNTCR_EN_MASK) != 0;
+}
+
+uint64_t sse_counter_tick_to_time(SSECounter *s, uint64_t tick)
+{
+    if (!sse_counter_enabled(s)) {
+        return UINT64_MAX;
+    }
+
+    tick -= s->ticks_then;
+
+    if (s->cntcr & R_CNTCR_SCEN_MASK) {
+        /* Adjust the tick count to account for the scale factor */
+        tick = muldiv64(tick, 0x01000000, s->cntscr0);
+    }
+
+    return s->ns_then + clock_ticks_to_ns(s->clk, tick);
+}
+
+void sse_counter_register_consumer(SSECounter *s, Notifier *notifier)
+{
+    /*
+     * For the moment we assume that both we and the devices
+     * which consume us last for the life of the simulation,
+     * and so there is no mechanism for removing a notifier.
+     */
+    notifier_list_add(&s->notifier_list, notifier);
+}
+
+uint64_t sse_counter_for_timestamp(SSECounter *s, uint64_t now)
+{
+    /* Return the CNTCV value for a particular timestamp (clock ns value). */
+    uint64_t ticks;
+
+    if (!sse_counter_enabled(s)) {
+        /* Counter is disabled and does not increment */
+        return s->ticks_then;
+    }
+
+    ticks = clock_ns_to_ticks(s->clk, now - s->ns_then);
+    if (s->cntcr & R_CNTCR_SCEN_MASK) {
+        /*
+         * Scaling is enabled. The CNTSCR value is the amount added to
+         * the underlying 88-bit counter for every tick of the
+         * underlying clock; CNTCV is the top 64 bits of that full
+         * 88-bit value. Multiplying the tick count by CNTSCR tells us
+         * how much the full 88-bit counter has moved on; we then
+         * divide that by 0x01000000 to find out how much the 64-bit
+         * visible portion has advanced. muldiv64() gives us the
+         * necessary at-least-88-bit precision for the intermediate
+         * result.
+         */
+        ticks = muldiv64(ticks, s->cntscr0, 0x01000000);
+    }
+    return s->ticks_then + ticks;
+}
+
+static uint64_t sse_cntcv(SSECounter *s)
+{
+    /* Return the CNTCV value for the current time */
+    return sse_counter_for_timestamp(s, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
+}
+
+static void sse_write_cntcv(SSECounter *s, uint32_t value, unsigned startbit)
+{
+    /*
+     * Write one 32-bit half of the counter value; startbit is the
+     * bit position of this half in the 64-bit word, either 0 or 32.
+     */
+    uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    uint64_t cntcv = sse_counter_for_timestamp(s, now);
+
+    cntcv = deposit64(cntcv, startbit, 32, value);
+    s->ticks_then = cntcv;
+    s->ns_then = now;
+    sse_counter_notify_users(s);
+}
+
+static uint64_t sse_counter_control_read(void *opaque, hwaddr offset,
+                                         unsigned size)
+{
+    SSECounter *s = SSE_COUNTER(opaque);
+    uint64_t r;
+
+    switch (offset) {
+    case A_CNTCR:
+        r = s->cntcr;
+        break;
+    case A_CNTSR:
+        /*
+         * The only bit here is DBGH, indicating that the counter has been
+         * halted via the Halt-on-Debug signal. We don't implement halting
+         * debug, so the whole register always reads as zero.
+         */
+        r = 0;
+        break;
+    case A_CNTCV_LO:
+        r = extract64(sse_cntcv(s), 0, 32);
+        break;
+    case A_CNTCV_HI:
+        r = extract64(sse_cntcv(s), 32, 32);
+        break;
+    case A_CNTID:
+        /*
+         * For our implementation:
+         *  - CNTSCR can only be written when CNTCR.EN == 0
+         *  - HWCLKSW=0, so selected clock is always CLK0
+         *  - counter scaling is implemented
+         */
+        r = (1 << R_CNTID_CNTSELCLK_SHIFT) | (1 << R_CNTID_CNTSC_SHIFT);
+        break;
+    case A_CNTSCR:
+    case A_CNTSCR0:
+        r = s->cntscr0;
+        break;
+    case A_CNTSCR1:
+        /* If HWCLKSW == 0, CNTSCR1 is RAZ/WI */
+        r = 0;
+        break;
+    case A_PID4 ... A_CID3:
+        r = control_id[(offset - A_PID4) / 4];
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "SSE System Counter control frame read: bad offset 0x%x",
+                      (unsigned)offset);
+        r = 0;
+        break;
+    }
+
+    trace_sse_counter_control_read(offset, r, size);
+    return r;
+}
+
+static void sse_counter_control_write(void *opaque, hwaddr offset,
+                                      uint64_t value, unsigned size)
+{
+    SSECounter *s = SSE_COUNTER(opaque);
+
+    trace_sse_counter_control_write(offset, value, size);
+
+    switch (offset) {
+    case A_CNTCR:
+        /*
+         * Although CNTCR defines interrupt-related bits, the counter doesn't
+         * appear to actually have an interrupt output. So INTRCLR is
+         * effectively a RAZ/WI bit, as are the reserved bits [31:6].
+         * The documentation does not explicitly say so, but we assume
+         * that changing the scale factor while the counter is enabled
+         * by toggling CNTCR.SCEN has the same behaviour (making the counter
+         * value UNKNOWN) as changing it by writing to CNTSCR, and so we
+         * don't need to try to recalculate for that case.
+         */
+        value &= CNTCR_VALID_MASK;
+        if ((value ^ s->cntcr) & R_CNTCR_EN_MASK) {
+            /*
+             * Whether the counter is being enabled or disabled, the
+             * required action is the same: sync the (ns_then, ticks_then)
+             * tuple.
+             */
+            uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+            s->ticks_then = sse_counter_for_timestamp(s, now);
+            s->ns_then = now;
+            sse_counter_notify_users(s);
+        }
+        s->cntcr = value;
+        break;
+    case A_CNTCV_LO:
+        sse_write_cntcv(s, value, 0);
+        break;
+    case A_CNTCV_HI:
+        sse_write_cntcv(s, value, 32);
+        break;
+    case A_CNTSCR:
+    case A_CNTSCR0:
+        /*
+         * If the scale registers are changed when the counter is enabled,
+         * the count value becomes UNKNOWN. So we don't try to recalculate
+         * anything here but only do it on a write to CNTCR.EN.
+         */
+        s->cntscr0 = value;
+        break;
+    case A_CNTSCR1:
+        /* If HWCLKSW == 0, CNTSCR1 is RAZ/WI */
+        break;
+    case A_CNTSR:
+    case A_CNTID:
+    case A_PID4 ... A_CID3:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "SSE System Counter control frame: write to RO offset 0x%x\n",
+                      (unsigned)offset);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "SSE System Counter control frame: write to bad offset 0x%x\n",
+                      (unsigned)offset);
+        break;
+    }
+}
+
+static uint64_t sse_counter_status_read(void *opaque, hwaddr offset,
+                                        unsigned size)
+{
+    SSECounter *s = SSE_COUNTER(opaque);
+    uint64_t r;
+
+    switch (offset) {
+    case A_STATUS_CNTCV_LO:
+        r = extract64(sse_cntcv(s), 0, 32);
+        break;
+    case A_STATUS_CNTCV_HI:
+        r = extract64(sse_cntcv(s), 32, 32);
+        break;
+    case A_PID4 ... A_CID3:
+        r = status_id[(offset - A_PID4) / 4];
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "SSE System Counter status frame read: bad offset 0x%x",
+                      (unsigned)offset);
+        r = 0;
+        break;
+    }
+
+    trace_sse_counter_status_read(offset, r, size);
+    return r;
+}
+
+static void sse_counter_status_write(void *opaque, hwaddr offset,
+                                     uint64_t value, unsigned size)
+{
+    trace_sse_counter_status_write(offset, value, size);
+
+    switch (offset) {
+    case A_STATUS_CNTCV_LO:
+    case A_STATUS_CNTCV_HI:
+    case A_PID4 ... A_CID3:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "SSE System Counter status frame: write to RO offset 0x%x\n",
+                      (unsigned)offset);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "SSE System Counter status frame: write to bad offset 0x%x\n",
+                      (unsigned)offset);
+        break;
+    }
+}
+
+static const MemoryRegionOps sse_counter_control_ops = {
+    .read = sse_counter_control_read,
+    .write = sse_counter_control_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
+};
+
+static const MemoryRegionOps sse_counter_status_ops = {
+    .read = sse_counter_status_read,
+    .write = sse_counter_status_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
+};
+
+static void sse_counter_reset(DeviceState *dev)
+{
+    SSECounter *s = SSE_COUNTER(dev);
+
+    trace_sse_counter_reset();
+
+    s->cntcr = 0;
+    s->cntscr0 = 0x01000000;
+    s->ns_then = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    s->ticks_then = 0;
+}
+
+static void sse_clk_callback(void *opaque, ClockEvent event)
+{
+    SSECounter *s = SSE_COUNTER(opaque);
+    uint64_t now;
+
+    switch (event) {
+    case ClockPreUpdate:
+        /*
+         * Before the clock period updates, set (ticks_then, ns_then)
+         * to the current time and tick count (as calculated with
+         * the old clock period).
+         */
+        if (sse_counter_enabled(s)) {
+            now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+            s->ticks_then = sse_counter_for_timestamp(s, now);
+            s->ns_then = now;
+        }
+        break;
+    case ClockUpdate:
+        sse_counter_notify_users(s);
+        break;
+    default:
+        break;
+    }
+}
+
+static void sse_counter_init(Object *obj)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    SSECounter *s = SSE_COUNTER(obj);
+
+    notifier_list_init(&s->notifier_list);
+
+    s->clk = qdev_init_clock_in(DEVICE(obj), "CLK", sse_clk_callback, s,
+                                ClockPreUpdate | ClockUpdate);
+    memory_region_init_io(&s->control_mr, obj, &sse_counter_control_ops,
+                          s, "sse-counter-control", 0x1000);
+    memory_region_init_io(&s->status_mr, obj, &sse_counter_status_ops,
+                          s, "sse-counter-status", 0x1000);
+    sysbus_init_mmio(sbd, &s->control_mr);
+    sysbus_init_mmio(sbd, &s->status_mr);
+}
+
+static void sse_counter_realize(DeviceState *dev, Error **errp)
+{
+    SSECounter *s = SSE_COUNTER(dev);
+
+    if (!clock_has_source(s->clk)) {
+        error_setg(errp, "SSE system counter: CLK must be connected");
+        return;
+    }
+}
+
+static const VMStateDescription sse_counter_vmstate = {
+    .name = "sse-counter",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_CLOCK(clk, SSECounter),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void sse_counter_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = sse_counter_realize;
+    dc->vmsd = &sse_counter_vmstate;
+    dc->reset = sse_counter_reset;
+}
+
+static const TypeInfo sse_counter_info = {
+    .name = TYPE_SSE_COUNTER,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(SSECounter),
+    .instance_init = sse_counter_init,
+    .class_init = sse_counter_class_init,
+};
+
+static void sse_counter_register_types(void)
+{
+    type_register_static(&sse_counter_info);
+}
+
+type_init(sse_counter_register_types);
diff --git a/MAINTAINERS b/MAINTAINERS
index 26c9454823a..68c37957cfe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -751,6 +751,8 @@ F: hw/misc/armsse-cpuid.c
 F: include/hw/misc/armsse-cpuid.h
 F: hw/misc/armsse-mhu.c
 F: include/hw/misc/armsse-mhu.h
+F: hw/timer/sse-counter.c
+F: include/hw/timer/sse-counter.h
 F: docs/system/arm/mps2.rst
 
 Musca
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 4e6f4ffe90c..a23992a47c8 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -520,6 +520,7 @@ config ARMSSE
     select TZ_MSC
     select TZ_PPC
     select UNIMP
+    select SSE_COUNTER
 
 config ARMSSE_CPUID
     bool
diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
index 8749edfb6a5..e103c8872ab 100644
--- a/hw/timer/Kconfig
+++ b/hw/timer/Kconfig
@@ -42,5 +42,8 @@ config RENESAS_TMR
 config RENESAS_CMT
     bool
 
+config SSE_COUNTER
+    bool
+
 config AVR_TIMER16
     bool
diff --git a/hw/timer/meson.build b/hw/timer/meson.build
index be343f68fed..79a3012349d 100644
--- a/hw/timer/meson.build
+++ b/hw/timer/meson.build
@@ -32,6 +32,7 @@ softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_timer.c'))
 softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_systmr.c'))
 softmmu_ss.add(when: 'CONFIG_SH4', if_true: files('sh_timer.c'))
 softmmu_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_timer.c'))
+softmmu_ss.add(when: 'CONFIG_SSE_COUNTER', if_true: files('sse-counter.c'))
 softmmu_ss.add(when: 'CONFIG_STM32F2XX_TIMER', if_true: files('stm32f2xx_timer.c'))
 softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_timer.c'))
 
diff --git a/hw/timer/trace-events b/hw/timer/trace-events
index 7a4326d9566..bb9c1000878 100644
--- a/hw/timer/trace-events
+++ b/hw/timer/trace-events
@@ -93,3 +93,10 @@ avr_timer16_interrupt_count(uint8_t cnt) "count: %u"
 avr_timer16_interrupt_overflow(const char *reason) "overflow: %s"
 avr_timer16_next_alarm(uint64_t delay_ns) "next alarm: %" PRIu64 " ns from now"
 avr_timer16_clksrc_update(uint64_t freq_hz, uint64_t period_ns, uint64_t delay_s) "timer frequency: %" PRIu64 " Hz, period: %" PRIu64 " ns (%" PRId64 " us)"
+
+# sse_counter.c
+sse_counter_control_read(uint64_t offset, uint64_t data, unsigned size) "SSE system counter control frame read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
+sse_counter_control_write(uint64_t offset, uint64_t data, unsigned size) "SSE system counter control framen write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
+sse_counter_status_read(uint64_t offset, uint64_t data, unsigned size) "SSE system counter status frame read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
+sse_counter_status_write(uint64_t offset, uint64_t data, unsigned size) "SSE system counter status frame write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
+sse_counter_reset(void) "SSE system counter: reset"
-- 
2.20.1


