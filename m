Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B9A5EF5AB
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 14:47:12 +0200 (CEST)
Received: from localhost ([::1]:39312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odswW-00041z-TR
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 08:47:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrwB-0004Ud-2v
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:43 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:51791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrw8-0001Dx-Ex
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:42 -0400
Received: by mail-wm1-x335.google.com with SMTP id o5so774880wms.1
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=U138ZH3NxNJ5/EzN4d8hsKRI/emesbQsSGY0U7Ek0FM=;
 b=VHvHyoXkY7ltvpJZ0LL+me0rKCGkWGuQBYHkWhse4Pl76AopbP6IAEK6RsWJ4YLwvB
 SmpM/UI1PoP7rseCua9Q4dZIs/niXu/Ah8hARr8FBHnJQncSOPeOKM6RH8DXbfM/0IIi
 6PvXu/LNUfVOG0bI5Qi1e15psYm5omY9m1IO3m12V7DnnMlSpHrz0vaLByyEj2WNQdPo
 qCO7zfns0IXOFDKMHvb6/BQsX5vSC6930M8/GYPiq1oDZdlTq8JQIYaE1tSz5wp4ozKs
 SFS9vlYKm2UqjkaVLrbskt1JntXvYWhHC3Jv18EdYORea/r0EX1qtWAYNRDKw97o6sTW
 PpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=U138ZH3NxNJ5/EzN4d8hsKRI/emesbQsSGY0U7Ek0FM=;
 b=TjZKCgltTW5asJU0+YGlJfUuUvNYZ3bk03WR4Pkz81svLAcB0VsS5EyO5cVz1kZ2Ma
 uRg00oaTT2arWc3G7bQOYf5Pwj2dxFa9hkSOZGkxvIzJ30lrqYycel9VVMEcPLFd8ZSL
 oENKB1r+efbs2/bI6jx6lBMe+dlw9m9vzhAOfed3ZBWnFOKkaWCiOuYCWMV+27zD591g
 zvUAO8ZxxTsaYMKKlbBd/JTN7YhDWqu7F/wKNOgNumeDJ/KpD1LJrerKcxyMghiCMw4X
 CPfNRbhFeMH/d7Lg3119rQCxM1VQTn8M+ZyCpIw1g8NQntm6sDmd0eszrwfgn1vvqmBB
 BrCA==
X-Gm-Message-State: ACrzQf3zjGFKM8kH92LVWulkam9QyLswgOunY3pIRIIcM2OTrzrg1Tli
 xhaQrQGPY5aJZ3/9cy4KR0yc1g==
X-Google-Smtp-Source: AMsMyM6Eh+olDJ9+eImCNMGaisA8pWm2vcwRdZDu+YWThwqRqQlYHVazxVKpA+4oKBM8QO0AwS4RMw==
X-Received: by 2002:a05:600c:154e:b0:3b4:bf17:32fc with SMTP id
 f14-20020a05600c154e00b003b4bf1732fcmr10482047wmg.70.1664451758792; 
 Thu, 29 Sep 2022 04:42:38 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i6-20020adfefc6000000b0022ccbc7efb5sm2733529wrp.73.2022.09.29.04.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:42:34 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 634BA1FFC1;
 Thu, 29 Sep 2022 12:42:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v1 09/51] tests/docker: update fedora-win[32|64]-cross with
 lcitool
Date: Thu, 29 Sep 2022 12:41:49 +0100
Message-Id: <20220929114231.583801-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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

Convert another two dockerfiles to lcitool and update. I renamed the
helper because it is not Debian specific.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .../dockerfiles/fedora-win32-cross.docker     | 139 ++++++++++++------
 .../dockerfiles/fedora-win64-cross.docker     | 137 ++++++++++++-----
 tests/lcitool/refresh                         |  48 +++---
 3 files changed, 225 insertions(+), 99 deletions(-)

diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index aca37aabc4..11f153e397 100644
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
+        bash \
+        bc \
+        bison \
+        bzip2 \
+        ca-certificates \
+        ccache \
+        ctags \
+        dbus-daemon \
+        diffutils \
+        findutils \
+        flex \
+        gcovr \
+        genisoimage \
+        git \
+        glib2-devel \
+        glibc-langpack-en \
+        hostname \
+        llvm \
+        make \
+        meson \
+        ninja-build \
+        nmap-ncat \
+        openssh-clients \
+        pcre-static \
+        perl-base \
+        python3 \
+        python3-PyYAML \
+        python3-numpy \
+        python3-opencv \
+        python3-pillow \
+        python3-pip \
+        python3-sphinx \
+        python3-sphinx_rtd_theme \
+        rpm \
+        sed \
+        sparse \
+        spice-protocol \
+        tar \
+        tesseract \
+        tesseract-langpack-eng \
+        texinfo \
+        util-linux \
+        which && \
+    nosync dnf autoremove -y && \
+    nosync dnf clean all -y
+
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 
-RUN dnf install -y $PACKAGES
-RUN rpm -q $PACKAGES | sort > /packages.txt
+RUN nosync dnf install -y \
+        mingw32-SDL2 \
+        mingw32-SDL2_image \
+        mingw32-bzip2 \
+        mingw32-curl \
+        mingw32-gcc \
+        mingw32-gcc-c++ \
+        mingw32-gettext \
+        mingw32-glib2 \
+        mingw32-gnutls \
+        mingw32-gtk3 \
+        mingw32-libgcrypt \
+        mingw32-libjpeg-turbo \
+        mingw32-libpng \
+        mingw32-libtasn1 \
+        mingw32-nettle \
+        mingw32-nsis \
+        mingw32-pixman \
+        mingw32-pkg-config && \
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
index 3642766479..8938c28554 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -1,43 +1,102 @@
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
+        bash \
+        bc \
+        bison \
+        bzip2 \
+        ca-certificates \
+        ccache \
+        ctags \
+        dbus-daemon \
+        diffutils \
+        findutils \
+        flex \
+        gcovr \
+        genisoimage \
+        git \
+        glib2-devel \
+        glibc-langpack-en \
+        hostname \
+        llvm \
+        make \
+        meson \
+        ninja-build \
+        nmap-ncat \
+        openssh-clients \
+        pcre-static \
+        perl-base \
+        python3 \
+        python3-PyYAML \
+        python3-numpy \
+        python3-opencv \
+        python3-pillow \
+        python3-pip \
+        python3-sphinx \
+        python3-sphinx_rtd_theme \
+        rpm \
+        sed \
+        sparse \
+        spice-protocol \
+        tar \
+        tesseract \
+        tesseract-langpack-eng \
+        texinfo \
+        util-linux \
+        which && \
+    nosync dnf autoremove -y && \
+    nosync dnf clean all -y
+
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 
-RUN dnf install -y $PACKAGES
-RUN rpm -q $PACKAGES | sort > /packages.txt
+RUN nosync dnf install -y \
+        mingw64-SDL2 \
+        mingw64-SDL2_image \
+        mingw64-bzip2 \
+        mingw64-curl \
+        mingw64-gcc \
+        mingw64-gcc-c++ \
+        mingw64-gettext \
+        mingw64-glib2 \
+        mingw64-gnutls \
+        mingw64-gtk3 \
+        mingw64-libgcrypt \
+        mingw64-libjpeg-turbo \
+        mingw64-libpng \
+        mingw64-libtasn1 \
+        mingw64-nettle \
+        mingw64-pixman \
+        mingw64-pkg-config && \
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
index fc604d8a21..783497a989 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -93,7 +93,7 @@ debian11_extras = [
 ]
 
 
-def debian_cross_build(prefix, targets):
+def cross_build(prefix, targets):
     conf = "ENV QEMU_CONFIGURE_OPTS --cross-prefix=%s\n" % (prefix)
     targets = "ENV DEF_TARGET_LIST %s\n" % (targets)
     return "".join([conf, targets])
@@ -121,45 +121,55 @@ try:
     #
     generate_dockerfile("debian-amd64-cross", "debian-11",
                         cross="x86_64",
-                        trailer=debian_cross_build("x86_64-linux-gnu-",
-                                                   "x86_64-softmmu,"
-                                                   "x86_64-linux-user,"
-                                                   "i386-softmmu,i386-linux-user"))
+                        trailer=cross_build("x86_64-linux-gnu-",
+                                            "x86_64-softmmu,"
+                                            "x86_64-linux-user,"
+                                            "i386-softmmu,i386-linux-user"))
 
     generate_dockerfile("debian-arm64-cross", "debian-11",
                         cross="aarch64",
-                        trailer=debian_cross_build("aarch64-linux-gnu-",
-                                                   "aarch64-softmmu,aarch64-linux-user"))
+                        trailer=cross_build("aarch64-linux-gnu-",
+                                            "aarch64-softmmu,aarch64-linux-user"))
 
     generate_dockerfile("debian-armel-cross", "debian-11",
                         cross="armv6l",
-                        trailer=debian_cross_build("arm-linux-gnueabi-",
-                                                   "arm-softmmu,arm-linux-user,armeb-linux-user"))
+                        trailer=cross_build("arm-linux-gnueabi-",
+                                            "arm-softmmu,arm-linux-user,armeb-linux-user"))
 
     generate_dockerfile("debian-armhf-cross", "debian-11",
                         cross="armv7l",
-                        trailer=debian_cross_build("arm-linux-gnueabihf-",
-                                                   "arm-softmmu,arm-linux-user"))
+                        trailer=cross_build("arm-linux-gnueabihf-",
+                                            "arm-softmmu,arm-linux-user"))
 
     generate_dockerfile("debian-mips64el-cross", "debian-11",
                         cross="mips64el",
-                        trailer=debian_cross_build("mips64el-linux-gnuabi64-",
-                                                  "mips64el-softmmu,mips64el-linux-user"))
+                        trailer=cross_build("mips64el-linux-gnuabi64-",
+                                            "mips64el-softmmu,mips64el-linux-user"))
 
     generate_dockerfile("debian-mipsel-cross", "debian-11",
                         cross="mipsel",
-                        trailer=debian_cross_build("mipsel-linux-gnu-",
-                                                   "mipsel-softmmu,mipsel-linux-user"))
+                        trailer=cross_build("mipsel-linux-gnu-",
+                                            "mipsel-softmmu,mipsel-linux-user"))
 
     generate_dockerfile("debian-ppc64el-cross", "debian-11",
                         cross="ppc64le",
-                        trailer=debian_cross_build("powerpc64le-linux-gnu-",
-                                                   "ppc64-softmmu,ppc64-linux-user"))
+                        trailer=cross_build("powerpc64le-linux-gnu-",
+                                            "ppc64-softmmu,ppc64-linux-user"))
 
     generate_dockerfile("debian-s390x-cross", "debian-11",
                         cross="s390x",
-                        trailer=debian_cross_build("s390x-linux-gnu-",
-                                                   "s390x-softmmu,s390x-linux-user"))
+                        trailer=cross_build("s390x-linux-gnu-",
+                                            "s390x-softmmu,s390x-linux-user"))
+
+    generate_dockerfile("fedora-win32-cross", "fedora-35",
+                        cross="mingw32",
+                        trailer=cross_build("i686-w64-mingw32-",
+                                            "i386-softmmu"))
+
+    generate_dockerfile("fedora-win64-cross", "fedora-35",
+                        cross="mingw64",
+                        trailer=cross_build("x86_64-w64-mingw32-",
+                                            "x86_64-softmmu"))
 
     #
     # Cirrus packages lists for GitLab
-- 
2.34.1


