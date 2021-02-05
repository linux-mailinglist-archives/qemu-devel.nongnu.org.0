Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CED31079F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 10:22:38 +0100 (CET)
Received: from localhost ([::1]:57902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7xK1-0004PJ-B6
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 04:22:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7xGq-0002tH-Vc
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 04:19:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7xGj-0007qj-MP
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 04:19:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612516753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BnG9gKW5m92te462GPxO9z81/2m8AhegrV7+XZFHF8g=;
 b=VbkImzA6bRoDtJJrKEc624AdIWvFO2gPmdKdE+H8TS1fFoFnhEAnZriv5I8X4B5RWIWozF
 M2664PJduxVrNqdY6Ux6UPqknRMJ4HCICuOjNPc6BEz8GL98fFY7FoZD6MDB0YkJioqmoU
 EG0d87dX5OYWrKbH47DlGL8vvdziM7w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-Zp3-pyqGOpmVxDF9KwPjbg-1; Fri, 05 Feb 2021 04:19:11 -0500
X-MC-Unique: Zp3-pyqGOpmVxDF9KwPjbg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB2C1107ACC7;
 Fri,  5 Feb 2021 09:19:09 +0000 (UTC)
Received: from thuth.com (ovpn-112-46.ams2.redhat.com [10.36.112.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 81EA55D9CC;
 Fri,  5 Feb 2021 09:19:08 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 2/5] travis.yml: Move the -fsanitize=undefined test to the
 gitlab-CI
Date: Fri,  5 Feb 2021 10:18:54 +0100
Message-Id: <20210205091857.845389-3-thuth@redhat.com>
In-Reply-To: <20210205091857.845389-1-thuth@redhat.com>
References: <20210205091857.845389-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
 .gitlab-ci.yml | 14 ++++++++++++--
 .travis.yml    | 27 ---------------------------
 2 files changed, 12 insertions(+), 29 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 1070efce3f..1419eb4825 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -433,13 +433,23 @@ build-some-softmmu-plugins:
     TARGETS: xtensa-softmmu arm-softmmu aarch64-softmmu alpha-softmmu
     MAKE_CHECK_ARGS: check-tcg
 
-build-clang:
+clang-system:
   <<: *native_build_job_definition
   variables:
     IMAGE: fedora
     CONFIGURE_ARGS: --cc=clang --cxx=clang++
+      --extra-cflags=-fno-sanitize-recover=undefined
     TARGETS: alpha-softmmu arm-softmmu m68k-softmmu mips64-softmmu
-      ppc-softmmu s390x-softmmu arm-linux-user
+      ppc-softmmu s390x-softmmu
+    MAKE_CHECK_ARGS: check-qtest check-block check-tcg
+
+clang-user:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: fedora
+    CONFIGURE_ARGS: --cc=clang --cxx=clang++ --disable-system
+      --target-list-exclude=microblazeel-linux-user,aarch64-linux-user,armeb-linux-user,x86_64-linux-user,mipsn32el-linux-user,xtensa-linux-user
+      --extra-cflags=-fno-sanitize-recover=undefined
     MAKE_CHECK_ARGS: check
 
 # These targets are on the way out
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


