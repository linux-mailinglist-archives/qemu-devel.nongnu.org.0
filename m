Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A98B73C1A45
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 22:03:16 +0200 (CEST)
Received: from localhost ([::1]:43706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1aEt-0002gv-Lm
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 16:03:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZWb-0002ce-O2
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:17:29 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:56189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZWZ-0007Xk-LY
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:17:29 -0400
Received: by mail-wm1-x32d.google.com with SMTP id j34so4761401wms.5
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CFyLbsCarDbcc8xVrNzNM3GtcCMt9zLW6sDCVFExxAQ=;
 b=WGKwUuWcXTrLehDA0jKDg9EtLzNufgHuQ0U+GBAw9MdtxaYgOO4FXWvYseSLF+xc9T
 MxK2dy3fpEg6AvkSbibA69tE6wTw5xhdc58DDFnp0HBBXwuGCEPdq/S+iYEjkr0TM8Zf
 WiTr6jCu+9Tk9x8a3OI9H7681c6tYdOM8scrmNiloJMpeairhMKQQxtM7u8ThUplIWhJ
 VdTiN/lmKQq/v3nz3+YVYuTi7II1CbSxz9zDH1DjaoOf0B0DFngwgYHllvE/pmgspW/T
 b4BHjW1gNi1MkAbjP4Cp/9A0G38WvLmZBb1DlqjjLpM1xw8vBJK88GDJAgcSy0dEPd7C
 iv8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CFyLbsCarDbcc8xVrNzNM3GtcCMt9zLW6sDCVFExxAQ=;
 b=Y6/WS2ietKGznE6QQaS3Hp7Oq34MiQIiketuSZgcdKWHkE6Z6cZOfzARhzpM8ApC32
 8NU0iehAToLwZqNF5XQd5mrYE8BFhuVr8PjZ6FupHxs8m69nN3dbZn3k/dR4VIcQnHzM
 zdnJ5mDNnInQCtlC6KcYL/5iS6TkGIOWaIsE+3/JoJpjX8yqt7iYVuCUrYdSIHJDFGNy
 r4tvE96EO2GKH3BbhCuhJYkdlBtiWMwnAHC0kzKbNl7dX50ejr+5kQBqUWl1EBPT3dYc
 C9mNqTEORRnV56H3iHnDa4FuWBwubBfQnMLQl6myTyH/upEgqhHJsY71eWjur0iD47rc
 PZAA==
X-Gm-Message-State: AOAM532zUec6ylkh0Jr+OsHyl8/2hckDkKF4C1L2WGXs3cZMFmhL9feI
 fkiEgP4NHJN6vCbSTXJQDW3nQg==
X-Google-Smtp-Source: ABdhPJyeqEN6cy8QDAsBNWWAEmU8pV/jkNaMg/zEX8zHPvDWUT1Ful4xMfGsYmzpvK8V0Fi6/iLdbQ==
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr35059439wmh.151.1625771846429; 
 Thu, 08 Jul 2021 12:17:26 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l13sm3119996wrz.34.2021.07.08.12.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 12:17:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A8F7F1FF9C;
 Thu,  8 Jul 2021 20:09:43 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 14/39] tests/docker: fix sorting in package lists
Date: Thu,  8 Jul 2021 20:09:16 +0100
Message-Id: <20210708190941.16980-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708190941.16980-1-alex.bennee@linaro.org>
References: <20210708190941.16980-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, minyihh@uci.edu,
 berrange@redhat.com, kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 robhenry@microsoft.com, Willian Rampazzo <willianr@redhat.com>,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

This will make diffs in later patches clearer.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623142245.307776-7-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/centos8.docker       |  2 +-
 tests/docker/dockerfiles/fedora.docker        |  4 ++--
 tests/docker/dockerfiles/opensuse-leap.docker | 16 ++++++++--------
 tests/docker/dockerfiles/ubuntu1804.docker    |  4 ++--
 tests/docker/dockerfiles/ubuntu2004.docker    |  8 +++++---
 5 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 8f810810f3..ee52305646 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -22,9 +22,9 @@ ENV PACKAGES \
     lzo-devel \
     make \
     mesa-libEGL-devel \
-    nmap-ncat \
     nettle-devel \
     ninja-build \
+    nmap-ncat \
     perl-Test-Harness \
     pixman-devel \
     python36 \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 64a413f5e0..4a0a84eb43 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -2,6 +2,7 @@ FROM registry.fedoraproject.org/fedora:33
 
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
+    SDL2-devel \
     bc \
     brlapi-devel \
     bzip2 \
@@ -79,10 +80,10 @@ ENV PACKAGES \
     mingw64-pixman \
     mingw64-pkg-config \
     mingw64-SDL2 \
-    nmap-ncat \
     ncurses-devel \
     nettle-devel \
     ninja-build \
+    nmap-ncat \
     numactl-devel \
     perl \
     perl-Test-Harness \
@@ -97,7 +98,6 @@ ENV PACKAGES \
     python3-sphinx_rtd_theme \
     python3-virtualenv \
     rdma-core-devel \
-    SDL2-devel \
     snappy-devel \
     sparse \
     spice-server-devel \
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index 7ebff1b3a8..6011447181 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -9,46 +9,46 @@ ENV PACKAGES \
     cyrus-sasl-devel \
     gcc \
     gcc-c++ \
-    mkisofs \
     gettext-runtime \
     git \
     glib2-devel \
     glusterfs-devel \
-    libgnutls-devel \
     gtk3-devel \
+    libSDL2-devel \
+    libSDL2_image-devel \
     libaio-devel \
     libattr-devel \
     libcap-ng-devel \
     libepoxy-devel \
     libfdt-devel \
+    libgnutls-devel \
     libiscsi-devel \
     libjpeg8-devel \
+    libnuma-devel \
+    libpixman-1-0-devel \
     libpmem-devel \
     libpng16-devel \
     librbd-devel \
     libseccomp-devel \
+    libspice-server-devel \
     libssh-devel \
     lzo-devel \
     make \
-    libSDL2_image-devel \
+    mkisofs \
     ncurses-devel \
     ninja \
-    libnuma-devel \
     perl \
-    libpixman-1-0-devel \
     python3-base \
     python3-virtualenv \
     rdma-core-devel \
-    libSDL2-devel \
     snappy-devel \
-    libspice-server-devel \
     systemd-devel \
     systemtap-sdt-devel \
     tar \
     usbredir-devel \
     virglrenderer-devel \
-    xen-devel \
     vte-devel \
+    xen-devel \
     zlib-devel
 ENV QEMU_CONFIGURE_OPTS --python=/usr/bin/python3.6
 
diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index 0acdb0d9ad..a50a35e6fe 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -46,10 +46,10 @@ ENV PACKAGES \
     libxen-dev \
     libzstd-dev \
     make \
-    python3-yaml \
+    ninja-build \
     python3-sphinx \
     python3-sphinx-rtd-theme \
-    ninja-build \
+    python3-yaml \
     sparse \
     xfslibs-dev
 RUN apt-get update && \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 88b3cfa136..eee2ef3cac 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -1,8 +1,10 @@
 FROM docker.io/library/ubuntu:20.04
-ENV PACKAGES flex bison \
+ENV PACKAGES \
+    bison \
     bsdmainutils \
     ccache \
     clang-10\
+    flex \
     gcc \
     gcovr \
     genisoimage \
@@ -65,8 +67,8 @@ ENV PACKAGES flex bison \
     sparse \
     tesseract-ocr \
     tesseract-ocr-eng \
-    xfslibs-dev\
-    vim
+    vim \
+    xfslibs-dev
 RUN apt-get update && \
     DEBIAN_FRONTEND=noninteractive apt-get -y install $PACKAGES
 RUN dpkg -l $PACKAGES | sort > /packages.txt
-- 
2.20.1


