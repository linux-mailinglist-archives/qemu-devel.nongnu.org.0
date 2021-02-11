Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7463318471
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 06:01:56 +0100 (CET)
Received: from localhost ([::1]:36134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA471-00016X-Vi
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 00:01:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lA40n-0004Em-G9
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 23:55:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lA40e-0002Wu-Kd
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 23:55:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613019319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xjw5uSx4ICxfJn4KU71iNBGfhoBWoIBG0SiJbSeC16s=;
 b=WyRAzrzwdpLz8pGIrLmO7I5VY3NhdWdtxFO/I4ldjHBqY3g2sbJm+tIojb1LHOMvE0Y2d4
 pxDv0S/Cs/TDLI5PjJIIBJztLFjsKdNg2/rNWrdQcwIL4n39QWPm9oWBJ5Y32ild8u2hu2
 umXjFploX56AAMvbnyjibn8ZFz52gmg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-KPJXVNVsPU6uGa5EvlWWdQ-1; Wed, 10 Feb 2021 23:55:17 -0500
X-MC-Unique: KPJXVNVsPU6uGa5EvlWWdQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A383D107ACC7;
 Thu, 11 Feb 2021 04:55:16 +0000 (UTC)
Received: from thuth.com (ovpn-112-46.ams2.redhat.com [10.36.112.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 383DF60C0F;
 Thu, 11 Feb 2021 04:55:10 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 2/5] travis.yml: Move the -fsanitize=undefined test to the
 gitlab-CI
Date: Thu, 11 Feb 2021 05:54:52 +0100
Message-Id: <20210211045455.456371-3-thuth@redhat.com>
In-Reply-To: <20210211045455.456371-1-thuth@redhat.com>
References: <20210211045455.456371-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Willian Rampazzo <wrampazz@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add it to the existing Clang job and also add a job that covers the
linux-user code with this compiler flag. To make sure that the detected
problems are not simply ignored, let's also use "-fno-sanitize-recover=..."
now instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.yml | 16 +++++++++++++---
 .travis.yml    | 27 ---------------------------
 2 files changed, 13 insertions(+), 30 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 222858b553..5f3d42221a 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -432,14 +432,24 @@ build-some-softmmu-plugins:
     TARGETS: xtensa-softmmu arm-softmmu aarch64-softmmu alpha-softmmu
     MAKE_CHECK_ARGS: check-tcg
 
-build-clang:
+clang-system:
   <<: *native_build_job_definition
   variables:
     IMAGE: fedora
     CONFIGURE_ARGS: --cc=clang --cxx=clang++
+      --extra-cflags=-fsanitize=undefined --extra-cflags=-fno-sanitize-recover=undefined
     TARGETS: alpha-softmmu arm-softmmu m68k-softmmu mips64-softmmu
-      ppc-softmmu s390x-softmmu arm-linux-user
-    MAKE_CHECK_ARGS: check
+      ppc-softmmu s390x-softmmu
+    MAKE_CHECK_ARGS: check-qtest check-tcg
+
+clang-user:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: debian-all-test-cross
+    CONFIGURE_ARGS: --cc=clang --cxx=clang++ --disable-system
+      --target-list-exclude=microblazeel-linux-user,aarch64_be-linux-user,i386-linux-user,m68k-linux-user,mipsn32el-linux-user,xtensaeb-linux-user
+      --extra-cflags=-fsanitize=undefined --extra-cflags=-fno-sanitize-recover=undefined
+    MAKE_CHECK_ARGS: check-unit check-tcg
 
 # These targets are on the way out
 build-deprecated:
diff --git a/.travis.yml b/.travis.yml
index 05fa1ca905..533a60c130 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -138,33 +138,6 @@ jobs:
         - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
 
 
-    # Test with Clang for compile portability (Travis uses clang-5.0)
-    - name: "Clang (user)"
-      env:
-        - CONFIG="--disable-system --host-cc=clang --cxx=clang++"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-clang-default"
-      compiler: clang
-
-
-    - name: "Clang (main-softmmu)"
-      env:
-        - CONFIG="--target-list=${MAIN_SOFTMMU_TARGETS}
-                  --host-cc=clang --cxx=clang++"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-clang-sanitize"
-      compiler: clang
-      before_script:
-        - mkdir -p ${BUILD_DIR} && cd ${BUILD_DIR}
-        - ${SRC_DIR}/configure ${CONFIG} --extra-cflags="-fsanitize=undefined -Werror" || { cat config.log meson-logs/meson-log.txt && exit 1; }
-
-
-    - name: "Clang (other-softmmu)"
-      env:
-        - CONFIG="--disable-user --target-list-exclude=${MAIN_SOFTMMU_TARGETS}
-                  --host-cc=clang --cxx=clang++"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-clang-default"
-      compiler: clang
-
-
     # Using newer GCC with sanitizers
     - name: "GCC9 with sanitizers (softmmu)"
       dist: bionic
-- 
2.27.0


