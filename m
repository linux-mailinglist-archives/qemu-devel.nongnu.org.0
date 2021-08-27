Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D0C3F9538
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 09:35:50 +0200 (CEST)
Received: from localhost ([::1]:47300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJWOz-0000rU-KW
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 03:35:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mJW5s-0001Yu-SK
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 03:16:05 -0400
Received: from mail.loongson.cn ([114.242.206.163]:59876 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mJW5g-0003XX-5O
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 03:16:04 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxtOTvkChhno4AAA--.2304S19; 
 Fri, 27 Aug 2021 15:15:36 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 17/19] LoongArch Linux User Emulation
Date: Fri, 27 Aug 2021 15:14:52 +0800
Message-Id: <1630048494-2143-18-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1630048494-2143-1-git-send-email-gaosong@loongson.cn>
References: <1630048494-2143-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9AxtOTvkChhno4AAA--.2304S19
X-Coremail-Antispam: 1UD129KBjvAXoWfZrWrAr4fGr4DKF4rGw45KFg_yoWrXr1kAo
 WxJF1aqw1kGr1fua1kWw17Wr1UZF9rJF18Jr4UAFy8GFnFqr1DWr13tay8WFn3ArySgFy5
 tFyjqr1qya90yF1kn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUUUUUU=
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 richard.henderson@linaro.org, f4bug@amsat.org, maobibo@loongson.cn,
 laurent@vivier.eu, yangxiaojuan@loongson.cn, alistair.francis@wdc.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implementation of linux user emulation for LoongArch.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 include/elf.h                              |   2 +
 linux-user/elfload.c                       |  58 ++++++
 linux-user/loongarch64/cpu_loop.c          | 108 ++++++++++
 linux-user/loongarch64/signal.c            | 178 +++++++++++++++++
 linux-user/loongarch64/sockbits.h          |   1 +
 linux-user/loongarch64/syscall_nr.h        | 307 +++++++++++++++++++++++++++++
 linux-user/loongarch64/target_cpu.h        |  36 ++++
 linux-user/loongarch64/target_elf.h        |  14 ++
 linux-user/loongarch64/target_errno_defs.h |   7 +
 linux-user/loongarch64/target_fcntl.h      |  12 ++
 linux-user/loongarch64/target_signal.h     |  28 +++
 linux-user/loongarch64/target_structs.h    |  49 +++++
 linux-user/loongarch64/target_syscall.h    |  46 +++++
 linux-user/loongarch64/termbits.h          | 229 +++++++++++++++++++++
 linux-user/syscall_defs.h                  |  10 +-
 15 files changed, 1081 insertions(+), 4 deletions(-)
 create mode 100644 linux-user/loongarch64/cpu_loop.c
 create mode 100644 linux-user/loongarch64/signal.c
 create mode 100644 linux-user/loongarch64/sockbits.h
 create mode 100644 linux-user/loongarch64/syscall_nr.h
 create mode 100644 linux-user/loongarch64/target_cpu.h
 create mode 100644 linux-user/loongarch64/target_elf.h
 create mode 100644 linux-user/loongarch64/target_errno_defs.h
 create mode 100644 linux-user/loongarch64/target_fcntl.h
 create mode 100644 linux-user/loongarch64/target_signal.h
 create mode 100644 linux-user/loongarch64/target_structs.h
 create mode 100644 linux-user/loongarch64/target_syscall.h
 create mode 100644 linux-user/loongarch64/termbits.h

diff --git a/include/elf.h b/include/elf.h
index 811bf4a..3a4bcb6 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -182,6 +182,8 @@ typedef struct mips_elf_abiflags_v0 {
 
 #define EM_NANOMIPS     249     /* Wave Computing nanoMIPS */
 
+#define EM_LOONGARCH    258     /* LoongArch */
+
 /*
  * This is an interim value that we will use until the committee comes
  * up with a final number.
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 01e9a83..cf47ccd 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -909,6 +909,64 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUPPCState *en
 
 #endif
 
+#ifdef TARGET_LOONGARCH64
+
+#define ELF_START_MMAP 0x80000000
+
+#define ELF_CLASS   ELFCLASS64
+#define ELF_ARCH    EM_LOONGARCH
+
+#define elf_check_arch(x) ((x) == EM_LOONGARCH)
+static inline void init_thread(struct target_pt_regs *regs,
+                               struct image_info *infop)
+{
+    regs->csr_crmd = 2 << 3;
+    regs->csr_era = infop->entry;
+    regs->regs[3] = infop->start_stack;
+}
+
+/* See linux kernel: arch/loongarch/include/asm/elf.h.  */
+#define ELF_NREG 45
+typedef target_elf_greg_t target_elf_gregset_t[ELF_NREG];
+
+/* See linux kernel: arch/loongarch/include/asm/reg.h.  */
+enum {
+    TARGET_EF_R0 = 0,
+    TARGET_EF_CSR_ERA = TARGET_EF_R0 + 32,
+    TARGET_EF_CSR_BADVADDR = TARGET_EF_R0 + 33,
+};
+
+/* See linux kernel: arch/loongarch/kernel/process.c:loongarch_dump_regs64. */
+static void elf_core_copy_regs(target_elf_gregset_t *regs,
+                               const CPULoongArchState *env)
+{
+    int i;
+
+    for (i = 0; i < TARGET_EF_R0; i++) {
+        (*regs)[i] = 0;
+    }
+    (*regs)[TARGET_EF_R0] = 0;
+
+    for (i = 1; i < ARRAY_SIZE(env->gpr); i++) {
+        (*regs)[TARGET_EF_R0 + i] = tswapreg(env->gpr[i]);
+    }
+
+    (*regs)[TARGET_EF_CSR_ERA] = tswapreg(env->pc);
+    (*regs)[TARGET_EF_CSR_BADVADDR] = tswapreg(env->badaddr);
+}
+
+#define USE_ELF_CORE_DUMP
+#define ELF_EXEC_PAGESIZE        4096
+
+#define ELF_HWCAP get_elf_hwcap()
+
+static uint32_t get_elf_hwcap(void)
+{
+    return 0;
+}
+
+#endif /* TARGET_LOONGARCH64 */
+
 #ifdef TARGET_MIPS
 
 #define ELF_START_MMAP 0x80000000
diff --git a/linux-user/loongarch64/cpu_loop.c b/linux-user/loongarch64/cpu_loop.c
new file mode 100644
index 0000000..bc81d22
--- /dev/null
+++ b/linux-user/loongarch64/cpu_loop.c
@@ -0,0 +1,108 @@
+/*
+ * QEMU LoongArch user cpu loop.
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+#include "qemu/osdep.h"
+#include "qemu.h"
+#include "qemu-common.h"
+#include "cpu_loop-common.h"
+#include "elf.h"
+
+void cpu_loop(CPULoongArchState *env)
+{
+    CPUState *cs = env_cpu(env);
+    target_siginfo_t info;
+    int trapnr;
+    abi_long ret;
+
+    for (;;) {
+        cpu_exec_start(cs);
+        trapnr = cpu_exec(cs);
+        cpu_exec_end(cs);
+        process_queued_cpu_work(cs);
+
+        switch (trapnr) {
+        case EXCP_INTERRUPT:
+            /* just indicate that signals should be handled asap */
+            break;
+        case EXCP_SYSCALL:
+            env->pc += 4;
+            ret = do_syscall(env, env->gpr[11],
+                             env->gpr[4], env->gpr[5],
+                             env->gpr[6], env->gpr[7],
+                             env->gpr[8], env->gpr[9],
+                             -1, -1);
+            if (ret == -TARGET_ERESTARTSYS) {
+                env->pc -= 4;
+                break;
+            }
+            if (ret == -TARGET_QEMU_ESIGRETURN) {
+                /*
+                 * Returning from a successful sigreturn syscall.
+                 * Avoid clobbering register state.
+                 */
+                break;
+            }
+            env->gpr[4] = ret;
+            break;
+        case EXCP_ADE:
+            info.si_signo = TARGET_SIGSEGV;
+            info.si_errno = 0;
+            info.si_code = TARGET_SEGV_MAPERR;
+            info._sifields._sigfault._addr = env->badaddr;
+            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            break;
+        case EXCP_INE:
+            info.si_signo = TARGET_SIGILL;
+            info.si_errno = 0;
+            info.si_code = 0;
+            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            break;
+        case EXCP_FPE:
+            info.si_signo = TARGET_SIGFPE;
+            info.si_errno = 0;
+            info.si_code = TARGET_FPE_FLTUNK;
+            if (GET_FP_CAUSE(env->fcsr0) & FP_INVALID) {
+                info.si_code = TARGET_FPE_FLTINV;
+            } else if (GET_FP_CAUSE(env->fcsr0) & FP_DIV0) {
+                info.si_code = TARGET_FPE_FLTDIV;
+            } else if (GET_FP_CAUSE(env->fcsr0) & FP_OVERFLOW) {
+                info.si_code = TARGET_FPE_FLTOVF;
+            } else if (GET_FP_CAUSE(env->fcsr0) & FP_UNDERFLOW) {
+                info.si_code = TARGET_FPE_FLTUND;
+            } else if (GET_FP_CAUSE(env->fcsr0) & FP_INEXACT) {
+                info.si_code = TARGET_FPE_FLTRES;
+            }
+            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            break;
+        case EXCP_BREAK:
+            info.si_signo = TARGET_SIGTRAP;
+            info.si_code = TARGET_TRAP_BRKPT;
+            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            break;
+        case EXCP_ATOMIC:
+            cpu_exec_step_atomic(cs);
+            break;
+        default:
+            EXCP_DUMP(env, "qemu: unhandled CPU exception 0x%x - aborting\n",
+                      trapnr);
+            exit(EXIT_FAILURE);
+        }
+        process_pending_signals(env);
+    }
+}
+
+void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
+{
+    int i;
+
+    for (i = 0; i < 32; i++) {
+        env->gpr[i] = regs->regs[i];
+    }
+    env->pc = regs->csr_era & ~(target_ulong)1;
+
+}
diff --git a/linux-user/loongarch64/signal.c b/linux-user/loongarch64/signal.c
new file mode 100644
index 0000000..2da8317
--- /dev/null
+++ b/linux-user/loongarch64/signal.c
@@ -0,0 +1,178 @@
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
+struct sigframe {
+    uint32_t sf_ass[4];             /* argument save space for o32 */
+    uint32_t sf_code[2];            /* signal trampoline */
+    struct target_sigcontext sf_sc;
+    target_sigset_t sf_mask;
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
+    uint32_t rs_ass[4];            /* argument save space for o32 */
+    uint32_t rs_code[2];           /* signal trampoline */
+    struct target_siginfo rs_info;
+    struct target_ucontext rs_uc;
+};
+
+/* Install trampoline to jump back from signal handler */
+static inline int install_sigtramp(unsigned int *tramp, unsigned int syscall)
+{
+    int err = 0;
+
+    /*
+     * Set up the return code ...
+     *
+     *         li      a7, 139
+     *         syscall
+     */
+
+    __put_user(0x03822c0b, tramp + 0);  /* ori  a7, a7, 0x8b */
+    __put_user(0x002b0000, tramp + 1);  /* syscall 0 */
+    return err;
+}
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
+    install_sigtramp(frame->rs_code, TARGET_NR_rt_sigreturn);
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
+    env->gpr[1] = frame_addr + offsetof(struct target_rt_sigframe, rs_code);
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
diff --git a/linux-user/loongarch64/sockbits.h b/linux-user/loongarch64/sockbits.h
new file mode 100644
index 0000000..0e4c8f0
--- /dev/null
+++ b/linux-user/loongarch64/sockbits.h
@@ -0,0 +1 @@
+#include "../generic/sockbits.h"
diff --git a/linux-user/loongarch64/syscall_nr.h b/linux-user/loongarch64/syscall_nr.h
new file mode 100644
index 0000000..64cb17d
--- /dev/null
+++ b/linux-user/loongarch64/syscall_nr.h
@@ -0,0 +1,307 @@
+#ifndef LINUX_USER_LOONGARCH_SYSCALL_NR_H
+#define LINUX_USER_LOONGARCH_SYSCALL_NR_H
+
+/* copy from kernel: include/uapi/asm-generic/unistd.h */
+#define TARGET_NR_io_setup 0
+#define TARGET_NR_io_destroy 1
+#define TARGET_NR_io_submit 2
+#define TARGET_NR_io_cancel 3
+#define TARGET_NR_io_getevents 4
+#define TARGET_NR_setxattr 5
+#define TARGET_NR_lsetxattr 6
+#define TARGET_NR_fsetxattr 7
+#define TARGET_NR_getxattr 8
+#define TARGET_NR_lgetxattr 9
+#define TARGET_NR_fgetxattr 10
+#define TARGET_NR_listxattr 11
+#define TARGET_NR_llistxattr 12
+#define TARGET_NR_flistxattr 13
+#define TARGET_NR_removexattr 14
+#define TARGET_NR_lremovexattr 15
+#define TARGET_NR_fremovexattr 16
+#define TARGET_NR_getcwd 17
+#define TARGET_NR_lookup_dcookie 18
+#define TARGET_NR_eventfd2 19
+#define TARGET_NR_epoll_create1 20
+#define TARGET_NR_epoll_ctl 21
+#define TARGET_NR_epoll_pwait 22
+#define TARGET_NR_dup 23
+#define TARGET_NR_dup3 24
+#define TARGET_NR_fcntl 25
+#define TARGET_NR_inotify_init1 26
+#define TARGET_NR_inotify_add_watch 27
+#define TARGET_NR_inotify_rm_watch 28
+#define TARGET_NR_ioctl 29
+#define TARGET_NR_ioprio_set 30
+#define TARGET_NR_ioprio_get 31
+#define TARGET_NR_flock 32
+#define TARGET_NR_mknodat 33
+#define TARGET_NR_mkdirat 34
+#define TARGET_NR_unlinkat 35
+#define TARGET_NR_symlinkat 36
+#define TARGET_NR_linkat 37
+#define TARGET_NR_renameat 38
+#define TARGET_NR_umount2 39
+#define TARGET_NR_mount 40
+#define TARGET_NR_pivot_root 41
+#define TARGET_NR_nfsservctl 42
+#define TARGET_NR_statfs 43
+#define TARGET_NR_fstatfs 44
+#define TARGET_NR_truncate 45
+#define TARGET_NR_ftruncate 46
+#define TARGET_NR_fallocate 47
+#define TARGET_NR_faccessat 48
+#define TARGET_NR_chdir 49
+#define TARGET_NR_fchdir 50
+#define TARGET_NR_chroot 51
+#define TARGET_NR_fchmod 52
+#define TARGET_NR_fchmodat 53
+#define TARGET_NR_fchownat 54
+#define TARGET_NR_fchown 55
+#define TARGET_NR_openat 56
+#define TARGET_NR_close 57
+#define TARGET_NR_vhangup 58
+#define TARGET_NR_pipe2 59
+#define TARGET_NR_quotactl 60
+#define TARGET_NR_getdents64 61
+#define TARGET_NR_lseek 62
+#define TARGET_NR_read 63
+#define TARGET_NR_write 64
+#define TARGET_NR_readv 65
+#define TARGET_NR_writev 66
+#define TARGET_NR_pread64 67
+#define TARGET_NR_pwrite64 68
+#define TARGET_NR_preadv 69
+#define TARGET_NR_pwritev 70
+#define TARGET_NR_sendfile 71
+#define TARGET_NR_pselect6 72
+#define TARGET_NR_ppoll 73
+#define TARGET_NR_signalfd4 74
+#define TARGET_NR_vmsplice 75
+#define TARGET_NR_splice 76
+#define TARGET_NR_tee 77
+#define TARGET_NR_readlinkat 78
+#define TARGET_NR_newfstatat 79
+#define TARGET_NR_fstat 80
+#define TARGET_NR_sync 81
+#define TARGET_NR_fsync 82
+#define TARGET_NR_fdatasync 83
+#define TARGET_NR_sync_file_range 84
+#define TARGET_NR_timerfd_create 85
+#define TARGET_NR_timerfd_settime 86
+#define TARGET_NR_timerfd_gettime 87
+#define TARGET_NR_utimensat 88
+#define TARGET_NR_acct 89
+#define TARGET_NR_capget 90
+#define TARGET_NR_capset 91
+#define TARGET_NR_personality 92
+#define TARGET_NR_exit 93
+#define TARGET_NR_exit_group 94
+#define TARGET_NR_waitid 95
+#define TARGET_NR_set_tid_address 96
+#define TARGET_NR_unshare 97
+#define TARGET_NR_futex 98
+#define TARGET_NR_set_robust_list 99
+#define TARGET_NR_get_robust_list 100
+#define TARGET_NR_nanosleep 101
+#define TARGET_NR_getitimer 102
+#define TARGET_NR_setitimer 103
+#define TARGET_NR_kexec_load 104
+#define TARGET_NR_init_module 105
+#define TARGET_NR_delete_module 106
+#define TARGET_NR_timer_create 107
+#define TARGET_NR_timer_gettime 108
+#define TARGET_NR_timer_getoverrun 109
+#define TARGET_NR_timer_settime 110
+#define TARGET_NR_timer_delete 111
+#define TARGET_NR_clock_settime 112
+#define TARGET_NR_clock_gettime 113
+#define TARGET_NR_clock_getres 114
+#define TARGET_NR_clock_nanosleep 115
+#define TARGET_NR_syslog 116
+#define TARGET_NR_ptrace 117
+#define TARGET_NR_sched_setparam 118
+#define TARGET_NR_sched_setscheduler 119
+#define TARGET_NR_sched_getscheduler 120
+#define TARGET_NR_sched_getparam 121
+#define TARGET_NR_sched_setaffinity 122
+#define TARGET_NR_sched_getaffinity 123
+#define TARGET_NR_sched_yield 124
+#define TARGET_NR_sched_get_priority_max 125
+#define TARGET_NR_sched_get_priority_min 126
+#define TARGET_NR_sched_rr_get_interval 127
+#define TARGET_NR_restart_syscall 128
+#define TARGET_NR_kill 129
+#define TARGET_NR_tkill 130
+#define TARGET_NR_tgkill 131
+#define TARGET_NR_sigaltstack 132
+#define TARGET_NR_rt_sigsuspend 133
+#define TARGET_NR_rt_sigaction 134
+#define TARGET_NR_rt_sigprocmask 135
+#define TARGET_NR_rt_sigpending 136
+#define TARGET_NR_rt_sigtimedwait 137
+#define TARGET_NR_rt_sigqueueinfo 138
+#define TARGET_NR_rt_sigreturn 139
+#define TARGET_NR_setpriority 140
+#define TARGET_NR_getpriority 141
+#define TARGET_NR_reboot 142
+#define TARGET_NR_setregid 143
+#define TARGET_NR_setgid 144
+#define TARGET_NR_setreuid 145
+#define TARGET_NR_setuid 146
+#define TARGET_NR_setresuid 147
+#define TARGET_NR_getresuid 148
+#define TARGET_NR_setresgid 149
+#define TARGET_NR_getresgid 150
+#define TARGET_NR_setfsuid 151
+#define TARGET_NR_setfsgid 152
+#define TARGET_NR_times 153
+#define TARGET_NR_setpgid 154
+#define TARGET_NR_getpgid 155
+#define TARGET_NR_getsid 156
+#define TARGET_NR_setsid 157
+#define TARGET_NR_getgroups 158
+#define TARGET_NR_setgroups 159
+#define TARGET_NR_uname 160
+#define TARGET_NR_sethostname 161
+#define TARGET_NR_setdomainname 162
+#define TARGET_NR_getrlimit 163
+#define TARGET_NR_setrlimit 164
+#define TARGET_NR_getrusage 165
+#define TARGET_NR_umask 166
+#define TARGET_NR_prctl 167
+#define TARGET_NR_getcpu 168
+#define TARGET_NR_gettimeofday 169
+#define TARGET_NR_settimeofday 170
+#define TARGET_NR_adjtimex 171
+#define TARGET_NR_getpid 172
+#define TARGET_NR_getppid 173
+#define TARGET_NR_getuid 174
+#define TARGET_NR_geteuid 175
+#define TARGET_NR_getgid 176
+#define TARGET_NR_getegid 177
+#define TARGET_NR_gettid 178
+#define TARGET_NR_sysinfo 179
+#define TARGET_NR_mq_open 180
+#define TARGET_NR_mq_unlink 181
+#define TARGET_NR_mq_timedsend 182
+#define TARGET_NR_mq_timedreceive 183
+#define TARGET_NR_mq_notify 184
+#define TARGET_NR_mq_getsetattr 185
+#define TARGET_NR_msgget 186
+#define TARGET_NR_msgctl 187
+#define TARGET_NR_msgrcv 188
+#define TARGET_NR_msgsnd 189
+#define TARGET_NR_semget 190
+#define TARGET_NR_semctl 191
+#define TARGET_NR_semtimedop 192
+#define TARGET_NR_semop 193
+#define TARGET_NR_shmget 194
+#define TARGET_NR_shmctl 195
+#define TARGET_NR_shmat 196
+#define TARGET_NR_shmdt 197
+#define TARGET_NR_socket 198
+#define TARGET_NR_socketpair 199
+#define TARGET_NR_bind 200
+#define TARGET_NR_listen 201
+#define TARGET_NR_accept 202
+#define TARGET_NR_connect 203
+#define TARGET_NR_getsockname 204
+#define TARGET_NR_getpeername 205
+#define TARGET_NR_sendto 206
+#define TARGET_NR_recvfrom 207
+#define TARGET_NR_setsockopt 208
+#define TARGET_NR_getsockopt 209
+#define TARGET_NR_shutdown 210
+#define TARGET_NR_sendmsg 211
+#define TARGET_NR_recvmsg 212
+#define TARGET_NR_readahead 213
+#define TARGET_NR_brk 214
+#define TARGET_NR_munmap 215
+#define TARGET_NR_mremap 216
+#define TARGET_NR_add_key 217
+#define TARGET_NR_request_key 218
+#define TARGET_NR_keyctl 219
+#define TARGET_NR_clone 220
+#define TARGET_NR_execve 221
+#define TARGET_NR_mmap 222
+#define TARGET_NR_fadvise64 223
+#define TARGET_NR_swapon 224
+#define TARGET_NR_swapoff 225
+#define TARGET_NR_mprotect 226
+#define TARGET_NR_msync 227
+#define TARGET_NR_mlock 228
+#define TARGET_NR_munlock 229
+#define TARGET_NR_mlockall 230
+#define TARGET_NR_munlockall 231
+#define TARGET_NR_mincore 232
+#define TARGET_NR_madvise 233
+#define TARGET_NR_remap_file_pages 234
+#define TARGET_NR_mbind 235
+#define TARGET_NR_get_mempolicy 236
+#define TARGET_NR_set_mempolicy 237
+#define TARGET_NR_migrate_pages 238
+#define TARGET_NR_move_pages 239
+#define TARGET_NR_rt_tgsigqueueinfo 240
+#define TARGET_NR_perf_event_open 241
+#define TARGET_NR_accept4 242
+#define TARGET_NR_recvmmsg 243
+#define TARGET_NR_arch_specific_syscall 244
+#define TARGET_NR_wait4 260
+#define TARGET_NR_prlimit64 261
+#define TARGET_NR_fanotify_init 262
+#define TARGET_NR_fanotify_mark 263
+#define TARGET_NR_name_to_handle_at 264
+#define TARGET_NR_open_by_handle_at 265
+#define TARGET_NR_clock_adjtime 266
+#define TARGET_NR_syncfs 267
+#define TARGET_NR_setns 268
+#define TARGET_NR_sendmmsg 269
+#define TARGET_NR_process_vm_readv 270
+#define TARGET_NR_process_vm_writev 271
+#define TARGET_NR_kcmp 272
+#define TARGET_NR_finit_module 273
+#define TARGET_NR_sched_setattr 274
+#define TARGET_NR_sched_getattr 275
+#define TARGET_NR_renameat2 276
+#define TARGET_NR_seccomp 277
+#define TARGET_NR_getrandom 278
+#define TARGET_NR_memfd_create 279
+#define TARGET_NR_bpf 280
+#define TARGET_NR_execveat 281
+#define TARGET_NR_userfaultfd 282
+#define TARGET_NR_membarrier 283
+#define TARGET_NR_mlock2 284
+#define TARGET_NR_copy_file_range 285
+#define TARGET_NR_preadv2 286
+#define TARGET_NR_pwritev2 287
+#define TARGET_NR_pkey_mprotect 288
+#define TARGET_NR_pkey_alloc 289
+#define TARGET_NR_pkey_free 290
+#define TARGET_NR_statx 291
+#define TARGET_NR_io_pgetevents 292
+#define TARGET_NR_rseq 293
+#define TARGET_NR_kexec_file_load 294
+#define TARGET_NR_pidfd_send_signal 424
+#define TARGET_NR_io_uring_setup 425
+#define TARGET_NR_io_uring_enter 426
+#define TARGET_NR_io_uring_register 427
+#define TARGET_NR_open_tree 428
+#define TARGET_NR_move_mount 429
+#define TARGET_NR_fsopen 430
+#define TARGET_NR_fsconfig 431
+#define TARGET_NR_fsmount 432
+#define TARGET_NR_fspick 433
+#define TARGET_NR_pidfd_open 434
+#define TARGET_NR_clone3 435
+#define TARGET_NR_close_range 436
+#define TARGET_NR_openat2 437
+#define TARGET_NR_pidfd_getfd 438
+#define TARGET_NR_faccessat2 439
+#define TARGET_NR_process_madvise 440
+#define TARGET_NR_epoll_pwait2 441
+#define TARGET_NR_mount_setattr 442
+
+#define TARGET_NR_syscalls 443
+
+#endif
diff --git a/linux-user/loongarch64/target_cpu.h b/linux-user/loongarch64/target_cpu.h
new file mode 100644
index 0000000..9896271
--- /dev/null
+++ b/linux-user/loongarch64/target_cpu.h
@@ -0,0 +1,36 @@
+/*
+ * LoongArch specific CPU ABI and functions for linux-user
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+#ifndef LOONGARCH_TARGET_CPU_H
+#define LOONGARCH_TARGET_CPU_H
+
+static inline void cpu_clone_regs_child(CPULoongArchState *env,
+                                        target_ulong newsp, unsigned flags)
+{
+    if (newsp) {
+        env->gpr[3] = newsp;
+    }
+    env->gpr[7] = 0;
+    env->gpr[4] = 0;
+}
+
+static inline void cpu_clone_regs_parent(CPULoongArchState *env,
+                                         unsigned flags)
+{
+}
+
+static inline void cpu_set_tls(CPULoongArchState *env, target_ulong newtls)
+{
+    env->gpr[2] = newtls;
+}
+
+static inline abi_ulong get_sp_from_cpustate(CPULoongArchState *state)
+{
+    return state->gpr[3];
+}
+#endif
diff --git a/linux-user/loongarch64/target_elf.h b/linux-user/loongarch64/target_elf.h
new file mode 100644
index 0000000..7c88394
--- /dev/null
+++ b/linux-user/loongarch64/target_elf.h
@@ -0,0 +1,14 @@
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+
+#ifndef LOONGARCH_TARGET_ELF_H
+#define LOONGARCH_TARGET_ELF_H
+static inline const char *cpu_get_model(uint32_t eflags)
+{
+    return "Loongson-3A5000";
+}
+#endif
diff --git a/linux-user/loongarch64/target_errno_defs.h b/linux-user/loongarch64/target_errno_defs.h
new file mode 100644
index 0000000..17165c1
--- /dev/null
+++ b/linux-user/loongarch64/target_errno_defs.h
@@ -0,0 +1,7 @@
+#ifndef LOONGARCH_TARGET_ERRNO_DEFS_H
+#define LOONGARCH_TARGET_ERRNO_DEFS_H
+
+/* Target uses generic errno */
+#include "../generic/target_errno_defs.h"
+
+#endif
diff --git a/linux-user/loongarch64/target_fcntl.h b/linux-user/loongarch64/target_fcntl.h
new file mode 100644
index 0000000..b810293
--- /dev/null
+++ b/linux-user/loongarch64/target_fcntl.h
@@ -0,0 +1,12 @@
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+#ifndef LOONGARCH_TARGET_FCNTL_H
+#define LOONGARCH_TARGET_FCNTL_H
+
+#include "../generic/fcntl.h"
+
+#endif  /* LOONGARCH_TARGET_FCNTL_H */
diff --git a/linux-user/loongarch64/target_signal.h b/linux-user/loongarch64/target_signal.h
new file mode 100644
index 0000000..713c26a
--- /dev/null
+++ b/linux-user/loongarch64/target_signal.h
@@ -0,0 +1,28 @@
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
+#endif /* LOONGARCH_TARGET_SIGNAL_H */
diff --git a/linux-user/loongarch64/target_structs.h b/linux-user/loongarch64/target_structs.h
new file mode 100644
index 0000000..818e8d6
--- /dev/null
+++ b/linux-user/loongarch64/target_structs.h
@@ -0,0 +1,49 @@
+/*
+ * LoongArch specific structures for linux-user
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+#ifndef LOONGARCH_TARGET_STRUCTS_H
+#define LOONGARCH_TARGET_STRUCTS_H
+
+struct target_ipc_perm {
+    abi_int __key;                      /* Key.  */
+    abi_uint uid;                       /* Owner's user ID.  */
+    abi_uint gid;                       /* Owner's group ID.  */
+    abi_uint cuid;                      /* Creator's user ID.  */
+    abi_uint cgid;                      /* Creator's group ID.  */
+    abi_uint mode;                      /* Read/write permission.  */
+    abi_ushort __seq;                   /* Sequence number.  */
+    abi_ushort __pad1;
+    abi_ulong __unused1;
+    abi_ulong __unused2;
+};
+
+struct target_shmid_ds {
+    struct target_ipc_perm shm_perm;    /* operation permission struct */
+    abi_long shm_segsz;                 /* size of segment in bytes */
+    abi_ulong shm_atime;                /* time of last shmat() */
+    abi_ulong shm_dtime;                /* time of last shmdt() */
+    abi_ulong shm_ctime;                /* time of last change by shmctl() */
+    abi_int shm_cpid;                   /* pid of creator */
+    abi_int shm_lpid;                   /* pid of last shmop */
+    abi_ulong shm_nattch;               /* number of current attaches */
+    abi_ulong __unused1;
+    abi_ulong __unused2;
+};
+
+#define TARGET_SEMID64_DS
+
+struct target_semid64_ds {
+    struct target_ipc_perm sem_perm;
+    abi_ulong sem_otime;
+    abi_ulong sem_ctime;
+    abi_ulong sem_nsems;
+    abi_ulong __unused1;
+    abi_ulong __unused2;
+};
+
+#endif
diff --git a/linux-user/loongarch64/target_syscall.h b/linux-user/loongarch64/target_syscall.h
new file mode 100644
index 0000000..b98ac12
--- /dev/null
+++ b/linux-user/loongarch64/target_syscall.h
@@ -0,0 +1,46 @@
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+#ifndef LOONGARCH_TARGET_SYSCALL_H
+#define LOONGARCH_TARGET_SYSCALL_H
+
+/*
+ * this struct defines the way the registers are stored on the
+ * stack during a system call.
+ */
+
+struct target_pt_regs {
+    /* Saved main processor registers. */
+    target_ulong regs[32];
+
+    /* Saved special registers. */
+    target_ulong csr_crmd;
+    target_ulong csr_prmd;
+    target_ulong csr_euen;
+    target_ulong csr_ecfg;
+    target_ulong csr_estat;
+    target_ulong csr_era;
+    target_ulong csr_badvaddr;
+    target_ulong orig_a0;
+    target_ulong __last[0];
+};
+
+#define UNAME_MACHINE "loongarch"
+#define UNAME_MINIMUM_RELEASE "4.19.0"
+
+#define TARGET_MINSIGSTKSZ 2048
+#define TARGET_MCL_CURRENT 1
+#define TARGET_MCL_FUTURE  2
+#define TARGET_MCL_ONFAULT 4
+
+#define TARGET_FORCE_SHMLBA
+
+static inline abi_ulong target_shmlba(CPULoongArchState *env)
+{
+    return 0x40000;
+}
+
+#endif
diff --git a/linux-user/loongarch64/termbits.h b/linux-user/loongarch64/termbits.h
new file mode 100644
index 0000000..33e74ed
--- /dev/null
+++ b/linux-user/loongarch64/termbits.h
@@ -0,0 +1,229 @@
+#ifndef LINUX_USER_LOONGARCH_TERMBITS_H
+#define LINUX_USER_LOONGARCH_TERMBITS_H
+
+#define TARGET_NCCS 19
+
+typedef unsigned char   target_cc_t;        /* cc_t */
+typedef unsigned int    target_speed_t;     /* speed_t */
+typedef unsigned int    target_tcflag_t;    /* tcflag_t */
+
+struct target_termios {
+    target_tcflag_t c_iflag;               /* input mode flags */
+    target_tcflag_t c_oflag;               /* output mode flags */
+    target_tcflag_t c_cflag;               /* control mode flags */
+    target_tcflag_t c_lflag;               /* local mode flags */
+    target_cc_t c_line;                    /* line discipline */
+    target_cc_t c_cc[TARGET_NCCS];         /* control characters */
+};
+
+/* c_iflag bits */
+#define TARGET_IGNBRK  0000001
+#define TARGET_BRKINT  0000002
+#define TARGET_IGNPAR  0000004
+#define TARGET_PARMRK  0000010
+#define TARGET_INPCK   0000020
+#define TARGET_ISTRIP  0000040
+#define TARGET_INLCR   0000100
+#define TARGET_IGNCR   0000200
+#define TARGET_ICRNL   0000400
+#define TARGET_IUCLC   0001000
+#define TARGET_IXON    0002000
+#define TARGET_IXANY   0004000
+#define TARGET_IXOFF   0010000
+#define TARGET_IMAXBEL 0020000
+#define TARGET_IUTF8   0040000
+
+/* c_oflag bits */
+#define TARGET_OPOST   0000001
+#define TARGET_OLCUC   0000002
+#define TARGET_ONLCR   0000004
+#define TARGET_OCRNL   0000010
+#define TARGET_ONOCR   0000020
+#define TARGET_ONLRET  0000040
+#define TARGET_OFILL   0000100
+#define TARGET_OFDEL   0000200
+#define TARGET_NLDLY   0000400
+#define   TARGET_NL0   0000000
+#define   TARGET_NL1   0000400
+#define TARGET_CRDLY   0003000
+#define   TARGET_CR0   0000000
+#define   TARGET_CR1   0001000
+#define   TARGET_CR2   0002000
+#define   TARGET_CR3   0003000
+#define TARGET_TABDLY  0014000
+#define   TARGET_TAB0  0000000
+#define   TARGET_TAB1  0004000
+#define   TARGET_TAB2  0010000
+#define   TARGET_TAB3  0014000
+#define   TARGET_XTABS 0014000
+#define TARGET_BSDLY   0020000
+#define   TARGET_BS0   0000000
+#define   TARGET_BS1   0020000
+#define TARGET_VTDLY   0040000
+#define   TARGET_VT0   0000000
+#define   TARGET_VT1   0040000
+#define TARGET_FFDLY   0100000
+#define   TARGET_FF0   0000000
+#define   TARGET_FF1   0100000
+
+/* c_cflag bit meaning */
+#define TARGET_CBAUD   0010017
+#define  TARGET_B0     0000000         /* hang up */
+#define  TARGET_B50    0000001
+#define  TARGET_B75    0000002
+#define  TARGET_B110   0000003
+#define  TARGET_B134   0000004
+#define  TARGET_B150   0000005
+#define  TARGET_B200   0000006
+#define  TARGET_B300   0000007
+#define  TARGET_B600   0000010
+#define  TARGET_B1200  0000011
+#define  TARGET_B1800  0000012
+#define  TARGET_B2400  0000013
+#define  TARGET_B4800  0000014
+#define  TARGET_B9600  0000015
+#define  TARGET_B19200 0000016
+#define  TARGET_B38400 0000017
+#define TARGET_EXTA B19200
+#define TARGET_EXTB B38400
+#define TARGET_CSIZE   0000060
+#define   TARGET_CS5   0000000
+#define   TARGET_CS6   0000020
+#define   TARGET_CS7   0000040
+#define   TARGET_CS8   0000060
+#define TARGET_CSTOPB  0000100
+#define TARGET_CREAD   0000200
+#define TARGET_PARENB  0000400
+#define TARGET_PARODD  0001000
+#define TARGET_HUPCL   0002000
+#define TARGET_CLOCAL  0004000
+#define TARGET_CBAUDEX 0010000
+#define  TARGET_B57600  0010001
+#define  TARGET_B115200 0010002
+#define  TARGET_B230400 0010003
+#define  TARGET_B460800 0010004
+#define TARGET_CIBAUD    002003600000  /* input baud rate (not used) */
+#define TARGET_CMSPAR    010000000000  /* mark or space (stick) parity */
+#define TARGET_CRTSCTS   020000000000  /* flow control */
+
+/* c_lflag bits */
+#define TARGET_ISIG    0000001
+#define TARGET_ICANON  0000002
+#define TARGET_XCASE   0000004
+#define TARGET_ECHO    0000010
+#define TARGET_ECHOE   0000020
+#define TARGET_ECHOK   0000040
+#define TARGET_ECHONL  0000100
+#define TARGET_NOFLSH  0000200
+#define TARGET_TOSTOP  0000400
+#define TARGET_ECHOCTL 0001000
+#define TARGET_ECHOPRT 0002000
+#define TARGET_ECHOKE  0004000
+#define TARGET_FLUSHO  0010000
+#define TARGET_PENDIN  0040000
+#define TARGET_IEXTEN  0100000
+#define TARGET_EXTPROC 0200000
+
+/* c_cc character offsets */
+#define TARGET_VINTR    0
+#define TARGET_VQUIT    1
+#define TARGET_VERASE   2
+#define TARGET_VKILL    3
+#define TARGET_VEOF     4
+#define TARGET_VTIME    5
+#define TARGET_VMIN     6
+#define TARGET_VSWTC    7
+#define TARGET_VSTART   8
+#define TARGET_VSTOP    9
+#define TARGET_VSUSP    10
+#define TARGET_VEOL     11
+#define TARGET_VREPRINT 12
+#define TARGET_VDISCARD 13
+#define TARGET_VWERASE  14
+#define TARGET_VLNEXT   15
+#define TARGET_VEOL2    16
+
+/* ioctls */
+
+#define TARGET_TCGETS           0x5401
+#define TARGET_TCSETS           0x5402
+#define TARGET_TCSETSW          0x5403
+#define TARGET_TCSETSF          0x5404
+#define TARGET_TCGETA           0x5405
+#define TARGET_TCSETA           0x5406
+#define TARGET_TCSETAW          0x5407
+#define TARGET_TCSETAF          0x5408
+#define TARGET_TCSBRK           0x5409
+#define TARGET_TCXONC           0x540A
+#define TARGET_TCFLSH           0x540B
+
+#define TARGET_TIOCEXCL         0x540C
+#define TARGET_TIOCNXCL         0x540D
+#define TARGET_TIOCSCTTY        0x540E
+#define TARGET_TIOCGPGRP        0x540F
+#define TARGET_TIOCSPGRP        0x5410
+#define TARGET_TIOCOUTQ         0x5411
+#define TARGET_TIOCSTI          0x5412
+#define TARGET_TIOCGWINSZ       0x5413
+#define TARGET_TIOCSWINSZ       0x5414
+#define TARGET_TIOCMGET         0x5415
+#define TARGET_TIOCMBIS         0x5416
+#define TARGET_TIOCMBIC         0x5417
+#define TARGET_TIOCMSET         0x5418
+#define TARGET_TIOCGSOFTCAR     0x5419
+#define TARGET_TIOCSSOFTCAR     0x541A
+#define TARGET_FIONREAD         0x541B
+#define TARGET_TIOCINQ          TARGET_FIONREAD
+#define TARGET_TIOCLINUX        0x541C
+#define TARGET_TIOCCONS         0x541D
+#define TARGET_TIOCGSERIAL      0x541E
+#define TARGET_TIOCSSERIAL      0x541F
+#define TARGET_TIOCPKT          0x5420
+#define TARGET_FIONBIO          0x5421
+#define TARGET_TIOCNOTTY        0x5422
+#define TARGET_TIOCSETD         0x5423
+#define TARGET_TIOCGETD         0x5424
+#define TARGET_TCSBRKP          0x5425 /* Needed for POSIX tcsendbreak() */
+#define TARGET_TIOCTTYGSTRUCT   0x5426 /* For debugging only */
+#define TARGET_TIOCSBRK         0x5427 /* BSD compatibility */
+#define TARGET_TIOCCBRK         0x5428 /* BSD compatibility */
+#define TARGET_TIOCGSID         0x5429 /* Return the session ID of FD */
+#define TARGET_TIOCGPTN         TARGET_IOR('T', 0x30, unsigned int)
+        /* Get Pty Number (of pty-mux device) */
+#define TARGET_TIOCSPTLCK       TARGET_IOW('T', 0x31, int)
+        /* Lock/unlock Pty */
+#define TARGET_TIOCGPTPEER      TARGET_IO('T', 0x41)
+        /* Safely open the slave */
+
+#define TARGET_FIONCLEX         0x5450  /* these numbers need to be adjusted. */
+#define TARGET_FIOCLEX          0x5451
+#define TARGET_FIOASYNC         0x5452
+#define TARGET_TIOCSERCONFIG    0x5453
+#define TARGET_TIOCSERGWILD     0x5454
+#define TARGET_TIOCSERSWILD     0x5455
+#define TARGET_TIOCGLCKTRMIOS   0x5456
+#define TARGET_TIOCSLCKTRMIOS   0x5457
+#define TARGET_TIOCSERGSTRUCT   0x5458 /* For debugging only */
+#define TARGET_TIOCSERGETLSR    0x5459 /* Get line status register */
+#define TARGET_TIOCSERGETMULTI  0x545A /* Get multiport config  */
+#define TARGET_TIOCSERSETMULTI  0x545B /* Set multiport config */
+
+#define TARGET_TIOCMIWAIT      0x545C
+        /* wait for a change on serial input line(s) */
+#define TARGET_TIOCGICOUNT     0x545D
+        /* read serial port inline interrupt counts */
+#define TARGET_TIOCGHAYESESP   0x545E  /* Get Hayes ESP configuration */
+#define TARGET_TIOCSHAYESESP   0x545F  /* Set Hayes ESP configuration */
+
+/* Used for packet mode */
+#define TARGET_TIOCPKT_DATA              0
+#define TARGET_TIOCPKT_FLUSHREAD         1
+#define TARGET_TIOCPKT_FLUSHWRITE        2
+#define TARGET_TIOCPKT_STOP              4
+#define TARGET_TIOCPKT_START             8
+#define TARGET_TIOCPKT_NOSTOP           16
+#define TARGET_TIOCPKT_DOSTOP           32
+
+#define TARGET_TIOCSER_TEMT    0x01 /* Transmitter physically empty */
+
+#endif
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index a5ce487..92e1a35 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -74,7 +74,7 @@
     || defined(TARGET_M68K) || defined(TARGET_CRIS) \
     || defined(TARGET_S390X) || defined(TARGET_OPENRISC) \
     || defined(TARGET_NIOS2) || defined(TARGET_RISCV) \
-    || defined(TARGET_XTENSA)
+    || defined(TARGET_XTENSA) || defined(TARGET_LOONGARCH64)
 
 #define TARGET_IOC_SIZEBITS	14
 #define TARGET_IOC_DIRBITS	2
@@ -450,7 +450,7 @@ struct target_dirent64 {
 #define TARGET_SIG_IGN	((abi_long)1)	/* ignore signal */
 #define TARGET_SIG_ERR	((abi_long)-1)	/* error return from signal */
 
-#ifdef TARGET_MIPS
+#if defined(TARGET_MIPS) || defined(TARGET_LOONGARCH64)
 #define TARGET_NSIG	   128
 #else
 #define TARGET_NSIG	   64
@@ -2129,7 +2129,8 @@ struct target_stat64  {
     abi_ulong __unused5;
 };
 
-#elif defined(TARGET_OPENRISC) || defined(TARGET_NIOS2) || defined(TARGET_RISCV)
+#elif defined(TARGET_OPENRISC) || defined(TARGET_NIOS2) || \
+      defined(TARGET_RISCV) || defined(TARGET_LOONGARCH64)
 
 /* These are the asm-generic versions of the stat and stat64 structures */
 
@@ -2327,7 +2328,8 @@ struct target_statfs64 {
 };
 #elif (defined(TARGET_PPC64) || defined(TARGET_X86_64) || \
        defined(TARGET_SPARC64) || defined(TARGET_AARCH64) || \
-       defined(TARGET_RISCV)) && !defined(TARGET_ABI32)
+       defined(TARGET_RISCV) || defined(TARGET_LOONGARCH64)) && \
+       !defined(TARGET_ABI32)
 struct target_statfs {
 	abi_long f_type;
 	abi_long f_bsize;
-- 
1.8.3.1


