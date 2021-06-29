Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5930A3B7481
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 16:39:37 +0200 (CEST)
Received: from localhost ([::1]:47798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyEtk-0000Fx-Ba
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 10:39:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lyErH-0005tw-EP
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:37:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lyErE-0005xj-T4
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:37:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624977420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=90bMUDHfRx0nUmR8VUcVOuXiGBm4PqO3Az3udISJmM8=;
 b=K2XuG8+H4KcrTs/1uoMFNoz23EoFOYUqWmn1BxAtHTusKZr4WRIZZMk4frVG4F4FgXMMWV
 +/+f/QVYAnUw8qtdmyvaOLkCO2Jh3xmBf1/5/HfDd17RIfZI++YJJqIOP/dXfwBa2/P68O
 H7j0/vom1pnG1mnDmjRI3CdjzrOeHLE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-kOVVPP4sPfSxPUnPLKdtqA-1; Tue, 29 Jun 2021 10:36:56 -0400
X-MC-Unique: kOVVPP4sPfSxPUnPLKdtqA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 814511922960;
 Tue, 29 Jun 2021 14:36:55 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-168.ams2.redhat.com [10.36.113.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 692AC163C6;
 Tue, 29 Jun 2021 14:36:43 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 philmd@redhat.com, crosa@redhat.com, wainersm@redhat.com
Subject: [PATCH v4 4/4] avocado_qemu: Fix KNOWN_DISTROS map into the
 LinuxDistro class
Date: Tue, 29 Jun 2021 16:36:21 +0200
Message-Id: <20210629143621.907831-5-eric.auger@redhat.com>
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

From: Wainer dos Santos Moschetta <wainersm@redhat.com>

As the KNOWN_DISTROS grows, more loosely methods will be created in
the avocado_qemu/__init__.py file.

Let's refactor the code so that KNOWN_DISTROS and related methods are
packaged in a class

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

[Eric] rebase and add commit message
---
 tests/acceptance/avocado_qemu/__init__.py | 160 +++++++++++-----------
 tests/acceptance/intel_iommu.py           |  12 +-
 tests/acceptance/smmu.py                  |  12 +-
 3 files changed, 94 insertions(+), 90 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 64e9c1952d..00eb0bfcc8 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -299,72 +299,86 @@ def ssh_command(self, command):
                          f'Guest command failed: {command}')
         return stdout_lines, stderr_lines
 
+class LinuxDistro:
+    """Represents a Linux distribution
 
-#: A collection of known distros and their respective image checksum
-KNOWN_DISTROS = {
-    'fedora': {
-        '31': {
-            'x86_64':
-            {'checksum': 'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0',
-             'pxeboot_url': "https://archives.fedoraproject.org/pub/archive/fedora/"
-                            "linux/releases/31/Everything/x86_64/os/images/pxeboot/",
-             'kernel_params': "root=UUID=b1438b9b-2cab-4065-a99a-08a96687f73c ro "
+    Holds information of known distros.
+    """
+    #: A collection of known distros and their respective image checksum
+    KNOWN_DISTROS = {
+        'fedora': {
+            '31': {
+                'x86_64':
+                {'checksum': 'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0',
+                'pxeboot_url': "https://archives.fedoraproject.org/pub/archive/fedora/"
+                               "linux/releases/31/Everything/x86_64/os/images/pxeboot/",
+                'kernel_params': "root=UUID=b1438b9b-2cab-4065-a99a-08a96687f73c ro "
                               "no_timer_check net.ifnames=0 "
                               "console=tty1 console=ttyS0,115200n8"},
-            'aarch64':
-            {'checksum': '1e18d9c0cf734940c4b5d5ec592facaed2af0ad0329383d5639c997fdf16fe49',
-             'pxeboot_url': "https://archives.fedoraproject.org/pub/archive/fedora/"
-                            "linux/releases/31/Everything/aarch64/os/images/pxeboot/",
-             'kernel_params': "root=UUID=b6950a44-9f3c-4076-a9c2-355e8475b0a7 ro "
-                              "earlyprintk=pl011,0x9000000 ignore_loglevel "
-                              "no_timer_check printk.time=1 rd_NO_PLYMOUTH "
-                              "console=ttyAMA0 "},
-            'ppc64':
-            {'checksum': '7c3528b85a3df4b2306e892199a9e1e43f991c506f2cc390dc4efa2026ad2f58'},
-            's390x':
-            {'checksum': '4caaab5a434fd4d1079149a072fdc7891e354f834d355069ca982fdcaf5a122d'},
-            }
-        ,
-        '32': {
-            'aarch64':
-            {'kernel_params': "root=UUID=3df75b65-be8d-4db4-8655-14d95c0e90c5 ro "
-                              "no_timer_check net.ifnames=0 console=tty1 "
-                              "console=ttyS0,115200n8 ",
-             'checksum': 'b367755c664a2d7a26955bbfff985855adfa2ca15e908baf15b4b176d68d3967',
-             'pxeboot_url': "http://dl.fedoraproject.org/pub/fedora/linux/"
-                            "releases/32/Server/aarch64/os/images/pxeboot/"},
-            }
-        ,
-        '33': {
-            'aarch64':
-            {'kernel_params': "root=UUID=d20b3ffa-6397-4a63-a734-1126a0208f8a ro "
-                              "no_timer_check net.ifnames=0 console=tty1 "
-                              "console=ttyS0,115200n8 console=tty0 ",
-             'checksum': 'e7f75cdfd523fe5ac2ca9eeece68edc1a81f386a17f969c1d1c7c87031008a6b',
-             'pxeboot_url': "http://dl.fedoraproject.org/pub/fedora/linux/"
-                            "releases/33/Server/aarch64/os/images/pxeboot/"},
+                'aarch64':
+                {'checksum': '1e18d9c0cf734940c4b5d5ec592facaed2af0ad0329383d5639c997fdf16fe49',
+                 'pxeboot_url': "https://archives.fedoraproject.org/pub/archive/fedora/"
+                                "linux/releases/31/Everything/aarch64/os/images/pxeboot/",
+                 'kernel_params': "root=UUID=b6950a44-9f3c-4076-a9c2-355e8475b0a7 ro "
+                                  "earlyprintk=pl011,0x9000000 ignore_loglevel "
+                                  "no_timer_check printk.time=1 rd_NO_PLYMOUTH "
+                                  "console=ttyAMA0 "},
+                'ppc64':
+                {'checksum': '7c3528b85a3df4b2306e892199a9e1e43f991c506f2cc390dc4efa2026ad2f58'},
+                's390x':
+                {'checksum': '4caaab5a434fd4d1079149a072fdc7891e354f834d355069ca982fdcaf5a122d'},
+                }
+            ,
+            '32': {
+                'aarch64':
+                {'kernel_params': "root=UUID=3df75b65-be8d-4db4-8655-14d95c0e90c5 ro "
+                                  "no_timer_check net.ifnames=0 console=tty1 "
+                                  "console=ttyS0,115200n8 ",
+                 'checksum': 'b367755c664a2d7a26955bbfff985855adfa2ca15e908baf15b4b176d68d3967',
+                 'pxeboot_url': "http://dl.fedoraproject.org/pub/fedora/linux/"
+                                "releases/32/Server/aarch64/os/images/pxeboot/"},
+                }
+            ,
+            '33': {
+                'aarch64':
+                {'kernel_params': "root=UUID=d20b3ffa-6397-4a63-a734-1126a0208f8a ro "
+                                  "no_timer_check net.ifnames=0 console=tty1 "
+                                  "console=ttyS0,115200n8 console=tty0 ",
+                 'checksum': 'e7f75cdfd523fe5ac2ca9eeece68edc1a81f386a17f969c1d1c7c87031008a6b',
+                 'pxeboot_url': "http://dl.fedoraproject.org/pub/fedora/linux/"
+                                "releases/33/Server/aarch64/os/images/pxeboot/"},
+                }
             }
         }
-    }
 
-def get_known_distro_kernel_params(distro, distro_version, arch):
-    try:
-        return KNOWN_DISTROS.get(distro).get(distro_version).get(arch).get('kernel_params')
-    except AttributeError:
-        return None
+    def __init__(self, name, version, arch):
+        self.name = name
+        self.version = version
+        self.arch = arch
+        try:
+            self._info = self.KNOWN_DISTROS.get(name).get(version).get(arch)
+        except AttributeError:
+            # Unknown distro
+            self._info = {}
 
-def get_known_distro_pxeboot_url(distro, distro_version, arch):
-    try:
-        return KNOWN_DISTROS.get(distro).get(distro_version).get(arch).get('pxeboot_url')
-    except AttributeError:
-        return None
+    @property
+    def default_kernel_params(self):
+        """Gets the default kernel parameters"""
+        return self._info.get('kernel_params', None)
 
-def get_known_distro_checksum(distro, distro_version, arch):
-    try:
-        return KNOWN_DISTROS.get(distro).get(distro_version).get(arch).get('checksum')
-    except AttributeError:
-        return None
+    @property
+    def pxeboot_url(self):
+        """Gets the repository url where pxeboot files can be found"""
+        return self._info.get('pxeboot_url', None)
 
+    @property
+    def checksum(self):
+        """Gets the cloud-image file checksum"""
+        return self._info.get('checksum', None)
+
+    @checksum.setter
+    def checksum(self, value):
+        self._info['checksum'] = value
 
 class LinuxTest(Test, LinuxSSHMixIn):
     """Facilitates having a cloud-image Linux based available.
@@ -374,24 +388,24 @@ class LinuxTest(Test, LinuxSSHMixIn):
     """
 
     timeout = 900
-    distro_checksum = None
+    distro = None
     username = 'root'
     password = 'password'
 
     def _set_distro(self):
-        distro = self.params.get(
+        distro_name = self.params.get(
             'distro',
             default=self._get_unique_tag_val('distro'))
-        if not distro:
-            distro = 'fedora'
-        self.distro = distro
+        if not distro_name:
+            distro_name = 'fedora'
 
         distro_version = self.params.get(
             'distro_version',
             default=self._get_unique_tag_val('distro_version'))
         if not distro_version:
             distro_version = '31'
-        self.distro_version = distro_version
+
+        self.distro = LinuxDistro(distro_name, distro_version, self.arch)
 
         # The distro checksum behaves differently than distro name and
         # version. First, it does not respect a tag with the same
@@ -400,13 +414,9 @@ def _set_distro(self):
         # order of precedence is: parameter, attribute and then value
         # from KNOWN_DISTROS.
         distro_checksum = self.params.get('distro_checksum',
-                                          default=self.distro_checksum)
-        if not distro_checksum:
-            distro_checksum = get_known_distro_checksum(self.distro,
-                                                        self.distro_version,
-                                                        self.arch)
+                                          default=None)
         if distro_checksum:
-            self.distro_checksum = distro_checksum
+            self.distro.checksum = distro_checksum
 
     def setUp(self, ssh_pubkey=None, network_device_type='virtio-net'):
         super(LinuxTest, self).setUp()
@@ -448,14 +458,14 @@ def download_boot(self):
         self.log.info('Downloading/preparing boot image')
         # Fedora 31 only provides ppc64le images
         image_arch = self.arch
-        if self.distro == 'fedora':
+        if self.distro.name == 'fedora':
             if image_arch == 'ppc64':
                 image_arch = 'ppc64le'
 
         try:
             boot = vmimage.get(
-                self.distro, arch=image_arch, version=self.distro_version,
-                checksum=self.distro_checksum,
+                self.distro.name, arch=image_arch, version=self.distro.version,
+                checksum=self.distro.checksum,
                 algorithm='sha256',
                 cache_dir=self.cache_dirs[0],
                 snapshot_dir=self.workdir)
@@ -491,12 +501,6 @@ def set_up_cloudinit(self, ssh_pubkey=None):
         cloudinit_iso = self.prepare_cloudinit(ssh_pubkey)
         self.vm.add_args('-drive', 'file=%s,format=raw' % cloudinit_iso)
 
-    def get_default_kernel_params(self):
-        return get_known_distro_kernel_params(self.distro, self.distro_version, self.arch)
-
-    def get_pxeboot_url(self):
-        return get_known_distro_pxeboot_url(self.distro, self.distro_version, self.arch)
-
     def launch_and_wait(self, set_up_ssh_connection=True):
         self.vm.set_console()
         self.vm.launch()
diff --git a/tests/acceptance/intel_iommu.py b/tests/acceptance/intel_iommu.py
index 0b68d3c572..bf8dea6e4f 100644
--- a/tests/acceptance/intel_iommu.py
+++ b/tests/acceptance/intel_iommu.py
@@ -53,8 +53,8 @@ def common_vm_setup(self, custom_kernel=None):
         if custom_kernel is None:
             return
 
-        kernel_url = self.get_pxeboot_url() + 'vmlinuz'
-        initrd_url = self.get_pxeboot_url() + 'initrd.img'
+        kernel_url = self.distro.pxeboot_url + 'vmlinuz'
+        initrd_url = self.distro.pxeboot_url + 'initrd.img'
         self.kernel_path = self.fetch_asset(kernel_url)
         self.initrd_path = self.fetch_asset(initrd_url)
 
@@ -78,7 +78,7 @@ def test_intel_iommu(self):
         self.vm.add_args('-device', 'intel-iommu,intremap=on')
         self.vm.add_args('-machine', 'kernel_irqchip=split')
 
-        self.kernel_params = self.get_default_kernel_params() + ' quiet intel_iommu=on'
+        self.kernel_params = self.distro.default_kernel_params + ' quiet intel_iommu=on'
         self.run_and_check()
 
     def test_intel_iommu_strict(self):
@@ -89,7 +89,7 @@ def test_intel_iommu_strict(self):
         self.common_vm_setup(True)
         self.vm.add_args('-device', 'intel-iommu,intremap=on')
         self.vm.add_args('-machine', 'kernel_irqchip=split')
-        self.kernel_params = self.get_default_kernel_params() + ' quiet intel_iommu=on,strict'
+        self.kernel_params = self.distro.default_kernel_params + ' quiet intel_iommu=on,strict'
         self.run_and_check()
 
     def test_intel_iommu_strict_cm(self):
@@ -100,7 +100,7 @@ def test_intel_iommu_strict_cm(self):
         self.common_vm_setup(True)
         self.vm.add_args('-device', 'intel-iommu,intremap=on,caching-mode=on')
         self.vm.add_args('-machine', 'kernel_irqchip=split')
-        self.kernel_params = self.get_default_kernel_params() + ' quiet intel_iommu=on,strict'
+        self.kernel_params = self.distro.default_kernel_params + ' quiet intel_iommu=on,strict'
         self.run_and_check()
 
     def test_intel_iommu_pt(self):
@@ -111,5 +111,5 @@ def test_intel_iommu_pt(self):
         self.common_vm_setup(True)
         self.vm.add_args('-device', 'intel-iommu,intremap=on')
         self.vm.add_args('-machine', 'kernel_irqchip=split')
-        self.kernel_params = self.get_default_kernel_params() + ' quiet intel_iommu=on iommu=pt'
+        self.kernel_params = self.distro.default_kernel_params + ' quiet intel_iommu=on iommu=pt'
         self.run_and_check()
diff --git a/tests/acceptance/smmu.py b/tests/acceptance/smmu.py
index c1d4b88e5f..72e26f002c 100644
--- a/tests/acceptance/smmu.py
+++ b/tests/acceptance/smmu.py
@@ -53,8 +53,8 @@ def common_vm_setup(self, custom_kernel=False):
         if custom_kernel is False:
             return
 
-        kernel_url = self.get_pxeboot_url() + 'vmlinuz'
-        initrd_url = self.get_pxeboot_url() + 'initrd.img'
+        kernel_url = self.distro.pxeboot_url + 'vmlinuz'
+        initrd_url = self.distro.pxeboot_url + 'initrd.img'
         self.kernel_path = self.fetch_asset(kernel_url)
         self.initrd_path = self.fetch_asset(initrd_url)
 
@@ -86,7 +86,7 @@ def test_smmu_noril_passthrough(self):
         :avocado: tags=distro_version:31
         """
         self.common_vm_setup(True)
-        self.kernel_params = self.get_default_kernel_params() + ' iommu.passthrough=on'
+        self.kernel_params = self.distro.default_kernel_params + ' iommu.passthrough=on'
         self.run_and_check()
 
     def test_smmu_noril_nostrict(self):
@@ -96,7 +96,7 @@ def test_smmu_noril_nostrict(self):
         :avocado: tags=distro_version:31
         """
         self.common_vm_setup(True)
-        self.kernel_params = self.get_default_kernel_params() + ' iommu.strict=0'
+        self.kernel_params = self.distro.default_kernel_params + ' iommu.strict=0'
         self.run_and_check()
 
     # 5.8 kernel featuring range invalidation
@@ -118,7 +118,7 @@ def test_smmu_ril_passthrough(self):
         :avocado: tags=distro_version:33
         """
         self.common_vm_setup(True)
-        self.kernel_params = self.get_default_kernel_params() + ' iommu.passthrough=on'
+        self.kernel_params = self.distro.default_kernel_params + ' iommu.passthrough=on'
         self.run_and_check()
 
     def test_smmu_ril_nostrict(self):
@@ -128,5 +128,5 @@ def test_smmu_ril_nostrict(self):
         :avocado: tags=distro_version:33
         """
         self.common_vm_setup(True)
-        self.kernel_params = self.get_default_kernel_params() + ' iommu.strict=0'
+        self.kernel_params = self.distro.default_kernel_params + ' iommu.strict=0'
         self.run_and_check()
-- 
2.26.3


