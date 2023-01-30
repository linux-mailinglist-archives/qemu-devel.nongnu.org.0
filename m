Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E36FF681D47
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:51:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMc1P-0001tU-Fn; Mon, 30 Jan 2023 16:49:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc1N-0001sw-1t
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:49:01 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc1L-0005b4-0P
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:49:00 -0500
Received: by mail-pl1-x62d.google.com with SMTP id m13so1199808plx.13
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 13:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YYp288Frvbt6OWFjpqbemBc0raem/o/jhP5zjAY/7EY=;
 b=ncxUI3Kn08Fz9Tx0WF9BdScOFZPaKxk51kpEk++GHhzpLfqFmV1/oY9TiTO8D1uojP
 voI+tNC14VNm+es1bHffkyNvR3hj8E4SdwQNxLOUrVQbII0LfG1Ap+vzCgETytZtpZUE
 mLNrEHuoPfS3dKzrojyIdvb6kofFUfmCqFznzvRHrHmJgtBESDeyDGtge965ylVXzVvb
 T04vhky6AxnrRGpKs9W35GzSNvH3HQl2q3OfP09WyYkgV+7S1Igd+qX3XUTjlu7mcivP
 u2bDY9oLdoCFOkSNWBSybH/0QtJD8CcaJ5QPGINdJu2jO0sUlOThz3lMI3yeviGDag+Y
 rRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YYp288Frvbt6OWFjpqbemBc0raem/o/jhP5zjAY/7EY=;
 b=gFZSc21nRXKjg9stgimA+O+zsYAJ7WOZKFRN4FJhjx6IAt88OgJM3jqc0gq/NtBJap
 gHa3TWvyZ45yqACjhlnxpwhDWZB8d6Zv9HUWbQp1vpX65re2H+p8mgxZ9El9jUeh1/dO
 QnrK9NRcLG4CFH7U10oYzYfgVbZK59WoAtmbOcWlcBoB1VrD+CNQdjI3Lr300xpvCRJb
 0tstfUgo6Krrmv8E7rCWVLWJqM8L1Bao9anSWVq1nPn79KxA1/HXTSueaaJ2QBGqdCV6
 F7q4w74wJP6e7ZN7H75Jt4bPoTv5P2TuIqOAADc2pZ2etfJl47AiZ/3887u/0Vohrt9c
 a/kQ==
X-Gm-Message-State: AO0yUKUe2oo21ucNJK5QIn5y2nms3UoQQzZhhQD4n2MVHt/b109FPDdr
 8lqMASLEFf8V+WreHKsn2PuJsAWyTvccdcrN
X-Google-Smtp-Source: AK7set//0G5lyes8HsHIKQIapdzrVLKvr8Iun6hG/Bj+tWQp21OLRxTgzLqhWWjMbPka1/NzmrWIIg==
X-Received: by 2002:a17:90b:3907:b0:22c:838:c27d with SMTP id
 ob7-20020a17090b390700b0022c0838c27dmr10736758pjb.6.1675115337316; 
 Mon, 30 Jan 2023 13:48:57 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a17090ad14400b00219220edf0dsm7451215pjw.48.2023.01.30.13.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 13:48:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH v6 05/36] tcg: Add TCG_CALL_{RET,ARG}_BY_REF
Date: Mon, 30 Jan 2023 11:48:13 -1000
Message-Id: <20230130214844.1158612-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130214844.1158612-1-richard.henderson@linaro.org>
References: <20230130214844.1158612-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
index 0cedfe316b..7db48f3305 100644
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
 
@@ -4408,6 +4484,27 @@ static void load_arg_normal(TCGContext *s, const TCGCallArgumentLoc *l,
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
@@ -4431,6 +4528,16 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
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
@@ -4462,6 +4569,19 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
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
@@ -4478,6 +4598,15 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
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


