Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B53C41DB10
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 15:29:54 +0200 (CEST)
Received: from localhost ([::1]:47838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVw8H-0000kG-2z
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 09:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel@labath.sk>) id 1mVsk9-0007HT-51
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 05:52:45 -0400
Received: from holomatrix.labath.sk ([92.48.125.149]:53642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel@labath.sk>) id 1mVsk6-00076N-Re
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 05:52:44 -0400
Received: from unimatrix0.localdomain (unknown [172.29.152.10])
 by holomatrix.labath.sk (Postfix) with ESMTPS id 717477760C55;
 Thu, 30 Sep 2021 09:51:38 +0000 (GMT)
Received: by unimatrix0.localdomain (Postfix, from userid 1000)
 id F34302940A9; Thu, 30 Sep 2021 11:51:37 +0200 (CEST)
From: Pavel Labath <pavel@labath.sk>
To: qemu-devel@nongnu.org
Subject: [PATCH] gdbstub: Switch to the thread receiving a signal
Date: Thu, 30 Sep 2021 11:51:11 +0200
Message-Id: <20210930095111.23205-1-pavel@labath.sk>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=92.48.125.149; envelope-from=pavel@labath.sk;
 helo=holomatrix.labath.sk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 30 Sep 2021 09:20:08 -0400
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Pavel Labath <pavel@labath.sk>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Respond with Txxthread:yyyy; instead of a plain Sxx to indicate which
thread received the signal. Otherwise, the debugger will associate it
with the main one. Also automatically select this thread, as that is
what gdb expects.

Signed-off-by: Pavel Labath <pavel@labath.sk>
---
 gdbstub.c                                     |  9 ++-
 tests/tcg/multiarch/Makefile.target           |  7 +++
 .../gdbstub/test-thread-breakpoint.py         | 60 +++++++++++++++++++
 3 files changed, 74 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py

diff --git a/gdbstub.c b/gdbstub.c
index 36b85aa..7bd4479 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -3138,8 +3138,13 @@ gdb_handlesig(CPUState *cpu, int sig)
     tb_flush(cpu);
 
     if (sig != 0) {
-        snprintf(buf, sizeof(buf), "S%02x", target_signal_to_gdb(sig));
-        put_packet(buf);
+        gdbserver_state.c_cpu = cpu;
+        gdbserver_state.g_cpu = cpu;
+        g_string_printf(gdbserver_state.str_buf,
+                        "T%02xthread:", target_signal_to_gdb(sig));
+        gdb_append_thread_id(cpu, gdbserver_state.str_buf);
+        g_string_append_c(gdbserver_state.str_buf, ';');
+        put_strbuf();
     }
     /* put_packet() might have detected that the peer terminated the
        connection.  */
diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index 85a6fb7..c7b7e8b 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -73,6 +73,13 @@ run-gdbstub-qxfer-auxv-read: sha1
 		--bin $< --test $(MULTIARCH_SRC)/gdbstub/test-qxfer-auxv-read.py, \
 	"basic gdbstub qXfer:auxv:read support")
 
+run-gdbstub-thread-breakpoint: testthread
+	$(call run-test, $@, $(GDB_SCRIPT) \
+		--gdb $(HAVE_GDB_BIN) \
+		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
+		--bin $< --test $(MULTIARCH_SRC)/gdbstub/test-thread-breakpoint.py, \
+	"hitting a breakpoint on non-main thread")
+
 else
 run-gdbstub-%:
 	$(call skip-test, "gdbstub test $*", "need working gdb")
diff --git a/tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py b/tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py
new file mode 100644
index 0000000..798d508
--- /dev/null
+++ b/tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py
@@ -0,0 +1,60 @@
+from __future__ import print_function
+#
+# Test auxiliary vector is loaded via gdbstub
+#
+# This is launched via tests/guest-debug/run-test.py
+#
+
+import gdb
+import sys
+
+failcount = 0
+
+def report(cond, msg):
+    "Report success/fail of test"
+    if cond:
+        print ("PASS: %s" % (msg))
+    else:
+        print ("FAIL: %s" % (msg))
+        global failcount
+        failcount += 1
+
+def run_test():
+    "Run through the tests one by one"
+
+    sym, ok = gdb.lookup_symbol("thread1_func")
+    gdb.execute("b thread1_func")
+    gdb.execute("c")
+
+    frame = gdb.selected_frame()
+    report(str(frame.function()) == "thread1_func", "break @ %s"%frame)
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
+if gdb.parse_and_eval('$pc') == 0:
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
+    print ("GDB Exception: %s" % (sys.exc_info()[0]))
+    failcount += 1
+    pass
+
+print("All tests complete: %d failures" % failcount)
+exit(failcount)
-- 
2.32.0


