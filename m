Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 953D92B3FE1
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 10:35:55 +0100 (CET)
Received: from localhost ([::1]:35698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keavS-0004N7-MO
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 04:35:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <linux@localhost>) id 1keatR-0002vG-6w
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 04:33:49 -0500
Received: from 118-166-46-186.dynamic-ip.hinet.net ([118.166.46.186]:43590
 helo=localhost) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <linux@localhost>) id 1keatP-0007y8-5F
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 04:33:48 -0500
Received: by localhost (Postfix, from userid 1000)
 id 2C308640776; Mon, 16 Nov 2020 17:23:51 +0800 (CST)
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, philmd@redhat.com, wainersm@redhat.com,
 alex.bennee@linaro.org, fam@euphon.net, cfontana@suse.de,
 brogers@suse.com, lyan@suse.com, acho@suse.com, Yu-Chen@localhost
Subject: [PATCH] gitlab-ci.yml: Add openSUSE Tumbleweed and Leap for gitlab
 CI/CD
Date: Mon, 16 Nov 2020 17:23:37 +0800
Message-Id: <20201116092337.7650-1-acho@suse.com>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=118.166.46.186; envelope-from=linux@localhost;
 helo=localhost
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:23:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: 69
X-Spam_score: 6.9
X-Spam_bar: ++++++
X-Spam_report: (6.9 / 5.0 requ) BAYES_00=-1.9, FSL_HELO_NON_FQDN_1=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, HELO_LOCALHOST=3.828,
 KHOP_HELO_FCRDNS=0.399, PDS_RDNS_DYNAMIC_FP=0.001, RCVD_IN_PBL=3.335,
 RCVD_IN_SORBS_DUL=0.001, RDNS_DYNAMIC=0.982, SPF_NONE=0.001,
 TVD_RCVD_IP=0.001 autolearn=no autolearn_force=no
X-Spam_action: reject
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: "Yu-Chen, Cho" <acho@suse.com>
From: "Yu-Chen, Cho" via <qemu-devel@nongnu.org>

Add build-system-opensusetw and build-system-opensuse152 jobs and
add opensuse152.docker and opensusetw.docker dockerfile.
Use openSUSE Tumbleweed and openSUSE Leap 15.2 container image in the
gitlab-CI.

Signed-off-by: Yu-Chen, Cho <acho@suse.com>
---
 .gitlab-ci.d/containers.yml                 | 10 +++
 .gitlab-ci.yml                              | 60 ++++++++++++++
 tests/docker/dockerfiles/opensuse152.docker | 88 ++++++++++++++++++++
 tests/docker/dockerfiles/opensusetw.docker  | 89 +++++++++++++++++++++
 4 files changed, 247 insertions(+)
 create mode 100644 tests/docker/dockerfiles/opensuse152.docker
 create mode 100644 tests/docker/dockerfiles/opensusetw.docker

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 11d079ea58..449a00de70 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -48,6 +48,16 @@ amd64-debian11-container:
   variables:
     NAME: debian11
 
+amd64-opensuseTW-container:
+  <<: *container_job_definition
+  variables:
+    NAME: opensusetw
+
+amd64-opensuse152-container:
+  <<: *container_job_definition
+  variables:
+    NAME: opensuse152
+
 alpha-debian-cross-container:
   <<: *container_job_definition
   stage: containers-layer2
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 9a8b375188..540a700596 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -195,6 +195,66 @@ acceptance-system-centos:
     MAKE_CHECK_ARGS: check-acceptance
   <<: *acceptance_definition
 
+build-system-opensusetw:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: opensusetw
+    TARGETS: s390x-softmmu x86_64-softmmu aarch64-softmmu
+    MAKE_CHECK_ARGS: check-build
+  artifacts:
+    expire_in: 2 days
+    paths:
+      - build
+
+check-system-opensusetw:
+  <<: *native_test_job_definition
+  needs:
+    - job: build-system-opensusetw
+      artifacts: true
+  variables:
+    IMAGE: opensusetw
+    MAKE_CHECK_ARGS: check
+
+acceptance-system-opensusetw:
+  <<: *native_test_job_definition
+  needs:
+    - job: build-system-opensusetw
+      artifacts: true
+  variables:
+    IMAGE: opensusetw
+    MAKE_CHECK_ARGS: check-acceptance
+  <<: *acceptance_definition
+
+build-system-opensuse152:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: opensuse152
+    TARGETS: s390x-softmmu x86_64-softmmu aarch64-softmmu
+    MAKE_CHECK_ARGS: check-build
+  artifacts:
+    expire_in: 2 days
+    paths:
+      - build
+
+check-system-opensuse152:
+  <<: *native_test_job_definition
+  needs:
+    - job: build-system-opensuse152
+      artifacts: true
+  variables:
+    IMAGE: opensuse152
+    MAKE_CHECK_ARGS: check
+
+acceptance-system-opensuse152:
+  <<: *native_test_job_definition
+  needs:
+    - job: build-system-opensuse152
+      artifacts: true
+  variables:
+    IMAGE: opensuse152
+    MAKE_CHECK_ARGS: check-acceptance
+  <<: *acceptance_definition
+
 build-disabled:
   <<: *native_build_job_definition
   variables:
diff --git a/tests/docker/dockerfiles/opensuse152.docker b/tests/docker/dockerfiles/opensuse152.docker
new file mode 100644
index 0000000000..712eb4fe3a
--- /dev/null
+++ b/tests/docker/dockerfiles/opensuse152.docker
@@ -0,0 +1,88 @@
+FROM opensuse/leap:15.2
+
+RUN zypper update -y
+
+# Please keep this list sorted alphabetically
+ENV PACKAGES \
+    bc \
+    brlapi-devel \
+    bzip2 \
+    libzip-devel \
+    ccache \
+    clang \
+    cyrus-sasl-devel \
+    dbus-1 \
+    device-mapper-devel \
+    gcc \
+    gcc-c++ \
+    mkisofs \
+    gettext-runtime \
+    git \
+    glib2-devel \
+    glusterfs-devel \
+    libgnutls-devel \
+    gtk3-devel \
+    hostname \
+    libaio-devel \
+    libasan5 \
+    libattr-devel \
+    libblockdev-devel \
+    libcap-ng-devel \
+    libcurl-devel \
+    libepoxy-devel \
+    libfdt-devel \
+    libiscsi-devel \
+    libjpeg8-devel \
+    libpmem-devel \
+    libpng16-devel \
+    librbd-devel \
+    libseccomp-devel \
+    libssh-devel \
+    libubsan0 \
+    libudev-devel \
+    libxml2-devel \
+    libzstd-devel \
+    llvm \
+    lzo-devel \
+    make \
+    mingw32-filesystem \
+    glibc-devel-32bit \
+    libSDL2_image-devel \
+    mingw64-binutils \
+    nmap \
+    ncat \
+    ncurses-devel \
+    libnettle-devel \
+    ninja \
+    mozilla-nss-devel \
+    libnuma-devel \
+    perl \
+    libpixman-1-0-devel \
+    python3-base \
+    python3-PyYAML \
+    python3-numpy \
+    python3-opencv \
+    python3-Pillow \
+    python3-pip \
+    python3-Sphinx \
+    python3-virtualenv \
+    rdma-core-devel \
+    libSDL2-devel \
+    snappy-devel \
+    sparse \
+    libspice-server-devel \
+    systemd-devel \
+    systemtap-sdt-devel \
+    tar \
+    tesseract-ocr \
+    tesseract-ocr-traineddata-english \
+    usbredir-devel \
+    virglrenderer-devel \
+    libvte-2_91-0 \
+    which \
+    xen-devel \
+    zlib-devel
+ENV QEMU_CONFIGURE_OPTS --python=/usr/bin/python3.8
+
+RUN zypper  --non-interactive install -y $PACKAGES
+RUN rpm -q $PACKAGES | sort > /packages.txt
diff --git a/tests/docker/dockerfiles/opensusetw.docker b/tests/docker/dockerfiles/opensusetw.docker
new file mode 100644
index 0000000000..21edd8039a
--- /dev/null
+++ b/tests/docker/dockerfiles/opensusetw.docker
@@ -0,0 +1,89 @@
+FROM opensuse/tumbleweed
+
+RUN zypper update -y
+
+# Please keep this list sorted alphabetically
+ENV PACKAGES \
+    bc \
+    brlapi-devel \
+    bzip2 \
+    libzip-devel \
+    ccache \
+    clang \
+    cyrus-sasl-devel \
+    dbus-1 \
+    device-mapper-devel \
+    diffutils \
+    gcc \
+    gcc-c++ \
+    mkisofs \
+    gettext-runtime \
+    git \
+    glib2-devel \
+    glusterfs-devel \
+    libgnutls-devel \
+    gtk3-devel \
+    hostname \
+    libaio-devel \
+    libasan5 \
+    libattr-devel \
+    libblockdev-devel \
+    libcap-ng-devel \
+    libcurl-devel \
+    libepoxy-devel \
+    libfdt-devel \
+    libiscsi-devel \
+    libjpeg8-devel \
+    libpmem-devel \
+    libpng16-devel \
+    librbd-devel \
+    libseccomp-devel \
+    libssh-devel \
+    libubsan0 \
+    libudev-devel \
+    libxml2-devel \
+    libzstd-devel \
+    llvm \
+    lzo-devel \
+    make \
+    mingw32-binutils \
+    glibc-devel-32bit \
+    libSDL2_image-devel \
+    mingw64-binutils \
+    nmap \
+    ncat \
+    ncurses-devel \
+    libnettle-devel \
+    ninja \
+    mozilla-nss-devel \
+    libnuma-devel \
+    perl \
+    libpixman-1-0-devel \
+    python38-base \
+    python3-PyYAML \
+    python3-numpy \
+    python3-opencv \
+    python3-Pillow \
+    python3-pip \
+    python3-Sphinx \
+    python3-virtualenv \
+    rdma-core-devel \
+    libSDL2-devel \
+    snappy-devel \
+    sparse \
+    libspice-server-devel \
+    systemd-devel \
+    systemtap-sdt-devel \
+    tar \
+    tesseract-ocr \
+    tesseract-ocr-traineddata-english \
+    usbredir-devel \
+    virglrenderer-devel \
+    libvte-2_91-0 \
+    which \
+    xen-devel \
+    zlib-devel
+ENV QEMU_CONFIGURE_OPTS --python=/usr/bin/python3.8
+
+RUN zypper  --non-interactive install -y $PACKAGES
+RUN rpm -q $PACKAGES | sort > /packages.txt
-- 
2.29.1


