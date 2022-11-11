Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8C7625540
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 09:28:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOgK-0006zc-9N; Fri, 11 Nov 2022 02:42:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOgE-0006tS-Sh
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:42:29 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOgC-0000IZ-UJ
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:42:26 -0500
Received: by mail-pg1-x52b.google.com with SMTP id q71so3797064pgq.8
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CPYxlgCVaE7nzaX4H41USC5VWvqB07xTjuetGSjKU6w=;
 b=ZCsurHcV4WOnzBMJWgUBINjy0ICIO7O1g/SQlAbRn0Se+xuRyMea1coguC831b3qRW
 gTZprRZxMrhH6Icbd5O17UbLysAItMcpxDdh5oVxDwBj2BKjqQLGMgWiPGIwnlvGvyHH
 HE2NyyT3EWQDh7k1MiubhzY0bYLyVP5cc9120RTi07oRxyYtz1V7oNvHM1ZV4ebCmhL+
 GkdyZgE/pFuIJqOy1Hjtq67C/0Xch14Mmh6fI/ji3shZh3fKW+TxUPJC8NoMERT+BAhZ
 +TAQ/h64t5uD1dVRk+ZBik6Sb5bt5scm0EJ9hWwkHHhA7yNGCgWqguYo7E3ZeLK/pF1L
 yemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CPYxlgCVaE7nzaX4H41USC5VWvqB07xTjuetGSjKU6w=;
 b=ZAmeuOKy6hF60x5l5pBcz+0thooBftsJJmzQyGHBSg5wMNDpq18LOMFQUUDmuU2mPh
 2wT+mnNDd3fhZIaog3+R/umFI2TiJd3lM2hrvWOLWGwqNN4vQEeWyALzpvJaM7z0syBJ
 i6DGMUzDs0cu1bkNVt3L06yDaDPBg6V6J2QkpnuCr/i2boRVESBp1XPvUgYGw92VRRUA
 NmVytyQ30k9GRZmAVGsHiSCazeZEj8C0yBA3+0+XLNzYge5Hp+r7dVtkJDGDWUEeweKS
 m2uPdnDeBrFQog2H/uwAKTwVw6VCDOGzoTja143CqWtitAQ1UudlXz4WYTIoNQqa7Nxs
 eN5g==
X-Gm-Message-State: ANoB5pkM/p2IbaE+i1j9N4QR6GcAaf1EcUSaO6LJS5wOwmc57eUBb6Vk
 YcVC9EWTHdOPLmTSUOYNfZmJq85rT+LMWe7c
X-Google-Smtp-Source: AA0mqf7d6tmA8ZvwDs3iiN/XDQ/dHkBHneA/1EVVa/ds6+pcG5FEgR5o5Wqbh7tXsKojScYA0/36Cg==
X-Received: by 2002:a65:590b:0:b0:462:8605:7fe7 with SMTP id
 f11-20020a65590b000000b0046286057fe7mr612271pgu.445.1668152543485; 
 Thu, 10 Nov 2022 23:42:23 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b001754fa42065sm976069plg.143.2022.11.10.23.42.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 23:42:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 v3 33/45] tcg: Add TCG_CALL_{RET,ARG}_BY_REF
Date: Fri, 11 Nov 2022 17:40:49 +1000
Message-Id: <20221111074101.2069454-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111074101.2069454-1-richard.henderson@linaro.org>
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
index c276cc87ee..b61551913b 100644
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
@@ -661,6 +660,38 @@ static void layout_arg_normal_n(TCGCumulativeArgs *cum,
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
@@ -696,6 +727,14 @@ static void init_call_layout(TCGHelperInfo *info)
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
@@ -757,6 +796,9 @@ static void init_call_layout(TCGHelperInfo *info)
             case TCG_CALL_ARG_NORMAL:
                 layout_arg_normal_n(&cum, info, 128 / TCG_TARGET_REG_BITS);
                 break;
+            case TCG_CALL_ARG_BY_REF:
+                layout_arg_by_ref(&cum, info);
+                break;
             default:
                 qemu_build_not_reached();
             }
@@ -771,7 +813,39 @@ static void init_call_layout(TCGHelperInfo *info)
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
@@ -1697,6 +1771,8 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
 
         switch (loc->kind) {
         case TCG_CALL_ARG_NORMAL:
+        case TCG_CALL_ARG_BY_REF:
+        case TCG_CALL_ARG_BY_REF_N:
             op->args[pi++] = temp_arg(ts);
             break;
 
@@ -4398,6 +4474,27 @@ static void load_arg_normal(TCGContext *s, const TCGCallArgumentLoc *l,
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
@@ -4421,6 +4518,16 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
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
@@ -4452,6 +4559,19 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
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
             s->reg_to_temp[reg] = ts;
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


