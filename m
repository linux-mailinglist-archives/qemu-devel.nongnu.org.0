Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB1C44A728
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 07:59:59 +0100 (CET)
Received: from localhost ([::1]:37312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkL6s-0005HJ-Il
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 01:59:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK4d-0005Yk-P3; Tue, 09 Nov 2021 00:53:35 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=37801
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK4b-0006t8-ED; Tue, 09 Nov 2021 00:53:35 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HpHDp4JCKz4xfB; Tue,  9 Nov 2021 16:52:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636437130;
 bh=uPraHIefOUE0gffxtNAaj747mJLNQceg/3S/tIFktSw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B72oPyZWo4yHFdMqRk7nT99NLIW1ASDLOo1FUKXZzy6d6DrveNA9X3sCOv8FzZ/NY
 OieAW2CcSU/mFpu61hI7vmRJSh1sdU078oGZdecxqkZe3l3EVazKxMSMHd5zyOmUa0
 Ijlo6QFm/verI3KmYyk+35xOEEzBXNMXeQ5d8gFA=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 groug@kaod.org
Subject: [PULL 35/54] target/ppc: Move vinsertb/vinserth/vinsertw/vinsertd to
 decodetree
Date: Tue,  9 Nov 2021 16:51:45 +1100
Message-Id: <20211109055204.230765-36-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211109055204.230765-1-david@gibson.dropbear.id.au>
References: <20211109055204.230765-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20211104123719.323713-9-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/helper.h                 |  4 ----
 target/ppc/insn32.decode            |  5 +++++
 target/ppc/int_helper.c             | 21 -------------------
 target/ppc/translate/vmx-impl.c.inc | 32 ++++++++++++++++++++---------
 target/ppc/translate/vmx-ops.c.inc  | 10 +++------
 5 files changed, 30 insertions(+), 42 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 80f88ce78b..356495f392 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -224,10 +224,6 @@ DEF_HELPER_3(vextractub, void, avr, avr, i32)
 DEF_HELPER_3(vextractuh, void, avr, avr, i32)
 DEF_HELPER_3(vextractuw, void, avr, avr, i32)
 DEF_HELPER_3(vextractd, void, avr, avr, i32)
-DEF_HELPER_3(vinsertb, void, avr, avr, i32)
-DEF_HELPER_3(vinserth, void, avr, avr, i32)
-DEF_HELPER_3(vinsertw, void, avr, avr, i32)
-DEF_HELPER_3(vinsertd, void, avr, avr, i32)
 DEF_HELPER_4(VINSBLX, void, env, avr, i64, tl)
 DEF_HELPER_4(VINSHLX, void, env, avr, i64, tl)
 DEF_HELPER_4(VINSWLX, void, env, avr, i64, tl)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index de410abf7d..2eb7fb4e92 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -347,6 +347,11 @@ VPEXTD          000100 ..... ..... ..... 10110001101    @VX
 
 ## Vector Permute and Formatting Instruction
 
+VINSERTB        000100 ..... - .... ..... 01100001101   @VX_uim4
+VINSERTH        000100 ..... - .... ..... 01101001101   @VX_uim4
+VINSERTW        000100 ..... - .... ..... 01110001101   @VX_uim4
+VINSERTD        000100 ..... - .... ..... 01111001101   @VX_uim4
+
 VINSBLX         000100 ..... ..... ..... 01000001111    @VX
 VINSBRX         000100 ..... ..... ..... 01100001111    @VX
 VINSHLX         000100 ..... ..... ..... 01001001111    @VX
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 80b7f8814f..6f9479fd53 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1612,27 +1612,6 @@ void helper_vslo(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 #endif
 }
 
-#if defined(HOST_WORDS_BIGENDIAN)
-#define VINSERT(suffix, element)                                            \
-    void helper_vinsert##suffix(ppc_avr_t *r, ppc_avr_t *b, uint32_t index) \
-    {                                                                       \
-        memmove(&r->u8[index], &b->u8[8 - sizeof(r->element[0])],           \
-               sizeof(r->element[0]));                                      \
-    }
-#else
-#define VINSERT(suffix, element)                                            \
-    void helper_vinsert##suffix(ppc_avr_t *r, ppc_avr_t *b, uint32_t index) \
-    {                                                                       \
-        uint32_t d = (16 - index) - sizeof(r->element[0]);                  \
-        memmove(&r->u8[d], &b->u8[8], sizeof(r->element[0]));               \
-    }
-#endif
-VINSERT(b, u8)
-VINSERT(h, u16)
-VINSERT(w, u32)
-VINSERT(d, u64)
-#undef VINSERT
-
 #if defined(HOST_WORDS_BIGENDIAN)
 #define ELEM_ADDR(VEC, IDX, SIZE) (&(VEC)->u8[IDX])
 #else
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 46d6890242..6fd18690df 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1217,10 +1217,6 @@ GEN_VXFORM_UIMM_SPLAT(vextractub, 6, 8, 15);
 GEN_VXFORM_UIMM_SPLAT(vextractuh, 6, 9, 14);
 GEN_VXFORM_UIMM_SPLAT(vextractuw, 6, 10, 12);
 GEN_VXFORM_UIMM_SPLAT(vextractd, 6, 11, 8);
-GEN_VXFORM_UIMM_SPLAT(vinsertb, 6, 12, 15);
-GEN_VXFORM_UIMM_SPLAT(vinserth, 6, 13, 14);
-GEN_VXFORM_UIMM_SPLAT(vinsertw, 6, 14, 12);
-GEN_VXFORM_UIMM_SPLAT(vinsertd, 6, 15, 8);
 GEN_VXFORM_UIMM_ENV(vcfux, 5, 12);
 GEN_VXFORM_UIMM_ENV(vcfsx, 5, 13);
 GEN_VXFORM_UIMM_ENV(vctuxs, 5, 14);
@@ -1231,12 +1227,6 @@ GEN_VXFORM_DUAL(vsplth, PPC_ALTIVEC, PPC_NONE,
                 vextractuh, PPC_NONE, PPC2_ISA300);
 GEN_VXFORM_DUAL(vspltw, PPC_ALTIVEC, PPC_NONE,
                 vextractuw, PPC_NONE, PPC2_ISA300);
-GEN_VXFORM_DUAL(vspltisb, PPC_ALTIVEC, PPC_NONE,
-                vinsertb, PPC_NONE, PPC2_ISA300);
-GEN_VXFORM_DUAL(vspltish, PPC_ALTIVEC, PPC_NONE,
-                vinserth, PPC_NONE, PPC2_ISA300);
-GEN_VXFORM_DUAL(vspltisw, PPC_ALTIVEC, PPC_NONE,
-                vinsertw, PPC_NONE, PPC2_ISA300);
 
 static bool do_vinsx(DisasContext *ctx, int vrt, int size, bool right, TCGv ra,
             TCGv_i64 rb, void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_i64, TCGv))
@@ -1336,6 +1326,23 @@ static bool do_vins_VX_uim4(DisasContext *ctx, arg_VX_uim4 *a, int size,
     return ok;
 }
 
+static bool do_vinsert_VX_uim4(DisasContext *ctx, arg_VX_uim4 *a, int size,
+                        void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_i64, TCGv))
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_VECTOR(ctx);
+
+    if (a->uim > (16 - size)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "Invalid index for VINSERT* at"
+            " 0x" TARGET_FMT_lx ", UIM = %d > %d\n", ctx->cia, a->uim,
+            16 - size);
+        return true;
+    }
+
+    return do_vinsvx(ctx, a->vrt, size, false, tcg_constant_tl(a->uim), a->vrb,
+                     gen_helper);
+}
+
 TRANS(VINSBLX, do_vinsx_VX, 1, false, gen_helper_VINSBLX)
 TRANS(VINSHLX, do_vinsx_VX, 2, false, gen_helper_VINSHLX)
 TRANS(VINSWLX, do_vinsx_VX, 4, false, gen_helper_VINSWLX)
@@ -1357,6 +1364,11 @@ TRANS(VINSBVRX, do_vinsvx_VX, 1, true, gen_helper_VINSBLX)
 TRANS(VINSHVRX, do_vinsvx_VX, 2, true, gen_helper_VINSHLX)
 TRANS(VINSWVRX, do_vinsvx_VX, 4, true, gen_helper_VINSWLX)
 
+TRANS(VINSERTB, do_vinsert_VX_uim4, 1, gen_helper_VINSBLX)
+TRANS(VINSERTH, do_vinsert_VX_uim4, 2, gen_helper_VINSHLX)
+TRANS(VINSERTW, do_vinsert_VX_uim4, 4, gen_helper_VINSWLX)
+TRANS(VINSERTD, do_vinsert_VX_uim4, 8, gen_helper_VINSDLX)
+
 static void gen_vsldoi(DisasContext *ctx)
 {
     TCGv_ptr ra, rb, rd;
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vmx-ops.c.inc
index f3f4855111..25ee715b43 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -225,13 +225,9 @@ GEN_VXFORM_DUAL_INV(vsplth, vextractuh, 6, 9, 0x00000000, 0x100000,
 GEN_VXFORM_DUAL_INV(vspltw, vextractuw, 6, 10, 0x00000000, 0x100000,
                                                PPC_ALTIVEC),
 GEN_VXFORM_300_EXT(vextractd, 6, 11, 0x100000),
-GEN_VXFORM_DUAL_INV(vspltisb, vinsertb, 6, 12, 0x00000000, 0x100000,
-                                               PPC_ALTIVEC),
-GEN_VXFORM_DUAL_INV(vspltish, vinserth, 6, 13, 0x00000000, 0x100000,
-                                               PPC_ALTIVEC),
-GEN_VXFORM_DUAL_INV(vspltisw, vinsertw, 6, 14, 0x00000000, 0x100000,
-                                               PPC_ALTIVEC),
-GEN_VXFORM_300_EXT(vinsertd, 6, 15, 0x100000),
+GEN_VXFORM(vspltisb, 6, 12),
+GEN_VXFORM(vspltish, 6, 13),
+GEN_VXFORM(vspltisw, 6, 14),
 GEN_VXFORM_300_EO(vnegw, 0x01, 0x18, 0x06),
 GEN_VXFORM_300_EO(vnegd, 0x01, 0x18, 0x07),
 GEN_VXFORM_300_EO(vextsb2w, 0x01, 0x18, 0x10),
-- 
2.33.1


