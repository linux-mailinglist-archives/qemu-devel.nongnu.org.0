Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DFA5A2DE7
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 19:56:32 +0200 (CEST)
Received: from localhost ([::1]:55086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRdZG-0007Rd-Br
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 13:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRdJi-0007g1-VJ
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:40:26 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRdJY-0005P2-MD
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:40:25 -0400
Received: by mail-wr1-x42c.google.com with SMTP id e20so2590511wri.13
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 10:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=rs4UzZwFXide81aBRRsAexooSiW+xU7JJQn2OmaFS64=;
 b=L8eQ2/eSvKw7RRS0HPrMlfrJRYezIEXrMweoI+MxrTWohaEYv8FiaBCbi9+m7CVHdz
 rFAm3ltdZ6EujYK6ePgIOzMKuFwy9pqY/f8rJneWD1uq5cHeF+tpApLH4fhS6VdLrzcX
 uW79qDPiKBxvWnxiMFVgQf1PELLvtOXd536c+N0E7BzS66oW04BAsHMDM4DGTBibn4pQ
 Wq+MUsK6I1JlvZmHO0B4ZQBY1+BOi1uhV4+6ry5SOkZdQwpUtK2HH8ZGLWwxsfSlS6Gh
 sJoxGTyWGVYd/xOCNkiy0wJMLpXjxfyMV/xy8QU+q2wiqG6BGD+V8uGv9+CqFqeaqP+U
 5Eag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=rs4UzZwFXide81aBRRsAexooSiW+xU7JJQn2OmaFS64=;
 b=lwEcXnZ1u4SMiSdtIzQxKutnCOQtZDZhZYE8JbhN46WKCBA0rf8ZRdApD1g71MCWGP
 ArSxVWiskIUgY0PqnEa5NjjpS0OJKTZ+Gaw02CUGSP+YL/a3+XPR1uu+lig5bbOPC7KO
 FDUqWG9ZwZm1iACRsJJBtqpUrmacJxxaZ7ZlxT30ce7MQY3RiOAj15+n61BDfkE9GxjV
 2o9yg1YXp5Sp/fWmpmY9v7gy3pBDXg5gi5LffeqiCPULNYHCWBIv/Hh58t1F68ZkTzyl
 ckW2qcCeM3bDPr9R0TQh4fI+/7CdnJznZ7uKRLIZNLaCc/YVd/g6T6oMAh1wBzEPxKhC
 wXbw==
X-Gm-Message-State: ACgBeo1LUPKeGnW1GqT8EYElkF8cSzcMgqGWbkDgvMiMa0TxsefbNLNo
 syR3uu8/JhKaEK8zni9eezmKZA==
X-Google-Smtp-Source: AA6agR7Te4Vjw/vaAcfK8cu+LDPMuihogRA8/OBhAs4zMotBbIRJQDG4PHL2InNH2/gzSBX96czlTg==
X-Received: by 2002:a05:6000:1448:b0:225:63f2:2421 with SMTP id
 v8-20020a056000144800b0022563f22421mr380862wrx.527.1661535614647; 
 Fri, 26 Aug 2022 10:40:14 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a05600c2cc400b003a502c23f2asm280678wmc.16.2022.08.26.10.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 10:40:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 22A4E1FFC7;
 Fri, 26 Aug 2022 18:21:30 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v1 16/25] tests/docker: flatten debian-riscv64-test-cross
Date: Fri, 26 Aug 2022 18:21:19 +0100
Message-Id: <20220826172128.353798-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220826172128.353798-1-alex.bennee@linaro.org>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

Flatten into a single dockerfile. We really don't need the rest of the
stuff from the QEMU base image just to compile test images.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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
2.30.2


