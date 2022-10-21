Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 233E9607131
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 09:33:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmXR-0006iJ-6L
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:33:53 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmHo-0003Mi-8k
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmHV-0003Fq-QA
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:17:29 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmHR-0005or-Pe
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:17:25 -0400
Received: by mail-pf1-x431.google.com with SMTP id g28so1793335pfk.8
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=V4SUZjAaozp75Gu5oXBaKguhljd88jPKuaDdX4HiKKo=;
 b=A2gVn0UUjyf4L9D9IFFi89P0EKyAgui2gLM7FpClHnTraeOvuDSj0IcT1DZ53u7GRU
 eYQt66cPXXDbCUYtLeYaA2G5CYdIgi0C68trD32xZSZRfVXwuY5QOHvreE2DbzpbOQBC
 ysFv+MtS7t3yJYiD+g2FFOuDyXmnvu3dVgJLK83XVjJ8E7LskFNGTS0rmk26XXoPeSCG
 uiKV/SSywuXxddHuF2idtVI65p8QSue9JwTIySm23vxMYBeMaCZ5b0h8bYQymk5pZhGo
 hCFilJMLqoELD5vUqugrV5nWtHcQ4tLMNaW+YVeCA4b5nZ2/F0NYD2CJ/75LGPxywC4f
 R11Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V4SUZjAaozp75Gu5oXBaKguhljd88jPKuaDdX4HiKKo=;
 b=BlzFsZhHKLpEqCR4VX4J092jO5jH+oAraHjVoAzP4+UBbo4lctpmxx2ReVwWd9UN2O
 CMJveGnR0sMJBQ0XH/pr2SAzQn5Vx8N4xmwMOuq2A6QfSmIX0hOlLYfjlxVY0klMOjWd
 GlsA8i3woTfEjdENGeDVUYvz7aAq72rHPtsQh3fTM1bgQ+q/h3YcJuUzyZ7JRQZ42zqi
 h04a/hIzh3D2q0wdjYhIY5VOrz+IQYBQ0dpYck1XpDKkZYZe6pvCIMmnvXhNA7tBLqQg
 v1pRpSYXWE3/p9C89Wa3Of2yVdhI2ZsWFvC+fKXpHzCpxNvpM6/msrebXPSKRlQVmpGj
 gA+w==
X-Gm-Message-State: ACrzQf01jxOzjhUoyjxcs41Bsj3Od469/3K3ClRu3OGFQYdaFqggHq1R
 4Sb7Sifh8B4ROqE53kNzlr1zgO65mPcEJ6k7
X-Google-Smtp-Source: AMsMyM5xWHWPGMKEZJYKgUtTJ2jZ4SUlswoNwGTyUpOUuSWGNXF4E9VJ1J7aTW7QgRqZp9IF0tNaaQ==
X-Received: by 2002:a05:6a00:1912:b0:564:f6be:11fd with SMTP id
 y18-20020a056a00191200b00564f6be11fdmr17554438pfi.32.1666336639968; 
 Fri, 21 Oct 2022 00:17:19 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a638c49000000b0041cd5ddde6fsm13003327pgn.76.2022.10.21.00.17.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:17:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/36] tcg: Reorg function calls
Date: Fri, 21 Oct 2022 17:15:33 +1000
Message-Id: <20221021071549.2398137-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021071549.2398137-1-richard.henderson@linaro.org>
References: <20221021071549.2398137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

Pre-compute the function call layout for each helper at startup.
Drop TCG_CALL_DUMMY_ARG, as we no longer need to leave gaps
in the op->args[] array.

For tcg_gen_callN, loop over the arguments once.  Allocate the TCGOp
for the call early but delay emitting it, collecting arguments first.
This allows the argument processing loop to emit code for extensions
and have them sequenced before the call.  Free the temporaries for
extensions immediately.

For tcg_reg_alloc_call, loop over the arguments in reverse order,
which allows stack slots to be filled first naturally.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h  |   3 -
 tcg/tcg-internal.h |  17 +-
 tcg/tcg.c          | 591 +++++++++++++++++++++++++++------------------
 3 files changed, 377 insertions(+), 234 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 8bcd60d0ed..8d0626c797 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -425,9 +425,6 @@ typedef TCGv_ptr TCGv_env;
 #define TCG_CALL_NO_RWG_SE      (TCG_CALL_NO_RWG | TCG_CALL_NO_SE)
 #define TCG_CALL_NO_WG_SE       (TCG_CALL_NO_WG | TCG_CALL_NO_SE)
 
-/* Used to align parameters.  See the comment before tcgv_i32_temp.  */
-#define TCG_CALL_DUMMY_ARG      ((TCGArg)0)
-
 /*
  * Flags for the bswap opcodes.
  * If IZ, the input is zero-extended, otherwise unknown.
diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index f574743ff8..097fef2325 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -42,11 +42,24 @@ typedef enum {
     TCG_CALL_ARG_EXTEND_S,       /*      ... as a sign-extended i64 */
 } TCGCallArgumentKind;
 
+typedef struct TCGCallArgumentLoc {
+    TCGCallArgumentKind kind    : 8;
+    unsigned reg_slot           : 8;
+    unsigned stk_slot           : 8;
+    unsigned reg_n              : 2;
+    unsigned arg_idx            : 4;
+    unsigned tmp_subindex       : 1;
+} TCGCallArgumentLoc;
+
 typedef struct TCGHelperInfo {
     void *func;
     const char *name;
-    unsigned flags;
-    unsigned typemask;
+    unsigned typemask           : 32;
+    unsigned flags              : 8;
+    unsigned nr_in              : 8;
+    unsigned nr_out             : 8;
+    TCGCallReturnKind out_kind  : 8;
+    TCGCallArgumentLoc in[MAX_OPC_PARAM_IARGS * MAX_OPC_PARAM_PER_ARG];
 } TCGHelperInfo;
 
 extern TCGContext tcg_init_ctx;
diff --git a/tcg/tcg.c b/tcg/tcg.c
index e0f5c6ea7b..713e692621 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -546,7 +546,7 @@ void tcg_pool_reset(TCGContext *s)
 
 #include "exec/helper-proto.h"
 
-static const TCGHelperInfo all_helpers[] = {
+static TCGHelperInfo all_helpers[] = {
 #include "exec/helper-tcg.h"
 };
 static GHashTable *helper_table;
@@ -564,6 +564,162 @@ static ffi_type * const typecode_to_ffi[8] = {
 };
 #endif
 
+typedef struct TCGCumulativeArgs {
+    int arg_idx;                /* tcg_gen_callN args[] */
+    int op_arg_idx;             /* TCGOp op->args[] */
+    int info_in_idx;            /* TCGHelperInfo in[] */
+    int reg_slot;               /* tcg_target_call_iarg_regs[] */
+    int stk_slot;               /* TCG_TARGET_CALL_STACK_OFFSET + i*word */
+    int max_reg_slot;
+    int max_stk_slot;
+} TCGCumulativeArgs;
+
+static void layout_arg_1(TCGCumulativeArgs *cum, TCGHelperInfo *info,
+                         TCGCallArgumentKind kind)
+{
+    TCGCallArgumentLoc *loc = &info->in[cum->info_in_idx];
+
+    *loc = (TCGCallArgumentLoc){
+        .kind = kind,
+        .arg_idx = cum->arg_idx,
+    };
+
+    if (cum->reg_slot < cum->max_reg_slot) {
+        loc->reg_slot = cum->reg_slot++;
+        loc->reg_n = 1;
+    } else {
+        loc->stk_slot = cum->stk_slot++;
+    }
+
+    cum->info_in_idx++;
+    cum->op_arg_idx++;
+}
+
+static void layout_arg_normal_2(TCGCumulativeArgs *cum, TCGHelperInfo *info)
+{
+    TCGCallArgumentLoc *loc = &info->in[cum->info_in_idx];
+
+    /* Layout the pair using the same arg_idx... */
+    layout_arg_1(cum, info, TCG_CALL_ARG_NORMAL);
+    layout_arg_1(cum, info, TCG_CALL_ARG_NORMAL);
+
+    /* ... then adjust the second loc to the second subindex. */
+    loc[1].tmp_subindex = 1;
+}
+
+static void init_call_layout(TCGHelperInfo *info)
+{
+    unsigned typemask = info->typemask;
+    unsigned typecode;
+    TCGCumulativeArgs cum = {
+        .max_reg_slot = ARRAY_SIZE(tcg_target_call_iarg_regs),
+        .max_stk_slot = TCG_STATIC_CALL_ARGS_SIZE / sizeof(tcg_target_long),
+    };
+
+    /*
+     * Parse and place any function return value.
+     */
+    typecode = typemask & 7;
+    switch (typecode) {
+    case dh_typecode_void:
+        info->nr_out = 0;
+        break;
+    case dh_typecode_i32:
+    case dh_typecode_s32:
+    case dh_typecode_ptr:
+        info->nr_out = 1;
+        info->out_kind = TCG_CALL_RET_NORMAL;
+        break;
+    case dh_typecode_i64:
+    case dh_typecode_s64:
+        info->nr_out = 64 / TCG_TARGET_REG_BITS;
+        info->out_kind = TCG_CALL_RET_NORMAL;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    assert(info->nr_out <= ARRAY_SIZE(tcg_target_call_oarg_regs));
+
+    /*
+     * The final two op->arg[] indexes are used for func & info.
+     * Account for that now to simplify the test below.
+     */
+    cum.op_arg_idx = info->nr_out + 2;
+
+    /*
+     * Parse and place function arguments.
+     */
+    for (typemask >>= 3; typemask; typemask >>= 3, cum.arg_idx++) {
+        TCGCallArgumentKind kind;
+        TCGType type;
+
+        typecode = typemask & 7;
+        switch (typecode) {
+        case dh_typecode_i32:
+        case dh_typecode_s32:
+            type = TCG_TYPE_I32;
+            kind = TCG_TARGET_CALL_ARG_I32;
+            break;
+        case dh_typecode_i64:
+        case dh_typecode_s64:
+            type = TCG_TYPE_I64;
+            kind = TCG_TARGET_CALL_ARG_I64;
+            break;
+        case dh_typecode_ptr:
+            type = TCG_TYPE_PTR;
+            kind = TCG_CALL_ARG_NORMAL;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+
+        switch (kind) {
+        case TCG_CALL_ARG_EVEN:
+            tcg_debug_assert(cum.max_reg_slot % 2 == 0);
+            if (cum.reg_slot < cum.max_reg_slot) {
+                cum.reg_slot += cum.reg_slot & 1;
+            } else {
+                cum.stk_slot += cum.stk_slot & 1;
+            }
+            /* fall through */
+        case TCG_CALL_ARG_NORMAL:
+            switch (type) {
+            case TCG_TYPE_I32:
+                layout_arg_1(&cum, info, TCG_CALL_ARG_NORMAL);
+                break;
+            case TCG_TYPE_I64:
+                if (TCG_TARGET_REG_BITS == 32) {
+                    layout_arg_normal_2(&cum, info);
+                } else {
+                    layout_arg_1(&cum, info, TCG_CALL_ARG_NORMAL);
+                }
+                break;
+            default:
+                g_assert_not_reached();
+            }
+            break;
+        case TCG_CALL_ARG_EXTEND:
+            kind = TCG_CALL_ARG_EXTEND_U + (typecode & 1);
+            /* fall through */
+        case TCG_CALL_ARG_EXTEND_U:
+        case TCG_CALL_ARG_EXTEND_S:
+            assert(type == TCG_TYPE_I32);
+            layout_arg_1(&cum, info, kind);
+            break;
+        default:
+            g_assert_not_reached();
+        }
+    }
+    info->nr_in = cum.info_in_idx;
+
+    /* Validate that we didn't overrun the input array. */
+    assert(cum.info_in_idx <= ARRAY_SIZE(info->in));
+    /* Validate that we didn't overrun the output array. */
+    assert(cum.op_arg_idx <= MAX_OPC_PARAM);
+    /* Validate the backend has preallocated enough space on stack. */
+    assert(cum.stk_slot <= cum.max_stk_slot);
+}
+
 static int indirect_reg_alloc_order[ARRAY_SIZE(tcg_target_reg_alloc_order)];
 static void process_op_defs(TCGContext *s);
 static TCGTemp *tcg_global_reg_new_internal(TCGContext *s, TCGType type,
@@ -603,6 +759,7 @@ static void tcg_context_init(unsigned max_cpus)
     helper_table = g_hash_table_new(NULL, NULL);
 
     for (i = 0; i < ARRAY_SIZE(all_helpers); ++i) {
+        init_call_layout(&all_helpers[i]);
         g_hash_table_insert(helper_table, (gpointer)all_helpers[i].func,
                             (gpointer)&all_helpers[i]);
     }
@@ -1473,18 +1630,15 @@ bool tcg_op_supported(TCGOpcode op)
     }
 }
 
-/* Note: we convert the 64 bit args to 32 bit and do some alignment
-   and endian swap. Maybe it would be better to do the alignment
-   and endian swap in tcg_reg_alloc_call(). */
+static TCGOp *tcg_op_alloc(TCGOpcode opc);
+
 void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
 {
-    int i, real_args, nb_rets, pi;
-    unsigned typemask;
+    TCGOp *op = tcg_op_alloc(INDEX_op_call);
     const TCGHelperInfo *info;
-    TCGOp *op;
+    int i, n, pi = 0;
 
     info = g_hash_table_lookup(helper_table, (gpointer)func);
-    typemask = info->typemask;
 
 #ifdef CONFIG_PLUGIN
     /* detect non-plugin helpers */
@@ -1493,106 +1647,59 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
     }
 #endif
 
-    if (TCG_TARGET_CALL_ARG_I32 == TCG_CALL_ARG_EXTEND) {
-        for (i = 0; i < nargs; ++i) {
-            int argtype = extract32(typemask, (i + 1) * 3, 3);
-            bool is_32bit = (argtype & ~1) == dh_typecode_i32;
-            bool is_signed = argtype & 1;
+    TCGOP_CALLO(op) = n = info->nr_out;
+    switch (n) {
+    case 0:
+        tcg_debug_assert(ret == NULL);
+        break;
+    case 1:
+        tcg_debug_assert(ret != NULL);
+        op->args[pi++] = temp_arg(ret);
+        break;
+    case 2:
+        tcg_debug_assert(ret != NULL);
+        tcg_debug_assert(ret->temp_subindex == 0);
+        op->args[pi++] = temp_arg(ret);
+        op->args[pi++] = temp_arg(ret + 1);
+        break;
+    default:
+        g_assert_not_reached();
+    }
 
-            if (is_32bit) {
+    TCGOP_CALLI(op) = n = info->nr_in;
+    for (i = 0; i < n; i++) {
+        const TCGCallArgumentLoc *loc = &info->in[i];
+        TCGTemp *ts = args[loc->arg_idx] + loc->tmp_subindex;
+
+        switch (loc->kind) {
+        case TCG_CALL_ARG_NORMAL:
+            op->args[pi++] = temp_arg(ts);
+            break;
+
+        case TCG_CALL_ARG_EXTEND_U:
+        case TCG_CALL_ARG_EXTEND_S:
+            {
                 TCGv_i64 temp = tcg_temp_new_i64();
-                TCGv_i32 orig = temp_tcgv_i32(args[i]);
-                if (is_signed) {
+                TCGv_i32 orig = temp_tcgv_i32(ts);
+
+                if (loc->kind == TCG_CALL_ARG_EXTEND_S) {
                     tcg_gen_ext_i32_i64(temp, orig);
                 } else {
                     tcg_gen_extu_i32_i64(temp, orig);
                 }
-                args[i] = tcgv_i64_temp(temp);
+                op->args[pi++] = tcgv_i64_arg(temp);
+                tcg_temp_free_i64(temp);
             }
-        }
-    }
-
-    op = tcg_emit_op(INDEX_op_call);
-
-    pi = 0;
-    if (ret != NULL) {
-        if (TCG_TARGET_REG_BITS < 64 && (typemask & 6) == dh_typecode_i64) {
-            op->args[pi++] = temp_arg(ret);
-            op->args[pi++] = temp_arg(ret + 1);
-            nb_rets = 2;
-        } else {
-            op->args[pi++] = temp_arg(ret);
-            nb_rets = 1;
-        }
-    } else {
-        nb_rets = 0;
-    }
-    TCGOP_CALLO(op) = nb_rets;
-
-    real_args = 0;
-    for (i = 0; i < nargs; i++) {
-        int argtype = extract32(typemask, (i + 1) * 3, 3);
-        TCGCallArgumentKind kind;
-        TCGType type;
-
-        switch (argtype) {
-        case dh_typecode_i32:
-        case dh_typecode_s32:
-            type = TCG_TYPE_I32;
-            kind = TCG_TARGET_CALL_ARG_I32;
             break;
-        case dh_typecode_i64:
-        case dh_typecode_s64:
-            type = TCG_TYPE_I64;
-            kind = TCG_TARGET_CALL_ARG_I64;
-            break;
-        case dh_typecode_ptr:
-            type = TCG_TYPE_PTR;
-            kind = TCG_CALL_ARG_NORMAL;
-            break;
-        default:
-            g_assert_not_reached();
-        }
 
-        switch (kind) {
-        case TCG_CALL_ARG_EVEN:
-            if (real_args & 1) {
-                op->args[pi++] = TCG_CALL_DUMMY_ARG;
-                real_args++;
-            }
-            /* fall through */
-        case TCG_CALL_ARG_NORMAL:
-            if (TCG_TARGET_REG_BITS == 32 && type == TCG_TYPE_I64) {
-                op->args[pi++] = temp_arg(args[i]);
-                op->args[pi++] = temp_arg(args[i] + 1);
-                real_args += 2;
-                break;
-            }
-            op->args[pi++] = temp_arg(args[i]);
-            real_args++;
-            break;
         default:
             g_assert_not_reached();
         }
     }
     op->args[pi++] = (uintptr_t)func;
     op->args[pi++] = (uintptr_t)info;
-    TCGOP_CALLI(op) = real_args;
 
-    /* Make sure the fields didn't overflow.  */
-    tcg_debug_assert(TCGOP_CALLI(op) == real_args);
-    tcg_debug_assert(pi <= ARRAY_SIZE(op->args));
-
-    if (TCG_TARGET_CALL_ARG_I32 == TCG_CALL_ARG_EXTEND) {
-        for (i = 0; i < nargs; ++i) {
-            int argtype = extract32(typemask, (i + 1) * 3, 3);
-            bool is_32bit = (argtype & ~1) == dh_typecode_i32;
-
-            if (is_32bit) {
-                tcg_temp_free_internal(args[i]);
-            }
-        }
-    }
+    QTAILQ_INSERT_TAIL(&tcg_ctx->ops, op, link);
 }
 
 static void tcg_reg_alloc_start(TCGContext *s)
@@ -1807,10 +1914,7 @@ static void tcg_dump_ops(TCGContext *s, FILE *f, bool have_prefs)
             }
             for (i = 0; i < nb_iargs; i++) {
                 TCGArg arg = op->args[nb_oargs + i];
-                const char *t = "<dummy>";
-                if (arg != TCG_CALL_DUMMY_ARG) {
-                    t = tcg_get_arg_str(s, buf, sizeof(buf), arg);
-                }
+                const char *t = tcg_get_arg_str(s, buf, sizeof(buf), arg);
                 col += ne_fprintf(f, ",%s", t);
             }
         } else {
@@ -2576,12 +2680,11 @@ static void liveness_pass_1(TCGContext *s)
         switch (opc) {
         case INDEX_op_call:
             {
-                int call_flags;
-                int nb_call_regs;
+                const TCGHelperInfo *info = tcg_call_info(op);
+                int call_flags = tcg_call_flags(op);
 
                 nb_oargs = TCGOP_CALLO(op);
                 nb_iargs = TCGOP_CALLI(op);
-                call_flags = tcg_call_flags(op);
 
                 /* pure functions can be removed if their result is unused */
                 if (call_flags & TCG_CALL_NO_SIDE_EFFECTS) {
@@ -2621,7 +2724,7 @@ static void liveness_pass_1(TCGContext *s)
                 /* Record arguments that die in this helper.  */
                 for (i = nb_oargs; i < nb_iargs + nb_oargs; i++) {
                     ts = arg_temp(op->args[i]);
-                    if (ts && ts->state & TS_DEAD) {
+                    if (ts->state & TS_DEAD) {
                         arg_life |= DEAD_ARG << i;
                     }
                 }
@@ -2629,31 +2732,59 @@ static void liveness_pass_1(TCGContext *s)
                 /* For all live registers, remove call-clobbered prefs.  */
                 la_cross_call(s, nb_temps);
 
-                nb_call_regs = ARRAY_SIZE(tcg_target_call_iarg_regs);
+                /*
+                 * Input arguments are live for preceding opcodes.
+                 *
+                 * For those arguments that die, and will be allocated in
+                 * registers, clear the register set for that arg, to be
+                 * filled in below.  For args that will be on the stack,
+                 * reset to any available reg.  Process arguments in reverse
+                 * order so that if a temp is used more than once, the stack
+                 * reset to max happens before the register reset to 0.
+                 */
+                for (i = nb_iargs - 1; i >= 0; i--) {
+                    const TCGCallArgumentLoc *loc = &info->in[i];
+                    ts = arg_temp(op->args[nb_oargs + i]);
 
-                /* Input arguments are live for preceding opcodes.  */
-                for (i = 0; i < nb_iargs; i++) {
-                    ts = arg_temp(op->args[i + nb_oargs]);
-                    if (ts && ts->state & TS_DEAD) {
-                        /* For those arguments that die, and will be allocated
-                         * in registers, clear the register set for that arg,
-                         * to be filled in below.  For args that will be on
-                         * the stack, reset to any available reg.
-                         */
-                        *la_temp_pref(ts)
-                            = (i < nb_call_regs ? 0 :
-                               tcg_target_available_regs[ts->type]);
+                    if (ts->state & TS_DEAD) {
+                        switch (loc->kind) {
+                        case TCG_CALL_ARG_NORMAL:
+                        case TCG_CALL_ARG_EXTEND_U:
+                        case TCG_CALL_ARG_EXTEND_S:
+                            if (loc->reg_n) {
+                                *la_temp_pref(ts) = 0;
+                                break;
+                            }
+                            /* fall through */
+                        default:
+                            *la_temp_pref(ts) =
+                                tcg_target_available_regs[ts->type];
+                            break;
+                        }
                         ts->state &= ~TS_DEAD;
                     }
                 }
 
-                /* For each input argument, add its input register to prefs.
-                   If a temp is used once, this produces a single set bit.  */
-                for (i = 0; i < MIN(nb_call_regs, nb_iargs); i++) {
-                    ts = arg_temp(op->args[i + nb_oargs]);
-                    if (ts) {
-                        tcg_regset_set_reg(*la_temp_pref(ts),
-                                           tcg_target_call_iarg_regs[i]);
+                /*
+                 * For each input argument, add its input register to prefs.
+                 * If a temp is used once, this produces a single set bit;
+                 * if a temp is used multiple times, this produces a set.
+                 */
+                for (i = 0; i < nb_iargs; i++) {
+                    const TCGCallArgumentLoc *loc = &info->in[i];
+                    ts = arg_temp(op->args[nb_oargs + i]);
+
+                    switch (loc->kind) {
+                    case TCG_CALL_ARG_NORMAL:
+                    case TCG_CALL_ARG_EXTEND_U:
+                    case TCG_CALL_ARG_EXTEND_S:
+                        if (loc->reg_n) {
+                            tcg_regset_set_reg(*la_temp_pref(ts),
+                                tcg_target_call_iarg_regs[loc->reg_slot]);
+                        }
+                        break;
+                    default:
+                        break;
                     }
                 }
             }
@@ -2922,21 +3053,19 @@ static bool liveness_pass_2(TCGContext *s)
         /* Make sure that input arguments are available.  */
         for (i = nb_oargs; i < nb_iargs + nb_oargs; i++) {
             arg_ts = arg_temp(op->args[i]);
-            if (arg_ts) {
-                dir_ts = arg_ts->state_ptr;
-                if (dir_ts && arg_ts->state == TS_DEAD) {
-                    TCGOpcode lopc = (arg_ts->type == TCG_TYPE_I32
-                                      ? INDEX_op_ld_i32
-                                      : INDEX_op_ld_i64);
-                    TCGOp *lop = tcg_op_insert_before(s, op, lopc);
+            dir_ts = arg_ts->state_ptr;
+            if (dir_ts && arg_ts->state == TS_DEAD) {
+                TCGOpcode lopc = (arg_ts->type == TCG_TYPE_I32
+                                  ? INDEX_op_ld_i32
+                                  : INDEX_op_ld_i64);
+                TCGOp *lop = tcg_op_insert_before(s, op, lopc);
 
-                    lop->args[0] = temp_arg(dir_ts);
-                    lop->args[1] = temp_arg(arg_ts->mem_base);
-                    lop->args[2] = arg_ts->mem_offset;
+                lop->args[0] = temp_arg(dir_ts);
+                lop->args[1] = temp_arg(arg_ts->mem_base);
+                lop->args[2] = arg_ts->mem_offset;
 
-                    /* Loaded, but synced with memory.  */
-                    arg_ts->state = TS_MEM;
-                }
+                /* Loaded, but synced with memory.  */
+                arg_ts->state = TS_MEM;
             }
         }
 
@@ -4158,106 +4287,100 @@ static bool tcg_reg_alloc_dup2(TCGContext *s, const TCGOp *op)
     return true;
 }
 
+static void load_arg_normal_1(TCGContext *s, const TCGCallArgumentLoc *loc,
+                              TCGTemp *ts, TCGRegSet *allocated_regs)
+{
+    TCGReg reg;
+
+    /*
+     * If the destination is on the stack, load up the temp and store.
+     * If there are many call-saved registers, the temp might live to
+     * see another use; otherwise it'll be discarded.
+     */
+    if (!loc->reg_n) {
+        temp_load(s, ts, tcg_target_available_regs[ts->type],
+                  *allocated_regs, 0);
+        tcg_out_st(s, ts->type, ts->reg, TCG_REG_CALL_STACK,
+                   TCG_TARGET_CALL_STACK_OFFSET +
+                   loc->stk_slot * sizeof(tcg_target_long));
+        return;
+    }
+
+    reg = tcg_target_call_iarg_regs[loc->reg_slot];
+
+    if (ts->val_type == TEMP_VAL_REG) {
+        if (ts->reg != reg) {
+            tcg_reg_free(s, reg, *allocated_regs);
+            if (!tcg_out_mov(s, ts->type, reg, ts->reg)) {
+                /*
+                 * Cross register class move not supported.  Sync the
+                 * temp back to its slot and load from there.
+                 */
+                temp_sync(s, ts, *allocated_regs, 0, 0);
+                tcg_out_ld(s, ts->type, reg,
+                           ts->mem_base->reg, ts->mem_offset);
+            }
+        }
+    } else {
+        TCGRegSet arg_set = 0;
+
+        tcg_reg_free(s, reg, *allocated_regs);
+        tcg_regset_set_reg(arg_set, reg);
+        temp_load(s, ts, arg_set, *allocated_regs, 0);
+    }
+
+    tcg_regset_set_reg(*allocated_regs, reg);
+}
+
 static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
 {
     const int nb_oargs = TCGOP_CALLO(op);
     const int nb_iargs = TCGOP_CALLI(op);
     const TCGLifeData arg_life = op->life;
-    const TCGHelperInfo *info;
-    int flags, nb_regs, i;
-    TCGReg reg;
-    TCGArg arg;
-    TCGTemp *ts;
-    intptr_t stack_offset;
-    size_t call_stack_size;
-    tcg_insn_unit *func_addr;
-    int allocate_args;
-    TCGRegSet allocated_regs;
+    const TCGHelperInfo *info = tcg_call_info(op);
+    TCGRegSet allocated_regs = s->reserved_regs;
+    int i;
 
-    func_addr = tcg_call_func(op);
-    info = tcg_call_info(op);
-    flags = info->flags;
+    /*
+     * Move inputs into place in reverse order,
+     * so that we place stacked arguments first.
+     */
+    for (i = nb_iargs - 1; i >= 0; --i) {
+        const TCGCallArgumentLoc *loc = &info->in[i];
+        TCGTemp *ts = arg_temp(op->args[nb_oargs + i]);
 
-    nb_regs = ARRAY_SIZE(tcg_target_call_iarg_regs);
-    if (nb_regs > nb_iargs) {
-        nb_regs = nb_iargs;
-    }
-
-    /* assign stack slots first */
-    call_stack_size = (nb_iargs - nb_regs) * sizeof(tcg_target_long);
-    call_stack_size = (call_stack_size + TCG_TARGET_STACK_ALIGN - 1) & 
-        ~(TCG_TARGET_STACK_ALIGN - 1);
-    allocate_args = (call_stack_size > TCG_STATIC_CALL_ARGS_SIZE);
-    if (allocate_args) {
-        /* XXX: if more than TCG_STATIC_CALL_ARGS_SIZE is needed,
-           preallocate call stack */
-        tcg_abort();
-    }
-
-    stack_offset = TCG_TARGET_CALL_STACK_OFFSET;
-    for (i = nb_regs; i < nb_iargs; i++) {
-        arg = op->args[nb_oargs + i];
-        if (arg != TCG_CALL_DUMMY_ARG) {
-            ts = arg_temp(arg);
-            temp_load(s, ts, tcg_target_available_regs[ts->type],
-                      s->reserved_regs, 0);
-            tcg_out_st(s, ts->type, ts->reg, TCG_REG_CALL_STACK, stack_offset);
-        }
-        stack_offset += sizeof(tcg_target_long);
-    }
-    
-    /* assign input registers */
-    allocated_regs = s->reserved_regs;
-    for (i = 0; i < nb_regs; i++) {
-        arg = op->args[nb_oargs + i];
-        if (arg != TCG_CALL_DUMMY_ARG) {
-            ts = arg_temp(arg);
-            reg = tcg_target_call_iarg_regs[i];
-
-            if (ts->val_type == TEMP_VAL_REG) {
-                if (ts->reg != reg) {
-                    tcg_reg_free(s, reg, allocated_regs);
-                    if (!tcg_out_mov(s, ts->type, reg, ts->reg)) {
-                        /*
-                         * Cross register class move not supported.  Sync the
-                         * temp back to its slot and load from there.
-                         */
-                        temp_sync(s, ts, allocated_regs, 0, 0);
-                        tcg_out_ld(s, ts->type, reg,
-                                   ts->mem_base->reg, ts->mem_offset);
-                    }
-                }
-            } else {
-                TCGRegSet arg_set = 0;
-
-                tcg_reg_free(s, reg, allocated_regs);
-                tcg_regset_set_reg(arg_set, reg);
-                temp_load(s, ts, arg_set, allocated_regs, 0);
-            }
-
-            tcg_regset_set_reg(allocated_regs, reg);
+        switch (loc->kind) {
+        case TCG_CALL_ARG_NORMAL:
+        case TCG_CALL_ARG_EXTEND_U:
+        case TCG_CALL_ARG_EXTEND_S:
+            load_arg_normal_1(s, loc, ts, &allocated_regs);
+            break;
+        default:
+            g_assert_not_reached();
         }
     }
-    
-    /* mark dead temporaries and free the associated registers */
+
+    /* Mark dead temporaries and free the associated registers.  */
     for (i = nb_oargs; i < nb_iargs + nb_oargs; i++) {
         if (IS_DEAD_ARG(i)) {
             temp_dead(s, arg_temp(op->args[i]));
         }
     }
-    
-    /* clobber call registers */
+
+    /* Clobber call registers.  */
     for (i = 0; i < TCG_TARGET_NB_REGS; i++) {
         if (tcg_regset_test_reg(tcg_target_call_clobber_regs, i)) {
             tcg_reg_free(s, i, allocated_regs);
         }
     }
 
-    /* Save globals if they might be written by the helper, sync them if
-       they might be read. */
-    if (flags & TCG_CALL_NO_READ_GLOBALS) {
+    /*
+     * Save globals if they might be written by the helper,
+     * sync them if they might be read.
+     */
+    if (info->flags & TCG_CALL_NO_READ_GLOBALS) {
         /* Nothing to do */
-    } else if (flags & TCG_CALL_NO_WRITE_GLOBALS) {
+    } else if (info->flags & TCG_CALL_NO_WRITE_GLOBALS) {
         sync_globals(s, allocated_regs);
     } else {
         save_globals(s, allocated_regs);
@@ -4268,31 +4391,41 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
         gpointer hash = (gpointer)(uintptr_t)info->typemask;
         ffi_cif *cif = g_hash_table_lookup(ffi_table, hash);
         assert(cif != NULL);
-        tcg_out_call(s, func_addr, cif);
+        tcg_out_call(s, tcg_call_func(op), cif);
     }
 #else
-    tcg_out_call(s, func_addr);
+    tcg_out_call(s, tcg_call_func(op));
 #endif
 
-    /* assign output registers and emit moves if needed */
-    for(i = 0; i < nb_oargs; i++) {
-        arg = op->args[i];
-        ts = arg_temp(arg);
+    /* Assign output registers and emit moves if needed.  */
+    switch (info->out_kind) {
+    case TCG_CALL_RET_NORMAL:
+        for (i = 0; i < nb_oargs; i++) {
+            TCGTemp *ts = arg_temp(op->args[i]);
+            TCGReg reg = tcg_target_call_oarg_regs[i];
 
-        /* ENV should not be modified.  */
-        tcg_debug_assert(!temp_readonly(ts));
+            /* ENV should not be modified.  */
+            tcg_debug_assert(!temp_readonly(ts));
 
-        reg = tcg_target_call_oarg_regs[i];
-        tcg_debug_assert(s->reg_to_temp[reg] == NULL);
-        if (ts->val_type == TEMP_VAL_REG) {
-            s->reg_to_temp[ts->reg] = NULL;
+            tcg_debug_assert(s->reg_to_temp[reg] == NULL);
+            if (ts->val_type == TEMP_VAL_REG) {
+                s->reg_to_temp[ts->reg] = NULL;
+            }
+            ts->val_type = TEMP_VAL_REG;
+            ts->reg = reg;
+            ts->mem_coherent = 0;
+            s->reg_to_temp[reg] = ts;
         }
-        ts->val_type = TEMP_VAL_REG;
-        ts->reg = reg;
-        ts->mem_coherent = 0;
-        s->reg_to_temp[reg] = ts;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    /* Flush or discard output registers as needed. */
+    for (i = 0; i < nb_oargs; i++) {
+        TCGTemp *ts = arg_temp(op->args[i]);
         if (NEED_SYNC_ARG(i)) {
-            temp_sync(s, ts, allocated_regs, 0, IS_DEAD_ARG(i));
+            temp_sync(s, ts, s->reserved_regs, 0, IS_DEAD_ARG(i));
         } else if (IS_DEAD_ARG(i)) {
             temp_dead(s, ts);
         }
-- 
2.34.1


