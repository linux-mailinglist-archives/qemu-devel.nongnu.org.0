Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52ECA6C4EB2
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 15:57:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pezsP-0005Fe-Tw; Wed, 22 Mar 2023 10:55:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pezsN-0005F2-Dj
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:55:43 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pezsL-0001Ly-4c
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:55:43 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 m6-20020a05600c3b0600b003ee6e324b19so915226wms.1
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 07:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679496939;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YjjLazjLkhQef6Cz6z1LAJP3+qOKbVPJ/nFWI3CqyQQ=;
 b=igqcEHTYZYB17E0/BfbDD5f0pHE8pGTDyAzYwvx/Z+7rSTgyikwHEPSq0uzpvuzVjb
 rlaAicbkmdlMjtjzZiVAuZcm4xxkWqOtoKJFKg1zXZvSvuD+65zjF0ojlZlqCvaZp9Xd
 k77nPxgv7yQP9c+CYAYVpJ6VR95i6PvHWwf0iqFPuuVKQqqtn2l1/+8QyeuksqPOjdhC
 BprxoFlJdoET7ghi9UEaBe3ZD654IbESLuHIKB+uXBGSGdaEQmXTEUnsGN9Nb6ICwRpN
 hhfmY1C3bBd/S/i6cPwaHzzHjhaJ1KQHgmXgasliCH7pZwRDR6yWo7gF6cOw2EgH0iz/
 Xesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679496939;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YjjLazjLkhQef6Cz6z1LAJP3+qOKbVPJ/nFWI3CqyQQ=;
 b=AuoL3EzH2QKB0+/+c0ZPCHRTHMXstvoKhjrsUkuxJ+E1Zy7HdAOjeZ2+6Hl1yxcBze
 mMQ19e6CSQU2kduTw3DbRcCzaISHAv8oDHy+Xh0pVc+LOvBkNYsn2wEQx9BX5f2EawPs
 senxWUtONks5Yfnmjb0VjOm6TRE82gJ7HkBjJcqep4v4i8qQdidEOKyDC1YeTU+ZItcw
 Mq494PbITb0RoYRRNDx+r0u4ZzHKZA4xdecjR5Iq/sQIGYDfXlW+8cFH875C56jQp1DN
 3AzWde5mlCIBuwxywXD67G0LNxm5tx9o6+5C1uSjm9+hLWQD9FE3osPreFl9rYt+2AOD
 92ew==
X-Gm-Message-State: AO0yUKVtkZHbX9uWIUMk079wCWxd5kqI2by3kxPrm26I14eywZKxmtxv
 hLcKuoe7HGX+kcU5AbC4ej8ZJA==
X-Google-Smtp-Source: AK7set/MFca2lpskx1Hm3p3uGL2Fi0E55LlhIT2sorI/xsQlxh80hRmN4zikVEoTzqe6jyrKKCCBVQ==
X-Received: by 2002:a05:600c:258:b0:3ee:95c:b73e with SMTP id
 24-20020a05600c025800b003ee095cb73emr5298542wmj.24.1679496939010; 
 Wed, 22 Mar 2023 07:55:39 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a05600c198e00b003eda46d6792sm14776651wmq.32.2023.03.22.07.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 07:55:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 298731FFB7;
 Wed, 22 Mar 2023 14:55:38 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v2] tests/avocado: re-factor igb test to avoid timeouts
Date: Wed, 22 Mar 2023 14:55:29 +0000
Message-Id: <20230322145529.4079753-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>

---
v2
  - use squashfs instead of largely empty ext4 device
  - use read-only cdrom
  - don't bother with login favour of direct call from init
  - kill VM once test is passed
  - add explicit kvm option
  - add tags for device type
---
 tests/avocado/igb.py            |  38 -----------
 tests/avocado/netdev-ethtool.py | 116 ++++++++++++++++++++++++++++++++
 2 files changed, 116 insertions(+), 38 deletions(-)
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
index 0000000000..f7e9464184
--- /dev/null
+++ b/tests/avocado/netdev-ethtool.py
@@ -0,0 +1,116 @@
+# ethtool tests for emulated network devices
+#
+# This test leverages ethtool's --test sequence to validate network
+# device behaviour.
+#
+# SPDX-License-Identifier: GPL-2.0-or-late
+
+from avocado import skip
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
+    # Runs in about 17s under KVM, 19s under TCG, 25s under GCOV
+    timeout = 45
+
+    # Fetch assets from the netdev-ethtool subdir of my shared test
+    # images directory on fileserver.linaro.org.
+    def get_asset(self, name, sha1):
+        base_url = ('https://fileserver.linaro.org/s/'
+                    'kE4nCFLdQcoBF9t/download?'
+                    'path=%2Fnetdev-ethtool&files=' )
+        url = base_url + name
+        # use explicit name rather than failing to neatly parse the
+        # URL into a unique one
+        return self.fetch_asset(name=name, locations=(url), asset_hash=sha1)
+
+    def common_test_code(self, netdev, extra_args=None, kvm=False):
+
+        # This custom kernel has drivers for all the supported network
+        # devices we can emulate in QEMU
+        kernel = self.get_asset("bzImage",
+                                "33469d7802732d5815226166581442395cb289e2")
+
+        rootfs = self.get_asset("rootfs.squashfs",
+                                "9793cea7021414ae844bda51f558bd6565b50cdc")
+
+        append = 'printk.time=0 console=ttyS0 '
+        append += 'root=/dev/sr0 rootfstype=squashfs '
+
+        # any additional kernel tweaks for the test
+        if extra_args:
+            append += extra_args
+
+        # finally invoke ethtool directly
+        append += ' init=/usr/sbin/ethtool -- -t eth1 offline'
+
+        # add the rootfs via a readonly cdrom image
+        drive = f"file={rootfs},if=ide,index=0,media=cdrom"
+
+        self.vm.add_args('-kernel', kernel,
+                         '-append', append,
+                         '-drive', drive,
+                         '-device', netdev)
+
+        if kvm:
+            self.vm.add_args('-accel', 'kvm')
+
+        self.vm.set_console(console_index=0)
+        self.vm.launch()
+
+        wait_for_console_pattern(self,
+                                 "The test result is PASS",
+                                 "The test result is FAIL",
+                                 vm=None)
+        # no need to gracefully shutdown, just finish
+        self.vm.kill()
+
+    # Skip testing for MSI for now. Allegedly it was fixed by:
+    #   28e96556ba (igb: Allocate MSI-X vector when testing)
+    # but I'm seeing oops in the kernel
+    @skip("Kernel bug with MSI enabled")
+    def test_igb(self):
+        """
+        :avocado: tags=device:igb
+        """
+        self.common_test_code("igb")
+
+    def test_igb_nomsi(self):
+        """
+        :avocado: tags=device:igb
+        """
+        self.common_test_code("igb", "pci=nomsi")
+
+    def test_igb_nomsi_kvm(self):
+        """
+        :avocado: tags=device:igb
+        """
+        self.require_accelerator('kvm')
+        self.common_test_code("igb", "pci=nomsi", True)
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
+        """
+        :avocado: tags=device:e1000
+        """
+        self.common_test_code("e1000")
+
+    @skip("Incomplete reg 0x00178 support")
+    def test_i82550(self):
+        """
+        :avocado: tags=device:i82550
+        """
+        self.common_test_code("i82550")
-- 
2.39.2


