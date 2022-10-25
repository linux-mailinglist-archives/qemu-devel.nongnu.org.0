Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3A261FA42
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 17:45:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os5Co-0002Fx-R0; Mon, 07 Nov 2022 11:42:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1os5CW-000281-12; Mon, 07 Nov 2022 11:42:20 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1os5CO-0005Jl-D9; Mon, 07 Nov 2022 11:42:19 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 26D1B11F84A;
 Mon,  7 Nov 2022 16:42:05 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Tue, 25 Oct 2022 12:33:42 +0200
Subject: [PATCH qemu.git v2 6/9] hw/timer/imx_epit: remove explicit fields cnt
 and freq
Message-ID: <166783932395.3279.1096141058484230644-6@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <166783932395.3279.1096141058484230644-0@git.sr.ht>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
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
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
---
 hw/timer/imx_epit.c         | 76 +++++++++++++++----------------------
 include/hw/timer/imx_epit.h |  2 -
 2 files changed, 30 insertions(+), 48 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index 6af460946f..b0ef727efb 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -61,27 +61,16 @@ static const IMXClk imx_epit_clocks[] =3D  {
     CLK_32k,       /* 11 ipg_clk_32k -- ~32kHz */
 };
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
+    uint32_t prescaler =3D 1 + extract32(s->cr, CR_PRESCALE_SHIFT,
+                                       CR_PRESCALE_BITS);
+    uint32_t f_in =3D imx_ccm_get_clock_frequency(s->ccm,
+                                                imx_epit_clocks[clksrc]);
+    uint32_t freq =3D f_in / prescaler;
+    DPRINTF("ptimer frequency is %u\n", freq);
+    return freq;
 }
=20
 static void imx_epit_reset(DeviceState *dev)
@@ -93,36 +82,26 @@ static void imx_epit_reset(DeviceState *dev)
     s->sr =3D 0;
     s->lr =3D EPIT_TIMER_MAX;
     s->cmp =3D 0;
-    s->cnt =3D 0;
-
     /* clear the interrupt */
     qemu_irq_lower(s->irq);
=20
     ptimer_transaction_begin(s->timer_cmp);
     ptimer_transaction_begin(s->timer_reload);
-    /* stop both timers */
+
+    /*
+     * The reset switches off the input clock, so even if the CR.EN is still
+     * set, the timers are no longer running.
+     */
+    assert(0 =3D=3D imx_epit_get_freq(s));
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
@@ -146,8 +125,7 @@ static uint64_t imx_epit_read(void *opaque, hwaddr offset=
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
@@ -166,7 +144,7 @@ static void imx_epit_reload_compare_timer(IMXEPITState *s)
 {
     if ((s->cr & (CR_EN | CR_OCIEN)) =3D=3D (CR_EN | CR_OCIEN))  {
         /* if the compare feature is on and timers are running */
-        uint32_t tmp =3D imx_epit_update_count(s);
+        uint32_t tmp =3D ptimer_get_count(s->timer_reload);
         uint64_t next;
         if (tmp > s->cmp) {
             /* It'll fire in this round of the timer */
@@ -182,6 +160,7 @@ static void imx_epit_write(void *opaque, hwaddr offset, u=
int64_t value,
                            unsigned size)
 {
     IMXEPITState *s =3D IMX_EPIT(opaque);
+    uint64_t freq =3D 0;
     uint64_t oldcr;
=20
     DPRINTF("(%s, value =3D 0x%08x)\n", imx_epit_reg_name(offset >> 2),
@@ -205,12 +184,19 @@ static void imx_epit_write(void *opaque, hwaddr offset,=
 uint64_t value,
         ptimer_transaction_begin(s->timer_cmp);
         ptimer_transaction_begin(s->timer_reload);
=20
-        /* Update the frequency. Has been done already in case of a reset. */
+        /*
+         * Update the frequency. In case of a reset the input clock was
+         * switched off, so this can be skipped.
+         */
         if (!(value & CR_SWR)) {
-            imx_epit_set_freq(s);
+            freq =3D imx_epit_get_freq(s);
+            if (freq) {
+                ptimer_set_freq(s->timer_reload, freq);
+                ptimer_set_freq(s->timer_cmp, freq);
+            }
         }
=20
-        if (s->freq && (s->cr & CR_EN) && !(oldcr & CR_EN)) {
+        if (freq && (s->cr & CR_EN) && !(oldcr & CR_EN)) {
             if (s->cr & CR_ENMOD) {
                 if (s->cr & CR_RLD) {
                     ptimer_set_limit(s->timer_reload, s->lr, 1);
@@ -324,15 +310,13 @@ static const MemoryRegionOps imx_epit_ops =3D {
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
index e2cb96229b..f6d41be7e1 100644
--- a/include/hw/timer/imx_epit.h
+++ b/include/hw/timer/imx_epit.h
@@ -72,9 +72,7 @@ struct IMXEPITState {
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


