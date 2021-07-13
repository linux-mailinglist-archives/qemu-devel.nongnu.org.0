Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AB13C7919
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 23:40:40 +0200 (CEST)
Received: from localhost ([::1]:56912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Q8t-0000YN-SS
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 17:40:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m3Pqg-0003TE-Je
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 17:21:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m3Pqb-0000M5-PW
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 17:21:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626211304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jIPqrucXgCQLRwS3ADnW9VQVQAYQkQWhk23O+X1mY7w=;
 b=BAa9CO3q/j8BNMrdW5+g/7HcI27tJq39RKEOg7tYtMyCkqgm/YpCHn/n67brDi3DDiOEgV
 0H8lMgLF9eqXA1212BTpC79R2WIZSC+p9Hu/T3OP1GZwp50yRKqJL/w7U1HNUzdPshv4vE
 Ozhnc0bVrr/z8cKnBjCMzL9fy/IddhU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-PV9AiBsxPZG7R1dC6e0p4A-1; Tue, 13 Jul 2021 17:21:39 -0400
X-MC-Unique: PV9AiBsxPZG7R1dC6e0p4A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0936802C80;
 Tue, 13 Jul 2021 21:21:36 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F0DD19C44;
 Tue, 13 Jul 2021 21:21:34 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 15/23] tests/acceptance: Let the framework handle "cpu:VALUE"
 tagged tests
Date: Tue, 13 Jul 2021 17:19:15 -0400
Message-Id: <20210713211923.3809241-16-crosa@redhat.com>
In-Reply-To: <20210713211923.3809241-1-crosa@redhat.com>
References: <20210713211923.3809241-1-crosa@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Ryo ONODERA <ryoon@netbsd.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wainer dos Santos Moschetta <wainersm@redhat.com>

The tests that are already tagged with "cpu:VALUE" don't need to add
"-cpu VALUE" to the list of arguments of the vm object because the avocado_qemu
framework is able to handle it automatically.

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210430133414.39905-4-wainersm@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/boot_linux.py         | 3 ---
 tests/acceptance/boot_xen.py           | 1 -
 tests/acceptance/machine_mips_malta.py | 1 -
 tests/acceptance/replay_kernel.py      | 8 +++-----
 tests/acceptance/reverse_debugging.py  | 2 +-
 tests/acceptance/tcg_plugins.py        | 9 ++++-----
 6 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux.py
index 34c4366366..ab19146d1e 100644
--- a/tests/acceptance/boot_linux.py
+++ b/tests/acceptance/boot_linux.py
@@ -79,7 +79,6 @@ def test_virt_tcg_gicv2(self):
         """
         self.require_accelerator("tcg")
         self.vm.add_args("-accel", "tcg")
-        self.vm.add_args("-cpu", "max")
         self.vm.add_args("-machine", "virt,gic-version=2")
         self.add_common_args()
         self.launch_and_wait(set_up_ssh_connection=False)
@@ -92,7 +91,6 @@ def test_virt_tcg_gicv3(self):
         """
         self.require_accelerator("tcg")
         self.vm.add_args("-accel", "tcg")
-        self.vm.add_args("-cpu", "max")
         self.vm.add_args("-machine", "virt,gic-version=3")
         self.add_common_args()
         self.launch_and_wait(set_up_ssh_connection=False)
@@ -104,7 +102,6 @@ def test_virt_kvm(self):
         """
         self.require_accelerator("kvm")
         self.vm.add_args("-accel", "kvm")
-        self.vm.add_args("-cpu", "host")
         self.vm.add_args("-machine", "virt,gic-version=host")
         self.add_common_args()
         self.launch_and_wait(set_up_ssh_connection=False)
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
2.31.1


