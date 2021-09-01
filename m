Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F25C83FD8A9
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 13:26:00 +0200 (CEST)
Received: from localhost ([::1]:43164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLONU-0008J5-1i
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 07:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNch-0007Mt-D0
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:39 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcZ-00064G-SA
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:39 -0400
Received: by mail-wr1-x430.google.com with SMTP id z4so3744260wrr.6
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=oXzYNU8QlO8kqMuNHYrgC4Z06DT/XfVcKLfiR2ZMvaM=;
 b=lNkLokfbEJi1ctgnwJNEK0QnZ8v/BPYj/4N2btHlsfyDPXKioKdGLJGJE2/+XMxxuX
 OMSH8cknBO88qH5Jd51+7v1+etc6t8jQmp0L9zExet8Y885IWOe4ZLhzblk0uGmdY+ea
 m50fhj9cvrsJNkK2m/GVHzpDS2Bpl2GgkFAWP4wJAENxSdOHtkWW4TbFSDLTT1g8GpLJ
 nJbVaiLu+9jkw+6u3dtYLxwxWFKmdptgoa4V6/E6xSly+aLPvtJT8roMvOxcpnJoUGBX
 XrDwB1AMeu1ZRzY+9GaCXAKrMTTxGyfDMTaYhEbd/A2BJI/fmetpV8Yb87F0lhg9cqoP
 D+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oXzYNU8QlO8kqMuNHYrgC4Z06DT/XfVcKLfiR2ZMvaM=;
 b=cZhNPDixozab9fHOD10e8Nt4NWovH1rOKzEWcR72v3MWEYw2QmcYfHAi+WF6prJ2L9
 AD/8vwB8qhykWKaUYuzp4+Fisxsb8VZIz/vLgWD7fKsHBy1zmlhZfk3zOA7jJu5u45Gw
 +OS+hRaROycgMonf3V0TwFQ6PUopcNEpLM/Fag2imJvJeWfcBW1xJDJHXJxPU12KdUIV
 P1N/wZ3pUxApCFiWC2f2xEqD5RHXEJdZNatTqD/JIp20Ub6d84IJrxpucBuoZfGRg5mH
 EbQ8cKiblbc/AknZGqtbL4EBS5FPSf8X9z/JjQ3og+zZGHz6NoaLDKrcxLG6Bytd1J9c
 MuWQ==
X-Gm-Message-State: AOAM532jRl47nWzfBZOz3n8ahzr9hW+LS3h5jHTKaFF35CP1AN+Vmfk2
 YTxwqzHZDXlVGj6o2qmTlIZ3yUCOE84Ivg==
X-Google-Smtp-Source: ABdhPJwdF06gYC4X433q4RJXEUtQn8FdarFhC6elNyY1z0I2r1Yo0uFdoeFm5E0BOW++nZI5aFm5aQ==
X-Received: by 2002:adf:fb8f:: with SMTP id a15mr37378163wrr.92.1630492649730; 
 Wed, 01 Sep 2021 03:37:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.37.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:37:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 50/51] hw/timer/stellaris-gptm: Use Clock input instead of
 system_clock_scale
Date: Wed,  1 Sep 2021 11:36:52 +0100
Message-Id: <20210901103653.13435-51-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
References: <20210901103653.13435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

The stellaris-gptm timer currently uses system_clock_scale for one of
its timer modes where the timer runs at the CPU clock rate.  Make it
use a Clock input instead.

We don't try to make the timer handle changes in the clock frequency
while the downcounter is running.  This is not a change in behaviour
from the previous system_clock_scale implementation -- we will pick
up the new frequency only when the downcounter hits zero.  Handling
dynamic clock changes when the counter is running would require state
that the current gptm implementation doesn't have.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
Message-id: 20210812093356.1946-25-peter.maydell@linaro.org
---
 include/hw/timer/stellaris-gptm.h |  3 +++
 hw/arm/stellaris.c                | 12 +++++++++---
 hw/timer/stellaris-gptm.c         | 26 ++++++++++++++++++++++----
 3 files changed, 34 insertions(+), 7 deletions(-)

diff --git a/include/hw/timer/stellaris-gptm.h b/include/hw/timer/stellaris-gptm.h
index b8fa43c94bf..fde1fc6f0c7 100644
--- a/include/hw/timer/stellaris-gptm.h
+++ b/include/hw/timer/stellaris-gptm.h
@@ -13,6 +13,7 @@
 #include "qom/object.h"
 #include "hw/sysbus.h"
 #include "hw/irq.h"
+#include "hw/clock.h"
 
 #define TYPE_STELLARIS_GPTM "stellaris-gptm"
 OBJECT_DECLARE_SIMPLE_TYPE(gptm_state, STELLARIS_GPTM)
@@ -22,6 +23,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(gptm_state, STELLARIS_GPTM)
  *  + sysbus MMIO region 0: register bank
  *  + sysbus IRQ 0: timer interrupt
  *  + unnamed GPIO output 0: trigger output for the ADC
+ *  + Clock input "clk": the 32-bit countdown timer runs at this speed
  */
 struct gptm_state {
     SysBusDevice parent_obj;
@@ -43,6 +45,7 @@ struct gptm_state {
     /* The timers have an alternate output used to trigger the ADC.  */
     qemu_irq trigger;
     qemu_irq irq;
+    Clock *clk;
 };
 
 #endif
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 8c547f146a9..3e7d1dabad1 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -1090,9 +1090,15 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
     }
     for (i = 0; i < 4; i++) {
         if (board->dc2 & (0x10000 << i)) {
-            dev = sysbus_create_simple(TYPE_STELLARIS_GPTM,
-                                       0x40030000 + i * 0x1000,
-                                       qdev_get_gpio_in(nvic, timer_irq[i]));
+            SysBusDevice *sbd;
+
+            dev = qdev_new(TYPE_STELLARIS_GPTM);
+            sbd = SYS_BUS_DEVICE(dev);
+            qdev_connect_clock_in(dev, "clk",
+                                  qdev_get_clock_out(ssys_dev, "SYSCLK"));
+            sysbus_realize_and_unref(sbd, &error_fatal);
+            sysbus_mmio_map(sbd, 0, 0x40030000 + i * 0x1000);
+            sysbus_connect_irq(sbd, 0, qdev_get_gpio_in(nvic, timer_irq[i]));
             /* TODO: This is incorrect, but we get away with it because
                the ADC output is only ever pulsed.  */
             qdev_connect_gpio_out(dev, 0, adc);
diff --git a/hw/timer/stellaris-gptm.c b/hw/timer/stellaris-gptm.c
index 7846fe5f84e..fd71c79be48 100644
--- a/hw/timer/stellaris-gptm.c
+++ b/hw/timer/stellaris-gptm.c
@@ -10,9 +10,10 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "qemu/timer.h"
+#include "qapi/error.h"
 #include "migration/vmstate.h"
+#include "hw/qdev-clock.h"
 #include "hw/timer/stellaris-gptm.h"
-#include "hw/timer/armv7m_systick.h" /* Needed only for system_clock_scale */
 
 static void gptm_update_irq(gptm_state *s)
 {
@@ -39,7 +40,7 @@ static void gptm_reload(gptm_state *s, int n, int reset)
         /* 32-bit CountDown.  */
         uint32_t count;
         count = s->load[0] | (s->load[1] << 16);
-        tick += (int64_t)count * system_clock_scale;
+        tick += clock_ticks_to_ns(s->clk, count);
     } else if (s->config == 1) {
         /* 32-bit RTC.  1Hz tick.  */
         tick += NANOSECONDS_PER_SECOND;
@@ -247,8 +248,8 @@ static const MemoryRegionOps gptm_ops = {
 
 static const VMStateDescription vmstate_stellaris_gptm = {
     .name = "stellaris_gptm",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(config, gptm_state),
         VMSTATE_UINT32_ARRAY(mode, gptm_state, 2),
@@ -263,6 +264,7 @@ static const VMStateDescription vmstate_stellaris_gptm = {
         VMSTATE_UINT32(rtc, gptm_state),
         VMSTATE_INT64_ARRAY(tick, gptm_state, 2),
         VMSTATE_TIMER_PTR_ARRAY(timer, gptm_state, 2),
+        VMSTATE_CLOCK(clk, gptm_state),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -281,11 +283,27 @@ static void stellaris_gptm_init(Object *obj)
     sysbus_init_mmio(sbd, &s->iomem);
 
     s->opaque[0] = s->opaque[1] = s;
+
+    /*
+     * TODO: in an ideal world we would model the effects of changing
+     * the input clock frequency while the countdown timer is active.
+     * The best way to do this would be to convert the device to use
+     * ptimer instead of hand-rolling its own timer. This would also
+     * make it easy to implement reading the current count from the
+     * TAR and TBR registers.
+     */
+    s->clk = qdev_init_clock_in(dev, "clk", NULL, NULL, 0);
 }
 
 static void stellaris_gptm_realize(DeviceState *dev, Error **errp)
 {
     gptm_state *s = STELLARIS_GPTM(dev);
+
+    if (!clock_has_source(s->clk)) {
+        error_setg(errp, "stellaris-gptm: clk must be connected");
+        return;
+    }
+
     s->timer[0] = timer_new_ns(QEMU_CLOCK_VIRTUAL, gptm_tick, &s->opaque[0]);
     s->timer[1] = timer_new_ns(QEMU_CLOCK_VIRTUAL, gptm_tick, &s->opaque[1]);
 }
-- 
2.20.1


