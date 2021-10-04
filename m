Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2984206D2
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 09:52:11 +0200 (CEST)
Received: from localhost ([::1]:48484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXIle-0002x5-US
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 03:52:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeK-00045H-Or
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:36 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:52663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXIeI-0004oc-VO
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:44:36 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MtPzy-1mnC6Q0Zoc-00upgM; Mon, 04
 Oct 2021 09:44:24 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 01/26] linux-user: Add infrastructure for a signal trampoline
 page
Date: Mon,  4 Oct 2021 09:43:56 +0200
Message-Id: <20211004074421.3141222-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004074421.3141222-1-laurent@vivier.eu>
References: <20211004074421.3141222-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:sbMmJtEOpzyb3l+1hVe+4VKoHMWfR4gr/+BEHgNtQw6BC98+dVM
 lFkCDnQAOgKv2lx2IY2LsQb5ZAHWF7HeITi5cvfmiFD6lMHZ6dpwZAMtM6e96w0Yn7GVGVt
 ynozdgOIAuecb9wQa+EzLkyn7462tg3cRfJfRift7p/KCCPEdsJRtpMlk7+HtHzoH1PHbKS
 Q2d0MsOxlyVbUqmvYMYjA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xOWXO5YmaL4=:8n9JHufyYISypNDlKgbI5B
 xu88iX0ebeFjKmoYPbYhK4xfc3QOboyKz8Cjw9iEyn5pJhwhj6dIuTShu6l9fwWpisstZn6o2
 svTPcXy/0sVMd2KjOYqLoByA8E0vxSoB5WmBK5h6iklCdr9wNJpOMdIIMLLwsIrTzjzyJqSmn
 305lT1zIkD87hr0rx69yY3ASZoQNkctXFehvZfYTBhl5rKE+eAGXHDjcgTGvX/cvoZUHcc0Cf
 vDX+Ho0kWynbO2y8tEWiLWocppIyIwisE/ykrx5bkg/+x/ZoA8vYiQH1l2kOWzTplkUtT1CbK
 7Ui+BFawSatgaq+4k3VAAqriBaMbtoaOT3D1gC8IMxYZcjStNBoPtafkGTiKHjog5nthrMVBI
 b/Iyzf9eas/e/vf0X40MnVQLXQiQLURVtTkr/RnXTmJgL9CQr73TIGW6zPahXysPnqZEx4aYs
 pfOaDJfcgtRPTSzuSOsL066A3242Pr7kWK75bDe55rudymNV7uVHGGGglk28GgHO+dkbYjW/z
 f/tPhq6a0DALTcse0CRRxVucuq4VadzHDJByBegqVp/3r4q7tnIzx7kvMzn+cs9HPbRaEQCry
 wyJijpNvaNJq0Lp7S76eJKm689p+8fEtV9CctnXHowgSUIgzKymFXnQMwrYy5Xj/ro6eqQ4dV
 fqUhZ7hk+Ms/a8W46FxlfPUhr2nfBiHjneZtU+RqQ1Fyk28Y6r4AKJDb1pwmdzW4abrx+h4Xk
 s8gqAsdkkPWsRYXzLIijFI6cTnxgghYHEqcasg==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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
Cc: Max Filippov <jcmvbkbc@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Allocate a page to hold the signal trampoline(s).
Invoke a guest-specific hook to fill in the contents
of the page before marking it read-execute again.

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210929130553.121567-2-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/elfload.c       | 18 ++++++++++++++++++
 linux-user/signal-common.h |  6 ++++++
 linux-user/signal.c        |  3 +++
 3 files changed, 27 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 5f9e2141ad1e..459a26ef1d93 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -7,6 +7,7 @@
 
 #include "qemu.h"
 #include "user-internals.h"
+#include "signal-common.h"
 #include "loader.h"
 #include "user-mmap.h"
 #include "disas/disas.h"
@@ -17,6 +18,7 @@
 #include "qemu/units.h"
 #include "qemu/selfmap.h"
 #include "qapi/error.h"
+#include "target_signal.h"
 
 #ifdef _ARCH_PPC64
 #undef ARCH_DLINFO
@@ -28,6 +30,10 @@
 #undef ELF_ARCH
 #endif
 
+#ifndef TARGET_ARCH_HAS_SIGTRAMP_PAGE
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 0
+#endif
+
 #define ELF_OSABI   ELFOSABI_SYSV
 
 /* from personality.h */
@@ -3249,6 +3255,18 @@ int load_elf_binary(struct linux_binprm *bprm, struct image_info *info)
 #endif
     }
 
+    /*
+     * TODO: load a vdso, which would also contain the signal trampolines.
+     * Otherwise, allocate a private page to hold them.
+     */
+    if (TARGET_ARCH_HAS_SIGTRAMP_PAGE) {
+        abi_ulong tramp_page = target_mmap(0, TARGET_PAGE_SIZE,
+                                           PROT_READ | PROT_WRITE,
+                                           MAP_PRIVATE | MAP_ANON, -1, 0);
+        setup_sigtramp(tramp_page);
+        target_mprotect(tramp_page, TARGET_PAGE_SIZE, PROT_READ | PROT_EXEC);
+    }
+
     bprm->p = create_elf_tables(bprm->p, bprm->argc, bprm->envc, &elf_ex,
                                 info, (elf_interpreter ? &interp_info : NULL));
     info->start_stack = bprm->p;
diff --git a/linux-user/signal-common.h b/linux-user/signal-common.h
index 79511becb4e7..7457f8025c47 100644
--- a/linux-user/signal-common.h
+++ b/linux-user/signal-common.h
@@ -20,6 +20,12 @@
 #ifndef SIGNAL_COMMON_H
 #define SIGNAL_COMMON_H
 
+/* Fallback addresses into sigtramp page. */
+extern abi_ulong default_sigreturn;
+extern abi_ulong default_rt_sigreturn;
+
+void setup_sigtramp(abi_ulong tramp_page);
+
 int on_sig_stack(unsigned long sp);
 int sas_ss_flags(unsigned long sp);
 abi_ulong target_sigsp(abi_ulong sp, struct target_sigaction *ka);
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 203821645509..14d8fdfde152 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -35,6 +35,9 @@ static struct target_sigaction sigact_table[TARGET_NSIG];
 static void host_signal_handler(int host_signum, siginfo_t *info,
                                 void *puc);
 
+/* Fallback addresses into sigtramp page. */
+abi_ulong default_sigreturn;
+abi_ulong default_rt_sigreturn;
 
 /*
  * System includes define _NSIG as SIGRTMAX + 1,
-- 
2.31.1


