Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A03D72FBB80
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:45:06 +0100 (CET)
Received: from localhost ([::1]:57206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1tBp-00058T-MJ
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:45:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfM-0007us-Ng
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:32 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:43629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfJ-0001Jd-KC
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:32 -0500
Received: by mail-wr1-x430.google.com with SMTP id y17so20080071wrr.10
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=42Yv6SyutgZ6b4Fu7DW0GYfuMxkX1sEAdvIHjryFiMo=;
 b=LnaNFPgA1N+5BoOMasc4YR6Nt4k+4JKnliIU1lCR6Ffd53bAGswISGgLoHPek1cTNM
 Ve5heFM5E0oktuySrBOZCWlNBlf/Zt909swU+cBMi6cyci5iWSJ+KYoE7zDNJ4f6M7ta
 ryoYUkcQAfkZV6jNFf4wyFTm5kUPXuoWNP7Lj0CHSB/AhzV8niQinkLIkqm7DzunIxfe
 qkyUDnHhDXc7V4BkBoOmrQpcHDjgMgvNXkDYFIKdiDL8WSnNF/gLvpLVCB199yjYbqPb
 QQgyqFW8NfGq7J9x9lNwCdR56hXbQ/q+Y73thAOnulgYk/YXhSIhZEaZEz17p3yiLAAD
 mcUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=42Yv6SyutgZ6b4Fu7DW0GYfuMxkX1sEAdvIHjryFiMo=;
 b=AYzLu2tifHhPiBCFXZgpcSTYX/OVdmFZdPNYoWoCrz1xqqBMmtUkqLGf8GH5mrCkYa
 hk8WAGMvIFmv1ppAvrF7EEUhGNzMGOcfcX4bkwkDQry+/2bsxr0Zrn/BBHzXzj0kHH/o
 x0Vr7HNuYTUWK6t1tg8WF9kTKLEepNCfPGkotBv0mlOqLhn9/sHXhTT1UZtt659Chrcw
 W0N0YJGwwu/5lYMcUswY8xTeaJgc0TBRA/TINjgTMarIUZvZlPwaHzN1hmcl0+8yrMeg
 lif5H/Zlw2kYBiaVAFMiABUKW/Gb3UUQaBDr3/lOA0ZL+078pn/bBLe4F9nj4mLrgG5U
 1Lfg==
X-Gm-Message-State: AOAM532/aW+v6CeZogs0pWyuKAfAloj5BRlikvhIwYoJ0zqXB/L6VZhm
 ZPguvaQGkSR/QOQCwGUimfWGnPDFDFyZBQ==
X-Google-Smtp-Source: ABdhPJxeS5y6JmtHgEqreszTTmjUO1d3hzCosu8ksRvZ+QbN8hhzm68JfS1X+lrinJac9Z246tHotQ==
X-Received: by 2002:a5d:42d0:: with SMTP id t16mr4852243wrr.230.1611069088102; 
 Tue, 19 Jan 2021 07:11:28 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a184sm4843699wme.35.2021.01.19.07.11.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 07:11:27 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/33] target/arm: Update REV, PUNPK for pred_desc
Date: Tue, 19 Jan 2021 15:10:57 +0000
Message-Id: <20210119151104.16264-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119151104.16264-1-peter.maydell@linaro.org>
References: <20210119151104.16264-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

Update all users of do_perm_pred2 for the new
predicate descriptor field definitions.

Cc: qemu-stable@nongnu.org
Buglink: https://bugs.launchpad.net/bugs/1908551
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210113062650.593824-5-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sve_helper.c    |  8 ++++----
 target/arm/translate-sve.c | 13 ++++---------
 2 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 7eec4b6b73a..844db08bd57 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2036,8 +2036,8 @@ static uint8_t reverse_bits_8(uint8_t x, int n)
 
 void HELPER(sve_rev_p)(void *vd, void *vn, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
-    int esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
+    int esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
     intptr_t i, oprsz_2 = oprsz / 2;
 
     if (oprsz <= 8) {
@@ -2066,8 +2066,8 @@ void HELPER(sve_rev_p)(void *vd, void *vn, uint32_t pred_desc)
 
 void HELPER(sve_punpk_p)(void *vd, void *vn, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
-    intptr_t high = extract32(pred_desc, SIMD_DATA_SHIFT + 2, 1);
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
+    intptr_t high = FIELD_EX32(pred_desc, PREDDESC, DATA);
     uint64_t *d = vd;
     intptr_t i;
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 0baca176a09..27402af23c0 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2145,19 +2145,14 @@ static bool do_perm_pred2(DisasContext *s, arg_rr_esz *a, bool high_odd,
     TCGv_ptr t_d = tcg_temp_new_ptr();
     TCGv_ptr t_n = tcg_temp_new_ptr();
     TCGv_i32 t_desc;
-    int desc;
+    uint32_t desc = 0;
 
     tcg_gen_addi_ptr(t_d, cpu_env, pred_full_reg_offset(s, a->rd));
     tcg_gen_addi_ptr(t_n, cpu_env, pred_full_reg_offset(s, a->rn));
 
-    /* Predicate sizes may be smaller and cannot use simd_desc.
-       We cannot round up, as we do elsewhere, because we need
-       the exact size for ZIP2 and REV.  We retain the style for
-       the other helpers for consistency.  */
-
-    desc = vsz - 2;
-    desc = deposit32(desc, SIMD_DATA_SHIFT, 2, a->esz);
-    desc = deposit32(desc, SIMD_DATA_SHIFT + 2, 2, high_odd);
+    desc = FIELD_DP32(desc, PREDDESC, OPRSZ, vsz);
+    desc = FIELD_DP32(desc, PREDDESC, ESZ, a->esz);
+    desc = FIELD_DP32(desc, PREDDESC, DATA, high_odd);
     t_desc = tcg_const_i32(desc);
 
     fn(t_d, t_n, t_desc);
-- 
2.20.1


