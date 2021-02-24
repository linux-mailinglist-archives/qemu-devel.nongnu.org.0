Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B75B3245CF
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 22:31:48 +0100 (CET)
Received: from localhost ([::1]:39000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF1l5-0004S1-BE
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 16:31:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lF1gq-00018e-Gy
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 16:27:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lF1go-0003GP-Aw
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 16:27:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614202040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EGnJ5+mA/Jzlx2dsbXiN3+hntg0gVz22LGUg7D8mIXw=;
 b=heliYG/odpzM6MJ61bGHrHFDuRBpjYH1AGt/5IcgT1YSSjTup0B6Ztp/n9YmJi9eXZ/vmT
 h5JrmSPSmrJJRDexvCPNe4xW9onQ72j6gKMQocQj1Ns5ikjaqTON2iYWNib4Bpd1SwHXR+
 2Dv9TslfXB9ZC1irj5t1Qd0JZ5TTSag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-zUalrIgzN1iodVrZ_7vKkg-1; Wed, 24 Feb 2021 16:27:18 -0500
X-MC-Unique: zUalrIgzN1iodVrZ_7vKkg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02F4C193578C;
 Wed, 24 Feb 2021 21:27:17 +0000 (UTC)
Received: from wainer-laptop.localdomain.com (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 427B65D6D3;
 Wed, 24 Feb 2021 21:27:10 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] tests/acceptance: Let the framework handle "cpu:VALUE"
 tagged tests
Date: Wed, 24 Feb 2021 18:26:53 -0300
Message-Id: <20210224212654.1146167-3-wainersm@redhat.com>
In-Reply-To: <20210224212654.1146167-1-wainersm@redhat.com>
References: <20210224212654.1146167-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: wrampazz@redhat.com, philmd@redhat.com, pavel.dovgaluk@ispras.ru,
 crosa@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The tests that are already tagged with "cpu:VALUE" don't need to add
"-cpu VALUE" to the list of arguments of the vm object because the avocado_qemu
framework is able to handle it automatically. So this adjust those tests and
ensure their cpu's VALUE are recognized by QEMU.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 tests/acceptance/boot_linux.py         |  3 ---
 tests/acceptance/machine_mips_malta.py |  7 +++----
 tests/acceptance/replay_kernel.py      |  8 +++-----
 tests/acceptance/reverse_debugging.py  |  2 +-
 tests/acceptance/tcg_plugins.py        | 15 +++++++--------
 5 files changed, 14 insertions(+), 21 deletions(-)

diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux.py
index 0d178038a0..55637d126e 100644
--- a/tests/acceptance/boot_linux.py
+++ b/tests/acceptance/boot_linux.py
@@ -82,7 +82,6 @@ def test_virt_tcg(self):
         """
         self.require_accelerator("tcg")
         self.vm.add_args("-accel", "tcg")
-        self.vm.add_args("-cpu", "max")
         self.vm.add_args("-machine", "virt,gic-version=2")
         self.add_common_args()
         self.launch_and_wait()
@@ -95,7 +94,6 @@ def test_virt_kvm_gicv2(self):
         """
         self.require_accelerator("kvm")
         self.vm.add_args("-accel", "kvm")
-        self.vm.add_args("-cpu", "host")
         self.vm.add_args("-machine", "virt,gic-version=2")
         self.add_common_args()
         self.launch_and_wait()
@@ -108,7 +106,6 @@ def test_virt_kvm_gicv3(self):
         """
         self.require_accelerator("kvm")
         self.vm.add_args("-accel", "kvm")
-        self.vm.add_args("-cpu", "host")
         self.vm.add_args("-machine", "virt,gic-version=3")
         self.add_common_args()
         self.launch_and_wait()
diff --git a/tests/acceptance/machine_mips_malta.py b/tests/acceptance/machine_mips_malta.py
index 7c9a4ee4d2..b67d8cb141 100644
--- a/tests/acceptance/machine_mips_malta.py
+++ b/tests/acceptance/machine_mips_malta.py
@@ -62,7 +62,6 @@ def do_test_i6400_framebuffer_logo(self, cpu_cores_count):
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
                                'clocksource=GIC console=tty0 console=ttyS0')
         self.vm.add_args('-kernel', kernel_path,
-                         '-cpu', 'I6400',
                          '-smp', '%u' % cpu_cores_count,
                          '-vga', 'std',
                          '-append', kernel_command_line)
@@ -96,7 +95,7 @@ def test_mips_malta_i6400_framebuffer_logo_1core(self):
         """
         :avocado: tags=arch:mips64el
         :avocado: tags=machine:malta
-        :avocado: tags=cpu:i6400
+        :avocado: tags=cpu:I6400
         """
         self.do_test_i6400_framebuffer_logo(1)
 
@@ -105,7 +104,7 @@ def test_mips_malta_i6400_framebuffer_logo_7cores(self):
         """
         :avocado: tags=arch:mips64el
         :avocado: tags=machine:malta
-        :avocado: tags=cpu:i6400
+        :avocado: tags=cpu:I6400
         :avocado: tags=mips:smp
         """
         self.do_test_i6400_framebuffer_logo(7)
@@ -115,7 +114,7 @@ def test_mips_malta_i6400_framebuffer_logo_8cores(self):
         """
         :avocado: tags=arch:mips64el
         :avocado: tags=machine:malta
-        :avocado: tags=cpu:i6400
+        :avocado: tags=cpu:I6400
         :avocado: tags=mips:smp
         """
         self.do_test_i6400_framebuffer_logo(8)
diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
index c1cb862468..6ae18485be 100644
--- a/tests/acceptance/replay_kernel.py
+++ b/tests/acceptance/replay_kernel.py
@@ -156,8 +156,7 @@ def test_aarch64_virt(self):
                                'console=ttyAMA0')
         console_pattern = 'VFS: Cannot open root device'
 
-        self.run_rr(kernel_path, kernel_command_line, console_pattern,
-                    args=('-cpu', 'cortex-a53'))
+        self.run_rr(kernel_path, kernel_command_line, console_pattern)
 
     def test_arm_virt(self):
         """
@@ -303,7 +302,7 @@ def test_ppc64_e500(self):
         tar_url = ('https://www.qemu-advent-calendar.org'
                    '/2018/download/day19.tar.xz')
         file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
-        self.do_test_advcal_2018(file_path, 'uImage', ('-cpu', 'e5500'))
+        self.do_test_advcal_2018(file_path, 'uImage')
 
     def test_ppc_g3beige(self):
         """
@@ -350,8 +349,7 @@ def test_xtensa_lx60(self):
         tar_url = ('https://www.qemu-advent-calendar.org'
                    '/2018/download/day02.tar.xz')
         file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
-        self.do_test_advcal_2018(file_path, 'santas-sleigh-ride.elf',
-                                 args=('-cpu', 'dc233c'))
+        self.do_test_advcal_2018(file_path, 'santas-sleigh-ride.elf')
 
 @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
 class ReplayKernelSlow(ReplayKernelBase):
diff --git a/tests/acceptance/reverse_debugging.py b/tests/acceptance/reverse_debugging.py
index be01aca217..d2921e70c3 100644
--- a/tests/acceptance/reverse_debugging.py
+++ b/tests/acceptance/reverse_debugging.py
@@ -207,4 +207,4 @@ def test_aarch64_virt(self):
         kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
 
         self.reverse_debugging(
-            args=('-kernel', kernel_path, '-cpu', 'cortex-a53'))
+            args=('-kernel', kernel_path))
diff --git a/tests/acceptance/tcg_plugins.py b/tests/acceptance/tcg_plugins.py
index c21bf9e52a..9ca1515c3b 100644
--- a/tests/acceptance/tcg_plugins.py
+++ b/tests/acceptance/tcg_plugins.py
@@ -25,7 +25,7 @@ class PluginKernelBase(LinuxKernelTest):
     KERNEL_COMMON_COMMAND_LINE = 'printk.time=1 panic=-1 '
 
     def run_vm(self, kernel_path, kernel_command_line,
-               plugin, plugin_log, console_pattern, args):
+               plugin, plugin_log, console_pattern, args=None):
 
         vm = self.get_vm()
         vm.set_console()
@@ -68,7 +68,7 @@ def test_aarch64_virt_insn(self):
         :avocado: tags=accel:tcg
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:virt
-        :avocado: tags=cpu:cortex-a57
+        :avocado: tags=cpu:cortex-a53
         """
         kernel_path = self._grab_aarch64_kernel()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
@@ -80,8 +80,7 @@ def test_aarch64_virt_insn(self):
 
         self.run_vm(kernel_path, kernel_command_line,
                     "tests/plugin/libinsn.so", plugin_log.name,
-                    console_pattern,
-                    args=('-cpu', 'cortex-a53'))
+                    console_pattern)
 
         with plugin_log as lf, \
              mmap.mmap(lf.fileno(), 0, access=mmap.ACCESS_READ) as s:
@@ -95,7 +94,7 @@ def test_aarch64_virt_insn_icount(self):
         :avocado: tags=accel:tcg
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:virt
-        :avocado: tags=cpu:cortex-a57
+        :avocado: tags=cpu:cortex-a53
         """
         kernel_path = self._grab_aarch64_kernel()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
@@ -108,7 +107,7 @@ def test_aarch64_virt_insn_icount(self):
         self.run_vm(kernel_path, kernel_command_line,
                     "tests/plugin/libinsn.so", plugin_log.name,
                     console_pattern,
-                    args=('-cpu', 'cortex-a53', '-icount', 'shift=1'))
+                    args=('-icount', 'shift=1'))
 
         with plugin_log as lf, \
              mmap.mmap(lf.fileno(), 0, access=mmap.ACCESS_READ) as s:
@@ -121,7 +120,7 @@ def test_aarch64_virt_mem_icount(self):
         :avocado: tags=accel:tcg
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:virt
-        :avocado: tags=cpu:cortex-a57
+        :avocado: tags=cpu:cortex-a53
         """
         kernel_path = self._grab_aarch64_kernel()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
@@ -134,7 +133,7 @@ def test_aarch64_virt_mem_icount(self):
         self.run_vm(kernel_path, kernel_command_line,
                     "tests/plugin/libmem.so,arg=both", plugin_log.name,
                     console_pattern,
-                    args=('-cpu', 'cortex-a53', '-icount', 'shift=1'))
+                    args=('-icount', 'shift=1'))
 
         with plugin_log as lf, \
              mmap.mmap(lf.fileno(), 0, access=mmap.ACCESS_READ) as s:
-- 
2.29.2


