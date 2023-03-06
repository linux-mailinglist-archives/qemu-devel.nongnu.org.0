Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3A66AB3C3
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:42:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyul-0006Kt-HU; Sun, 05 Mar 2023 19:41:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYyth-0004QV-GH
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:15 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytf-0006b8-5v
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:13 -0500
Received: by mail-pl1-x62f.google.com with SMTP id a9so8472368plh.11
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063209;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QlyFLIhACwXwUjrk2EQuzfxdGrg4MNmwLSxYcrNJy9I=;
 b=HZkd3Bso8tE2NzWOe4FT7KE4Qmdl4L7KuHmrVCpp4d9Ud0CvhCJRRZTJ1+Xs62lBu+
 z8w8d6/kUIOK3zuJXYyoHOD2hVRt0Jst6vUEczE3yG7N+j8eCDn0S634kft0Edc4fbZA
 EIryWNlOCwVitJ6a6/RRtCauGhQgS7OaDJ6na7QsSyraR9CU1xb59GkHm4rtskG25tJP
 jU2VrBMo4g51rdj7deiG/36RUJoE2H64UVw0g29uDZRj19My0xqjeMY+88qf01eABKNu
 WupNWEXev4W7ks5s0mdN1yO+v1jZISjBhZHlKQNXL4HjqOUoWkoFpjzDLVFo88HV7cKc
 ioxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063209;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QlyFLIhACwXwUjrk2EQuzfxdGrg4MNmwLSxYcrNJy9I=;
 b=pXd1eod9Ni7pEa3ijJaaJKf4Cnvudf3RunruNStNpL23lse+BDiOOAch12KI4iViCI
 AOWNdVtZ9V6MQX/ksJYFIbP5h5ZTU5nNNxOeGPktEsSYVebCU5oqRFw1wCB7ykahYMQl
 DD5Qp8xOnFXLfWJ78o+rvuIXJVKy4PxvDTy7pTVsQaU7m1Dr0W1gHXA691WOcLN0z3Km
 VtTo2elARvRVwxqaPGo9lnscR4hJmpbCeV+SH5xFBiu3E66OiGSuuc9X+jGiwop0de+l
 H0Rm1mcTS7uAe2RcEJXPpyd2Co/YBP+Fxb1uts7SacSrbdd3D0y9VMXBA8Vlqr7q4ZpC
 oLng==
X-Gm-Message-State: AO0yUKUfmQpUvI3eZaWnJQRgHZtuBd0wbF2yGJ726MgwfyelCr1yuN7l
 /2yyxLnfqB9QwnAN5SvNE/qTLPPY2iqhxR7PJC4U1w==
X-Google-Smtp-Source: AK7set8NnS4Bj+rzVI9WxRCSEakiQdDZ7SHAqLSte7NLr1ZP7N2zzKq4E2NVM9pqL1uK7W8+uQ8e8Q==
X-Received: by 2002:a17:90b:224e:b0:233:d108:1c62 with SMTP id
 hk14-20020a17090b224e00b00233d1081c62mr9836851pjb.32.1678063208800; 
 Sun, 05 Mar 2023 16:40:08 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a17090b050d00b002372106a5c2sm6567901pjz.37.2023.03.05.16.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:40:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 15/84] target/arm: Remove arm_free_cc, a64_free_cc
Date: Sun,  5 Mar 2023 16:38:45 -0800
Message-Id: <20230306003954.1866998-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Translators are no longer required to free tcg temporaries.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.h     |  1 -
 target/arm/tcg/translate-a64.c | 17 ++++-------------
 target/arm/tcg/translate.c     |  9 ---------
 3 files changed, 4 insertions(+), 23 deletions(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 4001372acd..5c37574cb8 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -304,7 +304,6 @@ static inline void gen_a64_update_pc(DisasContext *s, target_long diff)
 #endif
 
 void arm_test_cc(DisasCompare *cmp, int cc);
-void arm_free_cc(DisasCompare *cmp);
 void arm_jump_cc(DisasCompare *cmp, TCGLabel *label);
 void arm_gen_test_cc(int cc, TCGLabel *label);
 MemOp pow2_align(unsigned i);
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index f15e591293..d1e677ca76 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -319,18 +319,13 @@ static void a64_test_cc(DisasCompare64 *c64, int cc)
 
     arm_test_cc(&c32, cc);
 
-    /* Sign-extend the 32-bit value so that the GE/LT comparisons work
-       * properly.  The NE/EQ comparisons are also fine with this choice.  */
+    /*
+     * Sign-extend the 32-bit value so that the GE/LT comparisons work
+     * properly.  The NE/EQ comparisons are also fine with this choice.
+      */
     c64->cond = c32.cond;
     c64->value = tcg_temp_new_i64();
     tcg_gen_ext_i32_i64(c64->value, c32.value);
-
-    arm_free_cc(&c32);
-}
-
-static void a64_free_cc(DisasCompare64 *c64)
-{
-    tcg_temp_free_i64(c64->value);
 }
 
 static void gen_rebuild_hflags(DisasContext *s)
@@ -5315,7 +5310,6 @@ static void disas_cc(DisasContext *s, uint32_t insn)
     tcg_t0 = tcg_temp_new_i32();
     arm_test_cc(&c, cond);
     tcg_gen_setcondi_i32(tcg_invert_cond(c.cond), tcg_t0, c.value, 0);
-    arm_free_cc(&c);
 
     /* Load the arguments for the new comparison.  */
     if (is_imm) {
@@ -5435,8 +5429,6 @@ static void disas_cond_select(DisasContext *s, uint32_t insn)
         tcg_gen_movcond_i64(c.cond, tcg_rd, c.value, zero, t_true, t_false);
     }
 
-    a64_free_cc(&c);
-
     if (!sf) {
         tcg_gen_ext32u_i64(tcg_rd, tcg_rd);
     }
@@ -6256,7 +6248,6 @@ static void disas_fp_csel(DisasContext *s, uint32_t insn)
     tcg_gen_movcond_i64(c.cond, t_true, c.value, tcg_constant_i64(0),
                         t_true, t_false);
     tcg_temp_free_i64(t_false);
-    a64_free_cc(&c);
 
     /* Note that sregs & hregs write back zeros to the high bits,
        and we've already done the zero-extension.  */
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index ecf09cb12b..f414a891db 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -754,13 +754,6 @@ void arm_test_cc(DisasCompare *cmp, int cc)
     cmp->value_global = global;
 }
 
-void arm_free_cc(DisasCompare *cmp)
-{
-    if (!cmp->value_global) {
-        tcg_temp_free_i32(cmp->value);
-    }
-}
-
 void arm_jump_cc(DisasCompare *cmp, TCGLabel *label)
 {
     tcg_gen_brcondi_i32(cmp->cond, cmp->value, 0, label);
@@ -771,7 +764,6 @@ void arm_gen_test_cc(int cc, TCGLabel *label)
     DisasCompare cmp;
     arm_test_cc(&cmp, cc);
     arm_jump_cc(&cmp, label);
-    arm_free_cc(&cmp);
 }
 
 void gen_set_condexec(DisasContext *s)
@@ -9125,7 +9117,6 @@ static bool trans_CSEL(DisasContext *s, arg_CSEL *a)
 
     arm_test_cc(&c, a->fcond);
     tcg_gen_movcond_i32(c.cond, rn, c.value, zero, rn, rm);
-    arm_free_cc(&c);
 
     store_reg(s, a->rd, rn);
     tcg_temp_free_i32(rm);
-- 
2.34.1


