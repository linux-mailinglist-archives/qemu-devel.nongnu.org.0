Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A817231E156
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 22:28:46 +0100 (CET)
Received: from localhost ([::1]:49208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCUNJ-0004gs-N6
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 16:28:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTN5-00028P-Ik
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:24:27 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:37858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTN2-0007my-5f
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:24:27 -0500
Received: by mail-pg1-x52e.google.com with SMTP id z21so9220715pgj.4
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6h+sAi9+UBX8LOTQXXAtVUgZ0by5F5omnkIi0WF53fQ=;
 b=bNUL/Q+ekH+VJXWI9AaIOo+mUn2RrgChgTboOXpR+GFjSkH4wpAAX4K3fbBlLOPVYs
 YDtD6Mipk3NILbGcKFxpns413YYDp+7xoQb6UwxaQ6jWAWdeA8kCu3MzQv49rFD3dC9A
 z+S9S9OVdEBPZzJm3K4Cd2S55Nm6Mo0hEfbZvfeKPQZhKTGiOJGxoQWN9D9edKl6sx1u
 1ru1d8llu1+AVU9U+bSplXnkYCcwUD19ZTlB3/gwTrOBKflMRmLWy2yH1GIduEOOYdx0
 240ngl8vuS5aWDlb4VfJizbGIH82cao/D/xEl7gY9fAafyqxHhwvWvEaIj96lMfR+kew
 iZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6h+sAi9+UBX8LOTQXXAtVUgZ0by5F5omnkIi0WF53fQ=;
 b=VzN3zWL+zxg1lOGrVY4HZ1Z5ismu7Sdn0xMwld3eYnXPoj93DGqyjdTw8w59yslq5z
 f76fV/LbKJfQuWWHwnkF0K407mQxc2Z4Fsi2YI2yeL7uuTRseBJmPRhng/9LFmGrHweN
 +70QCjexGkUf29yruw2fv0RUMPP6qfYPbTSbdJshHKlr8Ii8k1JPIhpgqAJzdOSnRNf7
 69UHZT5aFtboKiSD9RCrgowyQ1/+hhbb3TFXEEGFpcQiwZrAm47QZsHo0TyycAxNqVql
 eCZryrtMBCIPDallnAG/c/LWYM1Gyy5PTUplvzAG/lczb3xRApaGt6oZdljrQAKA8VVu
 mx+g==
X-Gm-Message-State: AOAM533/5cvGnVmk6gSoWD8i9O6fSt1V5QiVxpQiYRsYyNhVVK37nsit
 vheIOst29l4Lnkv6rz5S2ipQDZwUKeKJiA==
X-Google-Smtp-Source: ABdhPJz+42f95yLmaFwbSbKiNQ5hcW69gf7iabTeIJ7SNCv0quQypbcCmdkY5veZQKSFahDqhebmoQ==
X-Received: by 2002:a62:aa06:0:b029:1ec:ec68:474a with SMTP id
 e6-20020a62aa060000b02901ecec68474amr949954pff.40.1613593462034; 
 Wed, 17 Feb 2021 12:24:22 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id v126sm3232038pfv.163.2021.02.17.12.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:24:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 67/71] tcg/tci: Implement mulu2, muls2
Date: Wed, 17 Feb 2021 12:20:32 -0800
Message-Id: <20210217202036.1724901-68-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already had mulu2_i32 for a 32-bit host; expand this to 64-bit
hosts as well.  The muls2_i32 and the 64-bit opcodes are new.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.h     |  8 ++++----
 tcg/tci.c                | 35 +++++++++++++++++++++++++++++------
 tcg/tci/tcg-target.c.inc | 16 ++++++++++------
 3 files changed, 43 insertions(+), 16 deletions(-)

diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 59859bd8a6..71a44bbfb0 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -83,7 +83,7 @@
 #define TCG_TARGET_HAS_orc_i32          1
 #define TCG_TARGET_HAS_rot_i32          1
 #define TCG_TARGET_HAS_movcond_i32      1
-#define TCG_TARGET_HAS_muls2_i32        0
+#define TCG_TARGET_HAS_muls2_i32        1
 #define TCG_TARGET_HAS_muluh_i32        0
 #define TCG_TARGET_HAS_mulsh_i32        0
 #define TCG_TARGET_HAS_goto_ptr         1
@@ -120,13 +120,13 @@
 #define TCG_TARGET_HAS_orc_i64          1
 #define TCG_TARGET_HAS_rot_i64          1
 #define TCG_TARGET_HAS_movcond_i64      1
-#define TCG_TARGET_HAS_muls2_i64        0
+#define TCG_TARGET_HAS_muls2_i64        1
 #define TCG_TARGET_HAS_add2_i32         0
 #define TCG_TARGET_HAS_sub2_i32         0
-#define TCG_TARGET_HAS_mulu2_i32        0
+#define TCG_TARGET_HAS_mulu2_i32        1
 #define TCG_TARGET_HAS_add2_i64         0
 #define TCG_TARGET_HAS_sub2_i64         0
-#define TCG_TARGET_HAS_mulu2_i64        0
+#define TCG_TARGET_HAS_mulu2_i64        1
 #define TCG_TARGET_HAS_muluh_i64        0
 #define TCG_TARGET_HAS_mulsh_i64        0
 #else
diff --git a/tcg/tci.c b/tcg/tci.c
index 068d742a80..d76b9f5798 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -39,7 +39,7 @@ __thread uintptr_t tci_tb_ptr;
 static void tci_write_reg64(tcg_target_ulong *regs, uint32_t high_index,
                             uint32_t low_index, uint64_t value)
 {
-    regs[low_index] = value;
+    regs[low_index] = (uint32_t)value;
     regs[high_index] = value >> 32;
 }
 
@@ -169,7 +169,6 @@ static void tci_args_rrrrr(uint32_t insn, TCGReg *r0, TCGReg *r1,
     *r4 = extract32(insn, 24, 4);
 }
 
-#if TCG_TARGET_REG_BITS == 32
 static void tci_args_rrrr(uint32_t insn,
                           TCGReg *r0, TCGReg *r1, TCGReg *r2, TCGReg *r3)
 {
@@ -178,7 +177,6 @@ static void tci_args_rrrr(uint32_t insn,
     *r2 = extract32(insn, 16, 4);
     *r3 = extract32(insn, 20, 4);
 }
-#endif
 
 static void tci_args_rrrrrc(uint32_t insn, TCGReg *r0, TCGReg *r1,
                             TCGReg *r2, TCGReg *r3, TCGReg *r4, TCGCond *c5)
@@ -670,11 +668,21 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             T2 = tci_uint64(regs[r5], regs[r4]);
             tci_write_reg64(regs, r1, r0, T1 - T2);
             break;
+#endif /* TCG_TARGET_REG_BITS == 32 */
+#if TCG_TARGET_HAS_mulu2_i32
         case INDEX_op_mulu2_i32:
             tci_args_rrrr(insn, &r0, &r1, &r2, &r3);
-            tci_write_reg64(regs, r1, r0, (uint64_t)regs[r2] * regs[r3]);
+            tmp64 = (uint64_t)(uint32_t)regs[r2] * (uint32_t)regs[r3];
+            tci_write_reg64(regs, r1, r0, tmp64);
             break;
-#endif /* TCG_TARGET_REG_BITS == 32 */
+#endif
+#if TCG_TARGET_HAS_muls2_i32
+        case INDEX_op_muls2_i32:
+            tci_args_rrrr(insn, &r0, &r1, &r2, &r3);
+            tmp64 = (int64_t)(int32_t)regs[r2] * (int32_t)regs[r3];
+            tci_write_reg64(regs, r1, r0, tmp64);
+            break;
+#endif
 #if TCG_TARGET_HAS_ext8s_i32 || TCG_TARGET_HAS_ext8s_i64
         CASE_32_64(ext8s)
             tci_args_rr(insn, &r0, &r1);
@@ -778,6 +786,18 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             regs[r0] = ctpop64(regs[r1]);
             break;
 #endif
+#if TCG_TARGET_HAS_mulu2_i64
+        case INDEX_op_mulu2_i64:
+            tci_args_rrrr(insn, &r0, &r1, &r2, &r3);
+            mulu64(&regs[r0], &regs[r1], regs[r2], regs[r3]);
+            break;
+#endif
+#if TCG_TARGET_HAS_muls2_i64
+        case INDEX_op_muls2_i64:
+            tci_args_rrrr(insn, &r0, &r1, &r2, &r3);
+            muls64(&regs[r0], &regs[r1], regs[r2], regs[r3]);
+            break;
+#endif
 
             /* Shift/rotate operations (64 bit). */
 
@@ -1285,14 +1305,17 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
                            str_r(r3), str_r(r4), str_c(c));
         break;
 
-#if TCG_TARGET_REG_BITS == 32
     case INDEX_op_mulu2_i32:
+    case INDEX_op_mulu2_i64:
+    case INDEX_op_muls2_i32:
+    case INDEX_op_muls2_i64:
         tci_args_rrrr(insn, &r0, &r1, &r2, &r3);
         info->fprintf_func(info->stream, "%-12s  %s,%s,%s,%s",
                            op_name, str_r(r0), str_r(r1),
                            str_r(r2), str_r(r3));
         break;
 
+#if TCG_TARGET_REG_BITS == 32
     case INDEX_op_add2_i32:
     case INDEX_op_sub2_i32:
         tci_args_rrrrrr(insn, &r0, &r1, &r2, &r3, &r4, &r5);
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 664d715440..eb48633fba 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -141,10 +141,14 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
         return C_O2_I4(r, r, r, r, r, r);
     case INDEX_op_brcond2_i32:
         return C_O0_I4(r, r, r, r);
-    case INDEX_op_mulu2_i32:
-        return C_O2_I2(r, r, r, r);
 #endif
 
+    case INDEX_op_mulu2_i32:
+    case INDEX_op_mulu2_i64:
+    case INDEX_op_muls2_i32:
+    case INDEX_op_muls2_i64:
+        return C_O2_I2(r, r, r, r);
+
     case INDEX_op_movcond_i32:
     case INDEX_op_movcond_i64:
     case INDEX_op_setcond2_i32:
@@ -434,7 +438,6 @@ static void tcg_out_op_rrrrr(TCGContext *s, TCGOpcode op, TCGReg r0,
     tcg_out32(s, insn);
 }
 
-#if TCG_TARGET_REG_BITS == 32
 static void tcg_out_op_rrrr(TCGContext *s, TCGOpcode op,
                             TCGReg r0, TCGReg r1, TCGReg r2, TCGReg r3)
 {
@@ -447,7 +450,6 @@ static void tcg_out_op_rrrr(TCGContext *s, TCGOpcode op,
     insn = deposit32(insn, 20, 4, r3);
     tcg_out32(s, insn);
 }
-#endif
 
 static void tcg_out_op_rrrrrc(TCGContext *s, TCGOpcode op,
                               TCGReg r0, TCGReg r1, TCGReg r2,
@@ -728,10 +730,12 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
                           args[0], args[1], args[2], args[3], args[4]);
         tcg_out_op_rl(s, INDEX_op_brcond_i32, TCG_REG_TMP, arg_label(args[5]));
         break;
-    case INDEX_op_mulu2_i32:
+#endif
+
+    CASE_32_64(mulu2)
+    CASE_32_64(muls2)
         tcg_out_op_rrrr(s, opc, args[0], args[1], args[2], args[3]);
         break;
-#endif
 
     case INDEX_op_qemu_ld_i32:
     case INDEX_op_qemu_st_i32:
-- 
2.25.1


