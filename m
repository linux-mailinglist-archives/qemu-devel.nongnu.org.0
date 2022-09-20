Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E38035BEF76
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 23:57:01 +0200 (CEST)
Received: from localhost ([::1]:50052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oalEj-0003EC-1x
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 17:57:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagqm-0000cX-Ld
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:16:02 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:44713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagql-0000jE-1L
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:16:00 -0400
Received: by mail-ed1-x52a.google.com with SMTP id x94so4800599ede.11
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=oHx+ujubQ51Z4+UiDF4O14qPW1hIAG2/bzHjOZXayMc=;
 b=S3cBc+06GDtSDcYz6l2KzUYM/8pGG/ljlsyHCpuxaAwWg6R4l9I6p3vhUF4rAeO/wh
 2/w1pW11j4imFXXvu1Fblf3+Qj82ZCz72mvVW5Au7HykWj1Y4AQgO6qAZHWYKszU1UJ6
 MY6SOXLkLXlW+0kBIFdL6XQeVfQFvj9KLMKfx4Pk+xqrVYCFS5uAMmRLd3B0ANpHo82M
 igg9ndvIkkXWQe1HbM7Ll4JXuYvrJdVlwwOSa3Rgb41PzZAkW9mWS46HJ/qgXFt6hRTH
 XUm/DakQ5XT/8Q8CN4k8KNOj7mwmlj2bVDNYLvX8qtRovsGzjU5fgikQpOrHkv3AzHID
 xWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=oHx+ujubQ51Z4+UiDF4O14qPW1hIAG2/bzHjOZXayMc=;
 b=EUQcZriMO4rF2Sv+3kFQ9n8gWlaOnucL5CncxgCB5HuovuAZqz+ty0AZ1raXyCsm11
 fU9Tp2YZKGczxQxp3ybB7EOy17qYCNPnzj1Zz28Zr+rnpM7mvQwyud/uoCjYDYaLs+Q7
 yXEGJ5oV1PhhZOvcjdHUN0MxnTAFycColFmOvnaNOCRNu/0/lE9421qAt0li9FmpusYM
 l2Bg5eTA9Drtr1nEK66cGtjBIN2BOVpCnKVMOqwcwJtbwIeyFQzRrAaOEwz2EkZmZS5k
 9ZF2rBrfqCS//DTAZOg/dd3NqkF2+WRKlfER0yipNXtQ9M1SAxOUR307kF1m6cB9yGC3
 34gg==
X-Gm-Message-State: ACrzQf0RSXqGrEKlJ+Fn4taTUlSTZT60a5TMdtqX8T1LVYy6ZA6sMfo9
 HsRgcCZHZYdGZ41GByRO8vOCzQ==
X-Google-Smtp-Source: AMsMyM6Aqg1ovY2s8PIbOGxd35ZG1ejVbyD1kzla26vuecW+GAtGAjPLL/B1UmmeeBsKQ38gHjB0tg==
X-Received: by 2002:a05:6402:3550:b0:451:473a:5ca3 with SMTP id
 f16-20020a056402355000b00451473a5ca3mr21171346edd.48.1663694157660; 
 Tue, 20 Sep 2022 10:15:57 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 25-20020a170906319900b0073ae9ba9ba8sm205943ejy.3.2022.09.20.10.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:15:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AFD051FFC2;
 Tue, 20 Sep 2022 18:15:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 10/30] tests/docker: update and flatten debian-m68k-cross
Date: Tue, 20 Sep 2022 18:15:13 +0100
Message-Id: <20220920171533.1098094-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920171533.1098094-1-alex.bennee@linaro.org>
References: <20220920171533.1098094-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52a.google.com
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
Message-Id: <20220914155950.804707-11-alex.bennee@linaro.org>

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


