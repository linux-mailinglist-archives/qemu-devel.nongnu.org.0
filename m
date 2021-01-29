Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E0B30828B
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 01:40:31 +0100 (CET)
Received: from localhost ([::1]:41470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Hps-0007nE-LF
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 19:40:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l5Hk9-0001Wm-1T; Thu, 28 Jan 2021 19:34:33 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:58651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l5Hk6-0003L7-UB; Thu, 28 Jan 2021 19:34:32 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DRdd96tt0z9sWW; Fri, 29 Jan 2021 11:34:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1611880461;
 bh=Kr732D0GDiaDRI2gpJKqVhzZl+8eDwm9CmS0kLZi/Fc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B0y8CF7cn7mMnOqH8Iea9CO54lRqcmEtT8KqnpwmplLtY3z127FsO44Q+CNgdQEa1
 bqRB3dgs1rQXI0jHXGHx9EbXxvKC70q81bUpbTL8zGMaaVsm80d1y/p1HBZ4awg84K
 ni5MOTsdDuzWmgebhAvGJlUAylvuZzZJ6qfUTtt0=
Date: Fri, 29 Jan 2021 11:06:57 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 3/3] spapr_numa.c: fix ibm,max-associativity-domains
 calculation
Message-ID: <20210129000657.GF6951@yekko.fritz.box>
References: <20210128174213.1349181-1-danielhb413@gmail.com>
 <20210128174213.1349181-4-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SxgehGEc6vB0cZwN"
Content-Disposition: inline
In-Reply-To: <20210128174213.1349181-4-danielhb413@gmail.com>
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
Cc: clg@kaod.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--SxgehGEc6vB0cZwN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Thu, Jan 28, 2021 at 02:42:13PM -0300, Daniel Henrique Barboza wrote:
> The current logic for calculating 'maxdomain' making it a sum of
> numa_state->num_nodes with spapr->gpu_numa_id. spapr->gpu_numa_id is
> used as a index to determine the next available NUMA id that a
> given NVGPU can use.
>=20
> The problem is that the initial value of gpu_numa_id, for any topology
> that has more than one NUMA node, is equal to numa_state->num_nodes.
> This means that our maxdomain will always be, at least, twice the
> amount of existing NUMA nodes. This means that a guest with 4 NUMA
> nodes will end up with the following max-associativity-domains:
>=20
> rtas/ibm,max-associativity-domains
>                  00000004 00000008 00000008 00000008 00000008
>=20
> This overtuning of maxdomains doesn't go unnoticed in the guest, being
> detected in SLUB during boot:
>=20
>  dmesg | grep SLUB
> [    0.000000] SLUB: HWalign=3D128, Order=3D0-3, MinObjects=3D0, CPUs=3D4=
, Nodes=3D8
>=20
> SLUB is detecting 8 total nodes, with 4 nodes being online.
>=20
> This patch fixes ibm,max-associativity-domains by considering the amount
> of NVGPUs NUMA nodes presented in the guest, instead of just
> spapr->gpu_numa_id.
>=20
> Reported-by: C=E9dric Le Goater <clg@kaod.org>
> Tested-by: C=E9dric Le Goater <clg@kaod.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Applied, thanks.

> ---
>  hw/ppc/spapr_numa.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
> index a757dd88b8..779f18b994 100644
> --- a/hw/ppc/spapr_numa.c
> +++ b/hw/ppc/spapr_numa.c
> @@ -311,6 +311,8 @@ void spapr_numa_write_rtas_dt(SpaprMachineState *spap=
r, void *fdt, int rtas)
>  {
>      MachineState *ms =3D MACHINE(spapr);
>      SpaprMachineClass *smc =3D SPAPR_MACHINE_GET_CLASS(spapr);
> +    uint32_t number_nvgpus_nodes =3D spapr->gpu_numa_id -
> +                                   spapr_numa_initial_nvgpu_numa_id(ms);
>      uint32_t refpoints[] =3D {
>          cpu_to_be32(0x4),
>          cpu_to_be32(0x3),
> @@ -318,7 +320,7 @@ void spapr_numa_write_rtas_dt(SpaprMachineState *spap=
r, void *fdt, int rtas)
>          cpu_to_be32(0x1),
>      };
>      uint32_t nr_refpoints =3D ARRAY_SIZE(refpoints);
> -    uint32_t maxdomain =3D ms->numa_state->num_nodes + spapr->gpu_numa_i=
d;
> +    uint32_t maxdomain =3D ms->numa_state->num_nodes + number_nvgpus_nod=
es;
>      uint32_t maxdomains[] =3D {
>          cpu_to_be32(4),
>          cpu_to_be32(maxdomain),

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--SxgehGEc6vB0cZwN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmATUaEACgkQbDjKyiDZ
s5JQUBAAxXqLzZTE6uZRw62PpCEP9AR6mB9M+PA4FQ0KafU4EsRf6/OyPHx4wkfu
t61yBBsnmDfYv4pCEdO3KrtG/mMXgzPfc4n5MaM+M8AC6PD3qnvCnqCDWMfoasDM
dBMExji/BXXFBClpSKVZzEBcsACFxJ71is3SKccccLfM5dMI5GwXr6Iy3dvPG+BO
l1kpk2CL7NjsmBIzBX2+gIiS3253cxhFQDY8QLC0/YSk6oWZB4UJqBcFH/bBZExB
ajX0HUIN7l1HRpubqlR5wSCHJu0WPJ8r8pJmNfeNzUKI7NWUBJRWb/ZVOojCvprZ
8CB4iI0U5kFY1i6N+zu8gqvjA6slMo/xZ8vr5i35M0+QC2QAp0L49m4HwHxZoI+u
C4/PPL6UbBoF0IxOqeMMezuG9LXDTjicZbGm3QzrJn+LjwIC3iMUlHet2jNIhumt
+jwpnzWGPEy2vDeHk/YkSszNm3vbipUbAa2ADwoPVql6esCr3/fPuJ77CoFCbKeV
IMBQHucwRv441yKaCPk0Pa6MfuvTZ9QVLZnlaBhYTKJY0+SuwsVjSlppNQ3DP0vg
8P63qTDX99W1G8JjcwlNtVUPx8MBPUgGQUyPDrQRCLbuB2hyeQ/SFSkRF7F4Idzb
lkAPrEiJtD8XsVf7VLy5WTbPpXxUPY7xULnERYTemzqioThInVQ=
=Wzm+
-----END PGP SIGNATURE-----

--SxgehGEc6vB0cZwN--

