Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A997647C468
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 18:01:20 +0100 (CET)
Received: from localhost ([::1]:39200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mziVr-0003T8-PA
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 12:01:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziIw-0000Ma-Ue
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:47:58 -0500
Received: from [2607:f8b0:4864:20::434] (port=39537
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziIp-0007ca-6P
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:47:58 -0500
Received: by mail-pf1-x434.google.com with SMTP id s15so1736936pfk.6
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 08:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=38jcf2PlHE3P8/FtnSNikJSiMqKktvlkbLxOvFn7Fjo=;
 b=BAmegXQG4DdFxHS2cA8gMy2EA357z8NNAwENVM2360KQSPZ8U4zV3gu7sg2qXDQMf2
 j8Wzwj3AfE0Rvs8CiTzUr7hjhaKGtuxgCEapoYoLlysSqji3K++KVFgnRQwRTpu8xzdR
 Q5RP+Z1hulIyHoHtvyBpqwoMgRo136JZBiqenLpzi2BWU7C+2l83e5zt44RCkvzNM7xz
 YaSvDYxyQFYMT+YR4tU2FsW2nI+520KZVw9p/FtQkI5a0qhku2mmnhpNqUvqXo18yh8H
 P6c2yo8tU7GPE5gDExSFlHCAXPFPgM32HMOrOwoRwvC0/Xs/oYx3Svfh6yHPBhX5XW7F
 YxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=38jcf2PlHE3P8/FtnSNikJSiMqKktvlkbLxOvFn7Fjo=;
 b=JYiydUBnGHpwNJO2j1iRptsFWDlf+PWVtw2cduVwSnfZ1ztQM38j6GeGOnzZTldPWG
 DeKOwn35DMS8qNb+ePkwAbQh1jzh0dbR1UPp+TFGulT6u5TJucWGVBqXnZ05fKbrjZ7a
 Pqfx71kaT6e/Md3BNO72PAf8T7W3OWWtY8vD7MLnFMgd1aaPVb16F2By8uXUroEGTwfx
 JYlrZkmBSBmXNZxAmWQuTwquKFhEd7DOHwlUDAe+OHnJidw0rHqMNWqCxKPIVYTX9y6m
 U47vNxpqfpEje2jhWro2zurxCGOPYTbxjeyDA1gjjTFd4W7mbDQnFdJXW+VLuECrO+ii
 3cRA==
X-Gm-Message-State: AOAM530Uhkag1HA1bTln1LtiJqrp1D5ZDfbQ14j8On26i9QbrgY3k8jG
 qV/ZAEeLJXO1aUJHMyRJ0GcBZ5rOx2hf1g==
X-Google-Smtp-Source: ABdhPJzq3YA5eL7NmZgVBJ3xdskh+E8Zb18OZeyVrIvTHI8EAndkxXG6dMTxx6VvX4QG+Mi3Lw80UA==
X-Received: by 2002:a63:4409:: with SMTP id r9mr233479pga.271.1640105269957;
 Tue, 21 Dec 2021 08:47:49 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id b192sm2256818pga.35.2021.12.21.08.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 08:47:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/31] tcg/loongarch64: Implement not/and/or/xor/nor/andc/orc
 ops
Date: Tue, 21 Dec 2021 08:47:18 -0800
Message-Id: <20211221164737.1076007-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221164737.1076007-1-richard.henderson@linaro.org>
References: <20211221164737.1076007-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: WANG Xuerui <git@xen0n.name>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: WANG Xuerui <git@xen0n.name>

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211221054105.178795-13-git@xen0n.name>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target-con-set.h |  2 +
 tcg/loongarch64/tcg-target.h         | 16 ++---
 tcg/loongarch64/tcg-target.c.inc     | 88 ++++++++++++++++++++++++++++
 3 files changed, 98 insertions(+), 8 deletions(-)

diff --git a/tcg/loongarch64/tcg-target-con-set.h b/tcg/loongarch64/tcg-target-con-set.h
index 7e459490ea..9ac24b8ad0 100644
--- a/tcg/loongarch64/tcg-target-con-set.h
+++ b/tcg/loongarch64/tcg-target-con-set.h
@@ -16,3 +16,5 @@
  */
 C_O0_I1(r)
 C_O1_I1(r, r)
+C_O1_I2(r, r, rC)
+C_O1_I2(r, r, rU)
diff --git a/tcg/loongarch64/tcg-target.h b/tcg/loongarch64/tcg-target.h
index a6d9e036fc..cc9aecc681 100644
--- a/tcg/loongarch64/tcg-target.h
+++ b/tcg/loongarch64/tcg-target.h
@@ -113,13 +113,13 @@ typedef enum {
 #define TCG_TARGET_HAS_ext16u_i32       1
 #define TCG_TARGET_HAS_bswap16_i32      0
 #define TCG_TARGET_HAS_bswap32_i32      0
-#define TCG_TARGET_HAS_not_i32          0
+#define TCG_TARGET_HAS_not_i32          1
 #define TCG_TARGET_HAS_neg_i32          0
-#define TCG_TARGET_HAS_andc_i32         0
-#define TCG_TARGET_HAS_orc_i32          0
+#define TCG_TARGET_HAS_andc_i32         1
+#define TCG_TARGET_HAS_orc_i32          1
 #define TCG_TARGET_HAS_eqv_i32          0
 #define TCG_TARGET_HAS_nand_i32         0
-#define TCG_TARGET_HAS_nor_i32          0
+#define TCG_TARGET_HAS_nor_i32          1
 #define TCG_TARGET_HAS_clz_i32          0
 #define TCG_TARGET_HAS_ctz_i32          0
 #define TCG_TARGET_HAS_ctpop_i32        0
@@ -149,13 +149,13 @@ typedef enum {
 #define TCG_TARGET_HAS_bswap16_i64      0
 #define TCG_TARGET_HAS_bswap32_i64      0
 #define TCG_TARGET_HAS_bswap64_i64      0
-#define TCG_TARGET_HAS_not_i64          0
+#define TCG_TARGET_HAS_not_i64          1
 #define TCG_TARGET_HAS_neg_i64          0
-#define TCG_TARGET_HAS_andc_i64         0
-#define TCG_TARGET_HAS_orc_i64          0
+#define TCG_TARGET_HAS_andc_i64         1
+#define TCG_TARGET_HAS_orc_i64          1
 #define TCG_TARGET_HAS_eqv_i64          0
 #define TCG_TARGET_HAS_nand_i64         0
-#define TCG_TARGET_HAS_nor_i64          0
+#define TCG_TARGET_HAS_nor_i64          1
 #define TCG_TARGET_HAS_clz_i64          0
 #define TCG_TARGET_HAS_ctz_i64          0
 #define TCG_TARGET_HAS_ctpop_i64        0
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 25b58c7828..d9508d5295 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -422,6 +422,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 {
     TCGArg a0 = args[0];
     TCGArg a1 = args[1];
+    TCGArg a2 = args[2];
+    int c2 = const_args[2];
 
     switch (opc) {
     case INDEX_op_mb:
@@ -467,6 +469,68 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_opc_srai_d(s, a0, a1, 32);
         break;
 
+    case INDEX_op_not_i32:
+    case INDEX_op_not_i64:
+        tcg_out_opc_nor(s, a0, a1, TCG_REG_ZERO);
+        break;
+
+    case INDEX_op_nor_i32:
+    case INDEX_op_nor_i64:
+        if (c2) {
+            tcg_out_opc_ori(s, a0, a1, a2);
+            tcg_out_opc_nor(s, a0, a0, TCG_REG_ZERO);
+        } else {
+            tcg_out_opc_nor(s, a0, a1, a2);
+        }
+        break;
+
+    case INDEX_op_andc_i32:
+    case INDEX_op_andc_i64:
+        if (c2) {
+            /* guaranteed to fit due to constraint */
+            tcg_out_opc_andi(s, a0, a1, ~a2);
+        } else {
+            tcg_out_opc_andn(s, a0, a1, a2);
+        }
+        break;
+
+    case INDEX_op_orc_i32:
+    case INDEX_op_orc_i64:
+        if (c2) {
+            /* guaranteed to fit due to constraint */
+            tcg_out_opc_ori(s, a0, a1, ~a2);
+        } else {
+            tcg_out_opc_orn(s, a0, a1, a2);
+        }
+        break;
+
+    case INDEX_op_and_i32:
+    case INDEX_op_and_i64:
+        if (c2) {
+            tcg_out_opc_andi(s, a0, a1, a2);
+        } else {
+            tcg_out_opc_and(s, a0, a1, a2);
+        }
+        break;
+
+    case INDEX_op_or_i32:
+    case INDEX_op_or_i64:
+        if (c2) {
+            tcg_out_opc_ori(s, a0, a1, a2);
+        } else {
+            tcg_out_opc_or(s, a0, a1, a2);
+        }
+        break;
+
+    case INDEX_op_xor_i32:
+    case INDEX_op_xor_i64:
+        if (c2) {
+            tcg_out_opc_xori(s, a0, a1, a2);
+        } else {
+            tcg_out_opc_xor(s, a0, a1, a2);
+        }
+        break;
+
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
     case INDEX_op_mov_i64:
     default:
@@ -494,8 +558,32 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_extrl_i64_i32:
     case INDEX_op_extrh_i64_i32:
     case INDEX_op_ext_i32_i64:
+    case INDEX_op_not_i32:
+    case INDEX_op_not_i64:
         return C_O1_I1(r, r);
 
+    case INDEX_op_andc_i32:
+    case INDEX_op_andc_i64:
+    case INDEX_op_orc_i32:
+    case INDEX_op_orc_i64:
+        /*
+         * LoongArch insns for these ops don't have reg-imm forms, but we
+         * can express using andi/ori if ~constant satisfies
+         * TCG_CT_CONST_U12.
+         */
+        return C_O1_I2(r, r, rC);
+
+    case INDEX_op_and_i32:
+    case INDEX_op_and_i64:
+    case INDEX_op_nor_i32:
+    case INDEX_op_nor_i64:
+    case INDEX_op_or_i32:
+    case INDEX_op_or_i64:
+    case INDEX_op_xor_i32:
+    case INDEX_op_xor_i64:
+        /* LoongArch reg-imm bitops have their imms ZERO-extended */
+        return C_O1_I2(r, r, rU);
+
     default:
         g_assert_not_reached();
     }
-- 
2.25.1


