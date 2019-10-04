Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1765CB7AB
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 11:52:53 +0200 (CEST)
Received: from localhost ([::1]:43902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGKGa-0002Rm-7u
	for lists+qemu-devel@lfdr.de; Fri, 04 Oct 2019 05:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52351)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iGK2H-0004sX-R6
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:38:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iGK2F-00054A-Lt
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:38:05 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:58775)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iGK2F-0004zx-7u; Fri, 04 Oct 2019 05:38:03 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46l4YG5G6qz9sRH; Fri,  4 Oct 2019 19:37:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1570181874;
 bh=wMSJrTrrk3rDaatkmeiMUkI8qRp5yU1grK2SOBjNKd0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ro7mP7eZYfhffcGYD8De1G9roAb9DpWO2ghz1M1Q2C08piAVTRO9hXdyMY4j4SUgf
 gNOTPfRNZDKoA941UnCQH8DnqS+FO9T2Ly5hOG0hECY7XIOn++/+4PTYPSV7pa1gR4
 zGSQKU9AOwhQPZ5uhwj9MLmVt/wZEy5MmSt7McTo=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 11/53] ppc: Add support for 'mffscrn','mffscrni' instructions
Date: Fri,  4 Oct 2019 19:37:05 +1000
Message-Id: <20191004093747.31350-12-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191004093747.31350-1-david@gibson.dropbear.id.au>
References: <20191004093747.31350-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org,
 David Gibson <david@gibson.dropbear.id.au>, "Paul A. Clarke" <pc@us.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Paul A. Clarke" <pc@us.ibm.com>

ISA 3.0B added a set of Floating-Point Status and Control Register (FPSCR=
)
instructions: mffsce, mffscdrn, mffscdrni, mffscrn, mffscrni, mffsl.
This patch adds support for 'mffscrn' and 'mffscrni' instructions.

'mffscrn' and 'mffscrni' are similar to 'mffsl', except they do not retur=
n
the status bits (FI, FR, FPRF) and they also set the rounding mode in the
FPSCR.

On CPUs without support for 'mffscrn'/'mffscrni' (below ISA 3.0), the
instructions will execute identically to 'mffs'.

Signed-off-by: Paul A. Clarke <pc@us.ibm.com>
Message-Id: <1568817081-1345-1-git-send-email-pc@us.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu.h                   |  9 +++-
 target/ppc/dfp_helper.c            |  2 +-
 target/ppc/internal.h              |  3 ++
 target/ppc/translate/fp-impl.inc.c | 69 +++++++++++++++++++++++++++++-
 target/ppc/translate/fp-ops.inc.c  |  4 ++
 5 files changed, 84 insertions(+), 3 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index eaee1a5575..a23c6455b9 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -559,6 +559,9 @@ enum {
=20
 /***********************************************************************=
******/
 /* Floating point status and control register                           =
     */
+#define FPSCR_DRN2   34 /* Decimal Floating-Point rounding control      =
     */
+#define FPSCR_DRN1   33 /* Decimal Floating-Point rounding control      =
     */
+#define FPSCR_DRN0   32 /* Decimal Floating-Point rounding control      =
     */
 #define FPSCR_FX     31 /* Floating-point exception summary             =
     */
 #define FPSCR_FEX    30 /* Floating-point enabled exception summary     =
     */
 #define FPSCR_VX     29 /* Floating-point invalid operation exception su=
mm.  */
@@ -592,6 +595,7 @@ enum {
 #define FPSCR_NI     2  /* Floating-point non-IEEE mode                 =
     */
 #define FPSCR_RN1    1
 #define FPSCR_RN0    0  /* Floating-point rounding control              =
     */
+#define fpscr_drn    (((env->fpscr) & FP_DRN) >> FPSCR_DRN0)
 #define fpscr_fex    (((env->fpscr) >> FPSCR_FEX)    & 0x1)
 #define fpscr_vx     (((env->fpscr) >> FPSCR_VX)     & 0x1)
 #define fpscr_ox     (((env->fpscr) >> FPSCR_OX)     & 0x1)
@@ -627,6 +631,10 @@ enum {
 #define fpscr_eex (((env->fpscr) >> FPSCR_XX) & ((env->fpscr) >> FPSCR_X=
E) &  \
                    0x1F)
=20
+#define FP_DRN2         (1ull << FPSCR_DRN2)
+#define FP_DRN1         (1ull << FPSCR_DRN1)
+#define FP_DRN0         (1ull << FPSCR_DRN0)
+#define FP_DRN          (FP_DRN2 | FP_DRN1 | FP_DRN0)
 #define FP_FX           (1ull << FPSCR_FX)
 #define FP_FEX          (1ull << FPSCR_FEX)
 #define FP_VX           (1ull << FPSCR_VX)
@@ -662,7 +670,6 @@ enum {
 #define FP_RN0          (1ull << FPSCR_RN0)
 #define FP_RN           (FP_RN1 | FP_RN0)
=20
-#define FP_MODE         FP_RN
 #define FP_ENABLES      (FP_VE | FP_OE | FP_UE | FP_ZE | FP_XE)
 #define FP_STATUS       (FP_FR | FP_FI | FP_FPRF)
=20
diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
index f102177572..da8e08a35c 100644
--- a/target/ppc/dfp_helper.c
+++ b/target/ppc/dfp_helper.c
@@ -48,7 +48,7 @@ static void dfp_prepare_rounding_mode(decContext *conte=
xt, uint64_t fpscr)
 {
     enum rounding rnd;
=20
-    switch ((fpscr >> 32) & 0x7) {
+    switch ((fpscr & FP_DRN) >> FPSCR_DRN0) {
     case 0:
         rnd =3D DEC_ROUND_HALF_EVEN;
         break;
diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index d3d327e548..15d655b356 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -157,6 +157,9 @@ EXTRACT_HELPER(FPL, 25, 1);
 EXTRACT_HELPER(FPFLM, 17, 8);
 EXTRACT_HELPER(FPW, 16, 1);
=20
+/* mffscrni */
+EXTRACT_HELPER(RM, 11, 2);
+
 /* addpcis */
 EXTRACT_HELPER_SPLIT_3(DX, 10, 6, 6, 5, 16, 1, 1, 0, 0)
 #if defined(TARGET_PPC64)
diff --git a/target/ppc/translate/fp-impl.inc.c b/target/ppc/translate/fp=
-impl.inc.c
index 7cd9d8db05..75f9523b07 100644
--- a/target/ppc/translate/fp-impl.inc.c
+++ b/target/ppc/translate/fp-impl.inc.c
@@ -634,11 +634,78 @@ static void gen_mffsl(DisasContext *ctx)
     gen_reset_fpstatus();
     tcg_gen_extu_tl_i64(t0, cpu_fpscr);
     /* Mask everything except mode, status, and enables.  */
-    tcg_gen_andi_i64(t0, t0, FP_MODE | FP_STATUS | FP_ENABLES);
+    tcg_gen_andi_i64(t0, t0, FP_DRN | FP_STATUS | FP_ENABLES | FP_RN);
     set_fpr(rD(ctx->opcode), t0);
     tcg_temp_free_i64(t0);
 }
=20
+static void gen_helper_mffscrn(DisasContext *ctx, TCGv_i64 t1)
+{
+    TCGv_i64 t0 =3D tcg_temp_new_i64();
+    TCGv_i32 mask =3D tcg_const_i32(0x0001);
+
+    gen_reset_fpstatus();
+    tcg_gen_extu_tl_i64(t0, cpu_fpscr);
+    tcg_gen_andi_i64(t0, t0, FP_DRN | FP_ENABLES | FP_RN);
+    set_fpr(rD(ctx->opcode), t0);
+
+    /* Mask FPSCR value to clear RN.  */
+    tcg_gen_andi_i64(t0, t0, ~FP_RN);
+
+    /* Merge RN into FPSCR value.  */
+    tcg_gen_or_i64(t0, t0, t1);
+
+    gen_helper_store_fpscr(cpu_env, t0, mask);
+
+    tcg_temp_free_i32(mask);
+    tcg_temp_free_i64(t0);
+}
+
+/* mffscrn */
+static void gen_mffscrn(DisasContext *ctx)
+{
+    TCGv_i64 t1;
+
+    if (unlikely(!(ctx->insns_flags2 & PPC2_ISA300))) {
+        return gen_mffs(ctx);
+    }
+
+    if (unlikely(!ctx->fpu_enabled)) {
+        gen_exception(ctx, POWERPC_EXCP_FPU);
+        return;
+    }
+
+    t1 =3D tcg_temp_new_i64();
+    get_fpr(t1, rB(ctx->opcode));
+    /* Mask FRB to get just RN.  */
+    tcg_gen_andi_i64(t1, t1, FP_RN);
+
+    gen_helper_mffscrn(ctx, t1);
+
+    tcg_temp_free_i64(t1);
+}
+
+/* mffscrni */
+static void gen_mffscrni(DisasContext *ctx)
+{
+    TCGv_i64 t1;
+
+    if (unlikely(!(ctx->insns_flags2 & PPC2_ISA300))) {
+        return gen_mffs(ctx);
+    }
+
+    if (unlikely(!ctx->fpu_enabled)) {
+        gen_exception(ctx, POWERPC_EXCP_FPU);
+        return;
+    }
+
+    t1 =3D tcg_const_i64((uint64_t)RM(ctx->opcode));
+
+    gen_helper_mffscrn(ctx, t1);
+
+    tcg_temp_free_i64(t1);
+}
+
 /* mtfsb0 */
 static void gen_mtfsb0(DisasContext *ctx)
 {
diff --git a/target/ppc/translate/fp-ops.inc.c b/target/ppc/translate/fp-=
ops.inc.c
index 88ebc2526c..f2bcf0e67b 100644
--- a/target/ppc/translate/fp-ops.inc.c
+++ b/target/ppc/translate/fp-ops.inc.c
@@ -107,6 +107,10 @@ GEN_HANDLER(mcrfs, 0x3F, 0x00, 0x02, 0x0063F801, PPC=
_FLOAT),
 GEN_HANDLER_E_2(mffs, 0x3F, 0x07, 0x12, 0x00, 0x00000000, PPC_FLOAT, PPC=
_NONE),
 GEN_HANDLER_E_2(mffsl, 0x3F, 0x07, 0x12, 0x18, 0x00000000, PPC_FLOAT,
     PPC2_ISA300),
+GEN_HANDLER_E_2(mffscrn, 0x3F, 0x07, 0x12, 0x16, 0x00000000, PPC_FLOAT,
+    PPC_NONE),
+GEN_HANDLER_E_2(mffscrni, 0x3F, 0x07, 0x12, 0x17, 0x00000000, PPC_FLOAT,
+    PPC_NONE),
 GEN_HANDLER(mtfsb0, 0x3F, 0x06, 0x02, 0x001FF800, PPC_FLOAT),
 GEN_HANDLER(mtfsb1, 0x3F, 0x06, 0x01, 0x001FF800, PPC_FLOAT),
 GEN_HANDLER(mtfsf, 0x3F, 0x07, 0x16, 0x00000000, PPC_FLOAT),
--=20
2.21.0


