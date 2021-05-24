Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E98F838E16F
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 09:20:55 +0200 (CEST)
Received: from localhost ([::1]:44026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll4tS-0003GZ-MF
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 03:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll4rq-00016H-0l; Mon, 24 May 2021 03:19:14 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:42697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ll4rn-00018y-4q; Mon, 24 May 2021 03:19:13 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FpT961Nx3z9sVb; Mon, 24 May 2021 17:19:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621840746;
 bh=SXuin8OCDmwjX/aejT4KPWM6FlOZPTteM083TR9yk+E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KJvZd5dvLUj5yZJuPJCopxDllIUGim8Rl/H1ZCZ5lH+Wa/Oxw6gB+J5z+l5hCIFwu
 cH9UvJ48hXS1JoyxupKySWf6qizHwvir4+ZPxj1PbYCus2Zt1qzPcDAEBov7FCHGan
 pbcrkU/zHeJUI199xP/qp2BP1cA4dGw2yIKg4zgM=
Date: Mon, 24 May 2021 15:23:01 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH qemu v20] spapr: Implement Open Firmware client interface
Message-ID: <YKs4NbB4lF/YTAqo@yekko>
References: <20210520090557.435689-1-aik@ozlabs.ru>
 <eb49cd30-a4f4-d063-d728-521446a671a6@eik.bme.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qijBsoUgyrVRzuwV"
Content-Disposition: inline
In-Reply-To: <eb49cd30-a4f4-d063-d728-521446a671a6@eik.bme.hu>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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


--qijBsoUgyrVRzuwV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 20, 2021 at 11:59:07PM +0200, BALATON Zoltan wrote:
> On Thu, 20 May 2021, Alexey Kardashevskiy wrote:
> > The PAPR platform describes an OS environment that's presented by
> > a combination of a hypervisor and firmware. The features it specifies
> > require collaboration between the firmware and the hypervisor.
> >=20
> > Since the beginning, the runtime component of the firmware (RTAS) has
> > been implemented as a 20 byte shim which simply forwards it to
> > a hypercall implemented in qemu. The boot time firmware component is
> > SLOF - but a build that's specific to qemu, and has always needed to be
> > updated in sync with it. Even though we've managed to limit the amount
> > of runtime communication we need between qemu and SLOF, there's some,
> > and it has become increasingly awkward to handle as we've implemented
> > new features.
> >=20
> > This implements a boot time OF client interface (CI) which is
> > enabled by a new "x-vof" pseries machine option (stands for "Virtual Op=
en
> > Firmware). When enabled, QEMU implements the custom H_OF_CLIENT hcall
> > which implements Open Firmware Client Interface (OF CI). This allows
> > using a smaller stateless firmware which does not have to manage
> > the device tree.
> >=20
> > The new "vof.bin" firmware image is included with source code under
> > pc-bios/. It also includes RTAS blob.
> >=20
> > This implements a handful of CI methods just to get -kernel/-initrd
> > working. In particular, this implements the device tree fetching and
> > simple memory allocator - "claim" (an OF CI memory allocator) and updat=
es
> > "/memory@0/available" to report the client about available memory.
> >=20
> > This implements changing some device tree properties which we know how
> > to deal with, the rest is ignored. To allow changes, this skips
> > fdt_pack() when x-vof=3Don as not packing the blob leaves some room for
> > appending.
> >=20
> > In absence of SLOF, this assigns phandles to device tree nodes to make
> > device tree traversing work.
> >=20
> > When x-vof=3Don, this adds "/chosen" every time QEMU (re)builds a tree.
> >=20
> > This adds basic instances support which are managed by a hash map
> > ihandle -> [phandle].
> >=20
> > Before the guest started, the used memory is:
> > 0..e60 - the initial firmware
> > 8000..10000 - stack
> > 400000.. - kernel
> > 3ea0000.. - initramdisk
> >=20
> > This OF CI does not implement "interpret".
> >=20
> > Unlike SLOF, this does not format uninitialized nvram. Instead, this
> > includes a disk image with pre-formatted nvram.
> >=20
> > With this basic support, this can only boot into kernel directly.
> > However this is just enough for the petitboot kernel and initradmdisk to
> > boot from any possible source. Note this requires reasonably recent gue=
st
> > kernel with:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3Ddf5be5be8735
> >=20
> > The immediate benefit is much faster booting time which especially
> > crucial with fully emulated early CPU bring up environments. Also this
> > may come handy when/if GRUB-in-the-userspace sees light of the day.
> >=20
> > This separates VOF and sPAPR in a hope that VOF bits may be reused by
> > other POWERPC boards which do not support pSeries.
> >=20
> > This is coded in assumption that later on we might be adding support for
> > booting from QEMU backends (blockdev is the first candidate) without
> > devices/drivers in between as OF1275 does not require that and
> > it is quite easy to so.
> >=20
> > Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> > ---
> >=20
> > The example command line is:
> >=20
> > /home/aik/pbuild/qemu-killslof-localhost-ppc64/qemu-system-ppc64 \
> > -nodefaults \
> > -chardev stdio,id=3DSTDIO0,signal=3Doff,mux=3Don \
> > -device spapr-vty,id=3Dsvty0,reg=3D0x71000110,chardev=3DSTDIO0 \
> > -mon id=3DMON0,chardev=3DSTDIO0,mode=3Dreadline \
> > -nographic \
> > -vga none \
> > -enable-kvm \
> > -m 8G \
> > -machine pseries,x-vof=3Don,cap-cfpc=3Dbroken,cap-sbbc=3Dbroken,cap-ibs=
=3Dbroken,cap-ccf-assist=3Doff \
> > -kernel pbuild/kernel-le-guest/vmlinux \
> > -initrd pb/rootfs.cpio.xz \
> > -drive id=3DDRIVE0,if=3Dnone,file=3D./p/qemu-killslof/pc-bios/vof-nvram=
=2Ebin,format=3Draw \
> > -global spapr-nvram.drive=3DDRIVE0 \
> > -snapshot \
> > -smp 8,threads=3D8 \
> > -L /home/aik/t/qemu-ppc64-bios/ \
> > -trace events=3Dqemu_trace_events \
> > -d guest_errors \
> > -chardev socket,id=3DSOCKET0,server,nowait,path=3Dqemu.mon.tmux26 \
> > -mon chardev=3DSOCKET0,mode=3Dcontrol
> >=20
> > ---
> > Changes:
> > v20:
> > * compile vof.bin with -mcpu=3Dpower4 for better compatibility
> > * s/std/stw/ in entry.S to make it work on ppc32
> > * fixed dt_available property to support both 32 and 64bit
> > * shuffled prom_args handling code
> > * do not enforce 32bit in MSR (again, to support 32bit platforms)
> >=20
>=20
> [...]
>=20
> > diff --git a/default-configs/devices/ppc64-softmmu.mak b/default-config=
s/devices/ppc64-softmmu.mak
> > index ae0841fa3a18..9fb201dfacfa 100644
> > --- a/default-configs/devices/ppc64-softmmu.mak
> > +++ b/default-configs/devices/ppc64-softmmu.mak
> > @@ -9,3 +9,4 @@ CONFIG_POWERNV=3Dy
> >  # For pSeries
> >  CONFIG_PSERIES=3Dy
> >  CONFIG_NVDIMM=3Dy
> > +CONFIG_VOF=3Dy
> > diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> > index e51e0e5e5ac6..964510dfc73d 100644
> > --- a/hw/ppc/Kconfig
> > +++ b/hw/ppc/Kconfig
> > @@ -143,3 +143,6 @@ config FW_CFG_PPC
> >=20
> >  config FDT_PPC
> >      bool
> > +
> > +config VOF
> > +    bool
>=20
> I think you should just add "select VOF" to config PSERIES section in
> Kconfig instead of adding it to default-configs/devices/ppc64-softmmu.mak.
> That should do it, it works in my updated pegasos2 patch:

No, we don't want a "select": PSERIES doesn't require VOF while we
still support SLOF, and indeed we're quite a ways from being ready to
even make VOF the default pseries firmware.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--qijBsoUgyrVRzuwV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCrODMACgkQbDjKyiDZ
s5J59Q/+PznfDKRcyuFzV1/roei7n0shYfHoLh9d7jVz3VjWGmVV/EBcZKcB+Nj/
imPlcTwhlM42Kw/I+E7LCbEbVpgZiPFbN+ACt1CTfvoYdZ6Z9xi478cKMYZoL16y
xQ2ASzgGOFWW3dKDogY1FnEoy0qTIOYuUIJIFzht9HQvrKxO3aTVRvwQUU2+C/A3
H0wQZzQ9btgr8XRzJiaw9B4qQOxMFo0AvehG311EXoicsn0W6IHQkRHXUzUBMNaA
JUEeVeKpvZaNcKV3i6GvvwUKikEs+7uxbOtHg03fpnERBLO15zZKG0rlfwSwL+Ld
K6oZUluFIxvbKSEui7vYAcKtJS/PAX8NauP32VPJT/Aht4u0AGvsaTvGdNquCOC8
pXbm+5pN7plpDmGeIcKtADR0qUG2lHYu3jcovvQPBsHgbUKFgv4lMPqzCf80iJzs
viiRA2U0yVBZ9AFnQXwSbMWtLht7WQT4l90lxCV7fhymXaIBqDUkUI3wy/FDgn2w
opuTFkjG/u+otzgQRFKApPrxkh8wB4BAsIjuqGJV2ax+VQdmalq6lrxKJoM8EnI/
H1k2TyFCRzTQ9wk/33GdHYySxB5oLrMVJP1WOvr+E4d9Nwvr020AILEOsF/afRgV
sEpELL16+Nqr7B8A8wh+ghGrv9nP+j8sQP8mrvAjS+ggYD/bsRs=
=mwnc
-----END PGP SIGNATURE-----

--qijBsoUgyrVRzuwV--

