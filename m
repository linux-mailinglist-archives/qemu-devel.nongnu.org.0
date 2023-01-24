Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A741B67A0E5
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 19:08:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKNiA-0006OP-WC; Tue, 24 Jan 2023 13:07:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNhQ-0005BQ-Gg
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:07:13 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNhJ-00076e-LA
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:07:12 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 iv8-20020a05600c548800b003db04a0a46bso1493397wmb.0
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 10:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S+2u77xSDgQOoeHR5vxTZWd3BOfsZOlOwvnJdeLJLGI=;
 b=lJuDQcIRCtZsbLTaKq897zMyWEBhh2NQcfDygdFL4H0EzDolSYC3RQLX8zGYmCY2SD
 bQvJRab8excsaffcY60ZFeWMLr6/EDqmZi0+QsxbhKYyiAxETgR/D5v35iP78nFGcKLS
 lMiLXLp+0HnraokwxQOPSiqCi0kN7zV/K9S7mLF3qCrDQh4w5PmxwUKdj2+sXVd0p2U7
 hGMCcWhECbWi+79voBeIr2camFyIIAwXJbPZ18kQ1b9Z7f/vCtiO9sr3UQQSrH4jzJRd
 NDgY4vmIHJjz1a5RlFQ/FnqB9ZJ5cIQrLHn0MMAXJ63UWHyy2P5K6RA0JkPOXHR7yk2G
 D1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S+2u77xSDgQOoeHR5vxTZWd3BOfsZOlOwvnJdeLJLGI=;
 b=oznSykf4jY5r0MS20LaeWgI7L2U3ltLaEd8zbMcNpN9WfftWqzTuXnkyxuRYAwwuWN
 LKgI0aK5FdLJ8+5qWgrOHhY/l8HzGKx//hlkVP+2+Wx1lJePuNso3tQe0E+bp0hSt5Lk
 3j//76uRsHLz/8jGaBMc8sLtqjOsEjxQOYYSQvjpy6khVqQ20f4LmUGFCEfTYn6WjIHx
 fhVCle/nP4hOpF3xDUL6kDvTqZBLrHv4nKjpYT8PrjOO9W2AzoFhyYgaCcLpF28a7YmE
 yNRHhn3vINh2wCyxe00V/UB+uXgeQ9sgQDYSxq4kV6h0Yn/VTi9nS9aLPeaI9H7Ka/eN
 gDLA==
X-Gm-Message-State: AFqh2krYW2vvVQkeVs13/EyiHrzj7IF9LGYniYUL7NoqDblTPB6EcN0J
 mYwn5wFyyZrdoLPR9JJQomWSYA==
X-Google-Smtp-Source: AMrXdXtlsBty/PQmHZ3wFPuA4vilWX1uGVnhhnsKrnn+tIlmwGHBFMu76mpAa5vKagt7yEPAW41CvQ==
X-Received: by 2002:a05:600c:4928:b0:3d9:a5a2:65fa with SMTP id
 f40-20020a05600c492800b003d9a5a265famr28798989wmp.7.1674583624287; 
 Tue, 24 Jan 2023 10:07:04 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n42-20020a05600c3baa00b003d96efd09b7sm16050022wms.19.2023.01.24.10.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 10:07:02 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C32D51FFC7;
 Tue, 24 Jan 2023 18:01:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, qemu-arm@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 17/35] gitlab: wrap up test results for custom runners
Date: Tue, 24 Jan 2023 18:01:09 +0000
Message-Id: <20230124180127.1881110-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
meson. To avoid confusion we don't run multiple check-tcg tests at
once.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - mention we don't parallelise check-tcg
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


