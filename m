Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D8E476467
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 22:15:37 +0100 (CET)
Received: from localhost ([::1]:44682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxbce-0005TB-Kf
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 16:15:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxbX2-0004ow-Tv
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:09:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxbX0-0006f0-Hj
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:09:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639602576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Augc1vxhk4vbRdd5b+V4ceILyP5xAipib68NlQE06lQ=;
 b=bzz5ubzKQi1GKBdmXaaGSSO1qu3aLTSJUytnhiqb8PccattY2M5X+08cOZYsh+06XKp4If
 Vg9jUQee0oKSFXd4rYhQ5pfZoBe3hkyl0LGvvA+3uq2z4Z4PHXlekkpaDcC5BFGwVziKuO
 kd21zleRgVxVpp/4A13qbwoLbdbmL38=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-231-mjyGD3zwOU2l_vz3Tr9mVA-1; Wed, 15 Dec 2021 16:09:32 -0500
X-MC-Unique: mjyGD3zwOU2l_vz3Tr9mVA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22CAF1B2C98D;
 Wed, 15 Dec 2021 21:09:31 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00B195F4E9;
 Wed, 15 Dec 2021 21:08:55 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC qemu.qmp PATCH 12/24] GitLab CI: Add check-dco script
Date: Wed, 15 Dec 2021 16:06:22 -0500
Message-Id: <20211215210634.3779791-13-jsnow@redhat.com>
In-Reply-To: <20211215210634.3779791-1-jsnow@redhat.com>
References: <20211215210634.3779791-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Borrowed with minor modifications from qemu.git.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 .gitlab-ci.d/check-dco.py | 98 +++++++++++++++++++++++++++++++++++++++
 .gitlab-ci.d/index.yml    |  2 +
 .gitlab-ci.d/test.yml     | 15 ++++++
 3 files changed, 115 insertions(+)
 create mode 100755 .gitlab-ci.d/check-dco.py
 create mode 100644 .gitlab-ci.d/test.yml

diff --git a/.gitlab-ci.d/check-dco.py b/.gitlab-ci.d/check-dco.py
new file mode 100755
index 0000000..747cd54
--- /dev/null
+++ b/.gitlab-ci.d/check-dco.py
@@ -0,0 +1,98 @@
+#!/usr/bin/env python3
+#
+# check-dco.py: validate all commits are signed off
+#
+# Copyright (C) 2020 Red Hat, Inc.
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import argparse
+import os
+import os.path
+import sys
+import subprocess
+
+parser = argparse.ArgumentParser("check-dco")
+parser.add_argument(
+    "repourl",
+    help="upstream repo URL"
+)
+parser.add_argument(
+    "refspec",
+    help="upstream's default branch (or other refspec)"
+)
+args = parser.parse_args()
+
+
+subprocess.check_call(["git", "remote", "add", "check-dco", args.repourl])
+subprocess.check_call(["git", "fetch", "check-dco", args.refspec],
+                      stdout=subprocess.DEVNULL,
+                      stderr=subprocess.DEVNULL)
+
+ancestor = subprocess.check_output(
+    ["git", "merge-base", f"check-dco/{args.refspec}", "HEAD"],
+    universal_newlines=True)
+ancestor = ancestor.strip()
+
+subprocess.check_call(["git", "remote", "rm", "check-dco"])
+
+errors = False
+
+print("\nChecking for 'Signed-off-by: NAME <EMAIL>' " +
+      "on all commits since %s...\n" % ancestor)
+
+log = subprocess.check_output(["git", "log", "--format=%H %s",
+                               ancestor + "..."],
+                              universal_newlines=True)
+
+if log == "":
+    commits = []
+else:
+    commits = [[c[0:40], c[41:]] for c in log.strip().split("\n")]
+
+for sha, subject in commits:
+
+    msg = subprocess.check_output(["git", "show", "-s", sha],
+                                  universal_newlines=True)
+    lines = msg.strip().split("\n")
+
+    print("🔍 %s %s" % (sha, subject))
+    sob = False
+    for line in lines:
+        if "Signed-off-by:" in line:
+            sob = True
+            if "localhost" in line:
+                print("    ❌ FAIL: bad email in %s" % line)
+                errors = True
+
+    if not sob:
+        print("    ❌ FAIL missing Signed-off-by tag")
+        errors = True
+
+if errors:
+    print("""
+
+❌ ERROR: One or more commits are missing a valid Signed-off-By tag.
+
+
+This project requires all contributors to assert that their contributions
+are provided in compliance with the terms of the Developer's Certificate
+of Origin 1.1 (DCO):
+
+  https://developercertificate.org/
+
+To indicate acceptance of the DCO every commit must have a tag
+
+  Signed-off-by: REAL NAME <EMAIL>
+
+This can be achieved by passing the "-s" flag to the "git commit" command.
+
+To bulk update all commits on current branch "git rebase" can be used:
+
+  git rebase -i master -x 'git commit --amend --no-edit -s'
+
+""")
+
+    sys.exit(1)
+
+sys.exit(0)
diff --git a/.gitlab-ci.d/index.yml b/.gitlab-ci.d/index.yml
index cf61dec..cd6a65e 100644
--- a/.gitlab-ci.d/index.yml
+++ b/.gitlab-ci.d/index.yml
@@ -4,7 +4,9 @@
 stages:
   - containers
   - build
+  - test
 
 include:
   - local: '/.gitlab-ci.d/containers.yml'
   - local: '/.gitlab-ci.d/build.yml'
+  - local: '/.gitlab-ci.d/test.yml'
diff --git a/.gitlab-ci.d/test.yml b/.gitlab-ci.d/test.yml
new file mode 100644
index 0000000..35fa105
--- /dev/null
+++ b/.gitlab-ci.d/test.yml
@@ -0,0 +1,15 @@
+check-dco:
+  stage: test
+  image: $CI_REGISTRY_IMAGE/python:latest
+  needs:
+    job: python-container
+  script:
+    - .gitlab-ci.d/check-dco.py
+      "https://gitlab.com/jsnow/qemu.qmp.git"
+      "main"
+  variables:
+    GIT_DEPTH: 1000
+  rules:
+    - if: '$CI_PROJECT_NAMESPACE == "jsnow" && $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH'
+      when: never
+    - when: on_success
-- 
2.31.1


