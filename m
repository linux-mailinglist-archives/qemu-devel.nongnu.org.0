Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFA051922C
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 01:11:32 +0200 (CEST)
Received: from localhost ([::1]:55760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm1g3-00047O-GF
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 19:11:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nm1NO-0002bK-J5; Tue, 03 May 2022 18:52:14 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:20678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nm1NM-000238-LY; Tue, 03 May 2022 18:52:14 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 243MkVdC027507;
 Tue, 3 May 2022 22:52:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=X84MFcKrmZgkaMJ1giWHCT23mzYkrPSIG+pLqW2Cfrc=;
 b=n8uPYHROldr8z11VhPGlslglfGQA8r/gGxprD3RzPSnCmkEJRaUwyHTAK6SmNsfgA/xg
 b2G/htUZCovkwoSR1W7IWXnxgb6uzJKvF9+UrqgXX82C9+VoNBYm4wE8N8BS40b3aArd
 V2XINrGjyBwjrGRwJXZEymphAC6d0EYwla2RkxuMMvwf/wjIbIBDtTW35Snd9SxGiAGA
 4cUjkukYC1FuiVLhAIZpIe6j5z+/SdOYGW0VlZFlZcsY1HviSNa8m++Y5rsy5NuFicFF
 d5xMhh4lMcNFU3i+omimEPOsYd+kBmMfEAeHfhGUu9v3SS48aEME2fv1ZhaWgUfJx//4 4g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fud048f59-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 May 2022 22:52:09 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 243Mq9Cx022041;
 Tue, 3 May 2022 22:52:09 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fud048f4j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 May 2022 22:52:09 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 243MmJxi010314;
 Tue, 3 May 2022 22:52:06 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma02fra.de.ibm.com with ESMTP id 3frvr8ut88-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 May 2022 22:52:06 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 243Mcir853150086
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 May 2022 22:38:44 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C457A405B;
 Tue,  3 May 2022 22:52:03 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D385AA4054;
 Tue,  3 May 2022 22:52:02 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.50.79])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  3 May 2022 22:52:02 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 2/2] tests/tcg/s390x: Test unwinding from signal handlers
Date: Wed,  4 May 2022 00:51:57 +0200
Message-Id: <20220503225157.1696774-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503225157.1696774-1-iii@linux.ibm.com>
References: <20220503225157.1696774-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: s3sGEsFwoa7iM6w6DvmWaFybHBlwItJZ
X-Proofpoint-GUID: 2fyxJPmNPDjjl9ZpQJv5zt0vdzxY3z-k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-03_09,2022-05-02_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011
 bulkscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205030136
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Add a small test to prevent regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/s390x/signals-s390x.c | 69 ++++++++++++++++++++++++++-------
 1 file changed, 55 insertions(+), 14 deletions(-)

diff --git a/tests/tcg/s390x/signals-s390x.c b/tests/tcg/s390x/signals-s390x.c
index dc2f8ee59a..48c3b6cdfd 100644
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
2.35.1


