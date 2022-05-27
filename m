Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F7A53659D
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 18:03:08 +0200 (CEST)
Received: from localhost ([::1]:38966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nucQd-0007ZH-91
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 12:03:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc8B-0002aE-TL
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:44:03 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:43523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc89-0003rK-KK
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:44:03 -0400
Received: by mail-wr1-x431.google.com with SMTP id q20so1830265wrc.10
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 08:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fcgdNHYbJF6gNvvfYsIzWrSC0SChPpOVfK1u1mQ60Kk=;
 b=XG8QKu+D0Z+JZ5FalZ3T/dV+8mhwnlnhxhoFxVjoBPPS4X++bVRYylCIOS7Gf4drp/
 rbdYnN/r2lNlU6ZjqMoL1H7K9qgqVgprpdaiiYh9aT0K7W3QP6JC8mAgw5cycsFy90yq
 zutxS2c0xptsv7Dsw6U9M9iA5dvMUWch/fXuze3XycgkR4YqVUaLHRGyqA3hS1D+pj/K
 KCQI/gahyNK0ZH+Lzc1lFxLe7ViumQfDaeGNXxFQpjdsJxoEfu++KhKJfK90yWwyvEwL
 nh8+y8nlt/I9RnNRnI5q0zGvHzVsh222M3Kbu800czUpnDVSPOhvjb/IxClJNv4bB270
 v32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fcgdNHYbJF6gNvvfYsIzWrSC0SChPpOVfK1u1mQ60Kk=;
 b=UjxtaNURfbDwpuhyxGeqs2XBmZ+UVVncckjU30Tw392VVq00iOXaUOvFzqYLaqhO8v
 Aem1TSGbFALlCDt1YKgPTbBklOsTh/HEV+Aw311wEgjMO1C3DOV7JrTYExDFMaka/WYo
 4yf3oQlV5ll5L0rULHIYcjzCZaNxTbGOoQtSN6hLX7dbGQz3sA4Ql6car2jtt/Vh+ViA
 a1xVtmXRumVJ6C8uEtXhePTnUtXpZfDfJnqpNJVyHFYetyfype/vz+NnqyHG2CjD27R6
 CKtvFYo6w252mqCSO3FveA6U7ssnLoD7reNNVr0bdcTfbZ3i+VpzzzIlxJKF6GordUxL
 R3jg==
X-Gm-Message-State: AOAM532RDArtopxQT1Uw08MJgO2d62ei5mPd2W9+Sspl6txlUeFfW7hG
 ZuqMrn1BqkR4wzF8VOYrqoaOIg==
X-Google-Smtp-Source: ABdhPJx+laBlFJpYmkDXDU/yMMjbtRBsKNoSpaYHU/cBcYTNSAkw8tOGA/w5SObk1II3IKQrmFORKw==
X-Received: by 2002:a5d:5085:0:b0:20d:5f6:63fa with SMTP id
 a5-20020a5d5085000000b0020d05f663famr35347325wrt.679.1653666240093; 
 Fri, 27 May 2022 08:44:00 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 b6-20020adfd1c6000000b0020d0f111241sm2467852wrd.24.2022.05.27.08.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 08:43:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6D5291FFB7;
 Fri, 27 May 2022 16:36:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v1 29/33] gitlab: convert Cirrus jobs to .base_job_template
Date: Fri, 27 May 2022 16:35:59 +0100
Message-Id: <20220527153603.887929-30-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220527153603.887929-1-alex.bennee@linaro.org>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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

This folds the Cirrus job rules into the base job
template, introducing two new variables

  - QEMU_JOB_CIRRUS - identifies the job as making
    use of Cirrus CI via cirrus-run

  - QEMU_JOB_OPTIONAL - identifies the job as one
    that is not run by default, primarily due to
    resource constraints. It can be manually invoked
    by users if they wish to validate that scenario.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220526110705.59952-3-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/ci-jobs.rst.inc | 14 ++++++++++++++
 .gitlab-ci.d/base.yml      |  9 +++++++++
 .gitlab-ci.d/cirrus.yml    | 16 ++++++++--------
 3 files changed, 31 insertions(+), 8 deletions(-)

diff --git a/docs/devel/ci-jobs.rst.inc b/docs/devel/ci-jobs.rst.inc
index eb6a9e6122..a539f502da 100644
--- a/docs/devel/ci-jobs.rst.inc
+++ b/docs/devel/ci-jobs.rst.inc
@@ -52,6 +52,20 @@ Maintainer controlled job variables
 The following variables may be set when defining a job in the
 CI configuration file.
 
+QEMU_JOB_CIRRUS
+~~~~~~~~~~~~~~~
+
+The job makes use of Cirrus CI infrastructure, requiring the
+configuration setup for cirrus-run to be present in the repository
+
+QEMU_JOB_OPTIONAL
+~~~~~~~~~~~~~~~~~
+
+The job is expected to be successful in general, but is not run
+by default due to need to conserve limited CI resources. It is
+available to be started manually by the contributor in the CI
+pipelines UI.
+
 Contributor controlled runtime variables
 ----------------------------------------
 
diff --git a/.gitlab-ci.d/base.yml b/.gitlab-ci.d/base.yml
index 10eb6ab8bc..5734caf9fe 100644
--- a/.gitlab-ci.d/base.yml
+++ b/.gitlab-ci.d/base.yml
@@ -12,12 +12,21 @@
     # want jobs to run
     #############################################################
 
+    # Cirrus jobs can't run unless the creds / target repo are set
+    - if: '$QEMU_JOB_CIRRUS && ($CIRRUS_GITHUB_REPO == "" || $CIRRUS_API_TOKEN == "")'
+      when: never
+
 
     #############################################################
     # Stage 2: fine tune execution of jobs in specific scenarios
     # where the catch all logic is inapprorpaite
     #############################################################
 
+    # Optional jobs should not be run unless manually triggered
+    - if: '$QEMU_JOB_OPTIONAL'
+      when: manual
+      allow_failure: true
+
 
     #############################################################
     # Stage 3: catch all logic applying to any job not matching
diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
index b96b22e269..609c364308 100644
--- a/.gitlab-ci.d/cirrus.yml
+++ b/.gitlab-ci.d/cirrus.yml
@@ -11,6 +11,7 @@
 # special care, because we can't just override it at the GitLab CI job
 # definition level or we risk breaking it completely.
 .cirrus_build_job:
+  extends: .base_job_template
   stage: build
   image: registry.gitlab.com/libvirt/libvirt-ci/cirrus-run:master
   needs: []
@@ -40,11 +41,8 @@
       <.gitlab-ci.d/cirrus/build.yml >.gitlab-ci.d/cirrus/$NAME.yml
     - cat .gitlab-ci.d/cirrus/$NAME.yml
     - cirrus-run -v --show-build-log always .gitlab-ci.d/cirrus/$NAME.yml
-  rules:
-    # Allow on 'staging' branch and 'stable-X.Y-staging' branches only
-    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH !~ /staging/'
-      when: never
-    - if: "$CIRRUS_GITHUB_REPO && $CIRRUS_API_TOKEN"
+  variables:
+    QEMU_JOB_CIRRUS: 1
 
 x64-freebsd-12-build:
   extends: .cirrus_build_job
@@ -90,11 +88,11 @@ x64-macos-11-base-build:
 
 # The following jobs run VM-based tests via KVM on a Linux-based Cirrus-CI job
 .cirrus_kvm_job:
+  extends: .base_job_template
   stage: build
   image: registry.gitlab.com/libvirt/libvirt-ci/cirrus-run:master
   needs: []
   timeout: 80m
-  allow_failure: true
   script:
     - sed -e "s|[@]CI_REPOSITORY_URL@|$CI_REPOSITORY_URL|g"
           -e "s|[@]CI_COMMIT_REF_NAME@|$CI_COMMIT_REF_NAME|g"
@@ -105,8 +103,10 @@ x64-macos-11-base-build:
       <.gitlab-ci.d/cirrus/kvm-build.yml >.gitlab-ci.d/cirrus/$NAME.yml
     - cat .gitlab-ci.d/cirrus/$NAME.yml
     - cirrus-run -v --show-build-log always .gitlab-ci.d/cirrus/$NAME.yml
-  rules:
-    - when: manual
+  variables:
+    QEMU_JOB_CIRRUS: 1
+    QEMU_JOB_OPTIONAL: 1
+
 
 x86-netbsd:
   extends: .cirrus_kvm_job
-- 
2.30.2


