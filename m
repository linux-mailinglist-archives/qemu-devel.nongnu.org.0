Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEA66AF0B9
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:35:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZc9Y-0003Xp-00; Tue, 07 Mar 2023 13:35:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9U-0003WI-EP
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:08 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9S-0007hf-JV
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:08 -0500
Received: by mail-pl1-x62e.google.com with SMTP id i5so15137658pla.2
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678214105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vkOcZIkhovadaxOuqag5xwc+XnGtPssFyKztAIN0fdU=;
 b=BBo2LFwgxlUm8y/ZkNe9+CTMqsc3WVyP7uNZfNTVBGpsptr3r51GR2DcBLKxaRUNFo
 2lZjIv1y/M7ipvsBM7Vs4Xtmq0xOGn5R9ahfG+d1EQOkEbK5edpxisU+8VMBKCwrf/DR
 CyDkdqpK3wtpsQjvjuyMncBa3NWqs/wlyVGuFoDZsVY2zJtka9++m7ziEQdZ2g53UfSp
 2rYkAIp6ryeTkE1lPrSi1xd2/rCPGYXrfu/w8HwtnZ1y5Vvx0eT7clQSSVAW4kI5VHpA
 CY3odM+8dj1/tOCmMl5ZKfmN0LzZlai+yl2VyJrb8G7kuiF8PHQGtKe2671LvfcmI+wt
 bLEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678214105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vkOcZIkhovadaxOuqag5xwc+XnGtPssFyKztAIN0fdU=;
 b=VPe1PpVOoFCP8JEV6vA6Rsy0J+xJZLftq8MGaGBzC4LtyC69wq9Ne9sn5oLR1d0VuB
 pN8VWKyh+Fo6wH/PyxpioMo6ez3lH0cEDmaRRAJpo320u7Pr+9d1qyk/raKBotJT/m/I
 FbHjkOVzyHpN+S0LTstwWYiVMAeerztDSTndYYvTYSQJ3pI6fewPvleyJ4t+VbTvstlD
 tRHDM5z2ElG9cVQWLthtF1gTYQyyDzRusoBJWuzH1Oe+hdLK7gLaGeiCy9ECKICejyk1
 k3a7jssfvcYfyNM7Qst14duC+6tQL/Y0iYRsTAyiX2euBeMO0YZv0K+wE5jeDC6v1F0U
 ukZA==
X-Gm-Message-State: AO0yUKUtyxrc7iltCp5ZG/LlQjR/ICynQMrf8t5NVUgVVni/mkKKdBHF
 gVpYU6AzrOYKlYUbiJ1Zk5DRrst2o/J/M+7QlZs=
X-Google-Smtp-Source: AK7set/um5f605BmFMVOAOIpEASu8zGk5dHEmuVk91a2dxne6nhAqJafw+j14p/dznWiKU3f5nDsow==
X-Received: by 2002:a17:90b:4c43:b0:237:cbcb:efba with SMTP id
 np3-20020a17090b4c4300b00237cbcbefbamr16836969pjb.17.1678214105082; 
 Tue, 07 Mar 2023 10:35:05 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a17090a1b0100b0022c0a05229fsm7757940pjq.41.2023.03.07.10.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:35:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 01/25] target/arm: Use rmode >= 0 for need_rmode
Date: Tue,  7 Mar 2023 10:34:39 -0800
Message-Id: <20230307183503.2512684-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307183503.2512684-1-richard.henderson@linaro.org>
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

Initialize rmode to -1 instead of keeping two variables.
This is already used elsewhere in translate-a64.c.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 34 ++++++----------------------------
 1 file changed, 6 insertions(+), 28 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 2c2ea45b47..bef66086a2 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -12133,7 +12133,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
     int rn = extract32(insn, 5, 5);
     int rd = extract32(insn, 0, 5);
     bool need_fpstatus = false;
-    bool need_rmode = false;
     int rmode = -1;
     TCGv_i32 tcg_rmode;
     TCGv_ptr tcg_fpstatus;
@@ -12283,7 +12282,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
         case 0x7a: /* FCVTPU */
         case 0x7b: /* FCVTZU */
             need_fpstatus = true;
-            need_rmode = true;
             rmode = extract32(opcode, 5, 1) | (extract32(opcode, 0, 1) << 1);
             if (size == 3 && !is_q) {
                 unallocated_encoding(s);
@@ -12293,7 +12291,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
         case 0x5c: /* FCVTAU */
         case 0x1c: /* FCVTAS */
             need_fpstatus = true;
-            need_rmode = true;
             rmode = FPROUNDING_TIEAWAY;
             if (size == 3 && !is_q) {
                 unallocated_encoding(s);
@@ -12352,7 +12349,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
         case 0x19: /* FRINTM */
         case 0x38: /* FRINTP */
         case 0x39: /* FRINTZ */
-            need_rmode = true;
             rmode = extract32(opcode, 5, 1) | (extract32(opcode, 0, 1) << 1);
             /* fall through */
         case 0x59: /* FRINTX */
@@ -12364,7 +12360,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
             }
             break;
         case 0x58: /* FRINTA */
-            need_rmode = true;
             rmode = FPROUNDING_TIEAWAY;
             need_fpstatus = true;
             if (size == 3 && !is_q) {
@@ -12380,7 +12375,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
             break;
         case 0x1e: /* FRINT32Z */
         case 0x1f: /* FRINT64Z */
-            need_rmode = true;
             rmode = FPROUNDING_ZERO;
             /* fall through */
         case 0x5e: /* FRINT32X */
@@ -12406,12 +12400,12 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
         return;
     }
 
-    if (need_fpstatus || need_rmode) {
+    if (need_fpstatus || rmode >= 0) {
         tcg_fpstatus = fpstatus_ptr(FPST_FPCR);
     } else {
         tcg_fpstatus = NULL;
     }
-    if (need_rmode) {
+    if (rmode >= 0) {
         tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rmode));
         gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
     } else {
@@ -12595,7 +12589,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
     }
     clear_vec_high(s, is_q, rd);
 
-    if (need_rmode) {
+    if (tcg_rmode) {
         gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
     }
 }
@@ -12625,9 +12619,8 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
     int pass;
     TCGv_i32 tcg_rmode = NULL;
     TCGv_ptr tcg_fpstatus = NULL;
-    bool need_rmode = false;
     bool need_fpst = true;
-    int rmode;
+    int rmode = -1;
 
     if (!dc_isar_feature(aa64_fp16, s)) {
         unallocated_encoding(s);
@@ -12676,27 +12669,22 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
     case 0x3f: /* FRECPX */
         break;
     case 0x18: /* FRINTN */
-        need_rmode = true;
         only_in_vector = true;
         rmode = FPROUNDING_TIEEVEN;
         break;
     case 0x19: /* FRINTM */
-        need_rmode = true;
         only_in_vector = true;
         rmode = FPROUNDING_NEGINF;
         break;
     case 0x38: /* FRINTP */
-        need_rmode = true;
         only_in_vector = true;
         rmode = FPROUNDING_POSINF;
         break;
     case 0x39: /* FRINTZ */
-        need_rmode = true;
         only_in_vector = true;
         rmode = FPROUNDING_ZERO;
         break;
     case 0x58: /* FRINTA */
-        need_rmode = true;
         only_in_vector = true;
         rmode = FPROUNDING_TIEAWAY;
         break;
@@ -12706,43 +12694,33 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
         /* current rounding mode */
         break;
     case 0x1a: /* FCVTNS */
-        need_rmode = true;
         rmode = FPROUNDING_TIEEVEN;
         break;
     case 0x1b: /* FCVTMS */
-        need_rmode = true;
         rmode = FPROUNDING_NEGINF;
         break;
     case 0x1c: /* FCVTAS */
-        need_rmode = true;
         rmode = FPROUNDING_TIEAWAY;
         break;
     case 0x3a: /* FCVTPS */
-        need_rmode = true;
         rmode = FPROUNDING_POSINF;
         break;
     case 0x3b: /* FCVTZS */
-        need_rmode = true;
         rmode = FPROUNDING_ZERO;
         break;
     case 0x5a: /* FCVTNU */
-        need_rmode = true;
         rmode = FPROUNDING_TIEEVEN;
         break;
     case 0x5b: /* FCVTMU */
-        need_rmode = true;
         rmode = FPROUNDING_NEGINF;
         break;
     case 0x5c: /* FCVTAU */
-        need_rmode = true;
         rmode = FPROUNDING_TIEAWAY;
         break;
     case 0x7a: /* FCVTPU */
-        need_rmode = true;
         rmode = FPROUNDING_POSINF;
         break;
     case 0x7b: /* FCVTZU */
-        need_rmode = true;
         rmode = FPROUNDING_ZERO;
         break;
     case 0x2f: /* FABS */
@@ -12775,11 +12753,11 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
         return;
     }
 
-    if (need_rmode || need_fpst) {
+    if (rmode >= 0 || need_fpst) {
         tcg_fpstatus = fpstatus_ptr(FPST_FPCR_F16);
     }
 
-    if (need_rmode) {
+    if (rmode >= 0) {
         tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rmode));
         gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
     }
-- 
2.34.1


