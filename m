Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 068FD63F46F
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 16:45:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0lhW-0005Je-HV; Thu, 01 Dec 2022 10:42:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0lhN-0005Ep-DC; Thu, 01 Dec 2022 10:42:05 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0lhL-0004vw-0j; Thu, 01 Dec 2022 10:42:05 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 0AC7C11F204;
 Thu,  1 Dec 2022 15:42:01 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Tue, 25 Oct 2022 17:33:43 +0200
Subject: [PATCH qemu.git v3 1/8] hw/timer/imx_epit: improve comments
Message-ID: <166990932074.29941.8709118178538288040-1@git.sr.ht>
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

Fix typos, add background information

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
---
 hw/timer/imx_epit.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index ec0fa440d7..2841fbaa1c 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -96,13 +96,14 @@ static void imx_epit_set_freq(IMXEPITState *s)
     }
 }
=20
+/*
+ * This is called both on hardware (device) reset and software reset.
+ */
 static void imx_epit_reset(DeviceState *dev)
 {
     IMXEPITState *s =3D IMX_EPIT(dev);
=20
-    /*
-     * Soft reset doesn't touch some bits; hard reset clears them
-     */
+    /* Soft reset doesn't touch some bits; hard reset clears them */
     s->cr &=3D (CR_EN|CR_ENMOD|CR_STOPEN|CR_DOZEN|CR_WAITEN|CR_DBGEN);
     s->sr =3D 0;
     s->lr =3D EPIT_TIMER_MAX;
@@ -214,6 +215,7 @@ static void imx_epit_write(void *opaque, hwaddr offset, u=
int64_t value,
         ptimer_transaction_begin(s->timer_cmp);
         ptimer_transaction_begin(s->timer_reload);
=20
+        /* Update the frequency. Has been done already in case of a reset. */
         if (!(s->cr & CR_SWR)) {
             imx_epit_set_freq(s);
         }
@@ -254,7 +256,7 @@ static void imx_epit_write(void *opaque, hwaddr offset, u=
int64_t value,
         break;
=20
     case 1: /* SR - ACK*/
-        /* writing 1 to OCIF clear the OCIF bit */
+        /* writing 1 to OCIF clears the OCIF bit */
         if (value & 0x01) {
             s->sr =3D 0;
             imx_epit_update_int(s);
@@ -352,8 +354,18 @@ static void imx_epit_realize(DeviceState *dev, Error **e=
rrp)
                           0x00001000);
     sysbus_init_mmio(sbd, &s->iomem);
=20
+    /*
+     * The reload timer keeps running when the peripheral is enabled. It is a
+     * kind of wall clock that does not generate any interrupts. The callback
+     * needs to be provided, but it does nothing as the ptimer already suppo=
rts
+     * all necessary reloading functionality.
+     */
     s->timer_reload =3D ptimer_init(imx_epit_reload, s, PTIMER_POLICY_LEGACY=
);
=20
+    /*
+     * The compare timer is running only when the peripheral configuration is
+     * in a state that will generate compare interrupts.
+     */
     s->timer_cmp =3D ptimer_init(imx_epit_cmp, s, PTIMER_POLICY_LEGACY);
 }
=20
--=20
2.34.5


