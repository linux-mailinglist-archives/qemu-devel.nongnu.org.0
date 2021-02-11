Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA8431846E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 05:59:10 +0100 (CET)
Received: from localhost ([::1]:60152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA44L-0007j1-Gn
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 23:59:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lA40e-00048P-TG
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 23:55:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lA40Y-0002VA-NF
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 23:55:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613019313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iRxu5ZAzcnZYe3BVqCqZ+EjR4S+sz8chXAof/JvM+Ao=;
 b=Kp1iD21wkr4NUFE5CQ7AiQJ94gKwlvfrdsumIF/dwP0k+FuWNm5Alw4v4DK7DJ/LZXjCHx
 KP3UfdQzIs5MXWuLKmg3Z2uZk63sFtM2yhkkCNl7dwcdtZ6s+s3Jf4iNvRM1cbAiEeV54k
 iOjAd8wNnz9wFpAIDMeEoxt/vUD1r7E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-xgfevoRiNA-myu6GrpywpQ-1; Wed, 10 Feb 2021 23:55:11 -0500
X-MC-Unique: xgfevoRiNA-myu6GrpywpQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E173A5B38F;
 Thu, 11 Feb 2021 04:55:09 +0000 (UTC)
Received: from thuth.com (ovpn-112-46.ams2.redhat.com [10.36.112.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5A9F60BF1;
 Thu, 11 Feb 2021 04:55:05 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 1/5] travis.yml: Move gprof/gcov test across to gitlab
Date: Thu, 11 Feb 2021 05:54:51 +0100
Message-Id: <20210211045455.456371-2-thuth@redhat.com>
In-Reply-To: <20210211045455.456371-1-thuth@redhat.com>
References: <20210211045455.456371-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

[thuth: Add gcovr and bsdmainutils which are required for the
        coverage-summary.sh script to the ubuntu docker file,
        and use 'check' as test target]

Message-Id: <20201108204535.2319870-10-philmd@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210205091857.845389-2-thuth@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
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
index 28a83afb91..222858b553 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -467,6 +467,18 @@ check-deprecated:
     MAKE_CHECK_ARGS: check-tcg
   allow_failure: true
 
+# gprof/gcov are GCC features
+gprof-gcov:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: ubuntu2004
+    CONFIGURE_ARGS: --enable-gprof --enable-gcov
+    MAKE_CHECK_ARGS: check
+    TARGETS: aarch64-softmmu ppc64-softmmu s390x-softmmu x86_64-softmmu
+  timeout: 70m
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
index e6f1eca30f..cc8767d4b4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3233,7 +3233,7 @@ R: Philippe Mathieu-Daudé <philmd@redhat.com>
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


