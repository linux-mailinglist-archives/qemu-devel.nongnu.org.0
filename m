Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B2A37F573
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 12:16:03 +0200 (CEST)
Received: from localhost ([::1]:56608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh8Nu-0001Dn-HZ
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 06:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lh85E-0000CR-BK
 for qemu-devel@nongnu.org; Thu, 13 May 2021 05:56:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lh85B-0007DY-MS
 for qemu-devel@nongnu.org; Thu, 13 May 2021 05:56:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620899801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mIIgyc9PMhHj2zqwjT1SSnMRbHg8E8Y6e68Lz0KXqR4=;
 b=ijRyZjqktTlhJpmtXEnOKTGet7P3iQsJ0WGCuACX9OhOmU6ujl8MzRLSaZzqInCW0goXz2
 dJ0ghgjPtI14ujRQjPHgDhFuqZ9FzXqTVal2iV/RID2JU6iuqicbDI8ETWDhw767Jfcfj9
 Rqk9Awbt4GTmULGPbrErgj8542nSpF4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-G6u-dt5yMna1xyh7Q9qjIg-1; Thu, 13 May 2021 05:56:37 -0400
X-MC-Unique: G6u-dt5yMna1xyh7Q9qjIg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB283107ACCA;
 Thu, 13 May 2021 09:56:35 +0000 (UTC)
Received: from localhost.redhat.com (ovpn-114-2.ams2.redhat.com [10.36.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C95E10027A5;
 Thu, 13 May 2021 09:56:33 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/22] tests/docker: add script for automating container
 refresh
Date: Thu, 13 May 2021 10:55:13 +0100
Message-Id: <20210513095519.1213675-17-berrange@redhat.com>
In-Reply-To: <20210513095519.1213675-1-berrange@redhat.com>
References: <20210513095519.1213675-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This introduces

  https://gitlab.com/libvirt/libvirt-ci

as a git submodule at tests/docker/libvirt-ci

This submodule only needs to be checked out when needing to re-generate
the files in tests/docker/dockerfiles.

When a new build pre-requisite is needed for QEMU, it should be added to
the libvirt-ci project 'qemu.yml' file, and the submodule updated to the
new commit. The 'make docker-refresh' target will then re-create all the
dockerfiles with updated package lists. This ensures that all the
containers get exactly the same build pre-requisite packages installed.

It also facilitates the addition of containers targetting new distros
or updating existing containers to new versions of the same distro,
where packages might have been renamed.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitmodules                         |  3 ++
 docs/devel/testing.rst              | 15 ++++++--
 tests/docker/Makefile.include       | 10 ++++++
 tests/docker/dockerfiles-refresh.py | 56 +++++++++++++++++++++++++++++
 tests/docker/libvirt-ci             |  1 +
 5 files changed, 83 insertions(+), 2 deletions(-)
 create mode 100755 tests/docker/dockerfiles-refresh.py
 create mode 160000 tests/docker/libvirt-ci

diff --git a/.gitmodules b/.gitmodules
index 08b1b48a09..f78c63219b 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -64,3 +64,6 @@
 [submodule "roms/vbootrom"]
 	path = roms/vbootrom
 	url = https://gitlab.com/qemu-project/vbootrom.git
+[submodule "tests/docker/libvirt-ci"]
+	path = tests/docker/libvirt-ci
+	url = https://gitlab.com/libvirt/libvirt-ci
diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 1da4c4e4c4..c159032e04 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -372,8 +372,19 @@ Along with many other images, the ``centos8`` image is defined in a Dockerfile
 in ``tests/docker/dockerfiles/``, called ``centos8.docker``. ``make docker-help``
 command will list all the available images.
 
-To add a new image, simply create a new ``.docker`` file under the
-``tests/docker/dockerfiles/`` directory.
+Most of the existing Dockerfiles were written by hand, simply by creating a
+a new ``.docker`` file under the ``tests/docker/dockerfiles/`` directory.
+This has led to an inconsistent set of packages being present across the
+different containers. Thus going forward, QEMU is aiming to automatically
+generate the Dockerfiles using the tools provided by the libvirt-ci project
+
+  https://gitlab.com/libvirt/libvirt-ci
+
+In that project, there is a master ``qemu.yml`` file defining the list of
+build pre-requisites, that is processed together with the ``mappings.yml``
+file to produce the distro specific list of package names. The automatically
+generated Dockerfiles are produced by ``tests/docker/dockerfiles-refresh.py``
+which is wired up to the ``make docker-refresh`` target.
 
 A ``.pre`` script can be added beside the ``.docker`` file, which will be
 executed before building the image under the build context directory. This is
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 9f464cb92c..03e722b838 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -27,6 +27,8 @@ DOCKER_TESTS := $(notdir $(shell \
 ENGINE := auto
 
 DOCKER_SCRIPT=$(SRC_PATH)/tests/docker/docker.py --engine $(ENGINE)
+REFRESH_SCRIPT=$(SRC_PATH)/tests/docker/dockerfiles-refresh.py
+LCITOOL=$(SRC_PATH)/tests/docker/libvirt-ci/lcitool
 
 TESTS ?= %
 IMAGES ?= %
@@ -199,6 +201,7 @@ docker:
 	@echo '    docker-image:        Build all images.'
 	@echo '    docker-image-IMAGE:  Build image "IMAGE".'
 	@echo '    docker-run:          For manually running a "TEST" with "IMAGE".'
+	@echo '    docker-refresh:      Re-generate dockerfiles after updating libvirt-ci'
 	@echo
 	@echo 'Available container images:'
 	@echo '    $(DOCKER_IMAGES)'
@@ -281,3 +284,10 @@ docker-run-%:
 
 docker-clean:
 	$(call quiet-command, $(DOCKER_SCRIPT) clean)
+
+docker-refresh:
+	@if [ ! -f $(LCITOOL) ] ; \
+	then \
+	    cd $(SRC_PATH) && git submodule update --init tests/docker/libvirt-ci ; \
+	fi
+	$(call quiet-command, $(REFRESH_SCRIPT) $(LCITOOL) $(SRC_PATH))
diff --git a/tests/docker/dockerfiles-refresh.py b/tests/docker/dockerfiles-refresh.py
new file mode 100755
index 0000000000..7f59ffbc59
--- /dev/null
+++ b/tests/docker/dockerfiles-refresh.py
@@ -0,0 +1,56 @@
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
+import os.path
+import subprocess
+
+if len(sys.argv) != 3:
+   print("syntax: %s PATH-TO-LCITOOL SRC-ROOT" % sys.argv[0], file=sys.stderr)
+   sys.exit(1)
+
+lcitool_path=sys.argv[1]
+src_root=sys.argv[2]
+
+def atomic_write(filename, content):
+   dst = os.path.join(src_root, "tests", "docker", "dockerfiles", filename)
+   try:
+      with open(dst + ".tmp", "w") as fp:
+         print(content, file=fp, end="")
+         os.replace(dst + ".tmp", dst)
+   except Exception as ex:
+      os.unlink(dst + ".tmp")
+      raise
+
+def generate_image(filename, host, cross=None, trailer=None):
+   print("Generate %s" % filename)
+   args = [lcitool_path, "dockerfile"]
+   if cross is not None:
+      args.extend(["--cross", cross])
+   args.extend([host, "qemu"])
+   lcitool=subprocess.run(args, capture_output=True)
+
+   if lcitool.returncode != 0:
+      raise Exception("Failed to generate %s: %s" % (filename, lcitool.stderr))
+
+   content = lcitool.stdout.decode("utf8")
+   if trailer is not None:
+      content += trailer
+   atomic_write(filename, content)
+
+try:
+   pass
+except Exception as ex:
+   print(str(ex), file=sys.stderr)
diff --git a/tests/docker/libvirt-ci b/tests/docker/libvirt-ci
new file mode 160000
index 0000000000..1c5d87ecd2
--- /dev/null
+++ b/tests/docker/libvirt-ci
@@ -0,0 +1 @@
+Subproject commit 1c5d87ecd2283614a8b0c31cead0b6d7883afd28
-- 
2.31.1


