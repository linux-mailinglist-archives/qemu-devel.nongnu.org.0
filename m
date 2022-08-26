Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B288B5A2D91
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 19:34:56 +0200 (CEST)
Received: from localhost ([::1]:56066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRdEN-0000bR-Pu
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 13:34:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRd1d-0004SN-Br
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:21:45 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:36772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRd1a-0002LX-6s
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:21:45 -0400
Received: by mail-wr1-x435.google.com with SMTP id bu22so2218857wrb.3
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 10:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Ff7sZB1OaNxc28Z0F5n98RmjR7xkz0qOaIPD7m0R63Y=;
 b=lI4xqZLrfUEt3jdiGs2kAdNsuuweVosSGkzcGxwU9m7xTRBvLG+XfuatTD+tRtaAqE
 VTZwBYu2qPS6iOT/10D0K3smpOgcAlRIwF9aHSQYvd8ASdlRftz3L4ovRsb9MvLpkJuy
 cMqfyaV48JZLPqJLPsfkUPGkYAfpAbkp3d41aaWj2hKxnRA+usBzSMIu+KAj+IH88hbM
 WPG90korcdg7FFkJ4+eBkP1q8yxdGvw7KGPDGfWiW0VwGqbHpjlP6HDVu9mYWs69KQzm
 oSUL79QmcjehWBbu2M19zO60e5pNwfJIdsmcYqnljidh/W7p1lRwfiAE60rVnPzb4haw
 4dfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Ff7sZB1OaNxc28Z0F5n98RmjR7xkz0qOaIPD7m0R63Y=;
 b=REmfB932WSy2AmiJ3Nc7i7ZjEOJYfyRmzCb54CjYOPVzee+CYx5veRTRuG23r0pylR
 LMqcnJpxXvi4TTU4VjFwFNfQbI1HCR2woIlTt+LIP7AVqyemSM6KtcaWtRyshMlmBVAf
 aP+zS4Ca4kvFCuFe1UlgmZTDnxvpis7u6bVkJVu4cYuJ+ADaHC7xcQHFjaE053cRlEqU
 BgUI0J0MT2DSzU1I21xkehtPpGRXlm5JJ9GSasfIM/LtLT2WfdOajyk16Vm23c/nRn+x
 agePpiuuw6r+PpHykzAl3pyL8zIqg82LSH5IE+kDukjYi2NsqMOMSk/5EZTe/h62UYoy
 6fVA==
X-Gm-Message-State: ACgBeo0XaRjNOBPEeLMgqtWIPJByEb67rTVsipLfSUJUOq1jv0WNZJIY
 mHjXAnU4Rl9L+AKG+gq6iVOCfQ==
X-Google-Smtp-Source: AA6agR6b34IsTPqAoukfBvWT6LjVEuuE+LNz3LPIgzvf2ARpLSu/3/NjfI0HpN+nl8IpmSYGoGKV3g==
X-Received: by 2002:adf:d23c:0:b0:226:af6f:2df5 with SMTP id
 k28-20020adfd23c000000b00226af6f2df5mr368420wrh.595.1661534501424; 
 Fri, 26 Aug 2022 10:21:41 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o26-20020a05600c511a00b003a5de95b105sm226820wms.41.2022.08.26.10.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 10:21:35 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E4B821FFC5;
 Fri, 26 Aug 2022 18:21:29 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v1 14/25] gitlab-ci: update aarch32/aarch64 custom runner jobs
Date: Fri, 26 Aug 2022 18:21:17 +0100
Message-Id: <20220826172128.353798-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220826172128.353798-1-alex.bennee@linaro.org>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
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
---
 .gitlab-ci.d/custom-runners.yml               |  4 +--
 ...4-aarch32.yml => ubuntu-22.04-aarch32.yml} |  6 ++--
 ...4-aarch64.yml => ubuntu-22.04-aarch64.yml} | 36 +++++++++----------
 3 files changed, 22 insertions(+), 24 deletions(-)
 rename .gitlab-ci.d/custom-runners/{ubuntu-20.04-aarch32.yml => ubuntu-22.04-aarch32.yml} (86%)
 rename .gitlab-ci.d/custom-runners/{ubuntu-20.04-aarch64.yml => ubuntu-22.04-aarch64.yml} (81%)

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
similarity index 81%
rename from .gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
rename to .gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
index 85a234801a..8db1e9376a 100644
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
- - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh --disable-pie --extra-cflags='-fno-pie -no-pie'
+ - ../configure --enable-debug --static --disable-system --disable-pie --extra-cflags='-fno-pie -no-pie'
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
-- 
2.30.2


