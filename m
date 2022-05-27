Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F12A4536811
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 22:26:42 +0200 (CEST)
Received: from localhost ([::1]:32904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nugXh-0005PM-P8
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 16:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefv-0002J6-M5
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:27:05 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:33413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefo-0005Sl-IG
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:27:03 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 qe5-20020a17090b4f8500b001e26126abccso2910208pjb.0
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oXJiw8TCQxQ2VV4f1OoJneaMKLpdCdZrtytQWEpfTks=;
 b=W0i9CS5ON0tK6n775nMfGqGraAil2FZ58TS5v65IiBWf2wwmeqfWDLaNU0gwEaYN6e
 czEdERzHc4uUxmlVAs61UjfGJ8V8BoVyg/K+BVhXnpZrrFIg9U8jngEIR/B/AkAs9yHT
 I6fr1t+DwqIn8WghtbPvOcFJx1ICrYnlZnZETFfsjOEItIQ97YyYa2qJqfG57hi35Xkz
 IEuglvzYGzgcjL0L6EUTwCkHR81GCsIIxFReD0fTCDDID3pBsGBznLXI/BhSwtR06TdW
 uwQ25Zzv42ZrmzDPH9GuTokyBv4CtV4S8nk0roa0mZunEg5i/zI8ZXidN8/6fXTBNXD1
 32Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oXJiw8TCQxQ2VV4f1OoJneaMKLpdCdZrtytQWEpfTks=;
 b=np0vnxy4TkpgQozxH+Fhml4iXO6CB98Dt61sYNpPs2rS7zlUQWmTVWGIiO1O7o84LI
 eC7ST0jZ5zGygKWPZZDACsvj3eNXqPIAEzjcKrNlYRCwodSvOzP9uvt1+z8NWXk8gqSZ
 1+t0AfMZjFVZzyDfPromjjLAU/MVmaO+w0PG8kr137Uh4ucHDZbZkWCURz1ZEMCxJbun
 W1v8mnKgu2kxoYIAP++B7GGc8ul0YAhJwNG9azi5ZFMolzIi4mV1XB4jNGIeR5uEMs3C
 5U3dwyxhkFRYDKh99rFZlAL0+7SZLKoCMi+kwUK077SyZhXpXXmzWP4zjxILJA+WhAwH
 d77A==
X-Gm-Message-State: AOAM530qt9a+hLNS5AM4TaT+TdvtlUiWKGGrAc/F3seFOgkKkz5FAiz0
 JrzQdnVMp2tvkvzhw81jB/9mH4NAumAvww==
X-Google-Smtp-Source: ABdhPJwoWG6dvKz2DWJC7N6LNScEfxHH3A/o1FTmepyHqJ3qkr50hCwgE9AqDwOY5+5m1bBWRfOkIw==
X-Received: by 2002:a17:902:b588:b0:161:64fe:af8c with SMTP id
 a8-20020a170902b58800b0016164feaf8cmr44499401pls.26.1653676015196; 
 Fri, 27 May 2022 11:26:55 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 113/114] target/arm: Add sve feature check for remaining
 trans_* functions
Date: Fri, 27 May 2022 11:19:06 -0700
Message-Id: <20220527181907.189259-114-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

For all remaining trans_* functions that do not already
have a check, add one now.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 177 ++++++++++++++++++++++++++++++++++---
 1 file changed, 163 insertions(+), 14 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 5fb66547ec..836511d719 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1311,6 +1311,9 @@ TRANS_FEAT(INDEX_rr, aa64_sve, do_index, a->esz, a->rd,
 
 static bool trans_ADDVL(DisasContext *s, arg_ADDVL *a)
 {
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (sve_access_check(s)) {
         TCGv_i64 rd = cpu_reg_sp(s, a->rd);
         TCGv_i64 rn = cpu_reg_sp(s, a->rn);
@@ -1321,6 +1324,9 @@ static bool trans_ADDVL(DisasContext *s, arg_ADDVL *a)
 
 static bool trans_ADDPL(DisasContext *s, arg_ADDPL *a)
 {
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (sve_access_check(s)) {
         TCGv_i64 rd = cpu_reg_sp(s, a->rd);
         TCGv_i64 rn = cpu_reg_sp(s, a->rn);
@@ -1331,6 +1337,9 @@ static bool trans_ADDPL(DisasContext *s, arg_ADDPL *a)
 
 static bool trans_RDVL(DisasContext *s, arg_RDVL *a)
 {
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (sve_access_check(s)) {
         TCGv_i64 reg = cpu_reg(s, a->rd);
         tcg_gen_movi_i64(reg, a->imm * vec_full_reg_size(s));
@@ -1451,6 +1460,9 @@ static bool trans_AND_pppp(DisasContext *s, arg_rprr_s *a)
         .prefer_i64 = TCG_TARGET_REG_BITS == 64,
     };
 
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (!a->s) {
         if (a->rn == a->rm) {
             if (a->pg == a->rn) {
@@ -1486,6 +1498,9 @@ static bool trans_BIC_pppp(DisasContext *s, arg_rprr_s *a)
         .prefer_i64 = TCG_TARGET_REG_BITS == 64,
     };
 
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (!a->s && a->pg == a->rn) {
         return gen_gvec_fn_ppp(s, tcg_gen_gvec_andc, a->rd, a->rn, a->rm);
     }
@@ -1514,6 +1529,9 @@ static bool trans_EOR_pppp(DisasContext *s, arg_rprr_s *a)
         .prefer_i64 = TCG_TARGET_REG_BITS == 64,
     };
 
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     /* Alias NOT (predicate) is EOR Pd.B, Pg/Z, Pn.B, Pg.B */
     if (!a->s && a->pg == a->rm) {
         return gen_gvec_fn_ppp(s, tcg_gen_gvec_andc, a->rd, a->pg, a->rn);
@@ -1523,7 +1541,7 @@ static bool trans_EOR_pppp(DisasContext *s, arg_rprr_s *a)
 
 static bool trans_SEL_pppp(DisasContext *s, arg_rprr_s *a)
 {
-    if (a->s) {
+    if (a->s || !dc_isar_feature(aa64_sve, s)) {
         return false;
     }
     if (sve_access_check(s)) {
@@ -1558,6 +1576,9 @@ static bool trans_ORR_pppp(DisasContext *s, arg_rprr_s *a)
         .prefer_i64 = TCG_TARGET_REG_BITS == 64,
     };
 
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (!a->s && a->pg == a->rn && a->rn == a->rm) {
         return do_mov_p(s, a->rd, a->rn);
     }
@@ -1585,6 +1606,10 @@ static bool trans_ORN_pppp(DisasContext *s, arg_rprr_s *a)
         .fno = gen_helper_sve_orn_pppp,
         .prefer_i64 = TCG_TARGET_REG_BITS == 64,
     };
+
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     return do_pppp_flags(s, a, &op);
 }
 
@@ -1609,6 +1634,10 @@ static bool trans_NOR_pppp(DisasContext *s, arg_rprr_s *a)
         .fno = gen_helper_sve_nor_pppp,
         .prefer_i64 = TCG_TARGET_REG_BITS == 64,
     };
+
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     return do_pppp_flags(s, a, &op);
 }
 
@@ -1633,6 +1662,10 @@ static bool trans_NAND_pppp(DisasContext *s, arg_rprr_s *a)
         .fno = gen_helper_sve_nand_pppp,
         .prefer_i64 = TCG_TARGET_REG_BITS == 64,
     };
+
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     return do_pppp_flags(s, a, &op);
 }
 
@@ -1642,6 +1675,9 @@ static bool trans_NAND_pppp(DisasContext *s, arg_rprr_s *a)
 
 static bool trans_PTEST(DisasContext *s, arg_PTEST *a)
 {
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (sve_access_check(s)) {
         int nofs = pred_full_reg_offset(s, a->rn);
         int gofs = pred_full_reg_offset(s, a->pg);
@@ -1998,6 +2034,9 @@ static void do_sat_addsub_vec(DisasContext *s, int esz, int rd, int rn,
 
 static bool trans_CNT_r(DisasContext *s, arg_CNT_r *a)
 {
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (sve_access_check(s)) {
         unsigned fullsz = vec_full_reg_size(s);
         unsigned numelem = decode_pred_count(fullsz, a->pat, a->esz);
@@ -2008,6 +2047,9 @@ static bool trans_CNT_r(DisasContext *s, arg_CNT_r *a)
 
 static bool trans_INCDEC_r(DisasContext *s, arg_incdec_cnt *a)
 {
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (sve_access_check(s)) {
         unsigned fullsz = vec_full_reg_size(s);
         unsigned numelem = decode_pred_count(fullsz, a->pat, a->esz);
@@ -2021,6 +2063,9 @@ static bool trans_INCDEC_r(DisasContext *s, arg_incdec_cnt *a)
 
 static bool trans_SINCDEC_r_32(DisasContext *s, arg_incdec_cnt *a)
 {
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (!sve_access_check(s)) {
         return true;
     }
@@ -2045,6 +2090,9 @@ static bool trans_SINCDEC_r_32(DisasContext *s, arg_incdec_cnt *a)
 
 static bool trans_SINCDEC_r_64(DisasContext *s, arg_incdec_cnt *a)
 {
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (!sve_access_check(s)) {
         return true;
     }
@@ -2062,7 +2110,7 @@ static bool trans_SINCDEC_r_64(DisasContext *s, arg_incdec_cnt *a)
 
 static bool trans_INCDEC_v(DisasContext *s, arg_incdec2_cnt *a)
 {
-    if (a->esz == 0) {
+    if (a->esz == 0 || !dc_isar_feature(aa64_sve, s)) {
         return false;
     }
 
@@ -2085,7 +2133,7 @@ static bool trans_INCDEC_v(DisasContext *s, arg_incdec2_cnt *a)
 
 static bool trans_SINCDEC_v(DisasContext *s, arg_incdec2_cnt *a)
 {
-    if (a->esz == 0) {
+    if (a->esz == 0 || !dc_isar_feature(aa64_sve, s)) {
         return false;
     }
 
@@ -2126,6 +2174,10 @@ TRANS_FEAT(EOR_zzi, aa64_sve, do_zz_dbm, a, tcg_gen_gvec_xori)
 static bool trans_DUPM(DisasContext *s, arg_DUPM *a)
 {
     uint64_t imm;
+
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (!logic_imm_decode_wmask(&imm, extract32(a->dbm, 12, 1),
                                 extract32(a->dbm, 0, 6),
                                 extract32(a->dbm, 6, 6))) {
@@ -2171,7 +2223,7 @@ static void do_cpy_m(DisasContext *s, int esz, int rd, int rn, int pg,
 
 static bool trans_FCPY(DisasContext *s, arg_FCPY *a)
 {
-    if (a->esz == 0) {
+    if (a->esz == 0 || !dc_isar_feature(aa64_sve, s)) {
         return false;
     }
     if (sve_access_check(s)) {
@@ -2184,6 +2236,9 @@ static bool trans_FCPY(DisasContext *s, arg_FCPY *a)
 
 static bool trans_CPY_m_i(DisasContext *s, arg_rpri_esz *a)
 {
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (sve_access_check(s)) {
         do_cpy_m(s, a->esz, a->rd, a->rn, a->pg, tcg_constant_i64(a->imm));
     }
@@ -2197,6 +2252,9 @@ static bool trans_CPY_z_i(DisasContext *s, arg_CPY_z_i *a)
         gen_helper_sve_cpy_z_s, gen_helper_sve_cpy_z_d,
     };
 
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (sve_access_check(s)) {
         unsigned vsz = vec_full_reg_size(s);
         tcg_gen_gvec_2i_ool(vec_full_reg_offset(s, a->rd),
@@ -2250,6 +2308,9 @@ TRANS_FEAT(EXT_sve2, aa64_sve2, do_EXT, a->rd, a->rn, (a->rn + 1) % 32, a->imm)
 
 static bool trans_DUP_s(DisasContext *s, arg_DUP_s *a)
 {
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (sve_access_check(s)) {
         unsigned vsz = vec_full_reg_size(s);
         tcg_gen_gvec_dup_i64(a->esz, vec_full_reg_offset(s, a->rd),
@@ -2260,6 +2321,9 @@ static bool trans_DUP_s(DisasContext *s, arg_DUP_s *a)
 
 static bool trans_DUP_x(DisasContext *s, arg_DUP_x *a)
 {
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if ((a->imm & 0x1f) == 0) {
         return false;
     }
@@ -2308,6 +2372,9 @@ static void do_insr_i64(DisasContext *s, arg_rrr_esz *a, TCGv_i64 val)
 
 static bool trans_INSR_f(DisasContext *s, arg_rrr_esz *a)
 {
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (sve_access_check(s)) {
         TCGv_i64 t = tcg_temp_new_i64();
         tcg_gen_ld_i64(t, cpu_env, vec_reg_offset(s, a->rm, 0, MO_64));
@@ -2319,6 +2386,9 @@ static bool trans_INSR_f(DisasContext *s, arg_rrr_esz *a)
 
 static bool trans_INSR_r(DisasContext *s, arg_rrr_esz *a)
 {
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (sve_access_check(s)) {
         do_insr_i64(s, a, cpu_reg(s, a->rm));
     }
@@ -2359,7 +2429,7 @@ static bool trans_UNPK(DisasContext *s, arg_UNPK *a)
         { gen_helper_sve_sunpk_d, gen_helper_sve_uunpk_d },
     };
 
-    if (a->esz == 0) {
+    if (a->esz == 0 || !dc_isar_feature(aa64_sve, s)) {
         return false;
     }
     if (sve_access_check(s)) {
@@ -2787,6 +2857,9 @@ TRANS_FEAT(LASTB_r, aa64_sve, do_last_general, a, true)
 
 static bool trans_CPY_m_r(DisasContext *s, arg_rpr_esz *a)
 {
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (sve_access_check(s)) {
         do_cpy_m(s, a->esz, a->rd, a->rd, a->pg, cpu_reg_sp(s, a->rn));
     }
@@ -2795,6 +2868,9 @@ static bool trans_CPY_m_r(DisasContext *s, arg_rpr_esz *a)
 
 static bool trans_CPY_m_v(DisasContext *s, arg_rpr_esz *a)
 {
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (sve_access_check(s)) {
         int ofs = vec_reg_offset(s, a->rn, 0, a->esz);
         TCGv_i64 t = load_esz(cpu_env, ofs, a->esz);
@@ -3102,6 +3178,9 @@ static void do_cntp(DisasContext *s, TCGv_i64 val, int esz, int pn, int pg)
 
 static bool trans_CNTP(DisasContext *s, arg_CNTP *a)
 {
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (sve_access_check(s)) {
         do_cntp(s, cpu_reg(s, a->rd), a->esz, a->rn, a->pg);
     }
@@ -3110,6 +3189,9 @@ static bool trans_CNTP(DisasContext *s, arg_CNTP *a)
 
 static bool trans_INCDECP_r(DisasContext *s, arg_incdec_pred *a)
 {
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (sve_access_check(s)) {
         TCGv_i64 reg = cpu_reg(s, a->rd);
         TCGv_i64 val = tcg_temp_new_i64();
@@ -3127,7 +3209,7 @@ static bool trans_INCDECP_r(DisasContext *s, arg_incdec_pred *a)
 
 static bool trans_INCDECP_z(DisasContext *s, arg_incdec2_pred *a)
 {
-    if (a->esz == 0) {
+    if (a->esz == 0 || !dc_isar_feature(aa64_sve, s)) {
         return false;
     }
     if (sve_access_check(s)) {
@@ -3144,6 +3226,9 @@ static bool trans_INCDECP_z(DisasContext *s, arg_incdec2_pred *a)
 
 static bool trans_SINCDECP_r_32(DisasContext *s, arg_incdec_pred *a)
 {
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (sve_access_check(s)) {
         TCGv_i64 reg = cpu_reg(s, a->rd);
         TCGv_i64 val = tcg_temp_new_i64();
@@ -3156,6 +3241,9 @@ static bool trans_SINCDECP_r_32(DisasContext *s, arg_incdec_pred *a)
 
 static bool trans_SINCDECP_r_64(DisasContext *s, arg_incdec_pred *a)
 {
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (sve_access_check(s)) {
         TCGv_i64 reg = cpu_reg(s, a->rd);
         TCGv_i64 val = tcg_temp_new_i64();
@@ -3168,7 +3256,7 @@ static bool trans_SINCDECP_r_64(DisasContext *s, arg_incdec_pred *a)
 
 static bool trans_SINCDECP_z(DisasContext *s, arg_incdec2_pred *a)
 {
-    if (a->esz == 0) {
+    if (a->esz == 0 || !dc_isar_feature(aa64_sve, s)) {
         return false;
     }
     if (sve_access_check(s)) {
@@ -3185,6 +3273,9 @@ static bool trans_SINCDECP_z(DisasContext *s, arg_incdec2_pred *a)
 
 static bool trans_CTERM(DisasContext *s, arg_CTERM *a)
 {
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (!sve_access_check(s)) {
         return true;
     }
@@ -3221,7 +3312,9 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
     bool eq = a->eq == a->lt;
 
     /* The greater-than conditions are all SVE2. */
-    if (!a->lt && !dc_isar_feature(aa64_sve2, s)) {
+    if (a->lt
+        ? !dc_isar_feature(aa64_sve, s)
+        : !dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
     if (!sve_access_check(s)) {
@@ -3389,7 +3482,7 @@ static bool trans_WHILE_ptr(DisasContext *s, arg_WHILE_ptr *a)
 
 static bool trans_FDUP(DisasContext *s, arg_FDUP *a)
 {
-    if (a->esz == 0) {
+    if (a->esz == 0 || !dc_isar_feature(aa64_sve, s)) {
         return false;
     }
     if (sve_access_check(s)) {
@@ -3406,6 +3499,9 @@ static bool trans_FDUP(DisasContext *s, arg_FDUP *a)
 
 static bool trans_DUP_i(DisasContext *s, arg_DUP_i *a)
 {
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (sve_access_check(s)) {
         unsigned vsz = vec_full_reg_size(s);
         int dofs = vec_full_reg_offset(s, a->rd);
@@ -3453,6 +3549,9 @@ static bool trans_SUBR_zzi(DisasContext *s, arg_rri_esz *a)
           .scalar_first = true }
     };
 
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (sve_access_check(s)) {
         unsigned vsz = vec_full_reg_size(s);
         tcg_gen_gvec_2s(vec_full_reg_offset(s, a->rd),
@@ -3815,7 +3914,7 @@ static bool trans_FADDA(DisasContext *s, arg_rprr_esz *a)
     TCGv_i64 t_val;
     TCGv_i32 t_desc;
 
-    if (a->esz == 0) {
+    if (a->esz == 0 || !dc_isar_feature(aa64_sve, s)) {
         return false;
     }
     if (!sve_access_check(s)) {
@@ -4367,6 +4466,9 @@ static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
 
 static bool trans_LDR_zri(DisasContext *s, arg_rri *a)
 {
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (sve_access_check(s)) {
         int size = vec_full_reg_size(s);
         int off = vec_full_reg_offset(s, a->rd);
@@ -4377,6 +4479,9 @@ static bool trans_LDR_zri(DisasContext *s, arg_rri *a)
 
 static bool trans_LDR_pri(DisasContext *s, arg_rri *a)
 {
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (sve_access_check(s)) {
         int size = pred_full_reg_size(s);
         int off = pred_full_reg_offset(s, a->rd);
@@ -4387,6 +4492,9 @@ static bool trans_LDR_pri(DisasContext *s, arg_rri *a)
 
 static bool trans_STR_zri(DisasContext *s, arg_rri *a)
 {
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (sve_access_check(s)) {
         int size = vec_full_reg_size(s);
         int off = vec_full_reg_offset(s, a->rd);
@@ -4397,6 +4505,9 @@ static bool trans_STR_zri(DisasContext *s, arg_rri *a)
 
 static bool trans_STR_pri(DisasContext *s, arg_rri *a)
 {
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (sve_access_check(s)) {
         int size = pred_full_reg_size(s);
         int off = pred_full_reg_offset(s, a->rd);
@@ -4597,7 +4708,7 @@ static void do_ld_zpa(DisasContext *s, int zt, int pg,
 
 static bool trans_LD_zprr(DisasContext *s, arg_rprr_load *a)
 {
-    if (a->rm == 31) {
+    if (a->rm == 31 || !dc_isar_feature(aa64_sve, s)) {
         return false;
     }
     if (sve_access_check(s)) {
@@ -4611,6 +4722,9 @@ static bool trans_LD_zprr(DisasContext *s, arg_rprr_load *a)
 
 static bool trans_LD_zpri(DisasContext *s, arg_rpri_load *a)
 {
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (sve_access_check(s)) {
         int vsz = vec_full_reg_size(s);
         int elements = vsz >> dtype_esz[a->dtype];
@@ -4712,6 +4826,9 @@ static bool trans_LDFF1_zprr(DisasContext *s, arg_rprr_load *a)
             gen_helper_sve_ldff1dd_be_r_mte } },
     };
 
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (sve_access_check(s)) {
         TCGv_i64 addr = new_tmp_a64(s);
         tcg_gen_shli_i64(addr, cpu_reg(s, a->rm), dtype_msz(a->dtype));
@@ -4810,6 +4927,9 @@ static bool trans_LDNF1_zpri(DisasContext *s, arg_rpri_load *a)
             gen_helper_sve_ldnf1dd_be_r_mte } },
     };
 
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (sve_access_check(s)) {
         int vsz = vec_full_reg_size(s);
         int elements = vsz >> dtype_esz[a->dtype];
@@ -4867,7 +4987,7 @@ static void do_ldrq(DisasContext *s, int zt, int pg, TCGv_i64 addr, int dtype)
 
 static bool trans_LD1RQ_zprr(DisasContext *s, arg_rprr_load *a)
 {
-    if (a->rm == 31) {
+    if (a->rm == 31 || !dc_isar_feature(aa64_sve, s)) {
         return false;
     }
     if (sve_access_check(s)) {
@@ -4882,6 +5002,9 @@ static bool trans_LD1RQ_zprr(DisasContext *s, arg_rprr_load *a)
 
 static bool trans_LD1RQ_zpri(DisasContext *s, arg_rpri_load *a)
 {
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (sve_access_check(s)) {
         TCGv_i64 addr = new_tmp_a64(s);
         tcg_gen_addi_i64(addr, cpu_reg_sp(s, a->rn), a->imm * 16);
@@ -4993,6 +5116,9 @@ static bool trans_LD1R_zpri(DisasContext *s, arg_rpri_load *a)
     TCGLabel *over;
     TCGv_i64 temp, clean_addr;
 
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (!sve_access_check(s)) {
         return true;
     }
@@ -5161,6 +5287,9 @@ static void do_st_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
 
 static bool trans_ST_zprr(DisasContext *s, arg_rprr_store *a)
 {
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (a->rm == 31 || a->msz > a->esz) {
         return false;
     }
@@ -5175,6 +5304,9 @@ static bool trans_ST_zprr(DisasContext *s, arg_rprr_store *a)
 
 static bool trans_ST_zpri(DisasContext *s, arg_rpri_store *a)
 {
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (a->msz > a->esz) {
         return false;
     }
@@ -5558,6 +5690,9 @@ static bool trans_LD1_zprz(DisasContext *s, arg_LD1_zprz *a)
     bool be = s->be_data == MO_BE;
     bool mte = s->mte_active[0];
 
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (!sve_access_check(s)) {
         return true;
     }
@@ -5586,6 +5721,9 @@ static bool trans_LD1_zpiz(DisasContext *s, arg_LD1_zpiz *a)
     if (a->esz < a->msz || (a->esz == a->msz && !a->u)) {
         return false;
     }
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (!sve_access_check(s)) {
         return true;
     }
@@ -5740,6 +5878,9 @@ static bool trans_ST1_zprz(DisasContext *s, arg_ST1_zprz *a)
     if (a->esz < a->msz || (a->msz == 0 && a->scale)) {
         return false;
     }
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (!sve_access_check(s)) {
         return true;
     }
@@ -5767,6 +5908,9 @@ static bool trans_ST1_zpiz(DisasContext *s, arg_ST1_zpiz *a)
     if (a->esz < a->msz) {
         return false;
     }
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     if (!sve_access_check(s)) {
         return true;
     }
@@ -5827,6 +5971,9 @@ static bool trans_STNT1_zprz(DisasContext *s, arg_ST1_zprz *a)
 
 static bool trans_PRF(DisasContext *s, arg_PRF *a)
 {
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
     /* Prefetch is a nop within QEMU.  */
     (void)sve_access_check(s);
     return true;
@@ -5834,7 +5981,7 @@ static bool trans_PRF(DisasContext *s, arg_PRF *a)
 
 static bool trans_PRF_rr(DisasContext *s, arg_PRF_rr *a)
 {
-    if (a->rm == 31) {
+    if (a->rm == 31 || !dc_isar_feature(aa64_sve, s)) {
         return false;
     }
     /* Prefetch is a nop within QEMU.  */
@@ -6070,7 +6217,9 @@ static bool do_trans_pmull(DisasContext *s, arg_rrr_esz *a, bool sel)
         gen_helper_gvec_pmull_q, gen_helper_sve2_pmull_h,
         NULL,                    gen_helper_sve2_pmull_d,
     };
-    if (a->esz == 0 && !dc_isar_feature(aa64_sve2_pmull128, s)) {
+    if (a->esz == 0
+        ? !dc_isar_feature(aa64_sve2_pmull128, s)
+        : !dc_isar_feature(aa64_sve, s)) {
         return false;
     }
     return gen_gvec_ool_arg_zzz(s, fns[a->esz], a, sel);
-- 
2.34.1


