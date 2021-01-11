Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B472F1C45
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 18:26:02 +0100 (CET)
Received: from localhost ([::1]:40748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz0x7-0007dd-Kg
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 12:26:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0rD-00033C-BH
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:19:55 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:45639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0rB-000055-IF
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:19:55 -0500
Received: by mail-pl1-x629.google.com with SMTP id e2so160880plt.12
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 09:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QOepBxSxE/W82FF88rCw1+kC5xT6yp8gccxQTHnqJfE=;
 b=qQVuXl0UCOp/mE2XksAx1GttIamLT/9sW40LzUDYV03pEnG0KC8c5gkOMd5Q5WuGoJ
 wsFKNI0M+TOFzX73p0uRxLGIVA7U09Ewzx2bJIKH6pkmiZlQUNsVNVnfzXENoI9cXOgD
 y2HqG08aoGeAQdAnRJdBgW6rDGcdeJkahrKkwQ4pXCs8iLGccdD45MT+i6yyhm/QTYjA
 JbIH2kNH4v1ZBCC04nPTFCK6nPwcgR2dqEGk7nncofdqInw9q9imnpfO1wH8GxXdZZzf
 hamANC1J2smeAAIBy9X0f/XT2YoOKSVpc+SKyUuOxRMI/8JI/6Rm7qcJ5EYXDBB0PhaR
 Zqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QOepBxSxE/W82FF88rCw1+kC5xT6yp8gccxQTHnqJfE=;
 b=RbDwCcOILEcKNA+n8Lp4Md27QnAtIbTeIUBNS+LzBJGHjMMBbZisrJhh1eN21GRJH7
 TdkcNicAEkCnFt8iKCpcHmDUYLIXEhuVo/CLoLSyB3b9K+CibsRIA/ipTKOyzPzqBdGY
 5bZ6D0IVhqn03QUi29aZ8cL2fR/iPFzSm7tI6sK4j/ssQ/RI5StqoBrLhO7s7Ah0223l
 hZG5PHzISjhMSJV4PVnC+KCtQiAQFqJ5mkvnpzGB57mLOhWBRqAyvDln8rMqSJbcgIfY
 E7c508AWfOQJrPSS32FLnFK1oGJk7fLkiF7Zg3zKvStFCm2qEXg54YEv/TZZI+Y1H6Iw
 Vh7A==
X-Gm-Message-State: AOAM530k2uzOv7UVIOtE2psvy/odlHiW6YSvw3XB5QRBrQRM3X1AGLvY
 EyN8Yq81d3c7BzyY6JR9QFO7audujyx4hw==
X-Google-Smtp-Source: ABdhPJwB+Z6X3ch/ENIj6GJc4N9iApslNPKWjOmxfkt3PSIwwhNpfSKiWJIoqsJ4SLP69B0r+9xWcQ==
X-Received: by 2002:a17:90a:ee8e:: with SMTP id
 i14mr286855pjz.190.1610385591739; 
 Mon, 11 Jan 2021 09:19:51 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id k64sm206666pfd.75.2021.01.11.09.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 09:19:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 01/23] tcg: Use tcg_out_dupi_vec from temp_load
Date: Mon, 11 Jan 2021 07:19:24 -1000
Message-Id: <20210111171946.219469-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111171946.219469-1-richard.henderson@linaro.org>
References: <20210111171946.219469-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wataru Ashihara <wataash@wataash.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Having dupi pass though movi is confusing and arguably wrong.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: Wataru Ashihara <wataash@wataash.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tcg/tcg.c                    |  6 +++-
 tcg/aarch64/tcg-target.c.inc |  7 ----
 tcg/i386/tcg-target.c.inc    | 63 ++++++++++++++++++++++++------------
 tcg/ppc/tcg-target.c.inc     |  6 ----
 4 files changed, 47 insertions(+), 35 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 472bf1755b..ded3c928e3 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3387,7 +3387,11 @@ static void temp_load(TCGContext *s, TCGTemp *ts, TCGRegSet desired_regs,
     case TEMP_VAL_CONST:
         reg = tcg_reg_alloc(s, desired_regs, allocated_regs,
                             preferred_regs, ts->indirect_base);
-        tcg_out_movi(s, ts->type, reg, ts->val);
+        if (ts->type <= TCG_TYPE_I64) {
+            tcg_out_movi(s, ts->type, reg, ts->val);
+        } else {
+            tcg_out_dupi_vec(s, ts->type, reg, ts->val);
+        }
         ts->mem_coherent = 0;
         break;
     case TEMP_VAL_MEM:
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index ab199b143f..a2a588e3aa 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1011,13 +1011,6 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
     case TCG_TYPE_I64:
         tcg_debug_assert(rd < 32);
         break;
-
-    case TCG_TYPE_V64:
-    case TCG_TYPE_V128:
-        tcg_debug_assert(rd >= 32);
-        tcg_out_dupi_vec(s, type, rd, value);
-        return;
-
     default:
         g_assert_not_reached();
     }
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 46e856f442..35554fd1e8 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -975,30 +975,32 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType type,
     }
 }
 
-static void tcg_out_movi(TCGContext *s, TCGType type,
-                         TCGReg ret, tcg_target_long arg)
+static void tcg_out_movi_vec(TCGContext *s, TCGType type,
+                             TCGReg ret, tcg_target_long arg)
+{
+    if (arg == 0) {
+        tcg_out_vex_modrm(s, OPC_PXOR, ret, ret, ret);
+        return;
+    }
+    if (arg == -1) {
+        tcg_out_vex_modrm(s, OPC_PCMPEQB, ret, ret, ret);
+        return;
+    }
+
+    int rexw = (type == TCG_TYPE_I32 ? 0 : P_REXW);
+    tcg_out_vex_modrm_pool(s, OPC_MOVD_VyEy + rexw, ret);
+    if (TCG_TARGET_REG_BITS == 64) {
+        new_pool_label(s, arg, R_386_PC32, s->code_ptr - 4, -4);
+    } else {
+        new_pool_label(s, arg, R_386_32, s->code_ptr - 4, 0);
+    }
+}
+
+static void tcg_out_movi_int(TCGContext *s, TCGType type,
+                             TCGReg ret, tcg_target_long arg)
 {
     tcg_target_long diff;
 
-    switch (type) {
-    case TCG_TYPE_I32:
-#if TCG_TARGET_REG_BITS == 64
-    case TCG_TYPE_I64:
-#endif
-        if (ret < 16) {
-            break;
-        }
-        /* fallthru */
-    case TCG_TYPE_V64:
-    case TCG_TYPE_V128:
-    case TCG_TYPE_V256:
-        tcg_debug_assert(ret >= 16);
-        tcg_out_dupi_vec(s, type, ret, arg);
-        return;
-    default:
-        g_assert_not_reached();
-    }
-
     if (arg == 0) {
         tgen_arithr(s, ARITH_XOR, ret, ret);
         return;
@@ -1027,6 +1029,25 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
     tcg_out64(s, arg);
 }
 
+static void tcg_out_movi(TCGContext *s, TCGType type,
+                         TCGReg ret, tcg_target_long arg)
+{
+    switch (type) {
+    case TCG_TYPE_I32:
+#if TCG_TARGET_REG_BITS == 64
+    case TCG_TYPE_I64:
+#endif
+        if (ret < 16) {
+            tcg_out_movi_int(s, type, ret, arg);
+        } else {
+            tcg_out_movi_vec(s, type, ret, arg);
+        }
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static inline void tcg_out_pushi(TCGContext *s, tcg_target_long val)
 {
     if (val == (int8_t)val) {
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 19a4a12f15..a3f1bd41cd 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -987,12 +987,6 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg ret,
         tcg_out_movi_int(s, type, ret, arg, false);
         break;
 
-    case TCG_TYPE_V64:
-    case TCG_TYPE_V128:
-        tcg_debug_assert(ret >= TCG_REG_V0);
-        tcg_out_dupi_vec(s, type, ret, arg);
-        break;
-
     default:
         g_assert_not_reached();
     }
-- 
2.25.1


