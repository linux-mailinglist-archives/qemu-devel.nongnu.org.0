Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E4E60B3F3
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 19:22:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on0uJ-0001Xu-EW; Mon, 24 Oct 2022 13:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1on0u9-0001Vc-LL; Mon, 24 Oct 2022 13:06:25 -0400
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1on0u7-0000YY-Sl; Mon, 24 Oct 2022 13:06:25 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id AFB7511EF7E;
 Mon, 24 Oct 2022 17:06:21 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Wed, 19 Oct 2022 15:09:50 +0200
Subject: [PATCH qemu.git] target/imx: reload cmp timer outside of the reload
 ptimer transaction
MIME-Version: 1.0
Message-ID: <166663118138.13362.1229967229046092876-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Axel Heider <axel.heider@hensoldt.net>

When running seL4 tests (https://docs.sel4.systems/projects/sel4test)
on the sabrelight platform, the timer tests fail. The arm/imx6 EPIT
timer interrupt does not fire properly, instead of a e.g. second in
can take up to a minute to finally see the interrupt.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1263

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
---
Fixed the comment style and the commit message.

> Do we also need to change the other places that call
> imx_epit_reload_compare_timer() in the handling of CR
> register writes ? (Those are a little more tricky.)

The current patch fixed the issue we are seeing. I'm not really
an expert on the QEMU code here and still try to understand
all details. Might also be that we never hit the other code paths
in the end.

 hw/timer/imx_epit.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index 2bf8c754b2..ec0fa440d7 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -275,10 +275,15 @@ static void imx_epit_write(void *opaque, hwaddr offset,=
 uint64_t value,
             /* If IOVW bit is set then set the timer value */
             ptimer_set_count(s->timer_reload, s->lr);
         }
-
+        /*
+         * Commit the change to s->timer_reload, so it can propagate. Otherw=
ise
+         * the timer interrupt may not fire properly. The commit must happen
+         * before calling imx_epit_reload_compare_timer(), which reads
+         * s->timer_reload internally again.
+         */
+        ptimer_transaction_commit(s->timer_reload);
         imx_epit_reload_compare_timer(s);
         ptimer_transaction_commit(s->timer_cmp);
-        ptimer_transaction_commit(s->timer_reload);
         break;
=20
     case 3: /* CMP */
--=20
2.34.5

