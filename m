Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D6A5B8D0F
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 18:31:10 +0200 (CEST)
Received: from localhost ([::1]:42062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYVI4-0000He-Og
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 12:31:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUnx-0006ac-FR
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:00:01 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:33783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUnv-0002mB-73
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:00:01 -0400
Received: by mail-wr1-x42c.google.com with SMTP id k9so26487989wri.0
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 08:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=3e20V6KO3fnSe6hV5y58MKOdP3MKisUIItuiv04/Bkk=;
 b=wov5x4qyCV9JC18Yg46LbF8lwsWAkuXWB0zHtJ+DZOgh5LcDA4lJIZSlZMXGvutjT6
 bRDymU17TIcdxpCX6PYQPnvzkUeJfOXb8oauFnbJbSzbmn2dr0i8XVfhJF8lNB8zNsTf
 ZA+aTel1ns3n+ov6S5iC86Z0bhyuqIR8ndo71UCeAG7bjAcq38WrSHRxYBhfzV6DVn+f
 JaNnpsr+0nMG89InvIt+VItIznViiIya3r+HQCXsSU+x2so+2bYYgvFtz6et0UP2bimj
 45+rssD5mB6RYdq46xVQEACDFE5s0nmDbQN3FBOjxwp6Y9ogHzz8gR9bF1/e9jAwAW+t
 JWCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=3e20V6KO3fnSe6hV5y58MKOdP3MKisUIItuiv04/Bkk=;
 b=Vjqwd27EcIJyLeyfHKw/gYMohdcviCaJHP20Ty4cEj3UOfCuSs6fONpZkUEtsn6jrZ
 VX4wjvdYlCY0lQyrpGY6pQQaknNEkfl9rDMX6PIqmvbrgOkYwkdA8mRw4SJvadSLk5OO
 elyjJKcdQP6L8Gk1kBRUYrC5e9IlONuamigzt3QkU1Ok7DK1T6ORomPvpmNblZj/mwd5
 LHon0cdRqvPTe/P98Fol0FbamHlF///zg0E9zwnb7Rnjqi3J33t7Q1UopufVtkmCwRvd
 Slxvj2tH6AaNGWO5qwabUNOhD9IqU4S8RtUKMKoIbKiuk/WrM8Tqwee3DLvr8O73RSiI
 e6Tw==
X-Gm-Message-State: ACgBeo3nhR/f9xHES2sMCxB3rpfR73XlER68thqeLYslNvkxLPZUpKtX
 a/MjQd8dFIX+0ZOn89kdg+phRg==
X-Google-Smtp-Source: AA6agR4h5fh24RWaqsqr9QW/sfy2i/urZrch7tTvmiadmXPN/ALaOcx0saC96RX2w9mS60/SFl7eSg==
X-Received: by 2002:a05:6000:1683:b0:22a:53cd:39cd with SMTP id
 y3-20020a056000168300b0022a53cd39cdmr12606577wrd.55.1663171198465; 
 Wed, 14 Sep 2022 08:59:58 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t17-20020a5d5351000000b0022abcc1e3cesm6013027wrv.116.2022.09.14.08.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 08:59:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9B0161FFC6;
 Wed, 14 Sep 2022 16:59:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v2 14/30] tests/docker: flatten debian-powerpc-test-cross
Date: Wed, 14 Sep 2022 16:59:34 +0100
Message-Id: <20220914155950.804707-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914155950.804707-1-alex.bennee@linaro.org>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
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
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220826172128.353798-10-alex.bennee@linaro.org>
---
 .gitlab-ci.d/container-cross.yml                     |  1 -
 tests/docker/Makefile.include                        |  1 -
 .../dockerfiles/debian-powerpc-test-cross.docker     | 12 +++++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index db0ea15d0d..67bbf19a27 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -102,7 +102,6 @@ mipsel-debian-cross-container:
 powerpc-test-cross-container:
   extends: .container_job_template
   stage: containers
-  needs: ['amd64-debian11-container']
   variables:
     NAME: debian-powerpc-test-cross
 
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 8828b6b8fa..e034eca3af 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -137,7 +137,6 @@ docker-image-debian-all-test-cross: docker-image-debian10
 docker-image-debian-loongarch-cross: docker-image-debian11
 docker-image-debian-microblaze-cross: docker-image-debian10
 docker-image-debian-nios2-cross: docker-image-debian10
-docker-image-debian-powerpc-test-cross: docker-image-debian11
 docker-image-debian-riscv64-test-cross: docker-image-debian11
 
 # These images may be good enough for building tests but not for test builds
diff --git a/tests/docker/dockerfiles/debian-powerpc-test-cross.docker b/tests/docker/dockerfiles/debian-powerpc-test-cross.docker
index 36b336f709..d6b2909cc4 100644
--- a/tests/docker/dockerfiles/debian-powerpc-test-cross.docker
+++ b/tests/docker/dockerfiles/debian-powerpc-test-cross.docker
@@ -1,13 +1,15 @@
 #
 # Docker powerpc/ppc64/ppc64le cross-compiler target
 #
-# This docker target builds on the debian Bullseye base image.
+# This docker target builds on the Debian Bullseye base image.
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
         gcc-powerpc-linux-gnu \
         libc6-dev-powerpc-cross \
         gcc-10-powerpc64-linux-gnu \
-- 
2.34.1


