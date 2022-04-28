Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5260513908
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:51:19 +0200 (CEST)
Received: from localhost ([::1]:35814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk6QH-0002s7-T6
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:51:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5K5-0005dT-2W
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:50 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:44895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5K2-0006UG-LY
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:48 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 r11-20020a05600c35cb00b0039409c1111bso2200907wmq.3
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=I7dhZpqRmVoOiM4gO+mO243SAujzT4dq/qQ3CV6JHoM=;
 b=be9mdKbCVG4ki535afOGw9Km3kokcXRCXmJDPqcfMffy4QYPLUsiTOIcjqdR/0bcKv
 aZyLv5DzoXPjP7iIfT3bIhaTICcMKUWnxqSr9DuJk7GBauuBxVnhDTfVrpLz+w7GpnU5
 OTp/f6FMOJOlWQZ8MDsG2hjCXxEXiG9vvKVToS2KUSmQYP6Af78YDsHtu2pXqnIQnLAt
 msSxJMigb9/8qJhx1yLY8DZnuMhmN1fMGhfpZwtl8Fn1EIQ19rfkNhoXn168tU54IZJP
 TTasbNlEPYkLZk87AqpbGPj6nW/nsBsFLhtJ+K7OmoLrAojxY/+MZyUwU8Z4m/Y+++m1
 JRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I7dhZpqRmVoOiM4gO+mO243SAujzT4dq/qQ3CV6JHoM=;
 b=cA5sWM0tiF84wC1TEzQaO7B4Qq5M5OVoAZ8O3XN/CUDk1SY83f4jIKSNsZAzd9Qzoo
 devsyo0lHD3NBgdZGY7zIFB5U7TcLFmlJv7ezsRog5A9g4TpvnOEEAbTdUZwmOdAcEuB
 8ocoW/nejc0FASawajJRm0NDKjdt1bIyeUfXF5FrWdnc9pUZBYfjr5dzLIJsVgtKlJcJ
 6O8t2mjGFkNMrmBE7wuryOoihTLLooOQ7UPCXp2jC31juy6V2TKKz0rUh3IK0jkx/dom
 0yjsj6yqvgjYygUa7o2L6FpoUXNRuaoSEi3+8jYiU32AlpzzyJafBx0gmxRY5SyMQKOI
 2lWg==
X-Gm-Message-State: AOAM531AAZ4BKlHoZgsMzxCLxTK9by6EIPHNb4d3w11sxE0m+Gw24wPc
 1p513wWIZ8mKIVc6zGvCKYaNKmJI+zGAdw==
X-Google-Smtp-Source: ABdhPJw/MN8BHKjuJonUgX2750IFxUkj9LnziuQVQVjuhOmCaFH79uuM4LzzC9M4ZkG5/xChhdmpsA==
X-Received: by 2002:a7b:c84f:0:b0:393:e729:e670 with SMTP id
 c15-20020a7bc84f000000b00393e729e670mr22830214wml.153.1651156845183; 
 Thu, 28 Apr 2022 07:40:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 47/54] target/arm: Use tcg_constant for vector descriptor
Date: Thu, 28 Apr 2022 15:39:51 +0100
Message-Id: <20220428143958.2451229-48-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220426163043.100432-48-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-sve.c | 54 ++++++++++----------------------------
 1 file changed, 14 insertions(+), 40 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 82bf094447b..dd4a5b23ab6 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -888,7 +888,7 @@ static bool do_vpz_ool(DisasContext *s, arg_rpr_esz *a,
         return true;
     }
 
-    desc = tcg_const_i32(simd_desc(vsz, vsz, 0));
+    desc = tcg_constant_i32(simd_desc(vsz, vsz, 0));
     temp = tcg_temp_new_i64();
     t_zn = tcg_temp_new_ptr();
     t_pg = tcg_temp_new_ptr();
@@ -898,7 +898,6 @@ static bool do_vpz_ool(DisasContext *s, arg_rpr_esz *a,
     fn(temp, t_zn, t_pg, desc);
     tcg_temp_free_ptr(t_zn);
     tcg_temp_free_ptr(t_pg);
-    tcg_temp_free_i32(desc);
 
     write_fp_dreg(s, a->rd, temp);
     tcg_temp_free_i64(temp);
@@ -1235,7 +1234,7 @@ static void do_index(DisasContext *s, int esz, int rd,
                      TCGv_i64 start, TCGv_i64 incr)
 {
     unsigned vsz = vec_full_reg_size(s);
-    TCGv_i32 desc = tcg_const_i32(simd_desc(vsz, vsz, 0));
+    TCGv_i32 desc = tcg_constant_i32(simd_desc(vsz, vsz, 0));
     TCGv_ptr t_zd = tcg_temp_new_ptr();
 
     tcg_gen_addi_ptr(t_zd, cpu_env, vec_full_reg_offset(s, rd));
@@ -1259,7 +1258,6 @@ static void do_index(DisasContext *s, int esz, int rd,
         tcg_temp_free_i32(i32);
     }
     tcg_temp_free_ptr(t_zd);
-    tcg_temp_free_i32(desc);
 }
 
 static bool trans_INDEX_ii(DisasContext *s, arg_INDEX_ii *a)
@@ -1988,7 +1986,7 @@ static void do_sat_addsub_vec(DisasContext *s, int esz, int rd, int rn,
     nptr = tcg_temp_new_ptr();
     tcg_gen_addi_ptr(dptr, cpu_env, vec_full_reg_offset(s, rd));
     tcg_gen_addi_ptr(nptr, cpu_env, vec_full_reg_offset(s, rn));
-    desc = tcg_const_i32(simd_desc(vsz, vsz, 0));
+    desc = tcg_constant_i32(simd_desc(vsz, vsz, 0));
 
     switch (esz) {
     case MO_8:
@@ -2057,7 +2055,6 @@ static void do_sat_addsub_vec(DisasContext *s, int esz, int rd, int rn,
 
     tcg_temp_free_ptr(dptr);
     tcg_temp_free_ptr(nptr);
-    tcg_temp_free_i32(desc);
 }
 
 static bool trans_CNT_r(DisasContext *s, arg_CNT_r *a)
@@ -2233,7 +2230,7 @@ static void do_cpy_m(DisasContext *s, int esz, int rd, int rn, int pg,
         gen_helper_sve_cpy_m_s, gen_helper_sve_cpy_m_d,
     };
     unsigned vsz = vec_full_reg_size(s);
-    TCGv_i32 desc = tcg_const_i32(simd_desc(vsz, vsz, 0));
+    TCGv_i32 desc = tcg_constant_i32(simd_desc(vsz, vsz, 0));
     TCGv_ptr t_zd = tcg_temp_new_ptr();
     TCGv_ptr t_zn = tcg_temp_new_ptr();
     TCGv_ptr t_pg = tcg_temp_new_ptr();
@@ -2247,7 +2244,6 @@ static void do_cpy_m(DisasContext *s, int esz, int rd, int rn, int pg,
     tcg_temp_free_ptr(t_zd);
     tcg_temp_free_ptr(t_zn);
     tcg_temp_free_ptr(t_pg);
-    tcg_temp_free_i32(desc);
 }
 
 static bool trans_FCPY(DisasContext *s, arg_FCPY *a)
@@ -2390,7 +2386,7 @@ static void do_insr_i64(DisasContext *s, arg_rrr_esz *a, TCGv_i64 val)
         gen_helper_sve_insr_s, gen_helper_sve_insr_d,
     };
     unsigned vsz = vec_full_reg_size(s);
-    TCGv_i32 desc = tcg_const_i32(simd_desc(vsz, vsz, 0));
+    TCGv_i32 desc = tcg_constant_i32(simd_desc(vsz, vsz, 0));
     TCGv_ptr t_zd = tcg_temp_new_ptr();
     TCGv_ptr t_zn = tcg_temp_new_ptr();
 
@@ -2401,7 +2397,6 @@ static void do_insr_i64(DisasContext *s, arg_rrr_esz *a, TCGv_i64 val)
 
     tcg_temp_free_ptr(t_zd);
     tcg_temp_free_ptr(t_zn);
-    tcg_temp_free_i32(desc);
 }
 
 static bool trans_INSR_f(DisasContext *s, arg_rrr_esz *a)
@@ -2520,7 +2515,6 @@ static bool do_perm_pred3(DisasContext *s, arg_rrr_esz *a, bool high_odd,
     TCGv_ptr t_d = tcg_temp_new_ptr();
     TCGv_ptr t_n = tcg_temp_new_ptr();
     TCGv_ptr t_m = tcg_temp_new_ptr();
-    TCGv_i32 t_desc;
     uint32_t desc = 0;
 
     desc = FIELD_DP32(desc, PREDDESC, OPRSZ, vsz);
@@ -2530,14 +2524,12 @@ static bool do_perm_pred3(DisasContext *s, arg_rrr_esz *a, bool high_odd,
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
 
@@ -2551,7 +2543,6 @@ static bool do_perm_pred2(DisasContext *s, arg_rr_esz *a, bool high_odd,
     unsigned vsz = pred_full_reg_size(s);
     TCGv_ptr t_d = tcg_temp_new_ptr();
     TCGv_ptr t_n = tcg_temp_new_ptr();
-    TCGv_i32 t_desc;
     uint32_t desc = 0;
 
     tcg_gen_addi_ptr(t_d, cpu_env, pred_full_reg_offset(s, a->rd));
@@ -2560,11 +2551,9 @@ static bool do_perm_pred2(DisasContext *s, arg_rr_esz *a, bool high_odd,
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
@@ -2766,18 +2755,15 @@ static void find_last_active(DisasContext *s, TCGv_i32 ret, int esz, int pg)
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
 
@@ -3442,19 +3428,16 @@ static void do_cntp(DisasContext *s, TCGv_i64 val, int esz, int pn, int pg)
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
 
@@ -4190,7 +4173,7 @@ static void do_reduce(DisasContext *s, arg_rpr_esz *a,
 {
     unsigned vsz = vec_full_reg_size(s);
     unsigned p2vsz = pow2ceil(vsz);
-    TCGv_i32 t_desc = tcg_const_i32(simd_desc(vsz, vsz, p2vsz));
+    TCGv_i32 t_desc = tcg_constant_i32(simd_desc(vsz, vsz, p2vsz));
     TCGv_ptr t_zn, t_pg, status;
     TCGv_i64 temp;
 
@@ -4206,7 +4189,6 @@ static void do_reduce(DisasContext *s, arg_rpr_esz *a,
     tcg_temp_free_ptr(t_zn);
     tcg_temp_free_ptr(t_pg);
     tcg_temp_free_ptr(status);
-    tcg_temp_free_i32(t_desc);
 
     write_fp_dreg(s, a->rd, temp);
     tcg_temp_free_i64(temp);
@@ -4383,11 +4365,10 @@ static bool trans_FADDA(DisasContext *s, arg_rprr_esz *a)
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
@@ -4504,10 +4485,9 @@ static void do_fp_scalar(DisasContext *s, int zd, int zn, int pg, bool is_fp16,
     tcg_gen_addi_ptr(t_pg, cpu_env, pred_full_reg_offset(s, pg));
 
     status = fpstatus_ptr(is_fp16 ? FPST_FPCR_F16 : FPST_FPCR);
-    desc = tcg_const_i32(simd_desc(vsz, vsz, 0));
+    desc = tcg_constant_i32(simd_desc(vsz, vsz, 0));
     fn(t_zd, t_zn, t_pg, scalar, status, desc);
 
-    tcg_temp_free_i32(desc);
     tcg_temp_free_ptr(status);
     tcg_temp_free_ptr(t_pg);
     tcg_temp_free_ptr(t_zn);
@@ -5265,7 +5245,6 @@ static void do_mem_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
 {
     unsigned vsz = vec_full_reg_size(s);
     TCGv_ptr t_pg;
-    TCGv_i32 t_desc;
     int desc = 0;
 
     /*
@@ -5287,14 +5266,12 @@ static void do_mem_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
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
@@ -6037,7 +6014,6 @@ static void do_mem_zpz(DisasContext *s, int zt, int pg, int zm,
     TCGv_ptr t_zm = tcg_temp_new_ptr();
     TCGv_ptr t_pg = tcg_temp_new_ptr();
     TCGv_ptr t_zt = tcg_temp_new_ptr();
-    TCGv_i32 t_desc;
     int desc = 0;
 
     if (s->mte_active[0]) {
@@ -6049,17 +6025,15 @@ static void do_mem_zpz(DisasContext *s, int zt, int pg, int zm,
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
-- 
2.25.1


