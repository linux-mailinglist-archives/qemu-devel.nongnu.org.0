Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B27775B8D9A
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 18:55:08 +0200 (CEST)
Received: from localhost ([::1]:37258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYVfH-0000vs-JF
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 12:55:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUu5-0001Yr-Vr
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:06:27 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:37866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUu3-0003s6-Qa
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:06:21 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 c2-20020a1c3502000000b003b2973dafb7so15830781wma.2
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 09:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=DWTMcgN+s3+EuJqXGUpffad3Z1M+TpIkfsiXcXLeD1g=;
 b=Ph1JPh1dMEE5eQobms/jLe2+fk6fWBg0CszT4HZllGmwdfmOYDeo3kphug3O7IyBjU
 fOYgivkV8Fgfsiuji7ZYijyAqZSatxHoqm6e+jwHJVuR77dFZQjP0zFJ2xe7YcumSx8d
 erAp0L12FTd0PIFdUP3B/7lmeAgzA3XEP8dHTZQE4N7csgCMI1pZfQgXLhag2Kv/Ome4
 gwgI3bwotPWcm+ItZn82mdfbShZ3vg6ooa3w+2dr0mtjxxfZQjY62SWZu+IqApALujoT
 oj2R1x+nG7JDSXwSNL0QA3Va3wPH/eMvjmeNFVYaalIom8G6lXHNbP04rhd/5hQG4Xpl
 542w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=DWTMcgN+s3+EuJqXGUpffad3Z1M+TpIkfsiXcXLeD1g=;
 b=MtTsvp8V3bVIQmq+ARKhmcV7aE5qPL1k13y5W13J0uiebUi9jWSEPKxHhir5DXC/iC
 nWdHwuNGZeEndafi0Et4O/x5oFyzGs7qLXaKHjwYkbY29AOyP6Bdp5sCjzmI6cGF2bmB
 Y1ymRWngCXQ8OJZPJjAZ1Nobkgjf0QRm3DaEnOvhCvOsFNjnWHBhLvicM4FyJ0pRoaKa
 9PoAFDXOJpJ5/OpdsdMmbrq7LN6IqiHr7yYudTtCONl5+KlUAEp9XrxRJC1ALJRbgGFQ
 Is2RAQn6JnuVxaFW1IlJASRBtEHFKnlHK4eQJ7cKXtJ2FuvGihevkpx0ZCp0m9YrGG2h
 nicw==
X-Gm-Message-State: ACgBeo0w8Wb7bW/gl9jjvTY4fJGKGIrH/GggFu/BQUOpLxYzvXkgPqi8
 Lann6ZAu9rbgeYzU2LXC+RJDbg==
X-Google-Smtp-Source: AA6agR5WEF5pjZQ0lK3aS1TrfOkBIG/33rIS0/yss/IxGc+0YWnlHXIxx08tUlBf7CIFndfjqzI5hw==
X-Received: by 2002:a05:600c:255:b0:3aa:2150:b184 with SMTP id
 21-20020a05600c025500b003aa2150b184mr3782578wmj.138.1663171577374; 
 Wed, 14 Sep 2022 09:06:17 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 az8-20020a05600c600800b003b27f644488sm17873716wmb.29.2022.09.14.09.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 09:06:13 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 205261FFD4;
 Wed, 14 Sep 2022 16:59:53 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v2 30/30] tests/docker: remove the Debian base images
Date: Wed, 14 Sep 2022 16:59:50 +0100
Message-Id: <20220914155950.804707-31-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914155950.804707-1-alex.bennee@linaro.org>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
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

We no longer use these in any of our images. Clean-up the remaining
comments and documentation that reference them and remove from the
build.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220826172128.353798-25-alex.bennee@linaro.org>
---
 docs/devel/testing.rst                   |  2 +-
 .gitlab-ci.d/container-core.yml          |  5 ----
 .gitlab-ci.d/containers.yml              |  5 ----
 tests/docker/Makefile.include            |  8 +----
 tests/docker/dockerfiles/debian10.docker | 38 ------------------------
 tests/docker/dockerfiles/debian11.docker | 18 -----------
 6 files changed, 2 insertions(+), 74 deletions(-)
 delete mode 100644 tests/docker/dockerfiles/debian10.docker
 delete mode 100644 tests/docker/dockerfiles/debian11.docker

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index f35f117d95..aea5b42356 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -375,7 +375,7 @@ locally by using the ``NOCACHE`` build option:
 
 .. code::
 
-   make docker-image-debian10 NOCACHE=1
+   make docker-image-debian-arm64-cross NOCACHE=1
 
 Images
 ~~~~~~
diff --git a/.gitlab-ci.d/container-core.yml b/.gitlab-ci.d/container-core.yml
index e8dd1f476a..08f8450fa1 100644
--- a/.gitlab-ci.d/container-core.yml
+++ b/.gitlab-ci.d/container-core.yml
@@ -10,8 +10,3 @@ amd64-fedora-container:
   extends: .container_job_template
   variables:
     NAME: fedora
-
-amd64-debian10-container:
-  extends: .container_job_template
-  variables:
-    NAME: debian10
diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index be34cbc7ba..96d2a3b58b 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -7,11 +7,6 @@ amd64-alpine-container:
   variables:
     NAME: alpine
 
-amd64-debian11-container:
-  extends: .container_job_template
-  variables:
-    NAME: debian11
-
 amd64-debian-container:
   extends: .container_job_template
   stage: containers
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index a3174346da..270e99786e 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -69,9 +69,7 @@ docker-binfmt-image-debian-%: $(DOCKER_FILES_DIR)/debian-bootstrap.docker
 			{ echo "You will need to build $(EXECUTABLE)"; exit 1;},\
 			"CHECK", "debian-$* exists"))
 
-# Enforce dependencies for composite images
-# we don't run tests on intermediate images (used as base by another image)
-DOCKER_PARTIAL_IMAGES := debian10 debian11
+# Special case cross-compiling x86_64 on non-x86_64 systems.
 ifeq ($(HOST_ARCH),x86_64)
 DOCKER_PARTIAL_IMAGES += debian-amd64-cross
 else
@@ -89,10 +87,6 @@ endif
 # The native build should never use the registry
 docker-image-debian-native: DOCKER_REGISTRY=
 
-# base images should not add a local user
-docker-image-debian10: NOUSER=1
-docker-image-debian11: NOUSER=1
-
 # alpine has no adduser
 docker-image-alpine: NOUSER=1
 
diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dockerfiles/debian10.docker
deleted file mode 100644
index 03be923066..0000000000
--- a/tests/docker/dockerfiles/debian10.docker
+++ /dev/null
@@ -1,38 +0,0 @@
-#
-# Docker multiarch cross-compiler target
-#
-# This docker target is builds on Debian cross compiler targets to build distro
-# with a selection of cross compilers for building test binaries.
-#
-# On its own you can't build much but the docker-foo-cross targets
-# build on top of the base debian image.
-#
-FROM docker.io/library/debian:buster-slim
-
-# Duplicate deb line as deb-src
-RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.list
-
-# Install common build utilities
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt install -y --no-install-recommends \
-        bc \
-        build-essential \
-        ca-certificates \
-        ccache \
-        clang \
-        dbus \
-        gdb-multiarch \
-        gettext \
-        git \
-        libffi-dev \
-        libncurses5-dev \
-        ninja-build \
-        pkg-config \
-        psmisc \
-        python3 \
-        python3-sphinx \
-        python3-sphinx-rtd-theme \
-        python3-venv \
-        $(apt-get -s build-dep --arch-only qemu | egrep ^Inst | fgrep '[all]' | cut -d\  -f2)
diff --git a/tests/docker/dockerfiles/debian11.docker b/tests/docker/dockerfiles/debian11.docker
deleted file mode 100644
index febf884f8f..0000000000
--- a/tests/docker/dockerfiles/debian11.docker
+++ /dev/null
@@ -1,18 +0,0 @@
-#
-# Docker multiarch cross-compiler target
-#
-# This docker target uses the current development version of Debian as
-# a base for cross compilers for building test binaries. We won't
-# attempt to build QEMU on it yet given it is still in development.
-#
-# On its own you can't build much but the docker-foo-cross targets
-# build on top of the base debian image.
-#
-FROM docker.io/library/debian:bullseye-slim
-
-# Duplicate deb line as deb-src
-RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.list
-
-# Install common build utilities
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata
-- 
2.34.1


