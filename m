Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8DA554A10
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 14:35:16 +0200 (CEST)
Received: from localhost ([::1]:60566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3zZj-0006xF-H3
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 08:35:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o3zY0-0006BF-1A
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 08:33:28 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:39723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o3zXv-0001aV-Bs
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 08:33:24 -0400
Received: by mail-ej1-x634.google.com with SMTP id ay16so14542651ejb.6
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 05:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=To38TAhFPTyVe2LNjyAgXAUuxpNNahrHHcAaKJFoisQ=;
 b=ieu1NnxwxW7YEfutjkUvpqUR8NDRtLqZfGKU6dbjofRhRdamde4zQ47naygdSUJIO6
 8AMnNHzRVBYPNgjmmki/lB0t64o+LtscxKy7tGOUJk5cYS+o9tfM0GJDVD/mB8l/fIeK
 h9pMoiCgKkfAn/rV2SG2JyqQVsO0PW6GwFyM1dS5CKaJ6MylpDVyb6WbqiB81O0Yg2z+
 QDnTYCFPrEDIhJ2P+kbBRNVtbrU9Y0fcpi5RuKKqlEbOiPXWiJ5v11RKhzIxh8dUOjdC
 5LIRfoAsG+zOyMBIPb5vB5sA6wdw4em6EMuvPA5Tug3Vj2xY6Ci7WpwHGEY+fUvRXHdh
 hnvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=To38TAhFPTyVe2LNjyAgXAUuxpNNahrHHcAaKJFoisQ=;
 b=ZgIX9eTaRLJRQVBrYrNzK80o+WLf9Bm/uy+V9DnGqoba/vXB1EHOoVVij9f4cDYHan
 IE4aKm7jaCcWXBm4JZ1g65glV3Oaywaa8NPg1i0JJj7wr1K2FkDwkjyXsyI+mdDl6kfG
 JwnOJpvg66P6m1FJSgxJ4Ct5QwfD9wSPU9BXrUz7iNFDai1XJZg4loXZJUVcZeW2VPnK
 OHzVBX2Wl886VcEmL4pSvBVWM7IkbmrNYutk6076PjeUFebPX+VXDO8tWn8UPLMDqlTZ
 cF/xap3tBIXcqHhetFMjtRvrDe1MDuLERJMn7VG/OUNC4dJLln1xWLcnCkbcIENKD7vp
 MCwQ==
X-Gm-Message-State: AJIora+hbYLYUbCJmzTdof8DcT0av8eIqZpjB39oofN9ku9d6frGsRkq
 pcUFGy9a0RCwrhkAzPu0N7Fx0A==
X-Google-Smtp-Source: AGRyM1tWs4i/YDf3xWqEmvaZiNzHA0ZPb+0/vw/hj/uuAXpOvwhr87v+WNrpwsMbrFsV8V9M/T2rMA==
X-Received: by 2002:a17:906:b150:b0:711:c6a5:c5c1 with SMTP id
 bt16-20020a170906b15000b00711c6a5c5c1mr2977923ejb.177.1655901201689; 
 Wed, 22 Jun 2022 05:33:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 me26-20020a170906aeda00b00722e5b234basm2427756ejb.179.2022.06.22.05.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 05:33:20 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1FF021FFB7;
 Wed, 22 Jun 2022 13:33:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anders Roxell <anders.roxell@linaro.org>,
 Remi Duraffort <remi.duraffort@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [RFC PATCH] gitlab: add a binary build to project registry
Date: Wed, 22 Jun 2022 13:33:05 +0100
Message-Id: <20220622123305.3971169-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x634.google.com
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

There have been requests from other projects such LKFT to have
"official" docker images with pre-built QEMU binaries. These could
then be consumed by downstream CI systems by pulling directly from the
qemu-project container registry. The final image could then be run by
doing:

  docker run --rm -it \
    registry.gitlab.com/qemu-project/qemu/qemu/debian-amd64-binaries \
    /opt/bin/qemu-system-aarch64 $ARGS

To keep the build time down we skip user-mode, documents, plugins and
a selection of the more esoteric hardware emulations. Even so it still
takes over an hour to build and install everything.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Anders Roxell <anders.roxell@linaro.org>
Cc: Remi Duraffort <remi.duraffort@linaro.org>

---

This is very much an RFC for now as we have traditionally not provided
binaries for our users except for the slightly special case of
Windows. As currently structured this will rebuild the binaries on
every merge but we could change the generation rules to only trigger
for tagged or stable branch pushes. We also wouldn't be testing these
binaries so we are basically assuming they are OK by the nature of
being built from master which in theory never breaks.

The container layout is not ideal either as the QEMU dockerfiles are
all based on needing to build things so by their nature include all
the devel pacakges. We could get lcitool to spit out a non-dev version
with only binary dependencies but that would increase the number of
dockerfiles to manage. For now we just re-use the build images for the
final installed product.
---
 .gitlab-ci.d/binary-builds.yml                | 19 +++++++++++
 .../debian-amd64-binaries.docker              | 18 ++++++++++
 .gitlab-ci.d/container-template.yml           | 33 +++++++++++++++++++
 .gitlab-ci.d/qemu-project.yml                 |  1 +
 4 files changed, 71 insertions(+)
 create mode 100644 .gitlab-ci.d/binary-builds.yml
 create mode 100644 .gitlab-ci.d/binary-builds/debian-amd64-binaries.docker

diff --git a/.gitlab-ci.d/binary-builds.yml b/.gitlab-ci.d/binary-builds.yml
new file mode 100644
index 0000000000..bcb9d57f80
--- /dev/null
+++ b/.gitlab-ci.d/binary-builds.yml
@@ -0,0 +1,19 @@
+#
+# Binary Builds
+#
+# These are docker images with built QEMU binaries which could form
+# the basis of inputs for other projects that want recent QEMU builds
+# for their own CI.
+#
+
+include:
+  - local: '/.gitlab-ci.d/container-template.yml'
+
+build-binary-debian11:
+  extends: .container_native_template
+  needs:
+    - job: amd64-debian11-container
+      artifacts: true
+  timeout: 90m
+  variables:
+    NAME: debian-amd64-binaries
diff --git a/.gitlab-ci.d/binary-builds/debian-amd64-binaries.docker b/.gitlab-ci.d/binary-builds/debian-amd64-binaries.docker
new file mode 100644
index 0000000000..ea0c8fdf5b
--- /dev/null
+++ b/.gitlab-ci.d/binary-builds/debian-amd64-binaries.docker
@@ -0,0 +1,18 @@
+#
+# QEMU Binary Builds, in docker form
+#
+#
+
+# Build stage, assumes workdir
+FROM registry.gitlab.com/qemu-project/qemu/qemu/debian-amd64
+ADD . /src
+RUN mkdir -p /src/build
+WORKDIR /src/build
+RUN ../configure --disable-user --disable-plugins --disable-docs \
+  --target-list-exclude=avr-softmmu,cris-softmmu,microblaze-softmmu,microblazeel-softmmu,or1k-softmmu,rx-softmmu,sh4-softmmu,sh4eb-softmmu,tricore-softmmu \
+  --prefix=/opt/qemu
+RUN ninja
+RUN make install
+
+FROM registry.gitlab.com/qemu-project/qemu/qemu/debian11
+COPY --from=0 /opt/qemu /opt/qemu
diff --git a/.gitlab-ci.d/container-template.yml b/.gitlab-ci.d/container-template.yml
index c434b9c8f3..be974d74ed 100644
--- a/.gitlab-ci.d/container-template.yml
+++ b/.gitlab-ci.d/container-template.yml
@@ -1,3 +1,8 @@
+#
+# This container job uses QEMU's wrapper scripts to build a container
+# which we can use for the basis of other tests. Generally these
+# containers setup build environments for building QEMU or its tests.
+#
 .container_job_template:
   extends: .base_job_template
   image: docker:stable
@@ -20,3 +25,31 @@
     - docker push "$TAG"
   after_script:
     - docker logout
+
+#
+# This container job uses the native docker tools to build and run and
+# container. Here the container may include the build itself which is
+# used for things like preparing binary images.
+#
+.container_native_template:
+  extends: .base_job_template
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
+    - DOCKER_BUILDKIT=1 docker build
+          -t "qemu/$NAME" -f ".gitlab-ci.d/binary-builds/$NAME.docker" .
+    - docker tag "qemu/$NAME" "$TAG"
+    - docker push "$TAG"
+  after_script:
+    - docker logout
+    
diff --git a/.gitlab-ci.d/qemu-project.yml b/.gitlab-ci.d/qemu-project.yml
index 691d9bf5dc..ed713f517a 100644
--- a/.gitlab-ci.d/qemu-project.yml
+++ b/.gitlab-ci.d/qemu-project.yml
@@ -13,3 +13,4 @@ include:
   - local: '/.gitlab-ci.d/custom-runners.yml'
   - local: '/.gitlab-ci.d/cirrus.yml'
   - local: '/.gitlab-ci.d/windows.yml'
+  - local: '/.gitlab-ci.d/binary-builds.yml'
-- 
2.30.2


