Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAF35A2D66
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 19:26:39 +0200 (CEST)
Received: from localhost ([::1]:46804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRd6M-00064H-Cm
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 13:26:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRd1W-0004Gl-Sv
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:21:40 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRd1R-0002Ju-LP
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:21:38 -0400
Received: by mail-wr1-x42f.google.com with SMTP id n17so2563793wrm.4
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 10:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=ZCmi5LDlNj/1vUtUC0UiIqz5kj0lGC3xkVZ8TrZXZ8w=;
 b=qN+VJD982D2KugmCF0G/5YNXv/TXRsVBOcMTUl81gDzNHskHB62nm1r8Jz+hDkjMn7
 /w02KGCfL2dPsrZzaxIM3vra2FuOumkVSJbxJDKQGu58LWgMjDUI7StfLdxEi/G+PQjz
 0P50wOuLTPdwOMsVAxGfsMCNv48jfBWs2KSM0ZBNXqR7mnDw2K0JYdi1RzoZMrVhZW6o
 Rqk14X70KkSA56gw40OqoUmfAgE22Id88xqfUdJK3JukUsZAwa/ZpSvvZxeUPqwvTC7x
 vCv+M90/Hme1zFJCdgZK/T21SnKHoPpbi+eNmRmp0FxIWk/jSUyN7Hdb4AnlhTxHBXre
 OlUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ZCmi5LDlNj/1vUtUC0UiIqz5kj0lGC3xkVZ8TrZXZ8w=;
 b=y2CcWcoOpAxtqEv0Q7hTpasnJiMaDlpfsrTJpdIasvgU5TLEL9x7xCD5YtIrm2rDQP
 036FYqoQhaIK7N8WNKCRNk3p6A7b3mO85XFXp4m5fQLdIkWokF2Buw5lHLEFNo/+eC5c
 badziO/MObfMlSj+Bl8e+mF2/Bd/WM17/nnvYgEuB9Bs8GO3i7EwNehIp+9kMgZwfRqx
 0COCC2YvwVQ/PG1kmPcl0iFfzxwQIhqSDV8HlyLsy2XNpKzDLeXVkyMDs+QceoKgTcVo
 /+TOno1X2UJVGsKdsSNaT01NhQm/hCJ2XEvlD9yPVlsO45zJ9OUhGBZwnrTqns1zW+p1
 t3Gw==
X-Gm-Message-State: ACgBeo1ifL7T6BqhRozRLeoVDgFRTTnqhWYEFbAG/BTbbDyUYrGfL/IQ
 z+LER+cV5JbuMNkuJJhpq5YlaA==
X-Google-Smtp-Source: AA6agR5FWFig+nc3pQyv4YbzoUVSkICmfWJSBYIjNyBpMV2QzQa65JkaJq41jvjbWKIFw+cfkGtr8A==
X-Received: by 2002:a05:6000:1561:b0:225:337b:454b with SMTP id
 1-20020a056000156100b00225337b454bmr358371wrz.660.1661534492970; 
 Fri, 26 Aug 2022 10:21:32 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a05600c358800b003a500b612fcsm303455wmq.12.2022.08.26.10.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 10:21:30 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 104031FFBC;
 Fri, 26 Aug 2022 18:21:29 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v1 04/25] tests/docker: update and flatten debian-hppa-cross
Date: Fri, 26 Aug 2022 18:21:07 +0100
Message-Id: <20220826172128.353798-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220826172128.353798-1-alex.bennee@linaro.org>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
2.30.2


