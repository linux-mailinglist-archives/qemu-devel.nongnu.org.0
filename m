Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1E5541B43
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 23:44:55 +0200 (CEST)
Received: from localhost ([::1]:49258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyh0Q-0003A5-V7
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 17:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwq-0006zh-7O
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:37:08 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:44603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwk-0008JE-2E
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:37:07 -0400
Received: by mail-pg1-x530.google.com with SMTP id c18so8632489pgh.11
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JZx2jLCXaMYY8zxvQu2ttxRUkOzTdON6+4aZXHuolAI=;
 b=J8EVMInrHWP/PjwyykEIbvxslTez5oNZ88fY4XsAp2yenFUumF0bOUUSAe6Co3lbdv
 Sw9oHWCOreQdzYY5r/IGpTnnFw/AMzR9AWRHkuxhSD433LU5j5z2f8p4gq8eL2vQ4nRO
 AldMQTj1NayyORHxMXPOJ2pltEJFcPODixiFyoeOhUH/VrPAAEgETOFWYooINAgYdfts
 x3DiW7ydoTeyrWljpIblVxyon4Tny8h9AoW7Ua7mHxyq/zWI5GkdB2f9OyURIAicFpLg
 3pWOxjnW6tXTlHh/sbo075kk0O0MbToa+v3d5DH9U0YO6/YGLz32/wsGVraGsiVaosRw
 X15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JZx2jLCXaMYY8zxvQu2ttxRUkOzTdON6+4aZXHuolAI=;
 b=SOPZOLB/io+O8v77opVhBDu3EpZhNKT8Mxibq1mDt6r/vstABj7YGTJ1rSG5AlJDx5
 6U9LtGbvscWgXcuRf7Rh4Esb2q2gyu8LCXx1/+FWZBIPnWZ9ARcGls20gp3U4NiWLbWk
 US5NuKco8shJ5Q7ue9Lpz5U1/wwJb0ugl8dqUPiMzBKHlLVtMNhRK3nYC6aXE7KxJ/lI
 vt8ls3OZ/FIn6sG51LINdWByNwDFIXdjeqS3oKkuatIu9vqM9NVBz0o+G2cmMBcRpoPi
 b2b0KeF7b3h+kvm8iKwCl+wWhReqbGse9kPhrFRi2KasEgS42u9kCjl8mvM5yLrAm4na
 NGJw==
X-Gm-Message-State: AOAM533uuAdQGfw4XR3lwWUJXIKSXHmm5u9bxaVyYlGqpxMmryDrYGGt
 Y3Irop+s8AzjAh+2ytROqj4R/JAifjuo7A==
X-Google-Smtp-Source: ABdhPJxIRy1gtFtQVxgrfLVuZkRI5yqBEMHmjpPJjv0pjOc+hmSIa9r3PfpMeKH6Msuex2XlIRsGpA==
X-Received: by 2002:a05:6a00:8c5:b0:510:6eae:6fa1 with SMTP id
 s5-20020a056a0008c500b005106eae6fa1mr30721022pfu.12.1654634219695; 
 Tue, 07 Jun 2022 13:36:59 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s18-20020aa78d52000000b0050dc76281fdsm13235645pfe.215.2022.06.07.13.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:36:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 56/71] target/arm: Implement SCLAMP, UCLAMP
Date: Tue,  7 Jun 2022 13:32:51 -0700
Message-Id: <20220607203306.657998-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        |  18 +++++++
 target/arm/translate-sve.c | 102 +++++++++++++++++++++++++++++++++++++
 target/arm/vec_helper.c    |  24 +++++++++
 target/arm/sve.decode      |   5 ++
 4 files changed, 149 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 5bca7255f1..f9bc4b29b4 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -1017,6 +1017,24 @@ DEF_HELPER_FLAGS_6(gvec_bfmlal, TCG_CALL_NO_RWG,
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
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 1129f1fc56..40c5bf1a55 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7438,3 +7438,105 @@ static bool trans_PSEL(DisasContext *s, arg_psel *a)
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
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index d1e229fd6e..ad411b5790 100644
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
-- 
2.34.1


