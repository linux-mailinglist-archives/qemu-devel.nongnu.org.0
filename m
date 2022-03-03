Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD584CC3B9
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 18:29:21 +0100 (CET)
Received: from localhost ([::1]:60624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPpGS-0007sz-Cb
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 12:29:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nPpAC-0007Q3-Ko; Thu, 03 Mar 2022 12:22:54 -0500
Received: from [187.72.171.209] (port=35509 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nPpAB-0004O4-8G; Thu, 03 Mar 2022 12:22:52 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 3 Mar 2022 14:22:24 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id EC264800502;
 Thu,  3 Mar 2022 14:22:23 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 5/5] tests/tcg/ppc64le: Use Altivec register names in
 clobbler list
Date: Thu,  3 Mar 2022 14:20:41 -0300
Message-Id: <20220303172041.1915037-6-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303172041.1915037-1-matheus.ferst@eldorado.org.br>
References: <20220303172041.1915037-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 03 Mar 2022 17:22:24.0350 (UTC)
 FILETIME=[3F856FE0:01D82F23]
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

LLVM/Clang doesn't know the VSX registers when compiling with
-mabi=elfv1. Use only registers >= 32 and list them with their Altivec
name.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 tests/tcg/ppc64le/non_signalling_xscv.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/tcg/ppc64le/non_signalling_xscv.c b/tests/tcg/ppc64le/non_signalling_xscv.c
index 91e25cad46..836df71ef0 100644
--- a/tests/tcg/ppc64le/non_signalling_xscv.c
+++ b/tests/tcg/ppc64le/non_signalling_xscv.c
@@ -6,16 +6,16 @@
 #define TEST(INSN, B_HI, B_LO, T_HI, T_LO) \
     do {                                                                \
         uint64_t th, tl, bh = B_HI, bl = B_LO;                          \
-        asm("mtvsrd 0, %2\n\t"                                          \
-            "mtvsrd 1, %3\n\t"                                          \
-            "xxmrghd 0, 0, 1\n\t"                                       \
-            INSN " 0, 0\n\t"                                            \
-            "mfvsrd %0, 0\n\t"                                          \
-            "xxswapd 0, 0\n\t"                                          \
-            "mfvsrd %1, 0\n\t"                                          \
+        asm("mtvsrd 32, %2\n\t"                                         \
+            "mtvsrd 33, %3\n\t"                                         \
+            "xxmrghd 32, 32, 33\n\t"                                    \
+            INSN " 32, 32\n\t"                                          \
+            "mfvsrd %0, 32\n\t"                                         \
+            "xxswapd 32, 32\n\t"                                        \
+            "mfvsrd %1, 32\n\t"                                         \
             : "=r" (th), "=r" (tl)                                      \
             : "r" (bh), "r" (bl)                                        \
-            : "vs0", "vs1");                                            \
+            : "v0", "v1");                                              \
         printf(INSN "(0x%016" PRIx64 "%016" PRIx64 ") = 0x%016" PRIx64  \
                "%016" PRIx64 "\n", bh, bl, th, tl);                     \
         assert(th == T_HI && tl == T_LO);                               \
-- 
2.25.1


