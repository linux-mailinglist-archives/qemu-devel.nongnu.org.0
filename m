Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E38698ADB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 04:02:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUTO-0003XZ-MG; Wed, 15 Feb 2023 21:58:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUTL-0003Wu-NL
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:58:11 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUTJ-0005QM-SZ
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:58:11 -0500
Received: by mail-pg1-x531.google.com with SMTP id b22so422924pgw.3
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 18:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ibiy84w6Pigy9L51coynCz3t4pOnDEuUKJQbh8tK+24=;
 b=VJ3OiBVj5YEfsbwBtdC5n2tW53DXFneO/Te+sn7WuaFT159Q8t34ORSvxnnoCUh367
 8OZHi6UjNSIoGMDtDAythCgiM9tjPQzBCboXI0FtK7SZ5yKI1MfqjEKuvZ/PUS9iyIdw
 CEKwihuWscjSz1c167k+44bzUq37w1HT6HPYHYTr8nuS5Y5I0ocdCVowHL/q3gSSmMkf
 duzEMk+q4FLgd1FxC6Ya4ocueG4IjJ85a4G6kpLf9PCIgUC3UFuuK/tZAbIVwab5cmlQ
 J5hSy3R+ek2YI0Pot8rTTv/2zhDoBdNr3WkVl01D6JDobWMw9lkECz/823jCUeQczILO
 1bpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ibiy84w6Pigy9L51coynCz3t4pOnDEuUKJQbh8tK+24=;
 b=N+lqwPTYWAANcx5eskN4OLrxU2OwtGRVmm6ro11BU7FwH02DwCVC4RoXlzKab3o1s5
 nIfOBACKnsQODAT5FnMsEnqEN9pKCEs4SdFS988HdlGmWNRj7+q3raLDQte3aYeIR7mO
 Ih/MFxHnBJ+JgdV30kbp2D9X8JBiaUdtsLNMKlW/zv/qGLGfEH0T6YoDfqGTa5hWV9Xl
 Oa9lFp5PYq+zcFcMwV3bQN9937rchjPQBIEaGFNcLzDBHMFKdfrVubQ/2JwODm8+qjzW
 NNpYg4BTZI4FVYCBzOJ7G/CE7ZQjCGBZCkbubw9L7hEAauSgGOBI45H7iS1QUJ/+E0Ip
 iphQ==
X-Gm-Message-State: AO0yUKX0dzo00UAy5qA97Azj71oD9yL3L2JpzOeKzAOYrsEYsCIRCLIV
 elhBxT6KeeQywGIuP6O+SbxxaKnbkjtOLRAy5rI=
X-Google-Smtp-Source: AK7set/phguXxLfyqIIG5Waaugl2oYFeIFvmsq1cGs8O3imRE1oYuMii9JDy8MOrPFYToyxKN14MlQ==
X-Received: by 2002:aa7:97a5:0:b0:5a8:eb62:293e with SMTP id
 d5-20020aa797a5000000b005a8eb62293emr3297532pfq.7.1676516289034; 
 Wed, 15 Feb 2023 18:58:09 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a62aa0e000000b005a816b7c3e8sm89655pff.24.2023.02.15.18.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 18:58:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 20/30] tcg: Introduce TCG_OPF_TYPE_MASK
Date: Wed, 15 Feb 2023 16:57:29 -1000
Message-Id: <20230216025739.1211680-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216025739.1211680-1-richard.henderson@linaro.org>
References: <20230216025739.1211680-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
index 59854f95b1..23369541fe 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -987,24 +987,26 @@ typedef struct TCGArgConstraint {
 
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
index 763bca9ea6..5c0bd6b6e6 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -2053,12 +2053,21 @@ void tcg_optimize(TCGContext *s)
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
index a4a3da6804..07522d50ee 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2118,7 +2118,7 @@ static void tcg_dump_ops(TCGContext *s, FILE *f, bool have_prefs)
             nb_iargs = def->nb_iargs;
             nb_cargs = def->nb_cargs;
 
-            if (def->flags & TCG_OPF_VECTOR) {
+            if ((def->flags & TCG_OPF_TYPE_MASK) == TCG_OPF_VECTOR) {
                 col += ne_fprintf(f, "v%d,e%d,", 64 << TCGOP_VECL(op),
                                   8 << TCGOP_VECE(op));
             }
@@ -4375,7 +4375,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
     }
 
     /* emit instruction */
-    if (def->flags & TCG_OPF_VECTOR) {
+    if ((def->flags & TCG_OPF_TYPE_MASK) == TCG_OPF_VECTOR) {
         tcg_out_vec_op(s, op->opc, TCGOP_VECL(op), TCGOP_VECE(op),
                        new_args, const_args);
     } else {
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 1a295791b4..6e40a453e6 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1922,9 +1922,11 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
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
index c1d34d7bd1..570b8c160e 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -697,7 +697,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
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


