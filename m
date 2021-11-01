Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B29441953
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 11:02:16 +0100 (CET)
Received: from localhost ([::1]:36400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhU8t-00005p-74
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 06:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mhTzk-0005te-N5
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 05:52:48 -0400
Received: from mail.loongson.cn ([114.242.206.163]:50826 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mhTzh-0008Dh-04
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 05:52:48 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn2u3uH9hbKIjAA--.55994S21; 
 Mon, 01 Nov 2021 17:52:28 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 19/29] linux-user: Add LoongArch signal support
Date: Mon,  1 Nov 2021 17:51:41 +0800
Message-Id: <1635760311-20015-20-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1635760311-20015-1-git-send-email-gaosong@loongson.cn>
References: <1635760311-20015-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9Dxn2u3uH9hbKIjAA--.55994S21
X-Coremail-Antispam: 1UD129KBjvJXoW3Xr4kJr4UAF47ur47Cry3urg_yoWxWr18pF
 Wxuw1kGrWUJrWI9r97G3WFvFyrWwn5Gr17KayxGw1rAw1DX3yF9as7trZFyF15AwnrGF1j
 9Fyq93W5uF48GFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) SPF_HELO_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 philmd@redhat.com, i.qemu@xen0n.name, richard.henderson@linaro.org,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 yangxiaojuan@loongson.cn, alistair.francis@wdc.com, maobibo@loongson.cn,
 pbonzini@redhat.com, bmeng.cn@gmail.com, alex.bennee@linaro.org,
 gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 accel/tcg/user-exec.c                  |  15 +++
 linux-user/loongarch64/signal.c        | 163 +++++++++++++++++++++++++++++++++
 linux-user/loongarch64/target_signal.h |  30 ++++++
 3 files changed, 208 insertions(+)
 create mode 100644 linux-user/loongarch64/signal.c
 create mode 100644 linux-user/loongarch64/target_signal.h

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index e6bb29b..7604b0a 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -803,6 +803,21 @@ int cpu_signal_handler(int host_signum, void *pinfo,
     return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
 }
 
+#elif defined(__loongarch64__)
+
+int cpu_signal_handler(int host_signum, void *pinfo,
+                       void *puc)
+{
+    siginfo_t *info = pinfo;
+    ucontext_t *uc = puc;
+    greg_t pc = uc->uc_mcontext.__pc;
+    int is_write;
+
+    /* XXX: compute is_write */
+    is_write = 0;
+    return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
+}
+
 #elif defined(__riscv)
 
 int cpu_signal_handler(int host_signum, void *pinfo,
diff --git a/linux-user/loongarch64/signal.c b/linux-user/loongarch64/signal.c
new file mode 100644
index 0000000..4f289e1
--- /dev/null
+++ b/linux-user/loongarch64/signal.c
@@ -0,0 +1,163 @@
+/*
+ * LoongArch emulation of Linux signals
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+#include "qemu/osdep.h"
+#include "qemu.h"
+#include "signal-common.h"
+#include "user-internals.h"
+#include "linux-user/trace.h"
+
+struct target_sigcontext {
+    uint64_t   sc_pc;
+    uint64_t   sc_gpr[32];
+    uint64_t   sc_fpr[32];
+    uint64_t   sc_fcc;
+    uint32_t   sc_fcsr;
+    uint32_t   sc_flags;
+};
+
+struct target_ucontext {
+    target_ulong tuc_flags;
+    target_ulong tuc_link;
+    target_stack_t tuc_stack;
+    target_ulong pad0;
+    struct target_sigcontext tuc_mcontext;
+    target_sigset_t tuc_sigmask;
+};
+
+struct target_rt_sigframe {
+    struct target_siginfo rs_info;
+    struct target_ucontext rs_uc;
+};
+
+static inline void setup_sigcontext(CPULoongArchState *env,
+                                    struct target_sigcontext *sc)
+{
+    int i;
+
+    __put_user(env->pc, &sc->sc_pc);
+
+    __put_user(0, &sc->sc_gpr[0]);
+    for (i = 1; i < 32; ++i) {
+        __put_user(env->gpr[i], &sc->sc_gpr[i]);
+    }
+
+    for (i = 0; i < 32; ++i) {
+        __put_user(env->fpr[i], &sc->sc_fpr[i]);
+    }
+}
+
+static inline void
+restore_sigcontext(CPULoongArchState *env, struct target_sigcontext *sc)
+{
+    int i;
+
+    __get_user(env->pc, &sc->sc_pc);
+
+    for (i = 1; i < 32; ++i) {
+        __get_user(env->gpr[i], &sc->sc_gpr[i]);
+    }
+
+    for (i = 0; i < 32; ++i) {
+        __get_user(env->fpr[i], &sc->sc_fpr[i]);
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
+    return (sp - frame_size) & ~7;
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
+    env->pc = env->gpr[20] = ka->_sa_handler;
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
+    return -TARGET_QEMU_ESIGRETURN;
+
+badframe:
+    unlock_user_struct(frame, frame_addr, 0);
+    force_sig(TARGET_SIGSEGV);
+    return -TARGET_QEMU_ESIGRETURN;
+}
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 8, 0);
+    assert(tramp != NULL);
+
+    __put_user(0x03822c0b, tramp + 0);  /* ori     a7, a7, 0x8b */
+    __put_user(0x002b0000, tramp + 1);  /* syscall 0 */
+
+    default_rt_sigreturn = sigtramp_page;
+    unlock_user(tramp, sigtramp_page, 8);
+}
diff --git a/linux-user/loongarch64/target_signal.h b/linux-user/loongarch64/target_signal.h
new file mode 100644
index 0000000..2deb88c
--- /dev/null
+++ b/linux-user/loongarch64/target_signal.h
@@ -0,0 +1,30 @@
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+#ifndef LOONGARCH_TARGET_SIGNAL_H
+#define LOONGARCH_TARGET_SIGNAL_H
+
+/* this struct defines a stack used during syscall handling */
+typedef struct target_sigaltstack {
+        abi_long ss_sp;
+        abi_int ss_flags;
+        abi_ulong ss_size;
+} target_stack_t;
+
+/*
+ * sigaltstack controls
+ */
+#define TARGET_SS_ONSTACK     1
+#define TARGET_SS_DISABLE     2
+
+#define TARGET_MINSIGSTKSZ    2048
+#define TARGET_SIGSTKSZ       8192
+
+#include "../generic/signal.h"
+
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
+#endif /* LOONGARCH_TARGET_SIGNAL_H */
-- 
1.8.3.1


