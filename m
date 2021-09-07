Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 414444021AF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 02:36:34 +0200 (CEST)
Received: from localhost ([::1]:48912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNP6H-0006XJ-8t
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 20:36:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mNP2P-0004qT-2a; Mon, 06 Sep 2021 20:32:33 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:33681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mNP2L-0001gt-O9; Mon, 06 Sep 2021 20:32:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630974742;
 bh=pBFNmBpg605gWnmA9UsoJGZ5h3Gw0hTsCUe2Gy1JkiY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ChdzWgB9JEJxAx0FCk1tcHaFS78VbyRrnoWtJrRcuvXJEJO8gR2dJqcdvDs3sJNg0
 fc8WP934CzRN6CMss5Cl60Y6IL7WTQuhXB+xGdqGTbQfjEpQnvCX+iX2KyE2iLUK75
 NFPkv8ToctdpbnaXjw2KtVMZYDkQxKn9z50o6gy0=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H3R6t1S4Fz9shn; Tue,  7 Sep 2021 10:32:22 +1000 (AEST)
Date: Tue, 7 Sep 2021 10:30:08 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v4 2/5] spapr_numa.c: split FORM1 code into helpers
Message-ID: <YTaykCjgeonaGS2x@yekko>
References: <20210827092455.125411-1-danielhb413@gmail.com>
 <20210827092455.125411-3-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vxKeGGVPcX8cLxHw"
Content-Disposition: inline
In-Reply-To: <20210827092455.125411-3-danielhb413@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--vxKeGGVPcX8cLxHw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 27, 2021 at 06:24:52AM -0300, Daniel Henrique Barboza wrote:
> The upcoming FORM2 NUMA affinity will support asymmetric NUMA topologies
> and doesn't need be concerned with all the legacy support for older
> pseries FORM1 guests.
>=20
> We're also not going to calculate associativity domains based on numa
> distance (via spapr_numa_define_associativity_domains) since the
> distances will be written directly into new DT properties.
>=20
> Let's split FORM1 code into its own functions to allow for easier
> insertion of FORM2 logic later on.
>=20
> Reviewed-by: Greg Kurz <groug@kaod.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/ppc/spapr_numa.c | 61 +++++++++++++++++++++++++++++----------------
>  1 file changed, 39 insertions(+), 22 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
> index 779f18b994..04a86f9b5b 100644
> --- a/hw/ppc/spapr_numa.c
> +++ b/hw/ppc/spapr_numa.c
> @@ -155,6 +155,32 @@ static void spapr_numa_define_associativity_domains(=
SpaprMachineState *spapr)
> =20
>  }
> =20
> +/*
> + * Set NUMA machine state data based on FORM1 affinity semantics.
> + */
> +static void spapr_numa_FORM1_affinity_init(SpaprMachineState *spapr,
> +                                           MachineState *machine)
> +{
> +    bool using_legacy_numa =3D spapr_machine_using_legacy_numa(spapr);
> +
> +    /*
> +     * Legacy NUMA guests (pseries-5.1 and older, or guests with only
> +     * 1 NUMA node) will not benefit from anything we're going to do
> +     * after this point.
> +     */
> +    if (using_legacy_numa) {
> +        return;
> +    }

My only concern with this patch is that handling the
"using_legacy_numa" case might logically belong outside the FORM1
code.  I mean, I'm pretty sure using_legacy_numa implies FORM1 in
practice, but conceptually it seems like a more fundamental question
than the DT encoding of the NUMA information.

> +
> +    if (!spapr_numa_is_symmetrical(machine)) {
> +        error_report("Asymmetrical NUMA topologies aren't supported "
> +                     "in the pSeries machine");
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    spapr_numa_define_associativity_domains(spapr);
> +}
> +
>  void spapr_numa_associativity_init(SpaprMachineState *spapr,
>                                     MachineState *machine)
>  {
> @@ -210,22 +236,7 @@ void spapr_numa_associativity_init(SpaprMachineState=
 *spapr,
>          spapr->numa_assoc_array[i][MAX_DISTANCE_REF_POINTS] =3D cpu_to_b=
e32(i);
>      }
> =20
> -    /*
> -     * Legacy NUMA guests (pseries-5.1 and older, or guests with only
> -     * 1 NUMA node) will not benefit from anything we're going to do
> -     * after this point.
> -     */
> -    if (using_legacy_numa) {
> -        return;
> -    }
> -
> -    if (!spapr_numa_is_symmetrical(machine)) {
> -        error_report("Asymmetrical NUMA topologies aren't supported "
> -                     "in the pSeries machine");
> -        exit(EXIT_FAILURE);
> -    }
> -
> -    spapr_numa_define_associativity_domains(spapr);
> +    spapr_numa_FORM1_affinity_init(spapr, machine);
>  }
> =20
>  void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *f=
dt,
> @@ -302,12 +313,8 @@ int spapr_numa_write_assoc_lookup_arrays(SpaprMachin=
eState *spapr, void *fdt,
>      return ret;
>  }
> =20
> -/*
> - * Helper that writes ibm,associativity-reference-points and
> - * max-associativity-domains in the RTAS pointed by @rtas
> - * in the DT @fdt.
> - */
> -void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int r=
tas)
> +static void spapr_numa_FORM1_write_rtas_dt(SpaprMachineState *spapr,
> +                                           void *fdt, int rtas)
>  {
>      MachineState *ms =3D MACHINE(spapr);
>      SpaprMachineClass *smc =3D SPAPR_MACHINE_GET_CLASS(spapr);
> @@ -365,6 +372,16 @@ void spapr_numa_write_rtas_dt(SpaprMachineState *spa=
pr, void *fdt, int rtas)
>                       maxdomains, sizeof(maxdomains)));
>  }
> =20
> +/*
> + * Helper that writes ibm,associativity-reference-points and
> + * max-associativity-domains in the RTAS pointed by @rtas
> + * in the DT @fdt.
> + */
> +void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int r=
tas)
> +{
> +    spapr_numa_FORM1_write_rtas_dt(spapr, fdt, rtas);
> +}
> +
>  static target_ulong h_home_node_associativity(PowerPCCPU *cpu,
>                                                SpaprMachineState *spapr,
>                                                target_ulong opcode,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--vxKeGGVPcX8cLxHw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmE2spAACgkQbDjKyiDZ
s5L+Ew//Up1sMQAyf6LBZD91CyQjkPwGNm7h1YVqT77zwdUnRGHd7WwKCJdKB0Bt
dL1nt2hVG2P8cOPObFUq4KEGCBS8G8P5TT8kXUUf/cURcIbZkhkzDZh12d1rCpks
LAoH6BIYx1g/y8Oc7mJI/F2JJ0rPUTqHMgBHYiQ48vu26CIAIeVDnGTrS83prKuU
GrxpwulRHHLM5qlgMkLL77IG2aVyotvAphLauIyKwJA2qkhs/ZTvkHQ72G66OcJ8
sC4aHixa8DULwXw2UFGSRjnO97bh5c5Zv3q6vaB+yYXNUJZzhlejOmQFMlZCb0yM
+cOc7GKwutn77q8AjWbwTocyU42KLH4YjlSwFa3NKvVdonT440Zk9rFC5zagqSAJ
Q8pyaPPr76HXoAX4EJ3cjOiaoa4iWEpp17N+cdzQ0Euo7sd0tdnjDf0KC4CD8xAT
Ai7O1XzxQlfnfgLtFqHSZMdCni1rokYL2N7GiTPGSJPGi7Vz2uJWjMy+ZAorOKMe
SbjZrzmInbYyE7ekCpnDF/cTDfJjawztwaRep0vDXC1YiMO7xOQHVj+gWYc7Tci7
the3UN6BHtDQHNGCfytRDz6jtW9pXUf9a3rXZL278JuMoVTjLd4b9StjUXgA9c/b
ZtkZmfUErM5hMmtGvwdk1XcQAKl+ZTIu4hEoIm0k4jqptcaO/vM=
=SNZd
-----END PGP SIGNATURE-----

--vxKeGGVPcX8cLxHw--

