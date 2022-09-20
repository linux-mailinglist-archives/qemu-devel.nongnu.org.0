Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B06BA5BEF84
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 23:59:54 +0200 (CEST)
Received: from localhost ([::1]:34712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oalHV-0002Jo-Qd
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 17:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagqg-0000Zv-9p
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:15:54 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:39513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagqe-0000hx-1Z
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:15:53 -0400
Received: by mail-ej1-x62b.google.com with SMTP id y17so7815517ejo.6
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=p614Yn9pYByJ8dTPq0j5fmlQHGdXVf6p9Jpw4u2AfOM=;
 b=rsTs9W5uethv/Sr0uDbnhCiJmW7HA9ZFJjGO5OZCTajvbfBSM7IA+98f7B9RC1WBNX
 lbT6Vo1QkgCGQXiQ0hj5ZFugR/oluryxrBGgL0/JfQW2273Ftw4Ki2BiHHLVGrndTu3z
 pfqt2j9WQW3Jh3ConOjLvqrfftiwR4KvpJFsQeMuSXYEPZnRWvTC/LRBIfiQwkMOtVIO
 0HpZR1lXiTDR/U764IAz9VlmBxITeTlmprIVa0thOUh9fJZ82HsTs+gxvEQEoa/u2iaB
 DVVXdL4n3Zx0BNLsWbs/HN9lXzXQ8oFv3Pe8DsooVeGkmXDs/5rMqx2REdvU9BSWVfOG
 w4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=p614Yn9pYByJ8dTPq0j5fmlQHGdXVf6p9Jpw4u2AfOM=;
 b=TiOrAuBOZEEd4xyDSwUqaffjKlXwGz/K3ladZvWRCsP4XOaG+e2eMlIAdPa6kPVaLc
 oPTnss9nXrD3pdIDKhAwKwBsE/D8ovPHJrdA9kJrzmUSDtm/mjAor4JF8FHzKkdY24Qh
 VRL0gEzOD2dJhwhK91l8E4JtiF2y6vVKIhNaJh6ZNGU+SKueUjRa8Pgzs4K5GKnmhnqq
 ePTFyoaHnAft4doi/wNp81DfZ+JO0B1FAO0ZV2NROpVT4OfpGYWTGNpAFcaR90GlGckv
 2AMnswHYg3P7Y0nXYiD8zLYGI0VsLEESkQEaxbsfs1c5WbXPiot2ivwULhF9EubYBaiH
 f0Sg==
X-Gm-Message-State: ACrzQf2edK52Uc27sVw3OPcJTTLLWIcQsW8YNHjKxUt2MK2CV+jLGXqY
 dzWHPScyNrRZfld27RXpwiFLOw==
X-Google-Smtp-Source: AMsMyM6w03i150GfQvd8hKEMctOKIhGz4JjXPwrta4dzKW5UjskjfB8D+DVIrvqDuiWItvQt91nruQ==
X-Received: by 2002:a17:906:5d0a:b0:780:3c42:990f with SMTP id
 g10-20020a1709065d0a00b007803c42990fmr17961365ejt.9.1663694150605; 
 Tue, 20 Sep 2022 10:15:50 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a50fe8e000000b0043bbb3535d6sm164518edt.66.2022.09.20.10.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:15:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7B6C71FFC0;
 Tue, 20 Sep 2022 18:15:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 08/30] tests/docker: update and flatten debian-alpha-cross
Date: Tue, 20 Sep 2022 18:15:11 +0100
Message-Id: <20220920171533.1098094-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920171533.1098094-1-alex.bennee@linaro.org>
References: <20220920171533.1098094-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62b.google.com
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

Update to the latest stable Debian. While we are at it flatten into a
single dockerfile. We really don't need the rest of the stuff from
the QEMU base image just to compile test images.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220914155950.804707-9-alex.bennee@linaro.org>

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
2.34.1


