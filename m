Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE8C534DE7
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 13:14:38 +0200 (CEST)
Received: from localhost ([::1]:46048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuBRt-0003ra-JT
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 07:14:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nuBKh-0007ni-A5
 for qemu-devel@nongnu.org; Thu, 26 May 2022 07:07:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nuBKf-0003LJ-MT
 for qemu-devel@nongnu.org; Thu, 26 May 2022 07:07:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653563229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YmvpvgkpF/lfko9RrJeQLBK/k0kptVig6260OiXg/sg=;
 b=HOweBHSjNaGMDbJICv7wq0akDbgB2Id8WFgK1pF7/OuR++NxVLYApO4Yo9Ktwy8tKU3qJ4
 8S9EiB60KslJpysx07TSqDzPPZgStxEF+x3/3WfZRxROmxkgYRdaMNycgg62G8TvLazJZY
 BNJtKUW3O+foUoZuhUa7mN7nMlqLywo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-HTkgh6BbMiOqtfnJDu2Mcw-1; Thu, 26 May 2022 07:07:07 -0400
X-MC-Unique: HTkgh6BbMiOqtfnJDu2Mcw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D6AB185A7A4;
 Thu, 26 May 2022 11:07:07 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A43082872;
 Thu, 26 May 2022 11:07:07 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 3/5] gitlab: convert static checks to .base_job_template
Date: Thu, 26 May 2022 07:07:03 -0400
Message-Id: <20220526110705.59952-4-berrange@redhat.com>
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

This folds the static checks into using the base job
template rules, introducing one new variable

 - QEMU_JOB_ONLY_FORKS - a job that should never run
   on an upstream pipeline. The information it reports
   is only applicable to contributors in a pre-submission
   scenario, not time of merge.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitlab-ci.d/base.yml          |  4 ++++
 .gitlab-ci.d/static_checks.yml | 19 +++++++------------
 docs/devel/ci-jobs.rst.inc     |  7 +++++++
 3 files changed, 18 insertions(+), 12 deletions(-)

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
 
-- 
2.36.1


