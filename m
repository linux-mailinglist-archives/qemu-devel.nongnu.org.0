Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DEC6A48D7
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 18:58:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWhjA-0003fS-OU; Mon, 27 Feb 2023 12:55:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pWhj8-0003bw-2w
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:55:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pWhj6-0004Q5-AI
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:55:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677520551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+s0vDj5YAU6rk2uhhMSPWslbc7kVjU23Er8HrSInn/E=;
 b=NBCa1vUfaLskFW8n7kwJdp0ujXgGBClKbqI5RsZz0sQ768812ULYFB58pS/10NSQx1WNiS
 RlWrWFb1S7Ms0Mm9qoTPP16FJ8gCCxVmCr81CovebFS9UfjhNAKoLHBO1tzwdxZpLUIRXL
 5btnx6eV+OQzwwpWgRqo9oHlugmwOLk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-628-VUCGu6X2MxyH1Vq0B5YYbw-1; Mon, 27 Feb 2023 12:55:50 -0500
X-MC-Unique: VUCGu6X2MxyH1Vq0B5YYbw-1
Received: by mail-ed1-f71.google.com with SMTP id
 ck7-20020a0564021c0700b004a25d8d7593so9783773edb.0
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 09:55:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+s0vDj5YAU6rk2uhhMSPWslbc7kVjU23Er8HrSInn/E=;
 b=N+gGGHT2VHRan6e5u6WdZ0Bhhf4kJy8pt9TN5KKzz2OsCFoS+wwm3SV8hNoTpIpZ7w
 TX85s/AwtzEfblTJ/fslsOCnFl46+YbtvCSk99/nCjuR2JNzZ0zgMdYbEnuBZeKlon+l
 uK6aVG/Lslqsx3OIYz2eLDvJNu8tMPzFwV3mfc5RxlwLzIeOFk+Dht4B8KH8jP7HFtSw
 AMpk8EgYaZPaOPc9HH7p+qGKv+I0M/uhKqjxIHQVGwyKixw+fit5GQWQyw+yBhte+wZB
 Am8b8whwi6SXuZmFB9F2T5Fz2KMvz8HwmVMtdfAAs7X+cvuNV4X/wWBoN9QmHutzyZoE
 tzYA==
X-Gm-Message-State: AO0yUKXVEBkR+NyJcgvC/A49fA1cGfoAlyVM2xLTgJkMzaM2TjPv/4a0
 Bcju5ArYDOkRIUkIrsFhRBBWwZyNnwFx30sbr68XMcHSKt7/wCbSMwBV+enKgcrVncv2wpcC6L5
 d+Q3z2WQWKb6bAV9ECWqZFqUO0kiltazguKQOdxgomZutPp0abyBXoEpuAUM28pcCMkhKsuHV
X-Received: by 2002:a17:907:3e25:b0:8ed:a0ea:29ee with SMTP id
 hp37-20020a1709073e2500b008eda0ea29eemr11170630ejc.22.1677520548467; 
 Mon, 27 Feb 2023 09:55:48 -0800 (PST)
X-Google-Smtp-Source: AK7set8GIvyJgrSdfSMZz7Nbp7xr4hrUTFEyxvmMp0JnhpnzTaO5GmDSLZENqGIYtBWuOB4C56iNyg==
X-Received: by 2002:a17:907:3e25:b0:8ed:a0ea:29ee with SMTP id
 hp37-20020a1709073e2500b008eda0ea29eemr11170611ejc.22.1677520548184; 
 Mon, 27 Feb 2023 09:55:48 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a50cd09000000b004ac54d4da22sm3432549edi.71.2023.02.27.09.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 09:55:47 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 08/13] ci,
 docker: update CentOS and OpenSUSE Python to non-EOL versions
Date: Mon, 27 Feb 2023 18:55:19 +0100
Message-Id: <20230227175524.710880-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230227175524.710880-1-pbonzini@redhat.com>
References: <20230227175524.710880-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Python 3.6 is at end-of-life.  Update the libvirt-ci module to a
version that supports overrides for targets and package mappings;
this way, QEMU can use the newer versions provided by CentOS 8 (Python
3.8) and OpenSUSE 15.3 (Python 3.9).

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/testing.rst                        |  6 ++
 tests/docker/dockerfiles/centos8.docker       | 22 +++---
 tests/docker/dockerfiles/opensuse-leap.docker | 22 +++---
 tests/docker/dockerfiles/ubuntu2004.docker    |  2 +-
 tests/lcitool/mappings.yml                    | 77 +++++++++++++++++++
 tests/lcitool/targets/centos-stream-8.yml     |  3 +
 tests/lcitool/targets/opensuse-leap-153.yml   |  3 +
 7 files changed, 113 insertions(+), 22 deletions(-)
 create mode 100644 tests/lcitool/mappings.yml
 create mode 100644 tests/lcitool/targets/centos-stream-8.yml
 create mode 100644 tests/lcitool/targets/opensuse-leap-153.yml

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 11c651ca0878..362a26698bcd 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -479,6 +479,12 @@ first to contribute the mapping to the ``libvirt-ci`` project:
    contains the ``mappings.yml`` update.  Then add the prerequisite and
    run ``make lcitool-refresh``.
 
+For enterprise distros that default to old, end-of-life versions of the
+Python runtime, QEMU uses a separate set of mappings that work with more
+recent versions.  These can be found in ``tests/lcitool/mappings.yml``.
+Modifying this file should not be necessary unless the new pre-requisite
+is a Python library or tool.
+
 
 Adding new OS distros
 ^^^^^^^^^^^^^^^^^^^^^
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index fbc953c6dccc..3c74be09a693 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -82,7 +82,6 @@ RUN dnf distro-sync -y && \
         lzo-devel \
         make \
         mesa-libgbm-devel \
-        meson \
         ncurses-devel \
         nettle-devel \
         ninja-build \
@@ -94,13 +93,12 @@ RUN dnf distro-sync -y && \
         pixman-devel \
         pkgconfig \
         pulseaudio-libs-devel \
-        python3 \
-        python3-PyYAML \
-        python3-numpy \
-        python3-pillow \
-        python3-pip \
-        python3-sphinx \
-        python3-sphinx_rtd_theme \
+        python38 \
+        python38-PyYAML \
+        python38-numpy \
+        python38-pip \
+        python38-setuptools \
+        python38-wheel \
         rdma-core-devel \
         rpm \
         sed \
@@ -128,8 +126,14 @@ RUN dnf distro-sync -y && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
 
+RUN /usr/bin/pip3.8 install \
+                    meson==0.63.2 \
+                    pillow \
+                    sphinx \
+                    sphinx-rtd-theme
+
 ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
 ENV NINJA "/usr/bin/ninja"
-ENV PYTHON "/usr/bin/python3"
+ENV PYTHON "/usr/bin/python3.8"
diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index 4b2c02d6abfb..5b8dbf2b83dd 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -89,16 +89,9 @@ RUN zypper update -y && \
            pam-devel \
            pcre-devel-static \
            pkgconfig \
-           python3-Pillow \
-           python3-PyYAML \
-           python3-Sphinx \
-           python3-base \
-           python3-numpy \
-           python3-opencv \
-           python3-pip \
-           python3-setuptools \
-           python3-sphinx_rtd_theme \
-           python3-wheel \
+           python39-base \
+           python39-pip \
+           python39-setuptools \
            rdma-core-devel \
            rpm \
            sed \
@@ -129,10 +122,15 @@ RUN zypper update -y && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
 
-RUN /usr/bin/pip3 install meson==0.56.0
+RUN /usr/bin/pip3.9 install \
+                    PyYAML \
+                    meson==0.63.2 \
+                    pillow \
+                    sphinx \
+                    sphinx-rtd-theme
 
 ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
 ENV NINJA "/usr/bin/ninja"
-ENV PYTHON "/usr/bin/python3"
+ENV PYTHON "/usr/bin/python3.9"
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 13ab0b688726..5b27b89f1c72 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -138,7 +138,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
 
-RUN /usr/bin/pip3 install meson==0.56.0
+RUN /usr/bin/pip3 install meson==0.63.2
 
 ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 ENV LANG "en_US.UTF-8"
diff --git a/tests/lcitool/mappings.yml b/tests/lcitool/mappings.yml
new file mode 100644
index 000000000000..e4719e45516c
--- /dev/null
+++ b/tests/lcitool/mappings.yml
@@ -0,0 +1,77 @@
+mappings:
+  flake8:
+    CentOSStream8:
+    OpenSUSELeap153:
+
+  meson:
+    CentOSStream8:
+    OpenSUSELeap153:
+
+  python3:
+    CentOSStream8: python38
+    OpenSUSELeap153: python39-base
+
+  python3-PyYAML:
+    CentOSStream8: python38-PyYAML
+    OpenSUSELeap153:
+
+  python3-devel:
+    CentOSStream8: python38-devel
+    OpenSUSELeap153: python39-devel
+
+  python3-docutils:
+    CentOSStream8:
+    OpenSUSELeap153:
+
+  python3-numpy:
+    CentOSStream8: python38-numpy
+    OpenSUSELeap153:
+
+  python3-opencv:
+    CentOSStream8:
+    OpenSUSELeap153:
+
+  python3-pillow:
+    CentOSStream8:
+    OpenSUSELeap153:
+
+  python3-pip:
+    CentOSStream8: python38-pip
+    OpenSUSELeap153: python39-pip
+
+  python3-pillow:
+    CentOSStream8:
+    OpenSUSELeap153:
+
+  python3-selinux:
+    CentOSStream8:
+    OpenSUSELeap153:
+
+  python3-setuptools:
+    CentOSStream8: python38-setuptools
+    OpenSUSELeap153: python39-setuptools
+
+  python3-sphinx:
+    CentOSStream8:
+    OpenSUSELeap153:
+
+  python3-sphinx-rtd-theme:
+    CentOSStream8:
+    OpenSUSELeap153:
+
+  python3-venv:
+    CentOSStream8: python38
+    OpenSUSELeap153: python39-base
+
+  python3-wheel:
+    CentOSStream8: python38-wheel
+    OpenSUSELeap153: python39-pip
+
+pypi_mappings:
+  # Request more recent version
+  meson:
+    default: meson==0.63.2
+
+  # Drop packages that need devel headers
+  python3-numpy:
+    OpenSUSELeap153:
diff --git a/tests/lcitool/targets/centos-stream-8.yml b/tests/lcitool/targets/centos-stream-8.yml
new file mode 100644
index 000000000000..6b11160fd1dc
--- /dev/null
+++ b/tests/lcitool/targets/centos-stream-8.yml
@@ -0,0 +1,3 @@
+paths:
+  pip3: /usr/bin/pip3.8
+  python: /usr/bin/python3.8
diff --git a/tests/lcitool/targets/opensuse-leap-153.yml b/tests/lcitool/targets/opensuse-leap-153.yml
new file mode 100644
index 000000000000..683016e0077a
--- /dev/null
+++ b/tests/lcitool/targets/opensuse-leap-153.yml
@@ -0,0 +1,3 @@
+paths:
+  pip3: /usr/bin/pip3.9
+  python: /usr/bin/python3.9
-- 
2.39.1


