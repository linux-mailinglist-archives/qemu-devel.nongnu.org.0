Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F0A3FD86D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 13:06:57 +0200 (CEST)
Received: from localhost ([::1]:34346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLO52-00078b-Hw
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 07:06:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcV-0007BF-LD
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:27 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:42976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcO-0005w3-Qu
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:27 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 k20-20020a05600c0b5400b002e87ad6956eso1598551wmr.1
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dfANVgMVQgJeK7ytzWbU9YLsmaHGDdVsw9CUvopHHgE=;
 b=yQ7c0ECf1lPHmgzWy3PfQqJ+EuxQ1Xz0DoZM+Nx6Vejjq1Isy1aPgO4JTHwd8oCVfV
 eqU5nOVpL2Z4aDF1AxnGoI4ecgUjHj8Ncleub/9vYRFX75qFelbjjT/xf2pT1g5j6QO6
 PAANkf6X8iEGSCcNXZd9PUVuKnwv3MCCgFAob9VM1OwbjiqT761u4WiTHXou0bq5ukXP
 wkGM0x5Rq9CD9di26vfqvDO9vAJT7N+AW0xIiU4hCq5IGJoIPv1SZl1CIOv35U/zWroW
 dm+Jyq9klROuUGuG6lOALR6M9MLfDMTVIz1kDBl8MXt8VqUP+52WjT923mCArKt2F8C0
 dsWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dfANVgMVQgJeK7ytzWbU9YLsmaHGDdVsw9CUvopHHgE=;
 b=eDXIhVuH5IXjDkcll/J3KNg4uZhlTwgZrrfkAlOkjW0slpPbhaXnjlO4x1+2HYL73r
 MGUo8S4moR4exabrkBFyWcMmYYB0o1VcmAcANY8qRJCizHw6mjNpnbrYMenYy1AID9Ri
 Dkg5ChWkzE6kM2tDv0+Nr1ldBnE5Bvd6jre0FcqN4kZ4F5XXFCEqiGof+Jpr74zlsG9o
 aakKp5+98q5wV2ln+n743xr4LaWGWpzK7/k9WczNkd52VGCXRmlqNEf7HSMNWfwXcaqQ
 5IRbYPK6RELt2etuwQk8ZjM0ieAPw1BZ6Sxw5sMBr41L/jaO+GsQhqDFCGEyo/iGANSX
 rdVw==
X-Gm-Message-State: AOAM530JUDzIVc3pN2kpZlUU9XrPne0Ce9EK9HyPGtGi/fvb+sd6rg9H
 VCO1my+ZsG006ko+vm8DORBHMXyJgoSluw==
X-Google-Smtp-Source: ABdhPJykdh305koofHlMd0mNEhdTF5Ju1u0zReq6IbwJl82pMUQ1vzIsz5MBmcaQ/I/FY0rmEV+n2A==
X-Received: by 2002:a1c:e904:: with SMTP id q4mr9123514wmc.26.1630492639261;
 Wed, 01 Sep 2021 03:37:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.37.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:37:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 35/51] clock: Provide builtin multiplier/divider
Date: Wed,  1 Sep 2021 11:36:37 +0100
Message-Id: <20210901103653.13435-36-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
References: <20210901103653.13435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

It is quite common for a clock tree to involve possibly programmable
clock multipliers or dividers, where the frequency of a clock is for
instance divided by 8 to produce a slower clock to feed to a
particular device.

Currently we provide no convenient mechanism for modelling this.  You
can implement it by having an input Clock and an output Clock, and
manually setting the period of the output clock in the period-changed
callback of the input clock, but that's quite clunky.

This patch adds support in the Clock objects themselves for setting a
multiplier or divider.  The effect of setting this on a clock is that
when the clock's period is changed, all the children of the clock are
set to period * multiplier / divider, rather than being set to the
same period as the parent clock.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alexandre Iooss <erdnaxe@crans.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
Message-id: 20210812093356.1946-10-peter.maydell@linaro.org
---
 docs/devel/clocks.rst   | 23 +++++++++++++++++++++++
 include/hw/clock.h      | 29 +++++++++++++++++++++++++++++
 hw/core/clock-vmstate.c | 40 +++++++++++++++++++++++++++++++++++++++-
 hw/core/clock.c         | 31 +++++++++++++++++++++++++++----
 hw/core/trace-events    |  1 +
 5 files changed, 119 insertions(+), 5 deletions(-)

diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
index 956bd147ea0..675fbeb6abe 100644
--- a/docs/devel/clocks.rst
+++ b/docs/devel/clocks.rst
@@ -260,6 +260,29 @@ clocks get the new clock period value: *Clock 2*, *Clock 3* and *Clock 4*.
 It is not possible to disconnect a clock or to change the clock connection
 after it is connected.
 
+Clock multiplier and divider settings
+-------------------------------------
+
+By default, when clocks are connected together, the child
+clocks run with the same period as their source (parent) clock.
+The Clock API supports a built-in period multiplier/divider
+mechanism so you can configure a clock to make its children
+run at a different period from its own. If you call the
+``clock_set_mul_div()`` function you can specify the clock's
+multiplier and divider values. The children of that clock
+will all run with a period of ``parent_period * multiplier / divider``.
+For instance, if the clock has a frequency of 8MHz and you set its
+multiplier to 2 and its divider to 3, the child clocks will run
+at 12MHz.
+
+You can change the multiplier and divider of a clock at runtime,
+so you can use this to model clock controller devices which
+have guest-programmable frequency multipliers or dividers.
+
+Note that ``clock_set_mul_div()`` does not automatically call
+``clock_propagate()``. If you make a runtime change to the
+multiplier or divider you must call clock_propagate() yourself.
+
 Unconnected input clocks
 ------------------------
 
diff --git a/include/hw/clock.h b/include/hw/clock.h
index a7187eab95e..11f67fb9701 100644
--- a/include/hw/clock.h
+++ b/include/hw/clock.h
@@ -81,6 +81,10 @@ struct Clock {
     void *callback_opaque;
     unsigned int callback_events;
 
+    /* Ratio of the parent clock to run the child clocks at */
+    uint32_t multiplier;
+    uint32_t divider;
+
     /* Clocks are organized in a clock tree */
     Clock *source;
     QLIST_HEAD(, Clock) children;
@@ -350,4 +354,29 @@ static inline bool clock_is_enabled(const Clock *clk)
  */
 char *clock_display_freq(Clock *clk);
 
+/**
+ * clock_set_mul_div: set multiplier/divider for child clocks
+ * @clk: clock
+ * @multiplier: multiplier value
+ * @divider: divider value
+ *
+ * By default, a Clock's children will all run with the same period
+ * as their parent. This function allows you to adjust the multiplier
+ * and divider used to derive the child clock frequency.
+ * For example, setting a multiplier of 2 and a divider of 3
+ * will run child clocks with a period 2/3 of the parent clock,
+ * so if the parent clock is an 8MHz clock the children will
+ * be 12MHz.
+ *
+ * Setting the multiplier to 0 will stop the child clocks.
+ * Setting the divider to 0 is a programming error (diagnosed with
+ * an assertion failure).
+ * Setting a multiplier value that results in the child period
+ * overflowing is not diagnosed.
+ *
+ * Note that this function does not call clock_propagate(); the
+ * caller should do that if necessary.
+ */
+void clock_set_mul_div(Clock *clk, uint32_t multiplier, uint32_t divider);
+
 #endif /* QEMU_HW_CLOCK_H */
diff --git a/hw/core/clock-vmstate.c b/hw/core/clock-vmstate.c
index 260b13fc2c8..9d9174ffbd7 100644
--- a/hw/core/clock-vmstate.c
+++ b/hw/core/clock-vmstate.c
@@ -14,12 +14,50 @@
 #include "migration/vmstate.h"
 #include "hw/clock.h"
 
+static bool muldiv_needed(void *opaque)
+{
+    Clock *clk = opaque;
+
+    return clk->multiplier != 1 || clk->divider != 1;
+}
+
+static int clock_pre_load(void *opaque)
+{
+    Clock *clk = opaque;
+    /*
+     * The initial out-of-reset settings of the Clock might have been
+     * configured by the device to be different from what we set
+     * in clock_initfn(), so we must here set the default values to
+     * be used if they are not in the inbound migration state.
+     */
+    clk->multiplier = 1;
+    clk->divider = 1;
+
+    return 0;
+}
+
+const VMStateDescription vmstate_muldiv = {
+    .name = "clock/muldiv",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = muldiv_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(multiplier, Clock),
+        VMSTATE_UINT32(divider, Clock),
+    },
+};
+
 const VMStateDescription vmstate_clock = {
     .name = "clock",
     .version_id = 0,
     .minimum_version_id = 0,
+    .pre_load = clock_pre_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT64(period, Clock),
         VMSTATE_END_OF_LIST()
-    }
+    },
+    .subsections = (const VMStateDescription*[]) {
+        &vmstate_muldiv,
+        NULL
+    },
 };
diff --git a/hw/core/clock.c b/hw/core/clock.c
index fc5a99683f8..916875e07a2 100644
--- a/hw/core/clock.c
+++ b/hw/core/clock.c
@@ -64,6 +64,15 @@ bool clock_set(Clock *clk, uint64_t period)
     return true;
 }
 
+static uint64_t clock_get_child_period(Clock *clk)
+{
+    /*
+     * Return the period to be used for child clocks, which is the parent
+     * clock period adjusted for for multiplier and divider effects.
+     */
+    return muldiv64(clk->period, clk->multiplier, clk->divider);
+}
+
 static void clock_call_callback(Clock *clk, ClockEvent event)
 {
     /*
@@ -78,15 +87,16 @@ static void clock_call_callback(Clock *clk, ClockEvent event)
 static void clock_propagate_period(Clock *clk, bool call_callbacks)
 {
     Clock *child;
+    uint64_t child_period = clock_get_child_period(clk);
 
     QLIST_FOREACH(child, &clk->children, sibling) {
-        if (child->period != clk->period) {
+        if (child->period != child_period) {
             if (call_callbacks) {
                 clock_call_callback(child, ClockPreUpdate);
             }
-            child->period = clk->period;
+            child->period = child_period;
             trace_clock_update(CLOCK_PATH(child), CLOCK_PATH(clk),
-                               CLOCK_PERIOD_TO_HZ(clk->period),
+                               CLOCK_PERIOD_TO_HZ(child->period),
                                call_callbacks);
             if (call_callbacks) {
                 clock_call_callback(child, ClockUpdate);
@@ -110,7 +120,7 @@ void clock_set_source(Clock *clk, Clock *src)
 
     trace_clock_set_source(CLOCK_PATH(clk), CLOCK_PATH(src));
 
-    clk->period = src->period;
+    clk->period = clock_get_child_period(src);
     QLIST_INSERT_HEAD(&src->children, clk, sibling);
     clk->source = src;
     clock_propagate_period(clk, false);
@@ -133,10 +143,23 @@ char *clock_display_freq(Clock *clk)
     return freq_to_str(clock_get_hz(clk));
 }
 
+void clock_set_mul_div(Clock *clk, uint32_t multiplier, uint32_t divider)
+{
+    assert(divider != 0);
+
+    trace_clock_set_mul_div(CLOCK_PATH(clk), clk->multiplier, multiplier,
+                            clk->divider, divider);
+    clk->multiplier = multiplier;
+    clk->divider = divider;
+}
+
 static void clock_initfn(Object *obj)
 {
     Clock *clk = CLOCK(obj);
 
+    clk->multiplier = 1;
+    clk->divider = 1;
+
     QLIST_INIT(&clk->children);
 }
 
diff --git a/hw/core/trace-events b/hw/core/trace-events
index 360ddeb2c87..9b3ecce3b2f 100644
--- a/hw/core/trace-events
+++ b/hw/core/trace-events
@@ -34,3 +34,4 @@ clock_disconnect(const char *clk) "'%s'"
 clock_set(const char *clk, uint64_t old, uint64_t new) "'%s', %"PRIu64"Hz->%"PRIu64"Hz"
 clock_propagate(const char *clk) "'%s'"
 clock_update(const char *clk, const char *src, uint64_t hz, int cb) "'%s', src='%s', val=%"PRIu64"Hz cb=%d"
+clock_set_mul_div(const char *clk, uint32_t oldmul, uint32_t mul, uint32_t olddiv, uint32_t div) "'%s', mul: %u -> %u, div: %u -> %u"
-- 
2.20.1


