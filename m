Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED695A2D73
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 19:27:24 +0200 (CEST)
Received: from localhost ([::1]:55946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRd75-0007Cw-Ae
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 13:27:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRd1W-0004Gk-Vs
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:21:40 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRd1V-0002L1-3q
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:21:38 -0400
Received: by mail-wr1-x432.google.com with SMTP id e20so2537174wri.13
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 10:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=xKyoYDR28AhCYuT3uUQqYD/QZmqgkSdJelh/Kf1tA0g=;
 b=b8SmlVP+TFOSVz0YZKlfFO+aLk/youNbcl3nb9tqaSX0UR0eXudpATyXkWH52BHO3E
 2irY/5Jqakf/ivwtNOhdLS7++lcDBATe3gKHFC/ULgK2U77i9wqe20LOBiEq15YK2U+U
 1VA+H9zGAB5/+6Fv4fckXhe3ZQ15M1YANOfo9wNXPdzynwb7ZMmnz7yzS+2R/pX4b0Ig
 AA4e8iQwgstny003zg8mnpxYqV7GUqiGdjhhf1VuCNMrVDmnx7mbJG/9zYNTxjlaQE4A
 nNkY/J+WZACdCydAN437P0goK8xEtIab/U4YotZS9KjJXYQBrYzoChH+jFCs6I9p+PvA
 5deg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=xKyoYDR28AhCYuT3uUQqYD/QZmqgkSdJelh/Kf1tA0g=;
 b=T79uXdWx5Uo+jYnYjDdxy8FucdIKs7nuK7AjfhdKeU3Ry02PzFBi/QVE7iW1M/dCiu
 jv7MZg43rq7PmLuA8ToQrmJZR6xpgvLNtizE9T6G1mO4D9gWt0I0sE7NVyRlBptbm+Q6
 ACyjnr4t/wTkHkj2ZrHz1JmTBIyVlLTpAE1HvlXHCiwKHlW0P59a2/8YxAHWrSZL4t6p
 Jprb5a9v2AtgtnVIgoXHbhuJ+n95gP+Ti9fo9Fh1oYAndB4C4p2P+zL/P8Y3G16yB/kr
 C3ez5UTPgBN6p8o9qdEPe3ScRK0/4aqVu6e8Kyt4tQv0rjPzlr/MVm3UaDU75wxFkCUX
 Yotg==
X-Gm-Message-State: ACgBeo2kqYD3YTh4CZtZay0mx8cwWS34F6+eJcEiIiYjjLDwo+E2JH5w
 pCKjA9x5O0mG4jW2iwQghvKgvA==
X-Google-Smtp-Source: AA6agR50MguNCw7HY35560CIOLj8ksGRYQOz+ErTKiQMgSs5KnPABcFLat5pFzDDbpwUlkalYr5yNQ==
X-Received: by 2002:a05:6000:156b:b0:222:c789:cb2d with SMTP id
 11-20020a056000156b00b00222c789cb2dmr373585wrz.197.1661534495785; 
 Fri, 26 Aug 2022 10:21:35 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a05600c354d00b003a5f4fccd4asm191894wmq.35.2022.08.26.10.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 10:21:33 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4E9461FFBF;
 Fri, 26 Aug 2022 18:21:29 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v1 07/25] tests/docker: update and flatten debian-sh4-cross
Date: Fri, 26 Aug 2022 18:21:10 +0100
Message-Id: <20220826172128.353798-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220826172128.353798-1-alex.bennee@linaro.org>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
 .gitlab-ci.d/container-cross.yml                 |  1 -
 tests/docker/Makefile.include                    |  1 -
 tests/docker/dockerfiles/debian-sh4-cross.docker | 12 +++++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index a3bfa483bf..8a611fc824 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -137,7 +137,6 @@ s390x-debian-cross-container:
 sh4-debian-cross-container:
   extends: .container_job_template
   stage: containers
-  needs: ['amd64-debian10-container']
   variables:
     NAME: debian-sh4-cross
 
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 6c2ee3b175..37c4ea913f 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -89,7 +89,6 @@ DOCKER_PARTIAL_IMAGES += fedora
 endif
 
 docker-image-debian-mips-cross: docker-image-debian10
-docker-image-debian-sh4-cross: docker-image-debian10
 docker-image-debian-sparc64-cross: docker-image-debian10
 
 # The native build should never use the registry
diff --git a/tests/docker/dockerfiles/debian-sh4-cross.docker b/tests/docker/dockerfiles/debian-sh4-cross.docker
index fd3af89575..d48ed9065f 100644
--- a/tests/docker/dockerfiles/debian-sh4-cross.docker
+++ b/tests/docker/dockerfiles/debian-sh4-cross.docker
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
         gcc-sh4-linux-gnu \
         libc6-dev-sh4-cross
-- 
2.30.2


