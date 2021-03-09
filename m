Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA82332D99
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 18:55:12 +0100 (CET)
Received: from localhost ([::1]:43904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJgZb-0007bx-NM
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 12:55:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf7A-0007db-Eg
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:21:44 -0500
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:46156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf6l-0002W5-Fq
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:21:44 -0500
Received: by mail-ot1-x32a.google.com with SMTP id r24so6270719otq.13
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X5qNtlKyR3HiK96NPS7iXZ0SUIEgp+QlNj8LO8hQyAM=;
 b=N+YLCFKuHpHa80yDhQmA/0pb8QkwdYp1OMdY5f/Tiia43E513T517vthrv9htKFlrn
 GLVqAIDJ7O/WyIDcTb9eesnxX8Ou0wjjrBJ8LxxVn7wCnOtI+I6E543JnLDmBowl7HYk
 q0iXmgT6fYryCkgxKZ2ojymvRJX40HBKc5r0pExTr3ZyZug2ef2zUM9p2aPzuHWM6EWC
 AgVKkpYX7ueP0NFeuqCzrEZLXm4dRVscHvzkTJaygtOg0FRId+d1F8Yp/9FBcatk5L6B
 s4F0tVgPswCIkq0++LB5nMosSmLhJvdeH4LiJcc6ksdAo36sNIV1P0xRXw6272V3ixt6
 wWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X5qNtlKyR3HiK96NPS7iXZ0SUIEgp+QlNj8LO8hQyAM=;
 b=auUu1Vej1n9guqIQ+SCkpA76eoWpWcDwE66c0rlwjWwSY0ya8lacv3nlkBlKIFTIVF
 kAudfBmBOR/2FF5xJA/Chs7BJaa3hQVAkaMyB8eFpgLyobNJszMsHml4DjhmQ0N3lb06
 GU2L7h/0OChaBbPWwjR7dzDVy+x3BpP3RUh6yymOG850YNdUFNhoou0cWVCJj04vd2Zd
 UmbryTXZkFj/RMonYIrTfc0C7p/V49zjHGbDzS4f4rzKI6biXaJQzxSPSVZnOJI2O3y3
 Xx5v2ENwL/9kssrEm4aSVRzP6AA0la5fYimklKdLt5/4OVvIijcmXreuBvz61AUKf6+G
 R7KA==
X-Gm-Message-State: AOAM533oLPFOKUwbIemVE6V2FfdgQLBw5935vEMBzePYyvHwklMF4SeS
 8hRMmz1Rp465sjRGjuOobjwVmZULLufW7Ym0
X-Google-Smtp-Source: ABdhPJxYsM3+LW7w7XtTP+T/HZQa9HtVg3QdMxd5ngYJ6ppOsWHGk4r0X8XiErFSuNPNFDbHNWQMMQ==
X-Received: by 2002:a05:6830:8f:: with SMTP id
 a15mr2285756oto.299.1615306877007; 
 Tue, 09 Mar 2021 08:21:17 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:21:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 30/78] target/arm: Implement SVE2 WHILEGT, WHILEGE, WHILEHI,
 WHILEHS
Date: Tue,  9 Mar 2021 08:19:53 -0800
Message-Id: <20210309162041.23124-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32a.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename the existing sve_while (less-than) helper to sve_whilel
to make room for a new sve_whileg helper for greater-than.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Use a new helper function to implement this.
v4: Update for PREDDESC.
---
 target/arm/helper-sve.h    |  3 +-
 target/arm/sve.decode      |  2 +-
 target/arm/sve_helper.c    | 38 +++++++++++++++++++++++++-
 target/arm/translate-sve.c | 56 ++++++++++++++++++++++++++++----------
 4 files changed, 82 insertions(+), 17 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 1c7fe8e417..5bf9fdc7a3 100644
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
index 0674464695..ae853d21f2 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -700,7 +700,7 @@ SINCDECP_z      00100101 .. 1010 d:1 u:1 10000 00 .... .....    @incdec2_pred
 CTERM           00100101 1 sf:1 1 rm:5 001000 rn:5 ne:1 0000
 
 # SVE integer compare scalar count and limit
-WHILE           00100101 esz:2 1 rm:5 000 sf:1 u:1 1 rn:5 eq:1 rd:4
+WHILE           00100101 esz:2 1 rm:5 000 sf:1 u:1 lt:1 rn:5 eq:1 rd:4
 
 ### SVE Integer Wide Immediate - Unpredicated Group
 
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 4b487d6f5f..700112e6cb 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3745,7 +3745,7 @@ uint64_t HELPER(sve_cntp)(void *vn, void *vg, uint32_t pred_desc)
     return sum;
 }
 
-uint32_t HELPER(sve_while)(void *vd, uint32_t count, uint32_t pred_desc)
+uint32_t HELPER(sve_whilel)(void *vd, uint32_t count, uint32_t pred_desc)
 {
     intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
     intptr_t esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
@@ -3771,6 +3771,42 @@ uint32_t HELPER(sve_while)(void *vd, uint32_t count, uint32_t pred_desc)
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
index 5380ed26c1..f833bd5e33 100644
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
2.25.1


