Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7F76137BE
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:20:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUZ7-0000r3-LX; Mon, 31 Oct 2022 09:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUYj-0007wp-GY
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:10:39 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUYR-0001Ci-Pv
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:10:31 -0400
Received: by mail-wr1-x429.google.com with SMTP id v1so15889184wrt.11
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I2T8D0ShdNw3jUDGJfC+s4hF5FHRSJig30tiWD+XkNY=;
 b=NHCM4l/nkX/pgb0pqgavCK4vHE07eau/rGtTI8ySuN/7ys4Hfb8x8FN+EGNbECp3Kr
 jAgHJj7xZrmyeHb+F6W/ID+1focot3PAekm6rXYUpLrRrY+tnDPiqQXUA7mohf1NoJHV
 v7EOPNVgmVll+SvyAiW2KjDsSRR2SbyEszdDHdbVse3n4i6cJ6I1eBQkdf/sD3AUS6vh
 7tTcbAX/B9qTGRv9xo90mwXzW7NpreVm3lQzmeqML6jVwqI9JImsTXDBKW/vfcxgBAe4
 5mecxyVZBt7IrliWTJ+nnyLkDJlV0TrJu81JSdAqESQvwcYMo6osonPE6cwxmyapSmB6
 CRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I2T8D0ShdNw3jUDGJfC+s4hF5FHRSJig30tiWD+XkNY=;
 b=JA79G0GkAWuWDR/AtU0UAPi/aULthtF4YtN69ZSdVmZUjJiFeUXG7eRWzoUF9HQ6Nz
 7AT3BmyOKHQTL2KkOksOxI7NjtDNxLN4MawdJ8yUb8HjHcHEqv8aMDQmOmGRE4EC8b3G
 azNsBZUeXnUPoBtkLF92/hDPtiosh8pDO/5hy+lnJoQvS7y1hqbYbD8aeuPezEExEaDD
 UqUZTvEWLzDWpDyULPzf3ftasC7qp8SMEE1F3YsJYcwEJ6UkoHtGXuuwN2bcYAtiOrPl
 +9Tu87XeONxZMiNjR/iXUE7OXZbbyZTeKKaUxiPWSJVXgCnFiVDhLEYneBFBJUTJXM6E
 IJwA==
X-Gm-Message-State: ACrzQf0wKCRUZFemSiTdMaVUD2qRUR5W5wAFsin5RuVbuTLfqxkWSudq
 dhVthdzwaGZfO37Di8oIEL+i8g==
X-Google-Smtp-Source: AMsMyM7nbi/cye38p36GA8GGpeO9CBYs65GSWJ/2Z1eIXI/lu/kRDF+A2AREl+jc+kpg0oPIYxdu0w==
X-Received: by 2002:a5d:52d0:0:b0:21e:4923:fa09 with SMTP id
 r16-20020a5d52d0000000b0021e4923fa09mr8287741wrv.244.1667221813208; 
 Mon, 31 Oct 2022 06:10:13 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 ci8-20020a5d5d88000000b0023662245d3csm7125966wrb.95.2022.10.31.06.10.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 06:10:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4C26F1FFBB;
 Mon, 31 Oct 2022 13:10:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 03/31] tests/docker: update fedora-win[32|64]-cross with lcitool
Date: Mon, 31 Oct 2022 13:09:42 +0000
Message-Id: <20221031131010.682984-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031131010.682984-1-alex.bennee@linaro.org>
References: <20221031131010.682984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

Convert another two dockerfiles to lcitool and update.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220929114231.583801-10-alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221028095659.48734-4-philmd@linaro.org>

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
+
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
 
-RUN dnf install -y $PACKAGES
-RUN rpm -q $PACKAGES | sort > /packages.txt
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
 
-# Specify the cross prefix for this image (see tests/docker/common.rc)
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
+
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
 
-RUN dnf install -y $PACKAGES
-RUN rpm -q $PACKAGES | sort > /packages.txt
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
 
-# Specify the cross prefix for this image (see tests/docker/common.rc)
-ENV QEMU_CONFIGURE_OPTS --cross-prefix=x86_64-w64-mingw32- --disable-capstone
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
2.34.1


