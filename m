Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A870C59FE0D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 17:14:54 +0200 (CEST)
Received: from localhost ([::1]:58366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQs5l-0005k3-65
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 11:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oQs2a-0000RL-AZ
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 11:11:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oQs2Y-0003mw-Mt
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 11:11:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661353893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZB6qjYydTYmE5zphFDDL9Ps2PXuNyHs7sGzcjHcrOaI=;
 b=I4XuXwhw3ZwgDIcjzfzzK4h3ZB72iO4eVF4AfaiZevHmAsBYBb1H2SUOckQQfEFh7RBodG
 b++6sPyHyaIw8v4fKqgOX7JY9sT2DsvolJJx5UwSTpxJDs6kX+bumo5qV9cvAKDs1pa38p
 20O249zvw7vwq4yjr2TkJURcoTLj89k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-GRhjp1CSPTSxiB-CLe0vqw-1; Wed, 24 Aug 2022 11:11:30 -0400
X-MC-Unique: GRhjp1CSPTSxiB-CLe0vqw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4ABD01C14B63;
 Wed, 24 Aug 2022 15:11:30 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0C4D492C3B;
 Wed, 24 Aug 2022 15:11:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH 1/6] tests/docker: Update the debian-all-test-cross container
 to Debian 11
Date: Wed, 24 Aug 2022 17:11:17 +0200
Message-Id: <20220824151122.704946-2-thuth@redhat.com>
In-Reply-To: <20220824151122.704946-1-thuth@redhat.com>
References: <20220824151122.704946-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

The "build-tci" job in our CI is running the pxe-test that requires
slirp. However, we are going to remove the slirp submodule from QEMU,
so we need to run the test in a container that provides libslirp from
the OS distribution.
Currently, the debian-all-test-cross container that is used for the
"build-tci" job is based on Debian 10 - which is not supported by
QEMU anymore and does not have libslirp as a system library. Thus we
really need to update the container to Debian 11 now to keep the
"build-tci" job working.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/container-cross.yml                      | 1 -
 tests/docker/Makefile.include                         | 1 -
 tests/docker/dockerfiles/debian-all-test-cross.docker | 9 ++++++++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index 505b267542..0971c6ac8b 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -15,7 +15,6 @@ amd64-debian-cross-container:
 amd64-debian-user-cross-container:
   extends: .container_job_template
   stage: containers
-  needs: ['amd64-debian10-container']
   variables:
     NAME: debian-all-test-cross
 
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 9a45e8890b..e60588cdc9 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -139,7 +139,6 @@ docker-image-debian-nios2-cross: $(DOCKER_FILES_DIR)/debian-toolchain.docker \
 
 # Specialist build images, sometimes very limited tools
 docker-image-debian-tricore-cross: docker-image-debian10
-docker-image-debian-all-test-cross: docker-image-debian10
 docker-image-debian-loongarch-cross: docker-image-debian11
 docker-image-debian-microblaze-cross: docker-image-debian10
 docker-image-debian-nios2-cross: docker-image-debian10
diff --git a/tests/docker/dockerfiles/debian-all-test-cross.docker b/tests/docker/dockerfiles/debian-all-test-cross.docker
index dedcea58b4..afdf0261d3 100644
--- a/tests/docker/dockerfiles/debian-all-test-cross.docker
+++ b/tests/docker/dockerfiles/debian-all-test-cross.docker
@@ -6,16 +6,23 @@
 # basic compilers for as many targets as possible. We shall use this
 # to build and run linux-user tests on GitLab
 #
-FROM qemu/debian10
+FROM docker.io/library/debian:bullseye-slim
+
+# Duplicate deb line as deb-src
+RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.list
 
 # What we need to build QEMU itself
 RUN apt update && \
+    DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
     apt build-dep -yy qemu
 
 # Add the foreign architecture we want and install dependencies
 RUN DEBIAN_FRONTEND=noninteractive eatmydata \
         apt install -y --no-install-recommends \
+        clang \
+        git \
+        gdb-multiarch \
         gcc-aarch64-linux-gnu \
         libc6-dev-arm64-cross \
         gcc-alpha-linux-gnu \
-- 
2.31.1


