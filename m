Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F30369BC1
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 23:04:43 +0200 (CEST)
Received: from localhost ([::1]:49100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la2yf-0008Ti-CO
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 17:04:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2bL-00062P-Gv
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:40:37 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:46704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2b8-0008F1-D9
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:40:35 -0400
Received: by mail-io1-xd2c.google.com with SMTP id b9so2630443iod.13
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 13:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lyXM6hliagBe1YqegqFTwczILeo0yv536s9PmRh/HLM=;
 b=d8AmWQvYQ4yqejKngT2xuW/vmxU8RqmN+JsK77EsBcOfQgK+7I242GMv0gX0yg3wuv
 XBYqXhy+3iQjdi+1zI6vb3S/MvACDsYvprwupwK/VcboefE7kz7RTP7GPv4ou42JvbHT
 1A2XhLsW/i/q9vbXXK9Tr6my7kxupVmCj5CVQtPN1JdX6r4Sz5Gfy7pnr2nRFvjMI3JF
 BWZPq70tN84UDek9sHxA21RmUSvKb9JHkrFYFv1OHqzLBA9Zbdd98xzCQxsuyRg3uay5
 eAr4/PzMoqXLTxG+R6dcE3St9DhX63bSCc9TSgdOeOWHR2ZEXp+0H1+13g+cHCHvjQg9
 k41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lyXM6hliagBe1YqegqFTwczILeo0yv536s9PmRh/HLM=;
 b=YHkWArWuDVrCLbKg5rFbiOF5sipUAF5+rc030n7nbqwqoaoHXODl94T/Dzkapki/WF
 SGQLZW5iiWxORWOLG86BNi88aeCYqm4WNJQHCldURteuQyf/4EXRnYqMVuhpnUTMKkcd
 RMdAgem3toNUjo25g77HmJBDzBBra9QHDJkaQzJqpMnNIc3WJmvehqMcI43KQYOwQhEr
 uxDuWPGG+dhfQSD7AJOHdsihFOyoCZoE7hszjSWXOYVitr1Og5PaIVc9NSkC85X3aNSt
 M51KxW7Gty9nvQI2lC2vD00e9NclhL2a5QFfUo6532rCCPwAgxb3bb5r8HBSDf7Zo+gS
 fNEg==
X-Gm-Message-State: AOAM532XlAqWYJHWCk6UR8N0MVxMFeANoDqPdbgq+lWKEpcQM0sD/DGy
 dzxCASGQR+FWL1Jgs+Gt1hQoUzQDyaY5tHmg
X-Google-Smtp-Source: ABdhPJylVaBlas4gCTDYQ8lH43o8u7UD5KZhp9isjv1ED5/KrC5Wkl8CJrjwfXAZRbPGPcfiltePew==
X-Received: by 2002:a05:6602:2e82:: with SMTP id
 m2mr4627581iow.70.1619210420880; 
 Fri, 23 Apr 2021 13:40:20 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id n1sm3201308ion.22.2021.04.23.13.40.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Apr 2021 13:40:20 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 23/24] bsd-user: move x86 (i386 and x86_64) cpu_loop to
 target_arch_cpu.h
Date: Fri, 23 Apr 2021 14:39:58 -0600
Message-Id: <20210423203959.78275-14-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210423203959.78275-1-imp@bsdimp.com>
References: <20210423203959.78275-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Move the x86 version of the cpu_loop to target_arch_cpu.h as
target_cpu_loop. Create a cpu_loop that calls the target_cpu_loop function, but
only for x86 for now. This is code-movement only commit.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/i386/target_arch_cpu.h | 283 +++++++++++++++++++++++++++++++
 bsd-user/main.c                 | 284 +-------------------------------
 2 files changed, 286 insertions(+), 281 deletions(-)

diff --git a/bsd-user/i386/target_arch_cpu.h b/bsd-user/i386/target_arch_cpu.h
index c05e048b9b..c71b2ac3ec 100644
--- a/bsd-user/i386/target_arch_cpu.h
+++ b/bsd-user/i386/target_arch_cpu.h
@@ -19,4 +19,287 @@
 #ifndef _TARGET_ARCH_CPU_H_
 #define _TARGET_ARCH_CPU_H_
 
+/***********************************************************/
+/* CPUX86 core interface */
+
+uint64_t cpu_get_tsc(CPUX86State *env)
+{
+    return cpu_get_host_ticks();
+}
+
+static void write_dt(void *ptr, unsigned long addr, unsigned long limit,
+                     int flags)
+{
+    unsigned int e1, e2;
+    uint32_t *p;
+    e1 = (addr << 16) | (limit & 0xffff);
+    e2 = ((addr >> 16) & 0xff) | (addr & 0xff000000) | (limit & 0x000f0000);
+    e2 |= flags;
+    p = ptr;
+    p[0] = tswap32(e1);
+    p[1] = tswap32(e2);
+}
+
+static uint64_t *idt_table;
+#ifdef TARGET_X86_64
+static void set_gate64(void *ptr, unsigned int type, unsigned int dpl,
+                       uint64_t addr, unsigned int sel)
+{
+    uint32_t *p, e1, e2;
+    e1 = (addr & 0xffff) | (sel << 16);
+    e2 = (addr & 0xffff0000) | 0x8000 | (dpl << 13) | (type << 8);
+    p = ptr;
+    p[0] = tswap32(e1);
+    p[1] = tswap32(e2);
+    p[2] = tswap32(addr >> 32);
+    p[3] = 0;
+}
+/* only dpl matters as we do only user space emulation */
+static void set_idt(int n, unsigned int dpl)
+{
+    set_gate64(idt_table + n * 2, 0, dpl, 0, 0);
+}
+#else
+static void set_gate(void *ptr, unsigned int type, unsigned int dpl,
+                     uint32_t addr, unsigned int sel)
+{
+    uint32_t *p, e1, e2;
+    e1 = (addr & 0xffff) | (sel << 16);
+    e2 = (addr & 0xffff0000) | 0x8000 | (dpl << 13) | (type << 8);
+    p = ptr;
+    p[0] = tswap32(e1);
+    p[1] = tswap32(e2);
+}
+
+/* only dpl matters as we do only user space emulation */
+static void set_idt(int n, unsigned int dpl)
+{
+    set_gate(idt_table + n, 0, dpl, 0, 0);
+}
+#endif
+
+void target_cpu_loop(CPUX86State *env)
+{
+    CPUState *cs = env_cpu(env);
+    int trapnr;
+    abi_ulong pc;
+    /* target_siginfo_t info; */
+
+    for (;;) {
+        cpu_exec_start(cs);
+        trapnr = cpu_exec(cs);
+        cpu_exec_end(cs);
+        process_queued_cpu_work(cs);
+
+        switch (trapnr) {
+        case 0x80:
+            /* syscall from int $0x80 */
+            if (bsd_type == target_freebsd) {
+                abi_ulong params = (abi_ulong) env->regs[R_ESP] +
+                    sizeof(int32_t);
+                int32_t syscall_nr = env->regs[R_EAX];
+                int32_t arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8;
+
+                if (syscall_nr == TARGET_FREEBSD_NR_syscall) {
+                    get_user_s32(syscall_nr, params);
+                    params += sizeof(int32_t);
+                } else if (syscall_nr == TARGET_FREEBSD_NR___syscall) {
+                    get_user_s32(syscall_nr, params);
+                    params += sizeof(int64_t);
+                }
+                get_user_s32(arg1, params);
+                params += sizeof(int32_t);
+                get_user_s32(arg2, params);
+                params += sizeof(int32_t);
+                get_user_s32(arg3, params);
+                params += sizeof(int32_t);
+                get_user_s32(arg4, params);
+                params += sizeof(int32_t);
+                get_user_s32(arg5, params);
+                params += sizeof(int32_t);
+                get_user_s32(arg6, params);
+                params += sizeof(int32_t);
+                get_user_s32(arg7, params);
+                params += sizeof(int32_t);
+                get_user_s32(arg8, params);
+                env->regs[R_EAX] = do_freebsd_syscall(env,
+                                                      syscall_nr,
+                                                      arg1,
+                                                      arg2,
+                                                      arg3,
+                                                      arg4,
+                                                      arg5,
+                                                      arg6,
+                                                      arg7,
+                                                      arg8);
+            } else { /* if (bsd_type == target_openbsd) */
+                env->regs[R_EAX] = do_openbsd_syscall(env,
+                                                      env->regs[R_EAX],
+                                                      env->regs[R_EBX],
+                                                      env->regs[R_ECX],
+                                                      env->regs[R_EDX],
+                                                      env->regs[R_ESI],
+                                                      env->regs[R_EDI],
+                                                      env->regs[R_EBP]);
+            }
+            if (((abi_ulong)env->regs[R_EAX]) >= (abi_ulong)(-515)) {
+                env->regs[R_EAX] = -env->regs[R_EAX];
+                env->eflags |= CC_C;
+            } else {
+                env->eflags &= ~CC_C;
+            }
+            break;
+#ifndef TARGET_ABI32
+        case EXCP_SYSCALL:
+            /* syscall from syscall instruction */
+            if (bsd_type == target_freebsd) {
+                env->regs[R_EAX] = do_freebsd_syscall(env,
+                                                      env->regs[R_EAX],
+                                                      env->regs[R_EDI],
+                                                      env->regs[R_ESI],
+                                                      env->regs[R_EDX],
+                                                      env->regs[R_ECX],
+                                                      env->regs[8],
+                                                      env->regs[9], 0, 0);
+            } else { /* if (bsd_type == target_openbsd) */
+                env->regs[R_EAX] = do_openbsd_syscall(env,
+                                                      env->regs[R_EAX],
+                                                      env->regs[R_EDI],
+                                                      env->regs[R_ESI],
+                                                      env->regs[R_EDX],
+                                                      env->regs[10],
+                                                      env->regs[8],
+                                                      env->regs[9]);
+            }
+            env->eip = env->exception_next_eip;
+            if (((abi_ulong)env->regs[R_EAX]) >= (abi_ulong)(-515)) {
+                env->regs[R_EAX] = -env->regs[R_EAX];
+                env->eflags |= CC_C;
+            } else {
+                env->eflags &= ~CC_C;
+            }
+            break;
+#endif
+#ifdef notyet
+        case EXCP0B_NOSEG:
+        case EXCP0C_STACK:
+            info.si_signo = SIGBUS;
+            info.si_errno = 0;
+            info.si_code = TARGET_SI_KERNEL;
+            info._sifields._sigfault._addr = 0;
+            queue_signal(env, info.si_signo, &info);
+            break;
+        case EXCP0D_GPF:
+            /* XXX: potential problem if ABI32 */
+#ifndef TARGET_X86_64
+            if (env->eflags & VM_MASK) {
+                handle_vm86_fault(env);
+            } else
+#endif
+            {
+                info.si_signo = SIGSEGV;
+                info.si_errno = 0;
+                info.si_code = TARGET_SI_KERNEL;
+                info._sifields._sigfault._addr = 0;
+                queue_signal(env, info.si_signo, &info);
+            }
+            break;
+        case EXCP0E_PAGE:
+            info.si_signo = SIGSEGV;
+            info.si_errno = 0;
+            if (!(env->error_code & 1)) {
+                info.si_code = TARGET_SEGV_MAPERR;
+            } else {
+                info.si_code = TARGET_SEGV_ACCERR;
+            }
+            info._sifields._sigfault._addr = env->cr[2];
+            queue_signal(env, info.si_signo, &info);
+            break;
+        case EXCP00_DIVZ:
+#ifndef TARGET_X86_64
+            if (env->eflags & VM_MASK) {
+                handle_vm86_trap(env, trapnr);
+            } else
+#endif
+            {
+                /* division by zero */
+                info.si_signo = SIGFPE;
+                info.si_errno = 0;
+                info.si_code = TARGET_FPE_INTDIV;
+                info._sifields._sigfault._addr = env->eip;
+                queue_signal(env, info.si_signo, &info);
+            }
+            break;
+        case EXCP01_DB:
+        case EXCP03_INT3:
+#ifndef TARGET_X86_64
+            if (env->eflags & VM_MASK) {
+                handle_vm86_trap(env, trapnr);
+            } else
+#endif
+            {
+                info.si_signo = SIGTRAP;
+                info.si_errno = 0;
+                if (trapnr == EXCP01_DB) {
+                    info.si_code = TARGET_TRAP_BRKPT;
+                    info._sifields._sigfault._addr = env->eip;
+                } else {
+                    info.si_code = TARGET_SI_KERNEL;
+                    info._sifields._sigfault._addr = 0;
+                }
+                queue_signal(env, info.si_signo, &info);
+            }
+            break;
+        case EXCP04_INTO:
+        case EXCP05_BOUND:
+#ifndef TARGET_X86_64
+            if (env->eflags & VM_MASK) {
+                handle_vm86_trap(env, trapnr);
+            } else
+#endif
+            {
+                info.si_signo = SIGSEGV;
+                info.si_errno = 0;
+                info.si_code = TARGET_SI_KERNEL;
+                info._sifields._sigfault._addr = 0;
+                queue_signal(env, info.si_signo, &info);
+            }
+            break;
+        case EXCP06_ILLOP:
+            info.si_signo = SIGILL;
+            info.si_errno = 0;
+            info.si_code = TARGET_ILL_ILLOPN;
+            info._sifields._sigfault._addr = env->eip;
+            queue_signal(env, info.si_signo, &info);
+            break;
+#endif
+        case EXCP_INTERRUPT:
+            /* just indicate that signals should be handled asap */
+            break;
+#ifdef notyet
+        case EXCP_DEBUG:
+        {
+            int sig;
+
+            sig = gdb_handlesig(env, TARGET_SIGTRAP);
+            if (sig) {
+                info.si_signo = sig;
+                info.si_errno = 0;
+                info.si_code = TARGET_TRAP_BRKPT;
+                queue_signal(env, info.si_signo, &info);
+            }
+            break;
+        }
+#endif
+        default:
+            pc = env->segs[R_CS].base + env->eip;
+            fprintf(stderr,
+                    "qemu: 0x%08lx: unhandled CPU exception 0x%x - aborting\n",
+                    (long)pc, trapnr);
+            abort();
+        }
+        process_pending_signals(env);
+    }
+}
+
 #endif /* ! _TARGET_ARCH_CPU_H_ */
diff --git a/bsd-user/main.c b/bsd-user/main.c
index d12b77fbfe..3ebfa9425d 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -87,288 +87,10 @@ void fork_end(int child)
     }
 }
 
-#ifdef TARGET_I386
-/***********************************************************/
-/* CPUX86 core interface */
-
-uint64_t cpu_get_tsc(CPUX86State *env)
-{
-    return cpu_get_host_ticks();
-}
-
-static void write_dt(void *ptr, unsigned long addr, unsigned long limit,
-                     int flags)
-{
-    unsigned int e1, e2;
-    uint32_t *p;
-    e1 = (addr << 16) | (limit & 0xffff);
-    e2 = ((addr >> 16) & 0xff) | (addr & 0xff000000) | (limit & 0x000f0000);
-    e2 |= flags;
-    p = ptr;
-    p[0] = tswap32(e1);
-    p[1] = tswap32(e2);
-}
-
-static uint64_t *idt_table;
-#ifdef TARGET_X86_64
-static void set_gate64(void *ptr, unsigned int type, unsigned int dpl,
-                       uint64_t addr, unsigned int sel)
-{
-    uint32_t *p, e1, e2;
-    e1 = (addr & 0xffff) | (sel << 16);
-    e2 = (addr & 0xffff0000) | 0x8000 | (dpl << 13) | (type << 8);
-    p = ptr;
-    p[0] = tswap32(e1);
-    p[1] = tswap32(e2);
-    p[2] = tswap32(addr >> 32);
-    p[3] = 0;
-}
-/* only dpl matters as we do only user space emulation */
-static void set_idt(int n, unsigned int dpl)
-{
-    set_gate64(idt_table + n * 2, 0, dpl, 0, 0);
-}
-#else
-static void set_gate(void *ptr, unsigned int type, unsigned int dpl,
-                     uint32_t addr, unsigned int sel)
-{
-    uint32_t *p, e1, e2;
-    e1 = (addr & 0xffff) | (sel << 16);
-    e2 = (addr & 0xffff0000) | 0x8000 | (dpl << 13) | (type << 8);
-    p = ptr;
-    p[0] = tswap32(e1);
-    p[1] = tswap32(e2);
-}
-
-/* only dpl matters as we do only user space emulation */
-static void set_idt(int n, unsigned int dpl)
-{
-    set_gate(idt_table + n, 0, dpl, 0, 0);
-}
-#endif
-
-void cpu_loop(CPUX86State *env)
+#ifdef TARGET_I386 /* stopgap ifdef */
+void cpu_loop(CPUArchState *env)
 {
-    CPUState *cs = env_cpu(env);
-    int trapnr;
-    abi_ulong pc;
-    /* target_siginfo_t info; */
-
-    for (;;) {
-        cpu_exec_start(cs);
-        trapnr = cpu_exec(cs);
-        cpu_exec_end(cs);
-        process_queued_cpu_work(cs);
-
-        switch (trapnr) {
-        case 0x80:
-            /* syscall from int $0x80 */
-            if (bsd_type == target_freebsd) {
-                abi_ulong params = (abi_ulong) env->regs[R_ESP] +
-                    sizeof(int32_t);
-                int32_t syscall_nr = env->regs[R_EAX];
-                int32_t arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8;
-
-                if (syscall_nr == TARGET_FREEBSD_NR_syscall) {
-                    get_user_s32(syscall_nr, params);
-                    params += sizeof(int32_t);
-                } else if (syscall_nr == TARGET_FREEBSD_NR___syscall) {
-                    get_user_s32(syscall_nr, params);
-                    params += sizeof(int64_t);
-                }
-                get_user_s32(arg1, params);
-                params += sizeof(int32_t);
-                get_user_s32(arg2, params);
-                params += sizeof(int32_t);
-                get_user_s32(arg3, params);
-                params += sizeof(int32_t);
-                get_user_s32(arg4, params);
-                params += sizeof(int32_t);
-                get_user_s32(arg5, params);
-                params += sizeof(int32_t);
-                get_user_s32(arg6, params);
-                params += sizeof(int32_t);
-                get_user_s32(arg7, params);
-                params += sizeof(int32_t);
-                get_user_s32(arg8, params);
-                env->regs[R_EAX] = do_freebsd_syscall(env,
-                                                      syscall_nr,
-                                                      arg1,
-                                                      arg2,
-                                                      arg3,
-                                                      arg4,
-                                                      arg5,
-                                                      arg6,
-                                                      arg7,
-                                                      arg8);
-            } else { /* if (bsd_type == target_openbsd) */
-                env->regs[R_EAX] = do_openbsd_syscall(env,
-                                                      env->regs[R_EAX],
-                                                      env->regs[R_EBX],
-                                                      env->regs[R_ECX],
-                                                      env->regs[R_EDX],
-                                                      env->regs[R_ESI],
-                                                      env->regs[R_EDI],
-                                                      env->regs[R_EBP]);
-            }
-            if (((abi_ulong)env->regs[R_EAX]) >= (abi_ulong)(-515)) {
-                env->regs[R_EAX] = -env->regs[R_EAX];
-                env->eflags |= CC_C;
-            } else {
-                env->eflags &= ~CC_C;
-            }
-            break;
-#ifndef TARGET_ABI32
-        case EXCP_SYSCALL:
-            /* syscall from syscall instruction */
-            if (bsd_type == target_freebsd) {
-                env->regs[R_EAX] = do_freebsd_syscall(env,
-                                                      env->regs[R_EAX],
-                                                      env->regs[R_EDI],
-                                                      env->regs[R_ESI],
-                                                      env->regs[R_EDX],
-                                                      env->regs[R_ECX],
-                                                      env->regs[8],
-                                                      env->regs[9], 0, 0);
-            } else { /* if (bsd_type == target_openbsd) */
-                env->regs[R_EAX] = do_openbsd_syscall(env,
-                                                      env->regs[R_EAX],
-                                                      env->regs[R_EDI],
-                                                      env->regs[R_ESI],
-                                                      env->regs[R_EDX],
-                                                      env->regs[10],
-                                                      env->regs[8],
-                                                      env->regs[9]);
-            }
-            env->eip = env->exception_next_eip;
-            if (((abi_ulong)env->regs[R_EAX]) >= (abi_ulong)(-515)) {
-                env->regs[R_EAX] = -env->regs[R_EAX];
-                env->eflags |= CC_C;
-            } else {
-                env->eflags &= ~CC_C;
-            }
-            break;
-#endif
-#ifdef notyet
-        case EXCP0B_NOSEG:
-        case EXCP0C_STACK:
-            info.si_signo = SIGBUS;
-            info.si_errno = 0;
-            info.si_code = TARGET_SI_KERNEL;
-            info._sifields._sigfault._addr = 0;
-            queue_signal(env, info.si_signo, &info);
-            break;
-        case EXCP0D_GPF:
-            /* XXX: potential problem if ABI32 */
-#ifndef TARGET_X86_64
-            if (env->eflags & VM_MASK) {
-                handle_vm86_fault(env);
-            } else
-#endif
-            {
-                info.si_signo = SIGSEGV;
-                info.si_errno = 0;
-                info.si_code = TARGET_SI_KERNEL;
-                info._sifields._sigfault._addr = 0;
-                queue_signal(env, info.si_signo, &info);
-            }
-            break;
-        case EXCP0E_PAGE:
-            info.si_signo = SIGSEGV;
-            info.si_errno = 0;
-            if (!(env->error_code & 1)) {
-                info.si_code = TARGET_SEGV_MAPERR;
-            } else {
-                info.si_code = TARGET_SEGV_ACCERR;
-            }
-            info._sifields._sigfault._addr = env->cr[2];
-            queue_signal(env, info.si_signo, &info);
-            break;
-        case EXCP00_DIVZ:
-#ifndef TARGET_X86_64
-            if (env->eflags & VM_MASK) {
-                handle_vm86_trap(env, trapnr);
-            } else
-#endif
-            {
-                /* division by zero */
-                info.si_signo = SIGFPE;
-                info.si_errno = 0;
-                info.si_code = TARGET_FPE_INTDIV;
-                info._sifields._sigfault._addr = env->eip;
-                queue_signal(env, info.si_signo, &info);
-            }
-            break;
-        case EXCP01_DB:
-        case EXCP03_INT3:
-#ifndef TARGET_X86_64
-            if (env->eflags & VM_MASK) {
-                handle_vm86_trap(env, trapnr);
-            } else
-#endif
-            {
-                info.si_signo = SIGTRAP;
-                info.si_errno = 0;
-                if (trapnr == EXCP01_DB) {
-                    info.si_code = TARGET_TRAP_BRKPT;
-                    info._sifields._sigfault._addr = env->eip;
-                } else {
-                    info.si_code = TARGET_SI_KERNEL;
-                    info._sifields._sigfault._addr = 0;
-                }
-                queue_signal(env, info.si_signo, &info);
-            }
-            break;
-        case EXCP04_INTO:
-        case EXCP05_BOUND:
-#ifndef TARGET_X86_64
-            if (env->eflags & VM_MASK) {
-                handle_vm86_trap(env, trapnr);
-            } else
-#endif
-            {
-                info.si_signo = SIGSEGV;
-                info.si_errno = 0;
-                info.si_code = TARGET_SI_KERNEL;
-                info._sifields._sigfault._addr = 0;
-                queue_signal(env, info.si_signo, &info);
-            }
-            break;
-        case EXCP06_ILLOP:
-            info.si_signo = SIGILL;
-            info.si_errno = 0;
-            info.si_code = TARGET_ILL_ILLOPN;
-            info._sifields._sigfault._addr = env->eip;
-            queue_signal(env, info.si_signo, &info);
-            break;
-#endif
-        case EXCP_INTERRUPT:
-            /* just indicate that signals should be handled asap */
-            break;
-#ifdef notyet
-        case EXCP_DEBUG:
-        {
-            int sig;
-
-            sig = gdb_handlesig(env, TARGET_SIGTRAP);
-            if (sig) {
-                info.si_signo = sig;
-                info.si_errno = 0;
-                info.si_code = TARGET_TRAP_BRKPT;
-                queue_signal(env, info.si_signo, &info);
-            }
-            break;
-        }
-#endif
-        default:
-            pc = env->segs[R_CS].base + env->eip;
-            fprintf(stderr,
-                    "qemu: 0x%08lx: unhandled CPU exception 0x%x - aborting\n",
-                    (long)pc, trapnr);
-            abort();
-        }
-        process_pending_signals(env);
-    }
+    target_cpu_loop(env);
 }
 #endif
 
-- 
2.22.1


