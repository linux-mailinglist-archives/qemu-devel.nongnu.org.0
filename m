Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC523528F5
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 11:40:55 +0200 (CEST)
Received: from localhost ([::1]:35308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSGIQ-00042E-4n
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 05:40:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lSGDd-00008U-Nd
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 05:35:57 -0400
Received: from mail.ispras.ru ([83.149.199.84]:42816)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lSGDa-0002hF-U6
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 05:35:57 -0400
Received: from [127.0.1.1] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 531E540D3BFF;
 Fri,  2 Apr 2021 09:35:53 +0000 (UTC)
Subject: [PATCH 4/4] tests/acceptance: Linux boot test for record/replay
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Fri, 02 Apr 2021 12:35:53 +0300
Message-ID: <161735615301.1593935.3896799302321048496.stgit@pasha-ThinkPad-X280>
In-Reply-To: <161735613083.1593935.15369171718807768142.stgit@pasha-ThinkPad-X280>
References: <161735613083.1593935.15369171718807768142.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pavel.dovgalyuk@ispras.ru, philmd@redhat.com, wrampazz@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <Pavel.Dovgaluk@gmail.com>

This patch adds a test for record/replay, which boots Linux
image from the disk and interacts with the network.
The idea and code of this test is borrowed from boot_linux.py
This test includes only x86_64 platform. Other platforms and
machines will be added later after testing and improving
record/replay to completely support them.

Each test consists of the following phases:
 - downloading the disk image
 - recording the execution
 - replaying the execution

Replay does not validates the output, but waits until QEMU
finishes the execution. This is reasonable, because
QEMU usually hangs when replay goes wrong.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
---
 MAINTAINERS                      |    1 
 tests/acceptance/replay_linux.py |  116 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 117 insertions(+)
 create mode 100644 tests/acceptance/replay_linux.py

diff --git a/MAINTAINERS b/MAINTAINERS
index aa894767dc..17c152a5e1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2856,6 +2856,7 @@ F: include/sysemu/replay.h
 F: docs/replay.txt
 F: stubs/replay.c
 F: tests/acceptance/replay_kernel.py
+F: tests/acceptance/replay_linux.py
 F: tests/acceptance/reverse_debugging.py
 F: qapi/replay.json
 
diff --git a/tests/acceptance/replay_linux.py b/tests/acceptance/replay_linux.py
new file mode 100644
index 0000000000..15953f9e49
--- /dev/null
+++ b/tests/acceptance/replay_linux.py
@@ -0,0 +1,116 @@
+# Record/replay test that boots a complete Linux system via a cloud image
+#
+# Copyright (c) 2020 ISP RAS
+#
+# Author:
+#  Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+import os
+import logging
+import time
+
+from avocado import skipUnless
+from avocado.utils import cloudinit
+from avocado.utils import network
+from avocado.utils import vmimage
+from avocado.utils import datadrainer
+from avocado.utils.path import find_command
+from avocado_qemu import LinuxTest
+
+class ReplayLinux(LinuxTest):
+    """
+    Boots a Linux system, checking for a successful initialization
+    """
+
+    timeout = 1800
+    chksum = None
+    hdd = 'ide-hd'
+    cd = 'ide-cd'
+    bus = 'ide'
+
+    def setUp(self):
+        super(ReplayLinux, self).setUp()
+        self.boot_path = self.download_boot()
+        self.cloudinit_path = self.prepare_cloudinit()
+
+    def vm_add_disk(self, vm, path, id, device):
+        bus_string = ''
+        if self.bus:
+            bus_string = ',bus=%s.%d' % (self.bus, id,)
+        vm.add_args('-drive', 'file=%s,snapshot,id=disk%s,if=none' % (path, id))
+        vm.add_args('-drive',
+            'driver=blkreplay,id=disk%s-rr,if=none,image=disk%s' % (id, id))
+        vm.add_args('-device',
+            '%s,drive=disk%s-rr%s' % (device, id, bus_string))
+
+    def launch_and_wait(self, record, args, shift):
+        vm = self.get_vm()
+        vm.add_args('-smp', '1')
+        vm.add_args('-m', '1024')
+        vm.add_args('-object', 'filter-replay,id=replay,netdev=hub0port0')
+        if args:
+            vm.add_args(*args)
+        self.vm_add_disk(vm, self.boot_path, 0, self.hdd)
+        self.vm_add_disk(vm, self.cloudinit_path, 1, self.cd)
+        logger = logging.getLogger('replay')
+        if record:
+            logger.info('recording the execution...')
+            mode = 'record'
+        else:
+            logger.info('replaying the execution...')
+            mode = 'replay'
+        replay_path = os.path.join(self.workdir, 'replay.bin')
+        vm.add_args('-icount', 'shift=%s,rr=%s,rrfile=%s' %
+                    (shift, mode, replay_path))
+
+        start_time = time.time()
+
+        vm.set_console()
+        vm.launch()
+        console_drainer = datadrainer.LineLogger(vm.console_socket.fileno(),
+                                    logger=self.log.getChild('console'),
+                                    stop_check=(lambda : not vm.is_running()))
+        console_drainer.start()
+        if record:
+            cloudinit.wait_for_phone_home(('0.0.0.0', self.phone_home_port),
+                                          self.name)
+            vm.shutdown()
+            logger.info('finished the recording with log size %s bytes'
+                % os.path.getsize(replay_path))
+        else:
+            vm.event_wait('SHUTDOWN', self.timeout)
+            vm.shutdown(True)
+            logger.info('successfully fihished the replay')
+        elapsed = time.time() - start_time
+        logger.info('elapsed time %.2f sec' % elapsed)
+        return elapsed
+
+    def run_rr(self, args=None, shift=7):
+        t1 = self.launch_and_wait(True, args, shift)
+        t2 = self.launch_and_wait(False, args, shift)
+        logger = logging.getLogger('replay')
+        logger.info('replay overhead {:.2%}'.format(t2 / t1 - 1))
+
+@skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
+class ReplayLinuxX8664(ReplayLinux):
+    """
+    :avocado: tags=arch:x86_64
+    :avocado: tags=accel:tcg
+    """
+
+    chksum = 'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0'
+
+    def test_pc_i440fx(self):
+        """
+        :avocado: tags=machine:pc
+        """
+        self.run_rr(shift=1)
+
+    def test_pc_q35(self):
+        """
+        :avocado: tags=machine:q35
+        """
+        self.run_rr(shift=3)


