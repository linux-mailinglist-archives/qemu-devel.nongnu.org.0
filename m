Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F31D53AE499
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 10:13:13 +0200 (CEST)
Received: from localhost ([::1]:58846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvF3R-0004dd-2u
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 04:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lvEzF-00079A-F9
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:08:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lvEzD-0000zs-EB
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 04:08:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624262930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OzVRjO8Nx+XtUopzErXybwOFDHSS54lRPHCDfx79GJs=;
 b=CLdG0X0CvO4QG9Yd23Cz1ZciLx3j+TIFBxokQNtC5J0Y3sVK4eYZ1XhbVCCPpSnhM7nZkj
 a9oho3nLJQKp4f6pFH8gmVlH+P4jpfPJbNM9/Sg/wsvAXZb4NHXEF/lfPPQ4w6OWiwq2g3
 dsMWpX+BxbRlqkOY1C02jzX8+kBzlQo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-WIhUwMxAOCaWS2W91B_InA-1; Mon, 21 Jun 2021 04:08:49 -0400
X-MC-Unique: WIhUwMxAOCaWS2W91B_InA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A2729126B;
 Mon, 21 Jun 2021 08:08:48 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-27.ams2.redhat.com [10.36.112.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1EFD60C9F;
 Mon, 21 Jun 2021 08:08:46 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 philmd@redhat.com, crosa@redhat.com, wainersm@redhat.com, peterx@redhat.com
Subject: [PATCH v3 3/3] avocado_qemu: Add Intel iommu tests
Date: Mon, 21 Jun 2021 10:08:24 +0200
Message-Id: <20210621080824.789274-4-eric.auger@redhat.com>
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

Add Intel IOMMU functional tests based on fedora 31.
Different configs are checked:
- strict
- caching mode, strict
- passthrough.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 tests/acceptance/intel_iommu.py | 115 ++++++++++++++++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 tests/acceptance/intel_iommu.py

diff --git a/tests/acceptance/intel_iommu.py b/tests/acceptance/intel_iommu.py
new file mode 100644
index 0000000000..0b68d3c572
--- /dev/null
+++ b/tests/acceptance/intel_iommu.py
@@ -0,0 +1,115 @@
+# INTEL_IOMMU Functional tests
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
+class INTEL_IOMMU(LinuxTest):
+    """
+    :avocado: tags=arch:x86_64
+    :avocado: tags=distro:fedora
+    :avocado: tags=distro_version:31
+    :avocado: tags=machine:q35
+    :avocado: tags=accel:kvm
+    :avocado: tags=intel_iommu
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
+        self.vm.add_args('-device', 'virtio-gpu-pci' + self.IOMMU_ADDON)
+        self.vm.add_args('-drive',
+                         'file=%s,if=none,cache=writethrough,id=drv0' % path)
+
+    def setUp(self):
+        super(INTEL_IOMMU, self).setUp(None, 'virtio-net-pci' + self.IOMMU_ADDON)
+
+    def add_common_args(self):
+        self.vm.add_args('-device', 'virtio-rng-pci,rng=rng0')
+        self.vm.add_args('-object',
+                         'rng-random,id=rng0,filename=/dev/urandom')
+
+    def common_vm_setup(self, custom_kernel=None):
+        self.require_accelerator("kvm")
+        self.add_common_args()
+        self.vm.add_args("-accel", "kvm")
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
+        self.ssh_command('dmesg | grep -e DMAR -e IOMMU')
+        self.ssh_command('find /sys/kernel/iommu_groups/ -type l')
+        self.ssh_command('dnf -y install numactl-devel')
+
+    def test_intel_iommu(self):
+        """
+        :avocado: tags=intel_iommu_intremap
+        """
+
+        self.common_vm_setup(True)
+        self.vm.add_args('-device', 'intel-iommu,intremap=on')
+        self.vm.add_args('-machine', 'kernel_irqchip=split')
+
+        self.kernel_params = self.get_default_kernel_params() + ' quiet intel_iommu=on'
+        self.run_and_check()
+
+    def test_intel_iommu_strict(self):
+        """
+        :avocado: tags=intel_iommu_strict
+        """
+
+        self.common_vm_setup(True)
+        self.vm.add_args('-device', 'intel-iommu,intremap=on')
+        self.vm.add_args('-machine', 'kernel_irqchip=split')
+        self.kernel_params = self.get_default_kernel_params() + ' quiet intel_iommu=on,strict'
+        self.run_and_check()
+
+    def test_intel_iommu_strict_cm(self):
+        """
+        :avocado: tags=intel_iommu_strict_cm
+        """
+
+        self.common_vm_setup(True)
+        self.vm.add_args('-device', 'intel-iommu,intremap=on,caching-mode=on')
+        self.vm.add_args('-machine', 'kernel_irqchip=split')
+        self.kernel_params = self.get_default_kernel_params() + ' quiet intel_iommu=on,strict'
+        self.run_and_check()
+
+    def test_intel_iommu_pt(self):
+        """
+        :avocado: tags=intel_iommu_pt
+        """
+
+        self.common_vm_setup(True)
+        self.vm.add_args('-device', 'intel-iommu,intremap=on')
+        self.vm.add_args('-machine', 'kernel_irqchip=split')
+        self.kernel_params = self.get_default_kernel_params() + ' quiet intel_iommu=on iommu=pt'
+        self.run_and_check()
-- 
2.26.3


