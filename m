Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B98414CC3AB
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 18:26:21 +0100 (CET)
Received: from localhost ([::1]:53744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPpDY-0002uv-Px
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 12:26:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nPpAA-0007KF-9Z; Thu, 03 Mar 2022 12:22:50 -0500
Received: from [187.72.171.209] (port=35509 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nPpA8-0004O4-Kg; Thu, 03 Mar 2022 12:22:50 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 3 Mar 2022 14:22:24 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 8E1D28001CD;
 Thu,  3 Mar 2022 14:22:23 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [RFC PATCH v2 4/5] tests/tcg/ppc64le: emit bcdsub with .long when
 needed
Date: Thu,  3 Mar 2022 14:20:40 -0300
Message-Id: <20220303172041.1915037-5-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303172041.1915037-1-matheus.ferst@eldorado.org.br>
References: <20220303172041.1915037-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 03 Mar 2022 17:22:24.0038 (UTC)
 FILETIME=[3F55D460:01D82F23]
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
Cc: thuth@redhat.com, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 philippe.mathieu.daude@gmail.com, clg@kaod.org, mrezanin@redhat.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Based on GCC docs[1], we use the '-mpower8-vector' flag at config-time
to detect the toolchain support to the bcdsub instruction. LLVM/Clang
supports this flag since version 3.6[2], but the instruction and related
builtins were only added in LLVM 14[3]. In the absence of other means to
detect this support at config-time, we resort to __has_builtin to
identify the presence of __builtin_bcdsub at compile-time. If the
builtin is not available, the instruction is emitted with a ".long".

[1] https://gcc.gnu.org/onlinedocs/gcc-8.3.0/gcc/PowerPC-AltiVec_002fVSX-Built-in-Functions.html
[2] https://github.com/llvm/llvm-project/commit/59eb767e11d4ffefb5f55409524e5c8416b2b0db
[3] https://github.com/llvm/llvm-project/commit/c933c2eb334660c131f4afc9d194fafb0cec0423

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 tests/tcg/ppc64le/bcdsub.c | 55 +++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 25 deletions(-)

diff --git a/tests/tcg/ppc64le/bcdsub.c b/tests/tcg/ppc64le/bcdsub.c
index c9ca5357cb..445d50f07d 100644
--- a/tests/tcg/ppc64le/bcdsub.c
+++ b/tests/tcg/ppc64le/bcdsub.c
@@ -9,32 +9,37 @@
 #define CRF_SO  (1 << 0)
 #define UNDEF   0
 
-#define BCDSUB(AH, AL, BH, BL, PS)                          \
-    asm ("mtvsrd 32, %3\n\t"                                \
-         "mtvsrd 33, %4\n\t"                                \
-         "xxmrghd 32, 32, 33\n\t"                           \
-         "mtvsrd 33, %5\n\t"                                \
-         "mtvsrd 34, %6\n\t"                                \
-         "xxmrghd 33, 33, 34\n\t"                           \
-         "bcdsub. 0, 0, 1, %7\n\t"                          \
-         "mfocrf %0, 0b10\n\t"                              \
-         "mfvsrd %1, 32\n\t"                                \
-         "xxswapd 32, 32\n\t"                               \
-         "mfvsrd %2, 32\n\t"                                \
-         : "=r" (cr), "=r" (th), "=r" (tl)                  \
-         : "r" (AH), "r" (AL), "r" (BH), "r" (BL), "i" (PS) \
-         : "v0", "v1", "v2");
+#if defined(__has_builtin) && !__has_builtin(__builtin_bcdsub)
+#define BCDSUB(T, A, B, PS) \
+    ".long 4 << 26 | (" #T ") << 21 | (" #A ") << 16 | (" #B ") << 11"  \
+    " | 1 << 10 | (" #PS ") << 9 | 65\n\t"
+#else
+#define BCDSUB(T, A, B, PS) "bcdsub. " #T ", " #A ", " #B ", " #PS "\n\t"
+#endif
 
-#define TEST(AH, AL, BH, BL, PS, TH, TL, CR6)   \
-    do {                                        \
-        int cr = 0;                             \
-        uint64_t th, tl;                        \
-        BCDSUB(AH, AL, BH, BL, PS);             \
-        if (TH || TL) {                         \
-            assert(tl == TL);                   \
-            assert(th == TH);                   \
-        }                                       \
-        assert((cr >> 4) == CR6);               \
+#define TEST(AH, AL, BH, BL, PS, TH, TL, CR6)                   \
+    do {                                                        \
+        int cr = 0;                                             \
+        uint64_t th, tl;                                        \
+        asm ("mtvsrd 32, %3\n\t"                                \
+             "mtvsrd 33, %4\n\t"                                \
+             "xxmrghd 32, 32, 33\n\t"                           \
+             "mtvsrd 33, %5\n\t"                                \
+             "mtvsrd 34, %6\n\t"                                \
+             "xxmrghd 33, 33, 34\n\t"                           \
+             BCDSUB(0, 0, 1, PS)                                \
+             "mfocrf %0, 0b10\n\t"                              \
+             "mfvsrd %1, 32\n\t"                                \
+             "xxswapd 32, 32\n\t"                               \
+             "mfvsrd %2, 32\n\t"                                \
+             : "=r" (cr), "=r" (th), "=r" (tl)                  \
+             : "r" (AH), "r" (AL), "r" (BH), "r" (BL)           \
+             : "v0", "v1", "v2");                               \
+        if (TH || TL) {                                         \
+            assert(tl == TL);                                   \
+            assert(th == TH);                                   \
+        }                                                       \
+        assert((cr >> 4) == CR6);                               \
     } while (0)
 
 
-- 
2.25.1


