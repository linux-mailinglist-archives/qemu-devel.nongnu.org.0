Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCC64B6B2
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jun 2019 13:07:34 +0200 (CEST)
Received: from localhost ([::1]:36906 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdYRB-0003nd-4B
	for lists+qemu-devel@lfdr.de; Wed, 19 Jun 2019 07:07:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36330)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefan.brankovic@rt-rk.com>) id 1hdYOj-0002Cv-Vs
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 07:05:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefan.brankovic@rt-rk.com>) id 1hdYOi-0006L5-7U
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 07:05:01 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:54795 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefan.brankovic@rt-rk.com>)
 id 1hdYOh-0001iw-SG
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 07:05:00 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 04B991A46AB;
 Wed, 19 Jun 2019 13:03:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw870-lin.domain.local (rtrkw870-lin.domain.local
 [10.10.13.132])
 by mail.rt-rk.com (Postfix) with ESMTPSA id D89691A45CE;
 Wed, 19 Jun 2019 13:03:54 +0200 (CEST)
From: Stefan Brankovic <stefan.brankovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Wed, 19 Jun 2019 13:03:38 +0200
Message-Id: <1560942225-24728-2-git-send-email-stefan.brankovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560942225-24728-1-git-send-email-stefan.brankovic@rt-rk.com>
References: <1560942225-24728-1-git-send-email-stefan.brankovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH 1/8] target/ppc: Optimize emulation of lvsl and
 lvsr instructions
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
Cc: david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adding simple macro that is calling tcg implementation of appropriate
instruction if altivec support is active.

Optimization of altivec instruction lvsl (Load Vector for Shift Left).
Place bytes sh:sh+15 of value 0x00 || 0x01 || 0x02 || ... || 0x1E || 0x1F
in destination register. Sh is calculated by adding 2 source registers an=
d
getting bits 60-63 of result.

First, the bits [28-31] are placed from EA to variable sh. After that,
the bytes are created in the following way:
sh:(sh+7) of X(from description) by multiplying sh with 0x010101010101010=
1
followed by addition of the result with 0x0001020304050607. Value obtaine=
d
is placed in higher doubleword element of vD.
(sh+8):(sh+15) by adding the result of previous multiplication with
0x08090a0b0c0d0e0f. Value obtained is placed in lower doubleword element
of vD.

Optimization of altivec instruction lvsr (Load Vector for Shift Right).
Place bytes 16-sh:31-sh of value 0x00 || 0x01 || 0x02 || ... || 0x1E ||
0x1F in destination register. Sh is calculated by adding 2 source
registers and getting bits 60-63 of result.

First, the bits [28-31] are placed from EA to variable sh. After that,
the bytes are created in the following way:
sh:(sh+7) of X(from description) by multiplying sh with 0x010101010101010=
1
followed by substraction of the result from 0x1011121314151617. Value
obtained is placed in higher doubleword element of vD.
(sh+8):(sh+15) by substracting the result of previous multiplication from
0x18191a1b1c1d1e1f. Value obtained is placed in lower doubleword element
of vD.

Signed-off-by: Stefan Brankovic <stefan.brankovic@rt-rk.com>
---
 target/ppc/helper.h                 |   2 -
 target/ppc/int_helper.c             |  18 ------
 target/ppc/translate/vmx-impl.inc.c | 120 ++++++++++++++++++++++++++----=
------
 3 files changed, 88 insertions(+), 52 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 02b67a3..c82105e 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -189,8 +189,6 @@ DEF_HELPER_2(vprtybw, void, avr, avr)
 DEF_HELPER_2(vprtybd, void, avr, avr)
 DEF_HELPER_2(vprtybq, void, avr, avr)
 DEF_HELPER_3(vsubcuw, void, avr, avr, avr)
-DEF_HELPER_2(lvsl, void, avr, tl)
-DEF_HELPER_2(lvsr, void, avr, tl)
 DEF_HELPER_FLAGS_5(vaddsbs, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i=
32)
 DEF_HELPER_FLAGS_5(vaddshs, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i=
32)
 DEF_HELPER_FLAGS_5(vaddsws, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i=
32)
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 8ce89f2..9505f4c 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -457,24 +457,6 @@ SATCVT(sd, uw, int64_t, uint32_t, 0, UINT32_MAX)
 #undef SATCVT
 #undef SATCVTU
=20
-void helper_lvsl(ppc_avr_t *r, target_ulong sh)
-{
-    int i, j =3D (sh & 0xf);
-
-    for (i =3D 0; i < ARRAY_SIZE(r->u8); i++) {
-        r->VsrB(i) =3D j++;
-    }
-}
-
-void helper_lvsr(ppc_avr_t *r, target_ulong sh)
-{
-    int i, j =3D 0x10 - (sh & 0xf);
-
-    for (i =3D 0; i < ARRAY_SIZE(r->u8); i++) {
-        r->VsrB(i) =3D j++;
-    }
-}
-
 void helper_mtvscr(CPUPPCState *env, uint32_t vscr)
 {
     env->vscr =3D vscr & ~(1u << VSCR_SAT);
diff --git a/target/ppc/translate/vmx-impl.inc.c b/target/ppc/translate/v=
mx-impl.inc.c
index 663275b..482e2ee 100644
--- a/target/ppc/translate/vmx-impl.inc.c
+++ b/target/ppc/translate/vmx-impl.inc.c
@@ -142,38 +142,6 @@ GEN_VR_STVE(bx, 0x07, 0x04, 1);
 GEN_VR_STVE(hx, 0x07, 0x05, 2);
 GEN_VR_STVE(wx, 0x07, 0x06, 4);
=20
-static void gen_lvsl(DisasContext *ctx)
-{
-    TCGv_ptr rd;
-    TCGv EA;
-    if (unlikely(!ctx->altivec_enabled)) {
-        gen_exception(ctx, POWERPC_EXCP_VPU);
-        return;
-    }
-    EA =3D tcg_temp_new();
-    gen_addr_reg_index(ctx, EA);
-    rd =3D gen_avr_ptr(rD(ctx->opcode));
-    gen_helper_lvsl(rd, EA);
-    tcg_temp_free(EA);
-    tcg_temp_free_ptr(rd);
-}
-
-static void gen_lvsr(DisasContext *ctx)
-{
-    TCGv_ptr rd;
-    TCGv EA;
-    if (unlikely(!ctx->altivec_enabled)) {
-        gen_exception(ctx, POWERPC_EXCP_VPU);
-        return;
-    }
-    EA =3D tcg_temp_new();
-    gen_addr_reg_index(ctx, EA);
-    rd =3D gen_avr_ptr(rD(ctx->opcode));
-    gen_helper_lvsr(rd, EA);
-    tcg_temp_free(EA);
-    tcg_temp_free_ptr(rd);
-}
-
 static void gen_mfvscr(DisasContext *ctx)
 {
     TCGv_i32 t;
@@ -316,6 +284,16 @@ static void glue(gen_, name)(DisasContext *ctx)     =
                    \
     tcg_temp_free_ptr(rd);                                              =
\
 }
=20
+#define GEN_VXFORM_TRANS(name, opc2, opc3)                              =
\
+static void glue(gen_, name)(DisasContext *ctx)                         =
\
+{                                                                       =
\
+    if (unlikely(!ctx->altivec_enabled)) {                              =
\
+        gen_exception(ctx, POWERPC_EXCP_VPU);                           =
\
+        return;                                                         =
\
+    }                                                                   =
\
+    trans_##name(ctx);                                                  =
\
+}
+
 #define GEN_VXFORM_ENV(name, opc2, opc3)                                =
\
 static void glue(gen_, name)(DisasContext *ctx)                         =
\
 {                                                                       =
\
@@ -515,6 +493,82 @@ static void gen_vmrgow(DisasContext *ctx)
     tcg_temp_free_i64(avr);
 }
=20
+/*
+ * lvsl VRT,RA,RB - Load Vector for Shift Left
+ *
+ * Let the EA be the sum (rA|0)+(rB). Let sh=3DEA[28=E2=80=9331].
+ * Let X be the 32-byte value 0x00 || 0x01 || 0x02 || ... || 0x1E || 0x1=
F.
+ * Bytes sh:sh+15 of X are placed into vD.
+ */
+static void trans_lvsl(DisasContext *ctx)
+{
+    int VT =3D rD(ctx->opcode);
+    TCGv_i64 result =3D tcg_temp_new_i64();
+    TCGv_i64 sh =3D tcg_temp_new_i64();
+    TCGv EA =3D tcg_temp_new();
+
+    /* Get sh(from description) by anding EA with 0xf. */
+    gen_addr_reg_index(ctx, EA);
+    tcg_gen_ext_i32_i64(sh, EA);
+    tcg_gen_andi_i64(sh, sh, 0xfULL);
+
+    /*
+     * Create bytes sh:sh+7 of X(from description) and place them in
+     * higher doubleword of vD.
+     */
+    tcg_gen_muli_i64(sh, sh, 0x0101010101010101ULL);
+    tcg_gen_addi_i64(result, sh, 0x0001020304050607ull);
+    set_avr64(VT, result, true);
+    /*
+     * Create bytes sh+8:sh+15 of X(from description) and place them in
+     * lower doubleword of vD.
+     */
+    tcg_gen_addi_i64(result, sh, 0x08090a0b0c0d0e0fULL);
+    set_avr64(VT, result, false);
+
+    tcg_temp_free_i64(result);
+    tcg_temp_free_i64(sh);
+    tcg_temp_free(EA);
+}
+
+/*
+ * lvsr VRT,RA,RB - Load Vector for Shift Right
+ *
+ * Let the EA be the sum (rA|0)+(rB). Let sh=3DEA[28=E2=80=9331].
+ * Let X be the 32-byte value 0x00 || 0x01 || 0x02 || ... || 0x1E || 0x1=
F.
+ * Bytes (16-sh):(31-sh) of X are placed into vD.
+ */
+static void trans_lvsr(DisasContext *ctx)
+{
+    int VT =3D rD(ctx->opcode);
+    TCGv_i64 result =3D tcg_temp_new_i64();
+    TCGv_i64 sh =3D tcg_temp_new_i64();
+    TCGv EA =3D tcg_temp_new();
+
+
+    /* Get sh(from description) by anding EA with 0xf. */
+    gen_addr_reg_index(ctx, EA);
+    tcg_gen_ext_i32_i64(sh, EA);
+    tcg_gen_andi_i64(sh, sh, 0xfULL);
+    /*
+     * Create bytes (16-sh):(23-sh) of X(from description) and place the=
m in
+     * higher doubleword of vD.
+     */
+    tcg_gen_muli_i64(sh, sh, 0x0101010101010101ULL);
+    tcg_gen_subfi_i64(result, 0x1011121314151617ULL, sh);
+    set_avr64(VT, result, true);
+    /*
+     * Create bytes (24-sh):(32-sh) of X(from description) and place the=
m in
+     * lower doubleword of vD.
+     */
+    tcg_gen_subfi_i64(result, 0x18191a1b1c1d1e1fULL, sh);
+    set_avr64(VT, result, false);
+
+    tcg_temp_free_i64(result);
+    tcg_temp_free_i64(sh);
+    tcg_temp_free(EA);
+}
+
 GEN_VXFORM(vmuloub, 4, 0);
 GEN_VXFORM(vmulouh, 4, 1);
 GEN_VXFORM(vmulouw, 4, 2);
@@ -662,6 +716,8 @@ GEN_VXFORM_DUAL(vmrgow, PPC_NONE, PPC2_ALTIVEC_207,
 GEN_VXFORM_HETRO(vextubrx, 6, 28)
 GEN_VXFORM_HETRO(vextuhrx, 6, 29)
 GEN_VXFORM_HETRO(vextuwrx, 6, 30)
+GEN_VXFORM_TRANS(lvsl, 6, 31)
+GEN_VXFORM_TRANS(lvsr, 6, 32)
 GEN_VXFORM_DUAL(vmrgew, PPC_NONE, PPC2_ALTIVEC_207, \
                 vextuwrx, PPC_NONE, PPC2_ISA300)
=20
--=20
2.7.4


