Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB91640007
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 06:53:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0ymR-0002Xh-9I; Fri, 02 Dec 2022 00:40:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymP-0002X6-Kq
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:09 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymN-0003K8-D4
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:09 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 k2-20020a17090a4c8200b002187cce2f92so7327731pjh.2
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 21:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9DBasqbLZ8AmB9A2BlsiwxW4Zljs4akh8lbXXV2kcIM=;
 b=Ny5A036UiMcWlwE2+QXiLHXyXwM1eMYMDIgVXs/g1G3hcFzSJCKZxOAqeXg65YCbmU
 4xnNeuSzkg2IsaTJo0kb5SLsZnlnnrGjnMVj5uEGjo0kdMdokFuVTp9Px+tbhJStfjhC
 iPxe5wt9BiWwsRkbP+v6bxm2uIYAMpJU2hZmkLIsGnT/7yviCQeWqZ3bKI3cLEjCcdLL
 o/pvOyHd2To72tkh+hGEw5RTQSkMhx6EblE+HMeevFGdCr4mlDgy5QpLCkqYFQR300PN
 nBEKpJvnZPhhaPlLj89v0Z7K0epxUD0fg9Mtpgg2urwmrwetaZ6UWDGY35szqsgfdxb8
 R/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9DBasqbLZ8AmB9A2BlsiwxW4Zljs4akh8lbXXV2kcIM=;
 b=TfU3HCWcDBFfgQ3JVFBVuRZRNSYdU1ZwISwwZZfxju110gDav0Or3blioCB1ggL6i4
 KS+tFLp87EFOvwxQ1IuKMbQPlL9XcailpylVSb5MyQCGIzUtxq5mEWoWdVzHiECMa3rT
 vgArK3pmB+TlSIkY5st5fN99QEF+DVSepOPe4CmNoNXiU4A38FA0Ee+CwLzuV+nQC+x5
 huwMYhuTLO66C4eURoD/w7EmpHx2CxSIr+aZ6fAW1eCawMzE1KOBSdELaR0KEkcOrEFp
 GOwgp/DAnT1+Oywy/Xz6VZkdNMjl19e7FGa2HPp0rypLGsdN/8YTW8rddXwofFqIqSki
 97nA==
X-Gm-Message-State: ANoB5pkcFMmxgczjUG0mnhvKaVzrn9BK9aJRDwpObyP9aW/4oT8f0nCM
 leQxkntRAzrB/OvtbycO6IYKW3Fj/ekEhc3+
X-Google-Smtp-Source: AA0mqf7SBWbyI4B/bNvTV1hbh9wguD5hJ4nXfjTH9ntZy8E+KHSjLnBSPXMkewbG6oaLfANt7/R2ZQ==
X-Received: by 2002:a17:90a:4594:b0:218:f745:76fe with SMTP id
 v20-20020a17090a459400b00218f74576femr42023528pjg.245.1669959605969; 
 Thu, 01 Dec 2022 21:40:05 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b00186f0f59c85sm4637075plh.235.2022.12.01.21.40.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 21:40:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/34] tcg: Centralize updates to reg_to_temp
Date: Thu,  1 Dec 2022 21:39:30 -0800
Message-Id: <20221202053958.223890-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202053958.223890-1-richard.henderson@linaro.org>
References: <20221202053958.223890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

Create two new functions, set_temp_val_{reg,nonreg}.
Assert that the reg_to_temp mapping is correct before
any changes are made.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 159 +++++++++++++++++++++++++++++-------------------------
 1 file changed, 85 insertions(+), 74 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index d1e91b8acc..c075c97050 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3036,6 +3036,35 @@ static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
     ts->mem_allocated = 1;
 }
 
+/* Assign @reg to @ts, and update reg_to_temp[]. */
+static void set_temp_val_reg(TCGContext *s, TCGTemp *ts, TCGReg reg)
+{
+    if (ts->val_type == TEMP_VAL_REG) {
+        TCGReg old = ts->reg;
+        tcg_debug_assert(s->reg_to_temp[old] == ts);
+        if (old == reg) {
+            return;
+        }
+        s->reg_to_temp[old] = NULL;
+    }
+    tcg_debug_assert(s->reg_to_temp[reg] == NULL);
+    s->reg_to_temp[reg] = ts;
+    ts->val_type = TEMP_VAL_REG;
+    ts->reg = reg;
+}
+
+/* Assign a non-register value type to @ts, and update reg_to_temp[]. */
+static void set_temp_val_nonreg(TCGContext *s, TCGTemp *ts, TCGTempVal type)
+{
+    tcg_debug_assert(type != TEMP_VAL_REG);
+    if (ts->val_type == TEMP_VAL_REG) {
+        TCGReg reg = ts->reg;
+        tcg_debug_assert(s->reg_to_temp[reg] == ts);
+        s->reg_to_temp[reg] = NULL;
+    }
+    ts->val_type = type;
+}
+
 static void temp_load(TCGContext *, TCGTemp *, TCGRegSet, TCGRegSet, TCGRegSet);
 
 /* Mark a temporary as free or dead.  If 'free_or_dead' is negative,
@@ -3061,10 +3090,7 @@ static void temp_free_or_dead(TCGContext *s, TCGTemp *ts, int free_or_dead)
     default:
         g_assert_not_reached();
     }
-    if (ts->val_type == TEMP_VAL_REG) {
-        s->reg_to_temp[ts->reg] = NULL;
-    }
-    ts->val_type = new_type;
+    set_temp_val_nonreg(s, ts, new_type);
 }
 
 /* Mark a temporary as dead.  */
@@ -3244,9 +3270,7 @@ static void temp_load(TCGContext *s, TCGTemp *ts, TCGRegSet desired_regs,
     default:
         tcg_abort();
     }
-    ts->reg = reg;
-    ts->val_type = TEMP_VAL_REG;
-    s->reg_to_temp[reg] = ts;
+    set_temp_val_reg(s, ts, reg);
 }
 
 /* Save a temporary to memory. 'allocated_regs' is used in case a
@@ -3358,10 +3382,7 @@ static void tcg_reg_alloc_do_movi(TCGContext *s, TCGTemp *ots,
     tcg_debug_assert(!temp_readonly(ots));
 
     /* The movi is not explicitly generated here.  */
-    if (ots->val_type == TEMP_VAL_REG) {
-        s->reg_to_temp[ots->reg] = NULL;
-    }
-    ots->val_type = TEMP_VAL_CONST;
+    set_temp_val_nonreg(s, ots, TEMP_VAL_CONST);
     ots->val = val;
     ots->mem_coherent = 0;
     if (NEED_SYNC_ARG(0)) {
@@ -3380,6 +3401,7 @@ static void tcg_reg_alloc_mov(TCGContext *s, const TCGOp *op)
     TCGRegSet allocated_regs, preferred_regs;
     TCGTemp *ts, *ots;
     TCGType otype, itype;
+    TCGReg oreg, ireg;
 
     allocated_regs = s->reserved_regs;
     preferred_regs = op->output_pref[0];
@@ -3411,8 +3433,9 @@ static void tcg_reg_alloc_mov(TCGContext *s, const TCGOp *op)
         temp_load(s, ts, tcg_target_available_regs[itype],
                   allocated_regs, preferred_regs);
     }
-
     tcg_debug_assert(ts->val_type == TEMP_VAL_REG);
+    ireg = ts->reg;
+
     if (IS_DEAD_ARG(0)) {
         /* mov to a non-saved dead register makes no sense (even with
            liveness analysis disabled). */
@@ -3420,52 +3443,53 @@ static void tcg_reg_alloc_mov(TCGContext *s, const TCGOp *op)
         if (!ots->mem_allocated) {
             temp_allocate_frame(s, ots);
         }
-        tcg_out_st(s, otype, ts->reg, ots->mem_base->reg, ots->mem_offset);
+        tcg_out_st(s, otype, ireg, ots->mem_base->reg, ots->mem_offset);
         if (IS_DEAD_ARG(1)) {
             temp_dead(s, ts);
         }
         temp_dead(s, ots);
+        return;
+    }
+
+    if (IS_DEAD_ARG(1) && ts->kind != TEMP_FIXED) {
+        /*
+         * The mov can be suppressed.  Kill input first, so that it
+         * is unlinked from reg_to_temp, then set the output to the
+         * reg that we saved from the input.
+         */
+        temp_dead(s, ts);
+        oreg = ireg;
     } else {
-        if (IS_DEAD_ARG(1) && ts->kind != TEMP_FIXED) {
-            /* the mov can be suppressed */
-            if (ots->val_type == TEMP_VAL_REG) {
-                s->reg_to_temp[ots->reg] = NULL;
-            }
-            ots->reg = ts->reg;
-            temp_dead(s, ts);
+        if (ots->val_type == TEMP_VAL_REG) {
+            oreg = ots->reg;
         } else {
-            if (ots->val_type != TEMP_VAL_REG) {
-                /* When allocating a new register, make sure to not spill the
-                   input one. */
-                tcg_regset_set_reg(allocated_regs, ts->reg);
-                ots->reg = tcg_reg_alloc(s, tcg_target_available_regs[otype],
-                                         allocated_regs, preferred_regs,
-                                         ots->indirect_base);
-            }
-            if (!tcg_out_mov(s, otype, ots->reg, ts->reg)) {
-                /*
-                 * Cross register class move not supported.
-                 * Store the source register into the destination slot
-                 * and leave the destination temp as TEMP_VAL_MEM.
-                 */
-                assert(!temp_readonly(ots));
-                if (!ts->mem_allocated) {
-                    temp_allocate_frame(s, ots);
-                }
-                tcg_out_st(s, ts->type, ts->reg,
-                           ots->mem_base->reg, ots->mem_offset);
-                ots->mem_coherent = 1;
-                temp_free_or_dead(s, ots, -1);
-                return;
-            }
+            /* Make sure to not spill the input register during allocation. */
+            oreg = tcg_reg_alloc(s, tcg_target_available_regs[otype],
+                                 allocated_regs | ((TCGRegSet)1 << ireg),
+                                 preferred_regs, ots->indirect_base);
         }
-        ots->val_type = TEMP_VAL_REG;
-        ots->mem_coherent = 0;
-        s->reg_to_temp[ots->reg] = ots;
-        if (NEED_SYNC_ARG(0)) {
-            temp_sync(s, ots, allocated_regs, 0, 0);
+        if (!tcg_out_mov(s, otype, oreg, ireg)) {
+            /*
+             * Cross register class move not supported.
+             * Store the source register into the destination slot
+             * and leave the destination temp as TEMP_VAL_MEM.
+             */
+            assert(!temp_readonly(ots));
+            if (!ts->mem_allocated) {
+                temp_allocate_frame(s, ots);
+            }
+            tcg_out_st(s, ts->type, ireg, ots->mem_base->reg, ots->mem_offset);
+            set_temp_val_nonreg(s, ts, TEMP_VAL_MEM);
+            ots->mem_coherent = 1;
+            return;
         }
     }
+    set_temp_val_reg(s, ots, oreg);
+    ots->mem_coherent = 0;
+
+    if (NEED_SYNC_ARG(0)) {
+        temp_sync(s, ots, allocated_regs, 0, 0);
+    }
 }
 
 /*
@@ -3507,15 +3531,15 @@ static void tcg_reg_alloc_dup(TCGContext *s, const TCGOp *op)
     /* Allocate the output register now.  */
     if (ots->val_type != TEMP_VAL_REG) {
         TCGRegSet allocated_regs = s->reserved_regs;
+        TCGReg oreg;
 
         if (!IS_DEAD_ARG(1) && its->val_type == TEMP_VAL_REG) {
             /* Make sure to not spill the input register. */
             tcg_regset_set_reg(allocated_regs, its->reg);
         }
-        ots->reg = tcg_reg_alloc(s, dup_out_regs, allocated_regs,
-                                 op->output_pref[0], ots->indirect_base);
-        ots->val_type = TEMP_VAL_REG;
-        s->reg_to_temp[ots->reg] = ots;
+        oreg = tcg_reg_alloc(s, dup_out_regs, allocated_regs,
+                             op->output_pref[0], ots->indirect_base);
+        set_temp_val_reg(s, ots, oreg);
     }
 
     switch (its->val_type) {
@@ -3552,10 +3576,12 @@ static void tcg_reg_alloc_dup(TCGContext *s, const TCGOp *op)
 #else
         endian_fixup = 0;
 #endif
+        /* Attempt to dup directly from the input memory slot. */
         if (tcg_out_dupm_vec(s, vtype, vece, ots->reg, its->mem_base->reg,
                              its->mem_offset + endian_fixup)) {
             goto done;
         }
+        /* Load the input into the destination vector register. */
         tcg_out_ld(s, itype, ots->reg, its->mem_base->reg, its->mem_offset);
         break;
 
@@ -3727,17 +3753,8 @@ static void tcg_reg_alloc_op(TCGContext *s, const TCGOp *op)
                                     op->output_pref[k], ts->indirect_base);
             }
             tcg_regset_set_reg(o_allocated_regs, reg);
-            if (ts->val_type == TEMP_VAL_REG) {
-                s->reg_to_temp[ts->reg] = NULL;
-            }
-            ts->val_type = TEMP_VAL_REG;
-            ts->reg = reg;
-            /*
-             * Temp value is modified, so the value kept in memory is
-             * potentially not the same.
-             */
+            set_temp_val_reg(s, ts, reg);
             ts->mem_coherent = 0;
-            s->reg_to_temp[reg] = ts;
             new_args[i] = reg;
         }
     }
@@ -3787,6 +3804,7 @@ static bool tcg_reg_alloc_dup2(TCGContext *s, const TCGOp *op)
         TCGRegSet allocated_regs = s->reserved_regs;
         TCGRegSet dup_out_regs =
             tcg_op_defs[INDEX_op_dup_vec].args_ct[0].regs;
+        TCGReg oreg;
 
         /* Make sure to not spill the input registers. */
         if (!IS_DEAD_ARG(1) && itsl->val_type == TEMP_VAL_REG) {
@@ -3796,10 +3814,9 @@ static bool tcg_reg_alloc_dup2(TCGContext *s, const TCGOp *op)
             tcg_regset_set_reg(allocated_regs, itsh->reg);
         }
 
-        ots->reg = tcg_reg_alloc(s, dup_out_regs, allocated_regs,
-                                 op->output_pref[0], ots->indirect_base);
-        ots->val_type = TEMP_VAL_REG;
-        s->reg_to_temp[ots->reg] = ots;
+        oreg = tcg_reg_alloc(s, dup_out_regs, allocated_regs,
+                             op->output_pref[0], ots->indirect_base);
+        set_temp_val_reg(s, ots, oreg);
     }
 
     /* Promote dup2 of immediates to dupi_vec. */
@@ -3993,14 +4010,8 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
         tcg_debug_assert(!temp_readonly(ts));
 
         reg = tcg_target_call_oarg_regs[i];
-        tcg_debug_assert(s->reg_to_temp[reg] == NULL);
-        if (ts->val_type == TEMP_VAL_REG) {
-            s->reg_to_temp[ts->reg] = NULL;
-        }
-        ts->val_type = TEMP_VAL_REG;
-        ts->reg = reg;
+        set_temp_val_reg(s, ts, reg);
         ts->mem_coherent = 0;
-        s->reg_to_temp[reg] = ts;
         if (NEED_SYNC_ARG(i)) {
             temp_sync(s, ts, allocated_regs, 0, IS_DEAD_ARG(i));
         } else if (IS_DEAD_ARG(i)) {
-- 
2.34.1


