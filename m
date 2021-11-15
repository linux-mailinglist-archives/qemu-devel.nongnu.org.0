Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 015AB450733
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 15:37:29 +0100 (CET)
Received: from localhost ([::1]:44780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmd6u-0007Wi-3Y
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 09:37:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mmczI-0001WE-Cb
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:29:36 -0500
Received: from [2a00:1450:4864:20::435] (port=33775
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mmczB-0004OJ-CH
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:29:32 -0500
Received: by mail-wr1-x435.google.com with SMTP id d24so31165527wra.0
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 06:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mWBHpN227fBQlxdLK3HXLg+RPKLhZr2o4quF17zfOh8=;
 b=Z0+qFVmTvoTjeHBtpnN1Ta90Hxt7yymffottvFxpxk6mPpM1QjqEEAdmiQyyFv8uP2
 1Yp3Hx7z4pEW7nfsKoDOMG1X+6M6np/9zsilwxXcqW15ORQLQ0yFD3j7weOTCZqhK9VN
 TXMBygURPwvS/vrlBiSODlpHonnL0SO52LGRzDJg/JapKr6fA9U6ScDCCWn8ZyyjdQtG
 a95eKlHJO0JgtCLFpMscr7Reip7Mk5xt2VhUS/Q5l/BgDvz2nyrC858MJQcrPGc+dbBG
 clY0qCH4qLs42bp8N3eVnmMj1XufUnhJglQD6tpn2t22xSLgmKmIGUDynOG0ITgfnDk2
 q+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mWBHpN227fBQlxdLK3HXLg+RPKLhZr2o4quF17zfOh8=;
 b=5oMYsWyL3wCozjbK0zwUvaEQ5nAKdjLoDdQ70517BfkVBpCI26MRLG+JslNANKAdyk
 33I7qbqRiq3Rz6fXASNa1BVCx6YYWSOj+2jvL+ig470OVCRHGqoToj553TcES1hyu1pr
 xh6Bt9mbwhLtjYOiVxW5NwH1vza+2NcUVV8lBtA/WA8qIgV91gWtNL3WdZjpTzYxeGDX
 Ckj1iUi9ptubKLZ2QunbUWKw+l4J7HaR3yBSUmTBmOfuKsdmclj09uQjl4/To8aOdBkv
 bp3fPCm7jFEV/5r71gykrCyRnsekW94TihJ8GGiPgRl8uHc7du3CFP4nf2UDNbzxGzpq
 Iw4A==
X-Gm-Message-State: AOAM532oIkp4Qo68DHV++LLPjTFf9hZriBWoDDt3tJe/XgB+emMCCaSZ
 BzQIddhhaUjX7xoXEQV+Q/UWLQ==
X-Google-Smtp-Source: ABdhPJwPwUw32eJy82tINUfXgPjULIZhbB0g5YXhFcr192uW38XMZ/MxXDecMksIhMbziKn9NlJANQ==
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr48252794wrd.369.1636986568010; 
 Mon, 15 Nov 2021 06:29:28 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a10sm16336259wmq.27.2021.11.15.06.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 06:29:23 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9C0341FF9D;
 Mon, 15 Nov 2021 14:29:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 6/6] gitlab-ci: Split custom-runners.yml in one file per
 runner
Date: Mon, 15 Nov 2021 14:29:15 +0000
Message-Id: <20211115142915.3797652-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211115142915.3797652-1-alex.bennee@linaro.org>
References: <20211115142915.3797652-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

To ease maintenance, add the custom-runners/ directory and
split custom-runners.yml in 3 files, all included by the
current custom-runners.yml:
 - ubuntu-18.04-s390x.yml
 - ubuntu-20.04-aarch64.yml
 - centos-stream-8-x86_64.yml

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211115095608.2436223-1-philmd@redhat.com>
---
 .gitlab-ci.d/custom-runners.yml               | 268 +-----------------
 .../custom-runners/centos-stream-8-x86_64.yml |  28 ++
 .../custom-runners/ubuntu-18.04-s390x.yml     | 118 ++++++++
 .../custom-runners/ubuntu-20.04-aarch64.yml   | 118 ++++++++
 4 files changed, 268 insertions(+), 264 deletions(-)
 create mode 100644 .gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml
 create mode 100644 .gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml
 create mode 100644 .gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml

diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
index 1f56297dfa..056c374619 100644
--- a/.gitlab-ci.d/custom-runners.yml
+++ b/.gitlab-ci.d/custom-runners.yml
@@ -13,267 +13,7 @@
 variables:
   GIT_STRATEGY: clone
 
-# All ubuntu-18.04 jobs should run successfully in an environment
-# setup by the scripts/ci/setup/build-environment.yml task
-# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
-ubuntu-18.04-s390x-all-linux-static:
- needs: []
- stage: build
- tags:
- - ubuntu_18.04
- - s390x
- rules:
- - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
- - if: "$S390X_RUNNER_AVAILABLE"
- script:
- # --disable-libssh is needed because of https://bugs.launchpad.net/qemu/+bug/1838763
- # --disable-glusterfs is needed because there's no static version of those libs in distro supplied packages
- - mkdir build
- - cd build
- - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh
- - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check V=1
- - make --output-sync -j`nproc` check-tcg V=1
-
-ubuntu-18.04-s390x-all:
- needs: []
- stage: build
- tags:
- - ubuntu_18.04
- - s390x
- rules:
- - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
- - if: "$S390X_RUNNER_AVAILABLE"
- script:
- - mkdir build
- - cd build
- - ../configure --disable-libssh
- - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check V=1
-
-ubuntu-18.04-s390x-alldbg:
- needs: []
- stage: build
- tags:
- - ubuntu_18.04
- - s390x
- rules:
- - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
-   when: manual
-   allow_failure: true
- - if: "$S390X_RUNNER_AVAILABLE"
-   when: manual
-   allow_failure: true
- script:
- - mkdir build
- - cd build
- - ../configure --enable-debug --disable-libssh
- - make clean
- - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check V=1
-
-ubuntu-18.04-s390x-clang:
- needs: []
- stage: build
- tags:
- - ubuntu_18.04
- - s390x
- rules:
- - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
-   when: manual
-   allow_failure: true
- - if: "$S390X_RUNNER_AVAILABLE"
-   when: manual
-   allow_failure: true
- script:
- - mkdir build
- - cd build
- - ../configure --disable-libssh --cc=clang --cxx=clang++ --enable-sanitizers
- - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check V=1
-
-ubuntu-18.04-s390x-tci:
- needs: []
- stage: build
- tags:
- - ubuntu_18.04
- - s390x
- rules:
- - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
-   when: manual
-   allow_failure: true
- - if: "$S390X_RUNNER_AVAILABLE"
-   when: manual
-   allow_failure: true
- script:
- - mkdir build
- - cd build
- - ../configure --disable-libssh --enable-tcg-interpreter
- - make --output-sync -j`nproc`
-
-ubuntu-18.04-s390x-notcg:
- needs: []
- stage: build
- tags:
- - ubuntu_18.04
- - s390x
- rules:
- - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
-   when: manual
-   allow_failure: true
- - if: "$S390X_RUNNER_AVAILABLE"
-   when: manual
-   allow_failure: true
- script:
- - mkdir build
- - cd build
- - ../configure --disable-libssh --disable-tcg
- - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check V=1
-
-# All ubuntu-20.04 jobs should run successfully in an environment
-# setup by the scripts/ci/setup/qemu/build-environment.yml task
-# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
-ubuntu-20.04-aarch64-all-linux-static:
- needs: []
- stage: build
- tags:
- - ubuntu_20.04
- - aarch64
- rules:
- - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
- - if: "$AARCH64_RUNNER_AVAILABLE"
- script:
- # --disable-libssh is needed because of https://bugs.launchpad.net/qemu/+bug/1838763
- # --disable-glusterfs is needed because there's no static version of those libs in distro supplied packages
- - mkdir build
- - cd build
- - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh
- - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check V=1
- - make --output-sync -j`nproc` check-tcg V=1
-
-ubuntu-20.04-aarch64-all:
- needs: []
- stage: build
- tags:
- - ubuntu_20.04
- - aarch64
- rules:
- - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
-   when: manual
-   allow_failure: true
- - if: "$AARCH64_RUNNER_AVAILABLE"
-   when: manual
-   allow_failure: true
- script:
- - mkdir build
- - cd build
- - ../configure --disable-libssh
- - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check V=1
-
-ubuntu-20.04-aarch64-alldbg:
- needs: []
- stage: build
- tags:
- - ubuntu_20.04
- - aarch64
- rules:
- - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
- - if: "$AARCH64_RUNNER_AVAILABLE"
- script:
- - mkdir build
- - cd build
- - ../configure --enable-debug --disable-libssh
- - make clean
- - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check V=1
-
-ubuntu-20.04-aarch64-clang:
- needs: []
- stage: build
- tags:
- - ubuntu_20.04
- - aarch64
- rules:
- - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
-   when: manual
-   allow_failure: true
- - if: "$AARCH64_RUNNER_AVAILABLE"
-   when: manual
-   allow_failure: true
- script:
- - mkdir build
- - cd build
- - ../configure --disable-libssh --cc=clang-10 --cxx=clang++-10 --enable-sanitizers
- - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check V=1
-
-ubuntu-20.04-aarch64-tci:
- needs: []
- stage: build
- tags:
- - ubuntu_20.04
- - aarch64
- rules:
- - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
-   when: manual
-   allow_failure: true
- - if: "$AARCH64_RUNNER_AVAILABLE"
-   when: manual
-   allow_failure: true
- script:
- - mkdir build
- - cd build
- - ../configure --disable-libssh --enable-tcg-interpreter
- - make --output-sync -j`nproc`
-
-ubuntu-20.04-aarch64-notcg:
- needs: []
- stage: build
- tags:
- - ubuntu_20.04
- - aarch64
- rules:
- - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
-   when: manual
-   allow_failure: true
- - if: "$AARCH64_RUNNER_AVAILABLE"
-   when: manual
-   allow_failure: true
- script:
- - mkdir build
- - cd build
- - ../configure --disable-libssh --disable-tcg
- - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check V=1
-
-centos-stream-8-x86_64:
- allow_failure: true
- needs: []
- stage: build
- tags:
- - centos_stream_8
- - x86_64
- rules:
- - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
- - if: "$CENTOS_STREAM_8_x86_64_RUNNER_AVAILABLE"
- artifacts:
-   name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
-   when: on_failure
-   expire_in: 7 days
-   paths:
-     - build/tests/results/latest/results.xml
-     - build/tests/results/latest/test-results
-   reports:
-     junit: build/tests/results/latest/results.xml
- before_script:
- - JOBS=$(expr $(nproc) + 1)
- script:
- - mkdir build
- - cd build
- - ../scripts/ci/org.centos/stream/8/x86_64/configure
- - make -j"$JOBS"
- - make NINJA=":" check
- - ../scripts/ci/org.centos/stream/8/x86_64/test-avocado
+include:
+  - local: '/.gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml'
+  - local: '/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml'
+  - local: '/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml'
diff --git a/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml b/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml
new file mode 100644
index 0000000000..49aa703f55
--- /dev/null
+++ b/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml
@@ -0,0 +1,28 @@
+centos-stream-8-x86_64:
+ allow_failure: true
+ needs: []
+ stage: build
+ tags:
+ - centos_stream_8
+ - x86_64
+ rules:
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+ - if: "$CENTOS_STREAM_8_x86_64_RUNNER_AVAILABLE"
+ artifacts:
+   name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
+   when: on_failure
+   expire_in: 7 days
+   paths:
+     - build/tests/results/latest/results.xml
+     - build/tests/results/latest/test-results
+   reports:
+     junit: build/tests/results/latest/results.xml
+ before_script:
+ - JOBS=$(expr $(nproc) + 1)
+ script:
+ - mkdir build
+ - cd build
+ - ../scripts/ci/org.centos/stream/8/x86_64/configure
+ - make -j"$JOBS"
+ - make NINJA=":" check
+ - ../scripts/ci/org.centos/stream/8/x86_64/test-avocado
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml b/.gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml
new file mode 100644
index 0000000000..f39d874a1e
--- /dev/null
+++ b/.gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml
@@ -0,0 +1,118 @@
+# All ubuntu-18.04 jobs should run successfully in an environment
+# setup by the scripts/ci/setup/build-environment.yml task
+# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
+
+ubuntu-18.04-s390x-all-linux-static:
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_18.04
+ - s390x
+ rules:
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+ - if: "$S390X_RUNNER_AVAILABLE"
+ script:
+ # --disable-libssh is needed because of https://bugs.launchpad.net/qemu/+bug/1838763
+ # --disable-glusterfs is needed because there's no static version of those libs in distro supplied packages
+ - mkdir build
+ - cd build
+ - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
+ - make --output-sync -j`nproc` check-tcg V=1
+
+ubuntu-18.04-s390x-all:
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_18.04
+ - s390x
+ rules:
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+ - if: "$S390X_RUNNER_AVAILABLE"
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --disable-libssh
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
+
+ubuntu-18.04-s390x-alldbg:
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_18.04
+ - s390x
+ rules:
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+   when: manual
+   allow_failure: true
+ - if: "$S390X_RUNNER_AVAILABLE"
+   when: manual
+   allow_failure: true
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --enable-debug --disable-libssh
+ - make clean
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
+
+ubuntu-18.04-s390x-clang:
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_18.04
+ - s390x
+ rules:
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+   when: manual
+   allow_failure: true
+ - if: "$S390X_RUNNER_AVAILABLE"
+   when: manual
+   allow_failure: true
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --disable-libssh --cc=clang --cxx=clang++ --enable-sanitizers
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
+
+ubuntu-18.04-s390x-tci:
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_18.04
+ - s390x
+ rules:
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+   when: manual
+   allow_failure: true
+ - if: "$S390X_RUNNER_AVAILABLE"
+   when: manual
+   allow_failure: true
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --disable-libssh --enable-tcg-interpreter
+ - make --output-sync -j`nproc`
+
+ubuntu-18.04-s390x-notcg:
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_18.04
+ - s390x
+ rules:
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+   when: manual
+   allow_failure: true
+ - if: "$S390X_RUNNER_AVAILABLE"
+   when: manual
+   allow_failure: true
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --disable-libssh --disable-tcg
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
new file mode 100644
index 0000000000..920e388bd0
--- /dev/null
+++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
@@ -0,0 +1,118 @@
+# All ubuntu-20.04 jobs should run successfully in an environment
+# setup by the scripts/ci/setup/qemu/build-environment.yml task
+# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
+
+ubuntu-20.04-aarch64-all-linux-static:
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_20.04
+ - aarch64
+ rules:
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+ - if: "$AARCH64_RUNNER_AVAILABLE"
+ script:
+ # --disable-libssh is needed because of https://bugs.launchpad.net/qemu/+bug/1838763
+ # --disable-glusterfs is needed because there's no static version of those libs in distro supplied packages
+ - mkdir build
+ - cd build
+ - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
+ - make --output-sync -j`nproc` check-tcg V=1
+
+ubuntu-20.04-aarch64-all:
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_20.04
+ - aarch64
+ rules:
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+   when: manual
+   allow_failure: true
+ - if: "$AARCH64_RUNNER_AVAILABLE"
+   when: manual
+   allow_failure: true
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --disable-libssh
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
+
+ubuntu-20.04-aarch64-alldbg:
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_20.04
+ - aarch64
+ rules:
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+ - if: "$AARCH64_RUNNER_AVAILABLE"
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --enable-debug --disable-libssh
+ - make clean
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
+
+ubuntu-20.04-aarch64-clang:
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_20.04
+ - aarch64
+ rules:
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+   when: manual
+   allow_failure: true
+ - if: "$AARCH64_RUNNER_AVAILABLE"
+   when: manual
+   allow_failure: true
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --disable-libssh --cc=clang-10 --cxx=clang++-10 --enable-sanitizers
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
+
+ubuntu-20.04-aarch64-tci:
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_20.04
+ - aarch64
+ rules:
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+   when: manual
+   allow_failure: true
+ - if: "$AARCH64_RUNNER_AVAILABLE"
+   when: manual
+   allow_failure: true
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --disable-libssh --enable-tcg-interpreter
+ - make --output-sync -j`nproc`
+
+ubuntu-20.04-aarch64-notcg:
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_20.04
+ - aarch64
+ rules:
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+   when: manual
+   allow_failure: true
+ - if: "$AARCH64_RUNNER_AVAILABLE"
+   when: manual
+   allow_failure: true
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --disable-libssh --disable-tcg
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
-- 
2.30.2


