Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC11560710B
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 09:30:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmU3-0003HD-Ni
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:30:23 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmI0-0003P1-5L
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:17:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmHe-0003JC-ND
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:17:39 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmHc-0005qM-Ni
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:17:34 -0400
Received: by mail-pg1-x52c.google.com with SMTP id r18so1779661pgr.12
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QmH6UfzNb2W5B+qTcQwkyCbKbOPU702ATit26UV60EY=;
 b=ki9emwlVEZUCD573+rG9GBqYzDqWR1fX5n/GrKUsgfeKd7a0X/+NgeEpI0GijnJS2B
 tqmzoqx3oak54aomDijbRvrfnMKEzfMzu5WOiRcQxLPIMwvhmYkR534c3+lKPPtM+8F8
 m9fKqFP95uoaV1m43yG4j5VzJoRmCD9vqRJfsGEPll4g3XrvLAL5ACpY5ztZf6TfGIjI
 nL1X2YgEQNqHCh5P0QLOLH8ivuV2iAP5AoEHUVJLtqA5Q57jmj5Pgd0bwsYbTiQFdmZh
 MKHi1U5lS0aHasDCNpAWqHE558uMjhrW/19ILQsoVjzcqHrbDioUUTYxeNhOpXZsJrMr
 /2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QmH6UfzNb2W5B+qTcQwkyCbKbOPU702ATit26UV60EY=;
 b=2pjDR3MWnPDdLuqyYKssSR9BiT4IXNHx8G8AcY9uVrrKnGASNuRzIErkf1TR7it3y8
 WAMzJeKt5mZAuBFFjTk0JVp0U5Zd2lCT7cfg8eKBroI7B6gQffyK8g0HU5OLHRMOghG4
 1QgGLJfc0zwaUjeEnzMZE9Tcw+QihNAPI08dxCZX1HVpdW3EsNgX+Ag+Y90EDWooifvI
 CldkvHDZFLt4OTxtUpu7IaFJsMto/PCMBE3H+O5yQsnQhnpPt/MI4gIusOYi2x2Hc2ph
 0MHO8wYzra8L+q1HPToUYdpWuwlWs2zbx5B+394hfH6Xm4+IAZbROJ4/xMFWcEVgIUqZ
 vDAQ==
X-Gm-Message-State: ACrzQf2LlO5/vbNEaD1L+c9TD6Zg3HU6rCgYGDYPOTv7mU3O5sJrRls0
 UQVPDjhIqay4uXcToE0Skpo3Z+1fpp/f3jRm
X-Google-Smtp-Source: AMsMyM6gLhf/RCqrBT/GuwfUArs6jH21eGEE/ws4fvTr2YOAGEsGd9MR+fs4BJdJP7LPn3jyoQs7YQ==
X-Received: by 2002:a05:6a00:170a:b0:563:a40a:b5e1 with SMTP id
 h10-20020a056a00170a00b00563a40ab5e1mr17849748pfc.40.1666336651063; 
 Fri, 21 Oct 2022 00:17:31 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a638c49000000b0041cd5ddde6fsm13003327pgn.76.2022.10.21.00.17.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:17:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 24/36] tcg: Add TCG_CALL_{RET,ARG}_NORMAL_4
Date: Fri, 21 Oct 2022 17:15:37 +1000
Message-Id: <20221021071549.2398137-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021071549.2398137-1-richard.henderson@linaro.org>
References: <20221021071549.2398137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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

These will be used by some 32-bit hosts to pass and return i128.
Not yet used, because allocation is not yet enabled.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-internal.h |   2 +
 tcg/tcg.c          | 127 ++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 128 insertions(+), 1 deletion(-)

diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index 696dc66ada..7d4f7049be 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -36,6 +36,7 @@
  */
 typedef enum {
     TCG_CALL_RET_NORMAL,         /* by registers */
+    TCG_CALL_RET_NORMAL_4,       /* for i128, by 4 registers */
 } TCGCallReturnKind;
 
 typedef enum {
@@ -44,6 +45,7 @@ typedef enum {
     TCG_CALL_ARG_EXTEND,         /* for i32, as a sign/zero-extended i64 */
     TCG_CALL_ARG_EXTEND_U,       /*      ... as a zero-extended i64 */
     TCG_CALL_ARG_EXTEND_S,       /*      ... as a sign-extended i64 */
+    TCG_CALL_ARG_NORMAL_4,       /* for i128, like normal with 4 slots */
 } TCGCallArgumentKind;
 
 typedef struct TCGCallArgumentLoc {
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 082482341b..fdafb30579 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -658,6 +658,30 @@ static void layout_arg_normal_2(TCGCumulativeArgs *cum, TCGHelperInfo *info)
     loc[1].tmp_subindex = 1;
 }
 
+static void layout_arg_normal_4(TCGCumulativeArgs *cum, TCGHelperInfo *info)
+{
+    TCGCallArgumentLoc *loc = &info->in[cum->info_in_idx];
+    int reg_n = MIN(4, cum->max_reg_slot - cum->reg_slot);
+
+    *loc = (TCGCallArgumentLoc){
+        .kind = TCG_CALL_ARG_NORMAL_4,
+        .arg_idx = cum->arg_idx,
+    };
+
+    if (reg_n > 0) {
+        loc->reg_slot = cum->reg_slot;
+        loc->reg_n = reg_n;
+        cum->reg_slot += reg_n;
+    }
+    if (reg_n < 4) {
+        loc->stk_slot = cum->stk_slot;
+        cum->stk_slot += 4 - reg_n;
+    }
+
+    cum->info_in_idx++;
+    cum->op_arg_idx++;
+}
+
 static void init_call_layout(TCGHelperInfo *info)
 {
     unsigned typemask = info->typemask;
@@ -686,10 +710,29 @@ static void init_call_layout(TCGHelperInfo *info)
         info->nr_out = 64 / TCG_TARGET_REG_BITS;
         info->out_kind = TCG_CALL_RET_NORMAL;
         break;
+    case dh_typecode_i128:
+        /*
+         * No matter the call return method, we must have all of
+         * the temp subindexes in the call for liveness.
+         */
+        info->nr_out = TCG_TARGET_REG_BITS == 32 ? 1 : 2;
+        info->out_kind = TCG_CALL_RET_NORMAL; /* TODO */
+        switch (/* TODO */ TCG_CALL_RET_NORMAL) {
+        case TCG_CALL_RET_NORMAL:
+            if (TCG_TARGET_REG_BITS == 32) {
+                assert(ARRAY_SIZE(tcg_target_call_oarg_regs) >= 4);
+                info->out_kind = TCG_CALL_RET_NORMAL_4;
+            } else {
+                assert(ARRAY_SIZE(tcg_target_call_oarg_regs) >= 2);
+            }
+            break;
+        default:
+            g_assert_not_reached();
+        }
+        break;
     default:
         g_assert_not_reached();
     }
-    assert(info->nr_out <= ARRAY_SIZE(tcg_target_call_oarg_regs));
 
     /*
      * The final two op->arg[] indexes are used for func & info.
@@ -745,6 +788,13 @@ static void init_call_layout(TCGHelperInfo *info)
                     layout_arg_1(&cum, info, TCG_CALL_ARG_NORMAL);
                 }
                 break;
+            case TCG_TYPE_I128:
+                if (TCG_TARGET_REG_BITS == 32) {
+                    layout_arg_normal_4(&cum, info);
+                } else {
+                    layout_arg_normal_2(&cum, info);
+                }
+                break;
             default:
                 g_assert_not_reached();
             }
@@ -1687,6 +1737,7 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
 
         switch (loc->kind) {
         case TCG_CALL_ARG_NORMAL:
+        case TCG_CALL_ARG_NORMAL_4:
             op->args[pi++] = temp_arg(ts);
             break;
 
@@ -4301,6 +4352,41 @@ static bool tcg_reg_alloc_dup2(TCGContext *s, const TCGOp *op)
     return true;
 }
 
+static void copy_to_stk_i128(TCGContext *s, int stk_slot, TCGTemp *ts,
+                             int slot, TCGRegSet allocated_regs)
+{
+    int stk_off = TCG_TARGET_CALL_STACK_OFFSET
+                + stk_slot * sizeof(tcg_target_long);
+
+    if (TCG_TARGET_REG_BITS == 32) {
+        TCGReg scratch;
+
+        tcg_debug_assert(ts->type == TCG_TYPE_I128);
+        tcg_debug_assert(ts->val_type == TEMP_VAL_MEM);
+        tcg_debug_assert(ts->mem_allocated);
+
+        scratch = tcg_reg_alloc(s, tcg_target_available_regs[TCG_TYPE_I32],
+                                allocated_regs, 0, false);
+
+        for (; slot < 4; slot++) {
+            tcg_out_ld(s, TCG_TYPE_I32, scratch,
+                       ts->mem_base->reg, ts->mem_offset + slot * 4);
+            tcg_out_st(s, TCG_TYPE_I32, scratch,
+                       TCG_REG_CALL_STACK, stk_off + slot * 4);
+        }
+    } else {
+        tcg_debug_assert(ts->base_type == TCG_TYPE_I128);
+        tcg_debug_assert(ts->temp_subindex == 0);
+
+        for (; slot < 2; slot++) {
+            temp_load(s, &ts[slot], tcg_target_available_regs[TCG_TYPE_I64],
+                      allocated_regs, 0);
+            tcg_out_st(s, TCG_TYPE_I64, ts[slot].reg,
+                       TCG_REG_CALL_STACK, stk_off + slot * 8);
+        }
+    }
+}
+
 static void load_arg_normal_1(TCGContext *s, const TCGCallArgumentLoc *loc,
                               TCGTemp *ts, TCGRegSet *allocated_regs)
 {
@@ -4346,6 +4432,24 @@ static void load_arg_normal_1(TCGContext *s, const TCGCallArgumentLoc *loc,
     tcg_regset_set_reg(*allocated_regs, reg);
 }
 
+static void load_arg_normal_4(TCGContext *s, const TCGCallArgumentLoc *loc,
+                              TCGTemp *ts, TCGRegSet *allocated_regs)
+{
+    int reg_n = loc->reg_n;
+
+    if (reg_n != 4) {
+        copy_to_stk_i128(s, loc->stk_slot, ts, reg_n, *allocated_regs);
+    }
+
+    for (reg_n--; reg_n >= 0; reg_n--) {
+        TCGReg reg = tcg_target_call_iarg_regs[loc->reg_slot + reg_n];
+
+        tcg_out_ld(s, TCG_TYPE_I32, reg,
+                   ts->mem_base->reg, ts->mem_offset + reg_n * 4);
+        tcg_regset_set_reg(*allocated_regs, reg);
+    }
+}
+
 static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
 {
     const int nb_oargs = TCGOP_CALLO(op);
@@ -4369,6 +4473,9 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
         case TCG_CALL_ARG_EXTEND_S:
             load_arg_normal_1(s, loc, ts, &allocated_regs);
             break;
+        case TCG_CALL_ARG_NORMAL_4:
+            load_arg_normal_4(s, loc, ts, &allocated_regs);
+            break;
         default:
             g_assert_not_reached();
         }
@@ -4422,6 +4529,24 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
             s->reg_to_temp[reg] = ts;
         }
         break;
+
+    case TCG_CALL_RET_NORMAL_4:
+        tcg_debug_assert(TCG_TARGET_REG_BITS == 32);
+        {
+            TCGTemp *ts = arg_temp(op->args[0]);
+
+            tcg_debug_assert(ts->type == TCG_TYPE_I128);
+            if (!ts->mem_allocated) {
+                temp_allocate_frame(s, ts);
+            }
+            for (i = 0; i < 4; i++) {
+                tcg_out_st(s, TCG_TYPE_I32, tcg_target_call_oarg_regs[i],
+                           ts->mem_base->reg, ts->mem_offset + i * 4);
+            }
+            ts->val_type = TEMP_VAL_MEM;
+        }
+        break;
+
     default:
         g_assert_not_reached();
     }
-- 
2.34.1


