Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6F64C50CB
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 22:37:19 +0100 (CET)
Received: from localhost ([::1]:45200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNiH7-0006Wc-Lq
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 16:37:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1nNhlM-0007v9-W9
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:04:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1nNhlF-0005Yf-PX
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:04:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645823061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MRyyzLy5FjUrt5KkPC4V4FdEmqwkwctyXx0Xgf5CklQ=;
 b=NLussdGoTQ0kreU+8GjNwwNcGm1IZH6DXjGoSlQvoyNCjyhCwgw5AIMdH0hV5o5Q1dYS0G
 tL9b2Um+ayQL63+gk7vxvRrvC1eBjBvuW9H0v2eT3P+2FELlWugM3KPsOI8+5i7A2rsmKK
 iDOrO6JRxDYCku3WDPKApXKlEaThcds=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-jk8VV_WUNAqxR9ujV-OyRA-1; Fri, 25 Feb 2022 16:04:16 -0500
X-MC-Unique: jk8VV_WUNAqxR9ujV-OyRA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51180801DDB;
 Fri, 25 Feb 2022 21:04:13 +0000 (UTC)
Received: from p50.localhost.localdomain.com (unknown [10.22.16.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE7442ED79;
 Fri, 25 Feb 2022 21:04:09 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 8/9] Avocado tests: classify tests based on what it's booted
Date: Fri, 25 Feb 2022 16:01:55 -0500
Message-Id: <20220225210156.2032055-9-crosa@redhat.com>
In-Reply-To: <20220225210156.2032055-1-crosa@redhat.com>
References: <20220225210156.2032055-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>,
 Fabien Chouteau <chouteau@adacore.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Cleber Rosa <crosa@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds some classification to the existing tests, based on the
mechanism (and a lot more loosely) on the content of the binary blob.

The proposal is to use the "boots" tag, and so far the following
values have been defined with the following meaning:

 - bios:   the "-bios" option is used to select the BIOS file to be
           loaded.  Because default bios are used in many QEMU runs,
           only tests that change the default are tagged.
 - kernel: means that the direct kernel boot mechanism (-kernel) is
           used.  Most of the time it means that a Linux kernel is
           booted, although there are occurrences of uboot usage.
 - initrd: means that an initial ram disk (-initrd) is used in
           addition to the kernel boot.
 - rootfs: means that a root filesystem is booted, in addition to a
           kernel and optionally an initrd.  This is usually done with
           a "-drive" command line option.
 - distro: means that a full blown distro image is booted, which may
           or may not include a kernel and initrd.  This is also
           usually done with a "-drive" command line option.

As with any other Avocado tags, it's possible to use them to select a
subset of tests.  For instance, if one wants to run tests that boots a
bios:

  $ avocado run -t boots:bios tests/avocado/

If one want to run tests that boots a kernel and an initrd:

  $ avocado run -t boots:kernel,boots:initrd tests/avocado/

It's possible, if deemed valuable, to further evolve this
classification into one with a clear separation between mechanism and
content.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/avocado/boot_linux.py               |  4 ++
 tests/avocado/boot_linux_console.py       | 54 +++++++++++++++++++++++
 tests/avocado/boot_xen.py                 |  3 ++
 tests/avocado/hotplug_cpu.py              |  1 +
 tests/avocado/intel_iommu.py              |  1 +
 tests/avocado/linux_initrd.py             |  2 +
 tests/avocado/linux_ssh_mips_malta.py     |  2 +
 tests/avocado/machine_arm_canona1100.py   |  1 +
 tests/avocado/machine_arm_integratorcp.py |  4 ++
 tests/avocado/machine_arm_n8x0.py         |  2 +
 tests/avocado/machine_avr6.py             |  1 +
 tests/avocado/machine_m68k_nextcube.py    |  1 +
 tests/avocado/machine_microblaze.py       |  1 +
 tests/avocado/machine_mips_fuloong2e.py   |  1 +
 tests/avocado/machine_mips_loongson3v.py  |  1 +
 tests/avocado/machine_mips_malta.py       |  3 ++
 tests/avocado/machine_rx_gdbsim.py        |  2 +
 tests/avocado/machine_s390_ccw_virtio.py  |  4 ++
 tests/avocado/machine_sparc64_sun4u.py    |  1 +
 tests/avocado/machine_sparc_leon3.py      |  1 +
 tests/avocado/multiprocess.py             |  4 ++
 tests/avocado/ppc_405.py                  |  2 +
 tests/avocado/ppc_bamboo.py               |  2 +
 tests/avocado/ppc_mpc8544ds.py            |  1 +
 tests/avocado/ppc_prep_40p.py             |  1 +
 tests/avocado/ppc_pseries.py              |  1 +
 tests/avocado/ppc_virtex_ml507.py         |  1 +
 tests/avocado/replay_kernel.py            | 28 ++++++++++++
 tests/avocado/replay_linux.py             |  1 +
 tests/avocado/reverse_debugging.py        |  1 +
 tests/avocado/smmu.py                     |  1 +
 tests/avocado/tcg_plugins.py              |  3 ++
 tests/avocado/virtio-gpu.py               |  2 +
 tests/avocado/virtiofs_submounts.py       |  1 +
 34 files changed, 139 insertions(+)

diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
index ab19146d1e..c4172f11e3 100644
--- a/tests/avocado/boot_linux.py
+++ b/tests/avocado/boot_linux.py
@@ -18,6 +18,7 @@
 class BootLinuxX8664(LinuxTest):
     """
     :avocado: tags=arch:x86_64
+    :avocado: tags=boots:distro
     """
 
     def test_pc_i440fx_tcg(self):
@@ -62,6 +63,7 @@ class BootLinuxAarch64(LinuxTest):
     :avocado: tags=arch:aarch64
     :avocado: tags=machine:virt
     :avocado: tags=machine:gic-version=2
+    :avocado: tags=boots:distro
     """
 
     def add_common_args(self):
@@ -110,6 +112,7 @@ def test_virt_kvm(self):
 class BootLinuxPPC64(LinuxTest):
     """
     :avocado: tags=arch:ppc64
+    :avocado: tags=boots:distro
     """
 
     def test_pseries_tcg(self):
@@ -125,6 +128,7 @@ def test_pseries_tcg(self):
 class BootLinuxS390X(LinuxTest):
     """
     :avocado: tags=arch:s390x
+    :avocado: tags=boots:distro
     """
 
     @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 9c618d4809..0a8980953f 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -95,6 +95,7 @@ def test_x86_64_pc(self):
         """
         :avocado: tags=arch:x86_64
         :avocado: tags=machine:pc
+        :avocado: tags=boots:kernel
         """
         kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
                       '/linux/releases/29/Everything/x86_64/os/images/pxeboot'
@@ -115,6 +116,7 @@ def test_mips_malta(self):
         :avocado: tags=arch:mips
         :avocado: tags=machine:malta
         :avocado: tags=endian:big
+        :avocado: tags=boots:kernel
         """
         deb_url = ('http://snapshot.debian.org/archive/debian/'
                    '20130217T032700Z/pool/main/l/linux-2.6/'
@@ -147,6 +149,7 @@ def test_mips64el_malta(self):
 
         :avocado: tags=arch:mips64el
         :avocado: tags=machine:malta
+        :avocado: tags=boots:kernel
         """
         deb_url = ('http://snapshot.debian.org/archive/debian/'
                    '20130217T032700Z/pool/main/l/linux-2.6/'
@@ -169,6 +172,7 @@ def test_mips64el_fuloong2e(self):
         :avocado: tags=arch:mips64el
         :avocado: tags=machine:fuloong2e
         :avocado: tags=endian:little
+        :avocado: tags=boots:kernel
         """
         deb_url = ('http://archive.debian.org/debian/pool/main/l/linux/'
                    'linux-image-3.16.0-6-loongson-2e_3.16.56-1+deb8u1_mipsel.deb')
@@ -190,6 +194,8 @@ def test_mips_malta_cpio(self):
         :avocado: tags=arch:mips
         :avocado: tags=machine:malta
         :avocado: tags=endian:big
+        :avocado: tags=boots:kernel
+        :avocado: tags=boots:initrd
         """
         deb_url = ('http://snapshot.debian.org/archive/debian/'
                    '20160601T041800Z/pool/main/l/linux/'
@@ -233,6 +239,8 @@ def test_mips64el_malta_5KEc_cpio(self):
         :avocado: tags=machine:malta
         :avocado: tags=endian:little
         :avocado: tags=cpu:5KEc
+        :avocado: tags=boots:kernel
+        :avocado: tags=boots:initrd
         """
         kernel_url = ('https://github.com/philmd/qemu-testing-blob/'
                       'raw/9ad2df38/mips/malta/mips64el/'
@@ -292,6 +300,7 @@ def test_mips_malta32el_nanomips_4k(self):
         :avocado: tags=machine:malta
         :avocado: tags=endian:little
         :avocado: tags=cpu:I7200
+        :avocado: tags=boots:kernel
         """
         kernel_url = ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
@@ -305,6 +314,7 @@ def test_mips_malta32el_nanomips_16k_up(self):
         :avocado: tags=machine:malta
         :avocado: tags=endian:little
         :avocado: tags=cpu:I7200
+        :avocado: tags=boots:kernel
         """
         kernel_url = ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
@@ -318,6 +328,7 @@ def test_mips_malta32el_nanomips_64k_dbg(self):
         :avocado: tags=machine:malta
         :avocado: tags=endian:little
         :avocado: tags=cpu:I7200
+        :avocado: tags=boots:kernel
         """
         kernel_url = ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
@@ -331,6 +342,7 @@ def test_aarch64_virt(self):
         :avocado: tags=machine:virt
         :avocado: tags=accel:tcg
         :avocado: tags=cpu:cortex-a53
+        :avocado: tags=boots:kernel
         """
         kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
                       '/linux/releases/29/Everything/aarch64/os/images/pxeboot'
@@ -357,6 +369,8 @@ def test_aarch64_xlnx_versal_virt(self):
         :avocado: tags=device:pl011
         :avocado: tags=device:arm_gicv3
         :avocado: tags=accel:tcg
+        :avocado: tags=boots:kernel
+        :avocado: tags=boots:initrd
         """
         images_url = ('http://ports.ubuntu.com/ubuntu-ports/dists/'
                       'bionic-updates/main/installer-arm64/'
@@ -382,6 +396,7 @@ def test_arm_virt(self):
         :avocado: tags=arch:arm
         :avocado: tags=machine:virt
         :avocado: tags=accel:tcg
+        :avocado: tags=boots:kernel
         """
         kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
                       '/linux/releases/29/Everything/armhfp/os/images/pxeboot'
@@ -405,6 +420,8 @@ def test_arm_emcraft_sf2(self):
         :avocado: tags=endian:little
         :avocado: tags=u-boot
         :avocado: tags=accel:tcg
+        :avocado: tags=boots:kernel
+        :avocado: tags=boots:rootfs
         """
         uboot_url = ('https://raw.githubusercontent.com/'
                      'Subbaraya-Sundeep/qemu-test-binaries/'
@@ -471,6 +488,7 @@ def test_arm_raspi2_uart0(self):
         :avocado: tags=machine:raspi2b
         :avocado: tags=device:pl011
         :avocado: tags=accel:tcg
+        :avocado: tags=boots:kernel
         """
         self.do_test_arm_raspi2(0)
 
@@ -478,6 +496,8 @@ def test_arm_raspi2_initrd(self):
         """
         :avocado: tags=arch:arm
         :avocado: tags=machine:raspi2b
+        :avocado: tags=boots:kernel
+        :avocado: tags=boots:initrd
         """
         deb_url = ('http://archive.raspberrypi.org/debian/'
                    'pool/main/r/raspberrypi-firmware/'
@@ -521,6 +541,8 @@ def test_arm_exynos4210_initrd(self):
         :avocado: tags=arch:arm
         :avocado: tags=machine:smdkc210
         :avocado: tags=accel:tcg
+        :avocado: tags=boots:kernel
+        :avocado: tags=boots:initrd
         """
         deb_url = ('https://snapshot.debian.org/archive/debian/'
                    '20190928T224601Z/pool/main/l/linux/'
@@ -562,6 +584,8 @@ def test_arm_cubieboard_initrd(self):
         :avocado: tags=arch:arm
         :avocado: tags=machine:cubieboard
         :avocado: tags=accel:tcg
+        :avocado: tags=boots:kernel
+        :avocado: tags=boots:initrd
         """
         deb_url = ('https://apt.armbian.com/pool/main/l/'
                    'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
@@ -603,6 +627,8 @@ def test_arm_cubieboard_sata(self):
         :avocado: tags=arch:arm
         :avocado: tags=machine:cubieboard
         :avocado: tags=accel:tcg
+        :avocado: tags=boots:kernel
+        :avocado: tags=boots:rootfs
         """
         deb_url = ('https://apt.armbian.com/pool/main/l/'
                    'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
@@ -648,6 +674,7 @@ def test_arm_quanta_gsj(self):
         :avocado: tags=arch:arm
         :avocado: tags=machine:quanta-gsj
         :avocado: tags=accel:tcg
+        :avocado: tags=boots:rootfs
         """
         # 25 MiB compressed, 32 MiB uncompressed.
         image_url = (
@@ -696,6 +723,8 @@ def test_arm_quanta_gsj_initrd(self):
         :avocado: tags=arch:arm
         :avocado: tags=machine:quanta-gsj
         :avocado: tags=accel:tcg
+        :avocado: tags=boots:kernel
+        :avocado: tags=boots:initrd
         """
         initrd_url = (
                 'https://github.com/hskinnemoen/openbmc/releases/download/'
@@ -733,6 +762,7 @@ def test_arm_orangepi(self):
         :avocado: tags=arch:arm
         :avocado: tags=machine:orangepi-pc
         :avocado: tags=accel:tcg
+        :avocado: tags=boots:kernel
         """
         deb_url = ('https://apt.armbian.com/pool/main/l/'
                    'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
@@ -759,6 +789,8 @@ def test_arm_orangepi_initrd(self):
         :avocado: tags=arch:arm
         :avocado: tags=accel:tcg
         :avocado: tags=machine:orangepi-pc
+        :avocado: tags=boots:kernel
+        :avocado: tags=boots:initrd
         """
         deb_url = ('https://apt.armbian.com/pool/main/l/'
                    'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
@@ -803,6 +835,8 @@ def test_arm_orangepi_sd(self):
         :avocado: tags=accel:tcg
         :avocado: tags=machine:orangepi-pc
         :avocado: tags=device:sd
+        :avocado: tags=boots:kernel
+        :avocado: tags=boots:rootfs
         """
         deb_url = ('https://apt.armbian.com/pool/main/l/'
                    'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
@@ -855,6 +889,7 @@ def test_arm_orangepi_bionic_20_08(self):
         :avocado: tags=arch:arm
         :avocado: tags=machine:orangepi-pc
         :avocado: tags=device:sd
+        :avocado: tags=boots:distro
         """
 
         # This test download a 275 MiB compressed image and expand it
@@ -902,6 +937,7 @@ def test_arm_orangepi_uboot_netbsd9(self):
         :avocado: tags=machine:orangepi-pc
         :avocado: tags=device:sd
         :avocado: tags=os:netbsd
+        :avocado: tags=boots:distro
         """
         # This test download a 304MB compressed image and expand it to 2GB
         deb_url = ('http://snapshot.debian.org/archive/debian/'
@@ -987,6 +1023,7 @@ def test_s390x_s390_ccw_virtio(self):
         """
         :avocado: tags=arch:s390x
         :avocado: tags=machine:s390-ccw-virtio
+        :avocado: tags=boots:kernel
         """
         kernel_url = ('https://archives.fedoraproject.org/pub/archive'
                       '/fedora-secondary/releases/29/Everything/s390x/os/images'
@@ -1007,6 +1044,7 @@ def test_alpha_clipper(self):
         """
         :avocado: tags=arch:alpha
         :avocado: tags=machine:clipper
+        :avocado: tags=boots:kernel
         """
         kernel_url = ('http://archive.debian.org/debian/dists/lenny/main/'
                       'installer-alpha/20090123lenny10/images/cdrom/vmlinuz')
@@ -1028,6 +1066,7 @@ def test_m68k_q800(self):
         """
         :avocado: tags=arch:m68k
         :avocado: tags=machine:q800
+        :avocado: tags=boots:kernel
         """
         deb_url = ('https://snapshot.debian.org/archive/debian-ports'
                    '/20191021T083923Z/pool-m68k/main'
@@ -1063,6 +1102,7 @@ def test_arm_vexpressa9(self):
         """
         :avocado: tags=arch:arm
         :avocado: tags=machine:vexpress-a9
+        :avocado: tags=boots:kernel
         """
         tar_hash = '32b7677ce8b6f1471fb0059865f451169934245b'
         self.vm.add_args('-dtb', self.workdir + '/day16/vexpress-v2p-ca9.dtb')
@@ -1072,6 +1112,7 @@ def test_arm_ast2400_palmetto_openbmc_v2_9_0(self):
         """
         :avocado: tags=arch:arm
         :avocado: tags=machine:palmetto-bmc
+        :avocado: tags=boots:rootfs
         """
 
         image_url = ('https://github.com/openbmc/openbmc/releases/download/2.9.0/'
@@ -1086,6 +1127,7 @@ def test_arm_ast2500_romulus_openbmc_v2_9_0(self):
         """
         :avocado: tags=arch:arm
         :avocado: tags=machine:romulus-bmc
+        :avocado: tags=boots:rootfs
         """
 
         image_url = ('https://github.com/openbmc/openbmc/releases/download/2.9.0/'
@@ -1115,6 +1157,7 @@ def test_arm_ast2600_debian(self):
         """
         :avocado: tags=arch:arm
         :avocado: tags=machine:tacoma-bmc
+        :avocado: tags=boots:kernel
         """
         deb_url = ('http://snapshot.debian.org/archive/debian/'
                    '20210302T203551Z/'
@@ -1140,6 +1183,7 @@ def test_m68k_mcf5208evb(self):
         """
         :avocado: tags=arch:m68k
         :avocado: tags=machine:mcf5208evb
+        :avocado: tags=boots:kernel
         """
         tar_hash = 'ac688fd00561a2b6ce1359f9ff6aa2b98c9a570c'
         self.do_test_advcal_2018('07', tar_hash, 'sanity-clause.elf')
@@ -1148,6 +1192,7 @@ def test_or1k_sim(self):
         """
         :avocado: tags=arch:or1k
         :avocado: tags=machine:or1k-sim
+        :avocado: tags=boots:kernel
         """
         tar_hash = '20334cdaf386108c530ff0badaecc955693027dd'
         self.do_test_advcal_2018('20', tar_hash, 'vmlinux')
@@ -1156,6 +1201,7 @@ def test_nios2_10m50(self):
         """
         :avocado: tags=arch:nios2
         :avocado: tags=machine:10m50-ghrd
+        :avocado: tags=boots:kernel
         """
         tar_hash = 'e4251141726c412ac0407c5a6bceefbbff018918'
         self.do_test_advcal_2018('14', tar_hash, 'vmlinux.elf')
@@ -1165,6 +1211,7 @@ def test_ppc64_e500(self):
         :avocado: tags=arch:ppc64
         :avocado: tags=machine:ppce500
         :avocado: tags=cpu:e5500
+        :avocado: tags=boots:kernel
         """
         tar_hash = '6951d86d644b302898da2fd701739c9406527fe1'
         self.do_test_advcal_2018('19', tar_hash, 'uImage')
@@ -1194,6 +1241,7 @@ def test_ppc_powernv8(self):
         """
         :avocado: tags=arch:ppc64
         :avocado: tags=machine:powernv8
+        :avocado: tags=boots:kernel
         """
         self.do_test_ppc64_powernv('P8')
 
@@ -1201,6 +1249,7 @@ def test_ppc_powernv9(self):
         """
         :avocado: tags=arch:ppc64
         :avocado: tags=machine:powernv9
+        :avocado: tags=boots:kernel
         """
         self.do_test_ppc64_powernv('P9')
 
@@ -1208,6 +1257,7 @@ def test_ppc_g3beige(self):
         """
         :avocado: tags=arch:ppc
         :avocado: tags=machine:g3beige
+        :avocado: tags=boots:kernel
         """
         tar_hash = 'e0b872a5eb8fdc5bed19bd43ffe863900ebcedfc'
         self.vm.add_args('-M', 'graphics=off')
@@ -1217,6 +1267,7 @@ def test_ppc_mac99(self):
         """
         :avocado: tags=arch:ppc
         :avocado: tags=machine:mac99
+        :avocado: tags=boots:kernel
         """
         tar_hash = 'e0b872a5eb8fdc5bed19bd43ffe863900ebcedfc'
         self.vm.add_args('-M', 'graphics=off')
@@ -1226,6 +1277,7 @@ def test_sh4_r2d(self):
         """
         :avocado: tags=arch:sh4
         :avocado: tags=machine:r2d
+        :avocado: tags=boots:kernel
         """
         tar_hash = 'fe06a4fd8ccbf2e27928d64472939d47829d4c7e'
         self.vm.add_args('-append', 'console=ttySC1')
@@ -1235,6 +1287,7 @@ def test_sparc_ss20(self):
         """
         :avocado: tags=arch:sparc
         :avocado: tags=machine:SS-20
+        :avocado: tags=boots:kernel
         """
         tar_hash = 'b18550d5d61c7615d989a06edace051017726a9f'
         self.do_test_advcal_2018('11', tar_hash, 'zImage.elf')
@@ -1244,6 +1297,7 @@ def test_xtensa_lx60(self):
         :avocado: tags=arch:xtensa
         :avocado: tags=machine:lx60
         :avocado: tags=cpu:dc233c
+        :avocado: tags=boots:kernel
         """
         tar_hash = '49e88d9933742f0164b60839886c9739cb7a0d34'
         self.do_test_advcal_2018('02', tar_hash, 'santas-sleigh-ride.elf')
diff --git a/tests/avocado/boot_xen.py b/tests/avocado/boot_xen.py
index fc2faeedb5..6cc5216a57 100644
--- a/tests/avocado/boot_xen.py
+++ b/tests/avocado/boot_xen.py
@@ -61,6 +61,9 @@ def launch_xen(self, xen_path):
 
 
 class BootXen(BootXenBase):
+    """
+    :avocado: tags=boots:kernel
+    """
 
     def test_arm64_xen_411_and_dom0(self):
         """
diff --git a/tests/avocado/hotplug_cpu.py b/tests/avocado/hotplug_cpu.py
index 6374bf1b54..bb296020af 100644
--- a/tests/avocado/hotplug_cpu.py
+++ b/tests/avocado/hotplug_cpu.py
@@ -18,6 +18,7 @@ def test(self):
         :avocado: tags=arch:x86_64
         :avocado: tags=machine:q35
         :avocado: tags=accel:kvm
+        :avocado: tags=boots:distro
         """
         self.require_accelerator('kvm')
         self.vm.add_args('-accel', 'kvm')
diff --git a/tests/avocado/intel_iommu.py b/tests/avocado/intel_iommu.py
index 474d62f6bf..d308dcccc5 100644
--- a/tests/avocado/intel_iommu.py
+++ b/tests/avocado/intel_iommu.py
@@ -20,6 +20,7 @@ class IntelIOMMU(LinuxTest):
     :avocado: tags=distro_version:31
     :avocado: tags=machine:q35
     :avocado: tags=accel:kvm
+    :avocado: tags=boots:distro
     :avocado: tags=intel_iommu
     """
 
diff --git a/tests/avocado/linux_initrd.py b/tests/avocado/linux_initrd.py
index 6ebf299cd4..07582f5247 100644
--- a/tests/avocado/linux_initrd.py
+++ b/tests/avocado/linux_initrd.py
@@ -21,6 +21,8 @@ class LinuxInitrd(QemuSystemTest):
 
     :avocado: tags=arch:x86_64
     :avocado: tags=machine:pc
+    :avocado: tags=boots:kernel
+    :avocado: tags=boots:initrd
     """
 
     timeout = 300
diff --git a/tests/avocado/linux_ssh_mips_malta.py b/tests/avocado/linux_ssh_mips_malta.py
index 0179d8a6ca..2cd986c6b2 100644
--- a/tests/avocado/linux_ssh_mips_malta.py
+++ b/tests/avocado/linux_ssh_mips_malta.py
@@ -25,6 +25,8 @@
 class LinuxSSH(QemuSystemTest, LinuxSSHMixIn):
     """
     :avocado: tags=accel:tcg
+    :avocado: tags=boots:kernel
+    :avocado: tags=boots:distro
     """
 
     timeout = 150 # Not for 'configure --enable-debug --enable-debug-tcg'
diff --git a/tests/avocado/machine_arm_canona1100.py b/tests/avocado/machine_arm_canona1100.py
index 182a0b0513..0cfb9b873d 100644
--- a/tests/avocado/machine_arm_canona1100.py
+++ b/tests/avocado/machine_arm_canona1100.py
@@ -22,6 +22,7 @@ def test_arm_canona1100(self):
         :avocado: tags=arch:arm
         :avocado: tags=machine:canon-a1100
         :avocado: tags=device:pflash_cfi02
+        :avocado: tags=boots:bios
         """
         tar_url = ('https://www.qemu-advent-calendar.org'
                    '/2018/download/day18.tar.xz')
diff --git a/tests/avocado/machine_arm_integratorcp.py b/tests/avocado/machine_arm_integratorcp.py
index 697ee76f6c..3049aff037 100644
--- a/tests/avocado/machine_arm_integratorcp.py
+++ b/tests/avocado/machine_arm_integratorcp.py
@@ -29,6 +29,10 @@
 
 
 class IntegratorMachine(QemuSystemTest):
+    """
+    :avocado: tags=boots:kernel
+    :avocado: tags=boots:initrd
+    """
 
     timeout = 90
 
diff --git a/tests/avocado/machine_arm_n8x0.py b/tests/avocado/machine_arm_n8x0.py
index 12e9a6803b..78c65863b6 100644
--- a/tests/avocado/machine_arm_n8x0.py
+++ b/tests/avocado/machine_arm_n8x0.py
@@ -37,6 +37,7 @@ def test_n800(self):
         """
         :avocado: tags=arch:arm
         :avocado: tags=machine:n800
+        :avocado: tags=boots:kernel
         """
         self.__do_test_n8x0()
 
@@ -45,5 +46,6 @@ def test_n810(self):
         """
         :avocado: tags=arch:arm
         :avocado: tags=machine:n810
+        :avocado: tags=boots:kernel
         """
         self.__do_test_n8x0()
diff --git a/tests/avocado/machine_avr6.py b/tests/avocado/machine_avr6.py
index 5485db79c6..0837d4dd6b 100644
--- a/tests/avocado/machine_avr6.py
+++ b/tests/avocado/machine_avr6.py
@@ -28,6 +28,7 @@ def test_freertos(self):
         """
         :avocado: tags=arch:avr
         :avocado: tags=machine:arduino-mega-2560-v3
+        :avocado: tags=boots:bios
         """
         """
         https://github.com/seharris/qemu-avr-tests/raw/master/free-rtos/Demo/AVR_ATMega2560_GCC/demo.elf
diff --git a/tests/avocado/machine_m68k_nextcube.py b/tests/avocado/machine_m68k_nextcube.py
index 6790e7d9cd..26df7f89c4 100644
--- a/tests/avocado/machine_m68k_nextcube.py
+++ b/tests/avocado/machine_m68k_nextcube.py
@@ -25,6 +25,7 @@ class NextCubeMachine(QemuSystemTest):
     :avocado: tags=arch:m68k
     :avocado: tags=machine:next-cube
     :avocado: tags=device:framebuffer
+    :avocado: tags=boots:bios
     """
 
     timeout = 15
diff --git a/tests/avocado/machine_microblaze.py b/tests/avocado/machine_microblaze.py
index 4928920f96..9035c2ef3d 100644
--- a/tests/avocado/machine_microblaze.py
+++ b/tests/avocado/machine_microblaze.py
@@ -17,6 +17,7 @@ def test_microblaze_s3adsp1800(self):
         """
         :avocado: tags=arch:microblaze
         :avocado: tags=machine:petalogix-s3adsp1800
+        :avocado: tags=boots:kernel
         """
 
         tar_url = ('https://www.qemu-advent-calendar.org'
diff --git a/tests/avocado/machine_mips_fuloong2e.py b/tests/avocado/machine_mips_fuloong2e.py
index 89291f47b2..f1da0bbb75 100644
--- a/tests/avocado/machine_mips_fuloong2e.py
+++ b/tests/avocado/machine_mips_fuloong2e.py
@@ -26,6 +26,7 @@ def test_linux_kernel_isa_serial(self):
         :avocado: tags=endian:little
         :avocado: tags=device:bonito64
         :avocado: tags=device:via686b
+        :avocado: tags=boots:kernel
         """
         # Recovery system for the Yeeloong laptop
         # (enough to test the fuloong2e southbridge, accessing its ISA bus)
diff --git a/tests/avocado/machine_mips_loongson3v.py b/tests/avocado/machine_mips_loongson3v.py
index 5194cf18c9..5680fc6892 100644
--- a/tests/avocado/machine_mips_loongson3v.py
+++ b/tests/avocado/machine_mips_loongson3v.py
@@ -26,6 +26,7 @@ def test_pmon_serial_console(self):
         :avocado: tags=cpu:Loongson-3A1000
         :avocado: tags=device:liointc
         :avocado: tags=device:goldfish_rtc
+        :avocado: tags=boots:bios
         """
 
         pmon_hash = '7c8b45dd81ccfc55ff28f5aa267a41c3'
diff --git a/tests/avocado/machine_mips_malta.py b/tests/avocado/machine_mips_malta.py
index 5f98ba1620..e0b015b871 100644
--- a/tests/avocado/machine_mips_malta.py
+++ b/tests/avocado/machine_mips_malta.py
@@ -95,6 +95,7 @@ def test_mips_malta_i6400_framebuffer_logo_1core(self):
         :avocado: tags=arch:mips64el
         :avocado: tags=machine:malta
         :avocado: tags=cpu:I6400
+        :avocado: tags=boots:kernel
         """
         self.do_test_i6400_framebuffer_logo(1)
 
@@ -105,6 +106,7 @@ def test_mips_malta_i6400_framebuffer_logo_7cores(self):
         :avocado: tags=machine:malta
         :avocado: tags=cpu:I6400
         :avocado: tags=mips:smp
+        :avocado: tags=boots:kernel
         """
         self.do_test_i6400_framebuffer_logo(7)
 
@@ -115,5 +117,6 @@ def test_mips_malta_i6400_framebuffer_logo_8cores(self):
         :avocado: tags=machine:malta
         :avocado: tags=cpu:I6400
         :avocado: tags=mips:smp
+        :avocado: tags=boots:kernel
         """
         self.do_test_i6400_framebuffer_logo(8)
diff --git a/tests/avocado/machine_rx_gdbsim.py b/tests/avocado/machine_rx_gdbsim.py
index 6cd8704b01..bb3263d982 100644
--- a/tests/avocado/machine_rx_gdbsim.py
+++ b/tests/avocado/machine_rx_gdbsim.py
@@ -30,6 +30,7 @@ def test_uboot(self):
         :avocado: tags=arch:rx
         :avocado: tags=machine:gdbsim-r5f562n8
         :avocado: tags=endian:little
+        :avocado: tags=boots:bios
         """
         uboot_url = ('https://acc.dl.osdn.jp/users/23/23888/u-boot.bin.gz')
         uboot_hash = '9b78dbd43b40b2526848c0b1ce9de02c24f4dcdb'
@@ -54,6 +55,7 @@ def test_linux_sash(self):
         :avocado: tags=arch:rx
         :avocado: tags=machine:gdbsim-r5f562n7
         :avocado: tags=endian:little
+        :avocado: tags=boots:kernel
         """
         dtb_url = ('https://acc.dl.osdn.jp/users/23/23887/rx-virt.dtb')
         dtb_hash = '7b4e4e2c71905da44e86ce47adee2210b026ac18'
diff --git a/tests/avocado/machine_s390_ccw_virtio.py b/tests/avocado/machine_s390_ccw_virtio.py
index bd03d7160b..0e24372240 100644
--- a/tests/avocado/machine_s390_ccw_virtio.py
+++ b/tests/avocado/machine_s390_ccw_virtio.py
@@ -45,6 +45,8 @@ def test_s390x_devices(self):
         """
         :avocado: tags=arch:s390x
         :avocado: tags=machine:s390-ccw-virtio
+        :avocado: tags=boots:kernel
+        :avocado: tags=boots:initrd
         """
 
         kernel_url = ('https://snapshot.debian.org/archive/debian/'
@@ -167,6 +169,8 @@ def test_s390x_fedora(self):
         :avocado: tags=device:virtio-gpu
         :avocado: tags=device:virtio-crypto
         :avocado: tags=device:virtio-net
+        :avocado: tags=boots:kernel
+        :avocado: tags=boots:initrd
         """
 
         kernel_url = ('https://archives.fedoraproject.org/pub/archive'
diff --git a/tests/avocado/machine_sparc64_sun4u.py b/tests/avocado/machine_sparc64_sun4u.py
index 458165500e..18fcb92fcd 100644
--- a/tests/avocado/machine_sparc64_sun4u.py
+++ b/tests/avocado/machine_sparc64_sun4u.py
@@ -23,6 +23,7 @@ def test_sparc64_sun4u(self):
         """
         :avocado: tags=arch:sparc64
         :avocado: tags=machine:sun4u
+        :avocado: tags=boots:kernel
         """
         tar_url = ('https://www.qemu-advent-calendar.org'
                    '/2018/download/day23.tar.xz')
diff --git a/tests/avocado/machine_sparc_leon3.py b/tests/avocado/machine_sparc_leon3.py
index e61b223185..c7f941a525 100644
--- a/tests/avocado/machine_sparc_leon3.py
+++ b/tests/avocado/machine_sparc_leon3.py
@@ -22,6 +22,7 @@ def test_leon3_helenos_uimage(self):
         :avocado: tags=arch:sparc
         :avocado: tags=machine:leon3_generic
         :avocado: tags=binfmt:uimage
+        :avocado: tags=boots:kernel
         """
         kernel_url = ('http://www.helenos.org/releases/'
                       'HelenOS-0.6.0-sparc32-leon3.bin')
diff --git a/tests/avocado/multiprocess.py b/tests/avocado/multiprocess.py
index 80a3b8f442..9415e6d00c 100644
--- a/tests/avocado/multiprocess.py
+++ b/tests/avocado/multiprocess.py
@@ -67,6 +67,8 @@ def do_test(self, kernel_url, initrd_url, kernel_command_line,
     def test_multiprocess_x86_64(self):
         """
         :avocado: tags=arch:x86_64
+        :avocado: tags=boots:kernel
+        :avocado: tags=boots:initrd
         """
         kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
                       '/linux/releases/31/Everything/x86_64/os/images'
@@ -82,6 +84,8 @@ def test_multiprocess_x86_64(self):
     def test_multiprocess_aarch64(self):
         """
         :avocado: tags=arch:aarch64
+        :avocado: tags=boots:kernel
+        :avocado: tags=boots:initrd
         """
         kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
                       '/linux/releases/31/Everything/aarch64/os/images'
diff --git a/tests/avocado/ppc_405.py b/tests/avocado/ppc_405.py
index a47f89b934..f767ca17c7 100644
--- a/tests/avocado/ppc_405.py
+++ b/tests/avocado/ppc_405.py
@@ -30,6 +30,7 @@ def test_ppc_taihu(self):
         :avocado: tags=arch:ppc
         :avocado: tags=machine:taihu
         :avocado: tags=cpu:405ep
+        :avocado: tags=boots:bios
         """
         self.do_test_ppc405()
 
@@ -38,5 +39,6 @@ def test_ppc_ref405ep(self):
         :avocado: tags=arch:ppc
         :avocado: tags=machine:ref405ep
         :avocado: tags=cpu:405ep
+        :avocado: tags=boots:bios
         """
         self.do_test_ppc405()
diff --git a/tests/avocado/ppc_bamboo.py b/tests/avocado/ppc_bamboo.py
index 40629e3478..7568ab2b6f 100644
--- a/tests/avocado/ppc_bamboo.py
+++ b/tests/avocado/ppc_bamboo.py
@@ -20,6 +20,8 @@ def test_ppc_bamboo(self):
         :avocado: tags=machine:bamboo
         :avocado: tags=cpu:440epb
         :avocado: tags=device:rtl8139
+        :avocado: tags=boots:kernel
+        :avocado: tags=boots:initrd
         """
         tar_url = ('http://landley.net/aboriginal/downloads/binaries/'
                    'system-image-powerpc-440fp.tar.gz')
diff --git a/tests/avocado/ppc_mpc8544ds.py b/tests/avocado/ppc_mpc8544ds.py
index 886f967b15..12efb52ea7 100644
--- a/tests/avocado/ppc_mpc8544ds.py
+++ b/tests/avocado/ppc_mpc8544ds.py
@@ -19,6 +19,7 @@ def test_ppc_mpc8544ds(self):
         """
         :avocado: tags=arch:ppc
         :avocado: tags=machine:mpc8544ds
+        :avocado: tags=boots:kernel
         """
         tar_url = ('https://www.qemu-advent-calendar.org'
                    '/2020/download/day17.tar.gz')
diff --git a/tests/avocado/ppc_prep_40p.py b/tests/avocado/ppc_prep_40p.py
index 4bd956584d..fde18ac42c 100644
--- a/tests/avocado/ppc_prep_40p.py
+++ b/tests/avocado/ppc_prep_40p.py
@@ -28,6 +28,7 @@ def test_factory_firmware_and_netbsd(self):
         :avocado: tags=machine:40p
         :avocado: tags=os:netbsd
         :avocado: tags=slowness:high
+        :avocado: tags=boots:bios
         """
         bios_url = ('http://ftpmirror.your.org/pub/misc/'
                     'ftp.software.ibm.com/rs6000/firmware/'
diff --git a/tests/avocado/ppc_pseries.py b/tests/avocado/ppc_pseries.py
index d8b04dc3ea..388dfe5487 100644
--- a/tests/avocado/ppc_pseries.py
+++ b/tests/avocado/ppc_pseries.py
@@ -19,6 +19,7 @@ def test_ppc64_pseries(self):
         """
         :avocado: tags=arch:ppc64
         :avocado: tags=machine:pseries
+        :avocado: tags=boots:kernel
         """
         kernel_url = ('https://archives.fedoraproject.org/pub/archive'
                       '/fedora-secondary/releases/29/Everything/ppc64le/os'
diff --git a/tests/avocado/ppc_virtex_ml507.py b/tests/avocado/ppc_virtex_ml507.py
index a6912ee579..d9afe2cb83 100644
--- a/tests/avocado/ppc_virtex_ml507.py
+++ b/tests/avocado/ppc_virtex_ml507.py
@@ -19,6 +19,7 @@ def test_ppc_virtex_ml507(self):
         """
         :avocado: tags=arch:ppc
         :avocado: tags=machine:virtex-ml507
+        :avocado: tags=boots:kernel
         """
         tar_url = ('https://www.qemu-advent-calendar.org'
                    '/2020/download/hippo.tar.gz')
diff --git a/tests/avocado/replay_kernel.py b/tests/avocado/replay_kernel.py
index 40f52b3913..368c6b41c8 100644
--- a/tests/avocado/replay_kernel.py
+++ b/tests/avocado/replay_kernel.py
@@ -82,6 +82,7 @@ def test_x86_64_pc(self):
         """
         :avocado: tags=arch:x86_64
         :avocado: tags=machine:pc
+        :avocado: tags=boots:kernel
         """
         kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
                       '/linux/releases/29/Everything/x86_64/os/images/pxeboot'
@@ -99,6 +100,7 @@ def test_mips_malta(self):
         :avocado: tags=arch:mips
         :avocado: tags=machine:malta
         :avocado: tags=endian:big
+        :avocado: tags=boots:kernel
         """
         deb_url = ('http://snapshot.debian.org/archive/debian/'
                    '20130217T032700Z/pool/main/l/linux-2.6/'
@@ -127,6 +129,7 @@ def test_mips64el_malta(self):
 
         :avocado: tags=arch:mips64el
         :avocado: tags=machine:malta
+        :avocado: tags=boots:kernel
         """
         deb_url = ('http://snapshot.debian.org/archive/debian/'
                    '20130217T032700Z/pool/main/l/linux-2.6/'
@@ -144,6 +147,7 @@ def test_aarch64_virt(self):
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:virt
         :avocado: tags=cpu:cortex-a53
+        :avocado: tags=boots:kernel
         """
         kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
                       '/linux/releases/29/Everything/aarch64/os/images/pxeboot'
@@ -161,6 +165,7 @@ def test_arm_virt(self):
         """
         :avocado: tags=arch:arm
         :avocado: tags=machine:virt
+        :avocado: tags=boots:kernel
         """
         kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
                       '/linux/releases/29/Everything/armhfp/os/images/pxeboot'
@@ -179,6 +184,8 @@ def test_arm_cubieboard_initrd(self):
         """
         :avocado: tags=arch:arm
         :avocado: tags=machine:cubieboard
+        :avocado: tags=boots:kernel
+        :avocado: tags=boots:initrd
         """
         deb_url = ('https://apt.armbian.com/pool/main/l/'
                    'linux-5.10.16-sunxi/linux-image-current-sunxi_21.02.2_armhf.deb')
@@ -210,6 +217,7 @@ def test_s390x_s390_ccw_virtio(self):
         """
         :avocado: tags=arch:s390x
         :avocado: tags=machine:s390-ccw-virtio
+        :avocado: tags=boots:kernel
         """
         kernel_url = ('https://archives.fedoraproject.org/pub/archive'
                       '/fedora-secondary/releases/29/Everything/s390x/os/images'
@@ -225,6 +233,7 @@ def test_alpha_clipper(self):
         """
         :avocado: tags=arch:alpha
         :avocado: tags=machine:clipper
+        :avocado: tags=boots:kernel
         """
         kernel_url = ('http://archive.debian.org/debian/dists/lenny/main/'
                       'installer-alpha/20090123lenny10/images/cdrom/vmlinuz')
@@ -242,6 +251,7 @@ def test_ppc64_pseries(self):
         """
         :avocado: tags=arch:ppc64
         :avocado: tags=machine:pseries
+        :avocado: tags=boots:kernel
         """
         kernel_url = ('https://archives.fedoraproject.org/pub/archive'
                       '/fedora-secondary/releases/29/Everything/ppc64le/os'
@@ -258,6 +268,7 @@ def test_m68k_q800(self):
         """
         :avocado: tags=arch:m68k
         :avocado: tags=machine:q800
+        :avocado: tags=boots:kernel
         """
         deb_url = ('https://snapshot.debian.org/archive/debian-ports'
                    '/20191021T083923Z/pool-m68k/main'
@@ -289,6 +300,7 @@ def test_arm_vexpressa9(self):
         """
         :avocado: tags=arch:arm
         :avocado: tags=machine:vexpress-a9
+        :avocado: tags=boots:kernel
         """
         tar_hash = '32b7677ce8b6f1471fb0059865f451169934245b'
         tar_url = ('https://www.qemu-advent-calendar.org'
@@ -302,6 +314,7 @@ def test_m68k_mcf5208evb(self):
         """
         :avocado: tags=arch:m68k
         :avocado: tags=machine:mcf5208evb
+        :avocado: tags=boots:kernel
         """
         tar_hash = 'ac688fd00561a2b6ce1359f9ff6aa2b98c9a570c'
         tar_url = ('https://www.qemu-advent-calendar.org'
@@ -314,6 +327,7 @@ def test_microblaze_s3adsp1800(self):
         """
         :avocado: tags=arch:microblaze
         :avocado: tags=machine:petalogix-s3adsp1800
+        :avocado: tags=boots:kernel
         """
         tar_hash = '08bf3e3bfb6b6c7ce1e54ab65d54e189f2caf13f'
         tar_url = ('https://www.qemu-advent-calendar.org'
@@ -326,6 +340,7 @@ def test_ppc64_e500(self):
         :avocado: tags=arch:ppc64
         :avocado: tags=machine:ppce500
         :avocado: tags=cpu:e5500
+        :avocado: tags=boots:kernel
         """
         tar_hash = '6951d86d644b302898da2fd701739c9406527fe1'
         tar_url = ('https://www.qemu-advent-calendar.org'
@@ -337,6 +352,7 @@ def test_or1k_sim(self):
         """
         :avocado: tags=arch:or1k
         :avocado: tags=machine:or1k-sim
+        :avocado: tags=boots:kernel
         """
         tar_hash = '20334cdaf386108c530ff0badaecc955693027dd'
         tar_url = ('https://www.qemu-advent-calendar.org'
@@ -348,6 +364,7 @@ def test_nios2_10m50(self):
         """
         :avocado: tags=arch:nios2
         :avocado: tags=machine:10m50-ghrd
+        :avocado: tags=boots:kernel
         """
         tar_hash = 'e4251141726c412ac0407c5a6bceefbbff018918'
         tar_url = ('https://www.qemu-advent-calendar.org'
@@ -359,6 +376,7 @@ def test_ppc_g3beige(self):
         """
         :avocado: tags=arch:ppc
         :avocado: tags=machine:g3beige
+        :avocado: tags=boots:kernel
         """
         tar_hash = 'e0b872a5eb8fdc5bed19bd43ffe863900ebcedfc'
         tar_url = ('https://www.qemu-advent-calendar.org'
@@ -371,6 +389,7 @@ def test_ppc_mac99(self):
         """
         :avocado: tags=arch:ppc
         :avocado: tags=machine:mac99
+        :avocado: tags=boots:kernel
         """
         tar_hash = 'e0b872a5eb8fdc5bed19bd43ffe863900ebcedfc'
         tar_url = ('https://www.qemu-advent-calendar.org'
@@ -383,6 +402,7 @@ def test_sparc_ss20(self):
         """
         :avocado: tags=arch:sparc
         :avocado: tags=machine:SS-20
+        :avocado: tags=boots:kernel
         """
         tar_hash = 'b18550d5d61c7615d989a06edace051017726a9f'
         tar_url = ('https://www.qemu-advent-calendar.org'
@@ -395,6 +415,7 @@ def test_xtensa_lx60(self):
         :avocado: tags=arch:xtensa
         :avocado: tags=machine:lx60
         :avocado: tags=cpu:dc233c
+        :avocado: tags=boots:kernel
         """
         tar_hash = '49e88d9933742f0164b60839886c9739cb7a0d34'
         tar_url = ('https://www.qemu-advent-calendar.org'
@@ -415,6 +436,8 @@ def test_mips_malta_cpio(self):
         :avocado: tags=machine:malta
         :avocado: tags=endian:big
         :avocado: tags=slowness:high
+        :avocado: tags=boots:kernel
+        :avocado: tags=boots:initrd
         """
         deb_url = ('http://snapshot.debian.org/archive/debian/'
                    '20160601T041800Z/pool/main/l/linux/'
@@ -446,6 +469,8 @@ def test_mips64el_malta_5KEc_cpio(self):
         :avocado: tags=endian:little
         :avocado: tags=slowness:high
         :avocado: tags=cpu:5KEc
+        :avocado: tags=boots:kernel
+        :avocado: tags=boots:initrd
         """
         kernel_url = ('https://github.com/philmd/qemu-testing-blob/'
                       'raw/9ad2df38/mips/malta/mips64el/'
@@ -486,6 +511,7 @@ def test_mips_malta32el_nanomips_4k(self):
         :avocado: tags=machine:malta
         :avocado: tags=endian:little
         :avocado: tags=cpu:I7200
+        :avocado: tags=boots:kernel
         """
         kernel_url = ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
@@ -500,6 +526,7 @@ def test_mips_malta32el_nanomips_16k_up(self):
         :avocado: tags=machine:malta
         :avocado: tags=endian:little
         :avocado: tags=cpu:I7200
+        :avocado: tags=boots:kernel
         """
         kernel_url = ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
@@ -514,6 +541,7 @@ def test_mips_malta32el_nanomips_64k_dbg(self):
         :avocado: tags=machine:malta
         :avocado: tags=endian:little
         :avocado: tags=cpu:I7200
+        :avocado: tags=boots:kernel
         """
         kernel_url = ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
diff --git a/tests/avocado/replay_linux.py b/tests/avocado/replay_linux.py
index b56eeccfdd..b2c02c07f6 100644
--- a/tests/avocado/replay_linux.py
+++ b/tests/avocado/replay_linux.py
@@ -98,6 +98,7 @@ class ReplayLinuxX8664(ReplayLinux):
     """
     :avocado: tags=arch:x86_64
     :avocado: tags=accel:tcg
+    :avocado: tags=boots:distro
     """
 
     chksum = 'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0'
diff --git a/tests/avocado/reverse_debugging.py b/tests/avocado/reverse_debugging.py
index 2cb39f3e59..f198173bf7 100644
--- a/tests/avocado/reverse_debugging.py
+++ b/tests/avocado/reverse_debugging.py
@@ -198,6 +198,7 @@ def test_aarch64_virt(self):
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:virt
         :avocado: tags=cpu:cortex-a53
+        :avocado: tags=boots:kernel
         """
         kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
                       '/linux/releases/29/Everything/aarch64/os/images/pxeboot'
diff --git a/tests/avocado/smmu.py b/tests/avocado/smmu.py
index b3c4de6bf4..dcc7402beb 100644
--- a/tests/avocado/smmu.py
+++ b/tests/avocado/smmu.py
@@ -19,6 +19,7 @@ class SMMU(LinuxTest):
     :avocado: tags=cpu:host
     :avocado: tags=arch:aarch64
     :avocado: tags=machine:virt
+    :avocado: tags=boots:distro
     :avocado: tags=distro:fedora
     :avocado: tags=smmu
     """
diff --git a/tests/avocado/tcg_plugins.py b/tests/avocado/tcg_plugins.py
index 642d2e49e3..296e663152 100644
--- a/tests/avocado/tcg_plugins.py
+++ b/tests/avocado/tcg_plugins.py
@@ -69,6 +69,7 @@ def test_aarch64_virt_insn(self):
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:virt
         :avocado: tags=cpu:cortex-a53
+        :avocado: tags=boots:kernel
         """
         kernel_path = self._grab_aarch64_kernel()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
@@ -95,6 +96,7 @@ def test_aarch64_virt_insn_icount(self):
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:virt
         :avocado: tags=cpu:cortex-a53
+        :avocado: tags=boots:kernel
         """
         kernel_path = self._grab_aarch64_kernel()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
@@ -121,6 +123,7 @@ def test_aarch64_virt_mem_icount(self):
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:virt
         :avocado: tags=cpu:cortex-a53
+        :avocado: tags=boots:kernel
         """
         kernel_path = self._grab_aarch64_kernel()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
diff --git a/tests/avocado/virtio-gpu.py b/tests/avocado/virtio-gpu.py
index 2a249a3a2c..e91efac8ea 100644
--- a/tests/avocado/virtio-gpu.py
+++ b/tests/avocado/virtio-gpu.py
@@ -32,6 +32,8 @@ class VirtioGPUx86(QemuSystemTest):
     :avocado: tags=virtio-gpu
     :avocado: tags=arch:x86_64
     :avocado: tags=cpu:host
+    :avocado: tags=boots:kernel
+    :avocado: tags=boots:initrd
     """
 
     KERNEL_COMMAND_LINE = "printk.time=0 console=ttyS0 rdinit=/bin/bash"
diff --git a/tests/avocado/virtiofs_submounts.py b/tests/avocado/virtiofs_submounts.py
index d9c2c9d9ef..3848f351fb 100644
--- a/tests/avocado/virtiofs_submounts.py
+++ b/tests/avocado/virtiofs_submounts.py
@@ -16,6 +16,7 @@ class VirtiofsSubmountsTest(LinuxTest):
     """
     :avocado: tags=arch:x86_64
     :avocado: tags=accel:kvm
+    :avocado: tags=boots:distro
     """
 
     def run(self, args, ignore_error=False):
-- 
2.35.1


