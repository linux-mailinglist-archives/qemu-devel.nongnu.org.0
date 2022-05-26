Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1DD534E07
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 13:25:35 +0200 (CEST)
Received: from localhost ([::1]:54664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuBcT-0002WH-Rs
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 07:25:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nuBKi-0007os-Vw
 for qemu-devel@nongnu.org; Thu, 26 May 2022 07:07:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nuBKh-0003Lf-5B
 for qemu-devel@nongnu.org; Thu, 26 May 2022 07:07:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653563230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zk78IgLksLw5ElFhkPV9WfJH/qiEb/4v5lLpdjzLdGE=;
 b=V1/OoTXYCFidBtKyiOX79gET881XPpTJVP5yOf78j5x3j5hz72zVDzbRRFReE+kPA0wvWl
 trHD0nwqG0yqSqSJOzqA7W9/k/9N0w9VZDGm49179Xi5LMCNIURG9BxwQwu1dvit+UH9Zt
 D+ulNXc2jOxE5LOPAevCbWifZxtiOrc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-kPdwJwkKN8ObBmqEwl1MmQ-1; Thu, 26 May 2022 07:07:07 -0400
X-MC-Unique: kPdwJwkKN8ObBmqEwl1MmQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 108F280088A;
 Thu, 26 May 2022 11:07:07 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1BFB1731B;
 Thu, 26 May 2022 11:07:06 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 2/5] gitlab: convert Cirrus jobs to .base_job_template
Date: Thu, 26 May 2022 07:07:02 -0400
Message-Id: <20220526110705.59952-3-berrange@redhat.com>
In-Reply-To: <20220526110705.59952-1-berrange@redhat.com>
References: <20220526110705.59952-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

This folds the Cirrus job rules into the base job
template, introducing two new variables

  - QEMU_JOB_CIRRUS - identifies the job as making
    use of Cirrus CI via cirrus-run

  - QEMU_JOB_OPTIONAL - identifies the job as one
    that is not run by default, primarily due to
    resource constraints. It can be manually invoked
    by users if they wish to validate that scenario.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitlab-ci.d/base.yml      |  9 +++++++++
 .gitlab-ci.d/cirrus.yml    | 16 ++++++++--------
 docs/devel/ci-jobs.rst.inc | 14 ++++++++++++++
 3 files changed, 31 insertions(+), 8 deletions(-)

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
 
-- 
2.36.1


