Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50727612ED9
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 03:17:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opKLG-0001Aw-Po; Sun, 30 Oct 2022 22:15:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1opKL9-00015t-7a; Sun, 30 Oct 2022 22:15:51 -0400
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1opKL7-00035y-OF; Sun, 30 Oct 2022 22:15:51 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id B0CCD11F294;
 Mon, 31 Oct 2022 02:15:46 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Sat, 29 Oct 2022 18:41:08 +0200
Subject: [PATCH qemu.git 08/11] hw/timer/imx_epit: simplify CR.ENMOD handling
Message-ID: <166718254546.5893.5075929684621857903-8@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <166718254546.5893.5075929684621857903-0@git.sr.ht>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 15
X-Spam_score: 1.5
X-Spam_bar: +
X-Spam_report: (1.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_24_48=1.34,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Axel Heider <axel.heider@hensoldt.net>

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
---
 hw/timer/imx_epit.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index bba9c87cd4..5915d4b3d4 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -198,13 +198,10 @@ static void imx_epit_write_cr(IMXEPITState *s, uint32_t=
 value)
=20
     if (freq && (s->cr & CR_EN) && !(oldcr & CR_EN)) {
         if (s->cr & CR_ENMOD) {
-            if (s->cr & CR_RLD) {
-                ptimer_set_limit(s->timer_reload, s->lr, 1);
-                ptimer_set_limit(s->timer_cmp, s->lr, 1);
-            } else {
-                ptimer_set_limit(s->timer_reload, EPIT_TIMER_MAX, 1);
-                ptimer_set_limit(s->timer_cmp, EPIT_TIMER_MAX, 1);
-            }
+            uint64_t limit =3D (s->cr & CR_RLD) ? s->lr : EPIT_TIMER_MAX;
+            /* set new limit and also set timer to this value right now */
+            ptimer_set_limit(s->timer_reload, limit, 1);
+            ptimer_set_limit(s->timer_cmp, limit, 1);
         }
=20
         imx_epit_reload_compare_timer(s);
--=20
2.34.5


