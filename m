Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AFE628EF0
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:11:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouinr-00087F-RK; Mon, 14 Nov 2022 18:23:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ouifG-0004Q9-DW
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:55 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ouZqd-000637-Ek
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 08:50:05 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so7962733wmb.0
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 05:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NessA7feBX5JaP44J04zcRgMiQOjCRQhmP6PzLSK3Mw=;
 b=MBqohNsmPGnZjZTDlfySJF8dgGl8w/6k8MAi6IpCM6rHKUswogzR8jyKQFqdaVS7p9
 WB2Jzl5tesNfFggZB3RcHrvuPSE+iXD8SLvNEr4jpwlxXLNKh7Vdtx2nUCA/KxeNO5Ei
 OWM8js8r8tkLwM7U9OVzQJbDRBaatDjOJqMbdBKTYtzxpdDOVt+NVjXSOkJLILQKHreM
 f7pjPobl6ClrO5RviyObiJ2SH+ei6SOmEmvpjPNfktastqT7B59EF48GD50mjsJiAlmW
 QzCwOgGxQZ8ajbBPoz4Ju5tCSb7ZOuzSBXfrae2eiw1AGyS8XnE5dU/yfQBH6/0o7VbX
 qcUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NessA7feBX5JaP44J04zcRgMiQOjCRQhmP6PzLSK3Mw=;
 b=ttzGr/1GMcr+qoxy7tHW7YUW8WXjWvMLEbuH40cDDrosew0sftKzYkcam/HjLwPRkC
 A3f5oBX92QY7XQXktpOAhefCMegl/u/sk3nrMz6nv2vkdy9pbCNyXT79MWojh/t+cb07
 Vw/pp488eamm0LAUJL4jvOS/JcI6PBJgDwA9DRiV4PbL6tzqXiFYd2a4unzEG3IYqpVg
 jG+GqjZqxcIuTX7FgFpI3mV+aeqYLl3ADu1XrcyUaegzkWVVndlYikShO4r0Mc7hF3S6
 zTrbCu2+tdq85GCuzLFzRj3fr1uXxLCUBIVjzASRqhMpx0K84YRqmH9O6xcGqvaRNCXl
 0CPQ==
X-Gm-Message-State: ANoB5plPfu6IO+FyYGM3ReXMGT/w0gq+yxnZJCWdJ69AIuhIWwtx6BI/
 I75RiwnkaL1n7wr7pcvGlIjH5w==
X-Google-Smtp-Source: AA0mqf4dIgbWAVawB0Sacw0WK6m5sd8lQ78Bi46PhFit48xpZuH/qNSm8S3zfsqr8ed+xogGA3guaA==
X-Received: by 2002:a1c:26c1:0:b0:3cf:b1c2:c911 with SMTP id
 m184-20020a1c26c1000000b003cfb1c2c911mr7819038wmm.16.1668433801430; 
 Mon, 14 Nov 2022 05:50:01 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a7bc5c4000000b003c6c182bef9sm22195137wmk.36.2022.11.14.05.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 05:50:00 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 67D401FFB7;
 Mon, 14 Nov 2022 13:49:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [RFC PATCH] gitlab: add new dynamic check-gcov target for coverage
Date: Mon, 14 Nov 2022 13:49:54 +0000
Message-Id: <20221114134954.1670860-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The aim of this was to expand the coverage checking to only target
builds affected by the current branch. Unfortunately first time out
the build falls over at the asset uploading stage exceeding some size
limit.

So for now I'm posting this as a proof-of-concept until I can figure
out a better way forward. The highlighting of which changes are tested
in the GitLab UI is quite nice though.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/buildtest.yml   | 24 ++++++++--
 .gitlab-ci.d/pick-targets.py | 87 ++++++++++++++++++++++++++++++++++++
 2 files changed, 107 insertions(+), 4 deletions(-)
 create mode 100755 .gitlab-ci.d/pick-targets.py

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index d21b4a1fd4..aa2c52ab11 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -479,20 +479,36 @@ build-gprof-gcov:
   variables:
     IMAGE: ubuntu2004
     CONFIGURE_ARGS: --enable-gprof --enable-gcov
-    TARGETS: aarch64-softmmu ppc64-softmmu s390x-softmmu x86_64-softmmu
+    TARGETS: aarch64-softmmu ppc64-linux-user
   artifacts:
     expire_in: 1 days
     paths:
       - build
 
-check-gprof-gcov:
+# This is special as the target list is dynamic
+build-gcov:
+  extends: .native_build_job_template
+  needs:
+    job: amd64-ubuntu2004-container
+  before_script:
+    - TARGETS=$(.gitlab-ci.d/pick-targets.py)
+  variables:
+    IMAGE: ubuntu2004
+    CONFIGURE_ARGS: --enable-gcov
+  artifacts:
+    expire_in: 1 days
+    paths:
+      - build
+      
+# This is special
+check-gcov:
   extends: .native_test_job_template
   needs:
-    - job: build-gprof-gcov
+    - job: build-gcov
       artifacts: true
   variables:
     IMAGE: ubuntu2004
-    MAKE_CHECK_ARGS: check
+    MAKE_CHECK_ARGS: check check-avocado
   after_script:
     - cd build
     - gcovr --xml-pretty --exclude-unreachable-branches --print-summary
diff --git a/.gitlab-ci.d/pick-targets.py b/.gitlab-ci.d/pick-targets.py
new file mode 100755
index 0000000000..db1eff0119
--- /dev/null
+++ b/.gitlab-ci.d/pick-targets.py
@@ -0,0 +1,87 @@
+#!/usr/bin/env python3
+#
+# pick-targets: pick a set of targets that are worth testing.
+#
+# Running code coverage is too expensive to run over all the builds.
+# Try and figure out a subset of targets that would be worth running
+# for the files touched between origin/master and the current HEAD.
+#
+# Copyright (C) 2022 Linaro Ltd
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import os
+import os.path
+import sys
+import subprocess
+
+# Dumb mapping from a target directory name to a list of
+# targets. Should we bother for those we know we don't have compilers for?
+multi_targets = {
+    'arm'        : ['arm', 'aarch64'],
+    'i386'       : ['i386', 'x86_64'],
+    'microblaze' : ['microblaze' ], # no softmmu, 'microblazel' ],
+    'mips'       : ['mips', 'mips64', 'mips64el', 'mipsel' ],
+    'ppc'        : ['ppc', 'ppc64' ],
+    'riscv'      : ['riscv32', 'riscv64'],
+    'sh4'        : ['sh4', 'sh4eb'],
+    'sparc'      : ['sparc', 'sparc64'],
+    'xtensa'     : ['xtensa', 'xtensaeb']
+}
+
+def map_dir_to_targets(name):
+    if name in multi_targets:
+        return multi_targets[name]
+    else:
+        return name
+
+namespace = "qemu-project"
+if len(sys.argv) >= 2:
+    namespace = sys.argv[1]
+
+cwd = os.getcwd()
+reponame = os.path.basename(cwd)
+repourl = f"https://gitlab.com/{namespace}/{reponame}"
+
+# Add remote, fetch master and save the common ancestor
+subprocess.check_call(["git", "remote", "add", "pick-target", repourl])
+subprocess.check_call(["git", "fetch", "pick-target", "master"],
+                      stdout=subprocess.DEVNULL,
+                      stderr=subprocess.DEVNULL)
+
+ancestor = subprocess.check_output(["git", "merge-base",
+                                    "pick-target/master", "HEAD"],
+                                   universal_newlines=True)
+
+ancestor = ancestor.strip()
+
+subprocess.check_call(["git", "remote", "rm", "pick-target"])
+
+# calculate the diff and extract list of touched files
+diff = subprocess.check_output(["git", "diff", "--numstat",
+                                 f"{ancestor}..HEAD"])
+
+files = [l.split("\t")[2] for l in diff.decode().split("\n") if "\t" in l]
+
+# Build options to track
+system = False
+user = False
+targets = []
+
+for f in files:
+    if f.startswith("hw"):
+        system = True
+    if f.startswith("linux-user"):
+        user = True
+    if f.startswith("target"):
+        t = f.split("/")[1]
+        targets.extend(map_dir_to_targets(t))
+
+target_list = []
+for t in sorted(set(targets)):
+    if system:
+        target_list.append(f"{t}-softmmu")
+    if user:
+        target_list.append(f"{t}-linux-user")
+
+print(" ".join(target_list))
-- 
2.34.1


