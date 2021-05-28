Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9356D393B76
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 04:34:47 +0200 (CEST)
Received: from localhost ([::1]:47052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmSKk-0002ZV-JY
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 22:34:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmSJ1-00084y-89
 for qemu-devel@nongnu.org; Thu, 27 May 2021 22:32:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmSIy-0007q7-2G
 for qemu-devel@nongnu.org; Thu, 27 May 2021 22:32:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622169175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xdkTg1wINjbP4QSs5aV0E/FRtBFQXKkdcEsE17inmw4=;
 b=NGmcpkj3euL3fLReyH+ZlmD68+hM51OqqSw1an56bMapl4sXjOgi/Dr9NN+qJlWA+q4xYu
 cegOfJbJc0NFNjkBuZ0hDTcwSt2YwN6+aN7Zyf+HYyRWJMfH1XJZEzMejsycrmfP9C7ylr
 rmaKezKIt/QYrnO7crnOybKDKM9otsY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-6_tQDbuzNbmLkkgSZ6-pGg-1; Thu, 27 May 2021 22:32:51 -0400
X-MC-Unique: 6_tQDbuzNbmLkkgSZ6-pGg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D51658030A1;
 Fri, 28 May 2021 02:32:50 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6C601F0C0;
 Fri, 28 May 2021 02:32:40 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/44] Acceptance Tests: move useful ssh methods to base class
Date: Thu, 27 May 2021 22:31:41 -0400
Message-Id: <20210528023220.417057-6-jsnow@redhat.com>
In-Reply-To: <20210528023220.417057-1-jsnow@redhat.com>
References: <20210528023220.417057-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cleber Rosa <crosa@redhat.com>

Both the virtiofs submounts and the linux ssh mips malta tests
contains useful methods related to ssh that deserve to be made
available to other tests.  Let's move them to an auxiliary, mix-in
class that will be used on the base LinuxTest class.

The method that helps with setting up an ssh connection will now
support both key and password based authentication, defaulting to key
based.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
Message-Id: <20210412044644.55083-5-crosa@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 48 ++++++++++++++++++++++-
 tests/acceptance/linux_ssh_mips_malta.py  | 40 ++-----------------
 tests/acceptance/virtiofs_submounts.py    | 37 -----------------
 3 files changed, 50 insertions(+), 75 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 83b1741ec85..67f75f66e56 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -20,6 +20,7 @@
 from avocado.utils import cloudinit
 from avocado.utils import datadrainer
 from avocado.utils import network
+from avocado.utils import ssh
 from avocado.utils import vmimage
 from avocado.utils.path import find_command
 
@@ -43,6 +44,8 @@
 from qemu.accel import kvm_available
 from qemu.accel import tcg_available
 from qemu.machine import QEMUMachine
+from qemu.utils import get_info_usernet_hostfwd_port
+
 
 def is_readable_executable_file(path):
     return os.path.isfile(path) and os.access(path, os.R_OK | os.X_OK)
@@ -253,7 +256,50 @@ def fetch_asset(self, name,
                         cancel_on_missing=cancel_on_missing)
 
 
-class LinuxTest(Test):
+class LinuxSSHMixIn:
+    """Contains utility methods for interacting with a guest via SSH."""
+
+    def ssh_connect(self, username, credential, credential_is_key=True):
+        self.ssh_logger = logging.getLogger('ssh')
+        res = self.vm.command('human-monitor-command',
+                              command_line='info usernet')
+        port = get_info_usernet_hostfwd_port(res)
+        self.assertIsNotNone(port)
+        self.assertGreater(port, 0)
+        self.log.debug('sshd listening on port: %d', port)
+        if credential_is_key:
+            self.ssh_session = ssh.Session('127.0.0.1', port=port,
+                                           user=username, key=credential)
+        else:
+            self.ssh_session = ssh.Session('127.0.0.1', port=port,
+                                           user=username, password=credential)
+        for i in range(10):
+            try:
+                self.ssh_session.connect()
+                return
+            except:
+                time.sleep(4)
+                pass
+        self.fail('ssh connection timeout')
+
+    def ssh_command(self, command):
+        self.ssh_logger.info(command)
+        result = self.ssh_session.cmd(command)
+        stdout_lines = [line.rstrip() for line
+                        in result.stdout_text.splitlines()]
+        for line in stdout_lines:
+            self.ssh_logger.info(line)
+        stderr_lines = [line.rstrip() for line
+                        in result.stderr_text.splitlines()]
+        for line in stderr_lines:
+            self.ssh_logger.warning(line)
+
+        self.assertEqual(result.exit_status, 0,
+                         f'Guest command failed: {command}')
+        return stdout_lines, stderr_lines
+
+
+class LinuxTest(Test, LinuxSSHMixIn):
     """Facilitates having a cloud-image Linux based available.
 
     For tests that indend to interact with guests, this is a better choice
diff --git a/tests/acceptance/linux_ssh_mips_malta.py b/tests/acceptance/linux_ssh_mips_malta.py
index 052008f02d4..61c9079d047 100644
--- a/tests/acceptance/linux_ssh_mips_malta.py
+++ b/tests/acceptance/linux_ssh_mips_malta.py
@@ -12,16 +12,14 @@
 import time
 
 from avocado import skipUnless
-from avocado_qemu import Test
+from avocado_qemu import Test, LinuxSSHMixIn
 from avocado_qemu import wait_for_console_pattern
 from avocado.utils import process
 from avocado.utils import archive
 from avocado.utils import ssh
 
-from qemu.utils import get_info_usernet_hostfwd_port
 
-
-class LinuxSSH(Test):
+class LinuxSSH(Test, LinuxSSHMixIn):
 
     timeout = 150 # Not for 'configure --enable-debug --enable-debug-tcg'
 
@@ -72,41 +70,9 @@ def get_kernel_info(self, endianess, wordsize):
     def setUp(self):
         super(LinuxSSH, self).setUp()
 
-    def ssh_connect(self, username, password):
-        self.ssh_logger = logging.getLogger('ssh')
-        res = self.vm.command('human-monitor-command',
-                              command_line='info usernet')
-        port = get_info_usernet_hostfwd_port(res)
-        if not port:
-            self.cancel("Failed to retrieve SSH port")
-        self.log.debug("sshd listening on port:" + port)
-        self.ssh_session = ssh.Session(self.VM_IP, port=int(port),
-                                       user=username, password=password)
-        for i in range(10):
-            try:
-                self.ssh_session.connect()
-                return
-            except:
-                time.sleep(4)
-                pass
-        self.fail("ssh connection timeout")
-
     def ssh_disconnect_vm(self):
         self.ssh_session.quit()
 
-    def ssh_command(self, command, is_root=True):
-        self.ssh_logger.info(command)
-        result = self.ssh_session.cmd(command)
-        stdout_lines = [line.rstrip() for line
-                        in result.stdout_text.splitlines()]
-        for line in stdout_lines:
-            self.ssh_logger.info(line)
-        stderr_lines = [line.rstrip() for line
-                        in result.stderr_text.splitlines()]
-        for line in stderr_lines:
-            self.ssh_logger.warning(line)
-        return stdout_lines, stderr_lines
-
     def boot_debian_wheezy_image_and_ssh_login(self, endianess, kernel_path):
         image_url, image_hash = self.get_image_info(endianess)
         image_path = self.fetch_asset(image_url, asset_hash=image_hash)
@@ -127,7 +93,7 @@ def boot_debian_wheezy_image_and_ssh_login(self, endianess, kernel_path):
         wait_for_console_pattern(self, console_pattern, 'Oops')
         self.log.info('sshd ready')
 
-        self.ssh_connect('root', 'root')
+        self.ssh_connect('root', 'root', False)
 
     def shutdown_via_ssh(self):
         self.ssh_command('poweroff')
diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
index 57a7047342f..bed8ce44dfc 100644
--- a/tests/acceptance/virtiofs_submounts.py
+++ b/tests/acceptance/virtiofs_submounts.py
@@ -9,8 +9,6 @@
 from avocado_qemu import wait_for_console_pattern
 from avocado.utils import ssh
 
-from qemu.utils import get_info_usernet_hostfwd_port
-
 
 def run_cmd(args):
     subp = subprocess.Popen(args,
@@ -75,41 +73,6 @@ class VirtiofsSubmountsTest(LinuxTest):
     :avocado: tags=accel:kvm
     """
 
-    def ssh_connect(self, username, keyfile):
-        self.ssh_logger = logging.getLogger('ssh')
-        res = self.vm.command('human-monitor-command',
-                              command_line='info usernet')
-        port = get_info_usernet_hostfwd_port(res)
-        self.assertIsNotNone(port)
-        self.assertGreater(port, 0)
-        self.log.debug('sshd listening on port: %d', port)
-        self.ssh_session = ssh.Session('127.0.0.1', port=port,
-                                       user=username, key=keyfile)
-        for i in range(10):
-            try:
-                self.ssh_session.connect()
-                return
-            except:
-                time.sleep(4)
-                pass
-        self.fail('ssh connection timeout')
-
-    def ssh_command(self, command):
-        self.ssh_logger.info(command)
-        result = self.ssh_session.cmd(command)
-        stdout_lines = [line.rstrip() for line
-                        in result.stdout_text.splitlines()]
-        for line in stdout_lines:
-            self.ssh_logger.info(line)
-        stderr_lines = [line.rstrip() for line
-                        in result.stderr_text.splitlines()]
-        for line in stderr_lines:
-            self.ssh_logger.warning(line)
-
-        self.assertEqual(result.exit_status, 0,
-                         f'Guest command failed: {command}')
-        return stdout_lines, stderr_lines
-
     def run(self, args, ignore_error=False):
         stdout, stderr, ret = run_cmd(args)
 
-- 
2.31.1


