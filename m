Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3885BF03A
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:36:27 +0200 (CEST)
Received: from localhost ([::1]:39254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oalqs-00040a-HW
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:36:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagzg-00068C-5Z
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:12 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:46906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagze-00021N-Gm
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:11 -0400
Received: by mail-ed1-x52e.google.com with SMTP id z13so4812890edb.13
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=+HHAGmPTEVaK8BLouLq5FfiutB4A/NBtflNNRIi+YP0=;
 b=ZYtM23pB/RlfGGkVj8PkOULLBQpEgqmqGuP4EZwn5vnCh/Uk38KM5dS3Aj6N+974Uj
 EincOuLBxWshGjN79jRwI7GXngY+y31PTOznG7KoxwN9gy8H+XcWDRkjA4/i4IZOCmpZ
 bCSEkIdfJkpb+iggUntCiNhQyh13N1EcH5Hi0h6MmyHbTWvWcttJepe43xD+SAoBWvxW
 Yv4Z8T8qrA3+Rv6NQhYhMzsWqce82ADrOA9KFL7EtSez0GrxIxAyOgRhAGjC9xjxbwke
 A7xnCi5CGv0SRFTg4u+oDW2mO784HbgF2GMr53pKMtwkjcykPVlMQxqwX1fABJnbPAhs
 E2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+HHAGmPTEVaK8BLouLq5FfiutB4A/NBtflNNRIi+YP0=;
 b=rczN8GoYgJy7NhEg4vxyefmK7GNnDVDFTo11a7X9HqRTTb9dG84ewSjW8rwlAOf9Vb
 ItWws5hK4ptQNHuJIUqsBX3T27GrZSUerYlZtlCu/9jwn0bIJCMmTiTSZvMwQVD456tJ
 LPcXUvu6BITYbG4VnE5yB7suBFQvR3eir9S3KjMpvNBppZ2H4rb+IrVTUs+rOpY35zV9
 8sFRuVIvrU1PlcuutxKsCGI5ikVnNz6XTMIL96tIx3EShSSGJ8KNc7MYsQHeleIeSGDu
 h6DL1p+5VyGT4oZDH0qQCGGc8VYfAFngEpVYiKkjMbxmjjk9Zyy0k2F6GTJ5w+tuUtE/
 00oQ==
X-Gm-Message-State: ACrzQf10ZnbSB4wH0dHzN6tB51VQSGl5sNLbWF5UZlFXeOR/S6jMkEqP
 V6MbfSmPc2YTvSXXxJUWZl1hQw==
X-Google-Smtp-Source: AMsMyM4BgIB0U7DZmu82wSSSuFboTO8DmfarNDzIZKcdn0TVlfsKZVssA/WZKoyTUmQeaGsaT33h2Q==
X-Received: by 2002:a05:6402:11d4:b0:452:a97c:cd36 with SMTP id
 j20-20020a05640211d400b00452a97ccd36mr21459262edw.53.1663694708993; 
 Tue, 20 Sep 2022 10:25:08 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 w23-20020a170906385700b00780f6071b5dsm129581ejc.188.2022.09.20.10.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:25:04 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2B4311FFCE;
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
Subject: [PULL 23/30] tests/docker: update and flatten debian-all-test-cross
Date: Tue, 20 Sep 2022 18:15:26 +0100
Message-Id: <20220920171533.1098094-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920171533.1098094-1-alex.bennee@linaro.org>
References: <20220920171533.1098094-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52e.google.com
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

Update to the latest stable Debian. While we are at it flatten into a
single dockerfile. We also need to ensure we install clang as it is
used for those builds as well.

It would be nice to port this to lcitool but for now this will do.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220914155950.804707-24-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index 3a8bd75473..091c0d8fcb 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -14,7 +14,6 @@ amd64-debian-cross-container:
 amd64-debian-user-cross-container:
   extends: .container_job_template
   stage: containers
-  needs: ['amd64-debian10-container']
   variables:
     NAME: debian-all-test-cross
 
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 24cd44e667..ddcc502049 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -129,7 +129,6 @@ docker-image-debian-nios2-cross: $(DOCKER_FILES_DIR)/debian-toolchain.docker \
 	$(call debian-toolchain, $@)
 
 # Specialist build images, sometimes very limited tools
-docker-image-debian-all-test-cross: docker-image-debian10
 docker-image-debian-loongarch-cross: docker-image-debian11
 docker-image-debian-microblaze-cross: docker-image-debian10
 docker-image-debian-nios2-cross: docker-image-debian10
diff --git a/tests/docker/dockerfiles/debian-all-test-cross.docker b/tests/docker/dockerfiles/debian-all-test-cross.docker
index dedcea58b4..2beb077fb4 100644
--- a/tests/docker/dockerfiles/debian-all-test-cross.docker
+++ b/tests/docker/dockerfiles/debian-all-test-cross.docker
@@ -6,16 +6,24 @@
 # basic compilers for as many targets as possible. We shall use this
 # to build and run linux-user tests on GitLab
 #
-FROM qemu/debian10
+FROM docker.io/library/debian:11-slim
 
-# What we need to build QEMU itself
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
+# Duplicate deb line as deb-src
+RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.list
+
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    apt-get update && \
+    apt-get install -y eatmydata && \
+    eatmydata apt-get dist-upgrade -y && \
     apt build-dep -yy qemu
 
-# Add the foreign architecture we want and install dependencies
+# Add extra build tools and as many cross compilers as we can for testing
 RUN DEBIAN_FRONTEND=noninteractive eatmydata \
         apt install -y --no-install-recommends \
+        ccache \
+        clang  \
+        git \
+        ninja-build \
         gcc-aarch64-linux-gnu \
         libc6-dev-arm64-cross \
         gcc-alpha-linux-gnu \
-- 
2.34.1


