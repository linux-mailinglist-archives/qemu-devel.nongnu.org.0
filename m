Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E022D564E59
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 09:10:41 +0200 (CEST)
Received: from localhost ([::1]:57632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8GED-0004t3-1J
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 03:10:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8GCE-0003yO-NI
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 03:08:38 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:40860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8GCC-0000hz-LC
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 03:08:38 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-10be1122de0so5179674fac.7
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 00:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aOHKkiKEab1dH9I3a9wvMI18AZG2hLJEvFMCjuMX5Jo=;
 b=AKw8feBRlE2Z2QV7TGJQLyFosfO+PNyDVyxTd8mAelSARM6k/XWprupReZl/iJ8NCs
 v5NKHN2dK4eKcMRzobxxNm8/jB/4q7Bn9C2/J82cj3cK0MVDOL/YC0kNiS40pvrUpcT/
 sNrRlKSxAUJyKSempyuIIDyUpPQM3M8Uwr4Llm9wckU35aWVcLmSMHtHdyBKJY99Icyc
 MsfSeo8RGy43c9jqe2D/LK6uZoLDfVzg35tilEL3eBnZHCRAI3mYEOjvSIzghpelf/3P
 kkp4Pjq2GJVjwqjeAWihvSWt7pq8Wg0kTjL/4S2Ydef8d0bsH/MoHs3qm/Ii5ZIPi/qr
 qzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aOHKkiKEab1dH9I3a9wvMI18AZG2hLJEvFMCjuMX5Jo=;
 b=yGYACnwbJQw3ZyU65xR2YSGWnlydynzzs/jLsKYyRzItMJBREZ1ggw5G4Kze7cJWNe
 +fppi6OsMzicHb+TBgdqu0ptMIbzk7+TjG+NEVbMJfvoZAcSJ6XWgMkmLIdslvQBA2tg
 GRDPzYLiGMkqb6ekAr1zK2GgQvbvGY0zu3B2oaK9KqSdO5WfFnTZ8IkZcAq84XUC7XNC
 FMWSd49I0tYxLzubxfLt2GZ0cDXHhuBIkS8H8crcJLzQKNYQNK5jS8i2JOpMl8lYcgFQ
 mfhC0ulcFVsSTF3n90YQPU14ZeLtbnJwcpNvii2JzVEqJ+RX2rWAn/PTlDRMjQc+z88B
 5Bww==
X-Gm-Message-State: AJIora/FPi2nak2C9h40H+tdbWeGH202UD0+a8SLXNALm0GaibvObOrf
 YExTa7JdJRS/OzsVLMAfhiuuXCajdLgLbz5Y
X-Google-Smtp-Source: AGRyM1uL9OQ1R5hVaht+X/2kucMuhXdvYt2fTKyVxEHJIFfiPurFzvkMEW8pfS5JMmeTy9RjILusog==
X-Received: by 2002:a05:6870:961f:b0:10b:ad08:8909 with SMTP id
 d31-20020a056870961f00b0010bad088909mr11058833oaq.269.1656918515181; 
 Mon, 04 Jul 2022 00:08:35 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80e8:1685:ca62:b964:afb8:ef2a])
 by smtp.gmail.com with ESMTPSA id
 z26-20020a9d71da000000b00616c94aebe3sm12177361otj.42.2022.07.04.00.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 00:08:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH] tests/docker/dockerfiles: Add debian-loongarch-cross.docker
Date: Mon,  4 Jul 2022 12:38:24 +0530
Message-Id: <20220704070824.965429-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2c.google.com
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

Use the pre-packaged toolchain provided by Loongson via github.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configure                                     |  5 ++++
 tests/docker/Makefile.include                 |  2 ++
 .../dockerfiles/debian-loongarch-cross.docker | 25 +++++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 tests/docker/dockerfiles/debian-loongarch-cross.docker

diff --git a/configure b/configure
index 76728b31f7..fec068468a 100755
--- a/configure
+++ b/configure
@@ -1904,6 +1904,7 @@ probe_target_compiler() {
     hexagon) container_hosts=x86_64 ;;
     hppa) container_hosts=x86_64 ;;
     i386) container_hosts=x86_64 ;;
+    loongarch64) container_hosts=x86_64 ;;
     m68k) container_hosts=x86_64 ;;
     microblaze) container_hosts=x86_64 ;;
     mips64el) container_hosts=x86_64 ;;
@@ -1958,6 +1959,10 @@ probe_target_compiler() {
         container_image=fedora-i386-cross
         container_cross_prefix=
         ;;
+      loongarch64)
+        container_image=debian-loongarch-cross
+        container_cross_prefix=loongarch64-unknown-linux-gnu-
+        ;;
       m68k)
         container_image=debian-m68k-cross
         container_cross_prefix=m68k-linux-gnu-
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index ef4518d9eb..9a45e8890b 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -140,6 +140,7 @@ docker-image-debian-nios2-cross: $(DOCKER_FILES_DIR)/debian-toolchain.docker \
 # Specialist build images, sometimes very limited tools
 docker-image-debian-tricore-cross: docker-image-debian10
 docker-image-debian-all-test-cross: docker-image-debian10
+docker-image-debian-loongarch-cross: docker-image-debian11
 docker-image-debian-microblaze-cross: docker-image-debian10
 docker-image-debian-nios2-cross: docker-image-debian10
 docker-image-debian-powerpc-test-cross: docker-image-debian11
@@ -149,6 +150,7 @@ docker-image-debian-riscv64-test-cross: docker-image-debian11
 DOCKER_PARTIAL_IMAGES += debian-alpha-cross
 DOCKER_PARTIAL_IMAGES += debian-powerpc-test-cross
 DOCKER_PARTIAL_IMAGES += debian-hppa-cross
+DOCKER_PARTIAL_IMAGES += debian-loongarch-cross
 DOCKER_PARTIAL_IMAGES += debian-m68k-cross debian-mips64-cross
 DOCKER_PARTIAL_IMAGES += debian-microblaze-cross
 DOCKER_PARTIAL_IMAGES += debian-nios2-cross
diff --git a/tests/docker/dockerfiles/debian-loongarch-cross.docker b/tests/docker/dockerfiles/debian-loongarch-cross.docker
new file mode 100644
index 0000000000..8ebc112d59
--- /dev/null
+++ b/tests/docker/dockerfiles/debian-loongarch-cross.docker
@@ -0,0 +1,25 @@
+#
+# Docker cross-compiler target
+#
+# This docker target builds on the debian11 base image,
+# using a prebuilt toolchains for LoongArch64 from:
+# https://github.com/loongson/build-tools/releases
+#
+FROM qemu/debian11
+
+RUN apt-get update && \
+    DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
+    DEBIAN_FRONTEND=noninteractive eatmydata \
+    apt-get install -y --no-install-recommends \
+        build-essential \
+        ca-certificates \
+        curl \
+        gettext \
+        git \
+        python3-minimal
+
+RUN curl -#SL https://github.com/loongson/build-tools/releases/download/2022.05.29/loongarch64-clfs-5.0-cross-tools-gcc-full.tar.xz \
+    | tar -xJC /opt
+
+ENV PATH $PATH:/opt/cross-tools/bin
+ENV LD_LIBRARY_PATH /opt/cross-tools/lib:/opt/cross-tools/loongarch64-unknown-linux-gnu/lib:$LD_LIBRARY_PATH
-- 
2.34.1


