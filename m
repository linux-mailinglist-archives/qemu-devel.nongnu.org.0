Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0830262C005
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 14:49:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovIml-0000bR-P8; Wed, 16 Nov 2022 08:49:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1ovImW-0000aR-OU
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:48:59 -0500
Received: from mail.ispras.ru ([83.149.199.84])
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1ovImP-0007sM-Eq
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:48:47 -0500
Received: from [127.0.1.1] (unknown [62.118.138.151])
 by mail.ispras.ru (Postfix) with ESMTPSA id 5C3B1406BB55;
 Wed, 16 Nov 2022 13:48:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 5C3B1406BB55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1668606490;
 bh=4ZJtAQVcpYHtlWlexxcoR/0S1hvM0xV70UsMQXXo4j4=;
 h=Subject:From:To:Cc:Date:From;
 b=hIPKGprYibyMLn29+7mut9U+etAE6XkAEqe44zX2MvR0MUy5redItOAZn3LpoZjoc
 E2uSh/maZ2I1bGWQ9SfnkMRVL1hh2exQz44F/1B7WISoRrtkxoGkq3Sv0DFqeEpsKj
 GkeVP6R1VNFsDOzf7GoIYM3RpjU4x3GfWQEspWqA=
Subject: [PATCH] tests/avocado: using several workers while testing
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Cc: pavel.dovgalyuk@ispras.ru, pbonzini@redhat.com, alex.bennee@linaro.org,
 philmd@redhat.com, crosa@redhat.com, wrampazz@redhat.com, wainersm@redhat.com, 
 bleal@redhat.com, bakulinm@ispras.ru
Date: Wed, 16 Nov 2022 16:48:10 +0300
Message-ID: <166860649008.1258000.17066080427505400235.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

From: bakulinm <bakulinm@gmail.com>

make check-avocado takes a lot of time, and avocado since version 91 has
multithreaded mode for running several tests simultaneously.
This patch allows to run "make check-avocado -j" to use all cores or,
for example, "make check-avocado -j4" to select number of workers to use.
By default ("make check-avocado") only one worker is used.

Changes:
1) Version of avocado in requirements.txt upgraded from 88.1 to <93
 (LTS version is used, as mentioned here
  https://avocado-framework.readthedocs.io/en/latest/releases/lts/92_0.html )
2) Makefile 4.1 (used in e.g. Ubuntu 18.04) doesn't provide number of jobs
 in $MAKEFLAGS, so python script from here
 https://stackoverflow.com/a/67247743/5936122 is used. Python script parses
 Makeflags, communicates with jobserver to get the number of available jobs
 and outputs it as a number, that is used as nrunner-max-parallel-tasks.
 If -j is used, it outputs total number of cores. If -j is not used at all,
 it returns 1. Limitations: script can probably report lower number of jobs
 than provided, if some slots are already taken by other makefiles, so make
 check-avocado should be run separately from other make tasks.

Signed-off-by: Maksim Bakulin <bakulinm@ispras.ru>
Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
---
 tests/Makefile.include |   20 ++++++++++++++++++--
 tests/jobs.py          |   42 ++++++++++++++++++++++++++++++++++++++++++
 tests/requirements.txt |    2 +-
 3 files changed, 61 insertions(+), 3 deletions(-)
 create mode 100644 tests/jobs.py

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 9422ddaece..6da5b6b45e 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -93,6 +93,9 @@ TESTS_VENV_DIR=$(BUILD_DIR)/tests/venv
 TESTS_VENV_REQ=$(SRC_PATH)/tests/requirements.txt
 TESTS_RESULTS_DIR=$(BUILD_DIR)/tests/results
 TESTS_PYTHON=$(TESTS_VENV_DIR)/bin/python3
+# 1 parallel task is used by default
+NRUNNER_MAX_TASKS=--nrunner-max-parallel-tasks
+
 ifndef AVOCADO_TESTS
 	AVOCADO_TESTS=tests/avocado
 endif
@@ -111,6 +114,19 @@ quiet-venv-pip = $(quiet-@)$(call quiet-command-run, \
     $(TESTS_PYTHON) -m pip -q --disable-pip-version-check $1, \
     "VENVPIP","$1")
 
+
+get_avocado_max_tasks:
+# Make doesn't have easy ways to get number of jobs, using python for that
+# Python script communicates with jobserver to detect number of jobs
+	+$(eval MAKE_JOBS:=$$(shell python3 $(SRC_PATH)/tests/jobs.py $(MAKEFLAGS)))
+	@echo Using $(MAKE_JOBS) jobs for avocado testing
+# If 2 jobs or more are used set nrunner-max-parallel-tasks accordingly
+	@if [ ${MAKE_JOBS} -gt 1 ] ; then \
+		$(eval NRUNNER_MAX_TASKS=--nrunner-max-parallel-tasks $$(MAKE_JOBS)) true; \
+	fi
+
+$(TESTS_VENV_REQ): get_avocado_max_tasks
+
 $(TESTS_VENV_DIR): $(TESTS_VENV_REQ)
 	$(call quiet-command, $(PYTHON) -m venv $@, VENV, $@)
 	$(call quiet-venv-pip,install -e "$(SRC_PATH)/python/")
@@ -145,8 +161,8 @@ check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
             $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
 			--filter-by-tags-include-empty-key) \
             $(AVOCADO_CMDLINE_TAGS) \
-            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), \
-            "AVOCADO", "tests/avocado")
+            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS) $(NRUNNER_MAX_TASKS), \
+            "AVOCADO", "tests/avocado" \)
 
 check-acceptance-deprecated-warning:
 	@echo
diff --git a/tests/jobs.py b/tests/jobs.py
new file mode 100644
index 0000000000..a339192d97
--- /dev/null
+++ b/tests/jobs.py
@@ -0,0 +1,42 @@
+import argparse, os
+import sys
+
+def safe_int(s):
+    try:
+        return int(s)
+    except:
+        return -1
+
+class JobserverArgs:
+    known_names = ["jobserver-fds","jobserver-auth"]
+    def __init__(self):
+        self.fds = "-1,-1"
+
+    @staticmethod
+    def from_argv():
+        ja = JobserverArgs()
+        parser = argparse.ArgumentParser()
+        for name in JobserverArgs.known_names:
+            parser.add_argument('--'+name, dest="fds")
+        parser.parse_known_args(namespace=ja)
+        return ja
+
+    def get_fds(self):
+        return tuple([safe_int(fd) for fd in (self.fds+",").split(",")][:2])
+
+fd_in, fd_out = JobserverArgs.from_argv().get_fds()
+
+if fd_in == -1 or fd_out == -1:
+# if no jobserver is used, but -j is present, use total number of cpu cores
+    if '-j' in sys.argv:
+        print(os.cpu_count())
+# use single thread
+    else:
+        print(1)
+else:
+    os.set_blocking(fd_in, False)
+
+    tokens = os.read(fd_in, 1024)
+    os.write(fd_out, tokens)
+
+    print(len(tokens)+1)
\ No newline at end of file
diff --git a/tests/requirements.txt b/tests/requirements.txt
index 0ba561b6bd..3b8c4d4706 100644
--- a/tests/requirements.txt
+++ b/tests/requirements.txt
@@ -2,5 +2,5 @@
 # in the tests/venv Python virtual environment. For more info,
 # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
 # Note that qemu.git/python/ is always implicitly installed.
-avocado-framework==88.1
+avocado-framework<93
 pycdlib==1.11.0


