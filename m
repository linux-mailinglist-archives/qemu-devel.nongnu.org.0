Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB5E2F6802
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 18:46:20 +0100 (CET)
Received: from localhost ([::1]:43706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l06hP-00084F-DP
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 12:46:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l05wh-0004AZ-Nz
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:58:04 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:53826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l05wc-000523-MS
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:58:03 -0500
Received: by mail-wm1-x334.google.com with SMTP id k10so5124092wmi.3
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 08:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9JpC1mWgLmwJxGRdsrqqvZFFaeRen9lexSEko48v++A=;
 b=eTF9RRjZo+R9dvZQPwIzawdpeYOqESODUt8HwYy9Zwq/KCz8MzT7ULMaTLeGdIVFAx
 eD9vbJtNvIfPOuuXZMhmrbaZXCPPM6dkQQUuZmlY2huL8e7GHzbTiKKHZwq5sDqEITFT
 WkIXoCGA4qOyZGQCts6JIVEYNvmFXa0VDd3/9HJ84oCEJL7KErCnigOJ+tHN6UKg1K+y
 DfDn759XF1nSd6HCX6TRJ/DKn6pBA0I1wPN3pKbebGyvFkyZ2GRh0ikRio4fF7YYgtx2
 vEn7plxLzFVdpi8F7D9Shvn4BYEqDC4HK2hgemPF9qPjaX3khc8jLfITae+3p+hgBrlQ
 Xl/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9JpC1mWgLmwJxGRdsrqqvZFFaeRen9lexSEko48v++A=;
 b=AMJhbxtwsoesrAokPWVHLHfLpjarLHpsQc3gQxqeF2b7V6RaFwltNfqUvIxu+GGt8/
 duFuESX/OlmsNXEJ0QQFohYNuIXdDXUeWIDgSyGI2JxV9aA74HAT3g5CPF0qgXPP3/5J
 3QJkcHPM9k3ANPdeOLMRMyN12vyn7XoGa8uuLkXmgX3A3I/25UY5qlOoQk5rIBAxz5LG
 ebgsqC3BKbvgnBvkgrvCBaKrpYGwJ895PmXPrzkdQE/1VhyoiErzQjTQxmtFoG6G8l/r
 isdXHI9cMwvkI1/x3cRKXV2gks9Bz6vqks3HaSPIlXN5UPyTQzKM3PU4pO3/J0P06+/6
 D0Fw==
X-Gm-Message-State: AOAM530gqt6ptWFH0Ors0l4Gf9VMMNa3pi5POT7GeBg0QH2U5iNjHTcg
 dUHNzZgh2RbmWKrMkShE0J5KKjzlwMrVBA==
X-Google-Smtp-Source: ABdhPJyinu07XZ+r+YcWGcKvv9xVbSEN/Yhomed32OM03bTHb7TX914qrFZ+1ddjmNKoYXJs4x3PbA==
X-Received: by 2002:a7b:c306:: with SMTP id k6mr4742318wmj.52.1610643473956;
 Thu, 14 Jan 2021 08:57:53 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m17sm11730545wrn.0.2021.01.14.08.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 08:57:47 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DDCBD1FF98;
 Thu, 14 Jan 2021 16:57:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/12] gitlab: move docs and tools build across from Travis
Date: Thu, 14 Jan 2021 16:57:27 +0000
Message-Id: <20210114165730.31607-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210114165730.31607-1-alex.bennee@linaro.org>
References: <20210114165730.31607-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While we are at it we might as well check the tag generation. For
bonus points we run GNU globals htags into the public pages directory
for publishing with the auto generated pages.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Acked-by: Thomas Huth <thuth@redhat.com>

---
v2
  - explicit disable-system/user
  - add some comments, reduce size of HTML dump
---
 .gitlab-ci.yml | 28 ++++++++++++++++++++++------
 .travis.yml    | 16 ----------------
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 4532f1718a..bd60f3e741 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -79,7 +79,6 @@ build-system-ubuntu:
     TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
       moxie-softmmu microblazeel-softmmu mips64el-softmmu
     MAKE_CHECK_ARGS: check-build
-    CONFIGURE_ARGS: --enable-docs
   artifacts:
     expire_in: 2 days
     paths:
@@ -111,7 +110,6 @@ build-system-debian:
     TARGETS: arm-softmmu avr-softmmu i386-softmmu mipsel-softmmu
       riscv64-softmmu sh4eb-softmmu sparc-softmmu xtensaeb-softmmu
     MAKE_CHECK_ARGS: check-build
-    CONFIGURE_ARGS: --enable-docs
   artifacts:
     expire_in: 2 days
     paths:
@@ -126,6 +124,17 @@ check-system-debian:
     IMAGE: debian-amd64
     MAKE_CHECK_ARGS: check
 
+build-tools-and-docs-debian:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: debian-amd64
+    MAKE_CHECK_ARGS: ctags TAGS cscope
+    CONFIGURE_ARGS: --disable-system --disable-user --enable-docs --enable-tools
+  artifacts:
+    expire_in: 2 days
+    paths:
+      - build
+
 acceptance-system-debian:
   <<: *native_test_job_definition
   needs:
@@ -596,14 +605,21 @@ build-libvhost-user:
     - meson
     - ninja
 
+# Prepare for GitLab pages deployment. Anything copied into the
+# "public" directory will be deployed to $USER.gitlab.io/$PROJECT
 pages:
-  image: $CI_REGISTRY_IMAGE/qemu/ubuntu2004:latest
+  image: $CI_REGISTRY_IMAGE/qemu/debian-amd64:latest
   stage: test
   needs:
-    - job: build-system-ubuntu
-      artifacts: true
+    - job: build-tools-and-docs-debian
   script:
-    - mkdir public
+    - mkdir -p public
+    # HTML-ised source tree
+    - make gtags
+    - htags -anT --tree-view=filetree -m qemu_init
+        -t "Welcome to the QEMU sourcecode"
+    - mv HTML public/src
+    # Project documentation
     - mv build/docs/index.html public/
     - for i in devel interop specs system tools user ; do mv build/docs/$i public/ ; done
   artifacts:
diff --git a/.travis.yml b/.travis.yml
index f2a101936c..3b574a5968 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -148,22 +148,6 @@ jobs:
         - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
 
 
-    # Check we can build docs and tools (out of tree)
-    - name: "tools and docs (bionic)"
-      dist: bionic
-      env:
-        - BUILD_DIR="out-of-tree/build/dir" SRC_DIR="../../.."
-        - BASE_CONFIG="--enable-tools --enable-docs"
-        - CONFIG="--target-list=x86_64-softmmu,aarch64-linux-user"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
-      addons:
-        apt:
-          packages:
-            - ninja-build
-            - python3-sphinx
-            - perl
-
-
     # Test with Clang for compile portability (Travis uses clang-5.0)
     - name: "Clang (user)"
       env:
-- 
2.20.1


