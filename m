Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB11E1D32E3
	for <lists+qemu-devel@lfdr.de>; Thu, 14 May 2020 16:29:50 +0200 (CEST)
Received: from localhost ([::1]:42274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZErt-00013m-L6
	for lists+qemu-devel@lfdr.de; Thu, 14 May 2020 10:29:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jZEk9-0002rK-1T
 for qemu-devel@nongnu.org; Thu, 14 May 2020 10:21:49 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jZEk7-0005Oe-9R
 for qemu-devel@nongnu.org; Thu, 14 May 2020 10:21:48 -0400
Received: by mail-wr1-x42e.google.com with SMTP id e1so4369449wrt.5
 for <qemu-devel@nongnu.org>; Thu, 14 May 2020 07:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=2KCp1uG/ffB1kmMrSCwFbDmOf/ZZNxB0ZHbmnQKL4zw=;
 b=LQWUadJokIj4V5ELeBYMUMBX9voCS5Mx4lBb5CZmCh+h9ui4ZHD+wMn0EScTo7wDTU
 Z5rPXwbblCB3zR/rJgwY0y0L8kXHJSeQ9uIc3IOy4n2z0kJqgbrXtWeY2y2mxD4CR9Qv
 jtddBIhGQOwCCt1OU/w44UFMUkt9mNRKFpvk379+dSJeoe4fjO8lcJvvRKVPgnscyJ1V
 Y+BwRFwZDRlEUV95EY2NugIBIkMWalPwNq3gs5+q3wNK0o6tgA4Sl9J5GTGNiugJope6
 dE138+H/WC6c+KmbXegxoe5cSKOtb8CkOdAbz61mtS8lI8nU1mOiRoLVyokvVKeQlruP
 f0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2KCp1uG/ffB1kmMrSCwFbDmOf/ZZNxB0ZHbmnQKL4zw=;
 b=tS7ZwsqZRUpTw2y6Ky6MyrAX2Dcw35hsXhg/ziBR0oE/PDOFTgIDxR+0ShlQrVo+nE
 2lAcuJcttUZJF7Anqq6bnJj/A+9pZcIfS37qCGJkXQzLk3HreVc7dhZ8dZv5asZuEsg1
 3LgVar7z2QfUX2DiVpF2E0hyFMGPrJjipN/akRhxKsgJFylfFHkAyzOplSLkqmFP8OPA
 J2ph01xvWg/SUS0AC3cAcwtKj7SaGiEO4x5kuSlSTE6VRgPOFJma4uSEKmaEcP+vQR2i
 8FzB5YWr/cg5WR73m3PJs6zEDScHNgrrYpqWUimV5mh/TQlXokd9yHxnEIoeRbX4X7EH
 XgpQ==
X-Gm-Message-State: AOAM530bKKP+6m1yRoaPDWEKL+ZFnOtOBQzW2yZAQ4XcaFgZqTfQWyfi
 oB3sB1F6h7rGx4M26xCQ4IqoIStRbnT4JA==
X-Google-Smtp-Source: ABdhPJxswQXmUIGfgWudZDUv1eaeopFZT2+4fmziV22Hfb4WBuleaVOAhESCrRloVCKu5auceOQZXA==
X-Received: by 2002:adf:fa92:: with SMTP id h18mr5859453wrr.260.1589466104966; 
 Thu, 14 May 2020 07:21:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 88sm4077443wrq.77.2020.05.14.07.21.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 07:21:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/45] target/arm: Create gen_gvec_{u,s}{rshr,rsra}
Date: Thu, 14 May 2020 15:20:56 +0100
Message-Id: <20200514142138.20875-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200514142138.20875-1-peter.maydell@linaro.org>
References: <20200514142138.20875-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

Create vectorized versions of handle_shri_with_rndacc
for shift+round and shift+round+accumulate.  Add out-of-line
helpers in preparation for longer vector lengths from SVE.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20200513163245.17915-3-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h        |  20 ++
 target/arm/translate.h     |   9 +
 target/arm/translate-a64.c |  11 +-
 target/arm/translate.c     | 463 +++++++++++++++++++++++++++++++++++--
 target/arm/vec_helper.c    |  50 ++++
 5 files changed, 527 insertions(+), 26 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 9bc162345ca..aeb1f524553 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -701,6 +701,26 @@ DEF_HELPER_FLAGS_3(gvec_usra_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(gvec_usra_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(gvec_usra_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_3(gvec_srshr_b, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(gvec_srshr_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(gvec_srshr_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(gvec_srshr_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(gvec_urshr_b, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(gvec_urshr_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(gvec_urshr_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(gvec_urshr_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(gvec_srsra_b, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(gvec_srsra_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(gvec_srsra_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(gvec_srsra_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(gvec_ursra_b, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(gvec_ursra_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(gvec_ursra_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(gvec_ursra_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
 #include "helper-sve.h"
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 1839a59a8ea..1db3b43a614 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -302,6 +302,15 @@ void gen_gvec_ssra(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
 void gen_gvec_usra(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
                    int64_t shift, uint32_t opr_sz, uint32_t max_sz);
 
+void gen_gvec_srshr(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
+                    int64_t shift, uint32_t opr_sz, uint32_t max_sz);
+void gen_gvec_urshr(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
+                    int64_t shift, uint32_t opr_sz, uint32_t max_sz);
+void gen_gvec_srsra(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
+                    int64_t shift, uint32_t opr_sz, uint32_t max_sz);
+void gen_gvec_ursra(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
+                    int64_t shift, uint32_t opr_sz, uint32_t max_sz);
+
 /*
  * Forward to the isar_feature_* tests given a DisasContext pointer.
  */
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 315de9a9b68..50949d306bf 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -10218,10 +10218,15 @@ static void handle_vec_simd_shri(DisasContext *s, bool is_q, bool is_u,
         return;
 
     case 0x04: /* SRSHR / URSHR (rounding) */
-        break;
+        gen_gvec_fn2i(s, is_q, rd, rn, shift,
+                      is_u ? gen_gvec_urshr : gen_gvec_srshr, size);
+        return;
+
     case 0x06: /* SRSRA / URSRA (accum + rounding) */
-        accumulate = true;
-        break;
+        gen_gvec_fn2i(s, is_q, rd, rn, shift,
+                      is_u ? gen_gvec_ursra : gen_gvec_srsra, size);
+        return;
+
     default:
         g_assert_not_reached();
     }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index c18140f2e65..aa03dc236bc 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4000,6 +4000,422 @@ void gen_gvec_usra(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
     }
 }
 
+/*
+ * Shift one less than the requested amount, and the low bit is
+ * the rounding bit.  For the 8 and 16-bit operations, because we
+ * mask the low bit, we can perform a normal integer shift instead
+ * of a vector shift.
+ */
+static void gen_srshr8_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
+{
+    TCGv_i64 t = tcg_temp_new_i64();
+
+    tcg_gen_shri_i64(t, a, sh - 1);
+    tcg_gen_andi_i64(t, t, dup_const(MO_8, 1));
+    tcg_gen_vec_sar8i_i64(d, a, sh);
+    tcg_gen_vec_add8_i64(d, d, t);
+    tcg_temp_free_i64(t);
+}
+
+static void gen_srshr16_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
+{
+    TCGv_i64 t = tcg_temp_new_i64();
+
+    tcg_gen_shri_i64(t, a, sh - 1);
+    tcg_gen_andi_i64(t, t, dup_const(MO_16, 1));
+    tcg_gen_vec_sar16i_i64(d, a, sh);
+    tcg_gen_vec_add16_i64(d, d, t);
+    tcg_temp_free_i64(t);
+}
+
+static void gen_srshr32_i32(TCGv_i32 d, TCGv_i32 a, int32_t sh)
+{
+    TCGv_i32 t = tcg_temp_new_i32();
+
+    tcg_gen_extract_i32(t, a, sh - 1, 1);
+    tcg_gen_sari_i32(d, a, sh);
+    tcg_gen_add_i32(d, d, t);
+    tcg_temp_free_i32(t);
+}
+
+static void gen_srshr64_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
+{
+    TCGv_i64 t = tcg_temp_new_i64();
+
+    tcg_gen_extract_i64(t, a, sh - 1, 1);
+    tcg_gen_sari_i64(d, a, sh);
+    tcg_gen_add_i64(d, d, t);
+    tcg_temp_free_i64(t);
+}
+
+static void gen_srshr_vec(unsigned vece, TCGv_vec d, TCGv_vec a, int64_t sh)
+{
+    TCGv_vec t = tcg_temp_new_vec_matching(d);
+    TCGv_vec ones = tcg_temp_new_vec_matching(d);
+
+    tcg_gen_shri_vec(vece, t, a, sh - 1);
+    tcg_gen_dupi_vec(vece, ones, 1);
+    tcg_gen_and_vec(vece, t, t, ones);
+    tcg_gen_sari_vec(vece, d, a, sh);
+    tcg_gen_add_vec(vece, d, d, t);
+
+    tcg_temp_free_vec(t);
+    tcg_temp_free_vec(ones);
+}
+
+void gen_gvec_srshr(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
+                    int64_t shift, uint32_t opr_sz, uint32_t max_sz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_shri_vec, INDEX_op_sari_vec, INDEX_op_add_vec, 0
+    };
+    static const GVecGen2i ops[4] = {
+        { .fni8 = gen_srshr8_i64,
+          .fniv = gen_srshr_vec,
+          .fno = gen_helper_gvec_srshr_b,
+          .opt_opc = vecop_list,
+          .vece = MO_8 },
+        { .fni8 = gen_srshr16_i64,
+          .fniv = gen_srshr_vec,
+          .fno = gen_helper_gvec_srshr_h,
+          .opt_opc = vecop_list,
+          .vece = MO_16 },
+        { .fni4 = gen_srshr32_i32,
+          .fniv = gen_srshr_vec,
+          .fno = gen_helper_gvec_srshr_s,
+          .opt_opc = vecop_list,
+          .vece = MO_32 },
+        { .fni8 = gen_srshr64_i64,
+          .fniv = gen_srshr_vec,
+          .fno = gen_helper_gvec_srshr_d,
+          .prefer_i64 = TCG_TARGET_REG_BITS == 64,
+          .opt_opc = vecop_list,
+          .vece = MO_64 },
+    };
+
+    /* tszimm encoding produces immediates in the range [1..esize] */
+    tcg_debug_assert(shift > 0);
+    tcg_debug_assert(shift <= (8 << vece));
+
+    if (shift == (8 << vece)) {
+        /*
+         * Shifts larger than the element size are architecturally valid.
+         * Signed results in all sign bits.  With rounding, this produces
+         *   (-1 + 1) >> 1 == 0, or (0 + 1) >> 1 == 0.
+         * I.e. always zero.
+         */
+        tcg_gen_gvec_dup_imm(vece, rd_ofs, opr_sz, max_sz, 0);
+    } else {
+        tcg_gen_gvec_2i(rd_ofs, rm_ofs, opr_sz, max_sz, shift, &ops[vece]);
+    }
+}
+
+static void gen_srsra8_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
+{
+    TCGv_i64 t = tcg_temp_new_i64();
+
+    gen_srshr8_i64(t, a, sh);
+    tcg_gen_vec_add8_i64(d, d, t);
+    tcg_temp_free_i64(t);
+}
+
+static void gen_srsra16_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
+{
+    TCGv_i64 t = tcg_temp_new_i64();
+
+    gen_srshr16_i64(t, a, sh);
+    tcg_gen_vec_add16_i64(d, d, t);
+    tcg_temp_free_i64(t);
+}
+
+static void gen_srsra32_i32(TCGv_i32 d, TCGv_i32 a, int32_t sh)
+{
+    TCGv_i32 t = tcg_temp_new_i32();
+
+    gen_srshr32_i32(t, a, sh);
+    tcg_gen_add_i32(d, d, t);
+    tcg_temp_free_i32(t);
+}
+
+static void gen_srsra64_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
+{
+    TCGv_i64 t = tcg_temp_new_i64();
+
+    gen_srshr64_i64(t, a, sh);
+    tcg_gen_add_i64(d, d, t);
+    tcg_temp_free_i64(t);
+}
+
+static void gen_srsra_vec(unsigned vece, TCGv_vec d, TCGv_vec a, int64_t sh)
+{
+    TCGv_vec t = tcg_temp_new_vec_matching(d);
+
+    gen_srshr_vec(vece, t, a, sh);
+    tcg_gen_add_vec(vece, d, d, t);
+    tcg_temp_free_vec(t);
+}
+
+void gen_gvec_srsra(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
+                    int64_t shift, uint32_t opr_sz, uint32_t max_sz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_shri_vec, INDEX_op_sari_vec, INDEX_op_add_vec, 0
+    };
+    static const GVecGen2i ops[4] = {
+        { .fni8 = gen_srsra8_i64,
+          .fniv = gen_srsra_vec,
+          .fno = gen_helper_gvec_srsra_b,
+          .opt_opc = vecop_list,
+          .load_dest = true,
+          .vece = MO_8 },
+        { .fni8 = gen_srsra16_i64,
+          .fniv = gen_srsra_vec,
+          .fno = gen_helper_gvec_srsra_h,
+          .opt_opc = vecop_list,
+          .load_dest = true,
+          .vece = MO_16 },
+        { .fni4 = gen_srsra32_i32,
+          .fniv = gen_srsra_vec,
+          .fno = gen_helper_gvec_srsra_s,
+          .opt_opc = vecop_list,
+          .load_dest = true,
+          .vece = MO_32 },
+        { .fni8 = gen_srsra64_i64,
+          .fniv = gen_srsra_vec,
+          .fno = gen_helper_gvec_srsra_d,
+          .prefer_i64 = TCG_TARGET_REG_BITS == 64,
+          .opt_opc = vecop_list,
+          .load_dest = true,
+          .vece = MO_64 },
+    };
+
+    /* tszimm encoding produces immediates in the range [1..esize] */
+    tcg_debug_assert(shift > 0);
+    tcg_debug_assert(shift <= (8 << vece));
+
+    /*
+     * Shifts larger than the element size are architecturally valid.
+     * Signed results in all sign bits.  With rounding, this produces
+     *   (-1 + 1) >> 1 == 0, or (0 + 1) >> 1 == 0.
+     * I.e. always zero.  With accumulation, this leaves D unchanged.
+     */
+    if (shift == (8 << vece)) {
+        /* Nop, but we do need to clear the tail. */
+        tcg_gen_gvec_mov(vece, rd_ofs, rd_ofs, opr_sz, max_sz);
+    } else {
+        tcg_gen_gvec_2i(rd_ofs, rm_ofs, opr_sz, max_sz, shift, &ops[vece]);
+    }
+}
+
+static void gen_urshr8_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
+{
+    TCGv_i64 t = tcg_temp_new_i64();
+
+    tcg_gen_shri_i64(t, a, sh - 1);
+    tcg_gen_andi_i64(t, t, dup_const(MO_8, 1));
+    tcg_gen_vec_shr8i_i64(d, a, sh);
+    tcg_gen_vec_add8_i64(d, d, t);
+    tcg_temp_free_i64(t);
+}
+
+static void gen_urshr16_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
+{
+    TCGv_i64 t = tcg_temp_new_i64();
+
+    tcg_gen_shri_i64(t, a, sh - 1);
+    tcg_gen_andi_i64(t, t, dup_const(MO_16, 1));
+    tcg_gen_vec_shr16i_i64(d, a, sh);
+    tcg_gen_vec_add16_i64(d, d, t);
+    tcg_temp_free_i64(t);
+}
+
+static void gen_urshr32_i32(TCGv_i32 d, TCGv_i32 a, int32_t sh)
+{
+    TCGv_i32 t = tcg_temp_new_i32();
+
+    tcg_gen_extract_i32(t, a, sh - 1, 1);
+    tcg_gen_shri_i32(d, a, sh);
+    tcg_gen_add_i32(d, d, t);
+    tcg_temp_free_i32(t);
+}
+
+static void gen_urshr64_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
+{
+    TCGv_i64 t = tcg_temp_new_i64();
+
+    tcg_gen_extract_i64(t, a, sh - 1, 1);
+    tcg_gen_shri_i64(d, a, sh);
+    tcg_gen_add_i64(d, d, t);
+    tcg_temp_free_i64(t);
+}
+
+static void gen_urshr_vec(unsigned vece, TCGv_vec d, TCGv_vec a, int64_t shift)
+{
+    TCGv_vec t = tcg_temp_new_vec_matching(d);
+    TCGv_vec ones = tcg_temp_new_vec_matching(d);
+
+    tcg_gen_shri_vec(vece, t, a, shift - 1);
+    tcg_gen_dupi_vec(vece, ones, 1);
+    tcg_gen_and_vec(vece, t, t, ones);
+    tcg_gen_shri_vec(vece, d, a, shift);
+    tcg_gen_add_vec(vece, d, d, t);
+
+    tcg_temp_free_vec(t);
+    tcg_temp_free_vec(ones);
+}
+
+void gen_gvec_urshr(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
+                    int64_t shift, uint32_t opr_sz, uint32_t max_sz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_shri_vec, INDEX_op_add_vec, 0
+    };
+    static const GVecGen2i ops[4] = {
+        { .fni8 = gen_urshr8_i64,
+          .fniv = gen_urshr_vec,
+          .fno = gen_helper_gvec_urshr_b,
+          .opt_opc = vecop_list,
+          .vece = MO_8 },
+        { .fni8 = gen_urshr16_i64,
+          .fniv = gen_urshr_vec,
+          .fno = gen_helper_gvec_urshr_h,
+          .opt_opc = vecop_list,
+          .vece = MO_16 },
+        { .fni4 = gen_urshr32_i32,
+          .fniv = gen_urshr_vec,
+          .fno = gen_helper_gvec_urshr_s,
+          .opt_opc = vecop_list,
+          .vece = MO_32 },
+        { .fni8 = gen_urshr64_i64,
+          .fniv = gen_urshr_vec,
+          .fno = gen_helper_gvec_urshr_d,
+          .prefer_i64 = TCG_TARGET_REG_BITS == 64,
+          .opt_opc = vecop_list,
+          .vece = MO_64 },
+    };
+
+    /* tszimm encoding produces immediates in the range [1..esize] */
+    tcg_debug_assert(shift > 0);
+    tcg_debug_assert(shift <= (8 << vece));
+
+    if (shift == (8 << vece)) {
+        /*
+         * Shifts larger than the element size are architecturally valid.
+         * Unsigned results in zero.  With rounding, this produces a
+         * copy of the most significant bit.
+         */
+        tcg_gen_gvec_shri(vece, rd_ofs, rm_ofs, shift - 1, opr_sz, max_sz);
+    } else {
+        tcg_gen_gvec_2i(rd_ofs, rm_ofs, opr_sz, max_sz, shift, &ops[vece]);
+    }
+}
+
+static void gen_ursra8_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
+{
+    TCGv_i64 t = tcg_temp_new_i64();
+
+    if (sh == 8) {
+        tcg_gen_vec_shr8i_i64(t, a, 7);
+    } else {
+        gen_urshr8_i64(t, a, sh);
+    }
+    tcg_gen_vec_add8_i64(d, d, t);
+    tcg_temp_free_i64(t);
+}
+
+static void gen_ursra16_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
+{
+    TCGv_i64 t = tcg_temp_new_i64();
+
+    if (sh == 16) {
+        tcg_gen_vec_shr16i_i64(t, a, 15);
+    } else {
+        gen_urshr16_i64(t, a, sh);
+    }
+    tcg_gen_vec_add16_i64(d, d, t);
+    tcg_temp_free_i64(t);
+}
+
+static void gen_ursra32_i32(TCGv_i32 d, TCGv_i32 a, int32_t sh)
+{
+    TCGv_i32 t = tcg_temp_new_i32();
+
+    if (sh == 32) {
+        tcg_gen_shri_i32(t, a, 31);
+    } else {
+        gen_urshr32_i32(t, a, sh);
+    }
+    tcg_gen_add_i32(d, d, t);
+    tcg_temp_free_i32(t);
+}
+
+static void gen_ursra64_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
+{
+    TCGv_i64 t = tcg_temp_new_i64();
+
+    if (sh == 64) {
+        tcg_gen_shri_i64(t, a, 63);
+    } else {
+        gen_urshr64_i64(t, a, sh);
+    }
+    tcg_gen_add_i64(d, d, t);
+    tcg_temp_free_i64(t);
+}
+
+static void gen_ursra_vec(unsigned vece, TCGv_vec d, TCGv_vec a, int64_t sh)
+{
+    TCGv_vec t = tcg_temp_new_vec_matching(d);
+
+    if (sh == (8 << vece)) {
+        tcg_gen_shri_vec(vece, t, a, sh - 1);
+    } else {
+        gen_urshr_vec(vece, t, a, sh);
+    }
+    tcg_gen_add_vec(vece, d, d, t);
+    tcg_temp_free_vec(t);
+}
+
+void gen_gvec_ursra(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
+                    int64_t shift, uint32_t opr_sz, uint32_t max_sz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_shri_vec, INDEX_op_add_vec, 0
+    };
+    static const GVecGen2i ops[4] = {
+        { .fni8 = gen_ursra8_i64,
+          .fniv = gen_ursra_vec,
+          .fno = gen_helper_gvec_ursra_b,
+          .opt_opc = vecop_list,
+          .load_dest = true,
+          .vece = MO_8 },
+        { .fni8 = gen_ursra16_i64,
+          .fniv = gen_ursra_vec,
+          .fno = gen_helper_gvec_ursra_h,
+          .opt_opc = vecop_list,
+          .load_dest = true,
+          .vece = MO_16 },
+        { .fni4 = gen_ursra32_i32,
+          .fniv = gen_ursra_vec,
+          .fno = gen_helper_gvec_ursra_s,
+          .opt_opc = vecop_list,
+          .load_dest = true,
+          .vece = MO_32 },
+        { .fni8 = gen_ursra64_i64,
+          .fniv = gen_ursra_vec,
+          .fno = gen_helper_gvec_ursra_d,
+          .prefer_i64 = TCG_TARGET_REG_BITS == 64,
+          .opt_opc = vecop_list,
+          .load_dest = true,
+          .vece = MO_64 },
+    };
+
+    /* tszimm encoding produces immediates in the range [1..esize] */
+    tcg_debug_assert(shift > 0);
+    tcg_debug_assert(shift <= (8 << vece));
+
+    tcg_gen_gvec_2i(rd_ofs, rm_ofs, opr_sz, max_sz, shift, &ops[vece]);
+}
+
 static void gen_shr8_ins_i64(TCGv_i64 d, TCGv_i64 a, int64_t shift)
 {
     uint64_t mask = dup_const(MO_8, 0xff >> shift);
@@ -5269,6 +5685,30 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                     }
                     return 0;
 
+                case 2: /* VRSHR */
+                    /* Right shift comes here negative.  */
+                    shift = -shift;
+                    if (u) {
+                        gen_gvec_urshr(size, rd_ofs, rm_ofs, shift,
+                                       vec_size, vec_size);
+                    } else {
+                        gen_gvec_srshr(size, rd_ofs, rm_ofs, shift,
+                                       vec_size, vec_size);
+                    }
+                    return 0;
+
+                case 3: /* VRSRA */
+                    /* Right shift comes here negative.  */
+                    shift = -shift;
+                    if (u) {
+                        gen_gvec_ursra(size, rd_ofs, rm_ofs, shift,
+                                       vec_size, vec_size);
+                    } else {
+                        gen_gvec_srsra(size, rd_ofs, rm_ofs, shift,
+                                       vec_size, vec_size);
+                    }
+                    return 0;
+
                 case 4: /* VSRI */
                     if (!u) {
                         return 1;
@@ -5320,13 +5760,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                         neon_load_reg64(cpu_V0, rm + pass);
                         tcg_gen_movi_i64(cpu_V1, imm);
                         switch (op) {
-                        case 2: /* VRSHR */
-                        case 3: /* VRSRA */
-                            if (u)
-                                gen_helper_neon_rshl_u64(cpu_V0, cpu_V0, cpu_V1);
-                            else
-                                gen_helper_neon_rshl_s64(cpu_V0, cpu_V0, cpu_V1);
-                            break;
                         case 6: /* VQSHLU */
                             gen_helper_neon_qshlu_s64(cpu_V0, cpu_env,
                                                       cpu_V0, cpu_V1);
@@ -5343,11 +5776,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                         default:
                             g_assert_not_reached();
                         }
-                        if (op == 3) {
-                            /* Accumulate.  */
-                            neon_load_reg64(cpu_V1, rd + pass);
-                            tcg_gen_add_i64(cpu_V0, cpu_V0, cpu_V1);
-                        }
                         neon_store_reg64(cpu_V0, rd + pass);
                     } else { /* size < 3 */
                         /* Operands in T0 and T1.  */
@@ -5355,10 +5783,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                         tmp2 = tcg_temp_new_i32();
                         tcg_gen_movi_i32(tmp2, imm);
                         switch (op) {
-                        case 2: /* VRSHR */
-                        case 3: /* VRSRA */
-                            GEN_NEON_INTEGER_OP(rshl);
-                            break;
                         case 6: /* VQSHLU */
                             switch (size) {
                             case 0:
@@ -5384,13 +5808,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                             g_assert_not_reached();
                         }
                         tcg_temp_free_i32(tmp2);
-
-                        if (op == 3) {
-                            /* Accumulate.  */
-                            tmp2 = neon_load_reg(rd, pass);
-                            gen_neon_add(size, tmp, tmp2);
-                            tcg_temp_free_i32(tmp2);
-                        }
                         neon_store_reg(rd, pass, tmp);
                     }
                 } /* for pass */
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 230085b35ed..fd8b2bff493 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -924,6 +924,56 @@ DO_SRA(gvec_usra_d, uint64_t)
 
 #undef DO_SRA
 
+#define DO_RSHR(NAME, TYPE)                             \
+void HELPER(NAME)(void *vd, void *vn, uint32_t desc)    \
+{                                                       \
+    intptr_t i, oprsz = simd_oprsz(desc);               \
+    int shift = simd_data(desc);                        \
+    TYPE *d = vd, *n = vn;                              \
+    for (i = 0; i < oprsz / sizeof(TYPE); i++) {        \
+        TYPE tmp = n[i] >> (shift - 1);                 \
+        d[i] = (tmp >> 1) + (tmp & 1);                  \
+    }                                                   \
+    clear_tail(d, oprsz, simd_maxsz(desc));             \
+}
+
+DO_RSHR(gvec_srshr_b, int8_t)
+DO_RSHR(gvec_srshr_h, int16_t)
+DO_RSHR(gvec_srshr_s, int32_t)
+DO_RSHR(gvec_srshr_d, int64_t)
+
+DO_RSHR(gvec_urshr_b, uint8_t)
+DO_RSHR(gvec_urshr_h, uint16_t)
+DO_RSHR(gvec_urshr_s, uint32_t)
+DO_RSHR(gvec_urshr_d, uint64_t)
+
+#undef DO_RSHR
+
+#define DO_RSRA(NAME, TYPE)                             \
+void HELPER(NAME)(void *vd, void *vn, uint32_t desc)    \
+{                                                       \
+    intptr_t i, oprsz = simd_oprsz(desc);               \
+    int shift = simd_data(desc);                        \
+    TYPE *d = vd, *n = vn;                              \
+    for (i = 0; i < oprsz / sizeof(TYPE); i++) {        \
+        TYPE tmp = n[i] >> (shift - 1);                 \
+        d[i] += (tmp >> 1) + (tmp & 1);                 \
+    }                                                   \
+    clear_tail(d, oprsz, simd_maxsz(desc));             \
+}
+
+DO_RSRA(gvec_srsra_b, int8_t)
+DO_RSRA(gvec_srsra_h, int16_t)
+DO_RSRA(gvec_srsra_s, int32_t)
+DO_RSRA(gvec_srsra_d, int64_t)
+
+DO_RSRA(gvec_ursra_b, uint8_t)
+DO_RSRA(gvec_ursra_h, uint16_t)
+DO_RSRA(gvec_ursra_s, uint32_t)
+DO_RSRA(gvec_ursra_d, uint64_t)
+
+#undef DO_RSRA
+
 /*
  * Convert float16 to float32, raising no exceptions and
  * preserving exceptional values, including SNaN.
-- 
2.20.1


