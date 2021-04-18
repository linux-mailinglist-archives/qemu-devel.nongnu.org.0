Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA05363890
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 01:44:21 +0200 (CEST)
Received: from localhost ([::1]:33232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYH5Q-0008TM-RV
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 19:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGwm-0000al-Bk
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 19:35:24 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:52000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGwk-00039u-Mv
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 19:35:24 -0400
Received: by mail-wm1-x332.google.com with SMTP id p19so17189328wmq.1
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 16:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IZMKyCqMyO5bHC9zaYKJDMgMEQPBUUEp167PbRshw9g=;
 b=JRzyvRaIgVduiKXSWdzn/SYoIhyNKinnWaHrByMEw1yGdhdon3Sz6EMBkxllp5RC6p
 urjTb7gd7qO2vExG0RMdExbwLeY2LrlPuehSgtzQzDKs9arsQQz8I8V8fFsco2wvua6d
 CpZpcdVLLsOb9JqJiwBDT6eZXlZo+Ad+GF1FvfsVbe7RVxfKQ3S1vvZ8MDkxK1TaQlz1
 pYY74icrWnhYfbImuXA3q2Rg67oZsf8v1r0SuvVUOQ++77FUV+XsFsT0BFq8Qd5E+6eZ
 ZkmKRoxWSJy8YfR1awSi1mp/LsVDNDtuPaGUW7ROGotnmwTWm4wopaqcgm34SmSGj97J
 3bqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IZMKyCqMyO5bHC9zaYKJDMgMEQPBUUEp167PbRshw9g=;
 b=dzQ/GC7v0e6/1P5eLqsk5KsXzDSxhLgH7CsN5JJM3n8cZziU37nd314onn8O5VCHkD
 wjDi19wTY6689MNisgnxJ6f1ZIquiwgzaB9adgmwiEYkmckHSwwdUdxtl2eMxFGt7mcw
 D18n9Dn9VbnPo6w6mKrmB+y04R//r6kHlBsGdZfOXqDgYYmPNyubP8+3x2OQSK6vJ8Os
 lrKzX4/J9PA5JhrOQlfwQalTkRPpGNv+HPmN7Mv9TT7d/D7M6QW84DLBPHhtvodhPIp2
 7pl4KPgyt4Suah3aagzXBPo3G0Da/VjsyjiK3c8krmHZnzUMgeDiey4VLBmj7479nXHH
 SSvw==
X-Gm-Message-State: AOAM531hDtPupR2m1kI2DgYbI6i75a8fut6ZeG8jglmUnDsFkV8LRjCk
 y338MBCTmGYCw7EYuSqcpJtoiXICaxkESg==
X-Google-Smtp-Source: ABdhPJx2ngVZ6mivhw8Xtv4B2x49q2Ox3RqRCjLHcXxRaMPX8eOcYlz1dqyFr3co8R56R0LXUWN5EA==
X-Received: by 2002:a1c:7f16:: with SMTP id a22mr17791114wmd.17.1618788921072; 
 Sun, 18 Apr 2021 16:35:21 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id o12sm11079262wmq.21.2021.04.18.16.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 16:35:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/15] gitlab-ci: Extract container job template to
 container-template.yml
Date: Mon, 19 Apr 2021 01:34:39 +0200
Message-Id: <20210418233448.1267991-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418233448.1267991-1-f4bug@amsat.org>
References: <20210418233448.1267991-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract the container job template to a new file
(container-template.yml) to be able to reuse it
without having to run all the jobs included, which
are mainly useful for mainstream CI.

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


