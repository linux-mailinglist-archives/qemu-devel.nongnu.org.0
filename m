Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B87380970
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 14:24:24 +0200 (CEST)
Received: from localhost ([::1]:53902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhWrf-00033o-4s
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 08:24:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhWjM-0000Qu-Vj
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:15:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhWjK-0004zo-N1
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:15:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620994545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0dfC8xmO92wtkLvfUsn7UcXH2lJD6m85Cbdm9H8KGqM=;
 b=jJID2TLPr+hwBYiWoqGKJRDHKNB7eVOkBoM9EeBPPej4VDxRvjZkDwGhTOwR+/ROtNSHAT
 ixw3OsEJEP8PhiU4jY06Hvm9H+Iex28lYgd2jnd1tUFMoClG6fk1+Hz5TS/J5O0kIlDJeO
 Sfo4PZ+3pjfdYxYf9CrjeVXtC2J3pLs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-2noqu08sNLmNIv4F4S3mGg-1; Fri, 14 May 2021 08:15:41 -0400
X-MC-Unique: 2noqu08sNLmNIv4F4S3mGg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26E23106BAE5;
 Fri, 14 May 2021 12:15:40 +0000 (UTC)
Received: from thuth.com (ovpn-112-191.ams2.redhat.com [10.36.112.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB92460C5D;
 Fri, 14 May 2021 12:15:38 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 04/20] gitlab-ci: Replace YAML anchors by extends
 (native_test_job)
Date: Fri, 14 May 2021 14:15:02 +0200
Message-Id: <20210514121518.832729-5-thuth@redhat.com>
In-Reply-To: <20210514121518.832729-1-thuth@redhat.com>
References: <20210514121518.832729-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

'extends' is an alternative to using YAML anchors
and is a little more flexible and readable. See:
https://docs.gitlab.com/ee/ci/yaml/#extends

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210418233448.1267991-4-f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.yml | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 1e6caa5aff..24f300aace 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -41,7 +41,7 @@ include:
         make -j"$JOBS" $MAKE_CHECK_ARGS ;
       fi
 
-.native_test_job_template: &native_test_job_definition
+.native_test_job_template:
   stage: test
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   script:
@@ -99,7 +99,7 @@ build-system-alpine:
       - build
 
 check-system-alpine:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-system-alpine
       artifacts: true
@@ -108,7 +108,7 @@ check-system-alpine:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-alpine:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-system-alpine
       artifacts: true
@@ -133,7 +133,7 @@ build-system-ubuntu:
       - build
 
 check-system-ubuntu:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-system-ubuntu
       artifacts: true
@@ -142,7 +142,7 @@ check-system-ubuntu:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-ubuntu:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-system-ubuntu
       artifacts: true
@@ -167,7 +167,7 @@ build-system-debian:
       - build
 
 check-system-debian:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-system-debian
       artifacts: true
@@ -176,7 +176,7 @@ check-system-debian:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-debian:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-system-debian
       artifacts: true
@@ -202,7 +202,7 @@ build-system-fedora:
       - build
 
 check-system-fedora:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-system-fedora
       artifacts: true
@@ -211,7 +211,7 @@ check-system-fedora:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-fedora:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-system-fedora
       artifacts: true
@@ -237,7 +237,7 @@ build-system-centos:
       - build
 
 check-system-centos:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-system-centos
       artifacts: true
@@ -246,7 +246,7 @@ check-system-centos:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-centos:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-system-centos
       artifacts: true
@@ -270,7 +270,7 @@ build-system-opensuse:
       - build
 
 check-system-opensuse:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-system-opensuse
       artifacts: true
@@ -279,7 +279,7 @@ check-system-opensuse:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-opensuse:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-system-opensuse
       artifacts: true
@@ -512,7 +512,7 @@ build-cfi-aarch64:
       - build
 
 check-cfi-aarch64:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-cfi-aarch64
       artifacts: true
@@ -521,7 +521,7 @@ check-cfi-aarch64:
     MAKE_CHECK_ARGS: check
 
 acceptance-cfi-aarch64:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-cfi-aarch64
       artifacts: true
@@ -549,7 +549,7 @@ build-cfi-ppc64-s390x:
       - build
 
 check-cfi-ppc64-s390x:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-cfi-ppc64-s390x
       artifacts: true
@@ -558,7 +558,7 @@ check-cfi-ppc64-s390x:
     MAKE_CHECK_ARGS: check
 
 acceptance-cfi-ppc64-s390x:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-cfi-ppc64-s390x
       artifacts: true
@@ -586,7 +586,7 @@ build-cfi-x86_64:
       - build
 
 check-cfi-x86_64:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-cfi-x86_64
       artifacts: true
@@ -595,7 +595,7 @@ check-cfi-x86_64:
     MAKE_CHECK_ARGS: check
 
 acceptance-cfi-x86_64:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-cfi-x86_64
       artifacts: true
@@ -633,7 +633,7 @@ build-deprecated:
 # We split the check-tcg step as test failures are expected but we still
 # want to catch the build breaking.
 check-deprecated:
-  <<: *native_test_job_definition
+  extends: .native_test_job_template
   needs:
     - job: build-deprecated
       artifacts: true
-- 
2.27.0


