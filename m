Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E903ADB5B
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 20:33:17 +0200 (CEST)
Received: from localhost ([::1]:56526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lufmO-0004TA-A9
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 14:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUq-0000qf-BC
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:08 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:53948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUm-0002KB-LW
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:07 -0400
Received: by mail-pj1-x1034.google.com with SMTP id bb20so3364181pjb.3
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 11:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ht6qU91HuyjlBdxrNhfQi8RcRcfq+IY9qFgBD2RpEI8=;
 b=Fszl9Q/7OEFJTom15myNbgDZ6az6DocTqkbmANeW1mnRGnRFpEeHaNzAK5SVx2tAVD
 FwLqrszRPfBDUIg3vuE0yGFCeRu+IkF59A95stjybgm97yUzSfOG7atvjhZKHg1lECS9
 kdT2NO0+hzEmbl5FS8PPZdHE1lKcDWvmphCJUKa4k9ixZFowuegHo6asBRFIWDF9E6P0
 JTW63IbyQEswfuPPfF/3vdBtxzXRErKmupahgiw/1dRfqiKhUZ4HEJdhCNEpM3IYTqt4
 +upxNmpUjFVOSP0NAA2w9S0q54YXDUDO4/nV9PXsKt0f1DEve9GMSAC+V1ubYIr4uXGu
 Nq3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ht6qU91HuyjlBdxrNhfQi8RcRcfq+IY9qFgBD2RpEI8=;
 b=oPoTqfU8SLoUB54DYxk6R8aGdrTaWEOf6qzE0vX/dr0wR2/kMisVgCg73F/v+/LZqf
 Uou/95KeJeadi1DmiVVrguboyG2AwTJQ1U3xLCvf/TJXCsAv1y9b2JnkSDKtzJEFglco
 mWUlMAK3y2UOJ9Ef+ExRHpULWC+lhMfTm1zkDFk+G8aEKHGXWYRm+L+R8ddKaOMTq8qB
 gO8Y9UDZzsXw66C6nnT8z1mNWUe/HwJ8La7S83gWrml3Qi0kHX46P+oe1xJMBcv6wvr1
 hq4GDBhWCSx2v1T9ZjdGOucZofRknXf4BjZzjHWkzXVqHxO5/jt07VVYnrn+dErpsBiR
 PAug==
X-Gm-Message-State: AOAM532rW8CDKgooeIzqD8jchxSqMkIDaWCljofmS4TfF9bFcEOgsIt/
 iAZ+IrHZVsjLjCRJ8i1BXWAqlryhZAJZig==
X-Google-Smtp-Source: ABdhPJxlpSyi9jq/1iRlPXteqYWwCWenyGn5Y1epWuWlbjeA1GiRLn9BW9Fy/nMZOHzomN5vLNpzww==
X-Received: by 2002:a17:90a:7d06:: with SMTP id
 g6mr17673155pjl.91.1624126503269; 
 Sat, 19 Jun 2021 11:15:03 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k35sm12059113pgi.21.2021.06.19.11.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 11:15:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/33] tcg/tci: Implement movcond
Date: Sat, 19 Jun 2021 11:14:36 -0700
Message-Id: <20210619181452.877683-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619181452.877683-1-richard.henderson@linaro.org>
References: <20210619181452.877683-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

When this opcode is not available in the backend, tcg middle-end
will expand this as a series of 5 opcodes.  So implementing this
saves bytecode space.

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.h     |  4 ++--
 tcg/tci.c                | 16 +++++++++++++++-
 tcg/tci/tcg-target.c.inc | 10 +++++++---
 3 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 6ced9282c1..5c79bfcf49 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -83,7 +83,7 @@
 #define TCG_TARGET_HAS_not_i32          1
 #define TCG_TARGET_HAS_orc_i32          0
 #define TCG_TARGET_HAS_rot_i32          1
-#define TCG_TARGET_HAS_movcond_i32      0
+#define TCG_TARGET_HAS_movcond_i32      1
 #define TCG_TARGET_HAS_muls2_i32        0
 #define TCG_TARGET_HAS_muluh_i32        0
 #define TCG_TARGET_HAS_mulsh_i32        0
@@ -120,7 +120,7 @@
 #define TCG_TARGET_HAS_not_i64          1
 #define TCG_TARGET_HAS_orc_i64          0
 #define TCG_TARGET_HAS_rot_i64          1
-#define TCG_TARGET_HAS_movcond_i64      0
+#define TCG_TARGET_HAS_movcond_i64      1
 #define TCG_TARGET_HAS_muls2_i64        0
 #define TCG_TARGET_HAS_add2_i32         0
 #define TCG_TARGET_HAS_sub2_i32         0
diff --git a/tcg/tci.c b/tcg/tci.c
index 4696ca161c..2374c04d6b 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -173,6 +173,7 @@ static void tci_args_rrrr(uint32_t insn,
     *r2 = extract32(insn, 16, 4);
     *r3 = extract32(insn, 20, 4);
 }
+#endif
 
 static void tci_args_rrrrrc(uint32_t insn, TCGReg *r0, TCGReg *r1,
                             TCGReg *r2, TCGReg *r3, TCGReg *r4, TCGCond *c5)
@@ -185,6 +186,7 @@ static void tci_args_rrrrrc(uint32_t insn, TCGReg *r0, TCGReg *r1,
     *c5 = extract32(insn, 28, 4);
 }
 
+#if TCG_TARGET_REG_BITS == 32
 static void tci_args_rrrrrr(uint32_t insn, TCGReg *r0, TCGReg *r1,
                             TCGReg *r2, TCGReg *r3, TCGReg *r4, TCGReg *r5)
 {
@@ -422,6 +424,11 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_args_rrrc(insn, &r0, &r1, &r2, &condition);
             regs[r0] = tci_compare32(regs[r1], regs[r2], condition);
             break;
+        case INDEX_op_movcond_i32:
+            tci_args_rrrrrc(insn, &r0, &r1, &r2, &r3, &r4, &condition);
+            tmp32 = tci_compare32(regs[r1], regs[r2], condition);
+            regs[r0] = regs[tmp32 ? r3 : r4];
+            break;
 #if TCG_TARGET_REG_BITS == 32
         case INDEX_op_setcond2_i32:
             tci_args_rrrrrc(insn, &r0, &r1, &r2, &r3, &r4, &condition);
@@ -434,6 +441,11 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_args_rrrc(insn, &r0, &r1, &r2, &condition);
             regs[r0] = tci_compare64(regs[r1], regs[r2], condition);
             break;
+        case INDEX_op_movcond_i64:
+            tci_args_rrrrrc(insn, &r0, &r1, &r2, &r3, &r4, &condition);
+            tmp32 = tci_compare64(regs[r1], regs[r2], condition);
+            regs[r0] = regs[tmp32 ? r3 : r4];
+            break;
 #endif
         CASE_32_64(mov)
             tci_args_rr(insn, &r0, &r1);
@@ -1139,7 +1151,8 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
                            op_name, str_r(r0), str_r(r1), str_r(r2), pos, len);
         break;
 
-#if TCG_TARGET_REG_BITS == 32
+    case INDEX_op_movcond_i32:
+    case INDEX_op_movcond_i64:
     case INDEX_op_setcond2_i32:
         tci_args_rrrrrc(insn, &r0, &r1, &r2, &r3, &r4, &c);
         info->fprintf_func(info->stream, "%-12s  %s, %s, %s, %s, %s, %s",
@@ -1147,6 +1160,7 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
                            str_r(r3), str_r(r4), str_c(c));
         break;
 
+#if TCG_TARGET_REG_BITS == 32
     case INDEX_op_mulu2_i32:
         tci_args_rrrr(insn, &r0, &r1, &r2, &r3);
         info->fprintf_func(info->stream, "%-12s  %s, %s, %s, %s",
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index fc73c199a0..2db189673c 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -133,9 +133,12 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
         return C_O0_I4(r, r, r, r);
     case INDEX_op_mulu2_i32:
         return C_O2_I2(r, r, r, r);
+#endif
+
+    case INDEX_op_movcond_i32:
+    case INDEX_op_movcond_i64:
     case INDEX_op_setcond2_i32:
         return C_O1_I4(r, r, r, r, r);
-#endif
 
     case INDEX_op_qemu_ld_i32:
         return (TARGET_LONG_BITS <= TCG_TARGET_REG_BITS
@@ -419,6 +422,7 @@ static void tcg_out_op_rrrr(TCGContext *s, TCGOpcode op,
     insn = deposit32(insn, 20, 4, r3);
     tcg_out32(s, insn);
 }
+#endif
 
 static void tcg_out_op_rrrrrc(TCGContext *s, TCGOpcode op,
                               TCGReg r0, TCGReg r1, TCGReg r2,
@@ -436,6 +440,7 @@ static void tcg_out_op_rrrrrc(TCGContext *s, TCGOpcode op,
     tcg_out32(s, insn);
 }
 
+#if TCG_TARGET_REG_BITS == 32
 static void tcg_out_op_rrrrrr(TCGContext *s, TCGOpcode op,
                               TCGReg r0, TCGReg r1, TCGReg r2,
                               TCGReg r3, TCGReg r4, TCGReg r5)
@@ -589,12 +594,11 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out_op_rrrc(s, opc, args[0], args[1], args[2], args[3]);
         break;
 
-#if TCG_TARGET_REG_BITS == 32
+    CASE_32_64(movcond)
     case INDEX_op_setcond2_i32:
         tcg_out_op_rrrrrc(s, opc, args[0], args[1], args[2],
                           args[3], args[4], args[5]);
         break;
-#endif
 
     CASE_32_64(ld8u)
     CASE_32_64(ld8s)
-- 
2.25.1


