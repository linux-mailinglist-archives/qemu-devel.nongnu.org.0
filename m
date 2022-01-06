Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F6748628E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 11:00:15 +0100 (CET)
Received: from localhost ([::1]:45928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5PZ8-000353-8M
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 05:00:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1n5PII-0001f4-D2
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:42:50 -0500
Received: from mail.loongson.cn ([114.242.206.163]:56940 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1n5PIF-0003Uq-2I
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:42:50 -0500
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz8toudZhmQsAAA--.229S21;
 Thu, 06 Jan 2022 17:42:34 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v14 19/26] linux-user: Add LoongArch signal support
Date: Thu,  6 Jan 2022 04:41:53 -0500
Message-Id: <20220106094200.1801206-20-gaosong@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220106094200.1801206-1-gaosong@loongson.cn>
References: <20220106094200.1801206-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxz8toudZhmQsAAA--.229S21
X-Coremail-Antispam: 1UD129KBjvJXoW3Xr4DZr47CFWkJryUCrW8Xrb_yoWxGrWDpF
 Wfuwn7G3yUJrWxu34kG3WFqFyrWwn5GryUKFWxG3WrAws5J3yF9as7trZrtF1DAw17Grn0
 kF909a1YkF48WFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 linux-user/loongarch64/signal.c        | 198 +++++++++++++++++++++++++
 linux-user/loongarch64/target_signal.h |  13 ++
 2 files changed, 211 insertions(+)
 create mode 100644 linux-user/loongarch64/signal.c
 create mode 100644 linux-user/loongarch64/target_signal.h

diff --git a/linux-user/loongarch64/signal.c b/linux-user/loongarch64/signal.c
new file mode 100644
index 0000000000..9f0e6421b2
--- /dev/null
+++ b/linux-user/loongarch64/signal.c
@@ -0,0 +1,198 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * LoongArch emulation of Linux signals
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#include "qemu/osdep.h"
+#include "qemu.h"
+#include "signal-common.h"
+#include "user-internals.h"
+#include "linux-user/trace.h"
+
+#define FPU_REG_WIDTH 256
+union fpureg {
+    uint32_t val32[FPU_REG_WIDTH / 32];
+    uint64_t val64[FPU_REG_WIDTH / 64];
+};
+
+struct target_sigcontext {
+    uint64_t sc_pc;
+    uint64_t sc_regs[32];
+    uint32_t sc_flags;
+    uint32_t sc_fcsr;
+    uint32_t sc_vcsr;
+    uint64_t sc_fcc;
+    uint64_t sc_scr[4];
+    union fpureg sc_fpregs[32] __attribute__((aligned(32)));
+    uint8_t sc_reserved[4096] __attribute__((aligned(16)));
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
+static inline void setup_sigcontext(CPULoongArchState *env,
+                                    struct target_sigcontext *sc)
+{
+    int i;
+
+    __put_user(env->pc, &sc->sc_pc);
+    __put_user(0, &sc->sc_regs[0]);
+    __put_user(env->fcsr0, &sc->sc_fcsr);
+    __put_user(0, &sc->sc_vcsr);
+    sc->sc_fcc = read_all_fcc(env);
+
+    for (i = 0; i < 4; ++i) {
+        __put_user(0, &sc->sc_scr[i]);
+    }
+
+    for (i = 1; i < 32; ++i) {
+        __put_user(env->gpr[i], &sc->sc_regs[i]);
+    }
+
+    for (i = 0; i < 32; ++i) {
+        __put_user(env->fpr[i], &sc->sc_fpregs[i].val64[0]);
+    }
+}
+
+static inline void
+restore_sigcontext(CPULoongArchState *env, struct target_sigcontext *sc)
+{
+    int i;
+
+    __get_user(env->pc, &sc->sc_pc);
+    __get_user(env->fcsr0, &sc->sc_fcsr);
+    write_all_fcc(env, sc->sc_fcc);
+
+    for (i = 1; i < 32; ++i) {
+        __get_user(env->gpr[i], &sc->sc_regs[i]);
+    }
+
+    for (i = 0; i < 32; ++i) {
+        __get_user(env->fpr[i], &sc->sc_fpregs[i].val64[0]);
+    }
+}
+
+/*
+ * Determine which stack to use..
+ */
+static inline abi_ulong
+get_sigframe(struct target_sigaction *ka, CPULoongArchState *env,
+             size_t frame_size)
+{
+    unsigned long sp;
+
+    sp = target_sigsp(get_sp_from_cpustate(env) - 32, ka);
+
+    return (sp - frame_size) & ~15;
+}
+
+void setup_rt_frame(int sig, struct target_sigaction *ka,
+                    target_siginfo_t *info,
+                    target_sigset_t *set, CPULoongArchState *env)
+{
+    struct target_rt_sigframe *frame;
+    abi_ulong frame_addr;
+    int i;
+
+    frame_addr = get_sigframe(ka, env, sizeof(*frame));
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
+    setup_sigcontext(env, &frame->rs_uc.tuc_mcontext);
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
+    restore_sigcontext(env, &frame->rs_uc.tuc_mcontext);
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
2.27.0


