Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7705A2D7C
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 19:29:18 +0200 (CEST)
Received: from localhost ([::1]:54588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRd8w-00036y-1f
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 13:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRd1W-0004Gf-3E
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:21:38 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:45670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRd1U-0002Kl-CA
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:21:37 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 bd26-20020a05600c1f1a00b003a5e82a6474so1187232wmb.4
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 10:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=hmGfRSUxoJgZ2uif1HVammf0I/lXxZx36DrIdSpRNGs=;
 b=XO0/vjdYT9G/a6W+CVkhPj3vlu7TrHZxJ+8KJc8EFoX/sJxqGeRW5DM+EIjw/9Kdcq
 UPpFeyEv3P+cnEjkuENM7gGOGyeUkPWNgkoTIdqQh6R5NkSLt9KqSIcTapZ3OAhV0q5L
 66cEk4dMrgikrQ7Bde2LLi+Ty+8SFFQY6t/oDlTEX9XOgxnSDScGqco4FubjwsmABTeB
 k8SkO7Nn8g3UmHakyHW03utOFe8YSB2YrLTvFyFCwhPuftLSxx63323B4mEWF9lNAlmN
 OVdW6aJI86xWM0n6RVHEz/n6FX92N/cdumCVHoWkWShxMvPG3ZmdkhBNXhvmBKrltfoY
 /89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=hmGfRSUxoJgZ2uif1HVammf0I/lXxZx36DrIdSpRNGs=;
 b=BJUCVnFr/J4f4lDL5lkEMWCdiol8QOS5nA230DwpNTiPR0wp4bzdd3XqaEFq01Ziwa
 O+fFwRGACKLiPt8uGHCE40vzQPFQiKFjCpCfQPvh16JOztSAsKL9kprK7A/6BWNIG9yS
 prmCu2EXRmMuhCzzwdtu3WGFdFQCk8MLA1muY2/mydY8ANo9wmZcXlxCv77+n+89n3Vp
 9f/6zjnLTI7uOLcgn4jMACcrNAin5Qtm6xi2odLK+D+ejIINSgXIhVxYz5b4+2iDPHsu
 QTTv5+cRQ7Me6ZpXHWLMfgMn6yc7rgTM4GqWtaNb8b4CG/pxqDvvXrzPQy/rALn8X4sg
 zzow==
X-Gm-Message-State: ACgBeo1ILSIy9n98I+uuCWViZIAJSiF5K3NhKu0M5oyU3BQtb8Yad6uv
 pzL0Rm3G0zC+WhRyP8IXqn8O+f/xybicbA==
X-Google-Smtp-Source: AA6agR5wxS7mM0dvSznpXHwh7vEzCkGeKk7ILqfHA+f8MXanoauGY3dgW8zDKAoAeW2wFyUvN2XW1w==
X-Received: by 2002:a05:600c:198e:b0:3a5:d4a2:8896 with SMTP id
 t14-20020a05600c198e00b003a5d4a28896mr372348wmq.140.1661534494887; 
 Fri, 26 Aug 2022 10:21:34 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k33-20020a05600c1ca100b003a38606385esm19170383wms.3.2022.08.26.10.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 10:21:31 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2285D1FFBD;
 Fri, 26 Aug 2022 18:21:29 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v1 05/25] tests/docker: update and flatten debian-m68k-cross
Date: Fri, 26 Aug 2022 18:21:08 +0100
Message-Id: <20220826172128.353798-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220826172128.353798-1-alex.bennee@linaro.org>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
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

Update to the latest stable Debian. While we are at it flatten into a
single dockerfile. We really don't need the rest of the stuff from
the QEMU base image just to compile test images.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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
2.30.2


