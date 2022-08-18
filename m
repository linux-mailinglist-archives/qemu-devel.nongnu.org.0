Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6270597EA2
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 08:32:03 +0200 (CEST)
Received: from localhost ([::1]:59874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOZ4U-0002z3-2O
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 02:32:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oOYnz-0004rl-2p; Thu, 18 Aug 2022 02:14:59 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:36429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oOYnw-0007RC-0o; Thu, 18 Aug 2022 02:14:58 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4M7ZNj5vTGz4x1V; Thu, 18 Aug 2022 16:14:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1660803285;
 bh=oRq2R9C4iylxgEq1KLZucyf3Nu5ju+GNg97Jshk4Ypc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JIOS1/SDkvLKDsDtWSciTC/w0aKGWtpdJd/qnq+8JUrBMrdv/ZSCa60TaqWidx+gV
 It03P2pA6MSo52prXTOAn/XH67dv749y9oMOI3gT8CHvlwBZzRDJr4Nt878jzl3iGZ
 vnvWcYsQu+Y0cG6pQIZTM+q5quJ3VEp7tADjSWws=
Date: Thu, 18 Aug 2022 12:07:51 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org,
 alistair.francis@wdc.com
Subject: Re: [PATCH for-7.2 v3 10/20] hw/ppc: set machine->fdt in spapr machine
Message-ID: <Yv2e9xTwV59QXM6I@yekko>
References: <20220816173428.157304-1-danielhb413@gmail.com>
 <20220816173428.157304-11-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VP9T8UDJf+0ML8hj"
Content-Disposition: inline
In-Reply-To: <20220816173428.157304-11-danielhb413@gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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


--VP9T8UDJf+0ML8hj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2022 at 02:34:18PM -0300, Daniel Henrique Barboza wrote:
> The pSeries machine never bothered with the common machine->fdt
> attribute. We do all the FDT related work using spapr->fdt_blob.
>=20
> We're going to introduce HMP commands to read and save the FDT, which
> will rely on setting machine->fdt properly to work across all machine
> archs/types.
>=20
> Let's set machine->fdt in the two places where we manipulate the FDT:
> spapr_machine_reset() and CAS.

So, there's a third place where fdt_blob is updated, in h_update_dt();
that happens because SLOF can make some updates to the DT that qemu
needs to be aware of.  It's kinda ugly, and is a consequence of the
fact that qemu and SLOF kind of share the role of "platform firmware"
for spapr.

But.. it's worse than that.  Those are the only 3 places we actually
alter fdt_blob, but not the only places we logically update the device
tree.  Up until now there wasn't a way to introspect the DT, and so we
didn't bother keeping spapr->fdt_blob update.  Essentially, we
considered maintaining the DT image the job of the guest after CAS.

Specifically, every dynamic reconfiguration event (hotplug or unplug)
alters the device tree.  We generate an fdt fragment for the new
device then stream that as an update to the guest using the PAPR
specified interface (rtas_ibm_configure_connector).  As noted we
currently don't update qemu's global fdt image based on that.  On hot
unplug logically we need to revert those changes, which is actually
pretty tricky, but currently the guest's job.


Really, the trouble is that just dumping or viewing the dt is only
simple in an "embedded" style environment where the fdt is generate
then spit into the guest.  In an actual open firmware environment like
spapr, the DT is logically a dynamic thing maintained by firmware -
but because "firmware"'s responsibility is split between SLOF and
RTAS/qemu, keeping track of that is pretty nasty.  For an environment
like this, the flat tree format isn't really suited either - we'd want
a dynamic representation of the tree.  We get away with flat trees for
now (barely) only because we mostly delegate the responsibility for
managing the tree to SLOF and/or the OS kernel, both of which do use
non-flat representations of the tree.

> spapr->fdt_blob is left untouched for now. To replace it with
> machine->fdt, since we're migrating spapr->fdt_blob, we would need to
> migrate machine->fdt as well. This is something that we would like to to
> do keep our code simpler but it's a work we'll do another day.
>=20
> Cc: C=E9dric Le Goater <clg@kaod.org>
> Cc: qemu-ppc@nongnu.org
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/ppc/spapr.c       | 6 ++++++
>  hw/ppc/spapr_hcall.c | 8 ++++++++
>  2 files changed, 14 insertions(+)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index bc9ba6e6dc..7031cf964a 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1713,6 +1713,12 @@ static void spapr_machine_reset(MachineState *mach=
ine)
>      spapr->fdt_initial_size =3D spapr->fdt_size;
>      spapr->fdt_blob =3D fdt;
> =20
> +    /*
> +     * Set the common machine->fdt pointer to enable support
> +     * for 'dumpdtb' and 'info fdt' QMP/HMP commands.
> +     */
> +    machine->fdt =3D fdt;
> +
>      /* Set up the entry state */
>      first_ppc_cpu->env.gpr[5] =3D 0;
> =20
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index a8d4a6bcf0..a53bfd76f4 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1256,6 +1256,14 @@ target_ulong do_client_architecture_support(PowerP=
CCPU *cpu,
>      spapr->fdt_initial_size =3D spapr->fdt_size;
>      spapr->fdt_blob =3D fdt;
> =20
> +    /*
> +     * Set the machine->fdt pointer again since we just freed
> +     * it above (by freeing spapr->fdt_blob). We set this
> +     * pointer to enable support for 'dumpdtb' and 'info fdt'
> +     * QMP/HMP commands.
> +     */
> +    MACHINE(spapr)->fdt =3D fdt;
> +
>      return H_SUCCESS;
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--VP9T8UDJf+0ML8hj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmL9nvEACgkQgypY4gEw
YSLCJg//aVUeEhwTwB/I7NQAdbSR20p6684V507oVyMg/eJ0BAMtMmWOfheq7hev
u7TfwaSHelcFUDFUjOPpCZ34QigdssKU0/d8wrycuAnVBWEHJWBsNQ+SpLmDO+1D
y5PERe8we7xhVUGBZ2d1I2KUsWHPgje/Lpan3Sv+C72qhm1FP3vYJZBtnxr2CVsu
c5y59yX6PVBcyvH+O/Yv18ME/XuiVFwRdOSLAYqFo6ZGZklkGATzn3Q0OwG3dJJ0
y9+Jh/7+b2JtzDFR8E4HntgRzDQNwWLNVSn0rGkjOsVVXkW2nuVJBYUN1uLe7zav
feF5Cg5ogLqXtN7Xdn5KeT5djffU7McT22qf0gh23Dzj1Nm96VgWUzS4KPVauKpM
Pd5SC2EkI3DEBrQUxzSbNbU+87t4AtTyBAAkHfzCGuuw2Nd31IZzkF8+ok0yvoZo
j8rC6NCp5uREstTvV8vnX7Oa/KT4nQhxk4JfGX/nsOigr5EauowyPqSVzhZ5Sme2
y/YoxNuajTOYygpJX1mviiBBcIk+7sxK4PQ61E1wBPPCJSmlBZYSKZpEp3ztPEy1
4E7uhQSNEHf7dGjcja+tKr8Q/GdgK8i0ePIcDVGBL9VJtn97O5g9zZNTB04CZNTm
7/cuM3/hmrONi1Kt4R6VaK1GLBAAr7tY3OGN5sJUJlcwLyyZaAs=
=dfWE
-----END PGP SIGNATURE-----

--VP9T8UDJf+0ML8hj--

