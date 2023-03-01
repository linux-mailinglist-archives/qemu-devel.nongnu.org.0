Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B55B6A6F65
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 16:26:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXOJy-0000uB-L4; Wed, 01 Mar 2023 10:24:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXOJk-0000fT-G8
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:24:33 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXOJh-00012K-Rm
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:24:32 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 d41-20020a05600c4c2900b003e9e066550fso8066743wmp.4
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 07:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=txYhMg114MuWu+mDxJO3nxECBkO8YFyp2bhffaxD6dw=;
 b=kkmLzX9Xxf+5KJD4LwVlTtDnmybvcHSDrVie0FjTF8Zfasto78StLxIXIraWnwgVKa
 Q3T4Shv0C3d9tK0L6hL1jG8649VQpbkmyNpaI+4WEGbOY1hG70sV04tnuFHD82cM9uzz
 ReltnhuoVRfHG79dLcxUay8G9xUcSoPF6rTndLqul0C5pTZVtbPjOmIlJamAULMqtAjF
 4qZePRgVwI7HW68uASCGRA5D7/jZczQnQLQRd9UBMcW2AmgfE7+QTAaCoGsMh5OGvD5K
 KNfheN4WeNfoL5bwNflukAr1BDtC3GSLfmoPKm+r5tV9YuauoO7lRePer8SJvBtQioS8
 W5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=txYhMg114MuWu+mDxJO3nxECBkO8YFyp2bhffaxD6dw=;
 b=bE24SyaOL7s0hpjxWPOZfD4p5ZaJxiSZ8PaGnnzksqYMJ4uJLS42nyvCdPDh8k3LT5
 4c4RjyhG6k5YgZkBAGMFnbY17g0mSQQRWmIT8GUutQfZ+4Us3wLOKM/xUR21n9cu15BJ
 KifMWdBj4823cfyLmpmRtt0QF0drfzG+ON+3iPx7Xw2TWFYUOdK43QTxZ+BHBY69l6II
 gQ75rlrjEfieeLHgF5fTYP3GM7RM8tKGL9xSTQwgc54OMIU5wSITUaOuUb+RpHTHyHV0
 U85paBF04RwNyAIm68X12AasgPhNWNPpEv49CyzJpfhoD/f/cuisyejQ8is1r8pV9+si
 b5uA==
X-Gm-Message-State: AO0yUKXd7NrAzQzaw1+kZ7VPV6AHMFh67RwlA9belLDgVGxJ7Wp2Zxyq
 YdBC3DThN00JK4SJuENh1RZhJ8aQf+PYgXfG
X-Google-Smtp-Source: AK7set+xQgG3UZB9jgTCW9h9UtbGW1dAxDyE+FPIy6wFDh2jKCCu6l6ric4k0kkdvUaS1qQ1ttYd0Q==
X-Received: by 2002:a05:600c:329a:b0:3db:5f1:53a5 with SMTP id
 t26-20020a05600c329a00b003db05f153a5mr5839011wmp.20.1677684264992; 
 Wed, 01 Mar 2023 07:24:24 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 ja18-20020a05600c557200b003eb0d6f48f3sm18931314wmb.27.2023.03.01.07.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 07:24:23 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8B9241FFCC;
 Wed,  1 Mar 2023 15:16:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL v2 23/24] tests/docker: add zstdtools to the images
Date: Wed,  1 Mar 2023 15:16:03 +0000
Message-Id: <20230301151604.1948813-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301151604.1948813-1-alex.bennee@linaro.org>
References: <20230301151604.1948813-1-alex.bennee@linaro.org>
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We need this to be able to run the tuxrun_baseline tests in CI which
in turn helps us reduce overhead running other tests. We need to
update libvirt-ci and refresh the generated files by running 'make
lcitool-refresh' to get the new mapping.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230228190653.1602033-24-alex.bennee@linaro.org>

diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index 799932bcc9..81c70aeaf9 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -110,6 +110,7 @@ RUN apk update && \
         xfsprogs-dev \
         zlib-dev \
         zlib-static \
+        zstd \
         zstd-dev && \
     apk list | sort > /packages.txt && \
     mkdir -p /usr/libexec/ccache-wrappers && \
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index d87a94b97b..7e3a6217ae 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -116,7 +116,8 @@ RUN dnf distro-sync -y && \
         which \
         xfsprogs-devel \
         zlib-devel \
-        zlib-static && \
+        zlib-static \
+        zstd && \
     dnf autoremove -y && \
     dnf clean all -y && \
     rpm -qa | sort > /packages.txt && \
diff --git a/tests/docker/dockerfiles/debian-amd64-cross.docker b/tests/docker/dockerfiles/debian-amd64-cross.docker
index 5d03b5c22d..afb1cbd046 100644
--- a/tests/docker/dockerfiles/debian-amd64-cross.docker
+++ b/tests/docker/dockerfiles/debian-amd64-cross.docker
@@ -56,7 +56,8 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       sparse \
                       tar \
                       tesseract-ocr \
-                      tesseract-ocr-eng && \
+                      tesseract-ocr-eng \
+                      zstd && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/dockerfiles/debian-amd64.docker
index febc46e700..28e2fa81b1 100644
--- a/tests/docker/dockerfiles/debian-amd64.docker
+++ b/tests/docker/dockerfiles/debian-amd64.docker
@@ -127,7 +127,8 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       tesseract-ocr \
                       tesseract-ocr-eng \
                       xfslibs-dev \
-                      zlib1g-dev && \
+                      zlib1g-dev \
+                      zstd && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker b/tests/docker/dockerfiles/debian-arm64-cross.docker
index b9501a21bc..b4f7a7f903 100644
--- a/tests/docker/dockerfiles/debian-arm64-cross.docker
+++ b/tests/docker/dockerfiles/debian-arm64-cross.docker
@@ -56,7 +56,8 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       sparse \
                       tar \
                       tesseract-ocr \
-                      tesseract-ocr-eng && \
+                      tesseract-ocr-eng \
+                      zstd && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
diff --git a/tests/docker/dockerfiles/debian-armel-cross.docker b/tests/docker/dockerfiles/debian-armel-cross.docker
index f21742ede5..4b4191f824 100644
--- a/tests/docker/dockerfiles/debian-armel-cross.docker
+++ b/tests/docker/dockerfiles/debian-armel-cross.docker
@@ -56,7 +56,8 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       sparse \
                       tar \
                       tesseract-ocr \
-                      tesseract-ocr-eng && \
+                      tesseract-ocr-eng \
+                      zstd && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
diff --git a/tests/docker/dockerfiles/debian-armhf-cross.docker b/tests/docker/dockerfiles/debian-armhf-cross.docker
index decdeda6f2..c9b6b2e563 100644
--- a/tests/docker/dockerfiles/debian-armhf-cross.docker
+++ b/tests/docker/dockerfiles/debian-armhf-cross.docker
@@ -56,7 +56,8 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       sparse \
                       tar \
                       tesseract-ocr \
-                      tesseract-ocr-eng && \
+                      tesseract-ocr-eng \
+                      zstd && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
diff --git a/tests/docker/dockerfiles/debian-mips64el-cross.docker b/tests/docker/dockerfiles/debian-mips64el-cross.docker
index 1df05fcf20..cfe4f9a0d7 100644
--- a/tests/docker/dockerfiles/debian-mips64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-mips64el-cross.docker
@@ -56,7 +56,8 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       sparse \
                       tar \
                       tesseract-ocr \
-                      tesseract-ocr-eng && \
+                      tesseract-ocr-eng \
+                      zstd && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
diff --git a/tests/docker/dockerfiles/debian-mipsel-cross.docker b/tests/docker/dockerfiles/debian-mipsel-cross.docker
index 019b8dcaff..8e521fc9ee 100644
--- a/tests/docker/dockerfiles/debian-mipsel-cross.docker
+++ b/tests/docker/dockerfiles/debian-mipsel-cross.docker
@@ -56,7 +56,8 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       sparse \
                       tar \
                       tesseract-ocr \
-                      tesseract-ocr-eng && \
+                      tesseract-ocr-eng \
+                      zstd && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
diff --git a/tests/docker/dockerfiles/debian-ppc64el-cross.docker b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
index 3ceab4c502..b1b8277f3f 100644
--- a/tests/docker/dockerfiles/debian-ppc64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
@@ -56,7 +56,8 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       sparse \
                       tar \
                       tesseract-ocr \
-                      tesseract-ocr-eng && \
+                      tesseract-ocr-eng \
+                      zstd && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
diff --git a/tests/docker/dockerfiles/debian-s390x-cross.docker b/tests/docker/dockerfiles/debian-s390x-cross.docker
index 6c216dde48..af39568ce5 100644
--- a/tests/docker/dockerfiles/debian-s390x-cross.docker
+++ b/tests/docker/dockerfiles/debian-s390x-cross.docker
@@ -56,7 +56,8 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       sparse \
                       tar \
                       tesseract-ocr \
-                      tesseract-ocr-eng && \
+                      tesseract-ocr-eng \
+                      zstd && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index 63a0000936..1fc4c987f7 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -59,7 +59,8 @@ exec "$@"' > /usr/bin/nosync && \
                tesseract \
                tesseract-langpack-eng \
                util-linux \
-               which && \
+               which \
+               zstd && \
     nosync dnf autoremove -y && \
     nosync dnf clean all -y
 
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index 531e539e85..39a0617a9d 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -59,7 +59,8 @@ exec "$@"' > /usr/bin/nosync && \
                tesseract \
                tesseract-langpack-eng \
                util-linux \
-               which && \
+               which \
+               zstd && \
     nosync dnf autoremove -y && \
     nosync dnf clean all -y
 
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 4dd1fce890..e030c5fb1e 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -130,7 +130,8 @@ exec "$@"' > /usr/bin/nosync && \
                xen-devel \
                xfsprogs-devel \
                zlib-devel \
-               zlib-static && \
+               zlib-static \
+               zstd && \
     nosync dnf autoremove -y && \
     nosync dnf clean all -y && \
     rpm -qa | sort > /packages.txt && \
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index f39e8a4d44..8e9500e443 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -113,7 +113,8 @@ RUN zypper update -y && \
            xen-devel \
            xfsprogs-devel \
            zlib-devel \
-           zlib-devel-static && \
+           zlib-devel-static \
+           zstd && \
     zypper clean --all && \
     rpm -qa | sort > /packages.txt && \
     mkdir -p /usr/libexec/ccache-wrappers && \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index a6f7071351..aa2f5ca7b4 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -126,7 +126,8 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       tesseract-ocr \
                       tesseract-ocr-eng \
                       xfslibs-dev \
-                      zlib1g-dev && \
+                      zlib1g-dev \
+                      zstd && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
diff --git a/tests/docker/dockerfiles/ubuntu2204.docker b/tests/docker/dockerfiles/ubuntu2204.docker
index 6fea090f02..3f7d30e5d0 100644
--- a/tests/docker/dockerfiles/ubuntu2204.docker
+++ b/tests/docker/dockerfiles/ubuntu2204.docker
@@ -127,7 +127,8 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
                       tesseract-ocr \
                       tesseract-ocr-eng \
                       xfslibs-dev \
-                      zlib1g-dev && \
+                      zlib1g-dev \
+                      zstd && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
index 1c3e16cae3..232f41f160 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit 1c3e16cae38407d0782dc94080d1104106456fa4
+Subproject commit 232f41f160d4567b8c82dd52aa96c2bc3a5b75c1
diff --git a/tests/lcitool/projects/qemu.yml b/tests/lcitool/projects/qemu.yml
index 2854748f49..af3700379a 100644
--- a/tests/lcitool/projects/qemu.yml
+++ b/tests/lcitool/projects/qemu.yml
@@ -116,5 +116,6 @@ packages:
  - which
  - xen
  - xfsprogs
+ - zstdtools
  - zlib
  - zlib-static
-- 
2.39.2


