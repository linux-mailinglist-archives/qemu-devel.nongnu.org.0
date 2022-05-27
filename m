Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 130FC5367EA
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 22:11:12 +0200 (CEST)
Received: from localhost ([::1]:48298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nugIh-00037I-0h
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 16:11:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefW-0001jE-Dl
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:38 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:40627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefT-0005Kk-6c
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:37 -0400
Received: by mail-pg1-x52a.google.com with SMTP id x12so4567366pgj.7
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=raHQbqzS3SPQ0s3aNLkfpyxLHIpS0txyantVzv7wE6E=;
 b=BTiNtkfBo+tL7vIuSo3uYZ0oqZ9WLFIDyCwrWdanTeQcnyfBDxrX+NQ7hL2+mdMWot
 IZU3pBSvqkZJYEn3WbxFiOgx7mWS83+atiVQ+G7UqP486rqUdTBwYN6NQYz+7EsxUfgT
 hmCPKlm1DrlSFPOa6O3LiGgETe601jg5c4iGnGJUNaXbQ4BKyoBUwVt/BuofwQ8nOVgD
 //Aepg4Cl1M9js1FehfR+eTnhRMdKK4Pt09fOC25nfzFoTqTrDqxtWLG8APJ7Xkx+3se
 UR5PvtQIZb/dK2UmHg0IgKBXptsTdho50hBQxNz2FPeUi9YfTT5drk5m2rH6P1zaaPiA
 chqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=raHQbqzS3SPQ0s3aNLkfpyxLHIpS0txyantVzv7wE6E=;
 b=mcbDfUKw6CtKfuTKPg4c6XD6awzGkyhahQ27wAfz4odwsorNcCUh7ifA2oxq+gTvIi
 Q7tCz4gud8ObG3H37Bg5y/9ckjgirQSK1wa3mzhtgmymY9D+O2Sk78fKyttjdoATid2p
 mmoEzjoWDyFXWKRtimVoz15wrg1v3x1OU6QPkcPKsCEkPIwTJ6jLD21zbo48zScYdbR8
 OEXaGrWW2+zNlCX9ZcdR4gS7HkiSfbw9mz0XY+TmVPtZq+gKjJAdRQWBI4o5Iau3JbS0
 5wj/Y2G3kVLPDi8G4SpAGYykdbkqdU5XMxcGLkG/53n11dcHVCStSWYQtIxsVsjP/cla
 NR/A==
X-Gm-Message-State: AOAM532f8Spr57ZVVgcdsfyftBPxcwV9AiLRXVXKLSND5cN0/KQ7G65O
 35HBmSObs++aOSXD7Kwk5+vcBKgYpa0KBA==
X-Google-Smtp-Source: ABdhPJzuXCoNvi0MbmCplUX433FKQ6ZgbmDDQGEKl0qj5QIe5QX3Lr8p5afvgC4Q6+Snr5Fl56uRlQ==
X-Received: by 2002:a65:6cc9:0:b0:399:26da:29af with SMTP id
 g9-20020a656cc9000000b0039926da29afmr38112574pgw.489.1653675993792; 
 Fri, 27 May 2022 11:26:33 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 091/114] target/arm: Use TRANS_FEAT for FRECPE, FRSQRTE
Date: Fri, 27 May 2022 11:18:44 -0700
Message-Id: <20220527181907.189259-92-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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

Rename do_zz_fp to gen_gvec_fpst_arg_zz, and move up.
Split out gen_gvec_fpst_zz as a helper while we're at it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 77 ++++++++++++++++++--------------------
 1 file changed, 36 insertions(+), 41 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 4a9ecd5e72..2f7651249a 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -152,6 +152,32 @@ static bool gen_gvec_ool_zz(DisasContext *s, gen_helper_gvec_2 *fn,
     return true;
 }
 
+static bool gen_gvec_fpst_zz(DisasContext *s, gen_helper_gvec_2_ptr *fn,
+                             int rd, int rn, int data,
+                             ARMFPStatusFlavour flavour)
+{
+    if (fn == NULL) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        TCGv_ptr status = fpstatus_ptr(flavour);
+
+        tcg_gen_gvec_2_ptr(vec_full_reg_offset(s, rd),
+                           vec_full_reg_offset(s, rn),
+                           status, vsz, vsz, data, fn);
+        tcg_temp_free_ptr(status);
+    }
+    return true;
+}
+
+static bool gen_gvec_fpst_arg_zz(DisasContext *s, gen_helper_gvec_2_ptr *fn,
+                                 arg_rr_esz *a, int data)
+{
+    return gen_gvec_fpst_zz(s, fn, a->rd, a->rn, data,
+                            a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
+}
+
 /* Invoke an out-of-line helper on 3 Zregs. */
 static bool gen_gvec_ool_zzz(DisasContext *s, gen_helper_gvec_3 *fn,
                              int rd, int rn, int rm, int data)
@@ -3627,48 +3653,17 @@ DO_VPZ(FMAXV, fmaxv)
  *** SVE Floating Point Unary Operations - Unpredicated Group
  */
 
-static void do_zz_fp(DisasContext *s, arg_rr_esz *a, gen_helper_gvec_2_ptr *fn)
-{
-    unsigned vsz = vec_full_reg_size(s);
-    TCGv_ptr status = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
+static gen_helper_gvec_2_ptr * const frecpe_fns[] = {
+    NULL,                     gen_helper_gvec_frecpe_h,
+    gen_helper_gvec_frecpe_s, gen_helper_gvec_frecpe_d,
+};
+TRANS_FEAT(FRECPE, aa64_sve, gen_gvec_fpst_arg_zz, frecpe_fns[a->esz], a, 0)
 
-    tcg_gen_gvec_2_ptr(vec_full_reg_offset(s, a->rd),
-                       vec_full_reg_offset(s, a->rn),
-                       status, vsz, vsz, 0, fn);
-    tcg_temp_free_ptr(status);
-}
-
-static bool trans_FRECPE(DisasContext *s, arg_rr_esz *a)
-{
-    static gen_helper_gvec_2_ptr * const fns[3] = {
-        gen_helper_gvec_frecpe_h,
-        gen_helper_gvec_frecpe_s,
-        gen_helper_gvec_frecpe_d,
-    };
-    if (a->esz == 0) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        do_zz_fp(s, a, fns[a->esz - 1]);
-    }
-    return true;
-}
-
-static bool trans_FRSQRTE(DisasContext *s, arg_rr_esz *a)
-{
-    static gen_helper_gvec_2_ptr * const fns[3] = {
-        gen_helper_gvec_frsqrte_h,
-        gen_helper_gvec_frsqrte_s,
-        gen_helper_gvec_frsqrte_d,
-    };
-    if (a->esz == 0) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        do_zz_fp(s, a, fns[a->esz - 1]);
-    }
-    return true;
-}
+static gen_helper_gvec_2_ptr * const frsqrte_fns[] = {
+    NULL,                      gen_helper_gvec_frsqrte_h,
+    gen_helper_gvec_frsqrte_s, gen_helper_gvec_frsqrte_d,
+};
+TRANS_FEAT(FRSQRTE, aa64_sve, gen_gvec_fpst_arg_zz, frsqrte_fns[a->esz], a, 0)
 
 /*
  *** SVE Floating Point Compare with Zero Group
-- 
2.34.1


