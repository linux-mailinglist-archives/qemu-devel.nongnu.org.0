Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A035F4486
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 15:43:12 +0200 (CEST)
Received: from localhost ([::1]:58538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofiCV-0000KA-Mo
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 09:43:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhYW-0008Fq-4f
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:01:56 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhYT-0007MY-Es
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:01:51 -0400
Received: by mail-wr1-x432.google.com with SMTP id w18so12480675wro.7
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=1FXddyBdk2iWEWuFY7UaFe3N4oqH223nrxD4ygEnH4c=;
 b=MfSVwOYoLDn2a9XWnO/597prlv6iKG5AaoZzV36zowIOg6gV6S4v/IffzVHZpUfzt1
 OOo93oDT3zqwno1FRycorAnqtPvI8rJS8SvEmnnO1qNHoUGL+5tn+wMDBMAPIzOjZmjs
 qmRod2mDm5IgG2+ZgMRB99hJwFV9jcISs4IT04JFidSC/kO0y0b/t638UPGN2+68v578
 x9Q9lupVhn2WTkCOILeTZGt8rMVlWRggS4KyTZBxXW0Y7Sy0TGDkxU7c80daCOIp1GkF
 Map4EF394TGW1HQTjkjOY2BTUggwInAmp54IG1liGlhMUioV5MkxLJpUP6dOvJxOGMiM
 CVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=1FXddyBdk2iWEWuFY7UaFe3N4oqH223nrxD4ygEnH4c=;
 b=5fDqj7bKrmV27SpNizjxP4MWslFdmoxaitEjM8bXMVIRobxeHPrhyjmU4qeSsH15TO
 nPZKxbXl4yeTj7kACFbtWCfFUgeLj276DSbNc8ua6X3QrEiktZZTo2F9eYQrM9Ad++AK
 5CNmfqLB4NIjFZVZkbIFapAF6RnO8a2UhGqF2jvmIXHkL9iNc4tn9FkcGHokbfzIh+QO
 CLm38qb6PUwjq1e87cWX42xKTJ7i/9Uma+hixjdC82M+e/+6Bu389MUwPfTSFSIhPZme
 02UpuzgsAClW+s0h3p24yl1PubVXV5YDchd+8U7iVqEyuSaKNoRdG3r9WmK8hnGS+ban
 ykaw==
X-Gm-Message-State: ACrzQf0r5Fb0WpsRljIKrGc5KvRX6e2e3atyb7NmrT8rgLlm5Jc0rcSQ
 GywzEjj6lkT5metPi+rQd91PNA==
X-Google-Smtp-Source: AMsMyM7bPYFHs59BZ/hKM/kiHbrdq7Fm9s6ScPffoN3NW/FTgxJQ28Hi0HitYvWfaUcB/UNvDohb4g==
X-Received: by 2002:a05:6000:1b06:b0:22c:da6d:b199 with SMTP id
 f6-20020a0560001b0600b0022cda6db199mr15521517wrz.584.1664888508515; 
 Tue, 04 Oct 2022 06:01:48 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a7bcb41000000b003b27f644488sm14546803wmj.29.2022.10.04.06.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:01:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6BBD11FFC1;
 Tue,  4 Oct 2022 14:01:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 09/54] tests/docker: update fedora-win[32|64]-cross with lcitool
Date: Tue,  4 Oct 2022 14:00:53 +0100
Message-Id: <20221004130138.2299307-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Message-Id: <20220929114231.583801-10-alex.bennee@linaro.org>

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


