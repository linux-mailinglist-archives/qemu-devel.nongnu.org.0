Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1D5382506
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 09:06:22 +0200 (CEST)
Received: from localhost ([::1]:58538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liXKX-00088t-Cv
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 03:06:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1liX1H-0004r2-53; Mon, 17 May 2021 02:46:27 -0400
Received: from ozlabs.org ([203.11.71.1]:57783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1liX1D-0002f6-V1; Mon, 17 May 2021 02:46:26 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fk8mX1fKPz9sWQ; Mon, 17 May 2021 16:46:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621233980;
 bh=u5FKZ4fkxBZgKuHAEzNZtbKQOMO0xp208eilHAbdvg8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hz3rr0WVBH9NUoRP21yN/jmfHxsBKSi4JUSZcENj2Uq8VAsJuBtUEKxQ3G8xMEloD
 rlFSP2qWu5auuWZY5wMxeVWfvDhNchw4p5j4bjItYsZbgdSNnqJk46oTQ+G6EXaCOJ
 e7jR+76NAwhrmZ+d0g5HICjEsxi82P3NZP9DtwRw=
Date: Mon, 17 May 2021 16:36:46 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Oliver O'Halloran <oohall@gmail.com>
Subject: Re: [PATCH updated v2] spapr: Fix EEH capability issue on KVM guest
 for PCI passthru
Message-ID: <YKIO/poP1g/0NydO@yekko>
References: <162022601665.118720.1424074431457537864.stgit@jupiter>
 <YJyYI8HDTy5eYrnq@yekko>
 <CAOSf1CFNkfAz7=fiMUm+w9TGWmF8uQBsVJsP7yjjmdQ_Hzqidg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DaqVDI5Px3T/YjiL"
Content-Disposition: inline
In-Reply-To: <CAOSf1CFNkfAz7=fiMUm+w9TGWmF8uQBsVJsP7yjjmdQ_Hzqidg@mail.gmail.com>
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Qemu-ppc <qemu-ppc@nongnu.org>, Qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--DaqVDI5Px3T/YjiL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 14, 2021 at 12:03:10PM +1000, Oliver O'Halloran wrote:
> On Thu, May 13, 2021 at 2:22 PM David Gibson
> <david@gibson.dropbear.id.au> wrote:
> >
> > On Wed, May 05, 2021 at 08:18:27PM +0530, Mahesh Salgaonkar wrote:
> > > With upstream kernel, especially after commit 98ba956f6a389
> > > ("powerpc/pseries/eeh: Rework device EEH PE determination") we see th=
at KVM
> > > guest isn't able to enable EEH option for PCI pass-through devices an=
ymore.
> > >
> > > [root@atest-guest ~]# dmesg | grep EEH
> > > [    0.032337] EEH: pSeries platform initialized
> > > [    0.298207] EEH: No capable adapters found: recovery disabled.
> > > [root@atest-guest ~]#
> > >
> > > So far the linux kernel was assuming pe_config_addr equal to device's
> > > config_addr and using it to enable EEH on the PE through ibm,set-eeh-=
option
> > > RTAS call. Which wasn't the correct way as per PAPR. The linux kernel
> > > commit 98ba956f6a389 fixed this flow. With that fixed, linux now uses=
 PE
> > > config address returned by ibm,get-config-addr-info2 RTAS call to ena=
ble
> > > EEH option per-PE basis instead of per-device basis. However this has
> > > uncovered a bug in qemu where ibm,set-eeh-option is treating PE config
> > > address as per-device config address.
> >
> > Huh.  To be fair, the stuff about this in PAPR is nearly
> > incomprehensible, so we probably used what the kernel was doing as a
> > guide instead.
>=20
> I found the PAPR documentation made some sense after I learned how EEH
> was handled on PCI(-X) systems. What's in Linux never made sense,
> unfortunately.

Indeed.

> > Hmm.. shouldn't we at least check that the supplied config_addr
> > matches the one it should be for this PHB, rather than just ignoring
> > it?
>=20
> I think that'd cause issues with older kernels.

Oh, good point.

> Prior to the rework
> mentioned by Mahesh (linux commit 98ba956f6a389 ("powerpc/pseries/eeh:
> Rework device EEH PE determination")) the kernel would call
> eeh-set-option for each device in the PE using the device's
> config_address as the argument rather than the PE address. If we
> return an error from eeh-set-option when the argument isn't a valid PE
> address then older kernels will interpret that as EEH not being
> supported. That really needs to be called out in a comment though.
> Preferably with kernel version numbers, etc.

Agreed.

> > ..and, looking back at rtas_ibm_get_config_addr_info2(), I think
> > that looks wrong in the case of PCI bridges.  AFAICT it gives an
> > address that depends on the bus, but in other places we assume that
> > the entire PHB is a single PE on the guest side, so it really
> > shouldn't.
>=20
> Yep, get_config_addr_info2 should map every device inside that PE to
> the same PE address, even when they're on child busses.

Right.

> That said, I'm
> not sure how well EEH works when there's a mix of real (vfio) and
> emulated (qemu bridges) devices in the same PHB.

I think it'll kind of work, as long as there's only real devices from
a single host PE on there.  The emulated devices will basically just
ignore EEH, but I think they should still apply ok to the passthrough
devices.

> Can VFIO pass through
> a bridge?

I don't think so.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--DaqVDI5Px3T/YjiL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCiDv4ACgkQbDjKyiDZ
s5IM9g//dUGPYFKPsbtM2OZGm2HRoT3S59JAhztTNlSgg6JM/u0JfvdpoDX7w8ED
3S1FG1mFGMh2di9izh/5t3nITK96RJVJEwRT3VqDaTFTUNNBuE/lHxUVNLEf5b0d
vfIySAkjTNwnqKOEIuZLb3ka6UdU8sj1pXoScwiwyq7N7ENPEKHfbyrQIwvOcqGo
kAGE5A34jukdmI2aS8IC818YREoLPm8gM9P0UYTs4xAK5l3MTsrv18vv6eOA2lKQ
yg6cCJjs63oxBRLy9WFiWeDMTEkOa0TW+iCZMqGawMBSYS4w5OJIAa1hSbP8ViYa
NT0JedvhBiHL3Smw8mDNrcQEuK33OWmNcvj2XS8BTV1EVAUHPwmB7ZBNFZTnfGto
6NvPoZEYFg8/9hXu6uLZK7rBxDxDsCkRrHrEKd9BO85ohqCy3dx00eTWwV00ey7A
Jgm2c1jnqAlb4eD79eg1q2kz9a6JR4HfDYGktGVMTANxV49EnqHEKokmuQT7Ydjp
w9QjuM3/OPrJtYLOdC7YdLXTVcKsMBpT7aVVhpaSoTqHVG5woh1RGffDG4SUFzcZ
fQqQXhI1q3nI8IZHEveKeFKqTv55x+bun7BV/tTd11AkVRY9tUdrQEREeHxLL6SF
Uj0830ro1GP0Z7rwmQBSJDrqxs8FnxVFRMoRzy9lzxmP0O7b4uA=
=K0Qa
-----END PGP SIGNATURE-----

--DaqVDI5Px3T/YjiL--

