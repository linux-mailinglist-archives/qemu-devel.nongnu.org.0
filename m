Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E7567C9CB
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:23:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0LX-00032z-M5; Thu, 26 Jan 2023 06:23:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LO-0002Qy-W9
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:23:03 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL0LM-0003rH-GT
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:23:02 -0500
Received: by mail-wr1-x42b.google.com with SMTP id y1so1439834wru.2
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TodRRHCuZr2NbsR+6HpPmvjD5P9vgla+mam0F9Gvwc4=;
 b=feXVOtbYwGaXKqFnGGM/PohPcc/89tcwmKC+RcWIO9UA6qFAR++8AamzGczY/Y3nv6
 zKD4MCtu4UZ0h/cpLhjg6akwyrJL7mJ0co25AzadMwoNZaux16b1xJ3z3cEIe3+//eGO
 n0RO/4Gqg55pnCdo5yqM3xPIF++xCpvpvMD5fP819BwIQwdzOWUt2edzSMtDuR0+S2ng
 iTjHPLYFYGl5UEsjtB06IpvZJeHGYxt0Jz7jwCkvL3MHizFBSn2hzzVS8YwQ9pddEO67
 rjr/pFFhWP+QhQKRgOtPBqq5SVcqghxYTtSoRW5gwVHEAzOthQyDPTjiaWE8VNJbU/Bq
 l3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TodRRHCuZr2NbsR+6HpPmvjD5P9vgla+mam0F9Gvwc4=;
 b=I8qM5PpXb4eVDiJx2VhHkSkK/5x25eqMae9q7dCeHiuQdMNx1K8YKN7sToKX7DU6NK
 lneECZp1mjkfixNSF4gKPoskEYANj+cnkWu3lyg2iEi9sgbFH4VzrNIW1CtZ48UwHjGM
 bGiFdHjxKU7Wl8EdF2DMMCIyJOhj8fopw9rOBSgTGZOgQT/f5B8v4DLapRxRaXamEdPu
 UYgLYTh7WYdMtXH+3wiFklf/yXCsEx1D67gY2Q1og9479odmrnpuY0F+xwGemnuGwaaX
 427urwDfLcXeQC74+wA9yopPUfQc9dUT19wuslnkBtQ7rvHTt3PAngj5OBpP/uUyxADT
 kkcw==
X-Gm-Message-State: AO0yUKVqyEfV6PLTEdU3SXvSuAFoLo12t/D0QwOjWKDcTRZiDfeeILAv
 v++gM0PGAIqUx0n7pPj0kEHUdQ==
X-Google-Smtp-Source: AK7set9zyKOwUn9o2FfF/BC2QnjzhjgZ29LyM+TXM3YwsYaLpaqZqRtsWMWjt8w3BRF3fo2wWwt5wA==
X-Received: by 2002:a5d:4ccc:0:b0:2bf:b88b:aae8 with SMTP id
 c12-20020a5d4ccc000000b002bfb88baae8mr4897906wrt.50.1674732178994; 
 Thu, 26 Jan 2023 03:22:58 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 y2-20020adfc7c2000000b002be07cbefb2sm1436141wrg.18.2023.01.26.03.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 03:22:58 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EC70F1FFC2;
 Thu, 26 Jan 2023 11:22:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 17/35] gitlab: wrap up test results for custom runners
Date: Thu, 26 Jan 2023 11:22:32 +0000
Message-Id: <20230126112250.2584701-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126112250.2584701-1-alex.bennee@linaro.org>
References: <20230126112250.2584701-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Message-Id: <20230124180127.1881110-18-alex.bennee@linaro.org>

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


