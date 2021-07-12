Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C6E3C5C8C
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 14:44:30 +0200 (CEST)
Received: from localhost ([::1]:34980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2vIT-0000P8-6H
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 08:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v7N-0004pS-VY
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:33:01 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:55234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v7M-0002Ke-8c
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:33:01 -0400
Received: by mail-wm1-x333.google.com with SMTP id k32so8086530wms.4
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 05:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N6g7OEJH6E8yVDlIOcjDja7bxAlnLzWd8G8NXFDS/dM=;
 b=ZLxw9izsxl2TDQGGGILtMNIOzeCDeiVVrFOZw13lzbU7ONbF04fLX8KOpUSow7pcVC
 8eDEnBS8yOwWfsnhyR5Zbvy93v473VN09XAEIELeTXLZQeK3NJZj91KlsofcLDn+f+IW
 VRUQLdspsjhddSJ8TOxQGxNAKbjGersP6bfFUE569IFEKHzvLXJ2RII/uzkrC5UNELJ9
 ++fno+VfM8qDo9M8A+JoU/6lQ861PuejLlUYpTRWhChuebVqqwUfZV6NB5hFY+b5PXNL
 yxWBlrnx+E9SmUB1XdzCScVeMqHbhLnVQVEPQ4VR4bTyJvgosKBd/4cTuwLLwjl/dG6O
 zvfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N6g7OEJH6E8yVDlIOcjDja7bxAlnLzWd8G8NXFDS/dM=;
 b=DP972jh3ctMdgx3DNaXG2V7DS6iV8aFUoUrd8/tMhkIa8jq2IyNuuV98jZi7gxNflM
 RPP0svqithrKdNMHLy/ZhPa/eH5S61IyQG2fAhQRqjY5XRHOnvRmEqMrbHwsIDfNo7iX
 GJNhaYvLZlaTEg5IeJMpNgRQhh6RFTVPo5j597o7ENlN1fqN+Y0Dsr9WSSoY9IEjFsE4
 VbNQ6ZjS7dVqvaZpEzxS9pNsrvfW8Twt6xh0himGiDUgPZ5YC4ocfOmzh1+6heqVsOrk
 g5baQYI05bcKE8V7dvCB49YT2yWydnIfFja20Fd97jxCESIqGWdhxhg61j728D8x6FEc
 2KOQ==
X-Gm-Message-State: AOAM5332ycx+w9ITkEUvGTy4S8Ds2mBSN5kCDWfEra/tSCuEILQWCDMh
 jL6M8L2qVInRUdQxv4nuu6dBjk4z4IkJmw==
X-Google-Smtp-Source: ABdhPJyRv8EihqrqDFwuaVSzvDXu+jGkylXcJIw1M8bd/Qsned5cojlO0ejvLZhiB9idQBxmHP553w==
X-Received: by 2002:a05:600c:2f17:: with SMTP id
 r23mr4755081wmn.39.1626093178962; 
 Mon, 12 Jul 2021 05:32:58 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g3sm14570769wrv.64.2021.07.12.05.32.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 05:32:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 392701FFAC;
 Mon, 12 Jul 2021 13:26:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 22/40] tests/docker: expand ubuntu2004 package list
Date: Mon, 12 Jul 2021 13:26:35 +0100
Message-Id: <20210712122653.11354-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210712122653.11354-1-alex.bennee@linaro.org>
References: <20210712122653.11354-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

This is the fully expanded list of build pre-requisites QEMU can
conceivably use in any scenario.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623142245.307776-15-berrange@redhat.com>
Message-Id: <20210709143005.1554-23-alex.bennee@linaro.org>

diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 25f56adfb2..39de63d012 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -1,25 +1,44 @@
 FROM docker.io/library/ubuntu:20.04
 ENV PACKAGES \
+    bc \
     bsdmainutils \
+    bzip2 \
+    ca-certificates \
     ccache \
     clang \
+    dbus \
+    debianutils \
+    diffutils \
+    exuberant-ctags \
+    findutils \
+    g++ \
     gcc \
     gcovr \
     genisoimage \
     gettext \
     git \
+    hostname \
     libaio-dev \
+    libasan5 \
+    libasound2-dev \
     libattr1-dev \
     libbrlapi-dev \
     libbz2-dev \
+    libc6-dev \
     libcacard-dev \
     libcap-ng-dev \
+    libcapstone-dev \
     libcurl4-gnutls-dev \
+    libdaxctl-dev \
     libdrm-dev \
     libepoxy-dev \
     libfdt-dev \
     libffi-dev \
     libgbm-dev \
+    libgcrypt20-dev \
+    libglib2.0-dev \
+    libglusterfs-dev \
+    libgnutls28-dev \
     libgtk-3-dev \
     libibverbs-dev \
     libiscsi-dev \
@@ -30,39 +49,66 @@ ENV PACKAGES \
     libncursesw5-dev \
     libnfs-dev \
     libnuma-dev \
+    libpam0g-dev \
     libpixman-1-dev \
+    libpmem-dev \
+    libpng-dev \
+    libpulse-dev \
     librbd-dev \
     librdmacm-dev \
     libsasl2-dev \
     libsdl2-dev \
+    libsdl2-image-dev \
     libseccomp-dev \
     libslirp-dev \
     libsnappy-dev \
     libspice-protocol-dev \
     libspice-server-dev \
     libssh-dev \
+    libsystemd-dev \
+    libtasn1-6-dev \
+    libtest-harness-perl \
+    libubsan1 \
+    libudev-dev \
     libusb-1.0-0-dev \
     libusbredirhost-dev \
     libvdeplug-dev \
+    libvirglrenderer-dev \
     libvte-2.91-dev \
     libxen-dev \
+    libxml2-dev \
     libzstd-dev \
+    llvm \
+    locales \
     make \
+    multipath-tools \
     ncat \
+    nettle-dev \
     ninja-build \
+    openssh-client \
+    perl-base \
+    pkgconf \
+    python3 \
     python3-numpy \
     python3-opencv \
-    python3-pil \
+    python3-pillow \
     python3-pip \
+    python3-setuptools \
     python3-sphinx \
     python3-sphinx-rtd-theme \
     python3-venv \
+    python3-wheel \
     python3-yaml \
     rpm2cpio \
+    sed \
     sparse \
+    systemtap-sdt-dev \
+    tar \
     tesseract-ocr \
     tesseract-ocr-eng \
-    xfslibs-dev
+    texinfo \
+    xfslibs-dev \
+    zlib1g-dev
 RUN apt-get update && \
     DEBIAN_FRONTEND=noninteractive apt-get -y install $PACKAGES
 RUN dpkg -l $PACKAGES | sort > /packages.txt
-- 
2.20.1


