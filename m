Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E6B390594
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:37:06 +0200 (CEST)
Received: from localhost ([::1]:39970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZ7B-0004Dg-F7
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:37:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbT-0003NC-0N
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:19 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:35823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbL-0004QW-AX
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:18 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 z19-20020a7bc7d30000b029017521c1fb75so3674699wmk.0
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0P44NInh8/LEOVZ9jGw+XisGSwf1E2SWY/gVDuR+LKE=;
 b=lYxizweOC5KcIaH4s82afjQwVui0tCTcR+Z/jL1OgE4VT430s1aGjYnkHop5EoR9vB
 zL8/kcG0TZ7LQCpg/FOcYD4uVX6Rc+SY4kpXMQ+SkeS/7bhEFvMyw/0VS9/VrqIkczWQ
 aHyUOua8GEhwKiZXWcVOsZ51hYMivkfMHLuuPwVCkWuO6/W3u6w0hNIwszKA3ad5SrHW
 VdkOCSPyhDLFflTL7I5hmZyGPYGIVfYLX6SJVMThVwieeMG4l7rhSJSJXdVzXYM8yTbR
 44xwxYEU4HX9unmSYo/P8zRB4nJTNV0bff8EkpX4OGMNnqpgiyZAZONeWwvZJfatyDVB
 gIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0P44NInh8/LEOVZ9jGw+XisGSwf1E2SWY/gVDuR+LKE=;
 b=mP8EN4UbbLctWjzln0MhnSHSJm4P2ph4zWeBIqru4dwG/+50WHSL20fOLUBe0H9HEK
 tGYT4LxHEgUGJc4wn808iPPoQv2GI5EYoTIba/K8B2Pv947EMKOlbExzlMYafyKn6Fem
 Qf4LtMC17ekhEtmfb9lL+pj1h6OTNJEjDKcSsC04mC9sVz2jsbRHawYiz8YBEvP2nqFl
 ORcu0YwIpBbCJeXEyNDjy0WY+ZPgvWo4HXZI0MAXd81Etti39Rty7J4GjvYEvGDUzdTV
 jmL/zneOyiVY3+Pa4U0eNfeHHQCHmTd3uLAET5IiJ8YhB1S0cp1ayR7IdYZ8YxlxX4RU
 +aDQ==
X-Gm-Message-State: AOAM532gORx6qcWk+8G94/0A1x17Eupnayj3C5tLH8E3HmccbFm2rRep
 uhFewJXfqkc7Gu/lbwiFxII1sTz8e4Hh1cxQ
X-Google-Smtp-Source: ABdhPJza7qvUQiB8vck6eWrympqYxzy2zcXLBlOcjwVxIBQvIT0DTld9zWUCPwmbwsB0swxMFSZ/9A==
X-Received: by 2002:a1c:a7d8:: with SMTP id q207mr24298824wme.57.1621955049836; 
 Tue, 25 May 2021 08:04:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.04.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:04:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 048/114] target/arm: Implement SVE2 SHRN, RSHRN
Date: Tue, 25 May 2021 16:02:18 +0100
Message-Id: <20210525150324.32370-49-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-27-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-sve.h    |  16 ++++
 target/arm/sve.decode      |   8 ++
 target/arm/sve_helper.c    |  54 ++++++++++++-
 target/arm/translate-sve.c | 160 +++++++++++++++++++++++++++++++++++++
 4 files changed, 236 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index a033b5f6b24..2b2ebea631d 100644
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
index 9c75ac94c03..169486ecb24 100644
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
index 16604a424fd..8fd61e37f94 100644
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
index faf94b304ab..e072f8a2cfc 100644
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
2.20.1


