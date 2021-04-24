Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B1D36A223
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:35:27 +0200 (CEST)
Received: from localhost ([::1]:50334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laLFe-00053b-Rr
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:35:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKiX-0005dx-NF
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:15 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:42986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKi9-0004Gy-O8
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:12 -0400
Received: by mail-io1-xd2c.google.com with SMTP id s16so46514851iog.9
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ChJIKsZ+72i4GqDFS6kRJf73P8Vzo0ytnwE8c5MWZRo=;
 b=A/d5JWyAOuZYIxdSmdwp/hZHPIcQBLP8JpHDmQh/KrILQJ1uaoD+YBiQSwxsYIjC6d
 MJ2ew7z++HmoCfYiV0JM8ZF6GIEb01NbR1uJOWKhdTz+d9OOCLs3f+DNryhBP1BVe1gX
 adY7i8EaWc2ZIszRaFt2tj9+uktlctp8gXuoLQwx0Sov9HZMSV6GCIW2Grj+tOb9WL7j
 DXQl0n4OT8qpwHM34VJS1XswDfs7k79Nc+tuMbXpC74s76bVyRkOEMLHTljuHhJCR21u
 HPuehCYL1Ez47Nq3oYzFM/vrr25wEnFnkQWDyFWp6jMWtc6O8NhmoOqOahjhkSlZxSzQ
 ip9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ChJIKsZ+72i4GqDFS6kRJf73P8Vzo0ytnwE8c5MWZRo=;
 b=jq3IYDQiCQv1WMT7Qza1vYU8JsgFVzEXwM8gEPO7LiVL7BrC+hvudMLqHy/hAMkW5W
 FRqzBga6LU+tn457UYWA3hIlBkZvcZJIcawdYfs1zxWJ0oR0pQ119XYGM6w1/4q2RJHr
 gIVnz0uDM10RRRFm6Mf1CwKnP//c1W+4E2X51MgRqQ6w0dN07j13/w+Hmm6ZwyNXQmpR
 lrqVhj00Jc8/WDdfno+tgWlgNqEBdhfLm06BQXxjEV3nsMo3E7aPJ+ccBs32OTSH0JET
 PqtRQmTbCOvEW4e0b5XYj8xijJQvLrMR/acAeFssYGXfc1YxwR/Owq/Bu/L3HXSLLtB+
 Wlpw==
X-Gm-Message-State: AOAM530z3bh71GO3oR1YREXe1NR6cXLD26lFjdRhB+gzfD0IIh0CQjU8
 ui3+SophZZ4iCEgiSGRWtlN+pHQubl6Jdz/w
X-Google-Smtp-Source: ABdhPJyrTIFW8WXiLEstq3XFC7m1tvdl9DocyHQ20JPN+gaXH/i6Um4lkjpKbbrZBuWvy1VECCQ1aw==
X-Received: by 2002:a05:6602:24d4:: with SMTP id
 h20mr7534331ioe.4.1619280047505; 
 Sat, 24 Apr 2021 09:00:47 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:46 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 25/48] bsd-user: move x86 (i386 and x86_64) cpu_loop to
 target_arch_cpu.h
Date: Sat, 24 Apr 2021 09:59:53 -0600
Message-Id: <20210424160016.15200-26-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
 bsd-user/i386/target_arch_cpu.h | 177 +++++++++++++++++++++++++++++++-
 bsd-user/main.c                 | 176 +------------------------------
 2 files changed, 179 insertions(+), 174 deletions(-)

diff --git a/bsd-user/i386/target_arch_cpu.h b/bsd-user/i386/target_arch_cpu.h
index c05e048b9b..e8b306c832 100644
--- a/bsd-user/i386/target_arch_cpu.h
+++ b/bsd-user/i386/target_arch_cpu.h
@@ -19,4 +19,179 @@
 #ifndef _TARGET_ARCH_CPU_H_
 #define _TARGET_ARCH_CPU_H_
 
-#endif /* ! _TARGET_ARCH_CPU_H_ */
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
+static void target_cpu_loop(CPUArchState *env)
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
+        case EXCP_INTERRUPT:
+            /* just indicate that signals should be handled asap */
+            break;
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
+#endif /* _TARGET_ARCH_CPU_H_ */
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 8a270ccfe6..43c578c760 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -88,180 +88,10 @@ void fork_end(int child)
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
 #endif
 
-- 
2.22.1


