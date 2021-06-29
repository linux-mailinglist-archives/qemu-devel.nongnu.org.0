Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0553B74B9
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 16:53:29 +0200 (CEST)
Received: from localhost ([::1]:51980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyF79-0005uI-UU
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 10:53:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lyEr0-0005Qn-Bf
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:36:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lyEqx-0005kl-H1
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:36:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624977402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d5lw1GoNgCfwNQEF6QT/q1fDKVsESxmLc6jLJ4oQyrI=;
 b=VHBvtISBqWpFYTYUCexQz2xKwoEXqdlj97hRmOqHP32WuDqX+dyFQ6aZpZ4lwgL+HOmBM1
 QcyUyCrhNPAtWTJgxB3XxbIRof4vSfD1e6oHL+kCcCZ+zVo34yG5skFw/yNcrWBELdjy2S
 wRwwKzqa9qxFGlDcYvPxTttIldXhYFU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-Qekc7fHhNXKKAmDKo7M5kQ-1; Tue, 29 Jun 2021 10:36:41 -0400
X-MC-Unique: Qekc7fHhNXKKAmDKo7M5kQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B95B5A40C2;
 Tue, 29 Jun 2021 14:36:40 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-168.ams2.redhat.com [10.36.113.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CAF9C1A26A;
 Tue, 29 Jun 2021 14:36:38 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 philmd@redhat.com, crosa@redhat.com, wainersm@redhat.com
Subject: [PATCH v4 2/4] avocado_qemu: Add SMMUv3 tests
Date: Tue, 29 Jun 2021 16:36:19 +0200
Message-Id: <20210629143621.907831-3-eric.auger@redhat.com>
In-Reply-To: <20210629143621.907831-1-eric.auger@redhat.com>
References: <20210629143621.907831-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: wrampazz@redhat.com, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add new tests checking the good behavior of the SMMUv3 protecting
2 virtio pci devices (block and net). We check the guest boots and
we are able to install a package. Different guest configs are tested:
standard, passthrough an strict=0. This is tested with both fedora 31 and
33. The former uses a 5.3 kernel without range invalidation whereas the
latter uses a 5.8 kernel that features range invalidation.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v3 -> v4:
- add tags for machine, distro in the class
- removed smp and memory overrides
- set default param value of common_vm_setup to False

v1 -> v2:
- removed ssh import
- combined add_command_args() and common_vm_setup()
- moved tags in class' docstring and added tags=arch:aarch64
- use self.get_default_kernel_params()
- added RIL tests with fed33 + introduce new tags
---
 tests/acceptance/smmu.py | 132 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)
 create mode 100644 tests/acceptance/smmu.py

diff --git a/tests/acceptance/smmu.py b/tests/acceptance/smmu.py
new file mode 100644
index 0000000000..c1d4b88e5f
--- /dev/null
+++ b/tests/acceptance/smmu.py
@@ -0,0 +1,132 @@
+# SMMUv3 Functional tests
+#
+# Copyright (c) 2021 Red Hat, Inc.
+#
+# Author:
+#  Eric Auger <eric.auger@redhat.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+import os
+
+from avocado_qemu import LinuxTest, BUILD_DIR
+
+class SMMU(LinuxTest):
+    """
+    :avocado: tags=accel:kvm
+    :avocado: tags=cpu:host
+    :avocado: tags=arch:aarch64
+    :avocado: tags=machine:virt
+    :avocado: tags=distro:fedora
+    :avocado: tags=smmu
+    """
+
+    IOMMU_ADDON = ',iommu_platform=on,disable-modern=off,disable-legacy=on'
+    kernel_path = None
+    initrd_path = None
+    kernel_params = None
+
+    def set_up_boot(self):
+        path = self.download_boot()
+        self.vm.add_args('-device', 'virtio-blk-pci,bus=pcie.0,scsi=off,' +
+                         'drive=drv0,id=virtio-disk0,bootindex=1,'
+                         'werror=stop,rerror=stop' + self.IOMMU_ADDON)
+        self.vm.add_args('-drive',
+                         'file=%s,if=none,cache=writethrough,id=drv0' % path)
+
+    def setUp(self):
+        super(SMMU, self).setUp(None, 'virtio-net-pci' + self.IOMMU_ADDON)
+
+    def common_vm_setup(self, custom_kernel=False):
+        self.require_accelerator("kvm")
+        self.vm.add_args("-accel", "kvm")
+        self.vm.add_args("-cpu", "host")
+        self.vm.add_args("-machine", "iommu=smmuv3")
+        self.vm.add_args("-d", "guest_errors")
+        self.vm.add_args('-bios', os.path.join(BUILD_DIR, 'pc-bios',
+                         'edk2-aarch64-code.fd'))
+        self.vm.add_args('-device', 'virtio-rng-pci,rng=rng0')
+        self.vm.add_args('-object',
+                         'rng-random,id=rng0,filename=/dev/urandom')
+
+        if custom_kernel is False:
+            return
+
+        kernel_url = self.get_pxeboot_url() + 'vmlinuz'
+        initrd_url = self.get_pxeboot_url() + 'initrd.img'
+        self.kernel_path = self.fetch_asset(kernel_url)
+        self.initrd_path = self.fetch_asset(initrd_url)
+
+    def run_and_check(self):
+        if self.kernel_path:
+            self.vm.add_args('-kernel', self.kernel_path,
+                             '-append', self.kernel_params,
+                             '-initrd', self.initrd_path)
+        self.launch_and_wait()
+        self.ssh_command('cat /proc/cmdline')
+        self.ssh_command('dnf -y install numactl-devel')
+
+
+    # 5.3 kernel without RIL #
+
+    def test_smmu_noril(self):
+        """
+        :avocado: tags=smmu_noril
+        :avocado: tags=smmu_noril_tests
+        :avocado: tags=distro_version:31
+        """
+        self.common_vm_setup()
+        self.run_and_check()
+
+    def test_smmu_noril_passthrough(self):
+        """
+        :avocado: tags=smmu_noril_passthrough
+        :avocado: tags=smmu_noril_tests
+        :avocado: tags=distro_version:31
+        """
+        self.common_vm_setup(True)
+        self.kernel_params = self.get_default_kernel_params() + ' iommu.passthrough=on'
+        self.run_and_check()
+
+    def test_smmu_noril_nostrict(self):
+        """
+        :avocado: tags=smmu_noril_nostrict
+        :avocado: tags=smmu_noril_tests
+        :avocado: tags=distro_version:31
+        """
+        self.common_vm_setup(True)
+        self.kernel_params = self.get_default_kernel_params() + ' iommu.strict=0'
+        self.run_and_check()
+
+    # 5.8 kernel featuring range invalidation
+    # >= v5.7 kernel
+
+    def test_smmu_ril(self):
+        """
+        :avocado: tags=smmu_ril
+        :avocado: tags=smmu_ril_tests
+        :avocado: tags=distro_version:33
+        """
+        self.common_vm_setup()
+        self.run_and_check()
+
+    def test_smmu_ril_passthrough(self):
+        """
+        :avocado: tags=smmu_ril_passthrough
+        :avocado: tags=smmu_ril_tests
+        :avocado: tags=distro_version:33
+        """
+        self.common_vm_setup(True)
+        self.kernel_params = self.get_default_kernel_params() + ' iommu.passthrough=on'
+        self.run_and_check()
+
+    def test_smmu_ril_nostrict(self):
+        """
+        :avocado: tags=smmu_ril_nostrict
+        :avocado: tags=smmu_ril_tests
+        :avocado: tags=distro_version:33
+        """
+        self.common_vm_setup(True)
+        self.kernel_params = self.get_default_kernel_params() + ' iommu.strict=0'
+        self.run_and_check()
-- 
2.26.3


