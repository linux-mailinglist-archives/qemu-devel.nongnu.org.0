Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAB02F4495
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 07:34:20 +0100 (CET)
Received: from localhost ([::1]:46792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzZjX-0001Hu-6g
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 01:34:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzZcY-0004DS-Ks
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 01:27:06 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:33248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzZcV-0007Ik-KK
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 01:27:06 -0500
Received: by mail-pg1-x534.google.com with SMTP id n25so875282pgb.0
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 22:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YbAy4KVm8LZdofZcsXyEMftLzbs/6FHl1IDz/kaEGZA=;
 b=giEqWeegyT3S3mL7WsKtn/HvThYJUn9jz6oSMART99yy/X+/8XiS47SFV8WBRJVsYc
 1Vm4hMLZYqfikoNB3rCtI42MHrA5loVkfhMf7TFRI6GWzqcTfY0/wyAPrgZhpTTm/JLb
 gRaZGmIIgJhDMSnNAvY8XeLV8DlEisk31m7kQH+94HrfzByzLnrJ/X9UuNhtVryRQCZH
 J7ToapLEWf1CgCRLaxMaZTPlWacynJvtRHwFnjPOzkpmpK9mxOPhpPpQajE/uU7kBUjg
 tJknfaUWa9F4FE3TU4CCmzlpy2EnGomR0GLG2D2ZYEex6Z1mVt6JGY/b6XGeXwMQ3orU
 hLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YbAy4KVm8LZdofZcsXyEMftLzbs/6FHl1IDz/kaEGZA=;
 b=MnMF5JPCxEb4y3jo5ctwYlYeWvoTMHyFUAJWUszGFmsRZo+B9M0Tmnt2ucHbN+uuti
 tzajYmQgarFERosp7GzVgiiDpR2bsABaxwCxetFlD4Uhbbl4UjyslCQ47m1fcYgG56Iy
 AFax9Da0AmZHUnFwA0THXByL7uuYsyKMSaNwrFvyul/ox6A6UZcRFJbNi++1mFtfjGV7
 NqUs8Ys/ct6g1KcmcaRbUl1KMynzPp/tWMiHHF6mb4ueScxmPnSZGRPV/4jHC5azS/al
 Tn9BPrxm/UgtRMyc/D7HYJb/0/arlnGLJjXN8j2GvdT2pbg2ncxpYdCSG1QNGKgwRcFd
 +Bmw==
X-Gm-Message-State: AOAM533TkjnNz6tlwQBoF0PFqN15IxfTJMcrMkYkZaMxotKpNXDUwkwz
 jnzxtZL1Gg2hsV/0NPFS2RVWoO/UD6nPqA==
X-Google-Smtp-Source: ABdhPJy2pBBdBDSlTCgHd/B7yU/yWlMGb5HTUak/svwLAal8kfBk1Xw13vos9Uh16vlIVMfE5sTQ8Q==
X-Received: by 2002:aa7:904b:0:b029:19e:c8a5:5154 with SMTP id
 n11-20020aa7904b0000b029019ec8a55154mr640584pfo.41.1610519221930; 
 Tue, 12 Jan 2021 22:27:01 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id k25sm1138241pfi.10.2021.01.12.22.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 22:27:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/4] target/arm: Update REV, PUNPK for pred_desc
Date: Tue, 12 Jan 2021 20:26:50 -1000
Message-Id: <20210113062650.593824-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113062650.593824-1-richard.henderson@linaro.org>
References: <20210113062650.593824-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update all users of do_perm_pred2 for the new
predicate descriptor field definitions.

Cc: qemu-stable@nongnu.org
Buglink: https://bugs.launchpad.net/bugs/1908551
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c    |  8 ++++----
 target/arm/translate-sve.c | 13 ++++---------
 2 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 7eec4b6b73..844db08bd5 100644
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
index 0baca176a0..27402af23c 100644
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
2.25.1


