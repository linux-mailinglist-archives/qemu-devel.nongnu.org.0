Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEB2E7D53
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Oct 2019 00:57:07 +0100 (CET)
Received: from localhost ([::1]:45676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iPEsk-0000ho-G5
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 19:57:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59078)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iPEn6-00030E-4C
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 19:51:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iPEmM-0003t5-DM
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 19:50:31 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:28248
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1iPEmM-0003sw-9S
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 19:50:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572306629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i+lJPdsGeMs3BF2wFOXYa7r3dy/b1LSDIBRWO5Wf60Y=;
 b=gRRRKzJnabsZkNZ1bmrJGPHnXbVb48jjSDvvxx4M4nit+ttgtc6juDK2sJ92Sc51t0GNeD
 i10HFHgwY6KIZ2904/ZSONnH5Wlw2uz/V06auoq2bnIDTahxV9vHQNZfvEEOVU+nO94muz
 f9e9TTh0f1q1RxDOeKuc5Bbt5MCslsg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-Q5dPP90nPsOLDaZhJWiXhQ-1; Mon, 28 Oct 2019 19:50:26 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5673B1005509;
 Mon, 28 Oct 2019 23:50:24 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-123-183.rdu2.redhat.com
 [10.10.123.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BEC065C1B2;
 Mon, 28 Oct 2019 23:50:21 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PULL 4/16] Acceptance tests: refactor wait_for_console_pattern
Date: Mon, 28 Oct 2019 19:49:50 -0400
Message-Id: <20191028235002.17691-5-crosa@redhat.com>
In-Reply-To: <20191028235002.17691-1-crosa@redhat.com>
References: <20191028235002.17691-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: Q5dPP90nPsOLDaZhJWiXhQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Fam Zheng <fam@euphon.net>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-ppc@nongnu.org, Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The same utility method is already present in two different test
files, so let's consolidate it into a single utility function.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Message-Id: <20190916164011.7653-1-crosa@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
[PMD: failure_message is optional]
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Message-Id: <20191028073441.6448-3-philmd@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 25 +++++++++++++++++++++
 tests/acceptance/boot_linux_console.py    | 27 +++++------------------
 tests/acceptance/linux_ssh_mips_malta.py  | 18 +++------------
 3 files changed, 33 insertions(+), 37 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/a=
vocado_qemu/__init__.py
index 711c29609a..772771e205 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -8,6 +8,7 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or
 # later.  See the COPYING file in the top-level directory.
=20
+import logging
 import os
 import sys
 import uuid
@@ -54,6 +55,30 @@ def pick_default_qemu_bin(arch=3DNone):
         return qemu_bin_from_src_dir_path
=20
=20
+def wait_for_console_pattern(test, success_message, failure_message=3DNone=
):
+    """
+    Waits for messages to appear on the console, while logging the content
+
+    :param test: an Avocado test containing a VM that will have its consol=
e
+                 read and probed for a success or failure message
+    :type test: :class:`avocado_qemu.Test`
+    :param success_message: if this message appears, test succeeds
+    :param failure_message: if this message appears, test fails
+    """
+    console =3D test.vm.console_socket.makefile()
+    console_logger =3D logging.getLogger('console')
+    while True:
+        msg =3D console.readline().strip()
+        if not msg:
+            continue
+        console_logger.debug(msg)
+        if success_message in msg:
+            break
+        if failure_message and failure_message in msg:
+            fail =3D 'Failure message found in console: %s' % failure_mess=
age
+            test.fail(fail)
+
+
 class Test(avocado.Test):
     def setUp(self):
         self._vms =3D {}
diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot=
_linux_console.py
index 8a9a314ab4..8897e0c253 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -9,12 +9,12 @@
 # later.  See the COPYING file in the top-level directory.
=20
 import os
-import logging
 import lzma
 import gzip
 import shutil
=20
 from avocado_qemu import Test
+from avocado_qemu import wait_for_console_pattern
 from avocado.utils import process
 from avocado.utils import archive
=20
@@ -29,31 +29,14 @@ class BootLinuxConsole(Test):
=20
     KERNEL_COMMON_COMMAND_LINE =3D 'printk.time=3D0 '
=20
-    def wait_for_console_pattern(self, success_message,
-                                 failure_message=3D'Kernel panic - not syn=
cing'):
-        """
-        Waits for messages to appear on the console, while logging the con=
tent
-
-        :param success_message: if this message appears, test succeeds
-        :param failure_message: if this message appears, test fails
-        """
-        console =3D self.vm.console_socket.makefile()
-        console_logger =3D logging.getLogger('console')
-        while True:
-            msg =3D console.readline().strip()
-            if not msg:
-                continue
-            console_logger.debug(msg)
-            if success_message in msg:
-                break
-            if failure_message in msg:
-                fail =3D 'Failure message found in console: %s' % failure_=
message
-                self.fail(fail)
+    def wait_for_console_pattern(self, success_message):
+        wait_for_console_pattern(self, success_message,
+                                 failure_message=3D'Kernel panic - not syn=
cing')
=20
     def exec_command_and_wait_for_pattern(self, command, success_message):
         command +=3D '\n'
         self.vm.console_socket.sendall(command.encode())
-        self.wait_for_console_pattern(success_message)
+        wait_for_console_pattern(self, success_message)
=20
     def extract_from_deb(self, deb, path):
         """
diff --git a/tests/acceptance/linux_ssh_mips_malta.py b/tests/acceptance/li=
nux_ssh_mips_malta.py
index aa12001942..fc13f9e4d4 100644
--- a/tests/acceptance/linux_ssh_mips_malta.py
+++ b/tests/acceptance/linux_ssh_mips_malta.py
@@ -13,6 +13,7 @@ import time
=20
 from avocado import skipUnless
 from avocado_qemu import Test
+from avocado_qemu import wait_for_console_pattern
 from avocado.utils import process
 from avocado.utils import archive
 from avocado.utils import ssh
@@ -69,19 +70,6 @@ class LinuxSSH(Test):
     def setUp(self):
         super(LinuxSSH, self).setUp()
=20
-    def wait_for_console_pattern(self, success_message,
-                                 failure_message=3D'Oops'):
-        console =3D self.vm.console_socket.makefile()
-        console_logger =3D logging.getLogger('console')
-        while True:
-            msg =3D console.readline()
-            console_logger.debug(msg.strip())
-            if success_message in msg:
-                break
-            if failure_message in msg:
-                fail =3D 'Failure message found in console: %s' % failure_=
message
-                self.fail(fail)
-
     def get_portfwd(self):
         res =3D self.vm.command('human-monitor-command',
                               command_line=3D'info usernet')
@@ -137,7 +125,7 @@ class LinuxSSH(Test):
=20
         self.log.info('VM launched, waiting for sshd')
         console_pattern =3D 'Starting OpenBSD Secure Shell server: sshd'
-        self.wait_for_console_pattern(console_pattern)
+        wait_for_console_pattern(self, console_pattern, 'Oops')
         self.log.info('sshd ready')
=20
         self.ssh_connect('root', 'root')
@@ -145,7 +133,7 @@ class LinuxSSH(Test):
     def shutdown_via_ssh(self):
         self.ssh_command('poweroff')
         self.ssh_disconnect_vm()
-        self.wait_for_console_pattern('Power down')
+        wait_for_console_pattern(self, 'Power down', 'Oops')
=20
     def ssh_command_output_contains(self, cmd, exp):
         stdout, _ =3D self.ssh_command(cmd)
--=20
2.21.0


