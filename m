Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAF45365AC
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 18:07:44 +0200 (CEST)
Received: from localhost ([::1]:47604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nucV5-0005da-91
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 12:07:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc8d-0003eu-4N
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:44:31 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc8W-0003rz-PL
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:44:30 -0400
Received: by mail-wr1-x42c.google.com with SMTP id l30so6359511wrb.8
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 08:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HdiUEMjMYGrvyNsENub2j4h95C65fH2HJ/5Oupo3Ekk=;
 b=ugrhx82Wa3PTIi++EvH0WSXXPTeeWFVNXFqMkC6isl/tiimrC4abHwoisP2SEfCQYk
 zrCN6c2n4DSJqnFqHDdXuxhRheUhI0Ssm6IYI48wHuz42j2cxjJm1bE4c6ltmsiDJz+P
 mEKrOmc5Zqk4rWcAgW+xqCDZarrdHV859PUFPfr8qHgRK0BCsdpQOrVQvc/sTBcRTCmy
 Pvc2U9s6Vbrbo7DNQ/bAcTwrF8ykLLdkqKJCHBtlz2KpzsLigLaiAIFEMvJTZ6qdkwKE
 SzI2UaNrr86CIFrwdFDaNzrZbgItlGza/FysA0Caa2MobMN4OB1jQhNadFLCXZve+BB2
 fJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HdiUEMjMYGrvyNsENub2j4h95C65fH2HJ/5Oupo3Ekk=;
 b=thJ6oKCEXcsEGvhB0OqrOntkOEhAjqOFaaLe9S3xY6yCeB0m9uzpZHnT+b5DfNgTWN
 UX/zi1c5rjRqpyYkvM59W18W2uBNR4HKXtkRym1SFanh9KpkmW/HiX4J8OUerxmReM0L
 8kTsouAVC+mh37qeQAQyTcElNX1xASJTQF241POHM5MsNL7QhP1toYYSNu/U6MD3Xelr
 NncbKUlqLV2HxU8EZiAXtqul0+hPQX5JWAEy3a18BA/LELf5tYijWdUBGUveShFVf5xd
 dBgru3OSGoP/eh8Tv5UzB+1hxhk4EU3KoLSbrJxwboiscBk8dEgvYBCyYtHco8wI3DKU
 KuDQ==
X-Gm-Message-State: AOAM530c+YYkL/osTKyUbsw5UlqwBmEMD47/eEhrmowSwJT2kSty+8TP
 9RxGxFtMEOQEMN6G/Ulm8vay/Q==
X-Google-Smtp-Source: ABdhPJxGDEwuVP/oDt3IUsOIeCsMRmkrFHH9b/GDHfNoGEO0Z0k5Ym0Ux+MPHc0kOaTNiCcvDn0eeQ==
X-Received: by 2002:a05:6000:1210:b0:210:414:ec4 with SMTP id
 e16-20020a056000121000b0021004140ec4mr9505000wrx.250.1653666264065; 
 Fri, 27 May 2022 08:44:24 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a5d46ca000000b0020ff9802ee3sm2064680wrs.35.2022.05.27.08.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 08:44:19 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7DED71FFD5;
 Fri, 27 May 2022 16:36:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v1 30/33] gitlab: convert static checks to .base_job_template
Date: Fri, 27 May 2022 16:36:00 +0100
Message-Id: <20220527153603.887929-31-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220527153603.887929-1-alex.bennee@linaro.org>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

This folds the static checks into using the base job
template rules, introducing one new variable

 - QEMU_JOB_ONLY_FORKS - a job that should never run
   on an upstream pipeline. The information it reports
   is only applicable to contributors in a pre-submission
   scenario, not time of merge.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220526110705.59952-4-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/ci-jobs.rst.inc     |  7 +++++++
 .gitlab-ci.d/base.yml          |  4 ++++
 .gitlab-ci.d/static_checks.yml | 19 +++++++------------
 3 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/docs/devel/ci-jobs.rst.inc b/docs/devel/ci-jobs.rst.inc
index a539f502da..4c7e30ab08 100644
--- a/docs/devel/ci-jobs.rst.inc
+++ b/docs/devel/ci-jobs.rst.inc
@@ -66,6 +66,13 @@ by default due to need to conserve limited CI resources. It is
 available to be started manually by the contributor in the CI
 pipelines UI.
 
+QEMU_JOB_ONLY_FORKS
+~~~~~~~~~~~~~~~~~~~
+
+The job results are only of interest to contributors prior to
+submitting code. They are not required as part of the gating
+CI pipeline.
+
 Contributor controlled runtime variables
 ----------------------------------------
 
diff --git a/.gitlab-ci.d/base.yml b/.gitlab-ci.d/base.yml
index 5734caf9fe..9a0b8d7f97 100644
--- a/.gitlab-ci.d/base.yml
+++ b/.gitlab-ci.d/base.yml
@@ -16,6 +16,10 @@
     - if: '$QEMU_JOB_CIRRUS && ($CIRRUS_GITHUB_REPO == "" || $CIRRUS_API_TOKEN == "")'
       when: never
 
+    # Jobs only intended for forks should always be skipped on upstram
+    - if: '$QEMU_JOB_ONLY_FORKS == "1" && $CI_PROJECT_NAMESPACE == "qemu-project"'
+      when: never
+
 
     #############################################################
     # Stage 2: fine tune execution of jobs in specific scenarios
diff --git a/.gitlab-ci.d/static_checks.yml b/.gitlab-ci.d/static_checks.yml
index 94858e3272..289ad1359e 100644
--- a/.gitlab-ci.d/static_checks.yml
+++ b/.gitlab-ci.d/static_checks.yml
@@ -1,4 +1,5 @@
 check-patch:
+  extends: .base_job_template
   stage: build
   image: python:3.10-alpine
   needs: []
@@ -6,15 +7,13 @@ check-patch:
     - .gitlab-ci.d/check-patch.py
   variables:
     GIT_DEPTH: 1000
+    QEMU_JOB_ONLY_FORKS: 1
   before_script:
     - apk -U add git perl
-  rules:
-    - if: '$CI_PROJECT_NAMESPACE == "qemu-project"'
-      when: never
-    - when: on_success
-      allow_failure: true
+  allow_failure: true
 
 check-dco:
+  extends: .base_job_template
   stage: build
   image: python:3.10-alpine
   needs: []
@@ -23,12 +22,9 @@ check-dco:
     GIT_DEPTH: 1000
   before_script:
     - apk -U add git
-  rules:
-    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH'
-      when: never
-    - when: on_success
 
 check-python-pipenv:
+  extends: .base_job_template
   stage: test
   image: $CI_REGISTRY_IMAGE/qemu/python:latest
   script:
@@ -39,6 +35,7 @@ check-python-pipenv:
     job: python-container
 
 check-python-tox:
+  extends: .base_job_template
   stage: test
   image: $CI_REGISTRY_IMAGE/qemu/python:latest
   script:
@@ -46,8 +43,6 @@ check-python-tox:
   variables:
     GIT_DEPTH: 1
     QEMU_TOX_EXTRA_ARGS: --skip-missing-interpreters=false
+    QEMU_JOB_OPTIONAL: 1
   needs:
     job: python-container
-  rules:
-    - when: manual
-  allow_failure: true
-- 
2.30.2


