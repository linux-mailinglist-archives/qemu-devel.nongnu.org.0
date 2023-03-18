Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 337496BF9AE
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 12:49:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdV1T-0004ng-JO; Sat, 18 Mar 2023 07:46:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pdV1P-0004mE-Kr
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 07:46:51 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pdV1N-0007Cr-68
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 07:46:51 -0400
Received: by mail-wr1-x433.google.com with SMTP id p4so6495872wre.11
 for <qemu-devel@nongnu.org>; Sat, 18 Mar 2023 04:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679140008;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xgdicq7m/OJKJ1GMKu+lrn3dY/QnHxIJP5axTf8wSjw=;
 b=DRcTX4g0McYSWp+AS2LtTsPkVafAgZH81rgQGiH4vfIKTgdLhfK6dXophF0+vZfcRz
 dOpv5i8f3QwgcRb0nqA48t8GndI4ARVu8Pj4/xRzfcNQx5UMMEszq5qFn8s+K8wwO3O+
 KRMvDMBfQGHjV+PZvD8nIlkB2BbMuxHBapP63nv5DkJYNHc6h83E54cXvYhRtLAfYGqZ
 PU7kN/vbk0I5bZVnNhCeUWjyUGytg1fCNhZCmgmeRVOnINAVm2w6DSRV9DhiMG8TLM4b
 Vnt9tvEyH1DKRik0dkgKglIG4LR21oEse8u0TA/P3YbIgch7hvPr6EEi1NnwVaOuimtt
 aIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679140008;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xgdicq7m/OJKJ1GMKu+lrn3dY/QnHxIJP5axTf8wSjw=;
 b=2F+J1lfndQKn3xzctdfuWADVfAUiQxkQ1X8x5PdA1fIh09WrC5tkujeWY+5TnYBOTq
 Pi4cl2jGzWjEuGdHb0CGr+QuwoimmCUwzHn3VzeazeIWZLdEWFDOjWMUpthAcBpwxV6p
 r+Isdzho0w+9sb57RIHINI1HxD4khYQFFlOGQUVnsc14R9VS5HOpkqDf/FFvb/KNkqid
 DA/d0ujvo80vxBY7w+bnCtobhAQKR2qvL2xvEh22/6YutX1AYgEavlaLldDk/7zcGHhe
 zma9jG+EDPsGkPk/piflQ9TVpBM9ApOWQl13elEG9M9NkLM8aP2yNCcibtOdbgrLRqYo
 zG0g==
X-Gm-Message-State: AO0yUKWfvPwzNEv7J/6gE5h0YQqSjxjyrmsdT1EVXYBiMadoyBtRk6aV
 X81LeiSJgpzIQguPcj+vIDoIXg==
X-Google-Smtp-Source: AK7set+ivINW2ILe0DAFGKwI25V/XN/JbS+e+QTXhaelaOOeqR1N8CyMd4xwsmUanKLGaz8PVYLYZA==
X-Received: by 2002:a5d:40c6:0:b0:2c7:1e43:e578 with SMTP id
 b6-20020a5d40c6000000b002c71e43e578mr9561626wrq.41.1679140007742; 
 Sat, 18 Mar 2023 04:46:47 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 h10-20020adffa8a000000b002ce3d3d17e5sm4194509wrr.79.2023.03.18.04.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 04:46:46 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 105C21FFBD;
 Sat, 18 Mar 2023 11:46:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 05/31] gitlab: update centos-8-stream job
Date: Sat, 18 Mar 2023 11:46:18 +0000
Message-Id: <20230318114644.1340899-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318114644.1340899-1-alex.bennee@linaro.org>
References: <20230318114644.1340899-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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

A couple of clean-ups here:

  - inherit from the custom runners job for artefacts
  - call check-avocado directly
  - add some comments to the top about setup

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230315174331.2959-6-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml b/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml
index 068b0c4335..367424db78 100644
--- a/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml
+++ b/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml
@@ -1,4 +1,9 @@
+# All centos-stream-8 jobs should run successfully in an environment
+# setup by the scripts/ci/setup/stream/8/build-environment.yml task
+# "Installation of extra packages to build QEMU"
+
 centos-stream-8-x86_64:
+ extends: .custom_runner_template
  allow_failure: true
  needs: []
  stage: build
@@ -8,15 +13,6 @@ centos-stream-8-x86_64:
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
  - if: "$CENTOS_STREAM_8_x86_64_RUNNER_AVAILABLE"
- artifacts:
-   name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
-   when: on_failure
-   expire_in: 7 days
-   paths:
-     - build/tests/results/latest/results.xml
-     - build/tests/results/latest/test-results
-   reports:
-     junit: build/tests/results/latest/results.xml
  before_script:
  - JOBS=$(expr $(nproc) + 1)
  script:
@@ -25,6 +21,4 @@ centos-stream-8-x86_64:
  - ../scripts/ci/org.centos/stream/8/x86_64/configure
    || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make -j"$JOBS"
- - make NINJA=":" check
-   || { cat meson-logs/testlog.txt; exit 1; } ;
- - ../scripts/ci/org.centos/stream/8/x86_64/test-avocado
+ - make NINJA=":" check check-avocado
-- 
2.39.2


