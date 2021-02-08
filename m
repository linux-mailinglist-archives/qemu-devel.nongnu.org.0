Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B57314222
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 22:44:36 +0100 (CET)
Received: from localhost ([::1]:49960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9EKh-000726-FZ
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 16:44:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l99U9-0002bb-WC
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 11:34:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l99U4-0002Vm-Ro
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 11:34:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612802035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F6F4/Pf0JDV1zDTXyNcXyEgnHkUD06JvcC+6AQ1Hfu8=;
 b=NTjjqgZRJqkHp8Zw2KktsS02Gfj/fGAYSOa+48yv2NftNfCOOSFDjL1JkUQouuE8XbHJDW
 Uffq/9XEJNbjrmVUFSIrSwNmJhdBb82k3oAvAbnrcCHtz39KSOAvR6mU3RvhzROfKrPUSE
 uACuWkJnCaL/2vxwaAr+z2SnpCdR2yQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-vs2iMnYqOg2mgqFzALE9Zg-1; Mon, 08 Feb 2021 11:33:52 -0500
X-MC-Unique: vs2iMnYqOg2mgqFzALE9Zg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 484E03E750;
 Mon,  8 Feb 2021 16:33:51 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-97.ams2.redhat.com
 [10.36.115.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8811219C59;
 Mon,  8 Feb 2021 16:33:49 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] gitlab: add fine grained job deps for all build jobs
Date: Mon,  8 Feb 2021 16:33:38 +0000
Message-Id: <20210208163339.1159514-3-berrange@redhat.com>
In-Reply-To: <20210208163339.1159514-1-berrange@redhat.com>
References: <20210208163339.1159514-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows the build jobs to start running as soon as their respective
container image is ready, instead of waiting for all container builds
to finish.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitlab-ci.yml | 58 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 7c0db64710..a1d5a876e3 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -110,6 +110,8 @@ acceptance-system-alpine:
 
 build-system-ubuntu:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-ubuntu2004-container
   variables:
     IMAGE: ubuntu2004
     CONFIGURE_ARGS: --enable-fdt=system --enable-slirp=system
@@ -142,6 +144,8 @@ acceptance-system-ubuntu:
 
 build-system-debian:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-debian-container
   variables:
     IMAGE: debian-amd64
     CONFIGURE_ARGS: --enable-fdt=system
@@ -187,6 +191,8 @@ acceptance-system-debian:
 
 build-system-fedora:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-fedora-container
   variables:
     IMAGE: fedora
     CONFIGURE_ARGS: --disable-gcrypt --enable-nettle --enable-docs
@@ -220,6 +226,8 @@ acceptance-system-fedora:
 
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
     CONFIGURE_ARGS: --disable-tools --enable-debug-tcg
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
 
 build-clang:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-fedora-container
   variables:
     IMAGE: fedora
     CONFIGURE_ARGS: --cc=clang --cxx=clang++
@@ -445,6 +471,8 @@ build-clang:
 # These targets are on the way out
 build-deprecated:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-debian-user-cross-container
   variables:
     IMAGE: debian-all-test-cross
     CONFIGURE_ARGS: --disable-docs --disable-tools
@@ -470,6 +498,8 @@ check-deprecated:
 
 build-oss-fuzz:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-fedora-container
   variables:
     IMAGE: fedora
   script:
@@ -488,6 +518,8 @@ build-oss-fuzz:
 
 build-tci:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-fedora-container
   variables:
     IMAGE: fedora
   script:
@@ -511,6 +543,8 @@ build-tci:
 # However we can't test against KVM on Gitlab-CI so we can only run unit tests
 build-coroutine-ucontext:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-ubuntu2004-container
   variables:
     IMAGE: ubuntu2004
     CONFIGURE_ARGS: --with-coroutine=ucontext --disable-tcg
@@ -518,6 +552,8 @@ build-coroutine-ucontext:
 
 build-coroutine-sigaltstack:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-ubuntu2004-container
   variables:
     IMAGE: ubuntu2004
     CONFIGURE_ARGS: --with-coroutine=sigaltstack --disable-tcg
@@ -529,6 +565,8 @@ build-coroutine-sigaltstack:
 # which had some API differences.
 build-crypto-old-nettle:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-centos7-container
   variables:
     IMAGE: centos7
     TARGETS: x86_64-softmmu x86_64-linux-user
@@ -550,6 +588,8 @@ check-crypto-old-nettle:
 
 build-crypto-old-gcrypt:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-centos7-container
   variables:
     IMAGE: centos7
     TARGETS: x86_64-softmmu x86_64-linux-user
@@ -571,6 +611,8 @@ check-crypto-old-gcrypt:
 
 build-crypto-only-gnutls:
   <<: *native_build_job_definition
+  needs:
+    job: amd64-centos7-container
   variables:
     IMAGE: centos7
     TARGETS: x86_64-softmmu x86_64-linux-user
@@ -592,18 +634,24 @@ check-crypto-only-gnutls:
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
@@ -611,12 +659,16 @@ build-trace-ust-system:
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
@@ -626,6 +678,8 @@ build-without-default-features:
 check-patch:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
+  needs:
+    job: amd64-centos8-container
   script: .gitlab-ci.d/check-patch.py
   except:
     variables:
@@ -637,6 +691,8 @@ check-patch:
 check-dco:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
+  needs:
+    job: amd64-centos8-container
   script: .gitlab-ci.d/check-dco.py
   except:
     variables:
@@ -647,6 +703,8 @@ check-dco:
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


