Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7549156BD09
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 17:48:59 +0200 (CEST)
Received: from localhost ([::1]:48468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9qDy-0005xz-IQ
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 11:48:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pjM-0004Lz-Mc
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:17:20 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:42957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pjK-0002S4-NX
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:17:20 -0400
Received: by mail-pf1-x42e.google.com with SMTP id d10so9996391pfd.9
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xDxZQB7t7jC7e11iBt04ewldeYznmzQBar7IyZiGr2c=;
 b=CC/uRJhVs/t+i96t2DEXFbjTKMmlUFMgw5Y1LmAMWxratlU/g+3wvUlL+16E1l93/F
 Y2XVriwbMRgMsP8Veo6xuVjSGD0Jv1FQJwSQllR37vINjIYJ3CJkF3jBIfEuViXwAiCm
 zP6/sA72NIFgDNzVV80yFxP1ofPOTMhUcfNTdqP8MAAjG3keaqXTYulmuFCqDKDy5drL
 L12ISOu+VlXmqyjTjar1kKC40plclRv44Fsc2Zi9L/lZr2cVP6a97Sxp2Rv5J0xxHonX
 CUfYW1r2f8HDcTYfymFKzpF9ITSJVd7UdzU4b1lIEpITAv4Z1Qgz23kZg+1/LSx2BW1W
 zWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xDxZQB7t7jC7e11iBt04ewldeYznmzQBar7IyZiGr2c=;
 b=bNvJACTuUKLf7WBWsVeO1nzHnAafKmm/a0FPv1MQjqjjKJmMUejarfj1EsL8MnUoLX
 maQL8Z7H7Wce4rkmzrmFuAAhfkoXDw3hmU1fgT4r/AJ2iUZJlhEw4C73/cA6LsquntUW
 CpeGMsTzkzCHqQQS56zQQw15rOc3kY8x1mXKfEm8zQjvDW/KRVQQx12is+vHwWOV7iIy
 gmC7GmUcZyg1MGzIPvpjtv1wOkLqV1+Dta0tKp18ln7fQ0a5LMSW2Sm6L/alwD2+RaHP
 pTECWfjmA3qu11xhdPFJE6JjhQ8kBIUXMCaGkDKR4mI+WDRAzAgQfX/YRVrjnnAjm0ew
 iQHw==
X-Gm-Message-State: AJIora9zNQhIBPNeYWHuB+v/0buTlfZdAYlq4u45Piixp2X/LjC4rkKp
 c7mwQEL1xvpI3i7sMbkaB1WW2jKQOr4Gq/b0
X-Google-Smtp-Source: AGRyM1vf5CR9al66ZMRezM3TQxdiBcSsfnqfpemDpWLM3+Xrx4fFWC4x3ot0nPMBolEYT1/hL+bHDw==
X-Received: by 2002:a63:e202:0:b0:412:7a7a:53e9 with SMTP id
 q2-20020a63e202000000b004127a7a53e9mr3753129pgh.624.1657293437321; 
 Fri, 08 Jul 2022 08:17:17 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:17:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 30/45] target/arm: Implement SCLAMP, UCLAMP
Date: Fri,  8 Jul 2022 20:45:25 +0530
Message-Id: <20220708151540.18136-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

This is an SVE instruction that operates using the SVE vector
length but that it is present only if SME is implemented.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        |  18 +++++++
 target/arm/sve.decode      |   5 ++
 target/arm/translate-sve.c | 102 +++++++++++++++++++++++++++++++++++++
 target/arm/vec_helper.c    |  24 +++++++++
 4 files changed, 149 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 3a8ce42ab0..92f36d9dbb 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -1019,6 +1019,24 @@ DEF_HELPER_FLAGS_6(gvec_bfmlal, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_6(gvec_bfmlal_idx, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(gvec_sclamp_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_sclamp_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_sclamp_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_sclamp_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(gvec_uclamp_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_uclamp_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_uclamp_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_uclamp_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
 #include "helper-sve.h"
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index a9e48f07b4..14b3a69c36 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1695,3 +1695,8 @@ PSEL            00100101 .. 1 100 .. 01 .... 0 .... 0 ....  \
                 @psel esz=2 imm=%psel_imm_s
 PSEL            00100101 .1 1 000 .. 01 .... 0 .... 0 ....  \
                 @psel esz=3 imm=%psel_imm_d
+
+### SVE clamp
+
+SCLAMP          01000100 .. 0 ..... 110000 ..... .....          @rda_rn_rm
+UCLAMP          01000100 .. 0 ..... 110001 ..... .....          @rda_rn_rm
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 9ed3b267fd..41f8b12259 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7478,3 +7478,105 @@ static bool trans_PSEL(DisasContext *s, arg_psel *a)
     tcg_temp_free_ptr(ptr);
     return true;
 }
+
+static void gen_sclamp_i32(TCGv_i32 d, TCGv_i32 n, TCGv_i32 m, TCGv_i32 a)
+{
+    tcg_gen_smax_i32(d, a, n);
+    tcg_gen_smin_i32(d, d, m);
+}
+
+static void gen_sclamp_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, TCGv_i64 a)
+{
+    tcg_gen_smax_i64(d, a, n);
+    tcg_gen_smin_i64(d, d, m);
+}
+
+static void gen_sclamp_vec(unsigned vece, TCGv_vec d, TCGv_vec n,
+                           TCGv_vec m, TCGv_vec a)
+{
+    tcg_gen_smax_vec(vece, d, a, n);
+    tcg_gen_smin_vec(vece, d, d, m);
+}
+
+static void gen_sclamp(unsigned vece, uint32_t d, uint32_t n, uint32_t m,
+                       uint32_t a, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop[] = {
+        INDEX_op_smin_vec, INDEX_op_smax_vec, 0
+    };
+    static const GVecGen4 ops[4] = {
+        { .fniv = gen_sclamp_vec,
+          .fno  = gen_helper_gvec_sclamp_b,
+          .opt_opc = vecop,
+          .vece = MO_8 },
+        { .fniv = gen_sclamp_vec,
+          .fno  = gen_helper_gvec_sclamp_h,
+          .opt_opc = vecop,
+          .vece = MO_16 },
+        { .fni4 = gen_sclamp_i32,
+          .fniv = gen_sclamp_vec,
+          .fno  = gen_helper_gvec_sclamp_s,
+          .opt_opc = vecop,
+          .vece = MO_32 },
+        { .fni8 = gen_sclamp_i64,
+          .fniv = gen_sclamp_vec,
+          .fno  = gen_helper_gvec_sclamp_d,
+          .opt_opc = vecop,
+          .vece = MO_64,
+          .prefer_i64 = TCG_TARGET_REG_BITS == 64 }
+    };
+    tcg_gen_gvec_4(d, n, m, a, oprsz, maxsz, &ops[vece]);
+}
+
+TRANS_FEAT(SCLAMP, aa64_sme, gen_gvec_fn_arg_zzzz, gen_sclamp, a)
+
+static void gen_uclamp_i32(TCGv_i32 d, TCGv_i32 n, TCGv_i32 m, TCGv_i32 a)
+{
+    tcg_gen_umax_i32(d, a, n);
+    tcg_gen_umin_i32(d, d, m);
+}
+
+static void gen_uclamp_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, TCGv_i64 a)
+{
+    tcg_gen_umax_i64(d, a, n);
+    tcg_gen_umin_i64(d, d, m);
+}
+
+static void gen_uclamp_vec(unsigned vece, TCGv_vec d, TCGv_vec n,
+                           TCGv_vec m, TCGv_vec a)
+{
+    tcg_gen_umax_vec(vece, d, a, n);
+    tcg_gen_umin_vec(vece, d, d, m);
+}
+
+static void gen_uclamp(unsigned vece, uint32_t d, uint32_t n, uint32_t m,
+                       uint32_t a, uint32_t oprsz, uint32_t maxsz)
+{
+    static const TCGOpcode vecop[] = {
+        INDEX_op_umin_vec, INDEX_op_umax_vec, 0
+    };
+    static const GVecGen4 ops[4] = {
+        { .fniv = gen_uclamp_vec,
+          .fno  = gen_helper_gvec_uclamp_b,
+          .opt_opc = vecop,
+          .vece = MO_8 },
+        { .fniv = gen_uclamp_vec,
+          .fno  = gen_helper_gvec_uclamp_h,
+          .opt_opc = vecop,
+          .vece = MO_16 },
+        { .fni4 = gen_uclamp_i32,
+          .fniv = gen_uclamp_vec,
+          .fno  = gen_helper_gvec_uclamp_s,
+          .opt_opc = vecop,
+          .vece = MO_32 },
+        { .fni8 = gen_uclamp_i64,
+          .fniv = gen_uclamp_vec,
+          .fno  = gen_helper_gvec_uclamp_d,
+          .opt_opc = vecop,
+          .vece = MO_64,
+          .prefer_i64 = TCG_TARGET_REG_BITS == 64 }
+    };
+    tcg_gen_gvec_4(d, n, m, a, oprsz, maxsz, &ops[vece]);
+}
+
+TRANS_FEAT(UCLAMP, aa64_sme, gen_gvec_fn_arg_zzzz, gen_uclamp, a)
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 9a9c034e36..f59d3b26ea 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -2690,3 +2690,27 @@ void HELPER(gvec_bfmlal_idx)(void *vd, void *vn, void *vm,
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
+
+#define DO_CLAMP(NAME, TYPE) \
+void HELPER(NAME)(void *d, void *n, void *m, void *a, uint32_t desc)    \
+{                                                                       \
+    intptr_t i, opr_sz = simd_oprsz(desc);                              \
+    for (i = 0; i < opr_sz; i += sizeof(TYPE)) {                        \
+        TYPE aa = *(TYPE *)(a + i);                                     \
+        TYPE nn = *(TYPE *)(n + i);                                     \
+        TYPE mm = *(TYPE *)(m + i);                                     \
+        TYPE dd = MIN(MAX(aa, nn), mm);                                 \
+        *(TYPE *)(d + i) = dd;                                          \
+    }                                                                   \
+    clear_tail(d, opr_sz, simd_maxsz(desc));                            \
+}
+
+DO_CLAMP(gvec_sclamp_b, int8_t)
+DO_CLAMP(gvec_sclamp_h, int16_t)
+DO_CLAMP(gvec_sclamp_s, int32_t)
+DO_CLAMP(gvec_sclamp_d, int64_t)
+
+DO_CLAMP(gvec_uclamp_b, uint8_t)
+DO_CLAMP(gvec_uclamp_h, uint16_t)
+DO_CLAMP(gvec_uclamp_s, uint32_t)
+DO_CLAMP(gvec_uclamp_d, uint64_t)
-- 
2.34.1


