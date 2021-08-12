Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8623A3EA277
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 11:49:38 +0200 (CEST)
Received: from localhost ([::1]:51108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE7LF-0007HG-J1
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 05:49:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76Y-0006AT-GJ
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:26 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76S-00082i-Km
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:26 -0400
Received: by mail-wr1-x432.google.com with SMTP id k29so7338411wrd.7
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 02:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yxHixJ6WSk35tVi/GCaYOMNr6wprUi4sMKeyCo0OWKc=;
 b=HJhcN6LoqGzTv1EiUyCS3/QMXND98SVx0VhaXSAz1vXtB2TlDYYFBDgvYkTF+H5YGH
 RGRlXw5Q+qmg7QC50QSUPy3plfPS+G3KMDK2FtNP1S8FcPshi3BOmH3r1HCp+4LTrTJO
 fbhxbmJmBC2E2+f18W0rLt4IsTGEORyfh6MFx5U1yW86CSdhDXAfBgDL2bdkVel7WuE9
 47EkjFcbEDPsS8TVqHHcra3yqLBEr/Jd1Run8saPpsvGEQWD+YOCfq77++AB8SOhL4lT
 JfYNi7qPO1OuJZcML8hGCwfnRS+j/Cf5VgIFGLKFM6uTfr2GuRIS5SVPWKdeXzF8nndl
 6f0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yxHixJ6WSk35tVi/GCaYOMNr6wprUi4sMKeyCo0OWKc=;
 b=IZtZ9DcHSsJX7fwjtA9IX7gyQbOm9FFAMYud+4gRsq6sNR7A1Ni+rCjttu/9orlNyl
 1rwdPslguYpS7aHJqDrc0GBt++5RmZoSKkSO9sKPGh3qfr1lcrl8rczCGDMS31A0rsVp
 Sx0T6s81JHu3/03S+MChLE89xxC9lixft50kq9W74/SsFc6MVXhr371MPei/iCwwdrKy
 9f+vNok0TG/0Q9ZHUKAlh+Qt7O67t9lyEKTFQLFhLm9/taXVlFonJXvOCB4A1LETShhJ
 Y14H1StbPDsRWHprwc7qFMphv684Lk9pbBhkjC2YjsV/n4lCbhlj5H5nWjjLamNCRBAc
 NRzg==
X-Gm-Message-State: AOAM532iOSzSJ1fB5jQvib5g+uOv94ylYokarANevvlr6ZiDf3yOfZ8x
 9fguqkSanShDJvxrosdogPBtVKlPgvAr5g==
X-Google-Smtp-Source: ABdhPJx/HiZFf84MKUMR9oW5yORJyJHIrRXCzYPc9mx9QsWBb6GIQxh/cvalD/36GO2rMjU60qZTFQ==
X-Received: by 2002:a5d:4d8e:: with SMTP id b14mr2867938wru.422.1628760859103; 
 Thu, 12 Aug 2021 02:34:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l38sm8158506wmp.15.2021.08.12.02.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 02:34:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 21/25] hw/timer/armv7m_systick: Use clock inputs
 instead of system_clock_scale
Date: Thu, 12 Aug 2021 10:33:52 +0100
Message-Id: <20210812093356.1946-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210812093356.1946-1-peter.maydell@linaro.org>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Now that all users of the systick devices wire up the clock inputs,
use those instead of the system_clock_scale and the hardwired 1MHz
value for the reference clock.

This will fix various board models where we were incorrectly
providing a 1MHz reference clock instead of some other value or
instead of providing no reference clock at all.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/armv7m_systick.c | 110 ++++++++++++++++++++++++++++----------
 1 file changed, 82 insertions(+), 28 deletions(-)

diff --git a/hw/timer/armv7m_systick.c b/hw/timer/armv7m_systick.c
index e43f74114e8..39cca206cfd 100644
--- a/hw/timer/armv7m_systick.c
+++ b/hw/timer/armv7m_systick.c
@@ -18,25 +18,29 @@
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
 
@@ -83,7 +87,27 @@ static MemTxResult systick_read(void *opaque, hwaddr addr, uint64_t *data,
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
+        if (clock_ticks_to_ns(s->refclk, val + 1) != 10 * SCALE_MS) {
+            /* report that tick count does not yield exactly 10ms */
+            val |= SYSCALIB_SKEW;
+        }
         break;
     default:
         val = 0;
@@ -115,6 +139,11 @@ static MemTxResult systick_write(void *opaque, hwaddr addr,
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
@@ -122,19 +151,14 @@ static MemTxResult systick_write(void *opaque, hwaddr addr,
 
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
@@ -177,20 +201,42 @@ static void systick_reset(DeviceState *dev)
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
 
@@ -203,8 +249,10 @@ static void systick_instance_init(Object *obj)
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
@@ -215,6 +263,12 @@ static void systick_realize(DeviceState *dev, Error **errp)
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


