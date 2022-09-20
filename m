Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C93725BF0BC
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:59:43 +0200 (CEST)
Received: from localhost ([::1]:53254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oamDO-00046w-Gq
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oah96-0006AA-1Q
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:34:57 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:33692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oah93-0003b4-Qq
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:34:55 -0400
Received: by mail-ed1-x52c.google.com with SMTP id b35so5003019edf.0
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=iH6jIIlmVr3MkXQmYqy3OgPLmAu7CB0ASJoiLfWhauM=;
 b=Rg5WwlRAL4ife1eiFjvW2tjpV5UtN5/jf+ObdPnbriW8EH3F7zoT4DC+rZhSM7Bt3k
 bQVCsw510+E7E27Ni56wMYKIOO4alpGVNcH2x+og8fPeUlMBxvXsVx0xXNWnnpD5CYZ9
 V2joDiSIsT3nMNkzeDBpU3cWCan+0WZ16yRecf9ZLUQHmd/01V9Bf+LflAynTCVzrKJf
 6wlpEORhztdxbg9m3JSn0qY7qelpMZRF2L3nsJqRLZv34IiGQA34hruYY963LLb1PLwT
 q2m4zP2bM/md/mUy2njkctGDn0jjfa3Xc7go0tjj3CyZdlplmYAsKqI7upyaMiOAyzyx
 rLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=iH6jIIlmVr3MkXQmYqy3OgPLmAu7CB0ASJoiLfWhauM=;
 b=su8PxT5sBPvuZindBgj3Fv3Fz7x7xcMmdXbbuWt4B7wU75ZzK06jzrpkD+xRvUuPv1
 joMB/SvDwu/In7fCUagd3vqVj6Jxrpgm1dZaC/jtgGPcS3UC4MCaAqPCun3V/he1nvBg
 P3t4UxDFIi5cw3nZuQWbkW3a5rQ4eWwGmHx0xOuE4GtGMJbkJkCGIZRo6mWUGal2xOjT
 JJ/qe7yrsfFwDP8Qb2+KOEI5qdeIGmCW6k6hG0e7tw35IcCMEP2Xp99kdBiekGzoS48i
 3239avtDrzvyBhfnXJMLUzdFTBnG3bNESfk2YUHo7zg8PZ9JkE/0lrMVg1n9FZMQ6lpd
 X9qA==
X-Gm-Message-State: ACrzQf3ObDTQ/ZkkQicxTD4BTDJ3hc9C/0aPtWYkGc775UD4xORdnz7I
 7VLLewHcVWbci78dZv2J7hzppA==
X-Google-Smtp-Source: AMsMyM7HLMU77avKf2M0lBImQ54btWwQDSEXRfSU5lF2cWZNF9REm030maps+Nhz4dmdS9XsRVHuFg==
X-Received: by 2002:a05:6402:3904:b0:451:f01c:9217 with SMTP id
 fe4-20020a056402390400b00451f01c9217mr20787601edb.78.1663695292101; 
 Tue, 20 Sep 2022 10:34:52 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j18-20020a50ed12000000b0044e7f40c48esm186474eds.62.2022.09.20.10.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:34:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 29D2A1FFC6;
 Tue, 20 Sep 2022 18:15:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 14/30] tests/docker: flatten debian-powerpc-test-cross
Date: Tue, 20 Sep 2022 18:15:17 +0100
Message-Id: <20220920171533.1098094-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920171533.1098094-1-alex.bennee@linaro.org>
References: <20220920171533.1098094-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52c.google.com
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

Flatten into a single dockerfile. We really don't need the rest of the
stuff from the QEMU base image just to compile test images.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220914155950.804707-15-alex.bennee@linaro.org>

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


