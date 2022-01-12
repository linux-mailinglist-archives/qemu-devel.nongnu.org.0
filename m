Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C8548C39A
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 12:56:06 +0100 (CET)
Received: from localhost ([::1]:39858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7cEX-0003y3-Kj
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 06:56:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bnM-00037P-Ow
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:28:00 -0500
Received: from [2607:f8b0:4864:20::934] (port=42604
 helo=mail-ua1-x934.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bnK-0003Rg-LO
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:27:59 -0500
Received: by mail-ua1-x934.google.com with SMTP id p1so4065119uap.9
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 03:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tl2jfIhWkg+f/BATAZzs8Wm6cLVk0HsdmqCAU0+a2q4=;
 b=TmsxWdp4RZ6FsJ6JPuUNUtVHfMWZD4eakZc1uSogpJGXIGB1RJP+eckxhLN/vAqhEQ
 otXgj3Yc/baS4mzhRXGZELgD8VxvSegJzXOLWmWEUZ3HRtaLqGQlZCP9qwNvU4TvFyq5
 aBUhzgXNHBBN//fwPxkLBxqZQ8ry05sNH0OVNxk6653l3LF/vkOIX/mh6Mh4zkjWBw7f
 x+l//qvVmyKDoZJ5CEmvCnp3XtckyJZ7tEELHIYeAIw6NlZN/4A1h/ugVmLz88aLwYeA
 qMwQyImQce1cRYx3qLhiRz+rTRitU4xYWMi92Y1tg5kAJw0ZG/iqnVeOS8YOngSFksCO
 W2wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tl2jfIhWkg+f/BATAZzs8Wm6cLVk0HsdmqCAU0+a2q4=;
 b=2GmOw31rGT45y7R6NSLdRiRXhTo3iL/hQ1wkCHFWfI+WcnyXqPOLpNKXelnNkUIbpz
 mlIHhNtzOpCFXbo4GJ2iMdgNkI9dK6D7HeDS9JXBzaAfwzo0g1XP8T0DXz5QnOHu1xNm
 pSXw6DunBs65cTsX0ij6AFZKXbYvvDDjdpDvLi851fiR6k/J5CajzdybOadYARL+ibcF
 m09gUFSVLw8Bf4qfVReod8mCH1kNqfxi8qqk5laG3NdEfLqsUEEBWsO3Ei5VMDw+hLTn
 QlJnsPdrNF9XNM8yyNdARFa0vwNPabh3H4m884ItdbJEGgY3BPcpXVMvbhIFE59TgcRH
 oLJA==
X-Gm-Message-State: AOAM533zCguISmxrQAtPRf5mFhwtLwq6e0gdXpkNY6qNNz7gj72n37Fj
 0QZE7vytcNM2IFzBn2PGJlo5sg==
X-Google-Smtp-Source: ABdhPJzYNVPYsdthw2IYkfwajRRm6Ey127yzY0X1nSm2P7+TBtJkf4fkvpmF0Um3t7Y85ZCGBdBUAA==
X-Received: by 2002:a67:b90a:: with SMTP id q10mr3854528vsn.35.1641986877821; 
 Wed, 12 Jan 2022 03:27:57 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u124sm167018vkg.3.2022.01.12.03.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 03:27:45 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A2FFD1FFC7;
 Wed, 12 Jan 2022 11:27:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 15/31] tests/docker: updates to alpine package list
Date: Wed, 12 Jan 2022 11:27:06 +0000
Message-Id: <20220112112722.3641051-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220112112722.3641051-1-alex.bennee@linaro.org>
References: <20220112112722.3641051-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::934
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::934;
 envelope-from=alex.bennee@linaro.org; helo=mail-ua1-x934.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

Cleanup the package lists by removing some entries that we don't need to
directly reference

  binutils: implied by the compiler toolchain
  coreutils: not required by QEMU build
  mesa-egl mesa-gbm: implied by mesa-dev
  ninja: alias for samurai package
  shadow: not required by QEMU build
  util-linux-dev: not directly required by QEMU build

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211215141949.3512719-16-berrange@redhat.com>
Message-Id: <20220105135009.1584676-16-alex.bennee@linaro.org>

diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index 7e6997e301..5a1808726e 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -8,9 +8,7 @@ RUN apk upgrade
 ENV PACKAGES \
 	alsa-lib-dev \
 	bash \
-	binutils \
 	ccache \
-	coreutils \
 	curl-dev \
 	g++ \
 	gcc \
@@ -33,22 +31,18 @@ ENV PACKAGES \
 	lzo-dev \
 	make \
 	mesa-dev \
-	mesa-egl \
-	mesa-gbm \
 	meson \
 	ncurses-dev \
-	ninja \
 	perl \
 	pulseaudio-dev \
 	python3 \
 	py3-sphinx \
 	py3-sphinx_rtd_theme \
-	shadow \
+	samurai \
 	snappy-dev \
 	spice-dev \
 	texinfo \
 	usbredir-dev \
-	util-linux-dev \
 	vde2-dev \
 	virglrenderer-dev \
 	vte3-dev \
-- 
2.30.2


