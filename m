Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 739DE5BF00B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:24:07 +0200 (CEST)
Received: from localhost ([::1]:56130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oalew-000651-AO
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagzY-0005uK-FT
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:04 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:42968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagzW-0001pC-DF
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:04 -0400
Received: by mail-ej1-x630.google.com with SMTP id sb3so7821612ejb.9
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=3o2V5qY3va6oi4DyilHks2k3IlXaipM0Pd6rZp5g9VI=;
 b=YQJG+rBphFdJCXfNXYp9mcOEYXawJ2q71kwTopRUYoXoH9GPnA2DAjFNUkMJdZQrVM
 BTvK8Z+qxSdlXufOAWRTcou7phTZlqI8IcTIEo2aNgsrRdlnUr2yxWE3akcAiB9MbeyZ
 2Cz4VUbtwaM7QgZ/qW4TTo0kKH1LKRSrk5auvSznf3VsFXVO+rHBXLhGNkk0f/wKfDBU
 gJLXkS9YqYuXaVFqhyXz8wiRUYp1pqIV/Bdhdnz5l1UQJmOcda9H7rceMdcA/5fwyVwf
 Pgjx4pyKYMlAooKAObN+e1s06lJd6hMJSB6COAaPtjYwL9QZfNqbpK6csy4Rub5ayPp4
 8BUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=3o2V5qY3va6oi4DyilHks2k3IlXaipM0Pd6rZp5g9VI=;
 b=pI2xFdWwCAhnFXiTR4vcVe2t7RgvYvDolyo5E88ZgDtYYVMhCPWvuCnnRwb8jIFsna
 cLxrKjWg/t7VxwA0XsR473akgCcLnH2x1lENjHaHPl0h5Mi44RqsVwdLMGdnNsNfS77o
 fREW4TcsslFUxs7BeWQ5cbxm1jJMa/b/u7bpb/ZH9ZIouNdUEC09XEug1pcWQ+2w0/ba
 WQlz9LUJch9sUILGWGACXkLx3FbdLwDjWYwEtlFJuBVtvEHN2YnBceFbQZT9wWQSSBkR
 /QpAw1lmodyDAlg80xVxmWxMBU7gbfgDd4JrZlm/x/Td9bJELLDcmTtJsGY6DRgOzpGp
 iMXg==
X-Gm-Message-State: ACrzQf3CjwuRDmWzfhve5bCutnZs2oZ9K/o86sepDmqr/sqU9R0U7R7o
 Gi+Z0+VLjXD2GCepBJKXGl4KqA==
X-Google-Smtp-Source: AMsMyM61IzQCjkrS5739uFQwz2yQQCPtiEKHJ0Lx1/DsCmUQaroBz4cFh4zRIG2caSP1VyCs+ej/Qg==
X-Received: by 2002:a17:906:b106:b0:780:83a8:773 with SMTP id
 u6-20020a170906b10600b0078083a80773mr17596317ejy.758.1663694700731; 
 Tue, 20 Sep 2022 10:25:00 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a170906768a00b00781e7d364ebsm145286ejm.144.2022.09.20.10.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:24:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C09121FFCB;
 Tue, 20 Sep 2022 18:15:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 20/30] gitlab-ci: update aarch32/aarch64 custom runner jobs
Date: Tue, 20 Sep 2022 18:15:23 +0100
Message-Id: <20220920171533.1098094-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920171533.1098094-1-alex.bennee@linaro.org>
References: <20220920171533.1098094-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The custom runner is now using 22.04 so we can drop our hacks to deal
with broken libssh and glusterfs. The provisioning scripts will be
updated in a separate commit.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220914155950.804707-21-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
index 15aaccc481..97f99e29c2 100644
--- a/.gitlab-ci.d/custom-runners.yml
+++ b/.gitlab-ci.d/custom-runners.yml
@@ -15,6 +15,6 @@ variables:
 
 include:
   - local: '/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml'
-  - local: '/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml'
-  - local: '/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml'
+  - local: '/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml'
+  - local: '/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml'
   - local: '/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml'
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml
similarity index 86%
rename from .gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml
rename to .gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml
index cbfa9cc164..1a2f9b8dbe 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml
@@ -1,12 +1,12 @@
-# All ubuntu-20.04 jobs should run successfully in an environment
+# All ubuntu-22.04 jobs should run successfully in an environment
 # setup by the scripts/ci/setup/qemu/build-environment.yml task
 # "Install basic packages to build QEMU on Ubuntu 20.04"
 
-ubuntu-20.04-aarch32-all:
+ubuntu-22.04-aarch32-all:
  needs: []
  stage: build
  tags:
- - ubuntu_20.04
+ - ubuntu_22.04
  - aarch32
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
similarity index 82%
rename from .gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
rename to .gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
index 3f4dee4f86..ce0b18af6f 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
@@ -2,23 +2,21 @@
 # setup by the scripts/ci/setup/qemu/build-environment.yml task
 # "Install basic packages to build QEMU on Ubuntu 20.04"
 
-ubuntu-20.04-aarch64-all-linux-static:
+ubuntu-22.04-aarch64-all-linux-static:
  needs: []
  stage: build
  tags:
- - ubuntu_20.04
+ - ubuntu_22.04
  - aarch64
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
  - if: "$AARCH64_RUNNER_AVAILABLE"
  script:
- # --disable-libssh is needed because of https://bugs.launchpad.net/qemu/+bug/1838763
- # --disable-glusterfs is needed because there's no static version of those libs in distro supplied packages
  - mkdir build
  - cd build
  # Disable -static-pie due to build error with system libc:
  # https://bugs.launchpad.net/ubuntu/+source/glibc/+bug/1987438
- - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh --disable-pie
+ - ../configure --enable-debug --static --disable-system --disable-pie
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc --ignore=40`
  - make --output-sync -j`nproc --ignore=40` check V=1
@@ -26,11 +24,11 @@ ubuntu-20.04-aarch64-all-linux-static:
  - make --output-sync -j`nproc --ignore=40` check-tcg V=1
    || { cat meson-logs/testlog.txt; exit 1; } ;
 
-ubuntu-20.04-aarch64-all:
+ubuntu-22.04-aarch64-all:
  needs: []
  stage: build
  tags:
- - ubuntu_20.04
+ - ubuntu_22.04
  - aarch64
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
@@ -42,17 +40,17 @@ ubuntu-20.04-aarch64-all:
  script:
  - mkdir build
  - cd build
- - ../configure --disable-libssh
+ - ../configure
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc --ignore=40`
  - make --output-sync -j`nproc --ignore=40` check V=1
    || { cat meson-logs/testlog.txt; exit 1; } ;
 
-ubuntu-20.04-aarch64-alldbg:
+ubuntu-22.04-aarch64-alldbg:
  needs: []
  stage: build
  tags:
- - ubuntu_20.04
+ - ubuntu_22.04
  - aarch64
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
@@ -60,18 +58,18 @@ ubuntu-20.04-aarch64-alldbg:
  script:
  - mkdir build
  - cd build
- - ../configure --enable-debug --disable-libssh
+ - ../configure --enable-debug
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make clean
  - make --output-sync -j`nproc --ignore=40`
  - make --output-sync -j`nproc --ignore=40` check V=1
    || { cat meson-logs/testlog.txt; exit 1; } ;
 
-ubuntu-20.04-aarch64-clang:
+ubuntu-22.04-aarch64-clang:
  needs: []
  stage: build
  tags:
- - ubuntu_20.04
+ - ubuntu_22.04
  - aarch64
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
@@ -89,11 +87,11 @@ ubuntu-20.04-aarch64-clang:
  - make --output-sync -j`nproc --ignore=40` check V=1
    || { cat meson-logs/testlog.txt; exit 1; } ;
 
-ubuntu-20.04-aarch64-tci:
+ubuntu-22.04-aarch64-tci:
  needs: []
  stage: build
  tags:
- - ubuntu_20.04
+ - ubuntu_22.04
  - aarch64
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
@@ -105,15 +103,15 @@ ubuntu-20.04-aarch64-tci:
  script:
  - mkdir build
  - cd build
- - ../configure --disable-libssh --enable-tcg-interpreter
+ - ../configure --enable-tcg-interpreter
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc --ignore=40`
 
-ubuntu-20.04-aarch64-notcg:
+ubuntu-22.04-aarch64-notcg:
  needs: []
  stage: build
  tags:
- - ubuntu_20.04
+ - ubuntu_22.04
  - aarch64
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
@@ -125,7 +123,7 @@ ubuntu-20.04-aarch64-notcg:
  script:
  - mkdir build
  - cd build
- - ../configure --disable-libssh --disable-tcg
+ - ../configure --disable-tcg
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc --ignore=40`
  - make --output-sync -j`nproc --ignore=40` check V=1
diff --git a/MAINTAINERS b/MAINTAINERS
index 1729c0901c..738c4eb647 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3724,7 +3724,8 @@ GitLab custom runner (Works On Arm Sponsored)
 M: Alex Bennée <alex.bennee@linaro.org>
 M: Philippe Mathieu-Daudé <f4bug@amsat.org>
 S: Maintained
-F: .gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
+F: .gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
+F: .gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml
 
 Documentation
 -------------
-- 
2.34.1


