Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE3C698476
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 20:26:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSNPk-0007EF-Sl; Wed, 15 Feb 2023 14:26:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSNPS-0006kr-Hy
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:25:42 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSNPO-0001ia-Vp
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:25:42 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 m20-20020a05600c3b1400b003e1e754657aso2410045wms.2
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 11:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fVmtIyUz/r0kwFhsKBxuA3oYI9V10yE6GbBrHY8IsX8=;
 b=bc1fyH5b4tTJYmzO/8YgqNOP+zW/xQrr46b+V4WEFLux8tbyIlCno9+ryHPOgofZBI
 pg0MydG8sGT+/IupGUWICycW/RXiqEInqf/7Yv2f7gaMPlaJCzQKp1z2JV7nGbBJII0b
 jhT2bY71O6aGz1LS2gSBIDVa7xMwmJGfqgok4CV8Y8UQ+QqS0YmqOxFNvYAGWemKnNLw
 bCl2Av7n68TFG2RwllnEZMvysbUgEAeNf4I92FubR49+apvFxmnGFeEQr/bi1j6MVbV0
 IbD6iIVdFLEOgPpeV1KMRXVaEAuEaKmxn18NaYL7p1LH6vld+gKBGMU+I0MSytPpBY+K
 cRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fVmtIyUz/r0kwFhsKBxuA3oYI9V10yE6GbBrHY8IsX8=;
 b=oVcn3ub+/F0aWqLy0JMheCxr9BnDWNK59kR3a8uAZY+LzH0OOozjZSoOEvz5RxROep
 LeCoFpPI4DbL8nAI/JvoLYVTWJaQ4gNhpJRcTQND9cq+NdMWT9L0C9SqkyVvKfoOP8mk
 3UZqpZiq8Sw1OLfPW1yoiIW8Mwvqq/eXEdBFLFpC0wn+DEBqP2Yleyscy6MWjDbIM3Yc
 4ftZBBKVIrvj+iFvyF0JItSZq/GJaWaERflNkcjoH0aM95k37pu+fn6Tep/Hq8oE6yDV
 5u8W0a+q1MYNnZF29DsMoBcYODMbzMkOuXwikThOpuE7y4nGix5kOSkAzIyVEAFQTppS
 WyvA==
X-Gm-Message-State: AO0yUKUW8q93IRTmoieARxYxbS0pVSYVdvUsL0EH/JVS372ngTJrlqBc
 WoO8IZSY4Xsn5xQ3y18ZtCWKcg==
X-Google-Smtp-Source: AK7set8vTiae4frvU2PX2SL09mAHm5Qm1fdb4aFtVibzKJigoXkzoYm6H37oa93OYa9IdvuKekjQxA==
X-Received: by 2002:a05:600c:a28a:b0:3e0:117:b627 with SMTP id
 hu10-20020a05600ca28a00b003e00117b627mr2827456wmb.20.1676489136807; 
 Wed, 15 Feb 2023 11:25:36 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a05600c474800b003de2fc8214esm3172507wmo.20.2023.02.15.11.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 11:25:35 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9D23F1FFB8;
 Wed, 15 Feb 2023 19:25:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Alexander Bulekov <alxndr@bu.edu>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH 09/12] tests: add tuxrun baseline test to avocado
Date: Wed, 15 Feb 2023 19:25:27 +0000
Message-Id: <20230215192530.299263-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215192530.299263-1-alex.bennee@linaro.org>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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

The TuxRun project (www.tuxrun.org) uses QEMU to run tests on a wide
variety of kernel configurations on wide range of our emulated
platforms. They publish a known good set of images at:

  https://storage.tuxboot.com/

to help with bisecting regressions in either the kernel, firmware or
QEMU itself. The tests are pretty lightweight as they contain just a
kernel with a minimal rootfs which boots a lot faster than most of the
distros. In time they might be persuaded to version there known good
baselines and we can then enable proper checksums.

For a couple of tests we currently skip:

  - mips64, a regression against previous stable release
  - sh4, very unstable with intermittent oops

Total run time: 340s (default) -> 890s (debug)

Overall coverage rate (tested targets + disabled tests):
  lines......: 16.1% (126894 of 789848 lines)
  functions..: 20.6% (15954 of 77489 functions)
  branches...: 9.3% (40727 of 439365 branches)

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Anders Roxell <anders.roxell@linaro.org>

---
v2
  - renamed to tuxrun_baselines, update commit message
  - add remaining targets
  - add more metadata tags for the differences
  - refactor tag code
  - skip mips64 and sh4 tests in CI
  - slightly increase delay for login
  - include in MAINTAINERS
---
 MAINTAINERS                       |   1 +
 tests/avocado/tuxrun_baselines.py | 423 ++++++++++++++++++++++++++++++
 2 files changed, 424 insertions(+)
 create mode 100644 tests/avocado/tuxrun_baselines.py

diff --git a/MAINTAINERS b/MAINTAINERS
index fd54c1f140..be100272b3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3760,6 +3760,7 @@ F: scripts/ci/
 F: tests/docker/
 F: tests/vm/
 F: tests/lcitool/
+F: tests/avocado/tuxrun_baselines.py
 F: scripts/archive-source.sh
 F: docs/devel/testing.rst
 W: https://gitlab.com/qemu-project/qemu/pipelines
diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_baselines.py
new file mode 100644
index 0000000000..30aaefc1d3
--- /dev/null
+++ b/tests/avocado/tuxrun_baselines.py
@@ -0,0 +1,423 @@
+# Functional test that boots known good tuxboot images the same way
+# that tuxrun (www.tuxrun.org) does. This tool is used by things like
+# the LKFT project to run regression tests on kernels.
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
+from avocado import skip, skipIf
+from avocado_qemu import QemuSystemTest
+from avocado_qemu import exec_command, exec_command_and_wait_for_pattern
+from avocado_qemu import wait_for_console_pattern
+from avocado.utils import process
+from avocado.utils.path import find_command
+
+class TuxRunBaselineTest(QemuSystemTest):
+    """
+    :avocado: tags=accel:tcg
+    """
+
+    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0'
+    # Tests are ~10-40s, allow for --debug/--enable-gcov overhead
+    timeout = 100
+
+    def get_tag(self, tagname, default=None):
+        """
+        Get the metadata tag or return the default.
+        """
+        utag = self._get_unique_tag_val(tagname)
+        print(f"{tagname}/{default} -> {utag}")
+        if utag:
+            return utag
+
+        return default
+
+    def setUp(self):
+        super().setUp()
+
+        # We need zstd for all the tuxrun tests
+        # See https://github.com/avocado-framework/avocado/issues/5609
+        zstd = find_command('zstd', False)
+        if zstd is False:
+            self.cancel('Could not find "zstd", which is required to '
+                        'decompress rootfs')
+        self.zstd = zstd
+
+        # Process the TuxRun specific tags, most machines work with
+        # reasonable defaults but we sometimes need to tweak the
+        # config. To avoid open coding everything we store all these
+        # details in the metadata for each test.
+
+        # The tuxboot tag matches the root directory
+        self.tuxboot = self.get_tag('tuxboot')
+
+        # Most Linux's use ttyS0 for their serial port
+        self.console = self.get_tag('console', "ttyS0")
+
+        # Does the machine shutdown QEMU nicely on "halt"
+        self.shutdown = self.get_tag('shutdown')
+
+        # The name of the kernel Image file
+        self.image = self.get_tag('image', "Image")
+
+        # The block device drive type
+        self.drive = self.get_tag('drive', "virtio-blk-device")
+
+        self.root = self.get_tag('root', "vda")
+
+        # Occasionally we need extra devices to hook things up
+        self.extradev = self.get_tag('extradev')
+
+    def wait_for_console_pattern(self, success_message, vm=None):
+        wait_for_console_pattern(self, success_message,
+                                 failure_message='Kernel panic - not syncing',
+                                 vm=vm)
+
+    def fetch_tuxrun_assets(self, dt=None):
+        """
+        Fetch the TuxBoot assets. They are stored in a standard way so we
+        use the per-test tags to fetch details.
+        """
+        base_url = f"https://storage.tuxboot.com/{self.tuxboot}/"
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
+    def prepare_run(self, kernel, disk, dtb=None, console_index=0):
+        """
+        Setup to run and add the common parameters to the system
+        """
+        self.vm.set_console(console_index=console_index)
+
+        # all block devices are raw ext4's
+        blockdev = "driver=raw,file.driver=file," \
+            + f"file.filename={disk},node-name=hd0"
+
+        kcmd_line = self.KERNEL_COMMON_COMMAND_LINE
+        kcmd_line += f" root=/dev/{self.root}"
+        kcmd_line += f" console={self.console}"
+
+        self.vm.add_args('-kernel', kernel,
+                         '-append', kcmd_line,
+                         '-blockdev', blockdev)
+
+        # Sometimes we need extra devices attached
+        if self.extradev:
+            self.vm.add_args('-device', self.extradev)
+
+        # Some machines already define a drive device
+        if self.drive != "none":
+            self.vm.add_args('-device',
+                             f"{self.drive},drive=hd0")
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
+        time.sleep(0.2)
+        exec_command(self, 'root')
+        time.sleep(0.2)
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
+    def common_tuxrun(self, dt=None, haltmsg="reboot: System halted",
+                      console_index=0):
+        """
+        Common path for LKFT tests. Unless we need to do something
+        special with the command line we can process most things using
+        the tag metadata.
+        """
+        (kernel, disk, dtb) = self.fetch_tuxrun_assets(dt)
+
+        self.prepare_run(kernel, disk, dtb, console_index)
+        self.vm.launch()
+        self.run_tuxtest_tests(haltmsg)
+
+    #
+    # The tests themselves. The configuration is derived from how
+    # tuxrun invokes qemu (with minor tweaks like using -blockdev
+    # consistently). The tuxrun equivalent is something like:
+    #
+    # tuxrun --device qemu-{ARCH} \
+    #        --kernel https://storage.tuxboot.com/{TUXBOOT}/{IMAGE}
+    #
+
+    def test_arm64(self):
+        """
+        :avocado: tags=arch:aarch64
+        :avocado: tags=cpu:cortex-a57
+        :avocado: tags=machine:virt
+        :avocado: tags=tuxboot:arm64
+        :avocado: tags=console:ttyAMA0
+        :avocado: tags=shutdown:nowait
+        """
+        self.common_tuxrun()
+
+    def test_arm64be(self):
+        """
+        :avocado: tags=arch:aarch64
+        :avocado: tags=cpu:cortex-a57
+        :avocado: tags=endian:big
+        :avocado: tags=machine:virt
+        :avocado: tags=tuxboot:arm64be
+        :avocado: tags=console:ttyAMA0
+        :avocado: tags=shutdown:nowait
+        """
+        self.common_tuxrun()
+
+    def test_armv5(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=cpu:arm926
+        :avocado: tags=machine:versatilepb
+        :avocado: tags=tuxboot:armv5
+        :avocado: tags=image:zImage
+        :avocado: tags=drive:virtio-blk-pci
+        :avocado: tags=console:ttyAMA0
+        :avocado: tags=shutdown:nowait
+        """
+        self.common_tuxrun(dt="versatile-pb.dtb")
+
+    def test_armv7(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=cpu:cortex-a15
+        :avocado: tags=machine:virt
+        :avocado: tags=tuxboot:armv7
+        :avocado: tags=image:zImage
+        :avocado: tags=console:ttyAMA0
+        :avocado: tags=shutdown:nowait
+        """
+        self.common_tuxrun()
+
+    def test_armv7be(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=cpu:cortex-a15
+        :avocado: tags=endian:big
+        :avocado: tags=machine:virt
+        :avocado: tags=tuxboot:armv7be
+        :avocado: tags=image:zImage
+        :avocado: tags=console:ttyAMA0
+        :avocado: tags=shutdown:nowait
+        """
+        self.common_tuxrun()
+
+    def test_i386(self):
+        """
+        :avocado: tags=arch:i386
+        :avocado: tags=cpu:coreduo
+        :avocado: tags=machine:q35
+        :avocado: tags=tuxboot:i386
+        :avocado: tags=image:bzImage
+        :avocado: tags=drive:virtio-blk-pci
+        :avocado: tags=shutdown:nowait
+        """
+        self.common_tuxrun()
+
+    def test_mips32(self):
+        """
+        :avocado: tags=arch:mips
+        :avocado: tags=machine:malta
+        :avocado: tags=cpu:mips32r6-generic
+        :avocado: tags=endian:big
+        :avocado: tags=tuxboot:mips32
+        :avocado: tags=image:vmlinux
+        :avocado: tags=drive:driver=ide-hd,bus=ide.0,unit=0
+        :avocado: tags=root:sda
+        :avocado: tags=shutdown:nowait
+        """
+        self.common_tuxrun()
+
+    def test_mips32el(self):
+        """
+        :avocado: tags=arch:mipsel
+        :avocado: tags=machine:malta
+        :avocado: tags=cpu:mips32r6-generic
+        :avocado: tags=tuxboot:mips32el
+        :avocado: tags=image:vmlinux
+        :avocado: tags=drive:driver=ide-hd,bus=ide.0,unit=0
+        :avocado: tags=root:sda
+        :avocado: tags=shutdown:nowait
+        """
+        self.common_tuxrun()
+
+    @skip("QEMU currently broken") # regression against stable QEMU
+    def test_mips64(self):
+        """
+        :avocado: tags=arch:mips64
+        :avocado: tags=machine:malta
+        :avocado: tags=tuxboot:mips64
+        :avocado: tags=endian:big
+        :avocado: tags=image:vmlinux
+        :avocado: tags=drive:driver=ide-hd,bus=ide.0,unit=0
+        :avocado: tags=root:sda
+        :avocado: tags=shutdown:nowait
+        """
+        self.common_tuxrun()
+
+    def test_mips64el(self):
+        """
+        :avocado: tags=arch:mips64el
+        :avocado: tags=machine:malta
+        :avocado: tags=tuxboot:mips64el
+        :avocado: tags=image:vmlinux
+        :avocado: tags=drive:driver=ide-hd,bus=ide.0,unit=0
+        :avocado: tags=root:sda
+        :avocado: tags=shutdown:nowait
+        """
+        self.common_tuxrun()
+
+    def test_ppc32(self):
+        """
+        :avocado: tags=arch:ppc
+        :avocado: tags=machine:ppce500
+        :avocado: tags=cpu:e500mc
+        :avocado: tags=tuxboot:ppc32
+        :avocado: tags=image:uImage
+        :avocado: tags=drive:virtio-blk-pci
+        :avocado: tags=shutdown:nowait
+        """
+        self.common_tuxrun()
+
+    def test_ppc64(self):
+        """
+        :avocado: tags=arch:ppc64
+        :avocado: tags=machine:pseries
+        :avocado: tags=cpu:POWER8
+        :avocado: tags=endian:big
+        :avocado: tags=console:hvc0
+        :avocado: tags=tuxboot:ppc64
+        :avocado: tags=image:vmlinux
+        :avocado: tags=extradev:driver=spapr-vscsi
+        :avocado: tags=drive:scsi-hd
+        :avocado: tags=root:sda
+        """
+        self.common_tuxrun()
+
+    def test_ppc64le(self):
+        """
+        :avocado: tags=arch:ppc64
+        :avocado: tags=machine:pseries
+        :avocado: tags=cpu:POWER8
+        :avocado: tags=console:hvc0
+        :avocado: tags=tuxboot:ppc64le
+        :avocado: tags=image:vmlinux
+        :avocado: tags=extradev:driver=spapr-vscsi
+        :avocado: tags=drive:scsi-hd
+        :avocado: tags=root:sda
+        """
+        self.common_tuxrun()
+
+    def test_riscv32(self):
+        """
+        :avocado: tags=arch:riscv32
+        :avocado: tags=machine:virt
+        :avocado: tags=tuxboot:riscv32
+        """
+        self.common_tuxrun()
+
+    def test_riscv64(self):
+        """
+        :avocado: tags=arch:riscv64
+        :avocado: tags=machine:virt
+        :avocado: tags=tuxboot:riscv64
+        """
+        self.common_tuxrun()
+
+    def test_s390(self):
+        """
+        :avocado: tags=arch:s390x
+        :avocado: tags=endian:big
+        :avocado: tags=tuxboot:s390
+        :avocado: tags=image:bzImage
+        :avocado: tags=drive:virtio-blk-ccw
+        :avocado: tags=shutdown:nowait
+        """
+        self.common_tuxrun(haltmsg="Requesting system halt")
+
+    # Note: some segfaults caused by unaligned userspace access
+    @skipIf(os.getenv('GITLAB_CI'), 'Skipping unstable test on GitLab')
+    def test_sh4(self):
+        """
+        :avocado: tags=arch:sh4
+        :avocado: tags=machine:r2d
+        :avocado: tags=cpu:sh7785
+        :avocado: tags=tuxboot:sh4
+        :avocado: tags=image:zImage
+        :avocado: tags=root:sda
+        :avocado: tags=drive:driver=ide-hd,bus=ide.0,unit=0
+        :avocado: tags=console:ttySC1
+        """
+        # The test is currently too unstable to do much in userspace
+        # so we skip common_tuxrun and do a minimal boot and shutdown.
+        (kernel, disk, dtb) = self.fetch_tuxrun_assets()
+
+        # the console comes on the second serial port
+        self.prepare_run(kernel, disk, console_index=1)
+        self.vm.launch()
+
+        self.wait_for_console_pattern("Welcome to TuxTest")
+        time.sleep(0.1)
+        exec_command(self, 'root')
+        time.sleep(0.1)
+        exec_command_and_wait_for_pattern(self, 'halt',
+                                          "reboot: System halted")
+
+    def test_sparc64(self):
+        """
+        :avocado: tags=arch:sparc64
+        :avocado: tags=tuxboot:sparc64
+        :avocado: tags=image:vmlinux
+        :avocado: tags=root:sda
+        :avocado: tags=drive:driver=ide-hd,bus=ide.0,unit=0
+        :avocado: tags=shutdown:nowait
+        """
+        self.common_tuxrun()
+
+    def test_x86_64(self):
+        """
+        :avocado: tags=arch:x86_64
+        :avocado: tags=machine:q35
+        :avocado: tags=cpu:Nehalem
+        :avocado: tags=tuxboot:x86_64
+        :avocado: tags=image:bzImage
+        :avocado: tags=root:sda
+        :avocado: tags=drive:driver=ide-hd,bus=ide.0,unit=0
+        :avocado: tags=shutdown:nowait
+        """
+        self.common_tuxrun()
-- 
2.39.1


