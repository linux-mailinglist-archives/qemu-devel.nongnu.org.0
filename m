Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1630332DB0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 18:58:56 +0100 (CET)
Received: from localhost ([::1]:54328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJgdD-0003cp-S0
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 12:58:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf75-0007VQ-UR
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:21:41 -0500
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c]:43012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf6c-0002U0-Uv
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:21:39 -0500
Received: by mail-oo1-xc2c.google.com with SMTP id x19so3163800ooj.10
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O3EZKnXFTtqPZ2MBMJ6BzW7ax9HuO5PgBXq+C5BPyHY=;
 b=s9siPygLtngVa8o5WuiyDY5+UCaRpZiiyWbBPk5E8dFZmyBZxbeaSuY9lif7SHmNyX
 /vVxltk0gJZmYu0F9HY2FqoVl0Gqkegn1+yRp3TjFDbtg242hJVzabT2peb8iKk5RcuE
 Xzvu7PnciR/DDGjb1cu6BrtxXqRfK3XfLjrVymZMursrsuDaHQt+2q/7mI7zYd+PNy8X
 yRzLS82G90nUnzLGKNbdVzohD9kgtl3l7/QCt3vZC6E79M8ExndAUebeTbyb4m5U15tG
 s807/CSx4dgx2318W22dU4bInBa9ZlGKEVDAYLSLKsUvpVs3hYcU3VKDmZgUdm3MXz/5
 TYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O3EZKnXFTtqPZ2MBMJ6BzW7ax9HuO5PgBXq+C5BPyHY=;
 b=lZQKpyZvFLVsfhE1TDcFvmdjz0ZHn92il/kE3ElgCUp6Vra4lk8pe7C8Di+VJ42rLU
 21d2DFooFnlfhADDEAN1AozhNazOIFYJP5QGlqJob0u0DUIR27WBy+1rYK9/Ix4ALn/g
 Bezlwro1DQmOXUcXYz2oPBc7gpvXfkvQekkJvaLEn+Ir9EPjhHMG6VTm6cJiGgfzrwn7
 VAcNu9CxECm4LKeZSIMd9BzhI5lAidltk9M4tmn6WNkFB33rd/kTFwy29Z4kcJYGzvpR
 Et01jKo1xSojQ0YJYLrtAXGwPTQ1bVwmcctuH/Ld6qGRAZv0YEvKy8PaB5tAteEkQ5qo
 AOfA==
X-Gm-Message-State: AOAM531jzO5lgerzcWFRZgoMrUIUvAp6OG6VhNN3gowivW3iOCRd1UqV
 Qn2Ney9mqX6JeUfWfN8GK+fi7AeFwhjBW9bx
X-Google-Smtp-Source: ABdhPJwi6GTBEJDF2Gvx1Ay3hFB9MM3GStGPXzwyMC+4URRYRbg8Tt4A0znM1aif7XE3gRtU+ih1JA==
X-Received: by 2002:a4a:6b04:: with SMTP id g4mr6710220ooc.78.1615306869834;
 Tue, 09 Mar 2021 08:21:09 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:21:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 24/78] target/arm: Implement SVE2 saturating extract narrow
Date: Tue,  9 Mar 2021 08:19:47 -0800
Message-Id: <20210309162041.23124-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
index aea04a60fd..115daa50a5 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1264,6 +1264,62 @@ DO_ZZZW_ACC(sve2_uabal_d, uint64_t, uint32_t,     , H1_4, DO_ABD)
 
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
index d27fab2b80..65f1b11848 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6460,3 +6460,241 @@ static bool trans_UABA(DisasContext *s, arg_rrr_esz *a)
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


