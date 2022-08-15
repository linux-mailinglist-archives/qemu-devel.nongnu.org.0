Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D820A5927DA
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 04:44:02 +0200 (CEST)
Received: from localhost ([::1]:59244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNQ5B-00069J-FS
	for lists+qemu-devel@lfdr.de; Sun, 14 Aug 2022 22:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oNPzL-0001HF-JI; Sun, 14 Aug 2022 22:38:00 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:54503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oNPzH-0001HY-Rz; Sun, 14 Aug 2022 22:37:59 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4M5djk3PyRz4xL5; Mon, 15 Aug 2022 12:37:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1660531066;
 bh=0BHLAs1OeZdtkxJwDFeK0dHKYwqiN0jVqOP4wlTvO44=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XfuLKOP5oB7Vri/azUTuz4D62gADDufCWFHNkHq+hSm0iZcCRqTwduqVC5QvoUV4r
 qlu56D9D1Y3xjUrvII1ESvnzrGOFpCPLt1EVIqW0SNOhdEYnerr0xehacCppmLknBy
 wHQzq0PnpQS3DSw+rEWo9Yq934me4U2XseKp2e7E=
Date: Mon, 15 Aug 2022 12:36:25 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, alistair.francis@wdc.com,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: Re: [PATCH for-7.2 v2 01/20] hw/arm: do not free machine->fdt in
 arm_load_dtb()
Message-ID: <YvmxKX2m2YYQqBz0@yekko>
References: <20220805093948.82561-1-danielhb413@gmail.com>
 <20220805093948.82561-2-danielhb413@gmail.com>
 <YvCBwE200sVzMixz@yekko>
 <2414971c-5e65-96f2-26ee-6d0a35823bdd@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="U8urR2n3HnWSToWw"
Content-Disposition: inline
In-Reply-To: <2414971c-5e65-96f2-26ee-6d0a35823bdd@gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--U8urR2n3HnWSToWw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 12, 2022 at 07:03:26PM -0300, Daniel Henrique Barboza wrote:
> David,
>=20
> On 8/8/22 00:23, David Gibson wrote:
> > On Fri, Aug 05, 2022 at 06:39:29AM -0300, Daniel Henrique Barboza wrote:
> > > At this moment, arm_load_dtb() can free machine->fdt when
> > > binfo->dtb_filename is NULL. If there's no 'dtb_filename', 'fdt' will=
 be
> > > retrieved by binfo->get_dtb(). If get_dtb() returns machine->fdt, as =
is
> > > the case of machvirt_dtb() from hw/arm/virt.c, fdt now has a pointer =
to
> > > machine->fdt. And, in that case, the existing g_free(fdt) at the end =
of
> > > arm_load_dtb() will make machine->fdt point to an invalid memory regi=
on.
> > >=20
> > > This is not an issue right now because there's no code that access
> > > machine->fdt after arm_load_dtb(), but we're going to add a couple do
> > > FDT HMP commands that will rely on machine->fdt being valid.
> > >=20
> > > Instead of freeing 'fdt' at the end of arm_load_dtb(), assign it to
> > > machine->fdt. This will allow the FDT of ARM machines that relies on
> > > arm_load_dtb() to be accessed later on.
> > >=20
> > > Since all ARM machines allocates the FDT only once, we don't need to
> > > worry about leaking the existing FDT during a machine reset (which is
> > > something that other machines have to look after, e.g. the ppc64 pSer=
ies
> > > machine).
> > >=20
> > > Cc: Peter Maydell <peter.maydell@linaro.org>
> > > Cc: qemu-arm@nongnu.org
> > > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > > ---
> > >   hw/arm/boot.c | 8 +++++++-
> > >   1 file changed, 7 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> > > index ada2717f76..9f5ceb62d2 100644
> > > --- a/hw/arm/boot.c
> > > +++ b/hw/arm/boot.c
> > > @@ -684,7 +684,13 @@ int arm_load_dtb(hwaddr addr, const struct arm_b=
oot_info *binfo,
> > >        */
> > >       rom_add_blob_fixed_as("dtb", fdt, size, addr, as);
> > > -    g_free(fdt);
> > > +    /*
> > > +     * Update the ms->fdt pointer to enable support for 'dumpdtb'
> > > +     * and 'info fdt' commands. Use fdt_pack() to shrink the blob
> > > +     * size we're going to store.
> > > +     */
> > > +    fdt_pack(fdt);
> > > +    ms->fdt =3D fdt;
> > >       return size;
> >=20
> > fdt_pack() could change (reduce) the effective size of the dtb blob,
> > so returning a 'size' value from above rather than the new value of
> > fdt_totalsize(fdt) doesn't see right.
>=20
> After some thought I think executing fdt_pack() like I'm doing here is not
> a good idea. The first problem is that I'm not returning the updated size,
> as you've said.
>=20
> But I can't just amend a 'return fdt_totalsize(fdt);' either. I'm packing=
 the
> FDT **after** the machine store it in the guest physical memory. If I ret=
urn
> the packed size, but the machine isn't packing the FDT before a
> cpu_physical_memory_write(), I'll be under-reporting the FDT size written.

Ah... good point.

> Machines such as e500 (patch 4) uses this returned value to put more stuf=
f in
> the guest memory. In that case, returning a smaller size that what was ac=
tually
> written can cause the machine to overwrite the FDT by accident. In fact, =
only
> a handful of machines (ppc/pseries, ppc/pvn, riscv, oepenrisc) is doing a
> fdt_pack() before a cpu_physical_memory_write(). So this change would be
> potentially harmful to a lot of people.
>=20
> One alternative would be to do a fdt_pack() before the machine writes the
> FDT in the guest memory, but that is too intrusive to do because I can't =
say
> if each of these machines will be OK with that. I have a hunch that it wo=
uld
> be OK, but a hunch isn't going to cut it.

Hmm.. I'd be fairly confident that would be ok.  It certainly should
be ok for the fdt content itself, fdt_pack() doesn't change that
semantically.  If the machine is using that size to put stuff after, I
can't really see how that could break, either.  Unless the machine
were using the fdtsize in one place and a fixed size somewhere else to
address the same data, which would be a bug.

> I'll just drop the fdt_pack() for each of these patches. If the machine c=
ode
> is already packing it, fine. If not, that's fine too. Each maintainer can
> assess whether packing the FDT is worth it or not.

That's probably reasonable for the time being.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--U8urR2n3HnWSToWw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmL5sRQACgkQgypY4gEw
YSI8RA/+Is9QYROmiu3560pOwpyRrTzZNsVWE0WWRUczQ1HMGsSE89JDzuupCJMU
IEWJJkcVs1EILT4Krew19Y4fKCR1N9fuES6UIOA1BXosC9nhvbnv6pymN8BhR+Cq
idChZ2XdSajk2o+4RUVaSmMD8Q6KG5foPYxEKh090n3S7CBp+vl2UHo/heVK3BsD
m8ej7jCzK6GHwoWm4U5gFyUDjCZFrK+rDMU8AgdChzg/s2i0n+fWZSkvsdJZEsqE
EZFQgLTlwDK1O3T6slqmsk41DdZyeDDkFM5mb1ZPwVX86LUQaY6EBz2YBm+GevNi
oR2QIFBoN8Z8Irp+3Hqd39jLRBMBMMnN3jMVTNqeECRawgcj0L2GYPem+NGxu85W
M0VcNc4MZt/NV73xjXMOSKK0rsRs3Rx7Z8wnP9afB5L9hogtVMW7P7b/Fi0nPDrc
z9wUOaOyDDXAitdx+KKkgaMD9AAouq6h5DO3xv3OqXH5zoGhBEuZC+wcherGNRCT
irOkdOthdSNMeJY9fmJ0kNgKpoF8q6UPAIrZvQNJST5jro7mBXxXOt4BKgHkHLqq
qeBHkuff5xqbI1reOEPX+iETVGN/fLrtuExceKmvmjJ96yswm3fBqF9oMadSkykg
IC1lPw2lzz5+SYIludGUzRsdvPd6duvBNLUg3or42emToU8qfAA=
=NlOA
-----END PGP SIGNATURE-----

--U8urR2n3HnWSToWw--

