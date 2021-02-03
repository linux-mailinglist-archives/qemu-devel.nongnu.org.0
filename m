Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C227E30E144
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 18:40:14 +0100 (CET)
Received: from localhost ([::1]:45868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7M8T-00056A-HP
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 12:40:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1l7Lts-0001wE-Vo
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:25:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1l7Lto-0004Vv-2T
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:25:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612373100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DtI1FivtGRL93IxkqVdB5iYxeHLnpGF3vCTdENNmsBA=;
 b=Xmoz5f6TfUGdTMvJNERVSf5C/SEGnbvZwIgP7rDgBFBOGsHT8F0cP+4H+W8yla2GS8zY+P
 SPDTooRqXdE4LDcXlLVZ8rtXSMwEfOSSVxzQwmdDTMfogFWOVp9N9vj3KYR4wwEP8ovvFY
 3gEn1WeAA8zazLdOk9spF28mOeH/+2M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-w01MrpyJOt-MZbpEofs2Ug-1; Wed, 03 Feb 2021 12:24:59 -0500
X-MC-Unique: w01MrpyJOt-MZbpEofs2Ug-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16736803F42;
 Wed,  3 Feb 2021 17:24:57 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-89.rdu2.redhat.com
 [10.10.116.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 48F621C92F;
 Wed,  3 Feb 2021 17:24:55 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/22] Acceptance Tests: introduce method for requiring an
 accelerator
Date: Wed,  3 Feb 2021 12:23:51 -0500
Message-Id: <20210203172357.1422425-17-crosa@redhat.com>
In-Reply-To: <20210203172357.1422425-1-crosa@redhat.com>
References: <20210203172357.1422425-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Eric Auger <eauger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some tests explicitly require a QEMU accelerator to be available.
Given that this depends on some runtime aspects not known before
the test is started, such as the currently set QEMU binary, it's
left to be checked also at runtime.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 24 ++++++++++++++++
 tests/acceptance/boot_linux.py            | 34 ++++++-----------------
 tests/acceptance/virtiofs_submounts.py    |  5 +---
 3 files changed, 34 insertions(+), 29 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index f0649e5011..472088ae7d 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -41,6 +41,8 @@ else:
 
 sys.path.append(os.path.join(SOURCE_DIR, 'python'))
 
+from qemu.accel import kvm_available
+from qemu.accel import tcg_available
 from qemu.machine import QEMUMachine
 from qemu.utils import get_info_usernet_hostfwd_port
 
@@ -166,6 +168,28 @@ class Test(avocado.Test):
             return vals.pop()
         return None
 
+    def require_accelerator(self, accelerator):
+        """
+        Requires an accelerator to be available for the test to continue
+
+        It takes into account the currently set qemu binary.
+
+        If the check fails, the test is canceled.  If the check itself
+        for the given accelerator is not available, the test is also
+        canceled.
+
+        :param accelerator: name of the accelerator, such as "kvm" or "tcg"
+        :type accelerator: str
+        """
+        checker = {'tcg': tcg_available,
+                   'kvm': kvm_available}.get(accelerator)
+        if checker is None:
+            self.cancel("Don't know how to check for the presence "
+                        "of accelerator %s" % accelerator)
+        if not checker(qemu_bin=self.qemu_bin):
+            self.cancel("%s accelerator does not seem to be "
+                        "available" % accelerator)
+
     def setUp(self):
         self._vms = {}
 
diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux.py
index 14e89d020d..0d178038a0 100644
--- a/tests/acceptance/boot_linux.py
+++ b/tests/acceptance/boot_linux.py
@@ -12,15 +12,8 @@ import os
 
 from avocado_qemu import LinuxTest, BUILD_DIR
 
-from qemu.accel import kvm_available
-from qemu.accel import tcg_available
-
 from avocado import skipIf
 
-ACCEL_NOT_AVAILABLE_FMT = "%s accelerator does not seem to be available"
-KVM_NOT_AVAILABLE = ACCEL_NOT_AVAILABLE_FMT % "KVM"
-TCG_NOT_AVAILABLE = ACCEL_NOT_AVAILABLE_FMT % "TCG"
-
 
 class BootLinuxX8664(LinuxTest):
     """
@@ -34,8 +27,7 @@ class BootLinuxX8664(LinuxTest):
         :avocado: tags=machine:pc
         :avocado: tags=accel:tcg
         """
-        if not tcg_available(self.qemu_bin):
-            self.cancel(TCG_NOT_AVAILABLE)
+        self.require_accelerator("tcg")
         self.vm.add_args("-accel", "tcg")
         self.launch_and_wait()
 
@@ -44,8 +36,7 @@ class BootLinuxX8664(LinuxTest):
         :avocado: tags=machine:pc
         :avocado: tags=accel:kvm
         """
-        if not kvm_available(self.arch, self.qemu_bin):
-            self.cancel(KVM_NOT_AVAILABLE)
+        self.require_accelerator("kvm")
         self.vm.add_args("-accel", "kvm")
         self.launch_and_wait()
 
@@ -54,8 +45,7 @@ class BootLinuxX8664(LinuxTest):
         :avocado: tags=machine:q35
         :avocado: tags=accel:tcg
         """
-        if not tcg_available(self.qemu_bin):
-            self.cancel(TCG_NOT_AVAILABLE)
+        self.require_accelerator("tcg")
         self.vm.add_args("-accel", "tcg")
         self.launch_and_wait()
 
@@ -64,8 +54,7 @@ class BootLinuxX8664(LinuxTest):
         :avocado: tags=machine:q35
         :avocado: tags=accel:kvm
         """
-        if not kvm_available(self.arch, self.qemu_bin):
-            self.cancel(KVM_NOT_AVAILABLE)
+        self.require_accelerator("kvm")
         self.vm.add_args("-accel", "kvm")
         self.launch_and_wait()
 
@@ -91,8 +80,7 @@ class BootLinuxAarch64(LinuxTest):
         :avocado: tags=accel:tcg
         :avocado: tags=cpu:max
         """
-        if not tcg_available(self.qemu_bin):
-            self.cancel(TCG_NOT_AVAILABLE)
+        self.require_accelerator("tcg")
         self.vm.add_args("-accel", "tcg")
         self.vm.add_args("-cpu", "max")
         self.vm.add_args("-machine", "virt,gic-version=2")
@@ -105,8 +93,7 @@ class BootLinuxAarch64(LinuxTest):
         :avocado: tags=cpu:host
         :avocado: tags=device:gicv2
         """
-        if not kvm_available(self.arch, self.qemu_bin):
-            self.cancel(KVM_NOT_AVAILABLE)
+        self.require_accelerator("kvm")
         self.vm.add_args("-accel", "kvm")
         self.vm.add_args("-cpu", "host")
         self.vm.add_args("-machine", "virt,gic-version=2")
@@ -119,8 +106,7 @@ class BootLinuxAarch64(LinuxTest):
         :avocado: tags=cpu:host
         :avocado: tags=device:gicv3
         """
-        if not kvm_available(self.arch, self.qemu_bin):
-            self.cancel(KVM_NOT_AVAILABLE)
+        self.require_accelerator("kvm")
         self.vm.add_args("-accel", "kvm")
         self.vm.add_args("-cpu", "host")
         self.vm.add_args("-machine", "virt,gic-version=3")
@@ -140,8 +126,7 @@ class BootLinuxPPC64(LinuxTest):
         :avocado: tags=machine:pseries
         :avocado: tags=accel:tcg
         """
-        if not tcg_available(self.qemu_bin):
-            self.cancel(TCG_NOT_AVAILABLE)
+        self.require_accelerator("tcg")
         self.vm.add_args("-accel", "tcg")
         self.launch_and_wait()
 
@@ -159,7 +144,6 @@ class BootLinuxS390X(LinuxTest):
         :avocado: tags=machine:s390-ccw-virtio
         :avocado: tags=accel:tcg
         """
-        if not tcg_available(self.qemu_bin):
-            self.cancel(TCG_NOT_AVAILABLE)
+        self.require_accelerator("tcg")
         self.vm.add_args("-accel", "tcg")
         self.launch_and_wait()
diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
index d0fc103f72..0298807e5c 100644
--- a/tests/acceptance/virtiofs_submounts.py
+++ b/tests/acceptance/virtiofs_submounts.py
@@ -9,8 +9,6 @@ from avocado_qemu import LinuxTest, BUILD_DIR
 from avocado_qemu import wait_for_console_pattern
 from avocado.utils import ssh
 
-from qemu.accel import kvm_available
-
 
 def run_cmd(args):
     subp = subprocess.Popen(args,
@@ -201,8 +199,7 @@ class VirtiofsSubmountsTest(LinuxTest):
         self.vm.add_args('-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0-:22',
                          '-device', 'virtio-net,netdev=vnet')
 
-        if not kvm_available(self.arch, self.qemu_bin):
-            self.cancel(KVM_NOT_AVAILABLE)
+        self.require_accelerator("kvm")
         self.vm.add_args('-accel', 'kvm')
 
     def tearDown(self):
-- 
2.25.4


