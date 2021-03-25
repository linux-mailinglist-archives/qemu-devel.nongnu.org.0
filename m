Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8760E348DA4
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 11:03:23 +0100 (CET)
Received: from localhost ([::1]:37762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPMpm-0006OX-JU
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 06:03:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lPMk9-0003Oy-Ba
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 05:57:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lPMk7-0002OG-4I
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 05:57:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616666249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wsMNYjdrdxM56O5Sg5hrltt4NbT7PBkZ7vwR0V2WjCc=;
 b=XKL1v6zE6ROjeJ8vWOHX24FPUzmeTX6UnZ8QCYK9R3t0yNvOwDdZquUeIB2wGd/Rf5o7Bn
 JoyopMwiQvuDOccVehWwfHM8AGc3X2JEfhQ9NLs2n4iBMI3STu+E2zm2oSZxyLzmJCw5+y
 JgZzhKcHH6XrsNc+S3Y5OZ22dk/gfqw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-sROWsIYDNpCf1PCS5lpy1Q-1; Thu, 25 Mar 2021 05:57:28 -0400
X-MC-Unique: sROWsIYDNpCf1PCS5lpy1Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04ED6101371E;
 Thu, 25 Mar 2021 09:57:27 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-13.ams2.redhat.com [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7632D19C71;
 Thu, 25 Mar 2021 09:57:25 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 philmd@redhat.com, crosa@redhat.com, wainersm@redhat.com
Subject: [PATCH 1/1] avocado_qemu: Add SMMUv3 tests
Date: Thu, 25 Mar 2021 10:57:12 +0100
Message-Id: <20210325095712.250262-2-eric.auger@redhat.com>
In-Reply-To: <20210325095712.250262-1-eric.auger@redhat.com>
References: <20210325095712.250262-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add new tests checking the good behavior of the SMMUv3 protecting
2 virtio pci devices (block and net). We check the guest boots and
we are able to install a package. Different guest configs are tested:
standard, passthrough an strict=0. Given the version of the guest
kernel in use (5.3.7 at this moment), range invalidation is not yet
tested. This will be handled separately.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 tests/acceptance/smmu.py | 104 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 tests/acceptance/smmu.py

diff --git a/tests/acceptance/smmu.py b/tests/acceptance/smmu.py
new file mode 100644
index 0000000000..65ecac8f1a
--- /dev/null
+++ b/tests/acceptance/smmu.py
@@ -0,0 +1,104 @@
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
+from avocado.utils import ssh
+
+class SMMU(LinuxTest):
+
+    KERNEL_COMMON_PARAMS = ("root=UUID=b6950a44-9f3c-4076-a9c2-355e8475b0a7 ro "
+                            "earlyprintk=pl011,0x9000000 ignore_loglevel "
+                            "no_timer_check printk.time=1 rd_NO_PLYMOUTH "
+                            "console=ttyAMA0 ")
+    IOMMU_ADDON = ',iommu_platform=on,disable-modern=off,disable-legacy=on'
+    IMAGE = ("https://archives.fedoraproject.org/pub/archive/fedora/"
+             "linux/releases/31/Everything/aarch64/os/images/pxeboot/")
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
+    def add_common_args(self):
+        self.vm.add_args("-machine", "virt")
+        self.vm.add_args('-bios', os.path.join(BUILD_DIR, 'pc-bios',
+                                      'edk2-aarch64-code.fd'))
+        self.vm.add_args('-device', 'virtio-rng-pci,rng=rng0')
+        self.vm.add_args('-object',
+                         'rng-random,id=rng0,filename=/dev/urandom')
+
+    def common_vm_setup(self, custom_kernel=None):
+        self.require_accelerator("kvm")
+        self.add_common_args()
+        self.vm.add_args("-accel", "kvm")
+        self.vm.add_args("-cpu", "host")
+        self.vm.add_args("-machine", "iommu=smmuv3")
+
+        if custom_kernel is None:
+            return
+
+        kernel_url = self.IMAGE + 'vmlinuz'
+        initrd_url = self.IMAGE + 'initrd.img'
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
+    def test_smmu(self):
+        """
+        :avocado: tags=accel:kvm
+        :avocado: tags=cpu:host
+        :avocado: tags=smmu
+        """
+
+        self.common_vm_setup()
+        self.run_and_check()
+
+    def test_smmu_passthrough(self):
+        """
+        :avocado: tags=accel:kvm
+        :avocado: tags=cpu:host
+        :avocado: tags=smmu
+        """
+        self.common_vm_setup(True)
+
+        self.kernel_params = self.KERNEL_COMMON_PARAMS + 'iommu.passthrough=on'
+
+        self.run_and_check()
+
+    def test_smmu_nostrict(self):
+        """
+        :avocado: tags=accel:kvm
+        :avocado: tags=cpu:host
+        :avocado: tags=smmu
+        """
+        self.common_vm_setup(True)
+
+        self.kernel_params = self.KERNEL_COMMON_PARAMS + 'iommu.strict=0'
+
+        self.run_and_check()
-- 
2.26.2


