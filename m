Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A532450721
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 15:34:47 +0100 (CET)
Received: from localhost ([::1]:34802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmd4I-0000mE-5D
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 09:34:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mmczE-0001SQ-61
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:29:32 -0500
Received: from [2a00:1450:4864:20::333] (port=39440
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mmczA-0004Nm-F2
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:29:31 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso10709263wmr.4
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 06:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o8NidhQAeu3Zj4LSWXpts9zQXxfPNeNgpwcSRcrdrsE=;
 b=hKoB08unsLDrdatWGSmTp4Q8AcKf4rWQqeZzeunGICk12ddal7C23rq+AwJDO/PsOq
 Nb/+0VGpWXxz1iP7kHUPh4etY9CjHKsX1+XCCKcuBQXZEtD6bp8dH2TyqI17+IuRyRSJ
 bOrhk9Q/5NrhScPSuTEUbYwsDhMMJdBlgJxL54r96wq9AXGs4gFL9qjfKs86X12hzbdS
 H2exAY96UFEXV+hAKelnQk0hXDv1QD47glaV9j6qRJ8RiV8X8+u1tn2gjFiKBQaJPE0V
 MEnUBkeqegOfeN7jZSWBxPynYbngcOMrXvcy+iwuoy+geL3BG03s1bvXpa+4P0poq8kL
 kJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o8NidhQAeu3Zj4LSWXpts9zQXxfPNeNgpwcSRcrdrsE=;
 b=GqvyXwP7TpYfyApISHWJYyebngxI1JQE8e34lK0RUKWae4y1MgO8PJlC+MbA3QGCBU
 EUWpmRGP8010LJj2jyrwYqaVMgvqUg7rZrhYnUiz3YRg920kuI9P7lKxwGyrH/WY7MQx
 BqjNMYbkxopfB9frzJtQ7Vb/humdsQRlogl9qo4zaSnwIYlREyUTEzPoykeRvZ6ahdXC
 xvSQhpxpKDvD5OUhq0r20IokjI+8U+ONxe+DiCu+JGmEgmH6JdSUDLMaCUew2ee92/I9
 AEmYng9UJV6LONY2cSSpChL3IasXI8IJ1sCDcM/3qAXDE29howL1i/yFNcLUlHERLwC6
 LCSg==
X-Gm-Message-State: AOAM530KT8c6rlyizyXKroH1SuH0LcDdeCII+eJ/wCbMKs1uSlN4mAYd
 QnnfdTnIEaruTH2g55SRpOhXlA==
X-Google-Smtp-Source: ABdhPJwVKXk4RVncs5aA9rPu3D0UnLyu3kzZChR42FMwWvPZgZavk1wiyKURY3e//ZLf3AiZ1A+xJg==
X-Received: by 2002:a05:600c:1914:: with SMTP id
 j20mr60237970wmq.26.1636986566912; 
 Mon, 15 Nov 2021 06:29:26 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l21sm5208019wrb.38.2021.11.15.06.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 06:29:23 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7AD211FF9C;
 Mon, 15 Nov 2021 14:29:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 5/6] Jobs based on custom runners: add CentOS Stream 8
Date: Mon, 15 Nov 2021 14:29:14 +0000
Message-Id: <20211115142915.3797652-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211115142915.3797652-1-alex.bennee@linaro.org>
References: <20211115142915.3797652-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cleber Rosa <crosa@redhat.com>

This introduces three different parts of a job designed to run
on a custom runner managed by Red Hat.  The goals include:

  a) propose a model for other organizations that want to onboard
     their own runners, with their specific platforms, build
     configuration and tests.

  b) bring awareness to the differences between upstream QEMU and the
     version available under CentOS Stream, which is "A preview of
     upcoming Red Hat Enterprise Linux minor and major releases".

  c) because of b), it should be easier to identify and reduce the gap
     between Red Hat's downstream and upstream QEMU.

The components of this custom job are:

  I) OS build environment setup code:

     - additions to the existing "build-environment.yml" playbook
       that can be used to set up CentOS/EL 8 systems.

     - a CentOS Stream 8 specific "build-environment.yml" playbook
       that adds to the generic one.

 II) QEMU build configuration: a script that will produce binaries with
     features as similar as possible to the ones built and packaged on
     CentOS stream 8.

III) Scripts that define the minimum amount of testing that the
     binaries built with the given configuration (point II) under the
     given OS build environment (point I) should be subjected to.

 IV) Job definition: GitLab CI jobs that will dispatch the build/test
     jobs (see points #II and #III) to the machine specifically
     configured according to #I.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Tested-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20211111160501.862396-2-crosa@redhat.com>
---
 docs/devel/ci-jobs.rst.inc                    |   7 +
 .gitlab-ci.d/custom-runners.yml               |  29 +++
 .../org.centos/stream/8/build-environment.yml |  51 +++++
 .../ci/org.centos/stream/8/x86_64/configure   | 208 ++++++++++++++++++
 .../org.centos/stream/8/x86_64/test-avocado   |  70 ++++++
 scripts/ci/org.centos/stream/README           |  17 ++
 scripts/ci/setup/build-environment.yml        |  38 ++++
 7 files changed, 420 insertions(+)
 create mode 100644 scripts/ci/org.centos/stream/8/build-environment.yml
 create mode 100755 scripts/ci/org.centos/stream/8/x86_64/configure
 create mode 100755 scripts/ci/org.centos/stream/8/x86_64/test-avocado
 create mode 100644 scripts/ci/org.centos/stream/README

diff --git a/docs/devel/ci-jobs.rst.inc b/docs/devel/ci-jobs.rst.inc
index 277975e4ad..db3f571d5f 100644
--- a/docs/devel/ci-jobs.rst.inc
+++ b/docs/devel/ci-jobs.rst.inc
@@ -49,3 +49,10 @@ S390X_RUNNER_AVAILABLE
 If you've got access to an IBM Z host that can be used as a gitlab-CI
 runner, you can set this variable to enable the tests that require this
 kind of host. The runner should be tagged with "s390x".
+
+CENTOS_STREAM_8_x86_64_RUNNER_AVAILABLE
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+If you've got access to a CentOS Stream 8 x86_64 host that can be
+used as a gitlab-CI runner, you can set this variable to enable the
+tests that require this kind of host. The runner should be tagged with
+both "centos_stream_8" and "x86_64".
diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
index a89a20da48..1f56297dfa 100644
--- a/.gitlab-ci.d/custom-runners.yml
+++ b/.gitlab-ci.d/custom-runners.yml
@@ -248,3 +248,32 @@ ubuntu-20.04-aarch64-notcg:
  - ../configure --disable-libssh --disable-tcg
  - make --output-sync -j`nproc`
  - make --output-sync -j`nproc` check V=1
+
+centos-stream-8-x86_64:
+ allow_failure: true
+ needs: []
+ stage: build
+ tags:
+ - centos_stream_8
+ - x86_64
+ rules:
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+ - if: "$CENTOS_STREAM_8_x86_64_RUNNER_AVAILABLE"
+ artifacts:
+   name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
+   when: on_failure
+   expire_in: 7 days
+   paths:
+     - build/tests/results/latest/results.xml
+     - build/tests/results/latest/test-results
+   reports:
+     junit: build/tests/results/latest/results.xml
+ before_script:
+ - JOBS=$(expr $(nproc) + 1)
+ script:
+ - mkdir build
+ - cd build
+ - ../scripts/ci/org.centos/stream/8/x86_64/configure
+ - make -j"$JOBS"
+ - make NINJA=":" check
+ - ../scripts/ci/org.centos/stream/8/x86_64/test-avocado
diff --git a/scripts/ci/org.centos/stream/8/build-environment.yml b/scripts/ci/org.centos/stream/8/build-environment.yml
new file mode 100644
index 0000000000..42b0471634
--- /dev/null
+++ b/scripts/ci/org.centos/stream/8/build-environment.yml
@@ -0,0 +1,51 @@
+---
+- name: Installation of extra packages to build QEMU
+  hosts: all
+  tasks:
+    - name: Extra check for CentOS Stream 8
+      lineinfile:
+        path: /etc/redhat-release
+        line: CentOS Stream release 8
+        state: present
+      check_mode: yes
+      register: centos_stream_8
+
+    - name: Enable PowerTools repo on CentOS Stream 8
+      ini_file:
+        path: /etc/yum.repos.d/CentOS-Stream-PowerTools.repo
+        section: powertools
+        option: enabled
+        value: "1"
+      when:
+        - ansible_facts['distribution'] == 'CentOS'
+        - ansible_facts['distribution_major_version'] == '8'
+        - centos_stream_8
+
+    - name: Install basic packages to build QEMU on CentOS Stream 8
+      dnf:
+        name:
+          - device-mapper-multipath-devel
+          - glusterfs-api-devel
+          - gnutls-devel
+          - libcap-ng-devel
+          - libcurl-devel
+          - libfdt-devel
+          - libiscsi-devel
+          - libpmem-devel
+          - librados-devel
+          - librbd-devel
+          - libseccomp-devel
+          - libssh-devel
+          - libxkbcommon-devel
+          - ninja-build
+          - numactl-devel
+          - python3-sphinx
+          - redhat-rpm-config
+          - snappy-devel
+          - spice-server-devel
+          - systemd-devel
+        state: present
+      when:
+        - ansible_facts['distribution'] == 'CentOS'
+        - ansible_facts['distribution_major_version'] == '8'
+        - centos_stream_8
diff --git a/scripts/ci/org.centos/stream/8/x86_64/configure b/scripts/ci/org.centos/stream/8/x86_64/configure
new file mode 100755
index 0000000000..048e80dc49
--- /dev/null
+++ b/scripts/ci/org.centos/stream/8/x86_64/configure
@@ -0,0 +1,208 @@
+#!/bin/sh -e
+#
+# Configuration for QEMU based on CentOS Stream 8 x86_64 builds
+#
+# The "configure" command line is based on:
+#
+# https://git.centos.org/rpms/qemu-kvm/blob/c8s-stream-rhel/f/SPECS/qemu-kvm.spec
+#
+# But, because the SPEC file contains a number of conditionals and
+# variable and expansions only available at RPM build time, this version
+# was initially generated from an actual RPM build on an x86_64 platform.
+#
+# From that initial version, options that are required or are a
+# consequence of non-upstream patches have been adapted.  One example
+# is "--without-default-devices" which is *not* present here, given
+# that patches adding downstream specific devices are not available.
+#
+../configure \
+--prefix="/usr" \
+--libdir="/usr/lib64" \
+--datadir="/usr/share" \
+--sysconfdir="/etc" \
+--interp-prefix=/usr/qemu-%M \
+--localstatedir="/var" \
+--docdir="/usr/share/doc" \
+--libexecdir="/usr/libexec" \
+--extra-ldflags="-Wl,--build-id -Wl,-z,relro -Wl,-z,now" \
+--extra-cflags="-O2 -g -pipe -Wall -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -Wp,-D_GLIBCXX_ASSERTIONS -fexceptions -fstack-protector-strong -grecord-gcc-switches -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -specs=/usr/lib/rpm/redhat/redhat-annobin-cc1 -m64 -mtune=generic -fasynchronous-unwind-tables -fstack-clash-protection -fcf-protection" \
+--with-suffix="qemu-kvm" \
+--firmwarepath=/usr/share/qemu-firmware \
+--with-git=meson \
+--with-git-submodules=update \
+--target-list="x86_64-softmmu" \
+--block-drv-rw-whitelist="qcow2,raw,file,host_device,nbd,iscsi,rbd,blkdebug,luks,null-co,nvme,copy-on-read,throttle,gluster" \
+--audio-drv-list="" \
+--block-drv-ro-whitelist="vmdk,vhdx,vpc,https,ssh" \
+--with-coroutine=ucontext \
+--with-git=git \
+--tls-priority=@QEMU,SYSTEM \
+--disable-attr \
+--disable-auth-pam \
+--disable-avx2 \
+--disable-avx512f \
+--disable-bochs \
+--disable-bpf \
+--disable-brlapi \
+--disable-bsd-user \
+--disable-bzip2 \
+--disable-cap-ng \
+--disable-capstone \
+--disable-cfi \
+--disable-cfi-debug \
+--disable-cloop \
+--disable-cocoa \
+--disable-coroutine-pool \
+--disable-crypto-afalg \
+--disable-curl \
+--disable-curses \
+--disable-debug-info \
+--disable-debug-mutex \
+--disable-debug-tcg \
+--disable-dmg \
+--disable-docs \
+--disable-fuse \
+--disable-fuse-lseek \
+--disable-gcrypt \
+--disable-gio \
+--disable-glusterfs \
+--disable-gnutls \
+--disable-gtk \
+--disable-guest-agent \
+--disable-guest-agent-msi \
+--disable-hax \
+--disable-hvf \
+--disable-iconv \
+--disable-kvm \
+--disable-libdaxctl \
+--disable-libiscsi \
+--disable-libnfs \
+--disable-libpmem \
+--disable-libssh \
+--disable-libudev \
+--disable-libusb \
+--disable-libxml2 \
+--disable-linux-aio \
+--disable-linux-io-uring \
+--disable-linux-user \
+--disable-live-block-migration \
+--disable-lto \
+--disable-lzfse \
+--disable-lzo \
+--disable-malloc-trim \
+--disable-membarrier \
+--disable-modules \
+--disable-module-upgrades \
+--disable-mpath \
+--disable-multiprocess \
+--disable-netmap \
+--disable-nettle \
+--disable-numa \
+--disable-nvmm \
+--disable-opengl \
+--disable-parallels \
+--disable-pie \
+--disable-pvrdma \
+--disable-qcow1 \
+--disable-qed \
+--disable-qom-cast-debug \
+--disable-rbd \
+--disable-rdma \
+--disable-replication \
+--disable-rng-none \
+--disable-safe-stack \
+--disable-sanitizers \
+--disable-sdl \
+--disable-sdl-image \
+--disable-seccomp \
+--disable-slirp-smbd \
+--disable-smartcard \
+--disable-snappy \
+--disable-sparse \
+--disable-spice \
+--disable-strip \
+--disable-system \
+--disable-tcg \
+--disable-tools \
+--disable-tpm \
+--disable-u2f \
+--disable-usb-redir \
+--disable-user \
+--disable-vde \
+--disable-vdi \
+--disable-vhost-crypto \
+--disable-vhost-kernel \
+--disable-vhost-net \
+--disable-vhost-scsi \
+--disable-vhost-user \
+--disable-vhost-user-blk-server \
+--disable-vhost-vdpa \
+--disable-vhost-vsock \
+--disable-virglrenderer \
+--disable-virtfs \
+--disable-virtiofsd \
+--disable-vnc \
+--disable-vnc-jpeg \
+--disable-vnc-png \
+--disable-vnc-sasl \
+--disable-vte \
+--disable-vvfat \
+--disable-werror \
+--disable-whpx \
+--disable-xen \
+--disable-xen-pci-passthrough \
+--disable-xfsctl \
+--disable-xkbcommon \
+--disable-zstd \
+--enable-attr \
+--enable-avx2 \
+--enable-cap-ng \
+--enable-capstone \
+--enable-coroutine-pool \
+--enable-curl \
+--enable-debug-info \
+--enable-docs \
+--enable-fdt \
+--enable-gcrypt \
+--enable-glusterfs \
+--enable-gnutls \
+--enable-guest-agent \
+--enable-iconv \
+--enable-kvm \
+--enable-libiscsi \
+--enable-libpmem \
+--enable-libssh \
+--enable-libusb \
+--enable-libudev \
+--enable-linux-aio \
+--enable-lzo \
+--enable-malloc-trim \
+--enable-modules \
+--enable-mpath \
+--enable-numa \
+--enable-opengl \
+--enable-pie \
+--enable-rbd \
+--enable-rdma \
+--enable-seccomp \
+--enable-snappy \
+--enable-smartcard \
+--enable-spice \
+--enable-system \
+--enable-tcg \
+--enable-tools \
+--enable-tpm \
+--enable-trace-backend=dtrace \
+--enable-usb-redir \
+--enable-virtiofsd \
+--enable-vhost-kernel \
+--enable-vhost-net \
+--enable-vhost-user \
+--enable-vhost-user-blk-server \
+--enable-vhost-vdpa \
+--enable-vhost-vsock \
+--enable-vnc \
+--enable-vnc-png \
+--enable-vnc-sasl \
+--enable-werror \
+--enable-xkbcommon
diff --git a/scripts/ci/org.centos/stream/8/x86_64/test-avocado b/scripts/ci/org.centos/stream/8/x86_64/test-avocado
new file mode 100755
index 0000000000..7aeecbcfb8
--- /dev/null
+++ b/scripts/ci/org.centos/stream/8/x86_64/test-avocado
@@ -0,0 +1,70 @@
+#!/bin/sh -e
+#
+# Runs a previously vetted list of tests, either marked explicitly for
+# KVM and x86_64, or tests that are generic enough to be valid for all
+# targets. Such a test list can be generated with:
+#
+# ./tests/venv/bin/avocado list --filter-by-tags-include-empty \
+#   --filter-by-tags-include-empty-key -t accel:kvm,arch:x86_64 \
+#   tests/avocado/
+#
+# This is almost the complete list of avocado based tests available at
+# the time this was compile, with the following exceptions:
+#
+# * Require machine type "x-remote":
+#   - tests/avocado/multiprocess.py:Multiprocess.test_multiprocess_x86_64
+#
+# * Needs superuser privileges:
+#   - tests/avocado/virtiofs_submounts.py:VirtiofsSubmountsTest.test_pre_virtiofsd_set_up
+#   - tests/avocado/virtiofs_submounts.py:VirtiofsSubmountsTest.test_pre_launch_set_up
+#   - tests/avocado/virtiofs_submounts.py:VirtiofsSubmountsTest.test_post_launch_set_up
+#   - tests/avocado/virtiofs_submounts.py:VirtiofsSubmountsTest.test_post_mount_set_up
+#   - tests/avocado/virtiofs_submounts.py:VirtiofsSubmountsTest.test_two_runs
+#
+# * Requires display type "egl-headless":
+#   - tests/avocado/virtio-gpu.py:VirtioGPUx86.test_virtio_vga_virgl
+#   - tests/avocado/virtio-gpu.py:VirtioGPUx86.test_vhost_user_vga_virgl
+#
+#  * Test is marked (unconditionally) to be skipped:
+#   - tests/avocado/virtio_check_params.py:VirtioMaxSegSettingsCheck.test_machine_types
+#
+make get-vm-images
+./tests/venv/bin/avocado run \
+    --job-results-dir=tests/results/ \
+    tests/avocado/boot_linux.py:BootLinuxX8664.test_pc_i440fx_kvm \
+    tests/avocado/boot_linux.py:BootLinuxX8664.test_pc_q35_kvm \
+    tests/avocado/boot_linux_console.py:BootLinuxConsole.test_x86_64_pc \
+    tests/avocado/cpu_queries.py:QueryCPUModelExpansion.test \
+    tests/avocado/empty_cpu_model.py:EmptyCPUModel.test \
+    tests/avocado/hotplug_cpu.py:HotPlugCPU.test \
+    tests/avocado/info_usernet.py:InfoUsernet.test_hostfwd \
+    tests/avocado/intel_iommu.py:IntelIOMMU.test_intel_iommu \
+    tests/avocado/intel_iommu.py:IntelIOMMU.test_intel_iommu_pt \
+    tests/avocado/intel_iommu.py:IntelIOMMU.test_intel_iommu_strict \
+    tests/avocado/intel_iommu.py:IntelIOMMU.test_intel_iommu_strict_cm \
+    tests/avocado/linux_initrd.py:LinuxInitrd.test_with_2gib_file_should_exit_error_msg_with_linux_v3_6 \
+    tests/avocado/linux_initrd.py:LinuxInitrd.test_with_2gib_file_should_work_with_linux_v4_16 \
+    tests/avocado/migration.py:Migration.test_migration_with_exec \
+    tests/avocado/migration.py:Migration.test_migration_with_tcp_localhost \
+    tests/avocado/migration.py:Migration.test_migration_with_unix \
+    tests/avocado/pc_cpu_hotplug_props.py:OmittedCPUProps.test_no_die_id \
+    tests/avocado/replay_kernel.py:ReplayKernelNormal.test_x86_64_pc \
+    tests/avocado/reverse_debugging.py:ReverseDebugging_X86_64.test_x86_64_pc \
+    tests/avocado/version.py:Version.test_qmp_human_info_version \
+    tests/avocado/virtio_version.py:VirtioVersionCheck.test_conventional_devs \
+    tests/avocado/virtio_version.py:VirtioVersionCheck.test_modern_only_devs \
+    tests/avocado/vnc.py:Vnc.test_change_password \
+    tests/avocado/vnc.py:Vnc.test_change_password_requires_a_password \
+    tests/avocado/vnc.py:Vnc.test_no_vnc \
+    tests/avocado/vnc.py:Vnc.test_no_vnc_change_password \
+    tests/avocado/x86_cpu_model_versions.py:CascadelakeArchCapabilities.test_4_0 \
+    tests/avocado/x86_cpu_model_versions.py:CascadelakeArchCapabilities.test_4_1 \
+    tests/avocado/x86_cpu_model_versions.py:CascadelakeArchCapabilities.test_set_4_0 \
+    tests/avocado/x86_cpu_model_versions.py:CascadelakeArchCapabilities.test_unset_4_1 \
+    tests/avocado/x86_cpu_model_versions.py:CascadelakeArchCapabilities.test_v1_4_0 \
+    tests/avocado/x86_cpu_model_versions.py:CascadelakeArchCapabilities.test_v1_set_4_0 \
+    tests/avocado/x86_cpu_model_versions.py:CascadelakeArchCapabilities.test_v2_4_0 \
+    tests/avocado/x86_cpu_model_versions.py:CascadelakeArchCapabilities.test_v2_unset_4_1 \
+    tests/avocado/x86_cpu_model_versions.py:X86CPUModelAliases.test_4_0_alias_compatibility \
+    tests/avocado/x86_cpu_model_versions.py:X86CPUModelAliases.test_4_1_alias \
+    tests/avocado/x86_cpu_model_versions.py:X86CPUModelAliases.test_none_alias
diff --git a/scripts/ci/org.centos/stream/README b/scripts/ci/org.centos/stream/README
new file mode 100644
index 0000000000..e3eadfe3ea
--- /dev/null
+++ b/scripts/ci/org.centos/stream/README
@@ -0,0 +1,17 @@
+This directory contains scripts for generating a build of QEMU that
+closely matches the CentOS Stream[1] builds of the qemu-kvm package.
+
+To have the environment ready to configure, build QEMU and run tests,
+please start with a CentOS Stream machine and:
+
+ * apply the generic "build-environment.yml" playbook located at
+   scripts/ci/setup
+
+ * apply the "build-environment.yml" in the directory following the
+   CentOS Stream version (such as "8").
+
+This currently only covers CentOS Stream 8 environments and
+packages[2].
+
+[1] https://www.centos.org/centos-stream/
+[2] https://git.centos.org/rpms/qemu-kvm/commits/c8s-stream-rhel
diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
index 581c1c75d1..599896cc5b 100644
--- a/scripts/ci/setup/build-environment.yml
+++ b/scripts/ci/setup/build-environment.yml
@@ -114,3 +114,41 @@
       when:
         - ansible_facts['distribution'] == 'Ubuntu'
         - ansible_facts['distribution_version'] == '20.04'
+
+    - name: Install basic packages to build QEMU on EL8
+      dnf:
+        # This list of packages start with tests/docker/dockerfiles/centos8.docker
+        # but only include files that are common to all distro variants and present
+        # in the standard repos (no add-ons)
+        name:
+          - bzip2
+          - bzip2-devel
+          - dbus-daemon
+          - diffutils
+          - gcc
+          - gcc-c++
+          - genisoimage
+          - gettext
+          - git
+          - glib2-devel
+          - libaio-devel
+          - libepoxy-devel
+          - libgcrypt-devel
+          - lzo-devel
+          - make
+          - mesa-libEGL-devel
+          - nettle-devel
+          - nmap-ncat
+          - perl-Test-Harness
+          - pixman-devel
+          - python36
+          - rdma-core-devel
+          - spice-glib-devel
+          - spice-server
+          - systemtap-sdt-devel
+          - tar
+          - zlib-devel
+        state: present
+      when:
+        - ansible_facts['distribution_file_variety'] == 'RedHat'
+        - ansible_facts['distribution_version'] == '8'
-- 
2.30.2


