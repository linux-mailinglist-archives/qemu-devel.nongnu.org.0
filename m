Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7465A4187
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 05:40:12 +0200 (CEST)
Received: from localhost ([::1]:35210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSVdC-00014i-EO
	for lists+qemu-devel@lfdr.de; Sun, 28 Aug 2022 23:40:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oSVYy-000616-2I; Sun, 28 Aug 2022 23:35:48 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:54403
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1oSVYt-0005DM-Fb; Sun, 28 Aug 2022 23:35:47 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4MGGKq34cgz4xFv; Mon, 29 Aug 2022 13:35:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1661744127;
 bh=eFOUtOdCsmGrD7BwxLN5tvdBoeJ2fL9ms9M5U7hsN30=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cSfVbD9J9h1QLDtCeKmnBDRrr8BS2lqGrXgMZ+wPXkLXSa46dDSU25nCWTLCXOp2B
 3SROwvMPrQJkJfJIeQhrtv8gREBRUSxMU7xl9BMAqgrumb4kIzVhjpHF37ye1ut9SX
 JJGpLLOULe8yZl9XUcqaN9kek7Oy2EKGOaviUW2E=
Date: Mon, 29 Aug 2022 13:29:31 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org,
 alistair.francis@wdc.com
Subject: Re: [PATCH for-7.2 v4 10/21] hw/ppc: set machine->fdt in spapr machine
Message-ID: <YwwymxeP7zGwkty/@yekko>
References: <20220826141150.7201-1-danielhb413@gmail.com>
 <20220826141150.7201-11-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QJl2/eSda0i7X62k"
Content-Disposition: inline
In-Reply-To: <20220826141150.7201-11-danielhb413@gmail.com>
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--QJl2/eSda0i7X62k
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 26, 2022 at 11:11:39AM -0300, Daniel Henrique Barboza wrote:
> The pSeries machine never bothered with the common machine->fdt
> attribute. We do all the FDT related work using spapr->fdt_blob.
>=20
> We're going to introduce HMP commands to read and save the FDT, which
> will rely on setting machine->fdt properly to work across all machine
> archs/types.
>=20
> Let's set machine->fdt in two places where we manipulate the FDT:
> spapr_machine_reset() and CAS. There are other places where the FDT is
> manipulated in the pSeries machines, most notably the hotplug/unplug
> path. For now we'll acknowledge that we won't have the most accurate
> representation of the FDT, depending on the current machine state, when
> using these QMP/HMP fdt commands. Making the internal FDT representation
> always match the actual FDT representation that the guest is using is a
> problem for another day.
>=20
> spapr->fdt_blob is left untouched for now. To replace it with
> machine->fdt, since we're migrating spapr->fdt_blob, we would need to
> migrate machine->fdt as well. This is something that we would like to to
> do keep our code simpler but it's also a work we'll leave for later.

As discussed elswhere, this doesn't give a full picture of the
"runtime" device tree, which can get modified later.  For now, I think
that's ok - we can define the fdt property / dumpdtb etc. as
describing specifically the boot time DT before guest firmware or OS
does any further mangling of it.  That's effectively what it means for
all the other embedded cases, though in those cases the firmware
usually doesn't need to do further modifications, unlike a "full OF"
environment like spapr.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

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

--QJl2/eSda0i7X62k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmMMMoQACgkQgypY4gEw
YSK7UxAAoslUJH3MrNjyJxPRYqH7/dYxIh6O+CHufJIYJjClEQsBNypirfTTyE+C
HgXE5ts09qY48EGNP3tX7wTg++G63pUNPqsIYjm0F/yNg1DhIR9+vvRIBcC6o6ss
XAUlRYr92vxFZOUKP5FuKoWXQcDDhrnhHmn9rZ8nE+mwnTnCb+Hl4HdofAhR7wFp
YXTnj7zb9Bu2Ybt/qSvH8D5iyf4eq/iBwY+5BvpKzeneUbbGwR9XrPXHr/HyeZz4
TNon3BjDm4HorAjXxv+o18Tfs80FtETK155YPghU4FQ/xqhlXosZ6bMF62vzItYv
9ccQiBY8zmC6yDk8iEehv+S+e6492fdGmp1ViaOaIZFB6ioqKZRJzEdZamWhzC2i
7I31xzSHzwNIotKytEVNyHAXi5ddjgzUewUiuLLp9jho0ydm8Z5JJaJIXi9BDCEP
mr6ZkGkQGlHUt8QDb0AST9mfkh1zUUUpuIF+KOp0xfZ2YADc5YUzzhEgapnmORJl
LFtjWCks6tO2XN5jT7H1XsF60RPxjYlU6Z5jYaDV0CB4RqZpslZ81lvwxN3v+hIa
o/kxLm6iUKFtuW26Yz/6/vIof6qz1yXYhUI61RXxLB7xjZHO7EOvBgWkRcPtPEyZ
WNDjgKwxtMy2B3zks+1XxoGvGgvJJnxEt2xm52v19jpqaauHTBY=
=Oj7e
-----END PGP SIGNATURE-----

--QJl2/eSda0i7X62k--

