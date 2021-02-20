Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D36320736
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 22:34:39 +0100 (CET)
Received: from localhost ([::1]:46016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDZtd-0004mg-Uf
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 16:34:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lDZoM-000147-Lk
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 16:29:10 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:36872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lDZoK-0003nr-CR
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 16:29:10 -0500
Received: by mail-pf1-x429.google.com with SMTP id b145so4198723pfb.4
 for <qemu-devel@nongnu.org>; Sat, 20 Feb 2021 13:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aAxX9e1iUwj7TwOAad2hIzBCk1BvDRE9+2RWFovj+gI=;
 b=l2wfZSdSOMzA0UIYelqhi3PBVlK9dQyKvlWkG74gFub2h7ejRlmweCZlOaYzfm/zH0
 /38q/9qvgV0FDWnpeuSkB+PaZZ/V0GgHLgDpbmGC0YUMcSOvx69/faspFNPSbFYLiprW
 pJUwBUKRE6h0h+vZGpVGoQc0sr2ixzwwrXkQn0ZlLVEFx0IQKmVCFG6SfBXbEnFkjR1a
 uNVy4BHofoNqaxK7rEWNA+AzBs4pL6CJ5F2S3dfs+jzUcmaOaPptLI/extMySP8WDPkZ
 CdirpKsu86qRlEVXXzX0sMv/TX+3liuzDmFVI32v3ci7ZFyjvfY34C6D2o1WJVLYkmvG
 ZpLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aAxX9e1iUwj7TwOAad2hIzBCk1BvDRE9+2RWFovj+gI=;
 b=R01/SA/korNApGu9vQU4oAu6rtBRw8myS0dYddmbbit/buOVzyaEc1udc/ZItU4vFH
 k7d3Gdap1n5iUcRqdG5vu9VA9YtgzO/EePyuSSh5ESBCQgQwUgsSnV/KJaMfHo7apN54
 Y+K6aOZq7qwX+yu7esojTQVpOMG2fHrLqm/GoerZ9OJ9PmjcJHxVzvadIHjVUEb51jj7
 Zn+DDfzuXa2UOv03sWg96b8o/NSQ1nOqfh701mklN0RqnBGUQX9gBzwebytAiO0CtwEs
 JZX6LCLBeLUlRrPhYYOg86epppqtZGe+dDvWzF01BNbpiISG1PmitMMxxVO9ZTV9TJeY
 6mJQ==
X-Gm-Message-State: AOAM5304K8s2pDVw/Tr7LGq4atwVZejN6O6WWjrptInS8Pts7EYps5xX
 cbd8Kd+oWBg9w+Chh+aYG51sisfZu3JVmw==
X-Google-Smtp-Source: ABdhPJw71NfhPDmVIAC5aEKg9AjJwcrr42OmMrV4X7LcdiL3iF59MYTuPJLx/wyhQ+ruAk3ZxPgFow==
X-Received: by 2002:a63:a54e:: with SMTP id r14mr12676060pgu.380.1613856546860; 
 Sat, 20 Feb 2021 13:29:06 -0800 (PST)
Received: from localhost.localdomain (24-113-145-216.wavecable.com.
 [24.113.145.216])
 by smtp.gmail.com with ESMTPSA id h186sm9726559pgc.38.2021.02.20.13.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Feb 2021 13:29:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] tcg/aarch64: Fix generation of "scalar" vector operations
Date: Sat, 20 Feb 2021 13:29:03 -0800
Message-Id: <20210220212903.20944-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210220212903.20944-1-richard.henderson@linaro.org>
References: <20210220212903.20944-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For some vector operations, "1D" is not a valid type, and there
are separate instructions for the 64-bit scalar operation.

Buglink: https://bugs.launchpad.net/qemu/+bug/1916112
Fixes: 14e4c1e2355 ("tcg/aarch64: Add vector operations")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 211 ++++++++++++++++++++++++++++++-----
 1 file changed, 181 insertions(+), 30 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 903ab97473..3ddc0f6864 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -519,6 +519,39 @@ typedef enum {
     I3606_BIC       = 0x2f001400,
     I3606_ORR       = 0x0f001400,
 
+    /* AdvSIMD scalar shift by immediate */
+    I3609_SSHR      = 0x5f000400,
+    I3609_SSRA      = 0x5f001400,
+    I3609_SHL       = 0x5f005400,
+    I3609_USHR      = 0x7f000400,
+    I3609_USRA      = 0x7f001400,
+    I3609_SLI       = 0x7f005400,
+
+    /* AdvSIMD scalar three same */
+    I3611_SQADD     = 0x5e200c00,
+    I3611_SQSUB     = 0x5e202c00,
+    I3611_CMGT      = 0x5e203400,
+    I3611_CMGE      = 0x5e203c00,
+    I3611_SSHL      = 0x5e204400,
+    I3611_ADD       = 0x5e208400,
+    I3611_CMTST     = 0x5e208c00,
+    I3611_UQADD     = 0x7e200c00,
+    I3611_UQSUB     = 0x7e202c00,
+    I3611_CMHI      = 0x7e203400,
+    I3611_CMHS      = 0x7e203c00,
+    I3611_USHL      = 0x7e204400,
+    I3611_SUB       = 0x7e208400,
+    I3611_CMEQ      = 0x7e208c00,
+
+    /* AdvSIMD scalar two-reg misc */
+    I3612_CMGT0     = 0x5e208800,
+    I3612_CMEQ0     = 0x5e209800,
+    I3612_CMLT0     = 0x5e20a800,
+    I3612_ABS       = 0x5e20b800,
+    I3612_CMGE0     = 0x7e208800,
+    I3612_CMLE0     = 0x7e209800,
+    I3612_NEG       = 0x7e20b800,
+
     /* AdvSIMD shift by immediate */
     I3614_SSHR      = 0x0f000400,
     I3614_SSRA      = 0x0f001400,
@@ -735,6 +768,25 @@ static void tcg_out_insn_3606(TCGContext *s, AArch64Insn insn, bool q,
               | (imm8 & 0xe0) << (16 - 5) | (imm8 & 0x1f) << 5);
 }
 
+static void tcg_out_insn_3609(TCGContext *s, AArch64Insn insn,
+                              TCGReg rd, TCGReg rn, unsigned immhb)
+{
+    tcg_out32(s, insn | immhb << 16 | (rn & 0x1f) << 5 | (rd & 0x1f));
+}
+
+static void tcg_out_insn_3611(TCGContext *s, AArch64Insn insn,
+                              unsigned size, TCGReg rd, TCGReg rn, TCGReg rm)
+{
+    tcg_out32(s, insn | (size << 22) | (rm & 0x1f) << 16
+              | (rn & 0x1f) << 5 | (rd & 0x1f));
+}
+
+static void tcg_out_insn_3612(TCGContext *s, AArch64Insn insn,
+                              unsigned size, TCGReg rd, TCGReg rn)
+{
+    tcg_out32(s, insn | (size << 22) | (rn & 0x1f) << 5 | (rd & 0x1f));
+}
+
 static void tcg_out_insn_3614(TCGContext *s, AArch64Insn insn, bool q,
                               TCGReg rd, TCGReg rn, unsigned immhb)
 {
@@ -2234,23 +2286,38 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
                            unsigned vecl, unsigned vece,
                            const TCGArg *args, const int *const_args)
 {
-    static const AArch64Insn cmp_insn[16] = {
+    static const AArch64Insn cmp_vec_insn[16] = {
         [TCG_COND_EQ] = I3616_CMEQ,
         [TCG_COND_GT] = I3616_CMGT,
         [TCG_COND_GE] = I3616_CMGE,
         [TCG_COND_GTU] = I3616_CMHI,
         [TCG_COND_GEU] = I3616_CMHS,
     };
-    static const AArch64Insn cmp0_insn[16] = {
+    static const AArch64Insn cmp_scalar_insn[16] = {
+        [TCG_COND_EQ] = I3611_CMEQ,
+        [TCG_COND_GT] = I3611_CMGT,
+        [TCG_COND_GE] = I3611_CMGE,
+        [TCG_COND_GTU] = I3611_CMHI,
+        [TCG_COND_GEU] = I3611_CMHS,
+    };
+    static const AArch64Insn cmp0_vec_insn[16] = {
         [TCG_COND_EQ] = I3617_CMEQ0,
         [TCG_COND_GT] = I3617_CMGT0,
         [TCG_COND_GE] = I3617_CMGE0,
         [TCG_COND_LT] = I3617_CMLT0,
         [TCG_COND_LE] = I3617_CMLE0,
     };
+    static const AArch64Insn cmp0_scalar_insn[16] = {
+        [TCG_COND_EQ] = I3612_CMEQ0,
+        [TCG_COND_GT] = I3612_CMGT0,
+        [TCG_COND_GE] = I3612_CMGE0,
+        [TCG_COND_LT] = I3612_CMLT0,
+        [TCG_COND_LE] = I3612_CMLE0,
+    };
 
     TCGType type = vecl + TCG_TYPE_V64;
     unsigned is_q = vecl;
+    bool is_scalar = !is_q && vece == MO_64;
     TCGArg a0, a1, a2, a3;
     int cmode, imm8;
 
@@ -2269,19 +2336,35 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         tcg_out_dupm_vec(s, type, vece, a0, a1, a2);
         break;
     case INDEX_op_add_vec:
-        tcg_out_insn(s, 3616, ADD, is_q, vece, a0, a1, a2);
+        if (is_scalar) {
+            tcg_out_insn(s, 3611, ADD, vece, a0, a1, a2);
+        } else {
+            tcg_out_insn(s, 3616, ADD, is_q, vece, a0, a1, a2);
+        }
         break;
     case INDEX_op_sub_vec:
-        tcg_out_insn(s, 3616, SUB, is_q, vece, a0, a1, a2);
+        if (is_scalar) {
+            tcg_out_insn(s, 3611, SUB, vece, a0, a1, a2);
+        } else {
+            tcg_out_insn(s, 3616, SUB, is_q, vece, a0, a1, a2);
+        }
         break;
     case INDEX_op_mul_vec:
         tcg_out_insn(s, 3616, MUL, is_q, vece, a0, a1, a2);
         break;
     case INDEX_op_neg_vec:
-        tcg_out_insn(s, 3617, NEG, is_q, vece, a0, a1);
+        if (is_scalar) {
+            tcg_out_insn(s, 3612, NEG, vece, a0, a1);
+        } else {
+            tcg_out_insn(s, 3617, NEG, is_q, vece, a0, a1);
+        }
         break;
     case INDEX_op_abs_vec:
-        tcg_out_insn(s, 3617, ABS, is_q, vece, a0, a1);
+        if (is_scalar) {
+            tcg_out_insn(s, 3612, ABS, vece, a0, a1);
+        } else {
+            tcg_out_insn(s, 3617, ABS, is_q, vece, a0, a1);
+        }
         break;
     case INDEX_op_and_vec:
         if (const_args[2]) {
@@ -2335,16 +2418,32 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         tcg_out_insn(s, 3616, EOR, is_q, 0, a0, a1, a2);
         break;
     case INDEX_op_ssadd_vec:
-        tcg_out_insn(s, 3616, SQADD, is_q, vece, a0, a1, a2);
+        if (is_scalar) {
+            tcg_out_insn(s, 3611, SQADD, vece, a0, a1, a2);
+        } else {
+            tcg_out_insn(s, 3616, SQADD, is_q, vece, a0, a1, a2);
+        }
         break;
     case INDEX_op_sssub_vec:
-        tcg_out_insn(s, 3616, SQSUB, is_q, vece, a0, a1, a2);
+        if (is_scalar) {
+            tcg_out_insn(s, 3611, SQSUB, vece, a0, a1, a2);
+        } else {
+            tcg_out_insn(s, 3616, SQSUB, is_q, vece, a0, a1, a2);
+        }
         break;
     case INDEX_op_usadd_vec:
-        tcg_out_insn(s, 3616, UQADD, is_q, vece, a0, a1, a2);
+        if (is_scalar) {
+            tcg_out_insn(s, 3611, UQADD, vece, a0, a1, a2);
+        } else {
+            tcg_out_insn(s, 3616, UQADD, is_q, vece, a0, a1, a2);
+        }
         break;
     case INDEX_op_ussub_vec:
-        tcg_out_insn(s, 3616, UQSUB, is_q, vece, a0, a1, a2);
+        if (is_scalar) {
+            tcg_out_insn(s, 3611, UQSUB, vece, a0, a1, a2);
+        } else {
+            tcg_out_insn(s, 3616, UQSUB, is_q, vece, a0, a1, a2);
+        }
         break;
     case INDEX_op_smax_vec:
         tcg_out_insn(s, 3616, SMAX, is_q, vece, a0, a1, a2);
@@ -2362,22 +2461,46 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         tcg_out_insn(s, 3617, NOT, is_q, 0, a0, a1);
         break;
     case INDEX_op_shli_vec:
-        tcg_out_insn(s, 3614, SHL, is_q, a0, a1, a2 + (8 << vece));
+        if (is_scalar) {
+            tcg_out_insn(s, 3609, SHL, a0, a1, a2 + (8 << vece));
+        } else {
+            tcg_out_insn(s, 3614, SHL, is_q, a0, a1, a2 + (8 << vece));
+        }
         break;
     case INDEX_op_shri_vec:
-        tcg_out_insn(s, 3614, USHR, is_q, a0, a1, (16 << vece) - a2);
+        if (is_scalar) {
+            tcg_out_insn(s, 3609, USHR, a0, a1, (16 << vece) - a2);
+        } else {
+            tcg_out_insn(s, 3614, USHR, is_q, a0, a1, (16 << vece) - a2);
+        }
         break;
     case INDEX_op_sari_vec:
-        tcg_out_insn(s, 3614, SSHR, is_q, a0, a1, (16 << vece) - a2);
+        if (is_scalar) {
+            tcg_out_insn(s, 3609, SSHR, a0, a1, (16 << vece) - a2);
+        } else {
+            tcg_out_insn(s, 3614, SSHR, is_q, a0, a1, (16 << vece) - a2);
+        }
         break;
     case INDEX_op_aa64_sli_vec:
-        tcg_out_insn(s, 3614, SLI, is_q, a0, a2, args[3] + (8 << vece));
+        if (is_scalar) {
+            tcg_out_insn(s, 3609, SLI, a0, a2, args[3] + (8 << vece));
+        } else {
+            tcg_out_insn(s, 3614, SLI, is_q, a0, a2, args[3] + (8 << vece));
+        }
         break;
     case INDEX_op_shlv_vec:
-        tcg_out_insn(s, 3616, USHL, is_q, vece, a0, a1, a2);
+        if (is_scalar) {
+            tcg_out_insn(s, 3611, USHL, vece, a0, a1, a2);
+        } else {
+            tcg_out_insn(s, 3616, USHL, is_q, vece, a0, a1, a2);
+        }
         break;
     case INDEX_op_aa64_sshl_vec:
-        tcg_out_insn(s, 3616, SSHL, is_q, vece, a0, a1, a2);
+        if (is_scalar) {
+            tcg_out_insn(s, 3611, SSHL, vece, a0, a1, a2);
+        } else {
+            tcg_out_insn(s, 3616, SSHL, is_q, vece, a0, a1, a2);
+        }
         break;
     case INDEX_op_cmp_vec:
         {
@@ -2386,30 +2509,58 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
 
             if (cond == TCG_COND_NE) {
                 if (const_args[2]) {
-                    tcg_out_insn(s, 3616, CMTST, is_q, vece, a0, a1, a1);
+                    if (is_scalar) {
+                        tcg_out_insn(s, 3611, CMTST, vece, a0, a1, a1);
+                    } else {
+                        tcg_out_insn(s, 3616, CMTST, is_q, vece, a0, a1, a1);
+                    }
                 } else {
-                    tcg_out_insn(s, 3616, CMEQ, is_q, vece, a0, a1, a2);
+                    if (is_scalar) {
+                        tcg_out_insn(s, 3611, CMEQ, vece, a0, a1, a2);
+                    } else {
+                        tcg_out_insn(s, 3616, CMEQ, is_q, vece, a0, a1, a2);
+                    }
                     tcg_out_insn(s, 3617, NOT, is_q, 0, a0, a0);
                 }
             } else {
                 if (const_args[2]) {
-                    insn = cmp0_insn[cond];
-                    if (insn) {
-                        tcg_out_insn_3617(s, insn, is_q, vece, a0, a1);
-                        break;
+                    if (is_scalar) {
+                        insn = cmp0_scalar_insn[cond];
+                        if (insn) {
+                            tcg_out_insn_3612(s, insn, vece, a0, a1);
+                            break;
+                        }
+                    } else {
+                        insn = cmp0_vec_insn[cond];
+                        if (insn) {
+                            tcg_out_insn_3617(s, insn, is_q, vece, a0, a1);
+                            break;
+                        }
                     }
                     tcg_out_dupi_vec(s, type, MO_8, TCG_VEC_TMP, 0);
                     a2 = TCG_VEC_TMP;
                 }
-                insn = cmp_insn[cond];
-                if (insn == 0) {
-                    TCGArg t;
-                    t = a1, a1 = a2, a2 = t;
-                    cond = tcg_swap_cond(cond);
-                    insn = cmp_insn[cond];
-                    tcg_debug_assert(insn != 0);
+                if (is_scalar) {
+                    insn = cmp_scalar_insn[cond];
+                    if (insn == 0) {
+                        TCGArg t;
+                        t = a1, a1 = a2, a2 = t;
+                        cond = tcg_swap_cond(cond);
+                        insn = cmp_scalar_insn[cond];
+                        tcg_debug_assert(insn != 0);
+                    }
+                    tcg_out_insn_3611(s, insn, vece, a0, a1, a2);
+                } else {
+                    insn = cmp_vec_insn[cond];
+                    if (insn == 0) {
+                        TCGArg t;
+                        t = a1, a1 = a2, a2 = t;
+                        cond = tcg_swap_cond(cond);
+                        insn = cmp_vec_insn[cond];
+                        tcg_debug_assert(insn != 0);
+                    }
+                    tcg_out_insn_3616(s, insn, is_q, vece, a0, a1, a2);
                 }
-                tcg_out_insn_3616(s, insn, is_q, vece, a0, a1, a2);
             }
         }
         break;
-- 
2.25.1


