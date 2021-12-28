Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 895614808F8
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 13:07:39 +0100 (CET)
Received: from localhost ([::1]:39344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2BGT-0005v2-RJ
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 07:07:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1n2BCg-0003mt-Pv; Tue, 28 Dec 2021 07:03:42 -0500
Received: from [201.28.113.2] (port=54011 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1n2BCe-0004Ql-Rs; Tue, 28 Dec 2021 07:03:42 -0500
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 28 Dec 2021 09:03:34 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id A33CA800670;
 Tue, 28 Dec 2021 09:03:33 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2] target/ppc: do not silence snan in xscvspdpn
Date: Tue, 28 Dec 2021 09:03:10 -0300
Message-Id: <20211228120310.1957990-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 28 Dec 2021 12:03:34.0070 (UTC)
 FILETIME=[F0229D60:01D7FBE2]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 f4bug@amsat.org, clg@kaod.org, alex.bennee@linaro.org, aurelien@aurel32.net,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

The non-signalling versions of VSX scalar convert to shorter/longer
precision insns doesn't silence SNaNs in the hardware. To better match
this behavior, use the non-arithmatic conversion of helper_todouble
instead of float32_to_float64. A test is added to prevent future
regressions.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/fpu_helper.c                 |  5 +---
 tests/tcg/ppc64/Makefile.target         |  4 +--
 tests/tcg/ppc64le/Makefile.target       |  4 +--
 tests/tcg/ppc64le/non_signalling_xscv.c | 37 +++++++++++++++++++++++++
 4 files changed, 42 insertions(+), 8 deletions(-)
 create mode 100644 tests/tcg/ppc64le/non_signalling_xscv.c

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 700c79156b..e5c29b53b8 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2816,10 +2816,7 @@ uint64_t helper_xscvdpspn(CPUPPCState *env, uint64_t xb)
 
 uint64_t helper_xscvspdpn(CPUPPCState *env, uint64_t xb)
 {
-    float_status tstat = env->fp_status;
-    set_float_exception_flags(0, &tstat);
-
-    return float32_to_float64(xb >> 32, &tstat);
+    return helper_todouble(xb >> 32);
 }
 
 /*
diff --git a/tests/tcg/ppc64/Makefile.target b/tests/tcg/ppc64/Makefile.target
index 8f4c7ac4ed..0368007028 100644
--- a/tests/tcg/ppc64/Makefile.target
+++ b/tests/tcg/ppc64/Makefile.target
@@ -6,9 +6,9 @@ VPATH += $(SRC_PATH)/tests/tcg/ppc64
 VPATH += $(SRC_PATH)/tests/tcg/ppc64le
 
 ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER8_VECTOR),)
-PPC64_TESTS=bcdsub
+PPC64_TESTS=bcdsub non_signalling_xscv
 endif
-bcdsub: CFLAGS += -mpower8-vector
+$(PPC64_TESTS): CFLAGS += -mpower8-vector
 
 PPC64_TESTS += byte_reverse
 PPC64_TESTS += mtfsf
diff --git a/tests/tcg/ppc64le/Makefile.target b/tests/tcg/ppc64le/Makefile.target
index e031f65adc..480ff0898d 100644
--- a/tests/tcg/ppc64le/Makefile.target
+++ b/tests/tcg/ppc64le/Makefile.target
@@ -5,9 +5,9 @@
 VPATH += $(SRC_PATH)/tests/tcg/ppc64le
 
 ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER8_VECTOR),)
-PPC64LE_TESTS=bcdsub
+PPC64LE_TESTS=bcdsub non_signalling_xscv
 endif
-bcdsub: CFLAGS += -mpower8-vector
+$(PPC64LE_TESTS): CFLAGS += -mpower8-vector
 
 ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER10),)
 PPC64LE_TESTS += byte_reverse
diff --git a/tests/tcg/ppc64le/non_signalling_xscv.c b/tests/tcg/ppc64le/non_signalling_xscv.c
new file mode 100644
index 0000000000..91e25cad46
--- /dev/null
+++ b/tests/tcg/ppc64le/non_signalling_xscv.c
@@ -0,0 +1,37 @@
+#include <stdio.h>
+#include <stdint.h>
+#include <inttypes.h>
+#include <assert.h>
+
+#define TEST(INSN, B_HI, B_LO, T_HI, T_LO) \
+    do {                                                                \
+        uint64_t th, tl, bh = B_HI, bl = B_LO;                          \
+        asm("mtvsrd 0, %2\n\t"                                          \
+            "mtvsrd 1, %3\n\t"                                          \
+            "xxmrghd 0, 0, 1\n\t"                                       \
+            INSN " 0, 0\n\t"                                            \
+            "mfvsrd %0, 0\n\t"                                          \
+            "xxswapd 0, 0\n\t"                                          \
+            "mfvsrd %1, 0\n\t"                                          \
+            : "=r" (th), "=r" (tl)                                      \
+            : "r" (bh), "r" (bl)                                        \
+            : "vs0", "vs1");                                            \
+        printf(INSN "(0x%016" PRIx64 "%016" PRIx64 ") = 0x%016" PRIx64  \
+               "%016" PRIx64 "\n", bh, bl, th, tl);                     \
+        assert(th == T_HI && tl == T_LO);                               \
+    } while (0)
+
+int main(void)
+{
+    /* SNaN shouldn't be silenced */
+    TEST("xscvspdpn", 0x7fbfffff00000000ULL, 0x0, 0x7ff7ffffe0000000ULL, 0x0);
+    TEST("xscvdpspn", 0x7ff7ffffffffffffULL, 0x0, 0x7fbfffff7fbfffffULL, 0x0);
+
+    /*
+     * SNaN inputs having no significant bits in the upper 23 bits of the
+     * signifcand will return Infinity as the result.
+     */
+    TEST("xscvdpspn", 0x7ff000001fffffffULL, 0x0, 0x7f8000007f800000ULL, 0x0);
+
+    return 0;
+}
-- 
2.25.1


