Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FAD56BCE4
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 17:27:39 +0200 (CEST)
Received: from localhost ([::1]:47982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9ptK-00070X-1u
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 11:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9piM-0002Je-Qv
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:16:18 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:46800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9piJ-00028f-Hc
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:16:18 -0400
Received: by mail-pl1-x635.google.com with SMTP id l12so11242826plk.13
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dcHardhOi3ouG3QD1ZaU/LIrZV5tMarYA0PaEYIlrzQ=;
 b=Kwr26iqkjCDtSmnm+ohn3gHMOyDhs7H0tYEA5l2ola5RLrJmRAj62eXplKATYlO+Mm
 vyld0L2tA622ErAF27HRjpnMZVV3Bmpt8exBkjP7uCbNX8aXQWXrKESJD3+UJC+l+kqj
 J1cGc8fmNoOqnIUf0fHG3o57/CEU/Nv8o9ElBaLPGnN2mvwH0hBP7FV0jDuWQvwmpD67
 79Tpyv72hU2xwOf3lbBneuucrpfU3DwqU9UajnwNP89RSBX9bv620n2gGwEWHo6XEK3n
 dzv80kzwM5HgAqy8wWhCrOSH00/R/zOMOOmXM1sknvrcG1+kISWUckbxvoYZS/zGqDt3
 nI3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dcHardhOi3ouG3QD1ZaU/LIrZV5tMarYA0PaEYIlrzQ=;
 b=Khl9REw/B3hv62dPcPq+amWvqVEyMAiY1u8Ha4VXqu16HJxl2TnwbuSpL2z7Lsioj4
 pTAmfmDoqo7ZdQZihFBB1o429VY6z8EO8R2W8jhTdotWvrKkvUc21GejXyKTPlPHqwQn
 ufEqN+9WNiW10DYdJ8MXjnIo3Z+0JxBdE5IRcOgs/BnCK1tv7qG0pXL46NMzNXYJEMQw
 cQtwOnxrvGCv9w5GZrzgxMxgRUIT3qynRDN94tj0BPxVYywrrqvUjjrfgePVuVP9NS98
 Gc1Iak9dBd22xRpxl2DbHBfLaBZ5d2gCPgIgAa59vRBfHTlPhazLH9qN6rRnRxOGmmui
 JTow==
X-Gm-Message-State: AJIora9B0MtXgxcrrCdM/fdX4bn3MdnfLebCCwlKd59/BuchU+E5ATVE
 bAdQv9fiXXiJAMG4pXOPXNm7vMQhKhBHcMXD
X-Google-Smtp-Source: AGRyM1ui1MhCX79xPfUtef6Y7Ni5xwcq5j8IwhJH/XPmgvgGU9WQntxlNi03AUry1bMNYd0ZTTl1uw==
X-Received: by 2002:a17:902:d2c8:b0:16c:58d:7278 with SMTP id
 n8-20020a170902d2c800b0016c058d7278mr4189287plc.45.1657293370509; 
 Fri, 08 Jul 2022 08:16:10 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:16:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 08/45] target/arm: Mark FTSMUL, FTMAD,
 FADDA as non-streaming
Date: Fri,  8 Jul 2022 20:45:03 +0530
Message-Id: <20220708151540.18136-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

Mark these as a non-streaming instructions, which should trap
if full a64 support is not enabled in streaming mode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sme-fa64.decode |  3 ---
 target/arm/translate-sve.c | 15 +++++++++++----
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index 4ff2df82e5..b5eaa2d0fa 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -59,9 +59,6 @@ FAIL    0001 1110 0111 1110 0000 00-- ---- ----   # FJCVTZS
 #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
 #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
 
-FAIL    0110 0101 --0- ---- 0000 11-- ---- ----   # FTSMUL
-FAIL    0110 0101 --01 0--- 100- ---- ---- ----   # FTMAD
-FAIL    0110 0101 --01 1--- 001- ---- ---- ----   # FADDA
 FAIL    0100 0101 --0- ---- 1001 10-- ---- ----   # SMMLA, UMMLA, USMMLA
 FAIL    0100 0101 --1- ---- 1--- ---- ---- ----   # SVE2 string/histo/crypto instructions
 FAIL    1000 010- -00- ---- 10-- ---- ---- ----   # SVE2 32-bit gather NT load (vector+scalar)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 4ff2102fc8..d5aad53923 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3861,9 +3861,9 @@ static gen_helper_gvec_3_ptr * const ftmad_fns[4] = {
     NULL,                   gen_helper_sve_ftmad_h,
     gen_helper_sve_ftmad_s, gen_helper_sve_ftmad_d,
 };
-TRANS_FEAT(FTMAD, aa64_sve, gen_gvec_fpst_zzz,
-           ftmad_fns[a->esz], a->rd, a->rn, a->rm, a->imm,
-           a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR)
+TRANS_FEAT_NONSTREAMING(FTMAD, aa64_sve, gen_gvec_fpst_zzz,
+                        ftmad_fns[a->esz], a->rd, a->rn, a->rm, a->imm,
+                        a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR)
 
 /*
  *** SVE Floating Point Accumulating Reduction Group
@@ -3886,6 +3886,7 @@ static bool trans_FADDA(DisasContext *s, arg_rprr_esz *a)
     if (a->esz == 0 || !dc_isar_feature(aa64_sve, s)) {
         return false;
     }
+    s->is_nonstreaming = true;
     if (!sve_access_check(s)) {
         return true;
     }
@@ -3923,12 +3924,18 @@ static bool trans_FADDA(DisasContext *s, arg_rprr_esz *a)
 DO_FP3(FADD_zzz, fadd)
 DO_FP3(FSUB_zzz, fsub)
 DO_FP3(FMUL_zzz, fmul)
-DO_FP3(FTSMUL, ftsmul)
 DO_FP3(FRECPS, recps)
 DO_FP3(FRSQRTS, rsqrts)
 
 #undef DO_FP3
 
+static gen_helper_gvec_3_ptr * const ftsmul_fns[4] = {
+    NULL,                     gen_helper_gvec_ftsmul_h,
+    gen_helper_gvec_ftsmul_s, gen_helper_gvec_ftsmul_d
+};
+TRANS_FEAT_NONSTREAMING(FTSMUL, aa64_sve, gen_gvec_fpst_arg_zzz,
+                        ftsmul_fns[a->esz], a, 0)
+
 /*
  *** SVE Floating Point Arithmetic - Predicated Group
  */
-- 
2.34.1


