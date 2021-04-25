Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D93A36A83B
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Apr 2021 18:07:46 +0200 (CEST)
Received: from localhost ([::1]:38470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lahIP-0000SV-BL
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 12:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lah8z-0007wp-Au
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 11:58:01 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:36438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lah8v-0003Cq-3C
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 11:58:01 -0400
Received: by mail-pf1-x432.google.com with SMTP id c3so18557644pfo.3
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 08:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=DKxGWYw3ADKuWB18lhyYVJwm1dNkTUIYY08wHRcIwcI=;
 b=teXZ7QcLMJYiOjvVuBT4Wk9Sp4beLXzC5nqmP/ISJY9HqQULZHJFodubMoHkE3khjG
 xTbNH0As2uuhEbxuF0l6XJQGd1dWJxbSxUASB9N80IRnQZxEO5677VJTy1mow6WQ30vA
 4YCMgaoiV5sf1JP1lePYhhSF1Fhov8mK3FKDqH8bciR5R27V3pagVfVtLhIh3S5cKett
 pgBT88rpje8JBnnC59WK+6ouPBc3mIR71NREOJy2IgnEl9MBiaUCiZhR+GpDeY/Q8ApC
 x88s3GYWoSG/niMPH+YznBVe19rcdYbvrFqrk258L4RDl4CFW6Xpk2dUvCQGNgAtuPYb
 4nsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DKxGWYw3ADKuWB18lhyYVJwm1dNkTUIYY08wHRcIwcI=;
 b=Pb8acq7c7kV2NBqanwcZogwsGqyL30ZRj6j+xhjM/05k15fnbMHD10TMfSqMEsvSf5
 q/g7vp/Nw/VdqbVCnT9Zj4Bo7b7Yk6O8ta/UCtdLR3jxFTu5IpBGjWkdjyTxiZHo7s8q
 6/tnnpj0fpwN/xKgPe5xgUuc1ZT+/ZHk9N2BVpMI+887gWnGW728Ff33pR8HsM8lysWO
 j3CpopPFuiCvDw6O2dJ1B4SpU/wz6/36ODs3NCHJaSOzB6ToCRC4n2XBVX1x0xxMbG1p
 DD+BLSSc1J4bLn3d1HT442f7hHcHoklw75hSKQYIFteF2iujnndk6Bk5WKMs3IJVV4oU
 l8sg==
X-Gm-Message-State: AOAM530wuwMnPeIHpOSJn734n0DBQMDzUVR0dMManQHWvfFnI/zdHL7Y
 gMc22rxR7mEgOQV/McoAaafcqu77fVsT1w==
X-Google-Smtp-Source: ABdhPJyPYN7WFKhLG4nuyEnQdPUVk8GfQ3JYe5aAWTe2fGWb6QUEWJVWcuKOf6rPuXLzzVZ8c6pYpQ==
X-Received: by 2002:a63:5d18:: with SMTP id r24mr13429550pgb.94.1619366275647; 
 Sun, 25 Apr 2021 08:57:55 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id u21sm8594717pfm.89.2021.04.25.08.57.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 08:57:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/8] linux-user/sparc64: Implement signals
Date: Sun, 25 Apr 2021 08:57:49 -0700
Message-Id: <20210425155749.896330-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210425155749.896330-1-richard.henderson@linaro.org>
References: <20210425155749.896330-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We've been using the 32-bit sparc abi for 64-bit signals.
There's a surprising amount of difference, beginning with
the fact that 64-bit always uses rt signal frames.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/target_signal.h    |   2 +
 linux-user/sparc64/target_syscall.h |  14 +-
 linux-user/sparc64/signal.c         | 245 +++++++++++++++++++++++++++-
 3 files changed, 254 insertions(+), 7 deletions(-)

diff --git a/linux-user/sparc/target_signal.h b/linux-user/sparc/target_signal.h
index 911a3f5af5..651320ab8d 100644
--- a/linux-user/sparc/target_signal.h
+++ b/linux-user/sparc/target_signal.h
@@ -67,7 +67,9 @@ typedef struct target_sigaltstack {
 #define TARGET_MINSIGSTKSZ	4096
 #define TARGET_SIGSTKSZ		16384
 
+#if !defined(TARGET_SPARC64) || defined(TARGET_ABI32)
 #define TARGET_ARCH_HAS_SETUP_FRAME
+#endif
 
 /* bit-flags */
 #define TARGET_SS_AUTODISARM (1U << 31) /* disable sas during sighandling */
diff --git a/linux-user/sparc64/target_syscall.h b/linux-user/sparc64/target_syscall.h
index 696a68b1ed..fcc71db16e 100644
--- a/linux-user/sparc64/target_syscall.h
+++ b/linux-user/sparc64/target_syscall.h
@@ -4,14 +4,16 @@
 #include "../sparc/target_errno.h"
 
 struct target_pt_regs {
-	abi_ulong u_regs[16];
-	abi_ulong tstate;
-	abi_ulong pc;
-	abi_ulong npc;
-	abi_ulong y;
-	abi_ulong fprs;
+    abi_ulong u_regs[16];
+    abi_ulong tstate;
+    abi_ulong pc;
+    abi_ulong npc;
+    uint32_t y;
+    uint32_t magic;
 };
 
+#define TARGET_PT_REGS_MAGIC 0x57ac6c00
+
 #define UNAME_MACHINE "sparc64"
 #define UNAME_MINIMUM_RELEASE "2.6.32"
 
diff --git a/linux-user/sparc64/signal.c b/linux-user/sparc64/signal.c
index d27e049c2a..7ba811d342 100644
--- a/linux-user/sparc64/signal.c
+++ b/linux-user/sparc64/signal.c
@@ -17,7 +17,10 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#include "../sparc/signal.c"
+#include "qemu/osdep.h"
+#include "qemu.h"
+#include "signal-common.h"
+#include "linux-user/trace.h"
 
 #define SPARC_MC_TSTATE 0
 #define SPARC_MC_PC 1
@@ -295,3 +298,243 @@ void sparc64_get_context(CPUSPARCState *env)
     unlock_user_struct(ucp, ucp_addr, 1);
     force_sig(TARGET_SIGSEGV);
 }
+
+struct target_sparc_stackf {
+    struct target_reg_window win;
+    uint64_t xargs[8];
+};
+
+struct target_siginfo_fpu_t {
+    uint64_t dregs[32];
+    uint64_t fsr;
+    uint64_t gsr;
+    uint64_t fprs;
+};
+
+struct target_sigcontext {
+    target_siginfo_t info;
+    struct target_pt_regs regs;
+    uint64_t fpu_save;
+    target_stack_t stack;
+    target_sigset_t mask;
+    uint64_t rwin_save;
+};
+
+struct target_rt_sigframe {
+    struct target_sparc_stackf ss;
+    struct target_sigcontext sc;
+    struct target_siginfo_fpu_t fpu;
+};
+
+static abi_ulong get_sigframe(struct target_sigaction *sa,
+                              CPUSPARCState *env, int framesize)
+{
+    abi_ulong sp = target_sigsp(get_sp_from_cpustate(env), sa);
+    return (sp - framesize) & -16;
+}
+
+static void save_pt_regs(struct target_pt_regs *regs, CPUSPARCState *env)
+{
+    int i;
+
+    for (i = 0; i < 8; i++) {
+        __put_user(env->gregs[i], &regs->u_regs[i]);
+    }
+    for (i = 0; i < 8; i++) {
+        __put_user(env->regwptr[WREG_O0 + i], &regs->u_regs[i + 8]);
+    }
+    __put_user(sparc64_tstate(env), &regs->tstate);
+    __put_user(env->pc, &regs->pc);
+    __put_user(env->npc, &regs->npc);
+    __put_user(env->y, &regs->y);
+    __put_user(TARGET_PT_REGS_MAGIC, &regs->magic);
+}
+
+static void restore_pt_regs(struct target_pt_regs *regs, CPUSPARCState *env)
+{
+    uint64_t tstate;
+    int i;
+
+    for (i = 0; i < 8; i++) {
+        __get_user(env->gregs[i], &regs->u_regs[i]);
+    }
+    for (i = 0; i < 8; i++) {
+        __get_user(env->regwptr[WREG_O0 + i], &regs->u_regs[i + 8]);
+    }
+
+    __get_user(env->y, &regs->y);
+    __get_user(tstate, &regs->tstate);
+
+    /* User can only change condition codes and %asi in tstate. */
+    cpu_put_ccr(env, tstate >> 32);
+    env->asi = extract64(tstate, 24, 8);
+}
+
+static void save_fpu_state(struct target_siginfo_fpu_t *regs,
+                           CPUSPARCState *env)
+{
+    int i;
+
+    /* QEMU does not lazy fpu saving.  Save the entire fp register bank. */
+    for (i = 0; i < 32; ++i) {
+        __put_user(env->fpr[i].ll, &regs->dregs[i]);
+    }
+    __put_user(env->fsr, &regs->fsr);
+    __put_user(env->gsr, &regs->gsr);
+    __put_user(env->fprs, &regs->fprs);
+}
+
+static void restore_fpu_state(struct target_siginfo_fpu_t *regs,
+                              CPUSPARCState *env)
+{
+    uint64_t fprs;
+    int i;
+
+    /* In case the user mucks about with FPRS, restore as directed. */
+    __get_user(fprs, &regs->fprs);
+    if (fprs & FPRS_DL) {
+        for (i = 0; i < 16; ++i) {
+            __get_user(env->fpr[i].ll, &regs->dregs[i]);
+        }
+    }
+    if (fprs & FPRS_DU) {
+        for (i = 16; i < 32; ++i) {
+            __get_user(env->fpr[i].ll, &regs->dregs[i]);
+        }
+    }
+    __get_user(env->fsr, &regs->fsr);
+    __get_user(env->gsr, &regs->gsr);
+    env->fprs |= fprs;
+}
+
+void setup_rt_frame(int sig, struct target_sigaction *ka,
+                    target_siginfo_t *info,
+                    target_sigset_t *set, CPUSPARCState *env)
+{
+    abi_ulong sf_addr, sp;
+    struct target_rt_sigframe *sf = NULL;
+    void *window;
+
+    sf_addr = get_sigframe(ka, env, sizeof(*sf));
+    trace_user_setup_rt_frame(env, sf_addr);
+    if (!lock_user_struct(VERIFY_WRITE, sf, sf_addr, 0)) {
+        goto do_sigsegv;
+    }
+
+    /* 2. Save the current process state */
+    save_pt_regs(&sf->sc.regs, env);
+    save_fpu_state(&sf->fpu, env);
+    __put_user(sf_addr + offsetof(struct target_rt_sigframe, fpu),
+               &sf->sc.fpu_save);
+    __put_user(0, &sf->sc.rwin_save);  /* TODO: save_rwin_state */
+
+    /*
+     * Copy one register window from the top-of-stack into the signal frame.
+     * The balance of the sparc_stackf struct is for the callee --- the call
+     * abi requires the space for spilling argument registers.
+     */
+    sp = get_sp_from_cpustate(env);
+    window = lock_user(VERIFY_READ, sp, sizeof(struct target_reg_window), 1);
+    if (!window) {
+        goto do_sigsegv;
+    }
+    memcpy(sf, window, sizeof(struct target_reg_window));
+    unlock_user(window, sp, 0);
+
+    target_save_altstack(&sf->sc.stack, env);
+    for (int i = 0; i < TARGET_NSIG_WORDS; ++i) {
+        __put_user(set->sig[i], &sf->sc.mask.sig[i]);
+    }
+
+    unlock_user(sf, sf_addr, sizeof(*sf));
+
+    /* 3. signal handler back-trampoline and parameters */
+    env->regwptr[WREG_SP] = sf_addr - TARGET_STACK_BIAS;
+    env->regwptr[WREG_O0] = sig;
+    env->regwptr[WREG_O1] = sf_addr + offsetof(struct target_rt_sigframe, sc);
+    env->regwptr[WREG_O2] = sf_addr + offsetof(struct target_rt_sigframe, sc);
+
+    /* 4. return to kernel instructions */
+    env->regwptr[WREG_O7] = ka->ka_restorer;
+
+    /* 5. signal handler */
+    env->pc = ka->_sa_handler;
+    env->npc = env->pc + 4;
+    return;
+
+ do_sigsegv:
+    unlock_user(sf, sf_addr, 0);
+    force_sigsegv(sig);
+}
+
+/*
+ * __NR_sigreturn still exists for backward compatiblity,
+ * but it is set to sys_nis_syscall for sparc64.
+ */
+long do_sigreturn(CPUSPARCState *env)
+{
+    return -TARGET_ENOSYS;
+}
+
+long do_rt_sigreturn(CPUSPARCState *env)
+{
+    abi_ulong sf_addr, sc_addr, tpc, tnpc, ptr;
+    struct target_sigcontext *sc = NULL;
+    sigset_t set;
+
+    sf_addr = get_sp_from_cpustate(env);
+    trace_user_do_rt_sigreturn(env, sf_addr);
+
+    if (sf_addr & 15) {
+        goto do_sigsegv;
+    }
+    sc_addr = sf_addr + offsetof(struct target_rt_sigframe, sc);
+    if (!lock_user_struct(VERIFY_READ, sc, sc_addr, 1)) {
+        goto do_sigsegv;
+    }
+
+    /* Validate SP alignment.  */
+    __get_user(ptr, &sc->regs.u_regs[8 + WREG_SP]);
+    if ((ptr + TARGET_STACK_BIAS) & 7) {
+        goto do_sigsegv;
+    }
+
+    /* Validate PC and NPC alignment.  */
+    __get_user(tpc, &sc->regs.pc);
+    __get_user(tnpc, &sc->regs.npc);
+    if ((tpc | tnpc) & 3) {
+        goto do_sigsegv;
+    }
+
+    restore_pt_regs(&sc->regs, env);
+
+    __get_user(ptr, &sc->fpu_save);
+    if (ptr) {
+        struct target_siginfo_fpu_t *fpu;
+        if ((ptr & 7) || !lock_user_struct(VERIFY_READ, fpu, ptr, 1)) {
+            goto do_sigsegv;
+        }
+        restore_fpu_state(fpu, env);
+        unlock_user_struct(fpu, ptr, 0);
+    }
+
+    __get_user(ptr, &sc->rwin_save);
+    if (ptr) {
+        goto do_sigsegv;  /* TODO: restore_rwin_state */
+    }
+
+    target_to_host_sigset(&set, &sc->mask);
+    set_sigmask(&set);
+    target_restore_altstack(&sc->stack, env);
+
+    env->pc = tpc;
+    env->npc = tnpc;
+
+    unlock_user_struct(sc, sc_addr, 0);
+    return -TARGET_QEMU_ESIGRETURN;
+
+ do_sigsegv:
+    unlock_user_struct(sc, sc_addr, 0);
+    force_sig(TARGET_SIGSEGV);
+    return -TARGET_QEMU_ESIGRETURN;
+}
-- 
2.25.1


