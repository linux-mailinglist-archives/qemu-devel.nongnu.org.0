Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB11607FC6
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 22:27:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1olxSZ-0006CB-Id; Fri, 21 Oct 2022 15:13:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1oltrg-0006WG-D6
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 11:23:19 -0400
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1oltrd-0002WN-MR
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 11:23:15 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 6F86711EFC5;
 Fri, 21 Oct 2022 15:23:11 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Wed, 19 Oct 2022 15:09:50 +0200
Subject: [PATCH qemu.git] target/imx: reload cmp timer outside of the reload
 ptimer transaction
MIME-Version: 1.0
Message-ID: <166636579128.26670.11954825054446993916-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org
Cc: axelheider@gmx.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_REPLYTO=2.095,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 21 Oct 2022 15:07:05 -0400
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
See https://gitlab.com/qemu-project/qemu/-/issues/1263
When running the seL4 tests
(https://docs.sel4.systems/projects/sel4test), on the sabrelight
platform the timer test fails (and thus it's disabled by default).
Investigation has shown that the arm/imx6 EPIT timer interrupt does not
fire properly, instead of a second in can take up to a minute to finally
see the interrupt.

 hw/timer/imx_epit.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index 2bf8c754b2..0b13c1eab0 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -276,9 +276,12 @@ static void imx_epit_write(void *opaque, hwaddr offset, =
uint64_t value,
             ptimer_set_count(s->timer_reload, s->lr);
         }
=20
+        // commit s->timer_reload before imx_epit_reload_compare_timer
+        // as timer_reload is read in imx_epit_reload_compare_timer
+        ptimer_transaction_commit(s->timer_reload);
+
         imx_epit_reload_compare_timer(s);
         ptimer_transaction_commit(s->timer_cmp);
-        ptimer_transaction_commit(s->timer_reload);
         break;
=20
     case 3: /* CMP */
--=20
2.34.5

