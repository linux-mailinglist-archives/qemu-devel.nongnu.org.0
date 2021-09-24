Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D79417B7E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 21:09:37 +0200 (CEST)
Received: from localhost ([::1]:43980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTqZk-0003Z2-3z
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 15:09:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1mTqOG-0003cj-QO
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 14:57:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1mTqOE-0005Gr-3h
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 14:57:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632509860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WTc5EJCD/42wZkGhsMM5lcIaAiUqyTwvJKzb/aJWQ9s=;
 b=cu7+k2hu/47F5QCqDxs4VvzQAI95oCwMIDQgbJv9spguC/i9Co5dkq6x7maoJcaCBzh2/P
 bDq+4LIg6O6Mr/VrAuc7XbYvWz9NegaUqLpG7ihQzGNXWYieX+Y5swrlCSrFf7rUZrd6f3
 AzjKXVlP3aMbz0V4sdPUk6mmgx//P0M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-3JLuWwrAMuyVRCjCxDczSw-1; Fri, 24 Sep 2021 14:57:37 -0400
X-MC-Unique: 3JLuWwrAMuyVRCjCxDczSw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D385A0CAC;
 Fri, 24 Sep 2021 18:57:35 +0000 (UTC)
Received: from p50.net (unknown [10.22.33.186])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A5FC87621D;
 Fri, 24 Sep 2021 18:57:24 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/16] Acceptance Tests: use extract from package from
 avocado.utils
Date: Fri, 24 Sep 2021 14:54:56 -0400
Message-Id: <20210924185506.2542588-7-crosa@redhat.com>
In-Reply-To: <20210924185506.2542588-1-crosa@redhat.com>
References: <20210924185506.2542588-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.473, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Greg Kurz <groug@kaod.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's code in avocado.utils to handle package extractions in various
(currently rpm, and deb) formats.  Let's use it.

Reference: https://avocado-framework.readthedocs.io/en/91.0/api/utils/avocado.utils.software_manager.html#avocado.utils.software_manager.SoftwareManager.extract_from_package
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/boot_linux_console.py | 84 ++++++++++----------------
 tests/acceptance/boot_xen.py           |  6 +-
 tests/acceptance/replay_kernel.py      | 12 ++--
 tests/acceptance/tcg_plugins.py        |  2 +-
 4 files changed, 41 insertions(+), 63 deletions(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 4c824bc161..80e3a2f7a6 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -23,6 +23,7 @@
 from avocado.utils import process
 from avocado.utils import archive
 from avocado.utils.path import find_command, CmdNotFoundError
+from avocado.utils.software_manager import SoftwareManager
 
 P7ZIP_AVAILABLE = True
 try:
@@ -54,42 +55,19 @@ def wait_for_console_pattern(self, success_message, vm=None):
                                  failure_message='Kernel panic - not syncing',
                                  vm=vm)
 
-    def extract_from_deb(self, deb, path):
+    def extract_from_pkg(self, pkg, path):
         """
-        Extracts a file from a deb package into the test workdir
+        Extracts a file from a DEB or RPM package into the test workdir
 
-        :param deb: path to the deb archive
-        :param path: path within the deb archive of the file to be extracted
+        :param pkg: path to the DEB or RPM package
+        :param path: path within the DEB or RPM archive of the file to
+                          be extracted
         :returns: path of the extracted file
         """
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
+        SoftwareManager.extract_from_package(pkg, self.workdir)
         return os.path.normpath(os.path.join(self.workdir,
                                              os.path.relpath(path, '/')))
 
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
 
 class BootLinuxConsole(LinuxKernelTest):
     """
@@ -128,7 +106,7 @@ def test_mips_malta(self):
                    'linux-image-2.6.32-5-4kc-malta_2.6.32-48_mips.deb')
         deb_hash = 'a8cfc28ad8f45f54811fc6cf74fc43ffcfe0ba04'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path,
+        kernel_path = self.extract_from_pkg(deb_path,
                                             '/boot/vmlinux-2.6.32-5-4kc-malta')
 
         self.vm.set_console()
@@ -160,7 +138,7 @@ def test_mips64el_malta(self):
                    'linux-image-2.6.32-5-5kc-malta_2.6.32-48_mipsel.deb')
         deb_hash = '1aaec92083bf22fda31e0d27fa8d9a388e5fc3d5'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path,
+        kernel_path = self.extract_from_pkg(deb_path,
                                             '/boot/vmlinux-2.6.32-5-5kc-malta')
 
         self.vm.set_console()
@@ -181,7 +159,7 @@ def test_mips64el_fuloong2e(self):
                    'linux-image-3.16.0-6-loongson-2e_3.16.56-1+deb8u1_mipsel.deb')
         deb_hash = 'd04d446045deecf7b755ef576551de0c4184dd44'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path,
+        kernel_path = self.extract_from_pkg(deb_path,
                                             '/boot/vmlinux-3.16.0-6-loongson-2e')
 
         self.vm.set_console()
@@ -203,7 +181,7 @@ def test_mips_malta_cpio(self):
                    'linux-image-4.5.0-2-4kc-malta_4.5.5-1_mips.deb')
         deb_hash = 'a3c84f3e88b54e06107d65a410d1d1e8e0f340f8'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path,
+        kernel_path = self.extract_from_pkg(deb_path,
                                             '/boot/vmlinux-4.5.0-2-4kc-malta')
         initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
                       '8584a59ed9e5eb5ee7ca91f6d74bbb06619205b8/rootfs/'
@@ -454,8 +432,8 @@ def do_test_arm_raspi2(self, uart_id):
                    'raspberrypi-kernel_1.20190215-1_armhf.deb')
         deb_hash = 'cd284220b32128c5084037553db3c482426f3972'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path, '/boot/kernel7.img')
-        dtb_path = self.extract_from_deb(deb_path, '/boot/bcm2709-rpi-2-b.dtb')
+        kernel_path = self.extract_from_pkg(deb_path, '/boot/kernel7.img')
+        dtb_path = self.extract_from_pkg(deb_path, '/boot/bcm2709-rpi-2-b.dtb')
 
         self.vm.set_console()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
@@ -494,8 +472,8 @@ def test_arm_raspi2_initrd(self):
                    'raspberrypi-kernel_1.20190215-1_armhf.deb')
         deb_hash = 'cd284220b32128c5084037553db3c482426f3972'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path, '/boot/kernel7.img')
-        dtb_path = self.extract_from_deb(deb_path, '/boot/bcm2709-rpi-2-b.dtb')
+        kernel_path = self.extract_from_pkg(deb_path, '/boot/kernel7.img')
+        dtb_path = self.extract_from_pkg(deb_path, '/boot/bcm2709-rpi-2-b.dtb')
 
         initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
                       '2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/'
@@ -537,10 +515,10 @@ def test_arm_exynos4210_initrd(self):
                    'linux-image-4.19.0-6-armmp_4.19.67-2+deb10u1_armhf.deb')
         deb_hash = 'fa9df4a0d38936cb50084838f2cb933f570d7d82'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path,
+        kernel_path = self.extract_from_pkg(deb_path,
                                             '/boot/vmlinuz-4.19.0-6-armmp')
         dtb_path = '/usr/lib/linux-image-4.19.0-6-armmp/exynos4210-smdkv310.dtb'
-        dtb_path = self.extract_from_deb(deb_path, dtb_path)
+        dtb_path = self.extract_from_pkg(deb_path, dtb_path)
 
         initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
                       '2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/'
@@ -577,10 +555,10 @@ def test_arm_cubieboard_initrd(self):
                    'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
         deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path,
+        kernel_path = self.extract_from_pkg(deb_path,
                                             '/boot/vmlinuz-5.10.16-sunxi')
         dtb_path = '/usr/lib/linux-image-current-sunxi/sun4i-a10-cubieboard.dtb'
-        dtb_path = self.extract_from_deb(deb_path, dtb_path)
+        dtb_path = self.extract_from_pkg(deb_path, dtb_path)
         initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
                       '2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/'
                       'arm/rootfs-armv5.cpio.gz')
@@ -618,10 +596,10 @@ def test_arm_cubieboard_sata(self):
                    'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
         deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path,
+        kernel_path = self.extract_from_pkg(deb_path,
                                             '/boot/vmlinuz-5.10.16-sunxi')
         dtb_path = '/usr/lib/linux-image-current-sunxi/sun4i-a10-cubieboard.dtb'
-        dtb_path = self.extract_from_deb(deb_path, dtb_path)
+        dtb_path = self.extract_from_pkg(deb_path, dtb_path)
         rootfs_url = ('https://github.com/groeck/linux-build-test/raw/'
                       '2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/'
                       'arm/rootfs-armv5.ext2.gz')
@@ -748,10 +726,10 @@ def test_arm_orangepi(self):
                    'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
         deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path,
+        kernel_path = self.extract_from_pkg(deb_path,
                                             '/boot/vmlinuz-5.10.16-sunxi')
         dtb_path = '/usr/lib/linux-image-current-sunxi/sun8i-h3-orangepi-pc.dtb'
-        dtb_path = self.extract_from_deb(deb_path, dtb_path)
+        dtb_path = self.extract_from_pkg(deb_path, dtb_path)
 
         self.vm.set_console()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
@@ -774,10 +752,10 @@ def test_arm_orangepi_initrd(self):
                    'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
         deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path,
+        kernel_path = self.extract_from_pkg(deb_path,
                                             '/boot/vmlinuz-5.10.16-sunxi')
         dtb_path = '/usr/lib/linux-image-current-sunxi/sun8i-h3-orangepi-pc.dtb'
-        dtb_path = self.extract_from_deb(deb_path, dtb_path)
+        dtb_path = self.extract_from_pkg(deb_path, dtb_path)
         initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
                       '2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/'
                       'arm/rootfs-armv7a.cpio.gz')
@@ -818,10 +796,10 @@ def test_arm_orangepi_sd(self):
                    'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
         deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path,
+        kernel_path = self.extract_from_pkg(deb_path,
                                             '/boot/vmlinuz-5.10.16-sunxi')
         dtb_path = '/usr/lib/linux-image-current-sunxi/sun8i-h3-orangepi-pc.dtb'
-        dtb_path = self.extract_from_deb(deb_path, dtb_path)
+        dtb_path = self.extract_from_pkg(deb_path, dtb_path)
         rootfs_url = ('http://storage.kernelci.org/images/rootfs/buildroot/'
                       'kci-2019.02/armel/base/rootfs.ext2.xz')
         rootfs_hash = '692510cb625efda31640d1de0a8d60e26040f061'
@@ -924,7 +902,7 @@ def test_arm_orangepi_uboot_netbsd9(self):
         # OrangePi "PC" device tree blob with 'setenv fdtfile' in U-Boot prompt,
         # before to boot NetBSD.
         uboot_path = '/usr/lib/u-boot/orangepi_plus/u-boot-sunxi-with-spl.bin'
-        uboot_path = self.extract_from_deb(deb_path, uboot_path)
+        uboot_path = self.extract_from_pkg(deb_path, uboot_path)
         image_url = ('https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.0/'
                      'evbarm-earmv7hf/binary/gzimg/armv7.img.gz')
         image_hash = '2babb29d36d8360adcb39c09e31060945259917a'
@@ -1044,7 +1022,7 @@ def test_m68k_q800(self):
                    '/l/linux/kernel-image-5.3.0-1-m68k-di_5.3.7-1_m68k.udeb')
         deb_hash = '044954bb9be4160a3ce81f8bc1b5e856b75cccd1'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path,
+        kernel_path = self.extract_from_pkg(deb_path,
                                             '/boot/vmlinux-5.3.0-1-m68k')
 
         self.vm.set_console()
@@ -1133,8 +1111,8 @@ def test_arm_ast2600_debian(self):
         deb_hash = 'db40d32fe39255d05482bea48d72467b67d6225bb2a2a4d6f618cb8976f1e09e'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash,
                                     algorithm='sha256')
-        kernel_path = self.extract_from_deb(deb_path, '/boot/vmlinuz-5.10.0-3-armmp')
-        dtb_path = self.extract_from_deb(deb_path,
+        kernel_path = self.extract_from_pkg(deb_path, '/boot/vmlinuz-5.10.0-3-armmp')
+        dtb_path = self.extract_from_pkg(deb_path,
                 '/usr/lib/linux-image-5.10.0-3-armmp/aspeed-bmc-opp-tacoma.dtb')
 
         self.vm.set_console()
diff --git a/tests/acceptance/boot_xen.py b/tests/acceptance/boot_xen.py
index 3479b5233b..b5860b7d88 100644
--- a/tests/acceptance/boot_xen.py
+++ b/tests/acceptance/boot_xen.py
@@ -77,7 +77,7 @@ def test_arm64_xen_411_and_dom0(self):
                    'xen-hypervisor-4.11-arm64_4.11.4%2B37-g3263f257ca-1_arm64.deb')
         xen_sha1 = '034e634d4416adbad1212d59b62bccdcda63e62a'
         xen_deb = self.fetch_asset(xen_url, asset_hash=xen_sha1)
-        xen_path = self.extract_from_deb(xen_deb, "/boot/xen-4.11-arm64")
+        xen_path = self.extract_from_pkg(xen_deb, "/boot/xen-4.11-arm64")
 
         self.launch_xen(xen_path)
 
@@ -95,7 +95,7 @@ def test_arm64_xen_414_and_dom0(self):
                    'xen-hypervisor-4.14-arm64_4.14.0%2B80-gd101b417b7-1_arm64.deb')
         xen_sha1 = 'b9d209dd689ed2b393e625303a225badefec1160'
         xen_deb = self.fetch_asset(xen_url, asset_hash=xen_sha1)
-        xen_path = self.extract_from_deb(xen_deb, "/boot/xen-4.14-arm64")
+        xen_path = self.extract_from_pkg(xen_deb, "/boot/xen-4.14-arm64")
 
         self.launch_xen(xen_path)
 
@@ -112,6 +112,6 @@ def test_arm64_xen_415_and_dom0(self):
                    '?path=%2F&files=xen-upstream-4.15-unstable.deb')
         xen_sha1 = 'fc191172b85cf355abb95d275a24cc0f6d6579d8'
         xen_deb = self.fetch_asset(xen_url, asset_hash=xen_sha1)
-        xen_path = self.extract_from_deb(xen_deb, "/boot/xen-4.15-unstable")
+        xen_path = self.extract_from_pkg(xen_deb, "/boot/xen-4.15-unstable")
 
         self.launch_xen(xen_path)
diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
index bb32b31240..cfca71e65f 100644
--- a/tests/acceptance/replay_kernel.py
+++ b/tests/acceptance/replay_kernel.py
@@ -106,7 +106,7 @@ def test_mips_malta(self):
                    'linux-image-2.6.32-5-4kc-malta_2.6.32-48_mips.deb')
         deb_hash = 'a8cfc28ad8f45f54811fc6cf74fc43ffcfe0ba04'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path,
+        kernel_path = self.extract_from_pkg(deb_path,
                                             '/boot/vmlinux-2.6.32-5-4kc-malta')
         kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + 'console=ttyS0'
         console_pattern = 'Kernel command line: %s' % kernel_command_line
@@ -134,7 +134,7 @@ def test_mips64el_malta(self):
                    'linux-image-2.6.32-5-5kc-malta_2.6.32-48_mipsel.deb')
         deb_hash = '1aaec92083bf22fda31e0d27fa8d9a388e5fc3d5'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path,
+        kernel_path = self.extract_from_pkg(deb_path,
                                             '/boot/vmlinux-2.6.32-5-5kc-malta')
         kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + 'console=ttyS0'
         console_pattern = 'Kernel command line: %s' % kernel_command_line
@@ -185,10 +185,10 @@ def test_arm_cubieboard_initrd(self):
                    'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
         deb_hash = '9fa84beda245cabf0b4fa84cf6eaa7738ead1da0'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path,
+        kernel_path = self.extract_from_pkg(deb_path,
                                             '/boot/vmlinuz-5.10.16-sunxi')
         dtb_path = '/usr/lib/linux-image-current-sunxi/sun4i-a10-cubieboard.dtb'
-        dtb_path = self.extract_from_deb(deb_path, dtb_path)
+        dtb_path = self.extract_from_pkg(deb_path, dtb_path)
         initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
                       '2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/'
                       'arm/rootfs-armv5.cpio.gz')
@@ -233,7 +233,7 @@ def test_m68k_q800(self):
                    '/l/linux/kernel-image-5.3.0-1-m68k-di_5.3.7-1_m68k.udeb')
         deb_hash = '044954bb9be4160a3ce81f8bc1b5e856b75cccd1'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path,
+        kernel_path = self.extract_from_pkg(deb_path,
                                             '/boot/vmlinux-5.3.0-1-m68k')
 
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
@@ -368,7 +368,7 @@ def test_mips_malta_cpio(self):
                    'linux-image-4.5.0-2-4kc-malta_4.5.5-1_mips.deb')
         deb_hash = 'a3c84f3e88b54e06107d65a410d1d1e8e0f340f8'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
-        kernel_path = self.extract_from_deb(deb_path,
+        kernel_path = self.extract_from_pkg(deb_path,
                                             '/boot/vmlinux-4.5.0-2-4kc-malta')
         initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
                       '8584a59ed9e5eb5ee7ca91f6d74bbb06619205b8/rootfs/'
diff --git a/tests/acceptance/tcg_plugins.py b/tests/acceptance/tcg_plugins.py
index 9ca1515c3b..bfa7f36104 100644
--- a/tests/acceptance/tcg_plugins.py
+++ b/tests/acceptance/tcg_plugins.py
@@ -59,7 +59,7 @@ def _grab_aarch64_kernel(self):
                       'linux-image-4.19.0-12-arm64_4.19.152-1_arm64.deb')
         kernel_sha1 = '2036c2792f80ac9c4ccaae742b2e0a28385b6010'
         kernel_deb = self.fetch_asset(kernel_url, asset_hash=kernel_sha1)
-        kernel_path = self.extract_from_deb(kernel_deb,
+        kernel_path = self.extract_from_pkg(kernel_deb,
                                             "/boot/vmlinuz-4.19.0-12-arm64")
         return kernel_path
 
-- 
2.31.1


