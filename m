Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 763A22F5729
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 03:19:19 +0100 (CET)
Received: from localhost ([::1]:37804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzsEI-00052P-I7
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 21:19:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzsCA-0003IZ-V4
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 21:17:06 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:45001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzsC5-0003N7-Js
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 21:17:06 -0500
Received: by mail-pf1-x431.google.com with SMTP id a188so2440472pfa.11
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 18:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9lqObm2OHpXJPRkDAvjp4GmeUvPN9FBnk/3uv3qF2Aw=;
 b=isASu2nE2C1YzIfsM6U2oaiztneMch0AItPyaXa/PuT6KAxIAt8R/3vWjvo3hAs/+Y
 bJHYYQ/nkDx0PEnxcIOlDC9Y8Zb3Jo30scP6T2BjBi4HPTwQutkBzgSLmc+8eogUCRK3
 XisXygw82yxzDZ9LB0bQmxtpDh9qguldkOJ9g9lpXSAGotWdRUk3MpVSIBgtR3hZb9Y8
 jAi67ioZHQNeLG+VWuh5yF2hw+ZznoJ6xvcAJ85zsP5vmjyZFG+WaIqubQbvVoQdm9ZH
 lxzeRr4JEPZXudERhCzFObNSagcKWoGaEKXvDDBriClxazHuwwleGgcDxr3jwZxuCEaO
 76vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9lqObm2OHpXJPRkDAvjp4GmeUvPN9FBnk/3uv3qF2Aw=;
 b=nohrw6LdpCV3Ue3psMLkx1rFkOrvySdHLjeAtqNHiXgk0J0qRD85qUsYc99cZPQMZb
 x0RIEQXCkjYrHPutQDHDUzXwdGhWmFm05bVf1DfwJECYJ/MriCRgY/Zc3lXejKQLbltd
 UEZ4h6pOBRZwu0cvv5WkO4XhqAwvM3Yg8D2n0+CPKE9PXWaeArALqFKgqI12aBQP9+8i
 Q4fadJwScc3kJagRzhETZjYDZoThYH3qcHhkpwf3hZfnIpbrpGD0xktzabOEgUHLKN0p
 ze85FL5HBhYV2AgbH3Z5hhmg1ZXtLHrh1hKHEf8/80qUCu0AY++oIhUJBC9/6qA7R5ND
 cshQ==
X-Gm-Message-State: AOAM533HpjjYlfHuYQvJ/drLx41HSajJ041bz8UImwlrOJTDuUBGRgNB
 v1W5tx1yVkr0QgcS9pIL3H2B2XMmGrJ7sw==
X-Google-Smtp-Source: ABdhPJxdpK094TxTXbsdTgx8vvo2dD8EPOhLsSSvfzxEcC8ZS7ZUwL5scDY4VXrxSnKoe98Ag0BtsQ==
X-Received: by 2002:a63:752:: with SMTP id 79mr4936567pgh.272.1610590619757;
 Wed, 13 Jan 2021 18:16:59 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id i7sm3771687pfc.50.2021.01.13.18.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 18:16:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/24] tcg: Use tcg_out_dupi_vec from temp_load
Date: Wed, 13 Jan 2021 16:16:31 -1000
Message-Id: <20210114021654.647242-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114021654.647242-1-richard.henderson@linaro.org>
References: <20210114021654.647242-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Having dupi pass though movi is confusing and arguably wrong.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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


