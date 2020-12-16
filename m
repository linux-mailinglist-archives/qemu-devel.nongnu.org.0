Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B6F2DBB43
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 07:33:46 +0100 (CET)
Received: from localhost ([::1]:55690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpQNd-0000vP-A4
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 01:33:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kpQJy-000706-BQ; Wed, 16 Dec 2020 01:29:58 -0500
Received: from ozlabs.org ([203.11.71.1]:51617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kpQJs-0004ud-7g; Wed, 16 Dec 2020 01:29:57 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Cwlbb4pqyz9sSf; Wed, 16 Dec 2020 17:29:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1608100187;
 bh=tXQmE/XhMwGlujpfY0fzyIPGGrzybj/+K3xm8PVrBsY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EmAQbYHPN0dX6sidy9b/DRLqnSsmmjBwtbvTeTQ/S5hseJyV7KudziyWNhUJyAZwE
 HHFKUk3HcAYP4KzUoutCV48ixclsGoXhNYPJtlTCJDH/FtnS3Pl+WIeD/LiHzP0QpN
 xyrnTf8Uh9KjLVWXIPvvjWwCxCkKNfAtWXnfsqX0=
Date: Wed, 16 Dec 2020 16:44:23 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] spapr: Fix DR properties of the root node
Message-ID: <20201216054423.GL4717@yekko.fritz.box>
References: <160794479566.35245.17809158217760761558.stgit@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cy9Nn4fUvYST66Pl"
Content-Disposition: inline
In-Reply-To: <160794479566.35245.17809158217760761558.stgit@bahia.lan>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--cy9Nn4fUvYST66Pl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 14, 2020 at 12:19:55PM +0100, Greg Kurz wrote:
> Section 13.5.2 of LoPAPR mandates various DR related indentifiers
> for all hot-pluggable entities to be exposed in the "ibm,drc-indexes",
> "ibm,drc-power-domains", "ibm,drc-names" and "ibm,drc-types" properties
> of their parent node. These properties are created with spapr_dt_drc().
>=20
> PHBs and LMBs are both children of the machine. Their DR identifiers
> are thus supposed to be exposed in the afore mentioned properties of
> the root node.
>=20
> When PHB hot-plug support was added, an extra call to spapr_dt_drc()
> was introduced: this overwrites the existing properties, previously
> populated with the LMB identifiers, and they end up containing only
> PHB identifiers. This went unseen so far because linux doesn't care,
> but this is still not conformant with LoPAPR.
>=20
> Fortunately spapr_dt_drc() is able to handle multiple DR entity types
> at the same time. Use that to handle DR indentifiers for PHBs and LMBs
> with a single call to spapr_dt_drc(). While here also account for PMEM
> DR identifiers, which were forgotten when NVDIMM hot-plug support was
> added. Also add an assert to prevent further misuse of spapr_dt_drc().
>=20
> With -m 1G,maxmem=3D2G,slots=3D8 passed on the QEMU command line we get:
>=20
> Without this patch:
>=20
> /proc/device-tree/ibm,drc-indexes
> 		 0000001f 20000001 20000002 20000003
> 		 20000000 20000005 20000006 20000007
> 		 20000004 20000009 20000008 20000010
> 		 20000011 20000012 20000013 20000014
> 		 20000015 20000016 20000017 20000018
> 		 20000019 2000000a 2000000b 2000000c
> 		 2000000d 2000000e 2000000f 2000001a
> 		 2000001b 2000001c 2000001d 2000001e
>=20
> These are the DRC indexes for the 31 possible PHBs.
>=20
> With this patch:
>=20
> /proc/device-tree/ibm,drc-indexes
> 		 0000002b 90000000 90000001 90000002
> 		 90000003 90000004 90000005 90000006
> 		 90000007 20000001 20000002 20000003
> 		 20000000 20000005 20000006 20000007
> 		 20000004 20000009 20000008 20000010
> 		 20000011 20000012 20000013 20000014
> 		 20000015 20000016 20000017 20000018
> 		 20000019 2000000a 2000000b 2000000c
> 		 2000000d 2000000e 2000000f 2000001a
> 		 2000001b 2000001c 2000001d 2000001e
> 		 80000004 80000005 80000006 80000007
>=20
> And now we also have the 4 ((2G - 1G) / 256M) LMBs and the
> 8 (slots) PMEMs.
>=20
> Fixes: 3998ccd09298 ("spapr: populate PHB DRC entries for root DT node")
> Signed-off-by: Greg Kurz <groug@kaod.org>

Oops, good catch.  Applied to ppc-for-6.0.

> ---
>  hw/ppc/spapr.c     |   21 ++++++++++++---------
>  hw/ppc/spapr_drc.c |    6 ++++++
>  2 files changed, 18 insertions(+), 9 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 16d42ba7a937..b2f9896c8bed 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1119,6 +1119,7 @@ void *spapr_build_fdt(SpaprMachineState *spapr, boo=
l reset, size_t space)
>      MachineState *machine =3D MACHINE(spapr);
>      MachineClass *mc =3D MACHINE_GET_CLASS(machine);
>      SpaprMachineClass *smc =3D SPAPR_MACHINE_GET_CLASS(machine);
> +    uint32_t root_drc_type_mask =3D 0;
>      int ret;
>      void *fdt;
>      SpaprPhbState *phb;
> @@ -1193,8 +1194,18 @@ void *spapr_build_fdt(SpaprMachineState *spapr, bo=
ol reset, size_t space)
> =20
>      spapr_dt_cpus(fdt, spapr);
> =20
> +    /* ibm,drc-indexes and friends */
>      if (smc->dr_lmb_enabled) {
> -        _FDT(spapr_dt_drc(fdt, 0, NULL, SPAPR_DR_CONNECTOR_TYPE_LMB));
> +        root_drc_type_mask |=3D SPAPR_DR_CONNECTOR_TYPE_LMB;
> +    }
> +    if (smc->dr_phb_enabled) {
> +        root_drc_type_mask |=3D SPAPR_DR_CONNECTOR_TYPE_PHB;
> +    }
> +    if (mc->nvdimm_supported) {
> +        root_drc_type_mask |=3D SPAPR_DR_CONNECTOR_TYPE_PMEM;
> +    }
> +    if (root_drc_type_mask) {
> +        _FDT(spapr_dt_drc(fdt, 0, NULL, root_drc_type_mask));
>      }
> =20
>      if (mc->has_hotpluggable_cpus) {
> @@ -1232,14 +1243,6 @@ void *spapr_build_fdt(SpaprMachineState *spapr, bo=
ol reset, size_t space)
>          }
>      }
> =20
> -    if (smc->dr_phb_enabled) {
> -        ret =3D spapr_dt_drc(fdt, 0, NULL, SPAPR_DR_CONNECTOR_TYPE_PHB);
> -        if (ret < 0) {
> -            error_report("Couldn't set up PHB DR device tree properties"=
);
> -            exit(1);
> -        }
> -    }
> -
>      /* NVDIMM devices */
>      if (mc->nvdimm_supported) {
>          spapr_dt_persistent_memory(spapr, fdt);
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index f991cf89a08a..fc7e321fcdf6 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -832,6 +832,12 @@ int spapr_dt_drc(void *fdt, int offset, Object *owne=
r, uint32_t drc_type_mask)
>      GString *drc_names, *drc_types;
>      int ret;
> =20
> +    /*
> +     * This should really be only called once per node since it overwrit=
es
> +     * the OF properties if they already exist.
> +     */
> +    g_assert(!fdt_get_property(fdt, offset, "ibm,drc-indexes", NULL));
> +
>      /* the first entry of each properties is a 32-bit integer encoding
>       * the number of elements in the array. we won't know this until
>       * we complete the iteration through all the matching DRCs, but
>=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--cy9Nn4fUvYST66Pl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/ZnrcACgkQbDjKyiDZ
s5L+cQ/+Lt6a2dVkGI7CtmiE7zpLHIap+Hxx6PI2g/ldQBnc/KiPYJkel14BG+Nk
zMsQKp3b6BKc3xisxFXGtkbHfczV+Ds1aOvOzuHdyHupfFWTCKJ+rbe+IjlyHH7y
eus7QWfTIbUx8CK6LUV2ccAqh4xzm5PUlSz+IrqYVji3SgbBm080AkPlvvTObUrX
m2jly02aaf37YssJ8tOwa1XEAI1+CgF/xu7Z5ViGVGxHDOAm6Mek/IJL1/OQ+Wl8
HNp5iGo+UH8SIf97niFnqOnMh7j8oOvf9P6UT1exvzsOK4B8lpdH2DDupgFGpT+b
scTmfD23k48R5jfBnTsyvjDuGXN8341Gss868ENVlA1bP/wWvMnONerV92d9MRNc
/i421OCOd3ncRWrHHTXz/iTEJZvX9qbJol15nQh4CQpOPp+oR/3AjEbsSzioz2Yc
b9RDs2TD0rBeeRIaLe4Wsw23t9b+/msgPCr1ca2tr/iz82eA7RY7GRuL81cKCRPm
Fs2MJAO9+QHKIlZ4+faeS+KdIUbgqlBrJdsVZdlJtHL8YoijixF9x2Fc87l0P7+8
LGD02DDF3xZNtEEnxjfOFa/8RHDZ4mtvJ5ilK+iGGIdk4lBLwLwbm+IA6XsMB3IG
okMWnPKvp17/iCHkSyEHgbfoP5ZlujBlZDgGBRhMsTuWUGfjblw=
=uiVg
-----END PGP SIGNATURE-----

--cy9Nn4fUvYST66Pl--

