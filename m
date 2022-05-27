Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C80B453660B
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 18:35:01 +0200 (CEST)
Received: from localhost ([::1]:43858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nucvU-0001VJ-M5
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 12:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nucI3-0004sM-8G
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:54:15 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:39724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nucHo-0005ig-7P
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:54:02 -0400
Received: by mail-wr1-x42b.google.com with SMTP id j25so6395919wrb.6
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 08:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hgos5Ctr54w/WcWfcrz87OKH7ldahQCsnQtpXZbTNlc=;
 b=iHQ+gLFaaDT6yI6DWIhI1a1Yg44FY2UaO429voEv15EkKIvgCn7D4WmwH5FJQ1Of4T
 GxxPbiCn9g58u551JQ8i3fc4yc0Ma4lPdfXIxkGQnMw/3uIdqgP71rZeLMpUAxP3NDWi
 RBBG+4OljQZS5LbCD0ZDIJUoE12PTamD/tjtYjmQUIWHyXG70kfJNQ3boJt0K1a6+n0/
 x5Nw4gADkX7HCS4CFbGKjchZQfgpFBodIe/JDHzDdzAoJhqS240Xu07pPeJ6iGBV00Ep
 lEfbpCCPPxTQ4Zsjvrby6FNG2xib6q1c93+aLJs2lflogycprV6euXhNDjW7AI0hbgls
 6egA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hgos5Ctr54w/WcWfcrz87OKH7ldahQCsnQtpXZbTNlc=;
 b=LLSBOj/aJ1v1Y9nqfkpAZ1pr8MH7S2Hiy5+keuDbRzG5k4z49KRc+qnj+Qxem5/p1M
 XdgMxb/a9TNQtSTghkgOc8omM7oqqkyrMqbgX3aT3U3/Lxl8soOaTFYyWzl+mNwVbzvh
 wWnLsLcWlZObU8TXLzjh/bIr8eHAS9FU+/xXAVlNP5wdJo9Eow/cJlMjdcw0QANjPbsy
 RY9tplT6eSf/Zd/EQasXPK6Ui/PpOrxJDXa8z8jPi+hBiVKe0Onf9EOpFJZzdB6MxfQM
 b6WGeNHVRhZeuSv/CBwTv8i82ud57XgqtQcOtMRHc/d/bf/fZOkDpIFd4kGos/DxPAC3
 3MSA==
X-Gm-Message-State: AOAM531Fp7qpmyTXZIe+xi2F5k1OYhA89qPtfOo4M2Fhu3qCupeTjAw6
 fJbepO1c/sI6ENH5t7N+qNtZPw==
X-Google-Smtp-Source: ABdhPJxx7OFdJbW0ilxkr9gwhvDLJpotWqheH/iDzOXRWWnyJwMdyip/HjpoGXlwx9FA7h/pRHVAGQ==
X-Received: by 2002:a5d:4b04:0:b0:210:18a:b676 with SMTP id
 v4-20020a5d4b04000000b00210018ab676mr10252543wrq.581.1653666838542; 
 Fri, 27 May 2022 08:53:58 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 10-20020a5d47aa000000b0020fe35aec4bsm2190544wrb.70.2022.05.27.08.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 08:53:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A89301FFD6;
 Fri, 27 May 2022 16:36:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v1 31/33] gitlab: convert build/container jobs to
 .base_job_template
Date: Fri, 27 May 2022 16:36:01 +0100
Message-Id: <20220527153603.887929-32-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220527153603.887929-1-alex.bennee@linaro.org>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Daniel P. Berrangé <berrange@redhat.com>

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
Message-Id: <20220526110705.59952-5-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/ci-jobs.rst.inc           | 19 +++++++++++++++++++
 .gitlab-ci.d/base.yml                | 22 ++++++++++++++++++++++
 .gitlab-ci.d/buildtest-template.yml  | 16 ++++------------
 .gitlab-ci.d/buildtest.yml           | 28 +++++++++++++---------------
 .gitlab-ci.d/container-cross.yml     |  6 ++----
 .gitlab-ci.d/container-template.yml  |  1 +
 .gitlab-ci.d/crossbuild-template.yml |  3 +++
 .gitlab-ci.d/windows.yml             |  1 +
 8 files changed, 65 insertions(+), 31 deletions(-)

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
index b381345dbc..73ecfabb8d 100644
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
@@ -77,15 +79,5 @@
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
index 147e667744..b7963498a3 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -40,15 +40,13 @@ armhf-debian-cross-container:
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
-- 
2.30.2


