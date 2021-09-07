Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 219DF4021C2
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 03:18:22 +0200 (CEST)
Received: from localhost ([::1]:35374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNPki-0003k5-OZ
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 21:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mNPXD-0004o1-83; Mon, 06 Sep 2021 21:04:23 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:39767 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mNPX9-0005xA-QU; Mon, 06 Sep 2021 21:04:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630976654;
 bh=UUmCah6EtYHu7IAtaSp1vIsrHV8ld6HmMt0glOID3FQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FYvo/laQy4kAJB2pA14JcNgavey8tURcPtf1NNplrzlJ+fiy4PXiK7/hVTi/ZV3FK
 ARcaiodtxSOoy9R4wTDh5P1/cdqSjez4VR6o5wRcXnJpPJUnQyUGfaVSf/PGKHrRqT
 H4bvcc4fBJegFSZ708hKlfvK53fYDSvIWrgz4IW4=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H3Rqf6vRnz9ssD; Tue,  7 Sep 2021 11:04:14 +1000 (AEST)
Date: Tue, 7 Sep 2021 10:39:30 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v5 2/4] spapr_numa.c: split FORM1 code into helpers
Message-ID: <YTa0wiMphtMv0xqo@yekko>
References: <20210907002527.412013-1-danielhb413@gmail.com>
 <20210907002527.412013-3-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="v6FeYsyHMpTfpJMp"
Content-Disposition: inline
In-Reply-To: <20210907002527.412013-3-danielhb413@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


--v6FeYsyHMpTfpJMp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 06, 2021 at 09:25:25PM -0300, Daniel Henrique Barboza wrote:
65;6402;1c> The upcoming FORM2 NUMA affinity will support asymmetric NUMA t=
opologies
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
> index 9ee4b479fe..84636cb86a 100644
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

As noted on the previous version (send moments before seeing the new
spin), I'm just slightly uncomfortable with the logic being

   if (form1) {
       if (!legacy) {
          ....
       }
   }

rather than

   if (!legacy) {
       if (form1) {
           ....
       }
   }

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
>  void spapr_numa_associativity_reset(SpaprMachineState *spapr)
>  {
>      SpaprMachineClass *smc =3D SPAPR_MACHINE_GET_CLASS(spapr);
> @@ -210,22 +236,7 @@ void spapr_numa_associativity_reset(SpaprMachineStat=
e *spapr)
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

--v6FeYsyHMpTfpJMp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmE2tMIACgkQbDjKyiDZ
s5ImXg/+Np4ZB0jWyRlBNsQCcb0Ymby3aV9+xGgeQzkZ8Ur+IOcwAOLzOeZcE0Ll
MQ+Jy8VTjS8gWXuhVNOfXfQN+bJau63qUdogZg9FTt6F7KNTn22XzdOC+Og1EVVn
id5zS806iBciH3YndW5vy6QQNj3r53VZyJHD4ra5zQ/DWPutAr3u88FR+JAT0ZLk
6gLUnILPZhO/QFXgQ2DAK0/3wJXJJb6boQWPQZEuT0U8EqJo7v4te5mr+fPT4RfT
0MclzM+ah+OZiD6tnoKJS/sdM/AVZM14Pfjxnf66LYfSPsB2zbktWWZabCYA+zHd
zFkUYmd/ulxUKOHPc0NM5HJwQDoTMqiqXpg1epo3B/cR0hTO+HuGLjuJChGhU5Tt
nndChINt8/gVT6QQ2X8XyZRmj54xij6wZNvDqfa3LHY8izQe1KVtFKUAflEJDVkr
a6XrMLAaUAVa7T6cQmf2cNjwer1U7kN9ZlOrIfDZyIqwfTqvqf+dX1ybsl9/V6w7
3vK2xdZZa0t8/4Nn9uXAUp5LSBp+2eiHPIA+k4rqqr/RSH38xl1nQ4r2uN5BpgGD
HFhiC0UzLmXgk9CHooGiPYRwCkitGPq/tp0omc/6y7E1orbAjBMXO5/nzmTBdqqf
g44R5nEbUWrGBcU0BJF3qHVMHlbyhpOFxJNOBOakJFk0jzUHw0c=
=4Hdx
-----END PGP SIGNATURE-----

--v6FeYsyHMpTfpJMp--

