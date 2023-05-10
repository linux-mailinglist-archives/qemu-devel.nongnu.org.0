Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8409A6FE7F4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 01:09:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwsuN-0000HV-JO; Wed, 10 May 2023 19:07:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pwsuL-0000HA-GP; Wed, 10 May 2023 19:07:41 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1pwsuJ-00016R-13; Wed, 10 May 2023 19:07:41 -0400
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34AN5kS7006738; Wed, 10 May 2023 23:07:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=5a9/5GGys/D/GmbH4fLOYBkxVgAn5WlOhvL4OtY5De8=;
 b=UJuITEB981A90xSx2Yjge10zKORJiGDOeYZcQYb9hl9ckm2j/QXwrxh6bYneobCwGyDp
 mN1T8geqD6y3xES7YyP+iJ9ebq5UO3gavvjEj6p6gJa7Crnw6DjXTfy1oh9PP9502bDK
 Kj6C4S8Fsrcdg/ziIbmJCexXBc4nJ9V7aZBPFfgsOOOXIpQdytNwPS8DPAvDBN6yMokN
 oaBy1x6qw9adOCdK/B3CIolzfFZHYGsVZ8c5+RJjejHgSJ82hf7E8QX/u/7QKmRi/FBn
 3zVbsc+6YkBfzswLUQ3YuEMQWgvdgOJtIJiPlGa/Rm+5pcmLiv4ofU+Tx7YsH8r6PNP6 MQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qgkeaj5d8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 23:07:33 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34AN6Q8U011811;
 Wed, 10 May 2023 23:07:32 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qgkeaj5aq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 23:07:32 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34ALL7pG025984;
 Wed, 10 May 2023 23:02:29 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3qf7nh1ajm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 23:02:29 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 34AN2RpF22348356
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 May 2023 23:02:27 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 552E820043;
 Wed, 10 May 2023 23:02:27 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CAEFE20040;
 Wed, 10 May 2023 23:02:26 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.51.237])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 10 May 2023 23:02:26 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 2/2] tests/tcg/s390x: Test single-stepping SVC
Date: Thu, 11 May 2023 01:02:13 +0200
Message-Id: <20230510230213.330134-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230510230213.330134-1-iii@linux.ibm.com>
References: <20230510230213.330134-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8kl8YSFUd3s_MtlFC-91zBZmY3Nbqwcz
X-Proofpoint-ORIG-GUID: 6NCtBSaozbZvsDie6NCc-X7yploO942M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 mlxscore=0 suspectscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=899 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305100191
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add a small test to prevent regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 tests/tcg/s390x/Makefile.target     | 11 ++++-
 tests/tcg/s390x/gdbstub/test-svc.py | 64 +++++++++++++++++++++++++++++
 tests/tcg/s390x/hello-s390x-asm.S   | 20 +++++++++
 3 files changed, 94 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/s390x/gdbstub/test-svc.py
 create mode 100644 tests/tcg/s390x/hello-s390x-asm.S

diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 0031868b136..bd435e4dd63 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -74,7 +74,16 @@ run-gdbstub-signals-s390x: signals-s390x
 		--bin $< --test $(S390X_SRC)/gdbstub/test-signals-s390x.py, \
 	mixing signals and debugging)
 
-EXTRA_RUNS += run-gdbstub-signals-s390x
+hello-s390x-asm: CFLAGS+=-nostdlib
+
+run-gdbstub-svc: hello-s390x-asm
+	$(call run-test, $@, $(GDB_SCRIPT) \
+		--gdb $(HAVE_GDB_BIN) \
+		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
+		--bin $< --test $(S390X_SRC)/gdbstub/test-svc.py, \
+	single-stepping svc)
+
+EXTRA_RUNS += run-gdbstub-signals-s390x run-gdbstub-svc
 endif
 
 # MVX versions of sha512
diff --git a/tests/tcg/s390x/gdbstub/test-svc.py b/tests/tcg/s390x/gdbstub/test-svc.py
new file mode 100644
index 00000000000..7851ca72846
--- /dev/null
+++ b/tests/tcg/s390x/gdbstub/test-svc.py
@@ -0,0 +1,64 @@
+"""Test single-stepping SVC.
+
+This runs as a sourced script (via -x, via run-test.py)."""
+from __future__ import print_function
+import gdb
+import sys
+
+
+n_failures = 0
+
+
+def report(cond, msg):
+    """Report success/fail of a test"""
+    if cond:
+        print("PASS: {}".format(msg))
+    else:
+        print("FAIL: {}".format(msg))
+        global n_failures
+        n_failures += 1
+
+
+def run_test():
+    """Run through the tests one by one"""
+    report("lghi\t" in gdb.execute("x/i $pc", False, True), "insn #1")
+    gdb.execute("si")
+    report("larl\t" in gdb.execute("x/i $pc", False, True), "insn #2")
+    gdb.execute("si")
+    report("lghi\t" in gdb.execute("x/i $pc", False, True), "insn #3")
+    gdb.execute("si")
+    report("svc\t" in gdb.execute("x/i $pc", False, True), "insn #4")
+    gdb.execute("si")
+    report("xgr\t" in gdb.execute("x/i $pc", False, True), "insn #5")
+    gdb.execute("si")
+    report("svc\t" in gdb.execute("x/i $pc", False, True), "insn #6")
+    gdb.execute("si")
+
+
+def main():
+    """Prepare the environment and run through the tests"""
+    try:
+        inferior = gdb.selected_inferior()
+        print("ATTACHED: {}".format(inferior.architecture().name()))
+    except (gdb.error, AttributeError):
+        print("SKIPPING (not connected)")
+        exit(0)
+
+    if gdb.parse_and_eval('$pc') == 0:
+        print("SKIP: PC not set")
+        exit(0)
+
+    try:
+        # These are not very useful in scripts
+        gdb.execute("set pagination off")
+        gdb.execute("set confirm off")
+
+        # Run the actual tests
+        run_test()
+    except gdb.error:
+        report(False, "GDB Exception: {}".format(sys.exc_info()[0]))
+    print("All tests complete: %d failures" % n_failures)
+    exit(n_failures)
+
+
+main()
diff --git a/tests/tcg/s390x/hello-s390x-asm.S b/tests/tcg/s390x/hello-s390x-asm.S
new file mode 100644
index 00000000000..2e9faa16047
--- /dev/null
+++ b/tests/tcg/s390x/hello-s390x-asm.S
@@ -0,0 +1,20 @@
+/*
+ * Hello, World! in assembly.
+ */
+
+.globl _start
+_start:
+
+/* puts("Hello, World!"); */
+lghi %r2,1
+larl %r3,foo
+lghi %r4,foo_end-foo
+svc 4
+
+/* exit(0); */
+xgr %r2,%r2
+svc 1
+
+.align 2
+foo: .asciz "Hello, World!\n"
+foo_end:
-- 
2.40.1


