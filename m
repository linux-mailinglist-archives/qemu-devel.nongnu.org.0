Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2EB18898F
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 16:57:00 +0100 (CET)
Received: from localhost ([::1]:35376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEEaQ-0006Rl-WF
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 11:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37012)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jEEVL-0004nt-5X
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 11:51:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jEEVJ-0007El-8s
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 11:51:43 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:35129)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1jEEVI-000790-Q4
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 11:51:41 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MtwQk-1jYwAz1bHY-00uIMC; Tue, 17 Mar 2020 16:51:25 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL v2 03/37] linux-user/i386: Emulate x86_64 vsyscalls
Date: Tue, 17 Mar 2020 16:50:42 +0100
Message-Id: <20200317155116.1227513-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200317155116.1227513-1-laurent@vivier.eu>
References: <20200317155116.1227513-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:DisN5QYBYT8eockwvbUcXgNGzPf6AdrGQRK32k0reebOjW2gdeA
 x6n8k1RUr8G0HPWq2HK4EKeG+nWCfVXG9uw9F9f1RgbFV/Hso4F5hwqotf6KFuXm76XS5Ew
 CGxw0ZZcTeCQjTonO7w1vF4E7MdM+y7bKNuUCmWtWHl3GHGQlKQBaH9qYbXi+d0gev102fY
 JJLHNuyfVG5lYZq2LrwcQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7gu1KM9ArR4=:aFIDNMVxLSntpsgLRg1feU
 8/gZG7oPcGkWGUz+ezelScIn+volkCP5xwpnmKlBR3H4Ry7QA6drZ8UlRF5sN6xzfYs+IG/y8
 Ns5rWOb5IxjE0rvAgCeB83gL9wxrbcUQspcgC0ZADHKhx3aECuIrySP0MZHy7jbGHJ6R0wbaM
 YPAJkcbtc/CiRWnIU/PjbdEWotpAFNYjzXxT1QuKDWgaq3sKJB1soeSXJ6zSf0+cCZ3B6yjqO
 L9op5xLLzaHP83sIOQdeKlOuklygDYWxrTUOH3uQkoXFkm1/FFouerRadnNO49YqHRrjehmeP
 TqaIMmCFTH8cP8laomi4r2kXx/MuPapSwDAr+hXWQmxwmBqC5py117Ab9Is8Rcj16i5tbaVcc
 oMS7xER/snBOTguhV62V78lFhm+M6UV5rePoN2UnI60T8y6qfhUa62NEusNfUK+7mGpdnrhkF
 7zBKLvlK7oJRzjd8kh+HnK6a3GpYJ6WKY4CHWIo8ye5dyITr5OQFv1zTjuKWR6rXfjK0umxYh
 G1fs7ryjak608kTHG9kxAHfCJs7j/uSTEmjSdjpVRkeoK0+4LEEmjx3vjoEla3r7fJ3AdX5GB
 mjQFBFnOM0OQbD48URp2Kb7Tr3W97YnGPeAPtpWCF+nFeCbOn6Lh36E292G5/JP6LlP3VEoWV
 GbLPeie+qc5040byRTVsyI/U/b88K015AgSIam1xxGnehuR5NqL18NnsGBbfzcWlrZkn+xtTQ
 5zh7HI45nYqxLpZxdMMQ62fgWaeLT0jeTUgW8OeSbi6DXLOyENnFuheYGfeJ4g+uyylREoepr
 OE9k3X9Mv7hMW2z1tHm9lv3Ne2vHMAP85zUTGKDX/I/0V2fnY2vpevqTa+CNEauin22Yq9I
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.73
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Notice the magic page during translate, much like we already
do for the arm32 commpage.  At runtime, raise an exception to
return cpu_loop for emulation.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200213032223.14643-4-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/i386/cpu_loop.c | 108 +++++++++++++++++++++++++++++++++++++
 target/i386/cpu.h          |   7 +++
 target/i386/translate.c    |  14 ++++-
 3 files changed, 128 insertions(+), 1 deletion(-)

diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
index e217cca5ee1e..70cde417e605 100644
--- a/linux-user/i386/cpu_loop.c
+++ b/linux-user/i386/cpu_loop.c
@@ -92,6 +92,109 @@ static void gen_signal(CPUX86State *env, int sig, int code, abi_ptr addr)
     queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
 }
 
+#ifdef TARGET_X86_64
+static bool write_ok_or_segv(CPUX86State *env, abi_ptr addr, size_t len)
+{
+    /*
+     * For all the vsyscalls, NULL means "don't write anything" not
+     * "write it at address 0".
+     */
+    if (addr == 0 || access_ok(VERIFY_WRITE, addr, len)) {
+        return true;
+    }
+
+    env->error_code = PG_ERROR_W_MASK | PG_ERROR_U_MASK;
+    gen_signal(env, TARGET_SIGSEGV, TARGET_SEGV_MAPERR, addr);
+    return false;
+}
+
+/*
+ * Since v3.1, the kernel traps and emulates the vsyscall page.
+ * Entry points other than the official generate SIGSEGV.
+ */
+static void emulate_vsyscall(CPUX86State *env)
+{
+    int syscall;
+    abi_ulong ret;
+    uint64_t caller;
+
+    /*
+     * Validate the entry point.  We have already validated the page
+     * during translation to get here; now verify the offset.
+     */
+    switch (env->eip & ~TARGET_PAGE_MASK) {
+    case 0x000:
+        syscall = TARGET_NR_gettimeofday;
+        break;
+    case 0x400:
+        syscall = TARGET_NR_time;
+        break;
+    case 0x800:
+        syscall = TARGET_NR_getcpu;
+        break;
+    default:
+        goto sigsegv;
+    }
+
+    /*
+     * Validate the return address.
+     * Note that the kernel treats this the same as an invalid entry point.
+     */
+    if (get_user_u64(caller, env->regs[R_ESP])) {
+        goto sigsegv;
+    }
+
+    /*
+     * Validate the the pointer arguments.
+     */
+    switch (syscall) {
+    case TARGET_NR_gettimeofday:
+        if (!write_ok_or_segv(env, env->regs[R_EDI],
+                              sizeof(struct target_timeval)) ||
+            !write_ok_or_segv(env, env->regs[R_ESI],
+                              sizeof(struct target_timezone))) {
+            return;
+        }
+        break;
+    case TARGET_NR_time:
+        if (!write_ok_or_segv(env, env->regs[R_EDI], sizeof(abi_long))) {
+            return;
+        }
+        break;
+    case TARGET_NR_getcpu:
+        if (!write_ok_or_segv(env, env->regs[R_EDI], sizeof(uint32_t)) ||
+            !write_ok_or_segv(env, env->regs[R_ESI], sizeof(uint32_t))) {
+            return;
+        }
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    /*
+     * Perform the syscall.  None of the vsyscalls should need restarting.
+     */
+    ret = do_syscall(env, syscall, env->regs[R_EDI], env->regs[R_ESI],
+                     env->regs[R_EDX], env->regs[10], env->regs[8],
+                     env->regs[9], 0, 0);
+    g_assert(ret != -TARGET_ERESTARTSYS);
+    g_assert(ret != -TARGET_QEMU_ESIGRETURN);
+    if (ret == -TARGET_EFAULT) {
+        goto sigsegv;
+    }
+    env->regs[R_EAX] = ret;
+
+    /* Emulate a ret instruction to leave the vsyscall page.  */
+    env->eip = caller;
+    env->regs[R_ESP] += 8;
+    return;
+
+ sigsegv:
+    /* Like force_sig(SIGSEGV).  */
+    gen_signal(env, TARGET_SIGSEGV, TARGET_SI_KERNEL, 0);
+}
+#endif
+
 void cpu_loop(CPUX86State *env)
 {
     CPUState *cs = env_cpu(env);
@@ -141,6 +244,11 @@ void cpu_loop(CPUX86State *env)
                 env->regs[R_EAX] = ret;
             }
             break;
+#endif
+#ifdef TARGET_X86_64
+        case EXCP_VSYSCALL:
+            emulate_vsyscall(env);
+            break;
 #endif
         case EXCP0B_NOSEG:
         case EXCP0C_STACK:
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 08b4422f36bd..39be555db3da 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1001,6 +1001,7 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 
 #define EXCP_VMEXIT     0x100 /* only for system emulation */
 #define EXCP_SYSCALL    0x101 /* only for user emulation */
+#define EXCP_VSYSCALL   0x102 /* only for user emulation */
 
 /* i386-specific interrupt pending bits.  */
 #define CPU_INTERRUPT_POLL      CPU_INTERRUPT_TGT_EXT_1
@@ -2215,4 +2216,10 @@ static inline bool hyperv_feat_enabled(X86CPU *cpu, int feat)
     return !!(cpu->hyperv_features & BIT(feat));
 }
 
+#if defined(TARGET_X86_64) && \
+    defined(CONFIG_USER_ONLY) && \
+    defined(CONFIG_LINUX)
+# define TARGET_VSYSCALL_PAGE  (UINT64_C(-10) << 20)
+#endif
+
 #endif /* I386_CPU_H */
diff --git a/target/i386/translate.c b/target/i386/translate.c
index d9af8f4078b3..5e5dbb41b0ce 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -8555,7 +8555,19 @@ static bool i386_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
 static void i386_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
-    target_ulong pc_next = disas_insn(dc, cpu);
+    target_ulong pc_next;
+
+#ifdef TARGET_VSYSCALL_PAGE
+    /*
+     * Detect entry into the vsyscall page and invoke the syscall.
+     */
+    if ((dc->base.pc_next & TARGET_PAGE_MASK) == TARGET_VSYSCALL_PAGE) {
+        gen_exception(dc, EXCP_VSYSCALL, dc->base.pc_next);
+        return;
+    }
+#endif
+
+    pc_next = disas_insn(dc, cpu);
 
     if (dc->tf || (dc->base.tb->flags & HF_INHIBIT_IRQ_MASK)) {
         /* if single step mode, we generate only one instruction and
-- 
2.24.1


