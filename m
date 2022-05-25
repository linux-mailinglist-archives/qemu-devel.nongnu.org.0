Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A9C533ACA
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 12:44:36 +0200 (CEST)
Received: from localhost ([::1]:60762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntoVG-0008Ro-Is
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 06:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntoRy-0005lU-3X
 for qemu-devel@nongnu.org; Wed, 25 May 2022 06:41:10 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:37541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntoRw-0002FV-6h
 for qemu-devel@nongnu.org; Wed, 25 May 2022 06:41:09 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MvJjz-1nch4Q0N1d-00rEJp; Wed, 25
 May 2022 12:41:03 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 7/8] tests/tcg/s390x: Test unwinding from signal handlers
Date: Wed, 25 May 2022 12:40:56 +0200
Message-Id: <20220525104057.543354-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525104057.543354-1-laurent@vivier.eu>
References: <20220525104057.543354-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fRZA+tzyOT9d6/WxR5L01ODdOPS5x6KMhoxkChQlRDaoRkvVMk0
 1F8RqbfBnFs8WJZmi0PdOfX9NqHMSOf6zVntQHVrjdDIuAg3+CBfc0ZnOY2CwJDq5KNnxa9
 E1cOEDpqMtWXRIRBbB0js2+vK8vnKQjRQ1az6ueQA1ho8FN7LZV2ibWitTuBWsMx376Ez8i
 UVotYaQ0Je8oMC/TfeRwg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Z/ilKW8M4V8=:P79UPbmagJGxjGraoV8M1i
 ukxXlYS5WSxSG6mQB2jXH2zsxYXq7oIDtd1qNDHg3Is5kqPsfxaG69wN9le+hjSLLymFNcPcb
 iHLDsOa+33kQflLbiko8pmjWvzdg+yfyd0yFuPilTPxRwFITgDAY6aXEtvCXRaM8bxC0xG9dY
 ICHzxtp30YhsEsn38JYo4sq365mW00Hkv5s6z14OA7++lSXcEDQNaWjWNSCvZID8YY0BaZomh
 /GEFo815JMpu8hHina0+5ASSC1dItha7LQZnoKTsdaofi6+QrTbrRlUoJTkYSaEdpwqBN06mm
 eEvw3nvpAlIMEaqFGlH5bKEh4lwkhlXN8DIyJGplfFcYl1ubMkwQbNe/th6PxHtnii7xx3puv
 XtBi30HtdvYgidzHTjTAq0PnAjsKEAOp/5oVAKxao0Zu1uiNeCUdVhGsNbjsLvrAPER2E07Ub
 Tw93OpNu0SRROwGvcV9HmMq3QTry10XWRbI1LBT/OWvWKJzRMcFvyjfafwRcj/vGMLTc9i6xh
 m2llOZ3Vbe4ZVho9ui4IExN33qejMatiW9fW03bfVVVLa63hf0JcVcfABimwQl/b3dYw+rUHT
 bBxpBCKmEb/g5E4qQqy21x7migO3WJVNM2aIDN5GCnb1XjwC+VA8Q9IwuRROaX3XStb//CZkq
 buJp08nwLm6synRCN/dCTq4CnzK51vIDgPIdPfejA3nTcIayCYl2oMSAoYn1rR8yysTqLEieJ
 eCpL589A3wpqO8Z70dbcGX7HOFcTAzs5onaENA==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

Add a small test to prevent regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20220503225157.1696774-3-iii@linux.ibm.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tests/tcg/s390x/signals-s390x.c | 69 ++++++++++++++++++++++++++-------
 1 file changed, 55 insertions(+), 14 deletions(-)

diff --git a/tests/tcg/s390x/signals-s390x.c b/tests/tcg/s390x/signals-s390x.c
index dc2f8ee59ac7..48c3b6cdfdd3 100644
--- a/tests/tcg/s390x/signals-s390x.c
+++ b/tests/tcg/s390x/signals-s390x.c
@@ -1,4 +1,5 @@
 #include <assert.h>
+#include <execinfo.h>
 #include <signal.h>
 #include <string.h>
 #include <sys/mman.h>
@@ -11,22 +12,28 @@
  * inline asm is used instead.
  */
 
+#define DEFINE_ASM_FUNCTION(name, body) \
+    asm(".globl " #name "\n" \
+        #name ":\n" \
+        ".cfi_startproc\n" \
+        body "\n" \
+        "br %r14\n" \
+        ".cfi_endproc");
+
 void illegal_op(void);
-void after_illegal_op(void);
-asm(".globl\tillegal_op\n"
-    "illegal_op:\t.byte\t0x00,0x00\n"
-    "\t.globl\tafter_illegal_op\n"
-    "after_illegal_op:\tbr\t%r14");
+extern const char after_illegal_op;
+DEFINE_ASM_FUNCTION(illegal_op,
+    ".byte 0x00,0x00\n"
+    ".globl after_illegal_op\n"
+    "after_illegal_op:")
 
 void stg(void *dst, unsigned long src);
-asm(".globl\tstg\n"
-    "stg:\tstg\t%r3,0(%r2)\n"
-    "\tbr\t%r14");
+DEFINE_ASM_FUNCTION(stg, "stg %r3,0(%r2)")
 
 void mvc_8(void *dst, void *src);
-asm(".globl\tmvc_8\n"
-    "mvc_8:\tmvc\t0(8,%r2),0(%r3)\n"
-    "\tbr\t%r14");
+DEFINE_ASM_FUNCTION(mvc_8, "mvc 0(8,%r2),0(%r3)")
+
+extern const char return_from_main_1;
 
 static void safe_puts(const char *s)
 {
@@ -49,8 +56,9 @@ static struct {
 
 static void handle_signal(int sig, siginfo_t *info, void *ucontext)
 {
+    int err, i, n_frames;
+    void *frames[16];
     void *page;
-    int err;
 
     if (sig != expected.sig) {
         safe_puts("[  FAILED  ] wrong signal");
@@ -86,6 +94,17 @@ static void handle_signal(int sig, siginfo_t *info, void *ucontext)
     default:
         break;
     }
+
+    n_frames = backtrace(frames, sizeof(frames) / sizeof(frames[0]));
+    for (i = 0; i < n_frames; i++) {
+        if (frames[i] == &return_from_main_1) {
+            break;
+        }
+    }
+    if (i == n_frames) {
+        safe_puts("[  FAILED  ] backtrace() is broken");
+        _exit(1);
+    }
 }
 
 static void check_sigsegv(void *func, enum exception exception,
@@ -122,7 +141,7 @@ static void check_sigsegv(void *func, enum exception exception,
     assert(err == 0);
 }
 
-int main(void)
+int main_1(void)
 {
     struct sigaction act;
     int err;
@@ -138,7 +157,7 @@ int main(void)
     safe_puts("[ RUN      ] Operation exception");
     expected.sig = SIGILL;
     expected.addr = illegal_op;
-    expected.psw_addr = (unsigned long)after_illegal_op;
+    expected.psw_addr = (unsigned long)&after_illegal_op;
     expected.exception = exception_operation;
     illegal_op();
     safe_puts("[       OK ]");
@@ -163,3 +182,25 @@ int main(void)
 
     _exit(0);
 }
+
+/*
+ * Define main() in assembly in order to test that unwinding from signal
+ * handlers until main() works. This way we can define a specific point that
+ * the unwinder should reach. This is also better than defining main() in C
+ * and using inline assembly to call main_1(), since it's not easy to get all
+ * the clobbers right.
+ */
+
+DEFINE_ASM_FUNCTION(main,
+    "stmg %r14,%r15,112(%r15)\n"
+    ".cfi_offset 14,-48\n"
+    ".cfi_offset 15,-40\n"
+    "lay %r15,-160(%r15)\n"
+    ".cfi_def_cfa_offset 320\n"
+    "brasl %r14,main_1\n"
+    ".globl return_from_main_1\n"
+    "return_from_main_1:\n"
+    "lmg %r14,%r15,272(%r15)\n"
+    ".cfi_restore 15\n"
+    ".cfi_restore 14\n"
+    ".cfi_def_cfa_offset 160");
-- 
2.36.1


