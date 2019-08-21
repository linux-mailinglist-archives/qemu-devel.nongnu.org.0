Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B78973D0
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 09:48:50 +0200 (CEST)
Received: from localhost ([::1]:44632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0LMP-0005EO-2b
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 03:48:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42880)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1i0L1F-0005dT-2R
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 03:26:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1i0L1D-0000HU-Ou
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 03:26:56 -0400
Received: from ozlabs.org ([203.11.71.1]:41471)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1i0L1D-0000FX-DV; Wed, 21 Aug 2019 03:26:55 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46CzjH563Yz9sRJ; Wed, 21 Aug 2019 17:25:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1566372355;
 bh=LBLOm9mkU3pspBTmFyXrCZgMP0BWYNROIiCcVmX9xdo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Onds5MDIWLIR+JZjWNuPMM2aZVmrb9DaNjvWQ6husp3AfaCXb9rXwgugzfVwD33gK
 pJTrUnlkjGsFzbCb6xkuKL612g7g5x2NwEIN7fWY/75X3CHYHmKsaMXrj8X/ciFy+a
 +mZPIekN3jgxvbhdShG9ohuegXNfNfxArbejVRMA=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 21 Aug 2019 17:25:41 +1000
Message-Id: <20190821072542.23090-42-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190821072542.23090-1-david@gibson.dropbear.id.au>
References: <20190821072542.23090-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 41/42] ppc: Fix emulated INFINITY and NAN
 conversions
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 groug@kaod.org, qemu-ppc@nongnu.org, "Paul A. Clarke" <pc@us.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Paul A. Clarke" <pc@us.ibm.com>

helper_todouble() was not properly converting INFINITY from 32 bit
float to 64 bit double.

(Normalized operand conversion is unchanged, other than indentation.)

Signed-off-by: Paul A. Clarke <pc@us.ibm.com>
Message-Id: <1566242388-9244-1-git-send-email-pc@us.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/fpu_helper.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 23b9c97439..52bcda27a6 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -58,10 +58,17 @@ uint64_t helper_todouble(uint32_t arg)
     uint64_t ret;
=20
     if (likely(abs_arg >=3D 0x00800000)) {
-        /* Normalized operand, or Inf, or NaN.  */
-        ret  =3D (uint64_t)extract32(arg, 30, 2) << 62;
-        ret |=3D ((extract32(arg, 30, 1) ^ 1) * (uint64_t)7) << 59;
-        ret |=3D (uint64_t)extract32(arg, 0, 30) << 29;
+        if (unlikely(extract32(arg, 23, 8) =3D=3D 0xff)) {
+            /* Inf or NAN.  */
+            ret  =3D (uint64_t)extract32(arg, 31, 1) << 63;
+            ret |=3D (uint64_t)0x7ff << 52;
+            ret |=3D (uint64_t)extract32(arg, 0, 23) << 29;
+        } else {
+            /* Normalized operand.  */
+            ret  =3D (uint64_t)extract32(arg, 30, 2) << 62;
+            ret |=3D ((extract32(arg, 30, 1) ^ 1) * (uint64_t)7) << 59;
+            ret |=3D (uint64_t)extract32(arg, 0, 30) << 29;
+        }
     } else {
         /* Zero or Denormalized operand.  */
         ret =3D (uint64_t)extract32(arg, 31, 1) << 63;
--=20
2.21.0


