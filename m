Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F81739BF65
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 20:13:53 +0200 (CEST)
Received: from localhost ([::1]:57612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpEKO-0006C4-HJ
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 14:13:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lpEGX-0001AK-46
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:09:53 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:55104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lpEGS-0000la-AB
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:09:52 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 10ACB21A35;
 Fri,  4 Jun 2021 18:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622830187; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Srz06KMKpdys2k4AiREoq/ONqW3q7VDkXlhRyzcUGNc=;
 b=ZnyY9G/RdbGb4TijGX/Pu1t5TgJt4x/LNdA5PRqE97DcrcUxOGYld431yEm6Osb+R4fLkz
 6Uw0GXOyBvQau7Si8uHcI6YVnBhzRJu326rbBb7LFVVlb3/BdsGEmfau/EdTdzJZrJ6dH+
 kqqE+0vrS1ZDwEMNZrhBXF6JqzAtVBI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622830187;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Srz06KMKpdys2k4AiREoq/ONqW3q7VDkXlhRyzcUGNc=;
 b=BDv4GiFTJBX1KyHU1MAI0DolLfyvBd75PME+O7xxdahOcppH2escfRqBgPTYpHb5jk+rnI
 KgBSKm/Fe+Drg8BA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id B4F83118DD;
 Fri,  4 Jun 2021 18:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622830187; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Srz06KMKpdys2k4AiREoq/ONqW3q7VDkXlhRyzcUGNc=;
 b=ZnyY9G/RdbGb4TijGX/Pu1t5TgJt4x/LNdA5PRqE97DcrcUxOGYld431yEm6Osb+R4fLkz
 6Uw0GXOyBvQau7Si8uHcI6YVnBhzRJu326rbBb7LFVVlb3/BdsGEmfau/EdTdzJZrJ6dH+
 kqqE+0vrS1ZDwEMNZrhBXF6JqzAtVBI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622830187;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Srz06KMKpdys2k4AiREoq/ONqW3q7VDkXlhRyzcUGNc=;
 b=BDv4GiFTJBX1KyHU1MAI0DolLfyvBd75PME+O7xxdahOcppH2escfRqBgPTYpHb5jk+rnI
 KgBSKm/Fe+Drg8BA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 4BSpKmpsumC8TwAALh3uQQ
 (envelope-from <cfontana@suse.de>); Fri, 04 Jun 2021 18:09:46 +0000
From: Claudio Fontana <cfontana@suse.de>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa Junior <crosa@redhat.com>
Subject: [PATCH v1 1/2] tests/acceptance: move pkg extraction to avocado_qemu/
Date: Fri,  4 Jun 2021 20:09:44 +0200
Message-Id: <20210604180945.9330-2-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210604180945.9330-1-cfontana@suse.de>
References: <20210604180945.9330-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

currently these utility functions are present only in boot_linux_console.py,
but they are useful in general, not just for linux.

In order to reuse them for a firmware test with OVMF, make these functions
general utility functions inside avocado_qemu/ , from where we will
punctually import them.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 tests/acceptance/avocado_qemu/__init__.py |  38 ++++++++
 tests/acceptance/boot_linux_console.py    | 104 +++++++---------------
 tests/acceptance/boot_xen.py              |   7 +-
 tests/acceptance/replay_kernel.py         |  23 ++---
 tests/acceptance/tcg_plugins.py           |   5 +-
 5 files changed, 91 insertions(+), 86 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 83b1741ec8..f625eb1ab7 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -21,6 +21,7 @@
 from avocado.utils import datadrainer
 from avocado.utils import network
 from avocado.utils import vmimage
+from avocado.utils import process
 from avocado.utils.path import find_command
 
 
@@ -140,6 +141,43 @@ def wait_for_console_pattern(test, success_message, failure_message=None,
     """
     _console_interaction(test, success_message, failure_message, None, vm=vm)
 
+def extract_from_deb(test, deb, path):
+    """
+    Extracts a file from a deb package into the test workdir
+
+    :param deb: path to the deb archive
+    :param path: path within the deb archive of the file to be extracted
+    :returns: path of the extracted file
+    """
+    cwd = os.getcwd()
+    os.chdir(test.workdir)
+    file_path = process.run("ar t %s" % deb).stdout_text.split()[2]
+    process.run("ar x %s %s" % (deb, file_path))
+    archive.extract(file_path, test.workdir)
+    os.chdir(cwd)
+    # Return complete path to extracted file.  Because callers to
+    # extract_from_deb() specify 'path' with a leading slash, it is
+    # necessary to use os.path.relpath() as otherwise os.path.join()
+    # interprets it as an absolute path and drops the test.workdir part.
+    return os.path.normpath(os.path.join(test.workdir,
+                                         os.path.relpath(path, '/')))
+
+def extract_from_rpm(test, rpm, path):
+    """
+    Extracts a file from an RPM package into the test workdir.
+
+    :param rpm: path to the rpm archive
+    :param path: path within the rpm archive of the file to be extracted
+                 needs to be a relative path (starting with './') because
+                 cpio(1), which is used to extract the file, expects that.
+    :returns: path of the extracted file
+    """
+    cwd = os.getcwd()
+    os.chdir(test.workdir)
+    process.run("rpm2cpio %s | cpio -id %s" % (rpm, path), shell=True)
+    os.chdir(cwd)
+    return os.path.normpath(os.path.join(test.workdir, path))
+
 def exec_command(test, command):
     """
     Send a command to a console (appending CRLF characters), while logging
diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 276a53f146..81fb1d796d 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -19,6 +19,7 @@
 from avocado_qemu import exec_command_and_wait_for_pattern
 from avocado_qemu import interrupt_interactive_console_until_pattern
 from avocado_qemu import wait_for_console_pattern
+from avocado_qemu import extract_from_deb
 from avocado.utils import process
 from avocado.utils import archive
 from avocado.utils.path import find_command, CmdNotFoundError
@@ -53,43 +54,6 @@ def wait_for_console_pattern(self, success_message, vm=None):
                                  failure_message='Kernel panic - not syncing',
                                  vm=vm)
 
-    def extract_from_deb(self, deb, path):
-        """
-        Extracts a file from a deb package into the test workdir
-
-        :param deb: path to the deb archive
-        :param path: path within the deb archive of the file to be extracted
-        :returns: path of the extracted file
-        """
-        cwd = os.getcwd()
-        os.chdir(self.workdir)
-        file_path = process.run("ar t %s" % deb).stdout_text.split()[2]
-        process.run("ar x %s %s" % (deb, file_path))
-        archive.extract(file_path, self.workdir)
-        os.chdir(cwd)
-        # Return complete path to extracted file.  Because callers to
-        # extract_from_deb() specify 'path' with a leading slash, it is
-        # necessary to use os.path.relpath() as otherwise os.path.join()
-        # interprets it as an absolute path and drops the self.workdir part.
-        return os.path.normpath(os.path.join(self.workdir,
-                                             os.path.relpath(path, '/')))
-
-    def extract_from_rpm(self, rpm, path):
-        """
-        Extracts a file from an RPM package into the test workdir.
-
-        :param rpm: path to the rpm archive
-        :param path: path within the rpm archive of the file to be extracted
-                     needs to be a relative path (starting with './') because
-                     cpio(1), which is used to extract the file, expects that.
-        :returns: path of the extracted file
-        """
-        cwd = os.getcwd()
-        os.chdir(self.workdir)
-        process.run("rpm2cpio %s | cpio -id %s" % (rpm, path), shell=True)
-        os.chdir(cwd)
-        return os.path.normpath(os.path.join(self.workdir, path))
-
 class BootLinuxConsole(LinuxKernelTest):
     """
     Boots a Linux kernel and checks that the console is operational and the
@@ -127,8 +91,8 @@ def test_mips_malta(self):
                    'linux-image-2.6.32-5-4kc-malta_2.6.32-48_mips.deb')
         deb_hash = 'a8cfc28ad8f45f54811fc6cf74fc43ffcfe0ba04'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinux-2.6.32-5-4kc-malta')
+        kernel_path = extract_from_deb(deb_path,
+                                       '/boot/vmlinux-2.6.32-5-4kc-malta')
 
         self.vm.set_console()
         kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + 'console=ttyS0'
@@ -159,8 +123,8 @@ def test_mips64el_malta(self):
                    'linux-image-2.6.32-5-5kc-malta_2.6.32-48_mipsel.deb')
         deb_hash = '1aaec92083bf22fda31e0d27fa8d9a388e5fc3d5'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinux-2.6.32-5-5kc-malta')
+        kernel_path = extract_from_deb(deb_path,
+                                       '/boot/vmlinux-2.6.32-5-5kc-malta')
 
         self.vm.set_console()
         kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + 'console=ttyS0'
@@ -180,8 +144,8 @@ def test_mips64el_fuloong2e(self):
                    'linux-image-3.16.0-6-loongson-2e_3.16.56-1+deb8u1_mipsel.deb')
         deb_hash = 'd04d446045deecf7b755ef576551de0c4184dd44'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinux-3.16.0-6-loongson-2e')
+        kernel_path = extract_from_deb(deb_path,
+                                       '/boot/vmlinux-3.16.0-6-loongson-2e')
 
         self.vm.set_console()
         kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + 'console=ttyS0'
@@ -202,8 +166,8 @@ def test_mips_malta_cpio(self):
                    'linux-image-4.5.0-2-4kc-malta_4.5.5-1_mips.deb')
         deb_hash = 'a3c84f3e88b54e06107d65a410d1d1e8e0f340f8'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinux-4.5.0-2-4kc-malta')
+        kernel_path = extract_from_deb(deb_path,
+                                       '/boot/vmlinux-4.5.0-2-4kc-malta')
         initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
                       '8584a59ed9e5eb5ee7ca91f6d74bbb06619205b8/rootfs/'
                       'mips/rootfs.cpio.gz')
@@ -441,8 +405,8 @@ def do_test_arm_raspi2(self, uart_id):
                    'raspberrypi-kernel_1.20190215-1_armhf.deb')
         deb_hash = 'cd284220b32128c5084037553db3c482426f3972'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path, '/boot/kernel7.img')
-        dtb_path = self.extract_from_deb(deb_path, '/boot/bcm2709-rpi-2-b.dtb')
+        kernel_path = extract_from_deb(deb_path, '/boot/kernel7.img')
+        dtb_path = extract_from_deb(deb_path, '/boot/bcm2709-rpi-2-b.dtb')
 
         self.vm.set_console()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
@@ -477,10 +441,10 @@ def test_arm_exynos4210_initrd(self):
                    'linux-image-4.19.0-6-armmp_4.19.67-2+deb10u1_armhf.deb')
         deb_hash = 'fa9df4a0d38936cb50084838f2cb933f570d7d82'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinuz-4.19.0-6-armmp')
+        kernel_path = extract_from_deb(deb_path,
+                                       '/boot/vmlinuz-4.19.0-6-armmp')
         dtb_path = '/usr/lib/linux-image-4.19.0-6-armmp/exynos4210-smdkv310.dtb'
-        dtb_path = self.extract_from_deb(deb_path, dtb_path)
+        dtb_path = extract_from_deb(deb_path, dtb_path)
 
         initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
                       '2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/'
@@ -516,10 +480,10 @@ def test_arm_cubieboard_initrd(self):
                    'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
         deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinuz-5.10.16-sunxi')
+        kernel_path = extract_from_deb(deb_path,
+                                       '/boot/vmlinuz-5.10.16-sunxi')
         dtb_path = '/usr/lib/linux-image-current-sunxi/sun4i-a10-cubieboard.dtb'
-        dtb_path = self.extract_from_deb(deb_path, dtb_path)
+        dtb_path = extract_from_deb(deb_path, dtb_path)
         initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
                       '2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/'
                       'arm/rootfs-armv5.cpio.gz')
@@ -556,10 +520,10 @@ def test_arm_cubieboard_sata(self):
                    'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
         deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinuz-5.10.16-sunxi')
+        kernel_path = extract_from_deb(deb_path,
+                                       '/boot/vmlinuz-5.10.16-sunxi')
         dtb_path = '/usr/lib/linux-image-current-sunxi/sun4i-a10-cubieboard.dtb'
-        dtb_path = self.extract_from_deb(deb_path, dtb_path)
+        dtb_path = extract_from_deb(deb_path, dtb_path)
         rootfs_url = ('https://github.com/groeck/linux-build-test/raw/'
                       '2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/'
                       'arm/rootfs-armv5.ext2.gz')
@@ -683,10 +647,10 @@ def test_arm_orangepi(self):
                    'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
         deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinuz-5.10.16-sunxi')
+        kernel_path = extract_from_deb(deb_path,
+                                       '/boot/vmlinuz-5.10.16-sunxi')
         dtb_path = '/usr/lib/linux-image-current-sunxi/sun8i-h3-orangepi-pc.dtb'
-        dtb_path = self.extract_from_deb(deb_path, dtb_path)
+        dtb_path = extract_from_deb(deb_path, dtb_path)
 
         self.vm.set_console()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
@@ -708,10 +672,10 @@ def test_arm_orangepi_initrd(self):
                    'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
         deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinuz-5.10.16-sunxi')
+        kernel_path = extract_from_deb(deb_path,
+                                       '/boot/vmlinuz-5.10.16-sunxi')
         dtb_path = '/usr/lib/linux-image-current-sunxi/sun8i-h3-orangepi-pc.dtb'
-        dtb_path = self.extract_from_deb(deb_path, dtb_path)
+        dtb_path = extract_from_deb(deb_path, dtb_path)
         initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
                       '2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/'
                       'arm/rootfs-armv7a.cpio.gz')
@@ -751,10 +715,10 @@ def test_arm_orangepi_sd(self):
                    'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
         deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinuz-5.10.16-sunxi')
+        kernel_path = extract_from_deb(deb_path,
+                                       '/boot/vmlinuz-5.10.16-sunxi')
         dtb_path = '/usr/lib/linux-image-current-sunxi/sun8i-h3-orangepi-pc.dtb'
-        dtb_path = self.extract_from_deb(deb_path, dtb_path)
+        dtb_path = extract_from_deb(deb_path, dtb_path)
         rootfs_url = ('http://storage.kernelci.org/images/rootfs/buildroot/'
                       'kci-2019.02/armel/base/rootfs.ext2.xz')
         rootfs_hash = '692510cb625efda31640d1de0a8d60e26040f061'
@@ -856,7 +820,7 @@ def test_arm_orangepi_uboot_netbsd9(self):
         # OrangePi "PC" device tree blob with 'setenv fdtfile' in U-Boot prompt,
         # before to boot NetBSD.
         uboot_path = '/usr/lib/u-boot/orangepi_plus/u-boot-sunxi-with-spl.bin'
-        uboot_path = self.extract_from_deb(deb_path, uboot_path)
+        uboot_path = extract_from_deb(deb_path, uboot_path)
         image_url = ('https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.0/'
                      'evbarm-earmv7hf/binary/gzimg/armv7.img.gz')
         image_hash = '2babb29d36d8360adcb39c09e31060945259917a'
@@ -976,8 +940,8 @@ def test_m68k_q800(self):
                    '/l/linux/kernel-image-5.3.0-1-m68k-di_5.3.7-1_m68k.udeb')
         deb_hash = '044954bb9be4160a3ce81f8bc1b5e856b75cccd1'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinux-5.3.0-1-m68k')
+        kernel_path = extract_from_deb(deb_path,
+                                       '/boot/vmlinux-5.3.0-1-m68k')
 
         self.vm.set_console()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
@@ -1065,8 +1029,8 @@ def test_arm_ast2600_debian(self):
         deb_hash = 'db40d32fe39255d05482bea48d72467b67d6225bb2a2a4d6f618cb8976f1e09e'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash,
                                     algorithm='sha256')
-        kernel_path = self.extract_from_deb(deb_path, '/boot/vmlinuz-5.10.0-3-armmp')
-        dtb_path = self.extract_from_deb(deb_path,
+        kernel_path = extract_from_deb(deb_path, '/boot/vmlinuz-5.10.0-3-armmp')
+        dtb_path = extract_from_deb(deb_path,
                 '/usr/lib/linux-image-5.10.0-3-armmp/aspeed-bmc-opp-tacoma.dtb')
 
         self.vm.set_console()
diff --git a/tests/acceptance/boot_xen.py b/tests/acceptance/boot_xen.py
index 75c2d44492..44ee809247 100644
--- a/tests/acceptance/boot_xen.py
+++ b/tests/acceptance/boot_xen.py
@@ -15,6 +15,7 @@
 
 from avocado import skipIf
 from avocado_qemu import wait_for_console_pattern
+from avocado_qemu import extract_from_deb
 from boot_linux_console import LinuxKernelTest
 
 
@@ -78,7 +79,7 @@ def test_arm64_xen_411_and_dom0(self):
                    'xen-hypervisor-4.11-arm64_4.11.4%2B37-g3263f257ca-1_arm64.deb')
         xen_sha1 = '034e634d4416adbad1212d59b62bccdcda63e62a'
         xen_deb = self.fetch_asset(xen_url, asset_hash=xen_sha1)
-        xen_path = self.extract_from_deb(xen_deb, "/boot/xen-4.11-arm64")
+        xen_path = extract_from_deb(xen_deb, "/boot/xen-4.11-arm64")
 
         self.launch_xen(xen_path)
 
@@ -96,7 +97,7 @@ def test_arm64_xen_414_and_dom0(self):
                    'xen-hypervisor-4.14-arm64_4.14.0%2B80-gd101b417b7-1_arm64.deb')
         xen_sha1 = 'b9d209dd689ed2b393e625303a225badefec1160'
         xen_deb = self.fetch_asset(xen_url, asset_hash=xen_sha1)
-        xen_path = self.extract_from_deb(xen_deb, "/boot/xen-4.14-arm64")
+        xen_path = extract_from_deb(xen_deb, "/boot/xen-4.14-arm64")
 
         self.launch_xen(xen_path)
 
@@ -113,6 +114,6 @@ def test_arm64_xen_415_and_dom0(self):
                    '?path=%2F&files=xen-upstream-4.15-unstable.deb')
         xen_sha1 = 'fc191172b85cf355abb95d275a24cc0f6d6579d8'
         xen_deb = self.fetch_asset(xen_url, asset_hash=xen_sha1)
-        xen_path = self.extract_from_deb(xen_deb, "/boot/xen-4.15-unstable")
+        xen_path = extract_from_deb(xen_deb, "/boot/xen-4.15-unstable")
 
         self.launch_xen(xen_path)
diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
index 71facdaa75..a8990952cc 100644
--- a/tests/acceptance/replay_kernel.py
+++ b/tests/acceptance/replay_kernel.py
@@ -18,6 +18,7 @@
 from avocado import skipIf
 from avocado import skipUnless
 from avocado_qemu import wait_for_console_pattern
+from avocado_qemu import extract_from_deb
 from avocado.utils import archive
 from avocado.utils import process
 from boot_linux_console import LinuxKernelTest
@@ -106,8 +107,8 @@ def test_mips_malta(self):
                    'linux-image-2.6.32-5-4kc-malta_2.6.32-48_mips.deb')
         deb_hash = 'a8cfc28ad8f45f54811fc6cf74fc43ffcfe0ba04'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinux-2.6.32-5-4kc-malta')
+        kernel_path = extract_from_deb(deb_path,
+                                       '/boot/vmlinux-2.6.32-5-4kc-malta')
         kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + 'console=ttyS0'
         console_pattern = 'Kernel command line: %s' % kernel_command_line
 
@@ -134,8 +135,8 @@ def test_mips64el_malta(self):
                    'linux-image-2.6.32-5-5kc-malta_2.6.32-48_mipsel.deb')
         deb_hash = '1aaec92083bf22fda31e0d27fa8d9a388e5fc3d5'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinux-2.6.32-5-5kc-malta')
+        kernel_path = extract_from_deb(deb_path,
+                                       '/boot/vmlinux-2.6.32-5-5kc-malta')
         kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + 'console=ttyS0'
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         self.run_rr(kernel_path, kernel_command_line, console_pattern, shift=5)
@@ -186,10 +187,10 @@ def test_arm_cubieboard_initrd(self):
                    'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
         deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinuz-5.10.16-sunxi')
+        kernel_path = extract_from_deb(deb_path,
+                                       '/boot/vmlinuz-5.10.16-sunxi')
         dtb_path = '/usr/lib/linux-image-current-sunxi/sun4i-a10-cubieboard.dtb'
-        dtb_path = self.extract_from_deb(deb_path, dtb_path)
+        dtb_path = extract_from_deb(deb_path, dtb_path)
         initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
                       '2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/'
                       'arm/rootfs-armv5.cpio.gz')
@@ -234,8 +235,8 @@ def test_m68k_q800(self):
                    '/l/linux/kernel-image-5.3.0-1-m68k-di_5.3.7-1_m68k.udeb')
         deb_hash = '044954bb9be4160a3ce81f8bc1b5e856b75cccd1'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinux-5.3.0-1-m68k')
+        kernel_path = extract_from_deb(deb_path,
+                                       '/boot/vmlinux-5.3.0-1-m68k')
 
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
                                'console=ttyS0 vga=off')
@@ -370,8 +371,8 @@ def test_mips_malta_cpio(self):
                    'linux-image-4.5.0-2-4kc-malta_4.5.5-1_mips.deb')
         deb_hash = 'a3c84f3e88b54e06107d65a410d1d1e8e0f340f8'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path,
-                                            '/boot/vmlinux-4.5.0-2-4kc-malta')
+        kernel_path = extract_from_deb(deb_path,
+                                       '/boot/vmlinux-4.5.0-2-4kc-malta')
         initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
                       '8584a59ed9e5eb5ee7ca91f6d74bbb06619205b8/rootfs/'
                       'mips/rootfs.cpio.gz')
diff --git a/tests/acceptance/tcg_plugins.py b/tests/acceptance/tcg_plugins.py
index c21bf9e52a..ed70e069a4 100644
--- a/tests/acceptance/tcg_plugins.py
+++ b/tests/acceptance/tcg_plugins.py
@@ -14,6 +14,7 @@
 import re
 
 from boot_linux_console import LinuxKernelTest
+from avocado_qemu import extract_from_deb
 
 
 class PluginKernelBase(LinuxKernelTest):
@@ -59,8 +60,8 @@ def _grab_aarch64_kernel(self):
                       'linux-image-4.19.0-12-arm64_4.19.152-1_arm64.deb')
         kernel_sha1 = '2036c2792f80ac9c4ccaae742b2e0a28385b6010'
         kernel_deb = self.fetch_asset(kernel_url, asset_hash=kernel_sha1)
-        kernel_path = self.extract_from_deb(kernel_deb,
-                                            "/boot/vmlinuz-4.19.0-12-arm64")
+        kernel_path = extract_from_deb(kernel_deb,
+                                       "/boot/vmlinuz-4.19.0-12-arm64")
         return kernel_path
 
     def test_aarch64_virt_insn(self):
-- 
2.26.2


