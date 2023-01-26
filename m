Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4531267C3E3
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 05:40:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKu2J-0000D8-P1; Wed, 25 Jan 2023 23:38:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu2H-0000Bn-FJ
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:38:53 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu2F-0004SG-ED
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:38:52 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 m7-20020a17090a71c700b0022c0c070f2eso3547233pjs.4
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 20:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8/QoQU32OqScdUVawZ5i59sewqeYKfxZ8LNCjfWnBgc=;
 b=mgp5xI3BSl2Rp8QIa3tx8evvFgQTmhC+u2P4z2gfMDD6EtOdYjKB7dDYmnyfBMGyIB
 LSwH+7xJiWpwuxgVNCp27YYGkooEdYkgbjDMkUmaGoo1zwESHHhs4Bq33PH8l4s4uZMU
 wb3j3Y9qg0TZtwN8jmTCgwykrVgkqMKvsBklgzX0//ABxG8YTHnws6alawCUzNQbtVTv
 kyDmhEXfRXRg1ssd7Kg3BnQBwt7rThYSUvge5hTAyFMLGQNah6oqwdlkl9372WOxfa8h
 s/xI1j1vkl4dCXlQjR5QK+lYh9UewtU9fY7B6PU3rVSVMLEAB61EZTgoyforaU9HdAEB
 LAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8/QoQU32OqScdUVawZ5i59sewqeYKfxZ8LNCjfWnBgc=;
 b=pBNM0QnR8CW9OeJO0JhwuS/lSIuLbTmGpJ13W8TjCEwpGfV++6/aP6Hh0kWHdf4Ubv
 vzqCfARSPbiEnpTvOIHJwX35ZVKZI6TKo5/lz8kQibu5CFJ78c03qI4X22X6ubrEJimc
 zA/2n7cGNzWM4as5QJs7V4xRUYL/8gikCzcmg61+GUkVVYFj+HIcp6B8LeWD8y762Gnb
 CTIj9VLpYQYx/x7whe9mnJAAovx8gjZZBXK2RVIrnylw20Icj7g2nWzLwULY/EUfZUbX
 dVDnNhef8WglRr12pBOdI3J3YHqvz/zOj7aZ/U8hTrf0ZfDwboytN3zr+CsPy8nuTg9m
 IBZA==
X-Gm-Message-State: AFqh2krqCZt7B8X2ZUBxNI6LPm81WqqVbrDs+wvr0P1HqJmAsEaUtJdZ
 XRrqo1xwr3KiG775CbqH+fIT7mZlWzb/l24gAqw=
X-Google-Smtp-Source: AMrXdXtvZzQG5hmlwu7mBjzasLD7o9xNaXvna/Xr1ouhBC9iuDDBug/qfCAkKF6/2AWgEzUnEdsI4g==
X-Received: by 2002:a17:90b:1d03:b0:22a:3d:4c22 with SMTP id
 on3-20020a17090b1d0300b0022a003d4c22mr24481720pjb.13.1674707928084; 
 Wed, 25 Jan 2023 20:38:48 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 s62-20020a17090a69c400b00228e56d375asm233376pjj.33.2023.01.25.20.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 20:38:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 13/36] tcg: Add temp allocation for TCGv_i128
Date: Wed, 25 Jan 2023 18:38:01 -1000
Message-Id: <20230126043824.54819-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126043824.54819-1-richard.henderson@linaro.org>
References: <20230126043824.54819-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

This enables allocation of i128.  The type is not yet
usable, as we have not yet added data movement ops.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 32 +++++++++++++++++++++++++
 tcg/tcg.c         | 60 +++++++++++++++++++++++++++++++++--------------
 2 files changed, 74 insertions(+), 18 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 8b7e61e7a5..7a8e4bbdd7 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -685,6 +685,11 @@ static inline TCGTemp *tcgv_i64_temp(TCGv_i64 v)
     return tcgv_i32_temp((TCGv_i32)v);
 }
 
+static inline TCGTemp *tcgv_i128_temp(TCGv_i128 v)
+{
+    return tcgv_i32_temp((TCGv_i32)v);
+}
+
 static inline TCGTemp *tcgv_ptr_temp(TCGv_ptr v)
 {
     return tcgv_i32_temp((TCGv_i32)v);
@@ -705,6 +710,11 @@ static inline TCGArg tcgv_i64_arg(TCGv_i64 v)
     return temp_arg(tcgv_i64_temp(v));
 }
 
+static inline TCGArg tcgv_i128_arg(TCGv_i128 v)
+{
+    return temp_arg(tcgv_i128_temp(v));
+}
+
 static inline TCGArg tcgv_ptr_arg(TCGv_ptr v)
 {
     return temp_arg(tcgv_ptr_temp(v));
@@ -726,6 +736,11 @@ static inline TCGv_i64 temp_tcgv_i64(TCGTemp *t)
     return (TCGv_i64)temp_tcgv_i32(t);
 }
 
+static inline TCGv_i128 temp_tcgv_i128(TCGTemp *t)
+{
+    return (TCGv_i128)temp_tcgv_i32(t);
+}
+
 static inline TCGv_ptr temp_tcgv_ptr(TCGTemp *t)
 {
     return (TCGv_ptr)temp_tcgv_i32(t);
@@ -851,6 +866,11 @@ static inline void tcg_temp_free_i64(TCGv_i64 arg)
     tcg_temp_free_internal(tcgv_i64_temp(arg));
 }
 
+static inline void tcg_temp_free_i128(TCGv_i128 arg)
+{
+    tcg_temp_free_internal(tcgv_i128_temp(arg));
+}
+
 static inline void tcg_temp_free_ptr(TCGv_ptr arg)
 {
     tcg_temp_free_internal(tcgv_ptr_temp(arg));
@@ -899,6 +919,18 @@ static inline TCGv_i64 tcg_temp_local_new_i64(void)
     return temp_tcgv_i64(t);
 }
 
+static inline TCGv_i128 tcg_temp_new_i128(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, false);
+    return temp_tcgv_i128(t);
+}
+
+static inline TCGv_i128 tcg_temp_local_new_i128(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, true);
+    return temp_tcgv_i128(t);
+}
+
 static inline TCGv_ptr tcg_global_mem_new_ptr(TCGv_ptr reg, intptr_t offset,
                                               const char *name)
 {
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 63e0753ded..d449bb0864 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1273,26 +1273,45 @@ TCGTemp *tcg_temp_new_internal(TCGType type, bool temp_local)
         tcg_debug_assert(ts->base_type == type);
         tcg_debug_assert(ts->kind == kind);
     } else {
+        int i, n;
+
+        switch (type) {
+        case TCG_TYPE_I32:
+        case TCG_TYPE_V64:
+        case TCG_TYPE_V128:
+        case TCG_TYPE_V256:
+            n = 1;
+            break;
+        case TCG_TYPE_I64:
+            n = 64 / TCG_TARGET_REG_BITS;
+            break;
+        case TCG_TYPE_I128:
+            n = 128 / TCG_TARGET_REG_BITS;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+
         ts = tcg_temp_alloc(s);
-        if (TCG_TARGET_REG_BITS == 32 && type == TCG_TYPE_I64) {
-            TCGTemp *ts2 = tcg_temp_alloc(s);
+        ts->base_type = type;
+        ts->temp_allocated = 1;
+        ts->kind = kind;
 
-            ts->base_type = type;
-            ts->type = TCG_TYPE_I32;
-            ts->temp_allocated = 1;
-            ts->kind = kind;
-
-            tcg_debug_assert(ts2 == ts + 1);
-            ts2->base_type = TCG_TYPE_I64;
-            ts2->type = TCG_TYPE_I32;
-            ts2->temp_allocated = 1;
-            ts2->temp_subindex = 1;
-            ts2->kind = kind;
-        } else {
-            ts->base_type = type;
+        if (n == 1) {
             ts->type = type;
-            ts->temp_allocated = 1;
-            ts->kind = kind;
+        } else {
+            ts->type = TCG_TYPE_REG;
+
+            for (i = 1; i < n; ++i) {
+                TCGTemp *ts2 = tcg_temp_alloc(s);
+
+                tcg_debug_assert(ts2 == ts + i);
+                ts2->base_type = type;
+                ts2->type = TCG_TYPE_REG;
+                ts2->temp_allocated = 1;
+                ts2->temp_subindex = i;
+                ts2->kind = kind;
+            }
         }
     }
 
@@ -3381,9 +3400,14 @@ static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
     case TCG_TYPE_V64:
         align = 8;
         break;
+    case TCG_TYPE_I128:
     case TCG_TYPE_V128:
     case TCG_TYPE_V256:
-        /* Note that we do not require aligned storage for V256. */
+        /*
+         * Note that we do not require aligned storage for V256,
+         * and that we provide alignment for I128 to match V128,
+         * even if that's above what the host ABI requires.
+         */
         align = 16;
         break;
     default:
-- 
2.34.1


