Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D82C38E766
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 15:26:02 +0200 (CEST)
Received: from localhost ([::1]:36376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llAam-0000mk-Qi
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 09:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1llAZV-0008DD-8V; Mon, 24 May 2021 09:24:41 -0400
Received: from ozlabs.org ([203.11.71.1]:48661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1llAZS-00046P-1Q; Mon, 24 May 2021 09:24:40 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FpdGl5Llyz9sRK; Mon, 24 May 2021 23:24:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621862671;
 bh=7s4Sxd+3Y26ARxUj5UeuAp/fwBAy3i5KrH8bAX3++6E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JZFBQ5DffkNn4xwnm6o8khyX6cMySM9CsJMuhjme/VAYc+iRiKqEm4m5IKDinCLsK
 4hXF2DN5pwcEyjx3TsU/NMwN9T1zeAbHOwbjvXEwJfTYxlaR4mSLGuoDI+yzjvbABw
 qKDS5bS7193syZ6G5MKUMnAcyOy0SFyDLnyj8P5U=
Date: Mon, 24 May 2021 20:50:56 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH qemu v20] spapr: Implement Open Firmware client interface
Message-ID: <YKuFEBl8+ljUfs2B@yekko>
References: <20210520090557.435689-1-aik@ozlabs.ru>
 <eb49cd30-a4f4-d063-d728-521446a671a6@eik.bme.hu>
 <YKs4NbB4lF/YTAqo@yekko>
 <3bf2ff2c-6cf3-ee4c-48b-394c531876@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oXcLg/jYeDQ1tYPL"
Content-Disposition: inline
In-Reply-To: <3bf2ff2c-6cf3-ee4c-48b-394c531876@eik.bme.hu>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--oXcLg/jYeDQ1tYPL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 24, 2021 at 11:57:27AM +0200, BALATON Zoltan wrote:
> On Mon, 24 May 2021, David Gibson wrote:
> > On Thu, May 20, 2021 at 11:59:07PM +0200, BALATON Zoltan wrote:
> > > On Thu, 20 May 2021, Alexey Kardashevskiy wrote:
> > > > The PAPR platform describes an OS environment that's presented by
> > > > a combination of a hypervisor and firmware. The features it specifi=
es
> > > > require collaboration between the firmware and the hypervisor.
> > > >=20
> > > > Since the beginning, the runtime component of the firmware (RTAS) h=
as
> > > > been implemented as a 20 byte shim which simply forwards it to
> > > > a hypercall implemented in qemu. The boot time firmware component is
> > > > SLOF - but a build that's specific to qemu, and has always needed t=
o be
> > > > updated in sync with it. Even though we've managed to limit the amo=
unt
> > > > of runtime communication we need between qemu and SLOF, there's som=
e,
> > > > and it has become increasingly awkward to handle as we've implement=
ed
> > > > new features.
> > > >=20
> > > > This implements a boot time OF client interface (CI) which is
> > > > enabled by a new "x-vof" pseries machine option (stands for "Virtua=
l Open
> > > > Firmware). When enabled, QEMU implements the custom H_OF_CLIENT hca=
ll
> > > > which implements Open Firmware Client Interface (OF CI). This allows
> > > > using a smaller stateless firmware which does not have to manage
> > > > the device tree.
> > > >=20
> > > > The new "vof.bin" firmware image is included with source code under
> > > > pc-bios/. It also includes RTAS blob.
> > > >=20
> > > > This implements a handful of CI methods just to get -kernel/-initrd
> > > > working. In particular, this implements the device tree fetching and
> > > > simple memory allocator - "claim" (an OF CI memory allocator) and u=
pdates
> > > > "/memory@0/available" to report the client about available memory.
> > > >=20
> > > > This implements changing some device tree properties which we know =
how
> > > > to deal with, the rest is ignored. To allow changes, this skips
> > > > fdt_pack() when x-vof=3Don as not packing the blob leaves some room=
 for
> > > > appending.
> > > >=20
> > > > In absence of SLOF, this assigns phandles to device tree nodes to m=
ake
> > > > device tree traversing work.
> > > >=20
> > > > When x-vof=3Don, this adds "/chosen" every time QEMU (re)builds a t=
ree.
> > > >=20
> > > > This adds basic instances support which are managed by a hash map
> > > > ihandle -> [phandle].
> > > >=20
> > > > Before the guest started, the used memory is:
> > > > 0..e60 - the initial firmware
> > > > 8000..10000 - stack
> > > > 400000.. - kernel
> > > > 3ea0000.. - initramdisk
> > > >=20
> > > > This OF CI does not implement "interpret".
> > > >=20
> > > > Unlike SLOF, this does not format uninitialized nvram. Instead, this
> > > > includes a disk image with pre-formatted nvram.
> > > >=20
> > > > With this basic support, this can only boot into kernel directly.
> > > > However this is just enough for the petitboot kernel and initradmdi=
sk to
> > > > boot from any possible source. Note this requires reasonably recent=
 guest
> > > > kernel with:
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
commit/?id=3Ddf5be5be8735
> > > >=20
> > > > The immediate benefit is much faster booting time which especially
> > > > crucial with fully emulated early CPU bring up environments. Also t=
his
> > > > may come handy when/if GRUB-in-the-userspace sees light of the day.
> > > >=20
> > > > This separates VOF and sPAPR in a hope that VOF bits may be reused =
by
> > > > other POWERPC boards which do not support pSeries.
> > > >=20
> > > > This is coded in assumption that later on we might be adding suppor=
t for
> > > > booting from QEMU backends (blockdev is the first candidate) without
> > > > devices/drivers in between as OF1275 does not require that and
> > > > it is quite easy to so.
> > > >=20
> > > > Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> > > > ---
> > > >=20
> > > > The example command line is:
> > > >=20
> > > > /home/aik/pbuild/qemu-killslof-localhost-ppc64/qemu-system-ppc64 \
> > > > -nodefaults \
> > > > -chardev stdio,id=3DSTDIO0,signal=3Doff,mux=3Don \
> > > > -device spapr-vty,id=3Dsvty0,reg=3D0x71000110,chardev=3DSTDIO0 \
> > > > -mon id=3DMON0,chardev=3DSTDIO0,mode=3Dreadline \
> > > > -nographic \
> > > > -vga none \
> > > > -enable-kvm \
> > > > -m 8G \
> > > > -machine pseries,x-vof=3Don,cap-cfpc=3Dbroken,cap-sbbc=3Dbroken,cap=
-ibs=3Dbroken,cap-ccf-assist=3Doff \
> > > > -kernel pbuild/kernel-le-guest/vmlinux \
> > > > -initrd pb/rootfs.cpio.xz \
> > > > -drive id=3DDRIVE0,if=3Dnone,file=3D./p/qemu-killslof/pc-bios/vof-n=
vram.bin,format=3Draw \
> > > > -global spapr-nvram.drive=3DDRIVE0 \
> > > > -snapshot \
> > > > -smp 8,threads=3D8 \
> > > > -L /home/aik/t/qemu-ppc64-bios/ \
> > > > -trace events=3Dqemu_trace_events \
> > > > -d guest_errors \
> > > > -chardev socket,id=3DSOCKET0,server,nowait,path=3Dqemu.mon.tmux26 \
> > > > -mon chardev=3DSOCKET0,mode=3Dcontrol
> > > >=20
> > > > ---
> > > > Changes:
> > > > v20:
> > > > * compile vof.bin with -mcpu=3Dpower4 for better compatibility
> > > > * s/std/stw/ in entry.S to make it work on ppc32
> > > > * fixed dt_available property to support both 32 and 64bit
> > > > * shuffled prom_args handling code
> > > > * do not enforce 32bit in MSR (again, to support 32bit platforms)
> > > >=20
> > >=20
> > > [...]
> > >=20
> > > > diff --git a/default-configs/devices/ppc64-softmmu.mak b/default-co=
nfigs/devices/ppc64-softmmu.mak
> > > > index ae0841fa3a18..9fb201dfacfa 100644
> > > > --- a/default-configs/devices/ppc64-softmmu.mak
> > > > +++ b/default-configs/devices/ppc64-softmmu.mak
> > > > @@ -9,3 +9,4 @@ CONFIG_POWERNV=3Dy
> > > >  # For pSeries
> > > >  CONFIG_PSERIES=3Dy
> > > >  CONFIG_NVDIMM=3Dy
> > > > +CONFIG_VOF=3Dy
> > > > diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> > > > index e51e0e5e5ac6..964510dfc73d 100644
> > > > --- a/hw/ppc/Kconfig
> > > > +++ b/hw/ppc/Kconfig
> > > > @@ -143,3 +143,6 @@ config FW_CFG_PPC
> > > >=20
> > > >  config FDT_PPC
> > > >      bool
> > > > +
> > > > +config VOF
> > > > +    bool
> > >=20
> > > I think you should just add "select VOF" to config PSERIES section in
> > > Kconfig instead of adding it to default-configs/devices/ppc64-softmmu=
=2Emak.
> > > That should do it, it works in my updated pegasos2 patch:
> >=20
> > No, we don't want a "select": PSERIES doesn't require VOF while we
> > still support SLOF, and indeed we're quite a ways from being ready to
> > even make VOF the default pseries firmware.
>=20
> Shouldn't you then also need to make code in spapr adding x-vof condition=
al
> on CONFIG_VOF or make sure it cannot be enabled if not compiled in?
> Otherwise it means VOF is always an option so spapr depends on VOF for wh=
ich
> select is the way to describe that.

Uh, yes, we probably should.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--oXcLg/jYeDQ1tYPL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCrhQ4ACgkQbDjKyiDZ
s5IRsxAAnh3THUilo+0nf/etgwMnhGyv6hVzh/97hIjDkIrzxavNnikPHzdKaO3K
JbB8W1o6tgnJMb7v4u856yRmsqeprzIEJx9f3WaUiGvDOKvNIGbLX2ckwFqz1uB+
xyTH9NNSRiFpBlJUwUn8UWyyHz0meAfm84KNPYpqpRb2nFl5mUfCQDgz10LNmPmY
tcw+Obgx8CrsqVqsSZ5jBw1r23MQzEmDi6A8mWxm2/D9vuXISgkkr344LoF2EqoE
zVz2Cu5TYqi5Z9rt0EoT3hn06v7RDCA1fG3bu7c5jH9SUZrjpKV1olS3sXzLzihe
Xv/wG6Q/T627PgRFyVXvg2pEyrTlXgmJ/NgfgaFLRqeHNeEpn7IGS54P4TOu1gRv
zKV6WZ42jST/KqvP0hmywXtRbhyfezm9GWd24x0Cf5QWSYqKsOZP4HCuIPbgZYhv
+pm8FQx50jwdXJIUR7mQ03jdsggwPiTqXf+MNQlt1HYIFq22K0Cx7LsO6qoRTk8r
Vhl5nT45rupxh+JnQeMqQVF1v+XUtYXub+IhLf0+ZuEg8jOBXz/ZmEUKrKkadBp6
qw1v36y+0L7by/EEFEvbmndqDrSpMSCnG5ijz0gmLLa4JuKCbCoo57mOdYJgMnLn
4MucWOYjZEsQs97ZoDUmvD5aSJqYI1s3HjbaaqubjddKhtBXV9I=
=gdBp
-----END PGP SIGNATURE-----

--oXcLg/jYeDQ1tYPL--

