Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B074C890A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 11:12:10 +0100 (CET)
Received: from localhost ([::1]:34262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOzUI-0001Mc-29
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 05:12:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOz6S-0003NM-FA
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:47:32 -0500
Received: from [2a00:1450:4864:20::42c] (port=39467
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOz6Q-00078l-SW
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:47:32 -0500
Received: by mail-wr1-x42c.google.com with SMTP id ay10so1678995wrb.6
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 01:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+drNVTTsqEuR91JHF5TFvYIDh5n/3YjIQhqyL2kK10o=;
 b=E2YdKNcIqURI3J0LETv88W8IePYyTTOQbek7itkMhc1S185i4OOe1VzLFkCoTtxzG0
 y+Fs9FMRO8X1apRwTeFcHrR8WkWCCgpOjJ+COv3J+Fwd6AR4BYHmFF97bgG+RvpuRUgu
 VAni9HzcITVMgzV7Rk9Ng+OrK7RlbHKuh6y+ROxIH4DEu8zLipFlvCWomr0RhLyIAhJl
 YkP3r30/ZOI/T+EPHxWXI39h3OFjbWHtQ4IIUlAfEm7ovard2VD/F3mCpHQ6JbZ0SlAh
 wQ8/QrzqEuPItAvWoatwbEo+7XXDZSTVJioWom/uj1qX9UAJpgr8b5x1M41G8WEMSyaU
 vBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+drNVTTsqEuR91JHF5TFvYIDh5n/3YjIQhqyL2kK10o=;
 b=obGzHz2ewVjkXvEdI+0S/oyM7Z42pzv9mhFw/rUTMbhj/N4sSWVqNjnzUPNSASNz3u
 64Y4WSM8rvtXjk3/rvPbhM8J42LtdUjqAXa+S/0d3yHYnSaAtsy5FaBQiGzcp7HzvhPR
 ZGZdsb0LmkwzKObV9pHsN83+wh/pXkJUTdvidoE/3RaHECJMA+z+PO4OCiu64Dtm/e7L
 aGlXnqk2joOeCFt6jGiGvNHrS/LjYmxcGeQENpMtjZQYYVpb4PhZhbCJ+rns10WAs5zu
 M/QCVQXAryXP9M1KFtRUobw7+chbkvk8EUGzu1Fn+hahTzC0+i2eirbfuwTNDT17irQs
 Hd+A==
X-Gm-Message-State: AOAM530AUQjbZuSKZgegiN7ZExgWqxXXoU7/g//IyaNvRNahj8jlgL6K
 twkhIUO9F1e2eQW9v4r4WksC0g==
X-Google-Smtp-Source: ABdhPJxHX7tnLsQse5m19pC2d4NXlm0uCQkYuj7rgGqvB/Lc68UeyKq1ulye93jb8tV/hX57JyuaKw==
X-Received: by 2002:adf:816c:0:b0:1e6:88a9:eb6c with SMTP id
 99-20020adf816c000000b001e688a9eb6cmr18504006wrm.645.1646128049611; 
 Tue, 01 Mar 2022 01:47:29 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a5d6908000000b001e3169cc6afsm13284863wru.94.2022.03.01.01.47.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 01:47:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EB56A1FFBE;
 Tue,  1 Mar 2022 09:47:15 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 06/18] tests/docker: introduce debian-riscv64-test-cross
Date: Tue,  1 Mar 2022 09:47:03 +0000
Message-Id: <20220301094715.550871-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301094715.550871-1-alex.bennee@linaro.org>
References: <20220301094715.550871-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cross building QEMU for riscv64 still involves messing about with sid
and ports. However for building tests we can have a slimmer compiler
only container which should be more stable.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220225172021.3493923-7-alex.bennee@linaro.org>

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


