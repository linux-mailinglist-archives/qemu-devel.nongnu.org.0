Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC143B4833
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 19:26:46 +0200 (CEST)
Received: from localhost ([::1]:55248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwpbJ-0001VS-Nx
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 13:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lwpXG-0001g9-OX
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 13:22:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lwpXD-00028b-Vb
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 13:22:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624641751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wrHnEH7pN4mF4QpBdDL6Lr4kLdlYGi2+yRSUzkRA+Ik=;
 b=VnsDO8jFFHsNPJLz79Iq0W+iayVC2OoGDCd5mXMv0YxdU0Fzde5VPZc5Vq2qwzuOQnNaci
 cpgeog3oGFBmbILN6lQDLRt78QOl6Yx4G88O+i0n+zlsQEKgTbmBOopi/YvTKWFynNKmXT
 S7JhoHuRvKKNtAtLiYXggS2Z8nXvN9Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-AqCYxPieNX23hddXfj2kxw-1; Fri, 25 Jun 2021 13:22:28 -0400
X-MC-Unique: AqCYxPieNX23hddXfj2kxw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DA07100C609;
 Fri, 25 Jun 2021 17:22:27 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-183.ams2.redhat.com
 [10.36.114.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C1DA1007623;
 Fri, 25 Jun 2021 17:22:24 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] gitlab: support for FreeBSD 12,
 13 and macOS 11 via cirrus-run
Date: Fri, 25 Jun 2021 18:22:10 +0100
Message-Id: <20210625172211.451010-3-berrange@redhat.com>
In-Reply-To: <20210625172211.451010-1-berrange@redhat.com>
References: <20210625172211.451010-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds support for running 4 jobs via Cirrus CI runners:

 * FreeBSD 12
 * FreeBSD 13
 * macOS 11 with default XCode
 * macOS 11 with latest XCode

The gitlab job uses a container published by the libvirt-ci
project (https://gitlab.com/libvirt/libvirt-ci) that contains
the 'cirrus-run' command. This accepts a short yaml file that
describes a single Cirrus CI job, runs it using the Cirrus CI
REST API, and reports any output to the console.

In this way Cirrus CI is effectively working as an indirect
custom runner for GitLab CI pipelines. The key benefit is that
Cirrus CI job results affect the GitLab CI pipeline result and
so the user only has look at one CI dashboard.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitlab-ci.d/cirrus.yml             | 103 ++++++++++++++++++++++++++++
 .gitlab-ci.d/cirrus/README.rst      |  54 +++++++++++++++
 .gitlab-ci.d/cirrus/build.yml       |  35 ++++++++++
 .gitlab-ci.d/cirrus/freebsd-12.vars |  13 ++++
 .gitlab-ci.d/cirrus/freebsd-13.vars |  13 ++++
 .gitlab-ci.d/cirrus/macos-11.vars   |  15 ++++
 .gitlab-ci.d/qemu-project.yml       |   1 +
 7 files changed, 234 insertions(+)
 create mode 100644 .gitlab-ci.d/cirrus.yml
 create mode 100644 .gitlab-ci.d/cirrus/README.rst
 create mode 100644 .gitlab-ci.d/cirrus/build.yml
 create mode 100644 .gitlab-ci.d/cirrus/freebsd-12.vars
 create mode 100644 .gitlab-ci.d/cirrus/freebsd-13.vars
 create mode 100644 .gitlab-ci.d/cirrus/macos-11.vars

diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
new file mode 100644
index 0000000000..d7b4cce79b
--- /dev/null
+++ b/.gitlab-ci.d/cirrus.yml
@@ -0,0 +1,103 @@
+# Jobs that we delegate to Cirrus CI because they require an operating
+# system other than Linux. These jobs will only run if the required
+# setup has been performed on the GitLab account.
+#
+# The Cirrus CI configuration is generated by replacing target-specific
+# variables in a generic template: some of these variables are provided
+# when the GitLab CI job is defined, others are taken from a shell
+# snippet generated using lcitool.
+#
+# Note that the $PATH environment variable has to be treated with
+# special care, because we can't just override it at the GitLab CI job
+# definition level or we risk breaking it completely.
+.cirrus_build_job:
+  stage: build
+  image: registry.gitlab.com/libvirt/libvirt-ci/cirrus-run:master
+  needs: []
+  script:
+    - source .gitlab-ci.d/cirrus/$NAME.vars
+    - sed -e "s|[@]CI_REPOSITORY_URL@|$CI_REPOSITORY_URL|g"
+          -e "s|[@]CI_COMMIT_REF_NAME@|$CI_COMMIT_REF_NAME|g"
+          -e "s|[@]CI_COMMIT_SHA@|$CI_COMMIT_SHA|g"
+          -e "s|[@]CIRRUS_VM_INSTANCE_TYPE@|$CIRRUS_VM_INSTANCE_TYPE|g"
+          -e "s|[@]CIRRUS_VM_IMAGE_SELECTOR@|$CIRRUS_VM_IMAGE_SELECTOR|g"
+          -e "s|[@]CIRRUS_VM_IMAGE_NAME@|$CIRRUS_VM_IMAGE_NAME|g"
+          -e "s|[@]CIRRUS_VM_CPUS@|$CIRRUS_VM_CPUS|g"
+          -e "s|[@]CIRRUS_VM_RAM@|$CIRRUS_VM_RAM|g"
+          -e "s|[@]UPDATE_COMMAND@|$UPDATE_COMMAND|g"
+          -e "s|[@]INSTALL_COMMAND@|$INSTALL_COMMAND|g"
+          -e "s|[@]PATH@|$PATH_EXTRA${PATH_EXTRA:+:}\$PATH|g"
+          -e "s|[@]PKG_CONFIG_PATH@|$PKG_CONFIG_PATH|g"
+          -e "s|[@]PKGS@|$PKGS|g"
+          -e "s|[@]MAKE@|$MAKE|g"
+          -e "s|[@]PYTHON@|$PYTHON|g"
+          -e "s|[@]PIP3@|$PIP3|g"
+          -e "s|[@]PYPI_PKGS@|$PYPI_PKGS|g"
+          -e "s|[@]CONFIGURE_ARGS@|$CONFIGURE_ARGS|g"
+          -e "s|[@]TEST_TARGETSS@|$TEST_TARGETSS|g"
+      <.gitlab-ci.d/cirrus/build.yml >.gitlab-ci.d/cirrus/$NAME.yml
+    - cat .gitlab-ci.d/cirrus/$NAME.yml
+    - cirrus-run -v --show-build-log always .gitlab-ci.d/cirrus/$NAME.yml
+  rules:
+    - if: "$TEMPORARILY_DISABLED"
+      allow_failure: true
+    - if: "$CIRRUS_GITHUB_REPO && $CIRRUS_API_TOKEN"
+
+x64-freebsd-12-build:
+  extends: .cirrus_build_job
+  variables:
+    NAME: freebsd-12
+    CIRRUS_VM_INSTANCE_TYPE: freebsd_instance
+    CIRRUS_VM_IMAGE_SELECTOR: image_family
+    CIRRUS_VM_IMAGE_NAME: freebsd-12-2
+    CIRRUS_VM_CPUS: 8
+    CIRRUS_VM_RAM: 8G
+    UPDATE_COMMAND: pkg update
+    INSTALL_COMMAND: pkg install -y
+    # TODO: Enable gnutls again once FreeBSD's libtasn1 got fixed
+    # See: https://gitlab.com/gnutls/libtasn1/-/merge_requests/71
+    CONFIGURE_ARGS: --disable-gnutls
+    TEST_TARGETS: check
+
+x64-freebsd-13-build:
+  extends: .cirrus_build_job
+  variables:
+    NAME: freebsd-13
+    CIRRUS_VM_INSTANCE_TYPE: freebsd_instance
+    CIRRUS_VM_IMAGE_SELECTOR: image_family
+    CIRRUS_VM_IMAGE_NAME: freebsd-13-0
+    CIRRUS_VM_CPUS: 8
+    CIRRUS_VM_RAM: 8G
+    UPDATE_COMMAND: pkg update
+    INSTALL_COMMAND: pkg install -y
+    TEST_TARGETS: check
+
+x64-macos-11-base-build:
+  extends: .cirrus_build_job
+  variables:
+    NAME: macos-11
+    CIRRUS_VM_INSTANCE_TYPE: osx_instance
+    CIRRUS_VM_IMAGE_SELECTOR: image
+    CIRRUS_VM_IMAGE_NAME: big-sur-base
+    CIRRUS_VM_CPUS: 12
+    CIRRUS_VM_RAM: 24G
+    UPDATE_COMMAND: brew update
+    INSTALL_COMMAND: brew install
+    PATH_EXTRA: /usr/local/opt/ccache/libexec:/usr/local/opt/gettext/bin
+    PKG_CONFIG_PATH: /usr/local/opt/curl/lib/pkgconfig:/usr/local/opt/ncurses/lib/pkgconfig:/usr/local/opt/readline/lib/pkgconfig
+    TEST_TARGETS: check-unit check-block check-qapi-schema check-softfloat check-qtest-x86_64
+
+x64-macos-11-xcode-build:
+  extends: .cirrus_build_job
+  variables:
+    NAME: macos-11
+    CIRRUS_VM_INSTANCE_TYPE: osx_instance
+    CIRRUS_VM_IMAGE_SELECTOR: image
+    CIRRUS_VM_IMAGE_NAME: big-sur-xcode
+    CIRRUS_VM_CPUS: 12
+    CIRRUS_VM_RAM: 24G
+    UPDATE_COMMAND: brew update
+    INSTALL_COMMAND: brew install
+    PATH_EXTRA: /usr/local/opt/ccache/libexec:/usr/local/opt/gettext/bin
+    PKG_CONFIG_PATH: /usr/local/opt/curl/lib/pkgconfig:/usr/local/opt/ncurses/lib/pkgconfig:/usr/local/opt/readline/lib/pkgconfig
+    TEST_TARGETS: check-unit check-block check-qapi-schema check-softfloat check-qtest-x86_64
diff --git a/.gitlab-ci.d/cirrus/README.rst b/.gitlab-ci.d/cirrus/README.rst
new file mode 100644
index 0000000000..657b0706d7
--- /dev/null
+++ b/.gitlab-ci.d/cirrus/README.rst
@@ -0,0 +1,54 @@
+Cirrus CI integration
+=====================
+
+GitLab CI shared runners only provide a docker environment running on Linux.
+While it is possible to provide private runners for non-Linux platforms this
+is not something most contributors/maintainers will wish to do.
+
+To work around this limitation, we take advantage of `Cirrus CI`_'s free
+offering: more specifically, we use the `cirrus-run`_ script to trigger Cirrus
+CI jobs from GitLab CI jobs so that Cirrus CI job output is integrated into
+the main GitLab CI pipeline dashboard.
+
+There is, however, some one-time setup required. If you want FreeBSD and macOS
+builds to happen when you push to your GitLab repository, you need to
+
+* set up a GitHub repository for the project, eg. ``yourusername/qemu``.
+  This repository needs to exist for cirrus-run to work, but it doesn't need to
+  be kept up to date, so you can create it and then forget about it;
+
+* enable the `Cirrus CI GitHub app`_  for your GitHub account;
+
+* sign up for Cirrus CI. It's enough to log into the website using your GitHub
+  account;
+
+* grab an API token from the `Cirrus CI settings`_ page;
+
+* it may be necessary to push an empty ``.cirrus.yml`` file to your github fork
+  for Cirrus CI to properly recognize the project. You can check whether
+  Cirrus CI knows about your project by navigating to:
+
+  ``https://cirrus-ci.com/yourusername/qemu``
+
+* in the *CI/CD / Variables* section of the settings page for your GitLab
+  repository, create two new variables:
+
+  * ``CIRRUS_GITHUB_REPO``, containing the name of the GitHub repository
+    created earlier, eg. ``yourusername/qemu``;
+
+  * ``CIRRUS_API_TOKEN``, containing the Cirrus CI API token generated earlier.
+    This variable **must** be marked as *Masked*, because anyone with knowledge
+    of it can impersonate you as far as Cirrus CI is concerned.
+
+  Neither of these variables should be marked as *Protected*, because in
+  general you'll want to be able to trigger Cirrus CI builds from non-protected
+  branches.
+
+Once this one-time setup is complete, you can just keep pushing to your GitLab
+repository as usual and you'll automatically get the additional CI coverage.
+
+
+.. _Cirrus CI GitHub app: https://github.com/marketplace/cirrus-ci
+.. _Cirrus CI settings: https://cirrus-ci.com/settings/profile/
+.. _Cirrus CI: https://cirrus-ci.com/
+.. _cirrus-run: https://github.com/sio/cirrus-run/
diff --git a/.gitlab-ci.d/cirrus/build.yml b/.gitlab-ci.d/cirrus/build.yml
new file mode 100644
index 0000000000..857bdc5536
--- /dev/null
+++ b/.gitlab-ci.d/cirrus/build.yml
@@ -0,0 +1,35 @@
+@CIRRUS_VM_INSTANCE_TYPE@:
+  @CIRRUS_VM_IMAGE_SELECTOR@: @CIRRUS_VM_IMAGE_NAME@
+  cpu: @CIRRUS_VM_CPUS@
+  memory: @CIRRUS_VM_RAM@
+
+env:
+  CIRRUS_CLONE_DEPTH: 1
+  CI_REPOSITORY_URL: "@CI_REPOSITORY_URL@"
+  CI_COMMIT_REF_NAME: "@CI_COMMIT_REF_NAME@"
+  CI_COMMIT_SHA: "@CI_COMMIT_SHA@"
+  PATH: "@PATH@"
+  PKG_CONFIG_PATH: "@PKG_CONFIG_PATH@"
+  PYTHON: "@PYTHON@"
+  MAKE: "@MAKE@"
+  CONFIGURE_ARGS: "@CONFIGURE_ARGS@"
+
+build_task:
+  install_script:
+    - @UPDATE_COMMAND@
+    - @INSTALL_COMMAND@ @PKGS@
+    - if test -n "@PYPI_PKGS@" ; then @PIP3@ install @PYPI_PKGS@ ; fi
+  clone_script:
+    - git clone --depth 100 "$CI_REPOSITORY_URL" .
+    - git fetch origin "$CI_COMMIT_REF_NAME"
+    - git reset --hard "$CI_COMMIT_SHA"
+  build_script:
+    - mkdir build
+    - cd build
+    - ../configure --enable-werror $CONFIGURE_ARGS
+      || { cat config.log meson-logs/meson-log.txt; exit 1; }
+    - $MAKE -j$(sysctl -n hw.ncpu)
+    - for TARGET in $TEST_TARGETS ;
+      do
+        $MAKE -j$(sysctl -n hw.ncpu) $TARGET V=1 ;
+      done
diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars b/.gitlab-ci.d/cirrus/freebsd-12.vars
new file mode 100644
index 0000000000..5e51e50ea9
--- /dev/null
+++ b/.gitlab-ci.d/cirrus/freebsd-12.vars
@@ -0,0 +1,13 @@
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool variables freebsd-12 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci/-/commit/c7e275ab27ac0dcd09da290817b9adeea1fd1eb1
+
+PACKAGING_COMMAND='pkg'
+CCACHE='/usr/local/bin/ccache'
+MAKE='/usr/local/bin/gmake'
+NINJA='/usr/local/bin/ninja'
+PYTHON='/usr/local/bin/python3'
+PIP3='/usr/local/bin/pip-3.7'
+PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 libxml2 llvm lttng-ust lzo2 meson ncurses nettle ninja opencv p5-Test-Harness perl5 pixman pkgconf png py37-numpy py37-pillow py37-pip py37-sphinx py37-sphinx_rtd_theme py37-virtualenv py37-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
diff --git a/.gitlab-ci.d/cirrus/freebsd-13.vars b/.gitlab-ci.d/cirrus/freebsd-13.vars
new file mode 100644
index 0000000000..07716833d9
--- /dev/null
+++ b/.gitlab-ci.d/cirrus/freebsd-13.vars
@@ -0,0 +1,13 @@
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool variables freebsd-13 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci/-/commit/c7e275ab27ac0dcd09da290817b9adeea1fd1eb1
+
+PACKAGING_COMMAND='pkg'
+CCACHE='/usr/local/bin/ccache'
+MAKE='/usr/local/bin/gmake'
+NINJA='/usr/local/bin/ninja'
+PYTHON='/usr/local/bin/python3'
+PIP3='/usr/local/bin/pip-3.7'
+PKGS='alsa-lib bash bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage ctags curl cyrus-sasl dbus diffutils gettext git glib gmake gnutls gsed gtk3 libepoxy libffi libgcrypt libjpeg-turbo libnfs libspice-server libssh libtasn1 libxml2 llvm lttng-ust lzo2 meson ncurses nettle ninja opencv p5-Test-Harness perl5 pixman pkgconf png py37-numpy py37-pillow py37-pip py37-sphinx py37-sphinx_rtd_theme py37-virtualenv py37-yaml python3 rpm2cpio sdl2 sdl2_image snappy spice-protocol tesseract texinfo usbredir virglrenderer vte3 zstd'
diff --git a/.gitlab-ci.d/cirrus/macos-11.vars b/.gitlab-ci.d/cirrus/macos-11.vars
new file mode 100644
index 0000000000..cbec8a44a3
--- /dev/null
+++ b/.gitlab-ci.d/cirrus/macos-11.vars
@@ -0,0 +1,15 @@
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool variables macos-11 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci/-/commit/c7e275ab27ac0dcd09da290817b9adeea1fd1eb1
+
+PACKAGING_COMMAND='brew'
+CCACHE='/usr/local/bin/ccache'
+MAKE='/usr/local/bin/gmake'
+NINJA='/usr/local/bin/ninja'
+PYTHON='/usr/local/bin/python3'
+PIP3='/usr/local/bin/pip3'
+PKGS='bash bc bzip2 capstone ccache cpanminus ctags curl dbus diffutils gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb libxml2 llvm lzo make meson ncurses nettle ninja perl pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy sparse spice-protocol tesseract texinfo usbredir vde vte3 zlib zstd'
+PYPI_PKGS='PyYAML numpy pillow sphinx sphinx-rtd-theme virtualenv'
+CPAN_PKGS='Test::Harness'
diff --git a/.gitlab-ci.d/qemu-project.yml b/.gitlab-ci.d/qemu-project.yml
index 64cb2ba1da..35d4e62c12 100644
--- a/.gitlab-ci.d/qemu-project.yml
+++ b/.gitlab-ci.d/qemu-project.yml
@@ -9,3 +9,4 @@ include:
   - local: '/.gitlab-ci.d/crossbuilds.yml'
   - local: '/.gitlab-ci.d/buildtest.yml'
   - local: '/.gitlab-ci.d/static_checks.yml'
+  - local: '/.gitlab-ci.d/cirrus.yml'
-- 
2.31.1


