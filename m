Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 753EC48829C
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 09:50:43 +0100 (CET)
Received: from localhost ([::1]:35418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n66PD-00020X-Lb
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 02:44:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n65I3-0001Ls-Hy
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 01:33:30 -0500
Received: from [2607:f8b0:4864:20::630] (port=36353
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n65Hz-0003c6-PT
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 01:33:21 -0500
Received: by mail-pl1-x630.google.com with SMTP id p14so6707009plf.3
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 22:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/wvvWwr9jsUcspAJECVR8Zmg/KsBGBPI4le3BDg1sNA=;
 b=BrWyzOcvw5+O6m5MmxTTNdvX8RQ2+PpNQOu52DPu2cYE6wejTy97EWwmPxbYDV1gbE
 YyTXiru5KF/9Ih1vrKO6X176Op4i4IPHU23bVHPx4+pRExju8zLlafpRzzXx7NAh/xPX
 cpAatqlfRGvKxuEueJLBV+Z7rB6TGZ75h5bfFHSsloHZrXVVu+oIY6gGh9m7yYkloOQQ
 7eRBf0CB/JltSPM0mgpbi0fLoLjZRXl+Dt20tmwYTrQMwEwEciI3SVsbtC1WaYg80aAu
 0MZ74QjeO6ZMTAn585pNsT1nvCBlfsdRynZLk6Cw/Xz23+KZWK7JUrjdXc3ooR0c/Uqa
 u9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/wvvWwr9jsUcspAJECVR8Zmg/KsBGBPI4le3BDg1sNA=;
 b=PfClUnFLwpYQRLQI1U+dBXQtYaJjz1AifcFLSCYYWRFOymKJXNN+XzQQdWZqsxAxzD
 oL87Z28wXtY5s0k0BSI+jBHtNDI9+HxNzKaxjUEr4i7kliPhab6WtSR8pB/H+2L0sYkI
 DSz5tcMxb7AmrkyFCtt5QsMo4Q22NjMe7aE4tSl3iQlmdK3OFVLu7G2prArN73rqF9UJ
 G6JQKQf2qmb6E3Svdaho/0jdLjnOCDR/5I9JHWuMaMFlPr9+ojF1hDEd5lwMzNNR5qW9
 ujVgpF5nYANgjs6Bb92SXUqA+a5spPDMdRG6PdfD5p7s2WNJvzuu6Zp33Ilf34NRZq37
 Czpw==
X-Gm-Message-State: AOAM530JXkf7Z8206FCf8eLMZDcm8HNPhEb9mYL9LHl5k8Yi0CyZEUyE
 GrNc2nQ4wvdbmhjBYf6BYbXvQ4V7INIeUg==
X-Google-Smtp-Source: ABdhPJy5NC4v8Wlao5OqR+jyl2hNe9O6F8sKG8u245nV0K7nGQAQfQOJnlidGyQ9t/I9k/RykmgmMA==
X-Received: by 2002:a17:902:76c3:b0:149:ac0a:1662 with SMTP id
 j3-20020a17090276c300b00149ac0a1662mr35086311plt.92.1641623598467; 
 Fri, 07 Jan 2022 22:33:18 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id s7sm834760pfu.133.2022.01.07.22.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 22:33:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/7] tcg/arm: Remove use_armv5t_instructions
Date: Fri,  7 Jan 2022 22:33:08 -0800
Message-Id: <20220108063313.477784-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220108063313.477784-1-richard.henderson@linaro.org>
References: <20220108063313.477784-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is now always true, since we require armv6.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.h     |  3 +--
 tcg/arm/tcg-target.c.inc | 35 ++++++-----------------------------
 2 files changed, 7 insertions(+), 31 deletions(-)

diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
index f41b809554..5c9ba5feea 100644
--- a/tcg/arm/tcg-target.h
+++ b/tcg/arm/tcg-target.h
@@ -28,7 +28,6 @@
 
 extern int arm_arch;
 
-#define use_armv5t_instructions (__ARM_ARCH >= 5 || arm_arch >= 5)
 #define use_armv6_instructions  (__ARM_ARCH >= 6 || arm_arch >= 6)
 #define use_armv7_instructions  (__ARM_ARCH >= 7 || arm_arch >= 7)
 
@@ -109,7 +108,7 @@ extern bool use_neon_instructions;
 #define TCG_TARGET_HAS_eqv_i32          0
 #define TCG_TARGET_HAS_nand_i32         0
 #define TCG_TARGET_HAS_nor_i32          0
-#define TCG_TARGET_HAS_clz_i32          use_armv5t_instructions
+#define TCG_TARGET_HAS_clz_i32          1
 #define TCG_TARGET_HAS_ctz_i32          use_armv7_instructions
 #define TCG_TARGET_HAS_ctpop_i32        0
 #define TCG_TARGET_HAS_deposit_i32      use_armv7_instructions
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 72b384cc28..fd30e6e99e 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -596,11 +596,7 @@ static void tcg_out_b_reg(TCGContext *s, ARMCond cond, TCGReg rn)
      * Unless the C portion of QEMU is compiled as thumb, we don't need
      * true BX semantics; merely a branch to an address held in a register.
      */
-    if (use_armv5t_instructions) {
-        tcg_out_bx_reg(s, cond, rn);
-    } else {
-        tcg_out_mov_reg(s, cond, TCG_REG_PC, rn);
-    }
+    tcg_out_bx_reg(s, cond, rn);
 }
 
 static void tcg_out_dat_imm(TCGContext *s, ARMCond cond, ARMInsn opc,
@@ -1247,14 +1243,7 @@ static void tcg_out_goto(TCGContext *s, ARMCond cond, const tcg_insn_unit *addr)
     }
 
     /* LDR is interworking from v5t. */
-    if (arm_mode || use_armv5t_instructions) {
-        tcg_out_movi_pool(s, cond, TCG_REG_PC, addri);
-        return;
-    }
-
-    /* else v4t */
-    tcg_out_movi32(s, COND_AL, TCG_REG_TMP, addri);
-    tcg_out_bx_reg(s, COND_AL, TCG_REG_TMP);
+    tcg_out_movi_pool(s, cond, TCG_REG_PC, addri);
 }
 
 /*
@@ -1270,26 +1259,14 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *addr)
     if (disp - 8 < 0x02000000 && disp - 8 >= -0x02000000) {
         if (arm_mode) {
             tcg_out_bl_imm(s, COND_AL, disp);
-            return;
-        }
-        if (use_armv5t_instructions) {
+        } else {
             tcg_out_blx_imm(s, disp);
-            return;
         }
+        return;
     }
 
-    if (use_armv5t_instructions) {
-        tcg_out_movi32(s, COND_AL, TCG_REG_TMP, addri);
-        tcg_out_blx_reg(s, COND_AL, TCG_REG_TMP);
-    } else if (arm_mode) {
-        /* ??? Know that movi_pool emits exactly 1 insn.  */
-        tcg_out_mov_reg(s, COND_AL, TCG_REG_R14, TCG_REG_PC);
-        tcg_out_movi_pool(s, COND_AL, TCG_REG_PC, addri);
-    } else {
-        tcg_out_movi32(s, COND_AL, TCG_REG_TMP, addri);
-        tcg_out_mov_reg(s, COND_AL, TCG_REG_R14, TCG_REG_PC);
-        tcg_out_bx_reg(s, COND_AL, TCG_REG_TMP);
-    }
+    tcg_out_movi32(s, COND_AL, TCG_REG_TMP, addri);
+    tcg_out_blx_reg(s, COND_AL, TCG_REG_TMP);
 }
 
 static void tcg_out_goto_label(TCGContext *s, ARMCond cond, TCGLabel *l)
-- 
2.25.1


