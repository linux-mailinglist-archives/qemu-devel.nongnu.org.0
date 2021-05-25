Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B2139052E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:22:56 +0200 (CEST)
Received: from localhost ([::1]:57872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llYtT-0003QY-8t
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:22:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbX-0003VY-NM
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:26 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:53787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbN-0004Qs-1N
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:22 -0400
Received: by mail-wm1-x331.google.com with SMTP id h3so4187408wmq.3
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=EgFyTZ4jiPOewbfLdfGGpgr1YkXUM0655quieQDqxL0=;
 b=qwpgtcHBxL6GL5WHjCqJCoj54uJyE/dGp4uGhWN5Y9Mpz28VV8MU9ViiJyzOJTb+d2
 iMxQov2YGBtnhcxP12+1etZAePbgNElDlnmfaXRGc3S1hUKcpwih9GkN21pgH5GMC6tU
 xE2/yhFf0lk6xovJ2ZVKsRgevZFoSZbW2zFeWux9iDM2WXGaiFWH3T53qQEntxNZacIY
 o9KEue2tLzHLFHeSwsm2qfD577gSIxhZVg9eJt97Zv7sTXNEDm1Dw/Er+IV218/e1/qN
 cBUmfATqt/h7ez+h4a191jByHrcUqJU6MyAPyo4j017z5X310+8ejbEaHo+rRlOzJrTG
 GlDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EgFyTZ4jiPOewbfLdfGGpgr1YkXUM0655quieQDqxL0=;
 b=aPp0O1tZoHFT92axNdRgPfo8e86KTTt8EqOSzW34GUB6CHOL7cF0fpNUIthlmrtApp
 TxAy4g+4R6rZoMTj8VZhLGKQv/TNIElgMqOCT+Qm/Mkc6fMB1lFmBnYWzglBuw1B5G2e
 3FNl1UGH2Kb10AEmgQ63Mp7o5kFVh06jTJPT1haIIOKil6qg82dEBPzuHHbZ46y2AZZI
 0vrMv26salEdbDuw/VyeP2M9Dg+0WBsVcAdghkQ17GcqMj/sVlkcMeyClY8e5HiFHnsX
 c0icdDKKMAdHBVZprNBR52WOQX1OTte5kAAJ4BhKjer39n5PQyTJJS4ved9FHBjstNNf
 Ztsw==
X-Gm-Message-State: AOAM530pKGfLt/q0uQlduN1HAF/6o1UHksJ2kROoNA77dYm2Su5qMOU8
 abxEvEAXORlEX9bRkYEdmdKTm6AWU7TiNQmc
X-Google-Smtp-Source: ABdhPJywLTMuqjBoiBhPQh5mC+RCCGJOHNiWMC9qW79yOkpYxQmS9ZK5/QmoiuJRJ0cSKjX/JIsdzg==
X-Received: by 2002:a7b:c4c5:: with SMTP id g5mr4286110wmk.184.1621955051623; 
 Tue, 25 May 2021 08:04:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.04.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:04:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 050/114] target/arm: Implement SVE2 UQSHRN, UQRSHRN
Date: Tue, 25 May 2021 16:02:20 +0100
Message-Id: <20210525150324.32370-51-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-29-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-sve.h    | 16 +++++++
 target/arm/sve.decode      |  4 ++
 target/arm/sve_helper.c    | 24 ++++++++++
 target/arm/translate-sve.c | 93 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 137 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 2e80d9d27bd..ba6a24fc8b5 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2476,6 +2476,22 @@ DEF_HELPER_FLAGS_3(sve2_sqrshrunt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_sqrshrunt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_sqrshrunt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_3(sve2_uqshrnb_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_uqshrnb_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_uqshrnb_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_uqshrnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_uqshrnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_uqshrnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_uqrshrnb_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_uqrshrnb_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_uqrshrnb_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve2_uqrshrnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_uqrshrnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve2_uqrshrnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_s, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 18faa900ca1..13b5da08561 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1296,6 +1296,10 @@ SHRNB           01000101 .. 1 ..... 00 0100 ..... .....  @rd_rn_tszimm_shr
 SHRNT           01000101 .. 1 ..... 00 0101 ..... .....  @rd_rn_tszimm_shr
 RSHRNB          01000101 .. 1 ..... 00 0110 ..... .....  @rd_rn_tszimm_shr
 RSHRNT          01000101 .. 1 ..... 00 0111 ..... .....  @rd_rn_tszimm_shr
+UQSHRNB         01000101 .. 1 ..... 00 1100 ..... .....  @rd_rn_tszimm_shr
+UQSHRNT         01000101 .. 1 ..... 00 1101 ..... .....  @rd_rn_tszimm_shr
+UQRSHRNB        01000101 .. 1 ..... 00 1110 ..... .....  @rd_rn_tszimm_shr
+UQRSHRNT        01000101 .. 1 ..... 00 1111 ..... .....  @rd_rn_tszimm_shr
 
 ## SVE2 floating-point pairwise operations
 
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index b304ca19e88..89262149f9b 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1976,6 +1976,30 @@ DO_SHRNT(sve2_sqrshrunt_h, int16_t, uint8_t, H1_2, H1, DO_SQRSHRUN_H)
 DO_SHRNT(sve2_sqrshrunt_s, int32_t, uint16_t, H1_4, H1_2, DO_SQRSHRUN_S)
 DO_SHRNT(sve2_sqrshrunt_d, int64_t, uint32_t,     , H1_4, DO_SQRSHRUN_D)
 
+#define DO_UQSHRN_H(x, sh) MIN(x >> sh, UINT8_MAX)
+#define DO_UQSHRN_S(x, sh) MIN(x >> sh, UINT16_MAX)
+#define DO_UQSHRN_D(x, sh) MIN(x >> sh, UINT32_MAX)
+
+DO_SHRNB(sve2_uqshrnb_h, uint16_t, uint8_t, DO_UQSHRN_H)
+DO_SHRNB(sve2_uqshrnb_s, uint32_t, uint16_t, DO_UQSHRN_S)
+DO_SHRNB(sve2_uqshrnb_d, uint64_t, uint32_t, DO_UQSHRN_D)
+
+DO_SHRNT(sve2_uqshrnt_h, uint16_t, uint8_t, H1_2, H1, DO_UQSHRN_H)
+DO_SHRNT(sve2_uqshrnt_s, uint32_t, uint16_t, H1_4, H1_2, DO_UQSHRN_S)
+DO_SHRNT(sve2_uqshrnt_d, uint64_t, uint32_t,     , H1_4, DO_UQSHRN_D)
+
+#define DO_UQRSHRN_H(x, sh) MIN(do_urshr(x, sh), UINT8_MAX)
+#define DO_UQRSHRN_S(x, sh) MIN(do_urshr(x, sh), UINT16_MAX)
+#define DO_UQRSHRN_D(x, sh) MIN(do_urshr(x, sh), UINT32_MAX)
+
+DO_SHRNB(sve2_uqrshrnb_h, uint16_t, uint8_t, DO_UQRSHRN_H)
+DO_SHRNB(sve2_uqrshrnb_s, uint32_t, uint16_t, DO_UQRSHRN_S)
+DO_SHRNB(sve2_uqrshrnb_d, uint64_t, uint32_t, DO_UQRSHRN_D)
+
+DO_SHRNT(sve2_uqrshrnt_h, uint16_t, uint8_t, H1_2, H1, DO_UQRSHRN_H)
+DO_SHRNT(sve2_uqrshrnt_s, uint32_t, uint16_t, H1_4, H1_2, DO_UQRSHRN_S)
+DO_SHRNT(sve2_uqrshrnt_d, uint64_t, uint32_t,     , H1_4, DO_UQRSHRN_D)
+
 #undef DO_SHRNB
 #undef DO_SHRNT
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 36986b6e879..e5c71005c82 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6956,6 +6956,99 @@ static bool trans_SQRSHRUNT(DisasContext *s, arg_rri_esz *a)
     return do_sve2_shr_narrow(s, a, ops);
 }
 
+static void gen_uqshrnb_vec(unsigned vece, TCGv_vec d,
+                            TCGv_vec n, int64_t shr)
+{
+    TCGv_vec t = tcg_temp_new_vec_matching(d);
+    int halfbits = 4 << vece;
+
+    tcg_gen_shri_vec(vece, n, n, shr);
+    tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(0, halfbits));
+    tcg_gen_umin_vec(vece, d, n, t);
+    tcg_temp_free_vec(t);
+}
+
+static bool trans_UQSHRNB(DisasContext *s, arg_rri_esz *a)
+{
+    static const TCGOpcode vec_list[] = {
+        INDEX_op_shri_vec, INDEX_op_umin_vec, 0
+    };
+    static const GVecGen2i ops[3] = {
+        { .fniv = gen_uqshrnb_vec,
+          .opt_opc = vec_list,
+          .fno = gen_helper_sve2_uqshrnb_h,
+          .vece = MO_16 },
+        { .fniv = gen_uqshrnb_vec,
+          .opt_opc = vec_list,
+          .fno = gen_helper_sve2_uqshrnb_s,
+          .vece = MO_32 },
+        { .fniv = gen_uqshrnb_vec,
+          .opt_opc = vec_list,
+          .fno = gen_helper_sve2_uqshrnb_d,
+          .vece = MO_64 },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
+static void gen_uqshrnt_vec(unsigned vece, TCGv_vec d,
+                            TCGv_vec n, int64_t shr)
+{
+    TCGv_vec t = tcg_temp_new_vec_matching(d);
+    int halfbits = 4 << vece;
+
+    tcg_gen_shri_vec(vece, n, n, shr);
+    tcg_gen_dupi_vec(vece, t, MAKE_64BIT_MASK(0, halfbits));
+    tcg_gen_umin_vec(vece, n, n, t);
+    tcg_gen_shli_vec(vece, n, n, halfbits);
+    tcg_gen_bitsel_vec(vece, d, t, d, n);
+    tcg_temp_free_vec(t);
+}
+
+static bool trans_UQSHRNT(DisasContext *s, arg_rri_esz *a)
+{
+    static const TCGOpcode vec_list[] = {
+        INDEX_op_shli_vec, INDEX_op_shri_vec, INDEX_op_umin_vec, 0
+    };
+    static const GVecGen2i ops[3] = {
+        { .fniv = gen_uqshrnt_vec,
+          .opt_opc = vec_list,
+          .load_dest = true,
+          .fno = gen_helper_sve2_uqshrnt_h,
+          .vece = MO_16 },
+        { .fniv = gen_uqshrnt_vec,
+          .opt_opc = vec_list,
+          .load_dest = true,
+          .fno = gen_helper_sve2_uqshrnt_s,
+          .vece = MO_32 },
+        { .fniv = gen_uqshrnt_vec,
+          .opt_opc = vec_list,
+          .load_dest = true,
+          .fno = gen_helper_sve2_uqshrnt_d,
+          .vece = MO_64 },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
+static bool trans_UQRSHRNB(DisasContext *s, arg_rri_esz *a)
+{
+    static const GVecGen2i ops[3] = {
+        { .fno = gen_helper_sve2_uqrshrnb_h },
+        { .fno = gen_helper_sve2_uqrshrnb_s },
+        { .fno = gen_helper_sve2_uqrshrnb_d },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
+static bool trans_UQRSHRNT(DisasContext *s, arg_rri_esz *a)
+{
+    static const GVecGen2i ops[3] = {
+        { .fno = gen_helper_sve2_uqrshrnt_h },
+        { .fno = gen_helper_sve2_uqrshrnt_s },
+        { .fno = gen_helper_sve2_uqrshrnt_d },
+    };
+    return do_sve2_shr_narrow(s, a, ops);
+}
+
 static bool do_sve2_zpzz_fp(DisasContext *s, arg_rprr_esz *a,
                             gen_helper_gvec_4_ptr *fn)
 {
-- 
2.20.1


