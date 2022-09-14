Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B00B5B8CC4
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 18:21:42 +0200 (CEST)
Received: from localhost ([::1]:46634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYV8v-0008QM-KJ
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 12:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUnw-0006XR-8t
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:00:00 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:51970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUnu-0002nH-DO
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 11:59:59 -0400
Received: by mail-wm1-x331.google.com with SMTP id o5so7864023wms.1
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 08:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=oVg0gNUb1gnpWZ5Xt/ps9KGAmZPADE10X+KbFxU79pY=;
 b=terdUEBjFFaoLk9PPJ++yQmoWc8+WK1FQpwq5oW6OLDXz2T6S3Bt7uuYk7bXgvHptp
 CbyjMjRI6oWTuBXQjzUk8nURmfJXHSaKPtLVjpAgocsVZ29DvqYotgdAGXExex0f7y8R
 2y1SYdcmqhuPZWJ1ZwdWIa4nQBlzXJVMpxP7Ep6oyskD9NQ9RRz1Ec26eA8Sf4ZEnMLp
 7XyYUcKr0QHRW2MOkuDTJUPJRPlvIyPS609l4WhoxFNZg/IeI78tJe/w0OfBuDOTVf0+
 wWaef5+J5m0bGjPfzosL2KC1CGArEHO1dG3WkX54zel1Nt+kDnyKfvvuLNs+mYaS1Nod
 wKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=oVg0gNUb1gnpWZ5Xt/ps9KGAmZPADE10X+KbFxU79pY=;
 b=ckgTRb1jVqaCyv6vBDzlvaGy/Ev2N5JbVy2w5vZ8lZ3x20VWnHA8o2Be9SMfWVYipY
 RxzsaWZjckH8fB8KCuNZDpQSRBm0b/Z+PZrvckZ2r39X490W27eobzKF+buGB5ucqaY7
 dxeZAS1+R864I3cn6b7lKbEnOBPvFJ7HVOY3e5HsD7YRVA0IJjKdU0MGu2L7SpFP3Zx4
 gBg7zwEpi7WA3vrJR42vJLQKisTgOzxNdYYcsYAaQx9/yICk1+48hcrTH5xrSutNS2iY
 POKb8XmaRpL3ehv+MvW/DlPIwzyLM+CdCi0S7rJ45AWZtB+GUBEanEc4RJgCQMtwsxw4
 vFWA==
X-Gm-Message-State: ACgBeo1Tg1PZW9Mi8mlDitaFC4Sj//H19fGApnheQ1sxmDX400stvukS
 S0VI/Ja9tzf7btCBQc5wlOBcAA==
X-Google-Smtp-Source: AA6agR7yatMybCVAV6eq1a/ttEuU5pGkfWQ/Ax4rqsdQPU57qHndrCQM9vaPSPx+yAYMTaiVpkBqYw==
X-Received: by 2002:a05:600c:1d26:b0:3b4:a677:ccc9 with SMTP id
 l38-20020a05600c1d2600b003b4a677ccc9mr1519508wms.121.1663171196038; 
 Wed, 14 Sep 2022 08:59:56 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a05600c358500b003b47b913901sm8757433wmq.1.2022.09.14.08.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 08:59:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0C7561FFC0;
 Wed, 14 Sep 2022 16:59:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v2 08/30] tests/docker: update and flatten debian-alpha-cross
Date: Wed, 14 Sep 2022 16:59:28 +0100
Message-Id: <20220914155950.804707-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914155950.804707-1-alex.bennee@linaro.org>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Message-Id: <20220826172128.353798-4-alex.bennee@linaro.org>
---
 .gitlab-ci.d/container-cross.yml                   |  1 -
 tests/docker/Makefile.include                      |  1 -
 tests/docker/dockerfiles/debian-alpha-cross.docker | 12 +++++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index 505b267542..802e332205 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -1,7 +1,6 @@
 alpha-debian-cross-container:
   extends: .container_job_template
   stage: containers
-  needs: ['amd64-debian10-container']
   variables:
     NAME: debian-alpha-cross
 
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 9a45e8890b..c565aa5e7b 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -88,7 +88,6 @@ DOCKER_PARTIAL_IMAGES += debian-s390x-cross
 DOCKER_PARTIAL_IMAGES += fedora
 endif
 
-docker-image-debian-alpha-cross: docker-image-debian10
 docker-image-debian-hppa-cross: docker-image-debian10
 docker-image-debian-m68k-cross: docker-image-debian10
 docker-image-debian-mips-cross: docker-image-debian10
diff --git a/tests/docker/dockerfiles/debian-alpha-cross.docker b/tests/docker/dockerfiles/debian-alpha-cross.docker
index 10fe30df0d..4eeb43c78a 100644
--- a/tests/docker/dockerfiles/debian-alpha-cross.docker
+++ b/tests/docker/dockerfiles/debian-alpha-cross.docker
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
         gcc-alpha-linux-gnu \
         libc6.1-dev-alpha-cross
-- 
2.34.1


