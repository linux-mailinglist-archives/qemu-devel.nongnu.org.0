Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 152876B2E82
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:21:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMaM-00059Q-9H; Thu, 09 Mar 2023 15:09:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMaJ-00050B-Ox
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:55 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMaH-0001bR-MN
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:55 -0500
Received: by mail-pl1-x62e.google.com with SMTP id n6so3224183plf.5
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392592;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vkOcZIkhovadaxOuqag5xwc+XnGtPssFyKztAIN0fdU=;
 b=SJJhjAfa6Z5QeqP9XPSDMB90UFTZjHrbB5MX/EW1epKlyOEkrEI80eSYTciMjrELUB
 7JiQhe4F9J/6kRSMrZn2dJlOKep7tosGDPy/i3xtqCNDXZf3kWalLzlmBQjWFLc45Kdm
 eUWMIcVIf18WiZAS4ghfC1N9egyeh8U2qThPw/mtTl2U6dDFD7ER5mV7+iwZNYtjGn9/
 E+1u7nsLe1PuSU9+BFBx80+LXOAG1HoqFsonduvNoBzQP5ZPGBRra/yBE/BnOuMgzzhI
 CUkWxIhNrPuZpIqNqf3Si7KYUVU3lhdagpjv2b2l4F8uGUoyr9lBI6XtmsVNuv4Em9sO
 tAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392592;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vkOcZIkhovadaxOuqag5xwc+XnGtPssFyKztAIN0fdU=;
 b=H8c1o8pWYY6+AEJXZK79OKHctPQ/7bBvk6Nvs5EY69ie3pYXF0+MluTOmgDsnc6brD
 NoVO5jfSKulPAlQQLFxublYian+BfDAXT8eu+uDSUNKpqdTZFidHH+j4MYbU8U+hervx
 5tIq+o17+vlvIw/cSqNSfk8rgpPsx9WAjm8HKtNGmoJGNpEV3YOAuUEL0iCQPy/ECZFT
 rv2KhVmAcMag1X4S46EEzdUtT8aOCiZLHSHx8u0oyZ/upxQ1yhGewZVr8B9a2t+u+9F2
 OX7zouIGmAJlBHTgBW/PZF4MZWlUtOyWx1MKDZea+U1zR1iwOxFE8v7y36KkNWxYzs8R
 tjUw==
X-Gm-Message-State: AO0yUKXYc8dXAssBcJNBq7IM+woVsAdQmbvJoTEiDgaeT1Svi/PVkk3k
 Zf5wIS7Wc9x3sKO5jqNOfpQ4x/2zrKcvkFeGo7I=
X-Google-Smtp-Source: AK7set8b0uawxIU2eKVgw4jey42abR+zsEgwJb740Ipr6oraDKtBD3dKBWzmLAvlaRWbw9uwL6g9dA==
X-Received: by 2002:a17:902:a512:b0:19d:1674:c04d with SMTP id
 s18-20020a170902a51200b0019d1674c04dmr18738196plq.61.1678392592343; 
 Thu, 09 Mar 2023 12:09:52 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170902aa4200b001991e4e0bdcsm43797plr.233.2023.03.09.12.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:09:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 68/91] target/arm: Use rmode >= 0 for need_rmode
Date: Thu,  9 Mar 2023 12:05:27 -0800
Message-Id: <20230309200550.3878088-69-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
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


