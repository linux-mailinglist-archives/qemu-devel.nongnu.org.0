Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 968EB371018
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 02:25:53 +0200 (CEST)
Received: from localhost ([::1]:56626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldMPI-0007t3-KV
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 20:25:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLyC-0007pR-Tn
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:52 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:46674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLy8-0000gR-6U
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:52 -0400
Received: by mail-pf1-x42e.google.com with SMTP id q2so2953281pfh.13
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HTXbRk5dnzPAOLZLSEZLt/1MhyrcnT2VpPcYyaRB6Fs=;
 b=rRFzLfn7aAqPvSkbFBgEtSLJbdJTknjyngvhYROZOO8PhB2q7s7n3W0ugK6AngIUmt
 aEgsRDhnyy2jMpnF1BqYjfALgq4aBNTHtR6w5/0hBD5nHpQYWUAAVKxYnT7Ri17xZ1Z4
 1LV+1T5oQ31rik4+nBfhV0J/QXhfHnsw48DY2Q0iCe/QO06k6XSpDDfIRyuC0L2kPVG6
 XSNagi1tzHhYiJF34fxo0u9EsyRKs7BXBNiz8PyvQypj1aSTfmhvtPb8+1L4NO8ZWg9D
 djJfRM7p1EVexdODZyrq+ZAwnMLH0MMmukRiPBBXRYAvk+0JBJMtdO+bseWikeVYS0g2
 r0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HTXbRk5dnzPAOLZLSEZLt/1MhyrcnT2VpPcYyaRB6Fs=;
 b=csL+bAwOdE4suOaYsT0qv++BVdFTrIf/knKFjJ8eSTHLUvFDedQsj1/MtmA/Bsrg6d
 cyzq/olPiyLq8WdASCXLvvdhU5UUAL/lcaYjbASf9Exn2aFs2XxGZ5wZGbD6I/qHMxuD
 iCRpTxeeOFm+GP6AgdqzGiXBRn3Ir3XmakADdteeb6ulEjD09aCExs3yyK18WsUAJTCD
 UfCCBoTPQzWsy/yJqfK7Rf2cfWgRSO39WnQfYop9KzYS9ixe9NBrdaNMVPtRPhLiRSCe
 YOn+6WznllF5ANzPgx76yqx4e5iD2LzBvGxQ6+VMZ0ZxP1FqmwKixLT/HzZvJmAAibFx
 3A7w==
X-Gm-Message-State: AOAM532LpDtIO1ORIl9HHQU7LNB9tNv9xY0xGNsunVDci7pvwHZPt5QZ
 4Hpxu0VpCwNrj8/eYlq/aRtILPn/lfH+FQ==
X-Google-Smtp-Source: ABdhPJxxE/wR5a0u+123VLmWaqEly7TergHgplaw+G1mwz+tyQlrqcBprRQlpz94gD9VGO682wv5WQ==
X-Received: by 2002:a62:b40b:0:b029:27f:b12e:d67e with SMTP id
 h11-20020a62b40b0000b029027fb12ed67emr16389150pfn.51.1619999866021; 
 Sun, 02 May 2021 16:57:46 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t184sm8098054pgt.32.2021.05.02.16.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:57:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 21/26] tcg/tci: Implement mulu2, muls2
Date: Sun,  2 May 2021 16:57:22 -0700
Message-Id: <20210502235727.1979457-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502235727.1979457-1-richard.henderson@linaro.org>
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already had mulu2_i32 for a 32-bit host; expand this to 64-bit
hosts as well.  The muls2_i32 and the 64-bit opcodes are new.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index c5ed80bc57..7003a3dffe 100644
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
 
@@ -171,7 +171,6 @@ static void tci_args_rrrrr(uint32_t insn, TCGReg *r0, TCGReg *r1,
     *r4 = extract32(insn, 24, 4);
 }
 
-#if TCG_TARGET_REG_BITS == 32
 static void tci_args_rrrr(uint32_t insn,
                           TCGReg *r0, TCGReg *r1, TCGReg *r2, TCGReg *r3)
 {
@@ -180,7 +179,6 @@ static void tci_args_rrrr(uint32_t insn,
     *r2 = extract32(insn, 16, 4);
     *r3 = extract32(insn, 20, 4);
 }
-#endif
 
 static void tci_args_rrrrrc(uint32_t insn, TCGReg *r0, TCGReg *r1,
                             TCGReg *r2, TCGReg *r3, TCGReg *r4, TCGCond *c5)
@@ -668,11 +666,21 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -776,6 +784,18 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
 
@@ -1283,14 +1303,17 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
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
index 748bc13d4e..e617c46366 100644
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


