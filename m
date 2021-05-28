Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCD2393B7F
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 04:40:51 +0200 (CEST)
Received: from localhost ([::1]:43934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmSQc-0002dY-3f
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 22:40:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmSJQ-0000HJ-4v
 for qemu-devel@nongnu.org; Thu, 27 May 2021 22:33:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmSJO-000868-0Z
 for qemu-devel@nongnu.org; Thu, 27 May 2021 22:33:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622169201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x77v9afX9s8Z8c6YTAOmgYZcSkk+ABgZzHVZG6RhpoY=;
 b=P65WzKXtMOSws8xnHoTxxSUu4QFeo1DlDImnk8uG9g0KaCkVYNSTDlVWmPGc7EPTBRNNWc
 YtOHovDW1m1oQwJIeuaUIV7gbsO65t26fXwAqte48PZ2Lb+UYoxGtgmHThtmCYBIxg5BzT
 VAnwnPTEdmNN3NTYW2AHnTXkBTDDNTo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-Dyc6Pb0MP5CUYLwbpD6r-A-1; Thu, 27 May 2021 22:33:19 -0400
X-MC-Unique: Dyc6Pb0MP5CUYLwbpD6r-A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3B74107ACC7;
 Fri, 28 May 2021 02:33:17 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBC631F0C0;
 Fri, 28 May 2021 02:33:03 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/44] Acceptance Tests: set up SSH connection by default after
 boot for LinuxTest
Date: Thu, 27 May 2021 22:31:44 -0400
Message-Id: <20210528023220.417057-9-jsnow@redhat.com>
In-Reply-To: <20210528023220.417057-1-jsnow@redhat.com>
References: <20210528023220.417057-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cleber Rosa <crosa@redhat.com>

The LinuxTest specifically targets users that need to interact with Linux
guests.  So, it makes sense to give a connection by default, and avoid
requiring it as boiler-plate code.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210412044644.55083-8-crosa@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py |  5 ++++-
 tests/acceptance/boot_linux.py            | 18 +++++++++---------
 tests/acceptance/virtiofs_submounts.py    |  1 -
 3 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 25f871f5bc6..1062a851b97 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -391,7 +391,7 @@ def set_up_cloudinit(self, ssh_pubkey=None):
         cloudinit_iso = self.prepare_cloudinit(ssh_pubkey)
         self.vm.add_args('-drive', 'file=%s,format=raw' % cloudinit_iso)
 
-    def launch_and_wait(self):
+    def launch_and_wait(self, set_up_ssh_connection=True):
         self.vm.set_console()
         self.vm.launch()
         console_drainer = datadrainer.LineLogger(self.vm.console_socket.fileno(),
@@ -399,3 +399,6 @@ def launch_and_wait(self):
         console_drainer.start()
         self.log.info('VM launched, waiting for boot confirmation from guest')
         cloudinit.wait_for_phone_home(('0.0.0.0', self.phone_home_port), self.name)
+        if set_up_ssh_connection:
+            self.log.info('Setting up the SSH connection')
+            self.ssh_connect(self.username, self.ssh_key)
diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux.py
index 0d178038a09..314370fd1f5 100644
--- a/tests/acceptance/boot_linux.py
+++ b/tests/acceptance/boot_linux.py
@@ -29,7 +29,7 @@ def test_pc_i440fx_tcg(self):
         """
         self.require_accelerator("tcg")
         self.vm.add_args("-accel", "tcg")
-        self.launch_and_wait()
+        self.launch_and_wait(set_up_ssh_connection=False)
 
     def test_pc_i440fx_kvm(self):
         """
@@ -38,7 +38,7 @@ def test_pc_i440fx_kvm(self):
         """
         self.require_accelerator("kvm")
         self.vm.add_args("-accel", "kvm")
-        self.launch_and_wait()
+        self.launch_and_wait(set_up_ssh_connection=False)
 
     def test_pc_q35_tcg(self):
         """
@@ -47,7 +47,7 @@ def test_pc_q35_tcg(self):
         """
         self.require_accelerator("tcg")
         self.vm.add_args("-accel", "tcg")
-        self.launch_and_wait()
+        self.launch_and_wait(set_up_ssh_connection=False)
 
     def test_pc_q35_kvm(self):
         """
@@ -56,7 +56,7 @@ def test_pc_q35_kvm(self):
         """
         self.require_accelerator("kvm")
         self.vm.add_args("-accel", "kvm")
-        self.launch_and_wait()
+        self.launch_and_wait(set_up_ssh_connection=False)
 
 
 class BootLinuxAarch64(LinuxTest):
@@ -85,7 +85,7 @@ def test_virt_tcg(self):
         self.vm.add_args("-cpu", "max")
         self.vm.add_args("-machine", "virt,gic-version=2")
         self.add_common_args()
-        self.launch_and_wait()
+        self.launch_and_wait(set_up_ssh_connection=False)
 
     def test_virt_kvm_gicv2(self):
         """
@@ -98,7 +98,7 @@ def test_virt_kvm_gicv2(self):
         self.vm.add_args("-cpu", "host")
         self.vm.add_args("-machine", "virt,gic-version=2")
         self.add_common_args()
-        self.launch_and_wait()
+        self.launch_and_wait(set_up_ssh_connection=False)
 
     def test_virt_kvm_gicv3(self):
         """
@@ -111,7 +111,7 @@ def test_virt_kvm_gicv3(self):
         self.vm.add_args("-cpu", "host")
         self.vm.add_args("-machine", "virt,gic-version=3")
         self.add_common_args()
-        self.launch_and_wait()
+        self.launch_and_wait(set_up_ssh_connection=False)
 
 
 class BootLinuxPPC64(LinuxTest):
@@ -128,7 +128,7 @@ def test_pseries_tcg(self):
         """
         self.require_accelerator("tcg")
         self.vm.add_args("-accel", "tcg")
-        self.launch_and_wait()
+        self.launch_and_wait(set_up_ssh_connection=False)
 
 
 class BootLinuxS390X(LinuxTest):
@@ -146,4 +146,4 @@ def test_s390_ccw_virtio_tcg(self):
         """
         self.require_accelerator("tcg")
         self.vm.add_args("-accel", "tcg")
-        self.launch_and_wait()
+        self.launch_and_wait(set_up_ssh_connection=False)
diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
index e10a935ac4e..e019d3b896b 100644
--- a/tests/acceptance/virtiofs_submounts.py
+++ b/tests/acceptance/virtiofs_submounts.py
@@ -136,7 +136,6 @@ def set_up_virtiofs(self):
 
     def launch_vm(self):
         self.launch_and_wait()
-        self.ssh_connect('root', self.ssh_key)
 
     def set_up_nested_mounts(self):
         scratch_dir = os.path.join(self.shared_dir, 'scratch')
-- 
2.31.1


