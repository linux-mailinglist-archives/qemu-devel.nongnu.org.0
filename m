Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FCC5B8CA0
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 18:14:24 +0200 (CEST)
Received: from localhost ([::1]:39094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYV1r-0002NU-Kq
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 12:14:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUnw-0006Ww-2t
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:00:00 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:39509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUnu-0002nQ-2l
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 11:59:59 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 bg5-20020a05600c3c8500b003a7b6ae4eb2so15807204wmb.4
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 08:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=IqaLr6BFu6QU3p+4N0XxulwHFk6+V+czeiV89fAmciE=;
 b=cyK/SugHz1QH3TSXU/J5Cq1IN/y8vABGNbMYH6vG9c5glzOcTYs7dbNyQWQ16yVGls
 nOeOl78cnnqkaHxOGcq9SvMVx6hZGK5qoq7XA9YsxgAM0FChKQD7WpaHzaqNjkzdrE7B
 WMcpGDkoXGQGqMJ+qCF3gx0T5OfshtNkfDz68uQ/v1JMrfppbEZXbWQvbNrTMV9KZliY
 P/6zhY34kcfQM4MiITMc2GeiKR0+oATSI6eWdcgtjSY54l+Lop3zbQHFcDpCNSvSQbox
 Rzv8PCDsP9a7WYrICpneb+dIfFLrMpDN/mo7hoYYQ9vhIh2vGFGJTU77EiwIRy6W67NU
 5Lng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=IqaLr6BFu6QU3p+4N0XxulwHFk6+V+czeiV89fAmciE=;
 b=NWVOgeeAsHz/jSSeAcfETkIkCCghDYClxJlwacPm+WBqqiIwspHZtJDQYmCgf9pI1c
 6VTd0K09oPXJn+0lyydoTOAmj0pI8BaReU3we63e/GaKQDGrFOP7cNvKcuv+hw0zgtJd
 r/NFFUswVD8p3oxWjOxFytYQEUYFIblnoW/T4oAUqu0kwp4le+iy01Lz604laAT5r7wa
 d9wxF2zv+aSnotKEdKCRM9oX2c40kmT5b+ZHN94GsXYvAJN0dSg24MoDniPuTTsxT+L4
 cBejeE4b+A1tSGa5MTeZodUXX3PyBy68x2JmQpqrC8k6kUN6wOv5IVkA2usSs8MOw149
 xJow==
X-Gm-Message-State: ACgBeo0xLIsTt/EenTE+2x7/MKR43pq4hn2EdISR8hTd2UlCyya8/NMP
 LIRkpN+mh5GGyzuFLTtMRpxfzi7Pxa3RDQS0
X-Google-Smtp-Source: AA6agR6sWjTQb/7fcI8MkArGq+Zvs+gfcbP1K2A2KSkOzeOL5DukwCAYWO1jw0pIlfDVV9T3CRp7Wg==
X-Received: by 2002:a05:600c:594:b0:3b4:7637:9444 with SMTP id
 o20-20020a05600c059400b003b476379444mr3804767wmd.52.1663171196400; 
 Wed, 14 Sep 2022 08:59:56 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d10-20020a056000114a00b002253604bbefsm14290812wrx.75.2022.09.14.08.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 08:59:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1C45F1FFC1;
 Wed, 14 Sep 2022 16:59:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v2 09/30] tests/docker: update and flatten debian-hppa-cross
Date: Wed, 14 Sep 2022 16:59:29 +0100
Message-Id: <20220914155950.804707-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914155950.804707-1-alex.bennee@linaro.org>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
single dockerfile. We really don't need the rest of the stuff from
the QEMU base image just to compile test images.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220826172128.353798-5-alex.bennee@linaro.org>
---
 .gitlab-ci.d/container-cross.yml                  |  1 -
 tests/docker/Makefile.include                     |  1 -
 tests/docker/dockerfiles/debian-hppa-cross.docker | 12 +++++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index 802e332205..6c1d765463 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -65,7 +65,6 @@ hexagon-cross-container:
 hppa-debian-cross-container:
   extends: .container_job_template
   stage: containers
-  needs: ['amd64-debian10-container']
   variables:
     NAME: debian-hppa-cross
 
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index c565aa5e7b..e39597d35c 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -88,7 +88,6 @@ DOCKER_PARTIAL_IMAGES += debian-s390x-cross
 DOCKER_PARTIAL_IMAGES += fedora
 endif
 
-docker-image-debian-hppa-cross: docker-image-debian10
 docker-image-debian-m68k-cross: docker-image-debian10
 docker-image-debian-mips-cross: docker-image-debian10
 docker-image-debian-mips64-cross: docker-image-debian10
diff --git a/tests/docker/dockerfiles/debian-hppa-cross.docker b/tests/docker/dockerfiles/debian-hppa-cross.docker
index 3d6c65a3ef..af1c8403d8 100644
--- a/tests/docker/dockerfiles/debian-hppa-cross.docker
+++ b/tests/docker/dockerfiles/debian-hppa-cross.docker
@@ -1,12 +1,14 @@
 #
 # Docker cross-compiler target
 #
-# This docker target builds on the debian Buster base image.
+# This docker target builds on the Debian Bullseye base image.
 #
-FROM qemu/debian10
+FROM docker.io/library/debian:11-slim
 
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt install -y --no-install-recommends \
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    apt-get update && \
+    apt-get install -y eatmydata && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y \
         gcc-hppa-linux-gnu \
         libc6-dev-hppa-cross
-- 
2.34.1


