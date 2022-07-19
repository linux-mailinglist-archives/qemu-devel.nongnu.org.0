Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE3857A603
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 20:03:43 +0200 (CEST)
Received: from localhost ([::1]:59596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDrZO-0002XW-HT
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 14:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrW5-0005iK-3h
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:00:17 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:38849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrW3-00069v-2n
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:00:16 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-10c8e8d973eso32947223fac.5
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 11:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9k1lHk5UkpDkzX36210DaCgkLVnTlKXqf0lgSSEv3hY=;
 b=h0n2/M/09VgUk8idtLcVTuOYxT91NrYQb+yUQczPeSYTG/AXly7Sv98AcQIRZEbb5c
 AY1E6TYuUicNttQiruzevWfH6gEnFCo0QOZ+HXxRM/6cxbT0CiobGbVK7/WiH/cIuqTj
 0wXAXuXnFkWSRyq4GlMdfSXccBjo3F3j/gGt6puC2fsocBQyxUAUXzi7LAAL5sOUV8La
 DgFbQp4x/qFDBxtR5BdZpMQavYgS9zJyjuBJcCpxJiJ94lVns5VBTwx2RM6RYAZGe3Rg
 VyUvGGY08nvMR+RWAjMiMcBARBPIE3QAz5QBfHIJ29yW+4o6gx4qSXhGyPdqFgZr/rfC
 M0ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9k1lHk5UkpDkzX36210DaCgkLVnTlKXqf0lgSSEv3hY=;
 b=TRYAEWFj75PESToZK7s5FSdX2GX5/smaZHrFUY7YNybXhtqCllSsBRkjVhm712Y5Oh
 GFTU692hzJb28CUMs2bz0JHKhaaeD8W5h+bCCUAcG71B+mKspsoZLdttWjF1j2DlICfF
 4c6eas/y2x4CRMmPegqoPqthmwKkoZNi0bxJvBz0Z2RYwA7/sorXzLh0cnGXA+UXCH9H
 3+Q+9WIDzfYkZlbQkpt5vahYUK++7sVJ+EaECEvLj4zu79RfWylwl7M3r3yh0QShwnY/
 TLes6/OVcUo62TlQqTIMi2jNJ9WAbQFZQTIONRYufqCNLoeUc3QCc9eAkG7V8aBLzwXc
 BFNQ==
X-Gm-Message-State: AJIora94DCD9uRpH109ZXlbvqwi/i/IZVBi4KKg10RJIC7Esci8P3vMt
 TZp70hJ1gq2Qp1s6MW22yCQz1FonTTVicL9W
X-Google-Smtp-Source: AGRyM1sE2X3Jppahy398wMQdJTllH5O2N01ed8IVVlc+fwdDpKCHUdUWXP1AxdRyHs5WtlhWyr6J5A==
X-Received: by 2002:a05:6870:c5a0:b0:10c:5a7f:1e1c with SMTP id
 ba32-20020a056870c5a000b0010c5a7f1e1cmr369603oab.250.1658253613765; 
 Tue, 19 Jul 2022 11:00:13 -0700 (PDT)
Received: from stoup.. ([172.58.110.182]) by smtp.gmail.com with ESMTPSA id
 c25-20020a4ae259000000b0035eb4e5a6cesm6286747oot.36.2022.07.19.11.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 11:00:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 01/21] tests/docker/dockerfiles: Add
 debian-loongarch-cross.docker
Date: Tue, 19 Jul 2022 23:29:40 +0530
Message-Id: <20220719180000.378186-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220719180000.378186-1-richard.henderson@linaro.org>
References: <20220719180000.378186-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x31.google.com
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

Tested-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220704070824.965429-1-richard.henderson@linaro.org>
---
 configure                                     |  5 ++++
 tests/docker/Makefile.include                 |  2 ++
 .../dockerfiles/debian-loongarch-cross.docker | 25 +++++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 tests/docker/dockerfiles/debian-loongarch-cross.docker

diff --git a/configure b/configure
index 4f12481765..35e0b28198 100755
--- a/configure
+++ b/configure
@@ -1933,6 +1933,7 @@ probe_target_compiler() {
     hexagon) container_hosts=x86_64 ;;
     hppa) container_hosts=x86_64 ;;
     i386) container_hosts=x86_64 ;;
+    loongarch64) container_hosts=x86_64 ;;
     m68k) container_hosts=x86_64 ;;
     microblaze) container_hosts=x86_64 ;;
     mips64el) container_hosts=x86_64 ;;
@@ -1987,6 +1988,10 @@ probe_target_compiler() {
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
index 0000000000..ca2469d2a8
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
+RUN curl -#SL https://github.com/loongson/build-tools/releases/download/2022.05.29/loongarch64-clfs-5.0-cross-tools-gcc-glibc.tar.xz \
+    | tar -xJC /opt
+
+ENV PATH $PATH:/opt/cross-tools/bin
+ENV LD_LIBRARY_PATH /opt/cross-tools/lib:/opt/cross-tools/loongarch64-unknown-linux-gnu/lib:$LD_LIBRARY_PATH
-- 
2.34.1


