Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E33E536709
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 20:44:22 +0200 (CEST)
Received: from localhost ([::1]:39638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuewe-00079Q-Va
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 14:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYQ-0006Iu-TA
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:18 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:51965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYN-0003W3-Ds
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:18 -0400
Received: by mail-pj1-x1029.google.com with SMTP id gk22so5286354pjb.1
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uDwAzExjoLYKbhCJdlBLTcmSOzHY6zRqEmzw+EtBO1A=;
 b=yRUsyT6c/RmWYn7hs+qzQ01w+okKDvwi3FcnrTQ6is1uvoK4tNzUQQqxCOqPx94ESm
 YbfZqThoPdB6QA/tYi/kvIRe4mvu4MCUUuIlHq6vqScytExBtg0BALexdCGy24oSwunt
 XrzrqYBsS0Eh3A3PT1J7C+X3IQYZ7lPEvWlEVBPH2p5KKaPONT6SPKjeOlUFjqNnvhFQ
 waZdDPFvu4EkUEY23U+mrB2p2iJ3GUBETXJ6FnwbX3rq9JZN/SRqiChW2sOvEY2v4FqM
 P4CA+AgSik2F1rIuIUxDlKugZFhRtDH86jdPBZq4es/9l0oJ/9JOEQJYbkF+51Y/6p6C
 fWIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uDwAzExjoLYKbhCJdlBLTcmSOzHY6zRqEmzw+EtBO1A=;
 b=qDD/t2OnzYd7yjYJ7rKFO+dmoQF0blWWw6Kj5QGh4gdHvdzIC+EKl/FYG1UlpzcTMW
 10KbuVF8rTgRmXvta07OTMCuGTo5P1veJfBJ/I8MA/k+hhSQfCMFjhJeTRSq0/EBuRV6
 aBFIpFK61Ajut0xn7S7gvusaiN58BuFuRY6KHetaMEBa6xCu0WL8CICmOTem5nL5xA0h
 yu8bgNUfStDBftE3TQfye/tn6Iuhg6LCW0hM/bEA0KiQiwAf9qZa4aUpOQvmspVIMfhs
 lbladJLkCAWRMUJZb5gJZkgivzcMtR7U94AroVIHRgzPKSuMDMeiLOcx0kYUOk9GJlDU
 CMWA==
X-Gm-Message-State: AOAM531mAHJvgIWNmu5d0C4F5u3RW788XDn6ZBjet5hQPT+T5gxriQGc
 9p+hZ1Nl+Tg5N+O/jr1bmWeDcK5HKAbwZg==
X-Google-Smtp-Source: ABdhPJzSg0FBS1Gh1G2fQJ18HlyT7NHjOvkLmxujFH+j4ZVoFABR3CSGFgxcjJlVXRH8fOoigjeuNQ==
X-Received: by 2002:a17:90a:2d8b:b0:1e0:c091:e862 with SMTP id
 p11-20020a17090a2d8b00b001e0c091e862mr9751860pjd.146.1653675553928; 
 Fri, 27 May 2022 11:19:13 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 005/114] target/arm: Introduce gen_gvec_ool_arg_zzz
Date: Fri, 27 May 2022 11:17:18 -0700
Message-Id: <20220527181907.189259-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

Use gen_gvec_ool_arg_zzz instead of gen_gvec_ool_zzz
when the arguments come from arg_rrr_esz.
Replaces do_zzw_ool and do_zzz_data_ool.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 48 +++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 27 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index fd1d749c0e..37343fb2f0 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -169,6 +169,12 @@ static bool gen_gvec_ool_zzz(DisasContext *s, gen_helper_gvec_3 *fn,
     return true;
 }
 
+static bool gen_gvec_ool_arg_zzz(DisasContext *s, gen_helper_gvec_3 *fn,
+                                 arg_rrr_esz *a, int data)
+{
+    return gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, data);
+}
+
 /* Invoke an out-of-line helper on 4 Zregs. */
 static void gen_gvec_ool_zzzz(DisasContext *s, gen_helper_gvec_4 *fn,
                               int rd, int rn, int rm, int ra, int data)
@@ -1177,11 +1183,6 @@ static bool trans_LSL_zzi(DisasContext *s, arg_rri_esz *a)
     return do_shift_imm(s, a, false, tcg_gen_gvec_shli);
 }
 
-static bool do_zzw_ool(DisasContext *s, arg_rrr_esz *a, gen_helper_gvec_3 *fn)
-{
-    return gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, 0);
-}
-
 #define DO_ZZW(NAME, name) \
 static bool trans_##NAME##_zzw(DisasContext *s, arg_rrr_esz *a)           \
 {                                                                         \
@@ -1189,7 +1190,7 @@ static bool trans_##NAME##_zzw(DisasContext *s, arg_rrr_esz *a)           \
         gen_helper_sve_##name##_zzw_b, gen_helper_sve_##name##_zzw_h,     \
         gen_helper_sve_##name##_zzw_s, NULL                               \
     };                                                                    \
-    return do_zzw_ool(s, a, fns[a->esz]);                                 \
+    return gen_gvec_ool_arg_zzz(s, fns[a->esz], a, 0);                    \
 }
 
 DO_ZZW(ASR, asr)
@@ -1387,7 +1388,7 @@ static bool trans_FTSSEL(DisasContext *s, arg_rrr_esz *a)
         gen_helper_sve_ftssel_s,
         gen_helper_sve_ftssel_d,
     };
-    return gen_gvec_ool_zzz(s, fns[a->esz], a->rd, a->rn, a->rm, 0);
+    return gen_gvec_ool_arg_zzz(s, fns[a->esz], a, 0);
 }
 
 /*
@@ -2417,7 +2418,7 @@ static bool trans_TBL(DisasContext *s, arg_rrr_esz *a)
         gen_helper_sve_tbl_b, gen_helper_sve_tbl_h,
         gen_helper_sve_tbl_s, gen_helper_sve_tbl_d
     };
-    return gen_gvec_ool_zzz(s, fns[a->esz], a->rd, a->rn, a->rm, 0);
+    return gen_gvec_ool_arg_zzz(s, fns[a->esz], a, 0);
 }
 
 static bool trans_TBL_sve2(DisasContext *s, arg_rrr_esz *a)
@@ -2447,7 +2448,7 @@ static bool trans_TBX(DisasContext *s, arg_rrr_esz *a)
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    return gen_gvec_ool_zzz(s, fns[a->esz], a->rd, a->rn, a->rm, 0);
+    return gen_gvec_ool_arg_zzz(s, fns[a->esz], a, 0);
 }
 
 static bool trans_UNPK(DisasContext *s, arg_UNPK *a)
@@ -2599,12 +2600,6 @@ static bool do_zip(DisasContext *s, arg_rrr_esz *a, bool high)
     return true;
 }
 
-static bool do_zzz_data_ool(DisasContext *s, arg_rrr_esz *a, int data,
-                            gen_helper_gvec_3 *fn)
-{
-    return gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, data);
-}
-
 static bool trans_ZIP1_z(DisasContext *s, arg_rrr_esz *a)
 {
     return do_zip(s, a, false);
@@ -2648,12 +2643,12 @@ static gen_helper_gvec_3 * const uzp_fns[4] = {
 
 static bool trans_UZP1_z(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_zzz_data_ool(s, a, 0, uzp_fns[a->esz]);
+    return gen_gvec_ool_arg_zzz(s, uzp_fns[a->esz], a, 0);
 }
 
 static bool trans_UZP2_z(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_zzz_data_ool(s, a, 1 << a->esz, uzp_fns[a->esz]);
+    return gen_gvec_ool_arg_zzz(s, uzp_fns[a->esz], a, 1 << a->esz);
 }
 
 static bool trans_UZP1_q(DisasContext *s, arg_rrr_esz *a)
@@ -2661,7 +2656,7 @@ static bool trans_UZP1_q(DisasContext *s, arg_rrr_esz *a)
     if (!dc_isar_feature(aa64_sve_f64mm, s)) {
         return false;
     }
-    return do_zzz_data_ool(s, a, 0, gen_helper_sve2_uzp_q);
+    return gen_gvec_ool_arg_zzz(s, gen_helper_sve2_uzp_q, a, 0);
 }
 
 static bool trans_UZP2_q(DisasContext *s, arg_rrr_esz *a)
@@ -2669,7 +2664,7 @@ static bool trans_UZP2_q(DisasContext *s, arg_rrr_esz *a)
     if (!dc_isar_feature(aa64_sve_f64mm, s)) {
         return false;
     }
-    return do_zzz_data_ool(s, a, 16, gen_helper_sve2_uzp_q);
+    return gen_gvec_ool_arg_zzz(s, gen_helper_sve2_uzp_q, a, 16);
 }
 
 static gen_helper_gvec_3 * const trn_fns[4] = {
@@ -2679,12 +2674,12 @@ static gen_helper_gvec_3 * const trn_fns[4] = {
 
 static bool trans_TRN1_z(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_zzz_data_ool(s, a, 0, trn_fns[a->esz]);
+    return gen_gvec_ool_arg_zzz(s, trn_fns[a->esz], a, 0);
 }
 
 static bool trans_TRN2_z(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_zzz_data_ool(s, a, 1 << a->esz, trn_fns[a->esz]);
+    return gen_gvec_ool_arg_zzz(s, trn_fns[a->esz], a, 1 << a->esz);
 }
 
 static bool trans_TRN1_q(DisasContext *s, arg_rrr_esz *a)
@@ -2692,7 +2687,7 @@ static bool trans_TRN1_q(DisasContext *s, arg_rrr_esz *a)
     if (!dc_isar_feature(aa64_sve_f64mm, s)) {
         return false;
     }
-    return do_zzz_data_ool(s, a, 0, gen_helper_sve2_trn_q);
+    return gen_gvec_ool_arg_zzz(s, gen_helper_sve2_trn_q, a, 0);
 }
 
 static bool trans_TRN2_q(DisasContext *s, arg_rrr_esz *a)
@@ -2700,7 +2695,7 @@ static bool trans_TRN2_q(DisasContext *s, arg_rrr_esz *a)
     if (!dc_isar_feature(aa64_sve_f64mm, s)) {
         return false;
     }
-    return do_zzz_data_ool(s, a, 16, gen_helper_sve2_trn_q);
+    return gen_gvec_ool_arg_zzz(s, gen_helper_sve2_trn_q, a, 16);
 }
 
 /*
@@ -6677,7 +6672,7 @@ static bool do_sve2_zzz_ool(DisasContext *s, arg_rrr_esz *a,
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    return gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, 0);
+    return gen_gvec_ool_arg_zzz(s, fn, a, 0);
 }
 
 static bool trans_SMULH_zzz(DisasContext *s, arg_rrr_esz *a)
@@ -8355,8 +8350,7 @@ static bool do_aese(DisasContext *s, arg_rrr_esz *a, bool decrypt)
     if (!dc_isar_feature(aa64_sve2_aes, s)) {
         return false;
     }
-    return gen_gvec_ool_zzz(s, gen_helper_crypto_aese,
-                            a->rd, a->rn, a->rm, decrypt);
+    return gen_gvec_ool_arg_zzz(s, gen_helper_crypto_aese, a, decrypt);
 }
 
 static bool trans_AESE(DisasContext *s, arg_rrr_esz *a)
@@ -8374,7 +8368,7 @@ static bool do_sm4(DisasContext *s, arg_rrr_esz *a, gen_helper_gvec_3 *fn)
     if (!dc_isar_feature(aa64_sve2_sm4, s)) {
         return false;
     }
-    return gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, 0);
+    return gen_gvec_ool_arg_zzz(s, fn, a, 0);
 }
 
 static bool trans_SM4E(DisasContext *s, arg_rrr_esz *a)
-- 
2.34.1


