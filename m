Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 012EF6536FC
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 20:26:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p84iK-0004yO-7u; Wed, 21 Dec 2022 14:25:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p84iH-0004y5-Vy
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 14:25:14 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1p84iF-0001m0-Cf
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 14:25:13 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BLJD2TA028595; Wed, 21 Dec 2022 19:25:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=cEGaJ8I6xc4bhrY/D4EQnAtfGTmGyZBrGxYr54ndCXg=;
 b=VP4VtoefMmZzBu1+VWr14FGZFBaObWP2MOl/fBL6iD4Em9PGCsDnJzb8dFGhKCab4Wp3
 2VYm2SDgU3vte9m1mSvndNGD5m81aShbxqdgwL3ApWSa7MeNrUAkU0JomkRiNKqNb9/I
 oADGdQ+nN/ROpAHnnXh/lEj2l8A0OfOZ513yngcZ4/nFFTEjE9X57DqXwI6+A2ySVpyd
 EAId7d02ba1SK72mMUlOZvRVKOt2Y5yYm4UZgPFhXsV2LpC7GWJv7IoBOm13cBbPLFoD
 fbAaswUg4zdZ2ApSMcw6dgsPMnjcUt5XPzxCKh1A1NFwRGNsQPQXhY6fYsFNqHIaeUgA 6Q== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mm83ur8r9-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Dec 2022 19:25:09 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BLHgSjT015790;
 Wed, 21 Dec 2022 19:05:51 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3mh6yy5ymq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Dec 2022 19:05:50 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BLJ5l3b43712976
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Dec 2022 19:05:47 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7829020043;
 Wed, 21 Dec 2022 19:05:47 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2540820040;
 Wed, 21 Dec 2022 19:05:47 +0000 (GMT)
Received: from heavy.boa-de.ibmmobiledemo.com (unknown [9.171.46.51])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 21 Dec 2022 19:05:47 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH RFC v2 1/1] tests: add wasmtime testsuite
Date: Wed, 21 Dec 2022 20:05:44 +0100
Message-Id: <20221221190544.311471-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221190544.311471-1-iii@linux.ibm.com>
References: <20221221190544.311471-1-iii@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FmGZ80RpgdebWJug-Xol1_l8hFAHrsWh
X-Proofpoint-GUID: FmGZ80RpgdebWJug-Xol1_l8hFAHrsWh
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-21_11,2022-12-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212210162
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

wasmtime is a WebAssembly runtime, which includes a large testsuite.
This testsuite uses qemu-user (aarch64, riscv64, s390x and x86_64 are
supported) in order to exercise foreign architectures. Over time it
found several regressions in qemu itself, and it would be beneficial to
catch the similar ones earlier.

To this end, this patch introduces Makefile targets that run stable
wasmtime testsuite against qemu-{aarch64,riscv64,s390x,x86_64}.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 Makefile                                     |  1 +
 docs/devel/testing.rst                       |  9 +++
 tests/Makefile.include                       |  6 ++
 tests/third-party/Makefile.include           | 50 ++++++++++++
 tests/third-party/wasmtime/Dockerfile        | 32 ++++++++
 tests/third-party/wasmtime/Makefile.include  | 49 ++++++++++++
 tests/third-party/wasmtime/avocado-wrapper   | 38 +++++++++
 tests/third-party/wasmtime/avocado.cfg       |  3 +
 tests/third-party/wasmtime/json2tap          | 77 ++++++++++++++++++
 tests/third-party/wasmtime/run-tests-wrapper | 82 ++++++++++++++++++++
 tests/third-party/wasmtime/test              | 48 ++++++++++++
 11 files changed, 395 insertions(+)
 create mode 100644 tests/third-party/Makefile.include
 create mode 100644 tests/third-party/wasmtime/Dockerfile
 create mode 100644 tests/third-party/wasmtime/Makefile.include
 create mode 100755 tests/third-party/wasmtime/avocado-wrapper
 create mode 100644 tests/third-party/wasmtime/avocado.cfg
 create mode 100755 tests/third-party/wasmtime/json2tap
 create mode 100755 tests/third-party/wasmtime/run-tests-wrapper
 create mode 100755 tests/third-party/wasmtime/test

diff --git a/Makefile b/Makefile
index a48103cc8a1..3a5250d3e46 100644
--- a/Makefile
+++ b/Makefile
@@ -287,6 +287,7 @@ export DESTDIR
 include $(SRC_PATH)/tests/lcitool/Makefile.include
 include $(SRC_PATH)/tests/docker/Makefile.include
 include $(SRC_PATH)/tests/vm/Makefile.include
+include $(SRC_PATH)/tests/third-party/Makefile.include
 
 print-help-run = printf "  %-30s - %s\\n" "$1" "$2"
 print-help = @$(call print-help-run,$1,$2)
diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index e10c47b5a7c..0cbbcae4bcd 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -1475,3 +1475,12 @@ coverage-html`` which will create
 Further analysis can be conducted by running the ``gcov`` command
 directly on the various .gcda output files. Please read the ``gcov``
 documentation for more information.
+
+Third-party testsuites
+~~~~~~~~~~~~~~~~~~~~~~
+
+Various third-party projects contain testsuites that exercise non-trivial
+machine instructions or Linux kernel interfaces. While they may be too big for
+the gating CI, developers can use the corresponding make targets to verify
+their changes. The list of these targets can be found in the "Third-party
+testing targets" section of ``make check-help`` output.
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 9422ddaece5..506fe5ab16a 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -22,6 +22,12 @@ endif
 	@echo " $(MAKE) check-venv             Creates a Python venv for tests"
 	@echo " $(MAKE) check-clean            Clean the tests and related data"
 	@echo
+	@echo "Third-party testing targets:"
+	@echo " $(MAKE) check-third-party         Run third-party tests for all supported targets"
+	@echo " $(MAKE) check-third-party-TARGET  Run third-party tests for given target"
+	@echo " $(MAKE) check-wasmtime            Run wasmtime tests for all supported targets"
+	@echo " $(MAKE) check-wasmtime-TARGET     Run wasmtime tests for given target"
+	@echo
 	@echo "The following are useful for CI builds"
 	@echo " $(MAKE) check-build            Build most test binaries"
 	@echo " $(MAKE) get-vm-images          Downloads all images used by avocado tests, according to configured targets (~350 MB each, 1.5 GB max)"
diff --git a/tests/third-party/Makefile.include b/tests/third-party/Makefile.include
new file mode 100644
index 00000000000..2d45d7c4260
--- /dev/null
+++ b/tests/third-party/Makefile.include
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+# Makefile for testing QEMU with third-party testsuites.
+
+# Known docker-like commands.
+DOCKER_COMMAND_PODMAN = podman
+DOCKER_COMMAND_DOCKER = docker
+DOCKER_COMMAND_SUDO_DOCKER = sudo -n docker
+DOCKER_COMMAND_NONE = /bin/false
+
+# Mapping from $(ENGINE) to the respective docker-like commands.
+DOCKER_COMMAND_CANDIDATES_auto = PODMAN DOCKER SUDO_DOCKER
+DOCKER_COMMAND_CANDIDATES_podman = PODMAN
+DOCKER_COMMAND_CANDIDATES_docker = DOCKER SUDO_DOCKER
+
+# Select the docker-like command based on $(ENGINE).
+DOCKER_COMMAND = $(DOCKER_COMMAND_NONE)
+define try_docker_command
+ifeq ($(DOCKER_COMMAND),$(DOCKER_COMMAND_NONE))
+ifeq ($(shell $(DOCKER_COMMAND_$(1)) version >/dev/null 2>&1 || echo ?),)
+DOCKER_COMMAND = $(DOCKER_COMMAND_$(1))
+endif
+endif
+endef
+$(foreach candidate,$(DOCKER_COMMAND_CANDIDATES_$(ENGINE)), \
+	$(eval $(call try_docker_command,$(candidate))))
+
+# Mapping from QEMU architecture names to Debian ones.
+DEB_ARCH_aarch64 = arm64
+DEB_ARCH_riscv64 = riscv64
+DEB_ARCH_s390x = s390x
+DEB_ARCH_x86_64 = amd64
+
+# Register the target named $(1)-$(2), that runs the third-party
+# testsuite $(1) with the QEMU target $(2).
+define add_third_party_testsuite
+.PHONY: $(1)
+$(1): $(1)-$(2)
+
+.PHONY: check-third-party-$(2)
+check-third-party-$(2): $(1)-$(2)
+
+check-third-party: check-third-party-$(2)
+endef
+
+# Define targets.
+.PHONY: check-third-party
+check-third-party:
+
+include $(SRC_PATH)/tests/third-party/wasmtime/Makefile.include
diff --git a/tests/third-party/wasmtime/Dockerfile b/tests/third-party/wasmtime/Dockerfile
new file mode 100644
index 00000000000..d1a20e3a2ae
--- /dev/null
+++ b/tests/third-party/wasmtime/Dockerfile
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+# Image for building and running the wasmtime testsuite.
+
+ARG deb_arch
+FROM registry.gitlab.com/qemu-project/qemu/qemu/debian-${deb_arch}-cross:latest
+
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    eatmydata apt-get update && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y \
+                      curl && \
+    eatmydata apt-get autoremove -y && \
+    eatmydata apt-get autoclean -y
+
+ARG group_id
+ARG group_name
+RUN if ! getent group ${group_id} >/dev/null 2>&1; then \
+        groupdel ${group_name} >/dev/null 2>&1 ; \
+        groupadd --gid=${group_id} ${group_name} ; \
+    fi
+
+ARG user_id
+ARG user_name
+RUN if ! getent user ${user_id} >/dev/null 2>&1; then \
+        userdel ${user_name} >/dev/null 2>&1 ; \
+        useradd \
+            --create-home \
+            --gid=${group_id} \
+            --uid=${user_id} \
+            ${user_name} ; \
+    fi
diff --git a/tests/third-party/wasmtime/Makefile.include b/tests/third-party/wasmtime/Makefile.include
new file mode 100644
index 00000000000..5addbc99e77
--- /dev/null
+++ b/tests/third-party/wasmtime/Makefile.include
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+# Makefile for testing QEMU with the wasmtime testsuite.
+
+# QEMU targets that can be tested with the wasmtime testsuite.
+WASMTIME_TARGET_LIST := \
+	aarch64-linux-user \
+	riscv64-linux-user \
+	s390x-linux-user \
+	x86_64-linux-user
+
+WASMTIME_SRC_PATH := $(SRC_PATH)/tests/third-party/wasmtime
+
+# Run the wasmtime testsuite with a specific QEMU target.
+define add_wasmtime_target
+
+.PHONY: check-wasmtime-$(1)
+check-wasmtime-$(1): ARCH = $(1:-linux-user=)
+check-wasmtime-$(1): DEB_ARCH = $$(DEB_ARCH_$$(ARCH))
+check-wasmtime-$(1): TAG = $(DOCKER_REGISTRY)/qemu/debian-$$(DEB_ARCH)-wasmtime-cross
+check-wasmtime-$(1): AVOCADO_WRAPPER = $(WASMTIME_SRC_PATH)/avocado-wrapper $(TESTS_VENV_DIR)
+check-wasmtime-$(1): CMD = $(WASMTIME_SRC_PATH)/test $$(ARCH) -- -Z unstable-options --format=json
+check-wasmtime-$(1): WASMTIME_BUILD_DIR = $(shell pwd)/wasmtime-$(1)
+check-wasmtime-$(1): check-venv
+	$(DOCKER_COMMAND) build \
+		--build-arg=deb_arch=$$(DEB_ARCH) \
+		--build-arg=group_id=$(shell id -g) \
+		--build-arg=group_name=$(shell id -n -g) \
+		--build-arg=user_id=$(shell id -u) \
+		--build-arg=user_name=$(shell id -n -u) \
+		--quiet \
+		--tag=$$(TAG) \
+		$(WASMTIME_SRC_PATH) >/dev/null
+	mkdir -p $$(WASMTIME_BUILD_DIR)
+	$$(AVOCADO_WRAPPER) $(DOCKER_COMMAND) run \
+		--interactive \
+		--rm \
+		--security-opt=seccomp=unconfined \
+		--user=$(shell id -u):$(shell id -g) \
+		--volume=$$(WASMTIME_BUILD_DIR):$$(WASMTIME_BUILD_DIR):z \
+		--volume=$(SRC_PATH):$(SRC_PATH):z \
+		--workdir=$$(WASMTIME_BUILD_DIR) \
+		$$(TAG) \
+		$$(CMD)
+$(eval $(call add_third_party_testsuite,check-wasmtime,$(1)))
+endef
+
+# Define targets.
+$(foreach t,$(WASMTIME_TARGET_LIST),$(eval $(call add_wasmtime_target,$(t))))
diff --git a/tests/third-party/wasmtime/avocado-wrapper b/tests/third-party/wasmtime/avocado-wrapper
new file mode 100755
index 00000000000..3d0f7388428
--- /dev/null
+++ b/tests/third-party/wasmtime/avocado-wrapper
@@ -0,0 +1,38 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+# Run a single command with avocado.
+
+set -e -u -o pipefail
+
+# Script arguments.
+if [ "$#" -lt 2 ]; then
+    cat <<HERE >&2
+
+Usage:
+
+    $0 TESTS_VENV_DIR COMMAND [ARGS... ]
+
+where TESTS_VENV_DIR should point to an existing virtualenv with avocado.
+
+HERE
+    exit 1
+fi
+venv=$1
+shift
+
+# Avocado can run only individual binaries (no arguments, pipes, etc).
+# So create a temporary trampoline script.
+trampoline=$(mktemp ./trampoline.XXXXXXXXXX)
+trap 'rm "$trampoline"' EXIT
+basedir=$(cd "$(dirname "$0")" && pwd)
+cat >"$trampoline" <<HERE
+#!/bin/bash
+set -e -u -o pipefail
+${@@Q} | ${basedir@Q}/json2tap
+HERE
+chmod a+x "$trampoline"
+
+# Enter the virtualenv and run the trampoline script.
+. "$venv"/bin/activate
+avocado --config="$basedir/avocado.cfg" run "$trampoline"
diff --git a/tests/third-party/wasmtime/avocado.cfg b/tests/third-party/wasmtime/avocado.cfg
new file mode 100644
index 00000000000..2c08150c9a3
--- /dev/null
+++ b/tests/third-party/wasmtime/avocado.cfg
@@ -0,0 +1,3 @@
+[plugins]
+# So that avocado.plugins.resolvers:TapResolver is used instead.
+disable = ['resolver.exec-test']
diff --git a/tests/third-party/wasmtime/json2tap b/tests/third-party/wasmtime/json2tap
new file mode 100755
index 00000000000..0e17db0f607
--- /dev/null
+++ b/tests/third-party/wasmtime/json2tap
@@ -0,0 +1,77 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+# Read libtest json output [1] from stdin, write TAP 14 [2] to stdout.
+# [1] https://github.com/rust-lang/rust/blob/1.66.0/library/test/src/formatters/json.rs
+# [2] https://testanything.org/tap-version-14-specification.html
+
+from contextlib import closing
+import json
+import json.decoder
+import sys
+
+
+class TAP:
+    def __init__(self, out):
+        self.out = out
+        self.number = 0
+        self.out.write(b"TAP version 14\n")
+
+    def try_process_test(self, event):
+        name = event.get("name")
+        if name is None:
+            return False
+        evt = event.get("event")
+        if evt == "started":
+            return True
+        if evt == "ok":
+            self.number += 1
+            self.out.write("ok {} - {}\n".format(self.number, name).encode())
+            return True
+        if evt in ("failed", "timeout"):
+            self.number += 1
+            self.out.write("not ok {} - {}\n".format(self.number, name).encode())
+            stdout = event.get("stdout")
+            if stdout is not None:
+                self.out.write(b"  ---\n")
+                self.out.write(b"  stdout:\n")
+                for line in stdout.split("\n"):
+                    self.out.write("    {}\n".format(line).encode())
+                self.out.write(b"  ...\n")
+            return True
+        if evt == "ignored":
+            self.number += 1
+            self.out.write("ok {} - {}  # skip\n".format(self.number, name).encode())
+            return True
+        return False
+
+    def try_process_line(self, line):
+        try:
+            event = json.loads(line)
+        except json.decoder.JSONDecodeError:
+            return False
+        if not isinstance(event, dict):
+            return False
+        ty = event.get("type")
+        if ty in ("bench", "suite"):
+            return True
+        if ty == "test":
+            return self.try_process_test(event)
+        return False
+
+    def process_line(self, line):
+        if not self.try_process_line(line):
+            self.out.write(line)
+
+    def close(self):
+        self.out.write("1..{}\n".format(self.number).encode())
+
+
+def main():
+    with closing(TAP(sys.stdout.buffer)) as tap:
+        for line in sys.stdin.buffer:
+            tap.process_line(line)
+
+
+if __name__ == "__main__":
+    main()
diff --git a/tests/third-party/wasmtime/run-tests-wrapper b/tests/third-party/wasmtime/run-tests-wrapper
new file mode 100755
index 00000000000..5d722ec73a3
--- /dev/null
+++ b/tests/third-party/wasmtime/run-tests-wrapper
@@ -0,0 +1,82 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+# Run wasmtime's ci/run-tests.sh with qemu-user from $PATH in the current
+# directory. Create or update ".rustup", ".cargo" and "wasmtime"
+# subdirectories.
+#
+# Based on https://github.com/bytecodealliance/wasmtime/blob/v3.0.1/.github/workflows/main.yml#L212.
+#
+# Usage:
+#
+#     ./run-tests-wrapper TARGET_ARCH [CARGO_ARGS ...]
+#
+# where TARGET_ARCH is the architecture to test (aarch64, riscv64, s390x or
+# x86_64) and CARGO_ARGS are the extra arguments passed to cargo test.
+
+set -e -u -x -o pipefail
+
+# Dependency versions.
+export RUSTUP_TOOLCHAIN=1.66.0
+wasmtime_version=3.0.1
+
+# Script arguments.
+arch=$1
+shift
+
+# Extra qemu options and Rust architecture name.
+qemu_opts="-L /usr/$arch-linux-gnu"
+rust_arch=$arch
+case "$arch" in
+    riscv64)
+        rust_arch=riscv64gc
+        ;;
+    x86_64)
+        qemu_opts="$qemu_opts -cpu Nehalem"
+        ;;
+esac
+rust_arch_upper=$(echo "$rust_arch" | tr '[:lower:]' '[:upper:]')
+
+# Install/update Rust.
+export RUSTUP_HOME="$PWD/.rustup"
+export CARGO_HOME="$PWD/.cargo"
+curl \
+    --proto '=https' \
+    --tlsv1.2 \
+    -sSf \
+    https://sh.rustup.rs \
+    | sh -s -- -y \
+        --default-toolchain="$RUSTUP_TOOLCHAIN" \
+        --no-modify-path \
+        --target=wasm32-wasi \
+        --target=wasm32-unknown-unknown \
+        --target="$rust_arch"-unknown-linux-gnu
+. "$PWD/.cargo/env"
+
+# Checkout/update wasmtime.
+if [ -d wasmtime ]; then
+    cd wasmtime
+    git fetch --force --tags
+    git checkout v"$wasmtime_version"
+else
+    git clone \
+        --branch=v"$wasmtime_version" \
+        https://github.com/bytecodealliance/wasmtime.git
+    cd wasmtime
+fi
+git submodule update --init --recursive
+
+# Some binaries started by the testsuite are expected to crash.
+# Do not pollute the system with core dumps.
+ulimit -c 0
+
+# Run ci/run-tests.sh.
+export CARGO_BUILD_TARGET="$rust_arch-unknown-linux-gnu"
+runner_var=CARGO_TARGET_${rust_arch_upper}_UNKNOWN_LINUX_GNU_RUNNER
+linker_var=CARGO_TARGET_${rust_arch_upper}_UNKNOWN_LINUX_GNU_LINKER
+eval "export $runner_var=\"qemu-$arch $qemu_opts\""
+eval "export $linker_var=$arch-linux-gnu-gcc"
+export CARGO_PROFILE_DEV_OPT_LEVEL=2
+export WASMTIME_TEST_NO_HOG_MEMORY=1
+export RUST_BACKTRACE=1
+exec ci/run-tests.sh --locked "$@"
diff --git a/tests/third-party/wasmtime/test b/tests/third-party/wasmtime/test
new file mode 100755
index 00000000000..95a4c5ebab0
--- /dev/null
+++ b/tests/third-party/wasmtime/test
@@ -0,0 +1,48 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+# Build qemu-user and stable wasmtime testsuite in the current directory, and
+# test them together. Create or update ".rustup", ".cargo" and "wasmtime"
+# subdirectories, as well as qemu build files.
+#
+# Based on https://github.com/bytecodealliance/wasmtime/blob/v3.0.1/.github/workflows/main.yml#L212.
+
+set -e -u -x -o pipefail
+
+# Script arguments.
+if [ "$#" -lt 1 ]; then
+    set +x
+    cat <<HERE >&2
+
+Usage:
+
+    $0 TARGET_ARCH [CARGO_ARGS ...]
+
+where TARGET_ARCH is the architecture to test (aarch64, riscv64, s390x or
+x86_64) and CARGO_ARGS are the extra arguments passed to cargo test.
+
+HERE
+    exit 1
+fi
+arch=$1
+shift
+
+# Build QEMU.
+basedir=$(cd "$(dirname "$0")" && pwd)
+srcdir=$(cd "$basedir"/../../.. && pwd)
+builddir=$(pwd)
+if [ "$srcdir" = "$builddir" ]; then
+    builddir=$builddir/build
+fi
+"$srcdir"/configure \
+    --target-list="$arch"-linux-user \
+    --disable-tools \
+    --disable-slirp \
+    --disable-fdt \
+    --disable-capstone \
+    --disable-docs
+make --output-sync -j"$(nproc)"
+export PATH="$builddir:$PATH"
+
+# Run wasmtime tests.
+"$basedir"/run-tests-wrapper "$arch" "$@"
-- 
2.38.1


