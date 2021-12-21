Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 348C547C4DE
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 18:21:06 +0100 (CET)
Received: from localhost ([::1]:34866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzioz-0005LJ-BC
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 12:21:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziJD-0001BU-M7
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:48:15 -0500
Received: from [2607:f8b0:4864:20::632] (port=45055
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziJ6-0007fz-Fm
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:48:15 -0500
Received: by mail-pl1-x632.google.com with SMTP id q17so11186277plr.11
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 08:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hQH/TbBJ6tfIM+iClHzixTSrIAvP0jiu4/hFtK8hQSo=;
 b=uZ2TvxPEnl1pca/xapbQWBFa2Bz2pIeFH1CBNI72nQVUBx3LntRp/CB5W7jdWP0wSV
 7BRznnljh+tJa8kTML7hFTzFEPy8Pi9H0ZGl6aNers2n6Yx31MXbEkJU/VIJnQG3QWjk
 BOxQglPk2rQmvqpj5VHH7bhOOcVXjD+X2dCvf3vzD6zWP0Ddcv34Ba/LKr2U9EGyIqZf
 gV0JRDMrbXth+MtrVLE2La/XVKfQGYedFFfWXvB0KRvpeDlzoTpCqne+cHSUZ+0wzliZ
 ZBF66jasZO/5oFJBFc2kk/iYxvr/RCrI05aXz7HSXdGa75fvC+cMWMsl7Dx7aA+h1iRs
 MrrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hQH/TbBJ6tfIM+iClHzixTSrIAvP0jiu4/hFtK8hQSo=;
 b=bWyD1odULvmBjxUA/qAY94EAQmtAH8o8KDHFs9bzFFRMdTt6zbuJVpLtKwDI1Jg0Xt
 5M5SscPsf33Zt6+bniJBlkVb89q+OGeVOr1XrDjDw+LFYMvf8MeISvXTPtQnvcr5EvAu
 h/7lkX8VJxLvTJ6KULc1AeU8foTUYj+oPJ6XFlGWQaTHQt2W3vnyDVAAbxMvSiwFYCOW
 NRrS3g8SqpoTZcUrUGLJgedvyda/fUKdGDA87DTE2OeMgfvMSmA2mtFAL9kIbEN8molV
 7T1iXkqPEwmbKaNNYpUXPZDMDQx6DzPTq+1j/ZjHVnFEgkomVXIvXz7Mld2gwQVDYRS8
 uyfw==
X-Gm-Message-State: AOAM5311lEvBULFVoXLugsmoafrEyS/hzT+XzcW5u3CYV3tbKs96RkqC
 nsKwwj2o1vZOJDbMRiYUc8tj1rNPJHmMFw==
X-Google-Smtp-Source: ABdhPJzC2Aj69k+YmHVe2oCvOT0magmZ+xUQEtZrTKJ8tthY4WrJ2dhn17R9K05JPIqMIHdN2l2/4w==
X-Received: by 2002:a17:90a:b387:: with SMTP id
 e7mr5027147pjr.45.1640105287058; 
 Tue, 21 Dec 2021 08:48:07 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id b192sm2256818pga.35.2021.12.21.08.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 08:48:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/31] tests/docker: Add gentoo-loongarch64-cross image and run
 cross builds in GitLab
Date: Tue, 21 Dec 2021 08:47:37 -0800
Message-Id: <20211221164737.1076007-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221164737.1076007-1-richard.henderson@linaro.org>
References: <20211221164737.1076007-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Cc: WANG Xuerui <git@xen0n.name>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: WANG Xuerui <git@xen0n.name>

Normally this would be based on qemu/debian10 or qemu/ubuntu2004, but
after a week-long struggle, I still cannot build stage2 gcc with the
known-good LoongArch toolchain sources, so I chose the least-resistance
path with Gentoo as base image. As this image is not expected to be
re-built by CI, like hexagon, it should not take much maintenance
effort; also it's expected to be replaced as soon as Debian is
available.

As the LoongArch *target* has not been merged yet, a check-tcg job is
not added at the moment, but cross builds with the TCG *host* port are
already possible, and added to CI matrix.

Due to constant flux of the toolchain sources used (especially that of
glibc), the binaries built with this image may or may not work when
run on actual hardware, but still useful for ensuring things correctly
build. This image is expected to be updated every once in a while,
before everything settles down.

As a reference, the image takes about 25 minutes to rebuild on a
Threadripper 3990X system with Docker operating on HDD; YMMV but it
probably wouldn't become significantly shorter, as everything needs to
be built from source in our case.

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211221054105.178795-32-git@xen0n.name>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 .gitlab-ci.d/container-cross.yml              |  27 ++++
 .gitlab-ci.d/crossbuilds.yml                  |  19 +++
 MAINTAINERS                                   |   2 +
 tests/docker/Makefile.include                 |  21 +++
 .../gentoo-loongarch64-cross.docker           |  21 +++
 .../build-toolchain.sh                        | 128 ++++++++++++++++++
 6 files changed, 218 insertions(+)
 create mode 100644 tests/docker/dockerfiles/gentoo-loongarch64-cross.docker
 create mode 100755 tests/docker/dockerfiles/gentoo-loongarch64-cross.docker.d/build-toolchain.sh

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index a3b5b90552..7a8cc556cc 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -82,6 +82,33 @@ hppa-debian-cross-container:
   variables:
     NAME: debian-hppa-cross
 
+# Similar to hexagon, we don't want to build loongarch64 in the CI either.
+loongarch64-cross-container:
+  image: docker:stable
+  stage: containers
+  rules:
+    - if: '$CI_PROJECT_NAMESPACE == "qemu-project"'
+      when: never
+    - when: always
+  variables:
+    NAME: gentoo-loongarch64-cross
+    GIT_DEPTH: 1
+  services:
+    - docker:dind
+  before_script:
+    - export TAG="$CI_REGISTRY_IMAGE/qemu/$NAME:latest"
+    - export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/qemu/$NAME:latest"
+    - docker info
+    - docker login $CI_REGISTRY -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD"
+  script:
+    - echo "TAG:$TAG"
+    - echo "COMMON_TAG:$COMMON_TAG"
+    - docker pull $COMMON_TAG
+    - docker tag $COMMON_TAG $TAG
+    - docker push "$TAG"
+  after_script:
+    - docker logout
+
 m68k-debian-cross-container:
   extends: .container_job_template
   stage: containers-layer2
diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 17d6cb3e45..b1cbc9cc43 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -68,6 +68,25 @@ cross-i386-tci:
     EXTRA_CONFIGURE_OPTS: --target-list=i386-softmmu,i386-linux-user,aarch64-softmmu,aarch64-linux-user,ppc-softmmu,ppc-linux-user
     MAKE_CHECK_ARGS: check check-tcg
 
+# Upstream LoongArch support is still incomplete, but toolchain is already
+# usable and partially merged, so the host support is already testable; but
+# don't let failures block CI.
+cross-loongarch64-system:
+  extends: .cross_system_build_job
+  allow_failure: true
+  needs:
+    job: loongarch64-cross-container
+  variables:
+    IMAGE: gentoo-loongarch64-cross
+
+cross-loongarch64-user:
+  extends: .cross_user_build_job
+  allow_failure: true
+  needs:
+    job: loongarch64-cross-container
+  variables:
+    IMAGE: gentoo-loongarch64-cross
+
 cross-mips-system:
   extends: .cross_system_build_job
   needs:
diff --git a/MAINTAINERS b/MAINTAINERS
index 4f6e0de3fb..8da7071b01 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3143,6 +3143,8 @@ LoongArch64 TCG target
 M: WANG Xuerui <git@xen0n.name>
 S: Maintained
 F: tcg/loongarch64/
+F: tests/docker/dockerfiles/gentoo-loongarch64-cross.docker
+F: tests/docker/dockerfiles/gentoo-loongarch64-cross.docker.d/
 
 MIPS TCG target
 M: Philippe Mathieu-Daudé <f4bug@amsat.org>
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index f1a0c5db7a..a2cdf193bb 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -176,6 +176,27 @@ docker-image-debian-hexagon-cross: $(DOCKER_FILES_DIR)/debian-hexagon-cross.dock
 				qemu/debian-hexagon-cross --add-current-user,		\
 			"PREPARE", "debian-hexagon-cross"))
 
+#
+# Same for loongarch64-cross.
+#
+docker-image-gentoo-loongarch64-cross: $(DOCKER_FILES_DIR)/gentoo-loongarch64-cross.docker
+	$(if $(NOCACHE), 								\
+		$(call quiet-command,							\
+			$(DOCKER_SCRIPT) build -t qemu/gentoo-loongarch64-cross -f $< 	\
+			$(if $V,,--quiet) --no-cache 					\
+			--registry $(DOCKER_REGISTRY) --extra-files			\
+			$(DOCKER_FILES_DIR)/gentoo-loongarch64-cross.docker.d/build-toolchain.sh, \
+			"BUILD", "gentoo-loongarch64-cross"),				\
+		$(call quiet-command,							\
+			$(DOCKER_SCRIPT) fetch $(if $V,,--quiet)			\
+				qemu/gentoo-loongarch64-cross $(DOCKER_REGISTRY),	\
+			"FETCH", "gentoo-loongarch64-cross")				\
+		$(call quiet-command,							\
+			$(DOCKER_SCRIPT) update $(if $V,,--quiet) 			\
+				qemu/gentoo-loongarch64-cross --add-current-user,	\
+			"PREPARE", "gentoo-loongarch64-cross"))
+
+
 debian-toolchain-run = \
 	$(if $(NOCACHE), 						\
 		$(call quiet-command,					\
diff --git a/tests/docker/dockerfiles/gentoo-loongarch64-cross.docker b/tests/docker/dockerfiles/gentoo-loongarch64-cross.docker
new file mode 100644
index 0000000000..80d7ddace1
--- /dev/null
+++ b/tests/docker/dockerfiles/gentoo-loongarch64-cross.docker
@@ -0,0 +1,21 @@
+#
+# Docker LoongArch64 cross-compiler target
+#
+# This docker target is used for building loongarch64 tests. As it also
+# needs to be able to build QEMU itself in CI we include it's
+# build-deps. It is also a "stand-alone" image so as not to be
+# triggered by re-builds on other base images given it takes a long
+# time to build.
+#
+
+FROM docker.io/gentoo/stage3:20211215
+
+ADD build-toolchain.sh /root/build-toolchain.sh
+RUN cd /root && ./build-toolchain.sh
+
+# Specify the cross prefix for this image (see tests/docker/common.rc)
+# Also gcc 12 currently produces spurious warnings under our condition so
+# disable Werror as well
+ENV QEMU_CONFIGURE_OPTS --cross-prefix=loongarch64-unknown-linux-gnu- --disable-werror
+# We don't have target support at the moment, so just verify that things build
+ENV DEF_TARGET_LIST x86_64-softmmu,x86_64-linux-user
diff --git a/tests/docker/dockerfiles/gentoo-loongarch64-cross.docker.d/build-toolchain.sh b/tests/docker/dockerfiles/gentoo-loongarch64-cross.docker.d/build-toolchain.sh
new file mode 100755
index 0000000000..3986db72ed
--- /dev/null
+++ b/tests/docker/dockerfiles/gentoo-loongarch64-cross.docker.d/build-toolchain.sh
@@ -0,0 +1,128 @@
+#!/bin/bash
+
+set -e
+
+TRIPLE=loongarch64-unknown-linux-gnu
+CROSSDEV_OV=/opt/crossdev-overlay
+LOONGSON_OV=/opt/loongson-overlay
+CROSS_EMERGE="${TRIPLE}-emerge"
+
+# this will break on non-SMP machines, but no one should build this image
+# on such machine in the first place
+J=$(expr $(nproc) / 2)
+echo "MAKEOPTS=\"-j${J} -l${J}\"" >> /etc/portage/make.conf
+echo "EGIT_CLONE_TYPE=shallow" >> /etc/portage/make.conf
+
+# these features are not supported in Docker
+export FEATURES="-ipc-sandbox -network-sandbox"
+
+# populate Portage tree
+GENTOO_MIRROR='https://bouncer.gentoo.org/fetch/root/all'
+PORTAGE_SNAPSHOT_FILE=gentoo-20211214.tar.xz
+pushd /tmp
+    wget "${GENTOO_MIRROR}/snapshots/${PORTAGE_SNAPSHOT_FILE}"
+
+    mkdir -p /var/db/repos/gentoo
+    pushd /var/db/repos/gentoo
+        tar -xf "/tmp/${PORTAGE_SNAPSHOT_FILE}" --strip-components=1
+    popd
+
+    rm "$PORTAGE_SNAPSHOT_FILE"
+popd
+
+emerge -j crossdev dev-vcs/git
+
+# prepare for crossdev
+mkdir /etc/portage/repos.conf
+crossdev -t "$TRIPLE" --ov-output "$CROSSDEV_OV" --init-target
+
+git clone https://github.com/xen0n/loongson-overlay.git "$LOONGSON_OV"
+pushd "$LOONGSON_OV"
+    git checkout 4bf659f8f6a24794cfd34cc7724bbfc965817689
+popd
+
+pushd "${CROSSDEV_OV}/cross-${TRIPLE}"
+    rm binutils gcc glibc linux-headers
+    ln -s "${LOONGSON_OV}/sys-devel/binutils" .
+    ln -s "${LOONGSON_OV}/sys-devel/gcc" .
+    ln -s "${LOONGSON_OV}/sys-libs/glibc" .
+    ln -s "${LOONGSON_OV}/sys-kernel/linux-headers" .
+popd
+
+cat > "${CROSSDEV_OV}/metadata/layout.conf" <<EOF
+masters = gentoo
+repo-name = crossdev-overlay
+manifest-hashes = SHA256 SHA512 WHIRLPOOL
+thin-manifests = true
+EOF
+
+chown -R portage:portage "$CROSSDEV_OV"
+chown -R portage:portage "$LOONGSON_OV"
+
+# toolchain-funcs.eclass patch is upstream as of 20211214 snapshot,
+# but we still need to patch multilib.eclass for correct libpath
+pushd /var/db/repos/gentoo
+
+# this is to please checkpatch, hmm...
+TAB="$(printf "\t")"
+patch -Np1 <<EOF
+--- a/eclass/multilib.eclass
++++ b/eclass/multilib.eclass
+@@ -368,6 +368,15 @@ multilib_env() {
+ ${TAB}${TAB}${TAB}${TAB};;
+ ${TAB}${TAB}${TAB}esac
+ ${TAB}${TAB};;
++${TAB}${TAB}loongarch64*)
++${TAB}${TAB}${TAB}export CFLAGS_lp64d=\${CFLAGS_lp64d--mabi=lp64d}
++${TAB}${TAB}${TAB}export CHOST_lp64d=\${CTARGET}
++${TAB}${TAB}${TAB}export CTARGET_lp64d=\${CTARGET}
++${TAB}${TAB}${TAB}export LIBDIR_lp64d=\${LIBDIR_lp64d-lib64}
++
++${TAB}${TAB}${TAB}: \${MULTILIB_ABIS=lp64d}
++${TAB}${TAB}${TAB}: \${DEFAULT_ABI=lp64d}
++${TAB}${TAB};;
+ ${TAB}${TAB}mips64*|mipsisa64*)
+ ${TAB}${TAB}${TAB}export CFLAGS_o32=\${CFLAGS_o32--mabi=32}
+ ${TAB}${TAB}${TAB}export CHOST_o32=\${CTARGET/mips64/mips}
+EOF
+unset TAB
+
+popd
+
+# make cross toolchain
+crossdev -t "$TRIPLE" --without-headers \
+    --binutils 2.37_p1-r1 \
+    --gcc 12.0.0_pre9999 \
+    --libc 2.34-r4
+
+# prepare for loongarch cross emerges
+TARGET_PROFILE="default/linux/loong/21.0/la64v100/lp64d/desktop"
+pushd "/usr/${TRIPLE}/etc/portage"
+    rm make.profile
+    ln -s "${LOONGSON_OV}/profiles/${TARGET_PROFILE}" ./make.profile
+
+    mkdir repos.conf
+    cat > repos.conf/loongson.conf <<EOF
+[loongson]
+priority = 50
+location = $LOONGSON_OV
+auto-sync = No
+EOF
+
+popd
+
+# add build deps for qemu
+
+# gawk seems to have problems installing with concurrency, and its deps
+# include ncurses that needs disabling sandbox to correctly build under
+# Docker, so just turn off sandbox for all emerges
+export FEATURES="$FEATURES -sandbox -usersandbox"
+$CROSS_EMERGE -1 --onlydeps -j$J gawk
+mkdir -p "/usr/${TRIPLE}/bin"
+MAKEOPTS='-j1' $CROSS_EMERGE -1 gawk
+
+# then build the rest
+$CROSS_EMERGE -1 --onlydeps -j$J qemu
+
+# clean up downloaded files and Portage tree for smaller image
+rm -rf /var/db/repos/gentoo /var/cache/distfiles
-- 
2.25.1


