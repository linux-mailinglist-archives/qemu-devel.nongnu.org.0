Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6286848105C
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 07:27:05 +0100 (CET)
Received: from localhost ([::1]:42294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2SQR-0004Pf-U8
	for lists+qemu-devel@lfdr.de; Wed, 29 Dec 2021 01:27:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1n2SLu-0003BU-7Y
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 01:22:22 -0500
Received: from mail.xen0n.name ([115.28.160.31]:49816
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1n2SLq-0003rx-Dl
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 01:22:21 -0500
Received: from ld50.lan (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 24BBF60091;
 Wed, 29 Dec 2021 14:22:09 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1640758929; bh=o30+y8LZl01a7tNtj99H5ekOrjoesazWKVmD/4T0R8M=;
 h=From:To:Cc:Subject:Date:From;
 b=iA3ayxz9BGyUS56g4PH/oUSR0J0iM0EVNS57wcac3t6rBClGSjxLT+88XM8CZeklu
 WzQmWLdPKm5mNkv1rx+SN34+sDN8VCE7TxJHAUdPFehMO/1LnU13pgdxcRM6Abs4k+
 82QrIM0Usk/C2k0C0xuDx8MSHIKTEYf0Q8ad/3HU=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/docker: Add gentoo-loongarch64-cross image and run
 cross builds in GitLab
Date: Wed, 29 Dec 2021 14:22:04 +0800
Message-Id: <20211229062204.3726981-1-git@xen0n.name>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=git@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 WANG Xuerui <git@xen0n.name>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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

(In the original submission along with the rest of LoongArch TCG
patches, I forgot to make the dependency to the container build job
optional, thus CI was passing in my own fork but broke upstream. Fixed
for a 2nd take, and I also took the chance to update base image versions
and such.)

Signed-off-by: WANG Xuerui <git@xen0n.name>
---

(Note to CI maintainers: obviously this image has to be built and pushed
manually, for everything to keep working. Sorry for the extra work
early-on, but the community around LoongArch still hope to upstream most
things during 2022 so eventually we will transition away from this.
This work is no hurry though, and Happy Holidays everyone!)

 .gitlab-ci.d/container-cross.yml              |  27 +++++
 .gitlab-ci.d/crossbuilds.yml                  |  25 ++++
 MAINTAINERS                                   |   2 +
 tests/docker/Makefile.include                 |  21 ++++
 .../gentoo-loongarch64-cross.docker           |  21 ++++
 .../build-toolchain.sh                        | 109 ++++++++++++++++++
 6 files changed, 205 insertions(+)
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
index 17d6cb3e45..ef19ade554 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -68,6 +68,31 @@ cross-i386-tci:
     EXTRA_CONFIGURE_OPTS: --target-list=i386-softmmu,i386-linux-user,aarch64-softmmu,aarch64-linux-user,ppc-softmmu,ppc-linux-user
     MAKE_CHECK_ARGS: check check-tcg
 
+# Upstream LoongArch support is still incomplete, but toolchain is already
+# usable and partially merged, so the host support is already testable; but
+# don't let failures block CI.
+#
+# Similar to hexagon, the container image is built outside of CI and manually
+# uploaded at the moment, so make the dependency to container build job
+# optional.
+cross-loongarch64-system:
+  extends: .cross_system_build_job
+  allow_failure: true
+  needs:
+    job: loongarch64-cross-container
+    optional: true
+  variables:
+    IMAGE: gentoo-loongarch64-cross
+
+cross-loongarch64-user:
+  extends: .cross_user_build_job
+  allow_failure: true
+  needs:
+    job: loongarch64-cross-container
+    optional: true
+  variables:
+    IMAGE: gentoo-loongarch64-cross
+
 cross-mips-system:
   extends: .cross_system_build_job
   needs:
diff --git a/MAINTAINERS b/MAINTAINERS
index 5456536805..6b42fe16c7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3148,6 +3148,8 @@ LoongArch64 TCG target
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
index 0000000000..59846223d3
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
+FROM docker.io/gentoo/stage3:20211229
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
index 0000000000..654f1394e9
--- /dev/null
+++ b/tests/docker/dockerfiles/gentoo-loongarch64-cross.docker.d/build-toolchain.sh
@@ -0,0 +1,109 @@
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
+PORTAGE_SNAPSHOT_FILE=gentoo-20211228.tar.xz
+pushd /tmp
+    # not every mirror will have this file synced yet, so retry until success
+    i=0
+    max_retry=5
+    while [[ $i -lt $max_retry ]]; do
+        [[ $i -gt 0 ]] && echo "Retrying ($i of $max_retry)..."
+        wget "${GENTOO_MIRROR}/snapshots/${PORTAGE_SNAPSHOT_FILE}" && break
+        : $((i++))
+    done
+    [[ -f "$PORTAGE_SNAPSHOT_FILE" ]] || exit 1
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
+    git checkout 20b9c9f96fb5ed596bbab6bd6f274932492fb12b
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
+    # util-linux needs this to not depend on pam, causing circular deps later
+    sed -i '/^USE=".*"$/s/"$/ -su"/' ./make.conf
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
2.34.1


