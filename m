Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A78B43B00B
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 12:31:44 +0200 (CEST)
Received: from localhost ([::1]:47956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfJk7-0004mi-8o
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 06:31:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJhx-0001sC-Jn
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:29:29 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:35600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJhv-0004fu-SS
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:29:29 -0400
Received: by mail-lj1-x22c.google.com with SMTP id o26so19022818ljj.2
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 03:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=539DaXe9WhjsfyEZD4DL2StoJEh/zF/3E9mokdi44u0=;
 b=wBMhY9fEvuVi8g6YCAMcagne8/QVWu1UmuuMdbLTNftBzT/Z0j0SkW5u071WdpnW8a
 0OIhwpu3zHYOp+1iIY3l7i4bvCPLS1uGkRXcLdg9+K+KobweF+1WPHd4KMwmubIGM9tU
 gBxHHHew9xdJCMqZtW4aY6M6KVSqVxB/xlWykbGN6QbBjcSAj6W8YzPiXl92pQnOycrT
 8E7z7+i3BzLoGakkkjvop1GQWVLpLkF8vMm5tr/fUY3F7Gl23nA+4OTzUdBUM4tJ7O2u
 k7GowkhQjf1k3pFlwqOkFqKjTotg5nbtpOJDp0rWj4LmYHDBnDfr/dY6tcxn3U4oLPjs
 4ZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=539DaXe9WhjsfyEZD4DL2StoJEh/zF/3E9mokdi44u0=;
 b=S5eyaK52naoyR6nkGWk06kvZLY9WAcdITW98/qbJUR0bHOB40fTHnqkZzNIj78g0ub
 3ngBr4G9hVP4sXPS0m0USQT5ceRvZI8d7TDlChmmWc4swGrvwyXi9kkIfKBNMvYHWmkF
 TRIFnSJnOQGAqy93PFlMZo1U4VMDSp8ddw41QmcR3+DD8mVIeGyzV2OXaQCPBjF5U/iW
 ITKDLXu2/c0z8zwJRcH+JRHR54lX6AzeqPbfmhSkos4pDwrKk+n5fQmf0wAE27TZ8GOS
 AFnljjBgXyxR6JoJgyP7ErFU5a2aSMzFvIBSuNR+cOMK8xrRB36PHNpGkbmhxWdkzvno
 z5OQ==
X-Gm-Message-State: AOAM530YxcEjxkqlkqDWxRA9RUid7it0sfJiNAelKGExxz85f3SHwT7c
 lqYjXR/ledJHk2rZUEYVU2XN9A==
X-Google-Smtp-Source: ABdhPJwBWvU6Idn6IUTC3Lz1uL7Yg/+GU0VlOT/M1BcLKUtuCUpZRErMkqrtjT6F82ltBzwN0juXFw==
X-Received: by 2002:a2e:9f15:: with SMTP id u21mr24840169ljk.312.1635244166008; 
 Tue, 26 Oct 2021 03:29:26 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k39sm1140292lfv.284.2021.10.26.03.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 03:29:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 67D4D1FFBE;
 Tue, 26 Oct 2021 11:22:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 28/28] gdbstub: Switch to the thread receiving a signal
Date: Tue, 26 Oct 2021 11:22:34 +0100
Message-Id: <20211026102234.3961636-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026102234.3961636-1-alex.bennee@linaro.org>
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=alex.bennee@linaro.org; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, minyihh@uci.edu, berrange@redhat.com,
 kuhn.chenqun@huawei.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, f4bug@amsat.org,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, Pavel Labath <pavel@labath.sk>,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Labath <pavel@labath.sk>

Respond with Txxthread:yyyy; instead of a plain Sxx to indicate which
thread received the signal. Otherwise, the debugger will associate it
with the main one. Also automatically select this thread, as that is
what gdb expects.

Signed-off-by: Pavel Labath <pavel@labath.sk>
Message-Id: <20211019174953.36560-1-pavel@labath.sk>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub.c                                     |  8 ++-
 tests/tcg/multiarch/Makefile.target           | 10 +++-
 .../gdbstub/test-thread-breakpoint.py         | 60 +++++++++++++++++++
 3 files changed, 75 insertions(+), 3 deletions(-)
 create mode 100644 tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py

diff --git a/gdbstub.c b/gdbstub.c
index 36b85aa50e..23baaef40e 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -3138,8 +3138,12 @@ gdb_handlesig(CPUState *cpu, int sig)
     tb_flush(cpu);
 
     if (sig != 0) {
-        snprintf(buf, sizeof(buf), "S%02x", target_signal_to_gdb(sig));
-        put_packet(buf);
+        gdb_set_stop_cpu(cpu);
+        g_string_printf(gdbserver_state.str_buf,
+                        "T%02xthread:", target_signal_to_gdb(sig));
+        gdb_append_thread_id(cpu, gdbserver_state.str_buf);
+        g_string_append_c(gdbserver_state.str_buf, ';');
+        put_strbuf();
     }
     /* put_packet() might have detected that the peer terminated the
        connection.  */
diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index c0d9e638e9..b962ed8236 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -68,11 +68,19 @@ run-gdbstub-qxfer-auxv-read: sha1
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
 endif
-EXTRA_RUNS += run-gdbstub-sha1 run-gdbstub-qxfer-auxv-read
+EXTRA_RUNS += run-gdbstub-sha1 run-gdbstub-qxfer-auxv-read \
+	      run-gdbstub-thread-breakpoint
 
 # ARM Compatible Semi Hosting Tests
 #
diff --git a/tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py b/tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py
new file mode 100644
index 0000000000..798d508bc7
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
2.30.2


