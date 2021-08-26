Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF643F902B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 23:33:47 +0200 (CEST)
Received: from localhost ([::1]:42836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJN0H-0006be-DO
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 17:33:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMg5-0006PB-Kx
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:49 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:36537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMfy-0006ua-6r
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:48 -0400
Received: by mail-io1-xd42.google.com with SMTP id q3so5594237iot.3
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 14:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d8xTOa1gca2Io4y1OIgzNZ83eVXEHw89sZOcSf7TrLY=;
 b=espKGXKUVlRvy1kFImJT9CX62ymg25tpqy3xKXHjgnFqJ3c3hHvXQ2YBofDyAuPnCQ
 JskabnSRiS9u+VKdI6+2RMfS5jlrrXepObMFihAUVBeYdzJ1zUJTe8TFa7YJwYcea5SY
 2KRqHlueLNtnTsqF6a/xGSHnNFx2e1QBR6cfzQaHpvv/cLgwBhyqbqUrMvuwjFo7sGja
 0txcNJs1UFwlkTxbYzJjcAIjHPty0HA7C11lNa3WvwxxNedGVJWKHNj2Gh1uTWd72QfA
 nLkjLxR2fnfL/CWDGgyQnKO0u+Tz0Xg1Puoy4D5/8Cc2v4fpOCadnMOmb3JzAVyeu3rC
 kMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d8xTOa1gca2Io4y1OIgzNZ83eVXEHw89sZOcSf7TrLY=;
 b=ZqFYmhV7zAzx1Q4tvMxu3bSNGZOLekb1aEDOxd6EJH7HonqFoH77gw8mDp3GEzRpMY
 rTKVmVeNc0lfk8Rib/GuKwSFeftUv9neLar/BMmb2dUGguYZXUXDKMUNDSP4ipuFmzog
 iuFTmwSTxAu6MK9e9DpaEDJ6uDPGiAEo6SiOJ31OTBzRFgsaV4WZTsxej8evmdfdZfCO
 b2ZKyrDqiqGxMo5SL6PiaORLdtJmqiWh5fB+wZ4fpNYHzakdz2biObOIoj0utSk5Jkm5
 dY+Fptl0FqMATJhX+dak0z9Q4uI3Sw0hxjBpMvoV2KKq57iOTZOI6vTa5OsYH07r9rwY
 fk+g==
X-Gm-Message-State: AOAM531XIsHdAw+Hyb2qnSxFsCcdkhgKCheVwEnaWl1L+8Dpx72ZZqzF
 2/VYKUMdAT6/FggpxY1P0sZIFS8kwEJvXKNn
X-Google-Smtp-Source: ABdhPJz4L/UsLL8CUwDhj5RtNtmFoj64pLZ0GaPyk2sCvXZFvs4Ry8vWU1RzJmTBaQ3CqE15WFwxCw==
X-Received: by 2002:a05:6638:148f:: with SMTP id
 j15mr5062106jak.61.1630012360648; 
 Thu, 26 Aug 2021 14:12:40 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm2348633ilp.75.2021.08.26.14.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 14:12:40 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/43] bsd-user: Move per-cpu code into target_arch_cpu.h
Date: Thu, 26 Aug 2021 15:11:38 -0600
Message-Id: <20210826211201.98877-21-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826211201.98877-1-imp@bsdimp.com>
References: <20210826211201.98877-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d42;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd42.google.com
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
Cc: Stacey Son <sson@FreeBSD.org>, Warner Losh <imp@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Move cpu_loop() into target_cpu_loop(), and put that in
target_arch_cpu.h for each architecture.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/i386/target_arch_cpu.c   |   1 +
 bsd-user/i386/target_arch_cpu.h   | 208 ++++++++++++++++++
 bsd-user/main.c                   | 343 ++----------------------------
 bsd-user/qemu.h                   |   1 +
 bsd-user/x86_64/target_arch_cpu.c |   1 +
 bsd-user/x86_64/target_arch_cpu.h | 246 +++++++++++++++++++++
 6 files changed, 472 insertions(+), 328 deletions(-)
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
index 0000000000..dc97e8a617
--- /dev/null
+++ b/bsd-user/i386/target_arch_cpu.h
@@ -0,0 +1,208 @@
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
+
+        case EXCP_INTERRUPT:
+            /* just indicate that signals should be handled asap */
+            break;
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
index 7b3550898d..f16d6c80e2 100644
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
+void cpu_loop(CPUArchState *env)
 {
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
@@ -353,7 +187,7 @@ int main(int argc, char **argv)
     struct target_pt_regs regs1, *regs = &regs1;
     struct image_info info1, *info = &info1;
     struct bsd_binprm bprm;
-    TaskState ts1, *ts = &ts1;
+    TaskState *ts;
     CPUArchState *env;
     CPUState *cpu;
     int optind, rv;
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
@@ -558,31 +385,7 @@ int main(int argc, char **argv)
      */
     guest_base = HOST_PAGE_ALIGN(guest_base);
 
-    /*
-     * Read in mmap_min_addr kernel parameter.  This value is used
-     * When loading the ELF image to determine whether guest_base
-     * is needed.
-     *
-     * When user has explicitly set the quest base, we skip this
-     * test.
-     */
-    if (!have_guest_base) {
-        FILE *fp;
-
-        fp = fopen("/proc/sys/vm/mmap_min_addr", "r");
-        if (fp != NULL) {
-            unsigned long tmp;
-            if (fscanf(fp, "%lu", &tmp) == 1) {
-                mmap_min_addr = tmp;
-                qemu_log_mask(CPU_LOG_PAGE, "host mmap_min_addr=0x%lx\n",
-                              mmap_min_addr);
-            }
-            fclose(fp);
-        }
-    }
-
-    if (loader_exec(filename, argv+optind, target_environ, regs, info,
-                    &bprm) != 0) {
+    if (loader_exec(filename, argv+optind, target_environ, regs, info, &bprm)) {
         printf("Error loading %s\n", filename);
         _exit(1);
     }
@@ -610,6 +413,13 @@ int main(int argc, char **argv)
         qemu_log("entry       0x" TARGET_ABI_FMT_lx "\n", info->entry);
     }
 
+    /* build Task State */
+    ts = g_new0(TaskState, 1);
+    init_task_state(ts);
+    ts->info = info;
+    ts->bprm = &bprm;
+    cpu->opaque = ts;
+
     target_set_brk(info->brk);
     syscall_init();
     signal_init();
@@ -621,130 +431,7 @@ int main(int argc, char **argv)
      */
     tcg_prologue_init(tcg_ctx);
 
-    /* build Task State */
-    memset(ts, 0, sizeof(TaskState));
-    init_task_state(ts);
-    ts->info = info;
-    cpu->opaque = ts;
-
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
-
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
-
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
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 6c4ec61d76..5e4cbb40d4 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -82,6 +82,7 @@ typedef struct TaskState {
     pid_t ts_tid;     /* tid (or pid) of this task */
 
     struct TaskState *next;
+    struct bsd_binprm *bprm;
     int used; /* non zero if used */
     struct image_info *info;
 
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
index 0000000000..028d942d59
--- /dev/null
+++ b/bsd-user/x86_64/target_arch_cpu.h
@@ -0,0 +1,246 @@
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
+        case EXCP_INTERRUPT:
+            /* just indicate that signals should be handled asap */
+            break;
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


