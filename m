Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BBF426ADF
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 14:34:34 +0200 (CEST)
Received: from localhost ([::1]:56942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYp57-0003iX-2C
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 08:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mYoww-00030Q-Ov
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 08:26:06 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mYowu-0006ty-Te
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 08:26:06 -0400
Received: by mail-wr1-x429.google.com with SMTP id s15so29381665wrv.11
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 05:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QfgsiyjPNCvJW2ICwHEKbAih/Gq9LuRXM/hG4XuMnM0=;
 b=yWET4QsX+cqaWKXvCvQfJL2D9yBrw/QfNyvbnX2mBkwrWJpfcvGtCiYSDm3fn6lW60
 uP/tNpkTxXEZkxTWfE9iRHsWZR01cQqkGloQ3TE4Hc4kyJv8746l63r/oPlqF1gBzAou
 kKdgRBpRvwPmP6R0Ak0zXINjtvYilbqldJ0MeGrHUdsKHO1wEp3jBxG3RQMAVL1XTO5n
 +KoJ127x0dv0nsRvTzigCjWE5/xskkxg+m1pzyAt1epa79NWerWFKk3xEqGyDt6mfTrZ
 2ZB70KNVJhLolWuKTf4S8/9rdre5C6PLOTH5tkJ3QC0E8yPJBR1MuFaa2CsgBE3weSG+
 /++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QfgsiyjPNCvJW2ICwHEKbAih/Gq9LuRXM/hG4XuMnM0=;
 b=Imx1TmwYpEjZtw4lxFZs0y8+UuGCI4kcPYazKn2WonzShfWtfZIECWJxkw1xe5trxs
 OGjbnMTuENJkWYuU/yX2cuSiH6vaRnIuJ6qgPS0CJAfjxObt5jwnAGhsTO81pj7l5D0U
 ufiYrMJl5d5WNBRL/CTaF0BgZ+RaLF1wgxq9/iVeacVGEuNtMlBLfe1ia3qw0khmubMv
 WfiM14EDrXDE4PE5aGZ6hSX4mTes0sOKVzGsS7X7wgJuscmOyl2/uD6G8eLWZAsLElew
 fXTDgLOk4z2KkkeqwZe8wgIspXu/1SEYLKSHJrvGrYBzRPVv1ncaVzVDDATmwD+Q0aD8
 EHKw==
X-Gm-Message-State: AOAM5339EokbXfyYCi/mybWLUSpsWJp9oHCI64QsGvcQGtoRuN5AgFQv
 4LuSB7x/hVRnQStc99f+6qWUnw==
X-Google-Smtp-Source: ABdhPJwwkbSpVxge06mfCzaXPN/3AqQUkfsisxvWfaxz0XkfWosQRVAxJrBxWAKKqaYwwSrACZnQQA==
X-Received: by 2002:a1c:7c02:: with SMTP id x2mr2940701wmc.165.1633695963392; 
 Fri, 08 Oct 2021 05:26:03 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k6sm2469253wri.83.2021.10.08.05.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 05:26:00 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 848271FF9B;
 Fri,  8 Oct 2021 13:25:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org
Subject: [PULL 04/12] tests/docker: promote debian-riscv64-cross to a full
 image
Date: Fri,  8 Oct 2021 13:25:48 +0100
Message-Id: <20211008122556.757252-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008122556.757252-1-alex.bennee@linaro.org>
References: <20211008122556.757252-1-alex.bennee@linaro.org>
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be able to cross build QEMU itself we need to include a few more
libraries. These are only available in Debian's unstable ports repo
for now so we need to base the riscv64 image on sid with the the
minimal libs needed to build QEMU (glib/pixman).

The result works but is not as clean as using build-dep to bring in
more dependencies. However sid is by definition a shifting pile of
sand and by keeping the list of libs minimal we reduce the chance of
having an image we can't build. It's good enough for a basic cross
build testing of TCG.

Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210914185830.1378771-2-richard.henderson@linaro.org>
[AJB: tweak allow_failure]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210917162332.3511179-5-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index 0fcebe363a..a3b5b90552 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -134,7 +134,8 @@ ppc64el-debian-cross-container:
 riscv64-debian-cross-container:
   extends: .container_job_template
   stage: containers-layer2
-  needs: ['amd64-debian10-container']
+  # as we are currently based on 'sid/unstable' we may break so...
+  allow_failure: true
   variables:
     NAME: debian-riscv64-cross
 
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 0806c6f726..450c76a3ca 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -141,7 +141,6 @@ docker-image-debian-mips64-cross: docker-image-debian10
 docker-image-debian-mips64el-cross: docker-image-debian10
 docker-image-debian-mipsel-cross: docker-image-debian10
 docker-image-debian-ppc64el-cross: docker-image-debian10
-docker-image-debian-riscv64-cross: docker-image-debian10
 docker-image-debian-s390x-cross: docker-image-debian10
 docker-image-debian-sh4-cross: docker-image-debian10
 docker-image-debian-sparc64-cross: docker-image-debian10
@@ -180,7 +179,6 @@ DOCKER_PARTIAL_IMAGES += debian-arm64-test-cross
 DOCKER_PARTIAL_IMAGES += debian-powerpc-test-cross
 DOCKER_PARTIAL_IMAGES += debian-hppa-cross
 DOCKER_PARTIAL_IMAGES += debian-m68k-cross debian-mips64-cross
-DOCKER_PARTIAL_IMAGES += debian-riscv64-cross
 DOCKER_PARTIAL_IMAGES += debian-sh4-cross debian-sparc64-cross
 DOCKER_PARTIAL_IMAGES += debian-tricore-cross
 DOCKER_PARTIAL_IMAGES += debian-xtensa-cross
diff --git a/tests/docker/dockerfiles/debian-riscv64-cross.docker b/tests/docker/dockerfiles/debian-riscv64-cross.docker
index 2bbff19772..594d97982c 100644
--- a/tests/docker/dockerfiles/debian-riscv64-cross.docker
+++ b/tests/docker/dockerfiles/debian-riscv64-cross.docker
@@ -1,12 +1,48 @@
 #
-# Docker cross-compiler target
+# Docker cross-compiler target for riscv64
 #
-# This docker target builds on the debian Buster base image.
+# Currently the only distro that gets close to cross compiling riscv64
+# images is Debian Sid (with unofficial ports). As this is a moving
+# target we keep the library list minimal and are aiming to migrate
+# from this hack as soon as we are able.
 #
-FROM qemu/debian10
+FROM docker.io/library/debian:sid-slim
+
+# Add ports
+RUN apt update && \
+    DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
+    DEBIAN_FRONTEND=noninteractive eatmydata apt update -yy && \
+    DEBIAN_FRONTEND=noninteractive eatmydata apt upgrade -yy
+
+# Install common build utilities
+RUN DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy \
+    bc \
+    build-essential \
+    ca-certificates \
+    debian-ports-archive-keyring \
+    dpkg-dev \
+    gettext \
+    git \
+    ninja-build \
+    pkg-config \
+    python3
+
+# Add ports and riscv64 architecture
+RUN echo "deb http://ftp.ports.debian.org/debian-ports/ sid main" >> /etc/apt/sources.list
+RUN dpkg --add-architecture riscv64
+
+# Duplicate deb line as deb-src
+RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.list
 
 RUN apt update && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
     apt install -y --no-install-recommends \
-        gcc-riscv64-linux-gnu \
-        libc6-dev-riscv64-cross
+         gcc-riscv64-linux-gnu \
+         libc6-dev-riscv64-cross \
+         libffi-dev:riscv64 \
+         libglib2.0-dev:riscv64 \
+         libpixman-1-dev:riscv64
+
+# Specify the cross prefix for this image (see tests/docker/common.rc)
+ENV QEMU_CONFIGURE_OPTS --cross-prefix=riscv64-linux-gnu-
+ENV DEF_TARGET_LIST riscv64-softmmu,riscv64-linux-user
-- 
2.30.2


