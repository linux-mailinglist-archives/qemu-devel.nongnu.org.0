Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D48F6C3909
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 19:19:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pegYT-0007v3-Jo; Tue, 21 Mar 2023 14:17:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pegYR-0007uU-KK
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 14:17:51 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pegYP-0000tq-4j
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 14:17:51 -0400
Received: by mail-wr1-x429.google.com with SMTP id l12so14660925wrm.10
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 11:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679422667;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zwvwpQdmRcSuby9ryFaEx+cvWV5PubdK3TRpcGcmbho=;
 b=MEJXcNg2oH8Zy1cMK0MpAJzsF54G/XgFaLgEYE1bVamgehmpSdAVc7P6a+WrU97bgR
 OwqNZGf6jtg+CohFSxSfOnGL2WhRjTamBIdJGXSnjsdeEl3CIBFqob2EeFEa+Je9Gz52
 TuNPxJz7qllrAGYVRV+J5XK/lTbCX3xPEA7vpyvvKoTUAxUcrQ3voCM+Ur/HAxa5X4lZ
 0Ahej/sGpbZRlXkg7AU1xFPgEeesFmliGsbD+wTP7Dx002mn9wnQ+hPfq/fyjoJ5gPy4
 VZcZJJVAJIXjk7kNdPqGQIdEMTToQgYHpv/yB/tPx0UUzmRqTcMQFvQGWxBkfWxt3Sus
 blAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679422667;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zwvwpQdmRcSuby9ryFaEx+cvWV5PubdK3TRpcGcmbho=;
 b=YZYfKos271yp7qN5RPgFHmo6hUpm6vQRHpFYUv0bj6dhS0ZhDR29IiORw282aqJpa5
 Nta4oJe/xf/XDT2EZrRmz496HL8pR42FMeDhUqEAKnzholCAa5jQfkEpXZAEuvPt6Obj
 i0Aq6LcJjFs9MyqftyNYo5h+kSnGPOn7l5180i9RtbKdlkCobDjwGVd1lmKXkdb/eMff
 aWpZuTSAhlr/NIxXufe/YEwe6+Hf5KPiIWmp9LAkDGdR1M9xBbp6h/1LyL/pwIG+2SRy
 43l5VL+8z7xagOkS9qAxNd4b4TkPXZZzvQkujdSSGOKWNCfOxGA5XTCjCd54dV0DYWBd
 73/w==
X-Gm-Message-State: AO0yUKXnYI0oBnt2QfWACk10Q4maCV97KI/36ePkULb+kBinMi6ybyqT
 xlmJMZQNSIEN1gcwqnbNEe2NUg==
X-Google-Smtp-Source: AK7set9zGXnHYGOMNayxNWvI+OTZ0BEV4UKdrD8VMqP9b35fs8P3ik0tn31a7yrFykXe2NQYcnu6vg==
X-Received: by 2002:a05:6000:124a:b0:2bf:f4f7:be9c with SMTP id
 j10-20020a056000124a00b002bff4f7be9cmr2977523wrx.14.1679422667327; 
 Tue, 21 Mar 2023 11:17:47 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 j20-20020a5d6e54000000b002cea8664304sm11817986wrz.91.2023.03.21.11.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 11:17:47 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 710631FFB7;
 Tue, 21 Mar 2023 18:17:46 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [RFC PATCH] tests/avocado: re-factor igb test to avoid timeouts
Date: Tue, 21 Mar 2023 18:17:41 +0000
Message-Id: <20230321181741.3748845-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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

The core of the test was utilising "ethtool -t eth1 offline" to run
through a test sequence. For reasons unknown the test hangs under some
configurations of the build on centos8-stream. Fundamentally running
the old fedora-31 cloud-init is just too much for something that is
directed at testing one device. So we:

  - replace fedora with a custom kernel + buildroot rootfs
  - rename the test from IGB to NetDevEthtool
  - re-factor the common code, add (currently skipped) tests for other
     devices which support ethtool
  - remove the KVM limitation as its fast enough to run in KVM or TCG

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 tests/avocado/igb.py            | 38 --------------
 tests/avocado/netdev-ethtool.py | 93 +++++++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+), 38 deletions(-)
 delete mode 100644 tests/avocado/igb.py
 create mode 100644 tests/avocado/netdev-ethtool.py

diff --git a/tests/avocado/igb.py b/tests/avocado/igb.py
deleted file mode 100644
index abf5dfa07f..0000000000
--- a/tests/avocado/igb.py
+++ /dev/null
@@ -1,38 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# ethtool tests for igb registers, interrupts, etc
-
-from avocado_qemu import LinuxTest
-
-class IGB(LinuxTest):
-    """
-    :avocado: tags=accel:kvm
-    :avocado: tags=arch:x86_64
-    :avocado: tags=distro:fedora
-    :avocado: tags=distro_version:31
-    :avocado: tags=machine:q35
-    """
-
-    timeout = 180
-
-    def test(self):
-        self.require_accelerator('kvm')
-        kernel_url = self.distro.pxeboot_url + 'vmlinuz'
-        kernel_hash = '5b6f6876e1b5bda314f93893271da0d5777b1f3c'
-        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
-        initrd_url = self.distro.pxeboot_url + 'initrd.img'
-        initrd_hash = 'dd0340a1b39bd28f88532babd4581c67649ec5b1'
-        initrd_path = self.fetch_asset(initrd_url, asset_hash=initrd_hash)
-
-        # Ideally we want to test MSI as well, but it is blocked by a bug
-        # fixed with:
-        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=28e96556baca7056d11d9fb3cdd0aba4483e00d8
-        kernel_params = self.distro.default_kernel_params + ' pci=nomsi'
-
-        self.vm.add_args('-kernel', kernel_path,
-                         '-initrd', initrd_path,
-                         '-append', kernel_params,
-                         '-accel', 'kvm',
-                         '-device', 'igb')
-        self.launch_and_wait()
-        self.ssh_command('dnf -y install ethtool')
-        self.ssh_command('ethtool -t eth1 offline')
diff --git a/tests/avocado/netdev-ethtool.py b/tests/avocado/netdev-ethtool.py
new file mode 100644
index 0000000000..da0a22d51c
--- /dev/null
+++ b/tests/avocado/netdev-ethtool.py
@@ -0,0 +1,93 @@
+# ethtool tests for emulated network devices
+#
+# This test leverages ethtool's --test sequence to validate network
+# device behaviour.
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import time
+
+from avocado import skip
+
+from avocado_qemu import QemuSystemTest
+from avocado_qemu import exec_command, exec_command_and_wait_for_pattern
+from avocado_qemu import wait_for_console_pattern
+
+class NetDevEthtool(QemuSystemTest):
+    """
+    :avocado: tags=arch:x86_64
+    :avocado: tags=machine:q35
+    """
+
+    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 root=/dev/sda console=ttyS0 '
+    # Runs in about 20s under KVM, 26s under TCG, 37s under GCOV
+    timeout = 45
+
+    def common_test_code(self, netdev, extra_args=None):
+        base_url = ('https://fileserver.linaro.org/s/'
+                    'kE4nCFLdQcoBF9t/download?'
+                    'path=%2Figb-net-test&files=' )
+
+        # This custom kernel has drivers for all the supported network
+        # devices we can emulate in QEMU
+        kernel_url = base_url + 'bzImage'
+        kernel_hash = '784daede6dab993597f36efbf01f69f184c55152'
+        kernel_path = self.fetch_asset(name="bzImage",
+                                       locations=(kernel_url), asset_hash=kernel_hash)
+
+        rootfs_url = base_url + 'rootfs.ext4'
+        rootfs_hash = '7d28c1bf429de3b441a63756a51f163442ea574b'
+        rootfs_path = self.fetch_asset(name="rootfs.ext4",
+                                       locations=(rootfs_url),
+                                       asset_hash=rootfs_hash)
+
+        kernel_params = self.KERNEL_COMMON_COMMAND_LINE
+        if extra_args:
+            kernel_params += extra_args
+
+        self.vm.add_args('-kernel', kernel_path,
+                         '-append', kernel_params,
+                         '-blockdev',
+                         f"driver=raw,file.driver=file,file.filename={rootfs_path},node-name=hd0",
+                         '-device', 'driver=ide-hd,bus=ide.0,unit=0,drive=hd0',
+                         '-device', netdev)
+
+        self.vm.set_console(console_index=0)
+        self.vm.launch()
+
+        wait_for_console_pattern(self, "Welcome to Buildroot", vm=None)
+        time.sleep(0.2)
+        exec_command(self, 'root')
+        time.sleep(0.2)
+        exec_command_and_wait_for_pattern(self,
+                                          "ethtool -t eth1 offline",
+                                          "The test result is PASS",
+                                          "The test result is FAIL")
+        time.sleep(0.2)
+        exec_command_and_wait_for_pattern(self, 'halt', "reboot: System halted")
+
+    # Skip testing for MSI for now. Allegedly it was fixed by:
+    #   28e96556ba (igb: Allocate MSI-X vector when testing)
+    # but I'm seeing oops in the kernel
+    @skip("Kernel bug with MSI enabled")
+    def test_igb(self):
+        self.common_test_code("igb")
+
+    def test_igb_nomsi(self):
+        self.common_test_code("igb", "pci=nomsi")
+
+
+    # It seems the other popular cards we model in QEMU currently fail
+    # the pattern test with:
+    #
+    #   pattern test failed (reg 0x00178): got 0x00000000 expected 0x00005A5A
+    #
+    # So for now we skip them.
+
+    @skip("Incomplete reg 0x00178 support")
+    def test_e1000(self):
+        self.common_test_code("e1000")
+
+    @skip("Incomplete reg 0x00178 support")
+    def test_i82550(self):
+        self.common_test_code("i82550")
-- 
2.39.2


