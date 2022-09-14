Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 516CF5B8D9F
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 18:56:26 +0200 (CEST)
Received: from localhost ([::1]:53238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYVgX-0003o7-EZ
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 12:56:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUty-0001Nu-ID
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:06:14 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:46749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUtv-0003qX-MM
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:06:13 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 n40-20020a05600c3ba800b003b49aefc35fso2608479wms.5
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 09:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=U2JzAVOHBmx2p6Y9jlhkKfmMcAlVs01DcSLL5ELzwk4=;
 b=QizJrc6mW/B4qufDDSvFmkWDvaCy8AN3qyuKGfZpdae4dtFKhBV6r2/c7v2Y1bSML5
 RZyd6BbkxhRTEv7EyPzCbOv5k4GvGLGlt6HcsELR/WGscbMigT63pmfHpc+ti1uamqQP
 dO3119gojy+JZwSKE9TO66MHI6rbOGVOjorWrRI6ll4uPbFHp8IaNXioz4PtdpTUrw5s
 Y7OzhiY76NyW1oVmKsa8Hra9b9SQAUMcXv+BQw50G18OysczYmojRxMkzcuGfdzYgiKn
 N83520PGrh+5iptYpNDqmoPyWh2QPWxxTa6bPIvcTz01QtiouGEFbyMVm+tpczEW5A1s
 9wSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=U2JzAVOHBmx2p6Y9jlhkKfmMcAlVs01DcSLL5ELzwk4=;
 b=Bv2RGGAXoKYAXTuCkwwsM5AgpCGxUAqQF8NI5fNVxZPEDUnU4VAks5ir/Q/7I/LEJD
 hmuKGTddCeL0G5oR9EGQbeP5SQngym8qLHWxm49cvx6N/aiWyntYB0rV9H+E0L5phtWZ
 U1MjzTVMiWvPtS3sGtLwKclOG7CsiOtPFA1Vqb/jj52Zoyy3lPi3PH0v0ZJZ9FdBHMtO
 FN0jN7rvDIN/tbBSXvV5yoBRqZ21S9vcNMrgyaNnD+jcCDoU+riVTLLAw+teuvaGYShf
 vt9cfw+r5Qp1Nzb+YdeV1e5B3FzbB8PiCkwm8HmCUCxnzjzds3ooRYq1jJk9XhKGqIkV
 QgOQ==
X-Gm-Message-State: ACgBeo0l2oKnhCDJF48mzXoV2wXOFqAfLUrNh+mv15RNRWAEQ3gVBvtD
 QVDLZpU+XYB5mpUgXGs2j4RSxQ==
X-Google-Smtp-Source: AA6agR4wFGT3H6n2JHqEvbM1JuxLo0bqwdzyY8m/SFMgZ3+AD3yAl/mpKAl59pXeSKZIph2fHhG0hA==
X-Received: by 2002:a05:600c:4f89:b0:3b4:a6fc:89e5 with SMTP id
 n9-20020a05600c4f8900b003b4a6fc89e5mr744104wmq.149.1663171569997; 
 Wed, 14 Sep 2022 09:06:09 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a056000118100b0022a2f4fa042sm13552376wrx.103.2022.09.14.09.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 09:06:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 486AA1FFC3;
 Wed, 14 Sep 2022 16:59:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v2 11/30] tests/docker: update and flatten debian-mips64-cross
Date: Wed, 14 Sep 2022 16:59:31 +0100
Message-Id: <20220914155950.804707-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914155950.804707-1-alex.bennee@linaro.org>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
Message-Id: <20220826172128.353798-7-alex.bennee@linaro.org>
---
 .gitlab-ci.d/container-cross.yml                    |  1 -
 tests/docker/Makefile.include                       |  1 -
 tests/docker/dockerfiles/debian-mips64-cross.docker | 12 +++++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index 15a5270f6d..a3bfa483bf 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -77,7 +77,6 @@ m68k-debian-cross-container:
 mips64-debian-cross-container:
   extends: .container_job_template
   stage: containers
-  needs: ['amd64-debian10-container']
   variables:
     NAME: debian-mips64-cross
 
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 95790e974e..6c2ee3b175 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -89,7 +89,6 @@ DOCKER_PARTIAL_IMAGES += fedora
 endif
 
 docker-image-debian-mips-cross: docker-image-debian10
-docker-image-debian-mips64-cross: docker-image-debian10
 docker-image-debian-sh4-cross: docker-image-debian10
 docker-image-debian-sparc64-cross: docker-image-debian10
 
diff --git a/tests/docker/dockerfiles/debian-mips64-cross.docker b/tests/docker/dockerfiles/debian-mips64-cross.docker
index 09c2ba584e..afcff9726f 100644
--- a/tests/docker/dockerfiles/debian-mips64-cross.docker
+++ b/tests/docker/dockerfiles/debian-mips64-cross.docker
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
         gcc-mips64-linux-gnuabi64 \
         libc6-dev-mips64-cross
-- 
2.34.1


