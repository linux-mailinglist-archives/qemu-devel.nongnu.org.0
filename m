Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB4A6A9795
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 13:52:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY4sx-0007wC-GE; Fri, 03 Mar 2023 07:51:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+c2a260b7edcf36afa963+7131+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pY4st-0007vZ-MA
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 07:51:39 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+c2a260b7edcf36afa963+7131+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pY4sr-0000VH-IG
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 07:51:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-ID:Content-Description;
 bh=yZoV4E9jMGtk4Hfp0MK1HhStYmqar/waJ9gJZtOoYCw=; b=CAdNXNOL+XKPnMMCQs5Iq57vhH
 KkXwLNGXlB4TfYp9QoCmaMdHgp6QoMbUSh3s+5vek9JRxeCWnbRExHI3dI17fAEVid36saKdH/yZX
 qrOGuHx1JLijE9oexVpHsoqB+4fyXKEA2oMPlshzi3JIP85/mhU7chzKkjbz1tHbcTm2tWfcmPtMm
 yCZJEbL2t6mV7pa0UkfDnrWSiu+aFl9IDt5otEy7lAFEt8MxxnLVhabWw53UbKl70EGA/zhcPJrk2
 2tXApal9nH8EaKgr784CVQElwtq0QfdUOGZC1yuqomkgLi00Gp1vTjAwzMU72IpYcm1iMfp42Oxwg
 bALYH+nA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pY4si-00388E-EQ; Fri, 03 Mar 2023 12:51:29 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pY4sh-005KMe-2I; Fri, 03 Mar 2023 12:51:27 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>
Subject: [PATCH 2/2] tests/avocado: Test Xen guest support under KVM
Date: Fri,  3 Mar 2023 12:51:26 +0000
Message-Id: <20230303125126.1269861-3-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230303125126.1269861-1-dwmw2@infradead.org>
References: <20230303125126.1269861-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+c2a260b7edcf36afa963+7131+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 tests/avocado/xen_guest.py | 113 +++++++++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100644 tests/avocado/xen_guest.py

diff --git a/tests/avocado/xen_guest.py b/tests/avocado/xen_guest.py
new file mode 100644
index 0000000000..111ef3ca08
--- /dev/null
+++ b/tests/avocado/xen_guest.py
@@ -0,0 +1,113 @@
+# Xen guest functional tests
+#
+# Copyright © 2021 Red Hat, Inc.
+# Copyright © 2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
+#
+# Author:
+#  David Woodhouse <dwmw2@infradead.org>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+import os
+
+from avocado import skipIf
+from avocado_qemu import LinuxTest
+
+@skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
+class XenGuest(LinuxTest):
+    """
+    :avocado: tags=arch:x86_64
+    :avocado: tags=distro:fedora
+    :avocado: tags=distro_version:34
+    :avocado: tags=machine:q35
+    :avocado: tags=accel:kvm
+    :avocado: tags=xen_guest
+    """
+
+    kernel_path = None
+    initrd_path = None
+    kernel_params = None
+
+    def set_up_boot(self):
+        path = self.download_boot()
+        self.vm.add_args('-drive', 'file=%s,if=none,id=drv0' % path)
+        if False: # Soon...
+            self.vm.add_args('-device', 'xen-disk,drive=drv0,vdev=xvda')
+        else:
+            self.vm.add_args('-device', 'ahci,id=ahci')
+            self.vm.add_args('-device', 'ide-hd,drive=drv0,bus=ahci.0')
+
+    def setUp(self):
+        super(XenGuest, self).setUp(None, 'virtio-net-pci')
+
+    def common_vm_setup(self, custom_kernel=None):
+        self.require_accelerator("kvm")
+        self.vm.add_args("-accel", "kvm,xen-version=0x4000a,kernel-irqchip=split")
+
+        if custom_kernel is None:
+            return
+
+        kernel_url = self.distro.pxeboot_url + 'vmlinuz'
+        initrd_url = self.distro.pxeboot_url + 'initrd.img'
+        self.kernel_path = self.fetch_asset(kernel_url, algorithm='sha256',
+                                            asset_hash=self.distro.kernel_hash)
+        self.initrd_path = self.fetch_asset(initrd_url, algorithm='sha256',
+                                            asset_hash=self.distro.initrd_hash)
+
+    def run_and_check(self):
+        if self.kernel_path:
+            self.vm.add_args('-kernel', self.kernel_path,
+                             '-append', self.kernel_params,
+                             '-initrd', self.initrd_path)
+        self.launch_and_wait()
+        self.ssh_command('cat /proc/cmdline')
+        self.ssh_command('dmesg | grep -e "Grant table initialized"')
+
+    def test_xen_guest(self):
+        """
+        :avocado: tags=xen_guest
+        """
+
+        self.common_vm_setup(True)
+
+        self.kernel_params = (self.distro.default_kernel_params +
+                              ' xen_emul_unplug=ide-disks')
+        self.run_and_check()
+        self.ssh_command('grep xen-pirq.*msi /proc/interrupts')
+
+    def test_xen_guest_vapic(self):
+        """
+        :avocado: tags=xen_guest_vapic
+        """
+
+        self.common_vm_setup(True)
+        self.vm.add_args('-cpu', 'host,+xen-vapic')
+        self.kernel_params = (self.distro.default_kernel_params +
+                              ' xen_emul_unplug=ide-disks')
+        self.run_and_check()
+        self.ssh_command('grep xen-pirq /proc/interrupts')
+        self.ssh_command('grep PCI-MSI /proc/interrupts')
+
+    def test_xen_guest_novector(self):
+        """
+        :avocado: tags=xen_guest_novector
+        """
+
+        self.common_vm_setup(True)
+        self.kernel_params = (self.distro.default_kernel_params +
+                              ' xen_emul_unplug=ide-disks' +
+                              ' xen_no_vector_callback')
+        self.run_and_check()
+        self.ssh_command('grep xen-platform-pci /proc/interrupts')
+
+    def test_xen_guest_novector_noapic(self):
+        """
+        :avocado: tags=xen_guest_novector_noapic
+        """
+
+        self.common_vm_setup(True)
+        self.kernel_params = (self.distro.default_kernel_params +
+                              ' xen_emul_unplug=ide-disks' +
+                              ' xen_no_vector_callback noapic')
+        self.run_and_check()
+        self.ssh_command('grep xen-platform-pci /proc/interrupts')
-- 
2.39.0


