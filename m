Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7F85B8DAE
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 19:00:49 +0200 (CEST)
Received: from localhost ([::1]:36954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYVkl-0001Tx-5X
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 13:00:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUty-0001Nw-Io
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:06:14 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:44851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUtw-0003qb-0k
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:06:14 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 n17-20020a05600c501100b003a84bf9b68bso11860932wmr.3
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 09:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=CjorgUKQ0wAJREnGajqwiUqGdPFKd/Yke5pdcIHCgJA=;
 b=T/qhnq9IAQIU9zzdHrWpYmbqIC5N20lYJzyvFd6Omd6DzFZCtP8rb3UeA8FO9gx7hZ
 CU85z4dEP2aDObqJ156fGRSKQ7ViYQLib170MUNVPuCmFu5biT104oc7/96Xv9FGByo+
 92Q5oQjUxZR8bvrc2NoAztsST2lLPStrHuGGShFuYGCKVUOvbTeBeMXk2nYJLrMq0THn
 ACOg4q4VwQkwuTJZ43dOH38pbwLhPmkNIEtv+09s7OnUO40yid7/LZxUGgoYsJeFrAYA
 ysMvAA/veRrx1cWpAQfl9/yj/P2TY4tXJJiCjHO3eIEzAP9Eb608YEHnUIE/TpuVv+bc
 Sa5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=CjorgUKQ0wAJREnGajqwiUqGdPFKd/Yke5pdcIHCgJA=;
 b=eJjbjw4VjwbDtEsM9bPU5dRVmJHVuTFA9j6h1h5KMlQbsxXDr/Bx7KixCTak9LmgTP
 zZuvXIQg8CYgj4FysTgK23RrgJ31hNQyYdsLiAGdR4oipJ+WpknMlWP1ZF8SMw8vw6hT
 /mixPtRyvW4NBxBJalReBVoiNsk5fD7ERueOmiE6WOzr0uxwY8h3LP0Wf5Gm3JZTi8NN
 De//Xu2uDgjOPxQ6clDN3XmOO2aqO+JJ59fqUqZMKIRfq93DM0Pm+CxHk+HYIJKphI6y
 jgjl/Uez9262cpNwdvHiNTRNvrMQMBR/WvlOaIICkbMH6ENPdcllr6Z+4AZzGSd7OBac
 D4WQ==
X-Gm-Message-State: ACgBeo3wCQkTNb15xr11lw2eFADBl4Xah2hiucNO+Vzapujp3CI4aORi
 Mlnuq3DOvpfSILNDeEjygisT3g==
X-Google-Smtp-Source: AA6agR7wQwQxzdHQrOmPO5GkL39iRQfr4kF3ShMqHBcC2yIvy50kHciUCLOFj0ZPAuXPZEWa+QucOg==
X-Received: by 2002:a05:600c:35c6:b0:3b4:9a9e:464a with SMTP id
 r6-20020a05600c35c600b003b49a9e464amr3705425wmq.206.1663171570438; 
 Wed, 14 Sep 2022 09:06:10 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a5d5487000000b00228dbf15072sm13747576wrv.62.2022.09.14.09.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 09:06:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 570921FFCE;
 Wed, 14 Sep 2022 16:59:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v2 22/30] tests/docker: flatten debian-riscv64-test-cross
Date: Wed, 14 Sep 2022 16:59:42 +0100
Message-Id: <20220914155950.804707-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914155950.804707-1-alex.bennee@linaro.org>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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

Flatten into a single dockerfile and update to match the rest of the
test cross compile dockerfiles.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220826172128.353798-17-alex.bennee@linaro.org>

---
v2
  - minor reword of commit msg
---
 .gitlab-ci.d/container-cross.yml                       |  1 -
 tests/docker/Makefile.include                          |  1 -
 .../dockerfiles/debian-riscv64-test-cross.docker       | 10 ++++++----
 3 files changed, 6 insertions(+), 6 deletions(-)

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


