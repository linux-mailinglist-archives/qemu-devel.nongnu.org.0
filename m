Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82593363891
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 01:45:22 +0200 (CEST)
Received: from localhost ([::1]:34646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYH6P-0000ed-HR
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 19:45:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGx9-0001Fd-AX
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 19:35:47 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:52963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGx4-0003O7-Vj
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 19:35:47 -0400
Received: by mail-wm1-x333.google.com with SMTP id y204so15787236wmg.2
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 16:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bR+US8EtIGOaPN7Cu4S5D8+ZPqozvGpU/wsfyKwzMIM=;
 b=K0iryv/i4T7+29bWKXSNzL+Qxtx/Ek++ofitBHF9RJFy4uAVdJ76Wyyowb3ep+bxDN
 1ictidzUVjrB7CDjpL964d5KYEVZKF++kCG+gzr1fkpwh6vuRkk1bDlgv6pwL4paxKaf
 JYbciloSETL4jtiPOzLhFeI4J36oDEquVlZog/rRM2Sda5X5eAHpzrvZ/79VUSJ0wKPx
 lhnPCasXPHDhDHS9I876K4UcZE0tXfTElecEWegC06ZSKT/pB6/rB57FRMun6ZYGH21s
 VMGrW/tyq8wBEZCP0xXnaMfDGwnNEjg7K1Ww2KGoK3IjEz053+ym5tnRml/U/+5Th5JF
 RMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bR+US8EtIGOaPN7Cu4S5D8+ZPqozvGpU/wsfyKwzMIM=;
 b=LnehhCA1DZLZMh5NwcDNyZYYuZH2CLdy0kkt4wN50txVkwk5EOtW2cuS5FZJPkYI0N
 pDWXrzHKKwsSPb4wgQJFoq4YgH8P1lLUQFDJhenmequw77688GcdkpYdCDkYgAP9gg1I
 FdJXX/nUmWEBMdRKKbLMutos+V5Td6aAG1cSIo33FV+MkdD415cF+C1WaOWMIWJUrG/T
 TQXwc20b1QpSxQ9AeOJ69dfSfSBdaSKZVpLiSlX9i1wqE9KbHKg4vBkack+qO0W6HrjZ
 VurbfhbBRQDAo7EtQmgjPGeFaZG5Np2F+B2cK2Gx0EiqXq+qTdO+J6CLO0iW8qlLK2wJ
 E6Gg==
X-Gm-Message-State: AOAM5329wsTlwfe3+FEY/iUpUiTE/Om6LAx2Su8afU2m6k+3MaAvDkUr
 1mQIVuaPEkFwmNVJ2A7IjHYY30imfrOVLQ==
X-Google-Smtp-Source: ABdhPJyf6shy29oZasGRHvv81c94SDMjteUeAVjleKeSr+83nSxGjIh0TR5enwSCfxbwl2CCBYWdJA==
X-Received: by 2002:a1c:f705:: with SMTP id v5mr17978959wmh.105.1618788941071; 
 Sun, 18 Apr 2021 16:35:41 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id c18sm19965806wrn.92.2021.04.18.16.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 16:35:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/15] gitlab-ci: Extract all default build/test jobs to
 buildtest.yml
Date: Mon, 19 Apr 2021 01:34:43 +0200
Message-Id: <20210418233448.1267991-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418233448.1267991-1-f4bug@amsat.org>
References: <20210418233448.1267991-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract the build/test jobs run by default on the mainstream
CI into a new file (buildtest.yml) and their templates into
(buildtest-template.yml), to be able to reuse the templates
without having to run all these mainstream jobs by default.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/buildtest-template.yml |  80 +++
 .gitlab-ci.d/buildtest.yml          | 744 +++++++++++++++++++++++++
 .gitlab-ci.yml                      | 824 +---------------------------
 3 files changed, 825 insertions(+), 823 deletions(-)
 create mode 100644 .gitlab-ci.d/buildtest-template.yml
 create mode 100644 .gitlab-ci.d/buildtest.yml

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
new file mode 100644
index 00000000000..b24a153d904
--- /dev/null
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -0,0 +1,80 @@
+.native_build_job_template:
+  stage: build
+  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
+  before_script:
+    - JOBS=$(expr $(nproc) + 1)
+  script:
+    - mkdir build
+    - cd build
+    - if test -n "$TARGETS";
+      then
+        ../configure --enable-werror --disable-docs $CONFIGURE_ARGS --target-list="$TARGETS" ;
+      else
+        ../configure --enable-werror --disable-docs $CONFIGURE_ARGS ;
+      fi || { cat config.log meson-logs/meson-log.txt && exit 1; }
+    - if test -n "$LD_JOBS";
+      then
+        meson configure . -Dbackend_max_links="$LD_JOBS" ;
+      fi || exit 1;
+    - make -j"$JOBS"
+    - if test -n "$MAKE_CHECK_ARGS";
+      then
+        make -j"$JOBS" $MAKE_CHECK_ARGS ;
+      fi
+
+.native_test_job_template:
+  stage: test
+  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
+  script:
+    - scripts/git-submodule.sh update
+        $(sed -n '/GIT_SUBMODULES=/ s/.*=// p' build/config-host.mak)
+    - cd build
+    - find . -type f -exec touch {} +
+    # Avoid recompiling by hiding ninja with NINJA=":"
+    - make NINJA=":" $MAKE_CHECK_ARGS
+
+.integration_test_job_template:
+  cache:
+    key: "${CI_JOB_NAME}-cache"
+    paths:
+      - ${CI_PROJECT_DIR}/avocado-cache
+    policy: pull-push
+  artifacts:
+    name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
+    when: always
+    expire_in: 2 days
+    paths:
+      - build/tests/results/latest/results.xml
+      - build/tests/results/latest/test-results
+    reports:
+      junit: build/tests/results/latest/results.xml
+  before_script:
+    - mkdir -p ~/.config/avocado
+    - echo "[datadir.paths]" > ~/.config/avocado/avocado.conf
+    - echo "cache_dirs = ['${CI_PROJECT_DIR}/avocado-cache']"
+           >> ~/.config/avocado/avocado.conf
+    - echo -e '[job.output.testlogs]\nstatuses = ["FAIL", "INTERRUPT"]'
+           >> ~/.config/avocado/avocado.conf
+    - if [ -d ${CI_PROJECT_DIR}/avocado-cache ]; then
+        du -chs ${CI_PROJECT_DIR}/avocado-cache ;
+      fi
+    - export AVOCADO_ALLOW_UNTRUSTED_CODE=1
+  after_script:
+    - cd build
+    - du -chs ${CI_PROJECT_DIR}/avocado-cache
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
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
new file mode 100644
index 00000000000..c24553eab05
--- /dev/null
+++ b/.gitlab-ci.d/buildtest.yml
@@ -0,0 +1,744 @@
+include:
+  - local: '/.gitlab-ci.d/buildtest-template.yml'
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
+  extends: .native_test_job_template
+  needs:
+    - job: build-system-alpine
+      artifacts: true
+  variables:
+    IMAGE: alpine
+    MAKE_CHECK_ARGS: check-acceptance
+  extends: .integration_test_job_template
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
+  extends: .native_test_job_template
+  needs:
+    - job: build-system-ubuntu
+      artifacts: true
+  variables:
+    IMAGE: ubuntu2004
+    MAKE_CHECK_ARGS: check-acceptance
+  extends: .integration_test_job_template
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
+  extends: .native_test_job_template
+  needs:
+    - job: build-system-debian
+      artifacts: true
+  variables:
+    IMAGE: debian-amd64
+    MAKE_CHECK_ARGS: check-acceptance
+  extends: .integration_test_job_template
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
+  extends: .native_test_job_template
+  needs:
+    - job: build-system-fedora
+      artifacts: true
+  variables:
+    IMAGE: fedora
+    MAKE_CHECK_ARGS: check-acceptance
+  extends: .integration_test_job_template
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
+  extends: .native_test_job_template
+  needs:
+    - job: build-system-centos
+      artifacts: true
+  variables:
+    IMAGE: centos8
+    MAKE_CHECK_ARGS: check-acceptance
+  extends: .integration_test_job_template
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
+  extends: .native_test_job_template
+  needs:
+    - job: build-system-opensuse
+      artifacts: true
+  variables:
+    IMAGE: opensuse-leap
+    MAKE_CHECK_ARGS: check-acceptance
+  extends: .integration_test_job_template
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
+  extends: .native_test_job_template
+  needs:
+    - job: build-cfi-aarch64
+      artifacts: true
+  variables:
+    IMAGE: fedora
+    MAKE_CHECK_ARGS: check-acceptance
+  extends: .integration_test_job_template
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
+  extends: .native_test_job_template
+  needs:
+    - job: build-cfi-ppc64-s390x
+      artifacts: true
+  variables:
+    IMAGE: fedora
+    MAKE_CHECK_ARGS: check-acceptance
+  extends: .integration_test_job_template
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
+  extends: .native_test_job_template
+  needs:
+    - job: build-cfi-x86_64
+      artifacts: true
+  variables:
+    IMAGE: fedora
+    MAKE_CHECK_ARGS: check-acceptance
+  extends: .integration_test_job_template
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
+check-patch:
+  stage: build
+  image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
+  needs:
+    job: amd64-centos8-container
+  script: .gitlab-ci.d/check-patch.py
+  except:
+    variables:
+      - $CI_PROJECT_NAMESPACE == 'qemu-project' && $CI_COMMIT_BRANCH == 'master'
+  variables:
+    GIT_DEPTH: 1000
+  allow_failure: true
+
+check-dco:
+  stage: build
+  image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
+  needs:
+    job: amd64-centos8-container
+  script: .gitlab-ci.d/check-dco.py
+  except:
+    variables:
+      - $CI_PROJECT_NAMESPACE == 'qemu-project' && $CI_COMMIT_BRANCH == 'master'
+  variables:
+    GIT_DEPTH: 1000
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
index c367d42977c..8f13a584a29 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -4,827 +4,5 @@ include:
   - local: '/.gitlab-ci.d/opensbi.yml'
   - local: '/.gitlab-ci.d/containers.yml'
   - local: '/.gitlab-ci.d/crossbuilds.yml'
+  - local: '/.gitlab-ci.d/buildtest.yml'
   - local: '/.gitlab-ci.d/checks.yml'
-
-.native_build_job_template:
-  stage: build
-  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
-  before_script:
-    - JOBS=$(expr $(nproc) + 1)
-  script:
-    - mkdir build
-    - cd build
-    - if test -n "$TARGETS";
-      then
-        ../configure --enable-werror --disable-docs $CONFIGURE_ARGS --target-list="$TARGETS" ;
-      else
-        ../configure --enable-werror --disable-docs $CONFIGURE_ARGS ;
-      fi || { cat config.log meson-logs/meson-log.txt && exit 1; }
-    - if test -n "$LD_JOBS";
-      then
-        meson configure . -Dbackend_max_links="$LD_JOBS" ;
-      fi || exit 1;
-    - make -j"$JOBS"
-    - if test -n "$MAKE_CHECK_ARGS";
-      then
-        make -j"$JOBS" $MAKE_CHECK_ARGS ;
-      fi
-
-.native_test_job_template:
-  stage: test
-  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
-  script:
-    - scripts/git-submodule.sh update
-        $(sed -n '/GIT_SUBMODULES=/ s/.*=// p' build/config-host.mak)
-    - cd build
-    - find . -type f -exec touch {} +
-    # Avoid recompiling by hiding ninja with NINJA=":"
-    - make NINJA=":" $MAKE_CHECK_ARGS
-
-.integration_test_job_template:
-  cache:
-    key: "${CI_JOB_NAME}-cache"
-    paths:
-      - ${CI_PROJECT_DIR}/avocado-cache
-    policy: pull-push
-  artifacts:
-    name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
-    when: always
-    expire_in: 2 days
-    paths:
-      - build/tests/results/latest/results.xml
-      - build/tests/results/latest/test-results
-    reports:
-      junit: build/tests/results/latest/results.xml
-  before_script:
-    - mkdir -p ~/.config/avocado
-    - echo "[datadir.paths]" > ~/.config/avocado/avocado.conf
-    - echo "cache_dirs = ['${CI_PROJECT_DIR}/avocado-cache']"
-           >> ~/.config/avocado/avocado.conf
-    - echo -e '[job.output.testlogs]\nstatuses = ["FAIL", "INTERRUPT"]'
-           >> ~/.config/avocado/avocado.conf
-    - if [ -d ${CI_PROJECT_DIR}/avocado-cache ]; then
-        du -chs ${CI_PROJECT_DIR}/avocado-cache ;
-      fi
-    - export AVOCADO_ALLOW_UNTRUSTED_CODE=1
-  after_script:
-    - cd build
-    - du -chs ${CI_PROJECT_DIR}/avocado-cache
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
-  extends: .native_test_job_template
-  needs:
-    - job: build-system-alpine
-      artifacts: true
-  variables:
-    IMAGE: alpine
-    MAKE_CHECK_ARGS: check-acceptance
-  extends: .integration_test_job_template
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
-  extends: .native_test_job_template
-  needs:
-    - job: build-system-ubuntu
-      artifacts: true
-  variables:
-    IMAGE: ubuntu2004
-    MAKE_CHECK_ARGS: check-acceptance
-  extends: .integration_test_job_template
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
-  extends: .native_test_job_template
-  needs:
-    - job: build-system-debian
-      artifacts: true
-  variables:
-    IMAGE: debian-amd64
-    MAKE_CHECK_ARGS: check-acceptance
-  extends: .integration_test_job_template
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
-  extends: .native_test_job_template
-  needs:
-    - job: build-system-fedora
-      artifacts: true
-  variables:
-    IMAGE: fedora
-    MAKE_CHECK_ARGS: check-acceptance
-  extends: .integration_test_job_template
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
-  extends: .native_test_job_template
-  needs:
-    - job: build-system-centos
-      artifacts: true
-  variables:
-    IMAGE: centos8
-    MAKE_CHECK_ARGS: check-acceptance
-  extends: .integration_test_job_template
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
-  extends: .native_test_job_template
-  needs:
-    - job: build-system-opensuse
-      artifacts: true
-  variables:
-    IMAGE: opensuse-leap
-    MAKE_CHECK_ARGS: check-acceptance
-  extends: .integration_test_job_template
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
-  extends: .native_test_job_template
-  needs:
-    - job: build-cfi-aarch64
-      artifacts: true
-  variables:
-    IMAGE: fedora
-    MAKE_CHECK_ARGS: check-acceptance
-  extends: .integration_test_job_template
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
-  extends: .native_test_job_template
-  needs:
-    - job: build-cfi-ppc64-s390x
-      artifacts: true
-  variables:
-    IMAGE: fedora
-    MAKE_CHECK_ARGS: check-acceptance
-  extends: .integration_test_job_template
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
-  extends: .native_test_job_template
-  needs:
-    - job: build-cfi-x86_64
-      artifacts: true
-  variables:
-    IMAGE: fedora
-    MAKE_CHECK_ARGS: check-acceptance
-  extends: .integration_test_job_template
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
-check-patch:
-  stage: build
-  image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
-  needs:
-    job: amd64-centos8-container
-  script: .gitlab-ci.d/check-patch.py
-  except:
-    variables:
-      - $CI_PROJECT_NAMESPACE == 'qemu-project' && $CI_COMMIT_BRANCH == 'master'
-  variables:
-    GIT_DEPTH: 1000
-  allow_failure: true
-
-check-dco:
-  stage: build
-  image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
-  needs:
-    job: amd64-centos8-container
-  script: .gitlab-ci.d/check-dco.py
-  except:
-    variables:
-      - $CI_PROJECT_NAMESPACE == 'qemu-project' && $CI_COMMIT_BRANCH == 'master'
-  variables:
-    GIT_DEPTH: 1000
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


