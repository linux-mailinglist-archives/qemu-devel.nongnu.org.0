Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E93546C65
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 20:33:51 +0200 (CEST)
Received: from localhost ([::1]:44318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzjSA-00028C-I2
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 14:33:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nzjJo-000122-Ao; Fri, 10 Jun 2022 14:25:16 -0400
Received: from [187.72.171.209] (port=48290 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nzjJm-0003eJ-LB; Fri, 10 Jun 2022 14:25:11 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 10 Jun 2022 15:23:43 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id CA152801D82;
 Fri, 10 Jun 2022 15:23:42 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br
Subject: [PATCH RESEND v2 07/11] tests/tcg/ppc64: Add mffsce test
Date: Fri, 10 Jun 2022 15:23:06 -0300
Message-Id: <20220610182310.68715-8-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610182310.68715-1-victor.colombo@eldorado.org.br>
References: <20220610182310.68715-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Jun 2022 18:23:43.0025 (UTC)
 FILETIME=[3713F210:01D87CF7]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
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

Add mffsce test to check both the return value and the new fpscr
stored in the cpu.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 tests/tcg/ppc64/Makefile.target   |  1 +
 tests/tcg/ppc64le/Makefile.target |  1 +
 tests/tcg/ppc64le/mffsce.c        | 37 +++++++++++++++++++++++++++++++
 3 files changed, 39 insertions(+)
 create mode 100644 tests/tcg/ppc64le/mffsce.c

diff --git a/tests/tcg/ppc64/Makefile.target b/tests/tcg/ppc64/Makefile.target
index babd209573..331fae628e 100644
--- a/tests/tcg/ppc64/Makefile.target
+++ b/tests/tcg/ppc64/Makefile.target
@@ -11,6 +11,7 @@ endif
 $(PPC64_TESTS): CFLAGS += -mpower8-vector
 
 PPC64_TESTS += mtfsf
+PPC64_TESTS += mffsce
 
 ifneq ($(CROSS_CC_HAS_POWER10),)
 PPC64_TESTS += byte_reverse sha512-vector
diff --git a/tests/tcg/ppc64le/Makefile.target b/tests/tcg/ppc64le/Makefile.target
index 5b0eb5e870..6ca3003f02 100644
--- a/tests/tcg/ppc64le/Makefile.target
+++ b/tests/tcg/ppc64le/Makefile.target
@@ -24,6 +24,7 @@ run-sha512-vector: QEMU_OPTS+=-cpu POWER10
 run-plugin-sha512-vector-with-%: QEMU_OPTS+=-cpu POWER10
 
 PPC64LE_TESTS += mtfsf
+PPC64LE_TESTS += mffsce
 PPC64LE_TESTS += signal_save_restore_xer
 PPC64LE_TESTS += xxspltw
 
diff --git a/tests/tcg/ppc64le/mffsce.c b/tests/tcg/ppc64le/mffsce.c
new file mode 100644
index 0000000000..20d882cb45
--- /dev/null
+++ b/tests/tcg/ppc64le/mffsce.c
@@ -0,0 +1,37 @@
+#include <stdlib.h>
+#include <stdint.h>
+#include <assert.h>
+
+#define MTFSF(FLM, FRB) asm volatile ("mtfsf %0, %1" :: "i" (FLM), "f" (FRB))
+#define MFFS(FRT) asm("mffs %0" : "=f" (FRT))
+#define MFFSCE(FRT) asm("mffsce %0" : "=f" (FRT))
+
+#define PPC_BIT_NR(nr) (63 - (nr))
+
+#define FP_VE  (1ull << PPC_BIT_NR(56))
+#define FP_UE  (1ull << PPC_BIT_NR(58))
+#define FP_ZE  (1ull << PPC_BIT_NR(59))
+#define FP_XE  (1ull << PPC_BIT_NR(60))
+#define FP_NI  (1ull << PPC_BIT_NR(61))
+#define FP_RN1 (1ull << PPC_BIT_NR(63))
+
+int main(void)
+{
+    uint64_t frt, fpscr;
+    uint64_t test_value = FP_VE | FP_UE | FP_ZE |
+                          FP_XE | FP_NI | FP_RN1;
+    MTFSF(0b11111111, test_value); /* set test value to cpu fpscr */
+    MFFSCE(frt);
+    MFFS(fpscr); /* read the value that mffsce stored to cpu fpscr */
+
+    /* the returned value should be as the cpu fpscr was before */
+    assert((frt & 0xff) == test_value);
+
+    /*
+     * the cpu fpscr last 3 bits should be unchanged
+     * and enable bits should be unset
+     */
+    assert((fpscr & 0xff) == (test_value & 0x7));
+
+    return 0;
+}
-- 
2.25.1


