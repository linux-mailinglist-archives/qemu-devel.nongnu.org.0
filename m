Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFECD1D32F0
	for <lists+qemu-devel@lfdr.de>; Thu, 14 May 2020 16:33:19 +0200 (CEST)
Received: from localhost ([::1]:55228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZEvG-000786-Ku
	for lists+qemu-devel@lfdr.de; Thu, 14 May 2020 10:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jZEkA-0002uV-A7
 for qemu-devel@nongnu.org; Thu, 14 May 2020 10:21:50 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:38514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jZEk8-0005Pa-PP
 for qemu-devel@nongnu.org; Thu, 14 May 2020 10:21:49 -0400
Received: by mail-wm1-x336.google.com with SMTP id g12so32905834wmh.3
 for <qemu-devel@nongnu.org>; Thu, 14 May 2020 07:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=DUXqc4+JNJhwPii8GLbEXfDPYNMNIDSifTMMaPFtXYQ=;
 b=CUqyG1iUloP2DPqEy4HQsS8+tiIJW5+uHDrqxMMiPP7/vgQLPaWdWzECicXxGhqv+I
 58WZwLgWa5PRn2K0MNpDhw7GBhAkJ/yz+aVj5LTXIkyfWJkac1fOJLPvRXzpAm+pxOBr
 hljv2UqA7mJy/sG6aDbl6w5y41Cv9iC5Njh3E5nsM4CzLpRTnVHPzOL26WdPYgCM+VmB
 BSHZqRODG2hPpqivUSfZjAOMQvmhCPgpcTccfyrZ7ADJ6LJoyuuvq4MeNdcKgO3FBM7d
 YcnwlkwXiPAH6DheIIK5H4gJ/MKsQu1+GTiIrEN3oBBsWjAZlPcwAbWtrbbr+60fQY0x
 Ubdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DUXqc4+JNJhwPii8GLbEXfDPYNMNIDSifTMMaPFtXYQ=;
 b=cQ05mcuxWuFVmNc4OAiAGGD7p+zS2R81j/FXeLt8uN/u/BJ9q4qqCtpkm6Vr2GfJEn
 WxCoFAv/nd0spgGXDOTrRaLhOMv16dGcApgfR4p/8E3cIXzcJK7hzVbZr2LC4KmJlSq/
 lvKxcmC+raIiecjdTH0rqzR1JVZ6yZy3m35uT4qmwAMvRpoY+6PHMyqhWMnCk5YZzd3e
 mIxjQ2qGR4BaJ7oJ3q/jwiiJvQe6lFahbCZrywVjLRrIk+J8hI3GTMkizF2AIIBPYMhG
 +XaVgzT1SyUv+m/d7RhdG0hwZXOiTBNusfbjHVFsVGprE76vFYXvUzZx9/qmfkjd1jmv
 O6aw==
X-Gm-Message-State: AGi0PuZl/0bZxAHJ5ofEUpAuGB8E466LDgM1OfDZtfViJnDqHDFX4dMg
 BDBdChm4aDYKG33zrK5870zqE7G3VA1IMA==
X-Google-Smtp-Source: APiQypJAoQUUpgaao+dBV+ghtaOPOd0/DkAZ0BU+c43aZjqt/GAGV4TKXUjHgtoZXEej+ZlvzFYYbA==
X-Received: by 2002:a7b:c3d2:: with SMTP id t18mr40756104wmj.100.1589466106838; 
 Thu, 14 May 2020 07:21:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 88sm4077443wrq.77.2020.05.14.07.21.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 07:21:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/45] target/arm: Create gen_gvec_{sri,sli}
Date: Thu, 14 May 2020 15:20:57 +0100
Message-Id: <20200514142138.20875-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200514142138.20875-1-peter.maydell@linaro.org>
References: <20200514142138.20875-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The functions eliminate duplication of the special cases for
this operation.  They match up with the GVecGen2iFn typedef.

Add out-of-line helpers.  We got away with only having inline
expanders because the neon vector size is only 16 bytes, and
we know that the inline expansion will always succeed.
When we reuse this for SVE, tcg-gvec-op may decide to use an
out-of-line helper due to longer vector lengths.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20200513163245.17915-4-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h        |  10 ++
 target/arm/translate.h     |   7 +-
 target/arm/translate-a64.c |  20 +---
 target/arm/translate.c     | 186 +++++++++++++++++++++----------------
 target/arm/vec_helper.c    |  38 ++++++++
 5 files changed, 160 insertions(+), 101 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index aeb1f524553..33c76192d20 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -721,6 +721,16 @@ DEF_HELPER_FLAGS_3(gvec_ursra_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(gvec_ursra_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(gvec_ursra_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_3(gvec_sri_b, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(gvec_sri_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(gvec_sri_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(gvec_sri_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(gvec_sli_b, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(gvec_sli_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(gvec_sli_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(gvec_sli_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
 #include "helper-sve.h"
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 1db3b43a614..fa5c3f12b96 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -285,8 +285,6 @@ extern const GVecGen3 mls_op[4];
 extern const GVecGen3 cmtst_op[4];
 extern const GVecGen3 sshl_op[4];
 extern const GVecGen3 ushl_op[4];
-extern const GVecGen2i sri_op[4];
-extern const GVecGen2i sli_op[4];
 extern const GVecGen4 uqadd_op[4];
 extern const GVecGen4 sqadd_op[4];
 extern const GVecGen4 uqsub_op[4];
@@ -311,6 +309,11 @@ void gen_gvec_srsra(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
 void gen_gvec_ursra(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
                     int64_t shift, uint32_t opr_sz, uint32_t max_sz);
 
+void gen_gvec_sri(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
+                  int64_t shift, uint32_t opr_sz, uint32_t max_sz);
+void gen_gvec_sli(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
+                  int64_t shift, uint32_t opr_sz, uint32_t max_sz);
+
 /*
  * Forward to the isar_feature_* tests given a DisasContext pointer.
  */
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 50949d306bf..2d7dad6c3f2 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -585,16 +585,6 @@ static void gen_gvec_op2(DisasContext *s, bool is_q, int rd,
                    is_q ? 16 : 8, vec_full_reg_size(s), gvec_op);
 }
 
-/* Expand a 2-operand + immediate AdvSIMD vector operation using
- * an op descriptor.
- */
-static void gen_gvec_op2i(DisasContext *s, bool is_q, int rd,
-                          int rn, int64_t imm, const GVecGen2i *gvec_op)
-{
-    tcg_gen_gvec_2i(vec_full_reg_offset(s, rd), vec_full_reg_offset(s, rn),
-                    is_q ? 16 : 8, vec_full_reg_size(s), imm, gvec_op);
-}
-
 /* Expand a 3-operand AdvSIMD vector operation using an op descriptor.  */
 static void gen_gvec_op3(DisasContext *s, bool is_q, int rd,
                          int rn, int rm, const GVecGen3 *gvec_op)
@@ -10191,12 +10181,9 @@ static void handle_vec_simd_shri(DisasContext *s, bool is_q, bool is_u,
         gen_gvec_fn2i(s, is_q, rd, rn, shift,
                       is_u ? gen_gvec_usra : gen_gvec_ssra, size);
         return;
+
     case 0x08: /* SRI */
-        /* Shift count same as element size is valid but does nothing.  */
-        if (shift == 8 << size) {
-            goto done;
-        }
-        gen_gvec_op2i(s, is_q, rd, rn, shift, &sri_op[size]);
+        gen_gvec_fn2i(s, is_q, rd, rn, shift, gen_gvec_sri, size);
         return;
 
     case 0x00: /* SSHR / USHR */
@@ -10247,7 +10234,6 @@ static void handle_vec_simd_shri(DisasContext *s, bool is_q, bool is_u,
     }
     tcg_temp_free_i64(tcg_round);
 
- done:
     clear_vec_high(s, is_q, rd);
 }
 
@@ -10272,7 +10258,7 @@ static void handle_vec_simd_shli(DisasContext *s, bool is_q, bool insert,
     }
 
     if (insert) {
-        gen_gvec_op2i(s, is_q, rd, rn, shift, &sli_op[size]);
+        gen_gvec_fn2i(s, is_q, rd, rn, shift, gen_gvec_sli, size);
     } else {
         gen_gvec_fn2i(s, is_q, rd, rn, shift, tcg_gen_gvec_shli, size);
     }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index aa03dc236bc..3c489852dce 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4454,47 +4454,62 @@ static void gen_shr64_ins_i64(TCGv_i64 d, TCGv_i64 a, int64_t shift)
 
 static void gen_shr_ins_vec(unsigned vece, TCGv_vec d, TCGv_vec a, int64_t sh)
 {
-    if (sh == 0) {
-        tcg_gen_mov_vec(d, a);
-    } else {
-        TCGv_vec t = tcg_temp_new_vec_matching(d);
-        TCGv_vec m = tcg_temp_new_vec_matching(d);
+    TCGv_vec t = tcg_temp_new_vec_matching(d);
+    TCGv_vec m = tcg_temp_new_vec_matching(d);
 
-        tcg_gen_dupi_vec(vece, m, MAKE_64BIT_MASK((8 << vece) - sh, sh));
-        tcg_gen_shri_vec(vece, t, a, sh);
-        tcg_gen_and_vec(vece, d, d, m);
-        tcg_gen_or_vec(vece, d, d, t);
+    tcg_gen_dupi_vec(vece, m, MAKE_64BIT_MASK((8 << vece) - sh, sh));
+    tcg_gen_shri_vec(vece, t, a, sh);
+    tcg_gen_and_vec(vece, d, d, m);
+    tcg_gen_or_vec(vece, d, d, t);
 
-        tcg_temp_free_vec(t);
-        tcg_temp_free_vec(m);
-    }
+    tcg_temp_free_vec(t);
+    tcg_temp_free_vec(m);
 }
 
-static const TCGOpcode vecop_list_sri[] = { INDEX_op_shri_vec, 0 };
+void gen_gvec_sri(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
+                  int64_t shift, uint32_t opr_sz, uint32_t max_sz)
+{
+    static const TCGOpcode vecop_list[] = { INDEX_op_shri_vec, 0 };
+    const GVecGen2i ops[4] = {
+        { .fni8 = gen_shr8_ins_i64,
+          .fniv = gen_shr_ins_vec,
+          .fno = gen_helper_gvec_sri_b,
+          .load_dest = true,
+          .opt_opc = vecop_list,
+          .vece = MO_8 },
+        { .fni8 = gen_shr16_ins_i64,
+          .fniv = gen_shr_ins_vec,
+          .fno = gen_helper_gvec_sri_h,
+          .load_dest = true,
+          .opt_opc = vecop_list,
+          .vece = MO_16 },
+        { .fni4 = gen_shr32_ins_i32,
+          .fniv = gen_shr_ins_vec,
+          .fno = gen_helper_gvec_sri_s,
+          .load_dest = true,
+          .opt_opc = vecop_list,
+          .vece = MO_32 },
+        { .fni8 = gen_shr64_ins_i64,
+          .fniv = gen_shr_ins_vec,
+          .fno = gen_helper_gvec_sri_d,
+          .prefer_i64 = TCG_TARGET_REG_BITS == 64,
+          .load_dest = true,
+          .opt_opc = vecop_list,
+          .vece = MO_64 },
+    };
 
-const GVecGen2i sri_op[4] = {
-    { .fni8 = gen_shr8_ins_i64,
-      .fniv = gen_shr_ins_vec,
-      .load_dest = true,
-      .opt_opc = vecop_list_sri,
-      .vece = MO_8 },
-    { .fni8 = gen_shr16_ins_i64,
-      .fniv = gen_shr_ins_vec,
-      .load_dest = true,
-      .opt_opc = vecop_list_sri,
-      .vece = MO_16 },
-    { .fni4 = gen_shr32_ins_i32,
-      .fniv = gen_shr_ins_vec,
-      .load_dest = true,
-      .opt_opc = vecop_list_sri,
-      .vece = MO_32 },
-    { .fni8 = gen_shr64_ins_i64,
-      .fniv = gen_shr_ins_vec,
-      .prefer_i64 = TCG_TARGET_REG_BITS == 64,
-      .load_dest = true,
-      .opt_opc = vecop_list_sri,
-      .vece = MO_64 },
-};
+    /* tszimm encoding produces immediates in the range [1..esize]. */
+    tcg_debug_assert(shift > 0);
+    tcg_debug_assert(shift <= (8 << vece));
+
+    /* Shift of esize leaves destination unchanged. */
+    if (shift < (8 << vece)) {
+        tcg_gen_gvec_2i(rd_ofs, rm_ofs, opr_sz, max_sz, shift, &ops[vece]);
+    } else {
+        /* Nop, but we do need to clear the tail. */
+        tcg_gen_gvec_mov(vece, rd_ofs, rd_ofs, opr_sz, max_sz);
+    }
+}
 
 static void gen_shl8_ins_i64(TCGv_i64 d, TCGv_i64 a, int64_t shift)
 {
@@ -4532,47 +4547,60 @@ static void gen_shl64_ins_i64(TCGv_i64 d, TCGv_i64 a, int64_t shift)
 
 static void gen_shl_ins_vec(unsigned vece, TCGv_vec d, TCGv_vec a, int64_t sh)
 {
-    if (sh == 0) {
-        tcg_gen_mov_vec(d, a);
-    } else {
-        TCGv_vec t = tcg_temp_new_vec_matching(d);
-        TCGv_vec m = tcg_temp_new_vec_matching(d);
+    TCGv_vec t = tcg_temp_new_vec_matching(d);
+    TCGv_vec m = tcg_temp_new_vec_matching(d);
 
-        tcg_gen_dupi_vec(vece, m, MAKE_64BIT_MASK(0, sh));
-        tcg_gen_shli_vec(vece, t, a, sh);
-        tcg_gen_and_vec(vece, d, d, m);
-        tcg_gen_or_vec(vece, d, d, t);
+    tcg_gen_shli_vec(vece, t, a, sh);
+    tcg_gen_dupi_vec(vece, m, MAKE_64BIT_MASK(0, sh));
+    tcg_gen_and_vec(vece, d, d, m);
+    tcg_gen_or_vec(vece, d, d, t);
 
-        tcg_temp_free_vec(t);
-        tcg_temp_free_vec(m);
-    }
+    tcg_temp_free_vec(t);
+    tcg_temp_free_vec(m);
 }
 
-static const TCGOpcode vecop_list_sli[] = { INDEX_op_shli_vec, 0 };
+void gen_gvec_sli(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
+                  int64_t shift, uint32_t opr_sz, uint32_t max_sz)
+{
+    static const TCGOpcode vecop_list[] = { INDEX_op_shli_vec, 0 };
+    const GVecGen2i ops[4] = {
+        { .fni8 = gen_shl8_ins_i64,
+          .fniv = gen_shl_ins_vec,
+          .fno = gen_helper_gvec_sli_b,
+          .load_dest = true,
+          .opt_opc = vecop_list,
+          .vece = MO_8 },
+        { .fni8 = gen_shl16_ins_i64,
+          .fniv = gen_shl_ins_vec,
+          .fno = gen_helper_gvec_sli_h,
+          .load_dest = true,
+          .opt_opc = vecop_list,
+          .vece = MO_16 },
+        { .fni4 = gen_shl32_ins_i32,
+          .fniv = gen_shl_ins_vec,
+          .fno = gen_helper_gvec_sli_s,
+          .load_dest = true,
+          .opt_opc = vecop_list,
+          .vece = MO_32 },
+        { .fni8 = gen_shl64_ins_i64,
+          .fniv = gen_shl_ins_vec,
+          .fno = gen_helper_gvec_sli_d,
+          .prefer_i64 = TCG_TARGET_REG_BITS == 64,
+          .load_dest = true,
+          .opt_opc = vecop_list,
+          .vece = MO_64 },
+    };
 
-const GVecGen2i sli_op[4] = {
-    { .fni8 = gen_shl8_ins_i64,
-      .fniv = gen_shl_ins_vec,
-      .load_dest = true,
-      .opt_opc = vecop_list_sli,
-      .vece = MO_8 },
-    { .fni8 = gen_shl16_ins_i64,
-      .fniv = gen_shl_ins_vec,
-      .load_dest = true,
-      .opt_opc = vecop_list_sli,
-      .vece = MO_16 },
-    { .fni4 = gen_shl32_ins_i32,
-      .fniv = gen_shl_ins_vec,
-      .load_dest = true,
-      .opt_opc = vecop_list_sli,
-      .vece = MO_32 },
-    { .fni8 = gen_shl64_ins_i64,
-      .fniv = gen_shl_ins_vec,
-      .prefer_i64 = TCG_TARGET_REG_BITS == 64,
-      .load_dest = true,
-      .opt_opc = vecop_list_sli,
-      .vece = MO_64 },
-};
+    /* tszimm encoding produces immediates in the range [0..esize-1]. */
+    tcg_debug_assert(shift >= 0);
+    tcg_debug_assert(shift < (8 << vece));
+
+    if (shift == 0) {
+        tcg_gen_gvec_mov(vece, rd_ofs, rm_ofs, opr_sz, max_sz);
+    } else {
+        tcg_gen_gvec_2i(rd_ofs, rm_ofs, opr_sz, max_sz, shift, &ops[vece]);
+    }
+}
 
 static void gen_mla8_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
 {
@@ -5715,20 +5743,14 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                     }
                     /* Right shift comes here negative.  */
                     shift = -shift;
-                    /* Shift out of range leaves destination unchanged.  */
-                    if (shift < 8 << size) {
-                        tcg_gen_gvec_2i(rd_ofs, rm_ofs, vec_size, vec_size,
-                                        shift, &sri_op[size]);
-                    }
+                    gen_gvec_sri(size, rd_ofs, rm_ofs, shift,
+                                 vec_size, vec_size);
                     return 0;
 
                 case 5: /* VSHL, VSLI */
                     if (u) { /* VSLI */
-                        /* Shift out of range leaves destination unchanged.  */
-                        if (shift < 8 << size) {
-                            tcg_gen_gvec_2i(rd_ofs, rm_ofs, vec_size,
-                                            vec_size, shift, &sli_op[size]);
-                        }
+                        gen_gvec_sli(size, rd_ofs, rm_ofs, shift,
+                                     vec_size, vec_size);
                     } else { /* VSHL */
                         /* Shifts larger than the element size are
                          * architecturally valid and results in zero.
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index fd8b2bff493..096fea67efc 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -974,6 +974,44 @@ DO_RSRA(gvec_ursra_d, uint64_t)
 
 #undef DO_RSRA
 
+#define DO_SRI(NAME, TYPE)                              \
+void HELPER(NAME)(void *vd, void *vn, uint32_t desc)    \
+{                                                       \
+    intptr_t i, oprsz = simd_oprsz(desc);               \
+    int shift = simd_data(desc);                        \
+    TYPE *d = vd, *n = vn;                              \
+    for (i = 0; i < oprsz / sizeof(TYPE); i++) {        \
+        d[i] = deposit64(d[i], 0, sizeof(TYPE) * 8 - shift, n[i] >> shift); \
+    }                                                   \
+    clear_tail(d, oprsz, simd_maxsz(desc));             \
+}
+
+DO_SRI(gvec_sri_b, uint8_t)
+DO_SRI(gvec_sri_h, uint16_t)
+DO_SRI(gvec_sri_s, uint32_t)
+DO_SRI(gvec_sri_d, uint64_t)
+
+#undef DO_SRI
+
+#define DO_SLI(NAME, TYPE)                              \
+void HELPER(NAME)(void *vd, void *vn, uint32_t desc)    \
+{                                                       \
+    intptr_t i, oprsz = simd_oprsz(desc);               \
+    int shift = simd_data(desc);                        \
+    TYPE *d = vd, *n = vn;                              \
+    for (i = 0; i < oprsz / sizeof(TYPE); i++) {        \
+        d[i] = deposit64(d[i], shift, sizeof(TYPE) * 8 - shift, n[i]); \
+    }                                                   \
+    clear_tail(d, oprsz, simd_maxsz(desc));             \
+}
+
+DO_SLI(gvec_sli_b, uint8_t)
+DO_SLI(gvec_sli_h, uint16_t)
+DO_SLI(gvec_sli_s, uint32_t)
+DO_SLI(gvec_sli_d, uint64_t)
+
+#undef DO_SLI
+
 /*
  * Convert float16 to float32, raising no exceptions and
  * preserving exceptional values, including SNaN.
-- 
2.20.1


