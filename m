Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B643897433
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 09:58:48 +0200 (CEST)
Received: from localhost ([::1]:44762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0LW3-0001X0-Ku
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 03:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42882)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1i0L1F-0005do-7u
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 03:26:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1i0L1E-0000Hx-1j
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 03:26:57 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:55877)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1i0L1D-0008WF-KT; Wed, 21 Aug 2019 03:26:55 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46CzjH0frgz9sR6; Wed, 21 Aug 2019 17:25:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1566372355;
 bh=09s3Sx5x9dItVKpkAhqcWtlr41w7mRGKr2ii2x7SWlc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gmuS3eI1p63ubtJ5yo2a1NHuAh2EYkDTZzZE2Z7EuNsu8dOBd+oOPGDWyg0zyOemG
 k/Oqc/lossuzOzdbd457fvu/xHMbkJxA0hysJbVT4PtkRYvfv3FqHYcdg0jaGppAhu
 No4rR3WVrN9uPtQm1+qjekeNwLYkFY2qk4kifgpw=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 21 Aug 2019 17:25:42 +1000
Message-Id: <20190821072542.23090-43-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190821072542.23090-1-david@gibson.dropbear.id.au>
References: <20190821072542.23090-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [PULL 42/42] ppc: Fix emulated single to double
 denormalized conversions
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

helper_todouble() was not properly converting any denormalized 32 bit
float to 64 bit double.

Fix-suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paul A. Clarke <pc@us.ibm.com>

v2:
- Splitting patch "ppc: Three floating point fixes"; this is just one par=
t.
- Original suggested "fix" was likely flawed.  v2 is rewritten by
  Richard Henderson (Thanks, Richard!); I reformatted the comments in a
  couple of places, compiled, and tested.
Message-Id: <1566250936-14538-1-git-send-email-pc@us.ibm.com>

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/fpu_helper.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 52bcda27a6..07bc9051b0 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -73,11 +73,20 @@ uint64_t helper_todouble(uint32_t arg)
         /* Zero or Denormalized operand.  */
         ret =3D (uint64_t)extract32(arg, 31, 1) << 63;
         if (unlikely(abs_arg !=3D 0)) {
-            /* Denormalized operand.  */
-            int shift =3D clz32(abs_arg) - 9;
-            int exp =3D -126 - shift + 1023;
+            /*
+             * Denormalized operand.
+             * Shift fraction so that the msb is in the implicit bit pos=
ition.
+             * Thus, shift is in the range [1:23].
+             */
+            int shift =3D clz32(abs_arg) - 8;
+            /*
+             * The first 3 terms compute the float64 exponent.  We then =
bias
+             * this result by -1 so that we can swallow the implicit bit=
 below.
+             */
+            int exp =3D -126 - shift + 1023 - 1;
+
             ret |=3D (uint64_t)exp << 52;
-            ret |=3D abs_arg << (shift + 29);
+            ret +=3D (uint64_t)abs_arg << (52 - 23 + shift);
         }
     }
     return ret;
--=20
2.21.0


