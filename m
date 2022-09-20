Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFE75BEF67
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 23:51:57 +0200 (CEST)
Received: from localhost ([::1]:33614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oal9o-00022W-W5
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 17:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagzd-000631-BR
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:09 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:42968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagza-0001pC-4p
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:09 -0400
Received: by mail-ej1-x630.google.com with SMTP id sb3so7822066ejb.9
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=jPKx4bLo5GwU9q6PEj03jAJlnFywQA8HkRlD35mQyEY=;
 b=r9AJjD2asohZgNfHL2ukcKfWs8j/jbo7+ws5BKCgcCi54b7Z2hfr+dtvNQZm64a6al
 aaS1aFrxove6+enppG70q3r6NsuA3c+f2dn7ONA2zJG7qWc2a5sdNJJdDIIsTG4ohEgG
 Q3InHztC362WhD+OR/I1t9E8IpKfEAsS4jyCO387t75KYAG4ogywVpYBUslL+lbUXA51
 UGClRBdl2cSOrr7kH+S4Prw7GMfwowEvRTtFuW8I8xRUM9LtodsjOmqiX35To0jGNfcC
 MwiSpadOjSgZl3FDKk3aKFcTNVa40bGUvTfQyhnDR9jRnGFwczbbQJ+mWmEHXXMd5iVA
 yw4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=jPKx4bLo5GwU9q6PEj03jAJlnFywQA8HkRlD35mQyEY=;
 b=uf85dewrq6RwSC0uC4jNfW2XzsRKkJiFowf4+48lHktR3wf/TwI3k+YTHmVdDkYMPe
 rEeNfFnxm2WnNRHFt9kXuf+Yr+EVnyg0QwRuhu+mm8qPKIWNRi8ycz8bPaGHurnOgZVi
 34BQLbGOa2D9Xl9pyTVTeuM7kKYjbX+7JVp86zpAQxPtnEIqcHko5nS02r0jv+lnWMSO
 rszoTR+t8clHaVDpCIIbZBKyXwSI5TV9gHvAhmAWx1Q7l47G9w8dKaDBLyzssKMIW3FM
 tFSR92ZbR9D7qymTD0Pfuq+6JGPdHe6/8/AqyPpPNgEObKM66rhNTGE91SsgywcDIxBp
 Uz/A==
X-Gm-Message-State: ACrzQf3QDXmrg+HiwWgDX/3OxOuK5YFMsMZefftT32rv9qkEBataBoPb
 I381k8UhKBCtYPPyNAqeliiqDQ==
X-Google-Smtp-Source: AMsMyM4i2YABXW+HrBLJMoe3vWhp2NtGrdMejfzfWzEvACDq2no0/liTRqueZ7o3d7i1yrpZsgeE+A==
X-Received: by 2002:a17:906:7944:b0:73c:838:ac3d with SMTP id
 l4-20020a170906794400b0073c0838ac3dmr17821921ejo.242.1663694705302; 
 Tue, 20 Sep 2022 10:25:05 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a50ff0a000000b00454546561cfsm152307edu.82.2022.09.20.10.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:24:59 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EF0991FFD5;
 Tue, 20 Sep 2022 18:15:36 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 30/30] tests/docker: remove the Debian base images
Date: Tue, 20 Sep 2022 18:15:33 +0100
Message-Id: <20220920171533.1098094-31-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920171533.1098094-1-alex.bennee@linaro.org>
References: <20220920171533.1098094-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We no longer use these in any of our images. Clean-up the remaining
comments and documentation that reference them and remove from the
build.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220914155950.804707-31-alex.bennee@linaro.org>

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


