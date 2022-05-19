Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB0C52DBD8
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 19:50:51 +0200 (CEST)
Received: from localhost ([::1]:58684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrkIU-0005av-Hh
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 13:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk5J-0006RU-K0
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:37:13 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:42611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk5H-0000sm-0u
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:37:13 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 r6-20020a1c2b06000000b00396fee5ebc9so3094730wmr.1
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 10:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=sSZXFwuswjQ2jiay/orYwKt8+o5lsq+T5fVa2+sUtKM=;
 b=vEsEzqE8Sfhq+67Gu0/vv1xtjOjpKgZ1+DlRjbOdbUNPv3WMTVN5kD96HhZRHEtlOv
 HzASnKuZvnmSDx1bJwQ0o2Oqykm3m98xkYbNyz4U36QkJm8PojQn6gtZv0jgswtT3Aus
 ZWlficcCZ2UK1zZ3RfftbXPEacJXo1Dqk6baOEItxvflfpoEpDIxWkfTpYQxp9rPqZJZ
 0iN+cBjjLscKCwiXV9l0w5HKlGpTHYfvjjInXDm/l5x0lpJeBnqQZ2uypOu9utsf/0kk
 OqgEkBl2vghHYcnB9fYMRTvNgf/ZBHpReyvPjw6lbvD70BlvkU3EWbzoWTB9sV1a4CN6
 XSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sSZXFwuswjQ2jiay/orYwKt8+o5lsq+T5fVa2+sUtKM=;
 b=2ScXqcdza14MfIXJZzvaFB/Q4Hu48SmlDgLcr8qCnSnRzfMW+kq/dwSo0GwVAOxT2K
 1YZKQg+xfZzx97SBCZYXbnPI8MFiR1kjgn/ZFTlwixwT+r7IE/YZvS2/HeOrYBkOXaOO
 YaaJ/4X+ZeuwkumVjbWEN9eLrkPA+FSo3R95QG1lZ8SDX7CGKrBBGvS4jwA7fBF1384+
 TMKVVIZt1MY5n7O1OZVfY2WixaOEFcRe3SDudfgqKzzjQrY5RXf+BWX8TKy+qigZIT79
 aHh/01ZODve0tSCHSv/Iyv/b7ImyLzkbFLC3Bb+x4IkVMWWtEUcTutFNhEwmh4/lq2OE
 3irQ==
X-Gm-Message-State: AOAM530nkB5sWVPx2ltKl5VcVJZ5xYKMgZ5Sy0oORwFyLB4mpRBXDwza
 3PRbPVYtDv+aDdaMO7FZlWNU60Mv+7ifHQ==
X-Google-Smtp-Source: ABdhPJzKFS4FVZdeTJsHJShdlwFQ/cxAlXN2DEQVVw0HaLL3hEPmwCkv45ueV1r0GoUyXaJr7UyT3A==
X-Received: by 2002:a7b:c403:0:b0:38e:7c57:9af7 with SMTP id
 k3-20020a7bc403000000b0038e7c579af7mr4762114wmi.144.1652981829498; 
 Thu, 19 May 2022 10:37:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e2-20020adfa742000000b0020c5253d8f2sm180183wrd.62.2022.05.19.10.37.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 10:37:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/22] ptimer: Rename PTIMER_POLICY_DEFAULT to
 PTIMER_POLICY_LEGACY
Date: Thu, 19 May 2022 18:36:48 +0100
Message-Id: <20220519173651.399295-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519173651.399295-1-peter.maydell@linaro.org>
References: <20220519173651.399295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

The traditional ptimer behaviour includes a collection of weird edge
case behaviours.  In 2016 we improved the ptimer implementation to
fix these and generally make the behaviour more flexible, with
ptimers opting in to the new behaviour by passing an appropriate set
of policy flags to ptimer_init().  For backwards-compatibility, we
defined PTIMER_POLICY_DEFAULT (which sets no flags) to give the old
weird behaviour.

This turns out to be a poor choice of name, because people writing
new devices which use ptimers are misled into thinking that the
default is probably a sensible choice of flags, when in fact it is
almost always not what you want.  Rename PTIMER_POLICY_DEFAULT to
PTIMER_POLICY_LEGACY and beef up the comment to more clearly say that
new devices should not be using it.

The code-change part of this commit was produced by
  sed -i -e 's/PTIMER_POLICY_DEFAULT/PTIMER_POLICY_LEGACY/g' $(git grep -l PTIMER_POLICY_DEFAULT)
with the exception of a test name string change in
tests/unit/ptimer-test.c which was added manually.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Francisco Iglesias <francisco.iglesias@amd.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220516103058.162280-1-peter.maydell@linaro.org
---
 include/hw/ptimer.h          | 16 ++++++++++++----
 hw/arm/musicpal.c            |  2 +-
 hw/dma/xilinx_axidma.c       |  2 +-
 hw/dma/xlnx_csu_dma.c        |  2 +-
 hw/m68k/mcf5206.c            |  2 +-
 hw/m68k/mcf5208.c            |  2 +-
 hw/net/can/xlnx-zynqmp-can.c |  2 +-
 hw/net/fsl_etsec/etsec.c     |  2 +-
 hw/net/lan9118.c             |  2 +-
 hw/rtc/exynos4210_rtc.c      |  4 ++--
 hw/timer/allwinner-a10-pit.c |  2 +-
 hw/timer/altera_timer.c      |  2 +-
 hw/timer/arm_timer.c         |  2 +-
 hw/timer/digic-timer.c       |  2 +-
 hw/timer/etraxfs_timer.c     |  6 +++---
 hw/timer/exynos4210_mct.c    |  6 +++---
 hw/timer/exynos4210_pwm.c    |  2 +-
 hw/timer/grlib_gptimer.c     |  2 +-
 hw/timer/imx_epit.c          |  4 ++--
 hw/timer/imx_gpt.c           |  2 +-
 hw/timer/mss-timer.c         |  2 +-
 hw/timer/sh_timer.c          |  2 +-
 hw/timer/slavio_timer.c      |  2 +-
 hw/timer/xilinx_timer.c      |  2 +-
 tests/unit/ptimer-test.c     |  6 +++---
 25 files changed, 44 insertions(+), 36 deletions(-)

diff --git a/include/hw/ptimer.h b/include/hw/ptimer.h
index c443218475b..4dc02b0de47 100644
--- a/include/hw/ptimer.h
+++ b/include/hw/ptimer.h
@@ -33,9 +33,17 @@
  * to stderr when the guest attempts to enable the timer.
  */
 
-/* The default ptimer policy retains backward compatibility with the legacy
- * timers. Custom policies are adjusting the default one. Consider providing
- * a correct policy for your timer.
+/*
+ * The 'legacy' ptimer policy retains backward compatibility with the
+ * traditional ptimer behaviour from before policy flags were introduced.
+ * It has several weird behaviours which don't match typical hardware
+ * timer behaviour. For a new device using ptimers, you should not
+ * use PTIMER_POLICY_LEGACY, but instead check the actual behaviour
+ * that you need and specify the right set of policy flags to get that.
+ *
+ * If you are overhauling an existing device that uses PTIMER_POLICY_LEGACY
+ * and are in a position to check or test the real hardware behaviour,
+ * consider updating it to specify the right policy flags.
  *
  * The rough edges of the default policy:
  *  - Starting to run with a period = 0 emits error message and stops the
@@ -54,7 +62,7 @@
  *    since the last period, effectively restarting the timer with a
  *    counter = counter value at the moment of change (.i.e. one less).
  */
-#define PTIMER_POLICY_DEFAULT               0
+#define PTIMER_POLICY_LEGACY                0
 
 /* Periodic timer counter stays with "0" for a one period before wrapping
  * around.  */
diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 7c840fb4283..b65c020115a 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -464,7 +464,7 @@ static void mv88w8618_timer_init(SysBusDevice *dev, mv88w8618_timer_state *s,
     sysbus_init_irq(dev, &s->irq);
     s->freq = freq;
 
-    s->ptimer = ptimer_init(mv88w8618_timer_tick, s, PTIMER_POLICY_DEFAULT);
+    s->ptimer = ptimer_init(mv88w8618_timer_tick, s, PTIMER_POLICY_LEGACY);
 }
 
 static uint64_t mv88w8618_pit_read(void *opaque, hwaddr offset,
diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index bc383f53cca..cbb8f0f1696 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -552,7 +552,7 @@ static void xilinx_axidma_realize(DeviceState *dev, Error **errp)
 
         st->dma = s;
         st->nr = i;
-        st->ptimer = ptimer_init(timer_hit, st, PTIMER_POLICY_DEFAULT);
+        st->ptimer = ptimer_init(timer_hit, st, PTIMER_POLICY_LEGACY);
         ptimer_transaction_begin(st->ptimer);
         ptimer_set_freq(st->ptimer, s->freqhz);
         ptimer_transaction_commit(st->ptimer);
diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
index 60ada3286b4..1ce52ea5a2b 100644
--- a/hw/dma/xlnx_csu_dma.c
+++ b/hw/dma/xlnx_csu_dma.c
@@ -666,7 +666,7 @@ static void xlnx_csu_dma_realize(DeviceState *dev, Error **errp)
     sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
 
     s->src_timer = ptimer_init(xlnx_csu_dma_src_timeout_hit,
-                               s, PTIMER_POLICY_DEFAULT);
+                               s, PTIMER_POLICY_LEGACY);
 
     s->attr = MEMTXATTRS_UNSPECIFIED;
 
diff --git a/hw/m68k/mcf5206.c b/hw/m68k/mcf5206.c
index 6d93d761a5e..2ab1b4f0593 100644
--- a/hw/m68k/mcf5206.c
+++ b/hw/m68k/mcf5206.c
@@ -152,7 +152,7 @@ static m5206_timer_state *m5206_timer_init(qemu_irq irq)
     m5206_timer_state *s;
 
     s = g_new0(m5206_timer_state, 1);
-    s->timer = ptimer_init(m5206_timer_trigger, s, PTIMER_POLICY_DEFAULT);
+    s->timer = ptimer_init(m5206_timer_trigger, s, PTIMER_POLICY_LEGACY);
     s->irq = irq;
     m5206_timer_reset(s);
     return s;
diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
index 655207e393d..be1033f84f8 100644
--- a/hw/m68k/mcf5208.c
+++ b/hw/m68k/mcf5208.c
@@ -197,7 +197,7 @@ static void mcf5208_sys_init(MemoryRegion *address_space, qemu_irq *pic)
     /* Timers.  */
     for (i = 0; i < 2; i++) {
         s = g_new0(m5208_timer_state, 1);
-        s->timer = ptimer_init(m5208_timer_trigger, s, PTIMER_POLICY_DEFAULT);
+        s->timer = ptimer_init(m5208_timer_trigger, s, PTIMER_POLICY_LEGACY);
         memory_region_init_io(&s->iomem, NULL, &m5208_timer_ops, s,
                               "m5208-timer", 0x00004000);
         memory_region_add_subregion(address_space, 0xfc080000 + 0x4000 * i,
diff --git a/hw/net/can/xlnx-zynqmp-can.c b/hw/net/can/xlnx-zynqmp-can.c
index 22bb8910fa8..82ac48cee24 100644
--- a/hw/net/can/xlnx-zynqmp-can.c
+++ b/hw/net/can/xlnx-zynqmp-can.c
@@ -1079,7 +1079,7 @@ static void xlnx_zynqmp_can_realize(DeviceState *dev, Error **errp)
 
     /* Allocate a new timer. */
     s->can_timer = ptimer_init(xlnx_zynqmp_can_ptimer_cb, s,
-                               PTIMER_POLICY_DEFAULT);
+                               PTIMER_POLICY_LEGACY);
 
     ptimer_transaction_begin(s->can_timer);
 
diff --git a/hw/net/fsl_etsec/etsec.c b/hw/net/fsl_etsec/etsec.c
index 6d50c395439..4e6cc708dec 100644
--- a/hw/net/fsl_etsec/etsec.c
+++ b/hw/net/fsl_etsec/etsec.c
@@ -393,7 +393,7 @@ static void etsec_realize(DeviceState *dev, Error **errp)
                               object_get_typename(OBJECT(dev)), dev->id, etsec);
     qemu_format_nic_info_str(qemu_get_queue(etsec->nic), etsec->conf.macaddr.a);
 
-    etsec->ptimer = ptimer_init(etsec_timer_hit, etsec, PTIMER_POLICY_DEFAULT);
+    etsec->ptimer = ptimer_init(etsec_timer_hit, etsec, PTIMER_POLICY_LEGACY);
     ptimer_transaction_begin(etsec->ptimer);
     ptimer_set_freq(etsec->ptimer, 100);
     ptimer_transaction_commit(etsec->ptimer);
diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
index 6aff424cbe5..456ae38107b 100644
--- a/hw/net/lan9118.c
+++ b/hw/net/lan9118.c
@@ -1363,7 +1363,7 @@ static void lan9118_realize(DeviceState *dev, Error **errp)
     s->pmt_ctrl = 1;
     s->txp = &s->tx_packet;
 
-    s->timer = ptimer_init(lan9118_tick, s, PTIMER_POLICY_DEFAULT);
+    s->timer = ptimer_init(lan9118_tick, s, PTIMER_POLICY_LEGACY);
     ptimer_transaction_begin(s->timer);
     ptimer_set_freq(s->timer, 10000);
     ptimer_set_limit(s->timer, 0xffff, 1);
diff --git a/hw/rtc/exynos4210_rtc.c b/hw/rtc/exynos4210_rtc.c
index ae67641de66..d1620c7a2ac 100644
--- a/hw/rtc/exynos4210_rtc.c
+++ b/hw/rtc/exynos4210_rtc.c
@@ -564,14 +564,14 @@ static void exynos4210_rtc_init(Object *obj)
     Exynos4210RTCState *s = EXYNOS4210_RTC(obj);
     SysBusDevice *dev = SYS_BUS_DEVICE(obj);
 
-    s->ptimer = ptimer_init(exynos4210_rtc_tick, s, PTIMER_POLICY_DEFAULT);
+    s->ptimer = ptimer_init(exynos4210_rtc_tick, s, PTIMER_POLICY_LEGACY);
     ptimer_transaction_begin(s->ptimer);
     ptimer_set_freq(s->ptimer, RTC_BASE_FREQ);
     exynos4210_rtc_update_freq(s, 0);
     ptimer_transaction_commit(s->ptimer);
 
     s->ptimer_1Hz = ptimer_init(exynos4210_rtc_1Hz_tick,
-                                s, PTIMER_POLICY_DEFAULT);
+                                s, PTIMER_POLICY_LEGACY);
     ptimer_transaction_begin(s->ptimer_1Hz);
     ptimer_set_freq(s->ptimer_1Hz, RTC_BASE_FREQ);
     ptimer_transaction_commit(s->ptimer_1Hz);
diff --git a/hw/timer/allwinner-a10-pit.c b/hw/timer/allwinner-a10-pit.c
index c3fc2a4daaf..971f78462ab 100644
--- a/hw/timer/allwinner-a10-pit.c
+++ b/hw/timer/allwinner-a10-pit.c
@@ -275,7 +275,7 @@ static void a10_pit_init(Object *obj)
 
         tc->container = s;
         tc->index = i;
-        s->timer[i] = ptimer_init(a10_pit_timer_cb, tc, PTIMER_POLICY_DEFAULT);
+        s->timer[i] = ptimer_init(a10_pit_timer_cb, tc, PTIMER_POLICY_LEGACY);
     }
 }
 
diff --git a/hw/timer/altera_timer.c b/hw/timer/altera_timer.c
index c6e02d2b5a7..0f1f54206a3 100644
--- a/hw/timer/altera_timer.c
+++ b/hw/timer/altera_timer.c
@@ -185,7 +185,7 @@ static void altera_timer_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    t->ptimer = ptimer_init(timer_hit, t, PTIMER_POLICY_DEFAULT);
+    t->ptimer = ptimer_init(timer_hit, t, PTIMER_POLICY_LEGACY);
     ptimer_transaction_begin(t->ptimer);
     ptimer_set_freq(t->ptimer, t->freq_hz);
     ptimer_transaction_commit(t->ptimer);
diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index 84cf2726bb3..69c88634722 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -180,7 +180,7 @@ static arm_timer_state *arm_timer_init(uint32_t freq)
     s->freq = freq;
     s->control = TIMER_CTRL_IE;
 
-    s->timer = ptimer_init(arm_timer_tick, s, PTIMER_POLICY_DEFAULT);
+    s->timer = ptimer_init(arm_timer_tick, s, PTIMER_POLICY_LEGACY);
     vmstate_register(NULL, VMSTATE_INSTANCE_ID_ANY, &vmstate_arm_timer, s);
     return s;
 }
diff --git a/hw/timer/digic-timer.c b/hw/timer/digic-timer.c
index e3aae4a45a4..d5186f44549 100644
--- a/hw/timer/digic-timer.c
+++ b/hw/timer/digic-timer.c
@@ -139,7 +139,7 @@ static void digic_timer_init(Object *obj)
 {
     DigicTimerState *s = DIGIC_TIMER(obj);
 
-    s->ptimer = ptimer_init(digic_timer_tick, NULL, PTIMER_POLICY_DEFAULT);
+    s->ptimer = ptimer_init(digic_timer_tick, NULL, PTIMER_POLICY_LEGACY);
 
     /*
      * FIXME: there is no documentation on Digic timer
diff --git a/hw/timer/etraxfs_timer.c b/hw/timer/etraxfs_timer.c
index 139e5b86a44..ecc2831bafb 100644
--- a/hw/timer/etraxfs_timer.c
+++ b/hw/timer/etraxfs_timer.c
@@ -370,9 +370,9 @@ static void etraxfs_timer_realize(DeviceState *dev, Error **errp)
     ETRAXTimerState *t = ETRAX_TIMER(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
 
-    t->ptimer_t0 = ptimer_init(timer0_hit, t, PTIMER_POLICY_DEFAULT);
-    t->ptimer_t1 = ptimer_init(timer1_hit, t, PTIMER_POLICY_DEFAULT);
-    t->ptimer_wd = ptimer_init(watchdog_hit, t, PTIMER_POLICY_DEFAULT);
+    t->ptimer_t0 = ptimer_init(timer0_hit, t, PTIMER_POLICY_LEGACY);
+    t->ptimer_t1 = ptimer_init(timer1_hit, t, PTIMER_POLICY_LEGACY);
+    t->ptimer_wd = ptimer_init(watchdog_hit, t, PTIMER_POLICY_LEGACY);
 
     sysbus_init_irq(sbd, &t->irq);
     sysbus_init_irq(sbd, &t->nmi);
diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
index d0e53439968..e175a9f5b9b 100644
--- a/hw/timer/exynos4210_mct.c
+++ b/hw/timer/exynos4210_mct.c
@@ -1503,17 +1503,17 @@ static void exynos4210_mct_init(Object *obj)
 
     /* Global timer */
     s->g_timer.ptimer_frc = ptimer_init(exynos4210_gfrc_event, s,
-                                        PTIMER_POLICY_DEFAULT);
+                                        PTIMER_POLICY_LEGACY);
     memset(&s->g_timer.reg, 0, sizeof(struct gregs));
 
     /* Local timers */
     for (i = 0; i < 2; i++) {
         s->l_timer[i].tick_timer.ptimer_tick =
             ptimer_init(exynos4210_ltick_event, &s->l_timer[i],
-                        PTIMER_POLICY_DEFAULT);
+                        PTIMER_POLICY_LEGACY);
         s->l_timer[i].ptimer_frc =
             ptimer_init(exynos4210_lfrc_event, &s->l_timer[i],
-                        PTIMER_POLICY_DEFAULT);
+                        PTIMER_POLICY_LEGACY);
         s->l_timer[i].id = i;
     }
 
diff --git a/hw/timer/exynos4210_pwm.c b/hw/timer/exynos4210_pwm.c
index 220088120ee..02924a9e5b3 100644
--- a/hw/timer/exynos4210_pwm.c
+++ b/hw/timer/exynos4210_pwm.c
@@ -400,7 +400,7 @@ static void exynos4210_pwm_init(Object *obj)
         sysbus_init_irq(dev, &s->timer[i].irq);
         s->timer[i].ptimer = ptimer_init(exynos4210_pwm_tick,
                                          &s->timer[i],
-                                         PTIMER_POLICY_DEFAULT);
+                                         PTIMER_POLICY_LEGACY);
         s->timer[i].id = i;
         s->timer[i].parent = s;
     }
diff --git a/hw/timer/grlib_gptimer.c b/hw/timer/grlib_gptimer.c
index d5118901097..5c4923c1e09 100644
--- a/hw/timer/grlib_gptimer.c
+++ b/hw/timer/grlib_gptimer.c
@@ -383,7 +383,7 @@ static void grlib_gptimer_realize(DeviceState *dev, Error **errp)
 
         timer->unit   = unit;
         timer->ptimer = ptimer_init(grlib_gptimer_hit, timer,
-                                    PTIMER_POLICY_DEFAULT);
+                                    PTIMER_POLICY_LEGACY);
         timer->id     = i;
 
         /* One IRQ line for each timer */
diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index ebd58254d15..2bf8c754b21 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -347,9 +347,9 @@ static void imx_epit_realize(DeviceState *dev, Error **errp)
                           0x00001000);
     sysbus_init_mmio(sbd, &s->iomem);
 
-    s->timer_reload = ptimer_init(imx_epit_reload, s, PTIMER_POLICY_DEFAULT);
+    s->timer_reload = ptimer_init(imx_epit_reload, s, PTIMER_POLICY_LEGACY);
 
-    s->timer_cmp = ptimer_init(imx_epit_cmp, s, PTIMER_POLICY_DEFAULT);
+    s->timer_cmp = ptimer_init(imx_epit_cmp, s, PTIMER_POLICY_LEGACY);
 }
 
 static void imx_epit_class_init(ObjectClass *klass, void *data)
diff --git a/hw/timer/imx_gpt.c b/hw/timer/imx_gpt.c
index 5c0d9a269ce..80b83026399 100644
--- a/hw/timer/imx_gpt.c
+++ b/hw/timer/imx_gpt.c
@@ -505,7 +505,7 @@ static void imx_gpt_realize(DeviceState *dev, Error **errp)
                           0x00001000);
     sysbus_init_mmio(sbd, &s->iomem);
 
-    s->timer = ptimer_init(imx_gpt_timeout, s, PTIMER_POLICY_DEFAULT);
+    s->timer = ptimer_init(imx_gpt_timeout, s, PTIMER_POLICY_LEGACY);
 }
 
 static void imx_gpt_class_init(ObjectClass *klass, void *data)
diff --git a/hw/timer/mss-timer.c b/hw/timer/mss-timer.c
index fe0ca905f3c..ee7438f1684 100644
--- a/hw/timer/mss-timer.c
+++ b/hw/timer/mss-timer.c
@@ -232,7 +232,7 @@ static void mss_timer_init(Object *obj)
     for (i = 0; i < NUM_TIMERS; i++) {
         struct Msf2Timer *st = &t->timers[i];
 
-        st->ptimer = ptimer_init(timer_hit, st, PTIMER_POLICY_DEFAULT);
+        st->ptimer = ptimer_init(timer_hit, st, PTIMER_POLICY_LEGACY);
         ptimer_transaction_begin(st->ptimer);
         ptimer_set_freq(st->ptimer, t->freq_hz);
         ptimer_transaction_commit(st->ptimer);
diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
index c72c327bfaf..77889397669 100644
--- a/hw/timer/sh_timer.c
+++ b/hw/timer/sh_timer.c
@@ -239,7 +239,7 @@ static void *sh_timer_init(uint32_t freq, int feat, qemu_irq irq)
     s->enabled = 0;
     s->irq = irq;
 
-    s->timer = ptimer_init(sh_timer_tick, s, PTIMER_POLICY_DEFAULT);
+    s->timer = ptimer_init(sh_timer_tick, s, PTIMER_POLICY_LEGACY);
 
     sh_timer_write(s, OFFSET_TCOR >> 2, s->tcor);
     sh_timer_write(s, OFFSET_TCNT >> 2, s->tcnt);
diff --git a/hw/timer/slavio_timer.c b/hw/timer/slavio_timer.c
index 90fdce4c442..8c4f6eb06b6 100644
--- a/hw/timer/slavio_timer.c
+++ b/hw/timer/slavio_timer.c
@@ -405,7 +405,7 @@ static void slavio_timer_init(Object *obj)
         tc->timer_index = i;
 
         s->cputimer[i].timer = ptimer_init(slavio_timer_irq, tc,
-                                           PTIMER_POLICY_DEFAULT);
+                                           PTIMER_POLICY_LEGACY);
         ptimer_transaction_begin(s->cputimer[i].timer);
         ptimer_set_period(s->cputimer[i].timer, TIMER_PERIOD);
         ptimer_transaction_commit(s->cputimer[i].timer);
diff --git a/hw/timer/xilinx_timer.c b/hw/timer/xilinx_timer.c
index 1eb927eb847..c7f17cd6460 100644
--- a/hw/timer/xilinx_timer.c
+++ b/hw/timer/xilinx_timer.c
@@ -223,7 +223,7 @@ static void xilinx_timer_realize(DeviceState *dev, Error **errp)
 
         xt->parent = t;
         xt->nr = i;
-        xt->ptimer = ptimer_init(timer_hit, xt, PTIMER_POLICY_DEFAULT);
+        xt->ptimer = ptimer_init(timer_hit, xt, PTIMER_POLICY_LEGACY);
         ptimer_transaction_begin(xt->ptimer);
         ptimer_set_freq(xt->ptimer, t->freq_hz);
         ptimer_transaction_commit(xt->ptimer);
diff --git a/tests/unit/ptimer-test.c b/tests/unit/ptimer-test.c
index 9176b96c1ce..a80ef5aff4c 100644
--- a/tests/unit/ptimer-test.c
+++ b/tests/unit/ptimer-test.c
@@ -768,8 +768,8 @@ static void add_ptimer_tests(uint8_t policy)
     char policy_name[256] = "";
     char *tmp;
 
-    if (policy == PTIMER_POLICY_DEFAULT) {
-        g_sprintf(policy_name, "default");
+    if (policy == PTIMER_POLICY_LEGACY) {
+        g_sprintf(policy_name, "legacy");
     }
 
     if (policy & PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD) {
@@ -862,7 +862,7 @@ static void add_ptimer_tests(uint8_t policy)
 static void add_all_ptimer_policies_comb_tests(void)
 {
     int last_policy = PTIMER_POLICY_TRIGGER_ONLY_ON_DECREMENT;
-    int policy = PTIMER_POLICY_DEFAULT;
+    int policy = PTIMER_POLICY_LEGACY;
 
     for (; policy < (last_policy << 1); policy++) {
         if ((policy & PTIMER_POLICY_TRIGGER_ONLY_ON_DECREMENT) &&
-- 
2.25.1


