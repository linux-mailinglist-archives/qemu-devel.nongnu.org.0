Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0993713CD
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 12:50:47 +0200 (CEST)
Received: from localhost ([::1]:40468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldWA2-0000ic-Ap
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 06:50:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldW4j-0003qR-Uc
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:45:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldW4g-0003RX-I3
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:45:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620038714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cE8Dw59ajUIHJfnbuKxJllUCz+8gwxz6nLhPbi1iJg4=;
 b=TZlWalNV2kbA74OcXkkwiBxktDvExD7ae3uIqi81JLOiKurAWYhbavQjeDfUXmB8lrXsMr
 2ZpgOVEYuVHU1samxtojUqjJCUHQKnvzVtrS8LpCCMqzhq8luf1aId2juAuuLiYlkHu57g
 fJojSJdyPFwx25vR1r2gPaiFcaiqgFA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-fWSFMLK0MECRVrqIuYq-Tg-1; Mon, 03 May 2021 06:45:12 -0400
X-MC-Unique: fWSFMLK0MECRVrqIuYq-Tg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FE1718397A7;
 Mon,  3 May 2021 10:45:11 +0000 (UTC)
Received: from thuth.com (ovpn-112-122.ams2.redhat.com [10.36.112.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1ACC05D9D0;
 Mon,  3 May 2021 10:45:09 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 05/10] gitlab-ci: Replace YAML anchors by extends
 (native_build_job)
Date: Mon,  3 May 2021 12:44:51 +0200
Message-Id: <20210503104456.1036472-6-thuth@redhat.com>
In-Reply-To: <20210503104456.1036472-1-thuth@redhat.com>
References: <20210503104456.1036472-1-thuth@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
index 9970d91809..442e78a0a7 100644
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
@@ -79,7 +79,7 @@ include:
     - du -chs ${CI_PROJECT_DIR}/avocado-cache
 
 build-system-alpine:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     - job: amd64-alpine-container
   variables:
@@ -114,7 +114,7 @@ acceptance-system-alpine:
   <<: *acceptance_definition
 
 build-system-ubuntu:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-ubuntu2004-container
   variables:
@@ -148,7 +148,7 @@ acceptance-system-ubuntu:
   <<: *acceptance_definition
 
 build-system-debian:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-debian-container
   variables:
@@ -182,7 +182,7 @@ acceptance-system-debian:
   <<: *acceptance_definition
 
 build-system-fedora:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-fedora-container
   variables:
@@ -217,7 +217,7 @@ acceptance-system-fedora:
   <<: *acceptance_definition
 
 build-system-centos:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-centos8-container
   variables:
@@ -252,7 +252,7 @@ acceptance-system-centos:
   <<: *acceptance_definition
 
 build-system-opensuse:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-opensuse-leap-container
   variables:
@@ -286,7 +286,7 @@ acceptance-system-opensuse:
 
 
 build-disabled:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-fedora-container
   variables:
@@ -373,7 +373,7 @@ build-disabled:
 # Also use a different coroutine implementation (which is only really of
 # interest to KVM users, i.e. with TCG disabled)
 build-tcg-disabled:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-centos8-container
   variables:
@@ -396,7 +396,7 @@ build-tcg-disabled:
             260 261 262 263 264 270 272 273 277 279
 
 build-user:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-debian-user-cross-container
   variables:
@@ -405,7 +405,7 @@ build-user:
     MAKE_CHECK_ARGS: check-tcg
 
 build-user-static:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-debian-user-cross-container
   variables:
@@ -415,7 +415,7 @@ build-user-static:
 
 # Only build the softmmu targets we have check-tcg tests for
 build-some-softmmu:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-debian-user-cross-container
   variables:
@@ -428,7 +428,7 @@ build-some-softmmu:
 # we skip sparc64-linux-user until it has been fixed somewhat
 # we skip cris-linux-user as it doesn't use the common run loop
 build-user-plugins:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-debian-user-cross-container
   variables:
@@ -438,7 +438,7 @@ build-user-plugins:
   timeout: 1h 30m
 
 build-user-centos7:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-centos7-container
   variables:
@@ -447,7 +447,7 @@ build-user-centos7:
     MAKE_CHECK_ARGS: check-tcg
 
 build-some-softmmu-plugins:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-debian-user-cross-container
   variables:
@@ -457,7 +457,7 @@ build-some-softmmu-plugins:
     MAKE_CHECK_ARGS: check-tcg
 
 clang-system:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-fedora-container
   variables:
@@ -469,7 +469,7 @@ clang-system:
     MAKE_CHECK_ARGS: check-qtest check-tcg
 
 clang-user:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-debian-user-cross-container
   variables:
@@ -491,7 +491,7 @@ clang-user:
 # Split in three sets of build/check/acceptance to limit the execution time of each
 # job
 build-cfi-aarch64:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
   - job: amd64-fedora-container
   variables:
@@ -528,7 +528,7 @@ acceptance-cfi-aarch64:
   <<: *acceptance_definition
 
 build-cfi-ppc64-s390x:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
   - job: amd64-fedora-container
   variables:
@@ -565,7 +565,7 @@ acceptance-cfi-ppc64-s390x:
   <<: *acceptance_definition
 
 build-cfi-x86_64:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
   - job: amd64-fedora-container
   variables:
@@ -602,7 +602,7 @@ acceptance-cfi-x86_64:
   <<: *acceptance_definition
 
 tsan-build:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-ubuntu2004-container
   variables:
@@ -614,7 +614,7 @@ tsan-build:
 
 # These targets are on the way out
 build-deprecated:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-debian-user-cross-container
   variables:
@@ -641,7 +641,7 @@ check-deprecated:
 
 # gprof/gcov are GCC features
 gprof-gcov:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-ubuntu2004-container
   variables:
@@ -654,7 +654,7 @@ gprof-gcov:
     - ${CI_PROJECT_DIR}/scripts/ci/coverage-summary.sh
 
 build-oss-fuzz:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-fedora-container
   variables:
@@ -674,7 +674,7 @@ build-oss-fuzz:
     - cd build-oss-fuzz && make check-qtest-i386 check-unit
 
 build-tci:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-debian-user-cross-container
   variables:
@@ -699,7 +699,7 @@ build-tci:
 # Alternate coroutines implementations are only really of interest to KVM users
 # However we can't test against KVM on Gitlab-CI so we can only run unit tests
 build-coroutine-sigaltstack:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-ubuntu2004-container
   variables:
@@ -713,7 +713,7 @@ build-coroutine-sigaltstack:
 # These jobs test old gcrypt and nettle from RHEL7
 # which had some API differences.
 crypto-old-nettle:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-centos7-container
   variables:
@@ -723,7 +723,7 @@ crypto-old-nettle:
     MAKE_CHECK_ARGS: check
 
 crypto-old-gcrypt:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-centos7-container
   variables:
@@ -733,7 +733,7 @@ crypto-old-gcrypt:
     MAKE_CHECK_ARGS: check
 
 crypto-only-gnutls:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-centos7-container
   variables:
@@ -745,7 +745,7 @@ crypto-only-gnutls:
 
 # Check our reduced build configurations
 build-without-default-devices:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-centos8-container
   variables:
@@ -753,7 +753,7 @@ build-without-default-devices:
     CONFIGURE_ARGS: --without-default-devices --disable-user
 
 build-without-default-features:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-debian-container
   variables:
@@ -803,7 +803,7 @@ build-libvhost-user:
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


