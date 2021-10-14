Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7501E42E458
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 00:41:20 +0200 (CEST)
Received: from localhost ([::1]:40734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb9Pb-0008W6-I1
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 18:41:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mb9JH-0001zE-LQ; Thu, 14 Oct 2021 18:34:47 -0400
Received: from [201.28.113.2] (port=23608 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mb9JF-0005Cp-0k; Thu, 14 Oct 2021 18:34:47 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 14 Oct 2021 19:34:37 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id AFF5D8014D6;
 Thu, 14 Oct 2021 19:34:36 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 1/4] linux-user/ppc: Fix XER access in save/restore_user_regs
Date: Thu, 14 Oct 2021 19:32:31 -0300
Message-Id: <20211014223234.127012-2-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211014223234.127012-1-matheus.ferst@eldorado.org.br>
References: <20211014223234.127012-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 14 Oct 2021 22:34:37.0204 (UTC)
 FILETIME=[AB571D40:01D7C14B]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 richard.henderson@linaro.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

We should use cpu_read_xer/cpu_write_xer to save/restore the complete
register since some of its bits are in other fields of CPUPPCState. A
test is added to prevent future regressions.

Fixes: da91a00f191f ("target-ppc: Split out SO, OV, CA fields from XER")
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 linux-user/ppc/signal.c                     |  9 +++--
 tests/tcg/ppc64/Makefile.target             |  2 +
 tests/tcg/ppc64le/Makefile.target           |  2 +
 tests/tcg/ppc64le/signal_save_restore_xer.c | 42 +++++++++++++++++++++
 4 files changed, 52 insertions(+), 3 deletions(-)
 create mode 100644 tests/tcg/ppc64le/signal_save_restore_xer.c

diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
index edfad28a37..4413a4a28f 100644
--- a/linux-user/ppc/signal.c
+++ b/linux-user/ppc/signal.c
@@ -244,7 +244,7 @@ static void save_user_regs(CPUPPCState *env, struct target_mcontext *frame)
     __put_user(env->nip, &frame->mc_gregs[TARGET_PT_NIP]);
     __put_user(env->ctr, &frame->mc_gregs[TARGET_PT_CTR]);
     __put_user(env->lr, &frame->mc_gregs[TARGET_PT_LNK]);
-    __put_user(env->xer, &frame->mc_gregs[TARGET_PT_XER]);
+    __put_user(cpu_read_xer(env), &frame->mc_gregs[TARGET_PT_XER]);
 
     for (i = 0; i < ARRAY_SIZE(env->crf); i++) {
         ccr |= env->crf[i] << (32 - ((i + 1) * 4));
@@ -319,6 +319,7 @@ static void restore_user_regs(CPUPPCState *env,
 {
     target_ulong save_r2 = 0;
     target_ulong msr;
+    target_ulong xer;
     target_ulong ccr;
 
     int i;
@@ -334,9 +335,11 @@ static void restore_user_regs(CPUPPCState *env,
     __get_user(env->nip, &frame->mc_gregs[TARGET_PT_NIP]);
     __get_user(env->ctr, &frame->mc_gregs[TARGET_PT_CTR]);
     __get_user(env->lr, &frame->mc_gregs[TARGET_PT_LNK]);
-    __get_user(env->xer, &frame->mc_gregs[TARGET_PT_XER]);
+
+    __get_user(xer, &frame->mc_gregs[TARGET_PT_XER]);
+    cpu_write_xer(env, xer);
+
     __get_user(ccr, &frame->mc_gregs[TARGET_PT_CCR]);
-
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
2.25.1


