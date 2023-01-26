Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F3967C3E9
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 05:41:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKu28-00008k-9H; Wed, 25 Jan 2023 23:38:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu25-00006o-BT
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:38:41 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu21-0004Od-Tf
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:38:41 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 t12-20020a17090aae0c00b00229f4cff534so5122127pjq.1
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 20:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fb2fdMOMcanVFyUwDsIR4Y1AU3aUWkiDhIm8eRBZLcI=;
 b=mPr8hDqGfvxlSTOaxygQFGmktopCI4txoZeYFN5Qah5J3BxcM75r3uulrAZxYdWGM9
 oEQIPYyezeNXQ7T8kfEfa/JrOqKGLLLcU3Q9Ec8A/jDGAPFnd9UPRrJwhseN3Z5X38k7
 zuaDgPRKaZZXWuJIQTMsuvTLhNZmOUZLP5J14S3xgQx5ES5ngbDNSH1DzA289EHqaMio
 h9jAJL15aw+WeOG7v/gvtVbnsyvzFNBq4Ns+0gzivERt5tk/bvor4jdWHyJlc7u1ZtWq
 Vuy0FqD8/1X9VVCEyUUvvTI/WPc5v18tEV/aElS7f3ed0IxFUXQifCD8VnpaQQ/gU/st
 PbrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fb2fdMOMcanVFyUwDsIR4Y1AU3aUWkiDhIm8eRBZLcI=;
 b=iW6qSJh11Oi+cRK+zeLoV7GZowSn0RtnuKmwGB4h23W+0ihmG875lVJEJ0/l9fcA03
 iri5fSreH0J8ivO5ZluKzy5QmTCg6ixaiYY4JkZkYT8B8Lp2Y8DzuY6ByWx+WpPEV4nM
 NR3famdRbkBZnmemG6hvh87hXBgzHXwZSPd4YllM2AhgXSxfaUsX7FI+/pVn1lCAekvB
 +of8Rf3oJQO+ecMJnJuGSCeBei9e4dAgliwV9/BwT9KDLy9hZnpYaHTUR3Mu3qwWciqy
 OcNTV9Fzxz1qastfhizSW6mDLRCwvNJXgZ1q9zoN51Tsn5FUBkOPTnzGAA39uUDA/JCW
 WEZg==
X-Gm-Message-State: AFqh2kp347DEZlx6FegZlUc7W/HjBn96EBWAqoWN5HID/mt5ikLZcc6n
 OR5EY7dmdroLLYbhfR9/cczZZOW9G2i/zTcFGH0=
X-Google-Smtp-Source: AMrXdXslPSp+ulQ096vqlbi+T53/FSxtK0Aq/nKhNWENYbShWzHzuYwKsmejgEXWKVy9mV3s85T3wg==
X-Received: by 2002:a17:90a:fa43:b0:229:e620:6c19 with SMTP id
 dt3-20020a17090afa4300b00229e6206c19mr28121844pjb.0.1674707915653; 
 Wed, 25 Jan 2023 20:38:35 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 s62-20020a17090a69c400b00228e56d375asm233376pjj.33.2023.01.25.20.38.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 20:38:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH v5 05/36] tcg: Add TCG_CALL_{RET,ARG}_BY_REF
Date: Wed, 25 Jan 2023 18:37:53 -1000
Message-Id: <20230126043824.54819-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126043824.54819-1-richard.henderson@linaro.org>
References: <20230126043824.54819-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

These will be used by some hosts, both 32 and 64-bit, to pass and
return i128.  Not yet used, because allocation is not yet enabled.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-internal.h |   3 +
 tcg/tcg.c          | 135 ++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 135 insertions(+), 3 deletions(-)

diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index 6e50aeba3a..2ec1ea01df 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -36,6 +36,7 @@
  */
 typedef enum {
     TCG_CALL_RET_NORMAL,         /* by registers */
+    TCG_CALL_RET_BY_REF,         /* for i128, by reference */
 } TCGCallReturnKind;
 
 typedef enum {
@@ -44,6 +45,8 @@ typedef enum {
     TCG_CALL_ARG_EXTEND,         /* for i32, as a sign/zero-extended i64 */
     TCG_CALL_ARG_EXTEND_U,       /*      ... as a zero-extended i64 */
     TCG_CALL_ARG_EXTEND_S,       /*      ... as a sign-extended i64 */
+    TCG_CALL_ARG_BY_REF,         /* for i128, by reference, first */
+    TCG_CALL_ARG_BY_REF_N,       /*       ... by reference, subsequent */
 } TCGCallArgumentKind;
 
 typedef struct TCGCallArgumentLoc {
diff --git a/tcg/tcg.c b/tcg/tcg.c
index a561ef3ced..644dc53196 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -104,8 +104,7 @@ static void tcg_out_ld(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg1,
 static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg);
 static void tcg_out_movi(TCGContext *s, TCGType type,
                          TCGReg ret, tcg_target_long arg);
-static void tcg_out_addi_ptr(TCGContext *s, TCGReg, TCGReg, tcg_target_long)
-    __attribute__((unused));
+static void tcg_out_addi_ptr(TCGContext *s, TCGReg, TCGReg, tcg_target_long);
 static void tcg_out_exit_tb(TCGContext *s, uintptr_t arg);
 static void tcg_out_goto_tb(TCGContext *s, int which);
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
@@ -683,6 +682,38 @@ static void layout_arg_normal_n(TCGCumulativeArgs *cum,
     cum->arg_slot += n;
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
+     * Allocate space from "ref_slot", which will be adjusted to
+     * follow the parameters on the stack.
+     */
+    loc[0].ref_slot = cum->ref_slot;
+
+    /*
+     * Subsequent words also go into the reference slot, but
+     * do not accumulate into the regular arguments.
+     */
+    for (int i = 1; i < n; ++i) {
+        loc[i] = (TCGCallArgumentLoc){
+            .kind = TCG_CALL_ARG_BY_REF_N,
+            .arg_idx = cum->arg_idx,
+            .tmp_subindex = i,
+            .ref_slot = cum->ref_slot + i,
+        };
+    }
+    cum->info_in_idx += n;
+    cum->ref_slot += n;
+}
+
 static void init_call_layout(TCGHelperInfo *info)
 {
     int max_reg_slots = ARRAY_SIZE(tcg_target_call_iarg_regs);
@@ -718,6 +749,14 @@ static void init_call_layout(TCGHelperInfo *info)
         case TCG_CALL_RET_NORMAL:
             assert(info->nr_out <= ARRAY_SIZE(tcg_target_call_oarg_regs));
             break;
+        case TCG_CALL_RET_BY_REF:
+            /*
+             * Allocate the first argument to the output.
+             * We don't need to store this anywhere, just make it
+             * unavailable for use in the input loop below.
+             */
+            cum.arg_slot = 1;
+            break;
         default:
             qemu_build_not_reached();
         }
@@ -796,6 +835,9 @@ static void init_call_layout(TCGHelperInfo *info)
             case TCG_CALL_ARG_NORMAL:
                 layout_arg_normal_n(&cum, info, 128 / TCG_TARGET_REG_BITS);
                 break;
+            case TCG_CALL_ARG_BY_REF:
+                layout_arg_by_ref(&cum, info);
+                break;
             default:
                 qemu_build_not_reached();
             }
@@ -811,7 +853,39 @@ static void init_call_layout(TCGHelperInfo *info)
     assert(cum.info_in_idx <= ARRAY_SIZE(info->in));
     /* Validate the backend has enough argument space. */
     assert(cum.arg_slot <= max_reg_slots + max_stk_slots);
-    assert(cum.ref_slot <= max_stk_slots);
+
+    /*
+     * Relocate the "ref_slot" area to the end of the parameters.
+     * Minimizing this stack offset helps code size for x86,
+     * which has a signed 8-bit offset encoding.
+     */
+    if (cum.ref_slot != 0) {
+        int ref_base = 0;
+
+        if (cum.arg_slot > max_reg_slots) {
+            int align = __alignof(Int128) / sizeof(tcg_target_long);
+
+            ref_base = cum.arg_slot - max_reg_slots;
+            if (align > 1) {
+                ref_base = ROUND_UP(ref_base, align);
+            }
+        }
+        assert(ref_base + cum.ref_slot <= max_stk_slots);
+
+        if (ref_base != 0) {
+            for (int i = cum.info_in_idx - 1; i >= 0; --i) {
+                TCGCallArgumentLoc *loc = &info->in[i];
+                switch (loc->kind) {
+                case TCG_CALL_ARG_BY_REF:
+                case TCG_CALL_ARG_BY_REF_N:
+                    loc->ref_slot += ref_base;
+                    break;
+                default:
+                    break;
+                }
+            }
+        }
+    }
 }
 
 static int indirect_reg_alloc_order[ARRAY_SIZE(tcg_target_reg_alloc_order)];
@@ -1738,6 +1812,8 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
 
         switch (loc->kind) {
         case TCG_CALL_ARG_NORMAL:
+        case TCG_CALL_ARG_BY_REF:
+        case TCG_CALL_ARG_BY_REF_N:
             op->args[pi++] = temp_arg(ts);
             break;
 
@@ -4404,6 +4480,27 @@ static void load_arg_normal(TCGContext *s, const TCGCallArgumentLoc *l,
     }
 }
 
+static void load_arg_ref(TCGContext *s, int arg_slot, TCGReg ref_base,
+                         intptr_t ref_off, TCGRegSet *allocated_regs)
+{
+    TCGReg reg;
+    int stk_slot = arg_slot - ARRAY_SIZE(tcg_target_call_iarg_regs);
+
+    if (stk_slot < 0) {
+        reg = tcg_target_call_iarg_regs[arg_slot];
+        tcg_reg_free(s, reg, *allocated_regs);
+        tcg_out_addi_ptr(s, reg, ref_base, ref_off);
+        tcg_regset_set_reg(*allocated_regs, reg);
+    } else {
+        reg = tcg_reg_alloc(s, tcg_target_available_regs[TCG_TYPE_PTR],
+                            *allocated_regs, 0, false);
+        tcg_out_addi_ptr(s, reg, ref_base, ref_off);
+        tcg_out_st(s, TCG_TYPE_PTR, reg, TCG_REG_CALL_STACK,
+                   TCG_TARGET_CALL_STACK_OFFSET
+                   + stk_slot * sizeof(tcg_target_long));
+    }
+}
+
 static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
 {
     const int nb_oargs = TCGOP_CALLO(op);
@@ -4427,6 +4524,16 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
         case TCG_CALL_ARG_EXTEND_S:
             load_arg_normal(s, loc, ts, &allocated_regs);
             break;
+        case TCG_CALL_ARG_BY_REF:
+            load_arg_stk(s, loc->ref_slot, ts, allocated_regs);
+            load_arg_ref(s, loc->arg_slot, TCG_REG_CALL_STACK,
+                         TCG_TARGET_CALL_STACK_OFFSET
+                         + loc->ref_slot * sizeof(tcg_target_long),
+                         &allocated_regs);
+            break;
+        case TCG_CALL_ARG_BY_REF_N:
+            load_arg_stk(s, loc->ref_slot, ts, allocated_regs);
+            break;
         default:
             g_assert_not_reached();
         }
@@ -4458,6 +4565,19 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
         save_globals(s, allocated_regs);
     }
 
+    /*
+     * If the ABI passes a pointer to the returned struct as the first
+     * argument, load that now.  Pass a pointer to the output home slot.
+     */
+    if (info->out_kind == TCG_CALL_RET_BY_REF) {
+        TCGTemp *ts = arg_temp(op->args[0]);
+
+        if (!ts->mem_allocated) {
+            temp_allocate_frame(s, ts);
+        }
+        load_arg_ref(s, 0, ts->mem_base->reg, ts->mem_offset, &allocated_regs);
+    }
+
     tcg_out_call(s, tcg_call_func(op), info);
 
     /* Assign output registers and emit moves if needed.  */
@@ -4474,6 +4594,15 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
             ts->mem_coherent = 0;
         }
         break;
+
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


