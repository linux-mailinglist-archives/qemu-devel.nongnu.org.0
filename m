Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B70825258EA
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 02:13:40 +0200 (CEST)
Received: from localhost ([::1]:50498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npIw7-0002Yt-QJ
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 20:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1npIp5-0007IY-5a
 for qemu-devel@nongnu.org; Thu, 12 May 2022 20:06:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1npIp3-0007lw-8e
 for qemu-devel@nongnu.org; Thu, 12 May 2022 20:06:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652400380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A1PasI3s2VjRNgk2DHwV+Lp12HBmfXCsex2gKvSrwok=;
 b=YyOP0PbJDVKdUpVQMDW7Hpzf3w5/UWX8a1SqTJG/j3JMt5k8qaJeIRZdN4mlIQcHqsj2CL
 pkoYy3EdQ/Vrvmgo8xa+1gdC+3OuhrBJbjkIhmqYZJUk6ePq8tkjQTV4ojWlPo05pxQ1Cn
 KZxZBp7AtOQ8AeGJ5NJvlGgV8SzV4+Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-NDwFBwVYPxav_t7V5s0VvQ-1; Thu, 12 May 2022 20:06:17 -0400
X-MC-Unique: NDwFBwVYPxav_t7V5s0VvQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 19C96296A629;
 Fri, 13 May 2022 00:06:17 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.8.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E95A15341CE;
 Fri, 13 May 2022 00:06:16 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [RFC PATCH 3/9] tests: install "qemu" namespace package into venv
Date: Thu, 12 May 2022 20:06:03 -0400
Message-Id: <20220513000609.197906-4-jsnow@redhat.com>
In-Reply-To: <20220513000609.197906-1-jsnow@redhat.com>
References: <20220513000609.197906-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
 tests/Makefile.include                 |  5 ++++-
 tests/avocado/avocado_qemu/__init__.py | 11 +++++------
 tests/avocado/virtio_check_params.py   |  1 -
 tests/avocado/virtio_version.py        |  1 -
 tests/requirements.txt                 |  1 +
 5 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 146aaa96a00..dbbf1ba535b 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -104,10 +104,13 @@ else
 	AVOCADO_CMDLINE_TAGS=$(addprefix -t , $(AVOCADO_TAGS))
 endif
 
-$(TESTS_VENV_DIR): $(TESTS_VENV_REQ)
+$(TESTS_VENV_DIR): $(TESTS_VENV_REQ) $(SRC_PATH)/python/setup.cfg
 	$(call quiet-command, \
             $(PYTHON) -m venv $@, \
             VENV, $@)
+	$(call quiet-command, \
+            $(TESTS_PYTHON) -m pip -q install \
+            -e "$(SRC_PATH)/python/", PIP, "$(SRC_PATH)/python/")
 	$(call quiet-command, \
             $(TESTS_PYTHON) -m pip -q install -r $(TESTS_VENV_REQ), \
             PIP, $(TESTS_VENV_REQ))
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


