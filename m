Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD943F6F9F
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 08:35:33 +0200 (CEST)
Received: from localhost ([::1]:37562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mImVX-000445-GW
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 02:35:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mImRu-0001fK-OR; Wed, 25 Aug 2021 02:31:46 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:59129 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mImRq-00076k-LI; Wed, 25 Aug 2021 02:31:46 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GvbjP65PZz9sX2; Wed, 25 Aug 2021 16:31:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1629873097;
 bh=2eRQDIajEvZ8Mq4KHVA5ll776UVpVnV+akqt9PvMhTg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Oa06CzDh9jJDhVyDE+qy7Iw7sunwIC+ThMvAs5WlFL7zPqHtWqE0tzvxBCekUcq5b
 BbTr5dOwV5I+J+A5dFxYROVRCMnkn/r66cte1OQ3pgTQxdBt8kLnmdQoLH0YI2HIJz
 lXVstioy81ZXqN19zOi/z0g/nURTmd9lxGRFcCDI=
Date: Wed, 25 Aug 2021 16:09:40 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 13/26] ppc/pnv: Add POWER10 quads
Message-ID: <YSXepFEmvf9luXo0@yekko>
References: <20210809134547.689560-1-clg@kaod.org>
 <20210809134547.689560-14-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FTRx27bnTk+v2dEK"
Content-Disposition: inline
In-Reply-To: <20210809134547.689560-14-clg@kaod.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--FTRx27bnTk+v2dEK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 09, 2021 at 03:45:34PM +0200, C=E9dric Le Goater wrote:
> Still needs some refinements on the XSCOM registers.
>=20
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> ---
>  include/hw/ppc/pnv.h |  3 +++
>  hw/ppc/pnv.c         | 34 ++++++++++++++++++++++++++++++++++
>  2 files changed, 37 insertions(+)
>=20
> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> index a299fbc7f25c..13495423283a 100644
> --- a/include/hw/ppc/pnv.h
> +++ b/include/hw/ppc/pnv.h
> @@ -128,6 +128,9 @@ struct Pnv10Chip {
>      Pnv9Psi      psi;
>      PnvLpcController lpc;
>      PnvOCC       occ;
> +
> +    uint32_t     nr_quads;
> +    PnvQuad      *quads;
>  };
> =20
>  #define PNV10_PIR2FUSEDCORE(pir) (((pir) >> 3) & 0xf)
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index f75d90e61fa8..f670d97c5f91 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1605,6 +1605,34 @@ static void pnv_chip_power10_instance_init(Object =
*obj)
>      object_initialize_child(obj, "occ",  &chip10->occ, TYPE_PNV10_OCC);
>  }
> =20
> +
> +static void pnv_chip_power10_quad_realize(Pnv10Chip *chip10, Error **err=
p)
> +{
> +    PnvChip *chip =3D PNV_CHIP(chip10);
> +    int i;
> +
> +    chip10->nr_quads =3D DIV_ROUND_UP(chip->nr_cores, 4);
> +    chip10->quads =3D g_new0(PnvQuad, chip10->nr_quads);
> +
> +    for (i =3D 0; i < chip10->nr_quads; i++) {
> +        char eq_name[32];
> +        PnvQuad *eq =3D &chip10->quads[i];
> +        PnvCore *pnv_core =3D chip->cores[i * 4];
> +        int core_id =3D CPU_CORE(pnv_core)->core_id;
> +
> +        snprintf(eq_name, sizeof(eq_name), "eq[%d]", core_id);
> +        object_initialize_child_with_props(OBJECT(chip), eq_name, eq,
> +                                           sizeof(*eq), TYPE_PNV_QUAD,
> +                                           &error_fatal, NULL);
> +
> +        object_property_set_int(OBJECT(eq), "id", core_id, &error_fatal);

"id" might not be a good name for this, since "id" on QOM objects is
nearly always the (usually) user assigned name - which is a string.

> +        qdev_realize(DEVICE(eq), NULL, &error_fatal);
> +
> +        pnv_xscom_add_subregion(chip, PNV10_XSCOM_EQ_BASE(eq->id),
> +                                &eq->xscom_regs);
> +    }
> +}
> +
>  static void pnv_chip_power10_realize(DeviceState *dev, Error **errp)
>  {
>      PnvChipClass *pcc =3D PNV_CHIP_GET_CLASS(dev);
> @@ -1626,6 +1654,12 @@ static void pnv_chip_power10_realize(DeviceState *=
dev, Error **errp)
>          return;
>      }
> =20
> +    pnv_chip_power10_quad_realize(chip10, &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +
>      /* XIVE2 interrupt controller (POWER10) */
>      object_property_set_int(OBJECT(&chip10->xive), "ic-bar",
>                              PNV10_XIVE2_IC_BASE(chip), &error_fatal);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--FTRx27bnTk+v2dEK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEl3qQACgkQbDjKyiDZ
s5LpPw/+LC0L1Yo1IKn5APYYOcegKG1Pv3ChiVMxIii1JxlijldLBNsRBzmrxeEt
rdPBbdZMHK+CCihxWrcAwt3JLLoWqxhpOtAQD36+y0A1SQq3nWyoq78+qypxjCNo
8DRQXRqxRnADYYO0XrfiH0mgrAlj4kBC82+B0TIGXoJgJG59I10+C7HlKllcegeS
hD+27DAFLDl/OyH2cAPn9Riu58PdRkBbeP/AjZMbbkWibWr9aYTcevpY4mwtCLdv
kEOw64nXyLoc3TDnIu6ivb+SPbLAMUaKuyQbpknrcS3QAPpspvCTCZOWLRXNrSRE
5jAUdn9J2PV2c3arTMFnqTqL/Gvgte6MEvJmz5ciLO4WGRQbVoDBX+cuklr13x1J
TXyD+TMpeRQi1t5Hr15jbd7yAFXDmtXrc4S6T0O2lPAg32118vvRD0x9TD4Wn9g8
bPUmAMQmIxKd/lY/70VS7/0ebEETK3hLyzvmAzNK4rszf9GZUAVYVO2sjkD7PPG3
k4HImLo4qokh7Ll0dXz+nZpq3jTIYK3GIggeslGDcdUKxGN6dJv2FA2Q3FnBMqsP
pHy9joMr1uOdKOC/T88cVkOENI1+BXVf1l5pLrx6xIiQjzMyaWsFSO6329gUjE9g
FbL31qWhXE0yC/9SA2tzsD0N81BSXtmZITGHbDX32h1cROTcTF4=
=e+0l
-----END PGP SIGNATURE-----

--FTRx27bnTk+v2dEK--

