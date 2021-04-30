Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5480D36FBD1
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 15:57:44 +0200 (CEST)
Received: from localhost ([::1]:57676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcTeJ-0005mF-Dy
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 09:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lcTIr-0005Q2-Az
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:35:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lcTIm-000871-7x
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:35:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619789727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4XULC5XbmndB5H1HDhnXpkwm2ePxPV19wF1afoVOQlE=;
 b=SD0h8NbG1fdUAcbPArJVT3QFxZ/7WStO6P3g7WHWRMrwPbcf4zBLkN+EXlFO8QQX19YAKs
 ZyOfcBShq0h1LLIwS394ln0I7caQ4wQzaZrAjvXgvrJ/+DP/hmJzo8Qco4bSmUOY3i0YD/
 pJfmOFISgGgNKpIFa4SAoH9EpA8M124=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-gUoeYj9tPRKKhrPJ-59rVw-1; Fri, 30 Apr 2021 09:35:23 -0400
X-MC-Unique: gUoeYj9tPRKKhrPJ-59rVw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F2D0100A671;
 Fri, 30 Apr 2021 13:35:05 +0000 (UTC)
Received: from wainer-laptop.localdomain.com (ovpn-116-202.gru2.redhat.com
 [10.97.116.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE8C05D9E2;
 Fri, 30 Apr 2021 13:34:58 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/7] tests/acceptance: Let the framework handle "cpu:VALUE"
 tagged tests
Date: Fri, 30 Apr 2021 10:34:10 -0300
Message-Id: <20210430133414.39905-4-wainersm@redhat.com>
In-Reply-To: <20210430133414.39905-1-wainersm@redhat.com>
References: <20210430133414.39905-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: wrampazz@redhat.com, philmd@redhat.com,
 Willian Rampazzo <willianr@redhat.com>, pavel.dovgaluk@ispras.ru,
 crosa@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The tests that are already tagged with "cpu:VALUE" don't need to add
"-cpu VALUE" to the list of arguments of the vm object because the avocado_qemu
framework is able to handle it automatically.

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 tests/acceptance/boot_linux.py         | 3 ---
 tests/acceptance/boot_xen.py           | 1 -
 tests/acceptance/machine_mips_malta.py | 1 -
 tests/acceptance/replay_kernel.py      | 8 +++-----
 tests/acceptance/reverse_debugging.py  | 2 +-
 tests/acceptance/tcg_plugins.py        | 9 ++++-----
 6 files changed, 8 insertions(+), 16 deletions(-)

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
diff --git a/tests/acceptance/boot_xen.py b/tests/acceptance/boot_xen.py
index 75c2d44492..3479b5233b 100644
--- a/tests/acceptance/boot_xen.py
+++ b/tests/acceptance/boot_xen.py
@@ -48,7 +48,6 @@ def launch_xen(self, xen_path):
 
         xen_command_line = self.XEN_COMMON_COMMAND_LINE
         self.vm.add_args('-machine', 'virtualization=on',
-                         '-cpu', 'cortex-a57',
                          '-m', '768',
                          '-kernel', xen_path,
                          '-append', xen_command_line,
diff --git a/tests/acceptance/machine_mips_malta.py b/tests/acceptance/machine_mips_malta.py
index b1fd075f51..b67d8cb141 100644
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
diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
index 71facdaa75..75f80506c1 100644
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
@@ -301,7 +300,7 @@ def test_ppc64_e500(self):
         tar_url = ('https://www.qemu-advent-calendar.org'
                    '/2018/download/day19.tar.xz')
         file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
-        self.do_test_advcal_2018(file_path, 'uImage', ('-cpu', 'e5500'))
+        self.do_test_advcal_2018(file_path, 'uImage')
 
     def test_ppc_g3beige(self):
         """
@@ -348,8 +347,7 @@ def test_xtensa_lx60(self):
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
index aa6e18b62d..9ca1515c3b 100644
--- a/tests/acceptance/tcg_plugins.py
+++ b/tests/acceptance/tcg_plugins.py
@@ -25,7 +25,7 @@ class PluginKernelBase(LinuxKernelTest):
     KERNEL_COMMON_COMMAND_LINE = 'printk.time=1 panic=-1 '
 
     def run_vm(self, kernel_path, kernel_command_line,
-               plugin, plugin_log, console_pattern, args):
+               plugin, plugin_log, console_pattern, args=None):
 
         vm = self.get_vm()
         vm.set_console()
@@ -80,8 +80,7 @@ def test_aarch64_virt_insn(self):
 
         self.run_vm(kernel_path, kernel_command_line,
                     "tests/plugin/libinsn.so", plugin_log.name,
-                    console_pattern,
-                    args=('-cpu', 'cortex-a53'))
+                    console_pattern)
 
         with plugin_log as lf, \
              mmap.mmap(lf.fileno(), 0, access=mmap.ACCESS_READ) as s:
@@ -108,7 +107,7 @@ def test_aarch64_virt_insn_icount(self):
         self.run_vm(kernel_path, kernel_command_line,
                     "tests/plugin/libinsn.so", plugin_log.name,
                     console_pattern,
-                    args=('-cpu', 'cortex-a53', '-icount', 'shift=1'))
+                    args=('-icount', 'shift=1'))
 
         with plugin_log as lf, \
              mmap.mmap(lf.fileno(), 0, access=mmap.ACCESS_READ) as s:
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


