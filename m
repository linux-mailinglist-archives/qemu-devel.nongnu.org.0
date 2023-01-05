Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E50C65F251
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:14:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTMN-0000qm-Cf; Thu, 05 Jan 2023 11:44:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTM4-0000c3-H7
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:36 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTM2-0007Q6-Go
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:36 -0500
Received: by mail-wm1-x32c.google.com with SMTP id o15so28448996wmr.4
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=v5vPLrOJerSouBci4jbMD3472GqmuD+aNRfNrDgOb8Y=;
 b=y3Sh5nuyHPjFBGOU7+t84fL56vXA61w2dFp8rLYnQVA82R2JGKbMzVlIW4oZlU+Ew3
 j5f2L4Q7mnjZH61YA5OC67Fdu5ULBsvkS5TYhhyfgY9HcrEOVOP+d6PGxB+zue4EBAeP
 iKj4S+pvAyRWLGLgglGtwbt00IOaRLs++Dt/xtnfh7Uskv0HAVMJEC4FHAQHKHHorE//
 wojRxMsAVheRozIrpI3FFPYiN3kT0A8lmk2cQShZCJ1xqTp6oUlHM9mv6S6DiGyAt0VJ
 S7G80++Q4Pi+YogyHFMkknDhE9AbayBXBoIwV59MvL8iiZ0vpLLBK5huyEXzfpT6ZtHt
 BnyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v5vPLrOJerSouBci4jbMD3472GqmuD+aNRfNrDgOb8Y=;
 b=oZYPwT34qyXWBfUHzDqoFAkZJhzumrme/kR7THIX7xlGjP0nUSkafq6KjQhlBXyr+7
 mqdF/GxRZ28hIHVlOEpC6xRlIXMNu/C4EJZwR8CA/xFI5u2JVnHzS7Vkftl3pZLSm8pB
 EElh4xVU0tPcYsg5I6X7vmYciI69X9kmYBzSAKUi6tUN9mr5UPE1N3BAiC8CbKbuPJDU
 y+54yRnsV3sNvIW1qX1nfmeIVNTxwzkHNNEej+bH0/1SiurUgsL7g5OyRi2DMLbQoF2O
 OFU0aZ3yX35t1+ZYkehxA7zDfadM21v8TQlJDTz2vvHSlm9oRMep5mG0hZxUJXgswh+N
 0ZSQ==
X-Gm-Message-State: AFqh2kqR2u4fpnRBmQoJ31JRMewAuFQZ/ISc+2paFZzdJ4GwNh7/ANKI
 kfpM13B0+mVlOYQ8gfgdDfsrJVmsqWLUH2kZ
X-Google-Smtp-Source: AMrXdXvAtkhHK52id369by/Z9ibwYLZo00Hf8MegVkOoxTDZFR0erdcnmLiewGwd517nown6RLDXfw==
X-Received: by 2002:a1c:790a:0:b0:3d6:b691:b814 with SMTP id
 l10-20020a1c790a000000b003d6b691b814mr36437655wme.1.1672937073171; 
 Thu, 05 Jan 2023 08:44:33 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 hg9-20020a05600c538900b003cf71b1f66csm3055547wmb.0.2023.01.05.08.44.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:44:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/34] hw/timer/imx_epit: fix compare timer handling
Date: Thu,  5 Jan 2023 16:44:00 +0000
Message-Id: <20230105164417.3994639-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105164417.3994639-1-peter.maydell@linaro.org>
References: <20230105164417.3994639-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

From: Axel Heider <axel.heider@hensoldt.net>

- fix #1263 for CR writes
- rework compare time handling
  - The compare timer has to run even if CR.OCIEN is not set,
    as SR.OCIF must be updated.
  - The compare timer fires exactly once when the
    compare value is less than the current value, but the
    reload values is less than the compare value.
  - The compare timer will never fire if the reload value is
    less than the compare value. Disable it in this case.

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
[PMM: fixed minor style nits]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/imx_epit.c | 192 ++++++++++++++++++++++++++------------------
 1 file changed, 116 insertions(+), 76 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index cf134961650..3a869782bcd 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -6,6 +6,7 @@
  * Originally written by Hans Jiang
  * Updated by Peter Chubb
  * Updated by Jean-Christophe Dubois <jcd@tribudubois.net>
+ * Updated by Axel Heider
  *
  * This code is licensed under GPL version 2 or later.  See
  * the COPYING file in the top-level directory.
@@ -151,33 +152,126 @@ static uint64_t imx_epit_read(void *opaque, hwaddr offset, unsigned size)
     return reg_value;
 }
 
-/* Must be called from ptimer_transaction_begin/commit block for s->timer_cmp */
-static void imx_epit_reload_compare_timer(IMXEPITState *s)
+/*
+ * Must be called from a ptimer_transaction_begin/commit block for
+ * s->timer_cmp, but outside of a transaction block of s->timer_reload,
+ * so the proper counter value is read.
+ */
+static void imx_epit_update_compare_timer(IMXEPITState *s)
 {
-    if ((s->cr & (CR_EN | CR_OCIEN)) == (CR_EN | CR_OCIEN))  {
-        /* if the compare feature is on and timers are running */
-        uint32_t tmp = ptimer_get_count(s->timer_reload);
-        uint64_t next;
-        if (tmp > s->cmp) {
-            /* It'll fire in this round of the timer */
-            next = tmp - s->cmp;
-        } else { /* catch it next time around */
-            next = tmp - s->cmp + ((s->cr & CR_RLD) ? EPIT_TIMER_MAX : s->lr);
+    uint64_t counter = 0;
+    bool is_oneshot = false;
+    /*
+     * The compare timer only has to run if the timer peripheral is active
+     * and there is an input clock, Otherwise it can be switched off.
+     */
+    bool is_active = (s->cr & CR_EN) && imx_epit_get_freq(s);
+    if (is_active) {
+        /*
+         * Calculate next timeout for compare timer. Reading the reload
+         * counter returns proper results only if pending transactions
+         * on it are committed here. Otherwise stale values are be read.
+         */
+        counter = ptimer_get_count(s->timer_reload);
+        uint64_t limit = ptimer_get_limit(s->timer_cmp);
+        /*
+         * The compare timer is a periodic timer if the limit is at least
+         * the compare value. Otherwise it may fire at most once in the
+         * current round.
+         */
+        bool is_oneshot = (limit >= s->cmp);
+        if (counter >= s->cmp) {
+            /* The compare timer fires in the current round. */
+            counter -= s->cmp;
+        } else if (!is_oneshot) {
+            /*
+             * The compare timer fires after a reload, as it is below the
+             * compare value already in this round. Note that the counter
+             * value calculated below can be above the 32-bit limit, which
+             * is legal here because the compare timer is an internal
+             * helper ptimer only.
+             */
+            counter += limit - s->cmp;
+        } else {
+            /*
+             * The compare timer won't fire in this round, and the limit is
+             * set to a value below the compare value. This practically means
+             * it will never fire, so it can be switched off.
+             */
+            is_active = false;
         }
-        ptimer_set_count(s->timer_cmp, next);
     }
+
+    /*
+     * Set the compare timer and let it run, or stop it. This is agnostic
+     * of CR.OCIEN bit, as this bit affects interrupt generation only. The
+     * compare timer needs to run even if no interrupts are to be generated,
+     * because the SR.OCIF bit must be updated also.
+     * Note that the timer might already be stopped or be running with
+     * counter values. However, finding out when an update is needed and
+     * when not is not trivial. It's much easier applying the setting again,
+     * as this does not harm either and the overhead is negligible.
+     */
+    if (is_active) {
+        ptimer_set_count(s->timer_cmp, counter);
+        ptimer_run(s->timer_cmp, is_oneshot ? 1 : 0);
+    } else {
+        ptimer_stop(s->timer_cmp);
+    }
+
 }
 
 static void imx_epit_write_cr(IMXEPITState *s, uint32_t value)
 {
-    uint32_t freq = 0;
     uint32_t oldcr = s->cr;
 
     s->cr = value & 0x03ffffff;
 
     if (s->cr & CR_SWR) {
-        /* handle the reset */
+        /*
+         * Reset clears CR.SWR again. It does not touch CR.EN, but the timers
+         * are still stopped because the input clock is disabled.
+         */
         imx_epit_reset(s, false);
+    } else {
+        uint32_t freq;
+        uint32_t toggled_cr_bits = oldcr ^ s->cr;
+        /* re-initialize the limits if CR.RLD has changed */
+        bool set_limit = toggled_cr_bits & CR_RLD;
+        /* set the counter if the timer got just enabled and CR.ENMOD is set */
+        bool is_switched_on = (toggled_cr_bits & s->cr) & CR_EN;
+        bool set_counter = is_switched_on && (s->cr & CR_ENMOD);
+
+        ptimer_transaction_begin(s->timer_cmp);
+        ptimer_transaction_begin(s->timer_reload);
+        freq = imx_epit_get_freq(s);
+        if (freq) {
+            ptimer_set_freq(s->timer_reload, freq);
+            ptimer_set_freq(s->timer_cmp, freq);
+        }
+
+        if (set_limit || set_counter) {
+            uint64_t limit = (s->cr & CR_RLD) ? s->lr : EPIT_TIMER_MAX;
+            ptimer_set_limit(s->timer_reload, limit, set_counter ? 1 : 0);
+            if (set_limit) {
+                ptimer_set_limit(s->timer_cmp, limit, 0);
+            }
+        }
+        /*
+         * If there is an input clock and the peripheral is enabled, then
+         * ensure the wall clock timer is ticking. Otherwise stop the timers.
+         * The compare timer will be updated later.
+         */
+        if (freq && (s->cr & CR_EN)) {
+            ptimer_run(s->timer_reload, 0);
+        } else {
+            ptimer_stop(s->timer_reload);
+        }
+        /* Commit changes to reload timer, so they can propagate. */
+        ptimer_transaction_commit(s->timer_reload);
+        /* Update compare timer based on the committed reload timer value. */
+        imx_epit_update_compare_timer(s);
+        ptimer_transaction_commit(s->timer_cmp);
     }
 
     /*
@@ -186,60 +280,6 @@ static void imx_epit_write_cr(IMXEPITState *s, uint32_t value)
      * - write to CR.EN or CR.OCIE
      */
     imx_epit_update_int(s);
-
-    /*
-     * TODO: could we 'break' here for reset? following operations appear
-     * to duplicate the work imx_epit_reset() already did.
-     */
-
-    ptimer_transaction_begin(s->timer_cmp);
-    ptimer_transaction_begin(s->timer_reload);
-
-    /*
-     * Update the frequency. In case of a reset the input clock was
-     * switched off, so this can be skipped.
-     */
-    if (!(s->cr & CR_SWR)) {
-        freq = imx_epit_get_freq(s);
-        if (freq) {
-            ptimer_set_freq(s->timer_reload, freq);
-            ptimer_set_freq(s->timer_cmp, freq);
-        }
-    }
-
-    if (freq && (s->cr & CR_EN) && !(oldcr & CR_EN)) {
-        if (s->cr & CR_ENMOD) {
-            if (s->cr & CR_RLD) {
-                ptimer_set_limit(s->timer_reload, s->lr, 1);
-                ptimer_set_limit(s->timer_cmp, s->lr, 1);
-            } else {
-                ptimer_set_limit(s->timer_reload, EPIT_TIMER_MAX, 1);
-                ptimer_set_limit(s->timer_cmp, EPIT_TIMER_MAX, 1);
-            }
-        }
-
-        imx_epit_reload_compare_timer(s);
-        ptimer_run(s->timer_reload, 0);
-        if (s->cr & CR_OCIEN) {
-            ptimer_run(s->timer_cmp, 0);
-        } else {
-            ptimer_stop(s->timer_cmp);
-        }
-    } else if (!(s->cr & CR_EN)) {
-        /* stop both timers */
-        ptimer_stop(s->timer_reload);
-        ptimer_stop(s->timer_cmp);
-    } else  if (s->cr & CR_OCIEN) {
-        if (!(oldcr & CR_OCIEN)) {
-            imx_epit_reload_compare_timer(s);
-            ptimer_run(s->timer_cmp, 0);
-        }
-    } else {
-        ptimer_stop(s->timer_cmp);
-    }
-
-    ptimer_transaction_commit(s->timer_cmp);
-    ptimer_transaction_commit(s->timer_reload);
 }
 
 static void imx_epit_write_sr(IMXEPITState *s, uint32_t value)
@@ -266,14 +306,10 @@ static void imx_epit_write_lr(IMXEPITState *s, uint32_t value)
         /* If IOVW bit is set then set the timer value */
         ptimer_set_count(s->timer_reload, s->lr);
     }
-    /*
-     * Commit the change to s->timer_reload, so it can propagate. Otherwise
-     * the timer interrupt may not fire properly. The commit must happen
-     * before calling imx_epit_reload_compare_timer(), which reads
-     * s->timer_reload internally again.
-     */
+    /* Commit the changes to s->timer_reload, so they can propagate. */
     ptimer_transaction_commit(s->timer_reload);
-    imx_epit_reload_compare_timer(s);
+    /* Update the compare timer based on the committed reload timer value. */
+    imx_epit_update_compare_timer(s);
     ptimer_transaction_commit(s->timer_cmp);
 }
 
@@ -281,8 +317,9 @@ static void imx_epit_write_cmp(IMXEPITState *s, uint32_t value)
 {
     s->cmp = value;
 
+    /* Update the compare timer based on the committed reload timer value. */
     ptimer_transaction_begin(s->timer_cmp);
-    imx_epit_reload_compare_timer(s);
+    imx_epit_update_compare_timer(s);
     ptimer_transaction_commit(s->timer_cmp);
 }
 
@@ -322,6 +359,9 @@ static void imx_epit_cmp(void *opaque)
 {
     IMXEPITState *s = IMX_EPIT(opaque);
 
+    /* The cmp ptimer can't be running when the peripheral is disabled */
+    assert(s->cr & CR_EN);
+
     DPRINTF("sr was %d\n", s->sr);
     /* Set interrupt status bit SR.OCIF and update the interrupt state */
     s->sr |= SR_OCIF;
-- 
2.25.1


