Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FBA534E16
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 13:27:42 +0200 (CEST)
Received: from localhost ([::1]:56804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuBeX-00047t-Nn
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 07:27:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nuBKm-0007s0-99
 for qemu-devel@nongnu.org; Thu, 26 May 2022 07:07:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nuBKk-0003MF-5a
 for qemu-devel@nongnu.org; Thu, 26 May 2022 07:07:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653563233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ju5ZyeQNPJAUj0I2nP+HadNRw85D3ptqaovIHW+KnIQ=;
 b=J6y7kOdLOhDS1niUlnJPNJ8vxusGF4/O/S60kg9aS8eTv5QOLlZKMoSC5tNJS8M+nbA/MW
 q3UPv6udpfwNXPiMTGVIIyu9GPTlo5zg+GcBz2Q1EaRunndGelG+yVAn9rmz1t6ks1YHr+
 ZaQ/m0MtrmC6O1UecTWk729uSNLQX+8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-60-14__0n3zP36kiP7aNmzHAg-1; Thu, 26 May 2022 07:07:07 -0400
X-MC-Unique: 14__0n3zP36kiP7aNmzHAg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A5503802B8B;
 Thu, 26 May 2022 11:07:07 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5747C1731B;
 Thu, 26 May 2022 11:07:07 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 4/5] gitlab: convert build/container jobs to .base_job_template
Date: Thu, 26 May 2022 07:07:04 -0400
Message-Id: <20220526110705.59952-5-berrange@redhat.com>
In-Reply-To: <20220526110705.59952-1-berrange@redhat.com>
References: <20220526110705.59952-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This converts the main build and container jobs to use the
base job rules, defining the following new variables

 - QEMU_JOB_SKIPPED - jobs that are known to be currently
   broken and should not be run. Can still be manually
   launched if desired.

 - QEMU_JOB_AVOCADO - jobs that run the Avocado integration
   test harness.

 - QEMU_JOB_PUBLISH - jobs that publish content after the
   branch is merged upstream

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitlab-ci.d/base.yml                | 22 ++++++++++++++++++++++
 .gitlab-ci.d/buildtest-template.yml  | 16 ++++------------
 .gitlab-ci.d/buildtest.yml           | 28 +++++++++++++---------------
 .gitlab-ci.d/container-cross.yml     |  6 ++----
 .gitlab-ci.d/container-template.yml  |  1 +
 .gitlab-ci.d/crossbuild-template.yml |  3 +++
 .gitlab-ci.d/windows.yml             |  1 +
 docs/devel/ci-jobs.rst.inc           | 19 +++++++++++++++++++
 8 files changed, 65 insertions(+), 31 deletions(-)

diff --git a/.gitlab-ci.d/base.yml b/.gitlab-ci.d/base.yml
index 9a0b8d7f97..6a918abbda 100644
--- a/.gitlab-ci.d/base.yml
+++ b/.gitlab-ci.d/base.yml
@@ -16,10 +16,22 @@
     - if: '$QEMU_JOB_CIRRUS && ($CIRRUS_GITHUB_REPO == "" || $CIRRUS_API_TOKEN == "")'
       when: never
 
+    # Publishing jobs should only run on the default branch in upstream
+    - if: '$QEMU_JOB_PUBLISH == "1" && $CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH != $CI_DEFAULT_BRANCH'
+      when: never
+
+    # Non-publishing jobs should only run on staging branches in upstream
+    - if: '$QEMU_JOB_PUBLISH != "1" && $CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH !~ /staging/'
+      when: never
+
     # Jobs only intended for forks should always be skipped on upstram
     - if: '$QEMU_JOB_ONLY_FORKS == "1" && $CI_PROJECT_NAMESPACE == "qemu-project"'
       when: never
 
+    # Avocado jobs don't run in forks unless $QEMU_CI_AVOCADO_TESTING is set
+    - if: '$QEMU_JOB_AVOCADO && $QEMU_CI_AVOCADO_TESTING != "1" && $CI_PROJECT_NAMESPACE != "qemu-project"'
+      when: never
+
 
     #############################################################
     # Stage 2: fine tune execution of jobs in specific scenarios
@@ -31,6 +43,16 @@
       when: manual
       allow_failure: true
 
+    # Skipped jobs should not be run unless manually triggered
+    - if: '$QEMU_JOB_SKIPPED'
+      when: manual
+      allow_failure: true
+
+    # Avocado jobs can be manually start in forks if $QEMU_CI_AVOCADO_TESTING is unset
+    - if: '$QEMU_JOB_AVOCADO && $CI_PROJECT_NAMESPACE != "qemu-project"'
+      when: manual
+      allow_failure: true
+
 
     #############################################################
     # Stage 3: catch all logic applying to any job not matching
diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index dc6d67aacf..1874c07a4b 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -1,4 +1,5 @@
 .native_build_job_template:
+  extends: .base_job_template
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   before_script:
@@ -27,6 +28,7 @@
       fi
 
 .common_test_job_template:
+  extends: .base_job_template
   stage: test
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   script:
@@ -75,15 +77,5 @@
   after_script:
     - cd build
     - du -chs ${CI_PROJECT_DIR}/avocado-cache
-  rules:
-    # Only run these jobs if running on the mainstream namespace,
-    # or if the user set the QEMU_CI_AVOCADO_TESTING variable (either
-    # in its namespace setting or via git-push option, see documentation
-    # in /.gitlab-ci.yml of this repository).
-    - if: '$CI_PROJECT_NAMESPACE == "qemu-project"'
-      when: on_success
-    - if: '$QEMU_CI_AVOCADO_TESTING'
-      when: on_success
-    # Otherwise, set to manual (the jobs are created but not run).
-    - when: manual
-      allow_failure: true
+  variables:
+    QEMU_JOB_AVOCADO: 1
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index e9620c3074..ecac3ec50c 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -360,12 +360,11 @@ build-cfi-aarch64:
     expire_in: 2 days
     paths:
       - build
-  rules:
+  variables:
     # FIXME: This job is often failing, likely due to out-of-memory problems in
     # the constrained containers of the shared runners. Thus this is marked as
-    # manual until the situation has been solved.
-    - when: manual
-      allow_failure: true
+    # skipped until the situation has been solved.
+    QEMU_JOB_SKIPPED: 1
 
 check-cfi-aarch64:
   extends: .native_test_job_template
@@ -402,12 +401,11 @@ build-cfi-ppc64-s390x:
     expire_in: 2 days
     paths:
       - build
-  rules:
+  variables:
     # FIXME: This job is often failing, likely due to out-of-memory problems in
     # the constrained containers of the shared runners. Thus this is marked as
-    # manual until the situation has been solved.
-    - when: manual
-      allow_failure: true
+    # skipped until the situation has been solved.
+    QEMU_JOB_SKIPPED: 1
 
 check-cfi-ppc64-s390x:
   extends: .native_test_job_template
@@ -579,6 +577,7 @@ build-without-default-features:
     MAKE_CHECK_ARGS: check-unit check-qtest SPEED=slow
 
 build-libvhost-user:
+  extends: .base_job_template
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/fedora:latest
   needs:
@@ -595,10 +594,13 @@ build-tools-and-docs-debian:
   extends: .native_build_job_template
   needs:
     job: amd64-debian-container
+    # when running on 'master' we use pre-existing container
+    optional: true
   variables:
     IMAGE: debian-amd64
     MAKE_CHECK_ARGS: check-unit check-softfloat ctags TAGS cscope
     CONFIGURE_ARGS: --disable-system --disable-user --enable-docs --enable-tools
+    QEMU_JOB_PUBLISH: 1
   artifacts:
     expire_in: 2 days
     paths:
@@ -618,6 +620,7 @@ build-tools-and-docs-debian:
 # that users can see the results of their commits, regardless
 # of what topic branch they're currently using
 pages:
+  extends: .base_job_template
   image: $CI_REGISTRY_IMAGE/qemu/debian-amd64:latest
   stage: test
   needs:
@@ -635,10 +638,5 @@ pages:
   artifacts:
     paths:
       - public
-  rules:
-    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH'
-      when: on_success
-    - if: '$CI_PROJECT_NAMESPACE == "qemu-project"'
-      when: never
-    - if: '$CI_PROJECT_NAMESPACE != "qemu-project"'
-      when: on_success
+  variables:
+    QEMU_JOB_PUBLISH: 1
diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index e622ac2d21..90ecfd8da0 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -42,15 +42,13 @@ armhf-debian-cross-container:
 # We never want to build hexagon in the CI system and by default we
 # always want to refer to the master registry where it lives.
 hexagon-cross-container:
+  extends: .base_job_template
   image: docker:stable
   stage: containers
-  rules:
-    - if: '$CI_PROJECT_NAMESPACE == "qemu-project"'
-      when: never
-    - when: always
   variables:
     NAME: debian-hexagon-cross
     GIT_DEPTH: 1
+    QEMU_JOB_ONLY_FORKS: 1
   services:
     - docker:dind
   before_script:
diff --git a/.gitlab-ci.d/container-template.yml b/.gitlab-ci.d/container-template.yml
index 1baecd9460..c434b9c8f3 100644
--- a/.gitlab-ci.d/container-template.yml
+++ b/.gitlab-ci.d/container-template.yml
@@ -1,4 +1,5 @@
 .container_job_template:
+  extends: .base_job_template
   image: docker:stable
   stage: containers
   services:
diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
index 29c3c2b826..28b2142ec2 100644
--- a/.gitlab-ci.d/crossbuild-template.yml
+++ b/.gitlab-ci.d/crossbuild-template.yml
@@ -1,4 +1,5 @@
 .cross_system_build_job:
+  extends: .base_job_template
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   timeout: 80m
@@ -24,6 +25,7 @@
 # KVM), and set extra options (such disabling other accelerators) via the
 # $EXTRA_CONFIGURE_OPTS variable.
 .cross_accel_build_job:
+  extends: .base_job_template
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   timeout: 30m
@@ -36,6 +38,7 @@
     - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
 
 .cross_user_build_job:
+  extends: .base_job_template
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   script:
diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index cf7724b8e5..1b2ede49e1 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -1,4 +1,5 @@
 .shared_msys2_builder:
+  extends: .base_job_template
   tags:
   - shared-windows
   - windows
diff --git a/docs/devel/ci-jobs.rst.inc b/docs/devel/ci-jobs.rst.inc
index 4c7e30ab08..0b4926e537 100644
--- a/docs/devel/ci-jobs.rst.inc
+++ b/docs/devel/ci-jobs.rst.inc
@@ -73,6 +73,25 @@ The job results are only of interest to contributors prior to
 submitting code. They are not required as part of the gating
 CI pipeline.
 
+QEMU_JOB_SKIPPED
+~~~~~~~~~~~~~~~~
+
+The job is not reliably successsful in general, so is not
+currently suitable to be run by default. Ideally this should
+be a temporary marker until the problems can be addressed, or
+the job permanently removed.
+
+QEMU_JOB_PUBLISH
+~~~~~~~~~~~~~~~~
+
+The job is for publishing content after a branch has been
+merged into the upstream default branch.
+
+QEMU_JOB_AVOCADO
+~~~~~~~~~~~~~~~~
+
+The job runs the Avocado integration test suite
+
 Contributor controlled runtime variables
 ----------------------------------------
 
-- 
2.36.1


