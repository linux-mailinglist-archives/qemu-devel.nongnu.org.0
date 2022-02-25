Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 001AB4C4CB8
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 18:41:40 +0100 (CET)
Received: from localhost ([::1]:38894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNeb6-0004h1-28
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 12:41:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nNeGz-00044D-KB
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:20:53 -0500
Received: from [2a00:1450:4864:20::62f] (port=43528
 helo=mail-ej1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nNeGk-0002Mv-OZ
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:20:52 -0500
Received: by mail-ej1-x62f.google.com with SMTP id d10so12125210eje.10
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 09:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XY4SHVBrCaEBi8boWyNn/DF5ggnVOu0+2pqg9UXcUDw=;
 b=RPeaWTNLTMA2GfRyS6OkdFctGXpMUR6y08v0mFOmA83c+AZu4LucbltqcvXGumkGFW
 hJtKWaR4Wisbi76l75F3uvU6GiDEQVjetwr14MA29RHAT+/MUobHBFUtIqL1SyTnCKuR
 X/7XwGZx7BJcazyDsR4lhNLA1ucrP7lT3OGtijtJ7LRcyq1BS4Rx/TtIwwOb2l5Uz+s2
 kdCt9afWySwEtm127133Ui6pjj7/E/zJUpvT2J78lPn5vjzPbaPnhUmU2byG4vUyy16j
 2vuQXyPdI1RqDofaA8jdlMIh0PXRJ671BjqfqZ383tVvRGSWsRBsc/H4BSCZh4ajMsxv
 fDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XY4SHVBrCaEBi8boWyNn/DF5ggnVOu0+2pqg9UXcUDw=;
 b=eRgJTSQlL5ohRrC51EXC0fQcPlN0MeDbxnRCEL/uTTlAnmMF/A5RnkW/eSViigCrVq
 1VumcxMa3eOeLTiYC8DkpILllI6ioAXktUUGgibdEikiLOD4TFgJ0ad0tMPbRjtqlXxw
 u+WaX0dgPxyXWxzRWL9xNJIaaacA1fVv2MhzOQde2QwRmr+prlqa5LfKxnhQHZxU9JxW
 3DS+h/EfbhfyThsIhdExfS7te/wDC/tLnOiYn3+8LbKn3qlsCruUmiBrMVjayT+uX9cp
 2Nh85vQgFuq4FMgY3aw2v1At68b2E6Lxb4Ypgz9ZVJrLDovz+P3EzS4tuPvDdWu00rsu
 Dzkg==
X-Gm-Message-State: AOAM531gklTGeLmvBUuXoeHqZU7unhJvT2PDkbGIfvzc26hM+gX/Rlj+
 qougDHgRmnaMn/31J0wvPklh9w==
X-Google-Smtp-Source: ABdhPJyapezqENewuMtzwO77x81R0wXhkND7+uFzGGw4uDAOfXyGG/Mo3tkuppIDNHyBFK8jCFfsHg==
X-Received: by 2002:a17:906:ae4a:b0:6d0:9eee:e951 with SMTP id
 lf10-20020a170906ae4a00b006d09eeee951mr6804443ejb.2.1645809637422; 
 Fri, 25 Feb 2022 09:20:37 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 dt24-20020a170906b79800b006d57e9289f2sm1228264ejb.49.2022.02.25.09.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 09:20:29 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9E5811FFBE;
 Fri, 25 Feb 2022 17:20:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 06/18] tests/docker: introduce debian-riscv64-test-cross
Date: Fri, 25 Feb 2022 17:20:09 +0000
Message-Id: <20220225172021.3493923-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225172021.3493923-1-alex.bennee@linaro.org>
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, sw@weilnetz.de, richard.henderson@linaro.org,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm@nongnu.org, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cross building QEMU for riscv64 still involves messing about with sid
and ports. However for building tests we can have a slimmer compiler
only container which should be more stable.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220211160309.335014-6-alex.bennee@linaro.org>
---
 .gitlab-ci.d/container-cross.yml                     |  7 +++++++
 tests/docker/Makefile.include                        |  2 ++
 .../dockerfiles/debian-riscv64-test-cross.docker     | 12 ++++++++++++
 tests/tcg/configure.sh                               |  2 +-
 4 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 tests/docker/dockerfiles/debian-riscv64-test-cross.docker

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index d38f657131..e622ac2d21 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -131,6 +131,13 @@ riscv64-debian-cross-container:
   variables:
     NAME: debian-riscv64-cross
 
+# we can however build TCG tests using a non-sid base
+riscv64-debian-test-cross-container:
+  extends: .container_job_template
+  stage: containers-layer2
+  variables:
+    NAME: debian-riscv64-test-cross
+
 s390x-debian-cross-container:
   extends: .container_job_template
   stage: containers
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index cce9faab36..e495b163a0 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -214,6 +214,7 @@ docker-image-debian-all-test-cross: docker-image-debian10
 docker-image-debian-microblaze-cross: docker-image-debian10
 docker-image-debian-nios2-cross: docker-image-debian10
 docker-image-debian-powerpc-test-cross: docker-image-debian11
+docker-image-debian-riscv64-test-cross: docker-image-debian11
 
 # These images may be good enough for building tests but not for test builds
 DOCKER_PARTIAL_IMAGES += debian-alpha-cross
@@ -222,6 +223,7 @@ DOCKER_PARTIAL_IMAGES += debian-hppa-cross
 DOCKER_PARTIAL_IMAGES += debian-m68k-cross debian-mips64-cross
 DOCKER_PARTIAL_IMAGES += debian-microblaze-cross
 DOCKER_PARTIAL_IMAGES += debian-nios2-cross
+DOCKER_PARTIAL_IMAGES += debian-riscv64-test-cross
 DOCKER_PARTIAL_IMAGES += debian-sh4-cross debian-sparc64-cross
 DOCKER_PARTIAL_IMAGES += debian-tricore-cross
 DOCKER_PARTIAL_IMAGES += debian-xtensa-cross
diff --git a/tests/docker/dockerfiles/debian-riscv64-test-cross.docker b/tests/docker/dockerfiles/debian-riscv64-test-cross.docker
new file mode 100644
index 0000000000..1d90901298
--- /dev/null
+++ b/tests/docker/dockerfiles/debian-riscv64-test-cross.docker
@@ -0,0 +1,12 @@
+#
+# Docker cross-compiler target
+#
+# This docker target builds on the Debian Bullseye base image.
+#
+FROM qemu/debian11
+
+RUN apt update && \
+    DEBIAN_FRONTEND=noninteractive eatmydata \
+    apt install -y --no-install-recommends \
+        gcc-riscv64-linux-gnu \
+        libc6-dev-riscv64-cross
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index adc95d6a44..0663bd19f4 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -180,7 +180,7 @@ for target in $target_list; do
       ;;
     riscv64-*)
       container_hosts=x86_64
-      container_image=debian-riscv64-cross
+      container_image=debian-riscv64-test-cross
       container_cross_cc=riscv64-linux-gnu-gcc
       ;;
     s390x-*)
-- 
2.30.2


