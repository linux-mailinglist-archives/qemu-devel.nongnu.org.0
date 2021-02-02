Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFB330C26B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:52:52 +0100 (CET)
Received: from localhost ([::1]:40984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6x2x-0004gp-9A
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:52:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l6wi5-0005JW-Sj
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:31:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l6why-0004is-Q8
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:31:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612276269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AvYt1tkIsXw7bEzgj+0tJAL++QzJYfzXrHvM8N6Pku4=;
 b=IMrviiU2IvvTSA4SWiNNZcoOx30DBHnYwOSTVYsNFPvehgiIxa7FMB15S/zFXOVQnTw+0Y
 8BnD05BzEmsKHyCjdxauHp71xMuBoj6G424VYywmvhpF/vWG1lyoPAm38fy9Z3BWBUR2KV
 ghgAew9Qodt2N8nF8pHpDekdKxL/xJY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158--9WeaYqRPQ6bQVG7p6UVNw-1; Tue, 02 Feb 2021 09:31:06 -0500
X-MC-Unique: -9WeaYqRPQ6bQVG7p6UVNw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CFC5835E42
 for <qemu-devel@nongnu.org>; Tue,  2 Feb 2021 14:30:37 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00EA23828;
 Tue,  2 Feb 2021 14:30:35 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 20/20] RFC: tests: add some virtio-gpu & vhost-user-gpu
 acceptance test
Date: Tue,  2 Feb 2021 18:26:25 +0400
Message-Id: <20210202142625.609070-21-marcandre.lureau@redhat.com>
In-Reply-To: <20210202142625.609070-1-marcandre.lureau@redhat.com>
References: <20210202142625.609070-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This will check virtio/vhost-user-vga & virgl are correctly initialized
by the Linux kernel on an egl-headless display.

There are many other things that could be checked, but that's a start. I
also don't know yet how to nicely skip on incompatible host &
configurations.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/acceptance/virtio-gpu.py | 150 +++++++++++++++++++++++++++++++++
 1 file changed, 150 insertions(+)
 create mode 100644 tests/acceptance/virtio-gpu.py

diff --git a/tests/acceptance/virtio-gpu.py b/tests/acceptance/virtio-gpu.py
new file mode 100644
index 0000000000..8da20dcc4a
--- /dev/null
+++ b/tests/acceptance/virtio-gpu.py
@@ -0,0 +1,150 @@
+# virtio-gpu tests
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+
+from avocado_qemu import Test
+from avocado_qemu import BUILD_DIR
+from avocado_qemu import wait_for_console_pattern
+from avocado_qemu import exec_command_and_wait_for_pattern
+from avocado_qemu import is_readable_executable_file
+
+from qemu.accel import kvm_available
+
+import os
+import socket
+import subprocess
+
+
+ACCEL_NOT_AVAILABLE_FMT = "%s accelerator does not seem to be available"
+KVM_NOT_AVAILABLE = ACCEL_NOT_AVAILABLE_FMT % "KVM"
+
+
+def pick_default_vug_bin():
+    relative_path = "./contrib/vhost-user-gpu/vhost-user-gpu"
+    if is_readable_executable_file(relative_path):
+        return relative_path
+
+    bld_dir_path = os.path.join(BUILD_DIR, relative_path)
+    if is_readable_executable_file(bld_dir_path):
+        return bld_dir_path
+
+
+class VirtioGPUx86(Test):
+    """
+    :avocado: tags=virtio-gpu
+    """
+
+    KERNEL_COMMON_COMMAND_LINE = "printk.time=0 "
+    KERNEL_URL = (
+        "https://archives.fedoraproject.org/pub/fedora"
+        "/linux/releases/33/Everything/x86_64/os/images"
+        "/pxeboot/vmlinuz"
+    )
+    INITRD_URL = (
+        "https://archives.fedoraproject.org/pub/fedora"
+        "/linux/releases/33/Everything/x86_64/os/images"
+        "/pxeboot/initrd.img"
+    )
+
+    def wait_for_console_pattern(self, success_message, vm=None):
+        wait_for_console_pattern(
+            self, success_message, failure_message="Kernel panic - not syncing", vm=vm
+        )
+
+    def test_virtio_vga_virgl(self):
+        """
+        :avocado: tags=arch:x86_64
+        :avocado: tags=device:virtio-vga
+        """
+        kernel_command_line = (
+            self.KERNEL_COMMON_COMMAND_LINE + "console=ttyS0 rdinit=/bin/bash"
+        )
+        # FIXME: should check presence of virtio, virgl etc
+        if not kvm_available(self.arch, self.qemu_bin):
+            self.cancel(KVM_NOT_AVAILABLE)
+
+        kernel_path = self.fetch_asset(self.KERNEL_URL)
+        initrd_path = self.fetch_asset(self.INITRD_URL)
+
+        self.vm.set_console()
+        self.vm.add_args("-cpu", "host")
+        self.vm.add_args("-m", "2G")
+        self.vm.add_args("-machine", "pc,accel=kvm")
+        self.vm.add_args("-device", "virtio-vga,virgl=on")
+        self.vm.add_args("-display", "egl-headless")
+        self.vm.add_args(
+            "-kernel",
+            kernel_path,
+            "-initrd",
+            initrd_path,
+            "-append",
+            kernel_command_line,
+        )
+        self.vm.launch()
+        self.wait_for_console_pattern("as init process")
+        exec_command_and_wait_for_pattern(self, "/usr/sbin/modprobe virtio_gpu", "")
+        self.wait_for_console_pattern("features: +virgl +edid")
+
+    def test_vhost_user_vga_virgl(self):
+        """
+        :avocado: tags=arch:x86_64
+        :avocado: tags=device:vhost-user-vga
+        """
+        kernel_command_line = (
+            self.KERNEL_COMMON_COMMAND_LINE + "console=ttyS0 rdinit=/bin/bash"
+        )
+        # FIXME: should check presence of vhost-user-gpu, virgl, memfd etc
+        if not kvm_available(self.arch, self.qemu_bin):
+            self.cancel(KVM_NOT_AVAILABLE)
+
+        vug = pick_default_vug_bin()
+        if not vug:
+            self.cancel("Could not find vhost-user-gpu")
+
+        kernel_path = self.fetch_asset(self.KERNEL_URL)
+        initrd_path = self.fetch_asset(self.INITRD_URL)
+
+        # Create socketpair to connect proxy and remote processes
+        qemu_sock, vug_sock = socket.socketpair(socket.AF_UNIX, socket.SOCK_STREAM)
+        os.set_inheritable(qemu_sock.fileno(), True)
+        os.set_inheritable(vug_sock.fileno(), True)
+
+        self._vug_log_path = os.path.join(self.vm._test_dir, "vhost-user-gpu.log")
+        self._vug_log_file = open(self._vug_log_path, "wb")
+        print(self._vug_log_path)
+
+        vugp = subprocess.Popen(
+            [vug, "--virgl", "--fd=%d" % vug_sock.fileno()],
+            stdin=subprocess.DEVNULL,
+            stdout=self._vug_log_file,
+            stderr=subprocess.STDOUT,
+            shell=False,
+            close_fds=False,
+        )
+
+        self.vm.set_console()
+        self.vm.add_args("-cpu", "host")
+        self.vm.add_args("-m", "2G")
+        self.vm.add_args("-object", "memory-backend-memfd,id=mem,size=2G")
+        self.vm.add_args("-machine", "pc,memory-backend=mem,accel=kvm")
+        self.vm.add_args("-chardev", "socket,id=vug,fd=%d" % qemu_sock.fileno())
+        self.vm.add_args("-device", "vhost-user-vga,chardev=vug")
+        self.vm.add_args("-display", "egl-headless")
+        self.vm.add_args(
+            "-kernel",
+            kernel_path,
+            "-initrd",
+            initrd_path,
+            "-append",
+            kernel_command_line,
+        )
+        self.vm.launch()
+        self.wait_for_console_pattern("as init process")
+        exec_command_and_wait_for_pattern(self, "/usr/sbin/modprobe virtio_gpu", "")
+        self.wait_for_console_pattern("features: +virgl -edid")
+        self.vm.shutdown()
+        qemu_sock.close()
+        vugp.terminate()
+        vugp.wait()
-- 
2.29.0


