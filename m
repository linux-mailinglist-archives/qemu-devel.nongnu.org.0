Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CAF358E12
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 22:07:37 +0200 (CEST)
Received: from localhost ([::1]:53554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUaw4-00038E-W4
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 16:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lUatx-0001US-Oh
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 16:05:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lUatv-0004MS-Dr
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 16:05:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617912314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tz9OLhPvFRbkDcRkrknVyEDubsycO9QE/kuKdqY6EfU=;
 b=IhxVWKxIAVK/8dsP1xx/Tz23WOSpvmr+xxU7JoDbw9j/5Y7fLCwHxEXYDugJyNGrvx1rRJ
 7Gk7JJU2Ji9ALkdgGUPLtGxNKCxe/oacACc+Px5tthJKD7D1/btJalht0Djr3oZFfSZhjJ
 y06DTzmUd4w/3cIjJtNHMAo4i1q/qe8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-VcvCL4zHO4iay39mh0p2Iw-1; Thu, 08 Apr 2021 16:05:10 -0400
X-MC-Unique: VcvCL4zHO4iay39mh0p2Iw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 213689BE3B5;
 Thu,  8 Apr 2021 19:53:31 +0000 (UTC)
Received: from wainer-laptop.localdomain.com (ovpn-116-57.gru2.redhat.com
 [10.97.116.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE63B60864;
 Thu,  8 Apr 2021 19:53:19 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/7] tests/acceptance: Let the framework handle "cpu:VALUE"
 tagged tests
Date: Thu,  8 Apr 2021 16:52:33 -0300
Message-Id: <20210408195237.3489296-4-wainersm@redhat.com>
In-Reply-To: <20210408195237.3489296-1-wainersm@redhat.com>
References: <20210408195237.3489296-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: wrampazz@redhat.com, philmd@redhat.com, pavel.dovgaluk@ispras.ru,
 crosa@redhat.com, pbonzini@redhat.com, alex.bennee@linaro.org,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The tests that are already tagged with "cpu:VALUE" don't need to add
"-cpu VALUE" to the list of arguments of the vm object because the avocado_qemu
framework is able to handle it automatically.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 tests/acceptance/boot_linux.py         | 3 ---
 tests/acceptance/machine_mips_malta.py | 1 -
 tests/acceptance/replay_kernel.py      | 8 +++-----
 tests/acceptance/reverse_debugging.py  | 2 +-
 tests/acceptance/tcg_plugins.py        | 9 ++++-----
 5 files changed, 8 insertions(+), 15 deletions(-)

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


