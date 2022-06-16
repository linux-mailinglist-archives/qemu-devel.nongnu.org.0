Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF89054E0B1
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 14:21:02 +0200 (CEST)
Received: from localhost ([::1]:58472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1oUe-0004DI-CS
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 08:21:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1o1oQC-0001RT-Tw
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 08:16:24 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45492 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1o1oQ9-0006QV-8H
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 08:16:24 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxD08LH6tiaiNGAA--.9326S4;
 Thu, 16 Jun 2022 20:16:15 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, laurent@vivier.eu, gaosong@loongson.cn,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PATCH v17 02/13] linux-user: Add LoongArch signal support
Date: Thu, 16 Jun 2022 20:16:00 +0800
Message-Id: <20220616121611.3316074-3-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220616121611.3316074-1-gaosong@loongson.cn>
References: <20220616121611.3316074-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxD08LH6tiaiNGAA--.9326S4
X-Coremail-Antispam: 1UD129KBjvJXoW3Xr4DZr47CFWDKrWfGF47CFg_yoWfWw4kpF
 WrCwn7ArWUJrWUua4kJayrZFW5Wwn7XryjkrZ7G3WFyws5tr95Was7trZrAF1UAw1UGFya
 kFWq93WYkFW8JFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 linux-user/loongarch64/signal.c        | 312 +++++++++++++++++++++++++
 linux-user/loongarch64/target_signal.h |  13 ++
 2 files changed, 325 insertions(+)
 create mode 100644 linux-user/loongarch64/signal.c
 create mode 100644 linux-user/loongarch64/target_signal.h

diff --git a/linux-user/loongarch64/signal.c b/linux-user/loongarch64/signal.c
new file mode 100644
index 0000000000..e291d72f85
--- /dev/null
+++ b/linux-user/loongarch64/signal.c
@@ -0,0 +1,312 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * LoongArch emulation of Linux signals
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#include "qemu/osdep.h"
+#include "qemu.h"
+#include "user-internals.h"
+#include "signal-common.h"
+#include "linux-user/trace.h"
+
+#include "target/loongarch/internals.h"
+
+/* FP context was used */
+#define SC_USED_FP              (1 << 0)
+
+struct target_sigcontext {
+    uint64_t sc_pc;
+    uint64_t sc_regs[32];
+    uint32_t sc_flags;
+    uint64_t sc_extcontext[0] __attribute__((aligned(16)));
+};
+
+struct target_fpu_context {
+    uint64_t regs[32];
+    uint64_t fcc;
+    uint32_t fcsr;
+};
+
+struct target_sctx_info {
+    uint32_t magic;
+    uint32_t size;
+    uint64_t padding;  /* padding to 16 bytes */
+};
+
+struct target_ucontext {
+    target_ulong tuc_flags;
+    struct target_ucontext *tuc_link;
+    target_stack_t tuc_stack;
+    target_sigset_t tuc_sigmask;
+    uint8_t __unused[1024 / 8 - sizeof(target_sigset_t)];
+    struct target_sigcontext tuc_mcontext;
+};
+
+struct target_rt_sigframe {
+    struct target_siginfo rs_info;
+    struct target_ucontext rs_uc;
+};
+
+struct ctx_layout {
+    abi_ulong addr;
+    unsigned int size;
+};
+
+struct extctx_layout {
+    unsigned int size;
+    unsigned int flags;
+    struct ctx_layout fpu;
+    struct ctx_layout end;
+};
+
+static uint64_t read_all_fcc(CPULoongArchState *env)
+{
+    uint64_t ret = 0;
+
+    for (int i = 0; i < 8; ++i) {
+        ret |= (uint64_t)env->cf[i] << (i * 8);
+    }
+
+    return ret;
+}
+
+static void write_all_fcc(CPULoongArchState *env, uint64_t val)
+{
+    for (int i = 0; i < 8; ++i) {
+        env->cf[i] = (val >> (i * 8)) & 1;
+    }
+}
+
+static void *get_ctx(struct target_sctx_info *info)
+{
+    return (char *)info + sizeof(struct target_sctx_info);
+}
+
+static void copy_fpu_to_sigcontext(CPULoongArchState *env,
+                                   struct extctx_layout *extctx)
+{
+    int i;
+    struct target_sctx_info *info = (struct target_sctx_info *)extctx->fpu.addr;
+    struct target_fpu_context *fpu_ctx = get_ctx(info);
+
+    for (i = 1; i < 32; ++i) {
+        __put_user(env->fpr[i], &fpu_ctx->regs[i]);
+    }
+
+    fpu_ctx->fcc = read_all_fcc(env);
+    __put_user(env->fcsr0, &fpu_ctx->fcsr);
+    __put_user(extctx->fpu.size, &info->size);
+}
+
+static abi_ulong extframe_alloc(struct extctx_layout *extctx,
+                                struct ctx_layout *layout,
+                                size_t size, abi_ulong base)
+{
+    abi_ulong new_base = base - size;
+
+    new_base -= sizeof(struct target_sctx_info);
+    layout->addr = new_base;
+    layout->size = (unsigned int)(base - new_base);
+    extctx->size += layout->size;
+
+    return new_base;
+}
+
+static abi_ulong setup_extcontext(struct extctx_layout *extctx, abi_ulong sp)
+{
+    abi_ulong new_sp = sp;
+
+    memset(extctx, 0, sizeof(struct extctx_layout));
+    new_sp -= sizeof(struct target_sctx_info);
+
+    extctx->end.addr = new_sp;
+    extctx->end.size = (unsigned int)sizeof(struct target_sctx_info);
+    extctx->size += extctx->end.size;
+    extctx->flags = SC_USED_FP;
+
+    new_sp = extframe_alloc(extctx, &extctx->fpu,
+                            sizeof(struct target_fpu_context), new_sp);
+
+    return new_sp;
+}
+
+static void setup_sigcontext(CPULoongArchState *env,
+                             struct target_sigcontext *sc,
+                             struct extctx_layout *extctx)
+{
+    int i;
+
+    __put_user(extctx->flags, &sc->sc_flags);
+    __put_user(env->pc, &sc->sc_pc);
+
+    for (i = 1; i < 32; ++i) {
+        __put_user(env->gpr[i], &sc->sc_regs[i]);
+    }
+
+    copy_fpu_to_sigcontext(env, extctx);
+}
+
+static void copy_fpu_from_sigcontext(CPULoongArchState *env,
+                                     struct extctx_layout *extctx)
+{
+    int i;
+    struct target_sctx_info *info = (struct target_sctx_info *)extctx->fpu.addr;
+    struct target_fpu_context *fpu_ctx = get_ctx(info);
+
+    for (i = 1; i < 32; ++i) {
+        __get_user(env->fpr[i], &fpu_ctx->regs[i]);
+    }
+    write_all_fcc(env, fpu_ctx->fcc);
+    __get_user(env->fcsr0, &fpu_ctx->fcsr);
+}
+
+static int parse_extcontext(struct target_sigcontext *sc,
+                             struct extctx_layout *extctx)
+{
+    unsigned int size;
+    struct target_sctx_info *info = (struct target_sctx_info *)
+                                    &sc->sc_extcontext;
+
+    __get_user(size, &info->size);
+
+    if (size < (sizeof(struct target_sctx_info) +
+                sizeof(struct target_fpu_context))) {
+        return -TARGET_EINVAL;
+    }
+
+    extctx->fpu.addr = (abi_ulong)info;
+    info = (struct target_sctx_info *)((char *)info + size);
+
+    return 0;
+}
+
+static int restore_sigcontext(CPULoongArchState *env,
+                               struct target_sigcontext *sc)
+{
+    int i;
+    int ret = 0;
+    struct extctx_layout extctx;
+
+    memset(&extctx, 0, sizeof(struct extctx_layout));
+
+    __get_user(extctx.flags, &sc->sc_flags);
+
+    ret = parse_extcontext(sc, &extctx);
+    if (ret < 0) {
+        goto bad;
+    }
+
+    __get_user(env->pc, &sc->sc_pc);
+    for (i = 1; i < 32; ++i) {
+        __get_user(env->gpr[i], &sc->sc_regs[i]);
+    }
+
+    copy_fpu_from_sigcontext(env, &extctx);
+    restore_fp_status(env);
+
+bad:
+    return ret;
+}
+
+/*
+ * Determine which stack to use.
+ */
+static abi_ulong get_sigframe(struct target_sigaction *ka,
+                              CPULoongArchState *env, size_t frame_size,
+                              struct extctx_layout *extctx)
+{
+    abi_ulong sp;
+
+    sp = target_sigsp(get_sp_from_cpustate(env) - 32, ka);
+    sp = setup_extcontext(extctx, sp);
+
+    return (sp - frame_size) & ~15;
+}
+
+void setup_rt_frame(int sig, struct target_sigaction *ka,
+                    target_siginfo_t *info,
+                    target_sigset_t *set, CPULoongArchState *env)
+{
+    struct target_rt_sigframe *frame;
+    struct extctx_layout extctx;
+    abi_ulong frame_addr;
+    int i;
+
+    frame_addr = get_sigframe(ka, env, sizeof(*frame), &extctx);
+    trace_user_setup_rt_frame(env, frame_addr);
+    if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
+        goto give_sigsegv;
+    }
+
+    tswap_siginfo(&frame->rs_info, info);
+
+    __put_user(0, &frame->rs_uc.tuc_flags);
+    __put_user(0, &frame->rs_uc.tuc_link);
+    target_save_altstack(&frame->rs_uc.tuc_stack, env);
+
+    setup_sigcontext(env, &frame->rs_uc.tuc_mcontext, &extctx);
+
+    for (i = 0; i < TARGET_NSIG_WORDS; i++) {
+        __put_user(set->sig[i], &frame->rs_uc.tuc_sigmask.sig[i]);
+    }
+
+    env->gpr[4] = sig;
+    env->gpr[5] = frame_addr + offsetof(struct target_rt_sigframe, rs_info);
+    env->gpr[6] = frame_addr + offsetof(struct target_rt_sigframe, rs_uc);
+    env->gpr[3] = frame_addr;
+    env->gpr[1] = default_rt_sigreturn;
+
+    env->pc = ka->_sa_handler;
+    unlock_user_struct(frame, frame_addr, 1);
+    return;
+
+give_sigsegv:
+    unlock_user_struct(frame, frame_addr, 1);
+    force_sigsegv(sig);
+}
+
+long do_rt_sigreturn(CPULoongArchState *env)
+{
+    int ret = 0;
+    struct target_rt_sigframe *frame;
+    abi_ulong frame_addr;
+    sigset_t blocked;
+
+    frame_addr = env->gpr[3];
+    trace_user_do_rt_sigreturn(env, frame_addr);
+    if (!lock_user_struct(VERIFY_READ, frame, frame_addr, 1)) {
+        goto badframe;
+    }
+
+    target_to_host_sigset(&blocked, &frame->rs_uc.tuc_sigmask);
+    set_sigmask(&blocked);
+
+    ret = restore_sigcontext(env, &frame->rs_uc.tuc_mcontext);
+    if (ret < 0) {
+        goto badframe;
+    }
+
+    target_restore_altstack(&frame->rs_uc.tuc_stack, env);
+
+    unlock_user_struct(frame, frame_addr, 0);
+    return -QEMU_ESIGRETURN;
+
+badframe:
+    unlock_user_struct(frame, frame_addr, 0);
+    force_sig(TARGET_SIGSEGV);
+    return -QEMU_ESIGRETURN;
+}
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 8, 0);
+    assert(tramp != NULL);
+
+    __put_user(0x03822c0b, tramp + 0);  /* ori     a7, zero, 0x8b */
+    __put_user(0x002b0000, tramp + 1);  /* syscall 0 */
+
+    default_rt_sigreturn = sigtramp_page;
+    unlock_user(tramp, sigtramp_page, 8);
+}
diff --git a/linux-user/loongarch64/target_signal.h b/linux-user/loongarch64/target_signal.h
new file mode 100644
index 0000000000..ad3aaffcb4
--- /dev/null
+++ b/linux-user/loongarch64/target_signal.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#ifndef LOONGARCH_TARGET_SIGNAL_H
+#define LOONGARCH_TARGET_SIGNAL_H
+
+#include "../generic/signal.h"
+
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
+#endif /* LOONGARCH_TARGET_SIGNAL_H */
-- 
2.31.1


