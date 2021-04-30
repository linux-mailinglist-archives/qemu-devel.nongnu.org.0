Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 852E3370265
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 22:49:40 +0200 (CEST)
Received: from localhost ([::1]:59374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lca4x-000157-Ig
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 16:49:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiq-0000RY-RK
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:26:48 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:36521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiX-00068P-SZ
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:26:48 -0400
Received: by mail-pl1-x62e.google.com with SMTP id a11so6346741plh.3
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WwOjRgyqW+QscwVMflkQnp8uVzX1HAgfjZDST1BGuos=;
 b=g/PymC7pwOkW2psfLqHADns983Q2YIOhWWcQpIFJcALV98DDIlapiF7bREjHW+MduZ
 I0zobRubXD0XjjnUZdKvtecnn8Xzgn2Z2C7RN+8UQCh8wnWTF38VtECp7toj4VPSBBgR
 RyUB7xgciFwpk7EM9M2q/wuC5mhOYcSNvhQUUPzaAUCRTxbv1eiu4KWxILL2wi59rMYh
 j4CFhjmsNVuYm/dX5tdHmgdEXKJxY/DcNSMqH87GfK41phKpR9W7ZM2iMv+1t+jyXEtB
 q2Qc1qUUCzPFoj+vU2hEh/9YJF9TFFv8BOOY8W6Cnu9CKtv4Qe4NDekmshJSDDfaSdjb
 dHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WwOjRgyqW+QscwVMflkQnp8uVzX1HAgfjZDST1BGuos=;
 b=uUbvBTOhRIg21lefxi4TRzWDVO+U9EqmEDne6NIyIP+JspH1BFwl3JO3wFJmDRXq11
 yF75fBEF2GQoxwsU13owEQ3C+I+SYOLfBoYaJ4CPJ9wbE4c/QuQhYm8WtZhPe7VQS9Hk
 1q8YL1i9NFgM13IdxiksP6Q9R7RqRmEDU8gHGkblWT0ZYMy5rKX+mSik1HYzxNcA6Txf
 ahysh7hXYRcYU4xtO3QWCehf3FcLgz+BTKA6UyYmfQ8SpP3+4qk4g8XfEeLICOlqK6yj
 Q1cZ6s+fMtzKtwJouQtLvxe4vwQWqXdlu0ZqG7+7J793nPcYVznbbpNUQcp6pFbktsdF
 H8vA==
X-Gm-Message-State: AOAM531hxf2ACbRplUQaCJ2ZUVUZEYrCKSABxTdxhK+5qrEjeIF6zwh+
 WZGoy6CcyMtd5nCXLgTX5kghDcmcIE6AgQ==
X-Google-Smtp-Source: ABdhPJy9FB/OxfeoGkKI/TAQI+eFLbH7/Cz6hqZS9LsUd3+SxLQjOXMZsts5xsWgtgC4wWk7txtAJA==
X-Received: by 2002:a17:903:248e:b029:ec:b399:7d75 with SMTP id
 p14-20020a170903248eb02900ecb3997d75mr7019669plw.35.1619814387184; 
 Fri, 30 Apr 2021 13:26:27 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e6sm2905257pfd.219.2021.04.30.13.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:26:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 26/82] target/arm: Implement SVE2 SHRN, RSHRN
Date: Fri, 30 Apr 2021 13:25:14 -0700
Message-Id: <20210430202610.1136687-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
index 11f228144c..3f864da3ab 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1863,6 +1863,17 @@ void HELPER(NAME)(void *vd, void *vn, void *vg, uint32_t desc)  \
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
@@ -1883,12 +1894,51 @@ DO_ZPZI(sve_asrd_h, int16_t, H1_2, DO_ASRD)
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
index 1670bcadb1..c1a081acaa 100644
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


