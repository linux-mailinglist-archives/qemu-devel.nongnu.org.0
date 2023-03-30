Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 926826D00C9
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 12:12:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phpGB-0007bb-F8; Thu, 30 Mar 2023 06:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phpG6-0007WY-OV
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:11:54 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phpG1-0000Il-8a
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:11:53 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 n10-20020a05600c4f8a00b003ee93d2c914so12771640wmq.2
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 03:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680171107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G9GbMYvAaWW0oOBX4NN/Uf9OJgdDvvjHPBRD08CBk9g=;
 b=r8Tl2Xr9YELbpFcA6fCKKZQzbDwA6NAThE/yqJ7HVsERf8swaDPtXtWhu6w9gO0qjD
 SRrO1DCNI9XRS5qzZi1fS/L5wbjqKZhAyXgUMawY3rbhQCRnEZIaz8KHwK4QmUf7/AqC
 BuYLiuaA6fHgbXDERRg1daKEOugBEERn+owVxxbL09VOfdE2XVpo0fOa2Y15Citrl7yZ
 EVWmY2z46sKktdHuv7iy8bZESN03SDjflLXfAJDE8rEdqe4FeU3VrqVGGYi2yek1dcgp
 w5m4SKUDxbwDadgvZAQkzouZc8c3OuYg9HHFZuToIv/6+QI5YR5utXiFdUhSAtpyYhwD
 HQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680171107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G9GbMYvAaWW0oOBX4NN/Uf9OJgdDvvjHPBRD08CBk9g=;
 b=OAl4V6YjjhVSeBvNy2luzSdQmVVLTRdskdGR4ZLOrUDmGhYrGzLT4OL+OqQz2+J+vd
 s9UUPnKyUavKBRyQhfAjoPmQ+ocwY1rAZbUQs5O1vowl5+5wqsPge3UdUoK9zMLN+hE7
 WNjwBgcCLNfMcohY6fxzVNYaKznUB7FwLYcAaPj7qkLHG/+LU+kFgADrYKDqWM8LpmXa
 XESp7VfZMp8Inj+3XmY5FHyZfPmwddaa6H7npiHdWIutgPuWMiJ5UtMrkJLGUg/Sbtz9
 Z8OGzvGYwmVBhA/haTjsHM3jTqkmUjeb/WY3Cc+uhIBOa+a1g82fyYUQouXgNVdXOWkI
 7hBg==
X-Gm-Message-State: AAQBX9e6yqGNlhA91eKWo3vURkriUVJymvs+puner9RcXQpBNfXCrHL8
 gzMoW8BNXph/Sx/YIeqwFR8IzA==
X-Google-Smtp-Source: AKy350aiHDpKu/0hJ244xZq+r7uCPSVK3KWCfXuu+rB/HgUtvSoXVIJLfHaKXhOTT91hK9Z6+vgifA==
X-Received: by 2002:a05:600c:2198:b0:3ef:61f6:d7be with SMTP id
 e24-20020a05600c219800b003ef61f6d7bemr13838630wme.35.1680171107586; 
 Thu, 30 Mar 2023 03:11:47 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 w20-20020a05600c475400b003f034c76e85sm2315703wmo.38.2023.03.30.03.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 03:11:47 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2ECA91FFC1;
 Thu, 30 Mar 2023 11:11:43 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Reinoud Zandijk <reinoud@netbsd.org>
Subject: [PATCH 11/11] tests/gitlab: use kaniko to build images
Date: Thu, 30 Mar 2023 11:11:41 +0100
Message-Id: <20230330101141.30199-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330101141.30199-1-alex.bennee@linaro.org>
References: <20230330101141.30199-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

Apparently the docker-in-docker approach has some flaws including
needing privileged mode to run and being quite slow. An alternative
approach is to use Google's kaniko tool. It also works across
different gitlab executors.

Following the gitlab example code we drop all the direct docker calls
and usage of the script and make a direct call to kaniko and hope the
images are cacheable by others.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230224180857.1050220-8-alex.bennee@linaro.org>

---
v2
  - add danpb's --cache suggestions
---
 .gitlab-ci.d/container-template.yml | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/.gitlab-ci.d/container-template.yml b/.gitlab-ci.d/container-template.yml
index 519b8a9482..cd8e0a1ff6 100644
--- a/.gitlab-ci.d/container-template.yml
+++ b/.gitlab-ci.d/container-template.yml
@@ -1,21 +1,19 @@
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
     - export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/qemu/$NAME:latest"
-    - apk add python3
-    - docker info
-    - docker login $CI_REGISTRY -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD"
   script:
     - echo "TAG:$TAG"
     - echo "COMMON_TAG:$COMMON_TAG"
-    - docker build --tag "$TAG" --cache-from "$TAG" --cache-from "$COMMON_TAG"
-      --build-arg BUILDKIT_INLINE_CACHE=1
-      -f "tests/docker/dockerfiles/$NAME.docker" "."
-    - docker push "$TAG"
-  after_script:
-    - docker logout
+    - /kaniko/executor
+          --reproducible
+          --context "${CI_PROJECT_DIR}"
+          --cache=true
+          --cache-repo "${COMMON_TAG}"
+          --dockerfile "${CI_PROJECT_DIR}/tests/docker/dockerfiles/$NAME.docker"
+          --destination "${TAG}"
-- 
2.39.2


