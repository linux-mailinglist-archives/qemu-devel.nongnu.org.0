Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEAEA11A0
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Aug 2019 08:18:32 +0200 (CEST)
Received: from localhost ([::1]:45720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3DlP-0004Cn-RP
	for lists+qemu-devel@lfdr.de; Thu, 29 Aug 2019 02:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35250)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1i3Dc0-0004Cp-EE
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 02:08:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1i3Dbx-0003fQ-Tx
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 02:08:48 -0400
Received: from ozlabs.org ([203.11.71.1]:43859)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1i3Dbw-0003bM-TG; Thu, 29 Aug 2019 02:08:45 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46JscN2lN1z9sPT; Thu, 29 Aug 2019 16:08:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1567058916;
 bh=ZmTyhSQNa2ubW03k4r+Uwxw+siIMTkcvjhUgCIzzQfo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B42tK9uXGCGQT+9Kk98kjwwfjEJ2IIbeK0kQvE+BbAr09ndT7BPMc/bWPNGoxU5Eb
 fDfAynJCgSN0cqkYKXkA5twfFp+RNimb8VOgnBYL3hoT01ct4P+KlbLv0TA7sogb94
 q9LwSnTkrPkX5Q9HQSl0kd+l4lhB9HQhCU9x/T8c=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Thu, 29 Aug 2019 16:08:19 +1000
Message-Id: <20190829060827.25731-12-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829060827.25731-1-david@gibson.dropbear.id.au>
References: <20190829060827.25731-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 11/19] target/ppc: Set
 float_tininess_before_rounding at cpu reset
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

As defined in Power 3.0 section 4.4.4 "Underflow Exception",
a tiny result is detected before rounding.

Fixes: https://bugs.launchpad.net/qemu/+bug/1841491
Reported-by: Paul Clarke <pc@us.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20190827020013.27154-1-richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate_init.inc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/ppc/translate_init.inc.c b/target/ppc/translate_init.=
inc.c
index 4a21ed7289..023138c2f9 100644
--- a/target/ppc/translate_init.inc.c
+++ b/target/ppc/translate_init.inc.c
@@ -10461,6 +10461,10 @@ static void ppc_cpu_reset(CPUState *s)
     s->exception_index =3D POWERPC_EXCP_NONE;
     env->error_code =3D 0;
=20
+    /* tininess for underflow is detected before rounding */
+    set_float_detect_tininess(float_tininess_before_rounding,
+                              &env->fp_status);
+
     for (i =3D 0; i < ARRAY_SIZE(env->spr_cb); i++) {
         ppc_spr_t *spr =3D &env->spr_cb[i];
=20
--=20
2.21.0


