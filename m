Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 520ABCB7BC
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 11:57:47 +0200 (CEST)
Received: from localhost ([::1]:43954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGKLJ-0007n0-Tq
	for lists+qemu-devel@lfdr.de; Fri, 04 Oct 2019 05:57:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52778)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iGK2i-0005Lf-8p
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:38:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iGK2g-0005Tt-HO
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:38:32 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:38251 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iGK2g-0005RR-2Z; Fri, 04 Oct 2019 05:38:30 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46l4YL5N2Mz9sRw; Fri,  4 Oct 2019 19:37:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1570181878;
 bh=mcYe6Whs+n4x6tJ7GY0LQhcrxugvkVwyWbic5PeYlWk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gbceV4dWOdnE96x47Itx3ck2EWu2eJGP1xjgSqjXrPeubgvUkC1YgBE0GRxc2jbhS
 xewc2HY3tdx/U0VUZ+ZVFJQ5APOOv+6aqviSQpWXon0Pf8B3B+VJkXOtJYJW9injUf
 D197f5VtXU5M7iqfF/8vT9ZrZENN014HyHCVhefo=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 28/53] target/ppc: remove unnecessary if() around calls to
 set_dfp{64, 128}() in DFP macros
Date: Fri,  4 Oct 2019 19:37:22 +1000
Message-Id: <20191004093747.31350-29-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004093747.31350-1-david@gibson.dropbear.id.au>
References: <20191004093747.31350-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Now that the parameters to both set_dfp64() and set_dfp128() are exactly =
the
same, there is no need for an explicit if() statement to determine which
function should be called based upon size. Instead we can simply use the
preprocessor to generate the call to set_dfp##size() directly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20190926185801.11176-8-mark.cave-ayland@ilande.co.uk>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/dfp_helper.c | 60 +++++++----------------------------------
 1 file changed, 10 insertions(+), 50 deletions(-)

diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
index c2bb458a78..2c65badae4 100644
--- a/target/ppc/dfp_helper.c
+++ b/target/ppc/dfp_helper.c
@@ -427,11 +427,7 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, pp=
c_fprp_t *a,               \
     dnop(&dfp.t, &dfp.a, &dfp.b, &dfp.context);                         =
       \
     dfp_finalize_decimal##size(&dfp);                                   =
       \
     postprocs(&dfp);                                                    =
       \
-    if (size =3D=3D 64) {                                               =
           \
-        set_dfp64(t, &dfp.vt);                                          =
       \
-    } else if (size =3D=3D 128) {                                       =
           \
-        set_dfp128(t, &dfp.vt);                                         =
       \
-    }                                                                   =
       \
+    set_dfp##size(t, &dfp.vt);                                          =
       \
 }
=20
 static void ADD_PPs(struct PPC_DFP *dfp)
@@ -747,11 +743,7 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, pp=
c_fprp_t *b,        \
     dfp_finalize_decimal##size(&dfp);                                   =
\
     QUA_PPs(&dfp);                                                      =
\
                                                                         =
\
-    if (size =3D=3D 64) {                                               =
    \
-        set_dfp64(t, &dfp.vt);                                          =
\
-    } else if (size =3D=3D 128) {                                       =
    \
-        set_dfp128(t, &dfp.vt);                                         =
\
-    }                                                                   =
\
+    set_dfp##size(t, &dfp.vt);                                          =
\
 }
=20
 DFP_HELPER_QUAI(dquai, 64)
@@ -769,11 +761,7 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, pp=
c_fprp_t *a,        \
     dfp_finalize_decimal##size(&dfp);                                   =
\
     QUA_PPs(&dfp);                                                      =
\
                                                                         =
\
-    if (size =3D=3D 64) {                                               =
    \
-        set_dfp64(t, &dfp.vt);                                          =
\
-    } else if (size =3D=3D 128) {                                       =
    \
-        set_dfp128(t, &dfp.vt);                                         =
\
-    }                                                                   =
\
+    set_dfp##size(t, &dfp.vt);                                          =
\
 }
=20
 DFP_HELPER_QUA(dqua, 64)
@@ -851,11 +839,7 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, pp=
c_fprp_t *a,        \
     dfp_finalize_decimal##size(&dfp);                                   =
\
     QUA_PPs(&dfp);                                                      =
\
                                                                         =
\
-    if (size =3D=3D 64) {                                               =
    \
-        set_dfp64(t, &dfp.vt);                                          =
\
-    } else if (size =3D=3D 128) {                                       =
    \
-        set_dfp128(t, &dfp.vt);                                         =
\
-    }                                                                   =
\
+    set_dfp##size(t, &dfp.vt);                                          =
\
 }
=20
 DFP_HELPER_RRND(drrnd, 64)
@@ -874,11 +858,7 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, pp=
c_fprp_t *b,               \
     dfp_finalize_decimal##size(&dfp);                                   =
       \
     postprocs(&dfp);                                                    =
       \
                                                                         =
       \
-    if (size =3D=3D 64) {                                               =
           \
-        set_dfp64(t, &dfp.vt);                                          =
       \
-    } else if (size =3D=3D 128) {                                       =
           \
-        set_dfp128(t, &dfp.vt);                                         =
       \
-    }                                                                   =
       \
+    set_dfp##size(t, &dfp.vt);                                          =
       \
 }
=20
 static void RINTX_PPs(struct PPC_DFP *dfp)
@@ -978,11 +958,7 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, pp=
c_fprp_t *b)               \
     dfp_finalize_decimal##size(&dfp);                                   =
       \
     CFFIX_PPs(&dfp);                                                    =
       \
                                                                         =
       \
-    if (size =3D=3D 64) {                                               =
           \
-        set_dfp64(t, &dfp.vt);                                          =
       \
-    } else if (size =3D=3D 128) {                                       =
           \
-        set_dfp128(t, &dfp.vt);                                         =
       \
-    }                                                                   =
       \
+    set_dfp##size(t, &dfp.vt);                                          =
       \
 }
=20
 static void CFFIX_PPs(struct PPC_DFP *dfp)
@@ -1088,11 +1064,7 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, =
ppc_fprp_t *b,          \
         dfp_set_sign_##size(&dfp.vt, sgn);                              =
  \
     }                                                                   =
  \
                                                                         =
  \
-    if (size =3D=3D 64) {                                               =
      \
-        set_dfp64(t, &dfp.vt);                                          =
  \
-    } else if (size =3D=3D 128) {                                       =
      \
-        set_dfp128(t, &dfp.vt);                                         =
  \
-    }                                                                   =
  \
+    set_dfp##size(t, &dfp.vt);                                          =
  \
 }
=20
 DFP_HELPER_DEDPD(ddedpd, 64)
@@ -1160,11 +1132,7 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, =
ppc_fprp_t *b,             \
     }                                                                   =
     \
     dfp_finalize_decimal##size(&dfp);                                   =
     \
     dfp_set_FPRF_from_FRT(&dfp);                                        =
     \
-    if ((size) =3D=3D 64) {                                             =
         \
-        set_dfp64(t, &dfp.vt);                                          =
     \
-    } else if ((size) =3D=3D 128) {                                     =
         \
-        set_dfp128(t, &dfp.vt);                                         =
     \
-    }                                                                   =
     \
+    set_dfp##size(t, &dfp.vt);                                          =
     \
 }
=20
 DFP_HELPER_ENBCD(denbcd, 64)
@@ -1264,11 +1232,7 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, =
ppc_fprp_t *a,          \
         dfp.t.exponent =3D exp - bias;                                  =
    \
         dfp_finalize_decimal##size(&dfp);                               =
  \
     }                                                                   =
  \
-    if (size =3D=3D 64) {                                               =
      \
-        set_dfp64(t, &dfp.vt);                                          =
  \
-    } else if (size =3D=3D 128) {                                       =
      \
-        set_dfp128(t, &dfp.vt);                                         =
  \
-    }                                                                   =
  \
+    set_dfp##size(t, &dfp.vt);                                          =
  \
 }
=20
 DFP_HELPER_IEX(diex, 64)
@@ -1356,11 +1320,7 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, =
ppc_fprp_t *a,    \
         }                                                           \
     }                                                               \
                                                                     \
-    if ((size) =3D=3D 64) {                                             =
\
-        set_dfp64(t, &dfp.vt);                                      \
-    } else {                                                        \
-        set_dfp128(t, &dfp.vt);                                     \
-    }                                                               \
+    set_dfp##size(t, &dfp.vt);                                      \
 }
=20
 DFP_HELPER_SHIFT(dscli, 64, 1)
--=20
2.21.0


