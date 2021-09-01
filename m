Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EC33FD89C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 13:21:50 +0200 (CEST)
Received: from localhost ([::1]:33756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLOJR-00020w-3d
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 07:21:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcd-0007EE-Tq
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:36 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:38726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcX-00061q-JO
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:35 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 d22-20020a1c1d16000000b002e7777970f0so4387714wmd.3
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=x6V7x8vd8mmDx6jlbA/cnFhWbNTtQAMda9Ty8V7a0BY=;
 b=gPrSATXXCMc1Z0VGT5U2kIpDgDtYWhjL4j6xTdpOrJ5ym0QsdIya0UGRcv0lgQ9DAk
 uJbkru8MgdwZFmiK8Hgr9kj4F0VDUZ76SvTehgxG8bm5wuifUEmMqviaRhnyLA4mqeLM
 Rfktc4km7sEZQfPE5Ffhs8rPG5h+EE0YUJm3OmXYsTybNjFSnPAZeavL93Gphpfxgy2J
 LWNvxpmYkfWTiTj3hsqBD92MQD3w/+Wapz5kDoZb5swMax0D7t3rwvQpLBPy4VqLaOf9
 f81HcQ3cwsHxsyAshNZzOWUFEPm06OjrEhwX5bWNig0nZOH124mHRwzPcy+jpjOg1BH5
 0kag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x6V7x8vd8mmDx6jlbA/cnFhWbNTtQAMda9Ty8V7a0BY=;
 b=aapn0hJQ2Z0nCUsC4xkdwVtpCpYNgro6qb/o6nSQ7m9bSXqmTuH89QiEhvM7jLu+u6
 07TVWffK9VRbx3GpJDDF1kRBh2MF3vvZJqoM36FkZO2K4IR3EvsDkV9TCuTyBPPV1Z8u
 nH7I4HtCbzmXJw2W/ft8FSW1D9wFva4IvuMs6rWgcKB+tLVRQNXfHjsQUti4/EEbTJC8
 HYkNlxRTHs4rX0vTpLBTiogV+y1cy3FsFsdAUusDArxQ9dvyajeFgylLu3bnVkBEPnU9
 CKKltgIZM9678n+o6M3ZMYOxWs6zPxWUpb/tli4J0QoL96xeLwJko6+DgRvlfivAYCZj
 F0bA==
X-Gm-Message-State: AOAM532XjqgxXQGyUSkJQZaS1jhC951G+xt29XQ0C+rtpfnk9Cx9qIz8
 mZSFEBz2E+cJcV3/VsY8bnw8quUdM2dxlQ==
X-Google-Smtp-Source: ABdhPJxsyV1tgajtaup0B3GlWB3/smSwkZsCgr+/v1JwZH65K96gkRVwaXga4jvHfF8Di2mXGflMXQ==
X-Received: by 2002:a1c:3b56:: with SMTP id i83mr8413900wma.115.1630492647729; 
 Wed, 01 Sep 2021 03:37:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.37.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:37:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 47/51] hw/timer/armv7m_systick: Use clock inputs instead of
 system_clock_scale
Date: Wed,  1 Sep 2021 11:36:49 +0100
Message-Id: <20210901103653.13435-48-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
References: <20210901103653.13435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

Now that all users of the systick devices wire up the clock inputs,
use those instead of the system_clock_scale and the hardwired 1MHz
value for the reference clock.

This will fix various board models where we were incorrectly
providing a 1MHz reference clock instead of some other value or
instead of providing no reference clock at all.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
Message-id: 20210812093356.1946-22-peter.maydell@linaro.org
---
 hw/timer/armv7m_systick.c | 112 ++++++++++++++++++++++++++++----------
 1 file changed, 84 insertions(+), 28 deletions(-)

diff --git a/hw/timer/armv7m_systick.c b/hw/timer/armv7m_systick.c
index e43f74114e8..21f6d0fd24f 100644
--- a/hw/timer/armv7m_systick.c
+++ b/hw/timer/armv7m_systick.c
@@ -18,25 +18,30 @@
 #include "qemu/timer.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "qapi/error.h"
 #include "trace.h"
 
-/* qemu timers run at 1GHz.   We want something closer to 1MHz.  */
-#define SYSTICK_SCALE 1000ULL
-
 #define SYSTICK_ENABLE    (1 << 0)
 #define SYSTICK_TICKINT   (1 << 1)
 #define SYSTICK_CLKSOURCE (1 << 2)
 #define SYSTICK_COUNTFLAG (1 << 16)
 
+#define SYSCALIB_NOREF (1U << 31)
+#define SYSCALIB_SKEW (1U << 30)
+#define SYSCALIB_TENMS ((1U << 24) - 1)
+
 int system_clock_scale;
 
-/* Conversion factor from qemu timer to SysTick frequencies.  */
-static inline int64_t systick_scale(SysTickState *s)
+static void systick_set_period_from_clock(SysTickState *s)
 {
+    /*
+     * Set the ptimer period from whichever clock is selected.
+     * Must be called from within a ptimer transaction block.
+     */
     if (s->control & SYSTICK_CLKSOURCE) {
-        return system_clock_scale;
+        ptimer_set_period_from_clock(s->ptimer, s->cpuclk, 1);
     } else {
-        return 1000;
+        ptimer_set_period_from_clock(s->ptimer, s->refclk, 1);
     }
 }
 
@@ -83,7 +88,28 @@ static MemTxResult systick_read(void *opaque, hwaddr addr, uint64_t *data,
         val = ptimer_get_count(s->ptimer);
         break;
     case 0xc: /* SysTick Calibration Value.  */
-        val = 10000;
+        /*
+         * In real hardware it is possible to make this register report
+         * a different value from what the reference clock is actually
+         * running at. We don't model that (which usually happens due
+         * to integration errors in the real hardware) and instead always
+         * report the theoretical correct value as described in the
+         * knowledgebase article at
+         * https://developer.arm.com/documentation/ka001325/latest
+         * If necessary, we could implement an extra QOM property on this
+         * device to force the STCALIB value to something different from
+         * the "correct" value.
+         */
+        if (!clock_has_source(s->refclk)) {
+            val = SYSCALIB_NOREF;
+            break;
+        }
+        val = clock_ns_to_ticks(s->refclk, 10 * SCALE_MS) - 1;
+        val &= SYSCALIB_TENMS;
+        if (clock_ticks_to_ns(s->refclk, val + 1) != 10 * SCALE_MS) {
+            /* report that tick count does not yield exactly 10ms */
+            val |= SYSCALIB_SKEW;
+        }
         break;
     default:
         val = 0;
@@ -115,6 +141,11 @@ static MemTxResult systick_write(void *opaque, hwaddr addr,
     {
         uint32_t oldval;
 
+        if (!clock_has_source(s->refclk)) {
+            /* This bit is always 1 if there is no external refclk */
+            value |= SYSTICK_CLKSOURCE;
+        }
+
         ptimer_transaction_begin(s->ptimer);
         oldval = s->control;
         s->control &= 0xfffffff8;
@@ -122,19 +153,14 @@ static MemTxResult systick_write(void *opaque, hwaddr addr,
 
         if ((oldval ^ value) & SYSTICK_ENABLE) {
             if (value & SYSTICK_ENABLE) {
-                /*
-                 * Always reload the period in case board code has
-                 * changed system_clock_scale. If we ever replace that
-                 * global with a more sensible API then we might be able
-                 * to set the period only when it actually changes.
-                 */
-                ptimer_set_period(s->ptimer, systick_scale(s));
                 ptimer_run(s->ptimer, 0);
             } else {
                 ptimer_stop(s->ptimer);
             }
-        } else if ((oldval ^ value) & SYSTICK_CLKSOURCE) {
-            ptimer_set_period(s->ptimer, systick_scale(s));
+        }
+
+        if ((oldval ^ value) & SYSTICK_CLKSOURCE) {
+            systick_set_period_from_clock(s);
         }
         ptimer_transaction_commit(s->ptimer);
         break;
@@ -177,20 +203,42 @@ static void systick_reset(DeviceState *dev)
 {
     SysTickState *s = SYSTICK(dev);
 
-    /*
-     * Forgetting to set system_clock_scale is always a board code
-     * bug. We can't check this earlier because for some boards
-     * (like stellaris) it is not yet configured at the point where
-     * the systick device is realized.
-     */
-    assert(system_clock_scale != 0);
-
     ptimer_transaction_begin(s->ptimer);
     s->control = 0;
+    if (!clock_has_source(s->refclk)) {
+        /* This bit is always 1 if there is no external refclk */
+        s->control |= SYSTICK_CLKSOURCE;
+    }
     ptimer_stop(s->ptimer);
     ptimer_set_count(s->ptimer, 0);
     ptimer_set_limit(s->ptimer, 0, 0);
-    ptimer_set_period(s->ptimer, systick_scale(s));
+    systick_set_period_from_clock(s);
+    ptimer_transaction_commit(s->ptimer);
+}
+
+static void systick_cpuclk_update(void *opaque, ClockEvent event)
+{
+    SysTickState *s = SYSTICK(opaque);
+
+    if (!(s->control & SYSTICK_CLKSOURCE)) {
+        /* currently using refclk, we can ignore cpuclk changes */
+    }
+
+    ptimer_transaction_begin(s->ptimer);
+    ptimer_set_period_from_clock(s->ptimer, s->cpuclk, 1);
+    ptimer_transaction_commit(s->ptimer);
+}
+
+static void systick_refclk_update(void *opaque, ClockEvent event)
+{
+    SysTickState *s = SYSTICK(opaque);
+
+    if (s->control & SYSTICK_CLKSOURCE) {
+        /* currently using cpuclk, we can ignore refclk changes */
+    }
+
+    ptimer_transaction_begin(s->ptimer);
+    ptimer_set_period_from_clock(s->ptimer, s->refclk, 1);
     ptimer_transaction_commit(s->ptimer);
 }
 
@@ -203,8 +251,10 @@ static void systick_instance_init(Object *obj)
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq);
 
-    s->refclk = qdev_init_clock_in(DEVICE(obj), "refclk", NULL, NULL, 0);
-    s->cpuclk = qdev_init_clock_in(DEVICE(obj), "cpuclk", NULL, NULL, 0);
+    s->refclk = qdev_init_clock_in(DEVICE(obj), "refclk",
+                                   systick_refclk_update, s, ClockUpdate);
+    s->cpuclk = qdev_init_clock_in(DEVICE(obj), "cpuclk",
+                                   systick_cpuclk_update, s, ClockUpdate);
 }
 
 static void systick_realize(DeviceState *dev, Error **errp)
@@ -215,6 +265,12 @@ static void systick_realize(DeviceState *dev, Error **errp)
                             PTIMER_POLICY_NO_COUNTER_ROUND_DOWN |
                             PTIMER_POLICY_NO_IMMEDIATE_RELOAD |
                             PTIMER_POLICY_TRIGGER_ONLY_ON_DECREMENT);
+
+    if (!clock_has_source(s->cpuclk)) {
+        error_setg(errp, "systick: cpuclk must be connected");
+        return;
+    }
+    /* It's OK not to connect the refclk */
 }
 
 static const VMStateDescription vmstate_systick = {
-- 
2.20.1


