Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D175BF018
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:30:47 +0200 (CEST)
Received: from localhost ([::1]:51840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oallO-0005yt-CU
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:30:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagzf-00067K-Jv
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:11 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:41496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagzX-0001o2-Cu
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:11 -0400
Received: by mail-ej1-x633.google.com with SMTP id hy2so4166001ejc.8
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=FXHDHf2ajcZm8Hn3yqqDo1FsuNZsNVS58iHbQW1B8lg=;
 b=uasT/0IghVPSiiE0CTdk53isKJpWCKYiBNhkrfp18QcYWC3R6w9WLacqTTx2CpUOY8
 +P/OULH7OdysozvyJ2o7hh0OKUuIu8yq0/1xo9YWtYeJhKxjJxJLuI58PhhiJ/6uZBS8
 6AXxQRnLCa1TqGpPHfFMbDPQ1tnu1fpi2nzycmt8pE6KlwAN5/LkfDtbzhfOLd3m+Gu9
 yQxUqCT15WoDnjZgbERj/u7RQvUFvgSmQEgPhJjnkaj4q4ZVaV7SUHE5nxCTXjWakF8H
 l9kLVVh7Rd7fB0sfcoALGgz4BZaueDMFlJlVCEtA4CFZJLiykl3WYtUi5bBopwTdLrks
 0fBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=FXHDHf2ajcZm8Hn3yqqDo1FsuNZsNVS58iHbQW1B8lg=;
 b=zzPbheAxLYFAmZknBho+krl9wL3JMeO+MeajETjo3DFgfUdcMDyEH07+BCexq6AcJQ
 JyEZq28QT5oa4wHdJsrv0HhGXmQDyJWEmv8t+D+kcUNFFR0u56Is/sx0sgMfWTx4zg3x
 LudKfvha0ZIBSYLoZESundTsRBpSXVypyyUHcTGOMcY1fhrEHQNAP+LneyaE2bBSeOFW
 e0v5d1dZDOnWbE0fsQUUFJE6uLFqsSGDqNzTvOYEmfYM16o13SmP+WKnAzS5fa/0Hbaf
 Choo52IKMw0LqN2/1EfGaY67+aE2WCoAVOnh9jycHWcTCAuaOPVQES8vzzC1xucytJEw
 igJA==
X-Gm-Message-State: ACrzQf3q4q/42P9jFYEUjgKOzhS2n4vHApItRvnxpUvJChdAT4fzU+/o
 TKB/ELKgdM7kbJr/Cw/hC+fEIA==
X-Google-Smtp-Source: AMsMyM5AXyMz4duTVMX5/zG0O764evzxldO69VoRYhwSQyn6xr9Nm3MgKK0M3WcyV6erlstzeaJYZg==
X-Received: by 2002:a17:907:782:b0:740:7120:c6e7 with SMTP id
 xd2-20020a170907078200b007407120c6e7mr17883091ejb.313.1663694702621; 
 Tue, 20 Sep 2022 10:25:02 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a170906b08d00b0073dbfd33a8dsm194321ejy.21.2022.09.20.10.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:24:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B44891FFD3;
 Tue, 20 Sep 2022 18:15:36 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 28/30] tests/docker: update and flatten debian-toolchain
Date: Tue, 20 Sep 2022 18:15:31 +0100
Message-Id: <20220920171533.1098094-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920171533.1098094-1-alex.bennee@linaro.org>
References: <20220920171533.1098094-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x633.google.com
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
single dockerfile as we do not need anything from the base image to
build the toolchain. This is used to build both the nios and
microblaze toolchains.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220914155950.804707-29-alex.bennee@linaro.org>

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 1d5a6f1fb4..a3174346da 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -127,10 +127,6 @@ docker-image-debian-nios2-cross: $(DOCKER_FILES_DIR)/debian-toolchain.docker \
     $(DOCKER_FILES_DIR)/debian-nios2-cross.d/build-toolchain.sh
 	$(call debian-toolchain, $@)
 
-# Specialist build images, sometimes very limited tools
-docker-image-debian-microblaze-cross: docker-image-debian10
-docker-image-debian-nios2-cross: docker-image-debian10
-
 # These images may be good enough for building tests but not for test builds
 DOCKER_PARTIAL_IMAGES += debian-alpha-cross
 DOCKER_PARTIAL_IMAGES += debian-powerpc-test-cross
diff --git a/tests/docker/dockerfiles/debian-toolchain.docker b/tests/docker/dockerfiles/debian-toolchain.docker
index 738d808aa6..d3d4d3344e 100644
--- a/tests/docker/dockerfiles/debian-toolchain.docker
+++ b/tests/docker/dockerfiles/debian-toolchain.docker
@@ -4,7 +4,7 @@
 # This dockerfile is used for building a cross-compiler toolchain.
 # The script for building the toolchain is supplied via extra-files.
 #
-FROM qemu/debian10
+FROM docker.io/library/debian:11-slim
 
 # Install build utilities for building gcc and glibc.
 # ??? The build-dep isn't working, missing a number of
@@ -15,6 +15,7 @@ RUN apt update && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
     apt install -y --no-install-recommends \
         bison \
+        ca-certificates \
         flex \
         gawk \
         libmpc-dev \
@@ -32,5 +33,5 @@ RUN cd /root && ./build-toolchain.sh
 # Throw away the extra toolchain build deps, the downloaded source,
 # and the build trees by restoring the original debian10 image,
 # then copying the built toolchain from stage 0.
-FROM qemu/debian10
+FROM docker.io/library/debian:bullseye-slim
 COPY --from=0 /usr/local /usr/local
-- 
2.34.1


