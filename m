Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 500806DB87B
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 05:06:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkysO-0004Bu-DF; Fri, 07 Apr 2023 23:04:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkys3-00045j-Kw
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 23:04:07 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkys1-0004Vv-R2
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 23:04:07 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-62ddb232ddaso1414033b3a.1
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 20:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680923044;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c5z2pzBP4n2HbltkzexFBId6I7UVABJ9+twoIc3kNok=;
 b=gl7qkuCNaaivOCQJm03bqTtlswOamaHuBdFG2RitJZZ0C+vQ8aJnezAJrFrwdSG6xm
 4ZDFEl0av25cPV4dfSHE0obrV9RVuM4S2iUtCJDCwnRAORbK5znrOs1B6nrGdwP8V6pf
 uoawKzUZvOG1L0vNRXNTII5E9oSG53eUaZu7ah6igVtSkJwTG1w7sC486MW+mkeh/jpj
 e6rEmK52+TD2/z/bhD2uR49ytFd+RtKYPWGkE+lW4khdG7LLJK+1mj14MbWWvgeeWbkm
 QP4Yu5QiiGc0SiNBPYFXdWQNSP1WnFh5taEWawa2jPuTHVoXn9BTl5hR5TPRJvGLt0k7
 Rr3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680923044;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c5z2pzBP4n2HbltkzexFBId6I7UVABJ9+twoIc3kNok=;
 b=mHqu+moUmNSvEVUXcomuBSaz4KA7KH4n87sYGOBH7pGcI6uovU0gX89fgs4svRoMN7
 4hAq9LP8Vqi8f/iVBJ+rkzaifZjW+xU/i0xE424kFxWSUBwqfCsee6prlWX9JpfAXk03
 d/dgC7IN7jOMwszHONrleF8BNnqidOjmIrtn4h09a+wWRTJkhj3/JTv+zgwQxtdURX/8
 nBCXpUOKa7HJ3NwaNKM/ZO8dQV6fMfO5Q83fZe0iZ8qWaxBda6SgoxXJYQP9rs0kgMoV
 0/geT+cSm9AJ2buLTgm7fD4FmAgDE7hsVgW7BIBsR5h4ZCD4ICHMcN50GUxqBC9glWap
 GTCA==
X-Gm-Message-State: AAQBX9f1TyvOq93QuBHToXKNZaFH/PAegB1jueUhyNSLe77YgW7WG9pW
 pstcIHY8/MVYhSCgWmlEW9U4YukYJjf2QOjvVHA=
X-Google-Smtp-Source: AKy350YRuD4LioOy5Kz1YlSxulbMPBO+xJuMQWLqb4zwt4UBSQ7wIn+7FtbCWlsGYgJZgFxdIpccJg==
X-Received: by 2002:a62:5204:0:b0:629:fae0:d96a with SMTP id
 g4-20020a625204000000b00629fae0d96amr3950131pfb.16.1680923044157; 
 Fri, 07 Apr 2023 20:04:04 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 c12-20020aa78e0c000000b0062b5a55835dsm3687025pfr.213.2023.04.07.20.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 20:04:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org
Subject: [PATCH 04/12] tcg/mips: Create and use TCG_REG_TB
Date: Fri,  7 Apr 2023 20:03:51 -0700
Message-Id: <20230408030359.3368868-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408030359.3368868-1-richard.henderson@linaro.org>
References: <20230408030359.3368868-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This vastly reduces the size of code generated for 64-bit addresses.
The code for exit_tb, for instance, where we load a (tagged) pointer
to the current TB, goes from

0x400aa9725c:  li       v0,64
0x400aa97260:  dsll     v0,v0,0x10
0x400aa97264:  ori      v0,v0,0xaa9
0x400aa97268:  dsll     v0,v0,0x10
0x400aa9726c:  j        0x400aa9703c
0x400aa97270:  ori      v0,v0,0x7083

to

0x400aa97240:  j        0x400aa97040
0x400aa97244:  daddiu   v0,s6,-189

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 69 +++++++++++++++++++++++++++++++++------
 1 file changed, 59 insertions(+), 10 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 0ade890ade..c2f8d6550b 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -88,6 +88,11 @@ static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
 #ifndef CONFIG_SOFTMMU
 #define TCG_GUEST_BASE_REG TCG_REG_S7
 #endif
+#if TCG_TARGET_REG_BITS == 64
+#define TCG_REG_TB         TCG_REG_S6
+#else
+#define TCG_REG_TB         (qemu_build_not_reached(), TCG_REG_ZERO)
+#endif
 
 /* check if we really need so many registers :P */
 static const int tcg_target_reg_alloc_order[] = {
@@ -1895,27 +1900,61 @@ static void tcg_out_clz(TCGContext *s, MIPSInsn opcv2, MIPSInsn opcv6,
 
 static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
 {
-    TCGReg b0 = TCG_REG_ZERO;
+    TCGReg base = TCG_REG_ZERO;
+    int16_t lo = 0;
 
-    if (a0 & ~0xffff) {
-        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_V0, a0 & ~0xffff);
-        b0 = TCG_REG_V0;
+    if (a0) {
+        intptr_t ofs;
+        if (TCG_TARGET_REG_BITS == 64) {
+            ofs = tcg_tbrel_diff(s, (void *)a0);
+            lo = ofs;
+            if (ofs == lo) {
+                base = TCG_REG_TB;
+            } else {
+                base = TCG_REG_V0;
+                tcg_out_movi(s, TCG_TYPE_PTR, base, ofs - lo);
+                tcg_out_opc_reg(s, ALIAS_PADD, base, base, TCG_REG_TB);
+            }
+        } else {
+            ofs = a0;
+            lo = ofs;
+            base = TCG_REG_V0;
+            tcg_out_movi(s, TCG_TYPE_PTR, base, ofs - lo);
+        }
     }
     if (!tcg_out_opc_jmp(s, OPC_J, tb_ret_addr)) {
         tcg_out_movi(s, TCG_TYPE_PTR, TCG_TMP0, (uintptr_t)tb_ret_addr);
         tcg_out_opc_reg(s, OPC_JR, 0, TCG_TMP0, 0);
     }
-    tcg_out_opc_imm(s, OPC_ORI, TCG_REG_V0, b0, a0 & 0xffff);
+    /* delay slot */
+    tcg_out_opc_imm(s, ALIAS_PADDI, TCG_REG_V0, base, lo);
 }
 
 static void tcg_out_goto_tb(TCGContext *s, int which)
 {
+    intptr_t ofs = get_jmp_target_addr(s, which);
+    TCGReg base, dest;
+
     /* indirect jump method */
-    tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP0, TCG_REG_ZERO,
-               get_jmp_target_addr(s, which));
-    tcg_out_opc_reg(s, OPC_JR, 0, TCG_TMP0, 0);
+    if (TCG_TARGET_REG_BITS == 64) {
+        dest = TCG_REG_TB;
+        base = TCG_REG_TB;
+        ofs = tcg_tbrel_diff(s, (void *)ofs);
+    } else {
+        dest = TCG_TMP0;
+        base = TCG_REG_ZERO;
+    }
+    tcg_out_ld(s, TCG_TYPE_PTR, dest, base, ofs);
+    tcg_out_opc_reg(s, OPC_JR, 0, dest, 0);
+    /* delay slot */
     tcg_out_nop(s);
+
     set_jmp_reset_offset(s, which);
+    if (TCG_TARGET_REG_BITS == 64) {
+        /* For the unlinked case, need to reset TCG_REG_TB. */
+        tcg_out_ldst(s, ALIAS_PADDI, TCG_REG_TB, TCG_REG_TB,
+                     -tcg_current_code_size(s));
+    }
 }
 
 void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
@@ -1946,7 +1985,11 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_goto_ptr:
         /* jmp to the given host address (could be epilogue) */
         tcg_out_opc_reg(s, OPC_JR, 0, a0, 0);
-        tcg_out_nop(s);
+        if (TCG_TARGET_REG_BITS == 64) {
+            tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_TB, a0);
+        } else {
+            tcg_out_nop(s);
+        }
         break;
     case INDEX_op_br:
         tcg_out_brcond(s, TCG_COND_EQ, TCG_REG_ZERO, TCG_REG_ZERO,
@@ -2499,7 +2542,7 @@ static const int tcg_target_callee_save_regs[] = {
     TCG_REG_S3,
     TCG_REG_S4,
     TCG_REG_S5,
-    TCG_REG_S6,
+    TCG_REG_S6,       /* used for the tb base (TCG_REG_TB) */
     TCG_REG_S7,       /* used for guest_base */
     TCG_REG_S8,       /* used for the global env (TCG_AREG0) */
     TCG_REG_RA,       /* should be last for ABI compliance */
@@ -2627,6 +2670,9 @@ static void tcg_target_qemu_prologue(TCGContext *s)
         tcg_regset_set_reg(s->reserved_regs, TCG_GUEST_BASE_REG);
     }
 #endif
+    if (TCG_TARGET_REG_BITS == 64) {
+        tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_TB, tcg_target_call_iarg_regs[1]);
+    }
 
     /* Call generated code */
     tcg_out_opc_reg(s, OPC_JR, 0, tcg_target_call_iarg_regs[1], 0);
@@ -2808,6 +2854,9 @@ static void tcg_target_init(TCGContext *s)
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_RA);   /* return address */
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_SP);   /* stack pointer */
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_GP);   /* global pointer */
+    if (TCG_TARGET_REG_BITS == 64) {
+        tcg_regset_set_reg(s->reserved_regs, TCG_REG_TB); /* tc->tc_ptr */
+    }
 }
 
 typedef struct {
-- 
2.34.1


