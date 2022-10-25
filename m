Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F2763F45C
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 16:43:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0lhP-0005Fy-M5; Thu, 01 Dec 2022 10:42:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0lhM-0005E9-4G; Thu, 01 Dec 2022 10:42:04 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0lhK-0004w2-FZ; Thu, 01 Dec 2022 10:42:03 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 6865F11F99F;
 Thu,  1 Dec 2022 15:42:01 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Tue, 25 Oct 2022 20:32:30 +0200
Subject: [PATCH qemu.git v3 4/8] hw/timer/imx_epit: update interrupt state on
 CR write access
Message-ID: <166990932074.29941.8709118178538288040-4@git.sr.ht>
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

The interrupt state can change due to:
- reset clears both SR.OCIF and CR.OCIE
- write to CR.EN or CR.OCIE

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
---
 hw/timer/imx_epit.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index f148868b8c..7af3a8b10e 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -206,12 +206,20 @@ static void imx_epit_write(void *opaque, hwaddr offset,=
 uint64_t value,
         if (s->cr & CR_SWR) {
             /* handle the reset */
             imx_epit_reset(DEVICE(s));
-            /*
-             * TODO: could we 'break' here? following operations appear
-             * to duplicate the work imx_epit_reset() already did.
-             */
         }
=20
+        /*
+         * The interrupt state can change due to:
+         * - reset clears both SR.OCIF and CR.OCIE
+         * - write to CR.EN or CR.OCIE
+         */
+        imx_epit_update_int(s);
+
+        /*
+         * TODO: could we 'break' here for reset? following operations appear
+         * to duplicate the work imx_epit_reset() already did.
+         */
+
         ptimer_transaction_begin(s->timer_cmp);
         ptimer_transaction_begin(s->timer_reload);
=20
--=20
2.34.5


