Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFC05BF000
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:21:33 +0200 (CEST)
Received: from localhost ([::1]:38312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oalcS-0000AD-RM
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:21:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagzS-0005h5-Kc
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:24:58 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:45568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagzQ-0001nE-Px
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:24:58 -0400
Received: by mail-ej1-x62c.google.com with SMTP id dv25so7763470ejb.12
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=x4S1RGKB9TLIMCKmtB9fa0XzaDftdi2Kh+Izh7wFJ9E=;
 b=QVwo8d6Zj4+94XjrCtMDe3MxtOgopn8qlX983Untw/YaBevLdJaY7PqT0zBx5HouSp
 KzONekB7T9HBc/o0f9BECVS8u2K25vLu3eYcvLWH46zBG7XL+gzxQdyD8xa0SH2Lkm4w
 9q0ftK4nvLrRxe0KC4L+clLDS7dG+OcqRjMvMOnLCdknC0JIvogzo7GFJjCLn0qu6I9n
 D5HdE973ZfFBh2lFYKgeSO0Q3gfWR3BU4ag7ySbCZFra1DdzfjUf2cywwddkcNoqbVRb
 SQGRJsK+GyXJwbYXV8qlaeggdFp8T0cM4pa62Cc6u6dK/d80i8F0rHHeVeGFfmtrWLxm
 HZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=x4S1RGKB9TLIMCKmtB9fa0XzaDftdi2Kh+Izh7wFJ9E=;
 b=cGoEFF8BA9X9D2JNoUjCpzSYS4IdOO78kQj+grzWa0SXg84MuxgCa6OPuCSSxm/GyR
 gykktr9usNShh7t5syoiI99XQruhrZjwpPZ5XZta/J21g5k4qzSg902KtRCvN15Hlqgz
 QU28sYaghXYkiprp5CVdvANjeo/FthHchkzFAx/dJfFpbdqS0etfw8DifFEIMpDXOXug
 6DR2l7vT3su/PPawI7S24Ni2MZH61jle9kXt8m6GGAczm5oMxQ+Tc3E6euVbtdSQcPM6
 u9y1hA74wXC4QS0Q2yR5lKPtYqMNwbRzEb9opl9Cg+GAwZitxzGXAq5Qce7z3SB7yO8i
 RLqg==
X-Gm-Message-State: ACrzQf3Qw1vGwA6OlFAnyEW8FGJq7DBlZfDp2D5N7b+Nq1SKb33ic0fF
 sCmAfYHRN8lIyc5YFTfAHbQ8Qg==
X-Google-Smtp-Source: AMsMyM69wMmg8FiDl/2sGLUsg9wqUAp3hgrJg1cZ5d0d63UuzpyzHwrOyUIMt0w22mishYBLocXQ5A==
X-Received: by 2002:a17:907:6288:b0:72f:90ba:f0b2 with SMTP id
 nd8-20020a170907628800b0072f90baf0b2mr17030507ejc.696.1663694696002; 
 Tue, 20 Sep 2022 10:24:56 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h1-20020a1709063b4100b00740f1a58e0bsm213279ejf.30.2022.09.20.10.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:24:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9B22C1FFD2;
 Tue, 20 Sep 2022 18:15:36 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 27/30] tests/docker: update and flatten debian-hexagon-cross
Date: Tue, 20 Sep 2022 18:15:30 +0100
Message-Id: <20220920171533.1098094-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920171533.1098094-1-alex.bennee@linaro.org>
References: <20220920171533.1098094-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62c.google.com
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
single dockerfile as we do not some of the extraneous packages from
the base image to build the toolchain.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220914155950.804707-28-alex.bennee@linaro.org>

diff --git a/tests/docker/dockerfiles/debian-hexagon-cross.docker b/tests/docker/dockerfiles/debian-hexagon-cross.docker
index d5dc299dc1..8d219bb81d 100644
--- a/tests/docker/dockerfiles/debian-hexagon-cross.docker
+++ b/tests/docker/dockerfiles/debian-hexagon-cross.docker
@@ -2,12 +2,10 @@
 # Docker Hexagon cross-compiler target
 #
 # This docker target is used for building hexagon tests. As it also
-# needs to be able to build QEMU itself in CI we include it's
-# build-deps. It is also a "stand-alone" image so as not to be
-# triggered by re-builds on other base images given it takes a long
-# time to build.
+# needs to be able to build QEMU itself in CI we include its
+# build-deps.
 #
-FROM qemu/debian10
+FROM docker.io/library/debian:11-slim
 
 # Install common build utilities
 RUN apt update && \
@@ -15,11 +13,18 @@ RUN apt update && \
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
@@ -32,7 +37,7 @@ ADD build-toolchain.sh /root/hexagon-toolchain/build-toolchain.sh
 
 RUN cd /root/hexagon-toolchain && ./build-toolchain.sh
 
-FROM debian:buster-slim
+FROM docker.io/library/debian:11-slim
 # Duplicate deb line as deb-src
 RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.list
 # Install QEMU build deps for use in CI
-- 
2.34.1


