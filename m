Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3552631C61A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 06:00:56 +0100 (CET)
Received: from localhost ([::1]:43610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBsTn-0002Lt-89
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 00:00:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lBsQU-0006LU-7F
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 23:57:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lBsQS-0007pF-29
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 23:57:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613451447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vEtYIsPEfwmG3es2zBHdKl1lDn/EDfBveaWa/RD44SY=;
 b=RAVJEwzOE4tp1co6XrYJ7/c0Ih2fzvpK8o5W12BDJAIXNF3Ft1ynrSrp4r1KuxlAXNDzFD
 sZGfpFn/4ZmXcHa3KYnlqIfdwZOMjFz578wTx/DLXdp4kUagVrBwJ3kA/cxVbosbzsrst6
 CV+O4BlwdWbf2wKxTolwiA477FhWtEA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-SZRhAtpOMku-gMipiPFzrw-1; Mon, 15 Feb 2021 23:57:24 -0500
X-MC-Unique: SZRhAtpOMku-gMipiPFzrw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DD5A10CE780;
 Tue, 16 Feb 2021 04:57:23 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-129.rdu2.redhat.com
 [10.10.112.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D740710DB;
 Tue, 16 Feb 2021 04:57:22 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 6/9] Acceptance Tests: introduce LinuxTest base class
Date: Mon, 15 Feb 2021 23:57:02 -0500
Message-Id: <20210216045705.9590-7-crosa@redhat.com>
In-Reply-To: <20210216045705.9590-1-crosa@redhat.com>
References: <20210216045705.9590-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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
Cc: Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is basically the infrastructure around "boot_linux.py" tests, but
now made into a base class for general use.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Message-Id: <20210203172357.1422425-15-crosa@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 87 +++++++++++++++++++++
 tests/acceptance/boot_linux.py            | 94 ++---------------------
 tests/acceptance/virtiofs_submounts.py    |  6 +-
 3 files changed, 94 insertions(+), 93 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index bf54e419da2..b06692a59df 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -16,6 +16,13 @@
 
 import avocado
 
+from avocado.utils import cloudinit
+from avocado.utils import datadrainer
+from avocado.utils import network
+from avocado.utils import vmimage
+from avocado.utils.path import find_command
+
+
 #: The QEMU build root directory.  It may also be the source directory
 #: if building from the source dir, but it's safer to use BUILD_DIR for
 #: that purpose.  Be aware that if this code is moved outside of a source
@@ -206,3 +213,83 @@ def fetch_asset(self, name,
                         expire=expire,
                         find_only=find_only,
                         cancel_on_missing=cancel_on_missing)
+
+
+class LinuxTest(Test):
+    """Facilitates having a cloud-image Linux based available.
+
+    For tests that indend to interact with guests, this is a better choice
+    to start with than the more vanilla `Test` class.
+    """
+
+    timeout = 900
+    chksum = None
+
+    def setUp(self, ssh_pubkey=None):
+        super(LinuxTest, self).setUp()
+        self.vm.add_args('-smp', '2')
+        self.vm.add_args('-m', '1024')
+        self.set_up_boot()
+        self.set_up_cloudinit(ssh_pubkey)
+
+    def download_boot(self):
+        self.log.debug('Looking for and selecting a qemu-img binary to be '
+                       'used to create the bootable snapshot image')
+        # If qemu-img has been built, use it, otherwise the system wide one
+        # will be used.  If none is available, the test will cancel.
+        qemu_img = os.path.join(BUILD_DIR, 'qemu-img')
+        if not os.path.exists(qemu_img):
+            qemu_img = find_command('qemu-img', False)
+        if qemu_img is False:
+            self.cancel('Could not find "qemu-img", which is required to '
+                        'create the bootable image')
+        vmimage.QEMU_IMG = qemu_img
+
+        self.log.info('Downloading/preparing boot image')
+        # Fedora 31 only provides ppc64le images
+        image_arch = self.arch
+        if image_arch == 'ppc64':
+            image_arch = 'ppc64le'
+        try:
+            boot = vmimage.get(
+                'fedora', arch=image_arch, version='31',
+                checksum=self.chksum,
+                algorithm='sha256',
+                cache_dir=self.cache_dirs[0],
+                snapshot_dir=self.workdir)
+        except:
+            self.cancel('Failed to download/prepare boot image')
+        return boot.path
+
+    def prepare_cloudinit(self, ssh_pubkey=None):
+        self.log.info('Preparing cloudinit image')
+        try:
+            cloudinit_iso = os.path.join(self.workdir, 'cloudinit.iso')
+            self.phone_home_port = network.find_free_port()
+            cloudinit.iso(cloudinit_iso, self.name,
+                          username='root',
+                          password='password',
+                          # QEMU's hard coded usermode router address
+                          phone_home_host='10.0.2.2',
+                          phone_home_port=self.phone_home_port,
+                          authorized_key=ssh_pubkey)
+        except Exception:
+            self.cancel('Failed to prepare the cloudinit image')
+        return cloudinit_iso
+
+    def set_up_boot(self):
+        path = self.download_boot()
+        self.vm.add_args('-drive', 'file=%s' % path)
+
+    def set_up_cloudinit(self, ssh_pubkey=None):
+        cloudinit_iso = self.prepare_cloudinit(ssh_pubkey)
+        self.vm.add_args('-drive', 'file=%s,format=raw' % cloudinit_iso)
+
+    def launch_and_wait(self):
+        self.vm.set_console()
+        self.vm.launch()
+        console_drainer = datadrainer.LineLogger(self.vm.console_socket.fileno(),
+                                                 logger=self.log.getChild('console'))
+        console_drainer.start()
+        self.log.info('VM launched, waiting for boot confirmation from guest')
+        cloudinit.wait_for_phone_home(('0.0.0.0', self.phone_home_port), self.name)
diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux.py
index bcd923bb4a0..14e89d020d1 100644
--- a/tests/acceptance/boot_linux.py
+++ b/tests/acceptance/boot_linux.py
@@ -10,16 +10,11 @@
 
 import os
 
-from avocado_qemu import Test, BUILD_DIR
+from avocado_qemu import LinuxTest, BUILD_DIR
 
 from qemu.accel import kvm_available
 from qemu.accel import tcg_available
 
-from avocado.utils import cloudinit
-from avocado.utils import network
-from avocado.utils import vmimage
-from avocado.utils import datadrainer
-from avocado.utils.path import find_command
 from avocado import skipIf
 
 ACCEL_NOT_AVAILABLE_FMT = "%s accelerator does not seem to be available"
@@ -27,86 +22,7 @@
 TCG_NOT_AVAILABLE = ACCEL_NOT_AVAILABLE_FMT % "TCG"
 
 
-class BootLinuxBase(Test):
-    def download_boot(self):
-        self.log.debug('Looking for and selecting a qemu-img binary to be '
-                       'used to create the bootable snapshot image')
-        # If qemu-img has been built, use it, otherwise the system wide one
-        # will be used.  If none is available, the test will cancel.
-        qemu_img = os.path.join(BUILD_DIR, 'qemu-img')
-        if not os.path.exists(qemu_img):
-            qemu_img = find_command('qemu-img', False)
-        if qemu_img is False:
-            self.cancel('Could not find "qemu-img", which is required to '
-                        'create the bootable image')
-        vmimage.QEMU_IMG = qemu_img
-
-        self.log.info('Downloading/preparing boot image')
-        # Fedora 31 only provides ppc64le images
-        image_arch = self.arch
-        if image_arch == 'ppc64':
-            image_arch = 'ppc64le'
-        try:
-            boot = vmimage.get(
-                'fedora', arch=image_arch, version='31',
-                checksum=self.chksum,
-                algorithm='sha256',
-                cache_dir=self.cache_dirs[0],
-                snapshot_dir=self.workdir)
-        except:
-            self.cancel('Failed to download/prepare boot image')
-        return boot.path
-
-    def prepare_cloudinit(self, ssh_pubkey=None):
-        self.log.info('Preparing cloudinit image')
-        try:
-            cloudinit_iso = os.path.join(self.workdir, 'cloudinit.iso')
-            self.phone_home_port = network.find_free_port()
-            cloudinit.iso(cloudinit_iso, self.name,
-                          username='root',
-                          password='password',
-                          # QEMU's hard coded usermode router address
-                          phone_home_host='10.0.2.2',
-                          phone_home_port=self.phone_home_port,
-                          authorized_key=ssh_pubkey)
-        except Exception:
-            self.cancel('Failed to prepare the cloudinit image')
-        return cloudinit_iso
-
-class BootLinux(BootLinuxBase):
-    """
-    Boots a Linux system, checking for a successful initialization
-    """
-
-    timeout = 900
-    chksum = None
-
-    def setUp(self, ssh_pubkey=None):
-        super(BootLinux, self).setUp()
-        self.vm.add_args('-smp', '2')
-        self.vm.add_args('-m', '1024')
-        self.set_up_boot()
-        self.set_up_cloudinit(ssh_pubkey)
-
-    def set_up_boot(self):
-        path = self.download_boot()
-        self.vm.add_args('-drive', 'file=%s' % path)
-
-    def set_up_cloudinit(self, ssh_pubkey=None):
-        cloudinit_iso = self.prepare_cloudinit(ssh_pubkey)
-        self.vm.add_args('-drive', 'file=%s,format=raw' % cloudinit_iso)
-
-    def launch_and_wait(self):
-        self.vm.set_console()
-        self.vm.launch()
-        console_drainer = datadrainer.LineLogger(self.vm.console_socket.fileno(),
-                                                 logger=self.log.getChild('console'))
-        console_drainer.start()
-        self.log.info('VM launched, waiting for boot confirmation from guest')
-        cloudinit.wait_for_phone_home(('0.0.0.0', self.phone_home_port), self.name)
-
-
-class BootLinuxX8664(BootLinux):
+class BootLinuxX8664(LinuxTest):
     """
     :avocado: tags=arch:x86_64
     """
@@ -154,7 +70,7 @@ def test_pc_q35_kvm(self):
         self.launch_and_wait()
 
 
-class BootLinuxAarch64(BootLinux):
+class BootLinuxAarch64(LinuxTest):
     """
     :avocado: tags=arch:aarch64
     :avocado: tags=machine:virt
@@ -212,7 +128,7 @@ def test_virt_kvm_gicv3(self):
         self.launch_and_wait()
 
 
-class BootLinuxPPC64(BootLinux):
+class BootLinuxPPC64(LinuxTest):
     """
     :avocado: tags=arch:ppc64
     """
@@ -230,7 +146,7 @@ def test_pseries_tcg(self):
         self.launch_and_wait()
 
 
-class BootLinuxS390X(BootLinux):
+class BootLinuxS390X(LinuxTest):
     """
     :avocado: tags=arch:s390x
     """
diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
index 9a69b6b17bc..fc2b4fd6669 100644
--- a/tests/acceptance/virtiofs_submounts.py
+++ b/tests/acceptance/virtiofs_submounts.py
@@ -5,14 +5,12 @@
 import time
 
 from avocado import skipUnless
-from avocado_qemu import Test, BUILD_DIR
+from avocado_qemu import LinuxTest, BUILD_DIR
 from avocado_qemu import wait_for_console_pattern
 from avocado.utils import ssh
 
 from qemu.accel import kvm_available
 
-from boot_linux import BootLinux
-
 
 def run_cmd(args):
     subp = subprocess.Popen(args,
@@ -71,7 +69,7 @@ def test_something_that_needs_cmd1_and_cmd2(self):
     return (True, '')
 
 
-class VirtiofsSubmountsTest(BootLinux):
+class VirtiofsSubmountsTest(LinuxTest):
     """
     :avocado: tags=arch:x86_64
     """
-- 
2.26.2


