Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A3C1D1B44
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 18:40:34 +0200 (CEST)
Received: from localhost ([::1]:44940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYuQq-0006EA-W9
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 12:40:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYuJc-0003kE-55
 for qemu-devel@nongnu.org; Wed, 13 May 2020 12:33:04 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:32862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYuJa-00021P-8t
 for qemu-devel@nongnu.org; Wed, 13 May 2020 12:33:03 -0400
Received: by mail-pg1-x541.google.com with SMTP id a4so8013607pgc.0
 for <qemu-devel@nongnu.org>; Wed, 13 May 2020 09:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E/r+NCV6DzSIcLUZf6WhXrUleBIA2S8Z0OvC6I1eflc=;
 b=BJzCsDICEfYtNjBi7wowlbIAGSrGGxWJJbtFa7XhIUoSrMb4Ed+BM+fSjDsmNfr2Gz
 2Ly1jj3Ul3HMtJ4YK8T+rUy6R2iQTWh6pdMb3f/WMbs7Q9eN8HTeEfV/ouabAqotlgf+
 NWeF4phxW7ev6drzi0EVEa7/GSRygwzW+mc6RuzQ3V8S0ELd46JovP1auE8FQFbYjC/I
 j3yB9hd1dMSnZM8/0RxZbERUvUw2mnp0It3czqlGioPikOCSKNOLY9fdJlhAwSp8KesP
 w07n5+nvAsXkKkWqTZUAIzvtdHqz4gWTcaDmGiSsS4yIEH/uPo1O8U0qPUyMYkRQQajk
 6OPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E/r+NCV6DzSIcLUZf6WhXrUleBIA2S8Z0OvC6I1eflc=;
 b=sb6dC4RHzpYr9y0hIoGQDH4Ozq+bkrisCLayxU0OJPB1G2xiH7rbB4meh/QvPwYt0e
 YoG4XGOK6imMOQdVKJal6NjVWCKmU2M+joY8gcQFgVeQwMizsKyEPH0Zj958eApK9uA3
 AWbBxGTJzZaKCDERt6bLVSppnzDLDvYKwqZ159IbxiMnrdzo1R2eQiYQg3800mAU2fzb
 4TbAYDy8W9Mooht5QiYAdqXBxLslgT2QyddDMFycxh+zEu3IvPfU0ctbxwuCOw/AfO6L
 dWWkZ02g3eT3zxul2O+pjI7C3L+HN+pJ5WRNEfwlBtI3KLljuN96iV1vSihm5xnL8p1n
 LPTQ==
X-Gm-Message-State: AOAM531TtFteZoJUaYyE7k1EYfXE1/DwNkcEarugDOimSNqT1b6Z7LpT
 r/bVYcyOJn7pZCjjzppa5A+IeWKqrv8=
X-Google-Smtp-Source: ABdhPJwc61Rvk69f4ogoc+Oj3d3ZAAogy7hAqmHz2AISpLHxmzF0NiSvBmTcNEd8SyIKb2cvIFOJTw==
X-Received: by 2002:a65:5287:: with SMTP id y7mr174306pgp.86.1589387578999;
 Wed, 13 May 2020 09:32:58 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id b11sm158025pgq.50.2020.05.13.09.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 09:32:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/16] target/arm: Create gen_gvec_{cmtst,ushl,sshl}
Date: Wed, 13 May 2020 09:32:38 -0700
Message-Id: <20200513163245.17915-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200513163245.17915-1-richard.henderson@linaro.org>
References: <20200513163245.17915-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Provide a functional interface for the vector expansion.
This fits better with the existing set of helpers that
we provide for other operations.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h          |  10 ++-
 target/arm/translate-a64.c      |  18 ++--
 target/arm/translate-neon.inc.c |  23 +----
 target/arm/translate.c          | 146 +++++++++++++++++---------------
 4 files changed, 95 insertions(+), 102 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 9354ceba35..a02a54cabf 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -291,9 +291,13 @@ void gen_gvec_mla(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
 void gen_gvec_mls(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                   uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz);
 
-extern const GVecGen3 cmtst_op[4];
-extern const GVecGen3 sshl_op[4];
-extern const GVecGen3 ushl_op[4];
+void gen_gvec_cmtst(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                    uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz);
+void gen_gvec_sshl(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                   uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz);
+void gen_gvec_ushl(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                   uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz);
+
 extern const GVecGen4 uqadd_op[4];
 extern const GVecGen4 sqadd_op[4];
 extern const GVecGen4 uqsub_op[4];
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index ab9df12e44..3956c19ed8 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -577,15 +577,6 @@ static void gen_gvec_fn4(DisasContext *s, bool is_q, int rd, int rn, int rm,
             is_q ? 16 : 8, vec_full_reg_size(s));
 }
 
-/* Expand a 3-operand AdvSIMD vector operation using an op descriptor.  */
-static void gen_gvec_op3(DisasContext *s, bool is_q, int rd,
-                         int rn, int rm, const GVecGen3 *gvec_op)
-{
-    tcg_gen_gvec_3(vec_full_reg_offset(s, rd), vec_full_reg_offset(s, rn),
-                   vec_full_reg_offset(s, rm), is_q ? 16 : 8,
-                   vec_full_reg_size(s), gvec_op);
-}
-
 /* Expand a 3-operand operation using an out-of-line helper.  */
 static void gen_gvec_op3_ool(DisasContext *s, bool is_q, int rd,
                              int rn, int rm, int data, gen_helper_gvec_3 *fn)
@@ -11193,8 +11184,11 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
                        (u ? uqsub_op : sqsub_op) + size);
         return;
     case 0x08: /* SSHL, USHL */
-        gen_gvec_op3(s, is_q, rd, rn, rm,
-                     u ? &ushl_op[size] : &sshl_op[size]);
+        if (u) {
+            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_ushl, size);
+        } else {
+            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_sshl, size);
+        }
         return;
     case 0x0c: /* SMAX, UMAX */
         if (u) {
@@ -11233,7 +11227,7 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
         return;
     case 0x11:
         if (!u) { /* CMTST */
-            gen_gvec_op3(s, is_q, rd, rn, rm, &cmtst_op[size]);
+            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_cmtst, size);
             return;
         }
         /* else CMEQ */
diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index 416302bcc7..e16475c212 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -603,6 +603,8 @@ DO_3SAME(VBIC, tcg_gen_gvec_andc)
 DO_3SAME(VORR, tcg_gen_gvec_or)
 DO_3SAME(VORN, tcg_gen_gvec_orc)
 DO_3SAME(VEOR, tcg_gen_gvec_xor)
+DO_3SAME(VSHL_S, gen_gvec_sshl)
+DO_3SAME(VSHL_U, gen_gvec_ushl)
 
 /* These insns are all gvec_bitsel but with the inputs in various orders. */
 #define DO_3SAME_BITSEL(INSN, O1, O2, O3)                               \
@@ -634,6 +636,7 @@ DO_3SAME_NO_SZ_3(VMIN_U, tcg_gen_gvec_umin)
 DO_3SAME_NO_SZ_3(VMUL, tcg_gen_gvec_mul)
 DO_3SAME_NO_SZ_3(VMLA, gen_gvec_mla)
 DO_3SAME_NO_SZ_3(VMLS, gen_gvec_mls)
+DO_3SAME_NO_SZ_3(VTST, gen_gvec_cmtst)
 
 #define DO_3SAME_CMP(INSN, COND)                                        \
     static void gen_##INSN##_3s(unsigned vece, uint32_t rd_ofs,         \
@@ -650,13 +653,6 @@ DO_3SAME_CMP(VCGE_S, TCG_COND_GE)
 DO_3SAME_CMP(VCGE_U, TCG_COND_GEU)
 DO_3SAME_CMP(VCEQ, TCG_COND_EQ)
 
-static void gen_VTST_3s(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
-                         uint32_t rm_ofs, uint32_t oprsz, uint32_t maxsz)
-{
-    tcg_gen_gvec_3(rd_ofs, rn_ofs, rm_ofs, oprsz, maxsz, &cmtst_op[vece]);
-}
-DO_3SAME_NO_SZ_3(VTST, gen_VTST_3s)
-
 #define DO_3SAME_GVEC4(INSN, OPARRAY)                                   \
     static void gen_##INSN##_3s(unsigned vece, uint32_t rd_ofs,         \
                                 uint32_t rn_ofs, uint32_t rm_ofs,       \
@@ -686,16 +682,3 @@ static bool trans_VMUL_p_3s(DisasContext *s, arg_3same *a)
     }
     return do_3same(s, a, gen_VMUL_p_3s);
 }
-
-#define DO_3SAME_GVEC3_SHIFT(INSN, OPARRAY)                             \
-    static void gen_##INSN##_3s(unsigned vece, uint32_t rd_ofs,         \
-                                uint32_t rn_ofs, uint32_t rm_ofs,       \
-                                uint32_t oprsz, uint32_t maxsz)         \
-    {                                                                   \
-        tcg_gen_gvec_3(rd_ofs, rn_ofs, rm_ofs,                          \
-                       oprsz, maxsz, &OPARRAY[vece]);                   \
-    }                                                                   \
-    DO_3SAME(INSN, gen_##INSN##_3s)
-
-DO_3SAME_GVEC3_SHIFT(VSHL_S, sshl_op)
-DO_3SAME_GVEC3_SHIFT(VSHL_U, ushl_op)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index face89a1f7..df91ff73e3 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4606,27 +4606,31 @@ static void gen_cmtst_vec(unsigned vece, TCGv_vec d, TCGv_vec a, TCGv_vec b)
     tcg_gen_cmp_vec(TCG_COND_NE, vece, d, d, a);
 }
 
-static const TCGOpcode vecop_list_cmtst[] = { INDEX_op_cmp_vec, 0 };
-
-const GVecGen3 cmtst_op[4] = {
-    { .fni4 = gen_helper_neon_tst_u8,
-      .fniv = gen_cmtst_vec,
-      .opt_opc = vecop_list_cmtst,
-      .vece = MO_8 },
-    { .fni4 = gen_helper_neon_tst_u16,
-      .fniv = gen_cmtst_vec,
-      .opt_opc = vecop_list_cmtst,
-      .vece = MO_16 },
-    { .fni4 = gen_cmtst_i32,
-      .fniv = gen_cmtst_vec,
-      .opt_opc = vecop_list_cmtst,
-      .vece = MO_32 },
-    { .fni8 = gen_cmtst_i64,
-      .fniv = gen_cmtst_vec,
-      .prefer_i64 = TCG_TARGET_REG_BITS == 64,
-      .opt_opc = vecop_list_cmtst,
-      .vece = MO_64 },
-};
+void gen_gvec_cmtst(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                    uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz)
+{
+    static const TCGOpcode vecop_list[] = { INDEX_op_cmp_vec, 0 };
+    static const GVecGen3 ops[4] = {
+        { .fni4 = gen_helper_neon_tst_u8,
+          .fniv = gen_cmtst_vec,
+          .opt_opc = vecop_list,
+          .vece = MO_8 },
+        { .fni4 = gen_helper_neon_tst_u16,
+          .fniv = gen_cmtst_vec,
+          .opt_opc = vecop_list,
+          .vece = MO_16 },
+        { .fni4 = gen_cmtst_i32,
+          .fniv = gen_cmtst_vec,
+          .opt_opc = vecop_list,
+          .vece = MO_32 },
+        { .fni8 = gen_cmtst_i64,
+          .fniv = gen_cmtst_vec,
+          .prefer_i64 = TCG_TARGET_REG_BITS == 64,
+          .opt_opc = vecop_list,
+          .vece = MO_64 },
+    };
+    tcg_gen_gvec_3(rd_ofs, rn_ofs, rm_ofs, opr_sz, max_sz, &ops[vece]);
+}
 
 void gen_ushl_i32(TCGv_i32 dst, TCGv_i32 src, TCGv_i32 shift)
 {
@@ -4744,29 +4748,33 @@ static void gen_ushl_vec(unsigned vece, TCGv_vec dst,
     tcg_temp_free_vec(rsh);
 }
 
-static const TCGOpcode ushl_list[] = {
-    INDEX_op_neg_vec, INDEX_op_shlv_vec,
-    INDEX_op_shrv_vec, INDEX_op_cmp_vec, 0
-};
-
-const GVecGen3 ushl_op[4] = {
-    { .fniv = gen_ushl_vec,
-      .fno = gen_helper_gvec_ushl_b,
-      .opt_opc = ushl_list,
-      .vece = MO_8 },
-    { .fniv = gen_ushl_vec,
-      .fno = gen_helper_gvec_ushl_h,
-      .opt_opc = ushl_list,
-      .vece = MO_16 },
-    { .fni4 = gen_ushl_i32,
-      .fniv = gen_ushl_vec,
-      .opt_opc = ushl_list,
-      .vece = MO_32 },
-    { .fni8 = gen_ushl_i64,
-      .fniv = gen_ushl_vec,
-      .opt_opc = ushl_list,
-      .vece = MO_64 },
-};
+void gen_gvec_ushl(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                   uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_neg_vec, INDEX_op_shlv_vec,
+        INDEX_op_shrv_vec, INDEX_op_cmp_vec, 0
+    };
+    static const GVecGen3 ops[4] = {
+        { .fniv = gen_ushl_vec,
+          .fno = gen_helper_gvec_ushl_b,
+          .opt_opc = vecop_list,
+          .vece = MO_8 },
+        { .fniv = gen_ushl_vec,
+          .fno = gen_helper_gvec_ushl_h,
+          .opt_opc = vecop_list,
+          .vece = MO_16 },
+        { .fni4 = gen_ushl_i32,
+          .fniv = gen_ushl_vec,
+          .opt_opc = vecop_list,
+          .vece = MO_32 },
+        { .fni8 = gen_ushl_i64,
+          .fniv = gen_ushl_vec,
+          .opt_opc = vecop_list,
+          .vece = MO_64 },
+    };
+    tcg_gen_gvec_3(rd_ofs, rn_ofs, rm_ofs, opr_sz, max_sz, &ops[vece]);
+}
 
 void gen_sshl_i32(TCGv_i32 dst, TCGv_i32 src, TCGv_i32 shift)
 {
@@ -4878,29 +4886,33 @@ static void gen_sshl_vec(unsigned vece, TCGv_vec dst,
     tcg_temp_free_vec(tmp);
 }
 
-static const TCGOpcode sshl_list[] = {
-    INDEX_op_neg_vec, INDEX_op_umin_vec, INDEX_op_shlv_vec,
-    INDEX_op_sarv_vec, INDEX_op_cmp_vec, INDEX_op_cmpsel_vec, 0
-};
-
-const GVecGen3 sshl_op[4] = {
-    { .fniv = gen_sshl_vec,
-      .fno = gen_helper_gvec_sshl_b,
-      .opt_opc = sshl_list,
-      .vece = MO_8 },
-    { .fniv = gen_sshl_vec,
-      .fno = gen_helper_gvec_sshl_h,
-      .opt_opc = sshl_list,
-      .vece = MO_16 },
-    { .fni4 = gen_sshl_i32,
-      .fniv = gen_sshl_vec,
-      .opt_opc = sshl_list,
-      .vece = MO_32 },
-    { .fni8 = gen_sshl_i64,
-      .fniv = gen_sshl_vec,
-      .opt_opc = sshl_list,
-      .vece = MO_64 },
-};
+void gen_gvec_sshl(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                   uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_neg_vec, INDEX_op_umin_vec, INDEX_op_shlv_vec,
+        INDEX_op_sarv_vec, INDEX_op_cmp_vec, INDEX_op_cmpsel_vec, 0
+    };
+    static const GVecGen3 ops[4] = {
+        { .fniv = gen_sshl_vec,
+          .fno = gen_helper_gvec_sshl_b,
+          .opt_opc = vecop_list,
+          .vece = MO_8 },
+        { .fniv = gen_sshl_vec,
+          .fno = gen_helper_gvec_sshl_h,
+          .opt_opc = vecop_list,
+          .vece = MO_16 },
+        { .fni4 = gen_sshl_i32,
+          .fniv = gen_sshl_vec,
+          .opt_opc = vecop_list,
+          .vece = MO_32 },
+        { .fni8 = gen_sshl_i64,
+          .fniv = gen_sshl_vec,
+          .opt_opc = vecop_list,
+          .vece = MO_64 },
+    };
+    tcg_gen_gvec_3(rd_ofs, rn_ofs, rm_ofs, opr_sz, max_sz, &ops[vece]);
+}
 
 static void gen_uqadd_vec(unsigned vece, TCGv_vec t, TCGv_vec sat,
                           TCGv_vec a, TCGv_vec b)
-- 
2.20.1


