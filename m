Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EED301A67
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Jan 2021 09:00:08 +0100 (CET)
Received: from localhost ([::1]:57528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3aJV-00066F-8u
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 03:00:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l3aIX-0005fr-U6
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 02:59:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l3aIV-0001Em-Cg
 for qemu-devel@nongnu.org; Sun, 24 Jan 2021 02:59:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611475137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Gg5QnFTZ11N41JzF6xaKQJgKt0cIww/D35SOa4THD1g=;
 b=FUWPVBuzuxw/ZW8U93CYgjQJXsnrWXXYfW/VHzzyyp3yOhuOZvS7CDdZK+qzs1VoLU017B
 aBz875j0uyckroOIOK3JwPcx9yRBxa0p70uLSW3PyNIdhalCCr7esugp91eEf+Qthk3vEv
 4squpIzDGTRZrDl22Ssm8NZ/B8B9JLY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-Z3HQ8cP_PxWe7jTnTPYq0w-1; Sun, 24 Jan 2021 02:58:55 -0500
X-MC-Unique: Z3HQ8cP_PxWe7jTnTPYq0w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD17B107ACE3
 for <qemu-devel@nongnu.org>; Sun, 24 Jan 2021 07:58:54 +0000 (UTC)
Received: from thuth.com (ovpn-112-42.ams2.redhat.com [10.36.112.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68EC91346F;
 Sun, 24 Jan 2021 07:58:50 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [RFC PATCH] gitlab-ci.yml: Speed up CI by using "meson test
 --no-rebuild"
Date: Sun, 24 Jan 2021 08:58:48 +0100
Message-Id: <20210124075848.53971-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.165,
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
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, our check-system-* jobs are recompiling the whole sources
again. This happens due to the fact that the jobs are checking out
the whole source tree and required submodules again, and only try
to use the "build" directory with the binaries and object files
as an artifact from the previous stage - which simply does not work
anymore (with the current version of meson). Due to some changed
time stamps, meson is always trying to rebuild the whole tree.

To fix this problem, use "meson test --no-rebuild" instead of
"make check" to avoid rebuilding all binaries every time. This
saves ca. 15 - 20 minutes of precious CI cycles in each run.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Marked as "RFC" since I'm not quite sure whether "meson test" has
 the same test coverage as "make check"... Paolo?

 .gitlab-ci.yml | 41 ++++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index de3a3d25b5..c9fb11c325 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -34,6 +34,19 @@ include:
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
 .native_test_job_template: &native_test_job_definition
   stage: test
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
@@ -83,17 +96,15 @@ build-system-alpine:
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
@@ -118,13 +129,12 @@ build-system-ubuntu:
       - build
 
 check-system-ubuntu:
-  <<: *native_test_job_definition
+  extends: .native_meson_test_job
   needs:
     - job: build-system-ubuntu
       artifacts: true
   variables:
     IMAGE: ubuntu2004
-    MAKE_CHECK_ARGS: check
 
 acceptance-system-ubuntu:
   <<: *native_test_job_definition
@@ -149,13 +159,12 @@ build-system-debian:
       - build
 
 check-system-debian:
-  <<: *native_test_job_definition
+  extends: .native_meson_test_job
   needs:
     - job: build-system-debian
       artifacts: true
   variables:
     IMAGE: debian-amd64
-    MAKE_CHECK_ARGS: check
 
 # No targets are built here, just tools, docs, and unit tests. This
 # also feeds into the eventual documentation deployment steps later
@@ -194,13 +203,12 @@ build-system-fedora:
       - build
 
 check-system-fedora:
-  <<: *native_test_job_definition
+  extends: .native_meson_test_job
   needs:
     - job: build-system-fedora
       artifacts: true
   variables:
     IMAGE: fedora
-    MAKE_CHECK_ARGS: check
 
 acceptance-system-fedora:
   <<: *native_test_job_definition
@@ -226,13 +234,12 @@ build-system-centos:
       - build
 
 check-system-centos:
-  <<: *native_test_job_definition
+  extends: .native_meson_test_job
   needs:
     - job: build-system-centos
       artifacts: true
   variables:
     IMAGE: centos8
-    MAKE_CHECK_ARGS: check
 
 acceptance-system-centos:
   <<: *native_test_job_definition
@@ -256,13 +263,12 @@ build-system-opensuse:
       - build
 
 check-system-opensuse:
-  <<: *native_test_job_definition
+  extends: .native_meson_test_job
   needs:
     - job: build-system-opensuse
       artifacts: true
   variables:
     IMAGE: opensuse-leap
-    MAKE_CHECK_ARGS: check
 
 acceptance-system-opensuse:
    <<: *native_test_job_definition
@@ -525,13 +531,12 @@ build-crypto-old-nettle:
       - build
 
 check-crypto-old-nettle:
-  <<: *native_test_job_definition
+  extends: .native_meson_test_job
   needs:
     - job: build-crypto-old-nettle
       artifacts: true
   variables:
     IMAGE: centos7
-    MAKE_CHECK_ARGS: check
 
 
 build-crypto-old-gcrypt:
@@ -546,13 +551,12 @@ build-crypto-old-gcrypt:
       - build
 
 check-crypto-old-gcrypt:
-  <<: *native_test_job_definition
+  extends: .native_meson_test_job
   needs:
     - job: build-crypto-old-gcrypt
       artifacts: true
   variables:
     IMAGE: centos7
-    MAKE_CHECK_ARGS: check
 
 
 build-crypto-only-gnutls:
@@ -567,13 +571,12 @@ build-crypto-only-gnutls:
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
 
 # We don't need to exercise every backend with every front-end
 build-trace-multi-user:
-- 
2.27.0


