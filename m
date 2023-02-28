Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6981A6A5F45
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 20:08:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX5K4-0002Og-La; Tue, 28 Feb 2023 14:07:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5Jk-0002JH-7i
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:07:18 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5JT-0002ow-MV
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:07:06 -0500
Received: by mail-wr1-x42c.google.com with SMTP id bx12so7715393wrb.11
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 11:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=21sp0hozNqE2G/F3Ib4OoUY82nDzhwO791FLVQWUI0Y=;
 b=k0u127K+0kfvMcv73QHpP9aIAxOwH/hP0h24oesYReBViSbaPYs7QW18rDhuF8opi0
 GqQdh68zX82Mz85ZIMLVj03F9/6VkR1sYV+YTOFrNhXUd4LmySZUhDgG7M57q6ufxE69
 53zlTcH+aVSGgKCV00wzy5f6M5rvt5HBzJ/HnJIpqCbRTbuE3YI7KVj/T5mykmSQNJgY
 MW/t+oBDM+e2oXcKqhZYJOR9q4VoABi8A9XOTc8cyCOeHyf2uX/VfYFToepjjIm6thQ0
 6R8r7zQfGWfkYeGBaWgf2tTJXIMuEJN6Oc94bOQoChgKUahY08GMGlFdxM7LkxZlI+qy
 BXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=21sp0hozNqE2G/F3Ib4OoUY82nDzhwO791FLVQWUI0Y=;
 b=yX8sPvKdskta/TX4ZfiB6ZYIIhUFg9DN5kxQDPe4J2VE6+naoMzYd6W7cTDb2mdGDz
 ONp8lNaHquiY0QK41iKuLpNAJ69sR2iVIB/rgmVYXmOnJG/MK/gFIZATcpzBoJrhLckv
 vIFCFCGOa8M6YO4mudYoSGuAyskHbnHJwm1f2zCAia/Ns/VfiN81UiDk7Dr1aYNqu/7G
 PjrEd/E1fjMVINUvkdAPNn6oCyM0vlCMIupMe/0nrUp2thQkmdgy24nHsRsqbyW/afsT
 eLS12rxnQvEfyqcOQ5a6gXcRp/6wcEj/HpSgI8vKWFGbtOOl/MrGRYiMCstLkBqiq1NB
 Z5sg==
X-Gm-Message-State: AO0yUKWWgKQHI9UFMZ4sQV7obM0DKIJJQF6QHw5vbFcyRdv+AhHrZPwe
 DORV0/Hu/pX+XkVxDddMGyO0Pw==
X-Google-Smtp-Source: AK7set88LRIOrmCN+PLI54C59GDu2UMQzTFiBWjmRoWK3+FspS8me2bjMiZzeif0Ktnv/XKZEnzXlw==
X-Received: by 2002:a05:6000:38d:b0:2c5:5ee9:6b27 with SMTP id
 u13-20020a056000038d00b002c55ee96b27mr2816577wrf.13.1677611218055; 
 Tue, 28 Feb 2023 11:06:58 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 s2-20020adff802000000b002c706c754fesm10613655wrp.32.2023.02.28.11.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 11:06:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F34561FFBE;
 Tue, 28 Feb 2023 19:06:53 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Ed Maste <emaste@freebsd.org>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v3 06/24] gitlab: extend custom runners with base_job_template
Date: Tue, 28 Feb 2023 19:06:35 +0000
Message-Id: <20230228190653.1602033-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228190653.1602033-1-alex.bennee@linaro.org>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Message-Id: <20230221094558.2864616-8-alex.bennee@linaro.org>
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
2.39.2


