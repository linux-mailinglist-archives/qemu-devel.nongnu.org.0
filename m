Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B89C34E2DBE
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 17:21:44 +0100 (CET)
Received: from localhost ([::1]:39006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWKmt-0005yV-Qi
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 12:21:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWKdS-00030c-Bn
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:11:58 -0400
Received: from [2a00:1450:4864:20::632] (port=40884
 helo=mail-ej1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWKdQ-0007lP-Lo
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:11:57 -0400
Received: by mail-ej1-x632.google.com with SMTP id p15so30853933ejc.7
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 09:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nzc6yglUTpgqqIrg3RuRQQxPvmOmJnlNAIxXwm8xSEU=;
 b=rIMEgCv1Iy98bXVNkBxrnlBkXHxyDX7/1a/MP9qwjiPnIKESAsClLqkwrwXkNB4owz
 RFjEEr6bUystZHMOLxTTeOZBkIjehG9N8+yTgTQi+J9ky1Kobe60D+j3cKaHDHvbSdD7
 v0ZXPchrHkgMnbD3dlql97Oo+pjcKgIexRAgLVSHBk5ChB1ETSpsBU7aWBDqCa7vRVPE
 G9VK/ztYnLFRpW/ecSoZftEMg8jKTX6lDowyKpXbQgjNjLvdiabUfXVUgkRpD9tw3g2a
 nuad4xp+E3SiDY7nrggcwETivz3SfGHQr/7qDKq7ESOrvnrINRnnBTVW0sfbn/Nn5O7v
 bvrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nzc6yglUTpgqqIrg3RuRQQxPvmOmJnlNAIxXwm8xSEU=;
 b=R/SZx4dw0MTJVniy7QSCJ0bzxATCnsZwuEsfXOd2V7MtfSI1g9k1C0Se5su0E/Jqd/
 QMPc1uZQJNQee2DV8WLXfiz4YkZAHJDQ1HtKNN4VHVFdha5TgFPGeNzoPBN6ewmbieY0
 wxk8BEKVDgK/G9TN7KTInXjV02JAKFqFg9bNKHksXSGTD0W8CayG5mbE2s0J75qRqGjY
 wX/F8CJCKqhB1qLHl+re4KIqZCZAEi55+1TgKBu5P2J+OceScbOnKCkMuU4r7GJrwSfL
 p4OqccUaDolHThhtqiCT4qh2ikaqZ5+DGBbi8tqSPR3vBaojJfJ27Dk4LasVqCxJ6Sg5
 PUGQ==
X-Gm-Message-State: AOAM5336zOHy6qG9fzZCOqGztMuxjCi1dybciCMNB57Jvod9LNHloDVm
 jySD4tQUY47SIQdtN2HsR/m+pQ==
X-Google-Smtp-Source: ABdhPJxsI9qZHY5ocmwpdAMFAnPe5H4q/jykcNWPOvQTpe8lA9ZqNM8TNhGioeJIXAj2hoIcqumrag==
X-Received: by 2002:a17:906:9c82:b0:6df:c5f0:d456 with SMTP id
 fj2-20020a1709069c8200b006dfc5f0d456mr13907810ejc.287.1647879114648; 
 Mon, 21 Mar 2022 09:11:54 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 e19-20020a056402105300b004162d0b4cbbsm8110797edu.93.2022.03.21.09.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 09:11:53 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 328761FFB7;
 Mon, 21 Mar 2022 16:11:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] gitlab: disable accelerated zlib for s390x
Date: Mon, 21 Mar 2022 16:11:51 +0000
Message-Id: <20220321161151.3654386-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::632
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There appears to be a bug in the s390 hardware-accelerated version of
zlib distributed with Ubuntu 20.04, which makes our test
/i386/migration/multifd/tcp/zlib hit an assertion perhaps one time in
10. Fortunately zlib provides an escape hatch where we can disable the
hardware-acceleration entirely by setting the environment variable
DFLTCC to 0. Do this on all our CI which runs on s390 hosts, both our
custom gitlab runner and also the Travis hosts.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>

---
v2
  - more complete commit wording from Peter
  - also tweak travis rules
---
 .gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml | 12 ++++++++++++
 .travis.yml                                        |  6 ++++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
index 0333872113..4f292a8a5b 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
@@ -8,6 +8,8 @@ ubuntu-20.04-s390x-all-linux-static:
  tags:
  - ubuntu_20.04
  - s390x
+ variables:
+    DFLTCC: 0
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
  - if: "$S390X_RUNNER_AVAILABLE"
@@ -27,6 +29,8 @@ ubuntu-20.04-s390x-all:
  tags:
  - ubuntu_20.04
  - s390x
+ variables:
+    DFLTCC: 0
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
  - if: "$S390X_RUNNER_AVAILABLE"
@@ -43,6 +47,8 @@ ubuntu-20.04-s390x-alldbg:
  tags:
  - ubuntu_20.04
  - s390x
+ variables:
+    DFLTCC: 0
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
    when: manual
@@ -64,6 +70,8 @@ ubuntu-20.04-s390x-clang:
  tags:
  - ubuntu_20.04
  - s390x
+ variables:
+    DFLTCC: 0
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
    when: manual
@@ -84,6 +92,8 @@ ubuntu-20.04-s390x-tci:
  tags:
  - ubuntu_20.04
  - s390x
+ variables:
+    DFLTCC: 0
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
    when: manual
@@ -103,6 +113,8 @@ ubuntu-20.04-s390x-notcg:
  tags:
  - ubuntu_20.04
  - s390x
+ variables:
+    DFLTCC: 0
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
    when: manual
diff --git a/.travis.yml b/.travis.yml
index c3c8048842..9afc4a54b8 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -218,6 +218,7 @@ jobs:
         - TEST_CMD="make check check-tcg V=1"
         - CONFIG="--disable-containers --target-list=${MAIN_SOFTMMU_TARGETS},s390x-linux-user"
         - UNRELIABLE=true
+        - DFLTCC=0
       script:
         - BUILD_RC=0 && make -j${JOBS} || BUILD_RC=$?
         - |
@@ -257,7 +258,7 @@ jobs:
       env:
         - CONFIG="--disable-containers --audio-drv-list=sdl --disable-user
                   --target-list-exclude=${MAIN_SOFTMMU_TARGETS}"
-
+        - DFLTCC=0
     - name: "[s390x] GCC (user)"
       arch: s390x
       dist: focal
@@ -269,7 +270,7 @@ jobs:
           - ninja-build
       env:
         - CONFIG="--disable-containers --disable-system"
-
+        - DFLTCC=0
     - name: "[s390x] Clang (disable-tcg)"
       arch: s390x
       dist: focal
@@ -303,3 +304,4 @@ jobs:
         - CONFIG="--disable-containers --disable-tcg --enable-kvm
                   --disable-tools --host-cc=clang --cxx=clang++"
         - UNRELIABLE=true
+        - DFLTCC=0
-- 
2.30.2


