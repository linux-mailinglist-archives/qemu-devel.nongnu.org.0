Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB4F4BED92
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 00:07:52 +0100 (CET)
Received: from localhost ([::1]:49310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMHmZ-0005HY-9S
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 18:07:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nMHlI-0004GX-Fe
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 18:06:32 -0500
Received: from [2a00:1450:4864:20::62d] (port=40545
 helo=mail-ej1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nMHlF-0004aA-Ll
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 18:06:32 -0500
Received: by mail-ej1-x62d.google.com with SMTP id p15so36926582ejc.7
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 15:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rdZ+dBr53WE7Hi7LZYqmf1P6OroraX4yFubXHeJeyiQ=;
 b=disGSg+SL/WJ7l+f67NAC+Y3Pm3eWiLg85uZw4ihR4nx3LR5fqwyRP2S1AEQOGA0O5
 +9BweWQD7IDN9AKH6RAY0Mowh8Vke7IUlCRp3OlYnhgxuK/oWHInC2Oy7xV6aGs0CTcm
 5Hs+IWYQ8Y21fupC9Co3ZhnQln7kRNhoJqRKOg8Esp2nlQ/1qRT+0llyXFTbSTUUSKV6
 N9thDFE0mOvyAy6wUNCEzp4ZUk0aVnthQAg6/5MOYs1c4Wdt5CoMuCjId7vi7HvP5qXB
 t0ScvriWAcwZ5OP/ggRRnlzt6vG4cnOKKerKrm244spsf1fd3HrxtiD7SYOeJbolFbv+
 OU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rdZ+dBr53WE7Hi7LZYqmf1P6OroraX4yFubXHeJeyiQ=;
 b=ADlLab5Mwr0u1OODz/Bhc5jBqq5N18ro+vvhnv5f+DPJauPdqnWqHXGeRCWxdpoohL
 q5mkw+1/ZLT7LKkhVlFdBgDkvMC0wJmwYfosvV3CA+uCWYA6iixK/Acfa8BHNCiYnHCh
 Em1aY5oAodn6D8nWpz5XnONa1+j0Vc0AWoYXvnWyEjspEtcwwnRXCrqQmYiSHeNa5R6x
 2mVqgHOq8DfH1l9v99/TrljBQtL1VsLr66av0YErgATgJ0BoEYzOvM9fBbmKEB/trbVv
 OXiNtZa0X7T4cWOrCUe03Pef4MxhF5+UwSwCTX6bSJ2ZaucgxJGSU/cceppF/N6KUCXY
 uB3Q==
X-Gm-Message-State: AOAM531mSiW/YJHL9KFm3rhmv/fOp6hbH5fdnq+5heZos2oJIIUfFOVz
 y5tVz1lMNrLRmq6WIwVSoGKFtw==
X-Google-Smtp-Source: ABdhPJyGjP2rn1857Zy66aCE4yJZM6/Vx5m9eJXYJ0ejMZyKD3zO0/FTCfg1P09rqbEjyzQMfiqLFg==
X-Received: by 2002:a17:906:2608:b0:6c9:b248:4dcf with SMTP id
 h8-20020a170906260800b006c9b2484dcfmr16994741ejc.320.1645484781947; 
 Mon, 21 Feb 2022 15:06:21 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v8sm4171287edc.0.2022.02.21.15.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 15:06:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BB22F1FFB7;
 Mon, 21 Feb 2022 23:06:19 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] gitlab: upgrade the job definition for s390x to 20.04
Date: Mon, 21 Feb 2022 23:06:07 +0000
Message-Id: <20220221230607.1277120-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
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
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The new s390x machine has more of everything including the OS. As
18.04 will soon be going we might as well get onto something moderately
modern.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
---
 .gitlab-ci.d/custom-runners.yml               |  2 +-
 ...18.04-s390x.yml => ubuntu-20.04-s390x.yml} | 28 +++++++++----------
 2 files changed, 15 insertions(+), 15 deletions(-)
 rename .gitlab-ci.d/custom-runners/{ubuntu-18.04-s390x.yml => ubuntu-20.04-s390x.yml} (87%)

diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
index 056c374619..3e76a2034a 100644
--- a/.gitlab-ci.d/custom-runners.yml
+++ b/.gitlab-ci.d/custom-runners.yml
@@ -14,6 +14,6 @@ variables:
   GIT_STRATEGY: clone
 
 include:
-  - local: '/.gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml'
+  - local: '/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml'
   - local: '/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml'
   - local: '/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml'
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
similarity index 87%
rename from .gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml
rename to .gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
index f39d874a1e..0333872113 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
@@ -1,12 +1,12 @@
-# All ubuntu-18.04 jobs should run successfully in an environment
+# All ubuntu-20.04 jobs should run successfully in an environment
 # setup by the scripts/ci/setup/build-environment.yml task
-# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
+# "Install basic packages to build QEMU on Ubuntu 20.04/20.04"
 
-ubuntu-18.04-s390x-all-linux-static:
+ubuntu-20.04-s390x-all-linux-static:
  needs: []
  stage: build
  tags:
- - ubuntu_18.04
+ - ubuntu_20.04
  - s390x
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
@@ -21,11 +21,11 @@ ubuntu-18.04-s390x-all-linux-static:
  - make --output-sync -j`nproc` check V=1
  - make --output-sync -j`nproc` check-tcg V=1
 
-ubuntu-18.04-s390x-all:
+ubuntu-20.04-s390x-all:
  needs: []
  stage: build
  tags:
- - ubuntu_18.04
+ - ubuntu_20.04
  - s390x
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
@@ -37,11 +37,11 @@ ubuntu-18.04-s390x-all:
  - make --output-sync -j`nproc`
  - make --output-sync -j`nproc` check V=1
 
-ubuntu-18.04-s390x-alldbg:
+ubuntu-20.04-s390x-alldbg:
  needs: []
  stage: build
  tags:
- - ubuntu_18.04
+ - ubuntu_20.04
  - s390x
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
@@ -58,11 +58,11 @@ ubuntu-18.04-s390x-alldbg:
  - make --output-sync -j`nproc`
  - make --output-sync -j`nproc` check V=1
 
-ubuntu-18.04-s390x-clang:
+ubuntu-20.04-s390x-clang:
  needs: []
  stage: build
  tags:
- - ubuntu_18.04
+ - ubuntu_20.04
  - s390x
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
@@ -78,11 +78,11 @@ ubuntu-18.04-s390x-clang:
  - make --output-sync -j`nproc`
  - make --output-sync -j`nproc` check V=1
 
-ubuntu-18.04-s390x-tci:
+ubuntu-20.04-s390x-tci:
  needs: []
  stage: build
  tags:
- - ubuntu_18.04
+ - ubuntu_20.04
  - s390x
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
@@ -97,11 +97,11 @@ ubuntu-18.04-s390x-tci:
  - ../configure --disable-libssh --enable-tcg-interpreter
  - make --output-sync -j`nproc`
 
-ubuntu-18.04-s390x-notcg:
+ubuntu-20.04-s390x-notcg:
  needs: []
  stage: build
  tags:
- - ubuntu_18.04
+ - ubuntu_20.04
  - s390x
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
-- 
2.30.2


