Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F0640B769
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 21:01:46 +0200 (CEST)
Received: from localhost ([::1]:55892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQDgf-0002GX-AK
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 15:01:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQDdc-0000UX-1n
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 14:58:36 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:40686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQDda-0003t4-54
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 14:58:35 -0400
Received: by mail-pg1-x52f.google.com with SMTP id h3so98581pgb.7
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 11:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=24oT+aOoPiknzfcDaOiPN4P8Jm/+4h1y9+gf/YXbwBU=;
 b=gI/wXpiSeUWrbyB1G8zqiQu5gRlWtLe9uTj6ZeYr6H5pfZZVSqnSsV6CgDPzon/YlU
 SKG1+NHD/Qhgky6ObDJcX0Qq7V6HQ89ts9v31JFcZAYLz3fy5t1yUvcOsfsWriosJrKS
 hTJzDgDwZP9BSbaRgQer+E+du4vnLyA7yY7L4+23GKrKlNpSaPYGJMJBUlzw/l7V65o2
 WGwUxW19m8Xkjk3KCfhzL5120brxohiqZYQ3iqRNgHKTWbO9uoV0le7xfRtNWaOtdM8e
 zL/L6ESDFU8e6rLdYaGS1AM0BSxzY6LEUiP0nXxbtcY1qBWLdGg3KKoLxGnzt6GgFFkA
 kLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=24oT+aOoPiknzfcDaOiPN4P8Jm/+4h1y9+gf/YXbwBU=;
 b=wTA1cbB4qASAC5jeHgKb9zjQBMKmR9ESkjiDR9sLDGpc4wZS7ZPjyzQ3IKOTtzM8ON
 ViOb8iZln9Ohowp4YjVlWEUIAAGIRyxeSNHZR+Ch3L53nTmMqQFe1PE2xA6fm/GHoyXE
 yrtEtZ31YMn2rb/DDRjM7PosoHY3ZapuN72WgJRGWzTgdLK4O1QbZg0EIulSFtLtoWVS
 g5I/HZJDnQpjpQPon5BMgj+4OiRg/pS3VD3V89Hm6Rv5Erw4KjwWexNakQw32x0lFIdJ
 x9HAg3qB1AXlNO1N15qwDnpzcB1UVwKsfYuKGn2ymIa4ZzXpWcA2VB3l5thTvuaXVeQz
 WDoQ==
X-Gm-Message-State: AOAM5323mtnFWdpkbxltMpyWVTgZhEdNsdjWFa0/UMSkc4X/0ZbASioZ
 z0zfkRgLBUHLsC48oDLn//lpwMd1lykPsw==
X-Google-Smtp-Source: ABdhPJxg8rMDbnCGcKYIWH0hGNe6PiGFcdL8f11UXuurL6pc3JEW+2A/sg8ZiwDJzdiyCQHIPQMGng==
X-Received: by 2002:a62:b515:0:b0:438:42ab:2742 with SMTP id
 y21-20020a62b515000000b0043842ab2742mr6259376pfe.77.1631645912563; 
 Tue, 14 Sep 2021 11:58:32 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id hi12sm2151229pjb.48.2021.09.14.11.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 11:58:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] tests/docker: promote debian-riscv64-cross to a full image
Date: Tue, 14 Sep 2021 11:58:29 -0700
Message-Id: <20210914185830.1378771-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914185830.1378771-1-richard.henderson@linaro.org>
References: <20210914185830.1378771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Cc: willianr@redhat.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 thuth@redhat.com, alex.bennee@linaro.org, wainersm@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

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
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 .gitlab-ci.d/container-cross.yml              |  1 -
 tests/docker/Makefile.include                 |  2 -
 .../dockerfiles/debian-riscv64-cross.docker   | 46 +++++++++++++++++--
 3 files changed, 41 insertions(+), 8 deletions(-)

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index 0fcebe363a..05996200e1 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -134,7 +134,6 @@ ppc64el-debian-cross-container:
 riscv64-debian-cross-container:
   extends: .container_job_template
   stage: containers-layer2
-  needs: ['amd64-debian10-container']
   variables:
     NAME: debian-riscv64-cross
 
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index ff5d732889..3b03763186 100644
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
2.25.1


