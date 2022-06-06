Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2540B53F276
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 01:20:06 +0200 (CEST)
Received: from localhost ([::1]:55324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyM0y-00021T-7f
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 19:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLw2-0001L2-1b
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:14:58 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:35374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLvz-0003j5-Qh
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:14:57 -0400
Received: by mail-pg1-x531.google.com with SMTP id 129so14204286pgc.2
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 16:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YfCq1ulkshQc7fJutZZyHkGGMXp6js5MIVyNeOEfUe0=;
 b=ltjjlog4OT9Aw6WdKqKkcE3G5XtiPc1/2G+oqOPnQ+D2uCf3t3DsVbWtM/6q85mjSJ
 RPaw4HbQ4bd8UboY0pK7bfQXEoWpvmDQ0PB6/cE9Fo5sILHprLAV0AXE+ZN7UWQcjrLt
 LnrUfPz1IJl8USQOGRVXRwHhbs3zTBBGG4pdHYAFqvHVnc54Fe9Ljf2p9mccbniWXcBU
 /9Gt8bLpmdBjYU+BlZk93cAoN9D7kExUlSNqkf4wYGWEpVYleNpEnX5d+0zxc4xFZN19
 NKE5EV7VIhBX6t8hsvqDXcQSM2iZgmiBGh/vosgnTKXWb3hbSVu37GeuKSBHWaH0y7HT
 1MaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YfCq1ulkshQc7fJutZZyHkGGMXp6js5MIVyNeOEfUe0=;
 b=CzT501HBTLRHL4qvMvsbEvVkFNsM2cpxm0EoHQn1H4ngSHRiD9DgGuas6qJm/R/LGb
 SzWkDB+mSqG4oz6KLWsbNbGNvYqKZd0vKntL8AHzeka2rg8OtX/5fxkTIQ6fn261GSwS
 RtXbqH5YuAbDJsv7MF9YOihyn45soygure3Cv6xLGAA0KD5JITLXMvQ2fyYPxqPvbmhG
 YPlAReOfhsm4oS6ZmJNRi92JHMbYJ4Zy1fHsPC8YJCS6LBXU+cO4YDTeCOGCXdOOSPRA
 Qlid0su7zvlGHn3rmCTrpHlwU8zRo0M1syaIVmmHEatG2+Q8+EE2X4NCOB0qZK1aONBI
 guUw==
X-Gm-Message-State: AOAM530mWctPrW8Ed2+oritKsAjEzsa+VKRRBpEJagTJi6YV/kY9/7rS
 ZPEZtA0MDFWODyakkihZ2sdYLa78jN2hSw==
X-Google-Smtp-Source: ABdhPJylZsi9so3+iKnll7FBMKpjNvYf6jqH0cvSygrNDkoXDYCW5vU0R4lfWy5WLQNMsvQVPBh+Rw==
X-Received: by 2002:a63:8549:0:b0:3fd:1b37:6e48 with SMTP id
 u70-20020a638549000000b003fd1b376e48mr17330028pgd.591.1654557294442; 
 Mon, 06 Jun 2022 16:14:54 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170902c24200b00162523fdb8fsm10954623plg.252.2022.06.06.16.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 16:14:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 Song Gao <gaosong@loongson.cn>
Subject: [PULL 03/43] target/loongarch: Add main translation routines
Date: Mon,  6 Jun 2022 16:14:10 -0700
Message-Id: <20220606231450.448443-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606231450.448443-1-richard.henderson@linaro.org>
References: <20220606231450.448443-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Song Gao <gaosong@loongson.cn>

This patch adds main translation routines and
basic functions for translation.

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220606124333.2060567-4-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/helper.h    |   6 ++
 target/loongarch/translate.h |  26 ++++++
 target/loongarch/op_helper.c |  21 +++++
 target/loongarch/translate.c | 161 +++++++++++++++++++++++++++++++++++
 4 files changed, 214 insertions(+)
 create mode 100644 target/loongarch/helper.h
 create mode 100644 target/loongarch/translate.h
 create mode 100644 target/loongarch/op_helper.c
 create mode 100644 target/loongarch/translate.c

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
index 0000000000..332a6d2d58
--- /dev/null
+++ b/target/loongarch/translate.c
@@ -0,0 +1,161 @@
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
+        qemu_log_mask(LOG_UNIMP, "Error: unknown opcode. "
+                      TARGET_FMT_lx ": 0x%x\n",
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
-- 
2.34.1


