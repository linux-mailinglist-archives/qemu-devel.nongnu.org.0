Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B39157053A
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 16:17:42 +0200 (CEST)
Received: from localhost ([::1]:49388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAuEH-0007d8-JS
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 10:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvQ-0006V5-Hx
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:12 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:43864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAtvE-0002om-DF
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:58:03 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 v10-20020a05600c15ca00b003a2db8aa2c4so3084813wmf.2
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 06:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=GiZFVh2F4B2LmzFGkdkJQAwP+jfXxKtCxSQAc8iRXro=;
 b=j30pUtSPxa2DbpiNdn77XHKOfc3EJxjy9jyWn/AogV2wmkpWvVKIh5Z/sKsUZMwv4u
 nbjvPxX+F2BrPuoL7MqhrQntSzlRl6znyjTyqaYMHNtLMG/Uh4jy/eULYqXZ/XwTIRtQ
 c2dNJ30AhuF8J5wr9HJZaOYW9yXJRlL7rxUaLnpwjLzif+cNHiabWnEFn6Oba+x7JSHQ
 T02W1theLx4RfW/QlVVgPF+BYxlsSYHmXA1lv+izctljsceWDPlYdQirXkNXRdeVc6f9
 VpKpKI9A1ZvKhjc6qtP38Ltf4BjLeFLFeV5Jk35+qR6NMdnih7S06L+PvWR7KvW3NwFO
 4Ppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GiZFVh2F4B2LmzFGkdkJQAwP+jfXxKtCxSQAc8iRXro=;
 b=eVLUM+m0TYWJJ6aj/PA2Kv7FnDL13vZjc+aCvdHlLHRIyLvwaGMDFL9StRM6Gdz8HO
 kWTT9j5NgY4PGoZtXu3Xval3mANp8o49s5zOIiWnXJ/FVNQe6mB+TbB9FG0Pcc+XoCzh
 2HPYlFXDqxIwNI1Pk2PWMsxBKYzW2khb/lQtAm4EHjVBe2w8fxnIPCBb2lvH/emYzbyk
 M855pfG1JLjXtT2+ZdUavcSQVE7f+ZP2SixYqozVJYxOAXrwHDcgkXVEIQDR+w7JwOCK
 G9ihqSRN7GjlBg9WBgKhYqcxlJR6oK3QcxQW9iUGli8gpfh/ESKoewQlK0T9XRmgUtf6
 AbeQ==
X-Gm-Message-State: AJIora8+T1GYwKCGAHGuKsJ4tGF6oYS2qUbOuQfQxFV3FSUfRZrWBLuL
 onxNrqitgng6NxHfmf9bg/U8i9LnAhNW/Q==
X-Google-Smtp-Source: AGRyM1tKe8Ft71maROcaEqkevJkcCcO2yeqZA3X+qPAF6C6o1WRlH6q0hyR2TWc3xwzMsPd4nDLcMQ==
X-Received: by 2002:a05:600c:42d3:b0:3a2:e7b8:8430 with SMTP id
 j19-20020a05600c42d300b003a2e7b88430mr6371019wme.42.1657547879118; 
 Mon, 11 Jul 2022 06:57:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q123-20020a1c4381000000b00397402ae674sm7595596wma.11.2022.07.11.06.57.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 06:57:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/45] target/arm: Mark FTSMUL, FTMAD, FADDA as non-streaming
Date: Mon, 11 Jul 2022 14:57:13 +0100
Message-Id: <20220711135750.765803-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711135750.765803-1-peter.maydell@linaro.org>
References: <20220711135750.765803-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

Mark these as a non-streaming instructions, which should trap
if full a64 support is not enabled in streaming mode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220708151540.18136-9-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sme-fa64.decode |  3 ---
 target/arm/translate-sve.c | 15 +++++++++++----
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index 4ff2df82e5b..b5eaa2d0faa 100644
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
index 4ff2102fc86..d5aad539235 100644
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
2.25.1


