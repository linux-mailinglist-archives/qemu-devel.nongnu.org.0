Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 963406A6F23
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 16:17:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXOBu-0008Gm-B5; Wed, 01 Mar 2023 10:16:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXOBj-00089I-2N
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:16:15 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXOBf-0007c8-Be
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:16:14 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so12107013wms.2
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 07:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=070PzUrZfVxXqhDV3BT8grkHDt8Ezv1S71HCy6H1uh4=;
 b=QvXBuH+kUPThItsAcy8oxZOLtrKZE8FMKnoRrRYsjjI4HZlACnBPOyHGEBvHheph9q
 Pq0VLGHgQ77KDsMHbe2qwV2Zfhmh8jpglJAg6DIjIDGXWpJoorYmRc4yKuvml6ZP+pET
 rePPlzU2dw7gfb+V/e5UpHJedWrOwC4y24ok5nooknXZ+2RkVStyq09fG2h7/CuBfsJu
 lUp1aKQno7Vb+f8LEbjdDyLiX4Fl7+7sx9ma6OcvH1v3n2r32l7NnaQrMc0dOyhoby7F
 OP17SRKbquNVvPcFKE79KgJBo/bFwmKsWY3vEXp9YpnutoZAc1P/XiADZOx7AxnuNVvN
 3uOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=070PzUrZfVxXqhDV3BT8grkHDt8Ezv1S71HCy6H1uh4=;
 b=OT1vGjTHm/YfPhyjNklhS/nnr0M88LesYr4C9wbKox8IYTPUSI+75SwKGBBDOq5wyI
 cENkVANVyr3/iNoypvG7XNdftm8TOgNyz0tHiS2z62SJLdaGy418zq5kC5AIGOPu8qXx
 gBIADzTxX2BV0nLs+YTFzIF6y2yOEUyJRYKTlGnVXzKOmkJiWdR4fvwldXiKN4GtT2T+
 uHjOyzajhqtja+YIWtV6UlM/rEAHMZ3lFOw4s3ZplFu8sZ9crQYAd7+Xb2X5a6C26Kw/
 WlYjop5ukZ+n085wFdlmG1cxyBFNRt4KIT/GRc6HgcwnzELS+5jQyE2Z21eXqY0FuJpU
 tHUQ==
X-Gm-Message-State: AO0yUKX+W3ZirYxqyCg2+f4K6AfFfTiVFAYgZpHNkMi2SIpyBY+4aaCM
 2B5RQGmjSlK+C8skBsgtyhZMqA==
X-Google-Smtp-Source: AK7set+va159WcfhvXMGiGp6M8pJTxwnn4m2Yg0Zf5zi72Z7l9jIZ3XRuKZc+9iq/sKJamrU4cqEtg==
X-Received: by 2002:a05:600c:713:b0:3ea:f883:4ce with SMTP id
 i19-20020a05600c071300b003eaf88304cemr5180206wmn.20.1677683769795; 
 Wed, 01 Mar 2023 07:16:09 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a1c540d000000b003db06224953sm16421465wmb.41.2023.03.01.07.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 07:16:07 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 51F2D1FFBE;
 Wed,  1 Mar 2023 15:16:05 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL v2 06/24] gitlab: extend custom runners with base_job_template
Date: Wed,  1 Mar 2023 15:15:46 +0000
Message-Id: <20230301151604.1948813-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301151604.1948813-1-alex.bennee@linaro.org>
References: <20230301151604.1948813-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230228190653.1602033-7-alex.bennee@linaro.org>

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
2.39.2


