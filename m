Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 574753D9F90
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 10:28:04 +0200 (CEST)
Received: from localhost ([::1]:44918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m91Od-0008OW-BH
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 04:28:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m91JR-0005a6-3U
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 04:22:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m91JP-0007Ni-9k
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 04:22:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627546958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zia/CWaOtLB0uLfN/YbgsVljUC5ZaAPkuIgvqk0iBbc=;
 b=gjqR49RT+um2mTL/gfi7bPNy/4HREVxOnI3cDylqYIg33f+bA2j8kRdT2BO12EUJLYaamL
 8veY0Efkw+NZ94D6phvdNDfZmwG2CUJNNLVHKRYLWTge91JEnpTy71qdk7+AGOSPHTkodO
 zUo6lwbqWCz/a5NoJJ998ftz8FGnUr8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-wR19B4WoPcqDrF4uTFDVPw-1; Thu, 29 Jul 2021 04:22:35 -0400
X-MC-Unique: wR19B4WoPcqDrF4uTFDVPw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41C0F1084F64;
 Thu, 29 Jul 2021 08:22:34 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E61775D9DC;
 Thu, 29 Jul 2021 08:22:32 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 7/9] gitlab-ci.d/custom-runners: Improve rules for the staging
 branch
Date: Thu, 29 Jul 2021 10:22:09 +0200
Message-Id: <20210729082211.532572-8-thuth@redhat.com>
In-Reply-To: <20210729082211.532572-1-thuth@redhat.com>
References: <20210729082211.532572-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If maintainers are currently pushing to a branch called "staging"
in their repository, they are ending up with some stuck jobs - unless
they have a s390x CI runner machine available. That's ugly, we should
make sure that the related jobs are really only started if such a
runner is available. So let's only run these jobs if it's the
"staging" branch of the main repository of the QEMU project (where
we can be sure that the s390x runner is available), or if the user
explicitly set a S390X_RUNNER_AVAILABLE variable in their CI configs
to declare that they have such a runner available, too.

Fixes: 4799c21023 ("Jobs based on custom runners: add job definitions ...")
Message-Id: <20210728173857.497523-1-thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/custom-runners.yml | 40 +++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
index 061d3cdfed..564b94565d 100644
--- a/.gitlab-ci.d/custom-runners.yml
+++ b/.gitlab-ci.d/custom-runners.yml
@@ -24,7 +24,8 @@ ubuntu-18.04-s390x-all-linux-static:
  - ubuntu_18.04
  - s390x
  rules:
- - if: '$CI_COMMIT_BRANCH =~ /^staging/'
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+ - if: "$S390X_RUNNER_AVAILABLE"
  script:
  # --disable-libssh is needed because of https://bugs.launchpad.net/qemu/+bug/1838763
  # --disable-glusterfs is needed because there's no static version of those libs in distro supplied packages
@@ -43,7 +44,8 @@ ubuntu-18.04-s390x-all:
  - ubuntu_18.04
  - s390x
  rules:
- - if: '$CI_COMMIT_BRANCH =~ /^staging/'
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+ - if: "$S390X_RUNNER_AVAILABLE"
  script:
  - mkdir build
  - cd build
@@ -59,7 +61,8 @@ ubuntu-18.04-s390x-alldbg:
  - ubuntu_18.04
  - s390x
  rules:
- - if: '$CI_COMMIT_BRANCH =~ /^staging/'
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+ - if: "$S390X_RUNNER_AVAILABLE"
  script:
  - mkdir build
  - cd build
@@ -76,7 +79,9 @@ ubuntu-18.04-s390x-clang:
  - ubuntu_18.04
  - s390x
  rules:
- - if: '$CI_COMMIT_BRANCH =~ /^staging/'
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+   when: manual
+ - if: "$S390X_RUNNER_AVAILABLE"
    when: manual
  script:
  - mkdir build
@@ -93,7 +98,8 @@ ubuntu-18.04-s390x-tci:
  - ubuntu_18.04
  - s390x
  rules:
- - if: '$CI_COMMIT_BRANCH =~ /^staging/'
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+ - if: "$S390X_RUNNER_AVAILABLE"
  script:
  - mkdir build
  - cd build
@@ -108,7 +114,9 @@ ubuntu-18.04-s390x-notcg:
  - ubuntu_18.04
  - s390x
  rules:
- - if: '$CI_COMMIT_BRANCH =~ /^staging/'
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+   when: manual
+ - if: "$S390X_RUNNER_AVAILABLE"
    when: manual
  script:
  - mkdir build
@@ -128,7 +136,8 @@ ubuntu-20.04-aarch64-all-linux-static:
  - ubuntu_20.04
  - aarch64
  rules:
- - if: '$CI_COMMIT_BRANCH =~ /^staging/'
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+ - if: "$S390X_RUNNER_AVAILABLE"
  script:
  # --disable-libssh is needed because of https://bugs.launchpad.net/qemu/+bug/1838763
  # --disable-glusterfs is needed because there's no static version of those libs in distro supplied packages
@@ -147,7 +156,8 @@ ubuntu-20.04-aarch64-all:
  - ubuntu_20.04
  - aarch64
  rules:
- - if: '$CI_COMMIT_BRANCH =~ /^staging/'
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+ - if: "$S390X_RUNNER_AVAILABLE"
  script:
  - mkdir build
  - cd build
@@ -163,7 +173,8 @@ ubuntu-20.04-aarch64-alldbg:
  - ubuntu_20.04
  - aarch64
  rules:
- - if: '$CI_COMMIT_BRANCH =~ /^staging/'
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+ - if: "$S390X_RUNNER_AVAILABLE"
  script:
  - mkdir build
  - cd build
@@ -180,7 +191,9 @@ ubuntu-20.04-aarch64-clang:
  - ubuntu_20.04
  - aarch64
  rules:
- - if: '$CI_COMMIT_BRANCH =~ /^staging/'
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+   when: manual
+ - if: "$S390X_RUNNER_AVAILABLE"
    when: manual
  script:
  - mkdir build
@@ -197,7 +210,8 @@ ubuntu-20.04-aarch64-tci:
  - ubuntu_20.04
  - aarch64
  rules:
- - if: '$CI_COMMIT_BRANCH =~ /^staging/'
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+ - if: "$S390X_RUNNER_AVAILABLE"
  script:
  - mkdir build
  - cd build
@@ -212,7 +226,9 @@ ubuntu-20.04-aarch64-notcg:
  - ubuntu_20.04
  - aarch64
  rules:
- - if: '$CI_COMMIT_BRANCH =~ /^staging/'
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+   when: manual
+ - if: "$S390X_RUNNER_AVAILABLE"
    when: manual
  script:
  - mkdir build
-- 
2.27.0


