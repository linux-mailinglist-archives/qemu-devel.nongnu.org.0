Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DED896EA72A
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 11:37:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppn9d-0000Wg-W8; Fri, 21 Apr 2023 05:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn9b-0000W3-LQ
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:34:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn9P-00036O-T4
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:34:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682069635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kIB/QotKeT2p8OO4tQ9BKrq03nO9wZG4in3EzRy+oUA=;
 b=VquH0u4N+dDbKvdgvEjj8d8JcA7n/U+Pvwob5aY/x5sUoyfapQFA6ElsfUPqLGt1ofAlab
 e1RPnoEyvCLXcpps9mXmzGcQDTImQ/qDwLqk7U775c9rLD9vqD6mafDwRtWJYyoa1TLskm
 F7xoxI+mM+cz4SsNUNfQbWXo0emsk/E=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-s8WJQJaGNKWI03Ei1KyrcA-1; Fri, 21 Apr 2023 05:33:53 -0400
X-MC-Unique: s8WJQJaGNKWI03Ei1KyrcA-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-506e62603f6so1384616a12.2
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 02:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682069632; x=1684661632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kIB/QotKeT2p8OO4tQ9BKrq03nO9wZG4in3EzRy+oUA=;
 b=ZtBoIAGlghxizjcZvAT/YsQpcoUvE80pvL3ebepZ5KrOsanf/3sQnlbsfnYg5gQi+k
 qoqA2WCPMBt67yJSYgSgLLuUpaw2N7RWHPXeWmvsZegG2VIwYPRqXfUSvlupmNh99Jpk
 norwd/qitbPVn/c/fBKbQCaOIWuPO0NJEk5uYFi5HHMwCjrhEqw+Jn0GNcsCwA23BaBO
 KDaY4YWDSvo0ZYEtExCcw15LscNYJdMjtlNBOsuYlH5KUeW7UjbdIZajkj9/qAzdJsoO
 hCiVbzrIf8OcxfzVcqHby9NJgweNQ7O3fSTu2d2h6uhvLVA8oBllceEjS8yYBFWusOPt
 3y1g==
X-Gm-Message-State: AAQBX9fsk/Z+DotWTQrSFo4RiDHZCe1cibqKvpxTLDej2CAzhgjyy6Ki
 G8T86vQ1y1CwVgUTxk8QVw1KAFhEs2CshF5F6Rj97ft5xE6B8sqmyn+N88IBaDpwiIzOZSSt2HF
 i+Qg40dnaCxz1GwgpD2ai3seCgqM7kEu9ryEZXIk7n4qbBKycN+59uIZ3eI5Z7E3+bp5esLHDJT
 GYMQ==
X-Received: by 2002:a05:6402:8d1:b0:506:84e0:a78b with SMTP id
 d17-20020a05640208d100b0050684e0a78bmr3677343edz.17.1682069631845; 
 Fri, 21 Apr 2023 02:33:51 -0700 (PDT)
X-Google-Smtp-Source: AKy350bWXCcdhTUUFL+TNwAgN4kAuuHhj3nJb8jen++eVCSJ0zxm2QbUHKeCTzBx3ilChFuYi66X2g==
X-Received: by 2002:a05:6402:8d1:b0:506:84e0:a78b with SMTP id
 d17-20020a05640208d100b0050684e0a78bmr3677333edz.17.1682069631469; 
 Fri, 21 Apr 2023 02:33:51 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a056402165000b0050477decdfasm1669327edx.3.2023.04.21.02.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 02:33:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Krempa <pkrempa@redhat.com>
Subject: [PULL 24/25] tests: libvirt-ci: Update to commit '2fa24dce8bc'
Date: Fri, 21 Apr 2023 11:33:15 +0200
Message-Id: <20230421093316.17941-25-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421093316.17941-1-pbonzini@redhat.com>
References: <20230421093316.17941-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Peter Krempa <pkrempa@redhat.com>

Update to commit which has fixes needed for OpenSUSE 15.4 and
re-generate output files.

Signed-off-by: Peter Krempa <pkrempa@redhat.com>
Message-Id: <bd11b5954d3dd1e989699370af2b9e2e0c77194a.1681735482.git.pkrempa@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/docker/dockerfiles/centos8.docker               | 1 -
 tests/docker/dockerfiles/debian-amd64-cross.docker    | 4 ++--
 tests/docker/dockerfiles/debian-arm64-cross.docker    | 4 ++--
 tests/docker/dockerfiles/debian-armel-cross.docker    | 4 ++--
 tests/docker/dockerfiles/debian-armhf-cross.docker    | 4 ++--
 tests/docker/dockerfiles/debian-mips64el-cross.docker | 4 ++--
 tests/docker/dockerfiles/debian-mipsel-cross.docker   | 4 ++--
 tests/docker/dockerfiles/debian-ppc64el-cross.docker  | 4 ++--
 tests/docker/dockerfiles/debian-s390x-cross.docker    | 4 ++--
 tests/docker/dockerfiles/fedora-win32-cross.docker    | 5 ++---
 tests/docker/dockerfiles/fedora-win64-cross.docker    | 5 ++---
 tests/docker/dockerfiles/fedora.docker                | 5 ++---
 tests/docker/dockerfiles/opensuse-leap.docker         | 1 -
 tests/lcitool/libvirt-ci                              | 2 +-
 14 files changed, 23 insertions(+), 28 deletions(-)

diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 7e3a6217ae2d..1a6a9087c11f 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -100,7 +100,6 @@ RUN dnf distro-sync -y && \
         python38-setuptools \
         python38-wheel \
         rdma-core-devel \
-        rpm \
         sed \
         snappy-devel \
         socat \
diff --git a/tests/docker/dockerfiles/debian-amd64-cross.docker b/tests/docker/dockerfiles/debian-amd64-cross.docker
index afb1cbd04638..2e7eb445f161 100644
--- a/tests/docker/dockerfiles/debian-amd64-cross.docker
+++ b/tests/docker/dockerfiles/debian-amd64-cross.docker
@@ -148,7 +148,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     mkdir -p /usr/local/share/meson/cross && \
-    echo "[binaries]\n\
+    printf "[binaries]\n\
 c = '/usr/bin/x86_64-linux-gnu-gcc'\n\
 ar = '/usr/bin/x86_64-linux-gnu-gcc-ar'\n\
 strip = '/usr/bin/x86_64-linux-gnu-strip'\n\
@@ -158,7 +158,7 @@ pkgconfig = '/usr/bin/x86_64-linux-gnu-pkg-config'\n\
 system = 'linux'\n\
 cpu_family = 'x86_64'\n\
 cpu = 'x86_64'\n\
-endian = 'little'" > /usr/local/share/meson/cross/x86_64-linux-gnu && \
+endian = 'little'\n" > /usr/local/share/meson/cross/x86_64-linux-gnu && \
     dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
     mkdir -p /usr/libexec/ccache-wrappers && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/x86_64-linux-gnu-c++ && \
diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker b/tests/docker/dockerfiles/debian-arm64-cross.docker
index b4f7a7f903ee..f558770f845a 100644
--- a/tests/docker/dockerfiles/debian-arm64-cross.docker
+++ b/tests/docker/dockerfiles/debian-arm64-cross.docker
@@ -147,7 +147,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     mkdir -p /usr/local/share/meson/cross && \
-    echo "[binaries]\n\
+    printf "[binaries]\n\
 c = '/usr/bin/aarch64-linux-gnu-gcc'\n\
 ar = '/usr/bin/aarch64-linux-gnu-gcc-ar'\n\
 strip = '/usr/bin/aarch64-linux-gnu-strip'\n\
@@ -157,7 +157,7 @@ pkgconfig = '/usr/bin/aarch64-linux-gnu-pkg-config'\n\
 system = 'linux'\n\
 cpu_family = 'aarch64'\n\
 cpu = 'aarch64'\n\
-endian = 'little'" > /usr/local/share/meson/cross/aarch64-linux-gnu && \
+endian = 'little'\n" > /usr/local/share/meson/cross/aarch64-linux-gnu && \
     dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
     mkdir -p /usr/libexec/ccache-wrappers && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/aarch64-linux-gnu-c++ && \
diff --git a/tests/docker/dockerfiles/debian-armel-cross.docker b/tests/docker/dockerfiles/debian-armel-cross.docker
index 4b4191f82474..f3d7e07cce5a 100644
--- a/tests/docker/dockerfiles/debian-armel-cross.docker
+++ b/tests/docker/dockerfiles/debian-armel-cross.docker
@@ -146,7 +146,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     mkdir -p /usr/local/share/meson/cross && \
-    echo "[binaries]\n\
+    printf "[binaries]\n\
 c = '/usr/bin/arm-linux-gnueabi-gcc'\n\
 ar = '/usr/bin/arm-linux-gnueabi-gcc-ar'\n\
 strip = '/usr/bin/arm-linux-gnueabi-strip'\n\
@@ -156,7 +156,7 @@ pkgconfig = '/usr/bin/arm-linux-gnueabi-pkg-config'\n\
 system = 'linux'\n\
 cpu_family = 'arm'\n\
 cpu = 'arm'\n\
-endian = 'little'" > /usr/local/share/meson/cross/arm-linux-gnueabi && \
+endian = 'little'\n" > /usr/local/share/meson/cross/arm-linux-gnueabi && \
     dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
     mkdir -p /usr/libexec/ccache-wrappers && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/arm-linux-gnueabi-c++ && \
diff --git a/tests/docker/dockerfiles/debian-armhf-cross.docker b/tests/docker/dockerfiles/debian-armhf-cross.docker
index c9b6b2e56377..531c556ad5aa 100644
--- a/tests/docker/dockerfiles/debian-armhf-cross.docker
+++ b/tests/docker/dockerfiles/debian-armhf-cross.docker
@@ -147,7 +147,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     mkdir -p /usr/local/share/meson/cross && \
-    echo "[binaries]\n\
+    printf "[binaries]\n\
 c = '/usr/bin/arm-linux-gnueabihf-gcc'\n\
 ar = '/usr/bin/arm-linux-gnueabihf-gcc-ar'\n\
 strip = '/usr/bin/arm-linux-gnueabihf-strip'\n\
@@ -157,7 +157,7 @@ pkgconfig = '/usr/bin/arm-linux-gnueabihf-pkg-config'\n\
 system = 'linux'\n\
 cpu_family = 'arm'\n\
 cpu = 'armhf'\n\
-endian = 'little'" > /usr/local/share/meson/cross/arm-linux-gnueabihf && \
+endian = 'little'\n" > /usr/local/share/meson/cross/arm-linux-gnueabihf && \
     dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
     mkdir -p /usr/libexec/ccache-wrappers && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/arm-linux-gnueabihf-c++ && \
diff --git a/tests/docker/dockerfiles/debian-mips64el-cross.docker b/tests/docker/dockerfiles/debian-mips64el-cross.docker
index cfe4f9a0d7fb..816dbd29113f 100644
--- a/tests/docker/dockerfiles/debian-mips64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-mips64el-cross.docker
@@ -144,7 +144,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     mkdir -p /usr/local/share/meson/cross && \
-    echo "[binaries]\n\
+    printf "[binaries]\n\
 c = '/usr/bin/mips64el-linux-gnuabi64-gcc'\n\
 ar = '/usr/bin/mips64el-linux-gnuabi64-gcc-ar'\n\
 strip = '/usr/bin/mips64el-linux-gnuabi64-strip'\n\
@@ -154,7 +154,7 @@ pkgconfig = '/usr/bin/mips64el-linux-gnuabi64-pkg-config'\n\
 system = 'linux'\n\
 cpu_family = 'mips64'\n\
 cpu = 'mips64el'\n\
-endian = 'little'" > /usr/local/share/meson/cross/mips64el-linux-gnuabi64 && \
+endian = 'little'\n" > /usr/local/share/meson/cross/mips64el-linux-gnuabi64 && \
     dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
     mkdir -p /usr/libexec/ccache-wrappers && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/mips64el-linux-gnuabi64-c++ && \
diff --git a/tests/docker/dockerfiles/debian-mipsel-cross.docker b/tests/docker/dockerfiles/debian-mipsel-cross.docker
index 8e521fc9eec9..b115b29af3d6 100644
--- a/tests/docker/dockerfiles/debian-mipsel-cross.docker
+++ b/tests/docker/dockerfiles/debian-mipsel-cross.docker
@@ -144,7 +144,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     mkdir -p /usr/local/share/meson/cross && \
-    echo "[binaries]\n\
+    printf "[binaries]\n\
 c = '/usr/bin/mipsel-linux-gnu-gcc'\n\
 ar = '/usr/bin/mipsel-linux-gnu-gcc-ar'\n\
 strip = '/usr/bin/mipsel-linux-gnu-strip'\n\
@@ -154,7 +154,7 @@ pkgconfig = '/usr/bin/mipsel-linux-gnu-pkg-config'\n\
 system = 'linux'\n\
 cpu_family = 'mips'\n\
 cpu = 'mipsel'\n\
-endian = 'little'" > /usr/local/share/meson/cross/mipsel-linux-gnu && \
+endian = 'little'\n" > /usr/local/share/meson/cross/mipsel-linux-gnu && \
     dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
     mkdir -p /usr/libexec/ccache-wrappers && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/mipsel-linux-gnu-c++ && \
diff --git a/tests/docker/dockerfiles/debian-ppc64el-cross.docker b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
index b1b8277f3f32..301bddb5367a 100644
--- a/tests/docker/dockerfiles/debian-ppc64el-cross.docker
+++ b/tests/docker/dockerfiles/debian-ppc64el-cross.docker
@@ -146,7 +146,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     mkdir -p /usr/local/share/meson/cross && \
-    echo "[binaries]\n\
+    printf "[binaries]\n\
 c = '/usr/bin/powerpc64le-linux-gnu-gcc'\n\
 ar = '/usr/bin/powerpc64le-linux-gnu-gcc-ar'\n\
 strip = '/usr/bin/powerpc64le-linux-gnu-strip'\n\
@@ -156,7 +156,7 @@ pkgconfig = '/usr/bin/powerpc64le-linux-gnu-pkg-config'\n\
 system = 'linux'\n\
 cpu_family = 'ppc64'\n\
 cpu = 'powerpc64le'\n\
-endian = 'little'" > /usr/local/share/meson/cross/powerpc64le-linux-gnu && \
+endian = 'little'\n" > /usr/local/share/meson/cross/powerpc64le-linux-gnu && \
     dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
     mkdir -p /usr/libexec/ccache-wrappers && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/powerpc64le-linux-gnu-c++ && \
diff --git a/tests/docker/dockerfiles/debian-s390x-cross.docker b/tests/docker/dockerfiles/debian-s390x-cross.docker
index af39568ce53f..5d27c91c171a 100644
--- a/tests/docker/dockerfiles/debian-s390x-cross.docker
+++ b/tests/docker/dockerfiles/debian-s390x-cross.docker
@@ -145,7 +145,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     eatmydata apt-get autoremove -y && \
     eatmydata apt-get autoclean -y && \
     mkdir -p /usr/local/share/meson/cross && \
-    echo "[binaries]\n\
+    printf "[binaries]\n\
 c = '/usr/bin/s390x-linux-gnu-gcc'\n\
 ar = '/usr/bin/s390x-linux-gnu-gcc-ar'\n\
 strip = '/usr/bin/s390x-linux-gnu-strip'\n\
@@ -155,7 +155,7 @@ pkgconfig = '/usr/bin/s390x-linux-gnu-pkg-config'\n\
 system = 'linux'\n\
 cpu_family = 's390x'\n\
 cpu = 's390x'\n\
-endian = 'big'" > /usr/local/share/meson/cross/s390x-linux-gnu && \
+endian = 'big'\n" > /usr/local/share/meson/cross/s390x-linux-gnu && \
     dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
     mkdir -p /usr/libexec/ccache-wrappers && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/s390x-linux-gnu-c++ && \
diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index 1fc4c987f751..e7966ec7fd28 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -7,14 +7,14 @@
 FROM registry.fedoraproject.org/fedora:37
 
 RUN dnf install -y nosync && \
-    echo -e '#!/bin/sh\n\
+    printf '#!/bin/sh\n\
 if test -d /usr/lib64\n\
 then\n\
     export LD_PRELOAD=/usr/lib64/nosync/nosync.so\n\
 else\n\
     export LD_PRELOAD=/usr/lib/nosync/nosync.so\n\
 fi\n\
-exec "$@"' > /usr/bin/nosync && \
+exec "$@"\n' > /usr/bin/nosync && \
     chmod +x /usr/bin/nosync && \
     nosync dnf update -y && \
     nosync dnf install -y \
@@ -50,7 +50,6 @@ exec "$@"' > /usr/bin/nosync && \
                python3-pip \
                python3-sphinx \
                python3-sphinx_rtd_theme \
-               rpm \
                sed \
                socat \
                sparse \
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index 39a0617a9dcf..86c3a8f2ac04 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -7,14 +7,14 @@
 FROM registry.fedoraproject.org/fedora:37
 
 RUN dnf install -y nosync && \
-    echo -e '#!/bin/sh\n\
+    printf '#!/bin/sh\n\
 if test -d /usr/lib64\n\
 then\n\
     export LD_PRELOAD=/usr/lib64/nosync/nosync.so\n\
 else\n\
     export LD_PRELOAD=/usr/lib/nosync/nosync.so\n\
 fi\n\
-exec "$@"' > /usr/bin/nosync && \
+exec "$@"\n' > /usr/bin/nosync && \
     chmod +x /usr/bin/nosync && \
     nosync dnf update -y && \
     nosync dnf install -y \
@@ -50,7 +50,6 @@ exec "$@"' > /usr/bin/nosync && \
                python3-pip \
                python3-sphinx \
                python3-sphinx_rtd_theme \
-               rpm \
                sed \
                socat \
                sparse \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index e030c5fb1e4a..b698b7595de1 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -7,14 +7,14 @@
 FROM registry.fedoraproject.org/fedora:37
 
 RUN dnf install -y nosync && \
-    echo -e '#!/bin/sh\n\
+    printf '#!/bin/sh\n\
 if test -d /usr/lib64\n\
 then\n\
     export LD_PRELOAD=/usr/lib64/nosync/nosync.so\n\
 else\n\
     export LD_PRELOAD=/usr/lib/nosync/nosync.so\n\
 fi\n\
-exec "$@"' > /usr/bin/nosync && \
+exec "$@"\n' > /usr/bin/nosync && \
     chmod +x /usr/bin/nosync && \
     nosync dnf update -y && \
     nosync dnf install -y \
@@ -110,7 +110,6 @@ exec "$@"' > /usr/bin/nosync && \
                python3-sphinx \
                python3-sphinx_rtd_theme \
                rdma-core-devel \
-               rpm \
                sed \
                snappy-devel \
                socat \
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index 8e9500e44318..28f153b77b56 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -93,7 +93,6 @@ RUN zypper update -y && \
            python39-pip \
            python39-setuptools \
            rdma-core-devel \
-           rpm \
            sed \
            snappy-devel \
            sndio-devel \
diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
index 232f41f160d4..2fa24dce8bc2 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit 232f41f160d4567b8c82dd52aa96c2bc3a5b75c1
+Subproject commit 2fa24dce8bc2d0d57b02b111dbdbd24e25d4ae95
-- 
2.40.0


