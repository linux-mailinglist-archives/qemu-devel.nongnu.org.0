Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCFA6D4635
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 15:51:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjKYx-00032h-TF; Mon, 03 Apr 2023 09:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pjKYt-0002zI-JW
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 09:49:31 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pjKYp-0004wd-7V
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 09:49:31 -0400
Received: by mail-wr1-x42f.google.com with SMTP id r29so29388123wra.13
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 06:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680529766;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vKaHaFlstk5VQMLZ9VjcumTBmG2FDADA92zKOBfHglo=;
 b=c4D5FAHNNne6aHzgXm5PKvuQrV0KwTkfjJrPgEUCbjhxQtZdGE6JVakoULkhd4i0Jp
 KQ44SWWS+vuj0c/x1WHBgAJVF0VkrLqxVfK+GJjHs7Vea8fmVUlRf1Ue5TAdeVnp9KRt
 HyiaBIFGGqVpXbqVvGqeMubwlUqQNCZtGvzXPLyTiBafiVbmJ5rk5FMteRW5UZpVxlOP
 Coe1KPAvwVYf9gfUKbXzQm/PUx95STeBTH+X/m9TYt0ik4ltlVpmOHols2Q8yhqBI2oc
 T7M2Qg9KeZKsqn6T1nFy3QM0dtzikm8kUK4amICoZQ+Ulw9BczaCvvd3MmZdonHSCx4j
 3oXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680529766;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vKaHaFlstk5VQMLZ9VjcumTBmG2FDADA92zKOBfHglo=;
 b=smpzb6t8JZUUp3WAjEPBR5KCOB9oSRFmhPEN8pE3tgLKpHErKX1Uw9K59qaoITmWik
 gh/a0EwJBTMzb4/q3skBTSTp171CA4kj+Hwbvo/Qa2tMfv23hGzXKqJrIfjichn2w454
 gBRF94KVfU/hlPB9/G5+YGwbd/NDKa1p3SsGCPeCTEus/QZtMedk68b+0PUwsl7P/La3
 iLfDi7KK1DwqjqxPsvjafLY68Lp0wN3WnkMr0roPQCJruPfIrkATiNV4gYkUSWKuIQgw
 1zHAEp8hoMNPzCrLjo8773SsfTL8L9EzsOkL0EU+/5nTPMHRkW8JhAp/KwUDRdeEjbqi
 1nmw==
X-Gm-Message-State: AAQBX9c28NgHr8sXIB/y5++dC2UfELlkFlvgePaVLzmXBEXykH39AVUo
 kkMMKeyNDf4k7yIwEMZQ+9QaNw==
X-Google-Smtp-Source: AKy350Ydv65QkkABiTX0HooAnoZ65jAKnxHGHWOofsFjIU4hIEUqi5s3uitbO13gUcAIrUZq7sRtTA==
X-Received: by 2002:a05:6000:ca:b0:2d6:5afe:7b91 with SMTP id
 q10-20020a05600000ca00b002d65afe7b91mr12487847wrx.30.1680529765861; 
 Mon, 03 Apr 2023 06:49:25 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 j8-20020adfe508000000b002cfe71153b4sm9696735wrm.60.2023.04.03.06.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 06:49:23 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C43841FFB8;
 Mon,  3 Apr 2023 14:49:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, kvm@vger.kernel.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH v2 11/11] tests/avocado: Test Xen guest support under KVM
Date: Mon,  3 Apr 2023 14:49:20 +0100
Message-Id: <20230403134920.2132362-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403134920.2132362-1-alex.bennee@linaro.org>
References: <20230403134920.2132362-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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

From: David Woodhouse <dwmw@amazon.co.uk>

Exercise guests with a few different modes for interrupt delivery. In
particular we want to cover:

 • Xen event channel delivery via GSI to the I/O APIC
 • Xen event channel delivery via GSI to the i8259 PIC
 • MSIs routed to PIRQ event channels
 • GSIs routed to PIRQ event channels

As well as some variants of normal non-Xen stuff like MSI to vAPIC and
PCI INTx going to the I/O APIC and PIC, which ought to still work even
in Xen mode.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230324160719.1790792-1-alex.bennee@linaro.org>

---
v2
  - catch fail to launch and skip on lack of support
---
 tests/avocado/kvm_xen_guest.py | 170 +++++++++++++++++++++++++++++++++
 1 file changed, 170 insertions(+)
 create mode 100644 tests/avocado/kvm_xen_guest.py

diff --git a/tests/avocado/kvm_xen_guest.py b/tests/avocado/kvm_xen_guest.py
new file mode 100644
index 0000000000..112c955976
--- /dev/null
+++ b/tests/avocado/kvm_xen_guest.py
@@ -0,0 +1,170 @@
+# KVM Xen guest functional tests
+#
+# Copyright © 2021 Red Hat, Inc.
+# Copyright © 2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
+#
+# Author:
+#  David Woodhouse <dwmw2@infradead.org>
+#  Alex Bennée <alex.bennee@linaro.org>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import os
+
+from qemu.machine import machine
+
+from avocado_qemu import LinuxSSHMixIn
+from avocado_qemu import QemuSystemTest
+from avocado_qemu import wait_for_console_pattern
+
+class KVMXenGuest(QemuSystemTest, LinuxSSHMixIn):
+    """
+    :avocado: tags=arch:x86_64
+    :avocado: tags=machine:q35
+    :avocado: tags=accel:kvm
+    :avocado: tags=kvm_xen_guest
+    """
+
+    KERNEL_DEFAULT = 'printk.time=0 root=/dev/xvda console=ttyS0'
+
+    kernel_path = None
+    kernel_params = None
+
+    # Fetch assets from the kvm-xen-guest subdir of my shared test
+    # images directory on fileserver.linaro.org where you can find
+    # build instructions for how they where assembled.
+    def get_asset(self, name, sha1):
+        base_url = ('https://fileserver.linaro.org/s/'
+                    'kE4nCFLdQcoBF9t/download?'
+                    'path=%2Fkvm-xen-guest&files=' )
+        url = base_url + name
+        # use explicit name rather than failing to neatly parse the
+        # URL into a unique one
+        return self.fetch_asset(name=name, locations=(url), asset_hash=sha1)
+
+    def common_vm_setup(self):
+        # We also catch lack of KVM_XEN support if we fail to launch
+        self.require_accelerator("kvm")
+
+        self.vm.set_console()
+
+        self.vm.add_args("-accel", "kvm,xen-version=0x4000a,kernel-irqchip=split")
+        self.vm.add_args("-smp", "2")
+
+        self.kernel_path = self.get_asset("bzImage",
+                                          "367962983d0d32109998a70b45dcee4672d0b045")
+        self.rootfs = self.get_asset("rootfs.ext4",
+                                     "f1478401ea4b3fa2ea196396be44315bab2bb5e4")
+
+    def run_and_check(self):
+        self.vm.add_args('-kernel', self.kernel_path,
+                         '-append', self.kernel_params,
+                         '-drive',  f"file={self.rootfs},if=none,format=raw,id=drv0",
+                         '-device', 'xen-disk,drive=drv0,vdev=xvda',
+                         '-device', 'virtio-net-pci,netdev=unet',
+                         '-netdev', 'user,id=unet,hostfwd=:127.0.0.1:0-:22')
+
+        try:
+            self.vm.launch()
+        except machine.VMLaunchFailure as e:
+            if "Xen HVM guest support not present" in e.output:
+                self.cancel("KVM Xen support is not present (need v5.12+ kernel with CONFIG_KVM_XEN)")
+            elif "Property 'kvm-accel.xen-version' not found" in e.output:
+                self.cancel("QEMU not built with CONFIG_XEN_EMU support")
+            else:
+                raise e
+
+        self.log.info('VM launched, waiting for sshd')
+        console_pattern = 'Starting dropbear sshd: OK'
+        wait_for_console_pattern(self, console_pattern, 'Oops')
+        self.log.info('sshd ready')
+        self.ssh_connect('root', '', False)
+
+        self.ssh_command('cat /proc/cmdline')
+        self.ssh_command('dmesg | grep -e "Grant table initialized"')
+
+    def test_kvm_xen_guest(self):
+        """
+        :avocado: tags=kvm_xen_guest
+        """
+
+        self.common_vm_setup()
+
+        self.kernel_params = (self.KERNEL_DEFAULT +
+                              ' xen_emul_unplug=ide-disks')
+        self.run_and_check()
+        self.ssh_command('grep xen-pirq.*msi /proc/interrupts')
+
+    def test_kvm_xen_guest_nomsi(self):
+        """
+        :avocado: tags=kvm_xen_guest_nomsi
+        """
+
+        self.common_vm_setup()
+
+        self.kernel_params = (self.KERNEL_DEFAULT +
+                              ' xen_emul_unplug=ide-disks pci=nomsi')
+        self.run_and_check()
+        self.ssh_command('grep xen-pirq.* /proc/interrupts')
+
+    def test_kvm_xen_guest_noapic_nomsi(self):
+        """
+        :avocado: tags=kvm_xen_guest_noapic_nomsi
+        """
+
+        self.common_vm_setup()
+
+        self.kernel_params = (self.KERNEL_DEFAULT +
+                              ' xen_emul_unplug=ide-disks noapic pci=nomsi')
+        self.run_and_check()
+        self.ssh_command('grep xen-pirq /proc/interrupts')
+
+    def test_kvm_xen_guest_vapic(self):
+        """
+        :avocado: tags=kvm_xen_guest_vapic
+        """
+
+        self.common_vm_setup()
+        self.vm.add_args('-cpu', 'host,+xen-vapic')
+        self.kernel_params = (self.KERNEL_DEFAULT +
+                              ' xen_emul_unplug=ide-disks')
+        self.run_and_check()
+        self.ssh_command('grep xen-pirq /proc/interrupts')
+        self.ssh_command('grep PCI-MSI /proc/interrupts')
+
+    def test_kvm_xen_guest_novector(self):
+        """
+        :avocado: tags=kvm_xen_guest_novector
+        """
+
+        self.common_vm_setup()
+        self.kernel_params = (self.KERNEL_DEFAULT +
+                              ' xen_emul_unplug=ide-disks' +
+                              ' xen_no_vector_callback')
+        self.run_and_check()
+        self.ssh_command('grep xen-platform-pci /proc/interrupts')
+
+    def test_kvm_xen_guest_novector_nomsi(self):
+        """
+        :avocado: tags=kvm_xen_guest_novector_nomsi
+        """
+
+        self.common_vm_setup()
+
+        self.kernel_params = (self.KERNEL_DEFAULT +
+                              ' xen_emul_unplug=ide-disks pci=nomsi' +
+                              ' xen_no_vector_callback')
+        self.run_and_check()
+        self.ssh_command('grep xen-platform-pci /proc/interrupts')
+
+    def test_kvm_xen_guest_novector_noapic(self):
+        """
+        :avocado: tags=kvm_xen_guest_novector_noapic
+        """
+
+        self.common_vm_setup()
+        self.kernel_params = (self.KERNEL_DEFAULT +
+                              ' xen_emul_unplug=ide-disks' +
+                              ' xen_no_vector_callback noapic')
+        self.run_and_check()
+        self.ssh_command('grep xen-platform-pci /proc/interrupts')
-- 
2.39.2


