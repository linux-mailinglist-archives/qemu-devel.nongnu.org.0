Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B582FBB4D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:37:04 +0100 (CET)
Received: from localhost ([::1]:35990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1t43-0004he-I9
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:37:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfM-0007uD-GA
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:32 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfI-0001JQ-LM
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:32 -0500
Received: by mail-wr1-x431.google.com with SMTP id d13so20036852wrc.13
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Fpvv6McMx2JQfLPxAQ2Rc3gkgQ8j61EV62+1puDjSho=;
 b=H4rZr3U5cdQoCiDEMmQtlTwecmqofWLF1ZCTz3WkxXz3W1HJHoXQQUUyVhBqjH4KpS
 EK8pWLT4hYpiqyagmOBc91JOfftgtYF2SvOAfhFaLDBrKnSZf5idqtUFW/wnUHGsCIig
 ljfPTCDC/bnlhek6jEqxymyjwKWcEoyUFF1DY9+1GVcmUH/8keYE0yHR2DAtum58Fsfw
 wvBDdRXOSxdu0/ty/XzGTOyR+yynCntllpiAMdcyVHwLJvGbfe7o9/W87Dy9bApdgKqM
 YdXeyF+223gV75gf0+KdjVxBNsAsalvBen+Hm1hqf4RNli8acCiLkzTtqi0OB3n5+nOL
 psAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fpvv6McMx2JQfLPxAQ2Rc3gkgQ8j61EV62+1puDjSho=;
 b=i7u1nPBonRN/PAV3BrwIw0+0m5L0Pu4YXP+dmUcblCVVF2iiDAJGXLnrBg2zfzKkHf
 M6ty42eEMnjZdTpp1v4/sZDQsHRfre4NQmMxVrNgBjYLhRYzjhlnZRTzejtZsUFspYb1
 tTkiK/ojLBA8KIXO5ilJptHlUTMGvLJAbUtqAYHcbCN1SCMcA2K6rIasrA/8eLd36nMh
 afLhl8hOpOkeaVM8s4oReKnoNYd92DLqAo7sRNM2pbU8F85QUvfFlmdE/7tsDGKKdn1/
 qbvto2UK8Yck6QiZkM4osulCRW9UMwCvX1iffEgy/ap2s+WYixGbFl3p0Bho0mChOrES
 7eVg==
X-Gm-Message-State: AOAM533cRJdNiBY3k+N58Dap0IkG/O00HAURT7bOYVfzJpJswEiblC1m
 syLKedL/q+deDmGWKR30w37V4U8a3hoF0g==
X-Google-Smtp-Source: ABdhPJwS3bhyYzVURw0h9mNkf+J0Mq3dV4nwW5hE2QbnZ2fjAWszs9+YDSQ5Uh0mwFXcidQJ1jzagA==
X-Received: by 2002:adf:83a6:: with SMTP id 35mr4813904wre.274.1611069087329; 
 Tue, 19 Jan 2021 07:11:27 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a184sm4843699wme.35.2021.01.19.07.11.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 07:11:26 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/33] target/arm: Update ZIP, UZP, TRN for pred_desc
Date: Tue, 19 Jan 2021 15:10:56 +0000
Message-Id: <20210119151104.16264-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119151104.16264-1-peter.maydell@linaro.org>
References: <20210119151104.16264-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

Update all users of do_perm_pred3 for the new
predicate descriptor field definitions.

Cc: qemu-stable@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210113062650.593824-4-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/sve_helper.c    | 18 +++++++++---------
 target/arm/translate-sve.c | 12 ++++--------
 2 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index ff01851bf28..7eec4b6b73a 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1868,9 +1868,9 @@ static uint64_t compress_bits(uint64_t x, int n)
 
 void HELPER(sve_zip_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
-    int esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
-    intptr_t high = extract32(pred_desc, SIMD_DATA_SHIFT + 2, 1);
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
+    int esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
+    intptr_t high = FIELD_EX32(pred_desc, PREDDESC, DATA);
     uint64_t *d = vd;
     intptr_t i;
 
@@ -1929,9 +1929,9 @@ void HELPER(sve_zip_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
 
 void HELPER(sve_uzp_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
-    int esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
-    int odd = extract32(pred_desc, SIMD_DATA_SHIFT + 2, 1) << esz;
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
+    int esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
+    int odd = FIELD_EX32(pred_desc, PREDDESC, DATA) << esz;
     uint64_t *d = vd, *n = vn, *m = vm;
     uint64_t l, h;
     intptr_t i;
@@ -1986,9 +1986,9 @@ void HELPER(sve_uzp_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
 
 void HELPER(sve_trn_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
-    uintptr_t esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
-    bool odd = extract32(pred_desc, SIMD_DATA_SHIFT + 2, 1);
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
+    int esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
+    int odd = FIELD_EX32(pred_desc, PREDDESC, DATA);
     uint64_t *d = vd, *n = vn, *m = vm;
     uint64_t mask;
     int shr, shl;
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index efcb646f729..0baca176a09 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2110,19 +2110,15 @@ static bool do_perm_pred3(DisasContext *s, arg_rrr_esz *a, bool high_odd,
 
     unsigned vsz = pred_full_reg_size(s);
 
-    /* Predicate sizes may be smaller and cannot use simd_desc.
-       We cannot round up, as we do elsewhere, because we need
-       the exact size for ZIP2 and REV.  We retain the style for
-       the other helpers for consistency.  */
     TCGv_ptr t_d = tcg_temp_new_ptr();
     TCGv_ptr t_n = tcg_temp_new_ptr();
     TCGv_ptr t_m = tcg_temp_new_ptr();
     TCGv_i32 t_desc;
-    int desc;
+    uint32_t desc = 0;
 
-    desc = vsz - 2;
-    desc = deposit32(desc, SIMD_DATA_SHIFT, 2, a->esz);
-    desc = deposit32(desc, SIMD_DATA_SHIFT + 2, 2, high_odd);
+    desc = FIELD_DP32(desc, PREDDESC, OPRSZ, vsz);
+    desc = FIELD_DP32(desc, PREDDESC, ESZ, a->esz);
+    desc = FIELD_DP32(desc, PREDDESC, DATA, high_odd);
 
     tcg_gen_addi_ptr(t_d, cpu_env, pred_full_reg_offset(s, a->rd));
     tcg_gen_addi_ptr(t_n, cpu_env, pred_full_reg_offset(s, a->rn));
-- 
2.20.1


