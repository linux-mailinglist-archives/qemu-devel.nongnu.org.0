Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35377477443
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 15:17:49 +0100 (CET)
Received: from localhost ([::1]:52416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxrZr-0003ou-19
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 09:17:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mxrU3-0005ck-DP; Thu, 16 Dec 2021 09:11:47 -0500
Received: from [201.28.113.2] (port=9856 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mxrU1-0005cQ-Ex; Thu, 16 Dec 2021 09:11:47 -0500
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 16 Dec 2021 11:10:40 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 6EA1B800EBC;
 Thu, 16 Dec 2021 11:10:40 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH] tests/tcg/ppc64le: remove INT128 requirement to run
 non_signalling_xscv
Date: Thu, 16 Dec 2021 11:09:51 -0300
Message-Id: <20211216140951.1183987-1-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 16 Dec 2021 14:10:40.0842 (UTC)
 FILETIME=[B516AAA0:01D7F286]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The values can be passed with registers to the inline assembler and
moved to/from the VSR with mtvsrd/mfvsrd.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 tests/tcg/ppc64le/non_signalling_xscv.c | 27 +++++++++++++------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/tests/tcg/ppc64le/non_signalling_xscv.c b/tests/tcg/ppc64le/non_signalling_xscv.c
index 77f0703333..494e01864d 100644
--- a/tests/tcg/ppc64le/non_signalling_xscv.c
+++ b/tests/tcg/ppc64le/non_signalling_xscv.c
@@ -5,23 +5,24 @@
 
 #define TEST(INSN, B_HI, B_LO, T_HI, T_LO) \
     do {                                                                \
-        __uint128_t t, b = B_HI;                                        \
-        b <<= 64;                                                       \
-        b |= B_LO;                                                      \
-        asm(INSN " %x0, %x1\n\t"                                        \
-            : "=wa" (t)                                                 \
-            : "wa" (b));                                                \
+        uint64_t th, tl, bh = B_HI, bl = B_LO;                          \
+        asm("mtvsrd 0, %3\n\t"                                          \
+            "xxswapd 0, 0\n\t"                                          \
+            "mtvsrd 0, %2\n\t"                                          \
+            INSN " 0, 0\n\t"                                            \
+            "mfvsrd %0, 0\n\t"                                          \
+            "xxswapd 0, 0\n\t"                                          \
+            "mfvsrd %1, 0\n\t"                                          \
+            : "=r" (th), "=r" (tl)                                      \
+            : "r" (bh), "r" (bl)                                        \
+            : "vs0");                                                   \
         printf(INSN "(0x%016" PRIx64 "%016" PRIx64 ") = 0x%016" PRIx64  \
-               "%016" PRIx64 "\n", (uint64_t)(b >> 64), (uint64_t)b,    \
-               (uint64_t)(t >> 64), (uint64_t)t);                       \
-        assert((uint64_t)(t >> 64) == T_HI && (uint64_t)t == T_LO);     \
+               "%016" PRIx64 "\n", bh, bl, th, tl);                     \
+        assert(th == T_HI && tl == T_LO);                               \
     } while (0)
 
 int main(void)
 {
-#ifndef __SIZEOF_INT128__
-    puts("__uint128_t not available, skipping...\n");
-#else
     /* SNaN shouldn't be silenced */
     TEST("xscvspdpn", 0x7fbfffff00000000ULL, 0x0, 0x7ff7ffffe0000000ULL, 0x0);
     TEST("xscvdpspn", 0x7ff7ffffffffffffULL, 0x0, 0x7fbfffff7fbfffffULL, 0x0);
@@ -31,6 +32,6 @@ int main(void)
      * signifcand will return Infinity as the result.
      */
     TEST("xscvdpspn", 0x7ff000001fffffffULL, 0x0, 0x7f8000007f800000ULL, 0x0);
-#endif
+
     return 0;
 }
-- 
2.25.1


