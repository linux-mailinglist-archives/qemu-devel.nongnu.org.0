Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFB440C561
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 14:36:42 +0200 (CEST)
Received: from localhost ([::1]:33526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQU9Z-0006qV-6D
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 08:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQU7J-00060S-Gb
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 08:34:21 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:46767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQU7F-0005ZR-4s
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 08:34:21 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 d207-20020a1c1dd8000000b00307e2d1ec1aso1880206wmd.5
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 05:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=01CajSLGFWYNJTf3EBCCqs6B4OwPFxDYiG4TW6OMB5c=;
 b=ate1lZcfhzTIVbxJII8PTy/jtqa9NSTkitgJ+CNDlwfljbV8OoRBWfqNb6OYiF9J9J
 o5PIxJ8CoBlK5Laoa9CkUxoIP1zkjRZRZ+d+UpyXoDXGOWmr2CVwqCCVkzrR+07TFD/8
 JYX6LyXlrwLZDP2loM+TRX36jQ6c8NLIFSFTywKIoT4rwyGyB8aqkupOpoG3/nxcCqqe
 3TQItOg/JzuirEpZKIYQkQGlw6sSohZBRhgvIugGq4lw3vKEQGZ5QmBUdEjH7n6cWNQY
 N7WW+4kmDY7adpjkLtKqdKRjMFDIpVZWP1GnwFq6WpiCq3Em1R28KKuF6ib1AdN3JrcI
 bHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=01CajSLGFWYNJTf3EBCCqs6B4OwPFxDYiG4TW6OMB5c=;
 b=HTYSF6xQvOeLsIJSj2P2DdEijFfnCfmXmp0PvBzoaHWWVwfqpKpAhF3TSXQ+hyC9dD
 pw7YZmHF5cPhFCtj9knCT4DMJMKulKXaQ3uxkuSqYVjqz3+XCXg/f5B+pI97fpELwRK1
 3EwVGoFRrkiVePLoByrpuGWJ4EoRpalFX3qcmSOvQ3NWyNQyZzUSjFOvUZUo6R+ggBcj
 Oq8YiqVL9qu7CdB7VcQP2AiEpvz9QVlDMQVElXs5Fe2CTBll2wwbJW9YACvJlCdn0+mr
 kYT6dnUOtdsT4S+0a/APHDBOtswp/fCyDHjRQqIWnoLkqrnh8Mo3grHgFGXgCCupoxxf
 u1ww==
X-Gm-Message-State: AOAM530KGMVR0fWCFOG2rjMFFh6tr3gHkgnD9UAnylJAUhSwLVb+yGMO
 PxfUm5M704Hlphp6EI7iKUMHYJufgq3qUA==
X-Google-Smtp-Source: ABdhPJy1JSKfEWeP3sIHenF4BEXnnzEYPNpAhXAd9XEJrZRoJVZnMeIATEdNPc/2iceKCXb1YUNjUw==
X-Received: by 2002:a1c:3987:: with SMTP id g129mr4126401wma.151.1631709255055; 
 Wed, 15 Sep 2021 05:34:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i9sm4143259wmi.44.2021.09.15.05.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 05:34:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] gitlab-ci: Mark manual-only jobs as allow_failure
Date: Wed, 15 Sep 2021 13:34:12 +0100
Message-Id: <20210915123412.8232-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If a gitlab CI job is marked as manual-only but is not marked
as allow_failure, then gitlab considers that the pipeline is
"blocked" until the job has been manually triggered. We need
to mark these manual-only jobs as also allow_failure: true
so that gitlab doesn't insist that they have run before it
will consider the pipeline to be complete.

Fixes: 4c9af1ea1457782cf0adb29
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 .gitlab-ci.d/custom-runners.yml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
index bcd22ca293c..a89a20da48d 100644
--- a/.gitlab-ci.d/custom-runners.yml
+++ b/.gitlab-ci.d/custom-runners.yml
@@ -60,8 +60,10 @@ ubuntu-18.04-s390x-alldbg:
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
    when: manual
+   allow_failure: true
  - if: "$S390X_RUNNER_AVAILABLE"
    when: manual
+   allow_failure: true
  script:
  - mkdir build
  - cd build
@@ -79,8 +81,10 @@ ubuntu-18.04-s390x-clang:
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
    when: manual
+   allow_failure: true
  - if: "$S390X_RUNNER_AVAILABLE"
    when: manual
+   allow_failure: true
  script:
  - mkdir build
  - cd build
@@ -97,8 +101,10 @@ ubuntu-18.04-s390x-tci:
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
    when: manual
+   allow_failure: true
  - if: "$S390X_RUNNER_AVAILABLE"
    when: manual
+   allow_failure: true
  script:
  - mkdir build
  - cd build
@@ -114,8 +120,10 @@ ubuntu-18.04-s390x-notcg:
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
    when: manual
+   allow_failure: true
  - if: "$S390X_RUNNER_AVAILABLE"
    when: manual
+   allow_failure: true
  script:
  - mkdir build
  - cd build
@@ -154,8 +162,10 @@ ubuntu-20.04-aarch64-all:
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
    when: manual
+   allow_failure: true
  - if: "$AARCH64_RUNNER_AVAILABLE"
    when: manual
+   allow_failure: true
  script:
  - mkdir build
  - cd build
@@ -189,8 +199,10 @@ ubuntu-20.04-aarch64-clang:
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
    when: manual
+   allow_failure: true
  - if: "$AARCH64_RUNNER_AVAILABLE"
    when: manual
+   allow_failure: true
  script:
  - mkdir build
  - cd build
@@ -207,8 +219,10 @@ ubuntu-20.04-aarch64-tci:
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
    when: manual
+   allow_failure: true
  - if: "$AARCH64_RUNNER_AVAILABLE"
    when: manual
+   allow_failure: true
  script:
  - mkdir build
  - cd build
@@ -224,8 +238,10 @@ ubuntu-20.04-aarch64-notcg:
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
    when: manual
+   allow_failure: true
  - if: "$AARCH64_RUNNER_AVAILABLE"
    when: manual
+   allow_failure: true
  script:
  - mkdir build
  - cd build
-- 
2.20.1


