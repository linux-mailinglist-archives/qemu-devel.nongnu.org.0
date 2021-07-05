Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 195643BC388
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 23:06:21 +0200 (CEST)
Received: from localhost ([::1]:43066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0VnH-0003Bm-Dl
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 17:06:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1m0Vlr-0000lf-7w; Mon, 05 Jul 2021 17:04:51 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:4406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1m0Vln-0002rn-QY; Mon, 05 Jul 2021 17:04:50 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 165L3kPR180909; Mon, 5 Jul 2021 17:04:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=scX83hC1V3CNOPRzKMzcUszz1vcxuEd7ywMJBVu5m/Y=;
 b=D3+llbN26d9rD1boTIvNFf5KNLVFpo6QBRFFoRHtFvfh5mI76Ug/C3vXsauInEUOI6YM
 ZOFv1atK5XRvDeQ0L4v76KIQA86OvGQ1XWija05amhwhXo3eXoenzdmM2fEGyyxl5Hod
 dH7wabK7u/jbnE70LYypeUDKOqO3sjtbGGfMcaGFOuiW53LfeBL8VG4F1gZg2sw7A4VR
 /XDbp6WPaNrjfWP3LSuW8R5RahxpX8Q74e6n26nh8taRRZRHh7uRgaF7CfWprL7v68cx
 olbcq1VAIG9xlb+WoKH8pyFa2wcFTzd7RyVGHDYzSIGooII1ZxcTP1FcFUnUaqXZ8AeY yA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39m58y60j8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Jul 2021 17:04:45 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 165L3vcV181431;
 Mon, 5 Jul 2021 17:04:45 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39m58y60he-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Jul 2021 17:04:45 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 165L37Q5021372;
 Mon, 5 Jul 2021 21:04:43 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 39jfh8rxw5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Jul 2021 21:04:43 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 165L4dCL31719810
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 5 Jul 2021 21:04:39 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0911C11C05B;
 Mon,  5 Jul 2021 21:04:39 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E0B711C04A;
 Mon,  5 Jul 2021 21:04:38 +0000 (GMT)
Received: from vm.lan (unknown [9.145.62.121])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  5 Jul 2021 21:04:38 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v6 2/2] tests/tcg/s390x: Test SIGILL and SIGSEGV handling
Date: Mon,  5 Jul 2021 23:04:34 +0200
Message-Id: <20210705210434.45824-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210705210434.45824-1-iii@linux.ibm.com>
References: <20210705210434.45824-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PO8o2w8tSYonwrYPeN3oA41Ksio8kO10
X-Proofpoint-ORIG-GUID: 4-NfqsYDucrEgWe-T2BhnDsrOkN_xyft
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-05_11:2021-07-02,
 2021-07-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 clxscore=1015
 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107050113
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
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
 tests/tcg/s390x/Makefile.target               |  18 +-
 tests/tcg/s390x/gdbstub/test-signals-s390x.py |  76 ++++++++
 tests/tcg/s390x/signals-s390x.c               | 165 ++++++++++++++++++
 3 files changed, 258 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/s390x/gdbstub/test-signals-s390x.py
 create mode 100644 tests/tcg/s390x/signals-s390x.c

diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 0036b8a505..0a5b25c156 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -1,4 +1,5 @@
-VPATH+=$(SRC_PATH)/tests/tcg/s390x
+S390X_SRC=$(SRC_PATH)/tests/tcg/s390x
+VPATH+=$(S390X_SRC)
 CFLAGS+=-march=zEC12 -m64
 TESTS+=hello-s390x
 TESTS+=csst
@@ -12,3 +13,18 @@ TESTS+=mvc
 # This triggers failures on s390x hosts about 4% of the time
 run-signals: signals
 	$(call skip-test, $<, "BROKEN awaiting sigframe clean-ups")
+
+TESTS+=signals-s390x
+
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


