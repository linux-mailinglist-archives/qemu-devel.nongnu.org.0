Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF14F53ACF0
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 20:42:03 +0200 (CEST)
Received: from localhost ([::1]:54160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwTIA-0006uj-0Z
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 14:42:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSrN-0002Zo-UA
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:14:21 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:35568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nwSrL-0006be-1q
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:14:21 -0400
Received: by mail-ed1-x52d.google.com with SMTP id t5so3306034edc.2
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 11:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tG3XVIgRlYICdHMGLmxPrKM99tTN6zMZGL49EBiZlFI=;
 b=gF1qKuBOBkJ7TB788RdmtmifV67/NGUcmA5W9AkCB+5GceiNBCN5/H1jSt+EQTtvan
 vJstANsBfKtuJuvMPbcVKUH/OYfTZ/lrVvHyYD2NJTLS5RaveNBkQgoXzeyNJX7Va9Vh
 m1JfqEOXfLLTs9e98i483PJRLDIHJ08ZJtNNyiYzs7Zmv1681eZBccuvR26oMssk5Hns
 tlT+C3BRseranhtieHIctJyf8uJdwBkrWerOIU4Wxo9M5nW/fDULBp9xJOJVVxH0KJdt
 pGF8+8HY1XuL2QgJe4DT/EQldTAWacmqGTvFj92W3evT7knbIwuMe7CjoB0dNZ9wGwl4
 kCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tG3XVIgRlYICdHMGLmxPrKM99tTN6zMZGL49EBiZlFI=;
 b=bWw17wEWlgUAS8/EWQe9mLZyVSigLg+5j/W63BuZVYmKDw699ePpvTTZGMxPnIH0D0
 Sv0Qh2wvjXjY5/OwHtTGr6ISEnBNlkB1XF9KIP9/35VIMBN2y8aQPhjRRA7wiD44CMei
 y/XN4paNeJCjnHsUx6lt3NdAYrAzUl0/R4eM1d0+MHWpSK5muz3YEmjFgxpPbrUlYChQ
 r4g5lMmt9DH2cYdc0qVmrnMWAm+QtDrv9uxbNywsjp0izSa3WmYfs7HFFbcjLrZTGRmk
 /2eejy7LbF5MH6LIV5BHZ1mdTUrGmuBGr4Qtir4Fa6Of8ZbipTi8i8O6ElYEK9AjavIn
 KQTw==
X-Gm-Message-State: AOAM532RArbfLdXDvOcOEL50wDN2qCmmOq2tttQAIkcy8nHJUzi7PFg7
 fTddtoiFNJVeNWfHIJipMD4oNQ==
X-Google-Smtp-Source: ABdhPJy9VotiiKlBhoycG8OOmopoY9asiWIg7mqA+Kx0DweSqhE0Y8TOpsOCQE+OXUITOky/JhQ5zA==
X-Received: by 2002:aa7:d557:0:b0:42a:c6a0:7c28 with SMTP id
 u23-20020aa7d557000000b0042ac6a07c28mr1101621edr.426.1654107257562; 
 Wed, 01 Jun 2022 11:14:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 o23-20020a056402039700b0042df2371b1bsm1341020edv.89.2022.06.01.11.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 11:14:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8D6001FFD5;
 Wed,  1 Jun 2022 19:05:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 30/33] gitlab: convert static checks to .base_job_template
Date: Wed,  1 Jun 2022 19:05:34 +0100
Message-Id: <20220601180537.2329566-31-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220601180537.2329566-1-alex.bennee@linaro.org>
References: <20220601180537.2329566-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52d.google.com
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

From: Daniel P. Berrangé <berrange@redhat.com>

This folds the static checks into using the base job
template rules, introducing one new variable

 - QEMU_JOB_ONLY_FORKS - a job that should never run
   on an upstream pipeline. The information it reports
   is only applicable to contributors in a pre-submission
   scenario, not time of merge.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220526110705.59952-4-berrange@redhat.com>
[AJB: fix typo]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220527153603.887929-31-alex.bennee@linaro.org>

diff --git a/docs/devel/ci-jobs.rst.inc b/docs/devel/ci-jobs.rst.inc
index a539f502da..4c7e30ab08 100644
--- a/docs/devel/ci-jobs.rst.inc
+++ b/docs/devel/ci-jobs.rst.inc
@@ -66,6 +66,13 @@ by default due to need to conserve limited CI resources. It is
 available to be started manually by the contributor in the CI
 pipelines UI.
 
+QEMU_JOB_ONLY_FORKS
+~~~~~~~~~~~~~~~~~~~
+
+The job results are only of interest to contributors prior to
+submitting code. They are not required as part of the gating
+CI pipeline.
+
 Contributor controlled runtime variables
 ----------------------------------------
 
diff --git a/.gitlab-ci.d/base.yml b/.gitlab-ci.d/base.yml
index 5734caf9fe..e6953c77ae 100644
--- a/.gitlab-ci.d/base.yml
+++ b/.gitlab-ci.d/base.yml
@@ -16,6 +16,10 @@
     - if: '$QEMU_JOB_CIRRUS && ($CIRRUS_GITHUB_REPO == "" || $CIRRUS_API_TOKEN == "")'
       when: never
 
+    # Jobs only intended for forks should always be skipped on upstream
+    - if: '$QEMU_JOB_ONLY_FORKS == "1" && $CI_PROJECT_NAMESPACE == "qemu-project"'
+      when: never
+
 
     #############################################################
     # Stage 2: fine tune execution of jobs in specific scenarios
diff --git a/.gitlab-ci.d/static_checks.yml b/.gitlab-ci.d/static_checks.yml
index 94858e3272..289ad1359e 100644
--- a/.gitlab-ci.d/static_checks.yml
+++ b/.gitlab-ci.d/static_checks.yml
@@ -1,4 +1,5 @@
 check-patch:
+  extends: .base_job_template
   stage: build
   image: python:3.10-alpine
   needs: []
@@ -6,15 +7,13 @@ check-patch:
     - .gitlab-ci.d/check-patch.py
   variables:
     GIT_DEPTH: 1000
+    QEMU_JOB_ONLY_FORKS: 1
   before_script:
     - apk -U add git perl
-  rules:
-    - if: '$CI_PROJECT_NAMESPACE == "qemu-project"'
-      when: never
-    - when: on_success
-      allow_failure: true
+  allow_failure: true
 
 check-dco:
+  extends: .base_job_template
   stage: build
   image: python:3.10-alpine
   needs: []
@@ -23,12 +22,9 @@ check-dco:
     GIT_DEPTH: 1000
   before_script:
     - apk -U add git
-  rules:
-    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH'
-      when: never
-    - when: on_success
 
 check-python-pipenv:
+  extends: .base_job_template
   stage: test
   image: $CI_REGISTRY_IMAGE/qemu/python:latest
   script:
@@ -39,6 +35,7 @@ check-python-pipenv:
     job: python-container
 
 check-python-tox:
+  extends: .base_job_template
   stage: test
   image: $CI_REGISTRY_IMAGE/qemu/python:latest
   script:
@@ -46,8 +43,6 @@ check-python-tox:
   variables:
     GIT_DEPTH: 1
     QEMU_TOX_EXTRA_ARGS: --skip-missing-interpreters=false
+    QEMU_JOB_OPTIONAL: 1
   needs:
     job: python-container
-  rules:
-    - when: manual
-  allow_failure: true
-- 
2.30.2


