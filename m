Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E3845379A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 17:34:41 +0100 (CET)
Received: from localhost ([::1]:57772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn1Ps-00005S-Jl
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 11:34:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mn1Gy-0004nG-3p
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:25:28 -0500
Received: from [2a00:1450:4864:20::432] (port=38419
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mn1Gv-0004DH-No
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:25:27 -0500
Received: by mail-wr1-x432.google.com with SMTP id u18so38709515wrg.5
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 08:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vntPIQjCTPZEqUV7VqdeizhS0nksmh+noAYNsVn0gJA=;
 b=Joq5DzS5tEURqQmAERxziuxJ6cq+d/N2pjsAS2tso5hJp5vORqWxdeQuN5yzbEoXzF
 qodTmpv/bTxXbF8x15PIMNZNb3BAUxJ2gpH5tECKj3FDfMtKyxsV8e1e/iQmSTdOI/nD
 cdEla+YjWoN/J2n/uSV2vh9vFmNNcwdydGaLEvsGvIITm3M8lGpmj+kA4gKBFHUfHcrG
 zM6PboUogPJLKuE2XJrHGhogt/8K+gbAnl4KHqTV/NAH3TmNj/T3luZbV6HxAKmn6GwG
 jFoj3fg5LsHnALViJ9MK0nF+oq26u83lhmjjkorF4cTimT3sWP+21hecCz9JP1jubBGx
 /X+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vntPIQjCTPZEqUV7VqdeizhS0nksmh+noAYNsVn0gJA=;
 b=NFgIgusOjENFLx/dfNXgZOwHYOWK/VVPxiW9JnZO3iUb5I1L20EvN6yFCPWLcznRu1
 paxBmrokKBOdyxG5APMEiMNLxhmUFIwfsOcL9oYxlGQbTFG2V3IxQjjsVfeHHc83Bgqz
 7REwzhITsFjXZbrT/dQvXpoCzvpwHEFVE1ig1B//ukjqDDbuM7+F8ac+Wybl9nUn9IEr
 AsSziZvXMEcsK6ALjaGwOXkvxr1bUScCkUO7xEA9/Nsv/HGCYL0qqqtc9fXKfZe68mR1
 5JuPK1pi29+SBS6J+i/0L9iXlf6nrMuo0lprQDFgbSeJwXdZ9NPDTz3m3MsBwIRJVfyN
 aqvQ==
X-Gm-Message-State: AOAM533CJ48IwlkURgzPFZkvuexKqe75C82gJ3UMcGvc1AbBl7HnBqtM
 V83/8tio/rQsJOFVqm9szk7V6A==
X-Google-Smtp-Source: ABdhPJzvGenpqwR/3H3lbCQoMhKjt4fERp/EEoCbyb6WLrWm6VQyUDjo83ogK4r+aMy+Air4l2sDnw==
X-Received: by 2002:a05:6000:18a3:: with SMTP id
 b3mr10855505wri.343.1637079924224; 
 Tue, 16 Nov 2021 08:25:24 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f19sm3835401wmq.34.2021.11.16.08.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 08:25:19 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 02E7C1FF9D;
 Tue, 16 Nov 2021 16:25:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org
Subject: [PULL 6/7] gitlab-ci: Split custom-runners.yml in one file per runner
Date: Tue, 16 Nov 2021 16:25:14 +0000
Message-Id: <20211116162515.4100231-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211116162515.4100231-1-alex.bennee@linaro.org>
References: <20211116162515.4100231-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20211115142915.3797652-7-alex.bennee@linaro.org>

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


