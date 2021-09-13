Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A43344088E1
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 12:22:25 +0200 (CEST)
Received: from localhost ([::1]:44390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPj6W-0001dQ-Mt
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 06:22:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPj45-0008Kk-5v
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 06:19:53 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPj43-0005lz-DO
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 06:19:52 -0400
Received: by mail-wr1-x42c.google.com with SMTP id x6so13775753wrv.13
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 03:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d7EBOcQ0EPDbkii4w/L2+MwPSCTci+ZtnJurE4E356g=;
 b=GOQ3cUZtw0SD5ij/xcATgs8pDDOUAG+cTbLUD7f8UAsWQeW7ntDGWIQ88vlw2zYRlg
 Aui9rSvZnlW/CbbzamFHMaZsqzHN03nvf5QOV9c+/5T1kjIlgljpMDrGEwiRF5SjBfpL
 2l/QN2zLvq8ZLhhIbVvWRjauZ6n9nzD1CaW4zNL1hRqXnBuk0517/rA3a8zQAlqnan+G
 IERuJ1WKS4YnWWtjLFyMb/bs3pfmRhqmypkynOkNc2SZuHvSCFpkw+Lz8prTvuQax4Ql
 TFwKdxnEq8ucUbAHqIgaHi62DUL3RvQn4DllvwR5/K+cAVqU2mLilIt32YbbVxv4DWyN
 IacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d7EBOcQ0EPDbkii4w/L2+MwPSCTci+ZtnJurE4E356g=;
 b=upnAlEgBsslsUDIW6PL8UsBTazCnb+puBorTdsZX2PJ390F9uU6Q/uhru8ZBePchP1
 yg1JY7VRUu2WvkTxCECBnK3F+ohXAiU61WclO+2ImbI31qMpUXY7k0RoXbREQ+VELLC2
 BNRODpXIbwSbkxWB3cVXiiDybOgao/Uk/rVTHH0y/NXi6mOyk00taUkZkEECPrNwizrC
 tFgssQoda74ocOun4ELtg8NxNrGkXJCRLjpf7HQLyigV9WE2oGJSAx3tLlaCPHZ9tUQp
 HBzAFPb/8cFDuQwYEtdiV88MFBAgSdwZ6I0nw3HrMtxXVqeCnlMMMnP3o9mCu82h1tmZ
 a0yA==
X-Gm-Message-State: AOAM533YyLW/vElzin04sR3WingV5tbL01B8v+X8V2EAO9fce4cHbzbD
 E+5RcKsm6D0xCaTSESXTgMWl18KBnm5Ybw==
X-Google-Smtp-Source: ABdhPJz4WVL19VFrrijmNCUBDfqXuCEt5wzDzyLUBlHs3KN2qTif+niiLqZ2C0FQQOXp1FRl/ZQMpQ==
X-Received: by 2002:adf:e384:: with SMTP id e4mr11570052wrm.163.1631528389926; 
 Mon, 13 Sep 2021 03:19:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q201sm6939802wme.2.2021.09.13.03.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 03:19:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] gitlab-ci: Make more custom runner jobs manual,
 and don't allow failure
Date: Mon, 13 Sep 2021 11:19:48 +0100
Message-Id: <20210913101948.12600-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently we define a lot of jobs for our custom runners:
for both aarch64 and s390x we have
 - all-linux-static
 - all
 - alldbg
 - clang (manual)
 - tci
 - notcg (manual)

This is overkill.  The main reason to run on these hosts is to get
coverage for the host architecture; we can leave the handling of
differences like debug vs non-debug to the x86 CI jobs.

The jobs are also generally running OK; they occasionally fail due to
timeouts, which is likely because we're overloading the machine by
asking it to run 4 CI jobs at once plus the ad-hoc CI.

Remove the 'allow_failure' tag from all these jobs, and switch the
s390x-alldbg, aarch64-all, s390x-tci and aarch64-tci jobs to manual.
This will let us make the switch for s390x and aarch64 hosts from
the ad-hoc CI to gitlab.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 .gitlab-ci.d/custom-runners.yml | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
index 0d3e4a7b4b9..bcd22ca293c 100644
--- a/.gitlab-ci.d/custom-runners.yml
+++ b/.gitlab-ci.d/custom-runners.yml
@@ -17,7 +17,6 @@ variables:
 # setup by the scripts/ci/setup/build-environment.yml task
 # "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
 ubuntu-18.04-s390x-all-linux-static:
- allow_failure: true
  needs: []
  stage: build
  tags:
@@ -37,7 +36,6 @@ ubuntu-18.04-s390x-all-linux-static:
  - make --output-sync -j`nproc` check-tcg V=1
 
 ubuntu-18.04-s390x-all:
- allow_failure: true
  needs: []
  stage: build
  tags:
@@ -54,7 +52,6 @@ ubuntu-18.04-s390x-all:
  - make --output-sync -j`nproc` check V=1
 
 ubuntu-18.04-s390x-alldbg:
- allow_failure: true
  needs: []
  stage: build
  tags:
@@ -62,7 +59,9 @@ ubuntu-18.04-s390x-alldbg:
  - s390x
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+   when: manual
  - if: "$S390X_RUNNER_AVAILABLE"
+   when: manual
  script:
  - mkdir build
  - cd build
@@ -72,7 +71,6 @@ ubuntu-18.04-s390x-alldbg:
  - make --output-sync -j`nproc` check V=1
 
 ubuntu-18.04-s390x-clang:
- allow_failure: true
  needs: []
  stage: build
  tags:
@@ -91,7 +89,6 @@ ubuntu-18.04-s390x-clang:
  - make --output-sync -j`nproc` check V=1
 
 ubuntu-18.04-s390x-tci:
- allow_failure: true
  needs: []
  stage: build
  tags:
@@ -99,7 +96,9 @@ ubuntu-18.04-s390x-tci:
  - s390x
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+   when: manual
  - if: "$S390X_RUNNER_AVAILABLE"
+   when: manual
  script:
  - mkdir build
  - cd build
@@ -107,7 +106,6 @@ ubuntu-18.04-s390x-tci:
  - make --output-sync -j`nproc`
 
 ubuntu-18.04-s390x-notcg:
- allow_failure: true
  needs: []
  stage: build
  tags:
@@ -129,7 +127,6 @@ ubuntu-18.04-s390x-notcg:
 # setup by the scripts/ci/setup/qemu/build-environment.yml task
 # "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
 ubuntu-20.04-aarch64-all-linux-static:
- allow_failure: true
  needs: []
  stage: build
  tags:
@@ -149,7 +146,6 @@ ubuntu-20.04-aarch64-all-linux-static:
  - make --output-sync -j`nproc` check-tcg V=1
 
 ubuntu-20.04-aarch64-all:
- allow_failure: true
  needs: []
  stage: build
  tags:
@@ -157,7 +153,9 @@ ubuntu-20.04-aarch64-all:
  - aarch64
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+   when: manual
  - if: "$AARCH64_RUNNER_AVAILABLE"
+   when: manual
  script:
  - mkdir build
  - cd build
@@ -166,7 +164,6 @@ ubuntu-20.04-aarch64-all:
  - make --output-sync -j`nproc` check V=1
 
 ubuntu-20.04-aarch64-alldbg:
- allow_failure: true
  needs: []
  stage: build
  tags:
@@ -184,7 +181,6 @@ ubuntu-20.04-aarch64-alldbg:
  - make --output-sync -j`nproc` check V=1
 
 ubuntu-20.04-aarch64-clang:
- allow_failure: true
  needs: []
  stage: build
  tags:
@@ -203,7 +199,6 @@ ubuntu-20.04-aarch64-clang:
  - make --output-sync -j`nproc` check V=1
 
 ubuntu-20.04-aarch64-tci:
- allow_failure: true
  needs: []
  stage: build
  tags:
@@ -211,7 +206,9 @@ ubuntu-20.04-aarch64-tci:
  - aarch64
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+   when: manual
  - if: "$AARCH64_RUNNER_AVAILABLE"
+   when: manual
  script:
  - mkdir build
  - cd build
@@ -219,7 +216,6 @@ ubuntu-20.04-aarch64-tci:
  - make --output-sync -j`nproc`
 
 ubuntu-20.04-aarch64-notcg:
- allow_failure: true
  needs: []
  stage: build
  tags:
-- 
2.20.1


