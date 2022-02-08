Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 897FF4AE2A1
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 21:39:28 +0100 (CET)
Received: from localhost ([::1]:33536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHXGp-0001pC-9z
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 15:39:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nHX9p-0006xN-1a; Tue, 08 Feb 2022 15:32:13 -0500
Received: from [187.72.171.209] (port=13564 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nHX9j-0001fq-MT; Tue, 08 Feb 2022 15:32:12 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 8 Feb 2022 17:31:57 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 3E6A8801D1B;
 Tue,  8 Feb 2022 17:31:57 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [RFC PATCH 1/3] tests/tcg/ppc64le: use inline asm instead of
 __builtin_mtfsf
Date: Tue,  8 Feb 2022 17:31:43 -0300
Message-Id: <20220208203145.3844662-2-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208203145.3844662-1-matheus.ferst@eldorado.org.br>
References: <20220208203145.3844662-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 08 Feb 2022 20:31:57.0618 (UTC)
 FILETIME=[EB042920:01D81D2A]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, danielhb413@gmail.com, groug@kaod.org, clg@kaod.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

LLVM/Clang does not support __builtin_mtfsf.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 tests/tcg/ppc64le/mtfsf.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/tests/tcg/ppc64le/mtfsf.c b/tests/tcg/ppc64le/mtfsf.c
index b3d31f3637..bed5b1afa4 100644
--- a/tests/tcg/ppc64le/mtfsf.c
+++ b/tests/tcg/ppc64le/mtfsf.c
@@ -1,8 +1,12 @@
 #include <stdlib.h>
+#include <stdint.h>
 #include <assert.h>
 #include <signal.h>
 #include <sys/prctl.h>
 
+#define MTFSF(FLM, FRB) asm volatile ("mtfsf %0, %1" :: "i" (FLM), "f" (FRB))
+#define MFFS(FRT) asm("mffs %0" : "=f" (FRT))
+
 #define FPSCR_VE     7  /* Floating-point invalid operation exception enable */
 #define FPSCR_VXSOFT 10 /* Floating-point invalid operation exception (soft) */
 #define FPSCR_FI     17 /* Floating-point fraction inexact                   */
@@ -21,10 +25,7 @@ void sigfpe_handler(int sig, siginfo_t *si, void *ucontext)
 
 int main(void)
 {
-    union {
-        double d;
-        long long ll;
-    } fpscr;
+    uint64_t fpscr;
 
     struct sigaction sa = {
         .sa_sigaction = sigfpe_handler,
@@ -40,10 +41,9 @@ int main(void)
     prctl(PR_SET_FPEXC, PR_FP_EXC_PRECISE);
 
     /* First test if the FI bit is being set correctly */
-    fpscr.ll = FP_FI;
-    __builtin_mtfsf(0b11111111, fpscr.d);
-    fpscr.d = __builtin_mffs();
-    assert((fpscr.ll & FP_FI) != 0);
+    MTFSF(0b11111111, FP_FI);
+    MFFS(fpscr);
+    assert((fpscr & FP_FI) != 0);
 
     /* Then test if the deferred exception is being called correctly */
     sigaction(SIGFPE, &sa, NULL);
@@ -54,8 +54,7 @@ int main(void)
      * But if a different exception is chosen si_code check should
      * change accordingly.
      */
-    fpscr.ll = FP_VE | FP_VXSOFT;
-    __builtin_mtfsf(0b11111111, fpscr.d);
+    MTFSF(0b11111111, FP_VE | FP_VXSOFT);
 
     return 1;
 }
-- 
2.25.1


