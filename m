Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDF95B8CA2
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 18:14:39 +0200 (CEST)
Received: from localhost ([::1]:39900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYV26-0002gD-GD
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 12:14:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUnw-0006ZP-TO
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:00:01 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUnv-0002nV-4m
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:00:00 -0400
Received: by mail-wr1-x436.google.com with SMTP id h8so19454136wrf.3
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 08:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=qdSCb6s2r0EoqgxYjN+6ThvDdbhbHDOp2BpkY3tETSw=;
 b=OY+DncQw+EL/ciPldPFRoGo17xagGL67BCHtDha0832QXt0TTqFj9NmW3pj6RyNvcu
 O2PgE1vj+5babgSMZcKr51xIWcpwtzUu4u1QlOb3Pn1Cb3W4uLBf5lYTLoKCsw85gK1v
 O079B899Br1TPCEPTR0IQdyx9tg5QnsQUt2S3zebZ6TTnqqIefxlCvKL+Fl6Q6Q4Wpko
 OLPTABinY8Y3CyST+WSlQruBlrCyy0cqDY0khbOEm4vg3RZkbkMdxUCPQg2bvWPiDaC6
 wEWF0Lg4Kb9x6he9O3z00A5I8jbwp7gVuRLRsayWOJwSgpGG8pgQuni18dy8DFG+AmxH
 zK5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=qdSCb6s2r0EoqgxYjN+6ThvDdbhbHDOp2BpkY3tETSw=;
 b=Z0knjXCt/IdN/JDm6i214ir6vTgZOPJ9Rv4kYbOxls/hXBpw4dPkXfUTQyIcoIbwWS
 /KNGAcluSYtFl8xdKOhuUAF7AEiUtSJ3xwwJ3fKyZr+NNrSZ4UJyWjTO4UrVdgnxLqrN
 fY/UT8A9b0v1iFBJJE+Rz3D6YsRcSEBZFwOIbOYLdAsPWIgAm5VRyrMrXKSRdoV5NTDA
 oMjXuV5FZlMsqyqRF/lajBySJT9iQCNszLzeRZu81Dh3cd34ZZzajRLkEwq7yg0i2+dJ
 819E7VafjhNMbSF9YILbuMfa/IK4uhfzGot2hlVPbU7BO2QIS1Pe7ouwgNCffxunEYLa
 aKmw==
X-Gm-Message-State: ACgBeo0BW54qDycgLLEsLgWa+T2DGOasBQ9sKDipki2wdVzOrloyfSrl
 hamjRzSJdpd9XniUyxh/f9P40A==
X-Google-Smtp-Source: AA6agR64Y1f4DfqnnpJDIe02nz89sKON1nBc+XTVXAusiSAlRSNfRrPfu1+mIV7Kfhpp3pHnqqt6qg==
X-Received: by 2002:adf:d088:0:b0:228:a789:ce1f with SMTP id
 y8-20020adfd088000000b00228a789ce1fmr21108077wrh.461.1663171196785; 
 Wed, 14 Sep 2022 08:59:56 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a1c4c03000000b003b49ab8ff53sm4968612wmf.8.2022.09.14.08.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 08:59:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3846A1FFC2;
 Wed, 14 Sep 2022 16:59:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v2 10/30] tests/docker: update and flatten debian-m68k-cross
Date: Wed, 14 Sep 2022 16:59:30 +0100
Message-Id: <20220914155950.804707-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914155950.804707-1-alex.bennee@linaro.org>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Message-Id: <20220826172128.353798-6-alex.bennee@linaro.org>
---
 .gitlab-ci.d/container-cross.yml                  |  1 -
 tests/docker/Makefile.include                     |  1 -
 tests/docker/dockerfiles/debian-m68k-cross.docker | 12 +++++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index 6c1d765463..15a5270f6d 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -71,7 +71,6 @@ hppa-debian-cross-container:
 m68k-debian-cross-container:
   extends: .container_job_template
   stage: containers
-  needs: ['amd64-debian10-container']
   variables:
     NAME: debian-m68k-cross
 
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index e39597d35c..95790e974e 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -88,7 +88,6 @@ DOCKER_PARTIAL_IMAGES += debian-s390x-cross
 DOCKER_PARTIAL_IMAGES += fedora
 endif
 
-docker-image-debian-m68k-cross: docker-image-debian10
 docker-image-debian-mips-cross: docker-image-debian10
 docker-image-debian-mips64-cross: docker-image-debian10
 docker-image-debian-sh4-cross: docker-image-debian10
diff --git a/tests/docker/dockerfiles/debian-m68k-cross.docker b/tests/docker/dockerfiles/debian-m68k-cross.docker
index fcb10e3534..dded71c5d2 100644
--- a/tests/docker/dockerfiles/debian-m68k-cross.docker
+++ b/tests/docker/dockerfiles/debian-m68k-cross.docker
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
         gcc-m68k-linux-gnu \
         libc6-dev-m68k-cross
-- 
2.34.1


