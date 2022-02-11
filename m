Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A034B1BA9
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 02:54:39 +0100 (CET)
Received: from localhost ([::1]:59340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIL8w-0007hw-Cn
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 20:54:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKnR-0004T8-1r
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:32:25 -0500
Received: from [2607:f8b0:4864:20::42b] (port=38655
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKnO-0007Qa-07
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:32:24 -0500
Received: by mail-pf1-x42b.google.com with SMTP id x15so11079668pfr.5
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=or+WCmpdAjyGxZzhXn9TNsfY/xdJlpnnP3pV6mAQxRc=;
 b=NBGiYXvgS5WMXg8yWBlMJTFN6ylXxcGpHzDuSMTaU/JET0rCsIiAqA8zz2d7Ht+AaI
 LQC04j6zrcL564qIh2dpi4w3L7gwhhzzzA0nwrI5uzuZeiRxrWYThuDih4edCcd46tcI
 BGb3faZbikXx4eqBn1FcY1WpE3GguM5tmyQzn5EDYttwldAbjhtlXFSpoGUYQXcsn06/
 QejotS+1XHI++NGoj2ob7bH8kIw8oK55K1Na16iEsoAPyFpoTDsZVCzQTw3OxB7e9AEi
 SmdA3ScZozkyRrZceBWNwJc8kLlAZtmZv9YlK9rP8RzBK5Jh0CgHiViVWyKa6AnoJdFv
 890Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=or+WCmpdAjyGxZzhXn9TNsfY/xdJlpnnP3pV6mAQxRc=;
 b=h96BuSlG3QGKt7UZ6C1Pl+0vP6op5mqEQBzTaIZeKtBip2vyKSkLFwUtm9YTuXw8Gj
 +AZy+HOTFOejZDo8unSBx1LAZdrVScBhGHI/8UHkAVX4Q7l+/BrQgf1vEq8OZQ+avHBa
 fuTa2pWTQ8jnbo/ACG4qCcfXkZriafxgJGctv9MdC3OQMs9ujW9I6supaRI0C2RwkL/g
 3zOUAExBBwyo7nKr8VvNoHJ3BNpq8WXQAQ4DfWd4Vxpp0L9WnB7oy1xhKLAyraSk5tb8
 IN2k9EkEe/HWezVq2nnWnSHZAqaheSYI/rnS3jn2O++j4k/48B+Xz/zEKFfC+v8t4A7l
 xP/Q==
X-Gm-Message-State: AOAM533OTFbvS++eveE5Ql9YpfnzyK35wLqdxLFVfySjAQeq+HbPT1FW
 UeKTPRIBkYKwmhadbrZK8bIt18soZ1DTY/5c
X-Google-Smtp-Source: ABdhPJyYI7P+r9eBzA/T0wZ2XfJHAUF/5AwNFdWIOWoYhYy02uPFVAFakRzQEIFLWiNt9nsZG4lEtw==
X-Received: by 2002:a05:6a00:174d:: with SMTP id
 j13mr10211151pfc.58.1644543140702; 
 Thu, 10 Feb 2022 17:32:20 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id h5sm25738788pfi.111.2022.02.10.17.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 17:32:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/34] tcg/arm: Remove use_armv5t_instructions
Date: Fri, 11 Feb 2022 12:30:43 +1100
Message-Id: <20220211013059.17994-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211013059.17994-1-richard.henderson@linaro.org>
References: <20220211013059.17994-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index 29d63e98a8..f3b635063f 100644
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


