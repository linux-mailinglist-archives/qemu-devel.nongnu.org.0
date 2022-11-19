Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8EC63F46A
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 16:44:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0lhP-0005FC-BS; Thu, 01 Dec 2022 10:42:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0lhM-0005EA-7M; Thu, 01 Dec 2022 10:42:04 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0lhK-0004w1-HJ; Thu, 01 Dec 2022 10:42:03 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 4BC6211F996;
 Thu,  1 Dec 2022 15:42:01 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Sat, 19 Nov 2022 15:59:40 +0100
Subject: [PATCH qemu.git v3 3/8] hw/timer/imx_epit: define SR_OCIF
Message-ID: <166990932074.29941.8709118178538288040-3@git.sr.ht>
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

---
 hw/timer/imx_epit.c         | 12 ++++++------
 include/hw/timer/imx_epit.h |  2 ++
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index 661e9158e3..f148868b8c 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -66,7 +66,7 @@ static const IMXClk imx_epit_clocks[] =3D  {
  */
 static void imx_epit_update_int(IMXEPITState *s)
 {
-    if (s->sr && (s->cr & CR_OCIEN) && (s->cr & CR_EN)) {
+    if ((s->sr & SR_OCIF) && (s->cr & CR_OCIEN) && (s->cr & CR_EN)) {
         qemu_irq_raise(s->irq);
     } else {
         qemu_irq_lower(s->irq);
@@ -256,9 +256,9 @@ static void imx_epit_write(void *opaque, hwaddr offset, u=
int64_t value,
         break;
=20
     case 1: /* SR - ACK*/
-        /* writing 1 to OCIF clears the OCIF bit */
-        if (value & 0x01) {
-            s->sr =3D 0;
+        /* writing 1 to SR.OCIF clears this bit and turns the interrupt off =
*/
+        if (value & SR_OCIF) {
+            s->sr =3D 0; /* SR.OCIF is the only bit in this register anyway =
*/
             imx_epit_update_int(s);
         }
         break;
@@ -309,8 +309,8 @@ static void imx_epit_cmp(void *opaque)
     IMXEPITState *s =3D IMX_EPIT(opaque);
=20
     DPRINTF("sr was %d\n", s->sr);
-
-    s->sr =3D 1;
+    /* Set interrupt status bit SR.OCIF and update the interrupt state */
+    s->sr |=3D SR_OCIF;
     imx_epit_update_int(s);
 }
=20
diff --git a/include/hw/timer/imx_epit.h b/include/hw/timer/imx_epit.h
index e2cb96229b..783eaf0c3a 100644
--- a/include/hw/timer/imx_epit.h
+++ b/include/hw/timer/imx_epit.h
@@ -53,6 +53,8 @@
 #define CR_CLKSRC_SHIFT (24)
 #define CR_CLKSRC_BITS  (2)
=20
+#define SR_OCIF     (1 << 0)
+
 #define EPIT_TIMER_MAX  0XFFFFFFFFUL
=20
 #define TYPE_IMX_EPIT "imx.epit"
--=20
2.34.5


