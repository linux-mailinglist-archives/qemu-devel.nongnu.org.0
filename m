Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5E826FE86
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Sep 2020 15:32:01 +0200 (CEST)
Received: from localhost ([::1]:56602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJGUa-0000Pm-49
	for lists+qemu-devel@lfdr.de; Fri, 18 Sep 2020 09:32:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kJGS0-0007Wy-Ki
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 09:29:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kJGRy-0002TL-6M
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 09:29:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600435757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z+d61B3dqHmc7ZfZm9cSPj/X1aJ3cLn0k1+yDMTMLxQ=;
 b=bngdDT/CI6YcbjqR7B+c3GRHhM15BgPOjRvLfFr1y848dTes/bWXM43hq3VNFzmEEPWLPK
 +WJDtgzotyQnYU5VAR5UTNBtP0aWKbaHVa8fpQho9p3uwZdaLdXkGs2DjQeMuijAA5zVIc
 4SQlhuc5mp3jFRE5GGMcebcWOvbSU6w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-s67b24rrMG6ma3o3MizHtA-1; Fri, 18 Sep 2020 09:29:12 -0400
X-MC-Unique: s67b24rrMG6ma3o3MizHtA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83C49AFD63;
 Fri, 18 Sep 2020 13:29:11 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-199.ams2.redhat.com
 [10.36.114.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D27849CBA;
 Fri, 18 Sep 2020 13:29:09 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] gitlab: add a CI job for running checkpatch.pl
Date: Fri, 18 Sep 2020 14:29:01 +0100
Message-Id: <20200918132903.1848939-2-berrange@redhat.com>
In-Reply-To: <20200918132903.1848939-1-berrange@redhat.com>
References: <20200918132903.1848939-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/18 01:32:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This job is advisory since it is expected that certain patches will fail
the style checks and checkpatch.pl provides no way to mark exceptions to
the rules.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitlab-ci.d/check-patch.py | 48 +++++++++++++++++++++++++++++++++++++
 .gitlab-ci.yml              | 12 ++++++++++
 2 files changed, 60 insertions(+)
 create mode 100755 .gitlab-ci.d/check-patch.py

diff --git a/.gitlab-ci.d/check-patch.py b/.gitlab-ci.d/check-patch.py
new file mode 100755
index 0000000000..5a14a25b13
--- /dev/null
+++ b/.gitlab-ci.d/check-patch.py
@@ -0,0 +1,48 @@
+#!/usr/bin/env python3
+#
+# check-patch.py: run checkpatch.pl across all commits in a branch
+#
+# Copyright (C) 2020 Red Hat, Inc.
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import os
+import os.path
+import sys
+import subprocess
+
+namespace = "qemu-project"
+if len(sys.argv) >= 2:
+    namespace = sys.argv[1]
+
+cwd = os.getcwd()
+reponame = os.path.basename(cwd)
+repourl = "https://gitlab.com/%s/%s.git" % (namespace, reponame)
+
+# GitLab CI environment does not give us any direct info about the
+# base for the user's branch. We thus need to figure out a common
+# ancestor between the user's branch and current git master.
+subprocess.check_call(["git", "remote", "add", "check-patch", repourl])
+subprocess.check_call(["git", "fetch", "check-patch", "master"],
+                      stdout=subprocess.DEVNULL,
+                      stderr=subprocess.DEVNULL)
+
+ancestor = subprocess.check_output(["git", "merge-base",
+                                    "check-patch/master", "HEAD"],
+                                   universal_newlines=True)
+
+ancestor = ancestor.strip()
+
+subprocess.check_call(["git", "remote", "rm", "check-patch"])
+
+errors = False
+
+print("\nChecking all commits since %s...\n" % ancestor)
+
+ret = subprocess.run(["scripts/checkpatch.pl", ancestor + "..."])
+
+if ret.returncode != 0:
+    print("    ❌ FAIL one or more commits failed scripts/checkpatch.pl")
+    sys.exit(1)
+
+sys.exit(0)
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a18e18b57e..3ed724c720 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -369,3 +369,15 @@ check-crypto-only-gnutls:
   variables:
     IMAGE: centos7
     MAKE_CHECK_ARGS: check
+
+
+check-patch:
+  stage: test
+  image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
+  script: .gitlab-ci.d/check-patch.py
+  except:
+    variables:
+      - $CI_PROJECT_NAMESPACE == 'qemu-project' && $CI_COMMIT_BRANCH == 'master'
+  variables:
+    GIT_DEPTH: 1000
+  allow_failure: true
-- 
2.26.2


