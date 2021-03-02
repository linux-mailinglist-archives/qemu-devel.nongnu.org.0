Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 748DC32A8C5
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 19:06:30 +0100 (CET)
Received: from localhost ([::1]:52780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH9Ph-0005pr-Fi
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 13:06:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9HV-0002u5-Fh
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:58:01 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:44445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9HT-0007ar-FL
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:58:01 -0500
Received: by mail-pl1-x62d.google.com with SMTP id a24so12449897plm.11
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 09:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YPOjQOCVvXckcnkr+oLmPc3XWSAdSsFw06IiSJpsEjQ=;
 b=BbOFdjviD9d2QxC+9B731QJ+SDX5VlprfwZk2YqbUrPm2u7UaT6qDMCNT/1/prjjmE
 y6PCdH73WS6cBRUM01tGRP76MbN4sZLM+onvyo1+OUbny5RyGyw9ksl79UPBB5hWhmAo
 TOyPF2wRVtZ+cR60ptDrgYU+NIhcFMR3lOYMoerJI20b322l5StKVzT30yn2aGmuv7ki
 ZcGibHcmSiDMVqV8zUK2JtOJSm2k9xrZrJKDoWg/8Xtws7TICxkC70Fw+2w55PrKwa9Z
 qJYljAGf87ySdcn8wNDQlEq2Om+wmO7zNzGSXglA9tRd4/lRGoo+dgSjfy87Lhc4zWlv
 2B/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YPOjQOCVvXckcnkr+oLmPc3XWSAdSsFw06IiSJpsEjQ=;
 b=lHi6QmkwzdH41GFLSzbNEi6b02D15v3XiKhzq6IsHG3xhFqF2aYb0w/uRImFkaX8r7
 jjqbOaRBNvfsiJiL0GRyTfM9BJfSb3MK5KrJ8cJhxxXTET99MAiIMkRl52CA14B5dKHq
 ppsEUBShGISHr5bJ3Um/pkbAU6AoF6jvNjxD28b+gN7JSdZTu4mpsOuoZ/Rdof+f8Ycz
 F4ZOJueTDHtq1RpuNEaIeGEQPGppYahbpcmQaTsKi3mhf9hdS33jpV46W8dx7z0TNsGQ
 nGJ4E738ThpA2+PjplHmfvwd4l1jxUM5kZybnz/q/eg5SnAvwL5MxcakxABQW8LKZUA9
 fhQA==
X-Gm-Message-State: AOAM532MeIcs1GfLFSM9aJRYZZU4+5c+3evm7O0DwQOb1hxccpxDW6MI
 pwJ3+9cNgxIMiHnuPwfuLkZREjJG4kqpUg==
X-Google-Smtp-Source: ABdhPJyOORgyZusTt78sG/F8YK6Ne2Eu3KUJcLtguOzNRpsugKj/1u41S8Qad7Wo9IdKjMgSk0V4rA==
X-Received: by 2002:a17:90a:fb8e:: with SMTP id
 cp14mr5638766pjb.52.1614707878188; 
 Tue, 02 Mar 2021 09:57:58 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id gf20sm4232234pjb.39.2021.03.02.09.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 09:57:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/27] tcg/tci: Remove tci_read_r16
Date: Tue,  2 Mar 2021 09:57:28 -0800
Message-Id: <20210302175741.1079851-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302175741.1079851-1-richard.henderson@linaro.org>
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use explicit casts for ext16u opcodes, and allow truncation
to happen with the store for st16 opcodes, and with the call
for bswap16 opcodes.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 7325c8bfd0..2440da1746 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -71,11 +71,6 @@ static int32_t tci_read_reg32s(const tcg_target_ulong *regs, TCGReg index)
 }
 #endif
 
-static uint16_t tci_read_reg16(const tcg_target_ulong *regs, TCGReg index)
-{
-    return (uint16_t)tci_read_reg(regs, index);
-}
-
 static uint32_t tci_read_reg32(const tcg_target_ulong *regs, TCGReg index)
 {
     return (uint32_t)tci_read_reg(regs, index);
@@ -157,15 +152,6 @@ tci_read_r(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
     return value;
 }
 
-/* Read indexed register (16 bit) from bytecode. */
-static uint16_t tci_read_r16(const tcg_target_ulong *regs,
-                             const uint8_t **tb_ptr)
-{
-    uint16_t value = tci_read_reg16(regs, **tb_ptr);
-    *tb_ptr += 1;
-    return value;
-}
-
 #if TCG_TARGET_HAS_ext16s_i32 || TCG_TARGET_HAS_ext16s_i64
 /* Read indexed register (16 bit signed) from bytecode. */
 static int16_t tci_read_r16s(const tcg_target_ulong *regs,
@@ -509,7 +495,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             *(uint8_t *)(t1 + t2) = t0;
             break;
         CASE_32_64(st16)
-            t0 = tci_read_r16(regs, &tb_ptr);
+            t0 = tci_read_r(regs, &tb_ptr);
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
             *(uint16_t *)(t1 + t2) = t0;
@@ -699,14 +685,14 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_HAS_ext16u_i32
         case INDEX_op_ext16u_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r16(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            t1 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (uint16_t)t1);
             break;
 #endif
 #if TCG_TARGET_HAS_bswap16_i32
         case INDEX_op_bswap16_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_r16(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, bswap16(t1));
             break;
 #endif
@@ -907,8 +893,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_HAS_ext16u_i64
         case INDEX_op_ext16u_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r16(regs, &tb_ptr);
-            tci_write_reg(regs, t0, t1);
+            t1 = tci_read_r(regs, &tb_ptr);
+            tci_write_reg(regs, t0, (uint16_t)t1);
             break;
 #endif
 #if TCG_TARGET_HAS_ext32s_i64
@@ -930,7 +916,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #if TCG_TARGET_HAS_bswap16_i64
         case INDEX_op_bswap16_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_r16(regs, &tb_ptr);
+            t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, bswap16(t1));
             break;
 #endif
-- 
2.25.1


