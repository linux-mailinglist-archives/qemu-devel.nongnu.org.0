Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C2E311672
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 00:14:01 +0100 (CET)
Received: from localhost ([::1]:34672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8AIa-0006So-5m
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 18:14:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2w-0002St-9f
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:50 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:39390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2t-0003W8-G5
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:50 -0500
Received: by mail-pg1-x532.google.com with SMTP id o63so5575619pgo.6
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CxdHWOva1wcLZN7HdcW8RTKMbDCttoUzy92bx6xGNB4=;
 b=FfobfwaJBOAOrdR7Cbh6ObJwJawtemF1NLL+BCjFzqziTUhWPLZ6sQjv4MLmV11E8Y
 w/H2l+zHR1EBUiTP+htNFdaF50WqydNr9BgDVzqhJvtIZ9z4aIHaCnNWHzi0oOkhQgw6
 ZtLHFx4DFitE0spJTHmF+SnTpPir8YQ7M8ClhEjE27GImSWONyq3MEEg2qWwtUmcxGTb
 C2VrTWvHYneIMNsvR2IiUElXxwfzapkKwwIB/bMkggw8LtVsiG2KVrZDKfL39tV480gC
 VojB8XwNxbmAS/QHfIHgrJjbgcgXuuJuWtrsQEX3YqGdIvRpBSOam+D44sQj4Mthuru/
 HgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CxdHWOva1wcLZN7HdcW8RTKMbDCttoUzy92bx6xGNB4=;
 b=fdI9EPofkQMhCediwa1eTrySyDRjqzyzgjCoAewhkeyB/KtPtjCJZyubV768f92IUM
 I9qjpdVRZf695ku3PqSf1aF/e4t2J46NC2bkPRrTAIHFB7SgB4AnjFI/F3PRY0oB+Qyv
 FxgTu3GE09aROpFLzS4Eu4WB0VLf1pQIz+T/hyYku8VSQW4Wy8f2MwJXXBcs4HD7leDG
 GdIpsrpouYDdKcFOCfBbh22Yc1K0Uggc4FOmOyD1kZOUNgtXhu2A+FB2ZeI9x1KI7EKN
 OM18nJBPbGaMWonVmRtYvjB7Yjolk+h4j07okcgmn3ImK4snEFTyu45Yz3xcKqvKQP6j
 eYCg==
X-Gm-Message-State: AOAM533OtAXQmkGme9IxqMstTz67p5Vk7nE8191hGtK/Y+ag1lg8Qdou
 hhBKNTCGgn6kNkxzIJtim3Ry04iawQ5EoifW
X-Google-Smtp-Source: ABdhPJyaY0PgCpV0RKGoiaaeAuRRj6U5Ubsnk3y9J2BL+1vK36JANZ9+9RCQbFpUSTdUr5DpSIp42Q==
X-Received: by 2002:aa7:8d0d:0:b029:1d7:3c52:e1f6 with SMTP id
 j13-20020aa78d0d0000b02901d73c52e1f6mr5688185pfe.39.1612565865559; 
 Fri, 05 Feb 2021 14:57:45 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c23sm12155149pgc.72.2021.02.05.14.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:57:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/46] tcg/tci: Remove TCG_CONST
Date: Fri,  5 Feb 2021 12:56:32 -1000
Message-Id: <20210205225650.1330794-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205225650.1330794-1-richard.henderson@linaro.org>
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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

Restrict all operands to registers.  All constants will be forced
into registers by the middle-end.  Removing the difference in how
immediate integers were encoded will allow more code to be shared
between 32-bit and 64-bit operations.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target-con-set.h |   6 +-
 tcg/tci/tcg-target.h         |   3 -
 tcg/tci.c                    | 189 +++++++++++++----------------------
 tcg/tci/tcg-target.c.inc     |  85 ++++------------
 4 files changed, 89 insertions(+), 194 deletions(-)

diff --git a/tcg/tci/tcg-target-con-set.h b/tcg/tci/tcg-target-con-set.h
index 38e82f7535..f51b7bcb13 100644
--- a/tcg/tci/tcg-target-con-set.h
+++ b/tcg/tci/tcg-target-con-set.h
@@ -10,16 +10,12 @@
  * tcg-target-con-str.h; the constraint combination is inclusive or.
  */
 C_O0_I2(r, r)
-C_O0_I2(r, ri)
 C_O0_I3(r, r, r)
-C_O0_I4(r, r, ri, ri)
 C_O0_I4(r, r, r, r)
 C_O1_I1(r, r)
 C_O1_I2(r, 0, r)
-C_O1_I2(r, ri, ri)
 C_O1_I2(r, r, r)
-C_O1_I2(r, r, ri)
-C_O1_I4(r, r, r, ri, ri)
+C_O1_I4(r, r, r, r, r)
 C_O2_I1(r, r, r)
 C_O2_I2(r, r, r, r)
 C_O2_I4(r, r, r, r, r, r)
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 8f7ed676fc..9c0021a26f 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -157,9 +157,6 @@ typedef enum {
 
     TCG_AREG0 = TCG_REG_R14,
     TCG_REG_CALL_STACK = TCG_REG_R15,
-
-    /* Special value UINT8_MAX is used by TCI to encode constant values. */
-    TCG_CONST = UINT8_MAX
 } TCGReg;
 
 /* Used for function call generation. */
diff --git a/tcg/tci.c b/tcg/tci.c
index 935eb87330..fb3c97aaf1 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -255,61 +255,6 @@ tci_read_ulong(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
     return taddr;
 }
 
-/* Read indexed register or constant (native size) from bytecode. */
-static tcg_target_ulong
-tci_read_ri(const tcg_target_ulong *regs, const uint8_t **tb_ptr)
-{
-    tcg_target_ulong value;
-    TCGReg r = **tb_ptr;
-    *tb_ptr += 1;
-    if (r == TCG_CONST) {
-        value = tci_read_i(tb_ptr);
-    } else {
-        value = tci_read_reg(regs, r);
-    }
-    return value;
-}
-
-/* Read indexed register or constant (32 bit) from bytecode. */
-static uint32_t tci_read_ri32(const tcg_target_ulong *regs,
-                              const uint8_t **tb_ptr)
-{
-    uint32_t value;
-    TCGReg r = **tb_ptr;
-    *tb_ptr += 1;
-    if (r == TCG_CONST) {
-        value = tci_read_i32(tb_ptr);
-    } else {
-        value = tci_read_reg32(regs, r);
-    }
-    return value;
-}
-
-#if TCG_TARGET_REG_BITS == 32
-/* Read two indexed registers or constants (2 * 32 bit) from bytecode. */
-static uint64_t tci_read_ri64(const tcg_target_ulong *regs,
-                              const uint8_t **tb_ptr)
-{
-    uint32_t low = tci_read_ri32(regs, tb_ptr);
-    return tci_uint64(tci_read_ri32(regs, tb_ptr), low);
-}
-#elif TCG_TARGET_REG_BITS == 64
-/* Read indexed register or constant (64 bit) from bytecode. */
-static uint64_t tci_read_ri64(const tcg_target_ulong *regs,
-                              const uint8_t **tb_ptr)
-{
-    uint64_t value;
-    TCGReg r = **tb_ptr;
-    *tb_ptr += 1;
-    if (r == TCG_CONST) {
-        value = tci_read_i64(tb_ptr);
-    } else {
-        value = tci_read_reg64(regs, r);
-    }
-    return value;
-}
-#endif
-
 static tcg_target_ulong tci_read_label(const uint8_t **tb_ptr)
 {
     tcg_target_ulong label = tci_read_i(tb_ptr);
@@ -504,7 +449,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         switch (opc) {
         case INDEX_op_call:
-            t0 = tci_read_ri(regs, &tb_ptr);
+            t0 = tci_read_i(&tb_ptr);
             tci_tb_ptr = (uintptr_t)tb_ptr;
 #if TCG_TARGET_REG_BITS == 32
             tmp64 = ((helper_function)t0)(tci_read_reg(regs, TCG_REG_R0),
@@ -539,7 +484,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         case INDEX_op_setcond_i32:
             t0 = *tb_ptr++;
             t1 = tci_read_r32(regs, &tb_ptr);
-            t2 = tci_read_ri32(regs, &tb_ptr);
+            t2 = tci_read_r32(regs, &tb_ptr);
             condition = *tb_ptr++;
             tci_write_reg(regs, t0, tci_compare32(t1, t2, condition));
             break;
@@ -547,7 +492,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         case INDEX_op_setcond2_i32:
             t0 = *tb_ptr++;
             tmp64 = tci_read_r64(regs, &tb_ptr);
-            v64 = tci_read_ri64(regs, &tb_ptr);
+            v64 = tci_read_r64(regs, &tb_ptr);
             condition = *tb_ptr++;
             tci_write_reg(regs, t0, tci_compare64(tmp64, v64, condition));
             break;
@@ -555,7 +500,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         case INDEX_op_setcond_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r64(regs, &tb_ptr);
-            t2 = tci_read_ri64(regs, &tb_ptr);
+            t2 = tci_read_r64(regs, &tb_ptr);
             condition = *tb_ptr++;
             tci_write_reg(regs, t0, tci_compare64(t1, t2, condition));
             break;
@@ -628,62 +573,62 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         case INDEX_op_add_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri32(regs, &tb_ptr);
-            t2 = tci_read_ri32(regs, &tb_ptr);
+            t1 = tci_read_r32(regs, &tb_ptr);
+            t2 = tci_read_r32(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 + t2);
             break;
         case INDEX_op_sub_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri32(regs, &tb_ptr);
-            t2 = tci_read_ri32(regs, &tb_ptr);
+            t1 = tci_read_r32(regs, &tb_ptr);
+            t2 = tci_read_r32(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 - t2);
             break;
         case INDEX_op_mul_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri32(regs, &tb_ptr);
-            t2 = tci_read_ri32(regs, &tb_ptr);
+            t1 = tci_read_r32(regs, &tb_ptr);
+            t2 = tci_read_r32(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 * t2);
             break;
         case INDEX_op_div_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri32(regs, &tb_ptr);
-            t2 = tci_read_ri32(regs, &tb_ptr);
+            t1 = tci_read_r32(regs, &tb_ptr);
+            t2 = tci_read_r32(regs, &tb_ptr);
             tci_write_reg(regs, t0, (int32_t)t1 / (int32_t)t2);
             break;
         case INDEX_op_divu_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri32(regs, &tb_ptr);
-            t2 = tci_read_ri32(regs, &tb_ptr);
+            t1 = tci_read_r32(regs, &tb_ptr);
+            t2 = tci_read_r32(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 / t2);
             break;
         case INDEX_op_rem_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri32(regs, &tb_ptr);
-            t2 = tci_read_ri32(regs, &tb_ptr);
+            t1 = tci_read_r32(regs, &tb_ptr);
+            t2 = tci_read_r32(regs, &tb_ptr);
             tci_write_reg(regs, t0, (int32_t)t1 % (int32_t)t2);
             break;
         case INDEX_op_remu_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri32(regs, &tb_ptr);
-            t2 = tci_read_ri32(regs, &tb_ptr);
+            t1 = tci_read_r32(regs, &tb_ptr);
+            t2 = tci_read_r32(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 % t2);
             break;
         case INDEX_op_and_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri32(regs, &tb_ptr);
-            t2 = tci_read_ri32(regs, &tb_ptr);
+            t1 = tci_read_r32(regs, &tb_ptr);
+            t2 = tci_read_r32(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 & t2);
             break;
         case INDEX_op_or_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri32(regs, &tb_ptr);
-            t2 = tci_read_ri32(regs, &tb_ptr);
+            t1 = tci_read_r32(regs, &tb_ptr);
+            t2 = tci_read_r32(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 | t2);
             break;
         case INDEX_op_xor_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri32(regs, &tb_ptr);
-            t2 = tci_read_ri32(regs, &tb_ptr);
+            t1 = tci_read_r32(regs, &tb_ptr);
+            t2 = tci_read_r32(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 ^ t2);
             break;
 
@@ -691,33 +636,33 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         case INDEX_op_shl_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri32(regs, &tb_ptr);
-            t2 = tci_read_ri32(regs, &tb_ptr);
+            t1 = tci_read_r32(regs, &tb_ptr);
+            t2 = tci_read_r32(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 << (t2 & 31));
             break;
         case INDEX_op_shr_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri32(regs, &tb_ptr);
-            t2 = tci_read_ri32(regs, &tb_ptr);
+            t1 = tci_read_r32(regs, &tb_ptr);
+            t2 = tci_read_r32(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 >> (t2 & 31));
             break;
         case INDEX_op_sar_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri32(regs, &tb_ptr);
-            t2 = tci_read_ri32(regs, &tb_ptr);
+            t1 = tci_read_r32(regs, &tb_ptr);
+            t2 = tci_read_r32(regs, &tb_ptr);
             tci_write_reg(regs, t0, ((int32_t)t1 >> (t2 & 31)));
             break;
 #if TCG_TARGET_HAS_rot_i32
         case INDEX_op_rotl_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri32(regs, &tb_ptr);
-            t2 = tci_read_ri32(regs, &tb_ptr);
+            t1 = tci_read_r32(regs, &tb_ptr);
+            t2 = tci_read_r32(regs, &tb_ptr);
             tci_write_reg(regs, t0, rol32(t1, t2 & 31));
             break;
         case INDEX_op_rotr_i32:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri32(regs, &tb_ptr);
-            t2 = tci_read_ri32(regs, &tb_ptr);
+            t1 = tci_read_r32(regs, &tb_ptr);
+            t2 = tci_read_r32(regs, &tb_ptr);
             tci_write_reg(regs, t0, ror32(t1, t2 & 31));
             break;
 #endif
@@ -734,7 +679,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #endif
         case INDEX_op_brcond_i32:
             t0 = tci_read_r32(regs, &tb_ptr);
-            t1 = tci_read_ri32(regs, &tb_ptr);
+            t1 = tci_read_r32(regs, &tb_ptr);
             condition = *tb_ptr++;
             label = tci_read_label(&tb_ptr);
             if (tci_compare32(t0, t1, condition)) {
@@ -760,7 +705,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             break;
         case INDEX_op_brcond2_i32:
             tmp64 = tci_read_r64(regs, &tb_ptr);
-            v64 = tci_read_ri64(regs, &tb_ptr);
+            v64 = tci_read_r64(regs, &tb_ptr);
             condition = *tb_ptr++;
             label = tci_read_label(&tb_ptr);
             if (tci_compare64(tmp64, v64, condition)) {
@@ -870,62 +815,62 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         case INDEX_op_add_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri64(regs, &tb_ptr);
-            t2 = tci_read_ri64(regs, &tb_ptr);
+            t1 = tci_read_r64(regs, &tb_ptr);
+            t2 = tci_read_r64(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 + t2);
             break;
         case INDEX_op_sub_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri64(regs, &tb_ptr);
-            t2 = tci_read_ri64(regs, &tb_ptr);
+            t1 = tci_read_r64(regs, &tb_ptr);
+            t2 = tci_read_r64(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 - t2);
             break;
         case INDEX_op_mul_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri64(regs, &tb_ptr);
-            t2 = tci_read_ri64(regs, &tb_ptr);
+            t1 = tci_read_r64(regs, &tb_ptr);
+            t2 = tci_read_r64(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 * t2);
             break;
         case INDEX_op_div_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri64(regs, &tb_ptr);
-            t2 = tci_read_ri64(regs, &tb_ptr);
+            t1 = tci_read_r64(regs, &tb_ptr);
+            t2 = tci_read_r64(regs, &tb_ptr);
             tci_write_reg(regs, t0, (int64_t)t1 / (int64_t)t2);
             break;
         case INDEX_op_divu_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri64(regs, &tb_ptr);
-            t2 = tci_read_ri64(regs, &tb_ptr);
+            t1 = tci_read_r64(regs, &tb_ptr);
+            t2 = tci_read_r64(regs, &tb_ptr);
             tci_write_reg(regs, t0, (uint64_t)t1 / (uint64_t)t2);
             break;
         case INDEX_op_rem_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri64(regs, &tb_ptr);
-            t2 = tci_read_ri64(regs, &tb_ptr);
+            t1 = tci_read_r64(regs, &tb_ptr);
+            t2 = tci_read_r64(regs, &tb_ptr);
             tci_write_reg(regs, t0, (int64_t)t1 % (int64_t)t2);
             break;
         case INDEX_op_remu_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri64(regs, &tb_ptr);
-            t2 = tci_read_ri64(regs, &tb_ptr);
+            t1 = tci_read_r64(regs, &tb_ptr);
+            t2 = tci_read_r64(regs, &tb_ptr);
             tci_write_reg(regs, t0, (uint64_t)t1 % (uint64_t)t2);
             break;
         case INDEX_op_and_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri64(regs, &tb_ptr);
-            t2 = tci_read_ri64(regs, &tb_ptr);
+            t1 = tci_read_r64(regs, &tb_ptr);
+            t2 = tci_read_r64(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 & t2);
             break;
         case INDEX_op_or_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri64(regs, &tb_ptr);
-            t2 = tci_read_ri64(regs, &tb_ptr);
+            t1 = tci_read_r64(regs, &tb_ptr);
+            t2 = tci_read_r64(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 | t2);
             break;
         case INDEX_op_xor_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri64(regs, &tb_ptr);
-            t2 = tci_read_ri64(regs, &tb_ptr);
+            t1 = tci_read_r64(regs, &tb_ptr);
+            t2 = tci_read_r64(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 ^ t2);
             break;
 
@@ -933,33 +878,33 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
         case INDEX_op_shl_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri64(regs, &tb_ptr);
-            t2 = tci_read_ri64(regs, &tb_ptr);
+            t1 = tci_read_r64(regs, &tb_ptr);
+            t2 = tci_read_r64(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 << (t2 & 63));
             break;
         case INDEX_op_shr_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri64(regs, &tb_ptr);
-            t2 = tci_read_ri64(regs, &tb_ptr);
+            t1 = tci_read_r64(regs, &tb_ptr);
+            t2 = tci_read_r64(regs, &tb_ptr);
             tci_write_reg(regs, t0, t1 >> (t2 & 63));
             break;
         case INDEX_op_sar_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri64(regs, &tb_ptr);
-            t2 = tci_read_ri64(regs, &tb_ptr);
+            t1 = tci_read_r64(regs, &tb_ptr);
+            t2 = tci_read_r64(regs, &tb_ptr);
             tci_write_reg(regs, t0, ((int64_t)t1 >> (t2 & 63)));
             break;
 #if TCG_TARGET_HAS_rot_i64
         case INDEX_op_rotl_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri64(regs, &tb_ptr);
-            t2 = tci_read_ri64(regs, &tb_ptr);
+            t1 = tci_read_r64(regs, &tb_ptr);
+            t2 = tci_read_r64(regs, &tb_ptr);
             tci_write_reg(regs, t0, rol64(t1, t2 & 63));
             break;
         case INDEX_op_rotr_i64:
             t0 = *tb_ptr++;
-            t1 = tci_read_ri64(regs, &tb_ptr);
-            t2 = tci_read_ri64(regs, &tb_ptr);
+            t1 = tci_read_r64(regs, &tb_ptr);
+            t2 = tci_read_r64(regs, &tb_ptr);
             tci_write_reg(regs, t0, ror64(t1, t2 & 63));
             break;
 #endif
@@ -976,7 +921,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #endif
         case INDEX_op_brcond_i64:
             t0 = tci_read_r64(regs, &tb_ptr);
-            t1 = tci_read_ri64(regs, &tb_ptr);
+            t1 = tci_read_r64(regs, &tb_ptr);
             condition = *tb_ptr++;
             label = tci_read_label(&tb_ptr);
             if (tci_compare64(t0, t1, condition)) {
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index aba7f75ad1..feac4659cc 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -92,8 +92,6 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_rem_i64:
     case INDEX_op_remu_i32:
     case INDEX_op_remu_i64:
-        return C_O1_I2(r, r, r);
-
     case INDEX_op_add_i32:
     case INDEX_op_add_i64:
     case INDEX_op_sub_i32:
@@ -126,8 +124,9 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_rotl_i64:
     case INDEX_op_rotr_i32:
     case INDEX_op_rotr_i64:
-        /* TODO: Does R, RI, RI result in faster code than R, R, RI? */
-        return C_O1_I2(r, ri, ri);
+    case INDEX_op_setcond_i32:
+    case INDEX_op_setcond_i64:
+        return C_O1_I2(r, r, r);
 
     case INDEX_op_deposit_i32:
     case INDEX_op_deposit_i64:
@@ -135,11 +134,7 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
     case INDEX_op_brcond_i32:
     case INDEX_op_brcond_i64:
-        return C_O0_I2(r, ri);
-
-    case INDEX_op_setcond_i32:
-    case INDEX_op_setcond_i64:
-        return C_O1_I2(r, r, ri);
+        return C_O0_I2(r, r);
 
 #if TCG_TARGET_REG_BITS == 32
     /* TODO: Support R, R, R, R, RI, RI? Will it be faster? */
@@ -147,11 +142,11 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_sub2_i32:
         return C_O2_I4(r, r, r, r, r, r);
     case INDEX_op_brcond2_i32:
-        return C_O0_I4(r, r, ri, ri);
+        return C_O0_I4(r, r, r, r);
     case INDEX_op_mulu2_i32:
         return C_O2_I2(r, r, r, r);
     case INDEX_op_setcond2_i32:
-        return C_O1_I4(r, r, r, ri, ri);
+        return C_O1_I4(r, r, r, r, r);
 #endif
 
     case INDEX_op_qemu_ld_i32:
@@ -294,44 +289,6 @@ static void tcg_out_r(TCGContext *s, TCGArg t0)
     tcg_out8(s, t0);
 }
 
-/* Write register or constant (native size). */
-static void tcg_out_ri(TCGContext *s, int const_arg, TCGArg arg)
-{
-    if (const_arg) {
-        tcg_debug_assert(const_arg == 1);
-        tcg_out8(s, TCG_CONST);
-        tcg_out_i(s, arg);
-    } else {
-        tcg_out_r(s, arg);
-    }
-}
-
-/* Write register or constant (32 bit). */
-static void tcg_out_ri32(TCGContext *s, int const_arg, TCGArg arg)
-{
-    if (const_arg) {
-        tcg_debug_assert(const_arg == 1);
-        tcg_out8(s, TCG_CONST);
-        tcg_out32(s, arg);
-    } else {
-        tcg_out_r(s, arg);
-    }
-}
-
-#if TCG_TARGET_REG_BITS == 64
-/* Write register or constant (64 bit). */
-static void tcg_out_ri64(TCGContext *s, int const_arg, TCGArg arg)
-{
-    if (const_arg) {
-        tcg_debug_assert(const_arg == 1);
-        tcg_out8(s, TCG_CONST);
-        tcg_out64(s, arg);
-    } else {
-        tcg_out_r(s, arg);
-    }
-}
-#endif
-
 /* Write label. */
 static void tci_out_label(TCGContext *s, TCGLabel *label)
 {
@@ -419,7 +376,7 @@ static inline void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg)
 {
     uint8_t *old_code_ptr = s->code_ptr;
     tcg_out_op_t(s, INDEX_op_call);
-    tcg_out_ri(s, 1, (uintptr_t)arg);
+    tcg_out_i(s, (uintptr_t)arg);
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
@@ -453,7 +410,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     case INDEX_op_setcond_i32:
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
-        tcg_out_ri32(s, const_args[2], args[2]);
+        tcg_out_r(s, args[2]);
         tcg_out8(s, args[3]);   /* condition */
         break;
 #if TCG_TARGET_REG_BITS == 32
@@ -462,15 +419,15 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
         tcg_out_r(s, args[2]);
-        tcg_out_ri32(s, const_args[3], args[3]);
-        tcg_out_ri32(s, const_args[4], args[4]);
+        tcg_out_r(s, args[3]);
+        tcg_out_r(s, args[4]);
         tcg_out8(s, args[5]);   /* condition */
         break;
 #elif TCG_TARGET_REG_BITS == 64
     case INDEX_op_setcond_i64:
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
-        tcg_out_ri64(s, const_args[2], args[2]);
+        tcg_out_r(s, args[2]);
         tcg_out8(s, args[3]);   /* condition */
         break;
 #endif
@@ -516,8 +473,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     case INDEX_op_rotl_i32:     /* Optional (TCG_TARGET_HAS_rot_i32). */
     case INDEX_op_rotr_i32:     /* Optional (TCG_TARGET_HAS_rot_i32). */
         tcg_out_r(s, args[0]);
-        tcg_out_ri32(s, const_args[1], args[1]);
-        tcg_out_ri32(s, const_args[2], args[2]);
+        tcg_out_r(s, args[1]);
+        tcg_out_r(s, args[2]);
         break;
     case INDEX_op_deposit_i32:  /* Optional (TCG_TARGET_HAS_deposit_i32). */
         tcg_out_r(s, args[0]);
@@ -551,8 +508,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     case INDEX_op_rem_i64:      /* Optional (TCG_TARGET_HAS_div_i64). */
     case INDEX_op_remu_i64:     /* Optional (TCG_TARGET_HAS_div_i64). */
         tcg_out_r(s, args[0]);
-        tcg_out_ri64(s, const_args[1], args[1]);
-        tcg_out_ri64(s, const_args[2], args[2]);
+        tcg_out_r(s, args[1]);
+        tcg_out_r(s, args[2]);
         break;
     case INDEX_op_deposit_i64:  /* Optional (TCG_TARGET_HAS_deposit_i64). */
         tcg_out_r(s, args[0]);
@@ -565,7 +522,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
     case INDEX_op_brcond_i64:
         tcg_out_r(s, args[0]);
-        tcg_out_ri64(s, const_args[1], args[1]);
+        tcg_out_r(s, args[1]);
         tcg_out8(s, args[2]);           /* condition */
         tci_out_label(s, arg_label(args[3]));
         break;
@@ -599,8 +556,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     case INDEX_op_rem_i32:      /* Optional (TCG_TARGET_HAS_div_i32). */
     case INDEX_op_remu_i32:     /* Optional (TCG_TARGET_HAS_div_i32). */
         tcg_out_r(s, args[0]);
-        tcg_out_ri32(s, const_args[1], args[1]);
-        tcg_out_ri32(s, const_args[2], args[2]);
+        tcg_out_r(s, args[1]);
+        tcg_out_r(s, args[2]);
         break;
 #if TCG_TARGET_REG_BITS == 32
     case INDEX_op_add2_i32:
@@ -615,8 +572,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
     case INDEX_op_brcond2_i32:
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
-        tcg_out_ri32(s, const_args[2], args[2]);
-        tcg_out_ri32(s, const_args[3], args[3]);
+        tcg_out_r(s, args[2]);
+        tcg_out_r(s, args[3]);
         tcg_out8(s, args[4]);           /* condition */
         tci_out_label(s, arg_label(args[5]));
         break;
@@ -629,7 +586,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
 #endif
     case INDEX_op_brcond_i32:
         tcg_out_r(s, args[0]);
-        tcg_out_ri32(s, const_args[1], args[1]);
+        tcg_out_r(s, args[1]);
         tcg_out8(s, args[2]);           /* condition */
         tci_out_label(s, arg_label(args[3]));
         break;
-- 
2.25.1


