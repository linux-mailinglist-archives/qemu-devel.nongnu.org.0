Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F9969B52D
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 23:01:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT8lf-0004dc-I2; Fri, 17 Feb 2023 16:59:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pT8lc-0004ce-IW
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 16:59:44 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pT8lZ-0000Tr-4W
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 16:59:44 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 ja15-20020a05600c556f00b003dc52fed235so1806461wmb.1
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 13:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i+w+Dcsqbsw/jsO7u1Bm2nAId84YIJDMk2FJbPBfsoU=;
 b=vArJ3BENvA//jLHEl/1JHS684jxNLsw6fGkmB0wHYCIoTrxxb/c4u5qCqk0LOuqHRI
 BnHv0USqvfktxa+IGDt9Xtei6kUlkTygMp3FuPnjgEz1j2P+bKaqs1TmajzVDLqoeCg+
 OMXkR1DaWCri+IIknrTcyIBIh4Bv6STuTCAUbQv2jP4Zf+eho5G01EuXhuN6mPAUmVD9
 yMW9azwbwSkfyYy3GTy2CVkgxgfBkfUc214gTB9KGWrAfBo/fXp9e4eZgawMSHCh0/jD
 dchu4JpTk5IY+HChe/NKr0CT9cQgG8ohNHfl0/wrfqPIEDg8lXtlI/fx7VpWRBtpRr+Z
 oeMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i+w+Dcsqbsw/jsO7u1Bm2nAId84YIJDMk2FJbPBfsoU=;
 b=W1fRCJ2RM/z0UfJxmtgsllpkglso4neYYMJJG1brrz4u+691N4n58VOb7y80Ga3IQg
 M0sOXcpBwIG+l5TWy0cxaz/Z4LjD36HuDUs6jZfpGKRVmVx866XKZrbhfJ+CTxK+zON8
 +t/weCPwuZS9irBChvLcqF3uSSsRF7WzxMD3TUr8kwDsYpQvpliqzpfSTeb1henaJrWA
 ROgzrXvBufMybwq87wCeEq9kr44nd9Qa0aIHY9DXr4e3GH6zwCEOswl6h6vKZlRP99ZL
 nNeEFEnhqnzpsbX8kE7r31Lqywuo1I9Q3cJXwFIXtk9npg4IaZTLB3BV9WuN4aITZ60n
 zZkg==
X-Gm-Message-State: AO0yUKXDLYaMyaN3v2hT1kpIcbNJVc61aertGZYiWQZo9EJBNua3TweW
 C99qgodfUy1rqJr7NAjz0npoFH/h9M3MMfti
X-Google-Smtp-Source: AK7set8iwEBgpyctJ3MsCD6Taa2eaxKP+fIahqtseg45fEwF8sLhuQI15Z9nkAvz47slhe4GJezI8A==
X-Received: by 2002:a05:600c:2b46:b0:3e0:1ab:cf2a with SMTP id
 e6-20020a05600c2b4600b003e001abcf2amr1581683wmf.39.1676671178021; 
 Fri, 17 Feb 2023 13:59:38 -0800 (PST)
Received: from localhost.localdomain
 (201.red-88-29-176.dynamicip.rima-tde.net. [88.29.176.201])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a05600c4e0400b003d1d5a83b2esm2713746wmq.35.2023.02.17.13.59.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 17 Feb 2023 13:59:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>, Vikram Garhwal <vikram.garhwal@amd.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-ppc@nongnu.org,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Thomas Huth <huth@tuxfamily.org>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Fabien Chouteau <chouteau@adacore.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Jason Wang <jasowang@redhat.com>, Beniamino Galvani <b.galvani@gmail.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Frederic Konrad <konrad.frederic@yahoo.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/2] hw/timer: Rename ptimer_state -> PTimer
Date: Fri, 17 Feb 2023 22:58:36 +0100
Message-Id: <20230217215836.40328-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230217141832.24777-1-philmd@linaro.org>
References: <20230217141832.24777-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Remove a pointless cast in ptimer_tick() and rename 'ptimer_state'
as 'PTimer' to follow the Structure naming convention.

See docs/devel/style.rst:

  Variables are lower_case_with_underscores; easy to type and
  read.  Structured type names are in CamelCase; harder to type
  but standing out.  Enum type names and function type names
  should also be in CamelCase.  Scalar type names are
  lower_case_with_underscores_ending_with_a_t, like the POSIX
  uint64_t and family.

Mechanical change doing:

  $ sed -i -e s/ptimer_state/PTimer/g \
      $(git grep -l ptimer_state)

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/musicpal.c                        |  2 +-
 hw/core/ptimer.c                         | 56 ++++++++++++------------
 hw/dma/xilinx_axidma.c                   |  2 +-
 hw/m68k/mcf5206.c                        |  2 +-
 hw/m68k/mcf5208.c                        |  2 +-
 hw/net/fsl_etsec/etsec.h                 |  2 +-
 hw/net/lan9118.c                         |  2 +-
 hw/rtc/exynos4210_rtc.c                  |  4 +-
 hw/timer/altera_timer.c                  |  2 +-
 hw/timer/arm_mptimer.c                   |  4 +-
 hw/timer/arm_timer.c                     |  2 +-
 hw/timer/etraxfs_timer.c                 |  8 ++--
 hw/timer/exynos4210_mct.c                |  8 ++--
 hw/timer/exynos4210_pwm.c                |  2 +-
 hw/timer/grlib_gptimer.c                 |  2 +-
 hw/timer/sh_timer.c                      |  2 +-
 hw/timer/slavio_timer.c                  |  2 +-
 hw/timer/xilinx_timer.c                  |  2 +-
 include/hw/display/xlnx_dp.h             |  2 +-
 include/hw/dma/xlnx_csu_dma.h            |  2 +-
 include/hw/net/xlnx-zynqmp-can.h         |  2 +-
 include/hw/ptimer.h                      | 34 +++++++-------
 include/hw/timer/allwinner-a10-pit.h     |  2 +-
 include/hw/timer/arm_mptimer.h           |  2 +-
 include/hw/timer/armv7m_systick.h        |  2 +-
 include/hw/timer/cmsdk-apb-dualtimer.h   |  2 +-
 include/hw/timer/cmsdk-apb-timer.h       |  2 +-
 include/hw/timer/digic-timer.h           |  2 +-
 include/hw/timer/imx_epit.h              |  4 +-
 include/hw/timer/imx_gpt.h               |  2 +-
 include/hw/timer/mss-timer.h             |  2 +-
 include/hw/watchdog/cmsdk-apb-watchdog.h |  2 +-
 include/hw/watchdog/wdt_imx2.h           |  4 +-
 include/qemu/typedefs.h                  |  2 +-
 tests/unit/ptimer-test.c                 | 22 +++++-----
 35 files changed, 98 insertions(+), 98 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 89b66606c3..63e0bbda95 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -435,7 +435,7 @@ static const TypeInfo mv88w8618_pic_info = {
 #define MP_BOARD_RESET_MAGIC    0x10000
 
 typedef struct mv88w8618_timer_state {
-    ptimer_state *ptimer;
+    PTimer *ptimer;
     uint32_t limit;
     int freq;
     qemu_irq irq;
diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index eb5ba1aff7..3ff49a0a04 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -19,7 +19,7 @@
 #define DELTA_ADJUST     1
 #define DELTA_NO_ADJUST -1
 
-struct ptimer_state
+struct PTimer
 {
     uint8_t enabled; /* 0 = disabled, 1 = periodic, 2 = oneshot.  */
     uint64_t limit;
@@ -43,12 +43,12 @@ struct ptimer_state
 };
 
 /* Use a bottom-half routine to avoid reentrancy issues.  */
-static void ptimer_trigger(ptimer_state *s)
+static void ptimer_trigger(PTimer *s)
 {
     s->callback(s->callback_opaque);
 }
 
-static void ptimer_reload(ptimer_state *s, int delta_adjust)
+static void ptimer_reload(PTimer *s, int delta_adjust)
 {
     uint32_t period_frac;
     uint64_t period;
@@ -73,7 +73,7 @@ static void ptimer_reload(ptimer_state *s, int delta_adjust)
     /*
      * Note that ptimer_trigger() might call the device callback function,
      * which can then modify timer state, so we must not cache any fields
-     * from ptimer_state until after we have called it.
+     * from PTimer state until after we have called it.
      */
     delta = s->delta;
     period = s->period;
@@ -154,7 +154,7 @@ static void ptimer_reload(ptimer_state *s, int delta_adjust)
 
 static void ptimer_tick(void *opaque)
 {
-    ptimer_state *s = (ptimer_state *)opaque;
+    PTimer *s = opaque;
     bool trigger = true;
 
     /*
@@ -198,7 +198,7 @@ static void ptimer_tick(void *opaque)
     ptimer_transaction_commit(s);
 }
 
-uint64_t ptimer_get_count(ptimer_state *s)
+uint64_t ptimer_get_count(PTimer *s)
 {
     uint64_t counter;
 
@@ -294,7 +294,7 @@ uint64_t ptimer_get_count(ptimer_state *s)
     return counter;
 }
 
-void ptimer_set_count(ptimer_state *s, uint64_t count)
+void ptimer_set_count(PTimer *s, uint64_t count)
 {
     assert(s->in_transaction);
     s->delta = count;
@@ -303,7 +303,7 @@ void ptimer_set_count(ptimer_state *s, uint64_t count)
     }
 }
 
-void ptimer_run(ptimer_state *s, int oneshot)
+void ptimer_run(PTimer *s, int oneshot)
 {
     bool was_disabled = !s->enabled;
 
@@ -323,7 +323,7 @@ void ptimer_run(ptimer_state *s, int oneshot)
 
 /* Pause a timer.  Note that this may cause it to "lose" time, even if it
    is immediately restarted.  */
-void ptimer_stop(ptimer_state *s)
+void ptimer_stop(PTimer *s)
 {
     assert(s->in_transaction);
 
@@ -337,7 +337,7 @@ void ptimer_stop(ptimer_state *s)
 }
 
 /* Set counter increment interval in nanoseconds.  */
-void ptimer_set_period(ptimer_state *s, int64_t period)
+void ptimer_set_period(PTimer *s, int64_t period)
 {
     assert(s->in_transaction);
     s->delta = ptimer_get_count(s);
@@ -349,7 +349,7 @@ void ptimer_set_period(ptimer_state *s, int64_t period)
 }
 
 /* Set counter increment interval from a Clock */
-void ptimer_set_period_from_clock(ptimer_state *s, const Clock *clk,
+void ptimer_set_period_from_clock(PTimer *s, const Clock *clk,
                                   unsigned int divisor)
 {
     /*
@@ -382,7 +382,7 @@ void ptimer_set_period_from_clock(ptimer_state *s, const Clock *clk,
 }
 
 /* Set counter frequency in Hz.  */
-void ptimer_set_freq(ptimer_state *s, uint32_t freq)
+void ptimer_set_freq(PTimer *s, uint32_t freq)
 {
     assert(s->in_transaction);
     s->delta = ptimer_get_count(s);
@@ -395,7 +395,7 @@ void ptimer_set_freq(ptimer_state *s, uint32_t freq)
 
 /* Set the initial countdown value.  If reload is nonzero then also set
    count = limit.  */
-void ptimer_set_limit(ptimer_state *s, uint64_t limit, int reload)
+void ptimer_set_limit(PTimer *s, uint64_t limit, int reload)
 {
     assert(s->in_transaction);
     s->limit = limit;
@@ -406,19 +406,19 @@ void ptimer_set_limit(ptimer_state *s, uint64_t limit, int reload)
     }
 }
 
-uint64_t ptimer_get_limit(ptimer_state *s)
+uint64_t ptimer_get_limit(PTimer *s)
 {
     return s->limit;
 }
 
-void ptimer_transaction_begin(ptimer_state *s)
+void ptimer_transaction_begin(PTimer *s)
 {
     assert(!s->in_transaction);
     s->in_transaction = true;
     s->need_reload = false;
 }
 
-void ptimer_transaction_commit(ptimer_state *s)
+void ptimer_transaction_commit(PTimer *s)
 {
     assert(s->in_transaction);
     /*
@@ -442,27 +442,27 @@ const VMStateDescription vmstate_ptimer = {
     .version_id = 1,
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
-        VMSTATE_UINT8(enabled, ptimer_state),
-        VMSTATE_UINT64(limit, ptimer_state),
-        VMSTATE_UINT64(delta, ptimer_state),
-        VMSTATE_UINT32(period_frac, ptimer_state),
-        VMSTATE_INT64(period, ptimer_state),
-        VMSTATE_INT64(last_event, ptimer_state),
-        VMSTATE_INT64(next_event, ptimer_state),
-        VMSTATE_TIMER_PTR(timer, ptimer_state),
+        VMSTATE_UINT8(enabled, PTimer),
+        VMSTATE_UINT64(limit, PTimer),
+        VMSTATE_UINT64(delta, PTimer),
+        VMSTATE_UINT32(period_frac, PTimer),
+        VMSTATE_INT64(period, PTimer),
+        VMSTATE_INT64(last_event, PTimer),
+        VMSTATE_INT64(next_event, PTimer),
+        VMSTATE_TIMER_PTR(timer, PTimer),
         VMSTATE_END_OF_LIST()
     }
 };
 
-ptimer_state *ptimer_init(ptimer_cb callback, void *callback_opaque,
+PTimer *ptimer_init(ptimer_cb callback, void *callback_opaque,
                           uint8_t policy_mask)
 {
-    ptimer_state *s;
+    PTimer *s;
 
     /* The callback function is mandatory. */
     assert(callback);
 
-    s = g_new0(ptimer_state, 1);
+    s = g_new0(PTimer, 1);
     s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, ptimer_tick, s);
     s->policy_mask = policy_mask;
     s->callback = callback;
@@ -478,7 +478,7 @@ ptimer_state *ptimer_init(ptimer_cb callback, void *callback_opaque,
     return s;
 }
 
-void ptimer_free(ptimer_state *s)
+void ptimer_free(PTimer *s)
 {
     timer_free(s->timer);
     g_free(s);
diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index 6030c76435..5710192da3 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -102,7 +102,7 @@ enum {
 
 struct Stream {
     struct XilinxAXIDMA *dma;
-    ptimer_state *ptimer;
+    PTimer *ptimer;
     qemu_irq irq;
 
     int nr;
diff --git a/hw/m68k/mcf5206.c b/hw/m68k/mcf5206.c
index 2ab1b4f059..61ed70f2b1 100644
--- a/hw/m68k/mcf5206.c
+++ b/hw/m68k/mcf5206.c
@@ -24,7 +24,7 @@ typedef struct {
     uint16_t trr;
     uint16_t tcr;
     uint16_t ter;
-    ptimer_state *timer;
+    PTimer *timer;
     qemu_irq irq;
     int irq_state;
 } m5206_timer_state;
diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
index be1033f84f..006a1ee5c5 100644
--- a/hw/m68k/mcf5208.c
+++ b/hw/m68k/mcf5208.c
@@ -43,7 +43,7 @@
 typedef struct {
     MemoryRegion iomem;
     qemu_irq irq;
-    ptimer_state *timer;
+    PTimer *timer;
     uint16_t pcsr;
     uint16_t pmr;
     uint16_t pcntr;
diff --git a/hw/net/fsl_etsec/etsec.h b/hw/net/fsl_etsec/etsec.h
index 9321a2f9a0..947dd063d8 100644
--- a/hw/net/fsl_etsec/etsec.h
+++ b/hw/net/fsl_etsec/etsec.h
@@ -141,7 +141,7 @@ struct eTSEC {
     uint16_t phy_control;
 
     /* Polling */
-    ptimer_state *ptimer;
+    PTimer *ptimer;
 
     /* Whether we should flush the rx queue when buffer becomes available. */
     bool need_flush;
diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
index f1cba55967..6356ab49d5 100644
--- a/hw/net/lan9118.c
+++ b/hw/net/lan9118.c
@@ -201,7 +201,7 @@ struct lan9118_state {
     NICConf conf;
     qemu_irq irq;
     MemoryRegion mmio;
-    ptimer_state *timer;
+    PTimer *timer;
 
     uint32_t irq_cfg;
     uint32_t int_sts;
diff --git a/hw/rtc/exynos4210_rtc.c b/hw/rtc/exynos4210_rtc.c
index 2b8a38a296..95a44be7a8 100644
--- a/hw/rtc/exynos4210_rtc.c
+++ b/hw/rtc/exynos4210_rtc.c
@@ -105,8 +105,8 @@ struct Exynos4210RTCState {
     uint32_t    reg_almyear;
     uint32_t    reg_curticcnt;
 
-    ptimer_state    *ptimer;        /* tick timer */
-    ptimer_state    *ptimer_1Hz;    /* clock timer */
+    PTimer      *ptimer;        /* tick timer */
+    PTimer      *ptimer_1Hz;    /* clock timer */
     uint32_t        freq;
 
     qemu_irq        tick_irq;   /* Time Tick Generator irq */
diff --git a/hw/timer/altera_timer.c b/hw/timer/altera_timer.c
index 0f1f54206a..5f2e411358 100644
--- a/hw/timer/altera_timer.c
+++ b/hw/timer/altera_timer.c
@@ -52,7 +52,7 @@ struct AlteraTimer {
     MemoryRegion  mmio;
     qemu_irq      irq;
     uint32_t      freq_hz;
-    ptimer_state *ptimer;
+    PTimer       *ptimer;
     uint32_t      regs[R_MAX];
 };
 
diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c
index 104c3d8af8..124eb43215 100644
--- a/hw/timer/arm_mptimer.c
+++ b/hw/timer/arm_mptimer.c
@@ -65,7 +65,7 @@ static inline uint32_t timerblock_scale(uint32_t control)
 }
 
 /* Must be called within a ptimer transaction block */
-static inline void timerblock_set_count(ptimer_state *timer,
+static inline void timerblock_set_count(PTimer *timer,
                                         uint32_t control, uint64_t *count)
 {
     /* PTimer would trigger interrupt for periodic timer when counter set
@@ -78,7 +78,7 @@ static inline void timerblock_set_count(ptimer_state *timer,
 }
 
 /* Must be called within a ptimer transaction block */
-static inline void timerblock_run(ptimer_state *timer,
+static inline void timerblock_run(PTimer *timer,
                                   uint32_t control, uint32_t load)
 {
     if ((control & 1) && ((control & 0xff00) || load != 0)) {
diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index 69c8863472..06063a8fb1 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -30,7 +30,7 @@
 #define TIMER_CTRL_ENABLE       (1 << 7)
 
 typedef struct {
-    ptimer_state *timer;
+    PTimer *timer;
     uint32_t control;
     uint32_t limit;
     int freq;
diff --git a/hw/timer/etraxfs_timer.c b/hw/timer/etraxfs_timer.c
index 2d6d92ef93..e3c8eb51d6 100644
--- a/hw/timer/etraxfs_timer.c
+++ b/hw/timer/etraxfs_timer.c
@@ -61,9 +61,9 @@ struct ETRAXTimerState {
     qemu_irq irq;
     qemu_irq nmi;
 
-    ptimer_state *ptimer_t0;
-    ptimer_state *ptimer_t1;
-    ptimer_state *ptimer_wd;
+    PTimer *ptimer_t0;
+    PTimer *ptimer_t1;
+    PTimer *ptimer_wd;
 
     uint32_t wd_hits;
 
@@ -151,7 +151,7 @@ static void update_ctrl(ETRAXTimerState *t, int tnum)
     unsigned int div;
     uint32_t ctrl;
 
-    ptimer_state *timer;
+    PTimer *timer;
 
     if (tnum == 0) {
         ctrl = t->rw_tmr0_ctrl;
diff --git a/hw/timer/exynos4210_mct.c b/hw/timer/exynos4210_mct.c
index c17b247da3..53206d697f 100644
--- a/hw/timer/exynos4210_mct.c
+++ b/hw/timer/exynos4210_mct.c
@@ -201,7 +201,7 @@ typedef struct {
     uint64_t count;            /* Value FRC was armed with */
     int32_t curr_comp;             /* Current comparator FRC is running to */
 
-    ptimer_state *ptimer_frc;                   /* FRC timer */
+    PTimer *ptimer_frc;        /* FRC timer */
 
 } Exynos4210MCTGT;
 
@@ -224,12 +224,12 @@ typedef struct {
         uint64_t    progress;       /* progress when counting by steps */
         uint64_t    count;          /* count to arm timer with */
 
-        ptimer_state *ptimer_tick;  /* timer for tick counter */
+        PTimer *ptimer_tick;        /* timer for tick counter */
     } tick_timer;
 
     /* use ptimer.c to represent count down timer */
 
-    ptimer_state *ptimer_frc;   /* timer for free running counter */
+    PTimer *ptimer_frc;             /* timer for free running counter */
 
     /* registers */
     struct lregs {
@@ -981,7 +981,7 @@ static void exynos4210_ltick_event(void *opaque)
     exynos4210_ltick_int_start(&s->tick_timer);
 }
 
-static void tx_ptimer_set_freq(ptimer_state *s, uint32_t freq)
+static void tx_ptimer_set_freq(PTimer *s, uint32_t freq)
 {
     /*
      * callers of exynos4210_mct_update_freq() never do anything
diff --git a/hw/timer/exynos4210_pwm.c b/hw/timer/exynos4210_pwm.c
index 3528d0f33a..4895a7770f 100644
--- a/hw/timer/exynos4210_pwm.c
+++ b/hw/timer/exynos4210_pwm.c
@@ -92,7 +92,7 @@ typedef struct {
     uint32_t    freq;           /* timer frequency */
 
     /* use ptimer.c to represent count down timer */
-    ptimer_state *ptimer;       /* timer  */
+    PTimer     *ptimer;         /* timer  */
 
     /* registers */
     uint32_t    reg_tcntb;      /* counter register buffer */
diff --git a/hw/timer/grlib_gptimer.c b/hw/timer/grlib_gptimer.c
index 8347e3047f..50963def2e 100644
--- a/hw/timer/grlib_gptimer.c
+++ b/hw/timer/grlib_gptimer.c
@@ -61,7 +61,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(GPTimerUnit, GRLIB_GPTIMER)
 typedef struct GPTimer     GPTimer;
 
 struct GPTimer {
-    ptimer_state *ptimer;
+    PTimer *ptimer;
 
     qemu_irq     irq;
     int          id;
diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
index 7788939766..713151b9a0 100644
--- a/hw/timer/sh_timer.c
+++ b/hw/timer/sh_timer.c
@@ -34,7 +34,7 @@
 #define OFFSET_TCPR   3
 
 typedef struct {
-    ptimer_state *timer;
+    PTimer *timer;
     uint32_t tcnt;
     uint32_t tcor;
     uint32_t tcr;
diff --git a/hw/timer/slavio_timer.c b/hw/timer/slavio_timer.c
index 8c4f6eb06b..569d590e4e 100644
--- a/hw/timer/slavio_timer.c
+++ b/hw/timer/slavio_timer.c
@@ -52,7 +52,7 @@
 
 typedef struct CPUTimerState {
     qemu_irq irq;
-    ptimer_state *timer;
+    PTimer *timer;
     uint32_t count, counthigh, reached;
     /* processor only */
     uint32_t run;
diff --git a/hw/timer/xilinx_timer.c b/hw/timer/xilinx_timer.c
index 32a9df69e0..359c1fad6e 100644
--- a/hw/timer/xilinx_timer.c
+++ b/hw/timer/xilinx_timer.c
@@ -52,7 +52,7 @@
 
 struct xlx_timer
 {
-    ptimer_state *ptimer;
+    PTimer *ptimer;
     void *parent;
     int nr; /* for debug.  */
 
diff --git a/include/hw/display/xlnx_dp.h b/include/hw/display/xlnx_dp.h
index f859da66f9..e50c955700 100644
--- a/include/hw/display/xlnx_dp.h
+++ b/include/hw/display/xlnx_dp.h
@@ -108,7 +108,7 @@ struct XlnxDPState {
     DPCDState *dpcd;
     I2CDDCState *edid;
 
-    ptimer_state *vblank;
+    PTimer *vblank;
 };
 
 #define TYPE_XLNX_DP "xlnx.v-dp"
diff --git a/include/hw/dma/xlnx_csu_dma.h b/include/hw/dma/xlnx_csu_dma.h
index 2b3a52c58b..84a7aac892 100644
--- a/include/hw/dma/xlnx_csu_dma.h
+++ b/include/hw/dma/xlnx_csu_dma.h
@@ -37,7 +37,7 @@ typedef struct XlnxCSUDMA {
     AddressSpace dma_as;
     qemu_irq irq;
     StreamSink *tx_dev; /* Used as generic StreamSink */
-    ptimer_state *src_timer;
+    PTimer *src_timer;
 
     uint16_t width;
     bool is_dst;
diff --git a/include/hw/net/xlnx-zynqmp-can.h b/include/hw/net/xlnx-zynqmp-can.h
index 2cacaf6181..88eb849d8d 100644
--- a/include/hw/net/xlnx-zynqmp-can.h
+++ b/include/hw/net/xlnx-zynqmp-can.h
@@ -72,7 +72,7 @@ typedef struct XlnxZynqMPCANState {
     Fifo32              tx_fifo;
     Fifo32              txhpb_fifo;
 
-    ptimer_state        *can_timer;
+    PTimer              *can_timer;
 } XlnxZynqMPCANState;
 
 #endif
diff --git a/include/hw/ptimer.h b/include/hw/ptimer.h
index 30b7eac7ad..baa38aa987 100644
--- a/include/hw/ptimer.h
+++ b/include/hw/ptimer.h
@@ -124,9 +124,9 @@ typedef void (*ptimer_cb)(void *opaque);
  * the ptimer state such that another ptimer expiry is triggered, then
  * the callback will be called a second time after the first call returns.
  */
-ptimer_state *ptimer_init(ptimer_cb callback,
-                          void *callback_opaque,
-                          uint8_t policy_mask);
+PTimer *ptimer_init(ptimer_cb callback,
+                    void *callback_opaque,
+                    uint8_t policy_mask);
 
 /**
  * ptimer_free - Free a ptimer
@@ -134,7 +134,7 @@ ptimer_state *ptimer_init(ptimer_cb callback,
  *
  * Free a ptimer created using ptimer_init().
  */
-void ptimer_free(ptimer_state *s);
+void ptimer_free(PTimer *s);
 
 /**
  * ptimer_transaction_begin() - Start a ptimer modification transaction
@@ -146,7 +146,7 @@ void ptimer_free(ptimer_state *s);
  * It is an error to call this function for a BH-based ptimer;
  * attempting to do this will trigger an assert.
  */
-void ptimer_transaction_begin(ptimer_state *s);
+void ptimer_transaction_begin(PTimer *s);
 
 /**
  * ptimer_transaction_commit() - Commit a ptimer modification transaction
@@ -156,7 +156,7 @@ void ptimer_transaction_begin(ptimer_state *s);
  * ptimer state now means that we should trigger the timer expiry
  * callback, it will be called directly.
  */
-void ptimer_transaction_commit(ptimer_state *s);
+void ptimer_transaction_commit(PTimer *s);
 
 /**
  * ptimer_set_period - Set counter increment interval in nanoseconds
@@ -170,7 +170,7 @@ void ptimer_transaction_commit(ptimer_state *s);
  * This function will assert if it is called outside a
  * ptimer_transaction_begin/commit block.
  */
-void ptimer_set_period(ptimer_state *s, int64_t period);
+void ptimer_set_period(PTimer *s, int64_t period);
 
 /**
  * ptimer_set_period_from_clock - Set counter increment from a Clock
@@ -191,7 +191,7 @@ void ptimer_set_period(ptimer_state *s, int64_t period);
  * This function will assert if it is called outside a
  * ptimer_transaction_begin/commit block.
  */
-void ptimer_set_period_from_clock(ptimer_state *s, const Clock *clock,
+void ptimer_set_period_from_clock(PTimer *s, const Clock *clock,
                                   unsigned int divisor);
 
 /**
@@ -208,7 +208,7 @@ void ptimer_set_period_from_clock(ptimer_state *s, const Clock *clock,
  * This function will assert if it is called outside a
  * ptimer_transaction_begin/commit block.
  */
-void ptimer_set_freq(ptimer_state *s, uint32_t freq);
+void ptimer_set_freq(PTimer *s, uint32_t freq);
 
 /**
  * ptimer_get_limit - Get the configured limit of the ptimer
@@ -223,7 +223,7 @@ void ptimer_set_freq(ptimer_state *s, uint32_t freq);
  * and set limit functions rather than needing to also track it
  * in their own state structure.
  */
-uint64_t ptimer_get_limit(ptimer_state *s);
+uint64_t ptimer_get_limit(PTimer *s);
 
 /**
  * ptimer_set_limit - Set the limit of the ptimer
@@ -238,7 +238,7 @@ uint64_t ptimer_get_limit(ptimer_state *s);
  * This function will assert if it is called outside a
  * ptimer_transaction_begin/commit block.
  */
-void ptimer_set_limit(ptimer_state *s, uint64_t limit, int reload);
+void ptimer_set_limit(PTimer *s, uint64_t limit, int reload);
 
 /**
  * ptimer_get_count - Get the current value of the ptimer
@@ -248,7 +248,7 @@ void ptimer_set_limit(ptimer_state *s, uint64_t limit, int reload);
  * return the correct value whether the counter is enabled or
  * disabled.
  */
-uint64_t ptimer_get_count(ptimer_state *s);
+uint64_t ptimer_get_count(PTimer *s);
 
 /**
  * ptimer_set_count - Set the current value of the ptimer
@@ -262,7 +262,7 @@ uint64_t ptimer_get_count(ptimer_state *s);
  * This function will assert if it is called outside a
  * ptimer_transaction_begin/commit block.
  */
-void ptimer_set_count(ptimer_state *s, uint64_t count);
+void ptimer_set_count(PTimer *s, uint64_t count);
 
 /**
  * ptimer_run - Start a ptimer counting
@@ -279,7 +279,7 @@ void ptimer_set_count(ptimer_state *s, uint64_t count);
  * This function will assert if it is called outside a
  * ptimer_transaction_begin/commit block.
  */
-void ptimer_run(ptimer_state *s, int oneshot);
+void ptimer_run(PTimer *s, int oneshot);
 
 /**
  * ptimer_stop - Stop a ptimer counting
@@ -294,15 +294,15 @@ void ptimer_run(ptimer_state *s, int oneshot);
  * This function will assert if it is called outside a
  * ptimer_transaction_begin/commit block.
  */
-void ptimer_stop(ptimer_state *s);
+void ptimer_stop(PTimer *s);
 
 extern const VMStateDescription vmstate_ptimer;
 
 #define VMSTATE_PTIMER(_field, _state) \
-    VMSTATE_STRUCT_POINTER_V(_field, _state, 1, vmstate_ptimer, ptimer_state)
+    VMSTATE_STRUCT_POINTER_V(_field, _state, 1, vmstate_ptimer, PTimer)
 
 #define VMSTATE_PTIMER_ARRAY(_f, _s, _n)                                \
     VMSTATE_ARRAY_OF_POINTER_TO_STRUCT(_f, _s, _n, 0,                   \
-                                       vmstate_ptimer, ptimer_state)
+                                       vmstate_ptimer, PTimer)
 
 #endif
diff --git a/include/hw/timer/allwinner-a10-pit.h b/include/hw/timer/allwinner-a10-pit.h
index 31054b231c..939fb103c8 100644
--- a/include/hw/timer/allwinner-a10-pit.h
+++ b/include/hw/timer/allwinner-a10-pit.h
@@ -47,7 +47,7 @@ struct AwA10PITState {
     SysBusDevice parent_obj;
     /*< public >*/
     qemu_irq irq[AW_A10_PIT_TIMER_NR];
-    ptimer_state * timer[AW_A10_PIT_TIMER_NR];
+    PTimer *timer[AW_A10_PIT_TIMER_NR];
     AwA10TimerContext timer_context[AW_A10_PIT_TIMER_NR];
     MemoryRegion iomem;
     uint32_t clk_freq[4];
diff --git a/include/hw/timer/arm_mptimer.h b/include/hw/timer/arm_mptimer.h
index 339cb9fe4b..174fbe6c88 100644
--- a/include/hw/timer/arm_mptimer.h
+++ b/include/hw/timer/arm_mptimer.h
@@ -30,7 +30,7 @@
 typedef struct {
     uint32_t control;
     uint32_t status;
-    ptimer_state *timer;
+    PTimer *timer;
     qemu_irq irq;
     MemoryRegion iomem;
 } TimerBlock;
diff --git a/include/hw/timer/armv7m_systick.h b/include/hw/timer/armv7m_systick.h
index deb1d66a51..074efb5fb2 100644
--- a/include/hw/timer/armv7m_systick.h
+++ b/include/hw/timer/armv7m_systick.h
@@ -39,7 +39,7 @@ struct SysTickState {
     uint32_t control;
     uint32_t reload;
     int64_t tick;
-    ptimer_state *ptimer;
+    PTimer *ptimer;
     MemoryRegion iomem;
     qemu_irq irq;
     Clock *refclk;
diff --git a/include/hw/timer/cmsdk-apb-dualtimer.h b/include/hw/timer/cmsdk-apb-dualtimer.h
index 5d8450eda1..1bab7e7961 100644
--- a/include/hw/timer/cmsdk-apb-dualtimer.h
+++ b/include/hw/timer/cmsdk-apb-dualtimer.h
@@ -37,7 +37,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(CMSDKAPBDualTimer, CMSDK_APB_DUALTIMER)
 /* One of the two identical timer modules in the dual-timer module */
 typedef struct CMSDKAPBDualTimerModule {
     CMSDKAPBDualTimer *parent;
-    ptimer_state *timer;
+    PTimer *timer;
     qemu_irq timerint;
     /*
      * We must track the guest LOAD and VALUE register state by hand
diff --git a/include/hw/timer/cmsdk-apb-timer.h b/include/hw/timer/cmsdk-apb-timer.h
index b61e254d4d..c3d68f1154 100644
--- a/include/hw/timer/cmsdk-apb-timer.h
+++ b/include/hw/timer/cmsdk-apb-timer.h
@@ -33,7 +33,7 @@ struct CMSDKAPBTimer {
     /*< public >*/
     MemoryRegion iomem;
     qemu_irq timerint;
-    ptimer_state *timer;
+    PTimer *timer;
     Clock *pclk;
 
     uint32_t ctrl;
diff --git a/include/hw/timer/digic-timer.h b/include/hw/timer/digic-timer.h
index 6c422a8451..38e363faf4 100644
--- a/include/hw/timer/digic-timer.h
+++ b/include/hw/timer/digic-timer.h
@@ -36,7 +36,7 @@ struct DigicTimerState {
     /*< public >*/
 
     MemoryRegion iomem;
-    ptimer_state *ptimer;
+    PTimer *ptimer;
 
     uint32_t control;
     uint32_t relvalue;
diff --git a/include/hw/timer/imx_epit.h b/include/hw/timer/imx_epit.h
index 55f2611f79..351af8dbdb 100644
--- a/include/hw/timer/imx_epit.h
+++ b/include/hw/timer/imx_epit.h
@@ -64,8 +64,8 @@ struct IMXEPITState {
     SysBusDevice parent_obj;
 
     /*< public >*/
-    ptimer_state *timer_reload;
-    ptimer_state *timer_cmp;
+    PTimer *timer_reload;
+    PTimer *timer_cmp;
     MemoryRegion  iomem;
     IMXCCMState  *ccm;
 
diff --git a/include/hw/timer/imx_gpt.h b/include/hw/timer/imx_gpt.h
index d5743778e0..377ce42611 100644
--- a/include/hw/timer/imx_gpt.h
+++ b/include/hw/timer/imx_gpt.h
@@ -91,7 +91,7 @@ struct IMXGPTState {
     SysBusDevice parent_obj;
 
     /*< public >*/
-    ptimer_state *timer;
+    PTimer *timer;
     MemoryRegion  iomem;
     IMXCCMState  *ccm;
 
diff --git a/include/hw/timer/mss-timer.h b/include/hw/timer/mss-timer.h
index 783cec30e3..48098e336c 100644
--- a/include/hw/timer/mss-timer.h
+++ b/include/hw/timer/mss-timer.h
@@ -45,7 +45,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(MSSTimerState, MSS_TIMER)
 #define R_TIM1_MAX        6
 
 struct Msf2Timer {
-    ptimer_state *ptimer;
+    PTimer *ptimer;
 
     uint32_t regs[R_TIM1_MAX];
     qemu_irq irq;
diff --git a/include/hw/watchdog/cmsdk-apb-watchdog.h b/include/hw/watchdog/cmsdk-apb-watchdog.h
index d02bfd0dd7..74bea181dd 100644
--- a/include/hw/watchdog/cmsdk-apb-watchdog.h
+++ b/include/hw/watchdog/cmsdk-apb-watchdog.h
@@ -52,7 +52,7 @@ struct CMSDKAPBWatchdog {
     MemoryRegion iomem;
     qemu_irq wdogint;
     bool is_luminary;
-    ptimer_state *timer;
+    PTimer *timer;
     Clock *wdogclk;
 
     uint32_t control;
diff --git a/include/hw/watchdog/wdt_imx2.h b/include/hw/watchdog/wdt_imx2.h
index d4cddac352..de1b73c752 100644
--- a/include/hw/watchdog/wdt_imx2.h
+++ b/include/hw/watchdog/wdt_imx2.h
@@ -70,8 +70,8 @@ struct IMX2WdtState {
     MemoryRegion mmio;
     qemu_irq irq;
 
-    ptimer_state *timer;
-    ptimer_state *itimer;
+    PTimer *timer;
+    PTimer *itimer;
 
     bool pretimeout_support;
     bool wicr_locked;
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index effcba4bca..e687ffe5fc 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -104,7 +104,7 @@ typedef struct PICCommonState PICCommonState;
 typedef struct PostcopyDiscardState PostcopyDiscardState;
 typedef struct Property Property;
 typedef struct PropertyInfo PropertyInfo;
-typedef struct ptimer_state ptimer_state;
+typedef struct PTimer PTimer;
 typedef struct QBool QBool;
 typedef struct QDict QDict;
 typedef struct QEMUBH QEMUBH;
diff --git a/tests/unit/ptimer-test.c b/tests/unit/ptimer-test.c
index 04b5f4e3d0..907fe75996 100644
--- a/tests/unit/ptimer-test.c
+++ b/tests/unit/ptimer-test.c
@@ -66,7 +66,7 @@ static void qemu_clock_step(uint64_t ns)
 static void check_set_count(gconstpointer arg)
 {
     const uint8_t *policy = arg;
-    ptimer_state *ptimer = ptimer_init(ptimer_trigger, NULL, *policy);
+    PTimer *ptimer = ptimer_init(ptimer_trigger, NULL, *policy);
 
     triggered = false;
 
@@ -81,7 +81,7 @@ static void check_set_count(gconstpointer arg)
 static void check_set_limit(gconstpointer arg)
 {
     const uint8_t *policy = arg;
-    ptimer_state *ptimer = ptimer_init(ptimer_trigger, NULL, *policy);
+    PTimer *ptimer = ptimer_init(ptimer_trigger, NULL, *policy);
 
     triggered = false;
 
@@ -104,7 +104,7 @@ static void check_set_limit(gconstpointer arg)
 static void check_oneshot(gconstpointer arg)
 {
     const uint8_t *policy = arg;
-    ptimer_state *ptimer = ptimer_init(ptimer_trigger, NULL, *policy);
+    PTimer *ptimer = ptimer_init(ptimer_trigger, NULL, *policy);
     bool no_round_down = (*policy & PTIMER_POLICY_NO_COUNTER_ROUND_DOWN);
 
     triggered = false;
@@ -222,7 +222,7 @@ static void check_oneshot(gconstpointer arg)
 static void check_periodic(gconstpointer arg)
 {
     const uint8_t *policy = arg;
-    ptimer_state *ptimer = ptimer_init(ptimer_trigger, NULL, *policy);
+    PTimer *ptimer = ptimer_init(ptimer_trigger, NULL, *policy);
     bool wrap_policy = (*policy & PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD);
     bool no_immediate_trigger = (*policy & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER);
     bool no_immediate_reload = (*policy & PTIMER_POLICY_NO_IMMEDIATE_RELOAD);
@@ -408,7 +408,7 @@ static void check_periodic(gconstpointer arg)
 static void check_on_the_fly_mode_change(gconstpointer arg)
 {
     const uint8_t *policy = arg;
-    ptimer_state *ptimer = ptimer_init(ptimer_trigger, NULL, *policy);
+    PTimer *ptimer = ptimer_init(ptimer_trigger, NULL, *policy);
     bool wrap_policy = (*policy & PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD);
     bool no_round_down = (*policy & PTIMER_POLICY_NO_COUNTER_ROUND_DOWN);
 
@@ -460,7 +460,7 @@ static void check_on_the_fly_mode_change(gconstpointer arg)
 static void check_on_the_fly_period_change(gconstpointer arg)
 {
     const uint8_t *policy = arg;
-    ptimer_state *ptimer = ptimer_init(ptimer_trigger, NULL, *policy);
+    PTimer *ptimer = ptimer_init(ptimer_trigger, NULL, *policy);
     bool no_round_down = (*policy & PTIMER_POLICY_NO_COUNTER_ROUND_DOWN);
 
     triggered = false;
@@ -496,7 +496,7 @@ static void check_on_the_fly_period_change(gconstpointer arg)
 static void check_on_the_fly_freq_change(gconstpointer arg)
 {
     const uint8_t *policy = arg;
-    ptimer_state *ptimer = ptimer_init(ptimer_trigger, NULL, *policy);
+    PTimer *ptimer = ptimer_init(ptimer_trigger, NULL, *policy);
     bool no_round_down = (*policy & PTIMER_POLICY_NO_COUNTER_ROUND_DOWN);
 
     triggered = false;
@@ -532,7 +532,7 @@ static void check_on_the_fly_freq_change(gconstpointer arg)
 static void check_run_with_period_0(gconstpointer arg)
 {
     const uint8_t *policy = arg;
-    ptimer_state *ptimer = ptimer_init(ptimer_trigger, NULL, *policy);
+    PTimer *ptimer = ptimer_init(ptimer_trigger, NULL, *policy);
 
     triggered = false;
 
@@ -551,7 +551,7 @@ static void check_run_with_period_0(gconstpointer arg)
 static void check_run_with_delta_0(gconstpointer arg)
 {
     const uint8_t *policy = arg;
-    ptimer_state *ptimer = ptimer_init(ptimer_trigger, NULL, *policy);
+    PTimer *ptimer = ptimer_init(ptimer_trigger, NULL, *policy);
     bool wrap_policy = (*policy & PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD);
     bool no_immediate_trigger = (*policy & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER);
     bool no_immediate_reload = (*policy & PTIMER_POLICY_NO_IMMEDIATE_RELOAD);
@@ -664,7 +664,7 @@ static void check_run_with_delta_0(gconstpointer arg)
 static void check_periodic_with_load_0(gconstpointer arg)
 {
     const uint8_t *policy = arg;
-    ptimer_state *ptimer = ptimer_init(ptimer_trigger, NULL, *policy);
+    PTimer *ptimer = ptimer_init(ptimer_trigger, NULL, *policy);
     bool continuous_trigger = (*policy & PTIMER_POLICY_CONTINUOUS_TRIGGER);
     bool no_immediate_trigger = (*policy & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER);
     bool trig_only_on_dec = (*policy & PTIMER_POLICY_TRIGGER_ONLY_ON_DECREMENT);
@@ -729,7 +729,7 @@ static void check_periodic_with_load_0(gconstpointer arg)
 static void check_oneshot_with_load_0(gconstpointer arg)
 {
     const uint8_t *policy = arg;
-    ptimer_state *ptimer = ptimer_init(ptimer_trigger, NULL, *policy);
+    PTimer *ptimer = ptimer_init(ptimer_trigger, NULL, *policy);
     bool no_immediate_trigger = (*policy & PTIMER_POLICY_NO_IMMEDIATE_TRIGGER);
     bool trig_only_on_dec = (*policy & PTIMER_POLICY_TRIGGER_ONLY_ON_DECREMENT);
 
-- 
2.38.1


