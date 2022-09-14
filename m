Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3587A5B8D80
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 18:51:15 +0200 (CEST)
Received: from localhost ([::1]:42274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYVbW-000505-Ao
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 12:51:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUu4-0001Ua-AY
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:06:20 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:47074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUu2-0003rv-6Y
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:06:20 -0400
Received: by mail-wr1-x435.google.com with SMTP id g3so5563338wrq.13
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 09:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=jW/HxwR3uoodS8LJxL2VV8mYc4s1IlkDnlKZ+eLVdLY=;
 b=G6wDpVNArZds0CLzvNDzjjGlxe85gsUfdtnzwQnkz9exrR+o3KtH7ZlWP/cFOoU/gX
 csuNXSWZtP1Rm7sUfdoZ7jI4lMH/iZfOq+CsehW58XWyKj2fsf6cVbmnrFRlnBryvvhS
 UZTT0ugDhlJaL7vDlAq+WCbTzdKPFSQxDK79jW17vO7RQoH5VvtBKj18DdSjd7ZaZCio
 XDUSB6C9ibTgbMtdPkhI1dIBthDQ2wuoRk1MxwBvTV0+5vzNGZrty3ZEyJ8KQSNP7Usq
 prbIuyEYvoMnJitYSW9O8Fe3LpAEfjjzVPnr96cbyPRZHx27YAAARD2p3IPjXx/q+nYP
 8Z7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=jW/HxwR3uoodS8LJxL2VV8mYc4s1IlkDnlKZ+eLVdLY=;
 b=wB1kOLIg8xbY4nMeg3fqLuCVo2q2yVObxyVdhWF+YRC2HeOmN3EmOnna+l04z/GwhA
 J0MW7ZinDmB6z+yHEYnbFxFU/SrLzNOclS/QXEBExe4GOIKJGgQJqGvFfz4UmDhgKXcy
 MOd5f9ZzhIwEFlXeNIGSBbPzi1esCCVWsuzZ2sNxlQ9JoYJNmVaeZmpQWoBdGQfd8lnU
 YrBmYInicO3GbAmNjmKDAHi/ciJnBqCow6GT4/OnyRcKiBJ4iAs/rYlHtASAYw93xN+r
 HtoEBF9X9t5EQnw5+wNF81ggyJ0bfZeO/3ZEW7E4kqImdbn4GPSNhbajRehCBTfVoT3q
 A2sQ==
X-Gm-Message-State: ACgBeo0+w3MgtlS+aA2QZZz6ye3N8wCUfHga8hhr23elL1sFlciCWbEg
 ZbMVh7Xtb+tyLcf6qQw8LVSz8Q==
X-Google-Smtp-Source: AA6agR6RUC6MVWNFx0xzh/wFlZTa1OIqUg+PCFJ/piBj4MZNjOwWsneLty9xmIvuKR7B1LjaNz479w==
X-Received: by 2002:a5d:6c6e:0:b0:22a:c36d:e411 with SMTP id
 r14-20020a5d6c6e000000b0022ac36de411mr4288574wrz.183.1663171575830; 
 Wed, 14 Sep 2022 09:06:15 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m7-20020a056000008700b00228ccd00cedsm14094772wrx.107.2022.09.14.09.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 09:06:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 231401FFCC;
 Wed, 14 Sep 2022 16:59:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v2 20/30] gitlab-ci: update aarch32/aarch64 custom runner jobs
Date: Wed, 14 Sep 2022 16:59:40 +0100
Message-Id: <20220914155950.804707-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914155950.804707-1-alex.bennee@linaro.org>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Message-Id: <20220826172128.353798-15-alex.bennee@linaro.org>

---
v2
  - fix extra-cflags merge conflict
  - update MAINTAINERS
---
 .gitlab-ci.d/custom-runners.yml               |  4 +--
 ...4-aarch32.yml => ubuntu-22.04-aarch32.yml} |  6 ++--
 ...4-aarch64.yml => ubuntu-22.04-aarch64.yml} | 36 +++++++++----------
 MAINTAINERS                                   |  3 +-
 4 files changed, 24 insertions(+), 25 deletions(-)
 rename .gitlab-ci.d/custom-runners/{ubuntu-20.04-aarch32.yml => ubuntu-22.04-aarch32.yml} (86%)
 rename .gitlab-ci.d/custom-runners/{ubuntu-20.04-aarch64.yml => ubuntu-22.04-aarch64.yml} (82%)

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


