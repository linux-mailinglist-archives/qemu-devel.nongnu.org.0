Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F4031CB23
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 14:34:52 +0100 (CET)
Received: from localhost ([::1]:41410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC0V9-0007sR-Sz
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 08:34:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lC0Ql-0006Cv-Qo
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 08:30:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lC0Qi-0005fK-GF
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 08:30:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613482212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NLbjzcBp4Yb1qpgc7fxBRbG4uwupEhk32M71q7wE/NY=;
 b=iMpzQQFYdx44b5ZeaSMUzSYzQ9Z0IkJ+hBUUWYwEcV84OiWD3kJjWfmuvVWqkDXtQIjtx1
 ZjbQ5KZrF9028eMWAHiw4slKlv9TWDfL5gVaHy56M/W4Ro9B7jTqaRS85O/Vo5IdBeuQhV
 4vUW2yHxUMT8POdJcecWHupMNbJxWq4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-dPm3TorFPgq5hHHpjSI99w-1; Tue, 16 Feb 2021 08:30:10 -0500
X-MC-Unique: dPm3TorFPgq5hHHpjSI99w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFFDBDF8A7;
 Tue, 16 Feb 2021 13:30:09 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-215.ams2.redhat.com
 [10.36.112.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FA6E5D9CC;
 Tue, 16 Feb 2021 13:30:06 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] gitlab: add fine grained job deps for all build jobs
Date: Tue, 16 Feb 2021 13:29:53 +0000
Message-Id: <20210216132954.295906-3-berrange@redhat.com>
In-Reply-To: <20210216132954.295906-1-berrange@redhat.com>
References: <20210216132954.295906-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows the build jobs to start running as soon as their respective
container image is ready, instead of waiting for all container builds
to finish.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml | 46 ++++++++++++++++++++++++++++
 .gitlab-ci.yml               | 58 ++++++++++++++++++++++++++++++++++++
 2 files changed, 104 insertions(+)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 66547b6683..d5098c986b 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -41,114 +41,158 @@
 
 cross-armel-system:
   extends: .cross_system_build_job
+  needs:
+    job: armel-debian-cross-container
   variables:
     IMAGE: debian-armel-cross
 
 cross-armel-user:
   extends: .cross_user_build_job
+  needs:
+    job: armel-debian-cross-container
   variables:
     IMAGE: debian-armel-cross
 
 cross-armhf-system:
   extends: .cross_system_build_job
+  needs:
+    job: armhf-debian-cross-container
   variables:
     IMAGE: debian-armhf-cross
 
 cross-armhf-user:
   extends: .cross_user_build_job
+  needs:
+    job: armhf-debian-cross-container
   variables:
     IMAGE: debian-armhf-cross
 
 cross-arm64-system:
   extends: .cross_system_build_job
+  needs:
+    job: arm64-debian-cross-container
   variables:
     IMAGE: debian-arm64-cross
 
 cross-arm64-user:
   extends: .cross_user_build_job
+  needs:
+    job: arm64-debian-cross-container
   variables:
     IMAGE: debian-arm64-cross
 
 cross-i386-system:
   extends: .cross_system_build_job
+  needs:
+    job: i386-fedora-cross-container
   variables:
     IMAGE: fedora-i386-cross
     MAKE_CHECK_ARGS: check-qtest
 
 cross-i386-user:
   extends: .cross_user_build_job
+  needs:
+    job: i386-fedora-cross-container
   variables:
     IMAGE: fedora-i386-cross
     MAKE_CHECK_ARGS: check
 
 cross-mips-system:
   extends: .cross_system_build_job
+  needs:
+    job: mips-debian-cross-container
   variables:
     IMAGE: debian-mips-cross
 
 cross-mips-user:
   extends: .cross_user_build_job
+  needs:
+    job: mips-debian-cross-container
   variables:
     IMAGE: debian-mips-cross
 
 cross-mipsel-system:
   extends: .cross_system_build_job
+  needs:
+    job: mipsel-debian-cross-container
   variables:
     IMAGE: debian-mipsel-cross
 
 cross-mipsel-user:
   extends: .cross_user_build_job
+  needs:
+    job: mipsel-debian-cross-container
   variables:
     IMAGE: debian-mipsel-cross
 
 cross-mips64el-system:
   extends: .cross_system_build_job
+  needs:
+    job: mips64el-debian-cross-container
   variables:
     IMAGE: debian-mips64el-cross
 
 cross-mips64el-user:
   extends: .cross_user_build_job
+  needs:
+    job: mips64el-debian-cross-container
   variables:
     IMAGE: debian-mips64el-cross
 
 cross-ppc64el-system:
   extends: .cross_system_build_job
+  needs:
+    job: ppc64el-debian-cross-container
   variables:
     IMAGE: debian-ppc64el-cross
 
 cross-ppc64el-user:
   extends: .cross_user_build_job
+  needs:
+    job: ppc64el-debian-cross-container
   variables:
     IMAGE: debian-ppc64el-cross
 
 cross-s390x-system:
   extends: .cross_system_build_job
+  needs:
+    job: s390x-debian-cross-container
   variables:
     IMAGE: debian-s390x-cross
 
 cross-s390x-user:
   extends: .cross_user_build_job
+  needs:
+    job: s390x-debian-cross-container
   variables:
     IMAGE: debian-s390x-cross
 
 cross-s390x-kvm-only:
   extends: .cross_accel_build_job
+  needs:
+    job: s390x-debian-cross-container
   variables:
     IMAGE: debian-s390x-cross
     ACCEL_CONFIGURE_OPTS: --disable-tcg
 
 cross-win32-system:
   extends: .cross_system_build_job
+  needs:
+    job: win32-fedora-cross-container
   variables:
     IMAGE: fedora-win32-cross
 
 cross-win64-system:
   extends: .cross_system_build_job
+  needs:
+    job: win64-fedora-cross-container
   variables:
     IMAGE: fedora-win64-cross
 
 cross-amd64-xen-only:
   extends: .cross_accel_build_job
+  needs:
+    job: amd64-debian-cross-container
   variables:
     IMAGE: debian-amd64-cross
     ACCEL: xen
@@ -156,6 +200,8 @@ cross-amd64-xen-only:
 
 cross-arm64-xen-only:
   extends: .cross_accel_build_job
+  needs:
+    job: arm64-debian-cross-container
   variables:
     IMAGE: debian-arm64-cross
     ACCEL: xen
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 7adb9a4cef..32cc6bd4a2 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -109,6 +109,8 @@ acceptance-system-alpine:
 
 build-system-ubuntu:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-ubuntu2004-container
   variables:
     IMAGE: ubuntu2004
     CONFIGURE_ARGS: --enable-fdt=system --enable-slirp=system
@@ -141,6 +143,8 @@ acceptance-system-ubuntu:
 
 build-system-debian:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-debian-container
   variables:
     IMAGE: debian-amd64
     CONFIGURE_ARGS: --enable-fdt=system
@@ -186,6 +190,8 @@ acceptance-system-debian:
 
 build-system-fedora:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-fedora-container
   variables:
     IMAGE: fedora
     CONFIGURE_ARGS: --disable-gcrypt --enable-nettle --enable-docs
@@ -219,6 +225,8 @@ acceptance-system-fedora:
 
 build-system-centos:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-centos8-container
   variables:
     IMAGE: centos8
     CONFIGURE_ARGS: --disable-nettle --enable-gcrypt --enable-fdt=system
@@ -252,6 +260,8 @@ acceptance-system-centos:
 
 build-system-opensuse:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-opensuse-leap-container
   variables:
     IMAGE: opensuse-leap
     CONFIGURE_ARGS: --enable-fdt=system
@@ -284,6 +294,8 @@ acceptance-system-opensuse:
 
 build-disabled:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-fedora-container
   variables:
     IMAGE: fedora
     CONFIGURE_ARGS:
@@ -366,6 +378,8 @@ build-disabled:
 # available.
 build-tcg-disabled:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-centos8-container
   variables:
     IMAGE: centos8
   script:
@@ -386,6 +400,8 @@ build-tcg-disabled:
 
 build-user:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-debian-user-cross-container
   variables:
     IMAGE: debian-all-test-cross
     CONFIGURE_ARGS: --disable-tools --disable-system
@@ -393,6 +409,8 @@ build-user:
 
 build-user-static:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-debian-user-cross-container
   variables:
     IMAGE: debian-all-test-cross
     CONFIGURE_ARGS: --disable-tools --disable-system --static
@@ -401,6 +419,8 @@ build-user-static:
 # Only build the softmmu targets we have check-tcg tests for
 build-some-softmmu:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-debian-user-cross-container
   variables:
     IMAGE: debian-all-test-cross
     CONFIGURE_ARGS: --disable-tools --enable-debug
@@ -412,6 +432,8 @@ build-some-softmmu:
 # we skip cris-linux-user as it doesn't use the common run loop
 build-user-plugins:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-debian-user-cross-container
   variables:
     IMAGE: debian-all-test-cross
     CONFIGURE_ARGS: --disable-tools --disable-system --enable-plugins --enable-debug-tcg --target-list-exclude=sparc64-linux-user,cris-linux-user
@@ -427,6 +449,8 @@ build-user-centos7:
 
 build-some-softmmu-plugins:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-debian-user-cross-container
   variables:
     IMAGE: debian-all-test-cross
     CONFIGURE_ARGS: --disable-tools --disable-user --enable-plugins --enable-debug-tcg
@@ -435,6 +459,8 @@ build-some-softmmu-plugins:
 
 clang-system:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-fedora-container
   variables:
     IMAGE: fedora
     CONFIGURE_ARGS: --cc=clang --cxx=clang++
@@ -464,6 +490,8 @@ tsan-build:
 # These targets are on the way out
 build-deprecated:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-debian-user-cross-container
   variables:
     IMAGE: debian-all-test-cross
     CONFIGURE_ARGS: --disable-docs --disable-tools
@@ -501,6 +529,8 @@ gprof-gcov:
 
 build-oss-fuzz:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-fedora-container
   variables:
     IMAGE: fedora
   script:
@@ -519,6 +549,8 @@ build-oss-fuzz:
 
 build-tci:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-fedora-container
   variables:
     IMAGE: fedora
   script:
@@ -542,6 +574,8 @@ build-tci:
 # However we can't test against KVM on Gitlab-CI so we can only run unit tests
 build-coroutine-ucontext:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-ubuntu2004-container
   variables:
     IMAGE: ubuntu2004
     CONFIGURE_ARGS: --with-coroutine=ucontext --disable-tcg
@@ -549,6 +583,8 @@ build-coroutine-ucontext:
 
 build-coroutine-sigaltstack:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-ubuntu2004-container
   variables:
     IMAGE: ubuntu2004
     CONFIGURE_ARGS: --with-coroutine=sigaltstack --disable-tcg
@@ -560,6 +596,8 @@ build-coroutine-sigaltstack:
 # which had some API differences.
 build-crypto-old-nettle:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-centos7-container
   variables:
     IMAGE: centos7
     TARGETS: x86_64-softmmu x86_64-linux-user
@@ -581,6 +619,8 @@ check-crypto-old-nettle:
 
 build-crypto-old-gcrypt:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-centos7-container
   variables:
     IMAGE: centos7
     TARGETS: x86_64-softmmu x86_64-linux-user
@@ -602,6 +642,8 @@ check-crypto-old-gcrypt:
 
 build-crypto-only-gnutls:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-centos7-container
   variables:
     IMAGE: centos7
     TARGETS: x86_64-softmmu x86_64-linux-user
@@ -623,18 +665,24 @@ check-crypto-only-gnutls:
 # We don't need to exercise every backend with every front-end
 build-trace-multi-user:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-ubuntu2004-container
   variables:
     IMAGE: ubuntu2004
     CONFIGURE_ARGS: --enable-trace-backends=log,simple,syslog --disable-system
 
 build-trace-ftrace-system:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-ubuntu2004-container
   variables:
     IMAGE: ubuntu2004
     CONFIGURE_ARGS: --enable-trace-backends=ftrace --target-list=x86_64-softmmu
 
 build-trace-ust-system:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-ubuntu2004-container
   variables:
     IMAGE: ubuntu2004
     CONFIGURE_ARGS: --enable-trace-backends=ust --target-list=x86_64-softmmu
@@ -642,12 +690,16 @@ build-trace-ust-system:
 # Check our reduced build configurations
 build-without-default-devices:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-centos8-container
   variables:
     IMAGE: centos8
     CONFIGURE_ARGS: --without-default-devices --disable-user
 
 build-without-default-features:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-debian-container
   variables:
     IMAGE: debian-amd64
     CONFIGURE_ARGS: --without-default-features --disable-user
@@ -657,6 +709,8 @@ build-without-default-features:
 check-patch:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
+  needs:
+    job: amd64-centos8-container
   script: .gitlab-ci.d/check-patch.py
   except:
     variables:
@@ -668,6 +722,8 @@ check-patch:
 check-dco:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
+  needs:
+    job: amd64-centos8-container
   script: .gitlab-ci.d/check-dco.py
   except:
     variables:
@@ -678,6 +734,8 @@ check-dco:
 build-libvhost-user:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/fedora:latest
+  needs:
+    job: amd64-fedora-container
   before_script:
     - dnf install -y meson ninja-build
   script:
-- 
2.29.2


