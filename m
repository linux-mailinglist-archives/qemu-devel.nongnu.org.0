Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B29432DD3A1
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 16:02:35 +0100 (CET)
Received: from localhost ([::1]:40182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpuna-00043G-Op
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 10:02:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpuds-0003NP-5v
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:33 -0500
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33]:40538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpudh-0004rV-8w
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:31 -0500
Received: by mail-oo1-xc33.google.com with SMTP id 9so6871967ooy.7
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 06:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YGucInyAES/FALajn2SavFzpCSIvxxGGLM0CVJ4If5M=;
 b=I+6Az6UwuEETCx3bXIgFBoUI3ZNEU43AOqXjpf8alNmJE2p+KHl5ZAym1MoG1KCW1k
 4FRtIrTKNAZ7Y0NhSsQTjc++P16jSprR5hjtNUu5GIN8/ygqPpFbPHd7jxmUOGs68Wf6
 wWrHm2ueYuCjsgLeMLIXBBAQ2jjJCNvX6FrtvtSTnlNzkyLLUe9frRpMU6CrdezLvPO/
 /bdyg5i6xx7TeE5Fy29zuqLJdWOigJi8N3HhCFF3GlI9+yIomdNud/6O0R4wmySZg55j
 PLl+fojF4cKEuz46YlNwZ0PlTEGqGNruTnQEZ9nKx1A6OpFh5zvYVncO72V6u1RSp2dZ
 uW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YGucInyAES/FALajn2SavFzpCSIvxxGGLM0CVJ4If5M=;
 b=XiUE22ui2QrU8iL6RtK1YK2axqFGAciHogMtLXj07cIKO/qTniFmuwUBHQR9DPx+RB
 KQAuDGn4ta7/8LfAJJ85dwZzHtSntKwznZI2RJhYXN+YPnyORugGLsUQTm4mU6yUIqki
 NotnmROzz8HJsvoockYPTpzJ9hESQUMJAguJkT2j87fDMNvu4ZuiMxh3yGyh5r5sHLCt
 uYYG6m4E3F4gS9zjl1rnwoWEW1YluQgB2g5eBm/txKVqqwTlfTBkqDL8p3vqZGydOxe2
 iL7ki+jpH6tdFZzz1lXx6UuhtRwpE+5YuSp+Nv6JTK8rcIQuFNwqZbTNM2kh0sciHznQ
 h/Kg==
X-Gm-Message-State: AOAM532Ubq+5kWwyf+iCfFIA16bw7UtjmxVnbz2EGTphUOrm9F1zePXV
 Jzcp4wTRAtSTp1uQ6IiOcrDvmUwcvG/tqSLB
X-Google-Smtp-Source: ABdhPJzvuBU2hQTIrtaeICxjiwIauRiOtPl4Rc20jJZDhI5MDD9MycoqDoJoQH8pa/n7JZPRFZtQcA==
X-Received: by 2002:a4a:b043:: with SMTP id g3mr28864038oon.69.1608216738175; 
 Thu, 17 Dec 2020 06:52:18 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id x130sm1136342oif.3.2020.12.17.06.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 06:52:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 01/23] tcg: Use tcg_out_dupi_vec from temp_load
Date: Thu, 17 Dec 2020 08:51:53 -0600
Message-Id: <20201217145215.534637-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201217145215.534637-1-richard.henderson@linaro.org>
References: <20201217145215.534637-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c33;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc33.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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
index 43c6cf8f52..ef55c23c20 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3333,7 +3333,11 @@ static void temp_load(TCGContext *s, TCGTemp *ts, TCGRegSet desired_regs,
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
index 26f71cb599..695f53b125 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1007,13 +1007,6 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
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
index d8797ed398..e2852cbb09 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -966,30 +966,32 @@ static void tcg_out_dupi_vec(TCGContext *s, TCGType type,
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
@@ -1018,6 +1020,25 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
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
index 18ee989f95..df18d694f3 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -983,12 +983,6 @@ static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg ret,
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


