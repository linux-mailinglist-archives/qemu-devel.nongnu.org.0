Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2C95048DB
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:20:59 +0200 (CEST)
Received: from localhost ([::1]:55196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng9W6-0007ZO-9x
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:20:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xC-0000vQ-Gg
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:54 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:43924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8x7-0003LK-Vo
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:53 -0400
Received: by mail-pg1-x535.google.com with SMTP id u2so14950603pgq.10
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dv6HLxT9VFR7Qb8w8wRvblozKpmuKMNmz+opU05p1gI=;
 b=Kq+7vAAZ63i776g4UPxOicCFbMUY+h8h0SEY4QK26+Jh1l4fxASPV9ypVzdhbU/HC7
 mt45O+nk6zmIxC3Eu6viECfDHktq+hZE+Sj5nRwGmLvGkztDF9LKIQB7Ln0L0BA4zq8U
 OcQft1dUVn3yab+S61Nsk3L79Z/LIXPBSGGFdd9XvlZ0jvlF3ooVTIXofTVMiLKCXurT
 xPQ8NV1AEFfPpP3nBOgtA/0rGwslE7VqfLvHw5q6zdUa2JotT3PG3Z6REZvGukWK0WF9
 nv8FVm6yn6fm/fUfH01usO3Zf57/F4/mWo74ABJ8QDxqhhWtVNNupQXfWxTq4/zdsRkS
 nP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dv6HLxT9VFR7Qb8w8wRvblozKpmuKMNmz+opU05p1gI=;
 b=IAB7/yHrSAwJ73VyR51/iFUVaPk2fFx7o5ghVAALWT1GmKG9/iY9++AnpJNBrVnhV+
 y8ZG0OA+QlyD0yQX0UD+ZyOGQZMlQLKgiH1hv1EFwVTOTTdXagLeqi8OHIZlnMzG7OPy
 Dg/hocgQeDMJlzLOU5vr1VFpSWppL1+ZT/9xKOwl1jll6nZ2vlgZe9DDekCklMb/8RiM
 8OYnrNSpM4O+GYBMHGULgBSOys+GhJNt9HnPkvGAqoq+D/OfFGrTLL3CYwr5HvBGpRGJ
 JtF7fr8I24h4XOyLhHOFitaPHDleRomftZ90TSnnp8MqgSksm4L3jlCGafdIp0na3RaB
 a8fg==
X-Gm-Message-State: AOAM5311f0nnxak+mLDFXKEj+COlgLV4S2fhFZDaBGWI4oya7pHyMOtt
 6SrTrG8CKPYzUt8DbDfHFKkw4XFTCxrCTw==
X-Google-Smtp-Source: ABdhPJyHppv/zK4E9hOQsjQmQVNhnob1BEWKrYF0d8g7ndM7ObU9r9U/AXrOBWajW5z+prMhJD5xxA==
X-Received: by 2002:a05:6a00:a8b:b0:4cd:6030:4df3 with SMTP id
 b11-20020a056a000a8b00b004cd60304df3mr8413946pfl.40.1650217488035; 
 Sun, 17 Apr 2022 10:44:48 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 21/60] target/arm: Use tcg_constant in translate-sve.c
Date: Sun, 17 Apr 2022 10:43:47 -0700
Message-Id: <20220417174426.711829-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use tcg_constant_{i32,i64} as appropriate throughout.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 198 +++++++++++++------------------------
 1 file changed, 68 insertions(+), 130 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ddc3a8060b..5b3478a43a 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -282,13 +282,12 @@ static void do_predtest(DisasContext *s, int dofs, int gofs, int words)
 {
     TCGv_ptr dptr = tcg_temp_new_ptr();
     TCGv_ptr gptr = tcg_temp_new_ptr();
-    TCGv_i32 t;
+    TCGv_i32 t = tcg_temp_new_i32();
 
     tcg_gen_addi_ptr(dptr, cpu_env, dofs);
     tcg_gen_addi_ptr(gptr, cpu_env, gofs);
-    t = tcg_const_i32(words);
 
-    gen_helper_sve_predtest(t, dptr, gptr, t);
+    gen_helper_sve_predtest(t, dptr, gptr, tcg_constant_i32(words));
     tcg_temp_free_ptr(dptr);
     tcg_temp_free_ptr(gptr);
 
@@ -889,7 +888,7 @@ static bool do_vpz_ool(DisasContext *s, arg_rpr_esz *a,
         return true;
     }
 
-    desc = tcg_const_i32(simd_desc(vsz, vsz, 0));
+    desc = tcg_constant_i32(simd_desc(vsz, vsz, 0));
     temp = tcg_temp_new_i64();
     t_zn = tcg_temp_new_ptr();
     t_pg = tcg_temp_new_ptr();
@@ -899,7 +898,6 @@ static bool do_vpz_ool(DisasContext *s, arg_rpr_esz *a,
     fn(temp, t_zn, t_pg, desc);
     tcg_temp_free_ptr(t_zn);
     tcg_temp_free_ptr(t_pg);
-    tcg_temp_free_i32(desc);
 
     write_fp_dreg(s, a->rd, temp);
     tcg_temp_free_i64(temp);
@@ -1236,7 +1234,7 @@ static void do_index(DisasContext *s, int esz, int rd,
                      TCGv_i64 start, TCGv_i64 incr)
 {
     unsigned vsz = vec_full_reg_size(s);
-    TCGv_i32 desc = tcg_const_i32(simd_desc(vsz, vsz, 0));
+    TCGv_i32 desc = tcg_constant_i32(simd_desc(vsz, vsz, 0));
     TCGv_ptr t_zd = tcg_temp_new_ptr();
 
     tcg_gen_addi_ptr(t_zd, cpu_env, vec_full_reg_offset(s, rd));
@@ -1260,17 +1258,14 @@ static void do_index(DisasContext *s, int esz, int rd,
         tcg_temp_free_i32(i32);
     }
     tcg_temp_free_ptr(t_zd);
-    tcg_temp_free_i32(desc);
 }
 
 static bool trans_INDEX_ii(DisasContext *s, arg_INDEX_ii *a)
 {
     if (sve_access_check(s)) {
-        TCGv_i64 start = tcg_const_i64(a->imm1);
-        TCGv_i64 incr = tcg_const_i64(a->imm2);
+        TCGv_i64 start = tcg_constant_i64(a->imm1);
+        TCGv_i64 incr = tcg_constant_i64(a->imm2);
         do_index(s, a->esz, a->rd, start, incr);
-        tcg_temp_free_i64(start);
-        tcg_temp_free_i64(incr);
     }
     return true;
 }
@@ -1278,10 +1273,9 @@ static bool trans_INDEX_ii(DisasContext *s, arg_INDEX_ii *a)
 static bool trans_INDEX_ir(DisasContext *s, arg_INDEX_ir *a)
 {
     if (sve_access_check(s)) {
-        TCGv_i64 start = tcg_const_i64(a->imm);
+        TCGv_i64 start = tcg_constant_i64(a->imm);
         TCGv_i64 incr = cpu_reg(s, a->rm);
         do_index(s, a->esz, a->rd, start, incr);
-        tcg_temp_free_i64(start);
     }
     return true;
 }
@@ -1290,9 +1284,8 @@ static bool trans_INDEX_ri(DisasContext *s, arg_INDEX_ri *a)
 {
     if (sve_access_check(s)) {
         TCGv_i64 start = cpu_reg(s, a->rn);
-        TCGv_i64 incr = tcg_const_i64(a->imm);
+        TCGv_i64 incr = tcg_constant_i64(a->imm);
         do_index(s, a->esz, a->rd, start, incr);
-        tcg_temp_free_i64(incr);
     }
     return true;
 }
@@ -1884,9 +1877,9 @@ static bool do_pfirst_pnext(DisasContext *s, arg_rr_esz *a,
 
     tcg_gen_addi_ptr(t_pd, cpu_env, pred_full_reg_offset(s, a->rd));
     tcg_gen_addi_ptr(t_pg, cpu_env, pred_full_reg_offset(s, a->rn));
-    t = tcg_const_i32(desc);
+    t = tcg_temp_new_i32();
 
-    gen_fn(t, t_pd, t_pg, t);
+    gen_fn(t, t_pd, t_pg, tcg_constant_i32(desc));
     tcg_temp_free_ptr(t_pd);
     tcg_temp_free_ptr(t_pg);
 
@@ -1993,7 +1986,7 @@ static void do_sat_addsub_vec(DisasContext *s, int esz, int rd, int rn,
     nptr = tcg_temp_new_ptr();
     tcg_gen_addi_ptr(dptr, cpu_env, vec_full_reg_offset(s, rd));
     tcg_gen_addi_ptr(nptr, cpu_env, vec_full_reg_offset(s, rn));
-    desc = tcg_const_i32(simd_desc(vsz, vsz, 0));
+    desc = tcg_constant_i32(simd_desc(vsz, vsz, 0));
 
     switch (esz) {
     case MO_8:
@@ -2062,7 +2055,6 @@ static void do_sat_addsub_vec(DisasContext *s, int esz, int rd, int rn,
 
     tcg_temp_free_ptr(dptr);
     tcg_temp_free_ptr(nptr);
-    tcg_temp_free_i32(desc);
 }
 
 static bool trans_CNT_r(DisasContext *s, arg_CNT_r *a)
@@ -2107,9 +2099,7 @@ static bool trans_SINCDEC_r_32(DisasContext *s, arg_incdec_cnt *a)
             tcg_gen_ext32s_i64(reg, reg);
         }
     } else {
-        TCGv_i64 t = tcg_const_i64(inc);
-        do_sat_addsub_32(reg, t, a->u, a->d);
-        tcg_temp_free_i64(t);
+        do_sat_addsub_32(reg, tcg_constant_i64(inc), a->u, a->d);
     }
     return true;
 }
@@ -2126,9 +2116,7 @@ static bool trans_SINCDEC_r_64(DisasContext *s, arg_incdec_cnt *a)
     TCGv_i64 reg = cpu_reg(s, a->rd);
 
     if (inc != 0) {
-        TCGv_i64 t = tcg_const_i64(inc);
-        do_sat_addsub_64(reg, t, a->u, a->d);
-        tcg_temp_free_i64(t);
+        do_sat_addsub_64(reg, tcg_constant_i64(inc), a->u, a->d);
     }
     return true;
 }
@@ -2145,11 +2133,10 @@ static bool trans_INCDEC_v(DisasContext *s, arg_incdec2_cnt *a)
 
     if (inc != 0) {
         if (sve_access_check(s)) {
-            TCGv_i64 t = tcg_const_i64(a->d ? -inc : inc);
             tcg_gen_gvec_adds(a->esz, vec_full_reg_offset(s, a->rd),
                               vec_full_reg_offset(s, a->rn),
-                              t, fullsz, fullsz);
-            tcg_temp_free_i64(t);
+                              tcg_constant_i64(a->d ? -inc : inc),
+                              fullsz, fullsz);
         }
     } else {
         do_mov_z(s, a->rd, a->rn);
@@ -2169,9 +2156,8 @@ static bool trans_SINCDEC_v(DisasContext *s, arg_incdec2_cnt *a)
 
     if (inc != 0) {
         if (sve_access_check(s)) {
-            TCGv_i64 t = tcg_const_i64(inc);
-            do_sat_addsub_vec(s, a->esz, a->rd, a->rn, t, a->u, a->d);
-            tcg_temp_free_i64(t);
+            do_sat_addsub_vec(s, a->esz, a->rd, a->rn,
+                              tcg_constant_i64(inc), a->u, a->d);
         }
     } else {
         do_mov_z(s, a->rd, a->rn);
@@ -2244,7 +2230,7 @@ static void do_cpy_m(DisasContext *s, int esz, int rd, int rn, int pg,
         gen_helper_sve_cpy_m_s, gen_helper_sve_cpy_m_d,
     };
     unsigned vsz = vec_full_reg_size(s);
-    TCGv_i32 desc = tcg_const_i32(simd_desc(vsz, vsz, 0));
+    TCGv_i32 desc = tcg_constant_i32(simd_desc(vsz, vsz, 0));
     TCGv_ptr t_zd = tcg_temp_new_ptr();
     TCGv_ptr t_zn = tcg_temp_new_ptr();
     TCGv_ptr t_pg = tcg_temp_new_ptr();
@@ -2258,7 +2244,6 @@ static void do_cpy_m(DisasContext *s, int esz, int rd, int rn, int pg,
     tcg_temp_free_ptr(t_zd);
     tcg_temp_free_ptr(t_zn);
     tcg_temp_free_ptr(t_pg);
-    tcg_temp_free_i32(desc);
 }
 
 static bool trans_FCPY(DisasContext *s, arg_FCPY *a)
@@ -2269,9 +2254,7 @@ static bool trans_FCPY(DisasContext *s, arg_FCPY *a)
     if (sve_access_check(s)) {
         /* Decode the VFP immediate.  */
         uint64_t imm = vfp_expand_imm(a->esz, a->imm);
-        TCGv_i64 t_imm = tcg_const_i64(imm);
-        do_cpy_m(s, a->esz, a->rd, a->rn, a->pg, t_imm);
-        tcg_temp_free_i64(t_imm);
+        do_cpy_m(s, a->esz, a->rd, a->rn, a->pg, tcg_constant_i64(imm));
     }
     return true;
 }
@@ -2282,9 +2265,7 @@ static bool trans_CPY_m_i(DisasContext *s, arg_rpri_esz *a)
         return false;
     }
     if (sve_access_check(s)) {
-        TCGv_i64 t_imm = tcg_const_i64(a->imm);
-        do_cpy_m(s, a->esz, a->rd, a->rn, a->pg, t_imm);
-        tcg_temp_free_i64(t_imm);
+        do_cpy_m(s, a->esz, a->rd, a->rn, a->pg, tcg_constant_i64(a->imm));
     }
     return true;
 }
@@ -2301,11 +2282,10 @@ static bool trans_CPY_z_i(DisasContext *s, arg_CPY_z_i *a)
     }
     if (sve_access_check(s)) {
         unsigned vsz = vec_full_reg_size(s);
-        TCGv_i64 t_imm = tcg_const_i64(a->imm);
         tcg_gen_gvec_2i_ool(vec_full_reg_offset(s, a->rd),
                             pred_full_reg_offset(s, a->pg),
-                            t_imm, vsz, vsz, 0, fns[a->esz]);
-        tcg_temp_free_i64(t_imm);
+                            tcg_constant_i64(a->imm),
+                            vsz, vsz, 0, fns[a->esz]);
     }
     return true;
 }
@@ -2406,7 +2386,7 @@ static void do_insr_i64(DisasContext *s, arg_rrr_esz *a, TCGv_i64 val)
         gen_helper_sve_insr_s, gen_helper_sve_insr_d,
     };
     unsigned vsz = vec_full_reg_size(s);
-    TCGv_i32 desc = tcg_const_i32(simd_desc(vsz, vsz, 0));
+    TCGv_i32 desc = tcg_constant_i32(simd_desc(vsz, vsz, 0));
     TCGv_ptr t_zd = tcg_temp_new_ptr();
     TCGv_ptr t_zn = tcg_temp_new_ptr();
 
@@ -2417,7 +2397,6 @@ static void do_insr_i64(DisasContext *s, arg_rrr_esz *a, TCGv_i64 val)
 
     tcg_temp_free_ptr(t_zd);
     tcg_temp_free_ptr(t_zn);
-    tcg_temp_free_i32(desc);
 }
 
 static bool trans_INSR_f(DisasContext *s, arg_rrr_esz *a)
@@ -2536,7 +2515,6 @@ static bool do_perm_pred3(DisasContext *s, arg_rrr_esz *a, bool high_odd,
     TCGv_ptr t_d = tcg_temp_new_ptr();
     TCGv_ptr t_n = tcg_temp_new_ptr();
     TCGv_ptr t_m = tcg_temp_new_ptr();
-    TCGv_i32 t_desc;
     uint32_t desc = 0;
 
     desc = FIELD_DP32(desc, PREDDESC, OPRSZ, vsz);
@@ -2546,14 +2524,12 @@ static bool do_perm_pred3(DisasContext *s, arg_rrr_esz *a, bool high_odd,
     tcg_gen_addi_ptr(t_d, cpu_env, pred_full_reg_offset(s, a->rd));
     tcg_gen_addi_ptr(t_n, cpu_env, pred_full_reg_offset(s, a->rn));
     tcg_gen_addi_ptr(t_m, cpu_env, pred_full_reg_offset(s, a->rm));
-    t_desc = tcg_const_i32(desc);
 
-    fn(t_d, t_n, t_m, t_desc);
+    fn(t_d, t_n, t_m, tcg_constant_i32(desc));
 
     tcg_temp_free_ptr(t_d);
     tcg_temp_free_ptr(t_n);
     tcg_temp_free_ptr(t_m);
-    tcg_temp_free_i32(t_desc);
     return true;
 }
 
@@ -2567,7 +2543,6 @@ static bool do_perm_pred2(DisasContext *s, arg_rr_esz *a, bool high_odd,
     unsigned vsz = pred_full_reg_size(s);
     TCGv_ptr t_d = tcg_temp_new_ptr();
     TCGv_ptr t_n = tcg_temp_new_ptr();
-    TCGv_i32 t_desc;
     uint32_t desc = 0;
 
     tcg_gen_addi_ptr(t_d, cpu_env, pred_full_reg_offset(s, a->rd));
@@ -2576,11 +2551,9 @@ static bool do_perm_pred2(DisasContext *s, arg_rr_esz *a, bool high_odd,
     desc = FIELD_DP32(desc, PREDDESC, OPRSZ, vsz);
     desc = FIELD_DP32(desc, PREDDESC, ESZ, a->esz);
     desc = FIELD_DP32(desc, PREDDESC, DATA, high_odd);
-    t_desc = tcg_const_i32(desc);
 
-    fn(t_d, t_n, t_desc);
+    fn(t_d, t_n, tcg_constant_i32(desc));
 
-    tcg_temp_free_i32(t_desc);
     tcg_temp_free_ptr(t_d);
     tcg_temp_free_ptr(t_n);
     return true;
@@ -2782,18 +2755,15 @@ static void find_last_active(DisasContext *s, TCGv_i32 ret, int esz, int pg)
      * round up, as we do elsewhere, because we need the exact size.
      */
     TCGv_ptr t_p = tcg_temp_new_ptr();
-    TCGv_i32 t_desc;
     unsigned desc = 0;
 
     desc = FIELD_DP32(desc, PREDDESC, OPRSZ, pred_full_reg_size(s));
     desc = FIELD_DP32(desc, PREDDESC, ESZ, esz);
 
     tcg_gen_addi_ptr(t_p, cpu_env, pred_full_reg_offset(s, pg));
-    t_desc = tcg_const_i32(desc);
 
-    gen_helper_sve_last_active_element(ret, t_p, t_desc);
+    gen_helper_sve_last_active_element(ret, t_p, tcg_constant_i32(desc));
 
-    tcg_temp_free_i32(t_desc);
     tcg_temp_free_ptr(t_p);
 }
 
@@ -2808,11 +2778,9 @@ static void incr_last_active(DisasContext *s, TCGv_i32 last, int esz)
     if (is_power_of_2(vsz)) {
         tcg_gen_andi_i32(last, last, vsz - 1);
     } else {
-        TCGv_i32 max = tcg_const_i32(vsz);
-        TCGv_i32 zero = tcg_const_i32(0);
+        TCGv_i32 max = tcg_constant_i32(vsz);
+        TCGv_i32 zero = tcg_constant_i32(0);
         tcg_gen_movcond_i32(TCG_COND_GEU, last, last, max, zero, last);
-        tcg_temp_free_i32(max);
-        tcg_temp_free_i32(zero);
     }
 }
 
@@ -2824,11 +2792,9 @@ static void wrap_last_active(DisasContext *s, TCGv_i32 last, int esz)
     if (is_power_of_2(vsz)) {
         tcg_gen_andi_i32(last, last, vsz - 1);
     } else {
-        TCGv_i32 max = tcg_const_i32(vsz - (1 << esz));
-        TCGv_i32 zero = tcg_const_i32(0);
+        TCGv_i32 max = tcg_constant_i32(vsz - (1 << esz));
+        TCGv_i32 zero = tcg_constant_i32(0);
         tcg_gen_movcond_i32(TCG_COND_LT, last, last, zero, max, last);
-        tcg_temp_free_i32(max);
-        tcg_temp_free_i32(zero);
     }
 }
 
@@ -2945,7 +2911,7 @@ static void do_clast_scalar(DisasContext *s, int esz, int pg, int rm,
                             bool before, TCGv_i64 reg_val)
 {
     TCGv_i32 last = tcg_temp_new_i32();
-    TCGv_i64 ele, cmp, zero;
+    TCGv_i64 ele, cmp;
 
     find_last_active(s, last, esz, pg);
 
@@ -2965,10 +2931,9 @@ static void do_clast_scalar(DisasContext *s, int esz, int pg, int rm,
     ele = load_last_active(s, last, rm, esz);
     tcg_temp_free_i32(last);
 
-    zero = tcg_const_i64(0);
-    tcg_gen_movcond_i64(TCG_COND_GE, reg_val, cmp, zero, ele, reg_val);
+    tcg_gen_movcond_i64(TCG_COND_GE, reg_val, cmp, tcg_constant_i64(0),
+                        ele, reg_val);
 
-    tcg_temp_free_i64(zero);
     tcg_temp_free_i64(cmp);
     tcg_temp_free_i64(ele);
 }
@@ -3196,7 +3161,7 @@ static bool do_ppzz_flags(DisasContext *s, arg_rprr_esz *a,
     }
 
     vsz = vec_full_reg_size(s);
-    t = tcg_const_i32(simd_desc(vsz, vsz, 0));
+    t = tcg_temp_new_i32();
     pd = tcg_temp_new_ptr();
     zn = tcg_temp_new_ptr();
     zm = tcg_temp_new_ptr();
@@ -3207,7 +3172,7 @@ static bool do_ppzz_flags(DisasContext *s, arg_rprr_esz *a,
     tcg_gen_addi_ptr(zm, cpu_env, vec_full_reg_offset(s, a->rm));
     tcg_gen_addi_ptr(pg, cpu_env, pred_full_reg_offset(s, a->pg));
 
-    gen_fn(t, pd, zn, zm, pg, t);
+    gen_fn(t, pd, zn, zm, pg, tcg_constant_i32(simd_desc(vsz, vsz, 0)));
 
     tcg_temp_free_ptr(pd);
     tcg_temp_free_ptr(zn);
@@ -3281,7 +3246,7 @@ static bool do_ppzi_flags(DisasContext *s, arg_rpri_esz *a,
     }
 
     vsz = vec_full_reg_size(s);
-    t = tcg_const_i32(simd_desc(vsz, vsz, a->imm));
+    t = tcg_temp_new_i32();
     pd = tcg_temp_new_ptr();
     zn = tcg_temp_new_ptr();
     pg = tcg_temp_new_ptr();
@@ -3290,7 +3255,7 @@ static bool do_ppzi_flags(DisasContext *s, arg_rpri_esz *a,
     tcg_gen_addi_ptr(zn, cpu_env, vec_full_reg_offset(s, a->rn));
     tcg_gen_addi_ptr(pg, cpu_env, pred_full_reg_offset(s, a->pg));
 
-    gen_fn(t, pd, zn, pg, t);
+    gen_fn(t, pd, zn, pg, tcg_constant_i32(simd_desc(vsz, vsz, a->imm)));
 
     tcg_temp_free_ptr(pd);
     tcg_temp_free_ptr(zn);
@@ -3343,7 +3308,8 @@ static bool do_brk3(DisasContext *s, arg_rprr_s *a,
     TCGv_ptr n = tcg_temp_new_ptr();
     TCGv_ptr m = tcg_temp_new_ptr();
     TCGv_ptr g = tcg_temp_new_ptr();
-    TCGv_i32 t = tcg_const_i32(FIELD_DP32(0, PREDDESC, OPRSZ, vsz));
+    TCGv_i32 t = tcg_temp_new_i32();
+    TCGv_i32 desc = tcg_constant_i32(FIELD_DP32(0, PREDDESC, OPRSZ, vsz));
 
     tcg_gen_addi_ptr(d, cpu_env, pred_full_reg_offset(s, a->rd));
     tcg_gen_addi_ptr(n, cpu_env, pred_full_reg_offset(s, a->rn));
@@ -3351,10 +3317,10 @@ static bool do_brk3(DisasContext *s, arg_rprr_s *a,
     tcg_gen_addi_ptr(g, cpu_env, pred_full_reg_offset(s, a->pg));
 
     if (a->s) {
-        fn_s(t, d, n, m, g, t);
+        fn_s(t, d, n, m, g, desc);
         do_pred_flags(t);
     } else {
-        fn(d, n, m, g, t);
+        fn(d, n, m, g, desc);
     }
     tcg_temp_free_ptr(d);
     tcg_temp_free_ptr(n);
@@ -3377,17 +3343,18 @@ static bool do_brk2(DisasContext *s, arg_rpr_s *a,
     TCGv_ptr d = tcg_temp_new_ptr();
     TCGv_ptr n = tcg_temp_new_ptr();
     TCGv_ptr g = tcg_temp_new_ptr();
-    TCGv_i32 t = tcg_const_i32(FIELD_DP32(0, PREDDESC, OPRSZ, vsz));
+    TCGv_i32 t = tcg_temp_new_i32();
+    TCGv_i32 desc = tcg_constant_i32(FIELD_DP32(0, PREDDESC, OPRSZ, vsz));
 
     tcg_gen_addi_ptr(d, cpu_env, pred_full_reg_offset(s, a->rd));
     tcg_gen_addi_ptr(n, cpu_env, pred_full_reg_offset(s, a->rn));
     tcg_gen_addi_ptr(g, cpu_env, pred_full_reg_offset(s, a->pg));
 
     if (a->s) {
-        fn_s(t, d, n, g, t);
+        fn_s(t, d, n, g, desc);
         do_pred_flags(t);
     } else {
-        fn(d, n, g, t);
+        fn(d, n, g, desc);
     }
     tcg_temp_free_ptr(d);
     tcg_temp_free_ptr(n);
@@ -3461,19 +3428,16 @@ static void do_cntp(DisasContext *s, TCGv_i64 val, int esz, int pn, int pg)
         TCGv_ptr t_pn = tcg_temp_new_ptr();
         TCGv_ptr t_pg = tcg_temp_new_ptr();
         unsigned desc = 0;
-        TCGv_i32 t_desc;
 
         desc = FIELD_DP32(desc, PREDDESC, OPRSZ, psz);
         desc = FIELD_DP32(desc, PREDDESC, ESZ, esz);
 
         tcg_gen_addi_ptr(t_pn, cpu_env, pred_full_reg_offset(s, pn));
         tcg_gen_addi_ptr(t_pg, cpu_env, pred_full_reg_offset(s, pg));
-        t_desc = tcg_const_i32(desc);
 
-        gen_helper_sve_cntp(val, t_pn, t_pg, t_desc);
+        gen_helper_sve_cntp(val, t_pn, t_pg, tcg_constant_i32(desc));
         tcg_temp_free_ptr(t_pn);
         tcg_temp_free_ptr(t_pg);
-        tcg_temp_free_i32(t_desc);
     }
 }
 
@@ -3588,7 +3552,7 @@ static bool trans_CTERM(DisasContext *s, arg_CTERM *a)
 static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
 {
     TCGv_i64 op0, op1, t0, t1, tmax;
-    TCGv_i32 t2, t3;
+    TCGv_i32 t2;
     TCGv_ptr ptr;
     unsigned vsz = vec_full_reg_size(s);
     unsigned desc = 0;
@@ -3644,7 +3608,7 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
         }
     }
 
-    tmax = tcg_const_i64(vsz >> a->esz);
+    tmax = tcg_constant_i64(vsz >> a->esz);
     if (eq) {
         /* Equality means one more iteration.  */
         tcg_gen_addi_i64(t0, t0, 1);
@@ -3664,7 +3628,6 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
 
     /* Bound to the maximum.  */
     tcg_gen_umin_i64(t0, t0, tmax);
-    tcg_temp_free_i64(tmax);
 
     /* Set the count to zero if the condition is false.  */
     tcg_gen_movi_i64(t1, 0);
@@ -3681,28 +3644,26 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
 
     desc = FIELD_DP32(desc, PREDDESC, OPRSZ, vsz / 8);
     desc = FIELD_DP32(desc, PREDDESC, ESZ, a->esz);
-    t3 = tcg_const_i32(desc);
 
     ptr = tcg_temp_new_ptr();
     tcg_gen_addi_ptr(ptr, cpu_env, pred_full_reg_offset(s, a->rd));
 
     if (a->lt) {
-        gen_helper_sve_whilel(t2, ptr, t2, t3);
+        gen_helper_sve_whilel(t2, ptr, t2, tcg_constant_i32(desc));
     } else {
-        gen_helper_sve_whileg(t2, ptr, t2, t3);
+        gen_helper_sve_whileg(t2, ptr, t2, tcg_constant_i32(desc));
     }
     do_pred_flags(t2);
 
     tcg_temp_free_ptr(ptr);
     tcg_temp_free_i32(t2);
-    tcg_temp_free_i32(t3);
     return true;
 }
 
 static bool trans_WHILE_ptr(DisasContext *s, arg_WHILE_ptr *a)
 {
     TCGv_i64 op0, op1, diff, t1, tmax;
-    TCGv_i32 t2, t3;
+    TCGv_i32 t2;
     TCGv_ptr ptr;
     unsigned vsz = vec_full_reg_size(s);
     unsigned desc = 0;
@@ -3717,7 +3678,7 @@ static bool trans_WHILE_ptr(DisasContext *s, arg_WHILE_ptr *a)
     op0 = read_cpu_reg(s, a->rn, 1);
     op1 = read_cpu_reg(s, a->rm, 1);
 
-    tmax = tcg_const_i64(vsz);
+    tmax = tcg_constant_i64(vsz);
     diff = tcg_temp_new_i64();
 
     if (a->rw) {
@@ -3743,7 +3704,6 @@ static bool trans_WHILE_ptr(DisasContext *s, arg_WHILE_ptr *a)
 
     /* Bound to the maximum.  */
     tcg_gen_umin_i64(diff, diff, tmax);
-    tcg_temp_free_i64(tmax);
 
     /* Since we're bounded, pass as a 32-bit type.  */
     t2 = tcg_temp_new_i32();
@@ -3752,17 +3712,15 @@ static bool trans_WHILE_ptr(DisasContext *s, arg_WHILE_ptr *a)
 
     desc = FIELD_DP32(desc, PREDDESC, OPRSZ, vsz / 8);
     desc = FIELD_DP32(desc, PREDDESC, ESZ, a->esz);
-    t3 = tcg_const_i32(desc);
 
     ptr = tcg_temp_new_ptr();
     tcg_gen_addi_ptr(ptr, cpu_env, pred_full_reg_offset(s, a->rd));
 
-    gen_helper_sve_whilel(t2, ptr, t2, t3);
+    gen_helper_sve_whilel(t2, ptr, t2, tcg_constant_i32(desc));
     do_pred_flags(t2);
 
     tcg_temp_free_ptr(ptr);
     tcg_temp_free_i32(t2);
-    tcg_temp_free_i32(t3);
     return true;
 }
 
@@ -3856,11 +3814,9 @@ static bool trans_SUBR_zzi(DisasContext *s, arg_rri_esz *a)
     }
     if (sve_access_check(s)) {
         unsigned vsz = vec_full_reg_size(s);
-        TCGv_i64 c = tcg_const_i64(a->imm);
         tcg_gen_gvec_2s(vec_full_reg_offset(s, a->rd),
                         vec_full_reg_offset(s, a->rn),
-                        vsz, vsz, c, &op[a->esz]);
-        tcg_temp_free_i64(c);
+                        vsz, vsz, tcg_constant_i64(a->imm), &op[a->esz]);
     }
     return true;
 }
@@ -3881,9 +3837,8 @@ static bool do_zzi_sat(DisasContext *s, arg_rri_esz *a, bool u, bool d)
         return false;
     }
     if (sve_access_check(s)) {
-        TCGv_i64 val = tcg_const_i64(a->imm);
-        do_sat_addsub_vec(s, a->esz, a->rd, a->rn, val, u, d);
-        tcg_temp_free_i64(val);
+        do_sat_addsub_vec(s, a->esz, a->rd, a->rn,
+                          tcg_constant_i64(a->imm), u, d);
     }
     return true;
 }
@@ -3912,12 +3867,9 @@ static bool do_zzi_ool(DisasContext *s, arg_rri_esz *a, gen_helper_gvec_2i *fn)
 {
     if (sve_access_check(s)) {
         unsigned vsz = vec_full_reg_size(s);
-        TCGv_i64 c = tcg_const_i64(a->imm);
-
         tcg_gen_gvec_2i_ool(vec_full_reg_offset(s, a->rd),
                             vec_full_reg_offset(s, a->rn),
-                            c, vsz, vsz, 0, fn);
-        tcg_temp_free_i64(c);
+                            tcg_constant_i64(a->imm), vsz, vsz, 0, fn);
     }
     return true;
 }
@@ -4221,7 +4173,7 @@ static void do_reduce(DisasContext *s, arg_rpr_esz *a,
 {
     unsigned vsz = vec_full_reg_size(s);
     unsigned p2vsz = pow2ceil(vsz);
-    TCGv_i32 t_desc = tcg_const_i32(simd_desc(vsz, vsz, p2vsz));
+    TCGv_i32 t_desc = tcg_constant_i32(simd_desc(vsz, vsz, p2vsz));
     TCGv_ptr t_zn, t_pg, status;
     TCGv_i64 temp;
 
@@ -4237,7 +4189,6 @@ static void do_reduce(DisasContext *s, arg_rpr_esz *a,
     tcg_temp_free_ptr(t_zn);
     tcg_temp_free_ptr(t_pg);
     tcg_temp_free_ptr(status);
-    tcg_temp_free_i32(t_desc);
 
     write_fp_dreg(s, a->rd, temp);
     tcg_temp_free_i64(temp);
@@ -4414,11 +4365,10 @@ static bool trans_FADDA(DisasContext *s, arg_rprr_esz *a)
     tcg_gen_addi_ptr(t_rm, cpu_env, vec_full_reg_offset(s, a->rm));
     tcg_gen_addi_ptr(t_pg, cpu_env, pred_full_reg_offset(s, a->pg));
     t_fpst = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
-    t_desc = tcg_const_i32(simd_desc(vsz, vsz, 0));
+    t_desc = tcg_constant_i32(simd_desc(vsz, vsz, 0));
 
     fns[a->esz - 1](t_val, t_val, t_rm, t_pg, t_fpst, t_desc);
 
-    tcg_temp_free_i32(t_desc);
     tcg_temp_free_ptr(t_fpst);
     tcg_temp_free_ptr(t_pg);
     tcg_temp_free_ptr(t_rm);
@@ -4535,10 +4485,9 @@ static void do_fp_scalar(DisasContext *s, int zd, int zn, int pg, bool is_fp16,
     tcg_gen_addi_ptr(t_pg, cpu_env, pred_full_reg_offset(s, pg));
 
     status = fpstatus_ptr(is_fp16 ? FPST_FPCR_F16 : FPST_FPCR);
-    desc = tcg_const_i32(simd_desc(vsz, vsz, 0));
+    desc = tcg_constant_i32(simd_desc(vsz, vsz, 0));
     fn(t_zd, t_zn, t_pg, scalar, status, desc);
 
-    tcg_temp_free_i32(desc);
     tcg_temp_free_ptr(status);
     tcg_temp_free_ptr(t_pg);
     tcg_temp_free_ptr(t_zn);
@@ -4548,9 +4497,8 @@ static void do_fp_scalar(DisasContext *s, int zd, int zn, int pg, bool is_fp16,
 static void do_fp_imm(DisasContext *s, arg_rpri_esz *a, uint64_t imm,
                       gen_helper_sve_fp2scalar *fn)
 {
-    TCGv_i64 temp = tcg_const_i64(imm);
-    do_fp_scalar(s, a->rd, a->rn, a->pg, a->esz == MO_16, temp, fn);
-    tcg_temp_free_i64(temp);
+    do_fp_scalar(s, a->rd, a->rn, a->pg, a->esz == MO_16,
+                 tcg_constant_i64(imm), fn);
 }
 
 #define DO_FP_IMM(NAME, name, const0, const1) \
@@ -5297,7 +5245,6 @@ static void do_mem_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
 {
     unsigned vsz = vec_full_reg_size(s);
     TCGv_ptr t_pg;
-    TCGv_i32 t_desc;
     int desc = 0;
 
     /*
@@ -5319,14 +5266,12 @@ static void do_mem_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
     }
 
     desc = simd_desc(vsz, vsz, zt | desc);
-    t_desc = tcg_const_i32(desc);
     t_pg = tcg_temp_new_ptr();
 
     tcg_gen_addi_ptr(t_pg, cpu_env, pred_full_reg_offset(s, pg));
-    fn(cpu_env, t_pg, addr, t_desc);
+    fn(cpu_env, t_pg, addr, tcg_constant_i32(desc));
 
     tcg_temp_free_ptr(t_pg);
-    tcg_temp_free_i32(t_desc);
 }
 
 /* Indexed by [mte][be][dtype][nreg] */
@@ -6069,7 +6014,6 @@ static void do_mem_zpz(DisasContext *s, int zt, int pg, int zm,
     TCGv_ptr t_zm = tcg_temp_new_ptr();
     TCGv_ptr t_pg = tcg_temp_new_ptr();
     TCGv_ptr t_zt = tcg_temp_new_ptr();
-    TCGv_i32 t_desc;
     int desc = 0;
 
     if (s->mte_active[0]) {
@@ -6081,17 +6025,15 @@ static void do_mem_zpz(DisasContext *s, int zt, int pg, int zm,
         desc <<= SVE_MTEDESC_SHIFT;
     }
     desc = simd_desc(vsz, vsz, desc | scale);
-    t_desc = tcg_const_i32(desc);
 
     tcg_gen_addi_ptr(t_pg, cpu_env, pred_full_reg_offset(s, pg));
     tcg_gen_addi_ptr(t_zm, cpu_env, vec_full_reg_offset(s, zm));
     tcg_gen_addi_ptr(t_zt, cpu_env, vec_full_reg_offset(s, zt));
-    fn(cpu_env, t_zt, t_pg, t_zm, scalar, t_desc);
+    fn(cpu_env, t_zt, t_pg, t_zm, scalar, tcg_constant_i32(desc));
 
     tcg_temp_free_ptr(t_zt);
     tcg_temp_free_ptr(t_zm);
     tcg_temp_free_ptr(t_pg);
-    tcg_temp_free_i32(t_desc);
 }
 
 /* Indexed by [mte][be][ff][xs][u][msz].  */
@@ -6452,7 +6394,6 @@ static bool trans_LD1_zpiz(DisasContext *s, arg_LD1_zpiz *a)
     gen_helper_gvec_mem_scatter *fn = NULL;
     bool be = s->be_data == MO_BE;
     bool mte = s->mte_active[0];
-    TCGv_i64 imm;
 
     if (a->esz < a->msz || (a->esz == a->msz && !a->u)) {
         return false;
@@ -6474,9 +6415,8 @@ static bool trans_LD1_zpiz(DisasContext *s, arg_LD1_zpiz *a)
     /* Treat LD1_zpiz (zn[x] + imm) the same way as LD1_zprz (rn + zm[x])
      * by loading the immediate into the scalar parameter.
      */
-    imm = tcg_const_i64(a->imm << a->msz);
-    do_mem_zpz(s, a->rd, a->pg, a->rn, 0, imm, a->msz, false, fn);
-    tcg_temp_free_i64(imm);
+    do_mem_zpz(s, a->rd, a->pg, a->rn, 0,
+               tcg_constant_i64(a->imm << a->msz), a->msz, false, fn);
     return true;
 }
 
@@ -6635,7 +6575,6 @@ static bool trans_ST1_zpiz(DisasContext *s, arg_ST1_zpiz *a)
     gen_helper_gvec_mem_scatter *fn = NULL;
     bool be = s->be_data == MO_BE;
     bool mte = s->mte_active[0];
-    TCGv_i64 imm;
 
     if (a->esz < a->msz) {
         return false;
@@ -6657,9 +6596,8 @@ static bool trans_ST1_zpiz(DisasContext *s, arg_ST1_zpiz *a)
     /* Treat ST1_zpiz (zn[x] + imm) the same way as ST1_zprz (rn + zm[x])
      * by loading the immediate into the scalar parameter.
      */
-    imm = tcg_const_i64(a->imm << a->msz);
-    do_mem_zpz(s, a->rd, a->pg, a->rn, 0, imm, a->msz, true, fn);
-    tcg_temp_free_i64(imm);
+    do_mem_zpz(s, a->rd, a->pg, a->rn, 0,
+               tcg_constant_i64(a->imm << a->msz), a->msz, true, fn);
     return true;
 }
 
-- 
2.25.1


