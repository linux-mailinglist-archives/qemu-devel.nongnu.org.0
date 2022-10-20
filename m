Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 745CA6060CB
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 14:59:23 +0200 (CEST)
Received: from localhost ([::1]:40964 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olV8Y-0007zu-Q7
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 08:59:12 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olV6X-0008Eh-Og
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 08:56:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU88-0005Xs-Ru
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:54:42 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:38778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU85-00018J-1M
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:54:32 -0400
Received: by mail-pf1-x42d.google.com with SMTP id p14so20058900pfq.5
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=k7bPKKs/aThsRZPJWHh1qzMHmjPNozKPmJgP4+3jfyA=;
 b=sHduDF3kgPB02THemvuMv33t4O0tjgRF/TY0a3135Vpei6SKCd9Kh0ULG9XYYMA0OX
 +OUr786ldypbRm8+9N6DzYM4gIFNC9Z46eKn4ZgvFOXEgLV30K2WZ3zindLxVHt86Jft
 3qe40v1TiobJmsd5SboixrRYiys9Wj8ldm72Az450y07jWRQRXL5EtBO/Mf3ypa+4/xh
 d7U4uCeDcWEQ2LVNBnVZPw5n0cLMVgNqgS8NzYPU7cSPginn4KEis4mIQA2Dh5E85GBL
 YHFuq2HuFAHP0leltPyenSMWpKjJNxjQqzz7F1DOhmZCarOBLzTDMCXdd9Rhx0r70Jk4
 RK3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k7bPKKs/aThsRZPJWHh1qzMHmjPNozKPmJgP4+3jfyA=;
 b=FG5hQJ3Sr5skaveQC7Uyk2pw+P73iGdJFAFqGtJG3TQe7JqSZFFsB8tmcE8FL7b698
 t0iPYzWvu++MaZtFCrylhYdPYDW9UapNwzxtGrKwQk09uvfQ0we/moxxVOf42LhXBvaz
 QPxQv/MbgHlBaJtLvnpQXifpkYxD6J9IHkPGBaeHATz3HPeKPiRRMB+Kk40hdL/lx1rZ
 u3NUWDs2iDYcXyJyMwZGGTq/cdnWYijoJUDI9SgDj3DXeWa4mXqOBCFRW9jdVB9Hb4NA
 1UpwPT8TE4UnR+kvMzJ417vtrDIeBC88jVo+XuYfODZE0XK8Ayrm64hvuTwMlfXXO3yU
 AszA==
X-Gm-Message-State: ACrzQf1uSuGx0ELjGQrybxqGfc/cLcHCoUubkLERr8hBd7HF6rPgrHOD
 MMxyt3nmTMtDI49nc+J5S4dQ1G/+qgK+KsDC
X-Google-Smtp-Source: AMsMyM4EFOicDD2RQmc6EJmvzSO/jlkWsu4J5XCJ/5DErjd4MH2zxFpRVbLfbtkz8iYW3PjNieZreA==
X-Received: by 2002:a63:1352:0:b0:469:793f:9683 with SMTP id
 18-20020a631352000000b00469793f9683mr11527504pgt.128.1666266867321; 
 Thu, 20 Oct 2022 04:54:27 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 w206-20020a627bd7000000b0056109e15638sm13065464pfc.54.2022.10.20.04.54.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:54:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 25/31] tcg: Add TCG_CALL_{RET,ARG}_BY_REF
Date: Thu, 20 Oct 2022 21:52:36 +1000
Message-Id: <20221020115242.2301066-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115242.2301066-1-richard.henderson@linaro.org>
References: <20221020115242.2301066-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These will be used by some hosts, 32 and 64-bit to pass and
return i128.  Not yet used, because allocation is not yet enabled.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-internal.h |  10 ++--
 tcg/tcg.c          | 124 ++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 129 insertions(+), 5 deletions(-)

diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index 7d4f7049be..1fe7bd7d5d 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -37,6 +37,7 @@
 typedef enum {
     TCG_CALL_RET_NORMAL,         /* by registers */
     TCG_CALL_RET_NORMAL_4,       /* for i128, by 4 registers */
+    TCG_CALL_RET_BY_REF,         /* for i128, by reference as first arg */
 } TCGCallReturnKind;
 
 typedef enum {
@@ -46,12 +47,15 @@ typedef enum {
     TCG_CALL_ARG_EXTEND_U,       /*      ... as a zero-extended i64 */
     TCG_CALL_ARG_EXTEND_S,       /*      ... as a sign-extended i64 */
     TCG_CALL_ARG_NORMAL_4,       /* for i128, like normal with 4 slots */
+    TCG_CALL_ARG_BY_REF,         /*      ... by reference, first */
+    TCG_CALL_ARG_BY_REF_2,       /*      ... by reference, second */
 } TCGCallArgumentKind;
 
 typedef struct TCGCallArgumentLoc {
-    TCGCallArgumentKind kind    : 8;
-    unsigned reg_slot           : 8;
-    unsigned stk_slot           : 8;
+    TCGCallArgumentKind kind    : 4;
+    unsigned reg_slot           : 6;
+    unsigned stk_slot           : 6;
+    unsigned ref_slot           : 6;
     unsigned reg_n              : 2;
     unsigned arg_idx            : 4;
     unsigned tmp_subindex       : 1;
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 390724e652..c664e3b18d 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -103,8 +103,7 @@ static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg1,
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
 static void tcg_out_movi(TCGContext *s, TCGType type,
                          TCGReg ret, tcg_target_long arg);
-static void tcg_out_addi_ptr(TCGContext *s, TCGReg, TCGReg, tcg_target_long)
-    __attribute__((unused));
+static void tcg_out_addi_ptr(TCGContext *s, TCGReg, TCGReg, tcg_target_long);
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS]);
@@ -684,6 +683,34 @@ static void layout_arg_normal_4(TCGCumulativeArgs *cum, TCGHelperInfo *info)
     cum->op_arg_idx++;
 }
 
+static void layout_arg_by_ref(TCGCumulativeArgs *cum, TCGHelperInfo *info)
+{
+    TCGCallArgumentLoc *loc = &info->in[cum->info_in_idx];
+    int n = 128 / TCG_TARGET_REG_BITS;
+
+    /* The first subindex carries the pointer. */
+    layout_arg_1(cum, info, TCG_CALL_ARG_BY_REF);
+
+    /*
+     * The callee is allowed to clobber memory associated with
+     * structure pass by-reference.  Therefore we must make copies.
+     * Allocate space from the top of TCG_STATIC_CALL_ARGS_SIZE.
+     */
+    cum->max_stk_slot -= n;
+    loc[0].ref_slot = cum->max_stk_slot;
+
+    /* Any other subindex is present for liveness. */
+    if (TCG_TARGET_REG_BITS == 64) {
+        loc[1] = (TCGCallArgumentLoc){
+            .kind = TCG_CALL_ARG_BY_REF_2,
+            .arg_idx = cum->arg_idx,
+            .tmp_subindex = 1,
+        };
+        cum->info_in_idx++;
+        cum->op_arg_idx++;
+    }
+}
+
 static void init_call_layout(TCGHelperInfo *info)
 {
     unsigned typemask = info->typemask;
@@ -728,6 +755,18 @@ static void init_call_layout(TCGHelperInfo *info)
                 assert(ARRAY_SIZE(tcg_target_call_oarg_regs) >= 2);
             }
             break;
+        case TCG_CALL_RET_BY_REF:
+            /*
+             * Allocate the first argument to the output.
+             * We don't need to store this anywhere, just make it
+             * unavailable for use in the input loop below.
+             */
+            if (cum.max_reg_slot == 0) {
+                cum.stk_slot = 1;
+            } else {
+                cum.reg_slot = 1;
+            }
+            break;
         default:
             g_assert_not_reached();
         }
@@ -765,6 +804,10 @@ static void init_call_layout(TCGHelperInfo *info)
             type = TCG_TYPE_PTR;
             kind = TCG_CALL_ARG_NORMAL;
             break;
+        case dh_typecode_i128:
+            type = TCG_TYPE_I128;
+            kind = TCG_CALL_ARG_NORMAL; /* TODO */
+            break;
         default:
             g_assert_not_reached();
         }
@@ -809,6 +852,10 @@ static void init_call_layout(TCGHelperInfo *info)
             assert(type == TCG_TYPE_I32);
             layout_arg_1(&cum, info, kind);
             break;
+        case TCG_CALL_ARG_BY_REF:
+            assert(type == TCG_TYPE_I128);
+            layout_arg_by_ref(&cum, info);
+            break;
         default:
             g_assert_not_reached();
         }
@@ -1740,6 +1787,8 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
         switch (loc->kind) {
         case TCG_CALL_ARG_NORMAL:
         case TCG_CALL_ARG_NORMAL_4:
+        case TCG_CALL_ARG_BY_REF:
+        case TCG_CALL_ARG_BY_REF_2:
             op->args[pi++] = temp_arg(ts);
             break;
 
@@ -4464,6 +4513,27 @@ static void load_arg_normal_4(TCGContext *s, const TCGCallArgumentLoc *loc,
     }
 }
 
+static void load_arg_by_ref(TCGContext *s, const TCGCallArgumentLoc *loc,
+                            TCGReg ref_base, int ref_off,
+                            TCGRegSet *allocated_regs)
+{
+    TCGReg reg;
+
+    if (loc->reg_n) {
+        reg = tcg_target_call_iarg_regs[loc->reg_slot];
+        tcg_out_addi_ptr(s, reg, ref_base, ref_off);
+        tcg_regset_set_reg(*allocated_regs, reg);
+    } else {
+        int stk_off = TCG_TARGET_CALL_STACK_OFFSET
+                    + loc->stk_slot * sizeof(tcg_target_long);
+
+        reg = tcg_reg_alloc(s, tcg_target_available_regs[TCG_TYPE_PTR],
+                            *allocated_regs, 0, false);
+        tcg_out_addi_ptr(s, reg, ref_base, ref_off);
+        tcg_out_st(s, TCG_TYPE_PTR, reg, TCG_REG_CALL_STACK, stk_off);
+    }
+}
+
 static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
 {
     const int nb_oargs = TCGOP_CALLO(op);
@@ -4473,6 +4543,19 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
     TCGRegSet allocated_regs = s->reserved_regs;
     int i;
 
+    /*
+     * The callee is allowed to clobber memory associated with
+     * structure pass by-reference.  Therefore we must make copies.
+     * Do this first, before we start allocating argument regs.
+     */
+    for (i = 0; i < nb_iargs; ++i) {
+        const TCGCallArgumentLoc *loc = &info->in[i];
+        if (loc->kind == TCG_CALL_ARG_BY_REF) {
+            TCGTemp *ts = arg_temp(op->args[nb_oargs + i]);
+            copy_to_stk_i128(s, loc->ref_slot, ts, 0, allocated_regs);
+        }
+    }
+
     /*
      * Move inputs into place in reverse order,
      * so that we place stacked arguments first.
@@ -4490,6 +4573,15 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
         case TCG_CALL_ARG_NORMAL_4:
             load_arg_normal_4(s, loc, ts, &allocated_regs);
             break;
+        case TCG_CALL_ARG_BY_REF:
+            load_arg_by_ref(s, loc, TCG_REG_CALL_STACK,
+                            TCG_TARGET_CALL_STACK_OFFSET +
+                            loc->ref_slot * sizeof(tcg_target_long),
+                            &allocated_regs);
+            break;
+        case TCG_CALL_ARG_BY_REF_2:
+            /* nothing to do */
+            break;
         default:
             g_assert_not_reached();
         }
@@ -4521,6 +4613,26 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
         save_globals(s, allocated_regs);
     }
 
+    /*
+     * If the ABI passes a pointer to the returned struct as the first
+     * argument, load that now.  Pass a pointer to the output home slot.
+     */
+    if (info->out_kind == TCG_CALL_RET_BY_REF) {
+        static const TCGCallArgumentLoc ret_loc = {
+            .reg_n = ARRAY_SIZE(tcg_target_call_iarg_regs) != 0
+        };
+        TCGTemp *ts = arg_temp(op->args[0]);
+
+        tcg_debug_assert(ts->base_type == TCG_TYPE_I128);
+        tcg_debug_assert(ts->temp_subindex == 0);
+
+        if (!ts->mem_allocated) {
+            temp_allocate_frame(s, ts);
+        }
+        load_arg_by_ref(s, &ret_loc, ts->mem_base->reg, ts->mem_offset,
+                        &allocated_regs);
+    }
+
     tcg_out_call(s, tcg_call_func(op), info);
 
     /* Assign output registers and emit moves if needed.  */
@@ -4561,6 +4673,14 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
         }
         break;
 
+    case TCG_CALL_RET_BY_REF:
+        /* The callee has performed a write through the reference. */
+        for (i = 0; i < nb_oargs; i++) {
+            TCGTemp *ts = arg_temp(op->args[i]);
+            ts->val_type = TEMP_VAL_MEM;
+        }
+        break;
+
     default:
         g_assert_not_reached();
     }
-- 
2.34.1


