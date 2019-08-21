Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A1897462
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 10:08:12 +0200 (CEST)
Received: from localhost ([::1]:44898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0LfA-0005a4-3s
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 04:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43046)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1i0L1a-0006AG-61
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 03:27:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1i0L1Y-0000Ug-IN
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 03:27:18 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:35097)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1i0L1X-0000FZ-TR; Wed, 21 Aug 2019 03:27:16 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46CzjH3MCTz9sRK; Wed, 21 Aug 2019 17:25:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1566372355;
 bh=zJX1WYNT6gpp6KhwS3tqKkTcR3wZv/KDIUPLufTIcRk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Id8/Z6qxeqARbrFa8uRP+reOWdoUZdUDkPfRnHKm/SVQn0DrifE2AkbCNlHnonsh9
 bIFmlcucLHLR9j1RMzZFiwVjTkdAV08UBG71/ybLCO9qWfcwdfUxZ9i2PWGQ9fugJV
 tINr+Lc0HSrUtZPzkRTSWjXa+KbtJ19XrKeNfyhA=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 21 Aug 2019 17:25:39 +1000
Message-Id: <20190821072542.23090-40-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190821072542.23090-1-david@gibson.dropbear.id.au>
References: <20190821072542.23090-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [PULL 39/42] ppc: Add support for 'mffsl' instruction
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, "Paul A. Clarke" <pc@us.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Paul A. Clarke" <pc@us.ibm.com>

ISA 3.0B added a set of Floating-Point Status and Control Register (FPSCR=
)
instructions: mffsce, mffscdrn, mffscdrni, mffscrn, mffscrni, mffsl.
This patch adds support for 'mffsl'.

'mffsl' is identical to 'mffs', except it only returns mode, status, and =
enable
bits from the FPSCR.

On CPUs without support for 'mffsl' (below ISA 3.0), the 'mffsl' instruct=
ion
will execute identically to 'mffs'.

Note: I renamed FPSCR_RN to FPSCR_RN0 so I could create an FPSCR_RN mask =
which
is both bits of the FPSCR rounding mode, as defined in the ISA.

I also fixed a typo in the definition of FPSCR_FR.

Signed-off-by: Paul A. Clarke <pc@us.ibm.com>

v4:
- nit: added some braces to resolve a checkpatch complaint.

v3:
- Changed tcg_gen_and_i64 to tcg_gen_andi_i64, eliminating the need for a
  temporary, per review from Richard Henderson.

v2:
- I found that I copied too much of the 'mffs' implementation.
  The 'Rc' condition code bits are not needed for 'mffsl'.  Removed.
- I now free the (renamed) 'tmask' temporary.
- I now bail early for older ISA to the original 'mffs' implementation.

Message-Id: <1565982203-11048-1-git-send-email-pc@us.ibm.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 disas/ppc.c                        |  5 +++++
 target/ppc/cpu.h                   | 15 ++++++++++-----
 target/ppc/fpu_helper.c            |  4 ++--
 target/ppc/translate/fp-impl.inc.c | 22 ++++++++++++++++++++++
 target/ppc/translate/fp-ops.inc.c  |  4 +++-
 5 files changed, 42 insertions(+), 8 deletions(-)

diff --git a/disas/ppc.c b/disas/ppc.c
index a545437de9..63e97cfe1d 100644
--- a/disas/ppc.c
+++ b/disas/ppc.c
@@ -1765,6 +1765,9 @@ extract_tbr (unsigned long insn,
 /* An X_MASK with the RA and RB fields fixed.  */
 #define XRARB_MASK (X_MASK | RA_MASK | RB_MASK)
=20
+/* An X form instruction with the RA field fixed.  */
+#define XRA(op, xop, ra) (X((op), (xop)) | (((ra) << 16) & XRA_MASK))
+
 /* An XRARB_MASK, but with the L bit clear.  */
 #define XRLARB_MASK (XRARB_MASK & ~((unsigned long) 1 << 16))
=20
@@ -4998,6 +5001,8 @@ const struct powerpc_opcode powerpc_opcodes[] =3D {
 { "ddivq",   XRC(63,546,0), X_MASK,	POWER6,		{ FRT, FRA, FRB } },
 { "ddivq.",  XRC(63,546,1), X_MASK,	POWER6,		{ FRT, FRA, FRB } },
=20
+{ "mffsl",   XRA(63,583,12), XRARB_MASK,	POWER9,	{ FRT } },
+
 { "mffs",    XRC(63,583,0), XRARB_MASK,	COM,		{ FRT } },
 { "mffs.",   XRC(63,583,1), XRARB_MASK,	COM,		{ FRT } },
=20
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 4b35c8e4f4..eaee1a5575 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -591,7 +591,7 @@ enum {
 #define FPSCR_XE     3  /* Floating-point inexact exception enable      =
     */
 #define FPSCR_NI     2  /* Floating-point non-IEEE mode                 =
     */
 #define FPSCR_RN1    1
-#define FPSCR_RN     0  /* Floating-point rounding control              =
     */
+#define FPSCR_RN0    0  /* Floating-point rounding control              =
     */
 #define fpscr_fex    (((env->fpscr) >> FPSCR_FEX)    & 0x1)
 #define fpscr_vx     (((env->fpscr) >> FPSCR_VX)     & 0x1)
 #define fpscr_ox     (((env->fpscr) >> FPSCR_OX)     & 0x1)
@@ -614,7 +614,7 @@ enum {
 #define fpscr_ze     (((env->fpscr) >> FPSCR_ZE)     & 0x1)
 #define fpscr_xe     (((env->fpscr) >> FPSCR_XE)     & 0x1)
 #define fpscr_ni     (((env->fpscr) >> FPSCR_NI)     & 0x1)
-#define fpscr_rn     (((env->fpscr) >> FPSCR_RN)     & 0x3)
+#define fpscr_rn     (((env->fpscr) >> FPSCR_RN0)    & 0x3)
 /* Invalid operation exception summary */
 #define fpscr_ix ((env->fpscr) & ((1 << FPSCR_VXSNAN) | (1 << FPSCR_VXIS=
I)  | \
                                   (1 << FPSCR_VXIDI)  | (1 << FPSCR_VXZD=
Z)  | \
@@ -640,7 +640,7 @@ enum {
 #define FP_VXZDZ        (1ull << FPSCR_VXZDZ)
 #define FP_VXIMZ        (1ull << FPSCR_VXIMZ)
 #define FP_VXVC         (1ull << FPSCR_VXVC)
-#define FP_FR           (1ull << FSPCR_FR)
+#define FP_FR           (1ull << FPSCR_FR)
 #define FP_FI           (1ull << FPSCR_FI)
 #define FP_C            (1ull << FPSCR_C)
 #define FP_FL           (1ull << FPSCR_FL)
@@ -648,7 +648,7 @@ enum {
 #define FP_FE           (1ull << FPSCR_FE)
 #define FP_FU           (1ull << FPSCR_FU)
 #define FP_FPCC         (FP_FL | FP_FG | FP_FE | FP_FU)
-#define FP_FPRF         (FP_C  | FP_FL | FP_FG | FP_FE | FP_FU)
+#define FP_FPRF         (FP_C | FP_FPCC)
 #define FP_VXSOFT       (1ull << FPSCR_VXSOFT)
 #define FP_VXSQRT       (1ull << FPSCR_VXSQRT)
 #define FP_VXCVI        (1ull << FPSCR_VXCVI)
@@ -659,7 +659,12 @@ enum {
 #define FP_XE           (1ull << FPSCR_XE)
 #define FP_NI           (1ull << FPSCR_NI)
 #define FP_RN1          (1ull << FPSCR_RN1)
-#define FP_RN           (1ull << FPSCR_RN)
+#define FP_RN0          (1ull << FPSCR_RN0)
+#define FP_RN           (FP_RN1 | FP_RN0)
+
+#define FP_MODE         FP_RN
+#define FP_ENABLES      (FP_VE | FP_OE | FP_UE | FP_ZE | FP_XE)
+#define FP_STATUS       (FP_FR | FP_FI | FP_FPRF)
=20
 /* the exception bits which can be cleared by mcrfs - includes FX */
 #define FP_EX_CLEAR_BITS (FP_FX     | FP_OX     | FP_UX     | FP_ZX     =
| \
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index f437c88aad..5611cf0156 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -403,7 +403,7 @@ void helper_fpscr_clrbit(CPUPPCState *env, uint32_t b=
it)
     if (prev =3D=3D 1) {
         switch (bit) {
         case FPSCR_RN1:
-        case FPSCR_RN:
+        case FPSCR_RN0:
             fpscr_set_rounding_mode(env);
             break;
         case FPSCR_VXSNAN:
@@ -557,7 +557,7 @@ void helper_fpscr_setbit(CPUPPCState *env, uint32_t b=
it)
             }
             break;
         case FPSCR_RN1:
-        case FPSCR_RN:
+        case FPSCR_RN0:
             fpscr_set_rounding_mode(env);
             break;
         default:
diff --git a/target/ppc/translate/fp-impl.inc.c b/target/ppc/translate/fp=
-impl.inc.c
index 9dcff947c0..7cd9d8db05 100644
--- a/target/ppc/translate/fp-impl.inc.c
+++ b/target/ppc/translate/fp-impl.inc.c
@@ -617,6 +617,28 @@ static void gen_mffs(DisasContext *ctx)
     tcg_temp_free_i64(t0);
 }
=20
+/* mffsl */
+static void gen_mffsl(DisasContext *ctx)
+{
+    TCGv_i64 t0;
+
+    if (unlikely(!(ctx->insns_flags2 & PPC2_ISA300))) {
+        return gen_mffs(ctx);
+    }
+
+    if (unlikely(!ctx->fpu_enabled)) {
+        gen_exception(ctx, POWERPC_EXCP_FPU);
+        return;
+    }
+    t0 =3D tcg_temp_new_i64();
+    gen_reset_fpstatus();
+    tcg_gen_extu_tl_i64(t0, cpu_fpscr);
+    /* Mask everything except mode, status, and enables.  */
+    tcg_gen_andi_i64(t0, t0, FP_MODE | FP_STATUS | FP_ENABLES);
+    set_fpr(rD(ctx->opcode), t0);
+    tcg_temp_free_i64(t0);
+}
+
 /* mtfsb0 */
 static void gen_mtfsb0(DisasContext *ctx)
 {
diff --git a/target/ppc/translate/fp-ops.inc.c b/target/ppc/translate/fp-=
ops.inc.c
index 621f6bfe0c..88ebc2526c 100644
--- a/target/ppc/translate/fp-ops.inc.c
+++ b/target/ppc/translate/fp-ops.inc.c
@@ -104,7 +104,9 @@ GEN_HANDLER_E(fcpsgn, 0x3F, 0x08, 0x00, 0x00000000, P=
PC_NONE, PPC2_ISA205),
 GEN_HANDLER_E(fmrgew, 0x3F, 0x06, 0x1E, 0x00000001, PPC_NONE, PPC2_VSX20=
7),
 GEN_HANDLER_E(fmrgow, 0x3F, 0x06, 0x1A, 0x00000001, PPC_NONE, PPC2_VSX20=
7),
 GEN_HANDLER(mcrfs, 0x3F, 0x00, 0x02, 0x0063F801, PPC_FLOAT),
-GEN_HANDLER(mffs, 0x3F, 0x07, 0x12, 0x001FF800, PPC_FLOAT),
+GEN_HANDLER_E_2(mffs, 0x3F, 0x07, 0x12, 0x00, 0x00000000, PPC_FLOAT, PPC=
_NONE),
+GEN_HANDLER_E_2(mffsl, 0x3F, 0x07, 0x12, 0x18, 0x00000000, PPC_FLOAT,
+    PPC2_ISA300),
 GEN_HANDLER(mtfsb0, 0x3F, 0x06, 0x02, 0x001FF800, PPC_FLOAT),
 GEN_HANDLER(mtfsb1, 0x3F, 0x06, 0x01, 0x001FF800, PPC_FLOAT),
 GEN_HANDLER(mtfsf, 0x3F, 0x07, 0x16, 0x00000000, PPC_FLOAT),
--=20
2.21.0


