Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8977570609
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 16:44:20 +0200 (CEST)
Received: from localhost ([::1]:37052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAue3-0007AD-Pp
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 10:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvm-0006ic-Da
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:35 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:38728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvd-0002p0-5B
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:34 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 9-20020a1c0209000000b003a2dfdebe47so2267889wmc.3
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 06:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NefM+zE4IIZS4r9ntXfwlEBdnRvPOEaUwHvQJzfMAXc=;
 b=HaTW4r/nTbwmquA7q2IVbCy4iZOCvgEB0rwgvba8hVmaBuUGGC8Efya2z9lFUKTQp4
 2gADb/qCEiUjs9cgvpnZ9tR2g5VsDbCk38E3kHjh5pQJq+Z9YCd6e2Jvj2lWC9glmyOB
 4n5IidXLziQpZb1cGmK9Z1LHq7IA1ZfAqQn/BWsFT2HTP+YwdJ4rF9FibuztqNZ6Sc++
 JdjpfQtYF5vP97j1DqVp8iCm8KzXXdH1mfR+pEg+oNx9ya5Xd1kA5+miVM183cm+g0Xo
 KdLBn5Fq7LGXFIJZloucSTZ8gAfLMRvBsj2mhnPWAZ8yPIOGI6iuCT5RxIdM2dhk9K6F
 L98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NefM+zE4IIZS4r9ntXfwlEBdnRvPOEaUwHvQJzfMAXc=;
 b=blzWN0jJn6188SG18WDYoiPugpQuP9PM+WO1XKnVXGCmwabecPKqU7nJwjhR1LXkoV
 VYLnXRkUS4vIGlC2CpHHQlgpYcyl/TuZnoYu/bfzAiS58lkQqfLmY27LJQbj8VKHgq9p
 Co/IEX9G4x8gv58bQdnoBWnms+rIG0fDLGZh0yov4B2t2TPxyzymzx/TogV539KWg0lI
 LjFpnZxQRg7XfikkHIq2/wXle8XqT3C2dNTxsgOWELYT6/EHxC3bECO2DG58x7osTWF0
 B/tWnr7bs2ABDK1gUJbWVnEpdQgnFZowZlchwlXEksAvnBDSO9T0GB6FJwSy2TN4Z6tZ
 JLpw==
X-Gm-Message-State: AJIora+IuocNEnwH/9E6vlOEqjnIqAMrQ86UWjK7CaslfoJvFYjejPvJ
 TTHvk1DiWP7LkCTZr941eOTeWEwbGgl2Uw==
X-Google-Smtp-Source: AGRyM1synqXwNDxDfBJUqCnY/aXcmYdzNRk9iBiRDobFuSQfxA32GqL1s7SKKAz46m+hRQacN4PrUw==
X-Received: by 2002:a7b:cb8e:0:b0:3a2:da0f:d8ae with SMTP id
 m14-20020a7bcb8e000000b003a2da0fd8aemr15982125wmi.23.1657547897919; 
 Mon, 11 Jul 2022 06:58:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q123-20020a1c4381000000b00397402ae674sm7595596wma.11.2022.07.11.06.58.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 06:58:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/45] target/arm: Implement SCLAMP, UCLAMP
Date: Mon, 11 Jul 2022 14:57:35 +0100
Message-Id: <20220711135750.765803-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711135750.765803-1-peter.maydell@linaro.org>
References: <20220711135750.765803-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

This is an SVE instruction that operates using the SVE vector
length but that it is present only if SME is implemented.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220708151540.18136-31-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h        |  18 +++++++
 target/arm/sve.decode      |   5 ++
 target/arm/translate-sve.c | 102 +++++++++++++++++++++++++++++++++++++
 target/arm/vec_helper.c    |  24 +++++++++
 4 files changed, 149 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 3a8ce42ab01..92f36d9dbb7 100644
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
index a9e48f07b44..14b3a69c364 100644
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
index 9ed3b267fdb..41f8b12259e 100644
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
index 9a9c034e36f..f59d3b26eac 100644
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
2.25.1


