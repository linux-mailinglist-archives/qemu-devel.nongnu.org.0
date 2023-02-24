Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EEF6A2133
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 19:10:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVcVN-0005Ca-D1; Fri, 24 Feb 2023 13:09:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVcVK-00059t-Dd
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 13:09:10 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVcVD-0004zM-N9
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 13:09:09 -0500
Received: by mail-wm1-x329.google.com with SMTP id j3so239714wms.2
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 10:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BlibFENLTWxL3qZcvscioQcCh9h4BHOWtZSqmzwML2w=;
 b=IfVx9gTacJ1XAklga3Qd14ZE5FuJHoJZzHBgtqJCD3eDYqp3As46AQsINnZTYY0FgQ
 +S71GbC2LxStBmmL7FDtAREyra73m/BHXaV7uMMyPP/6qRGPkeZfSCvFEs84xMisuKcG
 vuI4dBLRi5bu8DvPpn5VMPw1y4+By5epqkyIUpKwRqsIPvdW0f9Sly9kUpgKWtq19YdE
 pu7Avym4lDuy8Qo8Eyp35sxW1kwl4PXT4MAuUdJd81cs4mbqL2W3TIiLNbXmaQJIska7
 vALRCADcEHjFNItc0kMMC5Z6/zf1EzQqNCHZCY4hgQsxvcAN5ignmv27jXXweEMyjoPl
 IGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BlibFENLTWxL3qZcvscioQcCh9h4BHOWtZSqmzwML2w=;
 b=IO6IbUVDQ+r1NTDbgq+lYevzUrJ0MyBsaSCvEHTLjuA9GE7h45emO2ez+GcYOzFzDs
 6cqJ+XY5lybxbPHBsDpIntSrhUAxaEliUz/MJqRh3V+G+JaiQ9a0VqXYOw5fqbatlI7D
 VhH/paBFWy8oWGQaoW0HsBFBEZ0QKUnS0Q5GR1dmIc/sUq9j6B9TzdI9CREaqdwCAwb+
 8euhmHOiqjguvwOtrBHsUf32GA8k98P7Pg4cYJE0zFdfuVxyY0PxVvllzPwGakPyffz8
 UxRKYX/tGvAsK725mDY/Y7FHR5nXAT5yz2C9Je6gLWdMbNs+uDeTD9Zxa2Gr4+VdPzqM
 D3EQ==
X-Gm-Message-State: AO0yUKWyhAnZ6RzX43qZtEYMDTKV9/G77AdQK3pMUrkW2WDiQW1P/exr
 g9Mo/9Op4Nl82EnSwesjZ+2MHg==
X-Google-Smtp-Source: AK7set/SutOtWg/nsg2BVqP8EU53yu0HYBpxaSwAtYZRTuMYpRMf+XWFPlG9sjuzveDTncso4GKyCw==
X-Received: by 2002:a05:600c:44d3:b0:3da:fc30:bfc5 with SMTP id
 f19-20020a05600c44d300b003dafc30bfc5mr12278494wmo.13.1677262142297; 
 Fri, 24 Feb 2023 10:09:02 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 hn29-20020a05600ca39d00b003e21f01c426sm3797726wmb.9.2023.02.24.10.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 10:09:01 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ACF4F1FFBE;
 Fri, 24 Feb 2023 18:08:58 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Beraldo Leal <bleal@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Ed Maste <emaste@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Hanna Reitz <hreitz@redhat.com>,
 Bandan Das <bsd@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Subject: [PATCH 7/7] tests/gitlab: use kaniko to build images
Date: Fri, 24 Feb 2023 18:08:57 +0000
Message-Id: <20230224180857.1050220-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230224180857.1050220-1-alex.bennee@linaro.org>
References: <20230224180857.1050220-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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

Apparently the docker-in-docker approach has some flaws including
needing privileged mode to run and being quite slow. An alternative
approach is to use Google's kaniko tool. It also works across
different gitlab executors.

Following the gitlab example code we drop all the direct docker calls
and usage of the script and make a direct call to kaniko and hope the
images are cacheable by others.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/container-template.yml | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/.gitlab-ci.d/container-template.yml b/.gitlab-ci.d/container-template.yml
index c434b9c8f3..c2d7950df8 100644
--- a/.gitlab-ci.d/container-template.yml
+++ b/.gitlab-ci.d/container-template.yml
@@ -1,22 +1,17 @@
 .container_job_template:
   extends: .base_job_template
-  image: docker:stable
+  image:
+    name: gcr.io/kaniko-project/executor:v1.9.0-debug
+    entrypoint: [""]
   stage: containers
-  services:
-    - docker:dind
   before_script:
     - export TAG="$CI_REGISTRY_IMAGE/qemu/$NAME:latest"
-    - export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/$NAME:latest"
-    - apk add python3
-    - docker info
-    - docker login $CI_REGISTRY -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD"
+    - export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/qemu/$NAME:latest"
   script:
     - echo "TAG:$TAG"
     - echo "COMMON_TAG:$COMMON_TAG"
-    - ./tests/docker/docker.py --engine docker build
-          -t "qemu/$NAME" -f "tests/docker/dockerfiles/$NAME.docker"
-          -r $CI_REGISTRY/qemu-project/qemu
-    - docker tag "qemu/$NAME" "$TAG"
-    - docker push "$TAG"
-  after_script:
-    - docker logout
+    - /kaniko/executor
+          --reproducible
+          --context "${CI_PROJECT_DIR}"
+          --dockerfile "${CI_PROJECT_DIR}/tests/docker/dockerfiles/$NAME.docker"
+          --destination "${TAG}"
-- 
2.39.1


