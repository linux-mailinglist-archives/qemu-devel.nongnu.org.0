Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D44763FFE6
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 06:42:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0ymt-0002lG-3A; Fri, 02 Dec 2022 00:40:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymn-0002jr-Kz
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:33 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0ymk-0003QG-EN
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 00:40:33 -0500
Received: by mail-pl1-x62e.google.com with SMTP id p24so3726248plw.1
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 21:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=P90EeKH4/pTjIHbulrXvG19OO1n2b3uUvSh0tREkpus=;
 b=RFJhH65VK2bSXtiP+He4frWrsQjpiraMc6Eja0uuYgnQhDs1h116zHuwsNyN+Vpnlj
 ktJY4ZAz84Jnfe8S+ZJipjy1GNnYEufRCddOvU7ZEE8ZpPENFqbix1v5pMJJ5CY3aE0I
 7uAutfnPW7A1FkPhdSpFxJYlWzYZr0dDfhkMejmgnU55MnfMIrigQonSXovYyGqATNbE
 Sw2dsJ/IVO+ov+i3obHn0zi7EBXoKnTHtBDSbuJRIRRisiRZQqfwnOCc29TZN7mAK66F
 dMsGJiCj7orL1BspjnrPcTEtGXl5e0hTsUZeUvaiLANDE7U3OI47YJNalxtrDxy0FqG/
 Yh+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P90EeKH4/pTjIHbulrXvG19OO1n2b3uUvSh0tREkpus=;
 b=TAvJumXr3IwCHcW4hBIvMzsNO2tsboeoD5E/CXcPZ+StDXLoggjrx7O/tNvXIY+5b3
 LcGfbQU/VAputY4jDZOMvhj4u+5ZzlGVZJRAlluStkmF4p76tMNqabg6mdICbyxyb8Tb
 QF6igg9qnWqGmN6ii8nPqthTVjYjPorfDc5g31N3s3Ukc1FDs2bfRXkdK7tD41vcrVrY
 wVkXWl6AIzRra1dWZRqsxeq/lrZGGQQDFUZfX2NiZxZ+x/sqaj+XT85rWNMehaaUI7Cr
 KXb3NW2o4CGwdLMxpS60KPhsQKnERb32DPumc4V8obRSXDWVEg+hdaMOucFOaJva1r3Q
 WKzg==
X-Gm-Message-State: ANoB5pl3CQPjgeijbMVTPyRgZmDyB5p728X4G11tJ5FoEGmig8nutu5r
 b5dwFBhC9FVeg0g9am0DHfKqhv/MIKk1zPVB
X-Google-Smtp-Source: AA0mqf5NOaRi7jOSUYieBcVH0Je35/Zq2GNXKy33wriAEHt+goHB/+IVy9kCA/AQ0/GeOf91eVP90w==
X-Received: by 2002:a17:903:41c8:b0:17d:b9c:cd64 with SMTP id
 u8-20020a17090341c800b0017d0b9ccd64mr52785544ple.40.1669959628871; 
 Thu, 01 Dec 2022 21:40:28 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b00186f0f59c85sm4637075plh.235.2022.12.01.21.40.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 21:40:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 29/34] tcg: Reorg function calls
Date: Thu,  1 Dec 2022 21:39:53 -0800
Message-Id: <20221202053958.223890-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202053958.223890-1-richard.henderson@linaro.org>
References: <20221202053958.223890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

Pre-compute the function call layout for each helper at startup.
Drop TCG_CALL_DUMMY_ARG, as we no longer need to leave gaps
in the op->args[] array.  This allows several places to stop
checking for NULL TCGTemp, to which TCG_CALL_DUMMY_ARG mapped.

For tcg_gen_callN, loop over the arguments once.  Allocate the TCGOp
for the call early but delay emitting it, collecting arguments first.
This allows the argument processing loop to emit code for extensions
and have them sequenced before the call.

For tcg_reg_alloc_call, loop over the arguments in reverse order,
which allows stack slots to be filled first naturally.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/helper-head.h |   2 +
 include/tcg/tcg.h          |   5 +-
 tcg/tcg-internal.h         |  22 +-
 tcg/optimize.c             |   6 +-
 tcg/tcg.c                  | 609 ++++++++++++++++++++++---------------
 5 files changed, 394 insertions(+), 250 deletions(-)

diff --git a/include/exec/helper-head.h b/include/exec/helper-head.h
index 8bdf0f6ea2..bc6698b19f 100644
--- a/include/exec/helper-head.h
+++ b/include/exec/helper-head.h
@@ -133,4 +133,6 @@
 #define DEF_HELPER_7(name, ret, t1, t2, t3, t4, t5, t6, t7) \
     DEF_HELPER_FLAGS_7(name, 0, ret, t1, t2, t3, t4, t5, t6, t7)
 
+/* MAX_CALL_IARGS must be set to n if last entry is DEF_HELPER_FLAGS_n. */
+
 #endif /* EXEC_HELPER_HEAD_H */
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index a6310b898f..b949d75fdd 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -38,6 +38,8 @@
 /* XXX: make safe guess about sizes */
 #define MAX_OP_PER_INSTR 266
 
+#define MAX_CALL_IARGS  7
+
 #define CPU_TEMP_BUF_NLONGS 128
 #define TCG_STATIC_FRAME_SIZE  (CPU_TEMP_BUF_NLONGS * sizeof(long))
 
@@ -411,9 +413,6 @@ typedef TCGv_ptr TCGv_env;
 #define TCG_CALL_NO_RWG_SE      (TCG_CALL_NO_RWG | TCG_CALL_NO_SE)
 #define TCG_CALL_NO_WG_SE       (TCG_CALL_NO_WG | TCG_CALL_NO_SE)
 
-/* Used to align parameters.  See the comment before tcgv_i32_temp.  */
-#define TCG_CALL_DUMMY_ARG      ((TCGArg)0)
-
 /*
  * Flags for the bswap opcodes.
  * If IZ, the input is zero-extended, otherwise unknown.
diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index f574743ff8..c7e87e193d 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -42,11 +42,29 @@ typedef enum {
     TCG_CALL_ARG_EXTEND_S,       /*      ... as a sign-extended i64 */
 } TCGCallArgumentKind;
 
+typedef struct TCGCallArgumentLoc {
+    TCGCallArgumentKind kind    : 8;
+    unsigned arg_slot           : 8;
+    unsigned ref_slot           : 8;
+    unsigned arg_idx            : 4;
+    unsigned tmp_subindex       : 2;
+} TCGCallArgumentLoc;
+
+/* Avoid "unsigned < 0 is always false" Werror, when iarg_regs is empty. */
+#define REG_P(L) \
+    ((int)(L)->arg_slot < (int)ARRAY_SIZE(tcg_target_call_iarg_regs))
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
+
+    /* Maximum physical arguments are constrained by TCG_TYPE_I128. */
+    TCGCallArgumentLoc in[MAX_CALL_IARGS * (128 / TCG_TARGET_REG_BITS)];
 } TCGHelperInfo;
 
 extern TCGContext tcg_init_ctx;
diff --git a/tcg/optimize.c b/tcg/optimize.c
index 1afd50175b..763bca9ea6 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -667,9 +667,7 @@ static void init_arguments(OptContext *ctx, TCGOp *op, int nb_args)
 {
     for (int i = 0; i < nb_args; i++) {
         TCGTemp *ts = arg_temp(op->args[i]);
-        if (ts) {
-            init_ts_info(ctx, ts);
-        }
+        init_ts_info(ctx, ts);
     }
 }
 
@@ -680,7 +678,7 @@ static void copy_propagate(OptContext *ctx, TCGOp *op,
 
     for (int i = nb_oargs; i < nb_oargs + nb_iargs; i++) {
         TCGTemp *ts = arg_temp(op->args[i]);
-        if (ts && ts_is_copy(ts)) {
+        if (ts_is_copy(ts)) {
             op->args[i] = temp_arg(find_better_copy(s, ts));
         }
     }
diff --git a/tcg/tcg.c b/tcg/tcg.c
index d08323db49..74f7491d73 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -547,7 +547,7 @@ void tcg_pool_reset(TCGContext *s)
 
 #include "exec/helper-proto.h"
 
-static const TCGHelperInfo all_helpers[] = {
+static TCGHelperInfo all_helpers[] = {
 #include "exec/helper-tcg.h"
 };
 static GHashTable *helper_table;
@@ -565,6 +565,154 @@ static ffi_type * const typecode_to_ffi[8] = {
 };
 #endif
 
+typedef struct TCGCumulativeArgs {
+    int arg_idx;                /* tcg_gen_callN args[] */
+    int info_in_idx;            /* TCGHelperInfo in[] */
+    int arg_slot;               /* regs+stack slot */
+    int ref_slot;               /* stack slots for references */
+} TCGCumulativeArgs;
+
+static void layout_arg_even(TCGCumulativeArgs *cum)
+{
+    cum->arg_slot += cum->arg_slot & 1;
+}
+
+static void layout_arg_1(TCGCumulativeArgs *cum, TCGHelperInfo *info,
+                         TCGCallArgumentKind kind)
+{
+    TCGCallArgumentLoc *loc = &info->in[cum->info_in_idx];
+
+    *loc = (TCGCallArgumentLoc){
+        .kind = kind,
+        .arg_idx = cum->arg_idx,
+        .arg_slot = cum->arg_slot,
+    };
+    cum->info_in_idx++;
+    cum->arg_slot++;
+}
+
+static void layout_arg_normal_n(TCGCumulativeArgs *cum,
+                                TCGHelperInfo *info, int n)
+{
+    TCGCallArgumentLoc *loc = &info->in[cum->info_in_idx];
+
+    for (int i = 0; i < n; ++i) {
+        /* Layout all using the same arg_idx, adjusting the subindex. */
+        loc[i] = (TCGCallArgumentLoc){
+            .kind = TCG_CALL_ARG_NORMAL,
+            .arg_idx = cum->arg_idx,
+            .tmp_subindex = i,
+            .arg_slot = cum->arg_slot + i,
+        };
+    }
+    cum->info_in_idx += n;
+    cum->arg_slot += n;
+}
+
+static void init_call_layout(TCGHelperInfo *info)
+{
+    int max_reg_slots = ARRAY_SIZE(tcg_target_call_iarg_regs);
+    int max_stk_slots = TCG_STATIC_CALL_ARGS_SIZE / sizeof(tcg_target_long);
+    unsigned typemask = info->typemask;
+    unsigned typecode;
+    TCGCumulativeArgs cum = { };
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
+            break;
+        case dh_typecode_i64:
+        case dh_typecode_s64:
+            type = TCG_TYPE_I64;
+            break;
+        case dh_typecode_ptr:
+            type = TCG_TYPE_PTR;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+
+        switch (type) {
+        case TCG_TYPE_I32:
+            switch (TCG_TARGET_CALL_ARG_I32) {
+            case TCG_CALL_ARG_EVEN:
+                layout_arg_even(&cum);
+                /* fall through */
+            case TCG_CALL_ARG_NORMAL:
+                layout_arg_1(&cum, info, TCG_CALL_ARG_NORMAL);
+                break;
+            case TCG_CALL_ARG_EXTEND:
+                kind = TCG_CALL_ARG_EXTEND_U + (typecode & 1);
+                layout_arg_1(&cum, info, kind);
+                break;
+            default:
+                qemu_build_not_reached();
+            }
+            break;
+
+        case TCG_TYPE_I64:
+            switch (TCG_TARGET_CALL_ARG_I64) {
+            case TCG_CALL_ARG_EVEN:
+                layout_arg_even(&cum);
+                /* fall through */
+            case TCG_CALL_ARG_NORMAL:
+                if (TCG_TARGET_REG_BITS == 32) {
+                    layout_arg_normal_n(&cum, info, 2);
+                } else {
+                    layout_arg_1(&cum, info, TCG_CALL_ARG_NORMAL);
+                }
+                break;
+            default:
+                qemu_build_not_reached();
+            }
+            break;
+
+        default:
+            g_assert_not_reached();
+        }
+    }
+    info->nr_in = cum.info_in_idx;
+
+    /* Validate that we didn't overrun the input array. */
+    assert(cum.info_in_idx <= ARRAY_SIZE(info->in));
+    /* Validate the backend has enough argument space. */
+    assert(cum.arg_slot <= max_reg_slots + max_stk_slots);
+    assert(cum.ref_slot <= max_stk_slots);
+}
+
 static int indirect_reg_alloc_order[ARRAY_SIZE(tcg_target_reg_alloc_order)];
 static void process_op_defs(TCGContext *s);
 static TCGTemp *tcg_global_reg_new_internal(TCGContext *s, TCGType type,
@@ -604,6 +752,7 @@ static void tcg_context_init(unsigned max_cpus)
     helper_table = g_hash_table_new(NULL, NULL);
 
     for (i = 0; i < ARRAY_SIZE(all_helpers); ++i) {
+        init_call_layout(&all_helpers[i]);
         g_hash_table_insert(helper_table, (gpointer)all_helpers[i].func,
                             (gpointer)&all_helpers[i]);
     }
@@ -1474,18 +1623,19 @@ bool tcg_op_supported(TCGOpcode op)
     }
 }
 
-/* Note: we convert the 64 bit args to 32 bit and do some alignment
-   and endian swap. Maybe it would be better to do the alignment
-   and endian swap in tcg_reg_alloc_call(). */
+static TCGOp *tcg_op_alloc(TCGOpcode opc, unsigned nargs);
+
 void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
 {
-    int i, real_args, nb_rets, pi, max_args;
-    unsigned typemask;
     const TCGHelperInfo *info;
+    TCGv_i64 extend_free[MAX_CALL_IARGS];
+    int n_extend = 0;
     TCGOp *op;
+    int i, n, pi = 0, total_args;
 
     info = g_hash_table_lookup(helper_table, (gpointer)func);
-    typemask = info->typemask;
+    total_args = info->nr_out + info->nr_in + 2;
+    op = tcg_op_alloc(INDEX_op_call, total_args);
 
 #ifdef CONFIG_PLUGIN
     /* detect non-plugin helpers */
@@ -1494,119 +1644,65 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
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
+        tcg_debug_assert(ret->base_type == ret->type + 1);
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
+                extend_free[n_extend++] = temp;
             }
-        }
-    }
-
-    /*
-     * A Call op needs up to 4 + 2N parameters on 32-bit archs,
-     * and up to 4 + N parameters on 64-bit archs
-     * (N = number of input arguments + output arguments).
-     */
-    max_args = (64 / TCG_TARGET_REG_BITS) * nargs + 4;
-    op = tcg_emit_op(INDEX_op_call, max_args);
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
             break;
-        case dh_typecode_i64:
-        case dh_typecode_s64:
-            type = TCG_TYPE_I64;
-            break;
-        case dh_typecode_ptr:
-            type = TCG_TYPE_PTR;
-            break;
-        default:
-            g_assert_not_reached();
-        }
 
-        switch (type) {
-        case TCG_TYPE_I32:
-            kind = TCG_TARGET_CALL_ARG_I32;
-            break;
-        case TCG_TYPE_I64:
-            kind = TCG_TARGET_CALL_ARG_I64;
-            break;
-        default:
-            g_assert_not_reached();
-        }
-
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
+    tcg_debug_assert(pi == total_args);
 
-    /* Make sure the fields didn't overflow.  */
-    tcg_debug_assert(TCGOP_CALLI(op) == real_args);
-    tcg_debug_assert(pi <= max_args);
+    QTAILQ_INSERT_TAIL(&tcg_ctx->ops, op, link);
 
-    if (TCG_TARGET_CALL_ARG_I32 == TCG_CALL_ARG_EXTEND) {
-        for (i = 0; i < nargs; ++i) {
-            int argtype = extract32(typemask, (i + 1) * 3, 3);
-            bool is_32bit = (argtype & ~1) == dh_typecode_i32;
-
-            if (is_32bit) {
-                tcg_temp_free_internal(args[i]);
-            }
-        }
+    tcg_debug_assert(n_extend < ARRAY_SIZE(extend_free));
+    for (i = 0; i < n_extend; ++i) {
+        tcg_temp_free_i64(extend_free[i]);
     }
 }
 
@@ -1822,10 +1918,7 @@ static void tcg_dump_ops(TCGContext *s, FILE *f, bool have_prefs)
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
@@ -2606,12 +2699,11 @@ static void liveness_pass_1(TCGContext *s)
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
@@ -2651,7 +2743,7 @@ static void liveness_pass_1(TCGContext *s)
                 /* Record arguments that die in this helper.  */
                 for (i = nb_oargs; i < nb_iargs + nb_oargs; i++) {
                     ts = arg_temp(op->args[i]);
-                    if (ts && ts->state & TS_DEAD) {
+                    if (ts->state & TS_DEAD) {
                         arg_life |= DEAD_ARG << i;
                     }
                 }
@@ -2659,31 +2751,59 @@ static void liveness_pass_1(TCGContext *s)
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
+                            if (REG_P(loc)) {
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
+                        if (REG_P(loc)) {
+                            tcg_regset_set_reg(*la_temp_pref(ts),
+                                tcg_target_call_iarg_regs[loc->arg_slot]);
+                        }
+                        break;
+                    default:
+                        break;
                     }
                 }
             }
@@ -2954,21 +3074,19 @@ static bool liveness_pass_2(TCGContext *s)
         /* Make sure that input arguments are available.  */
         for (i = nb_oargs; i < nb_iargs + nb_oargs; i++) {
             arg_ts = arg_temp(op->args[i]);
-            if (arg_ts) {
-                dir_ts = arg_ts->state_ptr;
-                if (dir_ts && arg_ts->state == TS_DEAD) {
-                    TCGOpcode lopc = (arg_ts->type == TCG_TYPE_I32
-                                      ? INDEX_op_ld_i32
-                                      : INDEX_op_ld_i64);
-                    TCGOp *lop = tcg_op_insert_before(s, op, lopc, 3);
+            dir_ts = arg_ts->state_ptr;
+            if (dir_ts && arg_ts->state == TS_DEAD) {
+                TCGOpcode lopc = (arg_ts->type == TCG_TYPE_I32
+                                  ? INDEX_op_ld_i32
+                                  : INDEX_op_ld_i64);
+                TCGOp *lop = tcg_op_insert_before(s, op, lopc, 3);
 
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
 
@@ -2977,14 +3095,12 @@ static bool liveness_pass_2(TCGContext *s)
            so that we reload when needed.  */
         for (i = nb_oargs; i < nb_iargs + nb_oargs; i++) {
             arg_ts = arg_temp(op->args[i]);
-            if (arg_ts) {
-                dir_ts = arg_ts->state_ptr;
-                if (dir_ts) {
-                    op->args[i] = temp_arg(dir_ts);
-                    changes = true;
-                    if (IS_DEAD_ARG(i)) {
-                        arg_ts->state = TS_DEAD;
-                    }
+            dir_ts = arg_ts->state_ptr;
+            if (dir_ts) {
+                op->args[i] = temp_arg(dir_ts);
+                changes = true;
+                if (IS_DEAD_ARG(i)) {
+                    arg_ts->state = TS_DEAD;
                 }
             }
         }
@@ -4147,106 +4263,107 @@ static bool tcg_reg_alloc_dup2(TCGContext *s, const TCGOp *op)
     return true;
 }
 
+static void load_arg_reg(TCGContext *s, TCGReg reg, TCGTemp *ts,
+                         TCGRegSet allocated_regs)
+{
+    if (ts->val_type == TEMP_VAL_REG) {
+        if (ts->reg != reg) {
+            tcg_reg_free(s, reg, allocated_regs);
+            if (!tcg_out_mov(s, ts->type, reg, ts->reg)) {
+                /*
+                 * Cross register class move not supported.  Sync the
+                 * temp back to its slot and load from there.
+                 */
+                temp_sync(s, ts, allocated_regs, 0, 0);
+                tcg_out_ld(s, ts->type, reg,
+                           ts->mem_base->reg, ts->mem_offset);
+            }
+        }
+    } else {
+        TCGRegSet arg_set = 0;
+
+        tcg_reg_free(s, reg, allocated_regs);
+        tcg_regset_set_reg(arg_set, reg);
+        temp_load(s, ts, arg_set, allocated_regs, 0);
+    }
+}
+
+static void load_arg_stk(TCGContext *s, int stk_slot, TCGTemp *ts,
+                         TCGRegSet allocated_regs)
+{
+    /*
+     * When the destination is on the stack, load up the temp and store.
+     * If there are many call-saved registers, the temp might live to
+     * see another use; otherwise it'll be discarded.
+     */
+    temp_load(s, ts, tcg_target_available_regs[ts->type], allocated_regs, 0);
+    tcg_out_st(s, ts->type, ts->reg, TCG_REG_CALL_STACK,
+               TCG_TARGET_CALL_STACK_OFFSET +
+               stk_slot * sizeof(tcg_target_long));
+}
+
+static void load_arg_normal(TCGContext *s, const TCGCallArgumentLoc *l,
+                            TCGTemp *ts, TCGRegSet *allocated_regs)
+{
+    if (REG_P(l)) {
+        TCGReg reg = tcg_target_call_iarg_regs[l->arg_slot];
+        load_arg_reg(s, reg, ts, *allocated_regs);
+        tcg_regset_set_reg(*allocated_regs, reg);
+    } else {
+        load_arg_stk(s, l->arg_slot - ARRAY_SIZE(tcg_target_call_iarg_regs),
+                     ts, *allocated_regs);
+    }
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
+            load_arg_normal(s, loc, ts, &allocated_regs);
+            break;
+        default:
+            g_assert_not_reached();
         }
     }
 
-    /* mark dead temporaries and free the associated registers */
+    /* Mark dead temporaries and free the associated registers.  */
     for (i = nb_oargs; i < nb_iargs + nb_oargs; i++) {
         if (IS_DEAD_ARG(i)) {
             temp_dead(s, arg_temp(op->args[i]));
         }
     }
 
-    /* clobber call registers */
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
@@ -4257,25 +4374,35 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
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
-        set_temp_val_reg(s, ts, reg);
-        ts->mem_coherent = 0;
+            set_temp_val_reg(s, ts, reg);
+            ts->mem_coherent = 0;
+        }
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


