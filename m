Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC85737A0EB
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 09:36:01 +0200 (CEST)
Received: from localhost ([::1]:52936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgMvw-0003ou-Ub
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 03:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgMqk-0004md-RK
 for qemu-devel@nongnu.org; Tue, 11 May 2021 03:30:38 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:33692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgMqg-00005A-PI
 for qemu-devel@nongnu.org; Tue, 11 May 2021 03:30:38 -0400
Received: by mail-wr1-x431.google.com with SMTP id n2so19098764wrm.0
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 00:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wHqXbmfdPqF+m665xLulV4uJW1BKrmZ0QzFHy8r/cXQ=;
 b=KMmb5qvfquYHhNne43MapBMCZSb8O5zjC58cVO3qR2D9rz90bryuUJ72MW7cKcZh9Y
 U9nZeDldpzwwKhNjdN6IiD75VUnNzPv2EJ9OgH+XDv9ib0oWG7vl0eNo/Qo6IVp4yZC9
 F838RKt0F+6NVdBUw/PO+WOrwVbHLTVwiXzSfabRkMf27PEjNdO3UqnowdR4LuU3Kqvn
 usDdk7c8HnPt+rz90SOfdWSKawLoty9acEsBtE4XdovxvbDmX5DbBQXrudAWIo0w4sK2
 DVKLxf8b5v3a9+s2BTk3MBLDwWEc/936MKA2o8hgl1YfuuW8usAf3se6P2rcHaRcgaOm
 Nk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wHqXbmfdPqF+m665xLulV4uJW1BKrmZ0QzFHy8r/cXQ=;
 b=FcaSO6uVOF+wTgSFIUSWv4G+KWx8J7yG5v1sj1QhAgcP8VRm/dKN3RSMx0g4WpOxK1
 +CI5rc+h+cGNjT6z4KoD5R6uayk3uQRRdXwvfP+5I8pA/tr/FmUcuPYXt/zcWIfGKXVU
 DueQf1ODxJoLGjiB94L4T3Upy2YVGb27qNmU0RGt7CDP6fN9yGpICCIVRJtk9xcCXIOC
 xzSlY370gaHp7rPD9cIqnngDlnWbGstQXNpzGkhRPToocyhkOQBkcKaP34QNrPxhp0KF
 jdQ3YCWLjHMOUyuXjWai3YO087PQfEQhKdx6vvj+I99tXb+4SVbsLI+X8Hca/hRQZG+7
 zdcA==
X-Gm-Message-State: AOAM53243yhtbARTpPLDAneoZj0KARkQoDD35DGAM2v4hCq9J2n9HxxJ
 w6MZsv+liD6BQ30tsPGxRuc+MUVXBYP+sA==
X-Google-Smtp-Source: ABdhPJx8slKr9VtPMzuDem8utkFrwrn/RQQGozbTOpzROfbKP1I7aG1K8mDAjUFQcLB3P21VQjt3eg==
X-Received: by 2002:a05:6000:1b06:: with SMTP id
 f6mr35583916wrz.339.1620718232790; 
 Tue, 11 May 2021 00:30:32 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id g129sm2809753wmg.27.2021.05.11.00.30.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 00:30:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/10] gitlab-ci: Extract all default build/test jobs to
 buildtest.yml
Date: Tue, 11 May 2021 09:29:50 +0200
Message-Id: <20210511072952.2813358-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210511072952.2813358-1-f4bug@amsat.org>
References: <20210511072952.2813358-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract the build/test jobs run by default on the mainstream
CI into a new file (buildtest.yml).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/buildtest.yml | 726 +++++++++++++++++++++++++++++++++++++
 .gitlab-ci.yml             | 726 +------------------------------------
 2 files changed, 727 insertions(+), 725 deletions(-)
 create mode 100644 .gitlab-ci.d/buildtest.yml

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
new file mode 100644
index 00000000000..67114e8954a
--- /dev/null
+++ b/.gitlab-ci.d/buildtest.yml
@@ -0,0 +1,726 @@
+include:
+  - local: '/.gitlab-ci.d/buildtest-template.yml'
+
+build-system-alpine:
+  extends: .native_build_job_template
+  needs:
+    - job: amd64-alpine-container
+  variables:
+    IMAGE: alpine
+    TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
+      moxie-softmmu microblazeel-softmmu mips64el-softmmu
+    MAKE_CHECK_ARGS: check-build
+    CONFIGURE_ARGS: --enable-docs --enable-trace-backends=log,simple,syslog
+  artifacts:
+    expire_in: 2 days
+    paths:
+      - .git-submodule-status
+      - build
+
+check-system-alpine:
+  extends: .native_test_job_template
+  needs:
+    - job: build-system-alpine
+      artifacts: true
+  variables:
+    IMAGE: alpine
+    MAKE_CHECK_ARGS: check
+
+acceptance-system-alpine:
+  extends: .integration_test_job_template
+  needs:
+    - job: build-system-alpine
+      artifacts: true
+  variables:
+    IMAGE: alpine
+    MAKE_CHECK_ARGS: check-acceptance
+
+build-system-ubuntu:
+  extends: .native_build_job_template
+  needs:
+    job: amd64-ubuntu2004-container
+  variables:
+    IMAGE: ubuntu2004
+    CONFIGURE_ARGS: --enable-docs --enable-fdt=system --enable-slirp=system
+    TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
+      moxie-softmmu microblazeel-softmmu mips64el-softmmu
+    MAKE_CHECK_ARGS: check-build
+  artifacts:
+    expire_in: 2 days
+    paths:
+      - build
+
+check-system-ubuntu:
+  extends: .native_test_job_template
+  needs:
+    - job: build-system-ubuntu
+      artifacts: true
+  variables:
+    IMAGE: ubuntu2004
+    MAKE_CHECK_ARGS: check
+
+acceptance-system-ubuntu:
+  extends: .integration_test_job_template
+  needs:
+    - job: build-system-ubuntu
+      artifacts: true
+  variables:
+    IMAGE: ubuntu2004
+    MAKE_CHECK_ARGS: check-acceptance
+
+build-system-debian:
+  extends: .native_build_job_template
+  needs:
+    job: amd64-debian-container
+  variables:
+    IMAGE: debian-amd64
+    CONFIGURE_ARGS: --enable-fdt=system
+    TARGETS: arm-softmmu avr-softmmu i386-softmmu mipsel-softmmu
+      riscv64-softmmu sh4eb-softmmu sparc-softmmu xtensaeb-softmmu
+    MAKE_CHECK_ARGS: check-build
+  artifacts:
+    expire_in: 2 days
+    paths:
+      - build
+
+check-system-debian:
+  extends: .native_test_job_template
+  needs:
+    - job: build-system-debian
+      artifacts: true
+  variables:
+    IMAGE: debian-amd64
+    MAKE_CHECK_ARGS: check
+
+acceptance-system-debian:
+  extends: .integration_test_job_template
+  needs:
+    - job: build-system-debian
+      artifacts: true
+  variables:
+    IMAGE: debian-amd64
+    MAKE_CHECK_ARGS: check-acceptance
+
+build-system-fedora:
+  extends: .native_build_job_template
+  needs:
+    job: amd64-fedora-container
+  variables:
+    IMAGE: fedora
+    CONFIGURE_ARGS: --disable-gcrypt --enable-nettle --enable-docs
+             --enable-fdt=system --enable-slirp=system --enable-capstone=system
+    TARGETS: tricore-softmmu microblaze-softmmu mips-softmmu
+      xtensa-softmmu m68k-softmmu riscv32-softmmu ppc-softmmu sparc64-softmmu
+    MAKE_CHECK_ARGS: check-build
+  artifacts:
+    expire_in: 2 days
+    paths:
+      - build
+
+check-system-fedora:
+  extends: .native_test_job_template
+  needs:
+    - job: build-system-fedora
+      artifacts: true
+  variables:
+    IMAGE: fedora
+    MAKE_CHECK_ARGS: check
+
+acceptance-system-fedora:
+  extends: .integration_test_job_template
+  needs:
+    - job: build-system-fedora
+      artifacts: true
+  variables:
+    IMAGE: fedora
+    MAKE_CHECK_ARGS: check-acceptance
+
+build-system-centos:
+  extends: .native_build_job_template
+  needs:
+    job: amd64-centos8-container
+  variables:
+    IMAGE: centos8
+    CONFIGURE_ARGS: --disable-nettle --enable-gcrypt --enable-fdt=system
+                    --enable-modules --enable-trace-backends=dtrace
+    TARGETS: ppc64-softmmu or1k-softmmu s390x-softmmu
+      x86_64-softmmu rx-softmmu sh4-softmmu nios2-softmmu
+    MAKE_CHECK_ARGS: check-build
+  artifacts:
+    expire_in: 2 days
+    paths:
+      - build
+
+check-system-centos:
+  extends: .native_test_job_template
+  needs:
+    - job: build-system-centos
+      artifacts: true
+  variables:
+    IMAGE: centos8
+    MAKE_CHECK_ARGS: check
+
+acceptance-system-centos:
+  extends: .integration_test_job_template
+  needs:
+    - job: build-system-centos
+      artifacts: true
+  variables:
+    IMAGE: centos8
+    MAKE_CHECK_ARGS: check-acceptance
+
+build-system-opensuse:
+  extends: .native_build_job_template
+  needs:
+    job: amd64-opensuse-leap-container
+  variables:
+    IMAGE: opensuse-leap
+    CONFIGURE_ARGS: --enable-fdt=system
+    TARGETS: s390x-softmmu x86_64-softmmu aarch64-softmmu
+    MAKE_CHECK_ARGS: check-build
+  artifacts:
+    expire_in: 2 days
+    paths:
+      - build
+
+check-system-opensuse:
+  extends: .native_test_job_template
+  needs:
+    - job: build-system-opensuse
+      artifacts: true
+  variables:
+    IMAGE: opensuse-leap
+    MAKE_CHECK_ARGS: check
+
+acceptance-system-opensuse:
+  extends: .integration_test_job_template
+  needs:
+    - job: build-system-opensuse
+      artifacts: true
+  variables:
+    IMAGE: opensuse-leap
+    MAKE_CHECK_ARGS: check-acceptance
+
+
+build-disabled:
+  extends: .native_build_job_template
+  needs:
+    job: amd64-fedora-container
+  variables:
+    IMAGE: fedora
+    CONFIGURE_ARGS:
+      --disable-attr
+      --disable-auth-pam
+      --disable-avx2
+      --disable-bochs
+      --disable-brlapi
+      --disable-bzip2
+      --disable-cap-ng
+      --disable-capstone
+      --disable-cloop
+      --disable-coroutine-pool
+      --disable-curl
+      --disable-curses
+      --disable-dmg
+      --disable-docs
+      --disable-gcrypt
+      --disable-glusterfs
+      --disable-gnutls
+      --disable-gtk
+      --disable-guest-agent
+      --disable-iconv
+      --disable-keyring
+      --disable-kvm
+      --disable-libiscsi
+      --disable-libpmem
+      --disable-libssh
+      --disable-libudev
+      --disable-libusb
+      --disable-libxml2
+      --disable-linux-aio
+      --disable-live-block-migration
+      --disable-lzo
+      --disable-malloc-trim
+      --disable-mpath
+      --disable-nettle
+      --disable-numa
+      --disable-opengl
+      --disable-parallels
+      --disable-pie
+      --disable-qcow1
+      --disable-qed
+      --disable-qom-cast-debug
+      --disable-rbd
+      --disable-rdma
+      --disable-replication
+      --disable-sdl
+      --disable-seccomp
+      --disable-sheepdog
+      --disable-slirp
+      --disable-smartcard
+      --disable-snappy
+      --disable-sparse
+      --disable-spice
+      --disable-strip
+      --disable-tpm
+      --disable-usb-redir
+      --disable-vdi
+      --disable-vhost-crypto
+      --disable-vhost-net
+      --disable-vhost-scsi
+      --disable-vhost-kernel
+      --disable-vhost-user
+      --disable-vhost-vdpa
+      --disable-vhost-vsock
+      --disable-virglrenderer
+      --disable-vnc
+      --disable-vte
+      --disable-vvfat
+      --disable-xen
+      --disable-zstd
+    TARGETS: arm-softmmu i386-softmmu ppc64-softmmu mips64-softmmu
+      s390x-softmmu i386-linux-user
+    MAKE_CHECK_ARGS: check-qtest SPEED=slow
+
+# This jobs explicitly disable TCG (--disable-tcg), KVM is detected by
+# the configure script. The container doesn't contain Xen headers so
+# Xen accelerator is not detected / selected. As result it build the
+# i386-softmmu and x86_64-softmmu with KVM being the single accelerator
+# available.
+# Also use a different coroutine implementation (which is only really of
+# interest to KVM users, i.e. with TCG disabled)
+build-tcg-disabled:
+  extends: .native_build_job_template
+  needs:
+    job: amd64-centos8-container
+  variables:
+    IMAGE: centos8
+  script:
+    - mkdir build
+    - cd build
+    - ../configure --disable-tcg --audio-drv-list="" --with-coroutine=ucontext
+      || { cat config.log meson-logs/meson-log.txt && exit 1; }
+    - make -j"$JOBS"
+    - make check-unit
+    - make check-qapi-schema
+    - cd tests/qemu-iotests/
+    - ./check -raw 001 002 003 004 005 008 009 010 011 012 021 025 032 033 048
+            052 063 077 086 101 104 106 113 148 150 151 152 157 159 160 163
+            170 171 183 184 192 194 197 208 215 221 222 226 227 236 253 277
+    - ./check -qcow2 028 051 056 057 058 065 068 082 085 091 095 096 102 122
+            124 132 139 142 144 145 151 152 155 157 165 194 196 197 200 202
+            208 209 215 216 218 222 227 234 246 247 248 250 254 255 257 258
+            260 261 262 263 264 270 272 273 277 279
+
+build-user:
+  extends: .native_build_job_template
+  needs:
+    job: amd64-debian-user-cross-container
+  variables:
+    IMAGE: debian-all-test-cross
+    CONFIGURE_ARGS: --disable-tools --disable-system
+    MAKE_CHECK_ARGS: check-tcg
+
+build-user-static:
+  extends: .native_build_job_template
+  needs:
+    job: amd64-debian-user-cross-container
+  variables:
+    IMAGE: debian-all-test-cross
+    CONFIGURE_ARGS: --disable-tools --disable-system --static
+    MAKE_CHECK_ARGS: check-tcg
+
+# Only build the softmmu targets we have check-tcg tests for
+build-some-softmmu:
+  extends: .native_build_job_template
+  needs:
+    job: amd64-debian-user-cross-container
+  variables:
+    IMAGE: debian-all-test-cross
+    CONFIGURE_ARGS: --disable-tools --enable-debug
+    TARGETS: xtensa-softmmu arm-softmmu aarch64-softmmu alpha-softmmu
+    MAKE_CHECK_ARGS: check-tcg
+
+# Run check-tcg against linux-user (with plugins)
+# we skip sparc64-linux-user until it has been fixed somewhat
+# we skip cris-linux-user as it doesn't use the common run loop
+build-user-plugins:
+  extends: .native_build_job_template
+  needs:
+    job: amd64-debian-user-cross-container
+  variables:
+    IMAGE: debian-all-test-cross
+    CONFIGURE_ARGS: --disable-tools --disable-system --enable-plugins --enable-debug-tcg --target-list-exclude=sparc64-linux-user,cris-linux-user
+    MAKE_CHECK_ARGS: check-tcg
+  timeout: 1h 30m
+
+build-user-centos7:
+  extends: .native_build_job_template
+  needs:
+    job: amd64-centos7-container
+  variables:
+    IMAGE: centos7
+    CONFIGURE_ARGS: --disable-system --disable-tools --disable-docs
+    MAKE_CHECK_ARGS: check-tcg
+
+build-some-softmmu-plugins:
+  extends: .native_build_job_template
+  needs:
+    job: amd64-debian-user-cross-container
+  variables:
+    IMAGE: debian-all-test-cross
+    CONFIGURE_ARGS: --disable-tools --disable-user --enable-plugins --enable-debug-tcg
+    TARGETS: xtensa-softmmu arm-softmmu aarch64-softmmu alpha-softmmu
+    MAKE_CHECK_ARGS: check-tcg
+
+clang-system:
+  extends: .native_build_job_template
+  needs:
+    job: amd64-fedora-container
+  variables:
+    IMAGE: fedora
+    CONFIGURE_ARGS: --cc=clang --cxx=clang++
+      --extra-cflags=-fsanitize=undefined --extra-cflags=-fno-sanitize-recover=undefined
+    TARGETS: alpha-softmmu arm-softmmu m68k-softmmu mips64-softmmu
+      ppc-softmmu s390x-softmmu
+    MAKE_CHECK_ARGS: check-qtest check-tcg
+
+clang-user:
+  extends: .native_build_job_template
+  needs:
+    job: amd64-debian-user-cross-container
+  variables:
+    IMAGE: debian-all-test-cross
+    CONFIGURE_ARGS: --cc=clang --cxx=clang++ --disable-system
+      --target-list-exclude=microblazeel-linux-user,aarch64_be-linux-user,i386-linux-user,m68k-linux-user,mipsn32el-linux-user,xtensaeb-linux-user
+      --extra-cflags=-fsanitize=undefined --extra-cflags=-fno-sanitize-recover=undefined
+    MAKE_CHECK_ARGS: check-unit check-tcg
+
+# Set LD_JOBS=1 because this requires LTO and ld consumes a large amount of memory.
+# On gitlab runners, default value sometimes end up calling 2 lds concurrently and
+# triggers an Out-Of-Memory error
+#
+# Since slirp callbacks are used in QEMU Timers, slirp needs to be compiled together
+# with QEMU and linked as a static library to avoid false positives in CFI checks.
+# This can be accomplished by using -enable-slirp=git, which avoids the use of
+# a system-wide version of the library
+#
+# Split in three sets of build/check/acceptance to limit the execution time of each
+# job
+build-cfi-aarch64:
+  extends: .native_build_job_template
+  needs:
+  - job: amd64-fedora-container
+  variables:
+    LD_JOBS: 1
+    AR: llvm-ar
+    IMAGE: fedora
+    CONFIGURE_ARGS: --cc=clang --cxx=clang++ --enable-cfi --enable-cfi-debug
+      --enable-safe-stack --enable-slirp=git
+    TARGETS: aarch64-softmmu
+    MAKE_CHECK_ARGS: check-build
+  timeout: 70m
+  artifacts:
+    expire_in: 2 days
+    paths:
+      - build
+
+check-cfi-aarch64:
+  extends: .native_test_job_template
+  needs:
+    - job: build-cfi-aarch64
+      artifacts: true
+  variables:
+    IMAGE: fedora
+    MAKE_CHECK_ARGS: check
+
+acceptance-cfi-aarch64:
+  extends: .integration_test_job_template
+  needs:
+    - job: build-cfi-aarch64
+      artifacts: true
+  variables:
+    IMAGE: fedora
+    MAKE_CHECK_ARGS: check-acceptance
+
+build-cfi-ppc64-s390x:
+  extends: .native_build_job_template
+  needs:
+  - job: amd64-fedora-container
+  variables:
+    LD_JOBS: 1
+    AR: llvm-ar
+    IMAGE: fedora
+    CONFIGURE_ARGS: --cc=clang --cxx=clang++ --enable-cfi --enable-cfi-debug
+      --enable-safe-stack --enable-slirp=git
+    TARGETS: ppc64-softmmu s390x-softmmu
+    MAKE_CHECK_ARGS: check-build
+  timeout: 70m
+  artifacts:
+    expire_in: 2 days
+    paths:
+      - build
+
+check-cfi-ppc64-s390x:
+  extends: .native_test_job_template
+  needs:
+    - job: build-cfi-ppc64-s390x
+      artifacts: true
+  variables:
+    IMAGE: fedora
+    MAKE_CHECK_ARGS: check
+
+acceptance-cfi-ppc64-s390x:
+  extends: .integration_test_job_template
+  needs:
+    - job: build-cfi-ppc64-s390x
+      artifacts: true
+  variables:
+    IMAGE: fedora
+    MAKE_CHECK_ARGS: check-acceptance
+
+build-cfi-x86_64:
+  extends: .native_build_job_template
+  needs:
+  - job: amd64-fedora-container
+  variables:
+    LD_JOBS: 1
+    AR: llvm-ar
+    IMAGE: fedora
+    CONFIGURE_ARGS: --cc=clang --cxx=clang++ --enable-cfi --enable-cfi-debug
+      --enable-safe-stack --enable-slirp=git
+    TARGETS: x86_64-softmmu
+    MAKE_CHECK_ARGS: check-build
+  timeout: 70m
+  artifacts:
+    expire_in: 2 days
+    paths:
+      - build
+
+check-cfi-x86_64:
+  extends: .native_test_job_template
+  needs:
+    - job: build-cfi-x86_64
+      artifacts: true
+  variables:
+    IMAGE: fedora
+    MAKE_CHECK_ARGS: check
+
+acceptance-cfi-x86_64:
+  extends: .integration_test_job_template
+  needs:
+    - job: build-cfi-x86_64
+      artifacts: true
+  variables:
+    IMAGE: fedora
+    MAKE_CHECK_ARGS: check-acceptance
+
+tsan-build:
+  extends: .native_build_job_template
+  needs:
+    job: amd64-ubuntu2004-container
+  variables:
+    IMAGE: ubuntu2004
+    CONFIGURE_ARGS: --enable-tsan --cc=clang-10 --cxx=clang++-10
+          --enable-trace-backends=ust --enable-fdt=system --enable-slirp=system
+    TARGETS: x86_64-softmmu ppc64-softmmu riscv64-softmmu x86_64-linux-user
+    MAKE_CHECK_ARGS: bench V=1
+
+# These targets are on the way out
+build-deprecated:
+  extends: .native_build_job_template
+  needs:
+    job: amd64-debian-user-cross-container
+  variables:
+    IMAGE: debian-all-test-cross
+    CONFIGURE_ARGS: --disable-tools
+    MAKE_CHECK_ARGS: build-tcg
+    TARGETS: ppc64abi32-linux-user lm32-softmmu unicore32-softmmu
+  artifacts:
+    expire_in: 2 days
+    paths:
+      - build
+
+# We split the check-tcg step as test failures are expected but we still
+# want to catch the build breaking.
+check-deprecated:
+  extends: .native_test_job_template
+  needs:
+    - job: build-deprecated
+      artifacts: true
+  variables:
+    IMAGE: debian-all-test-cross
+    MAKE_CHECK_ARGS: check-tcg
+  allow_failure: true
+
+# gprof/gcov are GCC features
+gprof-gcov:
+  extends: .native_build_job_template
+  needs:
+    job: amd64-ubuntu2004-container
+  variables:
+    IMAGE: ubuntu2004
+    CONFIGURE_ARGS: --enable-gprof --enable-gcov
+    MAKE_CHECK_ARGS: check
+    TARGETS: aarch64-softmmu ppc64-softmmu s390x-softmmu x86_64-softmmu
+  timeout: 70m
+  after_script:
+    - ${CI_PROJECT_DIR}/scripts/ci/coverage-summary.sh
+
+build-oss-fuzz:
+  extends: .native_build_job_template
+  needs:
+    job: amd64-fedora-container
+  variables:
+    IMAGE: fedora
+  script:
+    - mkdir build-oss-fuzz
+    - CC="clang" CXX="clang++" CFLAGS="-fsanitize=address"
+      ./scripts/oss-fuzz/build.sh
+    - export ASAN_OPTIONS="fast_unwind_on_malloc=0"
+    - for fuzzer in $(find ./build-oss-fuzz/DEST_DIR/ -executable -type f
+                      | grep -v slirp); do
+        grep "LLVMFuzzerTestOneInput" ${fuzzer} > /dev/null 2>&1 || continue ;
+        echo Testing ${fuzzer} ... ;
+        "${fuzzer}" -runs=1 -seed=1 || exit 1 ;
+      done
+    # Unrelated to fuzzer: run some tests with -fsanitize=address
+    - cd build-oss-fuzz && make check-qtest-i386 check-unit
+
+build-tci:
+  extends: .native_build_job_template
+  needs:
+    job: amd64-debian-user-cross-container
+  variables:
+    IMAGE: debian-all-test-cross
+  script:
+    - TARGETS="aarch64 alpha arm hppa m68k microblaze moxie ppc64 s390x x86_64"
+    - mkdir build
+    - cd build
+    - ../configure --enable-tcg-interpreter
+        --target-list="$(for tg in $TARGETS; do echo -n ${tg}'-softmmu '; done)" || { cat config.log meson-logs/meson-log.txt && exit 1; }
+    - make -j"$JOBS"
+    - make tests/qtest/boot-serial-test tests/qtest/cdrom-test tests/qtest/pxe-test
+    - for tg in $TARGETS ; do
+        export QTEST_QEMU_BINARY="./qemu-system-${tg}" ;
+        ./tests/qtest/boot-serial-test || exit 1 ;
+        ./tests/qtest/cdrom-test || exit 1 ;
+      done
+    - QTEST_QEMU_BINARY="./qemu-system-x86_64" ./tests/qtest/pxe-test
+    - QTEST_QEMU_BINARY="./qemu-system-s390x" ./tests/qtest/pxe-test -m slow
+    - make check-tcg
+
+# Alternate coroutines implementations are only really of interest to KVM users
+# However we can't test against KVM on Gitlab-CI so we can only run unit tests
+build-coroutine-sigaltstack:
+  extends: .native_build_job_template
+  needs:
+    job: amd64-ubuntu2004-container
+  variables:
+    IMAGE: ubuntu2004
+    CONFIGURE_ARGS: --with-coroutine=sigaltstack --disable-tcg
+                    --enable-trace-backends=ftrace
+    MAKE_CHECK_ARGS: check-unit
+
+# Most jobs test latest gcrypt or nettle builds
+#
+# These jobs test old gcrypt and nettle from RHEL7
+# which had some API differences.
+crypto-old-nettle:
+  extends: .native_build_job_template
+  needs:
+    job: amd64-centos7-container
+  variables:
+    IMAGE: centos7
+    TARGETS: x86_64-softmmu x86_64-linux-user
+    CONFIGURE_ARGS: --disable-gcrypt --enable-nettle
+    MAKE_CHECK_ARGS: check
+
+crypto-old-gcrypt:
+  extends: .native_build_job_template
+  needs:
+    job: amd64-centos7-container
+  variables:
+    IMAGE: centos7
+    TARGETS: x86_64-softmmu x86_64-linux-user
+    CONFIGURE_ARGS: --disable-nettle --enable-gcrypt
+    MAKE_CHECK_ARGS: check
+
+crypto-only-gnutls:
+  extends: .native_build_job_template
+  needs:
+    job: amd64-centos7-container
+  variables:
+    IMAGE: centos7
+    TARGETS: x86_64-softmmu x86_64-linux-user
+    CONFIGURE_ARGS: --disable-nettle --disable-gcrypt --enable-gnutls
+    MAKE_CHECK_ARGS: check
+
+
+# Check our reduced build configurations
+build-without-default-devices:
+  extends: .native_build_job_template
+  needs:
+    job: amd64-centos8-container
+  variables:
+    IMAGE: centos8
+    CONFIGURE_ARGS: --without-default-devices --disable-user
+
+build-without-default-features:
+  extends: .native_build_job_template
+  needs:
+    job: amd64-debian-container
+  variables:
+    IMAGE: debian-amd64
+    CONFIGURE_ARGS: --without-default-features --disable-user
+        --target-list-exclude=arm-softmmu,i386-softmmu,mipsel-softmmu,mips64-softmmu,ppc-softmmu
+    MAKE_CHECK_ARGS: check-unit
+
+build-libvhost-user:
+  stage: build
+  image: $CI_REGISTRY_IMAGE/qemu/fedora:latest
+  needs:
+    job: amd64-fedora-container
+  before_script:
+    - dnf install -y meson ninja-build
+  script:
+    - mkdir subprojects/libvhost-user/build
+    - cd subprojects/libvhost-user/build
+    - meson
+    - ninja
+
+# No targets are built here, just tools, docs, and unit tests. This
+# also feeds into the eventual documentation deployment steps later
+build-tools-and-docs-debian:
+  extends: .native_build_job_template
+  needs:
+    job: amd64-debian-container
+  variables:
+    IMAGE: debian-amd64
+    MAKE_CHECK_ARGS: check-unit check-softfloat ctags TAGS cscope
+    CONFIGURE_ARGS: --disable-system --disable-user --enable-docs --enable-tools
+  artifacts:
+    expire_in: 2 days
+    paths:
+      - build
+
+# Prepare for GitLab pages deployment. Anything copied into the
+# "public" directory will be deployed to $USER.gitlab.io/$PROJECT
+pages:
+  image: $CI_REGISTRY_IMAGE/qemu/debian-amd64:latest
+  stage: test
+  needs:
+    - job: build-tools-and-docs-debian
+  script:
+    - mkdir -p public
+    # HTML-ised source tree
+    - make gtags
+    - htags -anT --tree-view=filetree -m qemu_init
+        -t "Welcome to the QEMU sourcecode"
+    - mv HTML public/src
+    # Project documentation
+    - make -C build install DESTDIR=$(pwd)/temp-install
+    - mv temp-install/usr/local/share/doc/qemu/* public/
+  artifacts:
+    paths:
+      - public
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d1c8fcc3874..aea58813a25 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -4,729 +4,5 @@ include:
   - local: '/.gitlab-ci.d/opensbi.yml'
   - local: '/.gitlab-ci.d/containers.yml'
   - local: '/.gitlab-ci.d/crossbuilds.yml'
-  - local: '/.gitlab-ci.d/buildtest-template.yml'
+  - local: '/.gitlab-ci.d/buildtest.yml'
   - local: '/.gitlab-ci.d/static_checks.yml'
-
-build-system-alpine:
-  extends: .native_build_job_template
-  needs:
-    - job: amd64-alpine-container
-  variables:
-    IMAGE: alpine
-    TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
-      moxie-softmmu microblazeel-softmmu mips64el-softmmu
-    MAKE_CHECK_ARGS: check-build
-    CONFIGURE_ARGS: --enable-docs --enable-trace-backends=log,simple,syslog
-  artifacts:
-    expire_in: 2 days
-    paths:
-      - .git-submodule-status
-      - build
-
-check-system-alpine:
-  extends: .native_test_job_template
-  needs:
-    - job: build-system-alpine
-      artifacts: true
-  variables:
-    IMAGE: alpine
-    MAKE_CHECK_ARGS: check
-
-acceptance-system-alpine:
-  extends: .integration_test_job_template
-  needs:
-    - job: build-system-alpine
-      artifacts: true
-  variables:
-    IMAGE: alpine
-    MAKE_CHECK_ARGS: check-acceptance
-
-build-system-ubuntu:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-ubuntu2004-container
-  variables:
-    IMAGE: ubuntu2004
-    CONFIGURE_ARGS: --enable-docs --enable-fdt=system --enable-slirp=system
-    TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
-      moxie-softmmu microblazeel-softmmu mips64el-softmmu
-    MAKE_CHECK_ARGS: check-build
-  artifacts:
-    expire_in: 2 days
-    paths:
-      - build
-
-check-system-ubuntu:
-  extends: .native_test_job_template
-  needs:
-    - job: build-system-ubuntu
-      artifacts: true
-  variables:
-    IMAGE: ubuntu2004
-    MAKE_CHECK_ARGS: check
-
-acceptance-system-ubuntu:
-  extends: .integration_test_job_template
-  needs:
-    - job: build-system-ubuntu
-      artifacts: true
-  variables:
-    IMAGE: ubuntu2004
-    MAKE_CHECK_ARGS: check-acceptance
-
-build-system-debian:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-debian-container
-  variables:
-    IMAGE: debian-amd64
-    CONFIGURE_ARGS: --enable-fdt=system
-    TARGETS: arm-softmmu avr-softmmu i386-softmmu mipsel-softmmu
-      riscv64-softmmu sh4eb-softmmu sparc-softmmu xtensaeb-softmmu
-    MAKE_CHECK_ARGS: check-build
-  artifacts:
-    expire_in: 2 days
-    paths:
-      - build
-
-check-system-debian:
-  extends: .native_test_job_template
-  needs:
-    - job: build-system-debian
-      artifacts: true
-  variables:
-    IMAGE: debian-amd64
-    MAKE_CHECK_ARGS: check
-
-acceptance-system-debian:
-  extends: .integration_test_job_template
-  needs:
-    - job: build-system-debian
-      artifacts: true
-  variables:
-    IMAGE: debian-amd64
-    MAKE_CHECK_ARGS: check-acceptance
-
-build-system-fedora:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-fedora-container
-  variables:
-    IMAGE: fedora
-    CONFIGURE_ARGS: --disable-gcrypt --enable-nettle --enable-docs
-             --enable-fdt=system --enable-slirp=system --enable-capstone=system
-    TARGETS: tricore-softmmu microblaze-softmmu mips-softmmu
-      xtensa-softmmu m68k-softmmu riscv32-softmmu ppc-softmmu sparc64-softmmu
-    MAKE_CHECK_ARGS: check-build
-  artifacts:
-    expire_in: 2 days
-    paths:
-      - build
-
-check-system-fedora:
-  extends: .native_test_job_template
-  needs:
-    - job: build-system-fedora
-      artifacts: true
-  variables:
-    IMAGE: fedora
-    MAKE_CHECK_ARGS: check
-
-acceptance-system-fedora:
-  extends: .integration_test_job_template
-  needs:
-    - job: build-system-fedora
-      artifacts: true
-  variables:
-    IMAGE: fedora
-    MAKE_CHECK_ARGS: check-acceptance
-
-build-system-centos:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-centos8-container
-  variables:
-    IMAGE: centos8
-    CONFIGURE_ARGS: --disable-nettle --enable-gcrypt --enable-fdt=system
-                    --enable-modules --enable-trace-backends=dtrace
-    TARGETS: ppc64-softmmu or1k-softmmu s390x-softmmu
-      x86_64-softmmu rx-softmmu sh4-softmmu nios2-softmmu
-    MAKE_CHECK_ARGS: check-build
-  artifacts:
-    expire_in: 2 days
-    paths:
-      - build
-
-check-system-centos:
-  extends: .native_test_job_template
-  needs:
-    - job: build-system-centos
-      artifacts: true
-  variables:
-    IMAGE: centos8
-    MAKE_CHECK_ARGS: check
-
-acceptance-system-centos:
-  extends: .integration_test_job_template
-  needs:
-    - job: build-system-centos
-      artifacts: true
-  variables:
-    IMAGE: centos8
-    MAKE_CHECK_ARGS: check-acceptance
-
-build-system-opensuse:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-opensuse-leap-container
-  variables:
-    IMAGE: opensuse-leap
-    CONFIGURE_ARGS: --enable-fdt=system
-    TARGETS: s390x-softmmu x86_64-softmmu aarch64-softmmu
-    MAKE_CHECK_ARGS: check-build
-  artifacts:
-    expire_in: 2 days
-    paths:
-      - build
-
-check-system-opensuse:
-  extends: .native_test_job_template
-  needs:
-    - job: build-system-opensuse
-      artifacts: true
-  variables:
-    IMAGE: opensuse-leap
-    MAKE_CHECK_ARGS: check
-
-acceptance-system-opensuse:
-  extends: .integration_test_job_template
-  needs:
-    - job: build-system-opensuse
-      artifacts: true
-  variables:
-    IMAGE: opensuse-leap
-    MAKE_CHECK_ARGS: check-acceptance
-
-
-build-disabled:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-fedora-container
-  variables:
-    IMAGE: fedora
-    CONFIGURE_ARGS:
-      --disable-attr
-      --disable-auth-pam
-      --disable-avx2
-      --disable-bochs
-      --disable-brlapi
-      --disable-bzip2
-      --disable-cap-ng
-      --disable-capstone
-      --disable-cloop
-      --disable-coroutine-pool
-      --disable-curl
-      --disable-curses
-      --disable-dmg
-      --disable-docs
-      --disable-gcrypt
-      --disable-glusterfs
-      --disable-gnutls
-      --disable-gtk
-      --disable-guest-agent
-      --disable-iconv
-      --disable-keyring
-      --disable-kvm
-      --disable-libiscsi
-      --disable-libpmem
-      --disable-libssh
-      --disable-libudev
-      --disable-libusb
-      --disable-libxml2
-      --disable-linux-aio
-      --disable-live-block-migration
-      --disable-lzo
-      --disable-malloc-trim
-      --disable-mpath
-      --disable-nettle
-      --disable-numa
-      --disable-opengl
-      --disable-parallels
-      --disable-pie
-      --disable-qcow1
-      --disable-qed
-      --disable-qom-cast-debug
-      --disable-rbd
-      --disable-rdma
-      --disable-replication
-      --disable-sdl
-      --disable-seccomp
-      --disable-sheepdog
-      --disable-slirp
-      --disable-smartcard
-      --disable-snappy
-      --disable-sparse
-      --disable-spice
-      --disable-strip
-      --disable-tpm
-      --disable-usb-redir
-      --disable-vdi
-      --disable-vhost-crypto
-      --disable-vhost-net
-      --disable-vhost-scsi
-      --disable-vhost-kernel
-      --disable-vhost-user
-      --disable-vhost-vdpa
-      --disable-vhost-vsock
-      --disable-virglrenderer
-      --disable-vnc
-      --disable-vte
-      --disable-vvfat
-      --disable-xen
-      --disable-zstd
-    TARGETS: arm-softmmu i386-softmmu ppc64-softmmu mips64-softmmu
-      s390x-softmmu i386-linux-user
-    MAKE_CHECK_ARGS: check-qtest SPEED=slow
-
-# This jobs explicitly disable TCG (--disable-tcg), KVM is detected by
-# the configure script. The container doesn't contain Xen headers so
-# Xen accelerator is not detected / selected. As result it build the
-# i386-softmmu and x86_64-softmmu with KVM being the single accelerator
-# available.
-# Also use a different coroutine implementation (which is only really of
-# interest to KVM users, i.e. with TCG disabled)
-build-tcg-disabled:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-centos8-container
-  variables:
-    IMAGE: centos8
-  script:
-    - mkdir build
-    - cd build
-    - ../configure --disable-tcg --audio-drv-list="" --with-coroutine=ucontext
-      || { cat config.log meson-logs/meson-log.txt && exit 1; }
-    - make -j"$JOBS"
-    - make check-unit
-    - make check-qapi-schema
-    - cd tests/qemu-iotests/
-    - ./check -raw 001 002 003 004 005 008 009 010 011 012 021 025 032 033 048
-            052 063 077 086 101 104 106 113 148 150 151 152 157 159 160 163
-            170 171 183 184 192 194 197 208 215 221 222 226 227 236 253 277
-    - ./check -qcow2 028 051 056 057 058 065 068 082 085 091 095 096 102 122
-            124 132 139 142 144 145 151 152 155 157 165 194 196 197 200 202
-            208 209 215 216 218 222 227 234 246 247 248 250 254 255 257 258
-            260 261 262 263 264 270 272 273 277 279
-
-build-user:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-debian-user-cross-container
-  variables:
-    IMAGE: debian-all-test-cross
-    CONFIGURE_ARGS: --disable-tools --disable-system
-    MAKE_CHECK_ARGS: check-tcg
-
-build-user-static:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-debian-user-cross-container
-  variables:
-    IMAGE: debian-all-test-cross
-    CONFIGURE_ARGS: --disable-tools --disable-system --static
-    MAKE_CHECK_ARGS: check-tcg
-
-# Only build the softmmu targets we have check-tcg tests for
-build-some-softmmu:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-debian-user-cross-container
-  variables:
-    IMAGE: debian-all-test-cross
-    CONFIGURE_ARGS: --disable-tools --enable-debug
-    TARGETS: xtensa-softmmu arm-softmmu aarch64-softmmu alpha-softmmu
-    MAKE_CHECK_ARGS: check-tcg
-
-# Run check-tcg against linux-user (with plugins)
-# we skip sparc64-linux-user until it has been fixed somewhat
-# we skip cris-linux-user as it doesn't use the common run loop
-build-user-plugins:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-debian-user-cross-container
-  variables:
-    IMAGE: debian-all-test-cross
-    CONFIGURE_ARGS: --disable-tools --disable-system --enable-plugins --enable-debug-tcg --target-list-exclude=sparc64-linux-user,cris-linux-user
-    MAKE_CHECK_ARGS: check-tcg
-  timeout: 1h 30m
-
-build-user-centos7:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-centos7-container
-  variables:
-    IMAGE: centos7
-    CONFIGURE_ARGS: --disable-system --disable-tools --disable-docs
-    MAKE_CHECK_ARGS: check-tcg
-
-build-some-softmmu-plugins:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-debian-user-cross-container
-  variables:
-    IMAGE: debian-all-test-cross
-    CONFIGURE_ARGS: --disable-tools --disable-user --enable-plugins --enable-debug-tcg
-    TARGETS: xtensa-softmmu arm-softmmu aarch64-softmmu alpha-softmmu
-    MAKE_CHECK_ARGS: check-tcg
-
-clang-system:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-fedora-container
-  variables:
-    IMAGE: fedora
-    CONFIGURE_ARGS: --cc=clang --cxx=clang++
-      --extra-cflags=-fsanitize=undefined --extra-cflags=-fno-sanitize-recover=undefined
-    TARGETS: alpha-softmmu arm-softmmu m68k-softmmu mips64-softmmu
-      ppc-softmmu s390x-softmmu
-    MAKE_CHECK_ARGS: check-qtest check-tcg
-
-clang-user:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-debian-user-cross-container
-  variables:
-    IMAGE: debian-all-test-cross
-    CONFIGURE_ARGS: --cc=clang --cxx=clang++ --disable-system
-      --target-list-exclude=microblazeel-linux-user,aarch64_be-linux-user,i386-linux-user,m68k-linux-user,mipsn32el-linux-user,xtensaeb-linux-user
-      --extra-cflags=-fsanitize=undefined --extra-cflags=-fno-sanitize-recover=undefined
-    MAKE_CHECK_ARGS: check-unit check-tcg
-
-# Set LD_JOBS=1 because this requires LTO and ld consumes a large amount of memory.
-# On gitlab runners, default value sometimes end up calling 2 lds concurrently and
-# triggers an Out-Of-Memory error
-#
-# Since slirp callbacks are used in QEMU Timers, slirp needs to be compiled together
-# with QEMU and linked as a static library to avoid false positives in CFI checks.
-# This can be accomplished by using -enable-slirp=git, which avoids the use of
-# a system-wide version of the library
-#
-# Split in three sets of build/check/acceptance to limit the execution time of each
-# job
-build-cfi-aarch64:
-  extends: .native_build_job_template
-  needs:
-  - job: amd64-fedora-container
-  variables:
-    LD_JOBS: 1
-    AR: llvm-ar
-    IMAGE: fedora
-    CONFIGURE_ARGS: --cc=clang --cxx=clang++ --enable-cfi --enable-cfi-debug
-      --enable-safe-stack --enable-slirp=git
-    TARGETS: aarch64-softmmu
-    MAKE_CHECK_ARGS: check-build
-  timeout: 70m
-  artifacts:
-    expire_in: 2 days
-    paths:
-      - build
-
-check-cfi-aarch64:
-  extends: .native_test_job_template
-  needs:
-    - job: build-cfi-aarch64
-      artifacts: true
-  variables:
-    IMAGE: fedora
-    MAKE_CHECK_ARGS: check
-
-acceptance-cfi-aarch64:
-  extends: .integration_test_job_template
-  needs:
-    - job: build-cfi-aarch64
-      artifacts: true
-  variables:
-    IMAGE: fedora
-    MAKE_CHECK_ARGS: check-acceptance
-
-build-cfi-ppc64-s390x:
-  extends: .native_build_job_template
-  needs:
-  - job: amd64-fedora-container
-  variables:
-    LD_JOBS: 1
-    AR: llvm-ar
-    IMAGE: fedora
-    CONFIGURE_ARGS: --cc=clang --cxx=clang++ --enable-cfi --enable-cfi-debug
-      --enable-safe-stack --enable-slirp=git
-    TARGETS: ppc64-softmmu s390x-softmmu
-    MAKE_CHECK_ARGS: check-build
-  timeout: 70m
-  artifacts:
-    expire_in: 2 days
-    paths:
-      - build
-
-check-cfi-ppc64-s390x:
-  extends: .native_test_job_template
-  needs:
-    - job: build-cfi-ppc64-s390x
-      artifacts: true
-  variables:
-    IMAGE: fedora
-    MAKE_CHECK_ARGS: check
-
-acceptance-cfi-ppc64-s390x:
-  extends: .integration_test_job_template
-  needs:
-    - job: build-cfi-ppc64-s390x
-      artifacts: true
-  variables:
-    IMAGE: fedora
-    MAKE_CHECK_ARGS: check-acceptance
-
-build-cfi-x86_64:
-  extends: .native_build_job_template
-  needs:
-  - job: amd64-fedora-container
-  variables:
-    LD_JOBS: 1
-    AR: llvm-ar
-    IMAGE: fedora
-    CONFIGURE_ARGS: --cc=clang --cxx=clang++ --enable-cfi --enable-cfi-debug
-      --enable-safe-stack --enable-slirp=git
-    TARGETS: x86_64-softmmu
-    MAKE_CHECK_ARGS: check-build
-  timeout: 70m
-  artifacts:
-    expire_in: 2 days
-    paths:
-      - build
-
-check-cfi-x86_64:
-  extends: .native_test_job_template
-  needs:
-    - job: build-cfi-x86_64
-      artifacts: true
-  variables:
-    IMAGE: fedora
-    MAKE_CHECK_ARGS: check
-
-acceptance-cfi-x86_64:
-  extends: .integration_test_job_template
-  needs:
-    - job: build-cfi-x86_64
-      artifacts: true
-  variables:
-    IMAGE: fedora
-    MAKE_CHECK_ARGS: check-acceptance
-
-tsan-build:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-ubuntu2004-container
-  variables:
-    IMAGE: ubuntu2004
-    CONFIGURE_ARGS: --enable-tsan --cc=clang-10 --cxx=clang++-10
-          --enable-trace-backends=ust --enable-fdt=system --enable-slirp=system
-    TARGETS: x86_64-softmmu ppc64-softmmu riscv64-softmmu x86_64-linux-user
-    MAKE_CHECK_ARGS: bench V=1
-
-# These targets are on the way out
-build-deprecated:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-debian-user-cross-container
-  variables:
-    IMAGE: debian-all-test-cross
-    CONFIGURE_ARGS: --disable-tools
-    MAKE_CHECK_ARGS: build-tcg
-    TARGETS: ppc64abi32-linux-user lm32-softmmu unicore32-softmmu
-  artifacts:
-    expire_in: 2 days
-    paths:
-      - build
-
-# We split the check-tcg step as test failures are expected but we still
-# want to catch the build breaking.
-check-deprecated:
-  extends: .native_test_job_template
-  needs:
-    - job: build-deprecated
-      artifacts: true
-  variables:
-    IMAGE: debian-all-test-cross
-    MAKE_CHECK_ARGS: check-tcg
-  allow_failure: true
-
-# gprof/gcov are GCC features
-gprof-gcov:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-ubuntu2004-container
-  variables:
-    IMAGE: ubuntu2004
-    CONFIGURE_ARGS: --enable-gprof --enable-gcov
-    MAKE_CHECK_ARGS: check
-    TARGETS: aarch64-softmmu ppc64-softmmu s390x-softmmu x86_64-softmmu
-  timeout: 70m
-  after_script:
-    - ${CI_PROJECT_DIR}/scripts/ci/coverage-summary.sh
-
-build-oss-fuzz:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-fedora-container
-  variables:
-    IMAGE: fedora
-  script:
-    - mkdir build-oss-fuzz
-    - CC="clang" CXX="clang++" CFLAGS="-fsanitize=address"
-      ./scripts/oss-fuzz/build.sh
-    - export ASAN_OPTIONS="fast_unwind_on_malloc=0"
-    - for fuzzer in $(find ./build-oss-fuzz/DEST_DIR/ -executable -type f
-                      | grep -v slirp); do
-        grep "LLVMFuzzerTestOneInput" ${fuzzer} > /dev/null 2>&1 || continue ;
-        echo Testing ${fuzzer} ... ;
-        "${fuzzer}" -runs=1 -seed=1 || exit 1 ;
-      done
-    # Unrelated to fuzzer: run some tests with -fsanitize=address
-    - cd build-oss-fuzz && make check-qtest-i386 check-unit
-
-build-tci:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-debian-user-cross-container
-  variables:
-    IMAGE: debian-all-test-cross
-  script:
-    - TARGETS="aarch64 alpha arm hppa m68k microblaze moxie ppc64 s390x x86_64"
-    - mkdir build
-    - cd build
-    - ../configure --enable-tcg-interpreter
-        --target-list="$(for tg in $TARGETS; do echo -n ${tg}'-softmmu '; done)" || { cat config.log meson-logs/meson-log.txt && exit 1; }
-    - make -j"$JOBS"
-    - make tests/qtest/boot-serial-test tests/qtest/cdrom-test tests/qtest/pxe-test
-    - for tg in $TARGETS ; do
-        export QTEST_QEMU_BINARY="./qemu-system-${tg}" ;
-        ./tests/qtest/boot-serial-test || exit 1 ;
-        ./tests/qtest/cdrom-test || exit 1 ;
-      done
-    - QTEST_QEMU_BINARY="./qemu-system-x86_64" ./tests/qtest/pxe-test
-    - QTEST_QEMU_BINARY="./qemu-system-s390x" ./tests/qtest/pxe-test -m slow
-    - make check-tcg
-
-# Alternate coroutines implementations are only really of interest to KVM users
-# However we can't test against KVM on Gitlab-CI so we can only run unit tests
-build-coroutine-sigaltstack:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-ubuntu2004-container
-  variables:
-    IMAGE: ubuntu2004
-    CONFIGURE_ARGS: --with-coroutine=sigaltstack --disable-tcg
-                    --enable-trace-backends=ftrace
-    MAKE_CHECK_ARGS: check-unit
-
-# Most jobs test latest gcrypt or nettle builds
-#
-# These jobs test old gcrypt and nettle from RHEL7
-# which had some API differences.
-crypto-old-nettle:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-centos7-container
-  variables:
-    IMAGE: centos7
-    TARGETS: x86_64-softmmu x86_64-linux-user
-    CONFIGURE_ARGS: --disable-gcrypt --enable-nettle
-    MAKE_CHECK_ARGS: check
-
-crypto-old-gcrypt:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-centos7-container
-  variables:
-    IMAGE: centos7
-    TARGETS: x86_64-softmmu x86_64-linux-user
-    CONFIGURE_ARGS: --disable-nettle --enable-gcrypt
-    MAKE_CHECK_ARGS: check
-
-crypto-only-gnutls:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-centos7-container
-  variables:
-    IMAGE: centos7
-    TARGETS: x86_64-softmmu x86_64-linux-user
-    CONFIGURE_ARGS: --disable-nettle --disable-gcrypt --enable-gnutls
-    MAKE_CHECK_ARGS: check
-
-
-# Check our reduced build configurations
-build-without-default-devices:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-centos8-container
-  variables:
-    IMAGE: centos8
-    CONFIGURE_ARGS: --without-default-devices --disable-user
-
-build-without-default-features:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-debian-container
-  variables:
-    IMAGE: debian-amd64
-    CONFIGURE_ARGS: --without-default-features --disable-user
-        --target-list-exclude=arm-softmmu,i386-softmmu,mipsel-softmmu,mips64-softmmu,ppc-softmmu
-    MAKE_CHECK_ARGS: check-unit
-
-build-libvhost-user:
-  stage: build
-  image: $CI_REGISTRY_IMAGE/qemu/fedora:latest
-  needs:
-    job: amd64-fedora-container
-  before_script:
-    - dnf install -y meson ninja-build
-  script:
-    - mkdir subprojects/libvhost-user/build
-    - cd subprojects/libvhost-user/build
-    - meson
-    - ninja
-
-# No targets are built here, just tools, docs, and unit tests. This
-# also feeds into the eventual documentation deployment steps later
-build-tools-and-docs-debian:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-debian-container
-  variables:
-    IMAGE: debian-amd64
-    MAKE_CHECK_ARGS: check-unit check-softfloat ctags TAGS cscope
-    CONFIGURE_ARGS: --disable-system --disable-user --enable-docs --enable-tools
-  artifacts:
-    expire_in: 2 days
-    paths:
-      - build
-
-# Prepare for GitLab pages deployment. Anything copied into the
-# "public" directory will be deployed to $USER.gitlab.io/$PROJECT
-pages:
-  image: $CI_REGISTRY_IMAGE/qemu/debian-amd64:latest
-  stage: test
-  needs:
-    - job: build-tools-and-docs-debian
-  script:
-    - mkdir -p public
-    # HTML-ised source tree
-    - make gtags
-    - htags -anT --tree-view=filetree -m qemu_init
-        -t "Welcome to the QEMU sourcecode"
-    - mv HTML public/src
-    # Project documentation
-    - make -C build install DESTDIR=$(pwd)/temp-install
-    - mv temp-install/usr/local/share/doc/qemu/* public/
-  artifacts:
-    paths:
-      - public
-- 
2.26.3


