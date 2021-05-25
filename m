Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD8038F798
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 03:36:02 +0200 (CEST)
Received: from localhost ([::1]:35610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llLzF-0000F2-TD
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 21:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLV2-00023o-QG
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:04:48 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:42604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUX-0001pm-5L
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:04:48 -0400
Received: by mail-pf1-x429.google.com with SMTP id x18so17968220pfi.9
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1ZgLGkKf891GG6QDr9mPY7zyf50wI69yX/zlHFqjxeo=;
 b=cmfXEopvQ3ub5yHLSb0yAkCvpSry4C1gy1K27cfyjNLwTaDkfm2fdTNoI485Pc0K4Y
 PVPnVNtKCw7bAXz4hrnjv1M41IM4NLiwqEw1KjcgQhg8vBsasvVwVn0zE87DtGufBmOB
 eQ1dv3U3g4wnCBAWoWH6YxFlDYpaDRJq/fJGibN0IAuR+TvqXA+SG/5LW+6bGiM+WZwz
 H4budhcB0S/TeGoPzM4ULkUqNnwy5HoEAvxMpRoystoMIwvZQhln0Y6bw6Dq5oKVXLo+
 S2nHBiqOPTMt44LS9cRyIne8nDtKfG3eSegNMpO6i3hg0SKj6GwDNN2Hkd1TS8Jaj1z+
 3iLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1ZgLGkKf891GG6QDr9mPY7zyf50wI69yX/zlHFqjxeo=;
 b=iQwJxOkV4hox7IhFFz5w7hI+hfe0zNhsDkFZ0/kyfuLK31fKg4xN0deo0DhDrqBPjH
 t81XD45x40ZCW3YTy9BmlUnXrajsU/275yGHMiWYVRZ6EUliEAvj7AZtTa/qVlHJWk2l
 meBDRiNDBUMg4XKeh2Z3E9Y/R+Oih43jkRlNtIeAhY+T46UjQLRUrKi7sZ8N4awUWVqq
 hjvo4GbrdrP1WLQ0USB/t7qqa7kJ/ikuDVa7y9ke80R7NP/ZwKd7mfyX/Zr4MyAkXPYN
 LoWnbEOCqYIYPWybsm2oyaTa9pN7X2weNz4Te1d2y7dUATZJSzFujaa8lGJRJMw3uPHH
 fqIA==
X-Gm-Message-State: AOAM533jxPlokflLj2nXOC1t6L5ycNllmNzz9O+6cmb3+p8qouwn+jsC
 p7Ygh05Dyh71GcFpwXT60ETqTjQodj/TFg==
X-Google-Smtp-Source: ABdhPJwONbKCSHCmN++cxSoYYaFcSJaWIXCFoO3b/sMFC122HkBMbd3UcwGPmXv8jc62071EDDs+1g==
X-Received: by 2002:aa7:982e:0:b029:2e4:eef5:e0c9 with SMTP id
 q14-20020aa7982e0000b02902e4eef5e0c9mr18991258pfl.3.1621904655603; 
 Mon, 24 May 2021 18:04:15 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b1sm13742645pgf.84.2021.05.24.18.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:04:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 26/92] target/arm: Implement SVE2 SHRN, RSHRN
Date: Mon, 24 May 2021 18:02:52 -0700
Message-Id: <20210525010358.152808-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix typo in gen_shrnb_vec (laurent desnogues)
v3: Replace DO_RSHR with an inline function
---
 target/arm/helper-sve.h    |  16 ++++
 target/arm/sve.decode      |   8 ++
 target/arm/sve_helper.c    |  54 ++++++++++++-
 target/arm/translate-sve.c | 160 +++++++++++++++++++++++++++++++++++++
 4 files changed, 236 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index a033b5f6b2..2b2ebea631 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2444,6 +2444,22 @@ DEF_HELPER_FLAGS_3(sve2_sqxtunt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_sqxtunt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_sqxtunt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_3(sve2_shrnb_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_shrnb_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_shrnb_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_shrnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_shrnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_shrnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_rshrnb_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_rshrnb_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_rshrnb_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_rshrnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_rshrnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_rshrnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_s, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 9c75ac94c0..169486ecb2 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1285,6 +1285,14 @@ UQXTNT          01000101 .. 1 ..... 010 011 ..... .....  @rd_rn_tszimm_shl
 SQXTUNB         01000101 .. 1 ..... 010 100 ..... .....  @rd_rn_tszimm_shl
 SQXTUNT         01000101 .. 1 ..... 010 101 ..... .....  @rd_rn_tszimm_shl
 
+## SVE2 bitwise shift right narrow
+
+# Bit 23 == 0 is handled by esz > 0 in the translator.
+SHRNB           01000101 .. 1 ..... 00 0100 ..... .....  @rd_rn_tszimm_shr
+SHRNT           01000101 .. 1 ..... 00 0101 ..... .....  @rd_rn_tszimm_shr
+RSHRNB          01000101 .. 1 ..... 00 0110 ..... .....  @rd_rn_tszimm_shr
+RSHRNT          01000101 .. 1 ..... 00 0111 ..... .....  @rd_rn_tszimm_shr
+
 ## SVE2 floating-point pairwise operations
 
 FADDP           01100100 .. 010 00 0 100 ... ..... ..... @rdn_pg_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 16604a424f..8fd61e37f9 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1868,6 +1868,17 @@ void HELPER(NAME)(void *vd, void *vn, void *vg, uint32_t desc)  \
    when N is negative, add 2**M-1.  */
 #define DO_ASRD(N, M) ((N + (N < 0 ? ((__typeof(N))1 << M) - 1 : 0)) >> M)
 
+static inline uint64_t do_urshr(uint64_t x, unsigned sh)
+{
+    if (likely(sh < 64)) {
+        return (x >> sh) + ((x >> (sh - 1)) & 1);
+    } else if (sh == 64) {
+        return x >> 63;
+    } else {
+        return 0;
+    }
+}
+
 DO_ZPZI(sve_asr_zpzi_b, int8_t, H1, DO_SHR)
 DO_ZPZI(sve_asr_zpzi_h, int16_t, H1_2, DO_SHR)
 DO_ZPZI(sve_asr_zpzi_s, int32_t, H1_4, DO_SHR)
@@ -1888,12 +1899,51 @@ DO_ZPZI(sve_asrd_h, int16_t, H1_2, DO_ASRD)
 DO_ZPZI(sve_asrd_s, int32_t, H1_4, DO_ASRD)
 DO_ZPZI_D(sve_asrd_d, int64_t, DO_ASRD)
 
-#undef DO_SHR
-#undef DO_SHL
 #undef DO_ASRD
 #undef DO_ZPZI
 #undef DO_ZPZI_D
 
+#define DO_SHRNB(NAME, TYPEW, TYPEN, OP) \
+void HELPER(NAME)(void *vd, void *vn, uint32_t desc)         \
+{                                                            \
+    intptr_t i, opr_sz = simd_oprsz(desc);                   \
+    int shift = simd_data(desc);                             \
+    for (i = 0; i < opr_sz; i += sizeof(TYPEW)) {            \
+        TYPEW nn = *(TYPEW *)(vn + i);                       \
+        *(TYPEW *)(vd + i) = (TYPEN)OP(nn, shift);           \
+    }                                                        \
+}
+
+#define DO_SHRNT(NAME, TYPEW, TYPEN, HW, HN, OP)                  \
+void HELPER(NAME)(void *vd, void *vn, uint32_t desc)              \
+{                                                                 \
+    intptr_t i, opr_sz = simd_oprsz(desc);                        \
+    int shift = simd_data(desc);                                  \
+    for (i = 0; i < opr_sz; i += sizeof(TYPEW)) {                 \
+        TYPEW nn = *(TYPEW *)(vn + HW(i));                        \
+        *(TYPEN *)(vd + HN(i + sizeof(TYPEN))) = OP(nn, shift);   \
+    }                                                             \
+}
+
+DO_SHRNB(sve2_shrnb_h, uint16_t, uint8_t, DO_SHR)
+DO_SHRNB(sve2_shrnb_s, uint32_t, uint16_t, DO_SHR)
+DO_SHRNB(sve2_shrnb_d, uint64_t, uint32_t, DO_SHR)
+
+DO_SHRNT(sve2_shrnt_h, uint16_t, uint8_t, H1_2, H1, DO_SHR)
+DO_SHRNT(sve2_shrnt_s, uint32_t, uint16_t, H1_4, H1_2, DO_SHR)
+DO_SHRNT(sve2_shrnt_d, uint64_t, uint32_t,     , H1_4, DO_SHR)
+
+DO_SHRNB(sve2_rshrnb_h, uint16_t, uint8_t, do_urshr)
+DO_SHRNB(sve2_rshrnb_s, uint32_t, uint16_t, do_urshr)
+DO_SHRNB(sve2_rshrnb_d, uint64_t, uint32_t, do_urshr)
+
+DO_SHRNT(sve2_rshrnt_h, uint16_t, uint8_t, H1_2, H1, do_urshr)
+DO_SHRNT(sve2_rshrnt_s, uint32_t, uint16_t, H1_4, H1_2, do_urshr)
+DO_SHRNT(sve2_rshrnt_d, uint64_t, uint32_t,     , H1_4, do_urshr)
+
+#undef DO_SHRNB
+#undef DO_SHRNT
+
 /* Fully general four-operand expander, controlled by a predicate.
  */
 #define DO_ZPZZZ(NAME, TYPE, H, OP)                           \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index faf94b304a..e072f8a2cf 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6698,6 +6698,166 @@ static bool trans_SQXTUNT(DisasContext *s, arg_rri_esz *a)
     return do_sve2_narrow_extract(s, a, ops);
 }
 
+static bool do_sve2_shr_narrow(DisasContext *s, arg_rri_esz *a,
+                               const GVecGen2i ops[3])
+{
+    if (a->esz < 0 || a->esz > MO_32 || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    assert(a->imm > 0 && a->imm <= (8 << a->esz));
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_2i(vec_full_reg_offset(s, a->rd),
+                        vec_full_reg_offset(s, a->rn),
+                        vsz, vsz, a->imm, &ops[a->esz]);
+    }
+    return true;
+}
+
+static void gen_shrnb_i64(unsigned vece, TCGv_i64 d, TCGv_i64 n, int shr)
+{
+    int halfbits = 4 << vece;
+    uint64_t mask = dup_const(vece, MAKE_64BIT_MASK(0, halfbits));
+
+    tcg_gen_shri_i64(d, n, shr);
+    tcg_gen_andi_i64(d, d, mask);
+}
+
+static void gen_shrnb16_i64(TCGv_i64 d, TCGv_i64 n, int64_t shr)
+{
+    gen_shrnb_i64(MO_16, d, n, shr);
+}
+
+static void gen_shrnb32_i64(TCGv_i64 d, TCGv_i64 n, int64_t shr)
+{
+    gen_shrnb_i64(MO_32, d, n, shr);
+}
+
+static void gen_shrnb64_i64(TCGv_i64 d, TCGv_i64 n, int64_t shr)
+{
+    gen_shrnb_i64(MO_64, d, n, shr);
+}
+
+static void gen_shrnb_vec(unsigned vece, TCGv_vec d, TCGv_vec n, int64_t shr)
+{
+    TCGv_vec t = tcg_temp_new_vec_matching(d);
+    int halfbits = 4 << vece;
+    uint64_t mask = MAKE_64BIT_MASK(0, halfbits);
+
+    tcg_gen_shri_vec(vece, n, n, shr);
+    tcg_gen_dupi_vec(vece, t, mask);
+    tcg_gen_and_vec(vece, d, n, t);
+    tcg_temp_free_vec(t);
+}
+
+static bool trans_SHRNB(DisasContext *s, arg_rri_esz *a)
+{
+    static const TCGOpcode vec_list[] = { INDEX_op_shri_vec, 0 };
+    static const GVecGen2i ops[3] = {
+        { .fni8 = gen_shrnb16_i64,
+          .fniv = gen_shrnb_vec,
+          .opt_opc = vec_list,
+          .fno = gen_helper_sve2_shrnb_h,
+          .vece = MO_16 },
+        { .fni8 = gen_shrnb32_i64,
+          .fniv = gen_shrnb_vec,
+          .opt_opc = vec_list,
+          .fno = gen_helper_sve2_shrnb_s,
+          .vece = MO_32 },
+        { .fni8 = gen_shrnb64_i64,
+          .fniv = gen_shrnb_vec,
+          .opt_opc = vec_list,
+          .fno = gen_helper_sve2_shrnb_d,
+          .vece = MO_64 },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
+static void gen_shrnt_i64(unsigned vece, TCGv_i64 d, TCGv_i64 n, int shr)
+{
+    int halfbits = 4 << vece;
+    uint64_t mask = dup_const(vece, MAKE_64BIT_MASK(0, halfbits));
+
+    tcg_gen_shli_i64(n, n, halfbits - shr);
+    tcg_gen_andi_i64(n, n, ~mask);
+    tcg_gen_andi_i64(d, d, mask);
+    tcg_gen_or_i64(d, d, n);
+}
+
+static void gen_shrnt16_i64(TCGv_i64 d, TCGv_i64 n, int64_t shr)
+{
+    gen_shrnt_i64(MO_16, d, n, shr);
+}
+
+static void gen_shrnt32_i64(TCGv_i64 d, TCGv_i64 n, int64_t shr)
+{
+    gen_shrnt_i64(MO_32, d, n, shr);
+}
+
+static void gen_shrnt64_i64(TCGv_i64 d, TCGv_i64 n, int64_t shr)
+{
+    tcg_gen_shri_i64(n, n, shr);
+    tcg_gen_deposit_i64(d, d, n, 32, 32);
+}
+
+static void gen_shrnt_vec(unsigned vece, TCGv_vec d, TCGv_vec n, int64_t shr)
+{
+    TCGv_vec t = tcg_temp_new_vec_matching(d);
+    int halfbits = 4 << vece;
+    uint64_t mask = MAKE_64BIT_MASK(0, halfbits);
+
+    tcg_gen_shli_vec(vece, n, n, halfbits - shr);
+    tcg_gen_dupi_vec(vece, t, mask);
+    tcg_gen_bitsel_vec(vece, d, t, d, n);
+    tcg_temp_free_vec(t);
+}
+
+static bool trans_SHRNT(DisasContext *s, arg_rri_esz *a)
+{
+    static const TCGOpcode vec_list[] = { INDEX_op_shli_vec, 0 };
+    static const GVecGen2i ops[3] = {
+        { .fni8 = gen_shrnt16_i64,
+          .fniv = gen_shrnt_vec,
+          .opt_opc = vec_list,
+          .load_dest = true,
+          .fno = gen_helper_sve2_shrnt_h,
+          .vece = MO_16 },
+        { .fni8 = gen_shrnt32_i64,
+          .fniv = gen_shrnt_vec,
+          .opt_opc = vec_list,
+          .load_dest = true,
+          .fno = gen_helper_sve2_shrnt_s,
+          .vece = MO_32 },
+        { .fni8 = gen_shrnt64_i64,
+          .fniv = gen_shrnt_vec,
+          .opt_opc = vec_list,
+          .load_dest = true,
+          .fno = gen_helper_sve2_shrnt_d,
+          .vece = MO_64 },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
+static bool trans_RSHRNB(DisasContext *s, arg_rri_esz *a)
+{
+    static const GVecGen2i ops[3] = {
+        { .fno = gen_helper_sve2_rshrnb_h },
+        { .fno = gen_helper_sve2_rshrnb_s },
+        { .fno = gen_helper_sve2_rshrnb_d },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
+static bool trans_RSHRNT(DisasContext *s, arg_rri_esz *a)
+{
+    static const GVecGen2i ops[3] = {
+        { .fno = gen_helper_sve2_rshrnt_h },
+        { .fno = gen_helper_sve2_rshrnt_s },
+        { .fno = gen_helper_sve2_rshrnt_d },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
 static bool do_sve2_zpzz_fp(DisasContext *s, arg_rprr_esz *a,
                             gen_helper_gvec_4_ptr *fn)
 {
-- 
2.25.1


