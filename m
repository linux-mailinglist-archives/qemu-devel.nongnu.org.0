Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB076C8223
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 17:08:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfjxH-0003fr-C4; Fri, 24 Mar 2023 12:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pfjx8-0003Kw-9l
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 12:07:42 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pfjx2-0003sl-DD
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 12:07:40 -0400
Received: by mail-wr1-x42c.google.com with SMTP id r29so2320141wra.13
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 09:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679674053;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lUDdiwAuIPFKcvA70Pl7E1sK8+JHbzowZ6cZGusJm8g=;
 b=E1+S/wYUQ2SQDq/rSTN/JDr0A7vS7FLITKgGwacGROv3tYOiwc9NYsBmaS+gE7aGI+
 rGz83YIeGBI8X+epKBJI7juU1drVXq356yM7RIeyXG9TY7FmFdZmavFbhKuBde0LUPjH
 IYTYKFQIbGEjMLfI+yUNTdJ4YbM4BYfazpbhD0VOXeP0qrcts/BJRG6AWHV36zZJWWV/
 /yvO+rYrcwRqoy+bQWUZ8GjhVtvYTd8ZdCM99pOWbRioMdYUqBqiUsTRPzczKykHZxXu
 w727zIWxKHYdlAx6QqEemhdABTf7pQotN/UphirB2wFVk43hoEuIl04e2RlSZtC2JVHJ
 L4gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679674053;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lUDdiwAuIPFKcvA70Pl7E1sK8+JHbzowZ6cZGusJm8g=;
 b=dTtaW6g7RTLwdoRLwLX8FjvDmTv35qln8TYtrprRluEJDWW7UDzAYERWT6yEIoLWJV
 sbDaRuewttzRcX/6qKCR2nrlgl409YbbFoanVf9q4V1tkgDpAaBx0K3f89V2MMzXZSfB
 6rU2/KHK9MMiXto48gjDC+0vtzyyRVB+imP78QBORr07GzQfV9c3Aoj1+o+eWiWuWAtH
 d6DJ0nGvXeII/2eG4JJHvdIUOE4sS5TBjbSzQUYM+TJCKejEdYInse7Q1UAYdo4mabMA
 wiiVj69aZYIo0cPUR/zNQ2d2iR8/CCUoqvzydwUHHhM5hvuU0LVT/1OFKrI7teOgLAYj
 px4g==
X-Gm-Message-State: AAQBX9e27urQADbq3Gv7ugHRutcs4MiP8Ba/fD/b3gao+/Qq5OL4LO4j
 pLwmz+ARJ2VBnIVAk6N5/Cdtsw==
X-Google-Smtp-Source: AKy350bBAXOEsJD8rotVsR6h9fuErP32PI6BYgQjoZEU+S/FLQK9KnxkdKq5CgZZzHaUrzuKpDAfdg==
X-Received: by 2002:a5d:6284:0:b0:2d4:493c:81ad with SMTP id
 k4-20020a5d6284000000b002d4493c81admr2474756wru.5.1679674053400; 
 Fri, 24 Mar 2023 09:07:33 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 m15-20020a05600c3b0f00b003ee91eda67bsm231739wms.12.2023.03.24.09.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 09:07:33 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A26D01FFB7;
 Fri, 24 Mar 2023 16:07:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org (open list:Overall KVM CPUs)
Subject: [RFC PATCH] tests/avocado: Test Xen guest support under KVM
Date: Fri, 24 Mar 2023 16:07:19 +0000
Message-Id: <20230324160719.1790792-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

---
v2 (ajb)
  - switch to plain QemuSystemTest + LinuxSSHMixIn
  - switch from fedora to custom kernel and buildroot
  - removed some unused code
TODO:
  - properly probe for host support to skip test
---
 tests/avocado/kvm_xen_guest.py | 160 +++++++++++++++++++++++++++++++++
 1 file changed, 160 insertions(+)
 create mode 100644 tests/avocado/kvm_xen_guest.py

diff --git a/tests/avocado/kvm_xen_guest.py b/tests/avocado/kvm_xen_guest.py
new file mode 100644
index 0000000000..1b4524d31c
--- /dev/null
+++ b/tests/avocado/kvm_xen_guest.py
@@ -0,0 +1,160 @@
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
+
+        # TODO: we also need to check host kernel version/support
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
+                         '-drive',  f"file={self.rootfs},if=none,id=drv0",
+                         '-device', 'xen-disk,drive=drv0,vdev=xvda',
+                         '-device', 'virtio-net-pci,netdev=unet',
+                         '-netdev', 'user,id=unet,hostfwd=:127.0.0.1:0-:22')
+
+        self.vm.launch()
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


