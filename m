Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D298A672451
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 17:59:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIBlW-0002TP-4f; Wed, 18 Jan 2023 11:58:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIBlU-0002TE-Ju
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 11:58:20 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIBlS-0003pc-Ll
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 11:58:20 -0500
Received: by mail-wr1-x436.google.com with SMTP id b5so13437138wrn.0
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 08:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pGcy7m167YyxLO7vlX12Q/W9krVoDL14tS+QgowG2zA=;
 b=u731LwTXCpbW/kCEc0u/yis0SW5BwunTT7+rge8Fk1nIqtr1ioDDIkINbjNk8fbYFH
 JgP/sOJmd7ulUqsHi+cPP+ya1t56qoi3sAGCOLGvLefK4my1tb2b86OUCvoCivTAm8g9
 tQVdpWTYraziT50ebNKhKQzs1zG925yqASIE653Y8ZAZjxHRGbrF1RbxD8rX4cc31Di7
 y+I3eF0ff5bbUf9npF/yhvvssog5GVOwUI9fZW7p7C8f0obuNz6k9bqt0qyUWTv9hg6Y
 eajVfbd2lggK8O2u8GPxp97OEyTuo5DygLhIE7iQFTJDE5mKZICYkOQkPMKro/CZy7Y4
 +pVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pGcy7m167YyxLO7vlX12Q/W9krVoDL14tS+QgowG2zA=;
 b=Xg6lMRkkVOexnY4mZk22f6c7Fq1uMc9Wlo2gz9kzohOR2Nm8bT/49vjdl5dFv/PcaK
 sIERS/3otj6Pd/E2aqFpQHC8aT/CkTt/4Ors/Yx3E8dfGJFXQOkApjo0H/TtwO2oXqqH
 UHnDyygwpF7lxg3BgtWS5g4kAXKN+HVl4xcy5DZSluIJrfmg8VBAoEIcGxHmA4rZ5mgx
 7m44KEu0juP5+97STDhOt9xoPaEJcLntxW6dwhffzivZjKJO5CMuJUy5bQLGhr3bWQXH
 hw5OTzohyEi8sPZg/wkpI3xkOWjoLWeyE86HIZ0cWXm++0EVOcNPtIGv+/BjqM6Oq7Pb
 b7qA==
X-Gm-Message-State: AFqh2kprDnDi791sxcuFDFYFkNwPg/rkjqVtbZ9jF/RPH3DtgMdTfKK0
 aVxNcls7gcHzPho5mt+BUFcBjQ==
X-Google-Smtp-Source: AMrXdXtq4bcHf9YjXZAywS4x6jFW1a8JQnGXoPi3ps/nH3Qjm5nK8kBr75BHcXSB80ZPZDAyByLDIg==
X-Received: by 2002:a05:6000:1e0f:b0:2bd:fe42:2b34 with SMTP id
 bj15-20020a0560001e0f00b002bdfe422b34mr7202885wrb.71.1674061096848; 
 Wed, 18 Jan 2023 08:58:16 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a5d4010000000b002bbed1388a5sm26541851wrp.15.2023.01.18.08.58.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 08:58:16 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0DA3E1FFB7;
 Wed, 18 Jan 2023 16:58:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [RFC PATCH] gitlab: wrap up test results for custom runners
Date: Wed, 18 Jan 2023 16:58:08 +0000
Message-Id: <20230118165808.3698641-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Instead of spewing the whole log to stdout lets just define them as
build artefacts so we can examine them later. Where we are running
check-tcg run it first as those tests are yet to be integrated into
meson.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/custom-runners.yml                     | 11 +++++++++++
 .gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml  | 13 ++++++-------
 .../custom-runners/ubuntu-22.04-aarch32.yml         |  2 +-
 .../custom-runners/ubuntu-22.04-aarch64.yml         | 13 ++++++-------
 4 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
index 97f99e29c2..9fdc476c48 100644
--- a/.gitlab-ci.d/custom-runners.yml
+++ b/.gitlab-ci.d/custom-runners.yml
@@ -13,6 +13,17 @@
 variables:
   GIT_STRATEGY: clone
 
+# All custom runners can extend this template to upload the testlog
+# data as an artifact and also feed the junit report
+.custom_artifacts_template:
+  artifacts:
+    name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
+    expire_in: 7 days
+    paths:
+      - build/meson-logs/testlog.txt
+    reports:
+      junit: build/meson-logs/testlog.junit.xml
+
 include:
   - local: '/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml'
   - local: '/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml'
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
index fcaef9e5ef..f512eaeaa3 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
@@ -3,6 +3,7 @@
 # "Install basic packages to build QEMU on Ubuntu 20.04/20.04"
 
 ubuntu-20.04-s390x-all-linux-static:
+ extends: .custom_artifacts_template
  needs: []
  stage: build
  tags:
@@ -19,12 +20,11 @@ ubuntu-20.04-s390x-all-linux-static:
  - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc`
+ - make --output-sync check-tcg
  - make --output-sync -j`nproc` check
-   || { cat meson-logs/testlog.txt; exit 1; } ;
- - make --output-sync -j`nproc` check-tcg
-   || { cat meson-logs/testlog.txt; exit 1; } ;
 
 ubuntu-20.04-s390x-all:
+ extends: .custom_artifacts_template
  needs: []
  stage: build
  tags:
@@ -41,9 +41,9 @@ ubuntu-20.04-s390x-all:
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc`
  - make --output-sync -j`nproc` check
-   || { cat meson-logs/testlog.txt; exit 1; } ;
 
 ubuntu-20.04-s390x-alldbg:
+ extends: .custom_artifacts_template
  needs: []
  stage: build
  tags:
@@ -64,9 +64,9 @@ ubuntu-20.04-s390x-alldbg:
  - make clean
  - make --output-sync -j`nproc`
  - make --output-sync -j`nproc` check
-   || { cat meson-logs/testlog.txt; exit 1; } ;
 
 ubuntu-20.04-s390x-clang:
+ extends: .custom_artifacts_template
  needs: []
  stage: build
  tags:
@@ -86,7 +86,6 @@ ubuntu-20.04-s390x-clang:
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc`
  - make --output-sync -j`nproc` check
-   || { cat meson-logs/testlog.txt; exit 1; } ;
 
 ubuntu-20.04-s390x-tci:
  needs: []
@@ -109,6 +108,7 @@ ubuntu-20.04-s390x-tci:
  - make --output-sync -j`nproc`
 
 ubuntu-20.04-s390x-notcg:
+ extends: .custom_artifacts_template
  needs: []
  stage: build
  tags:
@@ -128,4 +128,3 @@ ubuntu-20.04-s390x-notcg:
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc`
  - make --output-sync -j`nproc` check
-   || { cat meson-logs/testlog.txt; exit 1; } ;
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml
index 2c386fa3e9..42137aaf2a 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml
@@ -3,6 +3,7 @@
 # "Install basic packages to build QEMU on Ubuntu 20.04"
 
 ubuntu-22.04-aarch32-all:
+ extends: .custom_artifacts_template
  needs: []
  stage: build
  tags:
@@ -22,4 +23,3 @@ ubuntu-22.04-aarch32-all:
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc --ignore=40`
  - make --output-sync -j`nproc --ignore=40` check
-   || { cat meson-logs/testlog.txt; exit 1; } ;
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
index 725ca8ffea..8ba85be440 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
@@ -3,6 +3,7 @@
 # "Install basic packages to build QEMU on Ubuntu 20.04"
 
 ubuntu-22.04-aarch64-all-linux-static:
+ extends: .custom_artifacts_template
  needs: []
  stage: build
  tags:
@@ -19,12 +20,11 @@ ubuntu-22.04-aarch64-all-linux-static:
  - ../configure --enable-debug --static --disable-system --disable-pie
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc --ignore=40`
+ - make check-tcg
  - make --output-sync -j`nproc --ignore=40` check
-   || { cat meson-logs/testlog.txt; exit 1; } ;
- - make --output-sync -j`nproc --ignore=40` check-tcg
-   || { cat meson-logs/testlog.txt; exit 1; } ;
 
 ubuntu-22.04-aarch64-all:
+ extends: .custom_artifacts_template
  needs: []
  stage: build
  tags:
@@ -44,9 +44,9 @@ ubuntu-22.04-aarch64-all:
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc --ignore=40`
  - make --output-sync -j`nproc --ignore=40` check
-   || { cat meson-logs/testlog.txt; exit 1; } ;
 
 ubuntu-22.04-aarch64-alldbg:
+ extends: .custom_artifacts_template
  needs: []
  stage: build
  tags:
@@ -63,9 +63,9 @@ ubuntu-22.04-aarch64-alldbg:
  - make clean
  - make --output-sync -j`nproc --ignore=40`
  - make --output-sync -j`nproc --ignore=40` check
-   || { cat meson-logs/testlog.txt; exit 1; } ;
 
 ubuntu-22.04-aarch64-clang:
+ extends: .custom_artifacts_template
  needs: []
  stage: build
  tags:
@@ -85,7 +85,6 @@ ubuntu-22.04-aarch64-clang:
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc --ignore=40`
  - make --output-sync -j`nproc --ignore=40` check
-   || { cat meson-logs/testlog.txt; exit 1; } ;
 
 ubuntu-22.04-aarch64-tci:
  needs: []
@@ -108,6 +107,7 @@ ubuntu-22.04-aarch64-tci:
  - make --output-sync -j`nproc --ignore=40`
 
 ubuntu-22.04-aarch64-notcg:
+ extends: .custom_artifacts_template
  needs: []
  stage: build
  tags:
@@ -127,4 +127,3 @@ ubuntu-22.04-aarch64-notcg:
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc --ignore=40`
  - make --output-sync -j`nproc --ignore=40` check
-   || { cat meson-logs/testlog.txt; exit 1; } ;
-- 
2.34.1


