Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A271C3EA263
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 11:48:04 +0200 (CEST)
Received: from localhost ([::1]:44688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE7Jj-00032Z-Mq
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 05:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76c-0006Pa-80
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:30 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:43880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76V-00086G-RQ
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:29 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 k5-20020a05600c1c85b02902e699a4d20cso4055709wms.2
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 02:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HhvybS859OcUptSSqet3BEb/fRS6bALyy8jbPeiYrJ4=;
 b=XA/zqOI17ahAlXSqhm0owgAV/izId0SqYJfOHJO6ZSbt+PpjUFiVHWjVU5mJ5cNafX
 FE89Vi0/WO8fPiCTMLBi+kslKG5y41sVjIbYnFU+T6suHNAPehb5amgyBAGU5YHA5k0H
 Bs3zwU2kgJ0Frkyc+VPTqAB370+p/MmOd7jRdOcnKFQ8/lqpBfWqM+8YI9upYvG6tzOM
 ewPHxvcD7G5K1XgNoRXx2N9h3jU6/YrIz41hqCYg65pOLpUmhs64s+L7HkHbMbL5tjGH
 53QcYfZ+d5OgkK0C+ErdB+R5iwDbTG5VrcRvYOA1D96UMW9OOtAj6KAQrnEQD9BYtzMH
 cSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HhvybS859OcUptSSqet3BEb/fRS6bALyy8jbPeiYrJ4=;
 b=seYhIriGcvkNXwsFCYJrn96MsrtsB8mHxqQ9PJ2OSSnt1Ae60zg8IP+pijaeb9Qw8+
 eJxFiKR60P3AoUwlUj7DtJ6LM4eo9+uIbUrWYAY8OK9ErpDoPv96Dm2KHyu4K7hXNOVZ
 fiLe2dDDLy4z1B+mVv4nxSb8adTGBsYCioqHfBysGHwVJPDwXMj8EBIgyf/YeJfk5yF9
 F4UbpnCGbMrzw/OhRyay1cFBtg1uAuBaHrD4gR1sqks5WjJHXmBoeuRoVE7gwETwaEj4
 sTH4gjWfvGSYgXxofN7h0IqrKYfFKaP+Qs+IuBD5ibTL8VAZbsXKJmWGsVbk7hGxP/YE
 WgYg==
X-Gm-Message-State: AOAM532jmMFPymg9pXMSnu+Z476mv2PE/4CDUlTGBhy/xUyp7tXdpJmk
 ZnKvVL3wlSBvMwj3wFkdo7NZgA==
X-Google-Smtp-Source: ABdhPJxzWpirhQjdHhApTdnw3T7J4Qp0qwMqK/YKRA+yktx5EiBixk7Ix9MHKiswfI+KGDQilMb9cg==
X-Received: by 2002:a7b:c144:: with SMTP id z4mr14184996wmi.55.1628760862280; 
 Thu, 12 Aug 2021 02:34:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l38sm8158506wmp.15.2021.08.12.02.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 02:34:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 24/25] hw/timer/stellaris-gptm: Use Clock input
 instead of system_clock_scale
Date: Thu, 12 Aug 2021 10:33:55 +0100
Message-Id: <20210812093356.1946-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210812093356.1946-1-peter.maydell@linaro.org>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alexandre Iooss <erdnaxe@crans.org>
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
---
As noted in the comment, ideally we would convert the device to use
ptimer for its downcounter, which supports frequency changes while
the counter is running and would also allow reading the timer value.
But I don't want to make and test that change to a minor timer device
in a board model I wouldn't recommend anybody actually use; this
series is long enough as it is...
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


