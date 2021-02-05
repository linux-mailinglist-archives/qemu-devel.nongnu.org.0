Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1212731079E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 10:22:34 +0100 (CET)
Received: from localhost ([::1]:57580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7xJx-0004Fa-1I
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 04:22:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7xGk-0002oV-6D
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 04:19:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7xGi-0007q4-Fm
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 04:19:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612516751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2tV/Dz5hr1kOvPpm8P8sKUKbYCIGeTWccUfWO4aOqHc=;
 b=N5qGHOkmzPdj9JOX0q3r7/6tS1B+aO1nZq6hSTbN83XnohONqV/TaocOwHSwcBqu5bTodz
 X9VjbEN7DBMqBNQ8jAyhlvJL8/NMhOI6oFF3fYFDbBCQrycf5z8Y6Y0nj4EeaFCCsnKcOH
 LdG5O2qQvHWkn0oy7ILO5hOWYn68dOM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-2_6JEQ_WPWmH1t-zKLq6kw-1; Fri, 05 Feb 2021 04:19:09 -0500
X-MC-Unique: 2_6JEQ_WPWmH1t-zKLq6kw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19B92CE647;
 Fri,  5 Feb 2021 09:19:08 +0000 (UTC)
Received: from thuth.com (ovpn-112-46.ams2.redhat.com [10.36.112.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 42EC65D9CC;
 Fri,  5 Feb 2021 09:19:04 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 1/5] travis.yml: Move gprof/gcov test across to gitlab
Date: Fri,  5 Feb 2021 10:18:53 +0100
Message-Id: <20210205091857.845389-2-thuth@redhat.com>
In-Reply-To: <20210205091857.845389-1-thuth@redhat.com>
References: <20210205091857.845389-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Willian Rampazzo <wrampazz@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Similarly to commit 8cdb2cef3f1, move the gprof/gcov test to GitLab.

The coverage-summary.sh script is not Travis-CI specific, make it
generic.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201108204535.2319870-10-philmd@redhat.com>
[thuth: Add gcovr and bsdmainutils which are required for the
        coverage-summary.sh script to the ubuntu docker file,
        and use 'check' as test target]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.yml                             | 12 ++++++++++++
 .travis.yml                                | 15 ---------------
 MAINTAINERS                                |  2 +-
 scripts/{travis => ci}/coverage-summary.sh |  2 +-
 tests/docker/dockerfiles/ubuntu2004.docker |  2 ++
 5 files changed, 16 insertions(+), 17 deletions(-)
 rename scripts/{travis => ci}/coverage-summary.sh (92%)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 7c0db64710..1070efce3f 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -468,6 +468,18 @@ check-deprecated:
     MAKE_CHECK_ARGS: check-tcg
   allow_failure: true
 
+# gprof/gcov are GCC features
+gprof-gcov:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: ubuntu2004
+    CONFIGURE_ARGS: --enable-gprof --enable-gcov
+    MAKE_CHECK_ARGS: check
+    TARGETS: aarch64-softmmu mips64-softmmu ppc64-softmmu
+             riscv64-softmmu s390x-softmmu x86_64-softmmu
+  after_script:
+    - ${CI_PROJECT_DIR}/scripts/ci/coverage-summary.sh
+
 build-oss-fuzz:
   <<: *native_build_job_definition
   variables:
diff --git a/.travis.yml b/.travis.yml
index 5f1dea873e..05fa1ca905 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -52,7 +52,6 @@ addons:
       - ninja-build
       - sparse
       - uuid-dev
-      - gcovr
       # Tests dependencies
       - genisoimage
 
@@ -166,20 +165,6 @@ jobs:
       compiler: clang
 
 
-    # gprof/gcov are GCC features
-    - name: "GCC gprof/gcov"
-      dist: bionic
-      addons:
-        apt:
-          packages:
-            - ninja-build
-      env:
-        - CONFIG="--enable-gprof --enable-gcov --disable-libssh
-                  --target-list=${MAIN_SOFTMMU_TARGETS}"
-      after_success:
-        - ${SRC_DIR}/scripts/travis/coverage-summary.sh
-
-
     # Using newer GCC with sanitizers
     - name: "GCC9 with sanitizers (softmmu)"
       dist: bionic
diff --git a/MAINTAINERS b/MAINTAINERS
index 00626941f1..472e54f786 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3203,7 +3203,7 @@ R: Philippe Mathieu-Daudé <philmd@redhat.com>
 S: Maintained
 F: .github/lockdown.yml
 F: .travis.yml
-F: scripts/travis/
+F: scripts/ci/
 F: .shippable.yml
 F: tests/docker/
 F: tests/vm/
diff --git a/scripts/travis/coverage-summary.sh b/scripts/ci/coverage-summary.sh
similarity index 92%
rename from scripts/travis/coverage-summary.sh
rename to scripts/ci/coverage-summary.sh
index d7086cf9ca..8d9fb4de40 100755
--- a/scripts/travis/coverage-summary.sh
+++ b/scripts/ci/coverage-summary.sh
@@ -3,7 +3,7 @@
 # Author: Alex Bennée <alex.bennee@linaro.org>
 #
 # Summerise the state of code coverage with gcovr and tweak the output
-# to be more sane on Travis hosts. As we expect to be executed on a
+# to be more sane on CI runner. As we expect to be executed on a
 # throw away CI instance we do spam temp files all over the shop. You
 # most likely don't want to execute this script but just call gcovr
 # directly. See also "make coverage-report"
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 8519584d2b..9750016e51 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -1,8 +1,10 @@
 FROM ubuntu:20.04
 ENV PACKAGES flex bison \
+    bsdmainutils \
     ccache \
     clang-10\
     gcc \
+    gcovr \
     genisoimage \
     gettext \
     git \
-- 
2.27.0


