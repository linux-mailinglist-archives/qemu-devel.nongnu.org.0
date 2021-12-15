Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B17475BC2
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 16:22:49 +0100 (CET)
Received: from localhost ([::1]:40478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxW7E-0003Ep-AU
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 10:22:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mxV92-0001WC-IG
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:20:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mxV8q-0001EO-VD
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:20:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639578016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rCtuAJKAOp9TpDFWuRUtYFP8Srrr4bqrv1tChIwgrq8=;
 b=TjSd72Ou2IYrMJfSd4qpktQ0kwUECw4Bks4fIeSwkL5lNq+mxaIxx1oJDLogYdNWHfLsMU
 2IrSEq/AiQ0RPC5aYlvgP9TuME22Mhz9rvdPZsSykcc0vsBgZ8kTFk6/nvTTYdwSp9sFD5
 Uli8BDCbrctvbqnf4oa7O3H/reeFKZY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-81-PRYA-kX5MyGwHJjxWMc82g-1; Wed, 15 Dec 2021 09:20:13 -0500
X-MC-Unique: PRYA-kX5MyGwHJjxWMc82g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C63AC801AC5;
 Wed, 15 Dec 2021 14:20:11 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.22.8.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9229F101E7E1;
 Wed, 15 Dec 2021 14:20:09 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 07/18] tests: integrate lcitool for generating build env
 manifests
Date: Wed, 15 Dec 2021 14:19:38 +0000
Message-Id: <20211215141949.3512719-8-berrange@redhat.com>
In-Reply-To: <20211215141949.3512719-1-berrange@redhat.com>
References: <20211215141949.3512719-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This introduces

  https://gitlab.com/libvirt/libvirt-ci

as a git submodule at tests/lcitool/libvirt-ci

The 'lcitool' program within this submodule will be used to
automatically generate build environment manifests from a definition
of requirements in tests/lcitool/projects/qemu.yml

It will ultimately be capable of generating

 - Dockerfiles
 - Package lists for installation in VMs
 - Variables for configuring Cirrus CI environments

When a new build pre-requisite is needed for QEMU, if this package
is not currently known to libvirt-ci, it must first be added to the
'mappings.yml' file in the above git repo.

Then the submodule can be updated and the build pre-requisite added
to the tests/lcitool/projects/qemu.yml file. Now all the build env
manifests can be re-generated using  'make lcitool-refresh'

This ensures that when a new build pre-requisite is introduced, it
is added to all the different OS containers, VMs and Cirrus CI
environments consistently.

It also facilitates the addition of containers targetting new distros
or updating existing containers to new versions of the same distro,
where packages might have been renamed.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitmodules                     |   3 +
 Makefile                        |   2 +
 docs/devel/testing.rst          | 104 ++++++++++++++++++++++++++++-
 tests/lcitool/Makefile.include  |  17 +++++
 tests/lcitool/libvirt-ci        |   1 +
 tests/lcitool/projects/qemu.yml | 115 ++++++++++++++++++++++++++++++++
 tests/lcitool/refresh           |  67 +++++++++++++++++++
 7 files changed, 306 insertions(+), 3 deletions(-)
 create mode 100644 tests/lcitool/Makefile.include
 create mode 160000 tests/lcitool/libvirt-ci
 create mode 100644 tests/lcitool/projects/qemu.yml
 create mode 100755 tests/lcitool/refresh

diff --git a/.gitmodules b/.gitmodules
index 08b1b48a09..84425d87e2 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -64,3 +64,6 @@
 [submodule "roms/vbootrom"]
 	path = roms/vbootrom
 	url = https://gitlab.com/qemu-project/vbootrom.git
+[submodule "tests/lcitool/libvirt-ci"]
+	path = tests/lcitool/libvirt-ci
+	url = http://gitlab.com/libvirt/libvirt-ci
diff --git a/Makefile b/Makefile
index 74c5b46d38..aec4728240 100644
--- a/Makefile
+++ b/Makefile
@@ -287,6 +287,7 @@ cscope:
 # Needed by "meson install"
 export DESTDIR
 
+include $(SRC_PATH)/tests/lcitool/Makefile.include
 include $(SRC_PATH)/tests/docker/Makefile.include
 include $(SRC_PATH)/tests/vm/Makefile.include
 
@@ -316,6 +317,7 @@ endif
 	@echo  'Test targets:'
 	$(call print-help,check,Run all tests (check-help for details))
 	$(call print-help,bench,Run all benchmarks)
+	$(call print-help,lcitool-help,Help about targets for managing build environment manifests)
 	$(call print-help,docker-help,Help about targets running tests inside containers)
 	$(call print-help,vm-help,Help about targets running tests inside VM)
 	@echo  ''
diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 755343c7dd..d744b5909c 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -382,14 +382,112 @@ Along with many other images, the ``centos8`` image is defined in a Dockerfile
 in ``tests/docker/dockerfiles/``, called ``centos8.docker``. ``make docker-help``
 command will list all the available images.
 
-To add a new image, simply create a new ``.docker`` file under the
-``tests/docker/dockerfiles/`` directory.
-
 A ``.pre`` script can be added beside the ``.docker`` file, which will be
 executed before building the image under the build context directory. This is
 mainly used to do necessary host side setup. One such setup is ``binfmt_misc``,
 for example, to make qemu-user powered cross build containers work.
 
+Most of the existing Dockerfiles were written by hand, simply by creating a
+a new ``.docker`` file under the ``tests/docker/dockerfiles/`` directory.
+This has led to an inconsistent set of packages being present across the
+different containers.
+
+Thus going forward, QEMU is aiming to automatically generate the Dockerfiles
+using the ``lcitool`` program provided by the ``libvirt-ci`` project:
+
+  https://gitlab.com/libvirt/libvirt-ci
+
+In that project, there is a ``mappings.yml`` file defining the distro native
+package names for a wide variety of third party projects. This is processed
+in combination with a project defined list of build pre-requisites to determine
+the list of native packages to install on each distribution. This can be used
+to generate dockerfiles, VM package lists and Cirrus CI variables needed to
+setup build environments across OS distributions with a consistent set of
+packages present.
+
+When preparing a patch series that adds a new build pre-requisite to QEMU,
+updates to various lcitool data files may be required.
+
+
+Adding new build pre-requisites
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+In the simple case where the pre-requisite is already known to ``libvirt-ci``
+the following steps are needed
+
+ * Edit ``tests/lcitool/projects/qemu.yml`` and add the pre-requisite
+
+ * Run ``make lcitool-refresh`` to re-generate all relevant build environment
+   manifests
+
+In some cases ``libvirt-ci`` will not know about the build pre-requisite and
+thus some extra preparation steps will be required first
+
+ * Fork the ``libvirt-ci`` project on gitlab
+
+ * Edit the ``mappings.yml`` change to add an entry for the new build
+   prerequisite, listing its native package name on as many OS distros
+   as practical.
+
+ * Commit the ``mappings.yml`` change and submit a merge request to
+   the ``libvirt-ci`` project, noting in the description that this
+   is a new build pre-requisite desired for use with QEMU
+
+ * CI pipeline will run to validate that the changes to ``mappings.yml``
+   are correct, by attempting to install the newly listed package on
+   all OS distributions supported by ``libvirt-ci``.
+
+ * Once the merge request is accepted, go back to QEMU and update
+   the ``libvirt-ci`` submodule to point to a commit that contains
+   the ``mappings.yml`` update.
+
+
+Adding new OS distros
+^^^^^^^^^^^^^^^^^^^^^
+
+In some cases ``libvirt-ci`` will not know about the OS distro that is
+desired to be tested. Before adding a new OS distro, discuss the proposed
+addition:
+
+ * Send a mail to qemu-devel, copying people listed in the
+   MAINTAINERS file for ``Build and test automation``.
+
+   There are limited CI compute resources available to QEMU, so the
+   cost/benefit tradeoff of adding new OS distros needs to be considered.
+
+ * File an issue at https://gitlab.com/libvirt/libvirt-ci/-/issues
+   pointing to the qemu-devel mail thread in the archives.
+
+   This alerts other people who might be interested in the work
+   to avoid duplication, as well as to get feedback from libvirt-ci
+   maintainers on any tips to ease the addition
+
+Assuming there is agreement to add a new OS distro then
+
+ * Fork the ``libvirt-ci`` project on gitlab
+
+ * Add metadata under ``guests/lcitool/lcitool/ansible/group_vars/``
+   for the new OS distro. There might be code changes required if
+   the OS distro uses a package format not currently known. The
+   ``libvirt-ci`` maintainers can advise on this when the issue
+   is file.
+
+ * Edit the ``mappings.yml`` change to update all the existing package
+   entries, providing details of the new OS distro
+
+ * Commit the ``mappings.yml`` change and submit a merge request to
+   the ``libvirt-ci`` project, noting in the description that this
+   is a new build pre-requisite desired for use with QEMU
+
+ * CI pipeline will run to validate that the changes to ``mappings.yml``
+   are correct, by attempting to install the newly listed package on
+   all OS distributions supported by ``libvirt-ci``.
+
+ * Once the merge request is accepted, go back to QEMU and update
+   the ``libvirt-ci`` submodule to point to a commit that contains
+   the ``mappings.yml`` update.
+
+
 Tests
 ~~~~~
 
diff --git a/tests/lcitool/Makefile.include b/tests/lcitool/Makefile.include
new file mode 100644
index 0000000000..cff7c0b814
--- /dev/null
+++ b/tests/lcitool/Makefile.include
@@ -0,0 +1,17 @@
+
+LCITOOL_REFRESH = $(SRC_PATH)/tests/lcitool/refresh
+
+lcitool:
+	@echo 'Manage build environment manifests'
+	@echo
+	@echo 'Available targets:'
+	@echo
+	@echo '    lcitool:             Print this help.'
+	@echo '    lcitool-refresh:     Re-generate all build environment manifests.'
+	@echo
+
+lcitool-help: lcitool
+
+lcitool-refresh:
+	$(call quiet-command, git submodule update --init $(SRC_PATH)/tests/lcitool/libvirt-ci)
+	$(call quiet-command, $(LCITOOL_REFRESH))
diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
new file mode 160000
index 0000000000..29cec2153b
--- /dev/null
+++ b/tests/lcitool/libvirt-ci
@@ -0,0 +1 @@
+Subproject commit 29cec2153b9a4dbb2e66f1cbc9866a4eff519cfd
diff --git a/tests/lcitool/projects/qemu.yml b/tests/lcitool/projects/qemu.yml
new file mode 100644
index 0000000000..2e2271510e
--- /dev/null
+++ b/tests/lcitool/projects/qemu.yml
@@ -0,0 +1,115 @@
+---
+packages:
+ - alsa
+ - bash
+ - bc
+ - brlapi
+ - bzip2
+ - bzip2-libs
+ - capstone
+ - ccache
+ - clang
+ - column
+ - ctags
+ - cyrus-sasl
+ - daxctl
+ - dbus-daemon
+ - device-mapper-multipath
+ - diffutils
+ - dtrace
+ - findutils
+ - g++
+ - gcc
+ - gcovr
+ - gettext
+ - genisoimage
+ - glib2
+ - glib2-static
+ - glibc-static
+ - glusterfs
+ - gnutls
+ - gtk3
+ - hostname
+ - libaio
+ - libattr
+ - libasan
+ - libbpf
+ - libcacard
+ - libcap-ng
+ - libcurl
+ - libdrm
+ - libepoxy
+ - libfdt
+ - libffi
+ - libgcrypt
+ - libibverbs
+ - libiscsi
+ - libjemalloc
+ - libjpeg
+ - libnfs
+ - libnuma
+ - libpmem
+ - libpng
+ - librbd
+ - librdmacm
+ - libseccomp
+ - libselinux
+ - libslirp
+ - libssh
+ - libtasn1
+ - libubsan
+ - libudev
+ - liburing
+ - libusbx
+ - libvdeplug
+ - libxml2
+ - libzstd
+ - llvm
+ - lttng-ust
+ - lzo
+ - netcat
+ - nettle
+ - ninja
+ - nsis
+ - make
+ - mesa-libgbm
+ - meson
+ - ncursesw
+ - pam
+ - pcre-static
+ - perl
+ - perl-Test-Harness
+ - pixman
+ - pkg-config
+ - pulseaudio
+ - python3
+ - python3-PyYAML
+ - python3-numpy
+ - python3-opencv
+ - python3-pillow
+ - python3-pip
+ - python3-sphinx
+ - python3-sphinx-rtd-theme
+ - python3-virtualenv
+ - rpm2cpio
+ - sdl2
+ - sdl2-image
+ - sed
+ - snappy
+ - sparse
+ - spice-protocol
+ - spice-server
+ - ssh-client
+ - systemd
+ - tar
+ - tesseract
+ - tesseract-eng
+ - texinfo
+ - usbredir
+ - virglrenderer
+ - vte
+ - which
+ - xen
+ - xfsprogs
+ - zlib
+ - zlib-static
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
new file mode 100755
index 0000000000..b47e25f64b
--- /dev/null
+++ b/tests/lcitool/refresh
@@ -0,0 +1,67 @@
+#!/usr/bin/python3
+#
+# Re-generate container recipes
+#
+# This script uses the "lcitool" available from
+#
+#   https://gitlab.com/libvirt/libvirt-ci
+#
+# Copyright (c) 2020 Red Hat Inc.
+#
+# This work is licensed under the terms of the GNU GPL, version 2
+# or (at your option) any later version. See the COPYING file in
+# the top-level directory.
+
+import sys
+import os
+import subprocess
+
+from pathlib import Path
+
+if len(sys.argv) != 1:
+   print("syntax: %s" % sys.argv[0], file=sys.stderr)
+   sys.exit(1)
+
+self_dir = Path(__file__).parent
+src_dir = self_dir.parent.parent
+dockerfiles_dir = Path(src_dir, "tests", "docker", "dockerfiles")
+
+lcitool_path = Path(self_dir, "libvirt-ci", "lcitool")
+
+lcitool_cmd = [lcitool_path, "--data-dir", self_dir]
+
+def atomic_write(filename, content):
+   tmp = filename.with_suffix(filename.suffix + ".tmp")
+   try:
+      with tmp.open("w") as fp:
+         print(content, file=fp, end="")
+         tmp.rename(filename)
+   except Exception as ex:
+      tmp.unlink()
+      raise
+
+def generate(filename, cmd, trailer):
+   print("Generate %s" % filename)
+   lcitool=subprocess.run(cmd, capture_output=True)
+
+   if lcitool.returncode != 0:
+      raise Exception("Failed to generate %s: %s" % (filename, lcitool.stderr))
+
+   content = lcitool.stdout.decode("utf8")
+   if trailer is not None:
+      content += trailer
+   atomic_write(filename, content)
+
+def generate_dockerfile(host, target, cross=None, trailer=None):
+   filename = Path(src_dir, "tests", "docker", "dockerfiles", host + ".docker")
+   cmd = lcitool_cmd + ["dockerfile"]
+   if cross is not None:
+      cmd.extend(["--cross", cross])
+   cmd.extend([target, "qemu"])
+   generate(filename, cmd, trailer)
+
+try:
+   sys.exit(0)
+except Exception as ex:
+   print(str(ex), file=sys.stderr)
+   sys.exit(1)
-- 
2.33.1


