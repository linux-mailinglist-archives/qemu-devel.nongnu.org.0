Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDC663F45B
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 16:42:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0lha-0005Kx-AL; Thu, 01 Dec 2022 10:42:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0lhP-0005Gk-Ha; Thu, 01 Dec 2022 10:42:07 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0lhM-0004wn-Vx; Thu, 01 Dec 2022 10:42:07 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id C682A11F9A2;
 Thu,  1 Dec 2022 15:42:01 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Tue, 25 Oct 2022 12:33:42 +0200
Subject: [PATCH qemu.git v3 7/8] hw/timer/imx_epit: remove explicit fields cnt
 and freq
Message-ID: <166990932074.29941.8709118178538288040-7@git.sr.ht>
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

The CNT register is a read-only register. There is no need to
store it's value, it can be calculated on demand.
The calculated frequency is needed temporarily only.

Note that this is a migration compatibility break for all boards
types that use the EPIT peripheral.

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
---
 hw/timer/imx_epit.c         | 73 ++++++++++++++-----------------------
 include/hw/timer/imx_epit.h |  2 -
 2 files changed, 28 insertions(+), 47 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index e04427542f..cf13496165 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -73,27 +73,14 @@ static void imx_epit_update_int(IMXEPITState *s)
     }
 }
=20
-/*
- * Must be called from within a ptimer_transaction_begin/commit block
- * for both s->timer_cmp and s->timer_reload.
- */
-static void imx_epit_set_freq(IMXEPITState *s)
+static uint32_t imx_epit_get_freq(IMXEPITState *s)
 {
-    uint32_t clksrc;
-    uint32_t prescaler;
-
-    clksrc =3D extract32(s->cr, CR_CLKSRC_SHIFT, CR_CLKSRC_BITS);
-    prescaler =3D 1 + extract32(s->cr, CR_PRESCALE_SHIFT, CR_PRESCALE_BITS);
-
-    s->freq =3D imx_ccm_get_clock_frequency(s->ccm,
-                                imx_epit_clocks[clksrc]) / prescaler;
-
-    DPRINTF("Setting ptimer frequency to %u\n", s->freq);
-
-    if (s->freq) {
-        ptimer_set_freq(s->timer_reload, s->freq);
-        ptimer_set_freq(s->timer_cmp, s->freq);
-    }
+    uint32_t clksrc =3D extract32(s->cr, CR_CLKSRC_SHIFT, CR_CLKSRC_BITS);
+    uint32_t prescaler =3D 1 + extract32(s->cr, CR_PRESCALE_SHIFT, CR_PRESCA=
LE_BITS);
+    uint32_t f_in =3D imx_ccm_get_clock_frequency(s->ccm, imx_epit_clocks[cl=
ksrc]);
+    uint32_t freq =3D f_in / prescaler;
+    DPRINTF("ptimer frequency is %u\n", freq);
+    return freq;
 }
=20
 /*
@@ -110,32 +97,23 @@ static void imx_epit_reset(IMXEPITState *s, bool is_hard=
_reset)
     s->sr =3D 0;
     s->lr =3D EPIT_TIMER_MAX;
     s->cmp =3D 0;
-    s->cnt =3D 0;
     ptimer_transaction_begin(s->timer_cmp);
     ptimer_transaction_begin(s->timer_reload);
-    /* stop both timers */
+
+    /*
+     * The reset switches off the input clock, so even if the CR.EN is still
+     * set, the timers are no longer running.
+     */
+    assert(imx_epit_get_freq(s) =3D=3D 0);
     ptimer_stop(s->timer_cmp);
     ptimer_stop(s->timer_reload);
-    /* compute new frequency */
-    imx_epit_set_freq(s);
     /* init both timers to EPIT_TIMER_MAX */
     ptimer_set_limit(s->timer_cmp, EPIT_TIMER_MAX, 1);
     ptimer_set_limit(s->timer_reload, EPIT_TIMER_MAX, 1);
-    if (s->freq && (s->cr & CR_EN)) {
-        /* if the timer is still enabled, restart it */
-        ptimer_run(s->timer_reload, 0);
-    }
     ptimer_transaction_commit(s->timer_cmp);
     ptimer_transaction_commit(s->timer_reload);
 }
=20
-static uint32_t imx_epit_update_count(IMXEPITState *s)
-{
-    s->cnt =3D ptimer_get_count(s->timer_reload);
-
-    return s->cnt;
-}
-
 static uint64_t imx_epit_read(void *opaque, hwaddr offset, unsigned size)
 {
     IMXEPITState *s =3D IMX_EPIT(opaque);
@@ -159,8 +137,7 @@ static uint64_t imx_epit_read(void *opaque, hwaddr offset=
, unsigned size)
         break;
=20
     case 4: /* CNT */
-        imx_epit_update_count(s);
-        reg_value =3D s->cnt;
+        reg_value =3D ptimer_get_count(s->timer_reload);
         break;
=20
     default:
@@ -179,7 +156,7 @@ static void imx_epit_reload_compare_timer(IMXEPITState *s)
 {
     if ((s->cr & (CR_EN | CR_OCIEN)) =3D=3D (CR_EN | CR_OCIEN))  {
         /* if the compare feature is on and timers are running */
-        uint32_t tmp =3D imx_epit_update_count(s);
+        uint32_t tmp =3D ptimer_get_count(s->timer_reload);
         uint64_t next;
         if (tmp > s->cmp) {
             /* It'll fire in this round of the timer */
@@ -193,6 +170,7 @@ static void imx_epit_reload_compare_timer(IMXEPITState *s)
=20
 static void imx_epit_write_cr(IMXEPITState *s, uint32_t value)
 {
+    uint32_t freq =3D 0;
     uint32_t oldcr =3D s->cr;
=20
     s->cr =3D value & 0x03ffffff;
@@ -217,12 +195,19 @@ static void imx_epit_write_cr(IMXEPITState *s, uint32_t=
 value)
     ptimer_transaction_begin(s->timer_cmp);
     ptimer_transaction_begin(s->timer_reload);
=20
-    /* Update the frequency. Has been done already in case of a reset. */
+    /*
+     * Update the frequency. In case of a reset the input clock was
+     * switched off, so this can be skipped.
+     */
     if (!(s->cr & CR_SWR)) {
-        imx_epit_set_freq(s);
+        freq =3D imx_epit_get_freq(s);
+        if (freq) {
+            ptimer_set_freq(s->timer_reload, freq);
+            ptimer_set_freq(s->timer_cmp, freq);
+        }
     }
=20
-    if (s->freq && (s->cr & CR_EN) && !(oldcr & CR_EN)) {
+    if (freq && (s->cr & CR_EN) && !(oldcr & CR_EN)) {
         if (s->cr & CR_ENMOD) {
             if (s->cr & CR_RLD) {
                 ptimer_set_limit(s->timer_reload, s->lr, 1);
@@ -356,15 +341,13 @@ static const MemoryRegionOps imx_epit_ops =3D {
=20
 static const VMStateDescription vmstate_imx_timer_epit =3D {
     .name =3D TYPE_IMX_EPIT,
-    .version_id =3D 2,
-    .minimum_version_id =3D 2,
+    .version_id =3D 3,
+    .minimum_version_id =3D 3,
     .fields =3D (VMStateField[]) {
         VMSTATE_UINT32(cr, IMXEPITState),
         VMSTATE_UINT32(sr, IMXEPITState),
         VMSTATE_UINT32(lr, IMXEPITState),
         VMSTATE_UINT32(cmp, IMXEPITState),
-        VMSTATE_UINT32(cnt, IMXEPITState),
-        VMSTATE_UINT32(freq, IMXEPITState),
         VMSTATE_PTIMER(timer_reload, IMXEPITState),
         VMSTATE_PTIMER(timer_cmp, IMXEPITState),
         VMSTATE_END_OF_LIST()
diff --git a/include/hw/timer/imx_epit.h b/include/hw/timer/imx_epit.h
index 783eaf0c3a..79aff0cec2 100644
--- a/include/hw/timer/imx_epit.h
+++ b/include/hw/timer/imx_epit.h
@@ -74,9 +74,7 @@ struct IMXEPITState {
     uint32_t sr;
     uint32_t lr;
     uint32_t cmp;
-    uint32_t cnt;
=20
-    uint32_t freq;
     qemu_irq irq;
 };
=20
--=20
2.34.5


