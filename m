Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BE16F50B8
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:09:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6bE-0001Mp-0h; Wed, 03 May 2023 03:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6aS-0006ky-V0
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:07:41 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6a2-0005jA-NU
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:07:40 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f19a80a330so29503005e9.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097632; x=1685689632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+GIQLXvELUmUJjDCvdIMzpNNEl1FqkUOfANtu8VRqCQ=;
 b=x4D7Vz1I6JUArvbbar9XVMyUKopfupZ9FilT2AW+bZWjyLRN87nV+k3LSABAwCovib
 WpE18wNRTWTldXHPZST3Mga2MEkkMrnVOFmvf6FRPCoTcmDOpFqFVEwJqIOBk4nlDHVB
 kBFmtZJf56U8xKy75kMCW2NTY56e7tQeulBcZixUGSQOqxh9mLvxsGJ+t1+QFAz3DWrL
 wQUF7EjlP1IAQ9Rs3pKUNn3riMKY+Jjzs22dcbr9K60nvDKkMdnBHkbz7uJCSKIi6O7x
 eO3G9GflU2cOoHq0S1jpUgXdcA2kZs2PLBKc78j8APHrMn4JDzdjxfOWJleC9pphon2t
 d1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097632; x=1685689632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+GIQLXvELUmUJjDCvdIMzpNNEl1FqkUOfANtu8VRqCQ=;
 b=B/U4HeTXtlCXVafB90e3mUkKUrYseVMZPq2Ouqf660/Mar2OX1HXERdAc/x971SYVs
 Xbu8qlCWfohA3kG107sd3G2INp2cZREgNWChHzIfJuyz/I49CT175r/RbJRsN3ej1q3r
 ydKr8Mmr1sicD+EMtZkz/MxIhsWfs0lXfvGs9SwQxV6sIC/YVIK81mK8CRkA68iGRKq+
 vfYb3E2W+uxYBXHI62+m60a6EfDW9s98DZ9eHrzBkRDpf/p6eN5uc8PJYEVoLfSoTh0i
 r/luE3jASpP6yqw3ZPkn1dbL7pQz3RDPnXeAldsuyTuogD2FCv8a9fQ5rmCc+JIF6RW6
 AiKA==
X-Gm-Message-State: AC+VfDzUSuaSNc3PSVM0PeSoIbvy5UYyR4iEW2mO9S3YG0ph4TdW+RzC
 TcxYhqXoJvMdJsqaxypKOe6OCU4Le7NWDe3t2YvBMw==
X-Google-Smtp-Source: ACHHUZ5XlO9o3LDOKy8pVpT7yY0z9QlJSoxW4xmWI555a63u7/keuY5VssCvDAoVcISfNnu/q5BFOg==
X-Received: by 2002:a5d:544c:0:b0:306:264d:5667 with SMTP id
 w12-20020a5d544c000000b00306264d5667mr8210349wrv.41.1683097632722; 
 Wed, 03 May 2023 00:07:12 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1cf303000000b003f3157988f8sm921184wmq.26.2023.05.03.00.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:07:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 20/57] tcg: Introduce TCG_OPF_TYPE_MASK
Date: Wed,  3 May 2023 08:06:19 +0100
Message-Id: <20230503070656.1746170-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Reorg TCG_OPF_64BIT and TCG_OPF_VECTOR into a two-bit field so
that we can add TCG_OPF_128BIT without requiring another bit.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h            | 22 ++++++++++++----------
 tcg/optimize.c               | 15 ++++++++++++---
 tcg/tcg.c                    |  4 ++--
 tcg/aarch64/tcg-target.c.inc |  8 +++++---
 tcg/tci/tcg-target.c.inc     |  3 ++-
 5 files changed, 33 insertions(+), 19 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index b19e167e1d..efbd891f87 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -932,24 +932,26 @@ typedef struct TCGArgConstraint {
 
 /* Bits for TCGOpDef->flags, 8 bits available, all used.  */
 enum {
+    /* Two bits describing the output type. */
+    TCG_OPF_TYPE_MASK    = 0x03,
+    TCG_OPF_32BIT        = 0x00,
+    TCG_OPF_64BIT        = 0x01,
+    TCG_OPF_VECTOR       = 0x02,
+    TCG_OPF_128BIT       = 0x03,
     /* Instruction exits the translation block.  */
-    TCG_OPF_BB_EXIT      = 0x01,
+    TCG_OPF_BB_EXIT      = 0x04,
     /* Instruction defines the end of a basic block.  */
-    TCG_OPF_BB_END       = 0x02,
+    TCG_OPF_BB_END       = 0x08,
     /* Instruction clobbers call registers and potentially update globals.  */
-    TCG_OPF_CALL_CLOBBER = 0x04,
+    TCG_OPF_CALL_CLOBBER = 0x10,
     /* Instruction has side effects: it cannot be removed if its outputs
        are not used, and might trigger exceptions.  */
-    TCG_OPF_SIDE_EFFECTS = 0x08,
-    /* Instruction operands are 64-bits (otherwise 32-bits).  */
-    TCG_OPF_64BIT        = 0x10,
+    TCG_OPF_SIDE_EFFECTS = 0x20,
     /* Instruction is optional and not implemented by the host, or insn
        is generic and should not be implemened by the host.  */
-    TCG_OPF_NOT_PRESENT  = 0x20,
-    /* Instruction operands are vectors.  */
-    TCG_OPF_VECTOR       = 0x40,
+    TCG_OPF_NOT_PRESENT  = 0x40,
     /* Instruction is a conditional branch. */
-    TCG_OPF_COND_BRANCH  = 0x80
+    TCG_OPF_COND_BRANCH  = 0x80,
 };
 
 typedef struct TCGOpDef {
diff --git a/tcg/optimize.c b/tcg/optimize.c
index 9614fa3638..37d46f2a1f 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -2051,12 +2051,21 @@ void tcg_optimize(TCGContext *s)
         copy_propagate(&ctx, op, def->nb_oargs, def->nb_iargs);
 
         /* Pre-compute the type of the operation. */
-        if (def->flags & TCG_OPF_VECTOR) {
+        switch (def->flags & TCG_OPF_TYPE_MASK) {
+        case TCG_OPF_VECTOR:
             ctx.type = TCG_TYPE_V64 + TCGOP_VECL(op);
-        } else if (def->flags & TCG_OPF_64BIT) {
+            break;
+        case TCG_OPF_128BIT:
+            ctx.type = TCG_TYPE_I128;
+            break;
+        case TCG_OPF_64BIT:
             ctx.type = TCG_TYPE_I64;
-        } else {
+            break;
+        case TCG_OPF_32BIT:
             ctx.type = TCG_TYPE_I32;
+            break;
+        default:
+            qemu_build_not_reached();
         }
 
         /* Assume all bits affected, no bits known zero, no sign reps. */
diff --git a/tcg/tcg.c b/tcg/tcg.c
index d0afabf194..cb5ca9b612 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2294,7 +2294,7 @@ static void tcg_dump_ops(TCGContext *s, FILE *f, bool have_prefs)
             nb_iargs = def->nb_iargs;
             nb_cargs = def->nb_cargs;
 
-            if (def->flags & TCG_OPF_VECTOR) {
+            if ((def->flags & TCG_OPF_TYPE_MASK) == TCG_OPF_VECTOR) {
                 col += ne_fprintf(f, "v%d,e%d,", 64 << TCGOP_VECL(op),
                                   8 << TCGOP_VECE(op));
             }
@@ -4782,7 +4782,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
         tcg_out_extrl_i64_i32(s, new_args[0], new_args[1]);
         break;
     default:
-        if (def->flags & TCG_OPF_VECTOR) {
+        if ((def->flags & TCG_OPF_TYPE_MASK) == TCG_OPF_VECTOR) {
             tcg_out_vec_op(s, op->opc, TCGOP_VECL(op), TCGOP_VECE(op),
                            new_args, const_args);
         } else {
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 3adc5fd3a3..43acb4fbcb 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1921,9 +1921,11 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
 {
-    /* 99% of the time, we can signal the use of extension registers
-       by looking to see if the opcode handles 64-bit data.  */
-    TCGType ext = (tcg_op_defs[opc].flags & TCG_OPF_64BIT) != 0;
+    /*
+     * 99% of the time, we can signal the use of extension registers
+     * by looking to see if the opcode handles 32-bit data or not.
+     */
+    TCGType ext = (tcg_op_defs[opc].flags & TCG_OPF_TYPE_MASK) != TCG_OPF_32BIT;
 
     /* Hoist the loads of the most common arguments.  */
     TCGArg a0 = args[0];
diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 4cf03a579c..e31640d109 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -790,7 +790,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     CASE_32_64(sextract) /* Optional (TCG_TARGET_HAS_sextract_*). */
         {
             TCGArg pos = args[2], len = args[3];
-            TCGArg max = tcg_op_defs[opc].flags & TCG_OPF_64BIT ? 64 : 32;
+            TCGArg max = ((tcg_op_defs[opc].flags & TCG_OPF_TYPE_MASK)
+                          == TCG_OPF_32BIT ? 32 : 64);
 
             tcg_debug_assert(pos < max);
             tcg_debug_assert(pos + len <= max);
-- 
2.34.1


