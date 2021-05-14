Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E1C38096A
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 14:23:47 +0200 (CEST)
Received: from localhost ([::1]:50472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhWr4-0000hU-IW
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 08:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhWjM-0000Pj-F2
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:15:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhWjH-0004yt-0J
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:15:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620994541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TbrYbvKB+tg1Wg5E+7pVoSnht2PpKNusrz7HPE5Il3k=;
 b=MreE0u0F23xb1XTK347QVQ50ezvdpjQV+6FCdWSZTDrhaS0AIxgRJbSk4nnxOUtq5CeorU
 8QQ9cjXtdj3VVd2gj2U9ngoNGFmRTJ3waulUt+dsvs7nNonP8cXo7V5PYGXJ9qJ7MNdqQv
 a1kPe6AcVhrhh+ISd2vMI3a42djzpsY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-5GZgeyyCOIeZ8_yJllUSvw-1; Fri, 14 May 2021 08:15:39 -0400
X-MC-Unique: 5GZgeyyCOIeZ8_yJllUSvw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51DFD9F92C;
 Fri, 14 May 2021 12:15:38 +0000 (UTC)
Received: from thuth.com (ovpn-112-191.ams2.redhat.com [10.36.112.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 01F296060F;
 Fri, 14 May 2021 12:15:36 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 03/20] gitlab-ci: Replace YAML anchors by extends
 (native_build_job)
Date: Fri, 14 May 2021 14:15:01 +0200
Message-Id: <20210514121518.832729-4-thuth@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
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
Message-Id: <20210418233448.1267991-3-f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.yml | 64 +++++++++++++++++++++++++-------------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 9876f73040..1e6caa5aff 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -13,7 +13,7 @@ include:
   - local: '/.gitlab-ci.d/containers.yml'
   - local: '/.gitlab-ci.d/crossbuilds.yml'
 
-.native_build_job_template: &native_build_job_definition
+.native_build_job_template:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   before_script:
@@ -83,7 +83,7 @@ include:
     - du -chs ${CI_PROJECT_DIR}/avocado-cache
 
 build-system-alpine:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     - job: amd64-alpine-container
   variables:
@@ -118,7 +118,7 @@ acceptance-system-alpine:
   <<: *acceptance_definition
 
 build-system-ubuntu:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-ubuntu2004-container
   variables:
@@ -152,7 +152,7 @@ acceptance-system-ubuntu:
   <<: *acceptance_definition
 
 build-system-debian:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-debian-container
   variables:
@@ -186,7 +186,7 @@ acceptance-system-debian:
   <<: *acceptance_definition
 
 build-system-fedora:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-fedora-container
   variables:
@@ -221,7 +221,7 @@ acceptance-system-fedora:
   <<: *acceptance_definition
 
 build-system-centos:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-centos8-container
   variables:
@@ -256,7 +256,7 @@ acceptance-system-centos:
   <<: *acceptance_definition
 
 build-system-opensuse:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-opensuse-leap-container
   variables:
@@ -290,7 +290,7 @@ acceptance-system-opensuse:
 
 
 build-disabled:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-fedora-container
   variables:
@@ -376,7 +376,7 @@ build-disabled:
 # Also use a different coroutine implementation (which is only really of
 # interest to KVM users, i.e. with TCG disabled)
 build-tcg-disabled:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-centos8-container
   variables:
@@ -399,7 +399,7 @@ build-tcg-disabled:
             260 261 262 263 264 270 272 273 277 279
 
 build-user:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-debian-user-cross-container
   variables:
@@ -408,7 +408,7 @@ build-user:
     MAKE_CHECK_ARGS: check-tcg
 
 build-user-static:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-debian-user-cross-container
   variables:
@@ -418,7 +418,7 @@ build-user-static:
 
 # Only build the softmmu targets we have check-tcg tests for
 build-some-softmmu:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-debian-user-cross-container
   variables:
@@ -431,7 +431,7 @@ build-some-softmmu:
 # we skip sparc64-linux-user until it has been fixed somewhat
 # we skip cris-linux-user as it doesn't use the common run loop
 build-user-plugins:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-debian-user-cross-container
   variables:
@@ -441,7 +441,7 @@ build-user-plugins:
   timeout: 1h 30m
 
 build-user-centos7:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-centos7-container
   variables:
@@ -450,7 +450,7 @@ build-user-centos7:
     MAKE_CHECK_ARGS: check-tcg
 
 build-some-softmmu-plugins:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-debian-user-cross-container
   variables:
@@ -460,7 +460,7 @@ build-some-softmmu-plugins:
     MAKE_CHECK_ARGS: check-tcg
 
 clang-system:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-fedora-container
   variables:
@@ -472,7 +472,7 @@ clang-system:
     MAKE_CHECK_ARGS: check-qtest check-tcg
 
 clang-user:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-debian-user-cross-container
   variables:
@@ -494,7 +494,7 @@ clang-user:
 # Split in three sets of build/check/acceptance to limit the execution time of each
 # job
 build-cfi-aarch64:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
   - job: amd64-fedora-container
   variables:
@@ -531,7 +531,7 @@ acceptance-cfi-aarch64:
   <<: *acceptance_definition
 
 build-cfi-ppc64-s390x:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
   - job: amd64-fedora-container
   variables:
@@ -568,7 +568,7 @@ acceptance-cfi-ppc64-s390x:
   <<: *acceptance_definition
 
 build-cfi-x86_64:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
   - job: amd64-fedora-container
   variables:
@@ -605,7 +605,7 @@ acceptance-cfi-x86_64:
   <<: *acceptance_definition
 
 tsan-build:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-ubuntu2004-container
   variables:
@@ -617,7 +617,7 @@ tsan-build:
 
 # These targets are on the way out
 build-deprecated:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-debian-user-cross-container
   variables:
@@ -644,7 +644,7 @@ check-deprecated:
 
 # gprof/gcov are GCC features
 gprof-gcov:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-ubuntu2004-container
   variables:
@@ -657,7 +657,7 @@ gprof-gcov:
     - ${CI_PROJECT_DIR}/scripts/ci/coverage-summary.sh
 
 build-oss-fuzz:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-fedora-container
   variables:
@@ -677,7 +677,7 @@ build-oss-fuzz:
     - cd build-oss-fuzz && make check-qtest-i386 check-unit
 
 build-tci:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-debian-user-cross-container
   variables:
@@ -702,7 +702,7 @@ build-tci:
 # Alternate coroutines implementations are only really of interest to KVM users
 # However we can't test against KVM on Gitlab-CI so we can only run unit tests
 build-coroutine-sigaltstack:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-ubuntu2004-container
   variables:
@@ -716,7 +716,7 @@ build-coroutine-sigaltstack:
 # These jobs test old gcrypt and nettle from RHEL7
 # which had some API differences.
 crypto-old-nettle:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-centos7-container
   variables:
@@ -726,7 +726,7 @@ crypto-old-nettle:
     MAKE_CHECK_ARGS: check
 
 crypto-old-gcrypt:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-centos7-container
   variables:
@@ -736,7 +736,7 @@ crypto-old-gcrypt:
     MAKE_CHECK_ARGS: check
 
 crypto-only-gnutls:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-centos7-container
   variables:
@@ -748,7 +748,7 @@ crypto-only-gnutls:
 
 # Check our reduced build configurations
 build-without-default-devices:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-centos8-container
   variables:
@@ -756,7 +756,7 @@ build-without-default-devices:
     CONFIGURE_ARGS: --without-default-devices --disable-user
 
 build-without-default-features:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-debian-container
   variables:
@@ -806,7 +806,7 @@ build-libvhost-user:
 # No targets are built here, just tools, docs, and unit tests. This
 # also feeds into the eventual documentation deployment steps later
 build-tools-and-docs-debian:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-debian-container
   variables:
-- 
2.27.0


