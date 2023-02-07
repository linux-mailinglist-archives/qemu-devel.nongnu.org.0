Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DAE68E21C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 21:45:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPUpb-0004gn-Lx; Tue, 07 Feb 2023 15:44:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pPUpY-0004gN-KQ
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 15:44:44 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pPUpW-0005KB-1Q
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 15:44:44 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 hn2-20020a05600ca38200b003dc5cb96d46so14053164wmb.4
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 12:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BCYtPFtyqePX+GuVb/E/tXIxhHB+OeSyenBZtfPgpu8=;
 b=WZGyuM+QUWnW2eAjWvhhaGW1MSmeZmycrhpEYDm3gtG0I5xh93So7HnvS5C+oXvDH2
 YKD9HpGCs9PKYhMcHfKQYA3nAwWEi+aP36jWJT/V5ulL0vGz6uvFPxq68VTVv+i0SBUF
 mKUQCFgGHMnfX4z9acACNOR8wKsCeh91ghhg+Ntqm0tQaoW/WXZP25zbavkAdNORyn1c
 MVITWiU+74VsDAkNOmOR+340khuJ1Gq4ARJfBoCyWwXpkgruMQ3tEzHMWM377ZjjSxI4
 7tteL31twjs06miWMa26UalhVfdAJJmJeGelyG966EE8ifIR8gAUalyItQ55e3ApSn68
 BB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BCYtPFtyqePX+GuVb/E/tXIxhHB+OeSyenBZtfPgpu8=;
 b=wrRjHm3Wf8TcPdxp3QvTf4W2TAwY3KOsAo75CUckJpFkPRebMEmw3Bb1xYFTErOV9H
 MHQ2cnqbdSrfpXm6rhJvfmlxy4Zc3vmuqcQPJZFl4SMGUJtXiTuE19OYhqBNfEN7lHbz
 pLNOO9xx9CiOa9VJ37EcsbpAKNQTXCGT7pVqiHsux+yqPIZV+8uE6Tahtq49i6SXD58R
 9tLufjnzSOpqjBJEwjCzrDUC1KapQM8J18x9Qyf3OrwlpItERzj6+6xa72Zx5NmSVFlE
 e5vvCqVnN3uYEl55ppE8kvzjbLLHeKBEIYb0fjEXiFRo/PgiAMwP9uc4oIoSwL0QzyxY
 myVQ==
X-Gm-Message-State: AO0yUKVWLZhJ6yu2qJcXLHHbwhhVk33FaiGxONuQ8JYmN5wcF6BLm1Xq
 kh2wAWC0sHTahkuSBFLgp+bX9g==
X-Google-Smtp-Source: AK7set/U/iZr/tlNMz2XzD0yea/gec4PnLaPjV8bqupAblVJqXJpST20fbYdKhEgQBVPHwAbQyJBRA==
X-Received: by 2002:a05:600c:a294:b0:3e0:10d:f1c with SMTP id
 hu20-20020a05600ca29400b003e0010d0f1cmr4393935wmb.37.1675802680360; 
 Tue, 07 Feb 2023 12:44:40 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a05600c471000b003dd1bd66e0dsm16748970wmo.3.2023.02.07.12.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 12:44:39 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 673861FFB7;
 Tue,  7 Feb 2023 20:44:39 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anders Roxell <anders.roxell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [RFC PATCH] tests: add LKFT baseline test to avocado
Date: Tue,  7 Feb 2023 20:44:33 +0000
Message-Id: <20230207204433.752020-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The Linux Kernel Function Test (LKFT) project uses QEMU to test a wide
variety of kernel configurations on wide range of our emulated
platforms. They publish a known good set of images at:

  https://storage.tuxboot.com/

to help with bisecting regressions in either the kernel, firmware or
QEMU itself. The tests are pretty lightweight as they contain just a
kernel with a minimal rootfs which boots a lot faster than most of the
distros. In time they might be persuaded to version there known good
baselines and we can then enable proper checksums.

Total run time: 140s

Overall coverage rate:
  lines......: 8.7% (96412 of 1106284 lines)
  functions..: 10.8% (11515 of 106651 functions)
  branches...: 8.3% (30685 of 370255 branches)

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Anders Roxell <anders.roxell@linaro.org>
---
 tests/avocado/lkft_baselines.py | 257 ++++++++++++++++++++++++++++++++
 1 file changed, 257 insertions(+)
 create mode 100755 tests/avocado/lkft_baselines.py

diff --git a/tests/avocado/lkft_baselines.py b/tests/avocado/lkft_baselines.py
new file mode 100755
index 0000000000..f347150df7
--- /dev/null
+++ b/tests/avocado/lkft_baselines.py
@@ -0,0 +1,257 @@
+# Functional test that boots known good lkft images
+#
+# Copyright (c) 2023 Linaro Ltd.
+#
+# Author:
+#  Alex Bennée <alex.bennee@linaro.org>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import os
+import time
+
+from avocado_qemu import QemuSystemTest
+from avocado_qemu import exec_command, exec_command_and_wait_for_pattern
+from avocado_qemu import wait_for_console_pattern
+from avocado.utils import process
+from avocado.utils.path import find_command
+
+
+class LKFTBaselineTest(QemuSystemTest):
+    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 root=/dev/vda'
+
+    def setUp(self):
+        super().setUp()
+
+        # We need zstd for all the lkft tests
+        zstd = find_command('zstd', False)
+        if zstd is False:
+            self.cancel('Could not find "zstd", which is required to '
+                        'decompress rootfs')
+        self.zstd = zstd
+
+        # Process the LKFT specific tags, most machines work with
+        # reasonable defaults but we sometimes need to tweak the
+        # config.
+
+        # The lfkt tag matches the root directory
+        self.lkft = self.params.get('lkft',
+                                    default = self._get_unique_tag_val('lkft'))
+
+        # Most Linux's use ttyS0 for their serial port
+        console = self.params.get('console',
+                                  default = self._get_unique_tag_val('console'))
+        if console:
+            self.console = console
+        else:
+            self.console = "ttyS0"
+
+        # Does the machine shutdown QEMU nicely on "halt"
+        self.shutdown = self.params.get('shutdown',
+                                    default = self._get_unique_tag_val('shutdown'))
+
+        # The name of the kernel Image file
+        image = self.params.get('image',
+                                default = self._get_unique_tag_val('image'))
+        if not image:
+            self.image = "Image"
+        else:
+            self.image = image
+
+        # The block device drive type
+        drive = self.params.get('drive',
+                                default = self._get_unique_tag_val('drive'))
+        if not drive:
+            self.drive = "virtio-blk-device"
+        else:
+            self.drive = drive
+
+    def wait_for_console_pattern(self, success_message, vm=None):
+        wait_for_console_pattern(self, success_message,
+                                 failure_message='Kernel panic - not syncing',
+                                 vm=vm)
+
+    def fetch_lkft_assets(self, dt=None):
+        """
+        Fetch the LKFT assets. They are stored in a standard way so we
+        use the per-test tags to fetch details.
+        """
+        base_url = f"https://storage.tuxboot.com/{self.lkft}/"
+        kernel_image =  self.fetch_asset(base_url + self.image)
+        disk_image_zst = self.fetch_asset(base_url + "rootfs.ext4.zst")
+
+        cmd = f"{self.zstd} -d {disk_image_zst} -o {self.workdir}/rootfs.ext4"
+        process.run(cmd)
+
+        if dt:
+            dtb = self.fetch_asset(base_url + dt)
+        else:
+            dtb = None
+
+        return (kernel_image, self.workdir + "/rootfs.ext4", dtb)
+
+    def prepare_run(self, kernel, disk, dtb=None):
+        """
+        Setup to run and add the common parameters to the system
+        """
+        self.vm.set_console()
+
+        # all block devices are raw ext4's
+        blockdev = "driver=raw,file.driver=file," \
+            + f"file.filename={disk},node-name=hd0"
+
+        kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + \
+            f" console={self.console}"
+
+        self.vm.add_args('-kernel', kernel,
+                         '-append', kernel_command_line,
+                         '-blockdev', blockdev,
+                         '-device', f"{self.drive},drive=hd0")
+
+        # Some machines need an explicit DTB
+        if dtb:
+            self.vm.add_args('-dtb', dtb)
+
+    def run_tuxtest_tests(self, haltmsg):
+        """
+        Wait for the system to boot up, wait for the login prompt and
+        then do a few things on the console. Trigger a shutdown and
+        wait to exit cleanly.
+        """
+        self.wait_for_console_pattern("Welcome to TuxTest")
+        time.sleep(0.1)
+        exec_command(self, 'root')
+        time.sleep(0.1)
+        exec_command(self, 'cat /proc/interrupts')
+        time.sleep(0.1)
+        exec_command(self, 'cat /proc/self/maps')
+        time.sleep(0.1)
+        exec_command(self, 'uname -a')
+        time.sleep(0.1)
+        exec_command_and_wait_for_pattern(self, 'halt', haltmsg)
+
+        # Wait for VM to shut down gracefully if it can
+        if self.shutdown == "nowait":
+            self.vm.shutdown()
+        else:
+            self.vm.wait()
+
+    def common_lkft(self, dt=None, haltmsg="reboot: System halted"):
+        """
+        Common path for LKFT tests. Unless we need to do something
+        special with the command line we can process most things using
+        the tag metadata.
+        """
+        (kernel, disk, dtb) = self.fetch_lkft_assets(dt)
+
+        self.prepare_run(kernel, disk, dtb)
+        self.vm.launch()
+        self.run_tuxtest_tests(haltmsg)
+
+    def test_arm64(self):
+        """
+        :avocado: tags=arch:aarch64
+        :avocado: tags=cpu:cortex-a57
+        :avocado: tags=machine:virt
+        :avocado: tags=lkft:arm64
+        :avocado: tags=console:ttyAMA0
+        :avocado: tags=shutdown:nowait
+        """
+        self.common_lkft()
+
+    def test_arm64be(self):
+        """
+        :avocado: tags=arch:aarch64
+        :avocado: tags=cpu:cortex-a57
+        :avocado: tags=machine:virt
+        :avocado: tags=lkft:arm64be
+        :avocado: tags=console:ttyAMA0
+        :avocado: tags=shutdown:nowait
+        """
+        self.common_lkft()
+
+    def test_armv5(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=cpu:arm926
+        :avocado: tags=machine:versatilepb
+        :avocado: tags=lkft:armv5
+        :avocado: tags=image:zImage
+        :avocado: tags=drive:virtio-blk-pci
+        :avocado: tags=console:ttyAMA0
+        :avocado: tags=shutdown:nowait
+        """
+        self.common_lkft(dt="versatile-pb.dtb")
+
+    def test_armv7(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=cpu:cortex-a15
+        :avocado: tags=machine:virt
+        :avocado: tags=lkft:armv7
+        :avocado: tags=image:zImage
+        :avocado: tags=console:ttyAMA0
+        :avocado: tags=shutdown:nowait
+        """
+        self.common_lkft()
+
+    def test_armv7be(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=cpu:cortex-a15
+        :avocado: tags=machine:virt
+        :avocado: tags=lkft:armv7be
+        :avocado: tags=image:zImage
+        :avocado: tags=console:ttyAMA0
+        :avocado: tags=shutdown:nowait
+        """
+        self.common_lkft()
+
+    def test_i386(self):
+        """
+        :avocado: tags=arch:i386
+        :avocado: tags=cpu:coreduo
+        :avocado: tags=machine:q35
+        :avocado: tags=lkft:i386
+        :avocado: tags=image:bzImage
+        :avocado: tags=drive:virtio-blk-pci
+        :avocado: tags=shutdown:nowait
+        """
+        self.common_lkft()
+
+    # def test_mips32(self):
+    #     """
+    #     :avocado: tags=arch:mips
+    #     :avocado: tags=machine:malta
+    #     :avocado: tags=lkft:mips32
+    #     :avocado: tags=image:vmlinux
+    #     :avocado: tags=drive:virtio-blk-pci
+    #     :avocado: tags=shutdown:nowait
+    #     """
+    #     self.common_lkft()
+
+    def test_riscv32(self):
+        """
+        :avocado: tags=arch:riscv32
+        :avocado: tags=machine:virt
+        :avocado: tags=lkft:riscv32
+        """
+        self.common_lkft()
+
+    def test_riscv64(self):
+        """
+        :avocado: tags=arch:riscv64
+        :avocado: tags=machine:virt
+        :avocado: tags=lkft:riscv64
+        """
+        self.common_lkft()
+
+    def test_s390(self):
+        """
+        :avocado: tags=arch:s390x
+        :avocado: tags=lkft:s390
+        :avocado: tags=image:bzImage
+        :avocado: tags=drive:virtio-blk-ccw
+        :avocado: tags=shutdown:nowait
+        """
+        self.common_lkft(haltmsg="Requesting system halt")
-- 
2.39.1


