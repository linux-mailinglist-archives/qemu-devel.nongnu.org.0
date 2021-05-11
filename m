Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 760B837A0E4
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 09:35:10 +0200 (CEST)
Received: from localhost ([::1]:50600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgMv7-0002EX-IW
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 03:35:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgMqM-00046O-J5
 for qemu-devel@nongnu.org; Tue, 11 May 2021 03:30:15 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgMqJ-0008Bu-LC
 for qemu-devel@nongnu.org; Tue, 11 May 2021 03:30:13 -0400
Received: by mail-wr1-x42d.google.com with SMTP id a4so19044928wrr.2
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 00:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IZMKyCqMyO5bHC9zaYKJDMgMEQPBUUEp167PbRshw9g=;
 b=jrhMpAWT7XBRSY4S1eJkgi6NUF+eIdmpAOlSayloWLYkN7Iwg/FSKukr3jSbxQpzMR
 3l0wZ4A3yxub4T58Icr4rqMS9Ymh6r/ZvGB3U/PBeT/DkshHVTxWgQh8imiU6Qm5nAVj
 4eQSabSrAHGdnknUNiJQsAdYrJR6Qtq9x0XRN0LV2IU0SmqQXiCuzfdXxGwUdjUaYEax
 Yn+OMKYT2kSipyq706hssHKTuR5tbK/9N4cHSwpE6gKXDS/HVe7fXoRY8EPcKwPNfIYY
 TnEYjVEtKWz4sY2nMe8jGiLNqGd8KUBDZhup4bTU0GqpYG3uVUHFDWRb7G20xCDN1D2q
 cnSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IZMKyCqMyO5bHC9zaYKJDMgMEQPBUUEp167PbRshw9g=;
 b=fiB5RnYDKnFEMZWxHuG0uA6gukroIGwgNZ23dauPz/RkA1mmcY3vegJt1VbMq1KcES
 YhaDJn61n3X+0Y8GQZGQPcQu9fig5ZkJ0JSkX5Py33s5HBUK06PdZc+M1+HrG8Rz/Zc2
 78o0voGBpStbMtlWr4z7v29Ux9KC+ENlNaFcKnO6VCzGiTZjzN8UUzpuctpAxTB4LVIg
 Lbh/H02Xf3lVIr9t5oyBwL2KLhI6mlcue5o5o8XuSv/FOCxXrZ473BYkUAFVVZI1ZEr6
 JKYWn0GjsQ6wZ5xTYD2oWumW65wJLL8RDEANeOES67nAJd7TfYuJBjH0IxX+1thFzkMb
 DHpA==
X-Gm-Message-State: AOAM532eFh0RFWCsG7G77sRL5XalUP8q6nvbMma2QKGtce5v20vlkuyu
 ZLKQiyAQJoJ9s5vwD5wcERRYsUrql7lXXA==
X-Google-Smtp-Source: ABdhPJyOnr7vureBpXbqKCpB/z8JCajKgoheRFHe7fakX93LvMzvFjdc6wyS2i1Unp/Kq19dOPPGbg==
X-Received: by 2002:adf:e552:: with SMTP id z18mr34851602wrm.226.1620718209151; 
 Tue, 11 May 2021 00:30:09 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id s15sm25779125wrt.19.2021.05.11.00.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 00:30:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/10] gitlab-ci: Extract container job template to
 container-template.yml
Date: Tue, 11 May 2021 09:29:45 +0200
Message-Id: <20210511072952.2813358-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210511072952.2813358-1-f4bug@amsat.org>
References: <20210511072952.2813358-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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


