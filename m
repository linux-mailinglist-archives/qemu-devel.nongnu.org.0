Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8B332589E
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 22:27:26 +0100 (CET)
Received: from localhost ([::1]:54946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFOAP-0007Vp-E6
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 16:27:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1lFNjg-0000Q4-Vv
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 15:59:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1lFNje-0002hG-TM
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 15:59:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614286785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l/QPmXx+ZDWXdA2xMCWs3xiloZTPwIqlCQ8Q2lnV8as=;
 b=S3Won0QaoUYc9Q+l5KwifoXY5IuW4ya0qOp93Md135ZRLW1YC6JuKLAEShERoutkizBJG6
 CC+b/VYqmSKuGu1+poortteN7LBxupmM/v4WaUA96XRxCD7K/ZozxAzw8jdK2YibFd/Z04
 MW+EdQ1srweGo2+WNTCgMQrZnA74ebg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-hj85FYYSN_2VG7WSUyUvCw-1; Thu, 25 Feb 2021 15:59:39 -0500
X-MC-Unique: hj85FYYSN_2VG7WSUyUvCw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CA7450742;
 Thu, 25 Feb 2021 20:59:38 +0000 (UTC)
Received: from wrampazz.redhat.com (ovpn-112-217.rdu2.redhat.com
 [10.10.112.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 380DD60BE5;
 Thu, 25 Feb 2021 20:59:29 +0000 (UTC)
From: Willian Rampazzo <willianr@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] tests: Add functional test for out-of-process device
 emulation
Date: Thu, 25 Feb 2021 17:59:07 -0300
Message-Id: <20210225205907.223995-3-willianr@redhat.com>
In-Reply-To: <20210225205907.223995-1-willianr@redhat.com>
References: <20210225205907.223995-1-willianr@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=willianr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=willianr@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 25 Feb 2021 16:24:56 -0500
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jagannathan Raman <jag.raman@oracle.com>

Runs the Avocado acceptance test to check if a
remote lsi53c895a device gets identified by the guest.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
[WR: Refactored code]
Signed-off-by: Willian Rampazzo <willianr@redhat.com>
---
 tests/acceptance/multiprocess.py | 95 ++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 tests/acceptance/multiprocess.py

diff --git a/tests/acceptance/multiprocess.py b/tests/acceptance/multiprocess.py
new file mode 100644
index 0000000000..96627f022a
--- /dev/null
+++ b/tests/acceptance/multiprocess.py
@@ -0,0 +1,95 @@
+# Test for multiprocess qemu
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+
+import os
+import socket
+
+from avocado_qemu import Test
+from avocado_qemu import wait_for_console_pattern
+from avocado_qemu import exec_command
+from avocado_qemu import exec_command_and_wait_for_pattern
+
+class Multiprocess(Test):
+    """
+    :avocado: tags=multiprocess
+    """
+    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
+
+    def do_test(self, kernel_url, initrd_url, kernel_command_line,
+                machine_type):
+        """Main test method"""
+        self.require_accelerator('kvm')
+
+        # Create socketpair to connect proxy and remote processes
+        proxy_sock, remote_sock = socket.socketpair(socket.AF_UNIX,
+                                                    socket.SOCK_STREAM)
+        os.set_inheritable(proxy_sock.fileno(), True)
+        os.set_inheritable(remote_sock.fileno(), True)
+
+        kernel_path = self.fetch_asset(kernel_url)
+        initrd_path = self.fetch_asset(initrd_url)
+
+        # Create remote process
+        remote_vm = self.get_vm()
+        remote_vm.add_args('-machine', 'x-remote')
+        remote_vm.add_args('-nodefaults')
+        remote_vm.add_args('-device', 'lsi53c895a,id=lsi1')
+        remote_vm.add_args('-object', 'x-remote-object,id=robj1,'
+                           'devid=lsi1,fd='+str(remote_sock.fileno()))
+        remote_vm.launch()
+
+        # Create proxy process
+        self.vm.set_console()
+        self.vm.add_args('-machine', machine_type)
+        self.vm.add_args('-accel', 'kvm')
+        self.vm.add_args('-cpu', 'host')
+        self.vm.add_args('-object',
+                         'memory-backend-memfd,id=sysmem-file,size=2G')
+        self.vm.add_args('--numa', 'node,memdev=sysmem-file')
+        self.vm.add_args('-m', '2048')
+        self.vm.add_args('-kernel', kernel_path,
+                         '-initrd', initrd_path,
+                         '-append', kernel_command_line)
+        self.vm.add_args('-device',
+                         'x-pci-proxy-dev,'
+                         'id=lsi1,fd='+str(proxy_sock.fileno()))
+        self.vm.launch()
+        wait_for_console_pattern(self, 'as init process',
+                                 'Kernel panic - not syncing')
+        exec_command(self, 'mount -t sysfs sysfs /sys')
+        exec_command_and_wait_for_pattern(self,
+                                          'cat /sys/bus/pci/devices/*/uevent',
+                                          'PCI_ID=1000:0012')
+
+    def test_multiprocess_x86_64(self):
+        """
+        :avocado: tags=arch:x86_64
+        """
+        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/x86_64/os/images'
+                      '/pxeboot/vmlinuz')
+        initrd_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/x86_64/os/images'
+                      '/pxeboot/initrd.img')
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'console=ttyS0 rdinit=/bin/bash')
+        machine_type = 'pc'
+        self.do_test(kernel_url, initrd_url, kernel_command_line, machine_type)
+
+    def test_multiprocess_aarch64(self):
+        """
+        :avocado: tags=arch:aarch64
+        """
+        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/aarch64/os/images'
+                      '/pxeboot/vmlinuz')
+        initrd_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/aarch64/os/images'
+                      '/pxeboot/initrd.img')
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'rdinit=/bin/bash console=ttyAMA0')
+        machine_type = 'virt,gic-version=3'
+        self.do_test(kernel_url, initrd_url, kernel_command_line, machine_type)
-- 
2.29.2


