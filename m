Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6EE3926E3
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 07:29:40 +0200 (CEST)
Received: from localhost ([::1]:56064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm8aR-0005ed-Iq
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 01:29:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ysato@users.sourceforge.jp>)
 id 1lm8Sj-0008S0-0X
 for qemu-devel@nongnu.org; Thu, 27 May 2021 01:21:41 -0400
Received: from mail01.asahi-net.or.jp ([202.224.55.13]:58620)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ysato@users.sourceforge.jp>) id 1lm8Sc-00064b-2X
 for qemu-devel@nongnu.org; Thu, 27 May 2021 01:21:40 -0400
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23]) (Authenticated sender: PQ4Y-STU)
 by mail01.asahi-net.or.jp (Postfix) with ESMTPA id 7AB7D11D366;
 Thu, 27 May 2021 14:21:30 +0900 (JST)
Received: from yo-satoh-debian.localdomain
 (y245018.dynamic.ppp.asahi-net.or.jp [118.243.245.18])
 by sakura.ysato.name (Postfix) with ESMTPSA id E18F31C064D;
 Thu, 27 May 2021 14:21:29 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/11] hw/timer: Renesas TMU/CMT module.
Date: Thu, 27 May 2021 14:21:14 +0900
Message-Id: <20210527052122.97103-4-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210527052122.97103-1-ysato@users.sourceforge.jp>
References: <20210527052122.97103-1-ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=202.224.55.13;
 envelope-from=ysato@users.sourceforge.jp; helo=mail01.asahi-net.or.jp
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TMU - SH4 Timer module.
CMT - Compare and match timer used by some Renesas MCUs.

The two modules have similar interfaces and have been merged.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 include/hw/timer/renesas_timer.h |  96 +++++
 hw/timer/renesas_timer.c         | 644 +++++++++++++++++++++++++++++++
 hw/timer/Kconfig                 |   3 +
 hw/timer/meson.build             |   1 +
 4 files changed, 744 insertions(+)
 create mode 100644 include/hw/timer/renesas_timer.h
 create mode 100644 hw/timer/renesas_timer.c

diff --git a/include/hw/timer/renesas_timer.h b/include/hw/timer/renesas_timer.h
new file mode 100644
index 0000000000..d71feec54e
--- /dev/null
+++ b/include/hw/timer/renesas_timer.h
@@ -0,0 +1,96 @@
+/*
+ * Renesas Timer unit Object
+ *
+ * Copyright (c) 2020 Yoshinori Sato
+ *
+ * This code is licensed under the GPL version 2 or later.
+ *
+ */
+
+#ifndef HW_RENESAS_TIMER_H
+#define HW_RENESAS_TIMER_H
+
+#include "hw/sysbus.h"
+#include "hw/qdev-clock.h"
+
+#define TYPE_RENESAS_TIMER_BASE "renesas-timer"
+OBJECT_DECLARE_TYPE(RenesasTimerBaseState, RenesasTimerBaseClass,
+                    RENESAS_TIMER_BASE)
+#define TYPE_RENESAS_CMT "renesas-cmt"
+OBJECT_DECLARE_TYPE(RenesasCMTState, RenesasCMTClass,
+                    RENESAS_CMT)
+#define TYPE_RENESAS_TMU "renesas-tmu"
+OBJECT_DECLARE_TYPE(RenesasTMUState, RenesasTMUClass,
+                    RENESAS_TMU)
+
+enum {
+    TIMER_CH_CMT = 2,
+    TIMER_CH_TMU = 3,
+};
+
+enum {
+    CMT_NR_IRQ = 1 * TIMER_CH_CMT,
+};
+
+struct RenesasTimerBaseState;
+
+enum dirction {
+    countup, countdown,
+};
+
+struct rtimer_ch {
+    uint32_t cnt;
+    uint32_t cor;
+    uint16_t ctrl;
+    qemu_irq irq;
+    int64_t base;
+    int64_t next;
+    uint64_t clk;
+    bool start;
+    QEMUTimer *timer;
+    struct RenesasTimerBaseState *tmrp;
+};
+
+typedef struct RenesasTimerBaseState {
+    SysBusDevice parent_obj;
+
+    uint64_t input_freq;
+    MemoryRegion memory;
+    Clock *pck;
+
+    struct rtimer_ch ch[TIMER_CH_TMU];
+    int num_ch;
+    enum dirction direction;
+    int unit;
+} RenesasTimerBaseState;
+
+typedef struct RenesasCMTState {
+    RenesasTimerBaseState parent_obj;
+} RenesasCMTState;
+
+typedef struct RenesasTMUState {
+    RenesasTimerBaseState parent_obj;
+    uint8_t tocr;
+    MemoryRegion memory_p4;
+    MemoryRegion memory_a7;
+} RenesasTMUState;
+
+typedef struct RenesasTimerBaseClass {
+    SysBusDeviceClass parent;
+    int (*divrate)(RenesasTimerBaseState *tmr, int ch);
+    void (*timer_event)(void *opaque);
+    int64_t (*delta_to_tcnt)(RenesasTimerBaseState *tmr, int ch, int64_t delta);
+    int64_t (*get_next)(RenesasTimerBaseState *tmr, int ch);
+    void (*update_clk)(RenesasTimerBaseState *tmr, int ch);
+} RenesasTimerBaseClass;
+
+typedef struct RenesasCMTClass {
+    RenesasTimerBaseClass parent;
+} RenesasCMTClass;
+
+typedef struct RenesasTMUClass {
+    RenesasTimerBaseClass parent;
+    void (*p_update_clk)(RenesasTimerBaseState *tmr, int ch);
+} RenesasTMUClass;
+
+#endif
diff --git a/hw/timer/renesas_timer.c b/hw/timer/renesas_timer.c
new file mode 100644
index 0000000000..b1224e1e6b
--- /dev/null
+++ b/hw/timer/renesas_timer.c
@@ -0,0 +1,644 @@
+/*
+ * Renesas 16bit/32bit Compare-match timer (CMT/TMU)
+ *
+ * Datasheet: RX62N Group, RX621 Group User's Manual: Hardware
+ *            (Rev.1.40 R01UH0033EJ0140)
+ *        And SH7751 Group, SH7751R Group User's Manual: Hardware
+ *            (Rev.4.01 R01UH0457EJ0401)
+ *
+ * Copyright (c) 2021 Yoshinori Sato
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "qemu/log.h"
+#include "qapi/error.h"
+#include "qemu/timer.h"
+#include "hw/hw.h"
+#include "hw/irq.h"
+#include "hw/sysbus.h"
+#include "hw/registerfields.h"
+#include "hw/qdev-properties.h"
+#include "hw/timer/renesas_timer.h"
+#include "migration/vmstate.h"
+#include "qemu/error-report.h"
+
+REG32(TOCR, 0)
+  FIELD(TOCR, TCOE, 0, 1)
+REG32(CMSTR, 0)
+REG32(TSTR, 4)
+REG32(TCOR, 8)
+REG32(TCNT, 12)
+REG32(TCR, 16)
+  FIELD(TCR, TPSC, 0, 3)
+  FIELD(TCR, CKEG, 3, 2)
+  FIELD(TCR, UNIE, 5, 1)
+  FIELD(TCR, ICPE, 6, 2)
+  FIELD(TCR, UNF, 8, 1)
+  FIELD(TCR, ICPF, 9, 1)
+REG32(CMCR, 16)
+  FIELD(CMCR, CKS, 0, 2)
+  FIELD(CMCR, CMIE, 6, 1)
+REG32(TCPR, 20)
+
+static int cmt_div(RenesasTimerBaseState *tmr, int ch)
+{
+    return 8 << (2 * FIELD_EX16(tmr->ch[ch].ctrl, CMCR, CKS));
+}
+
+static int tmu_div(RenesasTimerBaseState *tmr, int ch)
+{
+    if (FIELD_EX16(tmr->ch[ch].ctrl, TCR, TPSC) <= 5) {
+        return 4 << (2 * FIELD_EX16(tmr->ch[ch].ctrl, TCR, TPSC));
+    } else {
+        return 0;
+    }
+
+}
+
+static int64_t cmt_get_next(RenesasTimerBaseState *tmr, int ch)
+{
+    return tmr->ch[ch].cor - tmr->ch[ch].cnt;
+}
+
+static int64_t tmu_get_next(RenesasTimerBaseState *tmr, int ch)
+{
+    return tmr->ch[ch].cnt;
+}
+
+static void cmt_timer_event(void *opaque)
+{
+    struct rtimer_ch *ch = opaque;
+    ch->cnt = 0;
+    if (FIELD_EX16(ch->ctrl, CMCR, CMIE)) {
+        qemu_irq_pulse(ch->irq);
+    }
+    ch->base = ch->next;
+    ch->next += (ch->cor - ch->cnt) * ch->clk;
+    timer_mod(ch->timer, ch->next);
+}
+
+static void tmu_timer_event(void *opaque)
+{
+    struct rtimer_ch *ch = opaque;
+    ch->cnt = ch->cor;
+    if (!FIELD_EX16(ch->ctrl, TCR, UNF)) {
+        ch->ctrl = FIELD_DP16(ch->ctrl, TCR, UNF, 1);
+        qemu_set_irq(ch->irq, FIELD_EX16(ch->ctrl, TCR, UNIE));
+    }
+    ch->base = ch->next;
+    ch->next += ch->cnt * ch->clk;
+    timer_mod(ch->timer, ch->next);
+}
+
+static int64_t cmt_delta_to_cnt(RenesasTimerBaseState *tmr,
+                                int ch, int64_t delta)
+{
+    return tmr->ch[ch].cnt + delta;
+}
+
+static int64_t tmu_delta_to_cnt(RenesasTimerBaseState *tmr,
+                                int ch, int64_t delta)
+{
+    return tmr->ch[ch].cnt - delta;
+}
+
+static int64_t read_tcnt(RenesasTimerBaseState *tmr, int ch)
+{
+    int64_t delta, now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    RenesasTimerBaseClass *tc = RENESAS_TIMER_BASE_GET_CLASS(tmr);
+
+    if (tmr->ch[ch].clk > 0) {
+        delta = (now - tmr->ch[ch].base);
+        delta /= tmr->ch[ch].clk;
+        return tc->delta_to_tcnt(tmr, ch, delta);
+    } else {
+        return tmr->ch[ch].cnt;
+    }
+}
+
+static void tmr_start_stop(RenesasTimerBaseState *tmr, int ch, int start)
+{
+    RenesasTimerBaseClass *tc = RENESAS_TIMER_BASE_GET_CLASS(tmr);
+    int64_t now;
+    if (tmr->ch[ch].start != start) {
+        now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        if (start) {
+            if (!tmr->ch[ch].timer) {
+                tmr->ch[ch].timer =
+                    timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                 tc->timer_event, &tmr->ch[ch]);
+            }
+            tmr->ch[ch].base = now;
+            tmr->ch[ch].next = now + tc->get_next(tmr, ch) * tmr->ch[ch].clk;
+            timer_mod(tmr->ch[ch].timer, tmr->ch[ch].next);
+        } else {
+            tmr->ch[ch].cnt = read_tcnt(tmr, ch);
+            tmr->ch[ch].next = 0;
+            if (tmr->ch[ch].timer) {
+                timer_del(tmr->ch[ch].timer);
+            }
+        }
+        tmr->ch[ch].start = start;
+    }
+}
+
+static uint64_t read_tstr(RenesasTimerBaseState *tmr)
+{
+    uint64_t ret = 0;
+    int ch;
+    for (ch = 0; ch < tmr->num_ch; ch++) {
+        ret = deposit64(ret, ch, 1, tmr->ch[ch].start);
+    }
+    return ret;
+}
+
+static void update_clk(RenesasTimerBaseState *tmr, int ch)
+{
+    RenesasTimerBaseClass *tc = RENESAS_TIMER_BASE_GET_CLASS(tmr);
+    int t;
+    t = tc->divrate(tmr, ch);
+    if (t > 0) {
+        t = tmr->input_freq / t;
+        tmr->ch[ch].clk = NANOSECONDS_PER_SECOND / t;
+    } else {
+        tmr->ch[ch].clk = 0;
+    }
+}
+
+static void tmu_update_clk(RenesasTimerBaseState *tmr, int ch)
+{
+    /* Clock setting validation */
+    int tpsc = FIELD_EX16(tmr->ch[ch].ctrl, TCR, TPSC);
+    switch (tpsc) {
+    case 5:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "renesas_timer: Invalid TPSC valule %d.\n", tpsc);
+        break;
+    case 6:
+    case 7:
+        qemu_log_mask(LOG_UNIMP,
+                      "renesas_timer: External clock not implemented.\n");
+        break;
+    }
+    /* Interrupt clear */
+    if (FIELD_EX16(tmr->ch[ch].ctrl, TCR, UNF) == 0) {
+        qemu_set_irq(tmr->ch[ch].irq, 0);
+    }
+    update_clk(tmr, ch);
+}
+
+static uint64_t channel_read(RenesasTimerBaseState *tmr, int ch, int reg)
+{
+    switch (reg) {
+    case R_TCR:
+        return tmr->ch[ch].ctrl;
+    case R_TCNT:
+        if (tmr->ch[ch].start) {
+            return read_tcnt(tmr, ch);
+        } else {
+            return tmr->ch[ch].cnt;
+        }
+    case R_TCOR:
+        return tmr->ch[ch].cor;
+    }
+    return UINT64_MAX;
+}
+
+static void tmr_pck_update(void *opaque, ClockEvent evt)
+{
+    RenesasTimerBaseState *tmr = RENESAS_TIMER_BASE(opaque);
+    int64_t now;
+    int i;
+    struct rtimer_ch *ch;
+    for (i = 0; i < TIMER_CH_CMT; i++) {
+        if (tmr->ch[i].start) {
+            tmr->ch[i].cnt = read_tcnt(tmr, i);
+        }
+    }
+    if (clock_is_enabled(tmr->pck)) {
+        tmr->input_freq = clock_get_hz(tmr->pck);
+        now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        for (i = 0; i < TIMER_CH_CMT; i++) {
+            update_clk(tmr, i);
+            ch = &tmr->ch[i];
+            if (ch->start) {
+                ch->next = ch->base = now;
+                if (tmr->direction == countup) {
+                    ch->next += (ch->cor - ch->cnt) * ch->clk;
+                } else {
+                    ch->next += ch->cnt * ch->clk;
+                }
+                timer_mod(ch->timer, ch->next);
+            }
+        }
+    } else {
+        for (i = 0; i < TIMER_CH_CMT; i++) {
+            if (tmr->ch[i].timer) {
+                timer_del(tmr->ch[i].timer);
+            }
+        }
+    }
+}
+
+static uint64_t cmt_read(void *opaque, hwaddr addr, unsigned size)
+{
+    RenesasCMTState *cmt = RENESAS_CMT(opaque);
+    RenesasTimerBaseState *tmr = RENESAS_TIMER_BASE(cmt);
+    int ch, reg;
+
+    /*  +0 - CMSTR (TSTR)  */
+    /*  +2 - CMCR0  (TCR)  */
+    /*  +4 - CMCNT0 (TCNT) */
+    /*  +6 - CMCOR0 (TCOR) */
+    /*  +8 - CMCR1  (TCR)  */
+    /* +10 - CMCNT1 (TCNT) */
+    /* +12 - CMCOR1 (TCOR) */
+    if (!clock_is_enabled(tmr->pck)) {
+        qemu_log_mask(LOG_UNIMP, "renesas_timer: Unit %d stopped.\n",
+                      tmr->unit);
+        return UINT64_MAX;
+    }
+    addr /= 2;
+    if (addr == R_CMSTR) {
+        return read_tstr(RENESAS_TIMER_BASE(cmt));
+    } else {
+        ch = addr / 4;
+        if (addr < 4) {
+            /* skip CMSTR */
+            addr--;
+        }
+        reg = 2 - (addr % 4);
+        return channel_read(RENESAS_TIMER_BASE(cmt), ch, reg);
+    }
+}
+
+static uint64_t tmu_read(void *opaque, hwaddr addr, unsigned size)
+{
+    RenesasTMUState *tmu = RENESAS_TMU(opaque);
+    RenesasTimerBaseState *tmr = RENESAS_TIMER_BASE(tmu);
+    int ch = -1, reg = -1;
+
+    /*  +0 - TCOR  */
+    /*  +4 - TSTR  */
+    /*  +8 - TCOR0 */
+    /* +12 - TCNT0 */
+    /* +16 - TCR0  */
+    /* +20 - TCOR1 */
+    /* +24 - TCNT1 */
+    /* +28 - TCR1  */
+    /* +32 - TCOR2 */
+    /* +36 - TCNT2 */
+    /* +40 - TCR2  */
+    /* +44 - TCPR2 */
+
+    if (tmr->unit != 0 && addr >= 32) {
+        /* UNIT1 channel2 is not exit */
+        qemu_log_mask(LOG_UNIMP, "renesas_timer: Register 0x%"
+                      HWADDR_PRIX " not implemented\n", addr);
+        return UINT64_MAX;
+    }
+    if (!clock_is_enabled(tmr->pck)) {
+        qemu_log_mask(LOG_UNIMP, "renesas_timer: Unit %d stopped.\n",
+                      tmr->unit);
+        return UINT64_MAX;
+    }
+    addr /= 4;
+    switch (addr) {
+    case R_TOCR:
+        return tmu->tocr;
+    case R_TSTR:
+        return read_tstr(RENESAS_TIMER_BASE(tmu));
+    case R_TCPR:
+        qemu_log_mask(LOG_UNIMP,
+                      "renesas_timer: Input capture not implemented.\n");
+        return UINT64_MAX;
+    default:
+        ch = (addr - 2) / 3;
+        reg = (addr - 2) % 3 + 2;
+        return channel_read(RENESAS_TIMER_BASE(tmu), ch, reg);
+    }
+}
+
+static void write_tstr(RenesasTimerBaseState *tmr, uint16_t val)
+{
+    int ch;
+    for (ch = 0; ch < tmr->num_ch; ch++) {
+        tmr_start_stop(tmr, ch, extract16(val, ch, 1));
+    }
+}
+
+static void write_tcr(RenesasTimerBaseState *tmr, int ch,
+                      uint16_t val, uint16_t mask)
+{
+    RenesasTimerBaseClass *tc = RENESAS_TIMER_BASE_GET_CLASS(tmr);
+    tmr->ch[ch].ctrl |= (mask & 0x00ff);
+    tmr->ch[ch].ctrl &= val & mask;
+    tc->update_clk(tmr, ch);
+}
+
+static void channel_write(RenesasTimerBaseState *tmr, int ch,
+                         int reg, uint64_t val)
+{
+    switch (reg) {
+    case R_TCNT:
+        tmr->ch[ch].cnt = val;
+        break;
+    case R_TCOR:
+        tmr->ch[ch].cor = val;
+        break;
+    }
+}
+
+static void cmt_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
+{
+    RenesasTimerBaseState *tmr = RENESAS_TIMER_BASE(opaque);
+    int ch, reg;
+    uint32_t next_timeout;
+    uint16_t cnt;
+
+    if (!clock_is_enabled(tmr->pck)) {
+        qemu_log_mask(LOG_UNIMP, "renesas_timer: Unit %d stopped.\n",
+                      tmr->unit);
+        return;
+    }
+    addr /= 2;
+    if (addr == R_CMSTR) {
+        write_tstr(tmr, val);
+    } else {
+        ch = addr / 4;
+        if (addr < 4) {
+            /* skip CMSTR */
+            addr--;
+        }
+        reg = (2 - (addr % 4)) + 2;
+        if (reg == R_TCR) {
+            /* bit7 always 1 */
+            val |= 0x0080;
+            write_tcr(RENESAS_TIMER_BASE(tmr), ch, val, 0x0043);
+        } else {
+            channel_write(RENESAS_TIMER_BASE(tmr), ch, reg, val);
+            if (tmr->ch[ch].start) {
+                if (reg == R_TCNT) {
+                    cnt = tmr->ch[ch].cnt;
+                } else {
+                    cnt = read_tcnt(tmr, ch);
+                }
+                if (tmr->ch[ch].cor < cnt) {
+                    next_timeout = 0x10000 + tmr->ch[ch].cor - cnt;
+                } else {
+                    next_timeout = tmr->ch[ch].cor - cnt;
+                }
+                tmr->ch[ch].next = tmr->ch[ch].base +
+                    next_timeout * tmr->ch[ch].clk;
+                timer_mod(tmr->ch[ch].timer, tmr->ch[ch].next);
+            }
+        }
+    }
+}
+
+static void tmu_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
+{
+    RenesasTMUState *tmu = RENESAS_TMU(opaque);
+    RenesasTimerBaseState *tmr = RENESAS_TIMER_BASE(tmu);
+
+    int ch, reg;
+    uint16_t tcr_mask;
+
+    if (tmr->unit != 0 && addr >= 32) {
+        /* UNIT1 channel2 is not exit */
+        qemu_log_mask(LOG_UNIMP, "renesas_timer: Register 0x%"
+                      HWADDR_PRIX " not implemented\n", addr);
+        return;
+    }
+    if (!clock_is_enabled(tmr->pck)) {
+        qemu_log_mask(LOG_UNIMP, "renesas_timer: Unit %d stopped.\n",
+                      tmr->unit);
+        return;
+    }
+    addr /= 4;
+    switch (addr) {
+    case R_TOCR:
+        tmu->tocr = FIELD_DP8(tmu->tocr, TOCR, TCOE,
+                              FIELD_EX8(val, TOCR, TCOE));
+        break;
+    case R_TSTR:
+        write_tstr(tmr, val);
+        break;
+    case R_TCPR:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "renesas_timer: TCPR is read only.\n");
+        break;
+    default:
+        ch = (addr - 2) / 3;
+        reg = (addr - 2) % 3 + 2;
+        if (reg == R_TCR) {
+            if (tmr->unit == 0) {
+                tcr_mask = (ch < 2) ? 0x013f : 0x03ff;
+            } else {
+                tcr_mask = 0x0127;
+            }
+            write_tcr(tmr, ch, val, tcr_mask);
+        } else {
+            channel_write(tmr, ch, reg, val);
+            if (reg == R_TCNT && tmr->ch[ch].start) {
+                tmr->ch[ch].next = tmr->ch[ch].base +
+                    tmr->ch[ch].cnt * tmr->ch[ch].clk;
+                timer_mod(tmr->ch[ch].timer, tmr->ch[ch].next);
+            }
+        }
+        break;
+    }
+}
+
+static const MemoryRegionOps cmt_ops = {
+    .write = cmt_write,
+    .read  = cmt_read,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl = {
+        .min_access_size = 2,
+        .max_access_size = 2,
+    },
+};
+
+static const MemoryRegionOps tmu_ops = {
+    .write = tmu_write,
+    .read  = tmu_read,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl = {
+        .min_access_size = 2,
+        .max_access_size = 4,
+    },
+};
+
+static void timer_base_realize(RenesasTimerBaseState *tmr, int num_ch)
+{
+    tmr->num_ch = num_ch;
+}
+
+static void cmt_realize(DeviceState *dev, Error **errp)
+{
+    RenesasCMTState *cmt = RENESAS_CMT(dev);
+    RenesasTimerBaseState *tmr = RENESAS_TIMER_BASE(cmt);
+    int i;
+
+    timer_base_realize(tmr, TIMER_CH_CMT);
+
+    for (i = 0; i < TIMER_CH_CMT; i++) {
+        tmr->ch[i].cor = 0xffff;
+        if (clock_is_enabled(tmr->pck)) {
+            update_clk(tmr, i);
+        }
+    }
+}
+
+static void cmt_init(Object *obj)
+{
+    SysBusDevice *d = SYS_BUS_DEVICE(obj);
+    RenesasCMTState *cmt = RENESAS_CMT(obj);
+    RenesasTimerBaseState *tmr = RENESAS_TIMER_BASE(cmt);
+    int i;
+
+    tmr->direction = countup;
+    memory_region_init_io(&tmr->memory, obj, &cmt_ops,
+                          tmr, "renesas-cmt", 0x10);
+    sysbus_init_mmio(d, &tmr->memory);
+
+    for (i = 0; i < TIMER_CH_CMT; i++) {
+        sysbus_init_irq(d, &tmr->ch[i].irq);
+    }
+    tmr->pck = qdev_init_clock_in(DEVICE(obj), "pck",
+                                  tmr_pck_update, tmr, ClockUpdate);
+}
+
+static void tmu_realize(DeviceState *dev, Error **errp)
+{
+    SysBusDevice *d = SYS_BUS_DEVICE(dev);
+    RenesasTMUState *tmu = RENESAS_TMU(dev);
+    RenesasTimerBaseState *tmr = RENESAS_TIMER_BASE(tmu);
+    int i;
+    int num_ch;
+
+    /* Unit0 have 3ch, Unit1 have 2ch */
+    num_ch = TIMER_CH_TMU - tmr->unit;
+    timer_base_realize(tmr, num_ch);
+    for (i = 0; i < num_ch; i++) {
+        sysbus_init_irq(d, &tmr->ch[i].irq);
+        tmr->ch[i].cor = tmr->ch[i].cnt = 0xffffffff;
+        if (clock_is_enabled(tmr->pck)) {
+            update_clk(tmr, i);
+        }
+    }
+}
+
+static void tmu_init(Object *obj)
+{
+    SysBusDevice *d = SYS_BUS_DEVICE(obj);
+    RenesasTimerBaseState *tmr = RENESAS_TIMER_BASE(obj);
+    RenesasTMUState *tmu = RENESAS_TMU(obj);
+
+    tmr->direction = countdown;
+    memory_region_init_io(&tmr->memory, obj, &tmu_ops,
+                          tmr, "renesas-tmu", 0x30);
+    sysbus_init_mmio(d, &tmr->memory);
+    memory_region_init_alias(&tmu->memory_p4, NULL, "renesas-tmu-p4",
+                             &tmr->memory, 0, 0x30);
+    sysbus_init_mmio(d, &tmu->memory_p4);
+    memory_region_init_alias(&tmu->memory_a7, NULL, "renesas-tmu-a7",
+                             &tmr->memory, 0, 0x30);
+    sysbus_init_mmio(d, &tmu->memory_a7);
+    tmr->pck = qdev_init_clock_in(DEVICE(obj), "pck",
+                                  tmr_pck_update, tmr, ClockUpdate);
+}
+
+static const VMStateDescription vmstate_rtimer = {
+    .name = "rx-cmt",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static Property renesas_timer_properties[] = {
+    DEFINE_PROP_INT32("unit", RenesasTimerBaseState, unit, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void renesas_timer_base_class_init(ObjectClass *klass, void *data)
+{
+    RenesasTimerBaseClass *base = RENESAS_TIMER_BASE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->vmsd = &vmstate_rtimer;
+    base->update_clk = update_clk;
+    device_class_set_props(dc, renesas_timer_properties);
+}
+
+static void cmt_class_init(ObjectClass *klass, void *data)
+{
+    RenesasTimerBaseClass *base = RENESAS_TIMER_BASE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    base->divrate = cmt_div;
+    base->timer_event = cmt_timer_event;
+    base->delta_to_tcnt = cmt_delta_to_cnt;
+    base->get_next = cmt_get_next;
+    dc->realize = cmt_realize;
+}
+
+static void tmu_class_init(ObjectClass *klass, void *data)
+{
+    RenesasTimerBaseClass *base = RENESAS_TIMER_BASE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    base->divrate = tmu_div;
+    base->timer_event = tmu_timer_event;
+    base->delta_to_tcnt = tmu_delta_to_cnt;
+    base->get_next = tmu_get_next;
+    base->update_clk = tmu_update_clk;
+    dc->realize = tmu_realize;
+}
+
+static const TypeInfo renesas_timer_info[] = {
+    {
+        .name       = TYPE_RENESAS_TIMER_BASE,
+        .parent     = TYPE_SYS_BUS_DEVICE,
+        .instance_size = sizeof(RenesasTimerBaseState),
+        .class_init = renesas_timer_base_class_init,
+        .class_size = sizeof(RenesasTimerBaseClass),
+        .abstract = true,
+    },
+    {
+        .name       = TYPE_RENESAS_CMT,
+        .parent     = TYPE_RENESAS_TIMER_BASE,
+        .instance_size = sizeof(RenesasCMTState),
+        .instance_init = cmt_init,
+        .class_init = cmt_class_init,
+        .class_size = sizeof(RenesasCMTClass),
+    },
+    {
+        .name       = TYPE_RENESAS_TMU,
+        .parent     = TYPE_RENESAS_TIMER_BASE,
+        .instance_size = sizeof(RenesasTMUState),
+        .instance_init = tmu_init,
+        .class_init = tmu_class_init,
+        .class_size = sizeof(RenesasTMUClass),
+    },
+};
+
+DEFINE_TYPES(renesas_timer_info)
diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
index bac2511715..347add12dd 100644
--- a/hw/timer/Kconfig
+++ b/hw/timer/Kconfig
@@ -54,3 +54,6 @@ config SSE_TIMER
 
 config AVR_TIMER16
     bool
+
+config RENESAS_TIMER
+    bool
diff --git a/hw/timer/meson.build b/hw/timer/meson.build
index 157f540ecd..9019dce993 100644
--- a/hw/timer/meson.build
+++ b/hw/timer/meson.build
@@ -33,5 +33,6 @@ softmmu_ss.add(when: 'CONFIG_SSE_COUNTER', if_true: files('sse-counter.c'))
 softmmu_ss.add(when: 'CONFIG_SSE_TIMER', if_true: files('sse-timer.c'))
 softmmu_ss.add(when: 'CONFIG_STM32F2XX_TIMER', if_true: files('stm32f2xx_timer.c'))
 softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_timer.c'))
+softmmu_ss.add(when: 'CONFIG_RENESAS_TIMER', if_true: files('renesas_timer.c'))
 
 specific_ss.add(when: 'CONFIG_AVR_TIMER16', if_true: files('avr_timer16.c'))
-- 
2.20.1


