Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9ECD38F76A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 03:14:29 +0200 (CEST)
Received: from localhost ([::1]:35048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llLeO-0003KY-Ou
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 21:14:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUj-0001ni-OH
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:04:31 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:43825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUQ-0001jg-DG
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:04:28 -0400
Received: by mail-pg1-x535.google.com with SMTP id e22so5659837pgv.10
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y4c9Q1ltTS6oaJqAB0GG5NXaf6ZXrAYDm4l6aGlsq0Y=;
 b=WMhcMGMTR2wlZkUt8N4a2gpULTXInc3yWrIxyZAAWrc5heUYx+1voopJ6VZ1ItMZ3S
 wbSqMYAihqxItzv4pfTkAGz8XyZCHOg0oJJAZcPsbv57rpJCVrMz9cCeV6m3jwHlrnaZ
 b90HcdxVOqlgSMR1TtTIsjRlvTPPS4h2xzIdqFi+MRxxyJAq1gAb/lDN/0PMKPoj3XbL
 y3K2E3eVHCvk084sndIsONCQTQu72170i2JaGaiKCr/Jc8oKZqLQ5asqXemN6Hgnty5T
 nInuSJntUgFO3bModCT9/Ta4zQ5Rh/3fjM1bk8HjwnEIIP6J14spgkyjxnNhSOJQu4cp
 TtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y4c9Q1ltTS6oaJqAB0GG5NXaf6ZXrAYDm4l6aGlsq0Y=;
 b=eVyLU2vp/K9kjG8VZgfFQC2ih+XIEtCX3muGcaIfHYjExbTMny/FU5Ir+RFnTP4qNs
 Rs37ZskLaRHU0BfhJw9DAPb9vD4G/Qe4H968Br0hqiEJ2MIE7fFzPfaIOumeP0gBAT2W
 3D7OKRTur1NX2iMuPnyYKXBiEfLLBWWtQdRUoTuAWSVBxhvU+EtPmT9Rk4TVzENzauRz
 6S1ppCuAtrRr2YGwOffEQ9jcB8pPrMnIjxsNRMkfwMZ63/bhuyna48w6SeByCCxqAV/n
 R/PpcmrGbHq1ZjzmIIPHR32vtcb5JWjjQlexUqd+guPvp4fgB3+f8ojc70h5BuEXa9iT
 Azzg==
X-Gm-Message-State: AOAM533C9jcTPasRl1aLUSf2hu2yYUxsF2S9xsP5mJqTjuCae4lpW8tg
 LOYCptsEYsWLmsD+o75OViG7MVtFIaw3yw==
X-Google-Smtp-Source: ABdhPJzFaJfCzWe9ETY7zdpiPXAKVm46BibQfpIE2N6XIW6K/uZDQg+SvUiekyCMn9aNp0aI96wEhQ==
X-Received: by 2002:a63:9c7:: with SMTP id 190mr16409885pgj.149.1621904648949; 
 Mon, 24 May 2021 18:04:08 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b1sm13742645pgf.84.2021.05.24.18.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:04:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 15/92] target/arm: Implement SVE2 bitwise shift left long
Date: Mon, 24 May 2021 18:02:41 -0700
Message-Id: <20210525010358.152808-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
 target/arm/helper-sve.h    |   8 ++
 target/arm/sve.decode      |   8 ++
 target/arm/sve_helper.c    |  22 +++++
 target/arm/translate-sve.c | 159 +++++++++++++++++++++++++++++++++++++
 4 files changed, 197 insertions(+)

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
index cfd1a7cb49..79b268cbba 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1226,6 +1226,28 @@ DO_ZZZ_WTB(sve2_usubw_d, uint64_t, uint32_t,     , H1_4, DO_SUB)
 
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
index fbdccc1c68..da7308d1af 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6071,3 +6071,162 @@ DO_SVE2_ZZZ_WTB(UADDWB, uaddw, false)
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
+        tcg_gen_shli_i64(d, n, shift);
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


