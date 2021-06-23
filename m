Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D43D43B1CAC
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 16:37:47 +0200 (CEST)
Received: from localhost ([::1]:50026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw40g-0007c8-VC
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 10:37:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lw3np-0002UI-5C
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 10:24:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lw3nm-0006lM-PR
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 10:24:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624458265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CvrPr4+ASasHJ84go/qOWDUrkHdxPz4/ZsMORYwdWxo=;
 b=XKg2s53/Dseg7wybEOjqwk19sAAvAz0sKINP2wgL6ji7564D6Ap2GzZ5X8RYRYJxJjFy4k
 WL2CxY5G8eU2F5MrdWhnrCutDlVHJU/vGnmV1zk9ysVG14ihFM0WV+7picgJJ7JgYn/G66
 a6YG+CDS27zsFCDcGailgVSaeGwXDiE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-4A7zguHEO-GZK_Jl0B79EA-1; Wed, 23 Jun 2021 10:24:22 -0400
X-MC-Unique: 4A7zguHEO-GZK_Jl0B79EA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34BA479EE2;
 Wed, 23 Jun 2021 14:24:21 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-176.ams2.redhat.com
 [10.36.114.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23CC860854;
 Wed, 23 Jun 2021 14:24:17 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 16/22] tests/docker: add script for automating container
 refresh
Date: Wed, 23 Jun 2021 15:22:39 +0100
Message-Id: <20210623142245.307776-17-berrange@redhat.com>
In-Reply-To: <20210623142245.307776-1-berrange@redhat.com>
References: <20210623142245.307776-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
 docs/devel/testing.rst              | 34 ++++++++++++++++--
 tests/docker/Makefile.include       | 12 +++++++
 tests/docker/dockerfiles-refresh.py | 56 +++++++++++++++++++++++++++++
 3 files changed, 100 insertions(+), 2 deletions(-)
 create mode 100755 tests/docker/dockerfiles-refresh.py

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 4e42392810..7882db85d4 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -372,8 +372,38 @@ Along with many other images, the ``centos8`` image is defined in a Dockerfile
 in ``tests/docker/dockerfiles/``, called ``centos8.docker``. ``make docker-help``
 command will list all the available images.
 
-To add a new image, simply create a new ``.docker`` file under the
-``tests/docker/dockerfiles/`` directory.
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
+In that project, there is a ``qemu.yml`` file defining the list of build
+pre-requisites needed by QEMU. This is processed together with the
+``mappings.yml`` file to compute the distro specific list of package names.
+The package names are then fed into a generator which emits a well structured
+dockerfile. The set of dockerfiles which are auto-generated is defined in
+the ``tests/docker/dockerfiles-refresh.py`` script.
+
+When preparing a patch series that changes dockerfiles managed by ``libvirt-ci``
+tools, the following steps should be takenL
+
+ * Fork the ``libvirt-ci`` project on gitlab
+
+ * Prepare changes to its ``qemu.yml`` file and optionally ``mappings.yml``
+   to define the packages to be added to QEMU's dockerfiles.
+
+ * In QEMU run ``make docker-refresh LCITOOL=/path/to/libvirt-ci/lcitool``
+   to re-create the dockerfiles in ``tests/docker/dockerfiles``
+
+ * Submit your changes to QEMU in the normal manner
+
+ * Submit ``libvirt-ci`` changes as a merge request, linking to the
+   QEMU patch series that uses them.
 
 A ``.pre`` script can be added beside the ``.docker`` file, which will be
 executed before building the image under the build context directory. This is
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index ff5d732889..e8e5f497cc 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -27,6 +27,9 @@ DOCKER_TESTS := $(notdir $(shell \
 ENGINE := auto
 
 DOCKER_SCRIPT=$(SRC_PATH)/tests/docker/docker.py --engine $(ENGINE)
+REFRESH_SCRIPT=$(SRC_PATH)/tests/docker/dockerfiles-refresh.py
+# To be set to /path/to/checkout/of/libvirt-ci.git/lcitool
+LCITOOL=
 
 TESTS ?= %
 IMAGES ?= %
@@ -220,6 +223,7 @@ docker:
 	@echo '    docker-image:        Build all images.'
 	@echo '    docker-image-IMAGE:  Build image "IMAGE".'
 	@echo '    docker-run:          For manually running a "TEST" with "IMAGE".'
+	@echo '    docker-refresh:      Re-generate dockerfiles after updating libvirt-ci'
 	@echo
 	@echo 'Available container images:'
 	@echo '    $(DOCKER_IMAGES)'
@@ -302,3 +306,11 @@ docker-run-%:
 
 docker-clean:
 	$(call quiet-command, $(DOCKER_SCRIPT) clean)
+
+docker-refresh:
+	@if [ -z "$(LCITOOL)" ] ; \
+	then \
+	    echo "No lcitool path specified. Use 'make docker-refresh LCITOOL=/path/to/libvirt-ci.git/lcitool'"; \
+	    exit 1; \
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
-- 
2.31.1


