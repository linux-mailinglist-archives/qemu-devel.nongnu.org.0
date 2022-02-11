Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D281C4B29F4
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 17:16:38 +0100 (CET)
Received: from localhost ([::1]:40076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIYb7-0007Pc-TW
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 11:16:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nIYOf-0007U4-UU
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:03:45 -0500
Received: from [2a00:1450:4864:20::62f] (port=41593
 helo=mail-ej1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nIYOb-0005BV-Pl
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:03:45 -0500
Received: by mail-ej1-x62f.google.com with SMTP id a8so23890034ejc.8
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 08:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UTRCyQOf19YxllG63yzv6vaS7/CLeP7yg7egCWkgLEI=;
 b=aQt3qGt2wZzIWDspxAVAE/LXEPi+mUPus0lWHPyix3z1EzgvZNOXpjgbDKSs1G/M3d
 rNKVqu7Rsd0bWuLZDfzx1o1EbGcN3hUT5mUhPmm7bB61HNy4mXTXDtyh8FJOC/9lWI3W
 rncq+Z3nqwyb8rAbUFJnxETxJRHXGY9Q0zgOlvbvsJjjXP+7gPfbJo8Wr0ov/lirK/9o
 SqYX2pFNcELRQqYG7v7NnEAjFyCmJvSglixR1Q/OHabuCyMl08BWtvZic4NNewQb3kf3
 Kk0E6p9nxpubI4mVI+ycLnCuuaCA9wWffKvVBBh1VT+YWFj8rryVnNHq/NofkavhL2VS
 mG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UTRCyQOf19YxllG63yzv6vaS7/CLeP7yg7egCWkgLEI=;
 b=CUfiQqvUm+tcIPxGvTeQOQOuW/q2yUhPxJr+Xam30tStxaRqwGk2jz0Z/utYAXfGLI
 swt+DO8+XXrDZaceKk4Unz/WXcAuU6Fydjiuo+u59PboMZcfr8EUZpVHc64ndLqu0/un
 XLYvRMCkjO1GKjdqevVn7ng8qpK/UUiYfWkV1A57kh5riHwYKg7XEF2uhkyeKcZUxLbs
 Z8LbRJJlUVkY3v10U/YxbLZ/0TbGEg8y+fSm/402oPlmCwQDCbOhuwgxBmgnWR5/IOm3
 4pg7FPX1ZYj18uQ4wgkDk0hTpTWlOxFRKRkZnM3XsjMGqTE2jKlgqqpgwezHUaa+XvNS
 WIeA==
X-Gm-Message-State: AOAM531RoR8zpvB70EAbbiEHT5giUu5yvyUJrbOg+QkF4NZ3SoYW2SZi
 sczT/kxf+bl0Rx8cYnpLPGOp1A==
X-Google-Smtp-Source: ABdhPJxfPXkle0CqgPWW0fMRP+b56fyOItxRfvOTO1sMlLjicZPfisVdEJYQGgvEoxDqZ6tJ4JCBuA==
X-Received: by 2002:a17:906:29cb:: with SMTP id
 y11mr2053904eje.49.1644595399078; 
 Fri, 11 Feb 2022 08:03:19 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c1sm8209726ejn.203.2022.02.11.08.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 08:03:14 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 343671FFBD;
 Fri, 11 Feb 2022 16:03:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 05/11] tests/docker: introduce debian-riscv64-test-cross
Date: Fri, 11 Feb 2022 16:03:03 +0000
Message-Id: <20220211160309.335014-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220211160309.335014-1-alex.bennee@linaro.org>
References: <20220211160309.335014-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
 Beraldo Leal <bleal@redhat.com>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cross building QEMU for riscv64 still involves messing about with sid
and ports. However for building tests we can have a slimmer compiler
only container which should be more stable.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/container-cross.yml                     |  7 +++++++
 tests/docker/Makefile.include                        |  2 ++
 .../dockerfiles/debian-riscv64-test-cross.docker     | 12 ++++++++++++
 tests/tcg/configure.sh                               |  2 +-
 4 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 tests/docker/dockerfiles/debian-riscv64-test-cross.docker

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index ed620620f8..65fc689a6b 100644
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
   stage: containers-layer2
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index eeee1e6bdf..2ac2ea95f9 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -215,6 +215,7 @@ docker-image-debian-all-test-cross: docker-image-debian10
 docker-image-debian-microblaze-cross: docker-image-debian10
 docker-image-debian-nios2-cross: docker-image-debian10
 docker-image-debian-powerpc-test-cross: docker-image-debian11
+docker-image-debian-riscv64-test-cross: docker-image-debian11
 
 # These images may be good enough for building tests but not for test builds
 DOCKER_PARTIAL_IMAGES += debian-alpha-cross
@@ -223,6 +224,7 @@ DOCKER_PARTIAL_IMAGES += debian-hppa-cross
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


