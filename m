Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1668B30EA7E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:57:23 +0100 (CET)
Received: from localhost ([::1]:57596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Upe-0005Dm-1M
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:57:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TvJ-0003q6-KG
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:59:09 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:37017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TvD-0007eR-0X
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:59:09 -0500
Received: by mail-pg1-x531.google.com with SMTP id z21so1057012pgj.4
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ykwqi1nfU63kykOjWC2hHHptQCv8OjjZ7CWKjmVZrJc=;
 b=EyzgyV3qoF5b5CYIQbmuLD93bPKuzXNeVS3xOXCQkn1Xi+3YzhOuXKKNTfvZgoPy+a
 mXC9QfyU4zQRnUMj3KQOAJx6BsIken6AheLLg9D36E+1k0orSvPqBgBWEFxCPZH73JVR
 z3wjFHq69iC/rjM3s9cKNvCEqAvRL6XzMg40qJL1Ebje3CGgWpG8wCY26p15jxuB8enU
 /wGVyijULMPE8ZcQ2dMJ5mTykiFggdSw8ETboSk3sUWw2B7LyitXO3c2iQqDf8uCMkJO
 eBbXsKlL7K9kAe8oeVgeZmBUsr1Wk1VytEBM9boYHRjBenZpaSeKgVrdLVGdkT+9GsIi
 EK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ykwqi1nfU63kykOjWC2hHHptQCv8OjjZ7CWKjmVZrJc=;
 b=sGx5vTfeZkLcWFIC1qizfOcODlt7ZMPdqhEnQD9Fyv5wkdG3zvjRLj4MXa6/Z5ZG/Q
 9G5eent5K9Q7PXa0j9rGW5kjwKoIo24QWr931Mj1O22A6UeDyThsCO+C/dYgilGRDgFD
 g82qBBGbvqHS9QYC3qYQUWXhRJJCFizAajwGFAJWVJse5gKST1yp4YYvgrzjUJbhSKyd
 ivpLgYPd2hpQkEWBQBN8oPLnWEooEtY+FiApgTelhDTZEph12SStQ+i+Y/IrgKbOOyun
 ttqhjGVA5YkjZj1CmoRcBIBgtmnvD9yVsKTcvLNO7zr2hcRmtQIfdaVeMiKuJflYorAf
 O9JA==
X-Gm-Message-State: AOAM531WBeJUiHt36fDvLaYqEAetnxWAIc4Gt1f8u2as25VKStpoYb6D
 xNvyOcv+3Ml8cutmv84lvpM+dQjAZjc8M2ju
X-Google-Smtp-Source: ABdhPJymWHRHGarZl6iTnqC0OJgLdttaKme0esncyGbADfPHz0XI8ruYwd0eZ8Cph5f9mhF0NmDY7A==
X-Received: by 2002:a63:f404:: with SMTP id g4mr6581708pgi.114.1612403938056; 
 Wed, 03 Feb 2021 17:58:58 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id s11sm3513983pfu.69.2021.02.03.17.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:58:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 93/93] tcg/tci: Implement add2, sub2
Date: Wed,  3 Feb 2021 15:58:55 -1000
Message-Id: <20210204015855.885981-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

We already had the 32-bit versions for a 32-bit host; expand this
to 64-bit hosts as well.  The 64-bit opcodes are new.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.h     |  8 ++++----
 tcg/tci.c                | 40 ++++++++++++++++++++++++++--------------
 tcg/tci/tcg-target.c.inc | 15 ++++++++-------
 3 files changed, 38 insertions(+), 25 deletions(-)

diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 71a44bbfb0..515b3c7a56 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -121,11 +121,11 @@
 #define TCG_TARGET_HAS_rot_i64          1
 #define TCG_TARGET_HAS_movcond_i64      1
 #define TCG_TARGET_HAS_muls2_i64        1
-#define TCG_TARGET_HAS_add2_i32         0
-#define TCG_TARGET_HAS_sub2_i32         0
+#define TCG_TARGET_HAS_add2_i32         1
+#define TCG_TARGET_HAS_sub2_i32         1
 #define TCG_TARGET_HAS_mulu2_i32        1
-#define TCG_TARGET_HAS_add2_i64         0
-#define TCG_TARGET_HAS_sub2_i64         0
+#define TCG_TARGET_HAS_add2_i64         1
+#define TCG_TARGET_HAS_sub2_i64         1
 #define TCG_TARGET_HAS_mulu2_i64        1
 #define TCG_TARGET_HAS_muluh_i64        0
 #define TCG_TARGET_HAS_mulsh_i64        0
diff --git a/tcg/tci.c b/tcg/tci.c
index 5d83b2d957..ee16142f48 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -189,7 +189,6 @@ static void tci_args_rrrrrc(uint32_t insn, TCGReg *r0, TCGReg *r1,
     *c5 = extract32(insn, 28, 4);
 }
 
-#if TCG_TARGET_REG_BITS == 32
 static void tci_args_rrrrrr(uint32_t insn, TCGReg *r0, TCGReg *r1,
                             TCGReg *r2, TCGReg *r3, TCGReg *r4, TCGReg *r5)
 {
@@ -200,7 +199,6 @@ static void tci_args_rrrrrr(uint32_t insn, TCGReg *r0, TCGReg *r1,
     *r4 = extract32(insn, 24, 4);
     *r5 = extract32(insn, 28, 4);
 }
-#endif
 
 static bool tci_compare32(uint32_t u0, uint32_t u1, TCGCond condition)
 {
@@ -368,17 +366,14 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
     for (;;) {
         uint32_t insn;
         TCGOpcode opc;
-        TCGReg r0, r1, r2, r3, r4;
+        TCGReg r0, r1, r2, r3, r4, r5;
         tcg_target_ulong t1;
         TCGCond condition;
         target_ulong taddr;
         uint8_t pos, len;
         uint32_t tmp32;
         uint64_t tmp64;
-#if TCG_TARGET_REG_BITS == 32
-        TCGReg r5;
         uint64_t T1, T2;
-#endif
         TCGMemOpIdx oi;
         int32_t ofs;
         void *ptr;
@@ -665,20 +660,22 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                 tb_ptr = ptr;
             }
             break;
-#if TCG_TARGET_REG_BITS == 32
+#if TCG_TARGET_REG_BITS == 32 || TCG_TARGET_HAS_add2_i32
         case INDEX_op_add2_i32:
             tci_args_rrrrrr(insn, &r0, &r1, &r2, &r3, &r4, &r5);
             T1 = tci_uint64(regs[r3], regs[r2]);
             T2 = tci_uint64(regs[r5], regs[r4]);
             tci_write_reg64(regs, r1, r0, T1 + T2);
             break;
+#endif
+#if TCG_TARGET_REG_BITS == 32 || TCG_TARGET_HAS_sub2_i32
         case INDEX_op_sub2_i32:
             tci_args_rrrrrr(insn, &r0, &r1, &r2, &r3, &r4, &r5);
             T1 = tci_uint64(regs[r3], regs[r2]);
             T2 = tci_uint64(regs[r5], regs[r4]);
             tci_write_reg64(regs, r1, r0, T1 - T2);
             break;
-#endif /* TCG_TARGET_REG_BITS == 32 */
+#endif
 #if TCG_TARGET_HAS_mulu2_i32
         case INDEX_op_mulu2_i32:
             tci_args_rrrr(insn, &r0, &r1, &r2, &r3);
@@ -808,6 +805,24 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             muls64(&regs[r0], &regs[r1], regs[r2], regs[r3]);
             break;
 #endif
+#if TCG_TARGET_HAS_add2_i64
+        case INDEX_op_add2_i64:
+            tci_args_rrrrrr(insn, &r0, &r1, &r2, &r3, &r4, &r5);
+            T1 = regs[r2] + regs[r4];
+            T2 = regs[r3] + regs[r5] + (T1 < regs[r2]);
+            regs[r0] = T1;
+            regs[r1] = T2;
+            break;
+#endif
+#if TCG_TARGET_HAS_add2_i64
+        case INDEX_op_sub2_i64:
+            tci_args_rrrrrr(insn, &r0, &r1, &r2, &r3, &r4, &r5);
+            T1 = regs[r2] - regs[r4];
+            T2 = regs[r3] - regs[r5] - (regs[r2] < regs[r4]);
+            regs[r0] = T1;
+            regs[r1] = T2;
+            break;
+#endif
 
             /* Shift/rotate operations (64 bit). */
 
@@ -1124,10 +1139,7 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
     const char *op_name;
     uint32_t insn;
     TCGOpcode op;
-    TCGReg r0, r1, r2, r3, r4;
-#if TCG_TARGET_REG_BITS == 32
-    TCGReg r5;
-#endif
+    TCGReg r0, r1, r2, r3, r4, r5;
     tcg_target_ulong i1;
     int32_t s2;
     TCGCond c;
@@ -1325,15 +1337,15 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
                            str_r(r2), str_r(r3));
         break;
 
-#if TCG_TARGET_REG_BITS == 32
     case INDEX_op_add2_i32:
+    case INDEX_op_add2_i64:
     case INDEX_op_sub2_i32:
+    case INDEX_op_sub2_i64:
         tci_args_rrrrrr(insn, &r0, &r1, &r2, &r3, &r4, &r5);
         info->fprintf_func(info->stream, "%-12s  %s,%s,%s,%s,%s,%s",
                            op_name, str_r(r0), str_r(r1), str_r(r2),
                            str_r(r3), str_r(r4), str_r(r5));
         break;
-#endif
 
     case INDEX_op_qemu_ld_i64:
     case INDEX_op_qemu_st_i64:
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index eb48633fba..9b2e2c32a1 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -134,11 +134,13 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_brcond_i64:
         return C_O0_I2(r, r);
 
-#if TCG_TARGET_REG_BITS == 32
-    /* TODO: Support R, R, R, R, RI, RI? Will it be faster? */
     case INDEX_op_add2_i32:
+    case INDEX_op_add2_i64:
     case INDEX_op_sub2_i32:
+    case INDEX_op_sub2_i64:
         return C_O2_I4(r, r, r, r, r, r);
+
+#if TCG_TARGET_REG_BITS == 32
     case INDEX_op_brcond2_i32:
         return C_O0_I4(r, r, r, r);
 #endif
@@ -467,7 +469,6 @@ static void tcg_out_op_rrrrrc(TCGContext *s, TCGOpcode op,
     tcg_out32(s, insn);
 }
 
-#if TCG_TARGET_REG_BITS == 32
 static void tcg_out_op_rrrrrr(TCGContext *s, TCGOpcode op,
                               TCGReg r0, TCGReg r1, TCGReg r2,
                               TCGReg r3, TCGReg r4, TCGReg r5)
@@ -483,7 +484,6 @@ static void tcg_out_op_rrrrrr(TCGContext *s, TCGOpcode op,
     insn = deposit32(insn, 28, 4, r5);
     tcg_out32(s, insn);
 }
-#endif
 
 static void tcg_out_ldst(TCGContext *s, TCGOpcode op, TCGReg val,
                          TCGReg base, intptr_t offset)
@@ -719,12 +719,13 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         tcg_out_op_rr(s, opc, args[0], args[1]);
         break;
 
-#if TCG_TARGET_REG_BITS == 32
-    case INDEX_op_add2_i32:
-    case INDEX_op_sub2_i32:
+    CASE_32_64(add2)
+    CASE_32_64(sub2)
         tcg_out_op_rrrrrr(s, opc, args[0], args[1], args[2],
                           args[3], args[4], args[5]);
         break;
+
+#if TCG_TARGET_REG_BITS == 32
     case INDEX_op_brcond2_i32:
         tcg_out_op_rrrrrc(s, INDEX_op_setcond2_i32, TCG_REG_TMP,
                           args[0], args[1], args[2], args[3], args[4]);
-- 
2.25.1


