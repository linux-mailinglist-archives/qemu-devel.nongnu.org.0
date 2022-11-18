Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD6562F1E7
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 10:53:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovxze-0007mw-2d; Fri, 18 Nov 2022 04:49:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxzA-0007T1-15
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:38 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxz8-0001zy-0r
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:48:35 -0500
Received: by mail-pl1-x62f.google.com with SMTP id jn7so2247865plb.13
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 01:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AO0bhvrt10zQjDcLABfPHAOU5PsCFxaMEM5XjDlC5Lc=;
 b=TFbIMMHf4lQQxq99mR93yfPPjPcwzilPlRpNOKx0RNuY/fun4nrkyIK+yt9an3Achm
 v33URkqxESmVR7vBSbCVYfZuBfdfV1dNiA2mENQTwXrL28HeZBvNMmjtq+v2vdcBLr6H
 YSAwzxWdgHQuNZIcuA3ZAlHbGNbFKZ2WmJdA5zjHPw8qZz6BsxT75fEQhCd2H/IbqzWV
 3LIzbvr6YSlOniuajEn+NhZP41DiClMvmy4HeMeUItlCNakeUGRAjAdjXVqg5O13324X
 UX5I3ODCTiKoK+4NdWC8lsHwLYDPQZb3l6uzhV4M1EHeD45xNOCgljfSt40XEzoci43q
 EMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AO0bhvrt10zQjDcLABfPHAOU5PsCFxaMEM5XjDlC5Lc=;
 b=nwn2s5PLHfMQ8zILpalmWf+czPd+86ZvAHZVTMQSQAu7cxZZEA9R4WWJwbOkWCaG/r
 FrtYRVXntsls3/NvyJI9mbDzWn9S34JodahXnS3o9WFXLEeqo70pxDc2KQyBrxgpz7Lm
 7klRHdgrb3zS6Q3fc7Y081z8nevOd0i/q0mdSg3elPkf8waRL0oN9gd1yFrOOB1oGLbF
 KaDC6pFYxTrw2KJgPWLMj04LRmxX2MzoSfncNBaEK8K69IvCH4fSHuVAOxagLM+OfY/w
 CGXCDw5g12wsgCwtyeT3SQEFX1ATle2htNKYOsk2foNhjF1+R7/tOlR+tBwkymNGaYda
 U9rA==
X-Gm-Message-State: ANoB5plNdtKU+zcMB/hqlciwfhOUkRw8nJeTLCQNb7jYd5UdZN4PWh8G
 E3imno9mhKER9Fy++uKDHELXt++ITye4QA==
X-Google-Smtp-Source: AA0mqf7CRz/hbyzH1IBBUE9yQNvTD8aK19mwzBwNBxCZCSy1PnlF0YB3Do/IwOW/8ljlSzIfUfqiQg==
X-Received: by 2002:a17:90b:4fcc:b0:212:e08f:2b07 with SMTP id
 qa12-20020a17090b4fcc00b00212e08f2b07mr12609254pjb.173.1668764913064; 
 Fri, 18 Nov 2022 01:48:33 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:90b2:345f:bf0a:c412])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902e54c00b0018862bb3976sm3115421plf.308.2022.11.18.01.48.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 01:48:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 19/29] tcg: Introduce TCG_OPF_TYPE_MASK
Date: Fri, 18 Nov 2022 01:47:44 -0800
Message-Id: <20221118094754.242910-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221118094754.242910-1-richard.henderson@linaro.org>
References: <20221118094754.242910-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h            | 22 ++++++++++++----------
 tcg/optimize.c               | 15 ++++++++++++---
 tcg/tcg.c                    |  4 ++--
 tcg/aarch64/tcg-target.c.inc |  8 +++++---
 tcg/tci/tcg-target.c.inc     |  3 ++-
 5 files changed, 33 insertions(+), 19 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index a996da60b5..5874f1e30b 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -994,24 +994,26 @@ typedef struct TCGArgConstraint {
 
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
index 50db393594..d221f76366 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2075,7 +2075,7 @@ static void tcg_dump_ops(TCGContext *s, FILE *f, bool have_prefs)
             nb_iargs = def->nb_iargs;
             nb_cargs = def->nb_cargs;
 
-            if (def->flags & TCG_OPF_VECTOR) {
+            if ((def->flags & TCG_OPF_TYPE_MASK) == TCG_OPF_VECTOR) {
                 col += ne_fprintf(f, "v%d,e%d,", 64 << TCGOP_VECL(op),
                                   8 << TCGOP_VECE(op));
             }
@@ -4362,7 +4362,7 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
     }
 
     /* emit instruction */
-    if (def->flags & TCG_OPF_VECTOR) {
+    if ((def->flags & TCG_OPF_TYPE_MASK) == TCG_OPF_VECTOR) {
         tcg_out_vec_op(s, op->opc, TCGOP_VECL(op), TCGOP_VECE(op),
                        new_args, const_args);
     } else {
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index cf5ee6f742..9ea1608015 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1896,9 +1896,11 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
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
index 357888a532..f8ec07839c 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -690,7 +690,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
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


