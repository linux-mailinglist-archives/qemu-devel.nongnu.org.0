Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 510B248C32C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 12:31:50 +0100 (CET)
Received: from localhost ([::1]:36576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7br2-0005dB-9i
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 06:31:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bn2-0002eI-P4
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:27:42 -0500
Received: from [2607:f8b0:4864:20::934] (port=34330
 helo=mail-ua1-x934.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bn0-0003Oo-Ar
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:27:39 -0500
Received: by mail-ua1-x934.google.com with SMTP id y4so4125886uad.1
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 03:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dOpOjNiCjVbRSWy+ZxB/OjcE4RymyNfyA1Daui2Yh5M=;
 b=HBbIwD/Bw9MBxueTJLDgSht6BRjMePD/UFGeSMrJ3gZLbqzIcp530sNFcGCmayQorH
 p5TZQ5t7EPUEPUqz2zQhSDz6f593a/7IjpoIs02zpo6ePT8zK0xBVoagU4Os8JphLSn2
 dBg8ASOZWLWrtQJnVw8aSakSHEvSuHXhplSABcjDvEd00DBB0/O5QX3zuulX6eeZPEBH
 zDqHNCoYtmwRBnuT6XHoLFwCQazQtH05yL3s9idDNgKELEv+qphaT/U3VaVmBrTyEe+9
 Fpj+QMEGG1yr34slNp/RcU2D4hPqT+Ai00xs7Sw6ZazJdiCf10fVUyTHgseppbuyNG+i
 Wy7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dOpOjNiCjVbRSWy+ZxB/OjcE4RymyNfyA1Daui2Yh5M=;
 b=4VHxiQnh+1jvVIOVgebYKqI9xBtk/hYy5JxqP4tBhV5ernXv0v7BEEYv/C1kUp8WYy
 UHe79JsLSkZ2ZU22r8IUrNUhdZN+A1DNXUhXJNwG0HDZwTTgIBibjwqVHCNvjYJqdRge
 /XgAWP0RShE8r9wLfrHhfaHV+WzwEe0HvqjvcmAEM8s6KmZwjHstYhzsc5Zqtig9Y8Na
 C0ahymKQUPNC2dGhkoJ5o7OAPiYSGQgxUVkwuWOI1RbOjdTrwRAHH6joklesfgaiG8bX
 4tnQfBHNcOXoJ1KsE8HC5FdlxT2owm/JZUu8DYmx/Uf0ujAPBEc1u2fC/t4aqAoaR/mo
 toHA==
X-Gm-Message-State: AOAM533phVZoRd0D8et5jyF4iaGAyA+RLpy5V73DBKFjHThXFvNcH/Ea
 Jx4Ie4DeNZM1ZX7lEsRRlX+C0Q==
X-Google-Smtp-Source: ABdhPJy9SzJiZ/Kti/Dyd2ZNGthrWA3A8nYhAMLZUlExav1iLNNfm4tmMoquFPWndUqzwhDeZfLhtQ==
X-Received: by 2002:a67:33cf:: with SMTP id z198mr4142439vsz.40.1641986856075; 
 Wed, 12 Jan 2022 03:27:36 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d123sm5699888vkg.28.2022.01.12.03.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 03:27:34 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 041771FFC0;
 Wed, 12 Jan 2022 11:27:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 08/31] tests/docker: auto-generate centos8.docker with lcitool
Date: Wed, 12 Jan 2022 11:26:59 +0000
Message-Id: <20220112112722.3641051-9-alex.bennee@linaro.org>
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

This commit is best examined using the "-b" option to diff.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211215141949.3512719-9-berrange@redhat.com>
Message-Id: <20220105135009.1584676-9-alex.bennee@linaro.org>

diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 7f135f8e8c..3c62b62a99 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -1,112 +1,135 @@
-FROM docker.io/centos:8
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool dockerfile centos-8 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
 
-RUN dnf -y update
-ENV PACKAGES \
-    SDL2-devel \
-    alsa-lib-devel \
-    bc \
-    brlapi-devel \
-    bzip2 \
-    bzip2-devel \
-    ca-certificates \
-    capstone-devel \
-    ccache \
-    clang \
-    ctags \
-    cyrus-sasl-devel \
-    daxctl-devel \
-    dbus-daemon \
-    device-mapper-multipath-devel \
-    diffutils \
-    findutils \
-    gcc \
-    gcc-c++ \
-    genisoimage \
-    gettext \
-    git \
-    glib2-devel \
-    glibc-langpack-en \
-    glibc-static \
-    glusterfs-api-devel \
-    gnutls-devel \
-    gtk3-devel \
-    hostname \
-    jemalloc-devel \
-    libaio-devel \
-    libasan \
-    libattr-devel \
-    libbpf-devel \
-    libcacard-devel \
-    libcap-ng-devel \
-    libcurl-devel \
-    libdrm-devel \
-    libepoxy-devel \
-    libfdt-devel \
-    libffi-devel \
-    libgcrypt-devel \
-    libiscsi-devel \
-    libjpeg-devel \
-    libnfs-devel \
-    libpmem-devel \
-    libpng-devel \
-    librbd-devel \
-    libseccomp-devel \
-    libselinux-devel \
-    libslirp-devel \
-    libssh-devel \
-    libtasn1-devel \
-    libubsan \
-    libudev-devel \
-    libusbx-devel \
-    libxml2-devel \
-    libzstd-devel \
-    llvm \
-    lzo-devel \
-    make \
-    mesa-libgbm-devel \
-    ncurses-devel \
-    nettle-devel \
-    ninja-build \
-    nmap-ncat \
-    numactl-devel \
-    openssh-clients \
-    pam-devel \
-    perl \
-    perl-Test-Harness \
-    pixman-devel \
-    pkgconfig \
-    pulseaudio-libs-devel \
-    python3 \
-    python3-PyYAML \
-    python3-numpy \
-    python3-pillow \
-    python3-pip \
-    python3-setuptools \
-    python3-sphinx \
-    python3-sphinx_rtd_theme \
-    python3-virtualenv \
-    python3-wheel \
-    rdma-core-devel \
-    rpm \
-    sed \
-    snappy-devel \
-    spice-protocol \
-    spice-server-devel \
-    systemd-devel \
-    systemtap-sdt-devel \
-    tar \
-    texinfo \
-    usbredir-devel \
-    util-linux \
-    virglrenderer-devel \
-    vte291-devel \
-    which \
-    xfsprogs-devel \
-    zlib-devel
+FROM docker.io/library/centos:8
 
-RUN dnf install -y dnf-plugins-core && \
-  dnf config-manager --set-enabled powertools && \
-  dnf install -y centos-release-advanced-virtualization && \
-  dnf install -y epel-release && \
-  dnf install -y $PACKAGES
-RUN rpm -q $PACKAGES | sort > /packages.txt
+RUN dnf update -y && \
+    dnf install 'dnf-command(config-manager)' -y && \
+    dnf config-manager --set-enabled -y powertools && \
+    dnf install -y centos-release-advanced-virtualization && \
+    dnf install -y epel-release && \
+    dnf install -y \
+        SDL2-devel \
+        alsa-lib-devel \
+        bash \
+        bc \
+        brlapi-devel \
+        bzip2 \
+        bzip2-devel \
+        ca-certificates \
+        capstone-devel \
+        ccache \
+        clang \
+        ctags \
+        cyrus-sasl-devel \
+        daxctl-devel \
+        dbus-daemon \
+        device-mapper-multipath-devel \
+        diffutils \
+        findutils \
+        gcc \
+        gcc-c++ \
+        genisoimage \
+        gettext \
+        git \
+        glib2-devel \
+        glib2-static \
+        glibc-langpack-en \
+        glibc-static \
+        glusterfs-api-devel \
+        gnutls-devel \
+        gtk3-devel \
+        hostname \
+        jemalloc-devel \
+        libaio-devel \
+        libasan \
+        libattr-devel \
+        libbpf-devel \
+        libcacard-devel \
+        libcap-ng-devel \
+        libcurl-devel \
+        libdrm-devel \
+        libepoxy-devel \
+        libfdt-devel \
+        libffi-devel \
+        libgcrypt-devel \
+        libiscsi-devel \
+        libjpeg-devel \
+        libnfs-devel \
+        libpmem-devel \
+        libpng-devel \
+        librbd-devel \
+        libseccomp-devel \
+        libselinux-devel \
+        libslirp-devel \
+        libssh-devel \
+        libtasn1-devel \
+        libubsan \
+        libudev-devel \
+        liburing-devel \
+        libusbx-devel \
+        libxml2-devel \
+        libzstd-devel \
+        llvm \
+        lttng-ust-devel \
+        lzo-devel \
+        make \
+        mesa-libgbm-devel \
+        meson \
+        ncurses-devel \
+        nettle-devel \
+        ninja-build \
+        nmap-ncat \
+        numactl-devel \
+        openssh-clients \
+        pam-devel \
+        pcre-static \
+        perl \
+        perl-Test-Harness \
+        pixman-devel \
+        pkgconfig \
+        pulseaudio-libs-devel \
+        python3 \
+        python3-PyYAML \
+        python3-numpy \
+        python3-pillow \
+        python3-pip \
+        python3-sphinx \
+        python3-sphinx_rtd_theme \
+        python3-virtualenv \
+        rdma-core-devel \
+        rpm \
+        sed \
+        snappy-devel \
+        spice-protocol \
+        spice-server-devel \
+        systemd-devel \
+        systemtap-sdt-devel \
+        tar \
+        texinfo \
+        usbredir-devel \
+        util-linux \
+        virglrenderer-devel \
+        vte291-devel \
+        which \
+        xfsprogs-devel \
+        zlib-devel \
+        zlib-static && \
+    dnf autoremove -y && \
+    dnf clean all -y && \
+    rpm -qa | sort > /packages.txt && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/clang && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
+
+ENV LANG "en_US.UTF-8"
+ENV MAKE "/usr/bin/make"
+ENV NINJA "/usr/bin/ninja"
+ENV PYTHON "/usr/bin/python3"
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index b47e25f64b..824b1c0ef2 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -61,6 +61,8 @@ def generate_dockerfile(host, target, cross=None, trailer=None):
    generate(filename, cmd, trailer)
 
 try:
+   generate_dockerfile("centos8", "centos-8")
+
    sys.exit(0)
 except Exception as ex:
    print(str(ex), file=sys.stderr)
-- 
2.30.2


