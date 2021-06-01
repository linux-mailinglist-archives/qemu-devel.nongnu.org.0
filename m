Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF3E38F782
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 03:26:17 +0200 (CEST)
Received: from localhost ([::1]:37680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llLpo-00081m-KZ
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 21:26:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUy-0001wO-AE
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:04:44 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:54944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUV-0001pO-Rg
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:04:43 -0400
Received: by mail-pj1-x102b.google.com with SMTP id g24so15843417pji.4
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ls/0SSv7EuSBugiK6GJfPb9owUda/xBhvp5T7eNiSFU=;
 b=XylYW7K70osSXGRFJtGOq5Do16pL3kBKJR+NfuaSyTcvE9GHBIPLmsFeIG/CUlL7fI
 a03+Rf4C7Gp6JdpSQhTRf1MN82zmXA1VKRKl5CbduMAmy+yKD+i4Nc2F0HDvjA3Tcqpm
 Xu/QwmxmvitvYRa9WAra3sP7qUdFlqPt1l23jFCG6fUl9ah6Mbyz/kzpsYBK6SD0KN1I
 kls4h6NlMuAZ9pV2tylpEX3kbo+IFuTv3GUY1lSVoqP0N4myMMFmeWLmrHncd1GCM6b5
 pQ6WKRAa31TnGXzh2IZRi5v3pK/wjybTkXXl67MPA1DtfBviorsH86It/rprPHdR87bu
 91yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ls/0SSv7EuSBugiK6GJfPb9owUda/xBhvp5T7eNiSFU=;
 b=ZzHdRKjb56DISZkHLAnc+qg+8yVSNlPR4pYasnKdAVMS1QArFL9m09txb/OlxjBFCN
 4CgpuTr/L6OHW3VWiGf68apOKGn/v10xO0TPbQccpeYbxsFrGgZFxtw/fANNIJXBLhe1
 333p+sPg/QuWTn/wGNQalbmoZWD3KRZWFMd8M7CXyxKXzugNWeSJaAzguLPGv+v69Qwa
 +qEacnwRz9LbOwIxAHi3BtBO3NYYXWf9E7gzTqop4v4bxwJeGOa9rOQhJtBtQD6GMDqh
 jV4wsgQO8hNQ4nU5je9ASZEo0DBvDi5epg1dIImRkeoiCyGPXnMqBXljo8X6jNtlmcwG
 tk0w==
X-Gm-Message-State: AOAM531TQ266vZOFyNnqJQSV04sUX2zj1/cB3VqF8USMPhH+/pf3szIy
 pyozCeOCIxrjC/sIrKBjiA9wSRhU7HXuKg==
X-Google-Smtp-Source: ABdhPJzMNJcNsRna2R0gCBucrRtX5k7ZnQR2KZiyRH793+Bo+B5TnE2N0DJEIhI/w2wUZrwds0mvoQ==
X-Received: by 2002:a17:902:dcce:b029:ef:339:fa6a with SMTP id
 t14-20020a170902dcceb02900ef0339fa6amr28092522pll.24.1621904654471; 
 Mon, 24 May 2021 18:04:14 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b1sm13742645pgf.84.2021.05.24.18.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:04:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 24/92] target/arm: Implement SVE2 saturating extract narrow
Date: Mon, 24 May 2021 18:02:50 -0700
Message-Id: <20210525010358.152808-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
 target/arm/helper-sve.h    |  24 ++++
 target/arm/sve.decode      |  12 ++
 target/arm/sve_helper.c    |  56 +++++++++
 target/arm/translate-sve.c | 238 +++++++++++++++++++++++++++++++++++++
 4 files changed, 330 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 4a62012850..b302203ce8 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2419,3 +2419,27 @@ DEF_HELPER_FLAGS_5(sve2_uabal_d, TCG_CALL_NO_RWG,
 
 DEF_HELPER_FLAGS_5(sve2_adcl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_adcl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_sqxtnb_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqxtnb_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqxtnb_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_uqxtnb_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_uqxtnb_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_uqxtnb_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_sqxtunb_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqxtunb_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqxtunb_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_sqxtnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqxtnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqxtnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_uqxtnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_uqxtnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_uqxtnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_sqxtunt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqxtunt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqxtunt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 32b15e4192..19866ec4c6 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1272,3 +1272,15 @@ SLI             01000101 .. 0 ..... 11110 1 ..... .....  @rd_rn_tszimm_shl
 # TODO: Use @rda and %reg_movprfx here.
 SABA            01000101 .. 0 ..... 11111 0 ..... .....  @rd_rn_rm
 UABA            01000101 .. 0 ..... 11111 1 ..... .....  @rd_rn_rm
+
+#### SVE2 Narrowing
+
+## SVE2 saturating extract narrow
+
+# Bits 23, 18-16 are zero, limited in the translator via esz < 3 & imm == 0.
+SQXTNB          01000101 .. 1 ..... 010 000 ..... .....  @rd_rn_tszimm_shl
+SQXTNT          01000101 .. 1 ..... 010 001 ..... .....  @rd_rn_tszimm_shl
+UQXTNB          01000101 .. 1 ..... 010 010 ..... .....  @rd_rn_tszimm_shl
+UQXTNT          01000101 .. 1 ..... 010 011 ..... .....  @rd_rn_tszimm_shl
+SQXTUNB         01000101 .. 1 ..... 010 100 ..... .....  @rd_rn_tszimm_shl
+SQXTUNT         01000101 .. 1 ..... 010 101 ..... .....  @rd_rn_tszimm_shl
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index b63d84eef4..1ca71e367d 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1269,6 +1269,62 @@ DO_ZZZW_ACC(sve2_uabal_d, uint64_t, uint32_t,     , H1_4, DO_ABD)
 
 #undef DO_ZZZW_ACC
 
+#define DO_XTNB(NAME, TYPE, OP) \
+void HELPER(NAME)(void *vd, void *vn, uint32_t desc)         \
+{                                                            \
+    intptr_t i, opr_sz = simd_oprsz(desc);                   \
+    for (i = 0; i < opr_sz; i += sizeof(TYPE)) {             \
+        TYPE nn = *(TYPE *)(vn + i);                         \
+        nn = OP(nn) & MAKE_64BIT_MASK(0, sizeof(TYPE) * 4);  \
+        *(TYPE *)(vd + i) = nn;                              \
+    }                                                        \
+}
+
+#define DO_XTNT(NAME, TYPE, TYPEN, H, OP)                               \
+void HELPER(NAME)(void *vd, void *vn, uint32_t desc)                    \
+{                                                                       \
+    intptr_t i, opr_sz = simd_oprsz(desc), odd = H(sizeof(TYPEN));      \
+    for (i = 0; i < opr_sz; i += sizeof(TYPE)) {                        \
+        TYPE nn = *(TYPE *)(vn + i);                                    \
+        *(TYPEN *)(vd + i + odd) = OP(nn);                              \
+    }                                                                   \
+}
+
+#define DO_SQXTN_H(n)  do_sat_bhs(n, INT8_MIN, INT8_MAX)
+#define DO_SQXTN_S(n)  do_sat_bhs(n, INT16_MIN, INT16_MAX)
+#define DO_SQXTN_D(n)  do_sat_bhs(n, INT32_MIN, INT32_MAX)
+
+DO_XTNB(sve2_sqxtnb_h, int16_t, DO_SQXTN_H)
+DO_XTNB(sve2_sqxtnb_s, int32_t, DO_SQXTN_S)
+DO_XTNB(sve2_sqxtnb_d, int64_t, DO_SQXTN_D)
+
+DO_XTNT(sve2_sqxtnt_h, int16_t, int8_t, H1, DO_SQXTN_H)
+DO_XTNT(sve2_sqxtnt_s, int32_t, int16_t, H1_2, DO_SQXTN_S)
+DO_XTNT(sve2_sqxtnt_d, int64_t, int32_t, H1_4, DO_SQXTN_D)
+
+#define DO_UQXTN_H(n)  do_sat_bhs(n, 0, UINT8_MAX)
+#define DO_UQXTN_S(n)  do_sat_bhs(n, 0, UINT16_MAX)
+#define DO_UQXTN_D(n)  do_sat_bhs(n, 0, UINT32_MAX)
+
+DO_XTNB(sve2_uqxtnb_h, uint16_t, DO_UQXTN_H)
+DO_XTNB(sve2_uqxtnb_s, uint32_t, DO_UQXTN_S)
+DO_XTNB(sve2_uqxtnb_d, uint64_t, DO_UQXTN_D)
+
+DO_XTNT(sve2_uqxtnt_h, uint16_t, uint8_t, H1, DO_UQXTN_H)
+DO_XTNT(sve2_uqxtnt_s, uint32_t, uint16_t, H1_2, DO_UQXTN_S)
+DO_XTNT(sve2_uqxtnt_d, uint64_t, uint32_t, H1_4, DO_UQXTN_D)
+
+DO_XTNB(sve2_sqxtunb_h, int16_t, DO_UQXTN_H)
+DO_XTNB(sve2_sqxtunb_s, int32_t, DO_UQXTN_S)
+DO_XTNB(sve2_sqxtunb_d, int64_t, DO_UQXTN_D)
+
+DO_XTNT(sve2_sqxtunt_h, int16_t, int8_t, H1, DO_UQXTN_H)
+DO_XTNT(sve2_sqxtunt_s, int32_t, int16_t, H1_2, DO_UQXTN_S)
+DO_XTNT(sve2_sqxtunt_d, int64_t, int32_t, H1_4, DO_UQXTN_D)
+
+#undef DO_XTNB
+#undef DO_XTNT
+
 void HELPER(sve2_adcl_s)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc);
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 202107de98..c77df3dbeb 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6459,3 +6459,241 @@ static bool trans_UABA(DisasContext *s, arg_rrr_esz *a)
 {
     return do_sve2_fn_zzz(s, a, gen_gvec_uaba);
 }
+
+static bool do_sve2_narrow_extract(DisasContext *s, arg_rri_esz *a,
+                                   const GVecGen2 ops[3])
+{
+    if (a->esz < 0 || a->esz > MO_32 || a->imm != 0 ||
+        !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_2(vec_full_reg_offset(s, a->rd),
+                        vec_full_reg_offset(s, a->rn),
+                        vsz, vsz, &ops[a->esz]);
+    }
+    return true;
+}
+
+static const TCGOpcode sqxtn_list[] = {
+    INDEX_op_shli_vec, INDEX_op_smin_vec, INDEX_op_smax_vec, 0
+};
+
+static void gen_sqxtnb_vec(unsigned vece, TCGv_vec d, TCGv_vec n)
+{
+    TCGv_vec t = tcg_temp_new_vec_matching(d);
+    int halfbits = 4 << vece;
+    int64_t mask = (1ull << halfbits) - 1;
+    int64_t min = -1ull << (halfbits - 1);
+    int64_t max = -min - 1;
+
+    tcg_gen_dupi_vec(vece, t, min);
+    tcg_gen_smax_vec(vece, d, n, t);
+    tcg_gen_dupi_vec(vece, t, max);
+    tcg_gen_smin_vec(vece, d, d, t);
+    tcg_gen_dupi_vec(vece, t, mask);
+    tcg_gen_and_vec(vece, d, d, t);
+    tcg_temp_free_vec(t);
+}
+
+static bool trans_SQXTNB(DisasContext *s, arg_rri_esz *a)
+{
+    static const GVecGen2 ops[3] = {
+        { .fniv = gen_sqxtnb_vec,
+          .opt_opc = sqxtn_list,
+          .fno = gen_helper_sve2_sqxtnb_h,
+          .vece = MO_16 },
+        { .fniv = gen_sqxtnb_vec,
+          .opt_opc = sqxtn_list,
+          .fno = gen_helper_sve2_sqxtnb_s,
+          .vece = MO_32 },
+        { .fniv = gen_sqxtnb_vec,
+          .opt_opc = sqxtn_list,
+          .fno = gen_helper_sve2_sqxtnb_d,
+          .vece = MO_64 },
+    };
+    return do_sve2_narrow_extract(s, a, ops);
+}
+
+static void gen_sqxtnt_vec(unsigned vece, TCGv_vec d, TCGv_vec n)
+{
+    TCGv_vec t = tcg_temp_new_vec_matching(d);
+    int halfbits = 4 << vece;
+    int64_t mask = (1ull << halfbits) - 1;
+    int64_t min = -1ull << (halfbits - 1);
+    int64_t max = -min - 1;
+
+    tcg_gen_dupi_vec(vece, t, min);
+    tcg_gen_smax_vec(vece, n, n, t);
+    tcg_gen_dupi_vec(vece, t, max);
+    tcg_gen_smin_vec(vece, n, n, t);
+    tcg_gen_shli_vec(vece, n, n, halfbits);
+    tcg_gen_dupi_vec(vece, t, mask);
+    tcg_gen_bitsel_vec(vece, d, t, d, n);
+    tcg_temp_free_vec(t);
+}
+
+static bool trans_SQXTNT(DisasContext *s, arg_rri_esz *a)
+{
+    static const GVecGen2 ops[3] = {
+        { .fniv = gen_sqxtnt_vec,
+          .opt_opc = sqxtn_list,
+          .load_dest = true,
+          .fno = gen_helper_sve2_sqxtnt_h,
+          .vece = MO_16 },
+        { .fniv = gen_sqxtnt_vec,
+          .opt_opc = sqxtn_list,
+          .load_dest = true,
+          .fno = gen_helper_sve2_sqxtnt_s,
+          .vece = MO_32 },
+        { .fniv = gen_sqxtnt_vec,
+          .opt_opc = sqxtn_list,
+          .load_dest = true,
+          .fno = gen_helper_sve2_sqxtnt_d,
+          .vece = MO_64 },
+    };
+    return do_sve2_narrow_extract(s, a, ops);
+}
+
+static const TCGOpcode uqxtn_list[] = {
+    INDEX_op_shli_vec, INDEX_op_umin_vec, 0
+};
+
+static void gen_uqxtnb_vec(unsigned vece, TCGv_vec d, TCGv_vec n)
+{
+    TCGv_vec t = tcg_temp_new_vec_matching(d);
+    int halfbits = 4 << vece;
+    int64_t max = (1ull << halfbits) - 1;
+
+    tcg_gen_dupi_vec(vece, t, max);
+    tcg_gen_umin_vec(vece, d, n, t);
+    tcg_temp_free_vec(t);
+}
+
+static bool trans_UQXTNB(DisasContext *s, arg_rri_esz *a)
+{
+    static const GVecGen2 ops[3] = {
+        { .fniv = gen_uqxtnb_vec,
+          .opt_opc = uqxtn_list,
+          .fno = gen_helper_sve2_uqxtnb_h,
+          .vece = MO_16 },
+        { .fniv = gen_uqxtnb_vec,
+          .opt_opc = uqxtn_list,
+          .fno = gen_helper_sve2_uqxtnb_s,
+          .vece = MO_32 },
+        { .fniv = gen_uqxtnb_vec,
+          .opt_opc = uqxtn_list,
+          .fno = gen_helper_sve2_uqxtnb_d,
+          .vece = MO_64 },
+    };
+    return do_sve2_narrow_extract(s, a, ops);
+}
+
+static void gen_uqxtnt_vec(unsigned vece, TCGv_vec d, TCGv_vec n)
+{
+    TCGv_vec t = tcg_temp_new_vec_matching(d);
+    int halfbits = 4 << vece;
+    int64_t max = (1ull << halfbits) - 1;
+
+    tcg_gen_dupi_vec(vece, t, max);
+    tcg_gen_umin_vec(vece, n, n, t);
+    tcg_gen_shli_vec(vece, n, n, halfbits);
+    tcg_gen_bitsel_vec(vece, d, t, d, n);
+    tcg_temp_free_vec(t);
+}
+
+static bool trans_UQXTNT(DisasContext *s, arg_rri_esz *a)
+{
+    static const GVecGen2 ops[3] = {
+        { .fniv = gen_uqxtnt_vec,
+          .opt_opc = uqxtn_list,
+          .load_dest = true,
+          .fno = gen_helper_sve2_uqxtnt_h,
+          .vece = MO_16 },
+        { .fniv = gen_uqxtnt_vec,
+          .opt_opc = uqxtn_list,
+          .load_dest = true,
+          .fno = gen_helper_sve2_uqxtnt_s,
+          .vece = MO_32 },
+        { .fniv = gen_uqxtnt_vec,
+          .opt_opc = uqxtn_list,
+          .load_dest = true,
+          .fno = gen_helper_sve2_uqxtnt_d,
+          .vece = MO_64 },
+    };
+    return do_sve2_narrow_extract(s, a, ops);
+}
+
+static const TCGOpcode sqxtun_list[] = {
+    INDEX_op_shli_vec, INDEX_op_umin_vec, INDEX_op_smax_vec, 0
+};
+
+static void gen_sqxtunb_vec(unsigned vece, TCGv_vec d, TCGv_vec n)
+{
+    TCGv_vec t = tcg_temp_new_vec_matching(d);
+    int halfbits = 4 << vece;
+    int64_t max = (1ull << halfbits) - 1;
+
+    tcg_gen_dupi_vec(vece, t, 0);
+    tcg_gen_smax_vec(vece, d, n, t);
+    tcg_gen_dupi_vec(vece, t, max);
+    tcg_gen_umin_vec(vece, d, d, t);
+    tcg_temp_free_vec(t);
+}
+
+static bool trans_SQXTUNB(DisasContext *s, arg_rri_esz *a)
+{
+    static const GVecGen2 ops[3] = {
+        { .fniv = gen_sqxtunb_vec,
+          .opt_opc = sqxtun_list,
+          .fno = gen_helper_sve2_sqxtunb_h,
+          .vece = MO_16 },
+        { .fniv = gen_sqxtunb_vec,
+          .opt_opc = sqxtun_list,
+          .fno = gen_helper_sve2_sqxtunb_s,
+          .vece = MO_32 },
+        { .fniv = gen_sqxtunb_vec,
+          .opt_opc = sqxtun_list,
+          .fno = gen_helper_sve2_sqxtunb_d,
+          .vece = MO_64 },
+    };
+    return do_sve2_narrow_extract(s, a, ops);
+}
+
+static void gen_sqxtunt_vec(unsigned vece, TCGv_vec d, TCGv_vec n)
+{
+    TCGv_vec t = tcg_temp_new_vec_matching(d);
+    int halfbits = 4 << vece;
+    int64_t max = (1ull << halfbits) - 1;
+
+    tcg_gen_dupi_vec(vece, t, 0);
+    tcg_gen_smax_vec(vece, n, n, t);
+    tcg_gen_dupi_vec(vece, t, max);
+    tcg_gen_umin_vec(vece, n, n, t);
+    tcg_gen_shli_vec(vece, n, n, halfbits);
+    tcg_gen_bitsel_vec(vece, d, t, d, n);
+    tcg_temp_free_vec(t);
+}
+
+static bool trans_SQXTUNT(DisasContext *s, arg_rri_esz *a)
+{
+    static const GVecGen2 ops[3] = {
+        { .fniv = gen_sqxtunt_vec,
+          .opt_opc = sqxtun_list,
+          .load_dest = true,
+          .fno = gen_helper_sve2_sqxtunt_h,
+          .vece = MO_16 },
+        { .fniv = gen_sqxtunt_vec,
+          .opt_opc = sqxtun_list,
+          .load_dest = true,
+          .fno = gen_helper_sve2_sqxtunt_s,
+          .vece = MO_32 },
+        { .fniv = gen_sqxtunt_vec,
+          .opt_opc = sqxtun_list,
+          .load_dest = true,
+          .fno = gen_helper_sve2_sqxtunt_d,
+          .vece = MO_64 },
+    };
+    return do_sve2_narrow_extract(s, a, ops);
+}
-- 
2.25.1


