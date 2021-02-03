Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D4730D8D5
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 12:39:00 +0100 (CET)
Received: from localhost ([::1]:47024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7GUt-0007Hp-Cd
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 06:38:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7GPE-00029s-Tm
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 06:33:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7GP7-0004x9-BF
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 06:33:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612351980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7mce3RsmzlQLob1lb4XH87x4LTgKZJZSJVhQCefRp0M=;
 b=ICWtFeyJQrxn2z0eBttyUQfm6J/4HsyAA43J1JW5uZrfsWACFkxxEwbfH1PXLVZqEFfxQn
 0IWZ+p5kPu15N1zgDMrczwn9dR9E0pbu2K5g5XzoRHhjGWxIEYxYhmlmjsy1GHAEDxnefk
 Q98ydtlV4q7mVRkk0nYaY+LLxrq7txE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-_eqqbsJRO_K7O4opYBntug-1; Wed, 03 Feb 2021 06:32:57 -0500
X-MC-Unique: _eqqbsJRO_K7O4opYBntug-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D33619611A0;
 Wed,  3 Feb 2021 11:32:56 +0000 (UTC)
Received: from thuth.com (ovpn-112-165.ams2.redhat.com [10.36.112.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68B5460C66;
 Wed,  3 Feb 2021 11:32:52 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 2/6] travis.yml: Move the -fsanitize=undefined test to the
 gitlab-CI
Date: Wed,  3 Feb 2021 12:32:39 +0100
Message-Id: <20210203113243.280883-3-thuth@redhat.com>
In-Reply-To: <20210203113243.280883-1-thuth@redhat.com>
References: <20210203113243.280883-1-thuth@redhat.com>
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
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
 .gitlab-ci.yml | 13 +++++++++++--
 .travis.yml    | 27 ---------------------------
 2 files changed, 11 insertions(+), 29 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 8b97b512bb..41e11b41e4 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -433,13 +433,22 @@ build-some-softmmu-plugins:
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
+      --extra-cflags=-fno-sanitize-recover=undefined
     MAKE_CHECK_ARGS: check
 
 # These targets are on the way out
diff --git a/.travis.yml b/.travis.yml
index 76b69f6de1..d1e9016da5 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -139,33 +139,6 @@ jobs:
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


