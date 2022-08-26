Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6665A2DC7
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 19:44:49 +0200 (CEST)
Received: from localhost ([::1]:51032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRdNw-0004Kp-F6
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 13:44:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRd9v-0005eF-Ow
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:30:19 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRd9t-0003f4-OF
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:30:19 -0400
Received: by mail-wr1-x42a.google.com with SMTP id e20so2562245wri.13
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 10:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=f8GDP3QR60DseUmhNI18PNeD4pkFjaTns2rnsr6Q2Ec=;
 b=wtCfHQtlug5MQNSkQ/IGKCqo69G0C/uVjHCZPte7vwbdXqQWk5mKans7AvFuLrWxMr
 GJ3J/5KM7ZLY911KJvVVd+EiI7Z6W2zn7xjwmaoR61qPVPjB8Yh/Lt5B02ns6JlhIE+/
 pvv2x0f5yyBavnorIzH+N9C8wfR9J0Od7mrSjt5HRvdRX0UmI8Y37XJAJwAaRm8JNq6w
 myXOQfuYgcg9dfc8hUdnRSYhbovIgrRIL89zWFWnOkWvYeDNy9MmMj3YjdJVM2qFEjPV
 s+/T10TJ1LiB1FHfjPV+Up79870gieKLPWnNCIa4A3wAmQgpVnXcjvWSojgGPvmGFqup
 sIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=f8GDP3QR60DseUmhNI18PNeD4pkFjaTns2rnsr6Q2Ec=;
 b=o9kAQPXv/74BeenHF8P0Nru7kRUbgqK9XDkyRXSQLRLRWvPrpSuPgXBKIRpJd+IxWs
 MEZDGmVntnv2pvbFtHEFugxj5GKdfccDzHzAlDjlK5eRUG5b4acozPURLOCisn758DMA
 lBRvRI8dIQmx5ROO2EHK7raikffcUnuZRo/cufrjJP1w9AO2a15M88mzLUECgeyTmiBD
 BWYmnIcNKQlRg5BwHFHyiLKWMQcAKVcMcds06R50ylEFIiJC6nk2WhBfV+4JGapTAvAF
 9MTBW4pWQpCaT6pYsBKFI/XLc8sq4xGJirhPZGejNwHmLkCQZTQ71oCYT8J77bEl0+MJ
 cuZA==
X-Gm-Message-State: ACgBeo0A/FnoNugIsNOZ+7UtGgEFrQq0/OmIvWLo352W2t27cs3hcjIF
 kmZkeZiqDu9GUfcnzat5HggNtw==
X-Google-Smtp-Source: AA6agR6lnjJRy7CdSn28f9B2HHznNm2Dq+62rx1+P++dYlJA1tzqyq0OXrXQMQCo2sQTfO+NfTR2Ag==
X-Received: by 2002:a5d:588d:0:b0:225:6e1a:8696 with SMTP id
 n13-20020a5d588d000000b002256e1a8696mr395287wrf.512.1661535015150; 
 Fri, 26 Aug 2022 10:30:15 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q16-20020adff950000000b002251639bfd0sm279850wrr.59.2022.08.26.10.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 10:30:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9C08A1FFCB;
 Fri, 26 Aug 2022 18:21:30 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v1 21/25] tests/docker: update and flatten debian-hexagon-cross
Date: Fri, 26 Aug 2022 18:21:24 +0100
Message-Id: <20220826172128.353798-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220826172128.353798-1-alex.bennee@linaro.org>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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

Update to the latest stable Debian. While we are at it flatten into a
single dockerfile as we do not need anything from the base image to
build the toolchain.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .../docker/dockerfiles/debian-hexagon-cross.docker  | 13 ++++++++++---
 .../dockerfiles/debian-loongarch-cross.docker       |  3 +--
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/tests/docker/dockerfiles/debian-hexagon-cross.docker b/tests/docker/dockerfiles/debian-hexagon-cross.docker
index d5dc299dc1..822c108953 100644
--- a/tests/docker/dockerfiles/debian-hexagon-cross.docker
+++ b/tests/docker/dockerfiles/debian-hexagon-cross.docker
@@ -7,7 +7,7 @@
 # triggered by re-builds on other base images given it takes a long
 # time to build.
 #
-FROM qemu/debian10
+FROM docker.io/library/debian:bullseye-slim
 
 # Install common build utilities
 RUN apt update && \
@@ -15,11 +15,18 @@ RUN apt update && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
     apt install -y --no-install-recommends \
         bison \
+        ca-certificates \
+        clang \
         cmake \
         flex \
+        gcc \
         lld \
+        make \
+        ninja-build \
+        python3 \
         rsync \
-        wget
+        wget \
+        xz-utils
 
 ENV TOOLCHAIN_INSTALL /usr/local
 ENV ROOTFS /usr/local
@@ -32,7 +39,7 @@ ADD build-toolchain.sh /root/hexagon-toolchain/build-toolchain.sh
 
 RUN cd /root/hexagon-toolchain && ./build-toolchain.sh
 
-FROM debian:buster-slim
+FROM docker.io/library/debian:bullseye-slim
 # Duplicate deb line as deb-src
 RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.list
 # Install QEMU build deps for use in CI
diff --git a/tests/docker/dockerfiles/debian-loongarch-cross.docker b/tests/docker/dockerfiles/debian-loongarch-cross.docker
index 48fe64c51b..ff6a5505be 100644
--- a/tests/docker/dockerfiles/debian-loongarch-cross.docker
+++ b/tests/docker/dockerfiles/debian-loongarch-cross.docker
@@ -1,8 +1,7 @@
 #
 # Docker cross-compiler target
 #
-# This docker target builds on the debian11 base image,
-# using a prebuilt toolchains for LoongArch64 from:
+# This docker target uses prebuilt toolchains for LoongArch64 from:
 # https://github.com/loongson/build-tools/releases
 #
 FROM docker.io/library/debian:bullseye-slim
-- 
2.30.2


