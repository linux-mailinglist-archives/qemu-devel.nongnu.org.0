Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBFE30A7AE
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 13:34:16 +0100 (CET)
Received: from localhost ([::1]:43604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6YPH-0008LP-MD
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 07:34:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6YLZ-0004JR-B7
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 07:30:25 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:54049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6YLT-0003aW-CR
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 07:30:23 -0500
Received: by mail-wm1-x329.google.com with SMTP id j18so12494557wmi.3
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 04:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=916HlTSKADFRU1RlvZ2Hog+CtRE+d62Lrf0BYSQTo90=;
 b=AF/5DHPwF1F8hn/N17gU3gnRHCjyrerOY9pBAsgSFxN35cZUBxCNxLnykHgeojVzlM
 Z42R61dSm6XhMnprVa4wwsWBNO7zp7fLfns1ooAn/m67MSzZXRNy6/xyY9b01q/gKO5s
 TOclRrAE3E84bQBGpXhqjqttnp6UHjhuxip1zL5c2jipKlgtC1z4Ijr3qcVeAcL1s7be
 dAq1jJZAW39NeyFY6cCQgT2z+f+LvDd4DubC7RL+027dPJR+0pTGVnilhHpY3mrZ8XHs
 0Ru+mu86NlBIsBzwqXeqzN4tvXGfvKYJ0KBIq065G2C4n/IP27nMeIm1gwLYwnj7lWJH
 XjDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=916HlTSKADFRU1RlvZ2Hog+CtRE+d62Lrf0BYSQTo90=;
 b=TCRtGlHd5+monNMI6y0yKDzBue7OvEZL/XYxxI/cC6l8f6Mz60OkfvPyPcPPjZ95jD
 OMz0el90mlFK8f0IDPAWvUnMLaIv3KtbZtiJRTxwPkEjiTKK+YYtQOHRCULHhNRjutc3
 5T6ZohsBUVvxX47DDBjdiWafs10S/ceFBU4gc/+S7DnO0rmNGR2busAUTZzV0wbURZ7u
 RrAeNAsoKrvdNm3FUkxyEj7RS+HtGG/RwWDfeD9QEitsgo9rwwwqt0T890/OZI0JgVO7
 ZlS6szh6lqPWyamDvg6P/oEO4/e99Mu1upMbzaAmD3tjtLAebvxFtK5i9t1HctBF3VLQ
 gSIg==
X-Gm-Message-State: AOAM531y0j6BxNXrTCw/0CRdBxfj/SxfTB3daySQpOK38rTnsn2oEFR8
 cjqjd9AVixvgqi5i48+LjkpSqw==
X-Google-Smtp-Source: ABdhPJyIt2rn8LgxZ9RHz8AtZdjZKpjTXJABLXJ1Ip+ScJTGUqJVRaddVzr+wDzMRELmLFa483uNaQ==
X-Received: by 2002:a1c:105:: with SMTP id 5mr7140365wmb.89.1612182617622;
 Mon, 01 Feb 2021 04:30:17 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q6sm20466278wmj.32.2021.02.01.04.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 04:30:16 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [RFC 1/4] clock: Add ClockEvent parameter to callbacks
Date: Mon,  1 Feb 2021 12:30:10 +0000
Message-Id: <20210201123013.32308-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210201123013.32308-1-peter.maydell@linaro.org>
References: <20210201123013.32308-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Luc Michel <luc@lmichel.fr>, Havard Skinnemoen <hskinnemoen@google.com>,
 Tyrone Ting <kfting@nuvoton.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Clock framework allows users to specify a callback which is
called after the clock's period has been updated.  Some users need to
also have a callback which is called before the clock period is
updated.

As the first step in adding support for notifying Clock users on
pre-update events, add an argument to the ClockCallback to specify
what event is being notified, and make the existing callback
implementations check this argument and only act if the event is
ClockUpdate.

Note that the documentation update renders correct the previously
incorrect claim in 'Adding a new clock' that callbacks "will be
explained in a following section".

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I thought about trying to add support for pre-update callbacks
in a way that didn't require changes to every current callback
user, but there aren't *that* many of them and I think this API
is nicer than having multiple separate callback pointers and
extra functions for "also set the pre-update callback" and so on.
---
 docs/devel/clocks.rst            | 35 ++++++++++++++++++++++++++++++--
 include/hw/clock.h               | 10 ++++++++-
 hw/arm/armsse.c                  |  8 ++++++--
 hw/char/cadence_uart.c           |  5 ++++-
 hw/char/ibex_uart.c              |  5 ++++-
 hw/char/pl011.c                  |  5 ++++-
 hw/core/clock.c                  |  2 +-
 hw/misc/bcm2835_cprman.c         | 20 ++++++++++++++----
 hw/misc/npcm7xx_clk.c            | 31 +++++++++++++++++++++++++---
 hw/misc/zynq_slcr.c              |  6 +++++-
 hw/timer/cmsdk-apb-dualtimer.c   |  5 ++++-
 hw/timer/cmsdk-apb-timer.c       |  5 ++++-
 hw/watchdog/cmsdk-apb-watchdog.c |  5 ++++-
 13 files changed, 122 insertions(+), 20 deletions(-)

diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
index c54bbb82409..8d3b456561f 100644
--- a/docs/devel/clocks.rst
+++ b/docs/devel/clocks.rst
@@ -113,7 +113,7 @@ output.
      * callback for the input clock (see "Callback on input clock
      * change" section below for more information).
      */
-    static void clk_in_callback(void *opaque);
+    static void clk_in_callback(void *opaque, ClockEvent event);
 
     /*
      * static array describing clocks:
@@ -153,6 +153,34 @@ nothing else to do. This value will be propagated to other clocks when
 connecting the clocks together and devices will fetch the right value during
 the first reset.
 
+Clock callbacks
+---------------
+
+You can give a clock a callback function in several ways:
+
+ * by passing it as an argument to ``qdev_init_clock_in()``
+ * as an argument to the ``QDEV_CLOCK_IN()`` macro initializing an
+   array to be passed to ``qdev_init_clocks()``
+ * by directly calling the ``clock_set_callback()`` function
+
+The callback function must be of this type:
+
+.. code-block:: c
+
+   typedef void ClockCallback(void *opaque, ClockEvent event);
+
+The ``opaque`` argument is the pointer passed to ``qdev_init_clock_in()``
+or ``clock_set_callback()``; for ``qdev_init_clocks()`` it is the
+``dev`` device pointer.
+
+The ``event`` argument specifies why the callback has been called.
+Callback functions should check this and only do something for
+specific events they need to handle, so that if in future different
+events are added the callback code doesn't need to be updated.
+The events currently supported are:
+
+ * ``ClockUpdate`` : called after the input clock's period has changed
+
 Retrieving clocks from a device
 -------------------------------
 
@@ -271,12 +299,15 @@ Here is an example:
 
 .. code-block:: c
 
-    void clock_callback(void *opaque) {
+    void clock_callback(void *opaque, ClockEvent event) {
         MyDeviceState *s = (MyDeviceState *) opaque;
         /*
          * 'opaque' is the argument passed to qdev_init_clock_in();
          * usually this will be the device state pointer.
          */
+        if (event != ClockUpdate) {
+            return;
+        }
 
         /* do something with the new period */
         fprintf(stdout, "device new period is %" PRIu64 "* 2^-32 ns\n",
diff --git a/include/hw/clock.h b/include/hw/clock.h
index e5f45e2626d..323f8d49fed 100644
--- a/include/hw/clock.h
+++ b/include/hw/clock.h
@@ -22,7 +22,15 @@
 #define TYPE_CLOCK "clock"
 OBJECT_DECLARE_SIMPLE_TYPE(Clock, CLOCK)
 
-typedef void ClockCallback(void *opaque);
+/*
+ * Argument to ClockCallback functions indicating why the callback
+ * has been called.
+ */
+typedef enum ClockEvent {
+    ClockUpdate, /* Clock period has just updated */
+} ClockEvent;
+
+typedef void ClockCallback(void *opaque, ClockEvent event);
 
 /*
  * clock store a value representing the clock's period in 2^-32ns unit.
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 26e1a8c95b6..cf0bd962ea2 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -230,9 +230,13 @@ static void armsse_forward_sec_resp_cfg(ARMSSE *s)
     qdev_connect_gpio_out(dev_splitter, 2, s->sec_resp_cfg_in);
 }
 
-static void armsse_mainclk_update(void *opaque)
+static void armsse_mainclk_update(void *opaque, ClockEvent event)
 {
     ARMSSE *s = ARM_SSE(opaque);
+
+    if (event != ClockUpdate) {
+        return;
+    }
     /*
      * Set system_clock_scale from our Clock input; this is what
      * controls the tick rate of the CPU SysTick timer.
@@ -1120,7 +1124,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->container);
 
     /* Set initial system_clock_scale from MAINCLK */
-    armsse_mainclk_update(s);
+    armsse_mainclk_update(s, ClockUpdate);
 }
 
 static void armsse_idau_check(IDAUInterface *ii, uint32_t address,
diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index c603e14012a..2900688fc24 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -519,10 +519,13 @@ static void cadence_uart_realize(DeviceState *dev, Error **errp)
                              uart_event, NULL, s, NULL, true);
 }
 
-static void cadence_uart_refclk_update(void *opaque)
+static void cadence_uart_refclk_update(void *opaque, ClockEvent event)
 {
     CadenceUARTState *s = opaque;
 
+    if (event != ClockUpdate) {
+        return;
+    }
     /* recompute uart's speed on clock change */
     uart_parameters_setup(s);
 }
diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c
index 89f1182c9bf..c90d4d69baf 100644
--- a/hw/char/ibex_uart.c
+++ b/hw/char/ibex_uart.c
@@ -396,10 +396,13 @@ static void ibex_uart_write(void *opaque, hwaddr addr,
     }
 }
 
-static void ibex_uart_clk_update(void *opaque)
+static void ibex_uart_clk_update(void *opaque, ClockEvent event)
 {
     IbexUartState *s = opaque;
 
+    if (event != ClockUpdate) {
+        return;
+    }
     /* recompute uart's speed on clock change */
     uint64_t baud = ibex_uart_get_baud(s);
 
diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index ea4a4e52356..d3040c0fab3 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -309,10 +309,13 @@ static void pl011_event(void *opaque, QEMUChrEvent event)
         pl011_put_fifo(opaque, 0x400);
 }
 
-static void pl011_clock_update(void *opaque)
+static void pl011_clock_update(void *opaque, ClockEvent event)
 {
     PL011State *s = PL011(opaque);
 
+    if (event != ClockUpdate) {
+        return;
+    }
     pl011_trace_baudrate_change(s);
 }
 
diff --git a/hw/core/clock.c b/hw/core/clock.c
index 76b5f468b6e..772d03a2eb5 100644
--- a/hw/core/clock.c
+++ b/hw/core/clock.c
@@ -73,7 +73,7 @@ static void clock_propagate_period(Clock *clk, bool call_callbacks)
                                CLOCK_PERIOD_TO_HZ(clk->period),
                                call_callbacks);
             if (call_callbacks && child->callback) {
-                child->callback(child->callback_opaque);
+                child->callback(child->callback_opaque, ClockUpdate);
             }
             clock_propagate_period(child, call_callbacks);
         }
diff --git a/hw/misc/bcm2835_cprman.c b/hw/misc/bcm2835_cprman.c
index 7e415a017c9..5df4bcdb22d 100644
--- a/hw/misc/bcm2835_cprman.c
+++ b/hw/misc/bcm2835_cprman.c
@@ -107,8 +107,11 @@ static void pll_update(CprmanPllState *pll)
     clock_update_hz(pll->out, freq);
 }
 
-static void pll_xosc_update(void *opaque)
+static void pll_xosc_update(void *opaque, ClockEvent event)
 {
+    if (event != ClockUpdate) {
+        return;
+    }
     pll_update(CPRMAN_PLL(opaque));
 }
 
@@ -209,8 +212,11 @@ static void pll_update_all_channels(BCM2835CprmanState *s,
     }
 }
 
-static void pll_channel_pll_in_update(void *opaque)
+static void pll_channel_pll_in_update(void *opaque, ClockEvent event)
 {
+    if (event != ClockUpdate) {
+        return;
+    }
     pll_channel_update(CPRMAN_PLL_CHANNEL(opaque));
 }
 
@@ -303,12 +309,15 @@ static void clock_mux_update(CprmanClockMuxState *mux)
     clock_update_hz(mux->out, freq);
 }
 
-static void clock_mux_src_update(void *opaque)
+static void clock_mux_src_update(void *opaque, ClockEvent event)
 {
     CprmanClockMuxState **backref = opaque;
     CprmanClockMuxState *s = *backref;
     CprmanClockMuxSource src = backref - s->backref;
 
+    if (event != ClockUpdate) {
+        return;
+    }
     if (FIELD_EX32(*s->reg_ctl, CM_CLOCKx_CTL, SRC) != src) {
         return;
     }
@@ -380,8 +389,11 @@ static void dsi0hsck_mux_update(CprmanDsi0HsckMuxState *s)
     clock_update(s->out, clock_get(src));
 }
 
-static void dsi0hsck_mux_in_update(void *opaque)
+static void dsi0hsck_mux_in_update(void *opaque, ClockEvent event)
 {
+    if (event != ClockUpdate) {
+        return;
+    }
     dsi0hsck_mux_update(CPRMAN_DSI0HSCK_MUX(opaque));
 }
 
diff --git a/hw/misc/npcm7xx_clk.c b/hw/misc/npcm7xx_clk.c
index 0bcae9ce957..935184d5482 100644
--- a/hw/misc/npcm7xx_clk.c
+++ b/hw/misc/npcm7xx_clk.c
@@ -586,15 +586,31 @@ static const DividerInitInfo divider_init_info_list[] = {
     },
 };
 
+static void npcm7xx_clk_update_pll_cb(void *opaque, ClockEvent event)
+{
+    if (event != ClockUpdate) {
+        return;
+    }
+    npcm7xx_clk_update_pll(opaque);
+}
+
 static void npcm7xx_clk_pll_init(Object *obj)
 {
     NPCM7xxClockPLLState *pll = NPCM7XX_CLOCK_PLL(obj);
 
     pll->clock_in = qdev_init_clock_in(DEVICE(pll), "clock-in",
-            npcm7xx_clk_update_pll, pll);
+            npcm7xx_clk_update_pll_cb, pll);
     pll->clock_out = qdev_init_clock_out(DEVICE(pll), "clock-out");
 }
 
+static void npcm7xx_clk_update_sel_cb(void *opaque, ClockEvent event)
+{
+    if (event != ClockUpdate) {
+        return;
+    }
+    npcm7xx_clk_update_sel(opaque);
+}
+
 static void npcm7xx_clk_sel_init(Object *obj)
 {
     int i;
@@ -603,16 +619,25 @@ static void npcm7xx_clk_sel_init(Object *obj)
     for (i = 0; i < NPCM7XX_CLK_SEL_MAX_INPUT; ++i) {
         sel->clock_in[i] = qdev_init_clock_in(DEVICE(sel),
                 g_strdup_printf("clock-in[%d]", i),
-                npcm7xx_clk_update_sel, sel);
+                npcm7xx_clk_update_sel_cb, sel);
     }
     sel->clock_out = qdev_init_clock_out(DEVICE(sel), "clock-out");
 }
+
+static void npcm7xx_clk_update_divider_cb(void *opaque, ClockEvent event)
+{
+    if (event != ClockUpdate) {
+        return;
+    }
+    npcm7xx_clk_update_divider(opaque);
+}
+
 static void npcm7xx_clk_divider_init(Object *obj)
 {
     NPCM7xxClockDividerState *div = NPCM7XX_CLOCK_DIVIDER(obj);
 
     div->clock_in = qdev_init_clock_in(DEVICE(div), "clock-in",
-            npcm7xx_clk_update_divider, div);
+            npcm7xx_clk_update_divider_cb, div);
     div->clock_out = qdev_init_clock_out(DEVICE(div), "clock-out");
 }
 
diff --git a/hw/misc/zynq_slcr.c b/hw/misc/zynq_slcr.c
index 66504a9d3ab..555d93ba50c 100644
--- a/hw/misc/zynq_slcr.c
+++ b/hw/misc/zynq_slcr.c
@@ -307,9 +307,13 @@ static void zynq_slcr_propagate_clocks(ZynqSLCRState *s)
     clock_propagate(s->uart1_ref_clk);
 }
 
-static void zynq_slcr_ps_clk_callback(void *opaque)
+static void zynq_slcr_ps_clk_callback(void *opaque, ClockEvent event)
 {
     ZynqSLCRState *s = (ZynqSLCRState *) opaque;
+
+    if (event != ClockUpdate) {
+        return;
+    }
     zynq_slcr_compute_clocks(s);
     zynq_slcr_propagate_clocks(s);
 }
diff --git a/hw/timer/cmsdk-apb-dualtimer.c b/hw/timer/cmsdk-apb-dualtimer.c
index ef49f5852d3..ebbc036dc89 100644
--- a/hw/timer/cmsdk-apb-dualtimer.c
+++ b/hw/timer/cmsdk-apb-dualtimer.c
@@ -449,11 +449,14 @@ static void cmsdk_apb_dualtimer_reset(DeviceState *dev)
     s->timeritop = 0;
 }
 
-static void cmsdk_apb_dualtimer_clk_update(void *opaque)
+static void cmsdk_apb_dualtimer_clk_update(void *opaque, ClockEvent event)
 {
     CMSDKAPBDualTimer *s = CMSDK_APB_DUALTIMER(opaque);
     int i;
 
+    if (event != ClockUpdate) {
+        return;
+    }
     for (i = 0; i < ARRAY_SIZE(s->timermod); i++) {
         CMSDKAPBDualTimerModule *m = &s->timermod[i];
         ptimer_transaction_begin(m->timer);
diff --git a/hw/timer/cmsdk-apb-timer.c b/hw/timer/cmsdk-apb-timer.c
index ee51ce3369c..06264f36d4e 100644
--- a/hw/timer/cmsdk-apb-timer.c
+++ b/hw/timer/cmsdk-apb-timer.c
@@ -204,10 +204,13 @@ static void cmsdk_apb_timer_reset(DeviceState *dev)
     ptimer_transaction_commit(s->timer);
 }
 
-static void cmsdk_apb_timer_clk_update(void *opaque)
+static void cmsdk_apb_timer_clk_update(void *opaque, ClockEvent event)
 {
     CMSDKAPBTimer *s = CMSDK_APB_TIMER(opaque);
 
+    if (event != ClockUpdate) {
+        return;
+    }
     ptimer_transaction_begin(s->timer);
     ptimer_set_period_from_clock(s->timer, s->pclk, 1);
     ptimer_transaction_commit(s->timer);
diff --git a/hw/watchdog/cmsdk-apb-watchdog.c b/hw/watchdog/cmsdk-apb-watchdog.c
index 302f1711738..7564e8b3326 100644
--- a/hw/watchdog/cmsdk-apb-watchdog.c
+++ b/hw/watchdog/cmsdk-apb-watchdog.c
@@ -310,10 +310,13 @@ static void cmsdk_apb_watchdog_reset(DeviceState *dev)
     ptimer_transaction_commit(s->timer);
 }
 
-static void cmsdk_apb_watchdog_clk_update(void *opaque)
+static void cmsdk_apb_watchdog_clk_update(void *opaque, ClockEvent event)
 {
     CMSDKAPBWatchdog *s = CMSDK_APB_WATCHDOG(opaque);
 
+    if (event != ClockUpdate) {
+        return;
+    }
     ptimer_transaction_begin(s->timer);
     ptimer_set_period_from_clock(s->timer, s->wdogclk, 1);
     ptimer_transaction_commit(s->timer);
-- 
2.20.1


