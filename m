Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B647835B99E
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 06:49:34 +0200 (CEST)
Received: from localhost ([::1]:47264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVoVx-0003lb-Or
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 00:49:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lVoUG-00026m-7T
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 00:47:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lVoUE-0003eL-5b
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 00:47:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618202865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xi2Z6u4qvzSRXtoCKsfWhZmODlEG+pfnitz659dwj5A=;
 b=QQlSplIQpIqkgvg3Z+01wPhIQI7+8xfjAQjDncKixjoVn1LmFKoErURWxxYb6b8n3s+UxK
 BSvVvZfnJcmZ/QZLgFhJ/cm8JG8xJIuu/ctlZkWZGrABC5Z1rUD3J85CNUMRxaV79W4u3Q
 xzYc67OsYQpvr/3F9u1AhnC+iqOe+E8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-e489nMHHP-qHwt_PZ1T_BA-1; Mon, 12 Apr 2021 00:47:43 -0400
X-MC-Unique: e489nMHHP-qHwt_PZ1T_BA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2CD918397A9;
 Mon, 12 Apr 2021 04:47:42 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-113-108.rdu2.redhat.com
 [10.10.113.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C42D41037E81;
 Mon, 12 Apr 2021 04:47:40 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/11] Python: add utility function for retrieving port
 redirection
Date: Mon, 12 Apr 2021 00:46:36 -0400
Message-Id: <20210412044644.55083-4-crosa@redhat.com>
In-Reply-To: <20210412044644.55083-1-crosa@redhat.com>
References: <20210412044644.55083-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 John Snow <jsnow@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Slightly different versions for the same utility code are currently
present on different locations.  This unifies them all, giving
preference to the version from virtiofs_submounts.py, because of the
last tweaks added to it.

While at it, this adds a "qemu.utils" module to host the utility
function and a test.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
---
 python/qemu/utils.py                     | 33 ++++++++++++++++++++++++
 tests/acceptance/info_usernet.py         | 29 +++++++++++++++++++++
 tests/acceptance/linux_ssh_mips_malta.py | 16 +++++-------
 tests/acceptance/virtiofs_submounts.py   | 21 ++++-----------
 tests/vm/basevm.py                       |  7 ++---
 5 files changed, 76 insertions(+), 30 deletions(-)
 create mode 100644 python/qemu/utils.py
 create mode 100644 tests/acceptance/info_usernet.py

diff --git a/python/qemu/utils.py b/python/qemu/utils.py
new file mode 100644
index 00000000000..5ed789275ee
--- /dev/null
+++ b/python/qemu/utils.py
@@ -0,0 +1,33 @@
+"""
+QEMU utility library
+
+This offers miscellaneous utility functions, which may not be easily
+distinguishable or numerous to be in their own module.
+"""
+
+# Copyright (C) 2021 Red Hat Inc.
+#
+# Authors:
+#  Cleber Rosa <crosa@redhat.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2.  See
+# the COPYING file in the top-level directory.
+#
+
+import re
+from typing import Optional
+
+
+def get_info_usernet_hostfwd_port(info_usernet_output: str) -> Optional[int]:
+    """
+    Returns the port given to the hostfwd parameter via info usernet
+
+    :param info_usernet_output: output generated by hmp command "info usernet"
+    :return: the port number allocated by the hostfwd option
+    """
+    for line in info_usernet_output.split('\r\n'):
+        regex = r'TCP.HOST_FORWARD.*127\.0\.0\.1\s+(\d+)\s+10\.'
+        match = re.search(regex, line)
+        if match is not None:
+            return int(match[1])
+    return None
diff --git a/tests/acceptance/info_usernet.py b/tests/acceptance/info_usernet.py
new file mode 100644
index 00000000000..9c1fd903a0b
--- /dev/null
+++ b/tests/acceptance/info_usernet.py
@@ -0,0 +1,29 @@
+# Test for the hmp command "info usernet"
+#
+# Copyright (c) 2021 Red Hat, Inc.
+#
+# Author:
+#  Cleber Rosa <crosa@redhat.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+from avocado_qemu import Test
+
+from qemu.utils import get_info_usernet_hostfwd_port
+
+
+class InfoUsernet(Test):
+
+    def test_hostfwd(self):
+        self.vm.add_args('-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0-:22')
+        self.vm.launch()
+        res = self.vm.command('human-monitor-command',
+                              command_line='info usernet')
+        port = get_info_usernet_hostfwd_port(res)
+        self.assertIsNotNone(port,
+                             ('"info usernet" output content does not seem to '
+                              'contain the redirected port'))
+        self.assertGreater(port, 0,
+                           ('Found a redirected port that is not greater than'
+                            ' zero'))
diff --git a/tests/acceptance/linux_ssh_mips_malta.py b/tests/acceptance/linux_ssh_mips_malta.py
index 6dbd02d49d5..052008f02d4 100644
--- a/tests/acceptance/linux_ssh_mips_malta.py
+++ b/tests/acceptance/linux_ssh_mips_malta.py
@@ -18,6 +18,8 @@
 from avocado.utils import archive
 from avocado.utils import ssh
 
+from qemu.utils import get_info_usernet_hostfwd_port
+
 
 class LinuxSSH(Test):
 
@@ -70,18 +72,14 @@ def get_kernel_info(self, endianess, wordsize):
     def setUp(self):
         super(LinuxSSH, self).setUp()
 
-    def get_portfwd(self):
+    def ssh_connect(self, username, password):
+        self.ssh_logger = logging.getLogger('ssh')
         res = self.vm.command('human-monitor-command',
                               command_line='info usernet')
-        line = res.split('\r\n')[2]
-        port = re.split(r'.*TCP.HOST_FORWARD.*127\.0\.0\.1 (\d+)\s+10\..*',
-                        line)[1]
+        port = get_info_usernet_hostfwd_port(res)
+        if not port:
+            self.cancel("Failed to retrieve SSH port")
         self.log.debug("sshd listening on port:" + port)
-        return port
-
-    def ssh_connect(self, username, password):
-        self.ssh_logger = logging.getLogger('ssh')
-        port = self.get_portfwd()
         self.ssh_session = ssh.Session(self.VM_IP, port=int(port),
                                        user=username, password=password)
         for i in range(10):
diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
index ca64b76301f..57a7047342f 100644
--- a/tests/acceptance/virtiofs_submounts.py
+++ b/tests/acceptance/virtiofs_submounts.py
@@ -9,6 +9,8 @@
 from avocado_qemu import wait_for_console_pattern
 from avocado.utils import ssh
 
+from qemu.utils import get_info_usernet_hostfwd_port
+
 
 def run_cmd(args):
     subp = subprocess.Popen(args,
@@ -73,27 +75,14 @@ class VirtiofsSubmountsTest(LinuxTest):
     :avocado: tags=accel:kvm
     """
 
-    def get_portfwd(self):
-        port = None
-
+    def ssh_connect(self, username, keyfile):
+        self.ssh_logger = logging.getLogger('ssh')
         res = self.vm.command('human-monitor-command',
                               command_line='info usernet')
-        for line in res.split('\r\n'):
-            match = \
-                re.search(r'TCP.HOST_FORWARD.*127\.0\.0\.1\s+(\d+)\s+10\.',
-                          line)
-            if match is not None:
-                port = int(match[1])
-                break
-
+        port = get_info_usernet_hostfwd_port(res)
         self.assertIsNotNone(port)
         self.assertGreater(port, 0)
         self.log.debug('sshd listening on port: %d', port)
-        return port
-
-    def ssh_connect(self, username, keyfile):
-        self.ssh_logger = logging.getLogger('ssh')
-        port = self.get_portfwd()
         self.ssh_session = ssh.Session('127.0.0.1', port=port,
                                        user=username, key=keyfile)
         for i in range(10):
diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index 00f1d5ca8da..75ce07df364 100644
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -21,6 +21,7 @@
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
 from qemu.accel import kvm_available
 from qemu.machine import QEMUMachine
+from qemu.utils import get_info_usernet_hostfwd_port
 import subprocess
 import hashlib
 import argparse
@@ -306,11 +307,7 @@ def boot(self, img, extra_args=[]):
         self.console_init()
         usernet_info = guest.qmp("human-monitor-command",
                                  command_line="info usernet")
-        self.ssh_port = None
-        for l in usernet_info["return"].splitlines():
-            fields = l.split()
-            if "TCP[HOST_FORWARD]" in fields and "22" in fields:
-                self.ssh_port = l.split()[3]
+        self.ssh_port = get_info_usernet_hostfwd_port(usernet_info)
         if not self.ssh_port:
             raise Exception("Cannot find ssh port from 'info usernet':\n%s" % \
                             usernet_info)
-- 
2.30.2


