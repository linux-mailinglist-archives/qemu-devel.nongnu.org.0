Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D96B93905DC
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:49:37 +0200 (CEST)
Received: from localhost ([::1]:51832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZJI-0007PK-Ih
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbi-0003b7-Th
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:35 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:38892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYbO-0004TI-KU
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:04:34 -0400
Received: by mail-wr1-x42f.google.com with SMTP id j14so30851687wrq.5
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=5HTGZh88t5dpeUu1Sx6eIFoBi61e8qluko1wxuUVdJw=;
 b=RGFUo7KaN00fR7iCIvNhq3uQJ7SogiWx1H/ig0v+2BAnnjx++Cd90f6TiZobFWioyg
 uOTBg2aaqgBiwmHu2wJIDOCFlyVvqC1NSz5vtRirvK0IZ2Ze/D33rBSYjn6JZN/DfLDq
 G9+TPBIwLnTyiAax2SIydE+qsMm8Kkz+bF0aM8D6KFGCTN4FQsbLCxhflHiPtI8rQBAL
 5VPDqs7ydIxcNGI0SQF2Nz5rzu7nMeFkOn2ZL6T6yEQajx3lcqtL0AgYofPPTgi5YWe+
 jjIUgpgkUOaMkpovsztsI/9v+cYAvzx2C+XvD9HBDvF45drRZmb9tfwi0qyaeT3nThNV
 SPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5HTGZh88t5dpeUu1Sx6eIFoBi61e8qluko1wxuUVdJw=;
 b=cAjBj5r7DA9UummJOK37uI+r+tnuIXmypvE3rD8HkrIOdsfpw91sITdeJACYrWiRBl
 W4x/+O8yH8NAj14iU+ANox/x7weib4p5ZqX8nQUSXuWc4TAhsxuiO6ECQiqYpYwHp2ax
 tpfrs2oH1IHiBJBQ0W1jZ+W6Ny9hyNlnFp++Qf+N5f+vKUdGL3i7z5/6mp9h/4uigfnO
 ltoSrpdDF4Q63ymQ682HgRnsJX4sJobbkc6iiENTDv/2f8bTaUH0IZhnuUj1mhmBo3VF
 eyX9ML1FEkcRf5XvLwbwHPAponNOlwsqeGFkDdWrZNLvSpsiyWbH26uCOYdTSh9ROReI
 IHLg==
X-Gm-Message-State: AOAM531rOzqCLcpuBZM0H6EQDUzzprF9p5AQ3vKngYM3WcFjDYrtIgrS
 rQ2xclWztcySWe8/LWRzF1avXMp7gpc9eD5k
X-Google-Smtp-Source: ABdhPJxVJBqSdUuyysl6o9urkxi3oGk1TxRIfMCabBP7J7QXvJaXsrPyfcMZhoC5On/bkiooYWGosQ==
X-Received: by 2002:adf:e109:: with SMTP id t9mr2949981wrz.372.1621955053178; 
 Tue, 25 May 2021 08:04:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.04.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:04:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 052/114] target/arm: Implement SVE2 WHILEGT, WHILEGE, WHILEHI,
 WHILEHS
Date: Tue, 25 May 2021 16:02:22 +0100
Message-Id: <20210525150324.32370-53-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Rename the existing sve_while (less-than) helper to sve_whilel
to make room for a new sve_whileg helper for greater-than.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210525010358.152808-31-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-sve.h    |  3 +-
 target/arm/sve.decode      |  2 +-
 target/arm/sve_helper.c    | 38 +++++++++++++++++++++++++-
 target/arm/translate-sve.c | 56 ++++++++++++++++++++++++++++----------
 4 files changed, 82 insertions(+), 17 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 1c7fe8e417a..5bf9fdc7a36 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -913,7 +913,8 @@ DEF_HELPER_FLAGS_4(sve_brkns, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_3(sve_cntp, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
 
-DEF_HELPER_FLAGS_3(sve_while, TCG_CALL_NO_RWG, i32, ptr, i32, i32)
+DEF_HELPER_FLAGS_3(sve_whilel, TCG_CALL_NO_RWG, i32, ptr, i32, i32)
+DEF_HELPER_FLAGS_3(sve_whileg, TCG_CALL_NO_RWG, i32, ptr, i32, i32)
 
 DEF_HELPER_FLAGS_4(sve_subri_b, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
 DEF_HELPER_FLAGS_4(sve_subri_h, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 0674464695e..ae853d21f2e 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -700,7 +700,7 @@ SINCDECP_z      00100101 .. 1010 d:1 u:1 10000 00 .... .....    @incdec2_pred
 CTERM           00100101 1 sf:1 1 rm:5 001000 rn:5 ne:1 0000
 
 # SVE integer compare scalar count and limit
-WHILE           00100101 esz:2 1 rm:5 000 sf:1 u:1 1 rn:5 eq:1 rd:4
+WHILE           00100101 esz:2 1 rm:5 000 sf:1 u:1 lt:1 rn:5 eq:1 rd:4
 
 ### SVE Integer Wide Immediate - Unpredicated Group
 
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 0ea4ae28db9..74509776304 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3750,7 +3750,7 @@ uint64_t HELPER(sve_cntp)(void *vn, void *vg, uint32_t pred_desc)
     return sum;
 }
 
-uint32_t HELPER(sve_while)(void *vd, uint32_t count, uint32_t pred_desc)
+uint32_t HELPER(sve_whilel)(void *vd, uint32_t count, uint32_t pred_desc)
 {
     intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
     intptr_t esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
@@ -3776,6 +3776,42 @@ uint32_t HELPER(sve_while)(void *vd, uint32_t count, uint32_t pred_desc)
     return predtest_ones(d, oprsz, esz_mask);
 }
 
+uint32_t HELPER(sve_whileg)(void *vd, uint32_t count, uint32_t pred_desc)
+{
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
+    intptr_t esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
+    uint64_t esz_mask = pred_esz_masks[esz];
+    ARMPredicateReg *d = vd;
+    intptr_t i, invcount, oprbits;
+    uint64_t bits;
+
+    if (count == 0) {
+        return do_zero(d, oprsz);
+    }
+
+    oprbits = oprsz * 8;
+    tcg_debug_assert(count <= oprbits);
+
+    bits = esz_mask;
+    if (oprbits & 63) {
+        bits &= MAKE_64BIT_MASK(0, oprbits & 63);
+    }
+
+    invcount = oprbits - count;
+    for (i = (oprsz - 1) / 8; i > invcount / 64; --i) {
+        d->p[i] = bits;
+        bits = esz_mask;
+    }
+
+    d->p[i] = bits & MAKE_64BIT_MASK(invcount & 63, 64);
+
+    while (--i >= 0) {
+        d->p[i] = 0;
+    }
+
+    return predtest_ones(d, oprsz, esz_mask);
+}
+
 /* Recursive reduction on a function;
  * C.f. the ARM ARM function ReducePredicated.
  *
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 4141d763111..a55e747514f 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3112,7 +3112,14 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
     unsigned vsz = vec_full_reg_size(s);
     unsigned desc = 0;
     TCGCond cond;
+    uint64_t maxval;
+    /* Note that GE/HS has a->eq == 0 and GT/HI has a->eq == 1. */
+    bool eq = a->eq == a->lt;
 
+    /* The greater-than conditions are all SVE2. */
+    if (!a->lt && !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
     if (!sve_access_check(s)) {
         return true;
     }
@@ -3135,22 +3142,42 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
      */
     t0 = tcg_temp_new_i64();
     t1 = tcg_temp_new_i64();
-    tcg_gen_sub_i64(t0, op1, op0);
+
+    if (a->lt) {
+        tcg_gen_sub_i64(t0, op1, op0);
+        if (a->u) {
+            maxval = a->sf ? UINT64_MAX : UINT32_MAX;
+            cond = eq ? TCG_COND_LEU : TCG_COND_LTU;
+        } else {
+            maxval = a->sf ? INT64_MAX : INT32_MAX;
+            cond = eq ? TCG_COND_LE : TCG_COND_LT;
+        }
+    } else {
+        tcg_gen_sub_i64(t0, op0, op1);
+        if (a->u) {
+            maxval = 0;
+            cond = eq ? TCG_COND_GEU : TCG_COND_GTU;
+        } else {
+            maxval = a->sf ? INT64_MIN : INT32_MIN;
+            cond = eq ? TCG_COND_GE : TCG_COND_GT;
+        }
+    }
 
     tmax = tcg_const_i64(vsz >> a->esz);
-    if (a->eq) {
+    if (eq) {
         /* Equality means one more iteration.  */
         tcg_gen_addi_i64(t0, t0, 1);
 
-        /* If op1 is max (un)signed integer (and the only time the addition
-         * above could overflow), then we produce an all-true predicate by
-         * setting the count to the vector length.  This is because the
-         * pseudocode is described as an increment + compare loop, and the
-         * max integer would always compare true.
+        /*
+         * For the less-than while, if op1 is maxval (and the only time
+         * the addition above could overflow), then we produce an all-true
+         * predicate by setting the count to the vector length.  This is
+         * because the pseudocode is described as an increment + compare
+         * loop, and the maximum integer would always compare true.
+         * Similarly, the greater-than while has the same issue with the
+         * minimum integer due to the decrement + compare loop.
          */
-        tcg_gen_movi_i64(t1, (a->sf
-                              ? (a->u ? UINT64_MAX : INT64_MAX)
-                              : (a->u ? UINT32_MAX : INT32_MAX)));
+        tcg_gen_movi_i64(t1, maxval);
         tcg_gen_movcond_i64(TCG_COND_EQ, t0, op1, t1, tmax, t0);
     }
 
@@ -3159,9 +3186,6 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
     tcg_temp_free_i64(tmax);
 
     /* Set the count to zero if the condition is false.  */
-    cond = (a->u
-            ? (a->eq ? TCG_COND_LEU : TCG_COND_LTU)
-            : (a->eq ? TCG_COND_LE : TCG_COND_LT));
     tcg_gen_movi_i64(t1, 0);
     tcg_gen_movcond_i64(cond, t0, op0, op1, t0, t1);
     tcg_temp_free_i64(t1);
@@ -3181,7 +3205,11 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
     ptr = tcg_temp_new_ptr();
     tcg_gen_addi_ptr(ptr, cpu_env, pred_full_reg_offset(s, a->rd));
 
-    gen_helper_sve_while(t2, ptr, t2, t3);
+    if (a->lt) {
+        gen_helper_sve_whilel(t2, ptr, t2, t3);
+    } else {
+        gen_helper_sve_whileg(t2, ptr, t2, t3);
+    }
     do_pred_flags(t2);
 
     tcg_temp_free_ptr(ptr);
-- 
2.20.1


