Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF493DF5FC
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 21:49:40 +0200 (CEST)
Received: from localhost ([::1]:50228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mB0Pz-00078E-6T
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 15:49:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1mB0P4-0006Ob-Pi; Tue, 03 Aug 2021 15:48:42 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:36426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1mB0P2-0003tP-He; Tue, 03 Aug 2021 15:48:42 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 173JX7na021073; Tue, 3 Aug 2021 15:48:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=hNqHACXj3Q8hW5GEhJ7rjFHcmlZw8jumj6P7yaGOMCE=;
 b=Fn/vSdjcS+Pk0fczxIumHk+bu2vaZ8J1Pbzukh4sMUzriTnctRm4plIomiOPeqWigXoS
 ZNMvdypPr+NflRGLDHFXriR4rIVESaaTeXGPe06y8THWq/GttvltaYqm6Q9zuxXcqnPC
 jow+Dwi3OzUnvwcevZOSyUlijhy1+IQFUhVlUwTS6H53UCLQP4oX/04/tpEkGDXFhj00
 jwCkBP8l3+eGkxmrt5DrYJ1+OuTPCroGV3eRtLHQd0oWSKEQpNzs16QPiMNn7V9Iabcr
 0Virvqu0KUtzXdeTsbHsLcao7xhnWmRGV82WpV4VKbbbOwwjbxETE/rcJXQPD4WqaJKY cw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a6ffkfu27-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Aug 2021 15:48:37 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 173JakdH046737;
 Tue, 3 Aug 2021 15:48:36 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a6ffkfu17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Aug 2021 15:48:35 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 173JRqRH014656;
 Tue, 3 Aug 2021 19:48:32 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04fra.de.ibm.com with ESMTP id 3a4x59728x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Aug 2021 19:48:32 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 173JmRBT55837002
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Aug 2021 19:48:27 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38A5742089;
 Tue,  3 Aug 2021 19:48:27 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A5D224204B;
 Tue,  3 Aug 2021 19:48:26 +0000 (GMT)
Received: from vm.lan (unknown [9.145.77.113])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  3 Aug 2021 19:48:26 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v7] tests/tcg/s390x: Test SIGILL and SIGSEGV handling
Date: Tue,  3 Aug 2021 21:48:25 +0200
Message-Id: <20210803194825.149084-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JiqKnraPSBDjit_Irtpn5O7YAKrs4dab
X-Proofpoint-GUID: fCf-Ba9JXL-gYwwAvVganNIO3iYPaNGH
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-03_05:2021-08-03,
 2021-08-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 mlxlogscore=999 phishscore=0 adultscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108030124
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "jonathan . albrecht" <jonathan.albrecht@linux.vnet.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Verify that s390x-specific uc_mcontext.psw.addr is reported correctly
and that signal handling interacts properly with debugging.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---

v6: https://lists.nongnu.org/archive/html/qemu-devel/2021-07/msg00873.html
v6 -> v7: Rebased.

 tests/tcg/s390x/Makefile.target               |  16 +-
 tests/tcg/s390x/gdbstub/test-signals-s390x.py |  76 ++++++++
 tests/tcg/s390x/signals-s390x.c               | 165 ++++++++++++++++++
 3 files changed, 256 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/s390x/gdbstub/test-signals-s390x.py
 create mode 100644 tests/tcg/s390x/signals-s390x.c

diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 5d3de1b27a..5d984294f6 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -1,4 +1,5 @@
-VPATH+=$(SRC_PATH)/tests/tcg/s390x
+S390X_SRC=$(SRC_PATH)/tests/tcg/s390x
+VPATH+=$(S390X_SRC)
 CFLAGS+=-march=zEC12 -m64
 TESTS+=hello-s390x
 TESTS+=csst
@@ -8,4 +9,17 @@ TESTS+=exrl-trtr
 TESTS+=pack
 TESTS+=mvo
 TESTS+=mvc
+TESTS+=signals-s390x
 
+ifneq ($(HAVE_GDB_BIN),)
+GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
+
+run-gdbstub-signals-s390x: signals-s390x
+	$(call run-test, $@, $(GDB_SCRIPT) \
+		--gdb $(HAVE_GDB_BIN) \
+		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
+		--bin $< --test $(S390X_SRC)/gdbstub/test-signals-s390x.py, \
+	"mixing signals and debugging on s390x")
+
+EXTRA_RUNS += run-gdbstub-signals-s390x
+endif
diff --git a/tests/tcg/s390x/gdbstub/test-signals-s390x.py b/tests/tcg/s390x/gdbstub/test-signals-s390x.py
new file mode 100644
index 0000000000..80a284b475
--- /dev/null
+++ b/tests/tcg/s390x/gdbstub/test-signals-s390x.py
@@ -0,0 +1,76 @@
+from __future__ import print_function
+
+#
+# Test that signals and debugging mix well together on s390x.
+#
+# This is launched via tests/guest-debug/run-test.py
+#
+
+import gdb
+import sys
+
+failcount = 0
+
+
+def report(cond, msg):
+    """Report success/fail of test"""
+    if cond:
+        print("PASS: %s" % (msg))
+    else:
+        print("FAIL: %s" % (msg))
+        global failcount
+        failcount += 1
+
+
+def run_test():
+    """Run through the tests one by one"""
+    illegal_op = gdb.Breakpoint("illegal_op")
+    stg = gdb.Breakpoint("stg")
+    mvc_8 = gdb.Breakpoint("mvc_8")
+
+    # Expect the following events:
+    # 1x illegal_op breakpoint
+    # 2x stg breakpoint, segv, breakpoint
+    # 2x mvc_8 breakpoint, segv, breakpoint
+    for _ in range(14):
+        gdb.execute("c")
+    report(illegal_op.hit_count == 1, "illegal_op.hit_count == 1")
+    report(stg.hit_count == 4, "stg.hit_count == 4")
+    report(mvc_8.hit_count == 4, "mvc_8.hit_count == 4")
+
+    # The test must succeed.
+    gdb.Breakpoint("_exit")
+    gdb.execute("c")
+    status = int(gdb.parse_and_eval("$r2"))
+    report(status == 0, "status == 0");
+
+
+#
+# This runs as the script it sourced (via -x, via run-test.py)
+#
+try:
+    inferior = gdb.selected_inferior()
+    arch = inferior.architecture()
+    print("ATTACHED: %s" % arch.name())
+except (gdb.error, AttributeError):
+    print("SKIPPING (not connected)", file=sys.stderr)
+    exit(0)
+
+if gdb.parse_and_eval("$pc") == 0:
+    print("SKIP: PC not set")
+    exit(0)
+
+try:
+    # These are not very useful in scripts
+    gdb.execute("set pagination off")
+    gdb.execute("set confirm off")
+
+    # Run the actual tests
+    run_test()
+except (gdb.error):
+    print("GDB Exception: %s" % (sys.exc_info()[0]))
+    failcount += 1
+    pass
+
+print("All tests complete: %d failures" % failcount)
+exit(failcount)
diff --git a/tests/tcg/s390x/signals-s390x.c b/tests/tcg/s390x/signals-s390x.c
new file mode 100644
index 0000000000..dc2f8ee59a
--- /dev/null
+++ b/tests/tcg/s390x/signals-s390x.c
@@ -0,0 +1,165 @@
+#include <assert.h>
+#include <signal.h>
+#include <string.h>
+#include <sys/mman.h>
+#include <ucontext.h>
+#include <unistd.h>
+
+/*
+ * Various instructions that generate SIGILL and SIGSEGV. They could have been
+ * defined in a separate .s file, but this would complicate the build, so the
+ * inline asm is used instead.
+ */
+
+void illegal_op(void);
+void after_illegal_op(void);
+asm(".globl\tillegal_op\n"
+    "illegal_op:\t.byte\t0x00,0x00\n"
+    "\t.globl\tafter_illegal_op\n"
+    "after_illegal_op:\tbr\t%r14");
+
+void stg(void *dst, unsigned long src);
+asm(".globl\tstg\n"
+    "stg:\tstg\t%r3,0(%r2)\n"
+    "\tbr\t%r14");
+
+void mvc_8(void *dst, void *src);
+asm(".globl\tmvc_8\n"
+    "mvc_8:\tmvc\t0(8,%r2),0(%r3)\n"
+    "\tbr\t%r14");
+
+static void safe_puts(const char *s)
+{
+    write(0, s, strlen(s));
+    write(0, "\n", 1);
+}
+
+enum exception {
+    exception_operation,
+    exception_translation,
+    exception_protection,
+};
+
+static struct {
+    int sig;
+    void *addr;
+    unsigned long psw_addr;
+    enum exception exception;
+} expected;
+
+static void handle_signal(int sig, siginfo_t *info, void *ucontext)
+{
+    void *page;
+    int err;
+
+    if (sig != expected.sig) {
+        safe_puts("[  FAILED  ] wrong signal");
+        _exit(1);
+    }
+
+    if (info->si_addr != expected.addr) {
+        safe_puts("[  FAILED  ] wrong si_addr");
+        _exit(1);
+    }
+
+    if (((ucontext_t *)ucontext)->uc_mcontext.psw.addr != expected.psw_addr) {
+        safe_puts("[  FAILED  ] wrong psw.addr");
+        _exit(1);
+    }
+
+    switch (expected.exception) {
+    case exception_translation:
+        page = mmap(expected.addr, 4096, PROT_READ | PROT_WRITE,
+                    MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED, -1, 0);
+        if (page != expected.addr) {
+            safe_puts("[  FAILED  ] mmap() failed");
+            _exit(1);
+        }
+        break;
+    case exception_protection:
+        err = mprotect(expected.addr, 4096, PROT_READ | PROT_WRITE);
+        if (err != 0) {
+            safe_puts("[  FAILED  ] mprotect() failed");
+            _exit(1);
+        }
+        break;
+    default:
+        break;
+    }
+}
+
+static void check_sigsegv(void *func, enum exception exception,
+                          unsigned long val)
+{
+    int prot;
+    unsigned long *page;
+    unsigned long *addr;
+    int err;
+
+    prot = exception == exception_translation ? PROT_NONE : PROT_READ;
+    page = mmap(NULL, 4096, prot, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+    assert(page != MAP_FAILED);
+    if (exception == exception_translation) {
+        /* Hopefully nothing will be mapped at this address. */
+        err = munmap(page, 4096);
+        assert(err == 0);
+    }
+    addr = page + (val & 0x1ff);
+
+    expected.sig = SIGSEGV;
+    expected.addr = page;
+    expected.psw_addr = (unsigned long)func;
+    expected.exception = exception;
+    if (func == stg) {
+        stg(addr, val);
+    } else {
+        assert(func == mvc_8);
+        mvc_8(addr, &val);
+    }
+    assert(*addr == val);
+
+    err = munmap(page, 4096);
+    assert(err == 0);
+}
+
+int main(void)
+{
+    struct sigaction act;
+    int err;
+
+    memset(&act, 0, sizeof(act));
+    act.sa_sigaction = handle_signal;
+    act.sa_flags = SA_SIGINFO;
+    err = sigaction(SIGILL, &act, NULL);
+    assert(err == 0);
+    err = sigaction(SIGSEGV, &act, NULL);
+    assert(err == 0);
+
+    safe_puts("[ RUN      ] Operation exception");
+    expected.sig = SIGILL;
+    expected.addr = illegal_op;
+    expected.psw_addr = (unsigned long)after_illegal_op;
+    expected.exception = exception_operation;
+    illegal_op();
+    safe_puts("[       OK ]");
+
+    safe_puts("[ RUN      ] Translation exception from stg");
+    check_sigsegv(stg, exception_translation, 42);
+    safe_puts("[       OK ]");
+
+    safe_puts("[ RUN      ] Translation exception from mvc");
+    check_sigsegv(mvc_8, exception_translation, 4242);
+    safe_puts("[       OK ]");
+
+    safe_puts("[ RUN      ] Protection exception from stg");
+    check_sigsegv(stg, exception_protection, 424242);
+    safe_puts("[       OK ]");
+
+    safe_puts("[ RUN      ] Protection exception from mvc");
+    check_sigsegv(mvc_8, exception_protection, 42424242);
+    safe_puts("[       OK ]");
+
+    safe_puts("[  PASSED  ]");
+
+    _exit(0);
+}
-- 
2.31.1


