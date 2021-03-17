Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB41733F4C3
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:57:00 +0100 (CET)
Received: from localhost ([::1]:59396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYXb-0003qY-O1
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCR-0005CI-CU
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:07 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:36737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCN-0007Bh-7k
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:07 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 g8-20020a9d6c480000b02901b65ca2432cso2180067otq.3
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NmBZo7AXRGPv0b50PXBcgMx9DdtcXIoXUKSXEv41j2E=;
 b=YrDE5YoyQdpDau7WrKwMsvfPgvg1yS/rPssulrB9VlESBJAVMxx/tFPh93veIdPq4a
 rWZZA49KnLKqA28bwQslm8doU3Zu6x94fqBs0ElSx40sAd+qEDb5WknOToJmUTzB+Ut7
 OS1IEWaQl6jDi06B+LILmsD8US27TJaaLCoYq7FTfm3BleGYl5leVeo93UD9MrFdlY+w
 bYBnWHTV9emDmTtRm7K2SXPYgD/V0m4t3oIUhg6Igo21MxbZSvEk6hpHwOsTtwrtCigP
 /mCM87XuaANdYZPFDFLu8ktV8Zsr83xwOujQB4AleHKuN9sl7RNz2tOChASTFobn9rbl
 Hyww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NmBZo7AXRGPv0b50PXBcgMx9DdtcXIoXUKSXEv41j2E=;
 b=DJdNSUa+kfq+6eV0NnTYAwH8TmRQsE/42Zwn+aAxQBHdg29LcAIXB1N9uTS2c3ndI8
 JVA2FXkj8G91TufPvvpm2O+xMh8tNt6n7QJCIJdtQ5lpl6JhuFlX5DaBryx7s58ZNVuz
 08ohjq70oI+1Rpndb0yFsgxf3PoKLBoUJcM4dWjJ4LXTSOmno1u6AzvTdKMBiVaILHMD
 s+ZbJCy4Rv2dQ+ROjjBjQhRetVDIOUcCNoST3/28E5JeeG/5+yETBSZtj0YBt05HwIaJ
 IS5xzb8TnlPqm6/avSvl3sxbB4N9LkVWQIUjxutvI2P6D+hQIgWcnVO9Voxe+nTUGY2+
 P/Qg==
X-Gm-Message-State: AOAM530l/iahhuikcsVeqzjXFNAy/cUWeeREExBZNelKTayC8Iz0G6Ad
 euTf0a6vAhd60scijL/aiY9fntIpkDImgi5m
X-Google-Smtp-Source: ABdhPJxQNcitCdyUdWW3WeC0CDtZZoBweiFdkF0VuS3fY4juklDrlfTFB7a/Vm6Sg6cmxEP/L+wsHQ==
X-Received: by 2002:a9d:12a4:: with SMTP id g33mr3803799otg.308.1615995302133; 
 Wed, 17 Mar 2021 08:35:02 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm8271154otp.76.2021.03.17.08.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 08:35:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/38] tcg/tci: Clean up deposit operations
Date: Wed, 17 Mar 2021 09:34:22 -0600
Message-Id: <20210317153444.310566-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317153444.310566-1-richard.henderson@linaro.org>
References: <20210317153444.310566-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
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

Use the correct set of asserts during code generation.
We do not require the first input to overlap the output;
the existing interpreter already supported that.

Split out tci_args_rrrbb in the translator.
Use the deposit32/64 functions rather than inline expansion.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target-con-set.h |  1 -
 tcg/tci.c                    | 33 ++++++++++++++++-----------------
 tcg/tci/tcg-target.c.inc     | 24 ++++++++++++++----------
 3 files changed, 30 insertions(+), 28 deletions(-)

diff --git a/tcg/tci/tcg-target-con-set.h b/tcg/tci/tcg-target-con-set.h
index f51b7bcb13..316730f32c 100644
--- a/tcg/tci/tcg-target-con-set.h
+++ b/tcg/tci/tcg-target-con-set.h
@@ -13,7 +13,6 @@ C_O0_I2(r, r)
 C_O0_I3(r, r, r)
 C_O0_I4(r, r, r, r)
 C_O1_I1(r, r)
-C_O1_I2(r, 0, r)
 C_O1_I2(r, r, r)
 C_O1_I4(r, r, r, r, r)
 C_O2_I1(r, r, r)
diff --git a/tcg/tci.c b/tcg/tci.c
index 2fcf5a2473..22a5832387 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -168,6 +168,7 @@ static tcg_target_ulong tci_read_label(const uint8_t **tb_ptr)
  *   tci_args_<arguments>
  * where arguments is a sequence of
  *
+ *   b = immediate (bit position)
  *   c = condition (TCGCond)
  *   i = immediate (uint32_t)
  *   I = immediate (tcg_target_ulong)
@@ -238,6 +239,16 @@ static void tci_args_rrrc(const uint8_t **tb_ptr,
     *c3 = tci_read_b(tb_ptr);
 }
 
+static void tci_args_rrrbb(const uint8_t **tb_ptr, TCGReg *r0, TCGReg *r1,
+                           TCGReg *r2, uint8_t *i3, uint8_t *i4)
+{
+    *r0 = tci_read_r(tb_ptr);
+    *r1 = tci_read_r(tb_ptr);
+    *r2 = tci_read_r(tb_ptr);
+    *i3 = tci_read_b(tb_ptr);
+    *i4 = tci_read_b(tb_ptr);
+}
+
 #if TCG_TARGET_REG_BITS == 32
 static void tci_args_rrrr(const uint8_t **tb_ptr,
                           TCGReg *r0, TCGReg *r1, TCGReg *r2, TCGReg *r3)
@@ -434,11 +445,9 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
         TCGReg r0, r1, r2;
         tcg_target_ulong t0;
         tcg_target_ulong t1;
-        tcg_target_ulong t2;
         TCGCond condition;
         target_ulong taddr;
-        uint8_t tmp8;
-        uint16_t tmp16;
+        uint8_t pos, len;
         uint32_t tmp32;
         uint64_t tmp64;
 #if TCG_TARGET_REG_BITS == 32
@@ -629,13 +638,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #endif
 #if TCG_TARGET_HAS_deposit_i32
         case INDEX_op_deposit_i32:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tmp16 = *tb_ptr++;
-            tmp8 = *tb_ptr++;
-            tmp32 = (((1 << tmp8) - 1) << tmp16);
-            tci_write_reg(regs, t0, (t1 & ~tmp32) | ((t2 << tmp16) & tmp32));
+            tci_args_rrrbb(&tb_ptr, &r0, &r1, &r2, &pos, &len);
+            regs[r0] = deposit32(regs[r1], pos, len, regs[r2]);
             break;
 #endif
         case INDEX_op_brcond_i32:
@@ -791,13 +795,8 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 #endif
 #if TCG_TARGET_HAS_deposit_i64
         case INDEX_op_deposit_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_rval(regs, &tb_ptr);
-            t2 = tci_read_rval(regs, &tb_ptr);
-            tmp16 = *tb_ptr++;
-            tmp8 = *tb_ptr++;
-            tmp64 = (((1ULL << tmp8) - 1) << tmp16);
-            tci_write_reg(regs, t0, (t1 & ~tmp64) | ((t2 << tmp16) & tmp64));
+            tci_args_rrrbb(&tb_ptr, &r0, &r1, &r2, &pos, &len);
+            regs[r0] = deposit64(regs[r1], pos, len, regs[r2]);
             break;
 #endif
         case INDEX_op_brcond_i64:
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 2c64b4f617..640407b4a8 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -126,11 +126,9 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_rotr_i64:
     case INDEX_op_setcond_i32:
     case INDEX_op_setcond_i64:
-        return C_O1_I2(r, r, r);
-
     case INDEX_op_deposit_i32:
     case INDEX_op_deposit_i64:
-        return C_O1_I2(r, 0, r);
+        return C_O1_I2(r, r, r);
 
     case INDEX_op_brcond_i32:
     case INDEX_op_brcond_i64:
@@ -480,13 +478,19 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
 
     CASE_32_64(deposit)  /* Optional (TCG_TARGET_HAS_deposit_*). */
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out_r(s, args[2]);
-        tcg_debug_assert(args[3] <= UINT8_MAX);
-        tcg_out8(s, args[3]);
-        tcg_debug_assert(args[4] <= UINT8_MAX);
-        tcg_out8(s, args[4]);
+        {
+            TCGArg pos = args[3], len = args[4];
+            TCGArg max = opc == INDEX_op_deposit_i32 ? 32 : 64;
+
+            tcg_debug_assert(pos < max);
+            tcg_debug_assert(pos + len <= max);
+
+            tcg_out_r(s, args[0]);
+            tcg_out_r(s, args[1]);
+            tcg_out_r(s, args[2]);
+            tcg_out8(s, pos);
+            tcg_out8(s, len);
+        }
         break;
 
     CASE_32_64(brcond)
-- 
2.25.1


