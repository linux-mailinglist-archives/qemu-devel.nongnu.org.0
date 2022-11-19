Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB79B63F46E
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 16:45:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0lhV-0005IP-22; Thu, 01 Dec 2022 10:42:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0lhO-0005Fx-HD; Thu, 01 Dec 2022 10:42:06 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0lhM-0004wl-KH; Thu, 01 Dec 2022 10:42:06 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 84CDB11F9A0;
 Thu,  1 Dec 2022 15:42:01 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Sat, 19 Nov 2022 17:09:59 +0100
Subject: [PATCH qemu.git v3 5/8] hw/timer/imx_epit: hard reset initializes CR
 with 0
Message-ID: <166990932074.29941.8709118178538288040-5@git.sr.ht>
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

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
---
 hw/timer/imx_epit.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index 7af3a8b10e..39f47222d0 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -99,12 +99,14 @@ static void imx_epit_set_freq(IMXEPITState *s)
 /*
  * This is called both on hardware (device) reset and software reset.
  */
-static void imx_epit_reset(DeviceState *dev)
+static void imx_epit_reset(IMXEPITState *s, bool is_hard_reset)
 {
-    IMXEPITState *s =3D IMX_EPIT(dev);
-
     /* Soft reset doesn't touch some bits; hard reset clears them */
-    s->cr &=3D (CR_EN|CR_ENMOD|CR_STOPEN|CR_DOZEN|CR_WAITEN|CR_DBGEN);
+    if (is_hard_reset) {
+        s->cr =3D 0;
+    } else {
+        s->cr &=3D (CR_EN|CR_ENMOD|CR_STOPEN|CR_DOZEN|CR_WAITEN|CR_DBGEN);
+    }
     s->sr =3D 0;
     s->lr =3D EPIT_TIMER_MAX;
     s->cmp =3D 0;
@@ -205,7 +207,7 @@ static void imx_epit_write(void *opaque, hwaddr offset, u=
int64_t value,
         s->cr =3D value & 0x03ffffff;
         if (s->cr & CR_SWR) {
             /* handle the reset */
-            imx_epit_reset(DEVICE(s));
+            imx_epit_reset(s, false);
         }
=20
         /*
@@ -377,12 +379,18 @@ static void imx_epit_realize(DeviceState *dev, Error **=
errp)
     s->timer_cmp =3D ptimer_init(imx_epit_cmp, s, PTIMER_POLICY_LEGACY);
 }
=20
+static void imx_epit_dev_reset(DeviceState *dev)
+{
+    IMXEPITState *s =3D IMX_EPIT(dev);
+    imx_epit_reset(s, true);
+}
+
 static void imx_epit_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc  =3D DEVICE_CLASS(klass);
=20
     dc->realize =3D imx_epit_realize;
-    dc->reset =3D imx_epit_reset;
+    dc->reset =3D imx_epit_dev_reset;
     dc->vmsd =3D &vmstate_imx_timer_epit;
     dc->desc =3D "i.MX periodic timer";
 }
--=20
2.34.5


