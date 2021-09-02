Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3353E3FEE52
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 15:06:45 +0200 (CEST)
Received: from localhost ([::1]:39058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLmQW-0004qx-6e
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 09:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mLm9u-00058K-IA
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:49:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mLm9r-000736-9W
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:49:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630586970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wdaa9b5KTNEOKVCFJcI0sLfb2hf8emxeFzWb9Cn2I9U=;
 b=Bim76n1eZpBhY8RjOYMN+fRLazLVfyi9jJKZfTAHcz7Fj+dm6KmlUHGjduVNr/WOBhlw9x
 LD6SF7jH/Jhuz93hO8s6wHwUnidw1D6FwYz6Qj4jjLRDi+ojyO9mWusMLby2jFPeK6pBZ9
 C3QWrDegr5pcPw2kJWNUCQm+cf4CnCs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-aBbFj5AwOyaowW1io_mnPg-1; Thu, 02 Sep 2021 08:49:26 -0400
X-MC-Unique: aBbFj5AwOyaowW1io_mnPg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B74A11940936;
 Thu,  2 Sep 2021 12:49:25 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9A0A10016F2;
 Thu,  2 Sep 2021 12:49:24 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 05/13] gitlab-ci: Fix ..._RUNNER_AVAILABLE variables and
 document them
Date: Thu,  2 Sep 2021 14:49:03 +0200
Message-Id: <20210902124911.822423-6-thuth@redhat.com>
In-Reply-To: <20210902124911.822423-1-thuth@redhat.com>
References: <20210902124911.822423-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The patch that recently introduced the S390X_RUNNER_AVAILABLE variable
in custom-runners.yml missed that the bottom half of the file is rather
about aarch64 than s390x. Thus rename the S390X_RUNNER_AVAILABLE to
AARCH64_RUNNER_AVAILABLE in those jobs.

Finally mention both variables in our CI documentation, too.

Fixes: c5dd0f0342 ("Improve rules for the staging branch")
Message-Id: <20210730143809.717079-4-thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/custom-runners.yml | 12 ++++++------
 docs/devel/ci-jobs.rst          | 11 +++++++++++
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
index 564b94565d..0d3e4a7b4b 100644
--- a/.gitlab-ci.d/custom-runners.yml
+++ b/.gitlab-ci.d/custom-runners.yml
@@ -137,7 +137,7 @@ ubuntu-20.04-aarch64-all-linux-static:
  - aarch64
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
- - if: "$S390X_RUNNER_AVAILABLE"
+ - if: "$AARCH64_RUNNER_AVAILABLE"
  script:
  # --disable-libssh is needed because of https://bugs.launchpad.net/qemu/+bug/1838763
  # --disable-glusterfs is needed because there's no static version of those libs in distro supplied packages
@@ -157,7 +157,7 @@ ubuntu-20.04-aarch64-all:
  - aarch64
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
- - if: "$S390X_RUNNER_AVAILABLE"
+ - if: "$AARCH64_RUNNER_AVAILABLE"
  script:
  - mkdir build
  - cd build
@@ -174,7 +174,7 @@ ubuntu-20.04-aarch64-alldbg:
  - aarch64
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
- - if: "$S390X_RUNNER_AVAILABLE"
+ - if: "$AARCH64_RUNNER_AVAILABLE"
  script:
  - mkdir build
  - cd build
@@ -193,7 +193,7 @@ ubuntu-20.04-aarch64-clang:
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
    when: manual
- - if: "$S390X_RUNNER_AVAILABLE"
+ - if: "$AARCH64_RUNNER_AVAILABLE"
    when: manual
  script:
  - mkdir build
@@ -211,7 +211,7 @@ ubuntu-20.04-aarch64-tci:
  - aarch64
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
- - if: "$S390X_RUNNER_AVAILABLE"
+ - if: "$AARCH64_RUNNER_AVAILABLE"
  script:
  - mkdir build
  - cd build
@@ -228,7 +228,7 @@ ubuntu-20.04-aarch64-notcg:
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
    when: manual
- - if: "$S390X_RUNNER_AVAILABLE"
+ - if: "$AARCH64_RUNNER_AVAILABLE"
    when: manual
  script:
  - mkdir build
diff --git a/docs/devel/ci-jobs.rst b/docs/devel/ci-jobs.rst
index 9cd9819786..277975e4ad 100644
--- a/docs/devel/ci-jobs.rst
+++ b/docs/devel/ci-jobs.rst
@@ -38,3 +38,14 @@ these artifacts are not already cached, downloading them make the jobs
 reach the timeout limit). Set this variable to have the tests using the
 Avocado framework run automatically.
 
+AARCH64_RUNNER_AVAILABLE
+~~~~~~~~~~~~~~~~~~~~~~~~
+If you've got access to an aarch64 host that can be used as a gitlab-CI
+runner, you can set this variable to enable the tests that require this
+kind of host. The runner should be tagged with "aarch64".
+
+S390X_RUNNER_AVAILABLE
+~~~~~~~~~~~~~~~~~~~~~~
+If you've got access to an IBM Z host that can be used as a gitlab-CI
+runner, you can set this variable to enable the tests that require this
+kind of host. The runner should be tagged with "s390x".
-- 
2.27.0


