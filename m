Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFAE588C5F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 14:47:53 +0200 (CEST)
Received: from localhost ([::1]:37552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJDmx-0002h7-RZ
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 08:47:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oJDiy-0005mS-Jp; Wed, 03 Aug 2022 08:43:44 -0400
Received: from [200.168.210.66] (port=36049 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oJDiw-0004rj-Ff; Wed, 03 Aug 2022 08:43:44 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 3 Aug 2022 09:43:38 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 95E7E8001D1;
 Wed,  3 Aug 2022 09:43:37 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org, danielhb413@gmail.com,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH] tests/tcg/ppc64le: Added OE/UE enabled exception test
Date: Wed,  3 Aug 2022 09:43:24 -0300
Message-Id: <20220803124324.23593-1-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220803122217.20847-1-lucas.araujo@eldorado.org.br>
References: <20220803122217.20847-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 03 Aug 2022 12:43:38.0093 (UTC)
 FILETIME=[A718E9D0:01D8A736]
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

DO NOT MERGE

This patch adds a test to check if the add/sub of the intermediate
result when an overflow or underflow exception with the corresponding
enabling bit being set (i.e. OE/UE), but linux-user currently can't
disable MSR.FE0 and MSR.FE1 so it will always result in a trapping
exception, to avoid that the test should be run in a VM or use Matheus'
WIP patch in 
https://github.com/PPC64/qemu/tree/alqotel-ferst-prctl-patch

The test results were based on a Power9 machine.

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 tests/tcg/ppc64le/oe_ue_excp.c | 105 +++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 tests/tcg/ppc64le/oe_ue_excp.c

diff --git a/tests/tcg/ppc64le/oe_ue_excp.c b/tests/tcg/ppc64le/oe_ue_excp.c
new file mode 100644
index 0000000000..384219a366
--- /dev/null
+++ b/tests/tcg/ppc64le/oe_ue_excp.c
@@ -0,0 +1,105 @@
+#include <stdio.h>
+#include <float.h>
+#include <sys/prctl.h>
+
+#define FP_OE (1ull << 6)
+#define FP_UE (1ull << 5)
+
+typedef union {
+    double d;
+    long long ll;
+} ll_fp;
+
+double asm_fmul (double a, double b)
+{
+    double t;
+    asm (
+        "lfd 0, %1\n\t"
+        "lfd 1, %2\n\t"
+        "fmul 2, 0, 1\n\t"
+        "stfd 2, %0\n\t"
+        :"=m"(t)
+        :"m"(a),"m"(b)
+        );
+    return t;
+}
+
+double asm_fdiv (double a, double b)
+{
+    double t;
+    asm (
+        "lfd 0, %1\n\t"
+        "lfd 1, %2\n\t"
+        "fdiv 2, 0, 1\n\t"
+        "stfd 2, %0\n\t"
+        :"=m"(t)
+        :"m"(a),"m"(b)
+        );
+    return t;
+}
+
+int main ()
+{
+    int i, ok = 1;
+    ll_fp fpscr, t;
+
+    prctl(PR_SET_FPEXC, PR_FP_EXC_DISABLED);
+
+    fpscr.ll = FP_UE | FP_OE;
+    __builtin_mtfsf (0b11111111, fpscr.d);
+    fpscr.d = __builtin_mffs ();
+    printf("fpscr = %016llx\n", fpscr.ll);
+
+    ll_fp ch[] =
+                {
+                    { .ll = 0x1b64f1c1b0000000ull },
+                    { .ll = 0x1b64f1c1b0000001ull },
+                    { .ll = 0x1b90de3410000000ull },
+                    { .ll = 0x1b90de3410000000ull },
+                    { .ll = 0x5fcfffe4965a17e0ull },
+                    { .ll = 0x5fcfffe4965a17e0ull },
+                    { .ll = 0x2003ffffffffffffull },
+                    { .ll = 0x2003ffffffffffffull }
+                };
+
+    ll_fp a[] =
+                {
+                    { .ll = 0x00005ca8ull },
+                    { .ll = 0x0000badcull },
+                    { .ll = 0x7fdfffe816d77b00ull },
+                    { .d  = DBL_MAX }
+                };
+
+    ll_fp b[] =
+                {
+                    { .ll = 0x00001cefull },
+                    { .ll = 0x00005c70ull },
+                    { .ll = 0x7fdfffFC7F7FFF00ull },
+                    { .d  = 2.5 }
+                };
+
+    for (i = 0; i < 4; i++) {
+        t.d = asm_fmul(a[i].d, b[i].d);
+        if (t.ll != ch[2 * i].ll) {
+            ok = 0;
+            printf ("Mismatch on fmul n %d:\n\tresult:   %016llx\n\t"
+                    "expected: %016llx\n", i, t.ll, ch[2 * i].ll);
+        } else {
+            printf ("Ok on fmul n %d\n", i);
+        }
+        t.d = asm_fdiv(a[i].d, 1.0/b[i].d);
+        if (t.ll != ch[2 * i + 1].ll) {
+            ok = 0;
+            printf ("Mismatch on fdiv n %d:\n\tresult:   %016llx\n\t"
+                    "expected: %016llx\n", i, t.ll, ch[2 * i + 1].ll);
+        } else {
+            printf ("Ok on fdiv n %d\n", i);
+        }
+    }
+    fpscr.d = __builtin_mffs ();
+    printf("fpscr = %016llx\n", fpscr.ll);
+    if(!ok) {
+        return -1;
+    }
+    return 0;
+}
-- 
2.31.1


