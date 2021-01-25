Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B794C30231A
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 10:06:49 +0100 (CET)
Received: from localhost ([::1]:59746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3xpg-0005Gs-QF
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 04:06:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l3xmp-0003ZC-S8
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 04:03:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l3xmn-0008Og-Vc
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 04:03:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611565428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fuOZU6GFhgPX1cSJscPco9avSBz6z7Q8cXG1j2DIOII=;
 b=YiaNH1ykYRqU9U+NnZ5sIJjX/q5j5pZ+scxOv1MQJAvUIaIYDZb+8rvjD5d7O0kDQswT/q
 Y4mGK0VagbV9S3NXP/BFkJZWJO3tAs86BlUHP+xplf6clJNwzuiXlmpXfMNWeJcbVmtkJA
 //VoqAqji83pHGefTI66shPjzN5qgAQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-1fgcc_RKM9e6ANYP6eT5Jg-1; Mon, 25 Jan 2021 04:03:46 -0500
X-MC-Unique: 1fgcc_RKM9e6ANYP6eT5Jg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBE3F80A5C0
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 09:03:45 +0000 (UTC)
Received: from thuth.com (ovpn-112-127.ams2.redhat.com [10.36.112.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B5E71A890;
 Mon, 25 Jan 2021 09:03:41 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1] gitlab-ci.yml: Speed up CI by using "meson test
 --no-rebuild"
Date: Mon, 25 Jan 2021 10:03:39 +0100
Message-Id: <20210125090339.134019-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, our check-system-* jobs are recompiling the whole sources
again. This happens due to the fact that the jobs are checking out
the whole source tree and required submodules again, and only try
to use the "build" directory with the binaries and object files
as an artifact from the previous stage - which simply does not work
anymore (with the current version of meson). Due to some changed
time stamps, meson is always trying to rebuild the whole tree.

To fix this problem, we can use "meson test --no-rebuild" instead of
make check" to avoid rebuilding all binaries every time. However, the
iotests ("make check-block") are not run by "meson test", so we have
to execute these manually now. But instead of adding them to the same
job as "meson test", it's better to put them into a separate new job
instead, to keep things nicely running in parallel in the CI.
This saves ca. 15 - 20 minutes of precious CI cycles in each run.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 RFC -> v1: Added iotests

 .gitlab-ci.yml | 113 ++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 94 insertions(+), 19 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index de3a3d25b5..0834267a37 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -34,6 +34,26 @@ include:
         make -j"$JOBS" $MAKE_CHECK_ARGS ;
       fi
 
+.native_meson_test_job:
+  stage: test
+  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
+  script:
+    - cd build
+    - touch *
+    - make git-submodule-update
+    - if [ -x ../meson/meson.py ]; then
+          ../meson/meson.py test --no-rebuild -t 5 $MESON_TEST_ARGS ;
+      else
+          meson test --no-rebuild -t 5 $MESON_TEST_ARGS ;
+      fi
+
+.native_iotest_job:
+  stage: test
+  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
+  script:
+    - cd build/tests/qemu-iotests/
+    - ./check -g auto -qcow2
+
 .native_test_job_template: &native_test_job_definition
   stage: test
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
@@ -83,17 +103,15 @@ build-system-alpine:
   artifacts:
     expire_in: 2 days
     paths:
-      - .git-submodule-status
       - build
 
 check-system-alpine:
-  <<: *native_test_job_definition
+  extends: .native_meson_test_job
   needs:
     - job: build-system-alpine
       artifacts: true
   variables:
     IMAGE: alpine
-    MAKE_CHECK_ARGS: check
 
 acceptance-system-alpine:
   <<: *native_test_job_definition
@@ -118,13 +136,20 @@ build-system-ubuntu:
       - build
 
 check-system-ubuntu:
-  <<: *native_test_job_definition
+  extends: .native_meson_test_job
+  needs:
+    - job: build-system-ubuntu
+      artifacts: true
+  variables:
+    IMAGE: ubuntu2004
+
+iotest-ubuntu:
+  extends: .native_iotest_job
   needs:
     - job: build-system-ubuntu
       artifacts: true
   variables:
     IMAGE: ubuntu2004
-    MAKE_CHECK_ARGS: check
 
 acceptance-system-ubuntu:
   <<: *native_test_job_definition
@@ -149,13 +174,20 @@ build-system-debian:
       - build
 
 check-system-debian:
-  <<: *native_test_job_definition
+  extends: .native_meson_test_job
+  needs:
+    - job: build-system-debian
+      artifacts: true
+  variables:
+    IMAGE: debian-amd64
+
+iotest-debian:
+  extends: .native_iotest_job
   needs:
     - job: build-system-debian
       artifacts: true
   variables:
     IMAGE: debian-amd64
-    MAKE_CHECK_ARGS: check
 
 # No targets are built here, just tools, docs, and unit tests. This
 # also feeds into the eventual documentation deployment steps later
@@ -194,13 +226,20 @@ build-system-fedora:
       - build
 
 check-system-fedora:
-  <<: *native_test_job_definition
+  extends: .native_meson_test_job
+  needs:
+    - job: build-system-fedora
+      artifacts: true
+  variables:
+    IMAGE: fedora
+
+iotest-fedora:
+  extends: .native_iotest_job
   needs:
     - job: build-system-fedora
       artifacts: true
   variables:
     IMAGE: fedora
-    MAKE_CHECK_ARGS: check
 
 acceptance-system-fedora:
   <<: *native_test_job_definition
@@ -226,13 +265,20 @@ build-system-centos:
       - build
 
 check-system-centos:
-  <<: *native_test_job_definition
+  extends: .native_meson_test_job
+  needs:
+    - job: build-system-centos
+      artifacts: true
+  variables:
+    IMAGE: centos8
+
+iotest-centos:
+  extends: .native_iotest_job
   needs:
     - job: build-system-centos
       artifacts: true
   variables:
     IMAGE: centos8
-    MAKE_CHECK_ARGS: check
 
 acceptance-system-centos:
   <<: *native_test_job_definition
@@ -256,13 +302,20 @@ build-system-opensuse:
       - build
 
 check-system-opensuse:
-  <<: *native_test_job_definition
+  extends: .native_meson_test_job
+  needs:
+    - job: build-system-opensuse
+      artifacts: true
+  variables:
+    IMAGE: opensuse-leap
+
+iotest-opensuse:
+  extends: .native_iotest_job
   needs:
     - job: build-system-opensuse
       artifacts: true
   variables:
     IMAGE: opensuse-leap
-    MAKE_CHECK_ARGS: check
 
 acceptance-system-opensuse:
    <<: *native_test_job_definition
@@ -525,13 +578,20 @@ build-crypto-old-nettle:
       - build
 
 check-crypto-old-nettle:
-  <<: *native_test_job_definition
+  extends: .native_meson_test_job
+  needs:
+    - job: build-crypto-old-nettle
+      artifacts: true
+  variables:
+    IMAGE: centos7
+
+iotest-crypto-old-nettle:
+  extends: .native_iotest_job
   needs:
     - job: build-crypto-old-nettle
       artifacts: true
   variables:
     IMAGE: centos7
-    MAKE_CHECK_ARGS: check
 
 
 build-crypto-old-gcrypt:
@@ -546,13 +606,20 @@ build-crypto-old-gcrypt:
       - build
 
 check-crypto-old-gcrypt:
-  <<: *native_test_job_definition
+  extends: .native_meson_test_job
+  needs:
+    - job: build-crypto-old-gcrypt
+      artifacts: true
+  variables:
+    IMAGE: centos7
+
+iotest-crypto-old-gcrypt:
+  extends: .native_iotest_job
   needs:
     - job: build-crypto-old-gcrypt
       artifacts: true
   variables:
     IMAGE: centos7
-    MAKE_CHECK_ARGS: check
 
 
 build-crypto-only-gnutls:
@@ -567,13 +634,21 @@ build-crypto-only-gnutls:
       - build
 
 check-crypto-only-gnutls:
-  <<: *native_test_job_definition
+  extends: .native_meson_test_job
   needs:
     - job: build-crypto-only-gnutls
       artifacts: true
   variables:
     IMAGE: centos7
-    MAKE_CHECK_ARGS: check
+
+iotest-crypto-only-gnutls:
+  extends: .native_iotest_job
+  needs:
+    - job: build-crypto-only-gnutls
+      artifacts: true
+  variables:
+    IMAGE: centos7
+
 
 # We don't need to exercise every backend with every front-end
 build-trace-multi-user:
-- 
2.27.0


