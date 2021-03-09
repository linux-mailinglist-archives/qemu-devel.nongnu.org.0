Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D4F332D87
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 18:46:51 +0100 (CET)
Received: from localhost ([::1]:53190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJgRW-0007xo-OA
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 12:46:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf6j-0007Lx-5c
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:21:17 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:35875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf6X-0002SU-Dc
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:21:16 -0500
Received: by mail-oi1-x236.google.com with SMTP id o22so5780587oic.3
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tgusoMtmDQWI+mFp+GeBtWOtPA1PyCYaH+NXyjthEkA=;
 b=pqzv2niGVMP0OGtuk0ONtdcvfGynuzAROnLj1lNdN7kDrKSvVaSe1ZImDJFp4T3+6K
 NHSHg2lRnLjxB6s3ZUkif8qvI6P+89Y+dl3w80O2h7Gv8674gXDBzgz52uWcvUHgELv4
 9b8GgjsDMw7chlm+zC3CHFuRBWyAZnQ1YVAW83x2lg9R49m8btowfp8+AHfxa9wa8LMu
 aug5ba/ISn9P7nAZwjqD/wTrPpOGos+rVvjd350b56roBILCUayzarWgAXFKXYgpCbVd
 TNtfA0N4fdgB+wOb+IWo1lKG5tdnGC+JehBBgrNnumxQ4vZo7Zh66cmHbo7jMPQz+2dk
 5vSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tgusoMtmDQWI+mFp+GeBtWOtPA1PyCYaH+NXyjthEkA=;
 b=mCmV2wxlcpkB1W7cpnew9MKdfncY62ou1M5axUArXzcv4X5KGgdqJlpBvyC3dKAHFK
 gfFYEnLfxNhJlndRxOZpcSUMpZ4mecGMcNxeRv0RB0b0SGuYZlOcm2dsKK6Gn4Vv8GuW
 hax77xsBknNtWs3s2ZdZKiai39un5j8G5B/kbCd6buGzt/aJ3Jb/wx8tQQLw1B/2pun5
 cdBCvozPVUPW9g/7tqYeGqlmI/WuQeJw/J5WLjTYrtp6QYLmG62e7BR0yoX/JMm/2HiJ
 vAnBqib3oY97hUU+VaFMpuuqei8m4a1tETwXEU0mMbxyddvkKA/VJXu/DLnjG+fuvpns
 x1hg==
X-Gm-Message-State: AOAM532JYqLlfi+Qi3rMDz+cXxwQrO7KgOQ6GMlVil2lUiUe8VVa5KQO
 JSJ0y1DN7rL/i7MmfSKvKjwVzQLDiB+rfP/p
X-Google-Smtp-Source: ABdhPJwIVTjSovuotv8pBvsVkfYclC/HBNTdXbAyoUt5UXXrITSM+hE0R2gEESuttAu2JCBMcGxSCQ==
X-Received: by 2002:a05:6808:1290:: with SMTP id
 a16mr3483280oiw.161.1615306859972; 
 Tue, 09 Mar 2021 08:20:59 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:20:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 15/78] target/arm: Implement SVE2 bitwise shift left long
Date: Tue,  9 Mar 2021 08:19:38 -0800
Message-Id: <20210309162041.23124-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |   8 ++
 target/arm/sve.decode      |   8 ++
 target/arm/sve_helper.c    |  26 ++++++
 target/arm/translate-sve.c | 159 +++++++++++++++++++++++++++++++++++++
 4 files changed, 201 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index bf3e533eb4..740939e7a8 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2364,3 +2364,11 @@ DEF_HELPER_FLAGS_4(sve2_umull_zzz_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(sve2_pmull_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_pmull_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_sshll_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sshll_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sshll_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_ushll_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_ushll_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_ushll_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 016c15ebb6..a3191eba7b 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1207,3 +1207,11 @@ SMULLB_zzz      01000101 .. 0 ..... 011 100 ..... .....  @rd_rn_rm
 SMULLT_zzz      01000101 .. 0 ..... 011 101 ..... .....  @rd_rn_rm
 UMULLB_zzz      01000101 .. 0 ..... 011 110 ..... .....  @rd_rn_rm
 UMULLT_zzz      01000101 .. 0 ..... 011 111 ..... .....  @rd_rn_rm
+
+## SVE2 bitwise shift left long
+
+# Note bit23 == 0 is handled by esz > 0 in do_sve2_shll_tb.
+SSHLLB          01000101 .. 0 ..... 1010 00 ..... .....  @rd_rn_tszimm_shl
+SSHLLT          01000101 .. 0 ..... 1010 01 ..... .....  @rd_rn_tszimm_shl
+USHLLB          01000101 .. 0 ..... 1010 10 ..... .....  @rd_rn_tszimm_shl
+USHLLT          01000101 .. 0 ..... 1010 11 ..... .....  @rd_rn_tszimm_shl
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 7877a5bdf5..3e80b612ea 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -625,6 +625,8 @@ DO_ZPZZ(sve2_sqrshl_zpzz_h, int16_t, H1_2, do_sqrshl_h)
 DO_ZPZZ(sve2_sqrshl_zpzz_s, int32_t, H1_4, do_sqrshl_s)
 DO_ZPZZ_D(sve2_sqrshl_zpzz_d, int64_t, do_sqrshl_d)
 
+#undef do_sqrshl_d
+
 #define do_uqrshl_b(n, m) \
    ({ uint32_t discard; do_uqrshl_bhs(n, (int8_t)m, 8, true, &discard); })
 #define do_uqrshl_h(n, m) \
@@ -639,6 +641,8 @@ DO_ZPZZ(sve2_uqrshl_zpzz_h, uint16_t, H1_2, do_uqrshl_h)
 DO_ZPZZ(sve2_uqrshl_zpzz_s, uint32_t, H1_4, do_uqrshl_s)
 DO_ZPZZ_D(sve2_uqrshl_zpzz_d, uint64_t, do_uqrshl_d)
 
+#undef do_uqrshl_d
+
 #define DO_HADD_BHS(n, m)  (((int64_t)n + m) >> 1)
 #define DO_HADD_D(n, m)    ((n >> 1) + (m >> 1) + (n & m & 1))
 
@@ -1217,6 +1221,28 @@ DO_ZZZ_WTB(sve2_usubw_d, uint64_t, uint32_t,     , H1_4, DO_SUB)
 
 #undef DO_ZZZ_WTB
 
+#define DO_ZZI_SHLL(NAME, TYPEW, TYPEN, HW, HN) \
+void HELPER(NAME)(void *vd, void *vn, uint32_t desc)           \
+{                                                              \
+    intptr_t i, opr_sz = simd_oprsz(desc);                     \
+    intptr_t sel = (simd_data(desc) & 1) * sizeof(TYPEN);      \
+    int shift = simd_data(desc) >> 1;                          \
+    for (i = 0; i < opr_sz; i += sizeof(TYPEW)) {              \
+        TYPEW nn = *(TYPEN *)(vn + HN(i + sel));               \
+        *(TYPEW *)(vd + HW(i)) = nn << shift;                  \
+    }                                                          \
+}
+
+DO_ZZI_SHLL(sve2_sshll_h, int16_t, int8_t, H1_2, H1)
+DO_ZZI_SHLL(sve2_sshll_s, int32_t, int16_t, H1_4, H1_2)
+DO_ZZI_SHLL(sve2_sshll_d, int64_t, int32_t,     , H1_4)
+
+DO_ZZI_SHLL(sve2_ushll_h, uint16_t, uint8_t, H1_2, H1)
+DO_ZZI_SHLL(sve2_ushll_s, uint32_t, uint16_t, H1_4, H1_2)
+DO_ZZI_SHLL(sve2_ushll_d, uint64_t, uint32_t,     , H1_4)
+
+#undef DO_ZZI_SHLL
+
 /* Two-operand reduction expander, controlled by a predicate.
  * The difference between TYPERED and TYPERET has to do with
  * sign-extension.  E.g. for SMAX, TYPERED must be signed,
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 260337d111..0f8686d47e 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6072,3 +6072,162 @@ DO_SVE2_ZZZ_WTB(UADDWB, uaddw, false)
 DO_SVE2_ZZZ_WTB(UADDWT, uaddw, true)
 DO_SVE2_ZZZ_WTB(USUBWB, usubw, false)
 DO_SVE2_ZZZ_WTB(USUBWT, usubw, true)
+
+static void gen_sshll_vec(unsigned vece, TCGv_vec d, TCGv_vec n, int64_t imm)
+{
+    int top = imm & 1;
+    int shl = imm >> 1;
+    int halfbits = 4 << vece;
+
+    if (top) {
+        if (shl == halfbits) {
+            TCGv_vec t = tcg_temp_new_vec_matching(d);
+            tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(halfbits, halfbits));
+            tcg_gen_and_vec(vece, d, n, t);
+            tcg_temp_free_vec(t);
+        } else {
+            tcg_gen_sari_vec(vece, d, n, halfbits);
+            tcg_gen_shli_vec(vece, d, d, shl);
+        }
+    } else {
+        tcg_gen_shli_vec(vece, d, n, halfbits);
+        tcg_gen_sari_vec(vece, d, d, halfbits - shl);
+    }
+}
+
+static void gen_ushll_i64(unsigned vece, TCGv_i64 d, TCGv_i64 n, int imm)
+{
+    int halfbits = 4 << vece;
+    int top = imm & 1;
+    int shl = (imm >> 1);
+    int shift;
+    uint64_t mask;
+
+    mask = MAKE_64BIT_MASK(0, halfbits);
+    mask <<= shl;
+    mask = dup_const(vece, mask);
+
+    shift = shl - top * halfbits;
+    if (shift < 0) {
+        tcg_gen_shri_i64(d, n, -shift);
+    } else {
+        tcg_gen_shri_i64(d, n, shift);
+    }
+    tcg_gen_andi_i64(d, d, mask);
+}
+
+static void gen_ushll16_i64(TCGv_i64 d, TCGv_i64 n, int64_t imm)
+{
+    gen_ushll_i64(MO_16, d, n, imm);
+}
+
+static void gen_ushll32_i64(TCGv_i64 d, TCGv_i64 n, int64_t imm)
+{
+    gen_ushll_i64(MO_32, d, n, imm);
+}
+
+static void gen_ushll64_i64(TCGv_i64 d, TCGv_i64 n, int64_t imm)
+{
+    gen_ushll_i64(MO_64, d, n, imm);
+}
+
+static void gen_ushll_vec(unsigned vece, TCGv_vec d, TCGv_vec n, int64_t imm)
+{
+    int halfbits = 4 << vece;
+    int top = imm & 1;
+    int shl = imm >> 1;
+
+    if (top) {
+        if (shl == halfbits) {
+            TCGv_vec t = tcg_temp_new_vec_matching(d);
+            tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(halfbits, halfbits));
+            tcg_gen_and_vec(vece, d, n, t);
+            tcg_temp_free_vec(t);
+        } else {
+            tcg_gen_shri_vec(vece, d, n, halfbits);
+            tcg_gen_shli_vec(vece, d, d, shl);
+        }
+    } else {
+        if (shl == 0) {
+            TCGv_vec t = tcg_temp_new_vec_matching(d);
+            tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(0, halfbits));
+            tcg_gen_and_vec(vece, d, n, t);
+            tcg_temp_free_vec(t);
+        } else {
+            tcg_gen_shli_vec(vece, d, n, halfbits);
+            tcg_gen_shri_vec(vece, d, d, halfbits - shl);
+        }
+    }
+}
+
+static bool do_sve2_shll_tb(DisasContext *s, arg_rri_esz *a,
+                            bool sel, bool uns)
+{
+    static const TCGOpcode sshll_list[] = {
+        INDEX_op_shli_vec, INDEX_op_sari_vec, 0
+    };
+    static const TCGOpcode ushll_list[] = {
+        INDEX_op_shli_vec, INDEX_op_shri_vec, 0
+    };
+    static const GVecGen2i ops[2][3] = {
+        { { .fniv = gen_sshll_vec,
+            .opt_opc = sshll_list,
+            .fno = gen_helper_sve2_sshll_h,
+            .vece = MO_16 },
+          { .fniv = gen_sshll_vec,
+            .opt_opc = sshll_list,
+            .fno = gen_helper_sve2_sshll_s,
+            .vece = MO_32 },
+          { .fniv = gen_sshll_vec,
+            .opt_opc = sshll_list,
+            .fno = gen_helper_sve2_sshll_d,
+            .vece = MO_64 } },
+        { { .fni8 = gen_ushll16_i64,
+            .fniv = gen_ushll_vec,
+            .opt_opc = ushll_list,
+            .fno = gen_helper_sve2_ushll_h,
+            .vece = MO_16 },
+          { .fni8 = gen_ushll32_i64,
+            .fniv = gen_ushll_vec,
+            .opt_opc = ushll_list,
+            .fno = gen_helper_sve2_ushll_s,
+            .vece = MO_32 },
+          { .fni8 = gen_ushll64_i64,
+            .fniv = gen_ushll_vec,
+            .opt_opc = ushll_list,
+            .fno = gen_helper_sve2_ushll_d,
+            .vece = MO_64 } },
+    };
+
+    if (a->esz < 0 || a->esz > 2 || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_2i(vec_full_reg_offset(s, a->rd),
+                        vec_full_reg_offset(s, a->rn),
+                        vsz, vsz, (a->imm << 1) | sel,
+                        &ops[uns][a->esz]);
+    }
+    return true;
+}
+
+static bool trans_SSHLLB(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_shll_tb(s, a, false, false);
+}
+
+static bool trans_SSHLLT(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_shll_tb(s, a, true, false);
+}
+
+static bool trans_USHLLB(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_shll_tb(s, a, false, true);
+}
+
+static bool trans_USHLLT(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_shll_tb(s, a, true, true);
+}
-- 
2.25.1


