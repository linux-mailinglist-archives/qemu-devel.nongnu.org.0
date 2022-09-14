Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F37E5B8D7B
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 18:48:17 +0200 (CEST)
Received: from localhost ([::1]:54808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYVYe-0001Qk-9S
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 12:48:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUu1-0001Sc-Ow
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:06:19 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUty-0003r1-Ft
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:06:16 -0400
Received: by mail-wr1-x430.google.com with SMTP id cc5so16625989wrb.6
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 09:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=3C+bQmjL1wvLGpweQJ8MbVcrOXpM16i/PFvvqaa7Mdk=;
 b=GZnXILYSVnHBWlvYtIjiTfDOVlv6LEoA6ErLaL9QDKH23GcxisWCLbYq7xYGLlR+4r
 zfglzjcir78pjU/oN8hE3SL+EdYZ5vJSAAyIefSMKCO6Ol2tgYjrYt/ZNLBIBVgiANXN
 xSAEOuxBZSkHTuS+YN+T46v3MVK4A9h8pkST1qtAYCz6vQCVjUiQUcK4rtnbkQ9UaJBA
 VWScw+w9XMUMI9jGu/GkZexHHA+RgsDfksKZY+OhTnvL9wng7NrIxYlUv2Fl42BEKZ58
 AhG5vWVbldYA3QJPe2U1jqJ36ttBK0dQPjuJqZY6e8tYi3ziSgu1Q6aHJSjVL1frtumX
 /iNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=3C+bQmjL1wvLGpweQJ8MbVcrOXpM16i/PFvvqaa7Mdk=;
 b=RkGvq5Cw3bWqGJbSc/Fg+E0LvKnPDPEKe7RebdGYEKYh7boQtab3cZRbANH+74pMA2
 OCPClkivcky0NTf/5OOy75u3mLTwEWw4qujNDAXXq8oNMMdGzMuOmRZTemDpuoKQJivB
 lJE98RzCrAZh5a6OFtK/+wEW0aPpYp+3d0ZJ3D2j+ANS+bP2s1q9CpW1DBEhhdyU0sUH
 z7Y3TAgCtlRQ8HDha9vZdR/RX+f7DCVGAIFRtoNhmpXJ2L6LmW8PT+KQ3ktqrG+RAdAb
 KqbMalaBu1eMgfTAjDiO6sIHgS9SueV5NxWPfd6FnQv7uepaXaKxmNrAs28HNJVe/UuN
 kFKg==
X-Gm-Message-State: ACgBeo04vBhjLJge5jW09CgNeacovBVmQEnvkrK+CNDdwOUBQspS83AH
 KaqrrFvxI79Zi2FhczOxmv+WwoL1OHMBl27x
X-Google-Smtp-Source: AA6agR4QYRvAnwX0T9dEohL2bvYh7UUv0TOgUxe7XjF2s9Obe+TlCEKB81eAbpYNNHAkPG0m1TuIHQ==
X-Received: by 2002:a5d:4534:0:b0:228:a411:1145 with SMTP id
 j20-20020a5d4534000000b00228a4111145mr20915268wra.222.1663171572657; 
 Wed, 14 Sep 2022 09:06:12 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m3-20020adfe0c3000000b00228d6bc8450sm16585300wri.108.2022.09.14.09.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 09:06:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B65471FFBA;
 Wed, 14 Sep 2022 16:59:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v2 26/30] tests/docker: update and flatten
 debian-loongarch-cross
Date: Wed, 14 Sep 2022 16:59:46 +0100
Message-Id: <20220914155950.804707-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914155950.804707-1-alex.bennee@linaro.org>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
single dockerfile. We really don't need the rest of the stuff from the
QEMU base image just to compile test images. In this case it is a
binary distribution of the toolchain anyway.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220826172128.353798-21-alex.bennee@linaro.org>

---
v2
  - use debian:11-slim for consistency with the others
---
 tests/docker/Makefile.include                          | 1 -
 tests/docker/dockerfiles/debian-loongarch-cross.docker | 5 ++++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index a0f5109628..1d5a6f1fb4 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -128,7 +128,6 @@ docker-image-debian-nios2-cross: $(DOCKER_FILES_DIR)/debian-toolchain.docker \
 	$(call debian-toolchain, $@)
 
 # Specialist build images, sometimes very limited tools
-docker-image-debian-loongarch-cross: docker-image-debian11
 docker-image-debian-microblaze-cross: docker-image-debian10
 docker-image-debian-nios2-cross: docker-image-debian10
 
diff --git a/tests/docker/dockerfiles/debian-loongarch-cross.docker b/tests/docker/dockerfiles/debian-loongarch-cross.docker
index ca2469d2a8..df578da40d 100644
--- a/tests/docker/dockerfiles/debian-loongarch-cross.docker
+++ b/tests/docker/dockerfiles/debian-loongarch-cross.docker
@@ -5,7 +5,10 @@
 # using a prebuilt toolchains for LoongArch64 from:
 # https://github.com/loongson/build-tools/releases
 #
-FROM qemu/debian11
+FROM docker.io/library/debian:11-slim
+
+# Duplicate deb line as deb-src
+RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.list
 
 RUN apt-get update && \
     DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
-- 
2.34.1


