Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B25A11B1
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Aug 2019 08:24:21 +0200 (CEST)
Received: from localhost ([::1]:45794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3Dr2-0001bU-Uv
	for lists+qemu-devel@lfdr.de; Thu, 29 Aug 2019 02:24:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35255)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1i3Dc0-0004Ct-EN
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 02:08:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1i3Dby-0003fu-1R
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 02:08:48 -0400
Received: from ozlabs.org ([203.11.71.1]:57597)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1i3Dbx-0003au-3F; Thu, 29 Aug 2019 02:08:45 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46JscM6tJbz9sNF; Thu, 29 Aug 2019 16:08:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1567058915;
 bh=5jlmo8H1Y1OoP/KbH6aydk6ryEb1iD5XUmG98WQI86w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b+V6XeNDj4kneHGxKJTWSZUegsjiRzPbvjGSo0e1XZa9uraYXzgmB5ag6AGNYoYFv
 5hL/K3PhjDOiT5lHuZWYSk2OoR3saQnRoLxuQgRgvAUMEY/qCdvCbF2takCFBpXVUp
 Ro3hEE+5motuMNMe/0Yh4P6+KiPx2oQcm5XvtCpU=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Thu, 29 Aug 2019 16:08:16 +1000
Message-Id: <20190829060827.25731-9-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829060827.25731-1-david@gibson.dropbear.id.au>
References: <20190829060827.25731-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 08/19] ppc: Fix xscvdpspn for SNAN
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
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, "Paul A. Clarke" <pc@us.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Paul A. Clarke" <pc@us.ibm.com>

The xscvdpspn instruction implements a non-arithmetic conversion.
In particular, NaNs are not silenced and rounding is not performed.

Rewrite to match the pseudocode for ConvertDPtoSP_NS() in the
Power 3.0B manual.

Signed-off-by: Paul A. Clarke <pc@us.ibm.com>
Message-Id: <1566321964-1447-1-git-send-email-pc@us.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
[dwg: Replaced description with clearer version from rth]
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/fpu_helper.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 07bc9051b0..c8e719272d 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2887,12 +2887,40 @@ void helper_xscvqpdp(CPUPPCState *env, uint32_t o=
pcode,
=20
 uint64_t helper_xscvdpspn(CPUPPCState *env, uint64_t xb)
 {
-    uint64_t result;
+    uint64_t result, sign, exp, frac;
=20
     float_status tstat =3D env->fp_status;
     set_float_exception_flags(0, &tstat);
=20
-    result =3D (uint64_t)float64_to_float32(xb, &tstat);
+    sign =3D extract64(xb, 63,  1);
+    exp  =3D extract64(xb, 52, 11);
+    frac =3D extract64(xb,  0, 52) | 0x10000000000000ULL;
+
+    if (unlikely(exp =3D=3D 0 && extract64(frac, 0, 52) !=3D 0)) {
+        /* DP denormal operand.  */
+        /* Exponent override to DP min exp.  */
+        exp =3D 1;
+        /* Implicit bit override to 0.  */
+        frac =3D deposit64(frac, 53, 1, 0);
+    }
+
+    if (unlikely(exp < 897 && frac !=3D 0)) {
+        /* SP tiny operand.  */
+        if (897 - exp > 63) {
+            frac =3D 0;
+        } else {
+            /* Denormalize until exp =3D SP min exp.  */
+            frac >>=3D (897 - exp);
+        }
+        /* Exponent override to SP min exp - 1.  */
+        exp =3D 896;
+    }
+
+    result =3D sign << 31;
+    result |=3D extract64(exp, 10, 1) << 30;
+    result |=3D extract64(exp, 0, 7) << 23;
+    result |=3D extract64(frac, 29, 23);
+
     /* hardware replicates result to both words of the doubleword result=
.  */
     return (result << 32) | result;
 }
--=20
2.21.0


