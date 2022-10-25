Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBF661FA2A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 17:43:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os5CW-000266-7U; Mon, 07 Nov 2022 11:42:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1os5CM-00024e-9g; Mon, 07 Nov 2022 11:42:10 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1os5CI-0004pV-L4; Mon, 07 Nov 2022 11:42:09 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id B137C11F30C;
 Mon,  7 Nov 2022 16:42:04 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Tue, 25 Oct 2022 13:23:07 +0200
Subject: [PATCH qemu.git v2 3/9] hw/timer/imx_epit: simplify interrupt logic
Message-ID: <166783932395.3279.1096141058484230644-3@git.sr.ht>
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
 hw/timer/imx_epit.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index 8ec770f674..2e9dae0bc8 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -61,18 +61,6 @@ static const IMXClk imx_epit_clocks[] =3D  {
     CLK_32k,       /* 11 ipg_clk_32k -- ~32kHz */
 };
=20
-/*
- * Update interrupt status
- */
-static void imx_epit_update_int(IMXEPITState *s)
-{
-    if (s->sr && (s->cr & CR_OCIEN) && (s->cr & CR_EN)) {
-        qemu_irq_raise(s->irq);
-    } else {
-        qemu_irq_lower(s->irq);
-    }
-}
-
 /*
  * Must be called from within a ptimer_transaction_begin/commit block
  * for both s->timer_cmp and s->timer_reload.
@@ -253,10 +241,10 @@ static void imx_epit_write(void *opaque, hwaddr offset,=
 uint64_t value,
         break;
=20
     case 1: /* SR - ACK*/
-        /* writing 1 to OCIF clears the OCIF bit */
+        /* writing 1 to OCIF clears the OCIF bit and the interrupt */
         if (value & 0x01) {
             s->sr =3D 0;
-            imx_epit_update_int(s);
+            qemu_irq_lower(s->irq);
         }
         break;
=20
@@ -305,10 +293,17 @@ static void imx_epit_cmp(void *opaque)
 {
     IMXEPITState *s =3D IMX_EPIT(opaque);
=20
+    /* Set the interrupt status flag to signaled. */
     DPRINTF("sr was %d\n", s->sr);
-
     s->sr =3D 1;
-    imx_epit_update_int(s);
+
+    /*
+     * An actual interrupt is generated only if the peripheral is enabled
+     * and the interrupt generation is enabled.
+     */
+    if ((s->cr & (CR_EN | CR_OCIEN)) =3D=3D (CR_EN | CR_OCIEN)) {
+        qemu_irq_raise(s->irq);
+    }
 }
=20
 static void imx_epit_reload(void *opaque)
--=20
2.34.5


