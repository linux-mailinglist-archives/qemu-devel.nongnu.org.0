Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3547838F783
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 03:26:21 +0200 (CEST)
Received: from localhost ([::1]:37578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llLpn-0007xj-32
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 21:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLV1-00020D-Ub
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:04:47 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:34553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUX-0001py-FH
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:04:47 -0400
Received: by mail-pg1-x531.google.com with SMTP id l70so21412748pga.1
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/gvHZOzTj+xrZjcBXR64cEcKDu6e++bnkbmWseU6CSo=;
 b=CoJ7ofIyzW+xe7CmsIEOlEMaDl5ncxXEReQDcPZOLCcVoo6teXbZCEQ7iM2rAeprKc
 omZA+dMBVe2FNQmbsNkA2BHZBcywCGgTGXtOoiCx/sJnb5XEHA3juXkWMIfqV9Rhc2eT
 WJ5ouHlrzH7QuQ4uHksaeeT9bmz4NJH5ImfeB43nnU59t2ItrWd3g/wfOIRf+dKqrOPz
 ClRYtNHp25X2824HbVKPTgPobrSQ7/uf+d8KABdBGPPIZ8uf/3aE0eulxfvK2Jco5MMR
 8wtq/tsqSExlTWitkRYbd5Iuf8jQDyvW5fE7puLKsEAlMhpcM3oTIqWkLCZ7xjW/8pZL
 jy4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/gvHZOzTj+xrZjcBXR64cEcKDu6e++bnkbmWseU6CSo=;
 b=H6XtSL+t/xITZYCXW/InzaaCj9WjfqLMGIy5KeswGmG4OB+xXhWkT9iH6DoKJYSGMp
 xDB3CFE0U/J3IAZaZKS1ko5HgGzRHkca4lwTkksRt2+GQ5vOHe+1KjisN+C4sE4Pov9H
 vwVN46yYY2HT+hmTxza0gvCMLFcu57xXiB53m6+J6u3xaJRe9S7w6CUe2bkz/MXQVl59
 9tknXrAZU93NteUpTjjdiwaqEg3c6CsHEymtq815StReI0/rhKCTvN38k8AnuZN6DPgl
 LKsc0sN8Ex/u2NjM6ViJY2pTOQRjtgASJMbU+iGwLMB3tVeNVv8nDh84iWDK4Cndt6bN
 gdOg==
X-Gm-Message-State: AOAM532EIvO9DMBqnS+3F9vG/Q2Rd+cRtjshzI+go16387290C9+z20K
 0wxxm0ESAF5Yy/mjgwZBCdPH72GT5FpBlA==
X-Google-Smtp-Source: ABdhPJxTNKQtLGXHWbXYVcGQW0KjCsW9fn0vX1bXqsFhtsvDkPQzH6OctNaJOgC9eePb9/5Za3tqgg==
X-Received: by 2002:a63:7158:: with SMTP id b24mr16175334pgn.310.1621904656127; 
 Mon, 24 May 2021 18:04:16 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b1sm13742645pgf.84.2021.05.24.18.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:04:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 27/92] target/arm: Implement SVE2 SQSHRUN, SQRSHRUN
Date: Mon, 24 May 2021 18:02:53 -0700
Message-Id: <20210525010358.152808-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
 target/arm/helper-sve.h    | 16 +++++++
 target/arm/sve.decode      |  4 ++
 target/arm/sve_helper.c    | 35 ++++++++++++++
 target/arm/translate-sve.c | 98 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 153 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 2b2ebea631..2e80d9d27b 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2460,6 +2460,22 @@ DEF_HELPER_FLAGS_3(sve2_rshrnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_rshrnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_rshrnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_3(sve2_sqshrunb_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqshrunb_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqshrunb_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_sqshrunt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqshrunt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqshrunt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_sqrshrunb_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqrshrunb_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqrshrunb_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_sqrshrunt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqrshrunt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_sqrshrunt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_s, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 169486ecb2..18faa900ca 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1288,6 +1288,10 @@ SQXTUNT         01000101 .. 1 ..... 010 101 ..... .....  @rd_rn_tszimm_shl
 ## SVE2 bitwise shift right narrow
 
 # Bit 23 == 0 is handled by esz > 0 in the translator.
+SQSHRUNB        01000101 .. 1 ..... 00 0000 ..... .....  @rd_rn_tszimm_shr
+SQSHRUNT        01000101 .. 1 ..... 00 0001 ..... .....  @rd_rn_tszimm_shr
+SQRSHRUNB       01000101 .. 1 ..... 00 0010 ..... .....  @rd_rn_tszimm_shr
+SQRSHRUNT       01000101 .. 1 ..... 00 0011 ..... .....  @rd_rn_tszimm_shr
 SHRNB           01000101 .. 1 ..... 00 0100 ..... .....  @rd_rn_tszimm_shr
 SHRNT           01000101 .. 1 ..... 00 0101 ..... .....  @rd_rn_tszimm_shr
 RSHRNB          01000101 .. 1 ..... 00 0110 ..... .....  @rd_rn_tszimm_shr
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 8fd61e37f9..b304ca19e8 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1879,6 +1879,16 @@ static inline uint64_t do_urshr(uint64_t x, unsigned sh)
     }
 }
 
+static inline int64_t do_srshr(int64_t x, unsigned sh)
+{
+    if (likely(sh < 64)) {
+        return (x >> sh) + ((x >> (sh - 1)) & 1);
+    } else {
+        /* Rounding the sign bit always produces 0. */
+        return 0;
+    }
+}
+
 DO_ZPZI(sve_asr_zpzi_b, int8_t, H1, DO_SHR)
 DO_ZPZI(sve_asr_zpzi_h, int16_t, H1_2, DO_SHR)
 DO_ZPZI(sve_asr_zpzi_s, int32_t, H1_4, DO_SHR)
@@ -1941,6 +1951,31 @@ DO_SHRNT(sve2_rshrnt_h, uint16_t, uint8_t, H1_2, H1, do_urshr)
 DO_SHRNT(sve2_rshrnt_s, uint32_t, uint16_t, H1_4, H1_2, do_urshr)
 DO_SHRNT(sve2_rshrnt_d, uint64_t, uint32_t,     , H1_4, do_urshr)
 
+#define DO_SQSHRUN_H(x, sh) do_sat_bhs((int64_t)(x) >> sh, 0, UINT8_MAX)
+#define DO_SQSHRUN_S(x, sh) do_sat_bhs((int64_t)(x) >> sh, 0, UINT16_MAX)
+#define DO_SQSHRUN_D(x, sh) \
+    do_sat_bhs((int64_t)(x) >> (sh < 64 ? sh : 63), 0, UINT32_MAX)
+
+DO_SHRNB(sve2_sqshrunb_h, int16_t, uint8_t, DO_SQSHRUN_H)
+DO_SHRNB(sve2_sqshrunb_s, int32_t, uint16_t, DO_SQSHRUN_S)
+DO_SHRNB(sve2_sqshrunb_d, int64_t, uint32_t, DO_SQSHRUN_D)
+
+DO_SHRNT(sve2_sqshrunt_h, int16_t, uint8_t, H1_2, H1, DO_SQSHRUN_H)
+DO_SHRNT(sve2_sqshrunt_s, int32_t, uint16_t, H1_4, H1_2, DO_SQSHRUN_S)
+DO_SHRNT(sve2_sqshrunt_d, int64_t, uint32_t,     , H1_4, DO_SQSHRUN_D)
+
+#define DO_SQRSHRUN_H(x, sh) do_sat_bhs(do_srshr(x, sh), 0, UINT8_MAX)
+#define DO_SQRSHRUN_S(x, sh) do_sat_bhs(do_srshr(x, sh), 0, UINT16_MAX)
+#define DO_SQRSHRUN_D(x, sh) do_sat_bhs(do_srshr(x, sh), 0, UINT32_MAX)
+
+DO_SHRNB(sve2_sqrshrunb_h, int16_t, uint8_t, DO_SQRSHRUN_H)
+DO_SHRNB(sve2_sqrshrunb_s, int32_t, uint16_t, DO_SQRSHRUN_S)
+DO_SHRNB(sve2_sqrshrunb_d, int64_t, uint32_t, DO_SQRSHRUN_D)
+
+DO_SHRNT(sve2_sqrshrunt_h, int16_t, uint8_t, H1_2, H1, DO_SQRSHRUN_H)
+DO_SHRNT(sve2_sqrshrunt_s, int32_t, uint16_t, H1_4, H1_2, DO_SQRSHRUN_S)
+DO_SHRNT(sve2_sqrshrunt_d, int64_t, uint32_t,     , H1_4, DO_SQRSHRUN_D)
+
 #undef DO_SHRNB
 #undef DO_SHRNT
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index e072f8a2cf..36986b6e87 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6858,6 +6858,104 @@ static bool trans_RSHRNT(DisasContext *s, arg_rri_esz *a)
     return do_sve2_shr_narrow(s, a, ops);
 }
 
+static void gen_sqshrunb_vec(unsigned vece, TCGv_vec d,
+                             TCGv_vec n, int64_t shr)
+{
+    TCGv_vec t = tcg_temp_new_vec_matching(d);
+    int halfbits = 4 << vece;
+
+    tcg_gen_sari_vec(vece, n, n, shr);
+    tcg_gen_dupi_vec(vece, t, 0);
+    tcg_gen_smax_vec(vece, n, n, t);
+    tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(0, halfbits));
+    tcg_gen_umin_vec(vece, d, n, t);
+    tcg_temp_free_vec(t);
+}
+
+static bool trans_SQSHRUNB(DisasContext *s, arg_rri_esz *a)
+{
+    static const TCGOpcode vec_list[] = {
+        INDEX_op_sari_vec, INDEX_op_smax_vec, INDEX_op_umin_vec, 0
+    };
+    static const GVecGen2i ops[3] = {
+        { .fniv = gen_sqshrunb_vec,
+          .opt_opc = vec_list,
+          .fno = gen_helper_sve2_sqshrunb_h,
+          .vece = MO_16 },
+        { .fniv = gen_sqshrunb_vec,
+          .opt_opc = vec_list,
+          .fno = gen_helper_sve2_sqshrunb_s,
+          .vece = MO_32 },
+        { .fniv = gen_sqshrunb_vec,
+          .opt_opc = vec_list,
+          .fno = gen_helper_sve2_sqshrunb_d,
+          .vece = MO_64 },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
+static void gen_sqshrunt_vec(unsigned vece, TCGv_vec d,
+                             TCGv_vec n, int64_t shr)
+{
+    TCGv_vec t = tcg_temp_new_vec_matching(d);
+    int halfbits = 4 << vece;
+
+    tcg_gen_sari_vec(vece, n, n, shr);
+    tcg_gen_dupi_vec(vece, t, 0);
+    tcg_gen_smax_vec(vece, n, n, t);
+    tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(0, halfbits));
+    tcg_gen_umin_vec(vece, n, n, t);
+    tcg_gen_shli_vec(vece, n, n, halfbits);
+    tcg_gen_bitsel_vec(vece, d, t, d, n);
+    tcg_temp_free_vec(t);
+}
+
+static bool trans_SQSHRUNT(DisasContext *s, arg_rri_esz *a)
+{
+    static const TCGOpcode vec_list[] = {
+        INDEX_op_shli_vec, INDEX_op_sari_vec,
+        INDEX_op_smax_vec, INDEX_op_umin_vec, 0
+    };
+    static const GVecGen2i ops[3] = {
+        { .fniv = gen_sqshrunt_vec,
+          .opt_opc = vec_list,
+          .load_dest = true,
+          .fno = gen_helper_sve2_sqshrunt_h,
+          .vece = MO_16 },
+        { .fniv = gen_sqshrunt_vec,
+          .opt_opc = vec_list,
+          .load_dest = true,
+          .fno = gen_helper_sve2_sqshrunt_s,
+          .vece = MO_32 },
+        { .fniv = gen_sqshrunt_vec,
+          .opt_opc = vec_list,
+          .load_dest = true,
+          .fno = gen_helper_sve2_sqshrunt_d,
+          .vece = MO_64 },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
+static bool trans_SQRSHRUNB(DisasContext *s, arg_rri_esz *a)
+{
+    static const GVecGen2i ops[3] = {
+        { .fno = gen_helper_sve2_sqrshrunb_h },
+        { .fno = gen_helper_sve2_sqrshrunb_s },
+        { .fno = gen_helper_sve2_sqrshrunb_d },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
+static bool trans_SQRSHRUNT(DisasContext *s, arg_rri_esz *a)
+{
+    static const GVecGen2i ops[3] = {
+        { .fno = gen_helper_sve2_sqrshrunt_h },
+        { .fno = gen_helper_sve2_sqrshrunt_s },
+        { .fno = gen_helper_sve2_sqrshrunt_d },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
 static bool do_sve2_zpzz_fp(DisasContext *s, arg_rprr_esz *a,
                             gen_helper_gvec_4_ptr *fn)
 {
-- 
2.25.1


