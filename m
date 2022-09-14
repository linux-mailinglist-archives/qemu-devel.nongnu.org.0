Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 913B35B8D6B
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 18:47:06 +0200 (CEST)
Received: from localhost ([::1]:39434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYVXV-00008v-MM
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 12:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUo3-0006kr-Gp
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:00:07 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:46716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUo1-0002wA-3n
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:00:07 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 n40-20020a05600c3ba800b003b49aefc35fso2595299wms.5
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 09:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=sndVtu5XcqEXirLEG2n7a84U7O29s/uHZwqERDBcl2k=;
 b=LfyssLbAkoW+mDkLhAMGJjUzR3gQuO5tBkk6a8qn2kw5lHWdaZZDN1TyJO9c6CTvMJ
 mq7yaFN8kufeEQPv14rJl4OCy0jUb5t10xwjUpS1Xw1wsCQsPVQ7eivfMWapnAwDHJsE
 o2arRKnVaEWjlyZNZshcuKHtJ8OTvJYlwiBRIcXyCOyJP/gNb6/JL/QhWA05lZVBvP50
 ySVzLuxSc6PfsBhgJoBGGsD4bEZsyPYaeUvLK8iP+FbeBbxcZQr4/TftScwT65qu898H
 OPdkM0G2Es0qhIVr6hFK5TjjPD0HP8XYjthD5LiZflYA2Dh5yAJmlO9T98j7jzKzgMJC
 EB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=sndVtu5XcqEXirLEG2n7a84U7O29s/uHZwqERDBcl2k=;
 b=kqXIKXJZa+hQjO6IFLzmJ2DUfsVfPI2xdNSKiPyQCe+DF8T9YCUa9bS4a9DgYIWw8f
 Y7O8rW2yWTCWADS/jhN9k5JAmNiiw63axnBGXtejXTEBLvQef/DFowD4/aHBtA6D2Tmv
 nM590FBSy7aYQNM6YP+d+gM4M9rqtLE2O4Xfb7I/X68tKTRGsVFB9GFXmp7r/e7PX3ev
 SoSfCFodZw104qnfLk0Q3oXVvtipvzSkIDII+UUTkhko4zbK6+tfEvd1k+oy+uFt9NOm
 6eCzpeOWm7OC+GsRxFb66FDaOeZAHr4YqlEesa6LE1fu2N5raBwAQngL/B0QVMv3gS3q
 cACg==
X-Gm-Message-State: ACgBeo2f2+UPXezueKzIrJRt/IRkEc/jY4GVBGZT4BZuj9DLJWFZJglt
 e1SugQYaL5n3xpzXBa6JeeS1nQ==
X-Google-Smtp-Source: AA6agR5llDjYLm2q62PuIc4arW9DmSJJqsYUHmaRuCcOnOFOu1m/e+i0rUPQAUr3VoP+/ghSV9p2/Q==
X-Received: by 2002:a05:600c:2c4d:b0:3b4:867f:1e6f with SMTP id
 r13-20020a05600c2c4d00b003b4867f1e6fmr3753373wmg.75.1663171203799; 
 Wed, 14 Sep 2022 09:00:03 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 b15-20020adfe30f000000b0021e6c52c921sm16859002wrj.54.2022.09.14.08.59.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 09:00:01 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CFC341FFD1;
 Wed, 14 Sep 2022 16:59:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v2 27/30] tests/docker: update and flatten debian-hexagon-cross
Date: Wed, 14 Sep 2022 16:59:47 +0100
Message-Id: <20220914155950.804707-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914155950.804707-1-alex.bennee@linaro.org>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
single dockerfile as we do not some of the extraneous packages from
the base image to build the toolchain.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220826172128.353798-22-alex.bennee@linaro.org>

---
v2
  - use debian11 consistently
  - remove "stand-alone" comments which will soon be irrelevant
  - reword commit as we do need some extra packages
---
 .../dockerfiles/debian-hexagon-cross.docker   | 19 ++++++++++++-------
 .../dockerfiles/debian-loongarch-cross.docker |  3 +--
 2 files changed, 13 insertions(+), 9 deletions(-)

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
diff --git a/tests/docker/dockerfiles/debian-loongarch-cross.docker b/tests/docker/dockerfiles/debian-loongarch-cross.docker
index df578da40d..a8e8e98909 100644
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
 FROM docker.io/library/debian:11-slim
-- 
2.34.1


