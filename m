Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F6753476F
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 02:20:49 +0200 (CEST)
Received: from localhost ([::1]:53892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nu1FA-0007ij-Nz
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 20:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nu14d-0004BE-08
 for qemu-devel@nongnu.org; Wed, 25 May 2022 20:09:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nu14b-0002ms-4v
 for qemu-devel@nongnu.org; Wed, 25 May 2022 20:09:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653523792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hTN//+wThdomjVilZtFXvDCc4y4DuGuwH/Kg776uXR0=;
 b=MBfQJCpD1fiF/bnV+CsPz8s2wgwtsMhh2P0edEEVLZZdSd9O5/Kg0sYrnYTP+GA2utcQxa
 kGLoQn0RyMpKT7DM4n3TUv1ioryVYTHcEGXLi92fYq2Xw/Dz8siO11N3Yypu+p9UGGCLmo
 jHO8/z/GOl91XKSZcYwzvDEzt7ISZBk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-DJY5fEKQP3aka6TxJ7TaXA-1; Wed, 25 May 2022 20:09:49 -0400
X-MC-Unique: DJY5fEKQP3aka6TxJ7TaXA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5E77804191;
 Thu, 26 May 2022 00:09:48 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 510AC2166B29;
 Thu, 26 May 2022 00:09:43 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH 6/9] tests: install "qemu" namespace package into venv
Date: Wed, 25 May 2022 20:09:18 -0400
Message-Id: <20220526000921.1581503-7-jsnow@redhat.com>
In-Reply-To: <20220526000921.1581503-1-jsnow@redhat.com>
References: <20220526000921.1581503-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds the "qemu" namespace package to the $build/tests/venv
directory. It does so in "editable" mode, which means that changes to
the source python directory will actively be reflected by the venv.

This patch also then removes any sys.path hacking from the avocado test
scripts directly. By doing this, the environment of where to find these
packages is managed entirely by the virtual environment and not by the
scripts themselves.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/Makefile.include                 |  1 +
 tests/avocado/avocado_qemu/__init__.py | 11 +++++------
 tests/avocado/virtio_check_params.py   |  1 -
 tests/avocado/virtio_version.py        |  1 -
 tests/requirements.txt                 |  1 +
 5 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 052d7f56e9a..d13a3403e9f 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -110,6 +110,7 @@ quiet-venv-pip = $(quiet-@)$(call quiet-command-run, \
 
 $(TESTS_VENV_DIR): $(TESTS_VENV_REQ)
 	$(call quiet-command, $(PYTHON) -m venv $@, VENV, $@)
+	$(call quiet-venv-pip,install -e "$(SRC_PATH)/python/")
 	$(call quiet-venv-pip,install -r $(TESTS_VENV_REQ))
 	$(call quiet-command, touch $@)
 
diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index 39f15c1d518..b656a70c55b 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -21,6 +21,11 @@
 from avocado.utils import cloudinit, datadrainer, process, ssh, vmimage
 from avocado.utils.path import find_command
 
+from qemu.machine import QEMUMachine
+from qemu.utils import (get_info_usernet_hostfwd_port, kvm_available,
+                        tcg_available)
+
+
 #: The QEMU build root directory.  It may also be the source directory
 #: if building from the source dir, but it's safer to use BUILD_DIR for
 #: that purpose.  Be aware that if this code is moved outside of a source
@@ -35,12 +40,6 @@
 else:
     SOURCE_DIR = BUILD_DIR
 
-sys.path.append(os.path.join(SOURCE_DIR, 'python'))
-
-from qemu.machine import QEMUMachine
-from qemu.utils import (get_info_usernet_hostfwd_port, kvm_available,
-                        tcg_available)
-
 
 def has_cmd(name, args=None):
     """
diff --git a/tests/avocado/virtio_check_params.py b/tests/avocado/virtio_check_params.py
index e869690473a..4093da8a674 100644
--- a/tests/avocado/virtio_check_params.py
+++ b/tests/avocado/virtio_check_params.py
@@ -22,7 +22,6 @@
 import re
 import logging
 
-sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
 from qemu.machine import QEMUMachine
 from avocado_qemu import QemuSystemTest
 from avocado import skip
diff --git a/tests/avocado/virtio_version.py b/tests/avocado/virtio_version.py
index 208910bb844..c84e48813a1 100644
--- a/tests/avocado/virtio_version.py
+++ b/tests/avocado/virtio_version.py
@@ -11,7 +11,6 @@
 import sys
 import os
 
-sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
 from qemu.machine import QEMUMachine
 from avocado_qemu import QemuSystemTest
 
diff --git a/tests/requirements.txt b/tests/requirements.txt
index a21b59b4439..0ba561b6bdf 100644
--- a/tests/requirements.txt
+++ b/tests/requirements.txt
@@ -1,5 +1,6 @@
 # Add Python module requirements, one per line, to be installed
 # in the tests/venv Python virtual environment. For more info,
 # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
+# Note that qemu.git/python/ is always implicitly installed.
 avocado-framework==88.1
 pycdlib==1.11.0
-- 
2.34.1


