Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B6C3AE492
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 10:10:40 +0200 (CEST)
Received: from localhost ([::1]:53466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvF0x-0000uE-Tl
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 04:10:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lvEzD-00073a-Cf
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:08:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lvEzB-0000xr-9t
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:08:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624262928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sl5IM3JcF5e310W4L+gwHgv6Za1BAPYcoJRNKSOE8Wo=;
 b=i5BFJtpiqpNhIr83xul43S9CfjLgIx+Uhewyo5vWWLworjiP057ijF5JypQFQRDA/bocNM
 /Qvfrgk6CWVUXn8BFioU7sPJ+lO66Y3w/10+6f2DR59/HishSGNesuiS5TiPZmoiUenZb0
 2n4W9iPekjLkH94DKC6gQMKyT2to8JQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-NR7tEeL2NNqaqcNUqxh0KQ-1; Mon, 21 Jun 2021 04:08:47 -0400
X-MC-Unique: NR7tEeL2NNqaqcNUqxh0KQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 385B6100CEC9;
 Mon, 21 Jun 2021 08:08:46 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-27.ams2.redhat.com [10.36.112.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E35460C9F;
 Mon, 21 Jun 2021 08:08:43 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 philmd@redhat.com, crosa@redhat.com, wainersm@redhat.com, peterx@redhat.com
Subject: [PATCH v3 2/3] avocado_qemu: Add SMMUv3 tests
Date: Mon, 21 Jun 2021 10:08:23 +0200
Message-Id: <20210621080824.789274-3-eric.auger@redhat.com>
In-Reply-To: <20210621080824.789274-1-eric.auger@redhat.com>
References: <20210621080824.789274-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

v1 -> v2:
- removed ssh import
- combined add_command_args() and common_vm_setup()
- moved tags in class' docstring and added tags=arch:aarch64
- use self.get_default_kernel_params()
- added RIL tests with fed33 + introduce new tags
---
 tests/acceptance/smmu.py | 133 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 133 insertions(+)
 create mode 100644 tests/acceptance/smmu.py

diff --git a/tests/acceptance/smmu.py b/tests/acceptance/smmu.py
new file mode 100644
index 0000000000..bcb5416a56
--- /dev/null
+++ b/tests/acceptance/smmu.py
@@ -0,0 +1,133 @@
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
+    def common_vm_setup(self, custom_kernel=None):
+        self.require_accelerator("kvm")
+        self.vm.add_args("-machine", "virt")
+        self.vm.add_args("-accel", "kvm")
+        self.vm.add_args("-cpu", "host")
+        self.vm.add_args("-smp", "8")
+        self.vm.add_args("-m", "4096")
+        self.vm.add_args("-machine", "iommu=smmuv3")
+        self.vm.add_args("-d", "guest_errors")
+        self.vm.add_args('-bios', os.path.join(BUILD_DIR, 'pc-bios',
+                         'edk2-aarch64-code.fd'))
+        self.vm.add_args('-device', 'virtio-rng-pci,rng=rng0')
+        self.vm.add_args('-object',
+                         'rng-random,id=rng0,filename=/dev/urandom')
+
+        if custom_kernel is None:
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


