Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8545239F8C3
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 16:16:37 +0200 (CEST)
Received: from localhost ([::1]:39864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqcWy-0002Og-GC
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 10:16:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lqcQh-0003M8-RQ
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 10:10:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lqcQc-000250-Aq
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 10:10:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623161401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BdvZk1xQb7fMsZY72yvoIo9/NU9bCMKfUZ+0QNQ6sdI=;
 b=ZKBVMv6PW4mkm7ouTkSPZUZYWYZwP3ibLs/9NIM2G59GbvVNCGjrJxCsDN7WZ/BBM41sX5
 NKLAke7f3ix7WC5AWO7u/rIvqIeMcKcnFaZP7UJ6DH8ssjZymy/SrOlXaYyEM9cw9n2od4
 gYIE8ZzUSJBSfcAC+RRaL3KGbJuqZWo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-WAQw98TRN2eL2dSyk42i5A-1; Tue, 08 Jun 2021 10:09:59 -0400
X-MC-Unique: WAQw98TRN2eL2dSyk42i5A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 338A48042AA;
 Tue,  8 Jun 2021 14:09:58 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-153.phx2.redhat.com
 [10.3.112.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C0B4E5D9DE;
 Tue,  8 Jun 2021 14:09:53 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] Jobs based on custom runners: add CentOS Stream 8
Date: Tue,  8 Jun 2021 10:09:38 -0400
Message-Id: <20210608140938.863580-5-crosa@redhat.com>
In-Reply-To: <20210608140938.863580-1-crosa@redhat.com>
References: <20210608140938.863580-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 John Snow <jsnow@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This introduces three different parts of a job designed to run
on a custom runner managed by Red Hat.  The goals include:

 a) serve as a model for other organizations that want to onboard
    their own runners, with their specific platforms, build
    configuration and tests.

 b) bring awareness to the differences between upstream QEMU and the
    version available under CentOS Stream, which is "A preview of
    upcoming Red Hat Enterprise Linux minor and major releases.".

 c) becase of b), it should be easier to identify and reduce the gap
    between Red Hat's downstream and upstream QEMU.

The components themselves to achieve this custom job are:

 1) build environment configuration: documentation and a playbook for
    a base Enterprise Linux 8 system (also applicable to CentOS
    Stream), which other users can run on their system to get the
    environment suitable for building QEMU.

 2) QEMU build configuration: how QEMU will be built to match, as
    closely as possible, the binaries built and packaged on CentOS
    stream 8.

 3) job definition: GitLab CI jobs that will dispatch the build/test
    job to the machine specifically configured according to #1.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 .gitlab-ci.d/custom-runners.yml        |  29 ++++
 scripts/ci/org.centos/stream/README    |   2 +
 scripts/ci/org.centos/stream/configure | 190 +++++++++++++++++++++++++
 scripts/ci/setup/build-environment.yml |  38 +++++
 4 files changed, 259 insertions(+)
 create mode 100644 scripts/ci/org.centos/stream/README
 create mode 100755 scripts/ci/org.centos/stream/configure

diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
index 061d3cdfed..ee5143995e 100644
--- a/.gitlab-ci.d/custom-runners.yml
+++ b/.gitlab-ci.d/custom-runners.yml
@@ -220,3 +220,32 @@ ubuntu-20.04-aarch64-notcg:
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
+ - if: '$CI_COMMIT_BRANCH =~ /^staging/'
+ artifacts:
+   name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
+   when: on_failure
+   expire_in: 7 days
+   paths:
+     - build/tests/results/latest/results.xml
+     - build/tests/results/latest/test-results
+   reports:
+     junit: build/tests/results/latest/results.xml
+ script:
+ - mkdir build
+ - cd build
+ - ../scripts/ci/org.centos/stream/configure
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
+ - make get-vm-images
+ # Only run tests that are either marked explicitly for KVM and x86_64
+ # or tests that are supposed to be valid for all targets
+ - ./tests/venv/bin/avocado run --job-results-dir=tests/results/ --filter-by-tags-include-empty --filter-by-tags-include-empty-key -t accel:kvm,arch:x86_64 -- tests/acceptance/
diff --git a/scripts/ci/org.centos/stream/README b/scripts/ci/org.centos/stream/README
new file mode 100644
index 0000000000..f99bda99b8
--- /dev/null
+++ b/scripts/ci/org.centos/stream/README
@@ -0,0 +1,2 @@
+This directory contains scripts for generating a build of QEMU that
+closely matches the CentOS Stream builds of the qemu-kvm package.
diff --git a/scripts/ci/org.centos/stream/configure b/scripts/ci/org.centos/stream/configure
new file mode 100755
index 0000000000..1e7207faec
--- /dev/null
+++ b/scripts/ci/org.centos/stream/configure
@@ -0,0 +1,190 @@
+#!/bin/sh -e
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
+--meson="/usr/bin/meson" \
+--target-list="x86_64-softmmu" \
+--block-drv-rw-whitelist=qcow2,raw,file,host_device,nbd,iscsi,rbd,blkdebug,luks,null-co,nvme,copy-on-read,throttle,gluster \
+--audio-drv-list= \
+--block-drv-ro-whitelist=vmdk,vhdx,vpc,https,ssh \
+--with-coroutine=ucontext \
+--with-git=git \
+--tls-priority=@QEMU,SYSTEM \
+--disable-attr \
+--disable-auth-pam \
+--disable-avx2 \
+--disable-avx512f \
+--disable-bochs \
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
+--disable-fdt \
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
+--disable-jemalloc \
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
+--disable-smartcard \
+--disable-snappy \
+--disable-sparse \
+--disable-spice \
+--disable-strip \
+--disable-system \
+--disable-tcg \
+--disable-tcmalloc \
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
diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
index 664f2f0519..b1e01b1025 100644
--- a/scripts/ci/setup/build-environment.yml
+++ b/scripts/ci/setup/build-environment.yml
@@ -96,3 +96,41 @@
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
2.25.4


