Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16786514676
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 12:19:06 +0200 (CEST)
Received: from localhost ([::1]:33688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkNiL-00087U-3L
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 06:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nkNXR-0007Su-1O
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 06:07:49 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45846 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nkNXK-0002z4-UL
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 06:07:47 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb9vhuGtiZicDAA--.14518S5; 
 Fri, 29 Apr 2022 18:07:33 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/43] target/loongarch: Add main translation routines
Date: Fri, 29 Apr 2022 18:06:49 +0800
Message-Id: <20220429100729.1572481-4-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
References: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxb9vhuGtiZicDAA--.14518S5
X-Coremail-Antispam: 1UD129KBjvJXoW3Xr4DJrW3Gr47KryxtFW5ZFb_yoW3Wr1fpF
 17Cry3Kr48Ja4fZwn3G3yYqr15Aa1rGFy2qas29395Cr42qrykZryktrZrKFWUC3y8WFyj
 vFsxA3Wj9F48XaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, richard.henderson@linaro.org,
 gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Song Gao <gaosong@loongson.cn>

This patch adds main translation routines and
basic functions for translation.

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/helper.h    |   6 ++
 target/loongarch/op_helper.c |  21 +++++
 target/loongarch/translate.c | 160 +++++++++++++++++++++++++++++++++++
 target/loongarch/translate.h |  26 ++++++
 4 files changed, 213 insertions(+)
 create mode 100644 target/loongarch/helper.h
 create mode 100644 target/loongarch/op_helper.c
 create mode 100644 target/loongarch/translate.c
 create mode 100644 target/loongarch/translate.h

diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
new file mode 100644
index 0000000000..eb771c0628
--- /dev/null
+++ b/target/loongarch/helper.h
@@ -0,0 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+DEF_HELPER_2(raise_exception, noreturn, env, i32)
diff --git a/target/loongarch/op_helper.c b/target/loongarch/op_helper.c
new file mode 100644
index 0000000000..903810951e
--- /dev/null
+++ b/target/loongarch/op_helper.c
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * LoongArch emulation helpers for QEMU.
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/main-loop.h"
+#include "cpu.h"
+#include "qemu/host-utils.h"
+#include "exec/helper-proto.h"
+#include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
+#include "internals.h"
+
+/* Exceptions helpers */
+void helper_raise_exception(CPULoongArchState *env, uint32_t exception)
+{
+    do_raise_exception(env, exception, GETPC());
+}
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
new file mode 100644
index 0000000000..8a62623cd1
--- /dev/null
+++ b/target/loongarch/translate.c
@@ -0,0 +1,160 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * LoongArch emulation for QEMU - main translation routines.
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "tcg/tcg-op.h"
+#include "exec/translator.h"
+#include "exec/helper-proto.h"
+#include "exec/helper-gen.h"
+
+#include "exec/translator.h"
+#include "exec/log.h"
+#include "qemu/qemu-print.h"
+#include "translate.h"
+#include "internals.h"
+
+/* Global register indices */
+TCGv cpu_gpr[32], cpu_pc;
+static TCGv cpu_lladdr, cpu_llval;
+TCGv_i32 cpu_fcsr0;
+TCGv_i64 cpu_fpr[32];
+
+#define DISAS_STOP       DISAS_TARGET_0
+
+void generate_exception(DisasContext *ctx, int excp)
+{
+    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
+    gen_helper_raise_exception(cpu_env, tcg_constant_i32(excp));
+    ctx->base.is_jmp = DISAS_NORETURN;
+}
+
+static inline void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
+{
+    if (translator_use_goto_tb(&ctx->base, dest)) {
+        tcg_gen_goto_tb(n);
+        tcg_gen_movi_tl(cpu_pc, dest);
+        tcg_gen_exit_tb(ctx->base.tb, n);
+    } else {
+        tcg_gen_movi_tl(cpu_pc, dest);
+        tcg_gen_lookup_and_goto_ptr();
+    }
+}
+
+static void loongarch_tr_init_disas_context(DisasContextBase *dcbase,
+                                            CPUState *cs)
+{
+    int64_t bound;
+    DisasContext *ctx = container_of(dcbase, DisasContext, base);
+
+    ctx->page_start = ctx->base.pc_first & TARGET_PAGE_MASK;
+    ctx->mem_idx = ctx->base.tb->flags;
+
+    /* Bound the number of insns to execute to those left on the page.  */
+    bound = -(ctx->base.pc_first | TARGET_PAGE_MASK) / 4;
+    ctx->base.max_insns = MIN(ctx->base.max_insns, bound);
+}
+
+static void loongarch_tr_tb_start(DisasContextBase *dcbase, CPUState *cs)
+{
+}
+
+static void loongarch_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
+{
+    DisasContext *ctx = container_of(dcbase, DisasContext, base);
+
+    tcg_gen_insn_start(ctx->base.pc_next);
+}
+
+static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
+{
+    CPULoongArchState *env = cs->env_ptr;
+    DisasContext *ctx = container_of(dcbase, DisasContext, base);
+
+    ctx->opcode = cpu_ldl_code(env, ctx->base.pc_next);
+
+    if (!decode(ctx, ctx->opcode)) {
+        qemu_log_mask(LOG_UNIMP, "Error: unknown opcode. 0x%lx: 0x%x\n",
+                      ctx->base.pc_next, ctx->opcode);
+        generate_exception(ctx, EXCCODE_INE);
+    }
+
+    ctx->base.pc_next += 4;
+}
+
+static void loongarch_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
+{
+    DisasContext *ctx = container_of(dcbase, DisasContext, base);
+
+    switch (ctx->base.is_jmp) {
+    case DISAS_STOP:
+        tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
+        tcg_gen_lookup_and_goto_ptr();
+        break;
+    case DISAS_TOO_MANY:
+        gen_goto_tb(ctx, 0, ctx->base.pc_next);
+        break;
+    case DISAS_NORETURN:
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void loongarch_tr_disas_log(const DisasContextBase *dcbase,
+                                   CPUState *cpu, FILE *logfile)
+{
+    qemu_log("IN: %s\n", lookup_symbol(dcbase->pc_first));
+    target_disas(logfile, cpu, dcbase->pc_first, dcbase->tb->size);
+}
+
+static const TranslatorOps loongarch_tr_ops = {
+    .init_disas_context = loongarch_tr_init_disas_context,
+    .tb_start           = loongarch_tr_tb_start,
+    .insn_start         = loongarch_tr_insn_start,
+    .translate_insn     = loongarch_tr_translate_insn,
+    .tb_stop            = loongarch_tr_tb_stop,
+    .disas_log          = loongarch_tr_disas_log,
+};
+
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
+{
+    DisasContext ctx;
+
+    translator_loop(&loongarch_tr_ops, &ctx.base, cs, tb, max_insns);
+}
+
+void loongarch_translate_init(void)
+{
+    int i;
+
+    cpu_gpr[0] = NULL;
+    for (i = 1; i < 32; i++) {
+        cpu_gpr[i] = tcg_global_mem_new(cpu_env,
+                                        offsetof(CPULoongArchState, gpr[i]),
+                                        regnames[i]);
+    }
+
+    for (i = 0; i < 32; i++) {
+        int off = offsetof(CPULoongArchState, fpr[i]);
+        cpu_fpr[i] = tcg_global_mem_new_i64(cpu_env, off, fregnames[i]);
+    }
+
+    cpu_pc = tcg_global_mem_new(cpu_env, offsetof(CPULoongArchState, pc), "pc");
+    cpu_fcsr0 = tcg_global_mem_new_i32(cpu_env,
+                    offsetof(CPULoongArchState, fcsr0), "fcsr0");
+    cpu_lladdr = tcg_global_mem_new(cpu_env,
+                    offsetof(CPULoongArchState, lladdr), "lladdr");
+    cpu_llval = tcg_global_mem_new(cpu_env,
+                    offsetof(CPULoongArchState, llval), "llval");
+}
+
+void restore_state_to_opc(CPULoongArchState *env, TranslationBlock *tb,
+                          target_ulong *data)
+{
+    env->pc = data[0];
+}
diff --git a/target/loongarch/translate.h b/target/loongarch/translate.h
new file mode 100644
index 0000000000..6cc7f1a7cd
--- /dev/null
+++ b/target/loongarch/translate.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * LoongArch translation routines.
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#ifndef TARGET_LOONGARCH_TRANSLATE_H
+#define TARGET_LOONGARCH_TRANSLATE_H
+
+#include "exec/translator.h"
+
+typedef struct DisasContext {
+    DisasContextBase base;
+    target_ulong page_start;
+    uint32_t opcode;
+    int mem_idx;
+} DisasContext;
+
+void generate_exception(DisasContext *ctx, int excp);
+
+extern TCGv cpu_gpr[32], cpu_pc;
+extern TCGv_i32 cpu_fscr0;
+extern TCGv_i64 cpu_fpr[32];
+
+#endif
-- 
2.31.1


