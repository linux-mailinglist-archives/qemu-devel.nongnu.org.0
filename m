Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C085431292B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:07:44 +0100 (CET)
Received: from localhost ([::1]:40628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8wtr-00079D-Om
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:07:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRg-0001Zl-K4
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:38 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:45186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRX-0005qq-37
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:36 -0500
Received: by mail-pg1-x52e.google.com with SMTP id o21so7852827pgn.12
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eSQe6U/PGZwTawoh3F37z3+OGlTxy4qNiRyYKdayrlc=;
 b=sMyOya8RfJ+di2x6o5I44P4cANagfxDt100EbbrXxiSsNtTJ64P4uCCh2RzlEgXjZz
 0mhdncEAQmE8DXRk2z3Q5pXotODcS/ZSFlX08I8qQ+DjfDAd6wBR8k7hWRLMoNQKxae7
 nhMP+q9rIro6t5EYuuZIoUFvFYE1xIe6i5sdHtoFgZflhbjvyEUaKzNgAdlihzzIMm0R
 rcIQgAonNYRxHp3YnGl8GWxE+G96L5s12BkUivk2+rGLQYBqnTNL3okufNnMFa8F3JXf
 pA89sonACOAUT+PZ3JQYcYtmOk3xBcheiYC77xmwDYsMbi7jGMwDkEIAIuZWd9CI8omN
 4Hqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eSQe6U/PGZwTawoh3F37z3+OGlTxy4qNiRyYKdayrlc=;
 b=h1KGRMhiaudwnpkc8YrAIYF0NgmxLo/XNb2whqitpstKc/AX2ZINZMzOyHbImzjLRj
 yRPabvbQ91daosZg3+ES8z8fzgADt1JXmVpKxWIFShlQVo5UpI3cE5zJC6CrcQxBAYdu
 bU3sapFWJ++On7xSueBuCl3uk0J6fjKANuZ3JlEEY/VjHtUkQ1nJUwpfKt42KJO9tOzd
 SAMPl3PLxy/QgTkL+PfRpivTfgxvV9e5vgI8e+0LMTypcGGiEKzDcG+vipR1jn5PmTwT
 NClmIZUzy+X7GriQ6tUhugEEBEMndcS9f4x43dG0B9vo4P5H+70cxO5YWuryPYBMYi+Q
 /QvQ==
X-Gm-Message-State: AOAM532n8cX6zaT4BhDy+6O9QbXbMCVBuP/HiSHAASrY+/EMwpVWtxPL
 in6xdavssX5g/fDp0FWZhJEj+ZHjjuolWA==
X-Google-Smtp-Source: ABdhPJwWCU1fwxV+Qa8BgvK4I16/AY3gZcz2Z0Zu32tVWZk/LETQylGRwAnyqiaK8eM4i2mIsCuXEw==
X-Received: by 2002:a63:2e01:: with SMTP id u1mr1725151pgu.408.1612751905160; 
 Sun, 07 Feb 2021 18:38:25 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id j17sm16158689pfh.183.2021.02.07.18.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:38:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 25/70] tcg/tci: Split out tci_args_ri and tci_args_rI
Date: Sun,  7 Feb 2021 18:37:07 -0800
Message-Id: <20210208023752.270606-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 1e2f78a9f9..5cc05fa554 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -121,16 +121,6 @@ static int32_t tci_read_s32(const uint8_t **tb_ptr)
     return value;
 }
 
-#if TCG_TARGET_REG_BITS == 64
-/* Read constant (64 bit) from bytecode. */
-static uint64_t tci_read_i64(const uint8_t **tb_ptr)
-{
-    uint64_t value = *(const uint64_t *)(*tb_ptr);
-    *tb_ptr += sizeof(value);
-    return value;
-}
-#endif
-
 /* Read indexed register (native size) from bytecode. */
 static tcg_target_ulong
 tci_read_rval(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
@@ -180,6 +170,8 @@ static tcg_target_ulong tci_read_label(const uint8_t **tb_ptr)
  *   tci_args_<arguments>
  * where arguments is a sequence of
  *
+ *   i = immediate (uint32_t)
+ *   I = immediate (tcg_target_ulong)
  *   r = register
  *   s = signed ldst offset
  */
@@ -196,6 +188,22 @@ static void tci_args_rr(const uint8_t **tb_ptr,
     *r1 = tci_read_r(tb_ptr);
 }
 
+static void tci_args_ri(const uint8_t **tb_ptr,
+                        TCGReg *r0, tcg_target_ulong *i1)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *i1 = tci_read_i32(tb_ptr);
+}
+
+#if TCG_TARGET_REG_BITS == 64
+static void tci_args_rI(const uint8_t **tb_ptr,
+                        TCGReg *r0, tcg_target_ulong *i1)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *i1 = tci_read_i(tb_ptr);
+}
+#endif
+
 static void tci_args_rrr(const uint8_t **tb_ptr,
                          TCGReg *r0, TCGReg *r1, TCGReg *r2)
 {
@@ -498,9 +506,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             regs[r0] = regs[r1];
             break;
         case INDEX_op_tci_movi_i32:
-            t0 = *tb_ptr++;
-            t1 = tci_read_i32(&tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            tci_args_ri(&tb_ptr, &r0, &t1);
+            regs[r0] = t1;
             break;
 
             /* Load/store operations (32 bit). */
@@ -720,9 +727,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #endif
 #if TCG_TARGET_REG_BITS == 64
         case INDEX_op_tci_movi_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_i64(&tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            tci_args_rI(&tb_ptr, &r0, &t1);
+            regs[r0] = t1;
             break;
 
             /* Load/store operations (64 bit). */
-- 
2.25.1


