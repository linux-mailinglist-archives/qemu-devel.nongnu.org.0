Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE83610DFC
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 11:58:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooM7A-0003Hr-F1; Fri, 28 Oct 2022 05:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooM77-0003Gf-VE
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 05:57:21 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooM75-0004LN-S0
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 05:57:21 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 v130-20020a1cac88000000b003bcde03bd44so6205571wme.5
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 02:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ecANUkncwF6Ms84JE1eBG1StrPt5ih6h29gVlCDJIf8=;
 b=MqOstuxFYBEAw8wpP7EAsLFz/b9LbL2AOx0ARaDTs8ru2fLEdbEbur3K26gwpzPGxw
 5CJCXMd1D2gHmOhOZ/XCmhDp/COraBKkvAEhYniLUpExLhYVC3EG3tKH3EBMCU7yWotT
 FKVu0CaQ44ebUgiruZFa8YS1gurlQwflLEO1xt9+b2ucZWNcZC8LKYlrTpt99HfCpSq1
 uSXDekDcfMq9gYF7qzGgYHU4pD17FVP3JIcKGWyt1+mrjTv18podZpQ79UoDl9ClRhbv
 7fOAw2IaU4gZllHOj4ooH883D5oDqx8l+D9l2lQ3tePNjXRcCA+2NbtKg7uNGiQnDh+q
 a1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ecANUkncwF6Ms84JE1eBG1StrPt5ih6h29gVlCDJIf8=;
 b=URxkTx38q6ibjtpC74gs5IG2wGFVLjXVwPxPuF8dUWD6iOGCoD9Gi0412gXfSMjcvQ
 pMzCRuoi9tIHFyGh4t3kR3bKWBLHDo3EKZZOmj2pVeNk2GzmsdDYCw9qtb/ZTiyCCsfa
 7c5BilvrjvjZiT3WIiP9fQub9gmpKD7ErPb05CYfkUaXOhZ/y/XyfDugi0rnWI/oalhV
 1E3XwzEcpuCBcwkJr7v6wm/pj+EcJGTmrMMGnhWvkbD1QQ7njpore5jr1YxXdGCbU7C+
 MVxa73YbzjLWbw0iFtHhkthA5AGpCTRla7FXih3tChrIax0z1vo83rFh+v36DmcK2oCD
 ODDg==
X-Gm-Message-State: ACrzQf3uZKLhYYruTYXxH3F73LkCtk9MkFWxYMVAj8qJHgEwj6qoH9qA
 mwpp7rOSRrj+sgJopur0VOHu/SasVHR3QZPT
X-Google-Smtp-Source: AMsMyM6Jim7k1q8jqusrlfeeE5gEyTAh/xnIsGqCC9mZAf8XPFF53TIzM9LUO9loVW8JtrDlz7Ir1g==
X-Received: by 2002:a5d:4f05:0:b0:236:a65e:3762 with SMTP id
 c5-20020a5d4f05000000b00236a65e3762mr1151182wru.156.1666951038175; 
 Fri, 28 Oct 2022 02:57:18 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a1c5457000000b003a601a1c2f7sm6973576wmi.19.2022.10.28.02.57.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 28 Oct 2022 02:57:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v5 3/3] tests/docker: update fedora-win[32|64]-cross with
 lcitool
Date: Fri, 28 Oct 2022 11:56:59 +0200
Message-Id: <20221028095659.48734-4-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028095659.48734-1-philmd@linaro.org>
References: <20221028095659.48734-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Alex Bennée <alex.bennee@linaro.org>

Convert another two dockerfiles to lcitool and update.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220929114231.583801-10-alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 .../dockerfiles/fedora-win32-cross.docker     | 139 ++++++++++++------
 .../dockerfiles/fedora-win64-cross.docker     | 138 ++++++++++++-----
 tests/lcitool/refresh                         |  10 ++
 3 files changed, 207 insertions(+), 80 deletions(-)

diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index aca37aabc4..75383ba185 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -1,46 +1,103 @@
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool dockerfile --layers all --cross mingw32 fedora-35 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
+
 FROM registry.fedoraproject.org/fedora:35
 
-# Please keep this list sorted alphabetically
-ENV PACKAGES \
-    bc \
-    bison \
-    bzip2 \
-    ccache \
-    diffutils \
-    findutils \
-    flex \
-    gcc \
-    gettext \
-    git \
-    glib2-devel \
-    hostname \
-    make \
-    meson \
-    mingw32-bzip2 \
-    mingw32-curl \
-    mingw32-glib2 \
-    mingw32-gmp \
-    mingw32-gnutls \
-    mingw32-gtk3 \
-    mingw32-libffi \
-    mingw32-libjpeg-turbo \
-    mingw32-libpng \
-    mingw32-libtasn1 \
-    mingw32-libusbx \
-    mingw32-nettle \
-    mingw32-nsis \
-    mingw32-pixman \
-    mingw32-pkg-config \
-    mingw32-SDL2 \
-    msitools \
-    perl \
-    python3 \
-    python3-PyYAML \
-    tar \
-    which
+RUN dnf install -y nosync && \
+    echo -e '#!/bin/sh\n\
+if test -d /usr/lib64\n\
+then\n\
+    export LD_PRELOAD=/usr/lib64/nosync/nosync.so\n\
+else\n\
+    export LD_PRELOAD=/usr/lib/nosync/nosync.so\n\
+fi\n\
+exec "$@"' > /usr/bin/nosync && \
+    chmod +x /usr/bin/nosync && \
+    nosync dnf update -y && \
+    nosync dnf install -y \
+               bash \
+               bc \
+               bison \
+               bzip2 \
+               ca-certificates \
+               ccache \
+               ctags \
+               dbus-daemon \
+               diffutils \
+               findutils \
+               flex \
+               gcovr \
+               genisoimage \
+               git \
+               glib2-devel \
+               glibc-langpack-en \
+               hostname \
+               llvm \
+               make \
+               meson \
+               ninja-build \
+               nmap-ncat \
+               openssh-clients \
+               pcre-static \
+               perl-base \
+               python3 \
+               python3-PyYAML \
+               python3-numpy \
+               python3-opencv \
+               python3-pillow \
+               python3-pip \
+               python3-sphinx \
+               python3-sphinx_rtd_theme \
+               rpm \
+               sed \
+               sparse \
+               spice-protocol \
+               tar \
+               tesseract \
+               tesseract-langpack-eng \
+               texinfo \
+               util-linux \
+               which && \
+    nosync dnf autoremove -y && \
+    nosync dnf clean all -y
 
-RUN dnf install -y $PACKAGES
-RUN rpm -q $PACKAGES | sort > /packages.txt
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
 
-# Specify the cross prefix for this image (see tests/docker/common.rc)
+RUN nosync dnf install -y \
+               mingw32-SDL2 \
+               mingw32-SDL2_image \
+               mingw32-bzip2 \
+               mingw32-curl \
+               mingw32-gcc \
+               mingw32-gcc-c++ \
+               mingw32-gettext \
+               mingw32-glib2 \
+               mingw32-gnutls \
+               mingw32-gtk3 \
+               mingw32-libgcrypt \
+               mingw32-libjpeg-turbo \
+               mingw32-libpng \
+               mingw32-libtasn1 \
+               mingw32-nettle \
+               mingw32-nsis \
+               mingw32-pixman \
+               mingw32-pkg-config && \
+    nosync dnf clean all -y && \
+    rpm -qa | sort > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/i686-w64-mingw32-c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/i686-w64-mingw32-cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/i686-w64-mingw32-g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/i686-w64-mingw32-gcc
+
+ENV ABI "i686-w64-mingw32"
+ENV MESON_OPTS "--cross-file=/usr/share/mingw/toolchain-mingw32.meson"
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=i686-w64-mingw32-
+ENV DEF_TARGET_LIST i386-softmmu
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index 3642766479..98c03dc13b 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -1,43 +1,103 @@
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool dockerfile --layers all --cross mingw64 fedora-35 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
+
 FROM registry.fedoraproject.org/fedora:35
 
-# Please keep this list sorted alphabetically
-ENV PACKAGES \
-    bc \
-    bison \
-    bzip2 \
-    ccache \
-    diffutils \
-    findutils \
-    flex \
-    gcc \
-    gettext \
-    git \
-    glib2-devel \
-    hostname \
-    make \
-    meson \
-    mingw32-nsis \
-    mingw64-bzip2 \
-    mingw64-curl \
-    mingw64-glib2 \
-    mingw64-gmp \
-    mingw64-gtk3 \
-    mingw64-libffi \
-    mingw64-libjpeg-turbo \
-    mingw64-libpng \
-    mingw64-libtasn1 \
-    mingw64-libusbx \
-    mingw64-pixman \
-    mingw64-pkg-config \
-    msitools \
-    perl \
-    python3 \
-    python3-PyYAML \
-    tar \
-    which
+RUN dnf install -y nosync && \
+    echo -e '#!/bin/sh\n\
+if test -d /usr/lib64\n\
+then\n\
+    export LD_PRELOAD=/usr/lib64/nosync/nosync.so\n\
+else\n\
+    export LD_PRELOAD=/usr/lib/nosync/nosync.so\n\
+fi\n\
+exec "$@"' > /usr/bin/nosync && \
+    chmod +x /usr/bin/nosync && \
+    nosync dnf update -y && \
+    nosync dnf install -y \
+               bash \
+               bc \
+               bison \
+               bzip2 \
+               ca-certificates \
+               ccache \
+               ctags \
+               dbus-daemon \
+               diffutils \
+               findutils \
+               flex \
+               gcovr \
+               genisoimage \
+               git \
+               glib2-devel \
+               glibc-langpack-en \
+               hostname \
+               llvm \
+               make \
+               meson \
+               ninja-build \
+               nmap-ncat \
+               openssh-clients \
+               pcre-static \
+               perl-base \
+               python3 \
+               python3-PyYAML \
+               python3-numpy \
+               python3-opencv \
+               python3-pillow \
+               python3-pip \
+               python3-sphinx \
+               python3-sphinx_rtd_theme \
+               rpm \
+               sed \
+               sparse \
+               spice-protocol \
+               tar \
+               tesseract \
+               tesseract-langpack-eng \
+               texinfo \
+               util-linux \
+               which && \
+    nosync dnf autoremove -y && \
+    nosync dnf clean all -y
 
-RUN dnf install -y $PACKAGES
-RUN rpm -q $PACKAGES | sort > /packages.txt
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
 
-# Specify the cross prefix for this image (see tests/docker/common.rc)
-ENV QEMU_CONFIGURE_OPTS --cross-prefix=x86_64-w64-mingw32- --disable-capstone
+RUN nosync dnf install -y \
+               mingw32-nsis \
+               mingw64-SDL2 \
+               mingw64-SDL2_image \
+               mingw64-bzip2 \
+               mingw64-curl \
+               mingw64-gcc \
+               mingw64-gcc-c++ \
+               mingw64-gettext \
+               mingw64-glib2 \
+               mingw64-gnutls \
+               mingw64-gtk3 \
+               mingw64-libgcrypt \
+               mingw64-libjpeg-turbo \
+               mingw64-libpng \
+               mingw64-libtasn1 \
+               mingw64-nettle \
+               mingw64-pixman \
+               mingw64-pkg-config && \
+    nosync dnf clean all -y && \
+    rpm -qa | sort > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/x86_64-w64-mingw32-c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/x86_64-w64-mingw32-cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/x86_64-w64-mingw32-g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/x86_64-w64-mingw32-gcc
+
+ENV ABI "x86_64-w64-mingw32"
+ENV MESON_OPTS "--cross-file=/usr/share/mingw/toolchain-mingw64.meson"
+ENV QEMU_CONFIGURE_OPTS --cross-prefix=x86_64-w64-mingw32-
+ENV DEF_TARGET_LIST x86_64-softmmu
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index a6a7c23c1d..ce0b24c0b1 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -161,6 +161,16 @@ try:
                         trailer=cross_build("s390x-linux-gnu-",
                                             "s390x-softmmu,s390x-linux-user"))
 
+    generate_dockerfile("fedora-win32-cross", "fedora-35",
+                        cross="mingw32",
+                        trailer=cross_build("i686-w64-mingw32-",
+                                            "i386-softmmu"))
+
+    generate_dockerfile("fedora-win64-cross", "fedora-35",
+                        cross="mingw64",
+                        trailer=cross_build("x86_64-w64-mingw32-",
+                                            "x86_64-softmmu"))
+
     #
     # Cirrus packages lists for GitLab
     #
-- 
2.37.3


