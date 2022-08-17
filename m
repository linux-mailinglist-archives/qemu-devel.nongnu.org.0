Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8275974B4
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 19:00:57 +0200 (CEST)
Received: from localhost ([::1]:38632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOMPW-0003fl-4r
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 13:00:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oOMMZ-0000wf-4e; Wed, 17 Aug 2022 12:57:51 -0400
Received: from [200.168.210.66] (port=1414 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oOMMX-0006aP-Bj; Wed, 17 Aug 2022 12:57:50 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 17 Aug 2022 13:57:43 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id F135C800134;
 Wed, 17 Aug 2022 13:57:42 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, danielhb413@gmail.com,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
Subject: [PATCH 1/2] tests/tcg/ppc64le: Added an overflow with OE=1 test
Date: Wed, 17 Aug 2022 13:57:03 -0300
Message-Id: <20220817165704.165291-1-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 Aug 2022 16:57:43.0377 (UTC)
 FILETIME=[77C72410:01D8B25A]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

Added a test to see if the adjustment is being made correctly when an
overflow occurs and OE is set.

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
The prctl patch is not ready yet, so this patch does as Richard
Henderson suggested and check the fp register in the signal handler

This patch will fail without the overflow with OE set bugfix
Message-Id:<20220805141522.412864-3-lucas.araujo@eldorado.org.br>
---
 tests/tcg/ppc64/Makefile.target   |  1 +
 tests/tcg/ppc64le/Makefile.target |  1 +
 tests/tcg/ppc64le/oe_excp.c       | 54 +++++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+)
 create mode 100644 tests/tcg/ppc64le/oe_excp.c

diff --git a/tests/tcg/ppc64/Makefile.target b/tests/tcg/ppc64/Makefile.target
index 331fae628e..43958ad87b 100644
--- a/tests/tcg/ppc64/Makefile.target
+++ b/tests/tcg/ppc64/Makefile.target
@@ -29,5 +29,6 @@ run-plugin-sha512-vector-with-%: QEMU_OPTS+=-cpu POWER10
 
 PPC64_TESTS += signal_save_restore_xer
 PPC64_TESTS += xxspltw
+PPC64_TESTS += oe_excp
 
 TESTS += $(PPC64_TESTS)
diff --git a/tests/tcg/ppc64le/Makefile.target b/tests/tcg/ppc64le/Makefile.target
index 6ca3003f02..8d11ac731d 100644
--- a/tests/tcg/ppc64le/Makefile.target
+++ b/tests/tcg/ppc64le/Makefile.target
@@ -27,5 +27,6 @@ PPC64LE_TESTS += mtfsf
 PPC64LE_TESTS += mffsce
 PPC64LE_TESTS += signal_save_restore_xer
 PPC64LE_TESTS += xxspltw
+PPC64LE_TESTS += oe_excp
 
 TESTS += $(PPC64LE_TESTS)
diff --git a/tests/tcg/ppc64le/oe_excp.c b/tests/tcg/ppc64le/oe_excp.c
new file mode 100644
index 0000000000..cfc364f5ed
--- /dev/null
+++ b/tests/tcg/ppc64le/oe_excp.c
@@ -0,0 +1,54 @@
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/prctl.h>
+#include <signal.h>
+#include <stdint.h>
+
+#define FP_OE (1ull << 6)
+#define MTFSF(FLM, FRB) asm volatile ("mtfsf %0, %1" :: "i" (FLM), "f" (FRB))
+
+void sigfpe_handler(int sig, siginfo_t *si, void *ucontext)
+{
+    uint64_t t;
+    uint64_t ch = 0x5fcfffe4965a17e0ull;
+    asm (
+        "stfd 2, %0\n\t"
+        : "=m"(t)
+        :
+        : "memory", "fr2"
+    );
+    if (t == ch) {
+        exit(0);
+    }
+    fprintf(stderr, "expected result: %lx\n         result: %lx\n", ch, t);
+    exit(1);
+}
+
+int main()
+{
+    uint64_t fpscr;
+    uint64_t a = 0x7fdfffe816d77b00ull;
+    uint64_t b = 0x7fdfffFC7F7FFF00ull;
+
+    struct sigaction sa = {
+        .sa_sigaction = sigfpe_handler,
+        .sa_flags = SA_SIGINFO
+    };
+
+    prctl(PR_SET_FPEXC, PR_FP_EXC_PRECISE);
+    sigaction(SIGFPE, &sa, NULL);
+
+    fpscr = FP_OE;
+    MTFSF(0b11111111, fpscr);
+
+    asm (
+        "lfd 0, %0\n\t"
+        "lfd 1, %1\n\t"
+        "fmul 2, 0, 1\n\t"
+        :
+        : "m"(a), "m"(b)
+        : "memory", "fr0", "fr1", "fr2"
+    );
+
+    return -1;
+}
-- 
2.31.1


