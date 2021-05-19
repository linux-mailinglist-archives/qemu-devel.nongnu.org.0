Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 560C03896CA
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:33:16 +0200 (CEST)
Received: from localhost ([::1]:58256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRwR-0001lJ-BZ
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:33:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljRLk-0006aq-D0
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:55:20 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljRLe-000272-Jj
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:55:17 -0400
Received: by mail-wr1-x434.google.com with SMTP id a4so15140968wrr.2
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=focAcyrgaYB/hu+hbzPB7/PX+7KUYSEtTUHLMdtanj0=;
 b=C/ELoEuAM/t/O+SH8aXoMkAbKWCIHNGBTjLHg6N7/NHkIyp0Wkkeapt2S5Xux+TxDq
 iYoMF9owCbydA+fHE5jgu3eKIXPc+x8ErMpysZgtaVL659dG+zQsYD+IZRo+daRnzco+
 zjCBBmPH2d2z2dZxFajTtPk65Br2UYLR/dYrSBEhaxM/6Djv8+WQgDhkDIMAME++N5j7
 rpuf01Hmmp3PvyeF/hXGHZFa1xy4h7Ru3WEHZz9rooV1N55rs+9FaWgukD67MKDMKiFD
 4f9f8RYKN8vCa6XmhnJrj6IthgIrmgIg8SwhF5ohsWvdE86+B/q8ukOMmsbxjwvRU6XQ
 zrhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=focAcyrgaYB/hu+hbzPB7/PX+7KUYSEtTUHLMdtanj0=;
 b=QqUV9vbww9+SKjN7NaxD6rQvoVUGxQF3oj93cE9A2LdDVj8xWTbBoEEPENNR1qPpTG
 a08eyDm19dbLpt+r0xPVSurJDio68A9UBvgeyQDq7mcFNDTDiNzTfIKbot+372klPA9i
 9UkYy7hZCaM9sd0cgAdSVvsyt4eH6nztuBmZrlKPnTRChlI8hHoz+t4lu4lYVqVAlvAW
 D7+aWu124AsuGDY5H/+9uhUGvdlidTRqzi6S35ruGVwFiikVFYKo+IwmgnHpTpuI615n
 EA2p543QaS0tPk/Pk8L0+zmP35nMjbaqOOvqEHv5C+04K1W4C/iS9iRTGYCirxPXhPoA
 B96w==
X-Gm-Message-State: AOAM530wMVhEqMpTjPHxQGo8s2RIvOuPG0bnZcw1inG4UaW7fiOCE5Np
 y0652bw+9hWLzMD4Jf2g5zr2KdLyho9xnA==
X-Google-Smtp-Source: ABdhPJzT1I/VZwefmFliAzGhSLS163oPpe2Yr/2ipKEL1PSre/eAmzBV0aEphhGKXTw741ehWg2ECw==
X-Received: by 2002:adf:f309:: with SMTP id i9mr362701wro.307.1621450511771;
 Wed, 19 May 2021 11:55:11 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id m10sm281927wrr.2.2021.05.19.11.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:55:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/10] gitlab-ci: Replace YAML anchors by extends
 (acceptance_test_job)
Date: Wed, 19 May 2021 20:54:55 +0200
Message-Id: <20210519185504.2198573-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210519185504.2198573-1-f4bug@amsat.org>
References: <20210519185504.2198573-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

'extends' is an alternative to using YAML anchors
and is a little more flexible and readable. See:
https://docs.gitlab.com/ee/ci/yaml/#extends

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.yml | 30 +++++++++++-------------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 24f300aacea..6a36f8299bf 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -52,7 +52,8 @@ include:
     # Avoid recompiling by hiding ninja with NINJA=":"
     - make NINJA=":" $MAKE_CHECK_ARGS
 
-.acceptance_template: &acceptance_definition
+.acceptance_test_job_template:
+  extends: .native_test_job_template
   cache:
     key: "${CI_JOB_NAME}-cache"
     paths:
@@ -108,14 +109,13 @@ check-system-alpine:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-alpine:
-  extends: .native_test_job_template
+  extends: .acceptance_test_job_template
   needs:
     - job: build-system-alpine
       artifacts: true
   variables:
     IMAGE: alpine
     MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
 
 build-system-ubuntu:
   extends: .native_build_job_template
@@ -142,14 +142,13 @@ check-system-ubuntu:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-ubuntu:
-  extends: .native_test_job_template
+  extends: .acceptance_test_job_template
   needs:
     - job: build-system-ubuntu
       artifacts: true
   variables:
     IMAGE: ubuntu2004
     MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
 
 build-system-debian:
   extends: .native_build_job_template
@@ -176,14 +175,13 @@ check-system-debian:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-debian:
-  extends: .native_test_job_template
+  extends: .acceptance_test_job_template
   needs:
     - job: build-system-debian
       artifacts: true
   variables:
     IMAGE: debian-amd64
     MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
 
 build-system-fedora:
   extends: .native_build_job_template
@@ -211,14 +209,13 @@ check-system-fedora:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-fedora:
-  extends: .native_test_job_template
+  extends: .acceptance_test_job_template
   needs:
     - job: build-system-fedora
       artifacts: true
   variables:
     IMAGE: fedora
     MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
 
 build-system-centos:
   extends: .native_build_job_template
@@ -246,14 +243,13 @@ check-system-centos:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-centos:
-  extends: .native_test_job_template
+  extends: .acceptance_test_job_template
   needs:
     - job: build-system-centos
       artifacts: true
   variables:
     IMAGE: centos8
     MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
 
 build-system-opensuse:
   extends: .native_build_job_template
@@ -279,14 +275,13 @@ check-system-opensuse:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-opensuse:
-  extends: .native_test_job_template
+  extends: .acceptance_test_job_template
   needs:
     - job: build-system-opensuse
       artifacts: true
   variables:
     IMAGE: opensuse-leap
     MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
 
 
 build-disabled:
@@ -521,14 +516,13 @@ check-cfi-aarch64:
     MAKE_CHECK_ARGS: check
 
 acceptance-cfi-aarch64:
-  extends: .native_test_job_template
+  extends: .acceptance_test_job_template
   needs:
     - job: build-cfi-aarch64
       artifacts: true
   variables:
     IMAGE: fedora
     MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
 
 build-cfi-ppc64-s390x:
   extends: .native_build_job_template
@@ -558,14 +552,13 @@ check-cfi-ppc64-s390x:
     MAKE_CHECK_ARGS: check
 
 acceptance-cfi-ppc64-s390x:
-  extends: .native_test_job_template
+  extends: .acceptance_test_job_template
   needs:
     - job: build-cfi-ppc64-s390x
       artifacts: true
   variables:
     IMAGE: fedora
     MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
 
 build-cfi-x86_64:
   extends: .native_build_job_template
@@ -595,14 +588,13 @@ check-cfi-x86_64:
     MAKE_CHECK_ARGS: check
 
 acceptance-cfi-x86_64:
-  extends: .native_test_job_template
+  extends: .acceptance_test_job_template
   needs:
     - job: build-cfi-x86_64
       artifacts: true
   variables:
     IMAGE: fedora
     MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
 
 tsan-build:
   extends: .native_build_job_template
-- 
2.26.3


