Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B966312905
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 03:43:41 +0100 (CET)
Received: from localhost ([::1]:38486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8wWa-0006km-G4
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 21:43:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRD-0001Bp-Of
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:07 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:34881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wRC-0005in-3E
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:07 -0500
Received: by mail-pl1-x62c.google.com with SMTP id g3so7034923plp.2
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bftKwEjBKL55PhIU9GHzhO+7UtwI+bC8nwnUqZAh2tk=;
 b=QRpDU5oCcinbKxqZtGfTQGF7tqIeDWBfznDkZewcBhZXMlCmji9aArq1oRGbMjkIIx
 ACsXKaVzK/g2CmPWJ7BzQ19VYdQhwjkZlCRLRdF+F/aNNz/sSfMz4Ju9PBoO1xA7VAhp
 MTf1pCW85Gf0asjWiPXHM938KiEYUC839lGorqm0RwjMFBJG2cvE3t3F0iAUib6acmh7
 KRi0wW2/i28yDkGJD7itX+ETlTNdZWBhEBFHIkKj46xixbZ3PIvR9NX2cHygQ3+2ljX/
 rGFEg5EUynsOEW81q5eUVPLADzL/aytFS0ilDR8G64Gy55cF8Qfqh9O3BBoeBBw6GXB0
 Xq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bftKwEjBKL55PhIU9GHzhO+7UtwI+bC8nwnUqZAh2tk=;
 b=pAyKJpdlajv9CnhgN7rdiFEm3jJPU1RnW6IkLuixiiFH3VZkaVQAW8snqrtuHQAp3/
 CDYUdffDdufyraFFArznV3kPDR94zQF5hI37g0eOi8mXQhGzD4n43GIHqRj6K6pxbV/0
 Auu5KNURUHng5M8KD2IPFC8EHMwDultz4QOe4KvNsuk32DUtiXXWEln875hBBW/MtGva
 zPsKq5rj9DrpyJEmELXeqNR7rO8S1rl09uPpkEcvNPQFbPCA591yTavY54adpqmR/jtI
 +lmmoRqd82CEwAoQFQFuDaAyv3RJOn4i78pXGc/w0VdviAzbOVqWDmdV6K7ZXh3W3Q2k
 bm4g==
X-Gm-Message-State: AOAM533jWbW/EYP0S7FaaoBbi4enEt3XQfw/7rwS0VenlC7mAMDJqapC
 sgsTRX0JCZLtpQ9W71lj3WVVYgwOdjewag==
X-Google-Smtp-Source: ABdhPJzprUQ5igeMUGWAc32G6/6rRg5C0RFuswuKbUBTgwC+3Hhr5iERrT7e5y4+0iFJ0Lo9L2Bofg==
X-Received: by 2002:a17:90a:aa85:: with SMTP id
 l5mr15237938pjq.230.1612751884856; 
 Sun, 07 Feb 2021 18:38:04 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id j17sm16158689pfh.183.2021.02.07.18.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:38:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/70] tcg/tci: Remove tci_read_r16s
Date: Sun,  7 Feb 2021 18:36:50 -0800
Message-Id: <20210208023752.270606-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

Use explicit casts for ext16s opcodes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 26 ++++----------------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 547be0c2f0..d2bfcb3c93 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -57,13 +57,6 @@ static tcg_target_ulong tci_read_reg(const tcg_target_ulong *regs, TCGReg index)
     return regs[index];
 }
 
-#if TCG_TARGET_HAS_ext16s_i32 || TCG_TARGET_HAS_ext16s_i64
-static int16_t tci_read_reg16s(const tcg_target_ulong *regs, TCGReg index)
-{
-    return (int16_t)tci_read_reg(regs, index);
-}
-#endif
-
 #if TCG_TARGET_REG_BITS == 64
 static int32_t tci_read_reg32s(const tcg_target_ulong *regs, TCGReg index)
 {
@@ -152,17 +145,6 @@ tci_read_r(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
     return value;
 }
 
-#if TCG_TARGET_HAS_ext16s_i32 || TCG_TARGET_HAS_ext16s_i64
-/* Read indexed register (16 bit signed) from bytecode. */
-static int16_t tci_read_r16s(const tcg_target_ulong *regs,
-                             const uint8_t **tb_ptr)
-{
-    int16_t value = tci_read_reg16s(regs, **tb_ptr);
-    *tb_ptr += 1;
-    return value;
-}
-#endif
-
 /* Read indexed register (32 bit) from bytecode. */
 static uint32_t tci_read_r32(const tcg_target_ulong *regs,
                              const uint8_t **tb_ptr)
@@ -688,8 +670,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_HAS_ext16s_i32
         case INDEX_op_ext16s_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r16s(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            t1 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (int16_t)t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext8u_i32
@@ -903,8 +885,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_HAS_ext16s_i64
         case INDEX_op_ext16s_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r16s(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            t1 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (int16_t)t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext16u_i64
-- 
2.25.1


