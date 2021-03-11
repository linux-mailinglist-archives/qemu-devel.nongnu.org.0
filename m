Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9FF33766E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:04:01 +0100 (CET)
Received: from localhost ([::1]:33784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMr2-0003Ic-BU
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:04:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMVR-0004DG-Nj
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:41 -0500
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30]:36452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMVM-0006vH-O0
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:41 -0500
Received: by mail-qv1-xf30.google.com with SMTP id g14so2638745qvn.3
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t8YgkJ1JSVwTBJ9tGciCHNpn3ZeG9bxQ1lhsPKyTifo=;
 b=UP9i+EWnnnjSirktrAe1BH3E3zk/yngpYTwmWAmgU/AjpxbYmUnPUkmA7v7etvKP7X
 jvSBCqDOgET/GUVG7fJ0Adqskwy93a4P5uzB8K88swMueraz7kdG7jozGhdYjdolnxbU
 6gDFXkE5De7jNdUOJkG5ValDU+NixB7wFS2YeYelhfYSph9IWdS9nCMk9tAwo3NSSTHT
 /iK3RjCK5vG2/5wzc0nvClA/2yi6WgAATU4WyKawHM5eEdnZwhlpeM0Uo5KV3ZqcF2yJ
 uhNk8ycNDy8adzcDDzuFrC2z5hBa6cAZx+323zXPp7i8gJj++cz9O7PAIjn6y+pnttlZ
 h4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t8YgkJ1JSVwTBJ9tGciCHNpn3ZeG9bxQ1lhsPKyTifo=;
 b=sJJ+sKOgT+LxrxfQFB08TGPgi/87Kf+YG1EH5JH7YWJa19WHXN+oxwLMw8LInTSRpv
 32w1EgS22b/I+vIW5xIT2WJ7ZKHL/bEAMhrGiiTDX6oMy+pFcnQXOBhGNX2ybcE15lB+
 yfwPfH30RdKs6xeJyWXBMNLtlc8DZMvVhEyvNtAqsh2irPaZC5XMTMHIeczQEznsb4WL
 zbMY4k8lHmyaoTB8ZpeC//RT+e4Nz36uqWAwIVolDl30z8ZlQQehPPKwM02ZbaWJDALP
 7GXSmpd65KsCr/vAKvdykQF4ccBh0Q5YladMeauz/F6CLBfqKoXm6uI6QE7vsH303JDY
 ONGw==
X-Gm-Message-State: AOAM530gExpyA6O26IZmCasRQXUiBq7h9xd45Fb5LGaeD1GE8LQEyVay
 sHhlsjVcAXG9NN0CN32CeAUNx3Njk12J1LhG
X-Google-Smtp-Source: ABdhPJwC8UUeOMvNuZzfxdU52xFzxpwRIz05smi5bgspRtvtx9zsrAnfItvo0sYFUm614n4/YUqAmg==
X-Received: by 2002:a0c:b59f:: with SMTP id g31mr7976619qve.28.1615473694774; 
 Thu, 11 Mar 2021 06:41:34 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id g14sm1962421qkm.98.2021.03.11.06.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:41:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 48/57] tcg/tci: Implement movcond
Date: Thu, 11 Mar 2021 08:39:49 -0600
Message-Id: <20210311143958.562625-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf30.google.com
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

When this opcode is not available in the backend, tcg middle-end
will expand this as a series of 5 opcodes.  So implementing this
saves bytecode space.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.h     |  4 ++--
 tcg/tci.c                | 16 +++++++++++++++-
 tcg/tci/tcg-target.c.inc | 10 +++++++---
 3 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 17911d3297..f53773a555 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -82,7 +82,7 @@
 #define TCG_TARGET_HAS_not_i32          1
 #define TCG_TARGET_HAS_orc_i32          0
 #define TCG_TARGET_HAS_rot_i32          1
-#define TCG_TARGET_HAS_movcond_i32      0
+#define TCG_TARGET_HAS_movcond_i32      1
 #define TCG_TARGET_HAS_muls2_i32        0
 #define TCG_TARGET_HAS_muluh_i32        0
 #define TCG_TARGET_HAS_mulsh_i32        0
@@ -119,7 +119,7 @@
 #define TCG_TARGET_HAS_not_i64          1
 #define TCG_TARGET_HAS_orc_i64          0
 #define TCG_TARGET_HAS_rot_i64          1
-#define TCG_TARGET_HAS_movcond_i64      0
+#define TCG_TARGET_HAS_movcond_i64      1
 #define TCG_TARGET_HAS_muls2_i64        0
 #define TCG_TARGET_HAS_add2_i32         0
 #define TCG_TARGET_HAS_sub2_i32         0
diff --git a/tcg/tci.c b/tcg/tci.c
index c229050c66..2391dd4d3b 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -169,6 +169,7 @@ static void tci_args_rrrr(uint32_t insn,
     *r2 = extract32(insn, 16, 4);
     *r3 = extract32(insn, 20, 4);
 }
+#endif
 
 static void tci_args_rrrrrc(uint32_t insn, TCGReg *r0, TCGReg *r1,
                             TCGReg *r2, TCGReg *r3, TCGReg *r4, TCGCond *c5)
@@ -181,6 +182,7 @@ static void tci_args_rrrrrc(uint32_t insn, TCGReg *r0, TCGReg *r1,
     *c5 = extract32(insn, 28, 4);
 }
 
+#if TCG_TARGET_REG_BITS == 32
 static void tci_args_rrrrrr(uint32_t insn, TCGReg *r0, TCGReg *r1,
                             TCGReg *r2, TCGReg *r3, TCGReg *r4, TCGReg *r5)
 {
@@ -421,6 +423,11 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -433,6 +440,11 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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
@@ -1138,7 +1150,8 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
                            op_name, str_r(r0), str_r(r1), str_r(r2), pos, len);
         break;
 
-#if TCG_TARGET_REG_BITS == 32
+    case INDEX_op_movcond_i32:
+    case INDEX_op_movcond_i64:
     case INDEX_op_setcond2_i32:
         tci_args_rrrrrc(insn, &r0, &r1, &r2, &r3, &r4, &c);
         info->fprintf_func(info->stream, "%-12s  %s,%s,%s,%s,%s,%s",
@@ -1146,6 +1159,7 @@ int print_insn_tci(bfd_vma addr, disassemble_info *info)
                            str_r(r3), str_r(r4), str_c(c));
         break;
 
+#if TCG_TARGET_REG_BITS == 32
     case INDEX_op_mulu2_i32:
         tci_args_rrrr(insn, &r0, &r1, &r2, &r3);
         info->fprintf_func(info->stream, "%-12s  %s,%s,%s,%s",
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index db29bc6e54..a0c458a60a 100644
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
@@ -591,12 +596,11 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
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


