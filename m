Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1916D2DE0F8
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 11:28:02 +0100 (CET)
Received: from localhost ([::1]:55792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqCzR-0008AG-3M
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 05:28:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqCvs-0002wX-SW
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:24:20 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:41353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqCvp-000741-H3
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:24:20 -0500
Received: from localhost.localdomain ([82.252.144.198]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M9WqY-1kkjHv1aZI-005YnI; Fri, 18 Dec 2020 11:24:15 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 11/14] linux-user/sparc: Correct sparc64_get/set_context() FPU
 handling
Date: Fri, 18 Dec 2020 11:24:04 +0100
Message-Id: <20201218102407.597566-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218102407.597566-1-laurent@vivier.eu>
References: <20201218102407.597566-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:tAA8wzpmcyTJvwGHlgOvaKxlvdE0g2SF7CMassFbzX1PMAMdj4K
 haISmeZscM90+XOik+FLruL+p5MaO/p0NzkYO3EIeeIAbIxzOMi/cDPdbUhKoCvo9gfa+fH
 ppik7UmnlV5jrEUWladWNOL4kN309vXCeDw7tPueKjB/QBNkDbRRRFzLftgPjUzb4XZ6bkb
 2GYyyI+DXcFtReQjm8wfg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Y55u4TcnwEY=:x3+GQFQNpKep3YgaCxKES8
 P+YtFIgafhvsqRcu8cwKbTJJcYifSBYwnNWc1x1y0rYoTZl0CkQcCFCxjqN5HKFXPqrhvdYpz
 VNj7YTzvLIschvi43KYNxSNYDPWpMsHjfiF26txqu5AMY/WKu7kMtRcW8paiH7j4UaXT9/McK
 Oas3Noc97xXcLrIVdhv160sWZN4rhKhsNXnnUcTw9aEI/F6fjzf2ltjN7e3ZXLwsYfj06WsJg
 izPc9YjxIy3DMy8t9RObeKbHF+hV1Sg6Wg9BIjrd2N3sOr586iASW6Qg5/1Z8e5h82OwlGgKH
 n9vkRgb4TnU6awfJossq8B4XQe0dWytVSen/pRaBlohST1VKbVDYjxs5p7mZ/p2082MIwxUy1
 2sXbh6+/DosC0UmqFLTEARehVIx6SaVxPgXuIhPae2Q5LlOVTTrtRDLNmF6Pd
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

The handling of the FPU state in sparc64_get_context() and
sparc64_set_context() is not the same as what the kernel actually
does: we unconditionally read and write the FP registers and the
FSR, GSR and FPRS, but the kernel logic is more complicated:
 * in get_context the kernel has code for saving FPU registers,
   but it is hidden inside an "if (fenab) condition and the
   fenab flag is always set to 0 (inside an "#if 1" which has
   been in the kernel for over 15 years). So the effect is that
   the FPU state part is always written as zeroes.
 * in set_context the kernel looks at the fenab field in the
   structure from the guest, and only restores the state if
   it is set; it also looks at the structure's FPRS to see
   whether either the upper or lower or both halves of the
   register file have valid data.

Bring our implementations into line with the kernel:
 * in get_context:
    - clear the entire target_ucontext at the top of the
      function (as the kernel does)
    - then don't write the FPU state, so those fields remain zero
    - this fixes Coverity issue CID 1432305 by deleting the code
      it was complaining about
 * in set_context:
    - check the fenab and the fpsr to decide which parts of
      the FPU data to restore, if any
    - instead of setting the FPU registers by doing two
      32-bit loads and filling in the .upper and .lower parts
      of the CPU_Double union separately, just do a 64-bit
      load of the whole register at once. This fixes Coverity
      issue CID 1432303 because we now access the dregs[] part
      of the mcfpu_fregs union rather than the sregs[] part
      (which is not large enough to actually cover the whole of
      the data, so we were accessing off the end of sregs[])

We change both functions in a single commit to avoid potentially
breaking bisection.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201106152738.26026-2-peter.maydell@linaro.org>
[lv: fix FPRS_DU loop s/31/32/]
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/signal.c | 74 +++++++++++++++++++++++----------------
 target/sparc/cpu.h        |  4 ++-
 2 files changed, 46 insertions(+), 32 deletions(-)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index d12adc8e6ff9..0057b48fad93 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -402,8 +402,10 @@ void sparc64_set_context(CPUSPARCState *env)
     abi_ulong ucp_addr;
     struct target_ucontext *ucp;
     target_mc_gregset_t *grp;
+    target_mc_fpu_t *fpup;
     abi_ulong pc, npc, tstate;
     unsigned int i;
+    unsigned char fenab;
 
     ucp_addr = env->regwptr[WREG_O0];
     if (!lock_user_struct(VERIFY_READ, ucp, ucp_addr, 1)) {
@@ -467,26 +469,42 @@ void sparc64_set_context(CPUSPARCState *env)
     __get_user(env->regwptr[WREG_FP], &(ucp->tuc_mcontext.mc_fp));
     __get_user(env->regwptr[WREG_I7], &(ucp->tuc_mcontext.mc_i7));
 
-    /* FIXME this does not match how the kernel handles the FPU in
-     * its sparc64_set_context implementation. In particular the FPU
-     * is only restored if fenab is non-zero in:
-     *   __get_user(fenab, &(ucp->tuc_mcontext.mc_fpregs.mcfpu_enab));
-     */
-    __get_user(env->fprs, &(ucp->tuc_mcontext.mc_fpregs.mcfpu_fprs));
-    {
-        uint32_t *src = ucp->tuc_mcontext.mc_fpregs.mcfpu_fregs.sregs;
-        for (i = 0; i < 64; i++, src++) {
-            if (i & 1) {
-                __get_user(env->fpr[i/2].l.lower, src);
-            } else {
-                __get_user(env->fpr[i/2].l.upper, src);
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
             }
         }
+        __get_user(env->fsr, &(fpup->mcfpu_fsr));
+        __get_user(env->gsr, &(fpup->mcfpu_gsr));
     }
-    __get_user(env->fsr,
-               &(ucp->tuc_mcontext.mc_fpregs.mcfpu_fsr));
-    __get_user(env->gsr,
-               &(ucp->tuc_mcontext.mc_fpregs.mcfpu_gsr));
     unlock_user_struct(ucp, ucp_addr, 0);
     return;
 do_sigsegv:
@@ -509,7 +527,9 @@ void sparc64_get_context(CPUSPARCState *env)
     if (!lock_user_struct(VERIFY_WRITE, ucp, ucp_addr, 0)) {
         goto do_sigsegv;
     }
-    
+
+    memset(ucp, 0, sizeof(*ucp));
+
     mcp = &ucp->tuc_mcontext;
     grp = &mcp->mc_gregs;
 
@@ -572,19 +592,11 @@ void sparc64_get_context(CPUSPARCState *env)
     __put_user(env->regwptr[WREG_FP], &(mcp->mc_fp));
     __put_user(env->regwptr[WREG_I7], &(mcp->mc_i7));
 
-    {
-        uint32_t *dst = ucp->tuc_mcontext.mc_fpregs.mcfpu_fregs.sregs;
-        for (i = 0; i < 64; i++, dst++) {
-            if (i & 1) {
-                __put_user(env->fpr[i/2].l.lower, dst);
-            } else {
-                __put_user(env->fpr[i/2].l.upper, dst);
-            }
-        }
-    }
-    __put_user(env->fsr, &(mcp->mc_fpregs.mcfpu_fsr));
-    __put_user(env->gsr, &(mcp->mc_fpregs.mcfpu_gsr));
-    __put_user(env->fprs, &(mcp->mc_fpregs.mcfpu_fprs));
+    /*
+     * We don't write out the FPU state. This matches the kernel's
+     * implementation (which has the code for doing this but
+     * hidden behind an "if (fenab)" where fenab is always 0).
+     */
 
     if (err)
         goto do_sigsegv;
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
index b9369398f24b..277254732b93 100644
--- a/target/sparc/cpu.h
+++ b/target/sparc/cpu.h
@@ -156,7 +156,9 @@ enum {
 #define PS_IE    (1<<1)
 #define PS_AG    (1<<0) /* v9, zero on UA2007 */
 
-#define FPRS_FEF (1<<2)
+#define FPRS_DL (1 << 0)
+#define FPRS_DU (1 << 1)
+#define FPRS_FEF (1 << 2)
 
 #define HS_PRIV  (1<<2)
 #endif
-- 
2.29.2


