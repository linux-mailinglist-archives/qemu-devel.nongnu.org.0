Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 777FA612EDB
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 03:17:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opKLc-0001HO-2A; Sun, 30 Oct 2022 22:16:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1opKLW-0001CS-LZ; Sun, 30 Oct 2022 22:16:16 -0400
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1opKLT-000372-0l; Sun, 30 Oct 2022 22:16:13 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 2074511F299;
 Mon, 31 Oct 2022 02:15:47 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Mon, 31 Oct 2022 01:28:54 +0100
Subject: [PATCH qemu.git 11/11] hw/timer/imx_epit: rework CR write handling
Message-ID: <166718254546.5893.5075929684621857903-11@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <166718254546.5893.5075929684621857903-0@git.sr.ht>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_REPLYTO=2.095,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Axel Heider <axel.heider@hensoldt.net>

- simplify code, improve comments
- fix https://gitlab.com/qemu-project/qemu/-/issues/1263

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
---
 hw/timer/imx_epit.c | 139 +++++++++++++++++++++-----------------------
 1 file changed, 65 insertions(+), 74 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index 7dd9f54c9c..4a6326b1de 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -69,43 +69,6 @@ static uint32_t imx_epit_get_freq(IMXEPITState *s)
     return f_in / prescaler;
 }
=20
-static void imx_epit_reset(DeviceState *dev)
-{
-    IMXEPITState *s =3D IMX_EPIT(dev);
-
-    /*
-     * Soft reset doesn't touch some bits; hard reset clears them
-     */
-    s->cr &=3D (CR_EN|CR_ENMOD|CR_STOPEN|CR_DOZEN|CR_WAITEN|CR_DBGEN);
-    s->sr =3D 0;
-    s->lr =3D EPIT_TIMER_MAX;
-    s->cmp =3D 0;
-    /* clear the interrupt */
-    qemu_irq_lower(s->irq);
-
-    ptimer_transaction_begin(s->timer_cmp);
-    ptimer_transaction_begin(s->timer_reload);
-    /* stop both timers */
-    ptimer_stop(s->timer_cmp);
-    ptimer_stop(s->timer_reload);
-    /* compute new frequency */
-    uint32_t freq =3D imx_epit_get_freq(s);
-    DPRINTF("Setting ptimer frequency to %u\n", freq);
-    if (freq) {
-        ptimer_set_freq(s->timer_reload, freq);
-        ptimer_set_freq(s->timer_cmp, freq);
-    }
-    /* init both timers to EPIT_TIMER_MAX */
-    ptimer_set_limit(s->timer_cmp, EPIT_TIMER_MAX, 1);
-    ptimer_set_limit(s->timer_reload, EPIT_TIMER_MAX, 1);
-    if (freq && (s->cr & CR_EN)) {
-        /* if the timer is still enabled, restart it */
-        ptimer_run(s->timer_reload, 0);
-    }
-    ptimer_transaction_commit(s->timer_cmp);
-    ptimer_transaction_commit(s->timer_reload);
-}
-
 static uint64_t imx_epit_read(void *opaque, hwaddr offset, unsigned size)
 {
     IMXEPITState *s =3D IMX_EPIT(opaque);
@@ -192,56 +155,75 @@ static void imx_epit_update_compare_timer(IMXEPITState =
*s)
=20
 static void imx_epit_write_cr(IMXEPITState *s, uint32_t value)
 {
-    uint32_t freq =3D 0;
+    ptimer_transaction_begin(s->timer_cmp);
+    ptimer_transaction_begin(s->timer_reload);
=20
-    /* SWR bit is never persisted, it clears itself once reset is done */
     uint32_t oldcr =3D s->cr;
     s->cr =3D (value & ~CR_SWR) & 0x03ffffff;
=20
     if (value & CR_SWR) {
-        /* handle the reset */
-        imx_epit_reset(DEVICE(s));
         /*
-         * TODO: could we 'break' here? following operations appear
-         * to duplicate the work imx_epit_reset() already did.
+         * Soft reset doesn't touch some bits, just a hard reset clears all
+         * of them. Clearing CLKSRC disables the input clock, which will
+         * happen when we re-init of the timer frequency below.
+         */
+        s->cr &=3D (CR_EN|CR_ENMOD|CR_STOPEN|CR_DOZEN|CR_WAITEN|CR_DBGEN);
+        /*
+         * We have applied the new CR value and then cleared most bits,
+         * thus some bits from the write request are now lost. The TRM
+         * is not clear about the behavior, maybe these bits are to be
+         * applied after the reset (e.g. for selecting a new clock
+         * source). However, it seem this is undefined behavior and a
+         * it's assumed a reset does not try to do anything else.
          */
+        s->sr =3D 0;
+        s->lr =3D EPIT_TIMER_MAX;
+        s->cmp =3D 0;
+        /* turn interrupt off since SR and the OCIEN bit is cleared */
+        qemu_irq_lower(s->irq);
+        /* reset timer limits, set timer values to the limits */
+        ptimer_set_limit(s->timer_cmp, EPIT_TIMER_MAX, 1);
+        ptimer_set_limit(s->timer_reload, EPIT_TIMER_MAX, 1);
     }
=20
-    ptimer_transaction_begin(s->timer_cmp);
-    ptimer_transaction_begin(s->timer_reload);
-
-    if (!(value & CR_SWR)) {
-        uint32_t freq =3D imx_epit_get_freq(s);
+    /* re-initialize frequency, or turn off timers if input clock is off */
+    uint32_t freq =3D imx_epit_get_freq(s);
+    if (freq) {
         DPRINTF("Setting ptimer frequency to %u\n", freq);
-        if (freq) {
-            ptimer_set_freq(s->timer_reload, freq);
-            ptimer_set_freq(s->timer_cmp, freq);
-        }
+        ptimer_set_freq(s->timer_reload, freq);
+        ptimer_set_freq(s->timer_cmp, freq);
     }
=20
-    if (freq && (s->cr & CR_EN) && !(oldcr & CR_EN)) {
-        if (s->cr & CR_ENMOD) {
-            uint64_t limit =3D (s->cr & CR_RLD) ? s->lr : EPIT_TIMER_MAX;
-            /* set new limit and also set timer to this value right now */
-            ptimer_set_limit(s->timer_reload, limit, 1);
-            ptimer_set_limit(s->timer_cmp, limit, 1);
-        }
-        ptimer_run(s->timer_reload, 0);
-        imx_epit_update_compare_timer(s);
-    } else if (!(s->cr & CR_EN)) {
-        /* stop both timers */
-        ptimer_stop(s->timer_reload);
+    if (!freq || !(s->cr & CR_EN)) {
+        /*
+         * The EPIT timer is effectively disabled if it is not enabled or
+         * the input clock is off. In this case we can stop the ptimers.
+         */
         ptimer_stop(s->timer_cmp);
-    } else if (s->cr & CR_OCIEN) {
-        if (!(oldcr & CR_OCIEN)) {
-            imx_epit_update_compare_timer(s);
-        }
+        ptimer_stop(s->timer_reload);
     } else {
-        ptimer_stop(s->timer_cmp);
+        /* The EPIT timer is active. */
+        if (!(oldcr & CR_EN)) {
+            /* The EPI timer has just been enabled, initialize and start it.=
 */
+            if (s->cr & CR_ENMOD) {
+                uint64_t limit =3D (s->cr & CR_RLD) ? s->lr : EPIT_TIMER_MAX;
+                /* set new limit and also set timer to this value right now =
*/
+                ptimer_set_limit(s->timer_reload, limit, 1);
+                ptimer_set_limit(s->timer_cmp, limit, 1);
+            }
+            ptimer_run(s->timer_reload, 0);
+        }
     }
+    /*
+     * Commit the change to s->timer_reload, so it can propagate and the
+     * updated value will be read in imx_epit_update_compare_timer(),
+     * Otherwise a stale value will be seen and the compare interrupt is
+     * set up wrongly.
+     */
+    ptimer_transaction_commit(s->timer_reload);
+    imx_epit_update_compare_timer(s);
=20
     ptimer_transaction_commit(s->timer_cmp);
-    ptimer_transaction_commit(s->timer_reload);
 }
=20
 static void imx_epit_write_sr(IMXEPITState *s, uint32_t value)
@@ -269,10 +251,10 @@ static void imx_epit_write_lr(IMXEPITState *s, uint32_t=
 value)
         ptimer_set_count(s->timer_reload, s->lr);
     }
     /*
-     * Commit the change to s->timer_reload, so it can propagate. Otherwise
-     * the timer interrupt may not fire properly. The commit must happen
-     * before calling imx_epit_update_compare_timer(), which reads
-     * s->timer_reload internally again.
+     * Commit the change to s->timer_reload, so it can propagate and the
+     * updated value will be read in imx_epit_update_compare_timer(),
+     * Otherwise a stale value will be seen and the compare interrupt is
+     * set up wrongly.
      */
     ptimer_transaction_commit(s->timer_reload);
     imx_epit_update_compare_timer(s);
@@ -390,6 +372,15 @@ static void imx_epit_realize(DeviceState *dev, Error **e=
rrp)
     s->timer_cmp =3D ptimer_init(imx_epit_cmp, s, PTIMER_POLICY_LEGACY);
 }
=20
+static void imx_epit_reset(DeviceState *dev)
+{
+    IMXEPITState *s =3D IMX_EPIT(dev);
+
+    /* initialize CR and perform a software reset */
+    s->cr =3D 0;
+    imx_epit_write_cr(s, CR_SWR);
+}
+
 static void imx_epit_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc  =3D DEVICE_CLASS(klass);
--=20
2.34.5

