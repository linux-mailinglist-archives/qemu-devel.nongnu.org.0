Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F633ADB55
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 20:30:18 +0200 (CEST)
Received: from localhost ([::1]:48786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lufjV-0007fJ-CY
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 14:30:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUy-0000wx-9n
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:17 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:45603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUp-0002Lx-SO
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:15 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 z3-20020a17090a3983b029016bc232e40bso7766718pjb.4
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 11:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kw7+bwGwUqn3XkCOlv8Pogxg02JLdDldMJ7UBex/Bo8=;
 b=qo7XwAriiPOk37n6Ut2IeHprw/0x46D3cT2xLdPOXAJPSF0RoLVesVPPB6/3IE4h2P
 OOmL/smlw0epDh/9B1yIcwv7JfuLkIcd/WoQmpRpHdDO+Z4YPIB6/Q6T+Fw9KBymumai
 kHAPIvq+PIpVfpyUBKaRlBOkYVblyfZ3weTZP0aFV4GZCszBEv1lQoQt54KDfiLKvlpZ
 NhOxOMsmNHjHgtKoY00QWw548GI8L4Kn1Hjl1gW3eI1TXIovooDVxyKRPYX3WfvfXkdx
 RZnziHLZt9/tRsQQ6rwixBgd1VXZqrC0AzjkEbfBHRkSSeSCKxmztRRFRad67KoHDwr0
 rDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kw7+bwGwUqn3XkCOlv8Pogxg02JLdDldMJ7UBex/Bo8=;
 b=dKhQ++HFTmJti720dp/TETn8V139y6d+SpHrDVQM4D/o02hWrZ2eWXX8TTRWSbU5+M
 hNoZbuX/hqT38iEYXVAILTPpg93+P1M2UzU3NLFAvYlUaBFPaNpyf72g0gcZKpic0HRY
 XhuQNADUqbiDKYk49vSmMAe27sY3PUZnWgdikRRFeGHkHcDOEUNAkd06BgXJo7iRwSge
 XJY3U50t5hG+EKVvG7+NDHG2H71oenkwoTuastBRtO64BNw0FxhUidAMPcsCoiA1UJEH
 xTInuaI8rv43XGW9kqS4vkrjygUGaArhUtKZ2KQuFGhlknPqPkXMJW2RUXVxzUW+NbsN
 JqYg==
X-Gm-Message-State: AOAM530E1I8m6Oq0t3ua6KJbRW/lBlYPAvmlpVHavd9vEb78eXjbHAdq
 kXo6YvmNAAGhvm9PraZ++EyXvc083HGjPQ==
X-Google-Smtp-Source: ABdhPJxyYH5iAQyZDf04qSTA8bZQLoNP4HQCL6lLjSz7EHRKkdKdhh2zIdL3CO4e9tVFlCD3IovRSg==
X-Received: by 2002:a17:90a:7026:: with SMTP id
 f35mr3424952pjk.219.1624126505413; 
 Sat, 19 Jun 2021 11:15:05 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k35sm12059113pgi.21.2021.06.19.11.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 11:15:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/33] tcg/tci: Implement mulu2, muls2
Date: Sat, 19 Jun 2021 11:14:40 -0700
Message-Id: <20210619181452.877683-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619181452.877683-1-richard.henderson@linaro.org>
References: <20210619181452.877683-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

We already had mulu2_i32 for a 32-bit host; expand this to 64-bit
hosts as well.  The muls2_i32 and the 64-bit opcodes are new.

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.h     |  8 ++++----
 tcg/tci.c                | 35 +++++++++++++++++++++++++++++------
 tcg/tci/tcg-target.c.inc | 16 ++++++++++------
 3 files changed, 43 insertions(+), 16 deletions(-)

diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 5614e16857..533f62bfcb 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -84,7 +84,7 @@
 #define TCG_TARGET_HAS_orc_i32          1
 #define TCG_TARGET_HAS_rot_i32          1
 #define TCG_TARGET_HAS_movcond_i32      1
-#define TCG_TARGET_HAS_muls2_i32        0
+#define TCG_TARGET_HAS_muls2_i32        1
 #define TCG_TARGET_HAS_muluh_i32        0
 #define TCG_TARGET_HAS_mulsh_i32        0
 #define TCG_TARGET_HAS_goto_ptr         1
@@ -121,13 +121,13 @@
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
index adfca71c0f..ebe2eafa62 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -41,7 +41,7 @@ __thread uintptr_t tci_tb_ptr;
 static void tci_write_reg64(tcg_target_ulong *regs, uint32_t high_index,
                             uint32_t low_index, uint64_t value)
 {
-    regs[low_index] = value;
+    regs[low_index] = (uint32_t)value;
     regs[high_index] = value >> 32;
 }
 
@@ -173,7 +173,6 @@ static void tci_args_rrrrr(uint32_t insn, TCGReg *r0, TCGReg *r1,
     *r4 = extract32(insn, 24, 4);
 }
 
-#if TCG_TARGET_REG_BITS == 32
 static void tci_args_rrrr(uint32_t insn,
                           TCGReg *r0, TCGReg *r1, TCGReg *r2, TCGReg *r3)
 {
@@ -182,7 +181,6 @@ static void tci_args_rrrr(uint32_t insn,
     *r2 = extract32(insn, 16, 4);
     *r3 = extract32(insn, 20, 4);
 }
-#endif
 
 static void tci_args_rrrrrc(uint32_t insn, TCGReg *r0, TCGReg *r1,
                             TCGReg *r2, TCGReg *r3, TCGReg *r4, TCGCond *c5)
@@ -671,11 +669,21 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -779,6 +787,18 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
 
@@ -1286,14 +1306,17 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
                            str_r(r3), str_r(r4), str_c(c));
         break;
 
-#if TCG_TARGET_REG_BITS == 32
     case INDEX_op_mulu2_i32:
+    case INDEX_op_mulu2_i64:
+    case INDEX_op_muls2_i32:
+    case INDEX_op_muls2_i64:
         tci_args_rrrr(insn, &r0, &r1, &r2, &r3);
         info->fprintf_func(info->stream, "%-12s  %s, %s, %s, %s",
                            op_name, str_r(r0), str_r(r1),
                            str_r(r2), str_r(r3));
         break;
 
+#if TCG_TARGET_REG_BITS == 32
     case INDEX_op_add2_i32:
     case INDEX_op_sub2_i32:
         tci_args_rrrrrr(insn, &r0, &r1, &r2, &r3, &r4, &r5);
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 69f41659be..e48dbc95d2 100644
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
@@ -726,10 +728,12 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
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


