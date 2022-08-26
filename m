Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 590135A2DCA
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 19:44:52 +0200 (CEST)
Received: from localhost ([::1]:51036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRdNz-0004XN-De
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 13:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRd9y-0005iG-U5
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:30:22 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:35341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRd9w-0003i4-Tq
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:30:22 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 m17-20020a7bce11000000b003a5bedec07bso4785292wmc.0
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 10:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=+BX6qUyxqbnrBehmpeRa0CPGjkQBlNLSFXh4p4mNIT0=;
 b=IpbHM/cCxx0AUhvFfoP0kEPevtsEvmj6ObYig3NbtQ9+DcJT4Hd2TOHPtlKxF8/taS
 NjheyMDzSHiPZEw6V4Sv48wQowcY2ODsKFq7JLgapi/PmABlCADIEhECduXfU1oisqMU
 3euxc1kgADhwdWzPEozoeFY9rmWJ7+bNjDoiWVerjrAAI9s5xMKzOS/I2FkFMBLk/Cci
 Z2X1H5CvR8BzC+IMrpUx/SaYrzCWxfJzW11ArZnNGUAZk4rzLZ804M672yIpExCspVxx
 kjE4Bnm8r27nZIr3HM6y1eSTuyw3ArlMP1OiPj9Awd+Mvaem8o38+bLFLXTWeby9jJo1
 F+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=+BX6qUyxqbnrBehmpeRa0CPGjkQBlNLSFXh4p4mNIT0=;
 b=hUHJ9NXxuVVVT3+zs2nkihEiHT7NSDsRziP8+0+PM+lxObtVqvSfNXqPRnw19O8qr5
 1fUllMB+5MqKKE5b2MdNhjk7t+6Ho4zux6kt43NOMv4KsCk6VFRn/J3OKMJl4/Gl+tc8
 ZQwf+3r3iuxKwPMyFdZmZF13sYMwK3/q1+YPITuul5Si2uo3tWKo5dQgZmSZK6rDn+g+
 OeNKR8YXzRn+d2AU34VQeJNsMn0rqUPbjE+KrFuK3sBUyQ+eYyUCG33D4zU7jBie1lBl
 +dI5fG6NKDNPUoIlOn+gPYPwyZhgG/gCksFETHcriOzZLEr5H4Wi0LLlsceJ0zmOAuZr
 hC5g==
X-Gm-Message-State: ACgBeo2uQR2JCqS1fEk6+O7bp5w9Ufap/ZOLqwOCM0pddXh8gzjPKRit
 jfwBCmJ4fnT2KtBDB4kJa75KpA==
X-Google-Smtp-Source: AA6agR4vv+9C7TGUQYQkCyWe9i5iyarUVQh7gO4o+Bvc0YkeThCyRS7dVxgjxG5OJQ266+ZXHx5Q+g==
X-Received: by 2002:a05:600c:28cd:b0:3a5:4f45:b927 with SMTP id
 h13-20020a05600c28cd00b003a54f45b927mr358971wmd.90.1661535019390; 
 Fri, 26 Aug 2022 10:30:19 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c3b0400b003a531c7aa66sm336383wms.1.2022.08.26.10.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 10:30:17 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AAD991FFCC;
 Fri, 26 Aug 2022 18:21:30 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v1 22/25] tests/docker: update and flatten debian-toolchain
Date: Fri, 26 Aug 2022 18:21:25 +0100
Message-Id: <20220826172128.353798-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220826172128.353798-1-alex.bennee@linaro.org>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
build the toolchain. This is used to build both the nios and
microblaze toolchains.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/Makefile.include                    | 4 ----
 tests/docker/dockerfiles/debian-toolchain.docker | 5 +++--
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 1d5a6f1fb4..a3174346da 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -127,10 +127,6 @@ docker-image-debian-nios2-cross: $(DOCKER_FILES_DIR)/debian-toolchain.docker \
     $(DOCKER_FILES_DIR)/debian-nios2-cross.d/build-toolchain.sh
 	$(call debian-toolchain, $@)
 
-# Specialist build images, sometimes very limited tools
-docker-image-debian-microblaze-cross: docker-image-debian10
-docker-image-debian-nios2-cross: docker-image-debian10
-
 # These images may be good enough for building tests but not for test builds
 DOCKER_PARTIAL_IMAGES += debian-alpha-cross
 DOCKER_PARTIAL_IMAGES += debian-powerpc-test-cross
diff --git a/tests/docker/dockerfiles/debian-toolchain.docker b/tests/docker/dockerfiles/debian-toolchain.docker
index 738d808aa6..c723377495 100644
--- a/tests/docker/dockerfiles/debian-toolchain.docker
+++ b/tests/docker/dockerfiles/debian-toolchain.docker
@@ -4,7 +4,7 @@
 # This dockerfile is used for building a cross-compiler toolchain.
 # The script for building the toolchain is supplied via extra-files.
 #
-FROM qemu/debian10
+FROM docker.io/library/debian:bullseye-slim
 
 # Install build utilities for building gcc and glibc.
 # ??? The build-dep isn't working, missing a number of
@@ -15,6 +15,7 @@ RUN apt update && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
     apt install -y --no-install-recommends \
         bison \
+        ca-certificates \
         flex \
         gawk \
         libmpc-dev \
@@ -32,5 +33,5 @@ RUN cd /root && ./build-toolchain.sh
 # Throw away the extra toolchain build deps, the downloaded source,
 # and the build trees by restoring the original debian10 image,
 # then copying the built toolchain from stage 0.
-FROM qemu/debian10
+FROM docker.io/library/debian:bullseye-slim
 COPY --from=0 /usr/local /usr/local
-- 
2.30.2


