Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E60BA36A837
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Apr 2021 18:04:40 +0200 (CEST)
Received: from localhost ([::1]:59562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lahFP-0005b0-T1
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 12:04:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lah8y-0007up-J3
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 11:58:00 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:33572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lah8t-0003Bn-Hj
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 11:58:00 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 kb13-20020a17090ae7cdb02901503d67f0beso6545817pjb.0
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 08:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=mKuRfL1+RzVTvK6FRkv9AXoAH3HIKU24PAMWq7TOkX8=;
 b=Z+pcVd8XOPhkFaDZSISJhRCYYvuOlZRAio5PQkuX1TtqMIHYs8o2FD0RKpQc3JIYZy
 k23NoqJLbdnuAI6PjvPW3VdzwW/wub4x0zoFU3dUN3l9mBeMN+OovUOV2v12qJvggjlI
 d50WgqTthkDKyL3wCgBgoZ+2iCBSKuEimXn8Vb2MF6/7rbbUl4ZYzOkKoNCHInOHBMFy
 CjIjQlsQudqcKzBv3yt+oK+ym9i8152Z/C3yz7dTiM+CxN6nkKdcGarBUOmLj9VInoMH
 ohtObDuvapk5XRvyQt0kSmrglUtvF+fcRDaAO9Yw3LyIjIRk19zpNknLdn5cFg2fILPI
 6FbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mKuRfL1+RzVTvK6FRkv9AXoAH3HIKU24PAMWq7TOkX8=;
 b=NH2uwNmNSoYoWx6QeQzX3ilDgpb3ZWx6vXW2k1itTm9/7rnvnUjZyzTG8QApfsqjLO
 MqSlUUdISaekCw3pLwlPmS9lKQFFcF+qWkrRoWjEi42bkl3Asx3Tp/wgGca6kQ85ubki
 jZI4NiBmUgCoPiyqiG8wSKUO8aAiAre0CLw+sknIqoqNDN8QqaeUN9XM8I2q951jg8tZ
 ITn0l0l2uEFJyqExGH3LBoXix0d3VVw2/k6ApcOrpTGdgV21GdNbJ6J5YGRuULrvXnNO
 8BGyHPMVpytq/51ftHfV2fKfno5Zlnd/IFWGf6ycG5UrKhPuXQEoQYfrtHa1rjT742rq
 hMFg==
X-Gm-Message-State: AOAM532BUr35jMDMdZHztZebLvJgiA1QkO4bZ1sjEEUQyvz7ZL4bkfLq
 Mh0RJYOEYHb2n16KIwlfG4eIQ2mWG6zGxQ==
X-Google-Smtp-Source: ABdhPJxjS6Dr+n9sVxcqc6NsysrfxlqNhTwA/KT9D65z6vtAnOlt+jifSj+p5D8Cd83QTTsy3XvjhA==
X-Received: by 2002:a17:90b:2394:: with SMTP id
 mr20mr7283866pjb.167.1619366273921; 
 Sun, 25 Apr 2021 08:57:53 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id u21sm8594717pfm.89.2021.04.25.08.57.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 08:57:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/8] linux-user/sparc64: Move sparc64 code out of sparc32
 signal.c
Date: Sun, 25 Apr 2021 08:57:46 -0700
Message-Id: <20210425155749.896330-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210425155749.896330-1-richard.henderson@linaro.org>
References: <20210425155749.896330-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

The bulk of the code goes to sparc64/signal.c, with
TARGET_SPARC_BIAS going to target_cpu.h, as we will
shortly need this define beyond signal.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/target_cpu.h |   6 +
 linux-user/sparc/signal.c     | 280 ----------------------------------
 linux-user/sparc64/signal.c   | 278 +++++++++++++++++++++++++++++++++
 3 files changed, 284 insertions(+), 280 deletions(-)

diff --git a/linux-user/sparc/target_cpu.h b/linux-user/sparc/target_cpu.h
index 1fa1011775..37f6a1d62b 100644
--- a/linux-user/sparc/target_cpu.h
+++ b/linux-user/sparc/target_cpu.h
@@ -20,6 +20,12 @@
 #ifndef SPARC_TARGET_CPU_H
 #define SPARC_TARGET_CPU_H
 
+#if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
+# define TARGET_STACK_BIAS 2047
+#else
+# define TARGET_STACK_BIAS 0
+#endif
+
 static inline void cpu_clone_regs_child(CPUSPARCState *env, target_ulong newsp,
                                         unsigned flags)
 {
diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index d27b7a3af7..756d983af2 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -322,283 +322,3 @@ long do_rt_sigreturn(CPUSPARCState *env)
     qemu_log_mask(LOG_UNIMP, "do_rt_sigreturn: not implemented\n");
     return -TARGET_ENOSYS;
 }
-
-#if defined(TARGET_SPARC64) && !defined(TARGET_ABI32)
-#define SPARC_MC_TSTATE 0
-#define SPARC_MC_PC 1
-#define SPARC_MC_NPC 2
-#define SPARC_MC_Y 3
-#define SPARC_MC_G1 4
-#define SPARC_MC_G2 5
-#define SPARC_MC_G3 6
-#define SPARC_MC_G4 7
-#define SPARC_MC_G5 8
-#define SPARC_MC_G6 9
-#define SPARC_MC_G7 10
-#define SPARC_MC_O0 11
-#define SPARC_MC_O1 12
-#define SPARC_MC_O2 13
-#define SPARC_MC_O3 14
-#define SPARC_MC_O4 15
-#define SPARC_MC_O5 16
-#define SPARC_MC_O6 17
-#define SPARC_MC_O7 18
-#define SPARC_MC_NGREG 19
-
-typedef abi_ulong target_mc_greg_t;
-typedef target_mc_greg_t target_mc_gregset_t[SPARC_MC_NGREG];
-
-struct target_mc_fq {
-    abi_ulong mcfq_addr;
-    uint32_t mcfq_insn;
-};
-
-/*
- * Note the manual 16-alignment; the kernel gets this because it
- * includes a "long double qregs[16]" in the mcpu_fregs union,
- * which we can't do.
- */
-struct target_mc_fpu {
-    union {
-        uint32_t sregs[32];
-        uint64_t dregs[32];
-        //uint128_t qregs[16];
-    } mcfpu_fregs;
-    abi_ulong mcfpu_fsr;
-    abi_ulong mcfpu_fprs;
-    abi_ulong mcfpu_gsr;
-    abi_ulong mcfpu_fq;
-    unsigned char mcfpu_qcnt;
-    unsigned char mcfpu_qentsz;
-    unsigned char mcfpu_enab;
-} __attribute__((aligned(16)));
-typedef struct target_mc_fpu target_mc_fpu_t;
-
-typedef struct {
-    target_mc_gregset_t mc_gregs;
-    target_mc_greg_t mc_fp;
-    target_mc_greg_t mc_i7;
-    target_mc_fpu_t mc_fpregs;
-} target_mcontext_t;
-
-struct target_ucontext {
-    abi_ulong tuc_link;
-    abi_ulong tuc_flags;
-    target_sigset_t tuc_sigmask;
-    target_mcontext_t tuc_mcontext;
-};
-
-/* A V9 register window */
-struct target_reg_window {
-    abi_ulong locals[8];
-    abi_ulong ins[8];
-};
-
-#define TARGET_STACK_BIAS 2047
-
-/* {set, get}context() needed for 64-bit SparcLinux userland. */
-void sparc64_set_context(CPUSPARCState *env)
-{
-    abi_ulong ucp_addr;
-    struct target_ucontext *ucp;
-    target_mc_gregset_t *grp;
-    target_mc_fpu_t *fpup;
-    abi_ulong pc, npc, tstate;
-    unsigned int i;
-    unsigned char fenab;
-
-    ucp_addr = env->regwptr[WREG_O0];
-    if (!lock_user_struct(VERIFY_READ, ucp, ucp_addr, 1)) {
-        goto do_sigsegv;
-    }
-    grp  = &ucp->tuc_mcontext.mc_gregs;
-    __get_user(pc, &((*grp)[SPARC_MC_PC]));
-    __get_user(npc, &((*grp)[SPARC_MC_NPC]));
-    if ((pc | npc) & 3) {
-        goto do_sigsegv;
-    }
-    if (env->regwptr[WREG_O1]) {
-        target_sigset_t target_set;
-        sigset_t set;
-
-        if (TARGET_NSIG_WORDS == 1) {
-            __get_user(target_set.sig[0], &ucp->tuc_sigmask.sig[0]);
-        } else {
-            abi_ulong *src, *dst;
-            src = ucp->tuc_sigmask.sig;
-            dst = target_set.sig;
-            for (i = 0; i < TARGET_NSIG_WORDS; i++, dst++, src++) {
-                __get_user(*dst, src);
-            }
-        }
-        target_to_host_sigset_internal(&set, &target_set);
-        set_sigmask(&set);
-    }
-    env->pc = pc;
-    env->npc = npc;
-    __get_user(env->y, &((*grp)[SPARC_MC_Y]));
-    __get_user(tstate, &((*grp)[SPARC_MC_TSTATE]));
-    /* Honour TSTATE_ASI, TSTATE_ICC and TSTATE_XCC only */
-    env->asi = (tstate >> 24) & 0xff;
-    cpu_put_ccr(env, (tstate >> 32) & 0xff);
-    __get_user(env->gregs[1], (&(*grp)[SPARC_MC_G1]));
-    __get_user(env->gregs[2], (&(*grp)[SPARC_MC_G2]));
-    __get_user(env->gregs[3], (&(*grp)[SPARC_MC_G3]));
-    __get_user(env->gregs[4], (&(*grp)[SPARC_MC_G4]));
-    __get_user(env->gregs[5], (&(*grp)[SPARC_MC_G5]));
-    __get_user(env->gregs[6], (&(*grp)[SPARC_MC_G6]));
-    /* Skip g7 as that's the thread register in userspace */
-
-    /*
-     * Note that unlike the kernel, we didn't need to mess with the
-     * guest register window state to save it into a pt_regs to run
-     * the kernel. So for us the guest's O regs are still in WREG_O*
-     * (unlike the kernel which has put them in UREG_I* in a pt_regs)
-     * and the fp and i7 are still in WREG_I6 and WREG_I7 and don't
-     * need to be written back to userspace memory.
-     */
-    __get_user(env->regwptr[WREG_O0], (&(*grp)[SPARC_MC_O0]));
-    __get_user(env->regwptr[WREG_O1], (&(*grp)[SPARC_MC_O1]));
-    __get_user(env->regwptr[WREG_O2], (&(*grp)[SPARC_MC_O2]));
-    __get_user(env->regwptr[WREG_O3], (&(*grp)[SPARC_MC_O3]));
-    __get_user(env->regwptr[WREG_O4], (&(*grp)[SPARC_MC_O4]));
-    __get_user(env->regwptr[WREG_O5], (&(*grp)[SPARC_MC_O5]));
-    __get_user(env->regwptr[WREG_O6], (&(*grp)[SPARC_MC_O6]));
-    __get_user(env->regwptr[WREG_O7], (&(*grp)[SPARC_MC_O7]));
-
-    __get_user(env->regwptr[WREG_FP], &(ucp->tuc_mcontext.mc_fp));
-    __get_user(env->regwptr[WREG_I7], &(ucp->tuc_mcontext.mc_i7));
-
-    fpup = &ucp->tuc_mcontext.mc_fpregs;
-
-    __get_user(fenab, &(fpup->mcfpu_enab));
-    if (fenab) {
-        abi_ulong fprs;
-
-        /*
-         * We use the FPRS from the guest only in deciding whether
-         * to restore the upper, lower, or both banks of the FPU regs.
-         * The kernel here writes the FPU register data into the
-         * process's current_thread_info state and unconditionally
-         * clears FPRS and TSTATE_PEF: this disables the FPU so that the
-         * next FPU-disabled trap will copy the data out of
-         * current_thread_info and into the real FPU registers.
-         * QEMU doesn't need to handle lazy-FPU-state-restoring like that,
-         * so we always load the data directly into the FPU registers
-         * and leave FPRS and TSTATE_PEF alone (so the FPU stays enabled).
-         * Note that because we (and the kernel) always write zeroes for
-         * the fenab and fprs in sparc64_get_context() none of this code
-         * will execute unless the guest manually constructed or changed
-         * the context structure.
-         */
-        __get_user(fprs, &(fpup->mcfpu_fprs));
-        if (fprs & FPRS_DL) {
-            for (i = 0; i < 16; i++) {
-                __get_user(env->fpr[i].ll, &(fpup->mcfpu_fregs.dregs[i]));
-            }
-        }
-        if (fprs & FPRS_DU) {
-            for (i = 16; i < 32; i++) {
-                __get_user(env->fpr[i].ll, &(fpup->mcfpu_fregs.dregs[i]));
-            }
-        }
-        __get_user(env->fsr, &(fpup->mcfpu_fsr));
-        __get_user(env->gsr, &(fpup->mcfpu_gsr));
-    }
-    unlock_user_struct(ucp, ucp_addr, 0);
-    return;
-do_sigsegv:
-    unlock_user_struct(ucp, ucp_addr, 0);
-    force_sig(TARGET_SIGSEGV);
-}
-
-void sparc64_get_context(CPUSPARCState *env)
-{
-    abi_ulong ucp_addr;
-    struct target_ucontext *ucp;
-    target_mc_gregset_t *grp;
-    target_mcontext_t *mcp;
-    int err;
-    unsigned int i;
-    target_sigset_t target_set;
-    sigset_t set;
-
-    ucp_addr = env->regwptr[WREG_O0];
-    if (!lock_user_struct(VERIFY_WRITE, ucp, ucp_addr, 0)) {
-        goto do_sigsegv;
-    }
-
-    memset(ucp, 0, sizeof(*ucp));
-
-    mcp = &ucp->tuc_mcontext;
-    grp = &mcp->mc_gregs;
-
-    /* Skip over the trap instruction, first. */
-    env->pc = env->npc;
-    env->npc += 4;
-
-    /* If we're only reading the signal mask then do_sigprocmask()
-     * is guaranteed not to fail, which is important because we don't
-     * have any way to signal a failure or restart this operation since
-     * this is not a normal syscall.
-     */
-    err = do_sigprocmask(0, NULL, &set);
-    assert(err == 0);
-    host_to_target_sigset_internal(&target_set, &set);
-    if (TARGET_NSIG_WORDS == 1) {
-        __put_user(target_set.sig[0],
-                   (abi_ulong *)&ucp->tuc_sigmask);
-    } else {
-        abi_ulong *src, *dst;
-        src = target_set.sig;
-        dst = ucp->tuc_sigmask.sig;
-        for (i = 0; i < TARGET_NSIG_WORDS; i++, dst++, src++) {
-            __put_user(*src, dst);
-        }
-    }
-
-    __put_user(sparc64_tstate(env), &((*grp)[SPARC_MC_TSTATE]));
-    __put_user(env->pc, &((*grp)[SPARC_MC_PC]));
-    __put_user(env->npc, &((*grp)[SPARC_MC_NPC]));
-    __put_user(env->y, &((*grp)[SPARC_MC_Y]));
-    __put_user(env->gregs[1], &((*grp)[SPARC_MC_G1]));
-    __put_user(env->gregs[2], &((*grp)[SPARC_MC_G2]));
-    __put_user(env->gregs[3], &((*grp)[SPARC_MC_G3]));
-    __put_user(env->gregs[4], &((*grp)[SPARC_MC_G4]));
-    __put_user(env->gregs[5], &((*grp)[SPARC_MC_G5]));
-    __put_user(env->gregs[6], &((*grp)[SPARC_MC_G6]));
-    __put_user(env->gregs[7], &((*grp)[SPARC_MC_G7]));
-
-    /*
-     * Note that unlike the kernel, we didn't need to mess with the
-     * guest register window state to save it into a pt_regs to run
-     * the kernel. So for us the guest's O regs are still in WREG_O*
-     * (unlike the kernel which has put them in UREG_I* in a pt_regs)
-     * and the fp and i7 are still in WREG_I6 and WREG_I7 and don't
-     * need to be fished out of userspace memory.
-     */
-    __put_user(env->regwptr[WREG_O0], &((*grp)[SPARC_MC_O0]));
-    __put_user(env->regwptr[WREG_O1], &((*grp)[SPARC_MC_O1]));
-    __put_user(env->regwptr[WREG_O2], &((*grp)[SPARC_MC_O2]));
-    __put_user(env->regwptr[WREG_O3], &((*grp)[SPARC_MC_O3]));
-    __put_user(env->regwptr[WREG_O4], &((*grp)[SPARC_MC_O4]));
-    __put_user(env->regwptr[WREG_O5], &((*grp)[SPARC_MC_O5]));
-    __put_user(env->regwptr[WREG_O6], &((*grp)[SPARC_MC_O6]));
-    __put_user(env->regwptr[WREG_O7], &((*grp)[SPARC_MC_O7]));
-
-    __put_user(env->regwptr[WREG_FP], &(mcp->mc_fp));
-    __put_user(env->regwptr[WREG_I7], &(mcp->mc_i7));
-
-    /*
-     * We don't write out the FPU state. This matches the kernel's
-     * implementation (which has the code for doing this but
-     * hidden behind an "if (fenab)" where fenab is always 0).
-     */
-
-    unlock_user_struct(ucp, ucp_addr, 1);
-    return;
-do_sigsegv:
-    unlock_user_struct(ucp, ucp_addr, 1);
-    force_sig(TARGET_SIGSEGV);
-}
-#endif
diff --git a/linux-user/sparc64/signal.c b/linux-user/sparc64/signal.c
index 170ebac232..d27e049c2a 100644
--- a/linux-user/sparc64/signal.c
+++ b/linux-user/sparc64/signal.c
@@ -16,4 +16,282 @@
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
+
 #include "../sparc/signal.c"
+
+#define SPARC_MC_TSTATE 0
+#define SPARC_MC_PC 1
+#define SPARC_MC_NPC 2
+#define SPARC_MC_Y 3
+#define SPARC_MC_G1 4
+#define SPARC_MC_G2 5
+#define SPARC_MC_G3 6
+#define SPARC_MC_G4 7
+#define SPARC_MC_G5 8
+#define SPARC_MC_G6 9
+#define SPARC_MC_G7 10
+#define SPARC_MC_O0 11
+#define SPARC_MC_O1 12
+#define SPARC_MC_O2 13
+#define SPARC_MC_O3 14
+#define SPARC_MC_O4 15
+#define SPARC_MC_O5 16
+#define SPARC_MC_O6 17
+#define SPARC_MC_O7 18
+#define SPARC_MC_NGREG 19
+
+typedef abi_ulong target_mc_greg_t;
+typedef target_mc_greg_t target_mc_gregset_t[SPARC_MC_NGREG];
+
+struct target_mc_fq {
+    abi_ulong mcfq_addr;
+    uint32_t mcfq_insn;
+};
+
+/*
+ * Note the manual 16-alignment; the kernel gets this because it
+ * includes a "long double qregs[16]" in the mcpu_fregs union,
+ * which we can't do.
+ */
+struct target_mc_fpu {
+    union {
+        uint32_t sregs[32];
+        uint64_t dregs[32];
+    } mcfpu_fregs;
+    abi_ulong mcfpu_fsr;
+    abi_ulong mcfpu_fprs;
+    abi_ulong mcfpu_gsr;
+    abi_ulong mcfpu_fq;
+    unsigned char mcfpu_qcnt;
+    unsigned char mcfpu_qentsz;
+    unsigned char mcfpu_enab;
+} __attribute__((aligned(16)));
+typedef struct target_mc_fpu target_mc_fpu_t;
+
+typedef struct {
+    target_mc_gregset_t mc_gregs;
+    target_mc_greg_t mc_fp;
+    target_mc_greg_t mc_i7;
+    target_mc_fpu_t mc_fpregs;
+} target_mcontext_t;
+
+struct target_ucontext {
+    abi_ulong tuc_link;
+    abi_ulong tuc_flags;
+    target_sigset_t tuc_sigmask;
+    target_mcontext_t tuc_mcontext;
+};
+
+/* A V9 register window */
+struct target_reg_window {
+    abi_ulong locals[8];
+    abi_ulong ins[8];
+};
+
+/* {set, get}context() needed for 64-bit SparcLinux userland. */
+void sparc64_set_context(CPUSPARCState *env)
+{
+    abi_ulong ucp_addr;
+    struct target_ucontext *ucp;
+    target_mc_gregset_t *grp;
+    target_mc_fpu_t *fpup;
+    abi_ulong pc, npc, tstate;
+    unsigned int i;
+    unsigned char fenab;
+
+    ucp_addr = env->regwptr[WREG_O0];
+    if (!lock_user_struct(VERIFY_READ, ucp, ucp_addr, 1)) {
+        goto do_sigsegv;
+    }
+    grp  = &ucp->tuc_mcontext.mc_gregs;
+    __get_user(pc, &((*grp)[SPARC_MC_PC]));
+    __get_user(npc, &((*grp)[SPARC_MC_NPC]));
+    if ((pc | npc) & 3) {
+        goto do_sigsegv;
+    }
+    if (env->regwptr[WREG_O1]) {
+        target_sigset_t target_set;
+        sigset_t set;
+
+        if (TARGET_NSIG_WORDS == 1) {
+            __get_user(target_set.sig[0], &ucp->tuc_sigmask.sig[0]);
+        } else {
+            abi_ulong *src, *dst;
+            src = ucp->tuc_sigmask.sig;
+            dst = target_set.sig;
+            for (i = 0; i < TARGET_NSIG_WORDS; i++, dst++, src++) {
+                __get_user(*dst, src);
+            }
+        }
+        target_to_host_sigset_internal(&set, &target_set);
+        set_sigmask(&set);
+    }
+    env->pc = pc;
+    env->npc = npc;
+    __get_user(env->y, &((*grp)[SPARC_MC_Y]));
+    __get_user(tstate, &((*grp)[SPARC_MC_TSTATE]));
+    /* Honour TSTATE_ASI, TSTATE_ICC and TSTATE_XCC only */
+    env->asi = (tstate >> 24) & 0xff;
+    cpu_put_ccr(env, (tstate >> 32) & 0xff);
+    __get_user(env->gregs[1], (&(*grp)[SPARC_MC_G1]));
+    __get_user(env->gregs[2], (&(*grp)[SPARC_MC_G2]));
+    __get_user(env->gregs[3], (&(*grp)[SPARC_MC_G3]));
+    __get_user(env->gregs[4], (&(*grp)[SPARC_MC_G4]));
+    __get_user(env->gregs[5], (&(*grp)[SPARC_MC_G5]));
+    __get_user(env->gregs[6], (&(*grp)[SPARC_MC_G6]));
+    /* Skip g7 as that's the thread register in userspace */
+
+    /*
+     * Note that unlike the kernel, we didn't need to mess with the
+     * guest register window state to save it into a pt_regs to run
+     * the kernel. So for us the guest's O regs are still in WREG_O*
+     * (unlike the kernel which has put them in UREG_I* in a pt_regs)
+     * and the fp and i7 are still in WREG_I6 and WREG_I7 and don't
+     * need to be written back to userspace memory.
+     */
+    __get_user(env->regwptr[WREG_O0], (&(*grp)[SPARC_MC_O0]));
+    __get_user(env->regwptr[WREG_O1], (&(*grp)[SPARC_MC_O1]));
+    __get_user(env->regwptr[WREG_O2], (&(*grp)[SPARC_MC_O2]));
+    __get_user(env->regwptr[WREG_O3], (&(*grp)[SPARC_MC_O3]));
+    __get_user(env->regwptr[WREG_O4], (&(*grp)[SPARC_MC_O4]));
+    __get_user(env->regwptr[WREG_O5], (&(*grp)[SPARC_MC_O5]));
+    __get_user(env->regwptr[WREG_O6], (&(*grp)[SPARC_MC_O6]));
+    __get_user(env->regwptr[WREG_O7], (&(*grp)[SPARC_MC_O7]));
+
+    __get_user(env->regwptr[WREG_FP], &(ucp->tuc_mcontext.mc_fp));
+    __get_user(env->regwptr[WREG_I7], &(ucp->tuc_mcontext.mc_i7));
+
+    fpup = &ucp->tuc_mcontext.mc_fpregs;
+
+    __get_user(fenab, &(fpup->mcfpu_enab));
+    if (fenab) {
+        abi_ulong fprs;
+
+        /*
+         * We use the FPRS from the guest only in deciding whether
+         * to restore the upper, lower, or both banks of the FPU regs.
+         * The kernel here writes the FPU register data into the
+         * process's current_thread_info state and unconditionally
+         * clears FPRS and TSTATE_PEF: this disables the FPU so that the
+         * next FPU-disabled trap will copy the data out of
+         * current_thread_info and into the real FPU registers.
+         * QEMU doesn't need to handle lazy-FPU-state-restoring like that,
+         * so we always load the data directly into the FPU registers
+         * and leave FPRS and TSTATE_PEF alone (so the FPU stays enabled).
+         * Note that because we (and the kernel) always write zeroes for
+         * the fenab and fprs in sparc64_get_context() none of this code
+         * will execute unless the guest manually constructed or changed
+         * the context structure.
+         */
+        __get_user(fprs, &(fpup->mcfpu_fprs));
+        if (fprs & FPRS_DL) {
+            for (i = 0; i < 16; i++) {
+                __get_user(env->fpr[i].ll, &(fpup->mcfpu_fregs.dregs[i]));
+            }
+        }
+        if (fprs & FPRS_DU) {
+            for (i = 16; i < 32; i++) {
+                __get_user(env->fpr[i].ll, &(fpup->mcfpu_fregs.dregs[i]));
+            }
+        }
+        __get_user(env->fsr, &(fpup->mcfpu_fsr));
+        __get_user(env->gsr, &(fpup->mcfpu_gsr));
+    }
+    unlock_user_struct(ucp, ucp_addr, 0);
+    return;
+
+ do_sigsegv:
+    unlock_user_struct(ucp, ucp_addr, 0);
+    force_sig(TARGET_SIGSEGV);
+}
+
+void sparc64_get_context(CPUSPARCState *env)
+{
+    abi_ulong ucp_addr;
+    struct target_ucontext *ucp;
+    target_mc_gregset_t *grp;
+    target_mcontext_t *mcp;
+    int err;
+    unsigned int i;
+    target_sigset_t target_set;
+    sigset_t set;
+
+    ucp_addr = env->regwptr[WREG_O0];
+    if (!lock_user_struct(VERIFY_WRITE, ucp, ucp_addr, 0)) {
+        goto do_sigsegv;
+    }
+
+    memset(ucp, 0, sizeof(*ucp));
+
+    mcp = &ucp->tuc_mcontext;
+    grp = &mcp->mc_gregs;
+
+    /* Skip over the trap instruction, first. */
+    env->pc = env->npc;
+    env->npc += 4;
+
+    /*
+     * If we're only reading the signal mask then do_sigprocmask()
+     * is guaranteed not to fail, which is important because we don't
+     * have any way to signal a failure or restart this operation since
+     * this is not a normal syscall.
+     */
+    err = do_sigprocmask(0, NULL, &set);
+    assert(err == 0);
+    host_to_target_sigset_internal(&target_set, &set);
+    if (TARGET_NSIG_WORDS == 1) {
+        __put_user(target_set.sig[0], (abi_ulong *)&ucp->tuc_sigmask);
+    } else {
+        abi_ulong *src, *dst;
+        src = target_set.sig;
+        dst = ucp->tuc_sigmask.sig;
+        for (i = 0; i < TARGET_NSIG_WORDS; i++, dst++, src++) {
+            __put_user(*src, dst);
+        }
+    }
+
+    __put_user(sparc64_tstate(env), &((*grp)[SPARC_MC_TSTATE]));
+    __put_user(env->pc, &((*grp)[SPARC_MC_PC]));
+    __put_user(env->npc, &((*grp)[SPARC_MC_NPC]));
+    __put_user(env->y, &((*grp)[SPARC_MC_Y]));
+    __put_user(env->gregs[1], &((*grp)[SPARC_MC_G1]));
+    __put_user(env->gregs[2], &((*grp)[SPARC_MC_G2]));
+    __put_user(env->gregs[3], &((*grp)[SPARC_MC_G3]));
+    __put_user(env->gregs[4], &((*grp)[SPARC_MC_G4]));
+    __put_user(env->gregs[5], &((*grp)[SPARC_MC_G5]));
+    __put_user(env->gregs[6], &((*grp)[SPARC_MC_G6]));
+    __put_user(env->gregs[7], &((*grp)[SPARC_MC_G7]));
+
+    /*
+     * Note that unlike the kernel, we didn't need to mess with the
+     * guest register window state to save it into a pt_regs to run
+     * the kernel. So for us the guest's O regs are still in WREG_O*
+     * (unlike the kernel which has put them in UREG_I* in a pt_regs)
+     * and the fp and i7 are still in WREG_I6 and WREG_I7 and don't
+     * need to be fished out of userspace memory.
+     */
+    __put_user(env->regwptr[WREG_O0], &((*grp)[SPARC_MC_O0]));
+    __put_user(env->regwptr[WREG_O1], &((*grp)[SPARC_MC_O1]));
+    __put_user(env->regwptr[WREG_O2], &((*grp)[SPARC_MC_O2]));
+    __put_user(env->regwptr[WREG_O3], &((*grp)[SPARC_MC_O3]));
+    __put_user(env->regwptr[WREG_O4], &((*grp)[SPARC_MC_O4]));
+    __put_user(env->regwptr[WREG_O5], &((*grp)[SPARC_MC_O5]));
+    __put_user(env->regwptr[WREG_O6], &((*grp)[SPARC_MC_O6]));
+    __put_user(env->regwptr[WREG_O7], &((*grp)[SPARC_MC_O7]));
+
+    __put_user(env->regwptr[WREG_FP], &(mcp->mc_fp));
+    __put_user(env->regwptr[WREG_I7], &(mcp->mc_i7));
+
+    /*
+     * We don't write out the FPU state. This matches the kernel's
+     * implementation (which has the code for doing this but
+     * hidden behind an "if (fenab)" where fenab is always 0).
+     */
+
+    unlock_user_struct(ucp, ucp_addr, 1);
+    return;
+
+ do_sigsegv:
+    unlock_user_struct(ucp, ucp_addr, 1);
+    force_sig(TARGET_SIGSEGV);
+}
-- 
2.25.1


