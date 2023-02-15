Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C04698484
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 20:27:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSNPY-0006mv-LT; Wed, 15 Feb 2023 14:25:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSNPP-0006ig-9f
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:25:40 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSNPL-0001go-Lg
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:25:38 -0500
Received: by mail-wr1-x429.google.com with SMTP id s13so2522332wrw.3
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 11:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x9oUeIxFtfrIxx53Ee0pGIAyAlKeHllh0Hr23NIHP5Y=;
 b=zuCyHlWoTuhgoIjr5AXIkgqM5Kr+R83hZoKh6TvKqE/3q2z8+63dhAKAeFLjUeITL4
 nNE2tHnIG4ch3Ua5KN/fxBXgwjD35qXh9uZC2tJ+co0PosPiyIXw2yXG9Rrx17Z/TvPK
 As3eLK1mQYryPLzjLmyZPsnoOPpc8IooDxS3xjsDG1/i3f2mLO710S4/kMhfsDs93KNL
 Hd+8vsgDj/ae2CHbzzvv44PwK6Fpq/n4DR1L67p/+DSpFv6FMLM/3uUj+EBjFC0bCy3+
 6Qo6jKd/zxbYyui4wmGYlaqyQVGFwmtIHiqR37Klddv4S87RV8XNdo8KSwD1llLNKICO
 38Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x9oUeIxFtfrIxx53Ee0pGIAyAlKeHllh0Hr23NIHP5Y=;
 b=ap6XQLr3woWk8IUhK3aborF1utz77OXHnZM+AyBi8i/DMacTM0nepFt3jqhUYR5ZWX
 FS+vP6GKa83sqOquX8mv1IBh332h2OeksIRiPQ45PLTqoAFcFmi9LcF1vUggp2D1gfaE
 9jq0znop+zUV2IgnJ/Xn/tpAD+xiomnOUZk9AwEZhxkE19+NemW+U7InFYKQGRTrX7+4
 eY0FHK2r/+cN9+yXopamDd3xi92/K5WSXO4clQELGPR5aLKyZNJcU6Y5zBXFXJATA4NT
 VVPpSHCRWjhx8lUsNdlKSKcPTdlG7KSfh4BNQyc4SCp7V1vbFZPVi6fvh+M6J1mTGEQS
 Ayqg==
X-Gm-Message-State: AO0yUKU5he+524XlRqQ2LObN9fGHMC0R+ciyRL/0PstXN3v1GmyYiViB
 WaZcuyhOwKra7BLRTTVEC/ebhw==
X-Google-Smtp-Source: AK7set9VuN5c/8edSWpvvw+AEwsyjzbaMMl5mCXmTqC5nb+tT9UP/+c1EGEqD6UGj/JK8zFJHoKuMw==
X-Received: by 2002:a5d:6a52:0:b0:2c5:54a7:363e with SMTP id
 t18-20020a5d6a52000000b002c554a7363emr2712979wrw.3.1676489134341; 
 Wed, 15 Feb 2023 11:25:34 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a5d6984000000b002c552c6c8c2sm10823091wru.87.2023.02.15.11.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 11:25:32 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4024C1FFB7;
 Wed, 15 Feb 2023 19:25:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Alexander Bulekov <alxndr@bu.edu>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 06/12] gitlab: extend custom runners with base_job_template
Date: Wed, 15 Feb 2023 19:25:24 +0000
Message-Id: <20230215192530.299263-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215192530.299263-1-alex.bennee@linaro.org>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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

The base job template is responsible for controlling how we kick off
testing on our various branches. Rename and extend the
custom_runner_template so we can take advantage of all that control.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/custom-runners.yml                      |  3 ++-
 .gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml   | 10 +++++-----
 .gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml |  2 +-
 .gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml | 10 +++++-----
 4 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
index 9fdc476c48..34a1e6f327 100644
--- a/.gitlab-ci.d/custom-runners.yml
+++ b/.gitlab-ci.d/custom-runners.yml
@@ -15,7 +15,8 @@ variables:
 
 # All custom runners can extend this template to upload the testlog
 # data as an artifact and also feed the junit report
-.custom_artifacts_template:
+.custom_runner_template:
+  extends: .base_job_template
   artifacts:
     name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
     expire_in: 7 days
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
index f512eaeaa3..cdae6c5212 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
@@ -3,7 +3,7 @@
 # "Install basic packages to build QEMU on Ubuntu 20.04/20.04"
 
 ubuntu-20.04-s390x-all-linux-static:
- extends: .custom_artifacts_template
+ extends: .custom_runner_template
  needs: []
  stage: build
  tags:
@@ -24,7 +24,7 @@ ubuntu-20.04-s390x-all-linux-static:
  - make --output-sync -j`nproc` check
 
 ubuntu-20.04-s390x-all:
- extends: .custom_artifacts_template
+ extends: .custom_runner_template
  needs: []
  stage: build
  tags:
@@ -43,7 +43,7 @@ ubuntu-20.04-s390x-all:
  - make --output-sync -j`nproc` check
 
 ubuntu-20.04-s390x-alldbg:
- extends: .custom_artifacts_template
+ extends: .custom_runner_template
  needs: []
  stage: build
  tags:
@@ -66,7 +66,7 @@ ubuntu-20.04-s390x-alldbg:
  - make --output-sync -j`nproc` check
 
 ubuntu-20.04-s390x-clang:
- extends: .custom_artifacts_template
+ extends: .custom_runner_template
  needs: []
  stage: build
  tags:
@@ -108,7 +108,7 @@ ubuntu-20.04-s390x-tci:
  - make --output-sync -j`nproc`
 
 ubuntu-20.04-s390x-notcg:
- extends: .custom_artifacts_template
+ extends: .custom_runner_template
  needs: []
  stage: build
  tags:
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml
index 42137aaf2a..50e5646a44 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch32.yml
@@ -3,7 +3,7 @@
 # "Install basic packages to build QEMU on Ubuntu 20.04"
 
 ubuntu-22.04-aarch32-all:
- extends: .custom_artifacts_template
+ extends: .custom_runner_template
  needs: []
  stage: build
  tags:
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
index 8ba85be440..13e14a0f87 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
@@ -3,7 +3,7 @@
 # "Install basic packages to build QEMU on Ubuntu 20.04"
 
 ubuntu-22.04-aarch64-all-linux-static:
- extends: .custom_artifacts_template
+ extends: .custom_runner_template
  needs: []
  stage: build
  tags:
@@ -24,7 +24,7 @@ ubuntu-22.04-aarch64-all-linux-static:
  - make --output-sync -j`nproc --ignore=40` check
 
 ubuntu-22.04-aarch64-all:
- extends: .custom_artifacts_template
+ extends: .custom_runner_template
  needs: []
  stage: build
  tags:
@@ -46,7 +46,7 @@ ubuntu-22.04-aarch64-all:
  - make --output-sync -j`nproc --ignore=40` check
 
 ubuntu-22.04-aarch64-alldbg:
- extends: .custom_artifacts_template
+ extends: .custom_runner_template
  needs: []
  stage: build
  tags:
@@ -65,7 +65,7 @@ ubuntu-22.04-aarch64-alldbg:
  - make --output-sync -j`nproc --ignore=40` check
 
 ubuntu-22.04-aarch64-clang:
- extends: .custom_artifacts_template
+ extends: .custom_runner_template
  needs: []
  stage: build
  tags:
@@ -107,7 +107,7 @@ ubuntu-22.04-aarch64-tci:
  - make --output-sync -j`nproc --ignore=40`
 
 ubuntu-22.04-aarch64-notcg:
- extends: .custom_artifacts_template
+ extends: .custom_runner_template
  needs: []
  stage: build
  tags:
-- 
2.39.1


