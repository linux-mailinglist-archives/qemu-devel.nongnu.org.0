Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5467CE6D51
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Oct 2019 08:37:49 +0100 (CET)
Received: from localhost ([::1]:51374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iOzb1-0004Yh-U9
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 03:37:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46542)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iOzZ5-0002eB-7K
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 03:35:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iOzZ3-0002S2-U6
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 03:35:47 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41281
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iOzZ3-0002R0-Q7
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 03:35:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572248145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qdlzS2f9QS5to3RqqnJkrW+4/KuEVpCzWPZ19K1R0TU=;
 b=dMhO/xYTV5XVl8XSFacDLpO64LbyvmfN0R3WMHnn+iFsapC7ftUcliRPoG9YJIqJgVIgHa
 uK1Y284U6itXOiaJASFIDfpzKrPx0D0srdz3i76DC5gTBntNHPJEPSFhWPxo755Db3PrAk
 1pZm2WXAu1Iz8zqfPNshd9VdQqnAkDQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-ICEuQP9JOvuvltOmXZ_35w-1; Mon, 28 Oct 2019 03:35:40 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5663107AD29;
 Mon, 28 Oct 2019 07:35:38 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-86.brq.redhat.com [10.40.204.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B674519C69;
 Mon, 28 Oct 2019 07:35:28 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/26] tests/acceptance: Refactor
 exec_command_and_wait_for_pattern()
Date: Mon, 28 Oct 2019 08:34:20 +0100
Message-Id: <20191028073441.6448-6-philmd@redhat.com>
In-Reply-To: <20191028073441.6448-1-philmd@redhat.com>
References: <20191028073441.6448-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: ICEuQP9JOvuvltOmXZ_35w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Fabien Chouteau <chouteau@adacore.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Refactor the exec_command_and_wait_for_pattern() utility method
so we can reuse it in other files.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: fix self -> test, failure_message is optional, added doc
v3: reword because after rebasing only 1 file has to be modified
---
 tests/acceptance/avocado_qemu/__init__.py | 19 +++++++++++++++++++
 tests/acceptance/boot_linux_console.py    | 18 +++++++-----------
 2 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/a=
vocado_qemu/__init__.py
index a0450e5263..bdece76723 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -79,6 +79,25 @@ def wait_for_console_pattern(test, success_message, fail=
ure_message=3DNone):
             test.fail(fail)
=20
=20
+def exec_command_and_wait_for_pattern(test, command,
+                                      success_message, failure_message=3DN=
one):
+    """
+    Send a command to a console (appending CRLF characters), then wait
+    for success_message to appear on the console, while logging the.
+    content. Mark the test as failed if failure_message is found instead.
+
+    :param test: an Avocado test containing a VM that will have its consol=
e
+                 read and probed for a success or failure message
+    :type test: :class:`avocado_qemu.Test`
+    :param command: the command to send
+    :param success_message: if this message appears, test succeeds
+    :param failure_message: if this message appears, test fails
+    """
+    command +=3D '\r'
+    test.vm.console_socket.sendall(command.encode())
+    wait_for_console_pattern(test, success_message, failure_message)
+
+
 class Test(avocado.Test):
     def setUp(self):
         self._vms =3D {}
diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot=
_linux_console.py
index f9b77af359..4b419b0559 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -14,6 +14,7 @@ import gzip
 import shutil
=20
 from avocado_qemu import Test
+from avocado_qemu import exec_command_and_wait_for_pattern
 from avocado_qemu import wait_for_console_pattern
 from avocado.utils import process
 from avocado.utils import archive
@@ -33,11 +34,6 @@ class BootLinuxConsole(Test):
         wait_for_console_pattern(self, success_message,
                                  failure_message=3D'Kernel panic - not syn=
cing')
=20
-    def exec_command_and_wait_for_pattern(self, command, success_message):
-        command +=3D '\r'
-        self.vm.console_socket.sendall(command.encode())
-        wait_for_console_pattern(self, success_message)
-
     def extract_from_deb(self, deb, path):
         """
         Extracts a file from a deb package into the test workdir
@@ -166,12 +162,12 @@ class BootLinuxConsole(Test):
         self.vm.launch()
         self.wait_for_console_pattern('Boot successful.')
=20
-        self.exec_command_and_wait_for_pattern('cat /proc/cpuinfo',
-                                               'BogoMIPS')
-        self.exec_command_and_wait_for_pattern('uname -a',
-                                               'Debian')
-        self.exec_command_and_wait_for_pattern('reboot',
-                                               'reboot: Restarting system'=
)
+        exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
+                                                'BogoMIPS')
+        exec_command_and_wait_for_pattern(self, 'uname -a',
+                                                'Debian')
+        exec_command_and_wait_for_pattern(self, 'reboot',
+                                                'reboot: Restarting system=
')
=20
     def do_test_mips_malta32el_nanomips(self, kernel_url, kernel_hash):
         kernel_path_xz =3D self.fetch_asset(kernel_url, asset_hash=3Dkerne=
l_hash)
--=20
2.21.0


