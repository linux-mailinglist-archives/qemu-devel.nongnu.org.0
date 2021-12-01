Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F04D4465356
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 17:49:24 +0100 (CET)
Received: from localhost ([::1]:41080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msSnK-0007nB-P7
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 11:49:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1msSdo-00004z-NN; Wed, 01 Dec 2021 11:39:33 -0500
Received: from [201.28.113.2] (port=20732 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1msSdm-0001L4-LF; Wed, 01 Dec 2021 11:39:32 -0500
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 1 Dec 2021 13:39:23 -0300
Received: from eldorado.org.br (unknown [10.10.71.29])
 by power9a (Postfix) with ESMTP id 5FC45800CFF;
 Wed,  1 Dec 2021 13:39:23 -0300 (-03)
From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 2/3] test/tcg/ppc64le: test mtfsf
Date: Wed,  1 Dec 2021 13:38:07 -0300
Message-Id: <20211201163808.440385-3-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211201163808.440385-1-lucas.araujo@eldorado.org.br>
References: <20211201163808.440385-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 01 Dec 2021 16:39:23.0535 (UTC)
 FILETIME=[FF3B51F0:01D7E6D1]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: richard.henderson@linaro.org, danielhb413@gmail.com,
 mark.cave-ayland@ilande.co.uk,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 pc@us.ibm.com, david@gibson.dropbear.id.au, matheus.ferst@eldorado.org.br,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added tests for the mtfsf to check if FI bit of FPSCR is being set
and if exception calls are being made correctly.

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 tests/tcg/ppc64/Makefile.target   |  1 +
 tests/tcg/ppc64le/Makefile.target |  1 +
 tests/tcg/ppc64le/mtfsf.c         | 61 +++++++++++++++++++++++++++++++
 3 files changed, 63 insertions(+)
 create mode 100644 tests/tcg/ppc64le/mtfsf.c

diff --git a/tests/tcg/ppc64/Makefile.target b/tests/tcg/ppc64/Makefile.target
index 6ab7934fdf..8f4c7ac4ed 100644
--- a/tests/tcg/ppc64/Makefile.target
+++ b/tests/tcg/ppc64/Makefile.target
@@ -11,6 +11,7 @@ endif
 bcdsub: CFLAGS += -mpower8-vector
 
 PPC64_TESTS += byte_reverse
+PPC64_TESTS += mtfsf
 ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER10),)
 run-byte_reverse: QEMU_OPTS+=-cpu POWER10
 run-plugin-byte_reverse-with-%: QEMU_OPTS+=-cpu POWER10
diff --git a/tests/tcg/ppc64le/Makefile.target b/tests/tcg/ppc64le/Makefile.target
index ba2fde5ff1..e031f65adc 100644
--- a/tests/tcg/ppc64le/Makefile.target
+++ b/tests/tcg/ppc64le/Makefile.target
@@ -16,6 +16,7 @@ byte_reverse: CFLAGS += -mcpu=power10
 run-byte_reverse: QEMU_OPTS+=-cpu POWER10
 run-plugin-byte_reverse-with-%: QEMU_OPTS+=-cpu POWER10
 
+PPC64LE_TESTS += mtfsf
 PPC64LE_TESTS += signal_save_restore_xer
 
 TESTS += $(PPC64LE_TESTS)
diff --git a/tests/tcg/ppc64le/mtfsf.c b/tests/tcg/ppc64le/mtfsf.c
new file mode 100644
index 0000000000..b3d31f3637
--- /dev/null
+++ b/tests/tcg/ppc64le/mtfsf.c
@@ -0,0 +1,61 @@
+#include <stdlib.h>
+#include <assert.h>
+#include <signal.h>
+#include <sys/prctl.h>
+
+#define FPSCR_VE     7  /* Floating-point invalid operation exception enable */
+#define FPSCR_VXSOFT 10 /* Floating-point invalid operation exception (soft) */
+#define FPSCR_FI     17 /* Floating-point fraction inexact                   */
+
+#define FP_VE           (1ull << FPSCR_VE)
+#define FP_VXSOFT       (1ull << FPSCR_VXSOFT)
+#define FP_FI           (1ull << FPSCR_FI)
+
+void sigfpe_handler(int sig, siginfo_t *si, void *ucontext)
+{
+    if (si->si_code == FPE_FLTINV) {
+        exit(0);
+    }
+    exit(1);
+}
+
+int main(void)
+{
+    union {
+        double d;
+        long long ll;
+    } fpscr;
+
+    struct sigaction sa = {
+        .sa_sigaction = sigfpe_handler,
+        .sa_flags = SA_SIGINFO
+    };
+
+    /*
+     * Enable the MSR bits F0 and F1 to enable exceptions.
+     * This shouldn't be needed in linux-user as these bits are enabled by
+     * default, but this allows to execute either in a VM or a real machine
+     * to compare the behaviors.
+     */
+    prctl(PR_SET_FPEXC, PR_FP_EXC_PRECISE);
+
+    /* First test if the FI bit is being set correctly */
+    fpscr.ll = FP_FI;
+    __builtin_mtfsf(0b11111111, fpscr.d);
+    fpscr.d = __builtin_mffs();
+    assert((fpscr.ll & FP_FI) != 0);
+
+    /* Then test if the deferred exception is being called correctly */
+    sigaction(SIGFPE, &sa, NULL);
+
+    /*
+     * Although the VXSOFT exception has been chosen, based on test in a Power9
+     * any combination of exception bit + its enabling bit should work.
+     * But if a different exception is chosen si_code check should
+     * change accordingly.
+     */
+    fpscr.ll = FP_VE | FP_VXSOFT;
+    __builtin_mtfsf(0b11111111, fpscr.d);
+
+    return 1;
+}
-- 
2.31.1


