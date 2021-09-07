Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E804029CD
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:35:56 +0200 (CEST)
Received: from localhost ([::1]:54440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNbGV-0004ng-3K
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:35:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNawe-0003Ch-Oz
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:15:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNawV-0002L6-OB
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:15:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631020514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Git4jmxTBvGfii58Z4QIjJbK9sKyH/5Jhvau5kWvnjQ=;
 b=FoW7tpgreLTTzaVaQdwL7XKIgnRF94f5d2qdYJEG331A5nBdQNeuoUoWiBFl2X97LlSsO5
 bwDv/4yPNThUEelRoAfA0/NypYACQOB3C7vFiCBTP6Q1bQyD50f4xjPpG8bPqZykeAxrqp
 ol62ZrTMWOlt+9PXWqbLh6o8nkUEsdc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-LRZ3_RmvNo2FaEbJ57rzbA-1; Tue, 07 Sep 2021 09:15:11 -0400
X-MC-Unique: LRZ3_RmvNo2FaEbJ57rzbA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51D7B1013720;
 Tue,  7 Sep 2021 13:15:10 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F6965FC25;
 Tue,  7 Sep 2021 13:15:03 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 03/20] tests/tcg/s390x: Test SIGILL and SIGSEGV handling
Date: Tue,  7 Sep 2021 15:14:32 +0200
Message-Id: <20210907131449.493875-4-thuth@redhat.com>
In-Reply-To: <20210907131449.493875-1-thuth@redhat.com>
References: <20210907131449.493875-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.391, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ilya Leoshkevich <iii@linux.ibm.com>

Verify that s390x-specific uc_mcontext.psw.addr is reported correctly
and that signal handling interacts properly with debugging.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210804225146.154513-1-iii@linux.ibm.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/tcg/s390x/Makefile.target               |  17 +-
 tests/tcg/s390x/gdbstub/test-signals-s390x.py |  76 ++++++++
 tests/tcg/s390x/signals-s390x.c               | 165 ++++++++++++++++++
 3 files changed, 257 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/s390x/gdbstub/test-signals-s390x.py
 create mode 100644 tests/tcg/s390x/signals-s390x.c

diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index bd084c7840..cc64dd32d2 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -1,4 +1,5 @@
-VPATH+=$(SRC_PATH)/tests/tcg/s390x
+S390X_SRC=$(SRC_PATH)/tests/tcg/s390x
+VPATH+=$(S390X_SRC)
 CFLAGS+=-march=zEC12 -m64
 TESTS+=hello-s390x
 TESTS+=csst
@@ -9,3 +10,17 @@ TESTS+=pack
 TESTS+=mvo
 TESTS+=mvc
 TESTS+=trap
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
2.27.0


