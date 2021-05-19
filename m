Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB033896A4
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:27:16 +0200 (CEST)
Received: from localhost ([::1]:38404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRqd-0005H8-3s
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljRLq-0006el-4O
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:55:26 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljRLn-0002DI-Vs
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:55:25 -0400
Received: by mail-wr1-x42c.google.com with SMTP id v12so15096806wrq.6
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IQ5uBvqnEb/2vrwU+swfi2Bvs1ezLa0G0+WLRMkJPA8=;
 b=faZDbBv0LaTqjX2G0YHe6CNn65s2mW+UW0JSL8r2xSCAyzeo1SqJsx643H+JwLtb/e
 d5dZ+iOB4vPsq90BM9J0rmHBk+KYCI9Qj8h1ekQHU/DabWBi0SsUVWmTc5nPphu0pHOw
 gT3hKM4wcimK0JvuMksYpziTra/8RXmqznKU1b5N/+CTdtES29XW4HKyuV0qGgaFdXVd
 xE2CYU3PtBt8QzMib+UsZXzocjEzfBAzo/GI+KpnPNmRizUzIplgg0zGIeeBYtcdA28m
 pH1fHmkMidPGOOGm38AxlpCxaYQgu1TM+t7zAHGmKlPAglSQyKd1B1YM3/s/xiiAFuES
 IfCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IQ5uBvqnEb/2vrwU+swfi2Bvs1ezLa0G0+WLRMkJPA8=;
 b=lwbZUW7weze4gp23dIHw4C1Dwy2IbIxpf/ypaVyefC985cRTUWL7oTIh/IzL/Q3H5q
 yFaMzPupbWqQ96v85v7UN8aNFh0lEJQliF+qcyopt19iRKcWx8Nt+4fh+zuJNc+si2vE
 Sl3zJm7kVatKeQew1M9rjUgojZY+kOtvPcKUEwGFoY0OjcNO/N4rtjT4QHPptCWpz6Ud
 cBphVEJU1pRDXvBKr7CRr92B3d/JxGbKVFPIyZ5ZHdQLnG6EdRrFJWn9tEeJF4Ldvanp
 ORRjs6k3gfhnvjT+p5yoOv3nIs2XrCyGksTAvnbF7blbYYGq0J9qiSsuhIG+icdFeh3/
 QIZw==
X-Gm-Message-State: AOAM530DLOjRgEBauknZ2CpBEK88gudMSQDjEqxxdLc5sEbe0HZIiv63
 FvbU516e46rLpr4ifQSot9oaNbH78I9Jlw==
X-Google-Smtp-Source: ABdhPJytGpLW6rKrSwVj6JF9o9iQQuzCwKB84TInObH4xYEAyDGYM1YJ3aMLGm3b6CHZuAoVVLL9xw==
X-Received: by 2002:adf:e4cf:: with SMTP id v15mr376930wrm.145.1621450521643; 
 Wed, 19 May 2021 11:55:21 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id r11sm274746wrp.46.2021.05.19.11.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:55:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/10] gitlab-ci: Extract container job template to
 container-template.yml
Date: Wed, 19 May 2021 20:54:57 +0200
Message-Id: <20210519185504.2198573-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210519185504.2198573-1-f4bug@amsat.org>
References: <20210519185504.2198573-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract the container job template to a new file
(container-template.yml) to be able to reuse it
without having to run all the jobs included, which
are mainly useful for mainstream CI.

Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/container-template.yml | 22 ++++++++++++++++++++++
 .gitlab-ci.d/containers.yml         | 24 ++----------------------
 2 files changed, 24 insertions(+), 22 deletions(-)
 create mode 100644 .gitlab-ci.d/container-template.yml

diff --git a/.gitlab-ci.d/container-template.yml b/.gitlab-ci.d/container-template.yml
new file mode 100644
index 00000000000..9e3f3ae3c26
--- /dev/null
+++ b/.gitlab-ci.d/container-template.yml
@@ -0,0 +1,22 @@
+.container_job_template:
+  image: docker:stable
+  stage: containers
+  services:
+    - docker:dind
+  before_script:
+    - export TAG="$CI_REGISTRY_IMAGE/qemu/$NAME:latest"
+    - export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/$NAME:latest"
+    - apk add python3
+    - docker info
+    - docker login $CI_REGISTRY -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD"
+  script:
+    - echo "TAG:$TAG"
+    - echo "COMMON_TAG:$COMMON_TAG"
+    - docker pull "$TAG" || docker pull "$COMMON_TAG" || true
+    - ./tests/docker/docker.py --engine docker build
+          -t "qemu/$NAME" -f "tests/docker/dockerfiles/$NAME.docker"
+          -r $CI_REGISTRY_IMAGE
+    - docker tag "qemu/$NAME" "$TAG"
+    - docker push "$TAG"
+  after_script:
+    - docker logout
diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 4ef76d1f54d..0bf4899df10 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -1,25 +1,5 @@
-.container_job_template:
-  image: docker:stable
-  stage: containers
-  services:
-    - docker:dind
-  before_script:
-    - export TAG="$CI_REGISTRY_IMAGE/qemu/$NAME:latest"
-    - export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/$NAME:latest"
-    - apk add python3
-    - docker info
-    - docker login $CI_REGISTRY -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD"
-  script:
-    - echo "TAG:$TAG"
-    - echo "COMMON_TAG:$COMMON_TAG"
-    - docker pull "$TAG" || docker pull "$COMMON_TAG" || true
-    - ./tests/docker/docker.py --engine docker build
-          -t "qemu/$NAME" -f "tests/docker/dockerfiles/$NAME.docker"
-          -r $CI_REGISTRY_IMAGE
-    - docker tag "qemu/$NAME" "$TAG"
-    - docker push "$TAG"
-  after_script:
-    - docker logout
+include:
+  - local: '/.gitlab-ci.d/container-template.yml'
 
 amd64-alpine-container:
   extends: .container_job_template
-- 
2.26.3


