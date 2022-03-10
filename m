Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 553A04D50AF
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 18:36:41 +0100 (CET)
Received: from localhost ([::1]:57228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSMiO-0000Al-B4
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 12:36:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nSMTO-0004JB-Th; Thu, 10 Mar 2022 12:21:10 -0500
Received: from [187.72.171.209] (port=37119 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nSMTJ-000458-FO; Thu, 10 Mar 2022 12:21:10 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 10 Mar 2022 14:21:00 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 84AF58002AF;
 Thu, 10 Mar 2022 14:21:00 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH] target/ppc: fix xxspltw for big endian hosts
Date: Thu, 10 Mar 2022 14:20:46 -0300
Message-Id: <20220310172047.61094-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Mar 2022 17:21:00.0904 (UTC)
 FILETIME=[36ACD680:01D834A3]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 clg@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Fix a typo in the host endianness macro and add a simple test to detect
regressions.

Fixes: 9bb0048ec6f8 ("target/ppc: convert xxspltw to vector operations")
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/translate/vsx-impl.c.inc |  2 +-
 tests/tcg/ppc64/Makefile.target     |  1 +
 tests/tcg/ppc64le/Makefile.target   |  1 +
 tests/tcg/ppc64le/xxspltw.c         | 46 +++++++++++++++++++++++++++++
 4 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/ppc64le/xxspltw.c

diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 48a97b2d7e..e67fbf2bb8 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1552,7 +1552,7 @@ static bool trans_XXSPLTW(DisasContext *ctx, arg_XX2_uim2 *a)
     tofs = vsr_full_offset(a->xt);
     bofs = vsr_full_offset(a->xb);
     bofs += a->uim << MO_32;
-#ifndef HOST_WORDS_BIG_ENDIAN
+#ifndef HOST_WORDS_BIGENDIAN
     bofs ^= 8 | 4;
 #endif
 
diff --git a/tests/tcg/ppc64/Makefile.target b/tests/tcg/ppc64/Makefile.target
index c9498053df..8197c288a7 100644
--- a/tests/tcg/ppc64/Makefile.target
+++ b/tests/tcg/ppc64/Makefile.target
@@ -27,5 +27,6 @@ run-sha512-vector: QEMU_OPTS+=-cpu POWER10
 run-plugin-sha512-vector-with-%: QEMU_OPTS+=-cpu POWER10
 
 PPC64_TESTS += signal_save_restore_xer
+PPC64_TESTS += xxspltw
 
 TESTS += $(PPC64_TESTS)
diff --git a/tests/tcg/ppc64le/Makefile.target b/tests/tcg/ppc64le/Makefile.target
index 12d85e946b..9624bb1e9c 100644
--- a/tests/tcg/ppc64le/Makefile.target
+++ b/tests/tcg/ppc64le/Makefile.target
@@ -25,5 +25,6 @@ run-plugin-sha512-vector-with-%: QEMU_OPTS+=-cpu POWER10
 
 PPC64LE_TESTS += mtfsf
 PPC64LE_TESTS += signal_save_restore_xer
+PPC64LE_TESTS += xxspltw
 
 TESTS += $(PPC64LE_TESTS)
diff --git a/tests/tcg/ppc64le/xxspltw.c b/tests/tcg/ppc64le/xxspltw.c
new file mode 100644
index 0000000000..def7321f14
--- /dev/null
+++ b/tests/tcg/ppc64le/xxspltw.c
@@ -0,0 +1,46 @@
+#include <stdio.h>
+#include <stdint.h>
+#include <inttypes.h>
+#include <assert.h>
+
+#define WORD_A 0xAAAAAAAAUL
+#define WORD_B 0xBBBBBBBBUL
+#define WORD_C 0xCCCCCCCCUL
+#define WORD_D 0xDDDDDDDDUL
+
+#define DWORD_HI (WORD_A << 32 | WORD_B)
+#define DWORD_LO (WORD_C << 32 | WORD_D)
+
+#define TEST(HI, LO, UIM, RES) \
+    do {                                                        \
+        union {                                                 \
+            uint64_t u;                                         \
+            double f;                                           \
+        } h = { .u = HI }, l = { .u = LO };                     \
+        /*                                                      \
+         * Use a pair of FPRs to load the VSR avoiding insns    \
+         * newer than xxswapd.                                  \
+         */                                                     \
+        asm("xxmrghd 32, %0, %1\n\t"                            \
+            "xxspltw 32, 32, %2\n\t"                            \
+            "xxmrghd %0, 32, %0\n\t"                            \
+            "xxswapd 32, 32\n\t"                                \
+            "xxmrghd %1, 32, %1\n\t"                            \
+            : "+f" (h.f), "+f" (l.f)                            \
+            : "i" (UIM)                                         \
+            : "v0");                                            \
+        printf("xxspltw(0x%016" PRIx64 "%016" PRIx64 ", %d) ="  \
+               " %016" PRIx64 "%016" PRIx64 "\n", HI, LO, UIM,  \
+               h.u, l.u);                                       \
+        assert(h.u == (RES));                                   \
+        assert(l.u == (RES));                                   \
+    } while (0)
+
+int main(void)
+{
+    TEST(DWORD_HI, DWORD_LO, 0, WORD_A << 32 | WORD_A);
+    TEST(DWORD_HI, DWORD_LO, 1, WORD_B << 32 | WORD_B);
+    TEST(DWORD_HI, DWORD_LO, 2, WORD_C << 32 | WORD_C);
+    TEST(DWORD_HI, DWORD_LO, 3, WORD_D << 32 | WORD_D);
+    return 0;
+}
-- 
2.25.1


