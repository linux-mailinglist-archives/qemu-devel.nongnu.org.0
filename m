Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F4D63F45D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 16:43:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0lhS-0005HF-Gm; Thu, 01 Dec 2022 10:42:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0lhP-0005GL-1T; Thu, 01 Dec 2022 10:42:07 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0lhM-0004wo-Ki; Thu, 01 Dec 2022 10:42:06 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id F139C11F9A3;
 Thu,  1 Dec 2022 15:42:01 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Sun, 20 Nov 2022 20:05:25 +0100
Subject: [PATCH qemu.git v3 8/8] hw/timer/imx_epit: fix compare timer handling
Message-ID: <166990932074.29941.8709118178538288040-8@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <166990932074.29941.8709118178538288040-0@git.sr.ht>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 36
X-Spam_score: 3.6
X-Spam_bar: +++
X-Spam_report: (3.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 FREEMAIL_FORGED_REPLYTO=2.095, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: ~axelheider <axelheider@gmx.de>
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
---
 hw/timer/imx_epit.c | 184 ++++++++++++++++++++++++++------------------
 1 file changed, 110 insertions(+), 74 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index cf13496165..663907f9cf 100644
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
@@ -151,95 +152,130 @@ static uint64_t imx_epit_read(void *opaque, hwaddr off=
set, unsigned size)
     return reg_value;
 }
=20
-/* Must be called from ptimer_transaction_begin/commit block for s->timer_cm=
p */
-static void imx_epit_reload_compare_timer(IMXEPITState *s)
+/*
+ * Must be called from a ptimer_transaction_begin/commit block for
+ * s->timer_cmp, but outside of a transaction block of s->timer_reload,
+ * so the proper counter value is read.
+ */
+static void imx_epit_update_compare_timer(IMXEPITState *s)
 {
-    if ((s->cr & (CR_EN | CR_OCIEN)) =3D=3D (CR_EN | CR_OCIEN))  {
-        /* if the compare feature is on and timers are running */
-        uint32_t tmp =3D ptimer_get_count(s->timer_reload);
-        uint64_t next;
-        if (tmp > s->cmp) {
-            /* It'll fire in this round of the timer */
-            next =3D tmp - s->cmp;
-        } else { /* catch it next time around */
-            next =3D tmp - s->cmp + ((s->cr & CR_RLD) ? EPIT_TIMER_MAX : s->=
lr);
+    uint64_t counter =3D 0;
+    bool is_oneshot =3D false;
+    /* The compare timer only has to run if the timer peripheral is active
+     * and there is an input clock, Otherwise it can be switched off.
+     */
+    bool is_active =3D (s->cr & CR_EN) && imx_epit_get_freq(s);
+    if (is_active) {
+        /*
+         * Calculate next timeout for compare timer. Reading the reload
+         * counter returns proper results only if pending transactions
+         * on it are committed here. Otherwise stale values are be read.
+         */
+        counter =3D ptimer_get_count(s->timer_reload);
+        uint64_t limit =3D ptimer_get_limit(s->timer_cmp);
+        /*
+         * The compare timer is a periodic timer if the limit is at least
+         * the compare value. Otherwise it may fire at most once in the
+         * current round.
+         */
+        bool is_oneshot =3D (limit >=3D s->cmp);
+        if (counter >=3D s->cmp) {
+            /* The compare timer fires in the current round. */
+            counter -=3D s->cmp;
+        } else if (!is_oneshot) {
+            /*
+             * The compare timer fires after a reload, as it below the
+             * compare value already in this round. Note that the counter
+             * value calculated below can be above the 32-bit limit, which
+             * is legal here because the compare timer is an internal
+             * helper ptimer only.
+             */
+            counter +=3D limit - s->cmp;
+        } else {
+            /*
+             * The compare timer won't fire in this round, and the limit is
+             * set to a value below the compare value. This practically means
+             * it will never fire, so it can be switched off.
+             */
+            is_active =3D false;
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
=20
 static void imx_epit_write_cr(IMXEPITState *s, uint32_t value)
 {
-    uint32_t freq =3D 0;
     uint32_t oldcr =3D s->cr;
=20
     s->cr =3D value & 0x03ffffff;
=20
     if (s->cr & CR_SWR) {
-        /* handle the reset */
+        /*
+         * Reset clears CR.SWR again. It does not touch CR.EN, but the timers
+         * are still stopped because the input clock is disabled.
+         */
         imx_epit_reset(s, false);
-    }
-
-    /*
-     * The interrupt state can change due to:
-     * - reset clears both SR.OCIF and CR.OCIE
-     * - write to CR.EN or CR.OCIE
-     */
-    imx_epit_update_int(s);
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
-        freq =3D imx_epit_get_freq(s);
+    } else {
+        ptimer_transaction_begin(s->timer_cmp);
+        ptimer_transaction_begin(s->timer_reload);
+        uint32_t freq =3D imx_epit_get_freq(s);
         if (freq) {
             ptimer_set_freq(s->timer_reload, freq);
             ptimer_set_freq(s->timer_cmp, freq);
         }
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
+        uint32_t toggled_cr_bits =3D oldcr ^ s->cr;
+        /* re-initialize the limits if CR.RLD has changed */
+        bool set_limit =3D toggled_cr_bits & CR_RLD;
+        /* set the counter if the timer got just enabled and CR.ENMOD is set=
 */
+        bool is_switched_on =3D (toggled_cr_bits & s->cr) & CR_EN;
+        bool set_counter =3D is_switched_on && (s->cr & CR_ENMOD);
+        if (set_limit || set_counter) {
+            uint64_t limit =3D (s->cr & CR_RLD) ? s->lr : EPIT_TIMER_MAX;
+            ptimer_set_limit(s->timer_reload, limit, set_counter ? 1 : 0);
+            if (set_limit) {
+                ptimer_set_limit(s->timer_cmp, limit, 0);
             }
         }
-
-        imx_epit_reload_compare_timer(s);
-        ptimer_run(s->timer_reload, 0);
-        if (s->cr & CR_OCIEN) {
-            ptimer_run(s->timer_cmp, 0);
+        /*
+         * If there is an input clock and the peripheral is enabled, then
+         * ensure the wall clock timer is ticking. Otherwise stop the timers.
+         * The compare timer will be updated later.
+         */
+        if (freq && (s->cr & CR_EN)) {
+            ptimer_run(s->timer_reload, 0);
         } else {
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
+            ptimer_stop(s->timer_reload);
         }
-    } else {
-        ptimer_stop(s->timer_cmp);
+        /* Commit changes to reload timer, so they can propagate. */
+        ptimer_transaction_commit(s->timer_reload);
+        /* Update compare timer based on the committed reload timer value. */
+        imx_epit_update_compare_timer(s);
+        ptimer_transaction_commit(s->timer_cmp);
     }
=20
-    ptimer_transaction_commit(s->timer_cmp);
-    ptimer_transaction_commit(s->timer_reload);
+    /*
+     * The interrupt state can change due to:
+     * - reset clears both SR.OCIF and CR.OCIE
+     * - write to CR.EN or CR.OCIE
+     */
+    imx_epit_update_int(s);
 }
=20
 static void imx_epit_write_sr(IMXEPITState *s, uint32_t value)
@@ -266,14 +302,10 @@ static void imx_epit_write_lr(IMXEPITState *s, uint32_t=
 value)
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
=20
@@ -281,8 +313,9 @@ static void imx_epit_write_cmp(IMXEPITState *s, uint32_t =
value)
 {
     s->cmp =3D value;
=20
+    /* Update the compare timer based on the committed reload timer value. */
     ptimer_transaction_begin(s->timer_cmp);
-    imx_epit_reload_compare_timer(s);
+    imx_epit_update_compare_timer(s);
     ptimer_transaction_commit(s->timer_cmp);
 }
=20
@@ -322,6 +355,9 @@ static void imx_epit_cmp(void *opaque)
 {
     IMXEPITState *s =3D IMX_EPIT(opaque);
=20
+    /* The cmp ptimer can't be running when the peripheral is disabled */
+    assert(s->cr & CR_EN);
+
     DPRINTF("sr was %d\n", s->sr);
     /* Set interrupt status bit SR.OCIF and update the interrupt state */
     s->sr |=3D SR_OCIF;
--=20
2.34.5

