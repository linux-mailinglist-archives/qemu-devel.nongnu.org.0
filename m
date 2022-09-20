Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 212B15BEF5C
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 23:49:17 +0200 (CEST)
Received: from localhost ([::1]:43986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oal7D-0004Pb-6R
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 17:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagzQ-0005fT-0O
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:24:56 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:45568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagzO-0001nE-8U
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:24:55 -0400
Received: by mail-ej1-x62c.google.com with SMTP id dv25so7763065ejb.12
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=lGP32FeNcGkLN1t0VFLZXvScNyvJq9qr7BUy9LY4/aQ=;
 b=E4mDEK+OKb7Wre34iiO/oJwScIXh4aML9KfAm/ef3LeftSxfV9Jzo98RelgCCslG3U
 yDQcJ3bKH1J8zMSjXkfYv8X5+loykC/yNp/BPyc+WwjzbQooBWgNkC5BOr0WQKItJK55
 TrPJqjeVDsv3aR540HXhtuNAw9c0DuH+RlzscOxgV5WJtZYJqoztM1/aCLxRJK0D+b22
 3kvtKVjZxqF44xB4fdpdtGAThBGnpsNHIzMNiMneuu6FRez9yECTzCpfNdeRa4fM5wrU
 22wqX3Rr8sdBod7MWp/etW7zH319kMVahqrdTPFprB2pU5K2mj2rqN+uVjJawxS5pLfe
 haYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=lGP32FeNcGkLN1t0VFLZXvScNyvJq9qr7BUy9LY4/aQ=;
 b=8JcdgLPHSablNSXq300bvS4f5bRKLuNuttZ0P+gxjva9/7gBeYe1yRRU11fjlKV/HK
 6YvHVt3meH1VIudGxgn2u1PCWoYNdvxcLh13fg8NhVyvj2rc24f31yDa/tpbcC6xxgNT
 WN8jI8UHx+3NZePgVC8Vr4b6cGXGArfOtPHIa2j5lb8ETGBYmjR0ZAZGyzd9om6omZbv
 9ankd4+8L3WtU8TzdIJOutjjQe6sPmBfBpFxYSP1pSEa2HRu0BXkzhOkUfV0KJnX2IU8
 iL/4pX90K1gmH1/VwmJ4dStW8pprSVizaqNJlDRLqCYK37Lh95WMxuxOMpXTXHjbhXL3
 8RwA==
X-Gm-Message-State: ACrzQf09tSPnuxBef/klXWLG+Zr1pvJROp+EOgL1CFZeILqTsluL07at
 TB82NAvrSmiUfskhWiz4gj2k6g==
X-Google-Smtp-Source: AMsMyM5VheRKmEnKy0rXFvgIll2MC3RUcQZ+x2Ki8UiLecJdUakXU6FIfixtpY3kxUx+eTmF5KCSeg==
X-Received: by 2002:a17:907:a043:b0:781:293d:ea89 with SMTP id
 gz3-20020a170907a04300b00781293dea89mr10321826ejc.461.1663694692535; 
 Tue, 20 Sep 2022 10:24:52 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 ec42-20020a0564020d6a00b0045393e56488sm200375edb.58.2022.09.20.10.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:24:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0DD361FFC5;
 Tue, 20 Sep 2022 18:15:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 13/30] tests/docker: update and flatten debian-sparc64-cross
Date: Tue, 20 Sep 2022 18:15:16 +0100
Message-Id: <20220920171533.1098094-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920171533.1098094-1-alex.bennee@linaro.org>
References: <20220920171533.1098094-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62c.google.com
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
Message-Id: <20220914155950.804707-14-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index 8a611fc824..db0ea15d0d 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -143,7 +143,6 @@ sh4-debian-cross-container:
 sparc64-debian-cross-container:
   extends: .container_job_template
   stage: containers
-  needs: ['amd64-debian10-container']
   variables:
     NAME: debian-sparc64-cross
 
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 37c4ea913f..8828b6b8fa 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -89,7 +89,6 @@ DOCKER_PARTIAL_IMAGES += fedora
 endif
 
 docker-image-debian-mips-cross: docker-image-debian10
-docker-image-debian-sparc64-cross: docker-image-debian10
 
 # The native build should never use the registry
 docker-image-debian-native: DOCKER_REGISTRY=
diff --git a/tests/docker/dockerfiles/debian-sparc64-cross.docker b/tests/docker/dockerfiles/debian-sparc64-cross.docker
index f4bb9b561c..8d3d306bc1 100644
--- a/tests/docker/dockerfiles/debian-sparc64-cross.docker
+++ b/tests/docker/dockerfiles/debian-sparc64-cross.docker
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
         gcc-sparc64-linux-gnu \
         libc6-dev-sparc64-cross
-- 
2.34.1


