Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AAC370278
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 22:54:04 +0200 (CEST)
Received: from localhost ([::1]:45824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lca9D-0007AO-VC
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 16:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiv-0000eX-VN
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:26:54 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:42735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZia-0006Ae-EV
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:26:53 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so2378546pjv.1
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VnUeaFstfauSS4JTjM/wMyZDfm9bVsWwY847CCsEpAM=;
 b=TLw2/hJzAKInLsFW/JlSZEDz1/BQBRU04a/l9ITnivG1YlLfz9z7CrIfvig7ELseBr
 8c1+fQBbEI/4EqTUjbx+ho6g0Xjvp9d6IAXnbGlrExfK3IvsqdnLd1AyGe9mxvIcsK7J
 V+VPBPVdtAYy4ANku7TD9cI4gmqgci5YVo7LCdPZwKzSitagagJdlk2+DK1Z6dqnl2fO
 jEW33VvlZTM+WPSWjAuS0SWVUIbfvJ0hRZHDS5Fe36TMyeLz3M6vamrjDUIgWBvNqONm
 iBAowAds5sPMB3Bcfrnpdi/Qy8YM0sJEEgyb0jI+Ij603OsOBwto/2I6uNjcg+XPCX8S
 EBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VnUeaFstfauSS4JTjM/wMyZDfm9bVsWwY847CCsEpAM=;
 b=YnSCUcieeHfNH/9v3GhElAz9dOoMEFoQd6+iVgm9niRB9xebGjNAavvIHf4I428fBX
 OBV4QzMDNGxnag3SILh5cPW0onhjam9LaQyCR8hEEE2pkJZ10Ks1D1TToMvab3s7p3un
 MG8jrJ937BAUmLe5qyZqiME2Z2sP0DooNyVJ7bvmDgfBKvI59mh4vm/4NkhnBj1nqLUe
 76dab4dSVauEpj2eM0PgGPiZDSPJIbqSfWIfelo37qHOK5Og++LTySPd6qFHm5LordzO
 kIb7qUfkF+ohxh28RSNF+1+c69iQOjMvmc21VfPZU8IGBe/L0f0XEUWmKNDvwA55D74h
 SSgg==
X-Gm-Message-State: AOAM531Tf/NaeQRBPo7tpw4kHGIWti5pGfspIU1tXnUN+aNrw7fcXLH0
 4owq2bPBBtLIzz+bfm/Vw7FLEH6ll56RUg==
X-Google-Smtp-Source: ABdhPJyqhxmEkvWwzDb2Vr2HCik20ZrIoIc8c1wpogmMwMYoXKuZHCd65sq9NvogeSeNyxleQux8Nw==
X-Received: by 2002:a17:902:10b:b029:ed:2b3e:beb4 with SMTP id
 11-20020a170902010bb02900ed2b3ebeb4mr7134184plb.64.1619814391119; 
 Fri, 30 Apr 2021 13:26:31 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e6sm2905257pfd.219.2021.04.30.13.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:26:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 32/82] target/arm: Implement SVE2 bitwise ternary operations
Date: Fri, 30 Apr 2021 13:25:20 -0700
Message-Id: <20210430202610.1136687-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
 target/arm/helper-sve.h    |   6 ++
 target/arm/sve.decode      |  12 +++
 target/arm/sve_helper.c    |  50 +++++++++
 target/arm/translate-sve.c | 213 +++++++++++++++++++++++++++++++++++++
 4 files changed, 281 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 5bf9fdc7a3..df617e3351 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2543,3 +2543,9 @@ DEF_HELPER_FLAGS_6(sve2_fminp_zpzz_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_6(sve2_fminp_zpzz_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_eor3, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_bcax, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_bsl1n, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_bsl2n, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_nbsl, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index f365907518..bf673e2f16 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -124,6 +124,10 @@
 @rda_rn_rm      ........ esz:2 . rm:5 ... ... rn:5 rd:5 \
                 &rrrr_esz ra=%reg_movprfx
 
+# Four operand with unused vector element size
+@rdn_ra_rm_e0   ........ ... rm:5 ... ... ra:5 rd:5 \
+                &rrrr_esz esz=0 rn=%reg_movprfx
+
 # Three operand with "memory" size, aka immediate left shift
 @rd_rn_msz_rm   ........ ... rm:5 .... imm:2 rn:5 rd:5          &rrri
 
@@ -379,6 +383,14 @@ ORR_zzz         00000100 01 1 ..... 001 100 ..... .....         @rd_rn_rm_e0
 EOR_zzz         00000100 10 1 ..... 001 100 ..... .....         @rd_rn_rm_e0
 BIC_zzz         00000100 11 1 ..... 001 100 ..... .....         @rd_rn_rm_e0
 
+# SVE2 bitwise ternary operations
+EOR3            00000100 00 1 ..... 001 110 ..... .....         @rdn_ra_rm_e0
+BSL             00000100 00 1 ..... 001 111 ..... .....         @rdn_ra_rm_e0
+BCAX            00000100 01 1 ..... 001 110 ..... .....         @rdn_ra_rm_e0
+BSL1N           00000100 01 1 ..... 001 111 ..... .....         @rdn_ra_rm_e0
+BSL2N           00000100 10 1 ..... 001 111 ..... .....         @rdn_ra_rm_e0
+NBSL            00000100 11 1 ..... 001 111 ..... .....         @rdn_ra_rm_e0
+
 ### SVE Index Generation Group
 
 # SVE index generation (immediate start, immediate increment)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index fb38f2c57e..b0598f9097 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -6792,3 +6792,53 @@ DO_ST1_ZPZ_D(dd_be, zd, MO_64)
 
 #undef DO_ST1_ZPZ_S
 #undef DO_ST1_ZPZ_D
+
+void HELPER(sve2_eor3)(void *vd, void *vn, void *vm, void *vk, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd, *n = vn, *m = vm, *k = vk;
+
+    for (i = 0; i < opr_sz; ++i) {
+        d[i] = n[i] ^ m[i] ^ k[i];
+    }
+}
+
+void HELPER(sve2_bcax)(void *vd, void *vn, void *vm, void *vk, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd, *n = vn, *m = vm, *k = vk;
+
+    for (i = 0; i < opr_sz; ++i) {
+        d[i] = n[i] ^ (m[i] & ~k[i]);
+    }
+}
+
+void HELPER(sve2_bsl1n)(void *vd, void *vn, void *vm, void *vk, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd, *n = vn, *m = vm, *k = vk;
+
+    for (i = 0; i < opr_sz; ++i) {
+        d[i] = (~n[i] & k[i]) | (m[i] & ~k[i]);
+    }
+}
+
+void HELPER(sve2_bsl2n)(void *vd, void *vn, void *vm, void *vk, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd, *n = vn, *m = vm, *k = vk;
+
+    for (i = 0; i < opr_sz; ++i) {
+        d[i] = (n[i] & k[i]) | (~m[i] & ~k[i]);
+    }
+}
+
+void HELPER(sve2_nbsl)(void *vd, void *vn, void *vm, void *vk, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    uint64_t *d = vd, *n = vn, *m = vm, *k = vk;
+
+    for (i = 0; i < opr_sz; ++i) {
+        d[i] = ~((n[i] & k[i]) | (m[i] & ~k[i]));
+    }
+}
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 97e113ceec..ab290b9025 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -217,6 +217,17 @@ static void gen_gvec_fn_zzz(DisasContext *s, GVecGen3Fn *gvec_fn,
             vec_full_reg_offset(s, rm), vsz, vsz);
 }
 
+/* Invoke a vector expander on four Zregs.  */
+static void gen_gvec_fn_zzzz(DisasContext *s, GVecGen4Fn *gvec_fn,
+                             int esz, int rd, int rn, int rm, int ra)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    gvec_fn(esz, vec_full_reg_offset(s, rd),
+            vec_full_reg_offset(s, rn),
+            vec_full_reg_offset(s, rm),
+            vec_full_reg_offset(s, ra), vsz, vsz);
+}
+
 /* Invoke a vector move on two Zregs.  */
 static bool do_mov_z(DisasContext *s, int rd, int rn)
 {
@@ -329,6 +340,208 @@ static bool trans_BIC_zzz(DisasContext *s, arg_rrr_esz *a)
     return do_zzz_fn(s, a, tcg_gen_gvec_andc);
 }
 
+static bool do_sve2_zzzz_fn(DisasContext *s, arg_rrrr_esz *a, GVecGen4Fn *fn)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_fn_zzzz(s, fn, a->esz, a->rd, a->rn, a->rm, a->ra);
+    }
+    return true;
+}
+
+static void gen_eor3_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, TCGv_i64 k)
+{
+    tcg_gen_xor_i64(d, n, m);
+    tcg_gen_xor_i64(d, d, k);
+}
+
+static void gen_eor3_vec(unsigned vece, TCGv_vec d, TCGv_vec n,
+                         TCGv_vec m, TCGv_vec k)
+{
+    tcg_gen_xor_vec(vece, d, n, m);
+    tcg_gen_xor_vec(vece, d, d, k);
+}
+
+static void gen_eor3(unsigned vece, uint32_t d, uint32_t n, uint32_t m,
+                     uint32_t a, uint32_t oprsz, uint32_t maxsz)
+{
+    static const GVecGen4 op = {
+        .fni8 = gen_eor3_i64,
+        .fniv = gen_eor3_vec,
+        .fno = gen_helper_sve2_eor3,
+        .vece = MO_64,
+        .prefer_i64 = TCG_TARGET_REG_BITS == 64,
+    };
+    tcg_gen_gvec_4(d, n, m, a, oprsz, maxsz, &op);
+}
+
+static bool trans_EOR3(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sve2_zzzz_fn(s, a, gen_eor3);
+}
+
+static void gen_bcax_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, TCGv_i64 k)
+{
+    tcg_gen_andc_i64(d, m, k);
+    tcg_gen_xor_i64(d, d, n);
+}
+
+static void gen_bcax_vec(unsigned vece, TCGv_vec d, TCGv_vec n,
+                         TCGv_vec m, TCGv_vec k)
+{
+    tcg_gen_andc_vec(vece, d, m, k);
+    tcg_gen_xor_vec(vece, d, d, n);
+}
+
+static void gen_bcax(unsigned vece, uint32_t d, uint32_t n, uint32_t m,
+                     uint32_t a, uint32_t oprsz, uint32_t maxsz)
+{
+    static const GVecGen4 op = {
+        .fni8 = gen_bcax_i64,
+        .fniv = gen_bcax_vec,
+        .fno = gen_helper_sve2_bcax,
+        .vece = MO_64,
+        .prefer_i64 = TCG_TARGET_REG_BITS == 64,
+    };
+    tcg_gen_gvec_4(d, n, m, a, oprsz, maxsz, &op);
+}
+
+static bool trans_BCAX(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sve2_zzzz_fn(s, a, gen_bcax);
+}
+
+static void gen_bsl(unsigned vece, uint32_t d, uint32_t n, uint32_t m,
+                    uint32_t a, uint32_t oprsz, uint32_t maxsz)
+{
+    /* BSL differs from the generic bitsel in argument ordering. */
+    tcg_gen_gvec_bitsel(vece, d, a, n, m, oprsz, maxsz);
+}
+
+static bool trans_BSL(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sve2_zzzz_fn(s, a, gen_bsl);
+}
+
+static void gen_bsl1n_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, TCGv_i64 k)
+{
+    tcg_gen_andc_i64(n, k, n);
+    tcg_gen_andc_i64(m, m, k);
+    tcg_gen_or_i64(d, n, m);
+}
+
+static void gen_bsl1n_vec(unsigned vece, TCGv_vec d, TCGv_vec n,
+                          TCGv_vec m, TCGv_vec k)
+{
+    if (TCG_TARGET_HAS_bitsel_vec) {
+        tcg_gen_not_vec(vece, n, n);
+        tcg_gen_bitsel_vec(vece, d, k, n, m);
+    } else {
+        tcg_gen_andc_vec(vece, n, k, n);
+        tcg_gen_andc_vec(vece, m, m, k);
+        tcg_gen_or_vec(vece, d, n, m);
+    }
+}
+
+static void gen_bsl1n(unsigned vece, uint32_t d, uint32_t n, uint32_t m,
+                      uint32_t a, uint32_t oprsz, uint32_t maxsz)
+{
+    static const GVecGen4 op = {
+        .fni8 = gen_bsl1n_i64,
+        .fniv = gen_bsl1n_vec,
+        .fno = gen_helper_sve2_bsl1n,
+        .vece = MO_64,
+        .prefer_i64 = TCG_TARGET_REG_BITS == 64,
+    };
+    tcg_gen_gvec_4(d, n, m, a, oprsz, maxsz, &op);
+}
+
+static bool trans_BSL1N(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sve2_zzzz_fn(s, a, gen_bsl1n);
+}
+
+static void gen_bsl2n_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, TCGv_i64 k)
+{
+    /*
+     * Z[dn] = (n & k) | (~m & ~k)
+     *       =         | ~(m | k)
+     */
+    tcg_gen_and_i64(n, n, k);
+    if (TCG_TARGET_HAS_orc_i64) {
+        tcg_gen_or_i64(m, m, k);
+        tcg_gen_orc_i64(d, n, m);
+    } else {
+        tcg_gen_nor_i64(m, m, k);
+        tcg_gen_or_i64(d, n, m);
+    }
+}
+
+static void gen_bsl2n_vec(unsigned vece, TCGv_vec d, TCGv_vec n,
+                          TCGv_vec m, TCGv_vec k)
+{
+    if (TCG_TARGET_HAS_bitsel_vec) {
+        tcg_gen_not_vec(vece, m, m);
+        tcg_gen_bitsel_vec(vece, d, k, n, m);
+    } else {
+        tcg_gen_and_vec(vece, n, n, k);
+        tcg_gen_or_vec(vece, m, m, k);
+        tcg_gen_orc_vec(vece, d, n, m);
+    }
+}
+
+static void gen_bsl2n(unsigned vece, uint32_t d, uint32_t n, uint32_t m,
+                      uint32_t a, uint32_t oprsz, uint32_t maxsz)
+{
+    static const GVecGen4 op = {
+        .fni8 = gen_bsl2n_i64,
+        .fniv = gen_bsl2n_vec,
+        .fno = gen_helper_sve2_bsl2n,
+        .vece = MO_64,
+        .prefer_i64 = TCG_TARGET_REG_BITS == 64,
+    };
+    tcg_gen_gvec_4(d, n, m, a, oprsz, maxsz, &op);
+}
+
+static bool trans_BSL2N(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sve2_zzzz_fn(s, a, gen_bsl2n);
+}
+
+static void gen_nbsl_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, TCGv_i64 k)
+{
+    tcg_gen_and_i64(n, n, k);
+    tcg_gen_andc_i64(m, m, k);
+    tcg_gen_nor_i64(d, n, m);
+}
+
+static void gen_nbsl_vec(unsigned vece, TCGv_vec d, TCGv_vec n,
+                          TCGv_vec m, TCGv_vec k)
+{
+    tcg_gen_bitsel_vec(vece, d, k, n, m);
+    tcg_gen_not_vec(vece, d, d);
+}
+
+static void gen_nbsl(unsigned vece, uint32_t d, uint32_t n, uint32_t m,
+                     uint32_t a, uint32_t oprsz, uint32_t maxsz)
+{
+    static const GVecGen4 op = {
+        .fni8 = gen_nbsl_i64,
+        .fniv = gen_nbsl_vec,
+        .fno = gen_helper_sve2_nbsl,
+        .vece = MO_64,
+        .prefer_i64 = TCG_TARGET_REG_BITS == 64,
+    };
+    tcg_gen_gvec_4(d, n, m, a, oprsz, maxsz, &op);
+}
+
+static bool trans_NBSL(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sve2_zzzz_fn(s, a, gen_nbsl);
+}
+
 /*
  *** SVE Integer Arithmetic - Unpredicated Group
  */
-- 
2.25.1


