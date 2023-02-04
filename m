Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67ED668AB5D
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:38:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOLU3-00058L-Hg; Sat, 04 Feb 2023 11:33:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLTl-000515-Rq
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:33:39 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLTi-0002Uy-Es
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:33:28 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 l4-20020a17090a850400b0023013402671so11503558pjn.5
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 08:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iPvfiPgim7uie0TQicbuZHa5CzKy5ICo/v1qplTlfFw=;
 b=Xk/+taqHCZ57e30KBkKl9pDdUJp1URp4MkLZGRe8RQhg6pXnhmwBNtoEHCtFzGBhrg
 iqXY4bmLhrPp9F//RQ8aBBhgX/h24CSxT/iCl582KGewjPF6wZTMv0WFxX5iy15j4aAY
 LUIyR9T8wNcJ+hMOayLtuLrpEMKMyPwQzgiWnMTorNgzOdP29Je4JsxlFxyaSOzHdaNB
 bGeHBna3bSf2Ij3Evjx+yvflOfh/ih/zkOE2R0D4kx5MxDjeOzDuG9jMUjHI3NuG7cAX
 lEJrbAw6EwTR2rPgznA4Rudaw973IHk3rJUH1SYeabJ0VQROnX0DYlNaMN6olS1hHGeX
 IcAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iPvfiPgim7uie0TQicbuZHa5CzKy5ICo/v1qplTlfFw=;
 b=VLM27j1+Xb7wWZ0Ge4CNhUasq40GTLHJSafn9uxcDBT9hGfpjK32ML4Rk6zH2T2v/E
 trRcyuXmtk2TMAB2qYHtrbaYPMUeos3acnRVzHrWZ6/VY12IGmpuc/yV62GV+XAzeac8
 72ZTHvsSb+Z7cjtlTFqZZDqIjqxhmGuv1Ttmj0prXKUF7hyD9CC6oX5iXUfhfJ94aTaI
 hBDesiYoJbyrUpBex6qY7zsQRm5pBj70ukoSkTekZA7GA/bXEUucoABpXFl/MQc0Ca7f
 A4IfG7S2e4N0uLzVqDlq1ZFSTr9ZVMgCGYwnd1zVEKrs8YKnnP3KIWs3PRwTioZfXboT
 Qc1Q==
X-Gm-Message-State: AO0yUKU0F4brJp2yEmeTRsZPPJFBiummTUPjvKnDy5+F+uGf61ve0RwA
 nGL6ilJgXOfaLb8dU9rG6t6dVngpZMav96G8
X-Google-Smtp-Source: AK7set+rBt89hcsELaNZJfeP6IjQJYSbnQaYFfR/uWU10whhNv182PY05ZGo/N/745jGDNALIznQgA==
X-Received: by 2002:a17:902:e2d1:b0:194:6679:87fa with SMTP id
 l17-20020a170902e2d100b00194667987famr10937212plc.32.1675528404986; 
 Sat, 04 Feb 2023 08:33:24 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a1709029a9300b00186b69157ecsm3660859plp.202.2023.02.04.08.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 08:33:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 07/40] tcg: Add TCG_CALL_{RET,ARG}_BY_REF
Date: Sat,  4 Feb 2023 06:32:37 -1000
Message-Id: <20230204163310.815536-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230204163310.815536-1-richard.henderson@linaro.org>
References: <20230204163310.815536-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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
index 8923b52044..123cde7000 100644
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
@@ -1740,6 +1814,8 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
 
         switch (loc->kind) {
         case TCG_CALL_ARG_NORMAL:
+        case TCG_CALL_ARG_BY_REF:
+        case TCG_CALL_ARG_BY_REF_N:
             op->args[pi++] = temp_arg(ts);
             break;
 
@@ -4411,6 +4487,27 @@ static void load_arg_normal(TCGContext *s, const TCGCallArgumentLoc *l,
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
@@ -4434,6 +4531,16 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
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
@@ -4465,6 +4572,19 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
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
@@ -4481,6 +4601,15 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
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


