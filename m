Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7362C3FEDFA
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 14:47:34 +0200 (CEST)
Received: from localhost ([::1]:36436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLm7x-0005y7-IK
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 08:47:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mLm2J-0005nZ-Ny
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:41:46 -0400
Received: from mail.loongson.cn ([114.242.206.163]:35996 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mLm2D-00061b-AI
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:41:43 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxYctjxjBha2YCAA--.7003S5;
 Thu, 02 Sep 2021 20:41:16 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/21] target/loongarch: Add main translation routines
Date: Thu,  2 Sep 2021 20:40:49 +0800
Message-Id: <1630586467-22463-4-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1630586467-22463-1-git-send-email-gaosong@loongson.cn>
References: <1630586467-22463-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9AxYctjxjBha2YCAA--.7003S5
X-Coremail-Antispam: 1UD129KBjvJXoW3Xr4DJrW3Gr47KryxtFW5ZFb_yoW3XF1UpF
 17Cr13Kr48Ja43Z3Z3G3yYqr15Aa1xGry2qayIk395Cr42qrykZryktrZrKFW8C3y8WFyj
 vFZxA3Wj9F48XaDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, yangxiaojuan@loongson.cn, david@redhat.com,
 bin.meng@windriver.com, mark.cave-ayland@ilande.co.uk,
 aleksandar.rikalo@syrmia.com, jcmvbkbc@gmail.com, tsimpson@quicinc.com,
 alistair.francis@wdc.com, edgar.iglesias@gmail.com, chenhuacai@gmail.com,
 philmd@redhat.com, atar4qemu@gmail.com, thuth@redhat.com, ehabkost@redhat.com,
 richard.henderson@linaro.org, groug@kaod.org, maobibo@loongson.cn,
 mrolnik@gmail.com, shorne@gmail.com, alex.bennee@linaro.org,
 david@gibson.dropbear.id.au, kbastian@mail.uni-paderborn.de, crwulff@gmail.com,
 laurent@vivier.eu, palmer@dabbelt.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch add main translation routines and
basic functions for translation.

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: XiaoJuan Yang <yangxiaojuan@loongson.cn>
---
 target/loongarch/helper.h    |   9 +++
 target/loongarch/op_helper.c |  22 ++++++
 target/loongarch/translate.c | 165 +++++++++++++++++++++++++++++++++++++++++++
 target/loongarch/translate.h |  27 +++++++
 4 files changed, 223 insertions(+)
 create mode 100644 target/loongarch/helper.h
 create mode 100644 target/loongarch/op_helper.c
 create mode 100644 target/loongarch/translate.c
 create mode 100644 target/loongarch/translate.h

diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
new file mode 100644
index 0000000..09bfcfd
--- /dev/null
+++ b/target/loongarch/helper.h
@@ -0,0 +1,9 @@
+/*
+ * QEMU LoongArch CPU
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+DEF_HELPER_2(raise_exception, noreturn, env, i32)
diff --git a/target/loongarch/op_helper.c b/target/loongarch/op_helper.c
new file mode 100644
index 0000000..4d10b03
--- /dev/null
+++ b/target/loongarch/op_helper.c
@@ -0,0 +1,22 @@
+/*
+ * LoongArch emulation helpers for qemu.
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
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
index 0000000..4769004
--- /dev/null
+++ b/target/loongarch/translate.c
@@ -0,0 +1,165 @@
+/*
+ * LoongArch emulation for QEMU - main translation routines.
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
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
+/* global register indices */
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
+static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
+{
+    return true;
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
+    DisasContext *ctx = container_of(dcbase, DisasContext, base);
+    int64_t bound;
+
+    ctx->page_start = ctx->base.pc_first & TARGET_PAGE_MASK;
+    ctx->mem_idx = MMU_USER_IDX ;
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
+        qemu_log_mask(LOG_UNIMP, "Error: unkown opcode. 0x%lx: 0x%x\n",
+                      ctx->base.pc_next, ctx->opcode);
+        generate_exception(ctx, EXCP_INE);
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
+static void loongarch_tr_disas_log(const DisasContextBase *dcbase, CPUState *cs)
+{
+    qemu_log("IN: %s\n", lookup_symbol(dcbase->pc_first));
+    log_target_disas(cs, dcbase->pc_first, dcbase->tb->size);
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
index 0000000..dff7d79
--- /dev/null
+++ b/target/loongarch/translate.h
@@ -0,0 +1,27 @@
+/*
+ * LoongArch translation routines.
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
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
1.8.3.1


