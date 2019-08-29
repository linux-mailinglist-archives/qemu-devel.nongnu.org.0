Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D78BA11A1
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Aug 2019 08:18:46 +0200 (CEST)
Received: from localhost ([::1]:45722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3Dld-0004Gx-58
	for lists+qemu-devel@lfdr.de; Thu, 29 Aug 2019 02:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35339)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1i3Dc4-0004Ha-6Y
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 02:08:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1i3Dc0-0003k4-Va
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 02:08:51 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:37669)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1i3Dc0-0003hE-Gf; Thu, 29 Aug 2019 02:08:48 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46JscN43Btz9sPW; Thu, 29 Aug 2019 16:08:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1567058916;
 bh=5mQwvfr4PUb7F3Lqz+iL3Cu6DH/GE0yuK6gqDqjf7X0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Gb+bR/scI0adyeyB99Zi8Vqw5vNzFyn5k392Pb3SYcnYtzjk/c+sa6jKfvpqYeEKc
 G1NpMWvdai+T5O/lMtR7pnFt3tF2GSfl188ZRHnA64JqCvm+l1ha9LgOTJjhELqrQ+
 DVVn4b29wChTOgf3B3Yd+jVnmzpusRuiqnjNJz7g=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Thu, 29 Aug 2019 16:08:20 +1000
Message-Id: <20190829060827.25731-13-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829060827.25731-1-david@gibson.dropbear.id.au>
References: <20190829060827.25731-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [PULL 12/19] target/ppc: Fix do_float_check_status vs
 inexact
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lvivier@redhat.com, aik@ozlabs.ru,
 Richard Henderson <richard.henderson@linaro.org>, groug@kaod.org,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, Paul Clarke <pc@us.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The underflow and inexact exceptions are not mutually exclusive.
Check for both of them.  Tidy the reset of FPSCR[FI].

Fixes: https://bugs.launchpad.net/bugs/1841442
Reported-by: Paul Clarke <pc@us.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Paul Clarke <pc@us.ibm.com>
Message-Id: <20190826165434.18403-2-richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/fpu_helper.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index c8e719272d..4b1a2e6178 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -630,19 +630,15 @@ static void do_float_check_status(CPUPPCState *env,=
 uintptr_t raddr)
 {
     CPUState *cs =3D env_cpu(env);
     int status =3D get_float_exception_flags(&env->fp_status);
-    bool inexact_happened =3D false;
=20
     if (status & float_flag_overflow) {
         float_overflow_excp(env);
     } else if (status & float_flag_underflow) {
         float_underflow_excp(env);
-    } else if (status & float_flag_inexact) {
-        float_inexact_excp(env);
-        inexact_happened =3D true;
     }
-
-    /* if the inexact flag was not set */
-    if (inexact_happened =3D=3D false) {
+    if (status & float_flag_inexact) {
+        float_inexact_excp(env);
+    } else {
         env->fpscr &=3D ~(1 << FPSCR_FI); /* clear the FPSCR[FI] bit */
     }
=20
--=20
2.21.0


