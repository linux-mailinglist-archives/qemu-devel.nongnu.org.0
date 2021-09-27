Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D99A418E7F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 06:53:44 +0200 (CEST)
Received: from localhost ([::1]:57624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUie7-0003yO-2J
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 00:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mUiYs-0000AB-Tn; Mon, 27 Sep 2021 00:48:18 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:42583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mUiYp-000093-Od; Mon, 27 Sep 2021 00:48:18 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HHqrq0c44z4xbX; Mon, 27 Sep 2021 14:48:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632718091;
 bh=whX9ORRns7sRfgKaarmz/AFaIhbnckoFpeJF+oPyHt8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=faQ5wb24ShiN2+9pDiXxM5EgB9DZOJBYifRzpYcex0oHgDBIie8BOvh/bAznvl9CI
 PxrLZR1E6CSs7IsFBmycw3dhRtAUXIWvjUm3ZM/u5EjkqrWN68tGloi9zwQNA42dZA
 8T0wA8IbQ6/uePyyVjD0jQGa+K7ztlNyP5sSFRpM=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 1/7] qemu: Split machine_ppc.py acceptance tests
Date: Mon, 27 Sep 2021 14:48:02 +1000
Message-Id: <20210927044808.73391-2-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927044808.73391-1-david@gibson.dropbear.id.au>
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, dbarboza@redhat.com, aik@ozlabs.ru,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 mark.cave-ayland@ilande.co.uk, groug@kaod.org, wainersm@redhat.com,
 hpoussin@reactos.org, clg@kaod.org, crosa@redhat.com,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

machine_ppc.py contains tests for 3 different ppc based machine types.  It
is listed in MAINTAINERS along with the PPC TCG cpu code.  That's not
really accurate though, since it's really more about testing those machines
than the CPUs.

Therefore, split it up into separate files for the separate machine types,
and list those along with their machine types in MAINTAINERS.

Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 MAINTAINERS                          |  4 +-
 tests/acceptance/machine_ppc.py      | 69 ----------------------------
 tests/acceptance/ppc_mpc8544ds.py    | 32 +++++++++++++
 tests/acceptance/ppc_pseries.py      | 35 ++++++++++++++
 tests/acceptance/ppc_virtex_ml507.py | 34 ++++++++++++++
 5 files changed, 104 insertions(+), 70 deletions(-)
 delete mode 100644 tests/acceptance/machine_ppc.py
 create mode 100644 tests/acceptance/ppc_mpc8544ds.py
 create mode 100644 tests/acceptance/ppc_pseries.py
 create mode 100644 tests/acceptance/ppc_virtex_ml507.py

diff --git a/MAINTAINERS b/MAINTAINERS
index d7915ec128..53b318053c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -274,7 +274,6 @@ F: target/ppc/
 F: hw/ppc/
 F: include/hw/ppc/
 F: disas/ppc.c
-F: tests/acceptance/machine_ppc.py
 
 RISC-V TCG CPUs
 M: Palmer Dabbelt <palmer@dabbelt.com>
@@ -1270,6 +1269,7 @@ L: qemu-ppc@nongnu.org
 S: Odd Fixes
 F: hw/ppc/mpc8544ds.c
 F: hw/ppc/mpc8544_guts.c
+F: tests/acceptance/ppc_mpc8544ds.py
 
 New World (mac99)
 M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
@@ -1340,6 +1340,7 @@ F: tests/qtest/spapr*
 F: tests/qtest/libqos/*spapr*
 F: tests/qtest/rtas*
 F: tests/qtest/libqos/rtas*
+F: tests/acceptance/ppc_pseries.py
 
 PowerNV (Non-Virtualized)
 M: Cédric Le Goater <clg@kaod.org>
@@ -1361,6 +1362,7 @@ M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
 L: qemu-ppc@nongnu.org
 S: Odd Fixes
 F: hw/ppc/virtex_ml507.c
+F: tests/acceptance/ppc_virtex_ml507.py
 
 sam460ex
 M: BALATON Zoltan <balaton@eik.bme.hu>
diff --git a/tests/acceptance/machine_ppc.py b/tests/acceptance/machine_ppc.py
deleted file mode 100644
index a836e2496f..0000000000
--- a/tests/acceptance/machine_ppc.py
+++ /dev/null
@@ -1,69 +0,0 @@
-# Test that Linux kernel boots on ppc machines and check the console
-#
-# Copyright (c) 2018, 2020 Red Hat, Inc.
-#
-# This work is licensed under the terms of the GNU GPL, version 2 or
-# later.  See the COPYING file in the top-level directory.
-
-from avocado.utils import archive
-from avocado_qemu import Test
-from avocado_qemu import wait_for_console_pattern
-
-class PpcMachine(Test):
-
-    timeout = 90
-    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
-    panic_message = 'Kernel panic - not syncing'
-
-    def test_ppc64_pseries(self):
-        """
-        :avocado: tags=arch:ppc64
-        :avocado: tags=machine:pseries
-        """
-        kernel_url = ('https://archives.fedoraproject.org/pub/archive'
-                      '/fedora-secondary/releases/29/Everything/ppc64le/os'
-                      '/ppc/ppc64/vmlinuz')
-        kernel_hash = '3fe04abfc852b66653b8c3c897a59a689270bc77'
-        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
-
-        self.vm.set_console()
-        kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + 'console=hvc0'
-        self.vm.add_args('-kernel', kernel_path,
-                         '-append', kernel_command_line)
-        self.vm.launch()
-        console_pattern = 'Kernel command line: %s' % kernel_command_line
-        wait_for_console_pattern(self, console_pattern, self.panic_message)
-
-    def test_ppc_mpc8544ds(self):
-        """
-        :avocado: tags=arch:ppc
-        :avocado: tags=machine:mpc8544ds
-        """
-        tar_url = ('https://www.qemu-advent-calendar.org'
-                   '/2020/download/day17.tar.gz')
-        tar_hash = '7a5239542a7c4257aa4d3b7f6ddf08fb6775c494'
-        file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
-        archive.extract(file_path, self.workdir)
-        self.vm.set_console()
-        self.vm.add_args('-kernel', self.workdir + '/creek/creek.bin')
-        self.vm.launch()
-        wait_for_console_pattern(self, 'QEMU advent calendar 2020',
-                                 self.panic_message)
-
-    def test_ppc_virtex_ml507(self):
-        """
-        :avocado: tags=arch:ppc
-        :avocado: tags=machine:virtex-ml507
-        """
-        tar_url = ('https://www.qemu-advent-calendar.org'
-                   '/2020/download/hippo.tar.gz')
-        tar_hash = '306b95bfe7d147f125aa176a877e266db8ef914a'
-        file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
-        archive.extract(file_path, self.workdir)
-        self.vm.set_console()
-        self.vm.add_args('-kernel', self.workdir + '/hippo/hippo.linux',
-                         '-dtb', self.workdir + '/hippo/virtex440-ml507.dtb',
-                         '-m', '512')
-        self.vm.launch()
-        wait_for_console_pattern(self, 'QEMU advent calendar 2020',
-                                 self.panic_message)
diff --git a/tests/acceptance/ppc_mpc8544ds.py b/tests/acceptance/ppc_mpc8544ds.py
new file mode 100644
index 0000000000..ce840600c1
--- /dev/null
+++ b/tests/acceptance/ppc_mpc8544ds.py
@@ -0,0 +1,32 @@
+# Test that Linux kernel boots on ppc machines and check the console
+#
+# Copyright (c) 2018, 2020 Red Hat, Inc.
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+from avocado.utils import archive
+from avocado_qemu import Test
+from avocado_qemu import wait_for_console_pattern
+
+class Mpc8544dsMachine(Test):
+
+    timeout = 90
+    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
+    panic_message = 'Kernel panic - not syncing'
+
+    def test_ppc_mpc8544ds(self):
+        """
+        :avocado: tags=arch:ppc
+        :avocado: tags=machine:mpc8544ds
+        """
+        tar_url = ('https://www.qemu-advent-calendar.org'
+                   '/2020/download/day17.tar.gz')
+        tar_hash = '7a5239542a7c4257aa4d3b7f6ddf08fb6775c494'
+        file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
+        archive.extract(file_path, self.workdir)
+        self.vm.set_console()
+        self.vm.add_args('-kernel', self.workdir + '/creek/creek.bin')
+        self.vm.launch()
+        wait_for_console_pattern(self, 'QEMU advent calendar 2020',
+                                 self.panic_message)
diff --git a/tests/acceptance/ppc_pseries.py b/tests/acceptance/ppc_pseries.py
new file mode 100644
index 0000000000..f14a884ee1
--- /dev/null
+++ b/tests/acceptance/ppc_pseries.py
@@ -0,0 +1,35 @@
+# Test that Linux kernel boots on ppc machines and check the console
+#
+# Copyright (c) 2018, 2020 Red Hat, Inc.
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+from avocado.utils import archive
+from avocado_qemu import Test
+from avocado_qemu import wait_for_console_pattern
+
+class pseriesMachine(Test):
+
+    timeout = 90
+    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
+    panic_message = 'Kernel panic - not syncing'
+
+    def test_ppc64_pseries(self):
+        """
+        :avocado: tags=arch:ppc64
+        :avocado: tags=machine:pseries
+        """
+        kernel_url = ('https://archives.fedoraproject.org/pub/archive'
+                      '/fedora-secondary/releases/29/Everything/ppc64le/os'
+                      '/ppc/ppc64/vmlinuz')
+        kernel_hash = '3fe04abfc852b66653b8c3c897a59a689270bc77'
+        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
+
+        self.vm.set_console()
+        kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + 'console=hvc0'
+        self.vm.add_args('-kernel', kernel_path,
+                         '-append', kernel_command_line)
+        self.vm.launch()
+        console_pattern = 'Kernel command line: %s' % kernel_command_line
+        wait_for_console_pattern(self, console_pattern, self.panic_message)
diff --git a/tests/acceptance/ppc_virtex_ml507.py b/tests/acceptance/ppc_virtex_ml507.py
new file mode 100644
index 0000000000..27f7bf2d49
--- /dev/null
+++ b/tests/acceptance/ppc_virtex_ml507.py
@@ -0,0 +1,34 @@
+# Test that Linux kernel boots on ppc machines and check the console
+#
+# Copyright (c) 2018, 2020 Red Hat, Inc.
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+from avocado.utils import archive
+from avocado_qemu import Test
+from avocado_qemu import wait_for_console_pattern
+
+class VirtexMl507Machine(Test):
+
+    timeout = 90
+    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
+    panic_message = 'Kernel panic - not syncing'
+
+    def test_ppc_virtex_ml507(self):
+        """
+        :avocado: tags=arch:ppc
+        :avocado: tags=machine:virtex-ml507
+        """
+        tar_url = ('https://www.qemu-advent-calendar.org'
+                   '/2020/download/hippo.tar.gz')
+        tar_hash = '306b95bfe7d147f125aa176a877e266db8ef914a'
+        file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
+        archive.extract(file_path, self.workdir)
+        self.vm.set_console()
+        self.vm.add_args('-kernel', self.workdir + '/hippo/hippo.linux',
+                         '-dtb', self.workdir + '/hippo/virtex440-ml507.dtb',
+                         '-m', '512')
+        self.vm.launch()
+        wait_for_console_pattern(self, 'QEMU advent calendar 2020',
+                                 self.panic_message)
-- 
2.31.1


