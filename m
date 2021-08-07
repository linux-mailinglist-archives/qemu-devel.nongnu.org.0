Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 252123E374A
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 23:58:57 +0200 (CEST)
Received: from localhost ([::1]:49106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCULI-0005Ar-6x
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 17:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU6B-0007YC-8L
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:19 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:43951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU67-0004vk-Lm
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:18 -0400
Received: by mail-io1-xd44.google.com with SMTP id y1so19935727iod.10
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 14:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4iLTEXYEJykh2bTTlKZWJe6xVVV8G6cWYxMWjURtoLo=;
 b=JW5GL89WfBOcRzc6TFUykctsUeZj1e0EIANM0jrNbTWpV1Mt2pHli5f7yvWzkDwYXe
 /N/0W4aoAS4Fw1PBrsblSQPxqisFGc0xiDetbHP82NrxsJb/Np5E72UuVE++IKh9i+hP
 5H3PIW+nbycFeQ2sqt6h0sWZuU7dllkjQYUJofnXnPOlOyi/5lOeJUFoVQsiyBLqFt0d
 a+Nr9cd917xOgNQmBw+OBnhbYiFBEz549sSRWQihUw4dwH67sFEHPW7eDi0e1P+H70TV
 Ip9DB0MTsQhD7O0wtHgZOidrjoox3KOF7HruT6rYRf6OFHX3WJguP66eteiJAQMSJwg7
 WLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4iLTEXYEJykh2bTTlKZWJe6xVVV8G6cWYxMWjURtoLo=;
 b=SMhlruiLgCpPmWVClboN6o9HZqqDn8DtPv8P1YUslmWxpznbeTzfKixtyrcUSlOAd6
 C8aTtiR1wkz2+apipGRF7jOhtaukamVVsq0IoWcdF06na3dK4L3d4LLyHBmTQgCnRMCm
 9YxlW6MTPEGyU4blk5J+Sw9+tlapE3R5rlOWsn6qi+qco2fMNRTCTa7YfKfvfUoUZujd
 j7+di2Mg32+cRBBjs8UyYuiNzZpTKWbpil1i9Xc868GlmkMS3oJSftSYaMplkcK75TDt
 lHjvixePLIlLoqOegeHWHUXs9051pQhQtUQFj25KOj36Hp7VgdX0Wks1nzvEBgsqySWA
 ikdg==
X-Gm-Message-State: AOAM533AIivEgEZ0WBKv/sXBlLE6F3WTv13cZmeZMOKyPotNuFqjGT6v
 4ooZk/7SSdTj9437nZVYLZ0gs1YiPIxHGCjh
X-Google-Smtp-Source: ABdhPJxo2trWTUQvYHqRfTPboAvaUrxNczTN1SoxqtsVj2cFTAB3A8iuX1O033VvB9r939NS+hCSXQ==
X-Received: by 2002:a05:6e02:525:: with SMTP id
 h5mr444165ils.114.1628372594292; 
 Sat, 07 Aug 2021 14:43:14 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm8062827ios.36.2021.08.07.14.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 14:43:13 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 22/49] bsd-user: Move per-cpu code into
 target_arch_cpu.h
Date: Sat,  7 Aug 2021 15:42:15 -0600
Message-Id: <20210807214242.82385-23-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807214242.82385-1-imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d44;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd44.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>, Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Move cpu_loop() into target_cpu_loop(), and put that in
target_arch_cpu.h for each architecture.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/i386/target_arch_cpu.c   |   1 +
 bsd-user/i386/target_arch_cpu.h   | 306 ++++++++++++++++++++++++++++
 bsd-user/main.c                   | 309 ++--------------------------
 bsd-user/x86_64/target_arch_cpu.c |   1 +
 bsd-user/x86_64/target_arch_cpu.h | 328 ++++++++++++++++++++++++++++++
 5 files changed, 651 insertions(+), 294 deletions(-)
 create mode 100644 bsd-user/i386/target_arch_cpu.h
 create mode 100644 bsd-user/x86_64/target_arch_cpu.h

diff --git a/bsd-user/i386/target_arch_cpu.c b/bsd-user/i386/target_arch_cpu.c
index 7f2f755a11..71998e5ba5 100644
--- a/bsd-user/i386/target_arch_cpu.c
+++ b/bsd-user/i386/target_arch_cpu.c
@@ -1,6 +1,7 @@
 /*
  *  i386 cpu related code
  *
+ * Copyright (c) 2013 Stacey Son <sson@FreeBSD.org>
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
diff --git a/bsd-user/i386/target_arch_cpu.h b/bsd-user/i386/target_arch_cpu.h
new file mode 100644
index 0000000000..c7603d4ec6
--- /dev/null
+++ b/bsd-user/i386/target_arch_cpu.h
@@ -0,0 +1,306 @@
+/*
+ *  i386 cpu init and loop
+ *
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef _TARGET_ARCH_CPU_H_
+#define _TARGET_ARCH_CPU_H_
+
+#include "target_arch.h"
+
+#define TARGET_DEFAULT_CPU_MODEL "qemu32"
+
+#define TARGET_CPU_RESET(cpu)
+
+static inline void target_cpu_init(CPUX86State *env,
+        struct target_pt_regs *regs)
+{
+    uint64_t *gdt_table;
+
+    env->cr[0] = CR0_PG_MASK | CR0_WP_MASK | CR0_PE_MASK;
+    env->hflags |= HF_PE_MASK | HF_CPL_MASK;
+    if (env->features[FEAT_1_EDX] & CPUID_SSE) {
+        env->cr[4] |= CR4_OSFXSR_MASK;
+        env->hflags |= HF_OSFXSR_MASK;
+    }
+
+    /* flags setup : we activate the IRQs by default as in user mode */
+    env->eflags |= IF_MASK;
+
+    /* register setup */
+    env->regs[R_EAX] = regs->eax;
+    env->regs[R_EBX] = regs->ebx;
+    env->regs[R_ECX] = regs->ecx;
+    env->regs[R_EDX] = regs->edx;
+    env->regs[R_ESI] = regs->esi;
+    env->regs[R_EDI] = regs->edi;
+    env->regs[R_EBP] = regs->ebp;
+    env->regs[R_ESP] = regs->esp;
+    env->eip = regs->eip;
+
+    /* interrupt setup */
+    env->idt.limit = 255;
+
+    env->idt.base = target_mmap(0, sizeof(uint64_t) * (env->idt.limit + 1),
+        PROT_READ|PROT_WRITE, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
+    bsd_i386_set_idt_base(env->idt.base);
+    bsd_i386_set_idt(0, 0);
+    bsd_i386_set_idt(1, 0);
+    bsd_i386_set_idt(2, 0);
+    bsd_i386_set_idt(3, 3);
+    bsd_i386_set_idt(4, 3);
+    bsd_i386_set_idt(5, 0);
+    bsd_i386_set_idt(6, 0);
+    bsd_i386_set_idt(7, 0);
+    bsd_i386_set_idt(8, 0);
+    bsd_i386_set_idt(9, 0);
+    bsd_i386_set_idt(10, 0);
+    bsd_i386_set_idt(11, 0);
+    bsd_i386_set_idt(12, 0);
+    bsd_i386_set_idt(13, 0);
+    bsd_i386_set_idt(14, 0);
+    bsd_i386_set_idt(15, 0);
+    bsd_i386_set_idt(16, 0);
+    bsd_i386_set_idt(17, 0);
+    bsd_i386_set_idt(18, 0);
+    bsd_i386_set_idt(19, 0);
+    bsd_i386_set_idt(0x80, 3);
+
+    /* segment setup */
+    env->gdt.base = target_mmap(0, sizeof(uint64_t) * TARGET_GDT_ENTRIES,
+            PROT_READ|PROT_WRITE, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
+    env->gdt.limit = sizeof(uint64_t) * TARGET_GDT_ENTRIES - 1;
+    gdt_table = g2h_untagged(env->gdt.base);
+
+    bsd_i386_write_dt(&gdt_table[__USER_CS >> 3], 0, 0xfffff,
+            DESC_G_MASK | DESC_B_MASK | DESC_P_MASK | DESC_S_MASK |
+            (3 << DESC_DPL_SHIFT) | (0xa << DESC_TYPE_SHIFT));
+
+    bsd_i386_write_dt(&gdt_table[__USER_DS >> 3], 0, 0xfffff,
+            DESC_G_MASK | DESC_B_MASK | DESC_P_MASK | DESC_S_MASK |
+            (3 << DESC_DPL_SHIFT) | (0x2 << DESC_TYPE_SHIFT));
+
+    cpu_x86_load_seg(env, R_CS, __USER_CS);
+    cpu_x86_load_seg(env, R_SS, __USER_DS);
+    cpu_x86_load_seg(env, R_DS, __USER_DS);
+    cpu_x86_load_seg(env, R_ES, __USER_DS);
+    cpu_x86_load_seg(env, R_FS, __USER_DS);
+    cpu_x86_load_seg(env, R_GS, __USER_DS);
+    /* This hack makes Wine work... */
+    env->segs[R_FS].selector = 0;
+}
+
+static inline void target_cpu_loop(CPUX86State *env)
+{
+    CPUState *cs = env_cpu(env);
+    int trapnr;
+    abi_ulong pc;
+    /* target_siginfo_t info; */
+
+    for (;;) {
+	cpu_exec_start(cs);
+        trapnr = cpu_exec(cs);
+	cpu_exec_end(cs);
+	process_queued_cpu_work(cs);
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
+
+#if 0
+        case EXCP0B_NOSEG:
+        case EXCP0C_STACK:
+            info.si_signo = TARGET_SIGBUS;
+            info.si_errno = 0;
+            info.si_code = TARGET_SI_KERNEL;
+            info._sifields._sigfault._addr = 0;
+            queue_signal(env, info.si_signo, &info);
+            break;
+
+        case EXCP0D_GPF:
+            /* XXX: potential problem if ABI32 */
+            if (env->eflags & VM_MASK) {
+                handle_vm86_fault(env);
+            } else {
+                info.si_signo = TARGET_SIGSEGV;
+                info.si_errno = 0;
+                info.si_code = TARGET_SI_KERNEL;
+                info._sifields._sigfault._addr = 0;
+                queue_signal(env, info.si_signo, &info);
+            }
+            break;
+
+        case EXCP0E_PAGE:
+            info.si_signo = TARGET_SIGSEGV;
+            info.si_errno = 0;
+            if (!(env->error_code & 1)) {
+                info.si_code = TARGET_SEGV_MAPERR;
+            } else {
+                info.si_code = TARGET_SEGV_ACCERR;
+            }
+            info._sifields._sigfault._addr = env->cr[2];
+            queue_signal(env, info.si_signo, &info);
+            break;
+
+        case EXCP00_DIVZ:
+            if (env->eflags & VM_MASK) {
+                handle_vm86_trap(env, trapnr);
+            } else {
+                /* division by zero */
+                info.si_signo = TARGET_SIGFPE;
+                info.si_errno = 0;
+                info.si_code = TARGET_FPE_INTDIV;
+                info._sifields._sigfault._addr = env->eip;
+                queue_signal(env, info.si_signo, &info);
+            }
+            break;
+
+        case EXCP01_DB:
+        case EXCP03_INT3:
+            if (env->eflags & VM_MASK) {
+                handle_vm86_trap(env, trapnr);
+            } else {
+                info.si_signo = TARGET_SIGTRAP;
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
+
+        case EXCP04_INTO:
+        case EXCP05_BOUND:
+            if (env->eflags & VM_MASK) {
+                handle_vm86_trap(env, trapnr);
+            } else {
+                info.si_signo = TARGET_SIGSEGV;
+                info.si_errno = 0;
+                info.si_code = TARGET_SI_KERNEL;
+                info._sifields._sigfault._addr = 0;
+                queue_signal(env, info.si_signo, &info);
+            }
+            break;
+
+        case EXCP06_ILLOP:
+            info.si_signo = TARGET_SIGILL;
+            info.si_errno = 0;
+            info.si_code = TARGET_ILL_ILLOPN;
+            info._sifields._sigfault._addr = env->eip;
+            queue_signal(env, info.si_signo, &info);
+            break;
+#endif
+        case EXCP_INTERRUPT:
+            /* just indicate that signals should be handled asap */
+            break;
+#if 0
+        case EXCP_DEBUG:
+            {
+
+                info.si_signo = TARGET_SIGTRAP;
+                info.si_errno = 0;
+                info.si_code = TARGET_TRAP_BRKPT;
+                queue_signal(env, info.si_signo, &info);
+            }
+            break;
+#endif
+
+        case EXCP_ATOMIC:
+            cpu_exec_step_atomic(cs);
+            break;
+
+        default:
+            pc = env->segs[R_CS].base + env->eip;
+            fprintf(stderr, "qemu: 0x%08lx: unhandled CPU exception 0x%x - "
+                    "aborting\n", (long)pc, trapnr);
+            abort();
+        }
+        process_pending_signals(env);
+    }
+}
+
+static inline void target_cpu_clone_regs(CPUX86State *env, target_ulong newsp)
+{
+    if (newsp)
+        env->regs[R_ESP] = newsp;
+    env->regs[R_EAX] = 0;
+}
+
+static inline void target_cpu_reset(CPUArchState *cpu)
+{
+    cpu_reset(env_cpu(cpu));
+}
+
+#endif /* ! _TARGET_ARCH_CPU_H_ */
diff --git a/bsd-user/main.c b/bsd-user/main.c
index ac435b216a..91e6abb6e4 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -42,6 +42,7 @@
 #include "trace/control.h"
 
 #include "host-os.h"
+#include "target_arch_cpu.h"
 
 #include <sys/sysctl.h>
 
@@ -83,177 +84,10 @@ void fork_end(int child)
     }
 }
 
-#ifdef TARGET_I386
-/***********************************************************/
-/* CPUX86 core interface */
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
+void cpu_loop(CPUArchState *env)
 {
-    set_gate(idt_table + n, 0, dpl, 0, 0);
-}
-#endif
-
-void cpu_loop(CPUX86State *env)
-{
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
-        case EXCP_INTERRUPT:
-            /* just indicate that signals should be handled asap */
-            break;
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
-#endif
 
 static void usage(void)
 {
@@ -521,18 +355,11 @@ int main(int argc, char **argv)
     init_paths(interp_prefix);
 
     if (cpu_model == NULL) {
-#if defined(TARGET_I386)
-#ifdef TARGET_X86_64
-        cpu_model = "qemu64";
-#else
-        cpu_model = "qemu32";
-#endif
-#else
-        cpu_model = "any";
-#endif
+        cpu_model = TARGET_DEFAULT_CPU_MODEL;
     }
 
     cpu_type = parse_cpu_option(cpu_model);
+
     /* init tcg before creating CPUs and to get qemu_host_page_size */
     {
         AccelClass *ac = ACCEL_GET_CLASS(current_accel());
@@ -626,124 +453,18 @@ int main(int argc, char **argv)
     ts->info = info;
     cpu->opaque = ts;
 
-#if defined(TARGET_I386)
-    env->cr[0] = CR0_PG_MASK | CR0_WP_MASK | CR0_PE_MASK;
-    env->hflags |= HF_PE_MASK | HF_CPL_MASK;
-    if (env->features[FEAT_1_EDX] & CPUID_SSE) {
-        env->cr[4] |= CR4_OSFXSR_MASK;
-        env->hflags |= HF_OSFXSR_MASK;
-    }
-#ifndef TARGET_ABI32
-    /* enable 64 bit mode if possible */
-    if (!(env->features[FEAT_8000_0001_EDX] & CPUID_EXT2_LM)) {
-        fprintf(stderr, "The selected x86 CPU does not support 64 bit mode\n");
-        exit(1);
-    }
-    env->cr[4] |= CR4_PAE_MASK;
-    env->efer |= MSR_EFER_LMA | MSR_EFER_LME;
-    env->hflags |= HF_LMA_MASK;
-#endif
-
-    /* flags setup : we activate the IRQs by default as in user mode */
-    env->eflags |= IF_MASK;
-
-    /* linux register setup */
-#ifndef TARGET_ABI32
-    env->regs[R_EAX] = regs->rax;
-    env->regs[R_EBX] = regs->rbx;
-    env->regs[R_ECX] = regs->rcx;
-    env->regs[R_EDX] = regs->rdx;
-    env->regs[R_ESI] = regs->rsi;
-    env->regs[R_EDI] = regs->rdi;
-    env->regs[R_EBP] = regs->rbp;
-    env->regs[R_ESP] = regs->rsp;
-    env->eip = regs->rip;
-#else
-    env->regs[R_EAX] = regs->eax;
-    env->regs[R_EBX] = regs->ebx;
-    env->regs[R_ECX] = regs->ecx;
-    env->regs[R_EDX] = regs->edx;
-    env->regs[R_ESI] = regs->esi;
-    env->regs[R_EDI] = regs->edi;
-    env->regs[R_EBP] = regs->ebp;
-    env->regs[R_ESP] = regs->esp;
-    env->eip = regs->eip;
-#endif
+    target_set_brk(info->brk);
+    syscall_init();
+    signal_init();
 
-    /* linux interrupt setup */
-#ifndef TARGET_ABI32
-    env->idt.limit = 511;
-#else
-    env->idt.limit = 255;
-#endif
-    env->idt.base = target_mmap(0, sizeof(uint64_t) * (env->idt.limit + 1),
-                                PROT_READ | PROT_WRITE,
-                                MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
-    idt_table = g2h_untagged(env->idt.base);
-    set_idt(0, 0);
-    set_idt(1, 0);
-    set_idt(2, 0);
-    set_idt(3, 3);
-    set_idt(4, 3);
-    set_idt(5, 0);
-    set_idt(6, 0);
-    set_idt(7, 0);
-    set_idt(8, 0);
-    set_idt(9, 0);
-    set_idt(10, 0);
-    set_idt(11, 0);
-    set_idt(12, 0);
-    set_idt(13, 0);
-    set_idt(14, 0);
-    set_idt(15, 0);
-    set_idt(16, 0);
-    set_idt(17, 0);
-    set_idt(18, 0);
-    set_idt(19, 0);
-    set_idt(0x80, 3);
-
-    /* linux segment setup */
-    {
-        uint64_t *gdt_table;
-        env->gdt.base = target_mmap(0, sizeof(uint64_t) * TARGET_GDT_ENTRIES,
-                                    PROT_READ | PROT_WRITE,
-                                    MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
-        env->gdt.limit = sizeof(uint64_t) * TARGET_GDT_ENTRIES - 1;
-        gdt_table = g2h_untagged(env->gdt.base);
-#ifdef TARGET_ABI32
-        write_dt(&gdt_table[__USER_CS >> 3], 0, 0xfffff,
-                 DESC_G_MASK | DESC_B_MASK | DESC_P_MASK | DESC_S_MASK |
-                 (3 << DESC_DPL_SHIFT) | (0xa << DESC_TYPE_SHIFT));
-#else
-        /* 64 bit code segment */
-        write_dt(&gdt_table[__USER_CS >> 3], 0, 0xfffff,
-                 DESC_G_MASK | DESC_B_MASK | DESC_P_MASK | DESC_S_MASK |
-                 DESC_L_MASK |
-                 (3 << DESC_DPL_SHIFT) | (0xa << DESC_TYPE_SHIFT));
-#endif
-        write_dt(&gdt_table[__USER_DS >> 3], 0, 0xfffff,
-                 DESC_G_MASK | DESC_B_MASK | DESC_P_MASK | DESC_S_MASK |
-                 (3 << DESC_DPL_SHIFT) | (0x2 << DESC_TYPE_SHIFT));
-    }
+    /*
+     * Now that we've loaded the binary, GUEST_BASE is fixed.  Delay
+     * generating the prologue until now so that the prologue can take
+     * the real value of GUEST_BASE into account.
+     */
+    tcg_prologue_init(tcg_ctx);
 
-    cpu_x86_load_seg(env, R_CS, __USER_CS);
-    cpu_x86_load_seg(env, R_SS, __USER_DS);
-#ifdef TARGET_ABI32
-    cpu_x86_load_seg(env, R_DS, __USER_DS);
-    cpu_x86_load_seg(env, R_ES, __USER_DS);
-    cpu_x86_load_seg(env, R_FS, __USER_DS);
-    cpu_x86_load_seg(env, R_GS, __USER_DS);
-    /* This hack makes Wine work... */
-    env->segs[R_FS].selector = 0;
-#else
-    cpu_x86_load_seg(env, R_DS, 0);
-    cpu_x86_load_seg(env, R_ES, 0);
-    cpu_x86_load_seg(env, R_FS, 0);
-    cpu_x86_load_seg(env, R_GS, 0);
-#endif
-#else
-#error unsupported target CPU
-#endif
+    target_cpu_init(env, regs);
 
     if (gdbstub) {
         gdbserver_start(gdbstub);
diff --git a/bsd-user/x86_64/target_arch_cpu.c b/bsd-user/x86_64/target_arch_cpu.c
index a2c5b176a4..db822e54c6 100644
--- a/bsd-user/x86_64/target_arch_cpu.c
+++ b/bsd-user/x86_64/target_arch_cpu.c
@@ -1,6 +1,7 @@
 /*
  *  x86_64 cpu related code
  *
+ * Copyright (c) 2013 Stacey Son <sson@FreeBSD.org>
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
diff --git a/bsd-user/x86_64/target_arch_cpu.h b/bsd-user/x86_64/target_arch_cpu.h
new file mode 100644
index 0000000000..ba0533ea0c
--- /dev/null
+++ b/bsd-user/x86_64/target_arch_cpu.h
@@ -0,0 +1,328 @@
+/*
+ *  x86_64 cpu init and loop
+ *
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef _TARGET_ARCH_CPU_H_
+#define _TARGET_ARCH_CPU_H_
+
+#include "target_arch.h"
+
+#define TARGET_DEFAULT_CPU_MODEL "qemu64"
+
+#define TARGET_CPU_RESET(cpu)
+
+static inline void target_cpu_init(CPUX86State *env,
+        struct target_pt_regs *regs)
+{
+    uint64_t *gdt_table;
+
+    env->cr[0] = CR0_PG_MASK | CR0_WP_MASK | CR0_PE_MASK;
+    env->hflags |= HF_PE_MASK | HF_CPL_MASK;
+    if (env->features[FEAT_1_EDX] & CPUID_SSE) {
+        env->cr[4] |= CR4_OSFXSR_MASK;
+        env->hflags |= HF_OSFXSR_MASK;
+    }
+
+    /* enable 64 bit mode if possible */
+    if (!(env->features[FEAT_8000_0001_EDX] & CPUID_EXT2_LM)) {
+        fprintf(stderr, "The selected x86 CPU does not support 64 bit mode\n");
+        exit(1);
+    }
+    env->cr[4] |= CR4_PAE_MASK;
+    env->efer |= MSR_EFER_LMA | MSR_EFER_LME;
+    env->hflags |= HF_LMA_MASK;
+
+    /* flags setup : we activate the IRQs by default as in user mode */
+    env->eflags |= IF_MASK;
+
+    /* register setup */
+    env->regs[R_EAX] = regs->rax;
+    env->regs[R_EBX] = regs->rbx;
+    env->regs[R_ECX] = regs->rcx;
+    env->regs[R_EDX] = regs->rdx;
+    env->regs[R_ESI] = regs->rsi;
+    env->regs[R_EDI] = regs->rdi;
+    env->regs[R_EBP] = regs->rbp;
+    env->regs[R_ESP] = regs->rsp;
+    env->eip = regs->rip;
+
+    /* interrupt setup */
+    env->idt.limit = 511;
+
+    env->idt.base = target_mmap(0, sizeof(uint64_t) * (env->idt.limit + 1),
+        PROT_READ|PROT_WRITE, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
+    bsd_x86_64_set_idt_base(env->idt.base);
+    bsd_x86_64_set_idt(0, 0);
+    bsd_x86_64_set_idt(1, 0);
+    bsd_x86_64_set_idt(2, 0);
+    bsd_x86_64_set_idt(3, 3);
+    bsd_x86_64_set_idt(4, 3);
+    bsd_x86_64_set_idt(5, 0);
+    bsd_x86_64_set_idt(6, 0);
+    bsd_x86_64_set_idt(7, 0);
+    bsd_x86_64_set_idt(8, 0);
+    bsd_x86_64_set_idt(9, 0);
+    bsd_x86_64_set_idt(10, 0);
+    bsd_x86_64_set_idt(11, 0);
+    bsd_x86_64_set_idt(12, 0);
+    bsd_x86_64_set_idt(13, 0);
+    bsd_x86_64_set_idt(14, 0);
+    bsd_x86_64_set_idt(15, 0);
+    bsd_x86_64_set_idt(16, 0);
+    bsd_x86_64_set_idt(17, 0);
+    bsd_x86_64_set_idt(18, 0);
+    bsd_x86_64_set_idt(19, 0);
+    bsd_x86_64_set_idt(0x80, 3);
+
+    /* segment setup */
+    env->gdt.base = target_mmap(0, sizeof(uint64_t) * TARGET_GDT_ENTRIES,
+            PROT_READ|PROT_WRITE, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
+    env->gdt.limit = sizeof(uint64_t) * TARGET_GDT_ENTRIES - 1;
+    gdt_table = g2h_untagged(env->gdt.base);
+
+    /* 64 bit code segment */
+    bsd_x86_64_write_dt(&gdt_table[__USER_CS >> 3], 0, 0xfffff,
+            DESC_G_MASK | DESC_B_MASK | DESC_P_MASK | DESC_S_MASK | DESC_L_MASK
+            | (3 << DESC_DPL_SHIFT) | (0xa << DESC_TYPE_SHIFT));
+
+    bsd_x86_64_write_dt(&gdt_table[__USER_DS >> 3], 0, 0xfffff,
+            DESC_G_MASK | DESC_B_MASK | DESC_P_MASK | DESC_S_MASK |
+            (3 << DESC_DPL_SHIFT) | (0x2 << DESC_TYPE_SHIFT));
+
+    cpu_x86_load_seg(env, R_CS, __USER_CS);
+    cpu_x86_load_seg(env, R_SS, __USER_DS);
+    cpu_x86_load_seg(env, R_DS, 0);
+    cpu_x86_load_seg(env, R_ES, 0);
+    cpu_x86_load_seg(env, R_FS, 0);
+    cpu_x86_load_seg(env, R_GS, 0);
+}
+
+static inline void target_cpu_loop(CPUX86State *env)
+{
+    CPUState *cs = env_cpu(env);
+    int trapnr;
+    abi_ulong pc;
+    /* target_siginfo_t info; */
+
+    for (;;) {
+	cpu_exec_start(cs);
+        trapnr = cpu_exec(cs);
+	cpu_exec_end(cs);
+	process_queued_cpu_work(cs);
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
+
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
+
+#if 0
+        case EXCP0B_NOSEG:
+        case EXCP0C_STACK:
+            info.si_signo = TARGET_SIGBUS;
+            info.si_errno = 0;
+            info.si_code = TARGET_SI_KERNEL;
+            info._sifields._sigfault._addr = 0;
+            queue_signal(env, info.si_signo, &info);
+            break;
+
+        case EXCP0D_GPF:
+            /* XXX: potential problem if ABI32 */
+            info.si_signo = TARGET_SIGSEGV;
+            info.si_errno = 0;
+            info.si_code = TARGET_SI_KERNEL;
+            info._sifields._sigfault._addr = 0;
+            queue_signal(env, info.si_signo, &info);
+            break;
+
+        case EXCP0E_PAGE:
+            info.si_signo = TARGET_SIGSEGV;
+            info.si_errno = 0;
+            if (!(env->error_code & 1)) {
+                info.si_code = TARGET_SEGV_MAPERR;
+            } else {
+                info.si_code = TARGET_SEGV_ACCERR;
+            }
+            info._sifields._sigfault._addr = env->cr[2];
+            queue_signal(env, info.si_signo, &info);
+            break;
+
+        case EXCP00_DIVZ:
+            /* division by zero */
+            info.si_signo = TARGET_SIGFPE;
+            info.si_errno = 0;
+            info.si_code = TARGET_FPE_INTDIV;
+            info._sifields._sigfault._addr = env->eip;
+            queue_signal(env, info.si_signo, &info);
+            break;
+
+        case EXCP01_DB:
+        case EXCP03_INT3:
+            info.si_signo = TARGET_SIGTRAP;
+            info.si_errno = 0;
+            if (trapnr == EXCP01_DB) {
+                info.si_code = TARGET_TRAP_BRKPT;
+                info._sifields._sigfault._addr = env->eip;
+            } else {
+                info.si_code = TARGET_SI_KERNEL;
+                info._sifields._sigfault._addr = 0;
+            }
+            queue_signal(env, info.si_signo, &info);
+            break;
+
+        case EXCP04_INTO:
+        case EXCP05_BOUND:
+            info.si_signo = TARGET_SIGSEGV;
+            info.si_errno = 0;
+            info.si_code = TARGET_SI_KERNEL;
+            info._sifields._sigfault._addr = 0;
+            queue_signal(env, info.si_signo, &info);
+            break;
+
+        case EXCP06_ILLOP:
+            info.si_signo = TARGET_SIGILL;
+            info.si_errno = 0;
+            info.si_code = TARGET_ILL_ILLOPN;
+            info._sifields._sigfault._addr = env->eip;
+            queue_signal(env, info.si_signo, &info);
+            break;
+#endif
+        case EXCP_INTERRUPT:
+            /* just indicate that signals should be handled asap */
+            break;
+#if 0
+        case EXCP_DEBUG:
+            {
+
+                info.si_signo = TARGET_SIGTRAP;
+                info.si_errno = 0;
+                info.si_code = TARGET_TRAP_BRKPT;
+                queue_signal(env, info.si_signo, &info);
+            }
+            break;
+#endif
+
+        case EXCP_ATOMIC:
+            cpu_exec_step_atomic(cs);
+            break;
+
+        default:
+            pc = env->segs[R_CS].base + env->eip;
+            fprintf(stderr, "qemu: 0x%08lx: unhandled CPU exception 0x%x - "
+                    "aborting\n", (long)pc, trapnr);
+            abort();
+        }
+        process_pending_signals(env);
+    }
+}
+
+static inline void target_cpu_clone_regs(CPUX86State *env, target_ulong newsp)
+{
+    if (newsp)
+        env->regs[R_ESP] = newsp;
+    env->regs[R_EAX] = 0;
+}
+
+static inline void target_cpu_reset(CPUArchState *cpu)
+{
+    cpu_reset(env_cpu(cpu));
+}
+
+#endif /* ! _TARGET_ARCH_CPU_H_ */
-- 
2.32.0


