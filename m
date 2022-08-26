Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FA15A2D61
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 19:24:09 +0200 (CEST)
Received: from localhost ([::1]:59540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRd3w-0001OE-8F
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 13:24:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRd1T-0004Fg-Oq
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:21:36 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:55972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRd1R-0002KA-EE
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:21:35 -0400
Received: by mail-wm1-x335.google.com with SMTP id d5so1212705wms.5
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 10:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=vrxLvc9/OG1xl6UAcg3RkOGNLBO190WLVRXVgXWeqiE=;
 b=HyuMyt7WnIF3R7sLMlfOByKMvrRsRjD6ccwXrHJsCDvoj4x0wvJl77pu1G53tCytYQ
 2YczzqkbiCfilQyNnAk1zkKxBtUt/eiQd1HwMMBe+Vyvz8Tog2jDOmxMbtF+l+Sdr+a6
 zYdgHxHLf857hh22yWEuUAQBXyHjomiKJAfO/3oR9y7E5769Kb0Gd0E5anBMmv9KjL94
 IyHaOmblhpx6rC7T0bKyOuAOATDjCmc69uFdB8tyER33UaIlHm/QM53mwMoH3sTtTS0o
 nbAtgmP+2fq5CgzKei8G6XQRZe1m4ciOLEbLY/dn3tI1b23/hgtXwUpa2i3LUfQ59jMT
 eWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=vrxLvc9/OG1xl6UAcg3RkOGNLBO190WLVRXVgXWeqiE=;
 b=3iPDl0fvK38ZOeHX5iA28QoLRD8d3Hu4BKiOEE4ZjbGuTC5of+SxtpoqGoNCxt8BQU
 Ms7oSC9ZN7mFFKZMJUBxeu9KJRYVgZRzuqtZXjFqgsqUtSduntpvf9fxhs6dsKFA7FZY
 yf+HVikkX7uaZPod+kpCg+zH37tqGD+aZvo8zPF+XD8YX/ToMOVzHYDdsAMra3hNwxgm
 MWr3jOk3MetPl/1F9mqCXacidSVQQsp4H4A+kGrhfgn/qzX87ebn5O+u+v+BERMp7Rnb
 uwv5Bq5b0llgp4UnkhQO/yRlXb3SNLpaT82SZhIbNhf5g7DvirBkMR4kryrTkZAZx55j
 zVhw==
X-Gm-Message-State: ACgBeo0EMW+0iHWRanORgh8OEoCtvat/GKDUYOyvOHHzGJdB7EShfWiE
 jo5bjI0LCQe/WpowDE6qTrzyqw==
X-Google-Smtp-Source: AA6agR43AFX/N+Ux9D/R6EsgKxajiQ+LNLLxawu0T3kgYDZcVQyY6FFclxVaOKAzkmn0I+ovZ/qFvQ==
X-Received: by 2002:a05:600c:600c:b0:3a5:abdc:8ce4 with SMTP id
 az12-20020a05600c600c00b003a5abdc8ce4mr383609wmb.144.1661534492056; 
 Fri, 26 Aug 2022 10:21:32 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t8-20020adfdc08000000b002258413c310sm237093wri.88.2022.08.26.10.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 10:21:30 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E9E361FFBB;
 Fri, 26 Aug 2022 18:21:28 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v1 03/25] tests/docker: update and flatten debian-alpha-cross
Date: Fri, 26 Aug 2022 18:21:06 +0100
Message-Id: <20220826172128.353798-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220826172128.353798-1-alex.bennee@linaro.org>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
2.30.2


