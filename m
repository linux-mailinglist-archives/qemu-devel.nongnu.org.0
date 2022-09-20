Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0795BEF13
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 23:22:29 +0200 (CEST)
Received: from localhost ([::1]:39562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oakhI-0004sP-3H
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 17:22:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagzS-0005gu-Ik
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:24:58 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:37610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagzQ-0001nm-Mq
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:24:58 -0400
Received: by mail-ed1-x52b.google.com with SMTP id a41so4899330edf.4
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=EyXiClvBgcxNkia9TfTVEvuirS+K1EwYfQ6G+A3OABc=;
 b=YJjuOWwDDQ6k7QRAuuRG1uB69ZEGzgZe9RATwp/soqaGfZ5Rv63XmF0hv1cnlpdoNZ
 QdLiFJf9OUQSuqxku6wSb8T31hOy14dtWdYhM3df2dZqyi224zmpmSpqEEFTZAOBUsd9
 AnLA5bcMaAv8zBuIrsygd+8dckSMMg7C6Of2sVw3z1LTqIK89z/TPL/B21nAmM/ty7TF
 UbH2dY/+jQMhGaEM6Qx+INNzy/sog/xy3qKFFu6SzwY9PGdFOVEuYOFFQ2y/7ihJPq06
 tIh2FcgxWLMkr4po1k52CMq/Pk5ZnVM/kYZ6La3kDw2uiMIqMKQlge2vYqgl6NWZVp23
 KbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=EyXiClvBgcxNkia9TfTVEvuirS+K1EwYfQ6G+A3OABc=;
 b=RJ5zJNlUSbLUhggLqbdsxyKeBEhHcJ9aT5moSC8sCo8jRXtiP4NSzblitbHzKN3N8K
 ps2j0H5tpA2r2nOAJLBzSIDdHHYJ76VqTmfgykcmE2BkKlUbDCwy/nnPiwqFTSmtZlBu
 xe+eoMvSIrwCXEN9t8+RjLYnZB6U/HMD2bkjOXlUhJuBm2PnRTVH2q98B4KcNfhimhKL
 wR8ZztPvMmUxYa3JcG117Psok2ksdz4Bq3lXMwznd8qFzo/gBKZtzWWQkk6U0vg+N+J8
 cT9/rBzP7cFqQsH/EGczXDA91fo3jX4r3VlXrgA5NNy98bFanUCQvJLNk4PpKU6r/Zto
 AxaQ==
X-Gm-Message-State: ACrzQf07zE/Y2VErJ5ioscfLNI35/cemy3CaE03o6X/xCu5JGvFXjZl8
 13x/MLdhkFD1c6IlyfLYJVDV8w==
X-Google-Smtp-Source: AMsMyM7hO9XWnGTy35hvu8gDWm5KoPx3WXovZuIt9lpVWJ4fsmG+cw9wzFGwWaB5Xe+SCngWhaTRqQ==
X-Received: by 2002:a05:6402:3213:b0:453:4426:a97b with SMTP id
 g19-20020a056402321300b004534426a97bmr19988612eda.8.1663694694801; 
 Tue, 20 Sep 2022 10:24:54 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d5-20020aa7c1c5000000b004518ee90b4dsm239332edp.1.2022.09.20.10.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:24:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0E1C41FFCD;
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
Subject: [PULL 22/30] tests/docker: flatten debian-riscv64-test-cross
Date: Tue, 20 Sep 2022 18:15:25 +0100
Message-Id: <20220920171533.1098094-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920171533.1098094-1-alex.bennee@linaro.org>
References: <20220920171533.1098094-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52b.google.com
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

Flatten into a single dockerfile and update to match the rest of the
test cross compile dockerfiles.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220914155950.804707-23-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index 95d57e1c5d..3a8bd75473 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -122,7 +122,6 @@ riscv64-debian-cross-container:
 riscv64-debian-test-cross-container:
   extends: .container_job_template
   stage: containers
-  needs: ['amd64-debian11-container']
   variables:
     NAME: debian-riscv64-test-cross
 
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index b1bf56434f..24cd44e667 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -133,7 +133,6 @@ docker-image-debian-all-test-cross: docker-image-debian10
 docker-image-debian-loongarch-cross: docker-image-debian11
 docker-image-debian-microblaze-cross: docker-image-debian10
 docker-image-debian-nios2-cross: docker-image-debian10
-docker-image-debian-riscv64-test-cross: docker-image-debian11
 
 # These images may be good enough for building tests but not for test builds
 DOCKER_PARTIAL_IMAGES += debian-alpha-cross
diff --git a/tests/docker/dockerfiles/debian-riscv64-test-cross.docker b/tests/docker/dockerfiles/debian-riscv64-test-cross.docker
index 1d90901298..e5f83a5aeb 100644
--- a/tests/docker/dockerfiles/debian-riscv64-test-cross.docker
+++ b/tests/docker/dockerfiles/debian-riscv64-test-cross.docker
@@ -3,10 +3,12 @@
 #
 # This docker target builds on the Debian Bullseye base image.
 #
-FROM qemu/debian11
+FROM docker.io/library/debian:11-slim
 
-RUN apt update && \
-    DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt install -y --no-install-recommends \
+RUN export DEBIAN_FRONTEND=noninteractive && \
+    apt-get update && \
+    apt-get install -y eatmydata && \
+    eatmydata apt-get dist-upgrade -y && \
+    eatmydata apt-get install --no-install-recommends -y \
         gcc-riscv64-linux-gnu \
         libc6-dev-riscv64-cross
-- 
2.34.1


