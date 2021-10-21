Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8C9435A0F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 06:38:40 +0200 (CEST)
Received: from localhost ([::1]:51468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdPqh-00060D-Fj
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 00:38:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZT-0005Vm-PA; Thu, 21 Oct 2021 00:20:51 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:53133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZR-0008Kb-1T; Thu, 21 Oct 2021 00:20:51 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HZZ5p48Fxz4xdH; Thu, 21 Oct 2021 15:20:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1634790030;
 bh=iIr09KACYz3A5cYSsENgDyqZyi+aWU8TspC77qgO3NI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T8TjFMawNBNQWm3iLXuYPbItkKwUirb2sF0JrK6FzJ1pj1SPId62+PJrxKc7UegmL
 pH7DGvGP2wYpsMUR7Z1C9LLLhGxgJpNvsQmJuk49OQ9LF1k6An0l45avB2Qf7Xdskq
 w4IJeSPsQgnGlCVUnwoPIiC6gkOsg1kjdQTVWPzM=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 09/25] linux-user/ppc: Fix XER access in save/restore_user_regs
Date: Thu, 21 Oct 2021 15:20:11 +1100
Message-Id: <20211021042027.345405-10-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211021042027.345405-1-david@gibson.dropbear.id.au>
References: <20211021042027.345405-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

We should use cpu_read_xer/cpu_write_xer to save/restore the complete
register since some of its bits are in other fields of CPUPPCState. A
test is added to prevent future regressions.

Fixes: da91a00f191f ("target-ppc: Split out SO, OV, CA fields from XER")
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20211014223234.127012-2-matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 linux-user/ppc/signal.c                     |  9 +++--
 tests/tcg/ppc64/Makefile.target             |  2 +
 tests/tcg/ppc64le/Makefile.target           |  2 +
 tests/tcg/ppc64le/signal_save_restore_xer.c | 42 +++++++++++++++++++++
 4 files changed, 52 insertions(+), 3 deletions(-)
 create mode 100644 tests/tcg/ppc64le/signal_save_restore_xer.c

diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
index c37744c8fc..90a0369632 100644
--- a/linux-user/ppc/signal.c
+++ b/linux-user/ppc/signal.c
@@ -242,7 +242,7 @@ static void save_user_regs(CPUPPCState *env, struct target_mcontext *frame)
     __put_user(env->nip, &frame->mc_gregs[TARGET_PT_NIP]);
     __put_user(env->ctr, &frame->mc_gregs[TARGET_PT_CTR]);
     __put_user(env->lr, &frame->mc_gregs[TARGET_PT_LNK]);
-    __put_user(env->xer, &frame->mc_gregs[TARGET_PT_XER]);
+    __put_user(cpu_read_xer(env), &frame->mc_gregs[TARGET_PT_XER]);
 
     for (i = 0; i < ARRAY_SIZE(env->crf); i++) {
         ccr |= env->crf[i] << (32 - ((i + 1) * 4));
@@ -315,6 +315,7 @@ static void restore_user_regs(CPUPPCState *env,
 {
     target_ulong save_r2 = 0;
     target_ulong msr;
+    target_ulong xer;
     target_ulong ccr;
 
     int i;
@@ -330,9 +331,11 @@ static void restore_user_regs(CPUPPCState *env,
     __get_user(env->nip, &frame->mc_gregs[TARGET_PT_NIP]);
     __get_user(env->ctr, &frame->mc_gregs[TARGET_PT_CTR]);
     __get_user(env->lr, &frame->mc_gregs[TARGET_PT_LNK]);
-    __get_user(env->xer, &frame->mc_gregs[TARGET_PT_XER]);
-    __get_user(ccr, &frame->mc_gregs[TARGET_PT_CCR]);
 
+    __get_user(xer, &frame->mc_gregs[TARGET_PT_XER]);
+    cpu_write_xer(env, xer);
+
+    __get_user(ccr, &frame->mc_gregs[TARGET_PT_CCR]);
     for (i = 0; i < ARRAY_SIZE(env->crf); i++) {
         env->crf[i] = (ccr >> (32 - ((i + 1) * 4))) & 0xf;
     }
diff --git a/tests/tcg/ppc64/Makefile.target b/tests/tcg/ppc64/Makefile.target
index a6a4ddaeca..6ab7934fdf 100644
--- a/tests/tcg/ppc64/Makefile.target
+++ b/tests/tcg/ppc64/Makefile.target
@@ -23,4 +23,6 @@ run-plugin-byte_reverse-with-%:
 	$(call skip-test, "RUN of byte_reverse ($*)", "not built")
 endif
 
+PPC64_TESTS += signal_save_restore_xer
+
 TESTS += $(PPC64_TESTS)
diff --git a/tests/tcg/ppc64le/Makefile.target b/tests/tcg/ppc64le/Makefile.target
index c0c14ffbad..5e65b1590d 100644
--- a/tests/tcg/ppc64le/Makefile.target
+++ b/tests/tcg/ppc64le/Makefile.target
@@ -22,4 +22,6 @@ run-plugin-byte_reverse-with-%:
 	$(call skip-test, "RUN of byte_reverse ($*)", "not built")
 endif
 
+PPC64LE_TESTS += signal_save_restore_xer
+
 TESTS += $(PPC64LE_TESTS)
diff --git a/tests/tcg/ppc64le/signal_save_restore_xer.c b/tests/tcg/ppc64le/signal_save_restore_xer.c
new file mode 100644
index 0000000000..e4f8a07dd7
--- /dev/null
+++ b/tests/tcg/ppc64le/signal_save_restore_xer.c
@@ -0,0 +1,42 @@
+#include <assert.h>
+#include <stdint.h>
+#include <signal.h>
+#include <sys/user.h>
+
+#define XER_SO   (1 << 31)
+#define XER_OV   (1 << 30)
+#define XER_CA   (1 << 29)
+#define XER_OV32 (1 << 19)
+#define XER_CA32 (1 << 18)
+
+uint64_t saved;
+
+void sigill_handler(int sig, siginfo_t *si, void *ucontext)
+{
+    ucontext_t *uc = ucontext;
+    uc->uc_mcontext.regs->nip += 4;
+    saved = uc->uc_mcontext.regs->xer;
+    uc->uc_mcontext.regs->xer |= XER_OV | XER_OV32;
+}
+
+int main(void)
+{
+    uint64_t initial = XER_CA | XER_CA32, restored;
+    struct sigaction sa = {
+        .sa_sigaction = sigill_handler,
+        .sa_flags = SA_SIGINFO
+    };
+
+    sigaction(SIGILL, &sa, NULL);
+
+    asm("mtspr 1, %1\n\t"
+        ".long 0x0\n\t"
+        "mfspr %0, 1\n\t"
+        : "=r" (restored)
+        : "r" (initial));
+
+    assert(saved == initial);
+    assert(restored == (XER_OV | XER_OV32 | XER_CA | XER_CA32));
+
+    return 0;
+}
-- 
2.31.1


