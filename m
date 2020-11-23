Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC7F2BFF0B
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 05:41:18 +0100 (CET)
Received: from localhost ([::1]:58038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh3fB-0002gp-Jx
	for lists+qemu-devel@lfdr.de; Sun, 22 Nov 2020 23:41:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh3d2-0000vU-Ot; Sun, 22 Nov 2020 23:39:04 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:48613 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh3d0-0006L0-9I; Sun, 22 Nov 2020 23:39:04 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CfZDC1yTLz9sVC; Mon, 23 Nov 2020 15:38:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1606106331;
 bh=cUikZBCVLqKuXe0hui4v7rH3D9ZbqEcjuNlpcPdipuA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KzsSsctZoecfFFxylSKdHWnsaWeDtnxEArL0gPjX0eMKIZFQZRAtOSoR6tXqRPyAH
 yqE0Owo0Frz0r/4Sgq3CmgwCsd33ZNz1eWYrVydIEoLhaj1zKMaZmKC5UeBc9qeDF5
 ADDOuquJZiI/YmmedyUna3zY//c3ZbxRd4VvIIJQ=
Date: Mon, 23 Nov 2020 15:10:05 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH for-6.0 4/8] spapr/xive: Add "nr-ipis" property
Message-ID: <20201123041005.GD521467@yekko.fritz.box>
References: <20201120174646.619395-1-groug@kaod.org>
 <20201120174646.619395-5-groug@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NtwzykIc2mflq5ck"
Content-Disposition: inline
In-Reply-To: <20201120174646.619395-5-groug@kaod.org>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--NtwzykIc2mflq5ck
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2020 at 06:46:42PM +0100, Greg Kurz wrote:
> The sPAPR XIVE device exposes a range of LISNs that the guest uses
> for IPIs. This range is currently sized according to the highest
> vCPU id, ie. spapr_max_server_number(), as obtained from the machine
> through the "nr_servers" argument of the generic spapr_irq_dt() call.
>=20
> This makes sense for the "ibm,interrupt-server-ranges" property of
> sPAPR XICS, but certainly not for "ibm,xive-lisn-ranges". The range
> should be sized to the maximum number of possible vCPUs. It happens
> that spapr_max_server_number() =3D=3D smp.max_cpus in practice with the
> machine default settings. This might not be the case though when
> VSMT is in use : we can end up with a much larger range (up to 8
> times bigger) than needed and waste LISNs. But most importantly, this
> lures people into thinking that IPI numbers are always equal to
> vCPU ids, which is wrong and bit us recently:
>=20
> https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg01476.html
>=20
> Introduce an "nr-ipis" property that the machine sets to smp.max_cpus
> before realizing the deice. Use that instead of "nr_servers" in
> spapr_xive_dt(). Have the machine to claim the same number of IPIs
> in spapr_irq_init().
>=20
> This doesn't cause any guest visible change when using the machine
> default settings (ie. VSMT =3D=3D smp.threads).
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  include/hw/ppc/spapr_xive.h | 8 ++++++++
>  hw/intc/spapr_xive.c        | 4 +++-
>  hw/ppc/spapr_irq.c          | 4 +++-
>  3 files changed, 14 insertions(+), 2 deletions(-)
>=20
> diff --git a/include/hw/ppc/spapr_xive.h b/include/hw/ppc/spapr_xive.h
> index 7123ea07ed78..69b9fbc1b9a5 100644
> --- a/include/hw/ppc/spapr_xive.h
> +++ b/include/hw/ppc/spapr_xive.h
> @@ -43,6 +43,14 @@ typedef struct SpaprXive {
> =20
>      /* DT */
>      gchar *nodename;
> +    /*
> +     * The sPAPR XIVE device needs to know how many vCPUs it
> +     * might be exposed to in order to size the IPI range in
> +     * "ibm,interrupt-server-ranges". It is the purpose of the
> +     * "nr-ipis" property which *must* be set to a non-null
> +     * value before realizing the sPAPR XIVE device.
> +     */
> +    uint32_t nr_ipis;
> =20
>      /* Routing table */
>      XiveEAS       *eat;
> diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
> index e4dbf9c2c409..d13a2955ce9b 100644
> --- a/hw/intc/spapr_xive.c
> +++ b/hw/intc/spapr_xive.c
> @@ -311,6 +311,7 @@ static void spapr_xive_realize(DeviceState *dev, Erro=
r **errp)
>      /* Set by spapr_irq_init() */
>      g_assert(xive->nr_irqs);
>      g_assert(xive->nr_servers);
> +    g_assert(xive->nr_ipis);
> =20
>      sxc->parent_realize(dev, &local_err);
>      if (local_err) {
> @@ -608,6 +609,7 @@ static Property spapr_xive_properties[] =3D {
>       */
>      DEFINE_PROP_UINT32("nr-ends", SpaprXive, nr_ends_vmstate, 0),
>      DEFINE_PROP_UINT32("nr-servers", SpaprXive, nr_servers, 0),
> +    DEFINE_PROP_UINT32("nr-ipis", SpaprXive, nr_ipis, 0),
>      DEFINE_PROP_UINT64("vc-base", SpaprXive, vc_base, SPAPR_XIVE_VC_BASE=
),
>      DEFINE_PROP_UINT64("tm-base", SpaprXive, tm_base, SPAPR_XIVE_TM_BASE=
),
>      DEFINE_PROP_UINT8("hv-prio", SpaprXive, hv_prio, 7),
> @@ -698,7 +700,7 @@ static void spapr_xive_dt(SpaprInterruptController *i=
ntc, uint32_t nr_servers,
>      /* Interrupt number ranges for the IPIs */
>      uint32_t lisn_ranges[] =3D {
>          cpu_to_be32(SPAPR_IRQ_IPI),
> -        cpu_to_be32(SPAPR_IRQ_IPI + nr_servers),
> +        cpu_to_be32(SPAPR_IRQ_IPI + xive->nr_ipis),
>      };
>      /*
>       * EQ size - the sizes of pages supported by the system 4K, 64K,
> diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
> index 8c5627225636..a0fc474ecb06 100644
> --- a/hw/ppc/spapr_irq.c
> +++ b/hw/ppc/spapr_irq.c
> @@ -325,12 +325,14 @@ void spapr_irq_init(SpaprMachineState *spapr, Error=
 **errp)
> =20
>      if (spapr->irq->xive) {
>          uint32_t nr_servers =3D spapr_max_server_number(spapr);
> +        uint32_t max_cpus =3D MACHINE(spapr)->smp.max_cpus;
>          DeviceState *dev;
>          int i;
> =20
>          dev =3D qdev_new(TYPE_SPAPR_XIVE);
>          qdev_prop_set_uint32(dev, "nr-irqs", smc->nr_xirqs + SPAPR_XIRQ_=
BASE);
>          qdev_prop_set_uint32(dev, "nr-servers", nr_servers);
> +        qdev_prop_set_uint32(dev, "nr-ipis", max_cpus);
>          object_property_set_link(OBJECT(dev), "xive-fabric", OBJECT(spap=
r),
>                                   &error_abort);
>          sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> @@ -338,7 +340,7 @@ void spapr_irq_init(SpaprMachineState *spapr, Error *=
*errp)
>          spapr->xive =3D SPAPR_XIVE(dev);
> =20
>          /* Enable the CPU IPIs */
> -        for (i =3D 0; i < nr_servers; ++i) {
> +        for (i =3D 0; i < max_cpus; ++i) {
>              SpaprInterruptControllerClass *sicc
>                  =3D SPAPR_INTC_GET_CLASS(spapr->xive);
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--NtwzykIc2mflq5ck
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+7NhoACgkQbDjKyiDZ
s5L9HRAAmZgmqCvpkBPkZZo3hbO6vanyBucEGkprKDtp3nKuhVds5Rug+YInqd1G
UeErJtkIfCnI39doYGRCU2io/LHz1GPf+dxeS3aHt0CNFS/31NbAXAmWcu4utNW2
DpWsEhuHxR8TsTMr/QApdqajPOfwsLwnAVB24lDAi/ikhS8HdMiTNY8UBzKAsK36
kH3XDMfL1nRw3zGtTWmb5ooBVNda1ARt6wpyFtgnEVZpJteQFIpNfG5L1lzOtlbT
lcjRWci1dYOp+KFPBxklA3JdNqi0wi23tqqr+clXdYA8QvVdBb+VdG1Nr0ag1HCA
rhfJJqquHYsIa98NkADqN9AdQmDHt4phwMlxMBLyEPkynV3qoa6hA45TofGFbmev
ZEfI/uxQP9JOQMEACBBK+6u0WVVE4dpND/CVxtQT8CAZHA5Z2Gr6Jqpoe6DsqTcW
7WCyVXzgfZwO3cH+7ETJVJuyP8pTPObX2vqy5n1SZ/X3m/7zQEo1wiqUH7hn43HR
/QVa9qHO4eis1j3DMbp9LaC6QK4iszXJT9gHEFPgAkOwMGCAUO6wD61Kk8UHrDXf
Dix1LNi1a2y0kDtW6F5laxFuCzCBOcHEgKBR1b4r1KtJJtTBybwBnOij5Co0x/g5
vzKujtTMKOOiWm7/TKnk7umwl7GAJyyjVARZFyyBkhBGC3tOfPc=
=VDmN
-----END PGP SIGNATURE-----

--NtwzykIc2mflq5ck--

