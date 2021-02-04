Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4FA30EA9C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 04:03:53 +0100 (CET)
Received: from localhost ([::1]:49038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Uvw-00057z-Aa
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 22:03:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tuy-0003V1-JN
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:58:48 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:40669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tuq-0007Zl-RF
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:58:48 -0500
Received: by mail-pg1-x533.google.com with SMTP id b21so1045395pgk.7
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K7frB2t4HRQY2QCd4vmgctpTB+qUKaU+sWJuOgxV4RM=;
 b=L3peDv4H7aEltwWOcPCZ8688ephTfrKHliYyspBi2HozLSZ6Em/Pje8JSVzMXqZlt9
 riTF+c1w7ROp1fGEV4ITqXTONZXsm4p+2DWUMNsb8YKV8u6TmEbDTXFJ01ouGFIJdSvL
 RFrhAgMjFeNXO7xvyq54aDtya1dVVTj4CRRBT/hOqer0IwOH39D4R6T5Ec9v8IyBWati
 OIRG/RQ1L2PIUa0SFhUVzFXggQOwnleyYvjzxHbzxNoYvJ76ZN+4tWQ6gbu8odJJSEgg
 5FM+N00GP7oFtCmBtXKd6JnqlzCfvQRYCvGKgoDUwyCfUnJNmjVKoUVZ2RTFRO254JYi
 unqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K7frB2t4HRQY2QCd4vmgctpTB+qUKaU+sWJuOgxV4RM=;
 b=e61ajFuXPr5+dpskVxbw1KGTUWqcsJSl+PSPny7Gz1PurKce8SafQ2aYut20J5zTpt
 d9Hgoc3rruHejeGUS/LfdDgpppexVqey6ooaQtBzqzyaLfo6ZgjW+Anl1DF2uv3RkvN1
 85Wqtfj85mnRDt83yLawE0tpa+EfQm3VU5NLzB6S28l59UqnYgQyrACftUxHM1LRhhfq
 y5DI8YKiMQ18lknbkG2WSHO5J7znaChCTu+tz/SRHzEjVUpw3S0J2F5u6zU53+qB36nH
 /Am0e/fcYBD2Q6ZxYO5MKweBWnD8qwj3frzM6vCDouAg+WgdV1ydYjypH/bSJBahc1Dc
 Od4A==
X-Gm-Message-State: AOAM530IW1Gttmbz/IeGA3KNDZ1Fc3dzJ5+ET9nuSqzLHz/cfPFkGI2s
 b3GmwvSoPMblQeOo1yhYo1ze79ntsoCpQPMa
X-Google-Smtp-Source: ABdhPJxdtT2blUegOZo2LUHx6Zqfy9wTE1TOuU13jH7eeV2SHkzrcYI1amSGtkA93hysca86G2w/Uw==
X-Received: by 2002:a63:d143:: with SMTP id c3mr6826866pgj.86.1612403919564;
 Wed, 03 Feb 2021 17:58:39 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id x17sm3562973pff.180.2021.02.03.17.58.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:58:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 92/93] tcg/tci: Implement mulu2, muls2
Date: Wed,  3 Feb 2021 15:58:36 -1000
Message-Id: <20210204015836.885930-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
index 35f2c4bfbb..5d83b2d957 100644
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
@@ -680,11 +678,21 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -788,6 +796,18 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
 
@@ -1295,14 +1315,17 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
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


