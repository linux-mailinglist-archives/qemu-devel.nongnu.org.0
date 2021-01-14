Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D8E2F573F
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 03:33:10 +0100 (CET)
Received: from localhost ([::1]:47672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzsRh-0004IN-H9
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 21:33:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzsCd-0003fe-4V
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 21:17:35 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:46398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzsCS-0003UY-P6
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 21:17:34 -0500
Received: by mail-pf1-x433.google.com with SMTP id w2so2435571pfc.13
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 18:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SP7y7BmDV8PvBtP7aflncUZbvfpV0QEs/q9zdjQfYwI=;
 b=vVuRlzWg1EZtoVDJav0tAm4ytUMhi8A0DR/L1kLv9Tm0Gx12dMwcyzI+e6em0oaIWd
 4FTsautSKa7Q8jOgWtyOarv6+p+drsIZUM4VFFR4qV2EcHWYYNYjAH11c402SPu/kppe
 sgFCZ6QBou8qdiIfdwuTpc1RxGFtAlkjGQaaNbbf7yPzbIFopbfsNlSIb8tfm//Vafvq
 ycS2b6wYVLJwLJ7gDiEJPANvOcDi4tUR+Dez3vnNn7PlnV3KOWUQlgbHKXL9VeCMwfni
 EcQBJLvfFPee0G5CZGFxzT0h3uvcyg42mxja1O5MYaKO3NROJ7tVYCv1J4G+EcGEZT6/
 XTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SP7y7BmDV8PvBtP7aflncUZbvfpV0QEs/q9zdjQfYwI=;
 b=g0e5nBogm+HeC0ZuHErPNr/mt0V7e/KXi5VWRH38hosUQRZk8RIWWHGJRjTLBR2Q5f
 pbdT1F00hOlxzSVkInufdtSYMime96/3M+bBXJfiwQxwTRgVJlS0FK1Fmy93j1PofoUw
 u6saP2AMUOo1Of5JS77M+uNiUT3RyQbCM/Kt3k0JgH+P/kRYwNqx46gnScG4dpveXnlH
 p+OMjZKesRMA8lIKFhYeYKwHHyYgyIg01Ye7xoKjKjpwnzGgldujb4oG69egZkzAwSFR
 DtNIECxPlfRasYKsWLphz7nP6OaRoMJjjjmuWqtVqJal3Adm1gy2gWTpiuGlei3VrWff
 7HaQ==
X-Gm-Message-State: AOAM531hWc8Q1WJpkCOvFW8Px+t537DRElYbY+6TkvuE5hl2wwEK3MQk
 h5KvvbYXCTluadC18+3umnWyUG+/zHQoLQ==
X-Google-Smtp-Source: ABdhPJyP+smFwb8WRgtjfkVBAFAEoprjdYYPUjftEbRRxjZwFqvun0wgfNj3AVqUwo3arr2kk6gH1A==
X-Received: by 2002:a65:5244:: with SMTP id q4mr5087018pgp.50.1610590641870;
 Wed, 13 Jan 2021 18:17:21 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id i7sm3771687pfc.50.2021.01.13.18.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 18:17:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/24] tcg: Use tcg_constant_{i32,i64} with tcg int expanders
Date: Wed, 13 Jan 2021 16:16:44 -1000
Message-Id: <20210114021654.647242-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114021654.647242-1-richard.henderson@linaro.org>
References: <20210114021654.647242-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op.h |  13 +--
 tcg/tcg-op.c         | 227 ++++++++++++++++++++-----------------------
 2 files changed, 109 insertions(+), 131 deletions(-)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 901b19f32a..ed8de045e2 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -271,6 +271,7 @@ void tcg_gen_mb(TCGBar);
 
 /* 32 bit ops */
 
+void tcg_gen_movi_i32(TCGv_i32 ret, int32_t arg);
 void tcg_gen_addi_i32(TCGv_i32 ret, TCGv_i32 arg1, int32_t arg2);
 void tcg_gen_subfi_i32(TCGv_i32 ret, int32_t arg1, TCGv_i32 arg2);
 void tcg_gen_subi_i32(TCGv_i32 ret, TCGv_i32 arg1, int32_t arg2);
@@ -349,11 +350,6 @@ static inline void tcg_gen_mov_i32(TCGv_i32 ret, TCGv_i32 arg)
     }
 }
 
-static inline void tcg_gen_movi_i32(TCGv_i32 ret, int32_t arg)
-{
-    tcg_gen_op2i_i32(INDEX_op_movi_i32, ret, arg);
-}
-
 static inline void tcg_gen_ld8u_i32(TCGv_i32 ret, TCGv_ptr arg2,
                                     tcg_target_long offset)
 {
@@ -467,6 +463,7 @@ static inline void tcg_gen_not_i32(TCGv_i32 ret, TCGv_i32 arg)
 
 /* 64 bit ops */
 
+void tcg_gen_movi_i64(TCGv_i64 ret, int64_t arg);
 void tcg_gen_addi_i64(TCGv_i64 ret, TCGv_i64 arg1, int64_t arg2);
 void tcg_gen_subfi_i64(TCGv_i64 ret, int64_t arg1, TCGv_i64 arg2);
 void tcg_gen_subi_i64(TCGv_i64 ret, TCGv_i64 arg1, int64_t arg2);
@@ -550,11 +547,6 @@ static inline void tcg_gen_mov_i64(TCGv_i64 ret, TCGv_i64 arg)
     }
 }
 
-static inline void tcg_gen_movi_i64(TCGv_i64 ret, int64_t arg)
-{
-    tcg_gen_op2i_i64(INDEX_op_movi_i64, ret, arg);
-}
-
 static inline void tcg_gen_ld8u_i64(TCGv_i64 ret, TCGv_ptr arg2,
                                     tcg_target_long offset)
 {
@@ -698,7 +690,6 @@ static inline void tcg_gen_sub_i64(TCGv_i64 ret, TCGv_i64 arg1, TCGv_i64 arg2)
 
 void tcg_gen_discard_i64(TCGv_i64 arg);
 void tcg_gen_mov_i64(TCGv_i64 ret, TCGv_i64 arg);
-void tcg_gen_movi_i64(TCGv_i64 ret, int64_t arg);
 void tcg_gen_ld8u_i64(TCGv_i64 ret, TCGv_ptr arg2, tcg_target_long offset);
 void tcg_gen_ld8s_i64(TCGv_i64 ret, TCGv_ptr arg2, tcg_target_long offset);
 void tcg_gen_ld16u_i64(TCGv_i64 ret, TCGv_ptr arg2, tcg_target_long offset);
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 0374b5d56d..70475773f4 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -104,15 +104,18 @@ void tcg_gen_mb(TCGBar mb_type)
 
 /* 32 bit ops */
 
+void tcg_gen_movi_i32(TCGv_i32 ret, int32_t arg)
+{
+    tcg_gen_mov_i32(ret, tcg_constant_i32(arg));
+}
+
 void tcg_gen_addi_i32(TCGv_i32 ret, TCGv_i32 arg1, int32_t arg2)
 {
     /* some cases can be optimized here */
     if (arg2 == 0) {
         tcg_gen_mov_i32(ret, arg1);
     } else {
-        TCGv_i32 t0 = tcg_const_i32(arg2);
-        tcg_gen_add_i32(ret, arg1, t0);
-        tcg_temp_free_i32(t0);
+        tcg_gen_add_i32(ret, arg1, tcg_constant_i32(arg2));
     }
 }
 
@@ -122,9 +125,7 @@ void tcg_gen_subfi_i32(TCGv_i32 ret, int32_t arg1, TCGv_i32 arg2)
         /* Don't recurse with tcg_gen_neg_i32.  */
         tcg_gen_op2_i32(INDEX_op_neg_i32, ret, arg2);
     } else {
-        TCGv_i32 t0 = tcg_const_i32(arg1);
-        tcg_gen_sub_i32(ret, t0, arg2);
-        tcg_temp_free_i32(t0);
+        tcg_gen_sub_i32(ret, tcg_constant_i32(arg1), arg2);
     }
 }
 
@@ -134,15 +135,12 @@ void tcg_gen_subi_i32(TCGv_i32 ret, TCGv_i32 arg1, int32_t arg2)
     if (arg2 == 0) {
         tcg_gen_mov_i32(ret, arg1);
     } else {
-        TCGv_i32 t0 = tcg_const_i32(arg2);
-        tcg_gen_sub_i32(ret, arg1, t0);
-        tcg_temp_free_i32(t0);
+        tcg_gen_sub_i32(ret, arg1, tcg_constant_i32(arg2));
     }
 }
 
 void tcg_gen_andi_i32(TCGv_i32 ret, TCGv_i32 arg1, int32_t arg2)
 {
-    TCGv_i32 t0;
     /* Some cases can be optimized here.  */
     switch (arg2) {
     case 0:
@@ -165,9 +163,8 @@ void tcg_gen_andi_i32(TCGv_i32 ret, TCGv_i32 arg1, int32_t arg2)
         }
         break;
     }
-    t0 = tcg_const_i32(arg2);
-    tcg_gen_and_i32(ret, arg1, t0);
-    tcg_temp_free_i32(t0);
+
+    tcg_gen_and_i32(ret, arg1, tcg_constant_i32(arg2));
 }
 
 void tcg_gen_ori_i32(TCGv_i32 ret, TCGv_i32 arg1, int32_t arg2)
@@ -178,9 +175,7 @@ void tcg_gen_ori_i32(TCGv_i32 ret, TCGv_i32 arg1, int32_t arg2)
     } else if (arg2 == 0) {
         tcg_gen_mov_i32(ret, arg1);
     } else {
-        TCGv_i32 t0 = tcg_const_i32(arg2);
-        tcg_gen_or_i32(ret, arg1, t0);
-        tcg_temp_free_i32(t0);
+        tcg_gen_or_i32(ret, arg1, tcg_constant_i32(arg2));
     }
 }
 
@@ -193,9 +188,7 @@ void tcg_gen_xori_i32(TCGv_i32 ret, TCGv_i32 arg1, int32_t arg2)
         /* Don't recurse with tcg_gen_not_i32.  */
         tcg_gen_op2_i32(INDEX_op_not_i32, ret, arg1);
     } else {
-        TCGv_i32 t0 = tcg_const_i32(arg2);
-        tcg_gen_xor_i32(ret, arg1, t0);
-        tcg_temp_free_i32(t0);
+        tcg_gen_xor_i32(ret, arg1, tcg_constant_i32(arg2));
     }
 }
 
@@ -205,9 +198,7 @@ void tcg_gen_shli_i32(TCGv_i32 ret, TCGv_i32 arg1, int32_t arg2)
     if (arg2 == 0) {
         tcg_gen_mov_i32(ret, arg1);
     } else {
-        TCGv_i32 t0 = tcg_const_i32(arg2);
-        tcg_gen_shl_i32(ret, arg1, t0);
-        tcg_temp_free_i32(t0);
+        tcg_gen_shl_i32(ret, arg1, tcg_constant_i32(arg2));
     }
 }
 
@@ -217,9 +208,7 @@ void tcg_gen_shri_i32(TCGv_i32 ret, TCGv_i32 arg1, int32_t arg2)
     if (arg2 == 0) {
         tcg_gen_mov_i32(ret, arg1);
     } else {
-        TCGv_i32 t0 = tcg_const_i32(arg2);
-        tcg_gen_shr_i32(ret, arg1, t0);
-        tcg_temp_free_i32(t0);
+        tcg_gen_shr_i32(ret, arg1, tcg_constant_i32(arg2));
     }
 }
 
@@ -229,9 +218,7 @@ void tcg_gen_sari_i32(TCGv_i32 ret, TCGv_i32 arg1, int32_t arg2)
     if (arg2 == 0) {
         tcg_gen_mov_i32(ret, arg1);
     } else {
-        TCGv_i32 t0 = tcg_const_i32(arg2);
-        tcg_gen_sar_i32(ret, arg1, t0);
-        tcg_temp_free_i32(t0);
+        tcg_gen_sar_i32(ret, arg1, tcg_constant_i32(arg2));
     }
 }
 
@@ -250,9 +237,7 @@ void tcg_gen_brcondi_i32(TCGCond cond, TCGv_i32 arg1, int32_t arg2, TCGLabel *l)
     if (cond == TCG_COND_ALWAYS) {
         tcg_gen_br(l);
     } else if (cond != TCG_COND_NEVER) {
-        TCGv_i32 t0 = tcg_const_i32(arg2);
-        tcg_gen_brcond_i32(cond, arg1, t0, l);
-        tcg_temp_free_i32(t0);
+        tcg_gen_brcond_i32(cond, arg1, tcg_constant_i32(arg2), l);
     }
 }
 
@@ -271,9 +256,7 @@ void tcg_gen_setcond_i32(TCGCond cond, TCGv_i32 ret,
 void tcg_gen_setcondi_i32(TCGCond cond, TCGv_i32 ret,
                           TCGv_i32 arg1, int32_t arg2)
 {
-    TCGv_i32 t0 = tcg_const_i32(arg2);
-    tcg_gen_setcond_i32(cond, ret, arg1, t0);
-    tcg_temp_free_i32(t0);
+    tcg_gen_setcond_i32(cond, ret, arg1, tcg_constant_i32(arg2));
 }
 
 void tcg_gen_muli_i32(TCGv_i32 ret, TCGv_i32 arg1, int32_t arg2)
@@ -283,9 +266,7 @@ void tcg_gen_muli_i32(TCGv_i32 ret, TCGv_i32 arg1, int32_t arg2)
     } else if (is_power_of_2(arg2)) {
         tcg_gen_shli_i32(ret, arg1, ctz32(arg2));
     } else {
-        TCGv_i32 t0 = tcg_const_i32(arg2);
-        tcg_gen_mul_i32(ret, arg1, t0);
-        tcg_temp_free_i32(t0);
+        tcg_gen_mul_i32(ret, arg1, tcg_constant_i32(arg2));
     }
 }
 
@@ -433,9 +414,7 @@ void tcg_gen_clz_i32(TCGv_i32 ret, TCGv_i32 arg1, TCGv_i32 arg2)
 
 void tcg_gen_clzi_i32(TCGv_i32 ret, TCGv_i32 arg1, uint32_t arg2)
 {
-    TCGv_i32 t = tcg_const_i32(arg2);
-    tcg_gen_clz_i32(ret, arg1, t);
-    tcg_temp_free_i32(t);
+    tcg_gen_clz_i32(ret, arg1, tcg_constant_i32(arg2));
 }
 
 void tcg_gen_ctz_i32(TCGv_i32 ret, TCGv_i32 arg1, TCGv_i32 arg2)
@@ -468,10 +447,9 @@ void tcg_gen_ctz_i32(TCGv_i32 ret, TCGv_i32 arg1, TCGv_i32 arg2)
             tcg_gen_clzi_i32(t, t, 32);
             tcg_gen_xori_i32(t, t, 31);
         }
-        z = tcg_const_i32(0);
+        z = tcg_constant_i32(0);
         tcg_gen_movcond_i32(TCG_COND_EQ, ret, arg1, z, arg2, t);
         tcg_temp_free_i32(t);
-        tcg_temp_free_i32(z);
     } else {
         gen_helper_ctz_i32(ret, arg1, arg2);
     }
@@ -487,9 +465,7 @@ void tcg_gen_ctzi_i32(TCGv_i32 ret, TCGv_i32 arg1, uint32_t arg2)
         tcg_gen_ctpop_i32(ret, t);
         tcg_temp_free_i32(t);
     } else {
-        TCGv_i32 t = tcg_const_i32(arg2);
-        tcg_gen_ctz_i32(ret, arg1, t);
-        tcg_temp_free_i32(t);
+        tcg_gen_ctz_i32(ret, arg1, tcg_constant_i32(arg2));
     }
 }
 
@@ -547,9 +523,7 @@ void tcg_gen_rotli_i32(TCGv_i32 ret, TCGv_i32 arg1, int32_t arg2)
     if (arg2 == 0) {
         tcg_gen_mov_i32(ret, arg1);
     } else if (TCG_TARGET_HAS_rot_i32) {
-        TCGv_i32 t0 = tcg_const_i32(arg2);
-        tcg_gen_rotl_i32(ret, arg1, t0);
-        tcg_temp_free_i32(t0);
+        tcg_gen_rotl_i32(ret, arg1, tcg_constant_i32(arg2));
     } else {
         TCGv_i32 t0, t1;
         t0 = tcg_temp_new_i32();
@@ -653,9 +627,8 @@ void tcg_gen_deposit_z_i32(TCGv_i32 ret, TCGv_i32 arg,
         tcg_gen_andi_i32(ret, arg, (1u << len) - 1);
     } else if (TCG_TARGET_HAS_deposit_i32
                && TCG_TARGET_deposit_i32_valid(ofs, len)) {
-        TCGv_i32 zero = tcg_const_i32(0);
+        TCGv_i32 zero = tcg_constant_i32(0);
         tcg_gen_op5ii_i32(INDEX_op_deposit_i32, ret, zero, arg, ofs, len);
-        tcg_temp_free_i32(zero);
     } else {
         /* To help two-operand hosts we prefer to zero-extend first,
            which allows ARG to stay live.  */
@@ -1052,7 +1025,7 @@ void tcg_gen_bswap32_i32(TCGv_i32 ret, TCGv_i32 arg)
     } else {
         TCGv_i32 t0 = tcg_temp_new_i32();
         TCGv_i32 t1 = tcg_temp_new_i32();
-        TCGv_i32 t2 = tcg_const_i32(0x00ff00ff);
+        TCGv_i32 t2 = tcg_constant_i32(0x00ff00ff);
 
                                         /* arg = abcd */
         tcg_gen_shri_i32(t0, arg, 8);   /*  t0 = .abc */
@@ -1067,7 +1040,6 @@ void tcg_gen_bswap32_i32(TCGv_i32 ret, TCGv_i32 arg)
 
         tcg_temp_free_i32(t0);
         tcg_temp_free_i32(t1);
-        tcg_temp_free_i32(t2);
     }
 }
 
@@ -1114,8 +1086,15 @@ void tcg_gen_discard_i64(TCGv_i64 arg)
 
 void tcg_gen_mov_i64(TCGv_i64 ret, TCGv_i64 arg)
 {
-    tcg_gen_mov_i32(TCGV_LOW(ret), TCGV_LOW(arg));
-    tcg_gen_mov_i32(TCGV_HIGH(ret), TCGV_HIGH(arg));
+    TCGTemp *ts = tcgv_i64_temp(arg);
+
+    /* Canonicalize TCGv_i64 TEMP_CONST into TCGv_i32 TEMP_CONST. */
+    if (ts->kind == TEMP_CONST) {
+        tcg_gen_movi_i64(ret, ts->val);
+    } else {
+        tcg_gen_mov_i32(TCGV_LOW(ret), TCGV_LOW(arg));
+        tcg_gen_mov_i32(TCGV_HIGH(ret), TCGV_HIGH(arg));
+    }
 }
 
 void tcg_gen_movi_i64(TCGv_i64 ret, int64_t arg)
@@ -1237,6 +1216,14 @@ void tcg_gen_mul_i64(TCGv_i64 ret, TCGv_i64 arg1, TCGv_i64 arg2)
     tcg_temp_free_i64(t0);
     tcg_temp_free_i32(t1);
 }
+
+#else
+
+void tcg_gen_movi_i64(TCGv_i64 ret, int64_t arg)
+{
+    tcg_gen_mov_i64(ret, tcg_constant_i64(arg));
+}
+
 #endif /* TCG_TARGET_REG_SIZE == 32 */
 
 void tcg_gen_addi_i64(TCGv_i64 ret, TCGv_i64 arg1, int64_t arg2)
@@ -1244,10 +1231,12 @@ void tcg_gen_addi_i64(TCGv_i64 ret, TCGv_i64 arg1, int64_t arg2)
     /* some cases can be optimized here */
     if (arg2 == 0) {
         tcg_gen_mov_i64(ret, arg1);
+    } else if (TCG_TARGET_REG_BITS == 64) {
+        tcg_gen_add_i64(ret, arg1, tcg_constant_i64(arg2));
     } else {
-        TCGv_i64 t0 = tcg_const_i64(arg2);
-        tcg_gen_add_i64(ret, arg1, t0);
-        tcg_temp_free_i64(t0);
+        tcg_gen_add2_i32(TCGV_LOW(ret), TCGV_HIGH(ret),
+                         TCGV_LOW(arg1), TCGV_HIGH(arg1),
+                         tcg_constant_i32(arg2), tcg_constant_i32(arg2 >> 32));
     }
 }
 
@@ -1256,10 +1245,12 @@ void tcg_gen_subfi_i64(TCGv_i64 ret, int64_t arg1, TCGv_i64 arg2)
     if (arg1 == 0 && TCG_TARGET_HAS_neg_i64) {
         /* Don't recurse with tcg_gen_neg_i64.  */
         tcg_gen_op2_i64(INDEX_op_neg_i64, ret, arg2);
+    } else if (TCG_TARGET_REG_BITS == 64) {
+        tcg_gen_sub_i64(ret, tcg_constant_i64(arg1), arg2);
     } else {
-        TCGv_i64 t0 = tcg_const_i64(arg1);
-        tcg_gen_sub_i64(ret, t0, arg2);
-        tcg_temp_free_i64(t0);
+        tcg_gen_sub2_i32(TCGV_LOW(ret), TCGV_HIGH(ret),
+                         tcg_constant_i32(arg1), tcg_constant_i32(arg1 >> 32),
+                         TCGV_LOW(arg2), TCGV_HIGH(arg2));
     }
 }
 
@@ -1268,17 +1259,17 @@ void tcg_gen_subi_i64(TCGv_i64 ret, TCGv_i64 arg1, int64_t arg2)
     /* some cases can be optimized here */
     if (arg2 == 0) {
         tcg_gen_mov_i64(ret, arg1);
+    } else if (TCG_TARGET_REG_BITS == 64) {
+        tcg_gen_sub_i64(ret, arg1, tcg_constant_i64(arg2));
     } else {
-        TCGv_i64 t0 = tcg_const_i64(arg2);
-        tcg_gen_sub_i64(ret, arg1, t0);
-        tcg_temp_free_i64(t0);
+        tcg_gen_sub2_i32(TCGV_LOW(ret), TCGV_HIGH(ret),
+                         TCGV_LOW(arg1), TCGV_HIGH(arg1),
+                         tcg_constant_i32(arg2), tcg_constant_i32(arg2 >> 32));
     }
 }
 
 void tcg_gen_andi_i64(TCGv_i64 ret, TCGv_i64 arg1, int64_t arg2)
 {
-    TCGv_i64 t0;
-
     if (TCG_TARGET_REG_BITS == 32) {
         tcg_gen_andi_i32(TCGV_LOW(ret), TCGV_LOW(arg1), arg2);
         tcg_gen_andi_i32(TCGV_HIGH(ret), TCGV_HIGH(arg1), arg2 >> 32);
@@ -1313,9 +1304,8 @@ void tcg_gen_andi_i64(TCGv_i64 ret, TCGv_i64 arg1, int64_t arg2)
         }
         break;
     }
-    t0 = tcg_const_i64(arg2);
-    tcg_gen_and_i64(ret, arg1, t0);
-    tcg_temp_free_i64(t0);
+
+    tcg_gen_and_i64(ret, arg1, tcg_constant_i64(arg2));
 }
 
 void tcg_gen_ori_i64(TCGv_i64 ret, TCGv_i64 arg1, int64_t arg2)
@@ -1331,9 +1321,7 @@ void tcg_gen_ori_i64(TCGv_i64 ret, TCGv_i64 arg1, int64_t arg2)
     } else if (arg2 == 0) {
         tcg_gen_mov_i64(ret, arg1);
     } else {
-        TCGv_i64 t0 = tcg_const_i64(arg2);
-        tcg_gen_or_i64(ret, arg1, t0);
-        tcg_temp_free_i64(t0);
+        tcg_gen_or_i64(ret, arg1, tcg_constant_i64(arg2));
     }
 }
 
@@ -1351,9 +1339,7 @@ void tcg_gen_xori_i64(TCGv_i64 ret, TCGv_i64 arg1, int64_t arg2)
         /* Don't recurse with tcg_gen_not_i64.  */
         tcg_gen_op2_i64(INDEX_op_not_i64, ret, arg1);
     } else {
-        TCGv_i64 t0 = tcg_const_i64(arg2);
-        tcg_gen_xor_i64(ret, arg1, t0);
-        tcg_temp_free_i64(t0);
+        tcg_gen_xor_i64(ret, arg1, tcg_constant_i64(arg2));
     }
 }
 
@@ -1415,9 +1401,7 @@ void tcg_gen_shli_i64(TCGv_i64 ret, TCGv_i64 arg1, int64_t arg2)
     } else if (arg2 == 0) {
         tcg_gen_mov_i64(ret, arg1);
     } else {
-        TCGv_i64 t0 = tcg_const_i64(arg2);
-        tcg_gen_shl_i64(ret, arg1, t0);
-        tcg_temp_free_i64(t0);
+        tcg_gen_shl_i64(ret, arg1, tcg_constant_i64(arg2));
     }
 }
 
@@ -1429,9 +1413,7 @@ void tcg_gen_shri_i64(TCGv_i64 ret, TCGv_i64 arg1, int64_t arg2)
     } else if (arg2 == 0) {
         tcg_gen_mov_i64(ret, arg1);
     } else {
-        TCGv_i64 t0 = tcg_const_i64(arg2);
-        tcg_gen_shr_i64(ret, arg1, t0);
-        tcg_temp_free_i64(t0);
+        tcg_gen_shr_i64(ret, arg1, tcg_constant_i64(arg2));
     }
 }
 
@@ -1443,9 +1425,7 @@ void tcg_gen_sari_i64(TCGv_i64 ret, TCGv_i64 arg1, int64_t arg2)
     } else if (arg2 == 0) {
         tcg_gen_mov_i64(ret, arg1);
     } else {
-        TCGv_i64 t0 = tcg_const_i64(arg2);
-        tcg_gen_sar_i64(ret, arg1, t0);
-        tcg_temp_free_i64(t0);
+        tcg_gen_sar_i64(ret, arg1, tcg_constant_i64(arg2));
     }
 }
 
@@ -1468,12 +1448,17 @@ void tcg_gen_brcond_i64(TCGCond cond, TCGv_i64 arg1, TCGv_i64 arg2, TCGLabel *l)
 
 void tcg_gen_brcondi_i64(TCGCond cond, TCGv_i64 arg1, int64_t arg2, TCGLabel *l)
 {
-    if (cond == TCG_COND_ALWAYS) {
+    if (TCG_TARGET_REG_BITS == 64) {
+        tcg_gen_brcond_i64(cond, arg1, tcg_constant_i64(arg2), l);
+    } else if (cond == TCG_COND_ALWAYS) {
         tcg_gen_br(l);
     } else if (cond != TCG_COND_NEVER) {
-        TCGv_i64 t0 = tcg_const_i64(arg2);
-        tcg_gen_brcond_i64(cond, arg1, t0, l);
-        tcg_temp_free_i64(t0);
+        l->refs++;
+        tcg_gen_op6ii_i32(INDEX_op_brcond2_i32,
+                          TCGV_LOW(arg1), TCGV_HIGH(arg1),
+                          tcg_constant_i32(arg2),
+                          tcg_constant_i32(arg2 >> 32),
+                          cond, label_arg(l));
     }
 }
 
@@ -1499,9 +1484,19 @@ void tcg_gen_setcond_i64(TCGCond cond, TCGv_i64 ret,
 void tcg_gen_setcondi_i64(TCGCond cond, TCGv_i64 ret,
                           TCGv_i64 arg1, int64_t arg2)
 {
-    TCGv_i64 t0 = tcg_const_i64(arg2);
-    tcg_gen_setcond_i64(cond, ret, arg1, t0);
-    tcg_temp_free_i64(t0);
+    if (TCG_TARGET_REG_BITS == 64) {
+        tcg_gen_setcond_i64(cond, ret, arg1, tcg_constant_i64(arg2));
+    } else if (cond == TCG_COND_ALWAYS) {
+        tcg_gen_movi_i64(ret, 1);
+    } else if (cond == TCG_COND_NEVER) {
+        tcg_gen_movi_i64(ret, 0);
+    } else {
+        tcg_gen_op6i_i32(INDEX_op_setcond2_i32, TCGV_LOW(ret),
+                         TCGV_LOW(arg1), TCGV_HIGH(arg1),
+                         tcg_constant_i32(arg2),
+                         tcg_constant_i32(arg2 >> 32), cond);
+        tcg_gen_movi_i32(TCGV_HIGH(ret), 0);
+    }
 }
 
 void tcg_gen_muli_i64(TCGv_i64 ret, TCGv_i64 arg1, int64_t arg2)
@@ -1690,7 +1685,7 @@ void tcg_gen_bswap32_i64(TCGv_i64 ret, TCGv_i64 arg)
     } else {
         TCGv_i64 t0 = tcg_temp_new_i64();
         TCGv_i64 t1 = tcg_temp_new_i64();
-        TCGv_i64 t2 = tcg_const_i64(0x00ff00ff);
+        TCGv_i64 t2 = tcg_constant_i64(0x00ff00ff);
 
                                         /* arg = ....abcd */
         tcg_gen_shri_i64(t0, arg, 8);   /*  t0 = .....abc */
@@ -1706,7 +1701,6 @@ void tcg_gen_bswap32_i64(TCGv_i64 ret, TCGv_i64 arg)
 
         tcg_temp_free_i64(t0);
         tcg_temp_free_i64(t1);
-        tcg_temp_free_i64(t2);
     }
 }
 
@@ -1850,16 +1844,16 @@ void tcg_gen_clzi_i64(TCGv_i64 ret, TCGv_i64 arg1, uint64_t arg2)
     if (TCG_TARGET_REG_BITS == 32
         && TCG_TARGET_HAS_clz_i32
         && arg2 <= 0xffffffffu) {
-        TCGv_i32 t = tcg_const_i32((uint32_t)arg2 - 32);
-        tcg_gen_clz_i32(t, TCGV_LOW(arg1), t);
+        TCGv_i32 t = tcg_temp_new_i32();
+        tcg_gen_clzi_i32(t, TCGV_LOW(arg1), arg2 - 32);
         tcg_gen_addi_i32(t, t, 32);
         tcg_gen_clz_i32(TCGV_LOW(ret), TCGV_HIGH(arg1), t);
         tcg_gen_movi_i32(TCGV_HIGH(ret), 0);
         tcg_temp_free_i32(t);
     } else {
-        TCGv_i64 t = tcg_const_i64(arg2);
-        tcg_gen_clz_i64(ret, arg1, t);
-        tcg_temp_free_i64(t);
+        TCGv_i64 t0 = tcg_const_i64(arg2);
+        tcg_gen_clz_i64(ret, arg1, t0);
+        tcg_temp_free_i64(t0);
     }
 }
 
@@ -1881,7 +1875,7 @@ void tcg_gen_ctz_i64(TCGv_i64 ret, TCGv_i64 arg1, TCGv_i64 arg2)
             tcg_gen_clzi_i64(t, t, 64);
             tcg_gen_xori_i64(t, t, 63);
         }
-        z = tcg_const_i64(0);
+        z = tcg_constant_i64(0);
         tcg_gen_movcond_i64(TCG_COND_EQ, ret, arg1, z, arg2, t);
         tcg_temp_free_i64(t);
         tcg_temp_free_i64(z);
@@ -1895,8 +1889,8 @@ void tcg_gen_ctzi_i64(TCGv_i64 ret, TCGv_i64 arg1, uint64_t arg2)
     if (TCG_TARGET_REG_BITS == 32
         && TCG_TARGET_HAS_ctz_i32
         && arg2 <= 0xffffffffu) {
-        TCGv_i32 t32 = tcg_const_i32((uint32_t)arg2 - 32);
-        tcg_gen_ctz_i32(t32, TCGV_HIGH(arg1), t32);
+        TCGv_i32 t32 = tcg_temp_new_i32();
+        tcg_gen_ctzi_i32(t32, TCGV_HIGH(arg1), arg2 - 32);
         tcg_gen_addi_i32(t32, t32, 32);
         tcg_gen_ctz_i32(TCGV_LOW(ret), TCGV_LOW(arg1), t32);
         tcg_gen_movi_i32(TCGV_HIGH(ret), 0);
@@ -1911,9 +1905,9 @@ void tcg_gen_ctzi_i64(TCGv_i64 ret, TCGv_i64 arg1, uint64_t arg2)
         tcg_gen_ctpop_i64(ret, t);
         tcg_temp_free_i64(t);
     } else {
-        TCGv_i64 t64 = tcg_const_i64(arg2);
-        tcg_gen_ctz_i64(ret, arg1, t64);
-        tcg_temp_free_i64(t64);
+        TCGv_i64 t0 = tcg_const_i64(arg2);
+        tcg_gen_ctz_i64(ret, arg1, t0);
+        tcg_temp_free_i64(t0);
     }
 }
 
@@ -1969,9 +1963,7 @@ void tcg_gen_rotli_i64(TCGv_i64 ret, TCGv_i64 arg1, int64_t arg2)
     if (arg2 == 0) {
         tcg_gen_mov_i64(ret, arg1);
     } else if (TCG_TARGET_HAS_rot_i64) {
-        TCGv_i64 t0 = tcg_const_i64(arg2);
-        tcg_gen_rotl_i64(ret, arg1, t0);
-        tcg_temp_free_i64(t0);
+        tcg_gen_rotl_i64(ret, arg1, tcg_constant_i64(arg2));
     } else {
         TCGv_i64 t0, t1;
         t0 = tcg_temp_new_i64();
@@ -2089,9 +2081,8 @@ void tcg_gen_deposit_z_i64(TCGv_i64 ret, TCGv_i64 arg,
         tcg_gen_andi_i64(ret, arg, (1ull << len) - 1);
     } else if (TCG_TARGET_HAS_deposit_i64
                && TCG_TARGET_deposit_i64_valid(ofs, len)) {
-        TCGv_i64 zero = tcg_const_i64(0);
+        TCGv_i64 zero = tcg_constant_i64(0);
         tcg_gen_op5ii_i64(INDEX_op_deposit_i64, ret, zero, arg, ofs, len);
-        tcg_temp_free_i64(zero);
     } else {
         if (TCG_TARGET_REG_BITS == 32) {
             if (ofs >= 32) {
@@ -3117,9 +3108,8 @@ void tcg_gen_atomic_cmpxchg_i32(TCGv_i32 retv, TCGv addr, TCGv_i32 cmpv,
 
 #ifdef CONFIG_SOFTMMU
         {
-            TCGv_i32 oi = tcg_const_i32(make_memop_idx(memop & ~MO_SIGN, idx));
-            gen(retv, cpu_env, addr, cmpv, newv, oi);
-            tcg_temp_free_i32(oi);
+            TCGMemOpIdx oi = make_memop_idx(memop & ~MO_SIGN, idx);
+            gen(retv, cpu_env, addr, cmpv, newv, tcg_constant_i32(oi));
         }
 #else
         gen(retv, cpu_env, addr, cmpv, newv);
@@ -3162,9 +3152,8 @@ void tcg_gen_atomic_cmpxchg_i64(TCGv_i64 retv, TCGv addr, TCGv_i64 cmpv,
 
 #ifdef CONFIG_SOFTMMU
         {
-            TCGv_i32 oi = tcg_const_i32(make_memop_idx(memop, idx));
-            gen(retv, cpu_env, addr, cmpv, newv, oi);
-            tcg_temp_free_i32(oi);
+            TCGMemOpIdx oi = make_memop_idx(memop, idx);
+            gen(retv, cpu_env, addr, cmpv, newv, tcg_constant_i32(oi));
         }
 #else
         gen(retv, cpu_env, addr, cmpv, newv);
@@ -3226,9 +3215,8 @@ static void do_atomic_op_i32(TCGv_i32 ret, TCGv addr, TCGv_i32 val,
 
 #ifdef CONFIG_SOFTMMU
     {
-        TCGv_i32 oi = tcg_const_i32(make_memop_idx(memop & ~MO_SIGN, idx));
-        gen(ret, cpu_env, addr, val, oi);
-        tcg_temp_free_i32(oi);
+        TCGMemOpIdx oi = make_memop_idx(memop & ~MO_SIGN, idx);
+        gen(ret, cpu_env, addr, val, tcg_constant_i32(oi));
     }
 #else
     gen(ret, cpu_env, addr, val);
@@ -3272,9 +3260,8 @@ static void do_atomic_op_i64(TCGv_i64 ret, TCGv addr, TCGv_i64 val,
 
 #ifdef CONFIG_SOFTMMU
         {
-            TCGv_i32 oi = tcg_const_i32(make_memop_idx(memop & ~MO_SIGN, idx));
-            gen(ret, cpu_env, addr, val, oi);
-            tcg_temp_free_i32(oi);
+            TCGMemOpIdx oi = make_memop_idx(memop & ~MO_SIGN, idx);
+            gen(ret, cpu_env, addr, val, tcg_constant_i32(oi));
         }
 #else
         gen(ret, cpu_env, addr, val);
-- 
2.25.1


