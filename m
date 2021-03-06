Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE01F32FD91
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 22:42:14 +0100 (CET)
Received: from localhost ([::1]:39586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIegf-00072e-Lq
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 16:42:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIebC-0006z6-67
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:34 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:36709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIeb8-0002xz-OR
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:33 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so995245pjh.1
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 13:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YPOjQOCVvXckcnkr+oLmPc3XWSAdSsFw06IiSJpsEjQ=;
 b=pcnsXWC+JZEvygcOHg7PFnCsj6E9SNhKixZBJ/e2lWCUBobLPL0tqPrAFRwYaSaRu0
 PmnTTwb1m7VBILEI73cby7bUPBQfw5UuTv+OrNF3OVnSPW4XzBVsl0bGfLXvDmxl++4E
 Zn+ZWxP/BBc1rA5LFSzqGeDhyj9+C6kF6hfh2C1j++gMpOGLZmy/6ofJ2EBRDBMJNvK9
 eVQdy42DSyqt50VZi1IDY0msij8bVIXRPyZ2pwoynz56IYhenZn/+zltgL4x+aWU2DlV
 QbVtTSNcFdBOp8Ij39mH9jJ/NFgYHDpavhDY9bSHqfQBagL4ezemCbnwaVAZAZ6NVJgV
 vS/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YPOjQOCVvXckcnkr+oLmPc3XWSAdSsFw06IiSJpsEjQ=;
 b=KhJjEFeSWtWH5eBymUWIZEIGEdAHANK+bVZUlLlzTvIBF4VQ/Ejdo88sNpHWa1tUM7
 y+rCTY+P6E7oZmPEHapJ3Q3iXjqZHQdEhZGgdNuG1OPSNRq7d1yxx/Sbz+d6hTAG6xXN
 GFrPKM2h/XWkF+DTjpuJ/tglU+r4dXuB5rguiuyuTmPCLvZE6LVl8YSCIKXSu+ySjC/D
 ApXZVnDOQHlii4gDTKFK8rHazFjM5X9jl1m8qsJ2SUS+g4pbxV6dMARWcesOyUkET6Yd
 zDIC39z+F6tRfryHWLfGVLdltdJG+v3ChF0MheTQ7C7jKc2jN25ClBnXKQoNr9OrPehi
 UB/w==
X-Gm-Message-State: AOAM532TAtl8GJYksWsIJoXHw8ianKzYsM36UlWiDSjiCug2epYje5mf
 UdiTjwWLA0/uOYn0fzidDHFWHacdaCQ2Cg==
X-Google-Smtp-Source: ABdhPJxxA5fBrw26sCcbKLHkT8GAAWrErntaD6JuLuwH6HWWy9Grm0u+d/LmCrDHYEaJBCyg6ac31g==
X-Received: by 2002:a17:902:7006:b029:e3:dd4d:85ac with SMTP id
 y6-20020a1709027006b02900e3dd4d85acmr14293308plk.41.1615066589552; 
 Sat, 06 Mar 2021 13:36:29 -0800 (PST)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id r30sm6365616pgu.86.2021.03.06.13.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 13:36:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/27] tcg/tci: Remove tci_read_r16
Date: Sat,  6 Mar 2021 13:36:00 -0800
Message-Id: <20210306213613.85168-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210306213613.85168-1-richard.henderson@linaro.org>
References: <20210306213613.85168-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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


