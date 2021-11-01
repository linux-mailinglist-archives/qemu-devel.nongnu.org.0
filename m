Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD73441951
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 11:01:44 +0100 (CET)
Received: from localhost ([::1]:34016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhU8N-0006v7-Qz
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 06:01:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mhTzm-0005uY-0T
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 05:52:50 -0400
Received: from mail.loongson.cn ([114.242.206.163]:50906 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mhTzh-0008Du-Gz
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 05:52:49 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn2u3uH9hbKIjAA--.55994S24; 
 Mon, 01 Nov 2021 17:52:29 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 22/29] linux-user: Add LoongArch cpu_loop support
Date: Mon,  1 Nov 2021 17:51:44 +0800
Message-Id: <1635760311-20015-23-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1635760311-20015-1-git-send-email-gaosong@loongson.cn>
References: <1635760311-20015-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9Dxn2u3uH9hbKIjAA--.55994S24
X-Coremail-Antispam: 1UD129KBjvJXoWxXrWUGr17Kr4UWr1xWw1fCrg_yoWrurykpF
 y3Cr13tr4kX3y7KwsxJr98ZF15Zr4IgrsrGaySkFWrCay7Jry8Cr1qgr9rtFyUC3yUuF1x
 Zr9Iv3ZF9F45uF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
 configure                           |  5 ++
 linux-user/loongarch64/cpu_loop.c   | 98 +++++++++++++++++++++++++++++++++++++
 linux-user/loongarch64/target_cpu.h | 35 +++++++++++++
 3 files changed, 138 insertions(+)
 create mode 100644 linux-user/loongarch64/cpu_loop.c
 create mode 100644 linux-user/loongarch64/target_cpu.h

diff --git a/configure b/configure
index 039467c..9563595 100755
--- a/configure
+++ b/configure
@@ -579,6 +579,8 @@ elif check_define __arm__ ; then
   cpu="arm"
 elif check_define __aarch64__ ; then
   cpu="aarch64"
+elif check_define __loongarch64__ ; then
+  cpu="loongarch64"
 else
   cpu=$(uname -m)
 fi
@@ -610,6 +612,9 @@ case "$cpu" in
   sparc|sun4[cdmuv])
     cpu="sparc"
   ;;
+  loongarch)
+    cpu="loongarch"
+  ;;
   *)
     # This will result in either an error or falling back to TCI later
     ARCH=unknown
diff --git a/linux-user/loongarch64/cpu_loop.c b/linux-user/loongarch64/cpu_loop.c
new file mode 100644
index 0000000..2529683
--- /dev/null
+++ b/linux-user/loongarch64/cpu_loop.c
@@ -0,0 +1,98 @@
+/*
+ * QEMU LoongArch user cpu_loop.
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+#include "qemu/osdep.h"
+#include "qemu.h"
+#include "qemu-common.h"
+#include "user-internals.h"
+#include "cpu_loop-common.h"
+#include "signal-common.h"
+
+void cpu_loop(CPULoongArchState *env)
+{
+    CPUState *cs = env_cpu(env);
+    int trapnr, si_code;
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
+            force_sig_fault(TARGET_SIGSEGV, TARGET_SEGV_MAPERR, env->badaddr);
+            break;
+        case EXCP_INE:
+            force_sig_fault(TARGET_SIGILL, 0, env->pc);
+            break;
+        case EXCP_FPE:
+            si_code = TARGET_FPE_FLTUNK;
+            if (GET_FP_CAUSE(env->fcsr0) & FP_INVALID) {
+                si_code = TARGET_FPE_FLTINV;
+            } else if (GET_FP_CAUSE(env->fcsr0) & FP_DIV0) {
+                si_code = TARGET_FPE_FLTDIV;
+            } else if (GET_FP_CAUSE(env->fcsr0) & FP_OVERFLOW) {
+                si_code = TARGET_FPE_FLTOVF;
+            } else if (GET_FP_CAUSE(env->fcsr0) & FP_UNDERFLOW) {
+                si_code = TARGET_FPE_FLTUND;
+            } else if (GET_FP_CAUSE(env->fcsr0) & FP_INEXACT) {
+                si_code = TARGET_FPE_FLTRES;
+            }
+            force_sig_fault(TARGET_SIGFPE, si_code, env->pc);
+            break;
+        case EXCP_DEBUG:
+        case EXCP_BREAK:
+            force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
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
+    env->pc = regs->csr_era;
+
+}
diff --git a/linux-user/loongarch64/target_cpu.h b/linux-user/loongarch64/target_cpu.h
new file mode 100644
index 0000000..5bd13a7
--- /dev/null
+++ b/linux-user/loongarch64/target_cpu.h
@@ -0,0 +1,35 @@
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
-- 
1.8.3.1


