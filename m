Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB2B67409F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 19:13:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIZOT-0005wK-AD; Thu, 19 Jan 2023 13:12:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIZOL-0005ug-Vh
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:12:01 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIZOK-0004Iy-3r
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:12:01 -0500
Received: by mail-wr1-x432.google.com with SMTP id n7so2686179wrx.5
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 10:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pGcy7m167YyxLO7vlX12Q/W9krVoDL14tS+QgowG2zA=;
 b=ESWVNjyr8kag/HawFVlHVVBnbe2EnHCIKI0fxtI2P2RAdA8wet9LLhXKvBJsKII2ti
 BGbS/TDZz8ZDEdDbHS0CYxwfQEqJl6I3CLjZMvqoCoo5fW5Ip4lzq91lqNfTHs9MgKnj
 xT74bgD2mOKmALWkO/6i6mBa0CHyupazeNa8x3IX9IDBjBpD57QNEfYlpSvHyLJ8q5NS
 i0uVqJPdXlIws1YF/X93JgvFnGVyUUNsrtM2fny596WBf48rmnfmk//fuXG3DNBDhgna
 rtTjFbRTSNlxVC1LumgtyS1vqXpRjQfnFbpGVyUAffd0YCVIAGW7CWtaYXhsArFNfzhN
 Teog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pGcy7m167YyxLO7vlX12Q/W9krVoDL14tS+QgowG2zA=;
 b=2ObYHbkAy/cMkrHYTcw2kPpvYcBhuouhnzZqLsk2/ND5b+BsETuKJj/nEQKFAG9XRj
 7Vkjk3y/b79iNT30yLOLtmEUTxaNDTjeOElsToolahD8yyvnJHcDSxBDMq+2CGnmR8yv
 T5kbzlun5bgUPOy2CfG09OoMxG+CUL81b+QSlvkqYDyIGS8hUpQPWU/qqEGaIfDrJay4
 jQXgMPhCp5FvGQahpGvNG6lIT5Wstw0aszng9ziOMtU/o/wdOj5YtkeL8+qqudv8yE1s
 RUk/OpVyLReHOVmuaC15Hz0lhzSq7vz6bHK4JWur9bPTupq+kE9JYyzz0CxTe85fNfiE
 OlvQ==
X-Gm-Message-State: AFqh2kpuHsZjtqD8Cee32wMvhG0v971J9vjjjvxnHV0e8jkjcY8a0fFy
 dMp8j+P2ccFBgtpI14ntCeHE5w==
X-Google-Smtp-Source: AMrXdXuzltIscyYPocKN2V7/Y0XjBdiP843sYSbeJPXIwogzfKqxtHs5H4dc52A30GD+9KATRoOuXQ==
X-Received: by 2002:a5d:6ac3:0:b0:2be:2295:77e6 with SMTP id
 u3-20020a5d6ac3000000b002be229577e6mr9189566wrw.51.1674151918014; 
 Thu, 19 Jan 2023 10:11:58 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n6-20020adfe786000000b002bdbde1d3absm24228102wrm.78.2023.01.19.10.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 10:11:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9A3C91FFBA;
 Thu, 19 Jan 2023 18:04:21 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bandan Das <bsd@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH 17/18] gitlab: wrap up test results for custom runners
Date: Thu, 19 Jan 2023 18:04:18 +0000
Message-Id: <20230119180419.30304-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230119180419.30304-1-alex.bennee@linaro.org>
References: <20230119180419.30304-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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


