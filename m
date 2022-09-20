Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA775BEF94
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:03:51 +0200 (CEST)
Received: from localhost ([::1]:58468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oalLK-0006rk-8o
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagzU-0005lQ-RL
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:00 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:46079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagzT-0001oJ-45
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:00 -0400
Received: by mail-ej1-x629.google.com with SMTP id dv25so7763641ejb.12
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=86511PSfGdIpDAhzbaIAt+hVhHMNAndvtnlB7exVR9w=;
 b=FeXkXDhiHPneC5ptzqU6g2uP3EriIx+Z+e7Gn5cdYqWcHShvjN4WjjTVOh7hAigYD/
 viW7NTh77rqSZB5G1J4hAHmYC2nIVCiHsUrv2W0f3cPIt0zNrLTIcg6Cx8/zbiUjSupb
 oxnHzTKUDwWONWO2NIqz+qVxxUIRSSgsNpvzwksKFsBv3hK9vPG1h+QDFKypqiE1Xdjx
 LbUyfvLeESqp5MPfvrLZQOTbZdCxhgDi0yPkV4+y1kx38zKrwVYDdZ7B/GlaOMiZ34r2
 Z9EfV2hvvpttENusM7DnKhZ4jOM/VbbcHwzBTesbnZF8CuuPMBHPYu7kpfK79NbfujcJ
 bKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=86511PSfGdIpDAhzbaIAt+hVhHMNAndvtnlB7exVR9w=;
 b=cokmBwA0ABVzftPBP80e13Z+WdeNI42LFNRXykpjKig8UZBYtDmTcf3m8bv7vQE6qT
 7vZxjefGEpU62yAv2rELOA7VLIrttDIxygfaR/dd7PsjDzsu9RkUEFBH3IQJB17OXidz
 dIToAf3yDp4483tNAz6OE7uBfN5niL/CgMkk4Gxl1pJ3nhZ8cyRNxlYS98CAwPxExvbu
 2xr/LwwRdF7EM6udhyF7h9rBoe6CV5uLTYH2xmGJwn6cIi3a6WInW788SEkYn1kzf1/L
 Hr5nJxC3goB9AxOyldVG9QEMPxhR5NOdwZZLkKlAnMUJo1g4yYmId3ND6g/EJulgSrtX
 s7Bw==
X-Gm-Message-State: ACrzQf1ODzEslXgHbDpQSYPjrqJHYnTS27JvRoXmZntmH5iYEiA/ENDd
 9aSMogWc8gqglkUeN+2StDZNAcSqDbVc7g==
X-Google-Smtp-Source: AMsMyM6sMk/jviBHxIi6OW6qOAX9yRlxUHd3xe/zaUZ2pRL6jdqntapQQKQUMfzWPIl+92B920LIFw==
X-Received: by 2002:a17:907:7baa:b0:779:a71a:c8cf with SMTP id
 ne42-20020a1709077baa00b00779a71ac8cfmr17755188ejc.126.1663694697722; 
 Tue, 20 Sep 2022 10:24:57 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 b11-20020a170906194b00b0072ed9efc9dfsm190653eje.48.2022.09.20.10.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:24:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 426A81FFC7;
 Tue, 20 Sep 2022 18:15:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 15/30] tests/docker: remove tricore qemu/debian10 dependency
Date: Tue, 20 Sep 2022 18:15:18 +0100
Message-Id: <20220920171533.1098094-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920171533.1098094-1-alex.bennee@linaro.org>
References: <20220920171533.1098094-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x629.google.com
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

We missed removing this dependency when we flattened the build.

Fixes: 39ce923732 (gitlab: enable a very minimal build with the tricore container)
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220914155950.804707-16-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index 67bbf19a27..611c6c0b39 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -148,7 +148,6 @@ sparc64-debian-cross-container:
 tricore-debian-cross-container:
   extends: .container_job_template
   stage: containers
-  needs: ['amd64-debian10-container']
   variables:
     NAME: debian-tricore-cross
 
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index e034eca3af..5c9398bbc9 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -132,7 +132,6 @@ docker-image-debian-nios2-cross: $(DOCKER_FILES_DIR)/debian-toolchain.docker \
 	$(call debian-toolchain, $@)
 
 # Specialist build images, sometimes very limited tools
-docker-image-debian-tricore-cross: docker-image-debian10
 docker-image-debian-all-test-cross: docker-image-debian10
 docker-image-debian-loongarch-cross: docker-image-debian11
 docker-image-debian-microblaze-cross: docker-image-debian10
-- 
2.34.1


