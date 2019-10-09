Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF68D18F0
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Oct 2019 21:28:06 +0200 (CEST)
Received: from localhost ([::1]:55178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIHcy-0002t1-Io
	for lists+qemu-devel@lfdr.de; Wed, 09 Oct 2019 15:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49367)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iIEkk-0004J7-Mo
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 12:23:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iIEkj-0000c7-8a
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 12:23:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46144)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>)
 id 1iIEke-0000Zc-3u; Wed, 09 Oct 2019 12:23:48 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AFB0330A5A5A;
 Wed,  9 Oct 2019 16:23:46 +0000 (UTC)
Received: from localhost.localdomain (ovpn-122-151.rdu2.redhat.com
 [10.10.122.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FA75194B6;
 Wed,  9 Oct 2019 16:23:38 +0000 (UTC)
Date: Wed, 9 Oct 2019 12:23:36 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 19/19] tests/boot_linux_console: Test SDHCI and termal
 sensor on raspi3
Message-ID: <20191009162336.GF30349@localhost.localdomain>
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-20-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190926173428.10713-20-f4bug@amsat.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Wed, 09 Oct 2019 16:23:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?iso-8859-1?Q?Zolt=E1n?= Baldaszti <bztemail@gmail.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm@nongnu.org,
 Clement Deschamps <clement.deschamps@antfield.fr>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Cheng Xiang <ext-cheng.xiang@here.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Guenter Roeck <linux@roeck-us.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 26, 2019 at 07:34:27PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Add a test which loads the root filesystem on a SD card.
> Use a kernel recent enough to also test the thermal sensor.
>=20
> The kernel image comes from:
> https://github.com/sakaki-/bcmrpi3-kernel#description
>=20
> The cpio image used comes from the linux-build-test project:
> https://github.com/groeck/linux-build-test
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> ---
>  tests/acceptance/boot_linux_console.py | 45 ++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>=20
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/=
boot_linux_console.py
> index 2a1a23763e..5c48cacba8 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -410,6 +410,51 @@ class BootLinuxConsole(Test):
>          self.exec_command_and_wait_for_pattern('reboot',
>                                                 'reboot: Restarting sys=
tem')
> =20
> +    def test_arm_raspi3_initrd_sd_temp(self):
> +        """
> +        :avocado: tags=3Darch:aarch64
> +        :avocado: tags=3Dmachine:raspi3
> +        """
> +        tarball_url =3D ('https://github.com/sakaki-/bcmrpi3-kernel/re=
leases/'
> +                       'download/4.19.71.20190910/'
> +                       'bcmrpi3-kernel-4.19.71.20190910.tar.xz')
> +        tarball_hash =3D '844f117a1a6de0532ba92d2a7bceb5b2acfbb298'
> +        tarball_path =3D self.fetch_asset(tarball_url, asset_hash=3Dta=
rball_hash)
> +        archive.extract(tarball_path, self.workdir)
> +        dtb_path    =3D self.workdir + "/boot/bcm2837-rpi-3-b.dtb"
> +        kernel_path =3D self.workdir + "/boot/kernel8.img"
> +
> +        rootfs_url =3D ('https://github.com/groeck/linux-build-test/ra=
w/'
> +                      '9b6b392ea7bc15f0d6632328d429d31c9c6273da/rootfs=
/'
> +                      'arm64/rootfs.ext2.gz')
> +        rootfs_hash =3D 'dbe4136f0b4a0d2180b93fd2a3b9a784f9951d10'
> +        rootfs_path_gz =3D self.fetch_asset(rootfs_url, asset_hash=3Dr=
ootfs_hash)
> +        rootfs_path =3D self.workdir + "rootfs.ext2"
> +        gunzip(rootfs_path_gz, rootfs_path)

If you drop the local gunzip method utility, you'll have to touch this.

> +
> +        self.vm.set_machine('raspi3')
> +        self.vm.set_console()
> +        kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE +
> +                               'earlycon=3Dpl011,0x3f201000 console=3D=
ttyAMA0 ' +
> +                               'root=3D/dev/mmcblk0 rootwait rw ' +
> +                               'panic=3D-1 noreboot')
> +        self.vm.add_args('-kernel', kernel_path,
> +                         '-dtb', dtb_path,
> +                         '-append', kernel_command_line,
> +                         '-drive', 'file=3D' + rootfs_path + ',if=3Dsd=
,format=3Draw',
> +                         '-no-reboot')
> +        self.vm.launch()
> +
> +        self.wait_for_console_pattern('Boot successful.')
> +
> +        self.exec_command_and_wait_for_pattern('cat /proc/cpuinfo',
> +                                               'Raspberry Pi 3 Model B=
')
> +        self.exec_command_and_wait_for_pattern('cat /sys/devices/virtu=
al/' +
> +                                               'thermal/thermal_zone0/=
temp',
> +                                               '25178')

Nitpick: you could avoid the strings concatenation operation with:

self.exec_command_and_wait_for_pattern(('cat /sys/devices/virtual/'
                                        'thermal/thermal_zone0/temp'),
                                       '25178')

> +        self.exec_command_and_wait_for_pattern('reboot',
> +                                               'reboot: Restarting sys=
tem')
> +
>      def test_s390x_s390_ccw_virtio(self):
>          """
>          :avocado: tags=3Darch:s390x
> --=20
> 2.20.1
>=20

Either way,

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>

