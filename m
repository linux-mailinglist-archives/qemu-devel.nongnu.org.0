Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 530FB2BFF0D
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 05:41:21 +0100 (CET)
Received: from localhost ([::1]:58234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh3fE-0002lp-CF
	for lists+qemu-devel@lfdr.de; Sun, 22 Nov 2020 23:41:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh3d4-0000w4-DP; Sun, 22 Nov 2020 23:39:06 -0500
Received: from ozlabs.org ([203.11.71.1]:42859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh3d0-0006Kw-B5; Sun, 22 Nov 2020 23:39:06 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CfZDC0HVRz9sTc; Mon, 23 Nov 2020 15:38:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1606106331;
 bh=iVAcUhFQrm0oCW63SIkl7Lve8nWd1oAh1kDhhBBnPjI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PHVIfxAhUFj9zZWvR4Yhc5KlubZDIe8ffcSThskiS3F5dAJGm36u7k/tG+D/jNTcQ
 9GdekwFvLIsAMOXGyEXpVN/LeU1x5SHPPAStz7k3uIeT4U8UuXidQ9MFLqB3O3GVqv
 85gOFVuwDhyZoPPDgv2AvDY+ICs2IP82lrEsherE=
Date: Mon, 23 Nov 2020 14:52:14 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH for-6.0 3/8] spapr/xive: Add "nr-servers" property
Message-ID: <20201123035214.GC521467@yekko.fritz.box>
References: <20201120174646.619395-1-groug@kaod.org>
 <20201120174646.619395-4-groug@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tqI+Z3u+9OQ7kwn0"
Content-Disposition: inline
In-Reply-To: <20201120174646.619395-4-groug@kaod.org>
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


--tqI+Z3u+9OQ7kwn0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2020 at 06:46:41PM +0100, Greg Kurz wrote:
> The sPAPR XIVE object has an "nr-ends" property that is used
> to size the END table. This property is set by the machine
> code to a value derived from spapr_max_server_number().
>=20
> spapr_max_server_number() is also used to inform the KVM XIVE
> device about the range of vCPU ids it might be exposed to,
> in order to optimize resource allocation in the HW.
>=20
> This is enough motivation to introduce an "nr-servers" property
> and to use it for both purposes. The existing "nr-ends" property
> is now longer used. It is kept around though because it is exposed
> to -global. It will continue to be ignored as before without
> causing QEMU to exit.

I'm a little dubious about keeping the property around.  It's
technically a breaking change to remove it, but since IIUC, it's
*never* had any effect, it seems implausible anyone out there's using
it.

Can we at least put it straight into the deprecation document?

> The associated nr_ends field cannot be dropped from SpaprXive
> because it is explicitly used by vmstate_spapr_xive(). It is
> thus renamed to nr_ends_vmstate.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  include/hw/ppc/spapr_xive.h | 16 +++++++++++++++-
>  hw/intc/spapr_xive.c        | 28 ++++++++++++++++++++++------
>  hw/ppc/spapr_irq.c          |  6 +-----
>  3 files changed, 38 insertions(+), 12 deletions(-)
>=20
> diff --git a/include/hw/ppc/spapr_xive.h b/include/hw/ppc/spapr_xive.h
> index 4b967f13c030..7123ea07ed78 100644
> --- a/include/hw/ppc/spapr_xive.h
> +++ b/include/hw/ppc/spapr_xive.h
> @@ -23,6 +23,16 @@
>  typedef struct SpaprXive {
>      XiveRouter    parent;
> =20
> +    /*
> +     * The XIVE device needs to know the highest vCPU id it might
> +     * be exposed to in order to size the END table. It may also
> +     * propagate the value to the KVM XIVE device in order to
> +     * optimize resource allocation in the HW.
> +     * This must be set to a non-null value using the "nr-servers"
> +     * property, before realizing the device.
> +     */
> +    uint32_t      nr_servers;
> +
>      /* Internal interrupt source for IPIs and virtual devices */
>      XiveSource    source;
>      hwaddr        vc_base;
> @@ -38,7 +48,11 @@ typedef struct SpaprXive {
>      XiveEAS       *eat;
>      uint32_t      nr_irqs;
>      XiveEND       *endt;
> -    uint32_t      nr_ends;
> +    /*
> +     * This is derived from nr_servers but it must be kept around because
> +     * vmstate_spapr_xive uses it.
> +     */
> +    uint32_t      nr_ends_vmstate;
> =20
>      /* TIMA mapping address */
>      hwaddr        tm_base;
> diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
> index f473ad9cba47..e4dbf9c2c409 100644
> --- a/hw/intc/spapr_xive.c
> +++ b/hw/intc/spapr_xive.c
> @@ -99,6 +99,12 @@ int spapr_xive_end_to_target(uint8_t end_blk, uint32_t=
 end_idx,
>      return 0;
>  }
> =20
> +/*
> + * 8 XIVE END structures per CPU. One for each available
> + * priority
> + */
> +#define spapr_xive_cpu_end_idx(vcpu, prio) (((vcpu) << 3) + prio)
> +
>  static void spapr_xive_cpu_to_end(PowerPCCPU *cpu, uint8_t prio,
>                                    uint8_t *out_end_blk, uint32_t *out_en=
d_idx)
>  {
> @@ -109,7 +115,7 @@ static void spapr_xive_cpu_to_end(PowerPCCPU *cpu, ui=
nt8_t prio,
>      }
> =20
>      if (out_end_idx) {
> -        *out_end_idx =3D (cpu->vcpu_id << 3) + prio;
> +        *out_end_idx =3D spapr_xive_cpu_end_idx(cpu->vcpu_id, prio);
>      }
>  }
> =20
> @@ -290,7 +296,8 @@ static void spapr_xive_instance_init(Object *obj)
> =20
>  uint32_t spapr_xive_nr_ends(const SpaprXive *xive)
>  {
> -    return xive->nr_ends;
> +    g_assert(xive->nr_servers);
> +    return spapr_xive_cpu_end_idx(xive->nr_servers, 0);
>  }
> =20
>  static void spapr_xive_realize(DeviceState *dev, Error **errp)
> @@ -303,7 +310,7 @@ static void spapr_xive_realize(DeviceState *dev, Erro=
r **errp)
> =20
>      /* Set by spapr_irq_init() */
>      g_assert(xive->nr_irqs);
> -    g_assert(xive->nr_ends);
> +    g_assert(xive->nr_servers);
> =20
>      sxc->parent_realize(dev, &local_err);
>      if (local_err) {
> @@ -360,6 +367,8 @@ static void spapr_xive_realize(DeviceState *dev, Erro=
r **errp)
>      sysbus_mmio_map(SYS_BUS_DEVICE(xive), 0, xive->vc_base);
>      sysbus_mmio_map(SYS_BUS_DEVICE(xive), 1, xive->end_base);
>      sysbus_mmio_map(SYS_BUS_DEVICE(xive), 2, xive->tm_base);
> +
> +    xive->nr_ends_vmstate =3D spapr_xive_nr_ends(xive);
>  }
> =20
>  static int spapr_xive_get_eas(XiveRouter *xrtr, uint8_t eas_blk,
> @@ -547,7 +556,7 @@ static const VMStateDescription vmstate_spapr_xive =
=3D {
>          VMSTATE_UINT32_EQUAL(nr_irqs, SpaprXive, NULL),
>          VMSTATE_STRUCT_VARRAY_POINTER_UINT32(eat, SpaprXive, nr_irqs,
>                                       vmstate_spapr_xive_eas, XiveEAS),
> -        VMSTATE_STRUCT_VARRAY_POINTER_UINT32(endt, SpaprXive, nr_ends,
> +        VMSTATE_STRUCT_VARRAY_POINTER_UINT32(endt, SpaprXive, nr_ends_vm=
state,
>                                               vmstate_spapr_xive_end, Xiv=
eEND),
>          VMSTATE_END_OF_LIST()
>      },
> @@ -591,7 +600,14 @@ static void spapr_xive_free_irq(SpaprInterruptContro=
ller *intc, int lisn)
> =20
>  static Property spapr_xive_properties[] =3D {
>      DEFINE_PROP_UINT32("nr-irqs", SpaprXive, nr_irqs, 0),
> -    DEFINE_PROP_UINT32("nr-ends", SpaprXive, nr_ends, 0),
> +    /*
> +     * "nr-ends" is deprecated by "nr-servers" since QEMU 6.0.
> +     * It is just kept around because it is exposed to the user
> +     * through -global and we don't want it to fail, even if
> +     * the value is actually overridden internally.
> +     */
> +    DEFINE_PROP_UINT32("nr-ends", SpaprXive, nr_ends_vmstate, 0),
> +    DEFINE_PROP_UINT32("nr-servers", SpaprXive, nr_servers, 0),
>      DEFINE_PROP_UINT64("vc-base", SpaprXive, vc_base, SPAPR_XIVE_VC_BASE=
),
>      DEFINE_PROP_UINT64("tm-base", SpaprXive, tm_base, SPAPR_XIVE_TM_BASE=
),
>      DEFINE_PROP_UINT8("hv-prio", SpaprXive, hv_prio, 7),
> @@ -742,7 +758,7 @@ static int spapr_xive_activate(SpaprInterruptControll=
er *intc,
>      SpaprXive *xive =3D SPAPR_XIVE(intc);
> =20
>      if (kvm_enabled()) {
> -        int rc =3D spapr_irq_init_kvm(kvmppc_xive_connect, intc, nr_serv=
ers,
> +        int rc =3D spapr_irq_init_kvm(kvmppc_xive_connect, intc, xive->n=
r_servers,

Hmm.  So we're now ignoring the 'nr_servers' parameter to this
function, which doesn't seem right.  Should we be assert()ing that
it's equal to xive->nr_servers?

>                                      errp);
>          if (rc < 0) {
>              return rc;
> diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
> index f59960339ec3..8c5627225636 100644
> --- a/hw/ppc/spapr_irq.c
> +++ b/hw/ppc/spapr_irq.c
> @@ -330,11 +330,7 @@ void spapr_irq_init(SpaprMachineState *spapr, Error =
**errp)
> =20
>          dev =3D qdev_new(TYPE_SPAPR_XIVE);
>          qdev_prop_set_uint32(dev, "nr-irqs", smc->nr_xirqs + SPAPR_XIRQ_=
BASE);
> -        /*
> -         * 8 XIVE END structures per CPU. One for each available
> -         * priority
> -         */
> -        qdev_prop_set_uint32(dev, "nr-ends", nr_servers << 3);
> +        qdev_prop_set_uint32(dev, "nr-servers", nr_servers);
>          object_property_set_link(OBJECT(dev), "xive-fabric", OBJECT(spap=
r),
>                                   &error_abort);
>          sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--tqI+Z3u+9OQ7kwn0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+7MewACgkQbDjKyiDZ
s5KGaBAAoHBG/EtE0uzoCuVMue5H9eOOnRRu3aRAKiTwrd4EUSaxQVk797JFAs26
g4E+fEyL53pe4affx5UwZ8ENSL8ao+CT+hA1ZAer38G3cH3regW4vd2/r6Z+CuWF
+XT3dV/qTxFsYZEVHPY3BRxNPIS2CQ5JTvXbINwSxM+0VoKqpJz+UwmWGbpfPdlT
ZyCl01DGaX43oPr4mmEIdlqt1FmyPg9SvegtGQkCqwP8R+NcPZCOQuR8Ewo3JGS7
0U0y5M/6gZpOYXwKLI7kabdNT3wRLCH/Zl9C4uz0g/l85luxg40wpZbiMtQwck6s
5rGxR6W73PaK1BdNXUeBTlxGIZCiRZMLzo3hQ25KnTgbHFXwGygYk6aNdT48VvRW
jBKmGx2WUQd0Mtcze/7ub08icvn9tMhDUXFftLV3rpVahHqxqoC+ldFuAI21SsWi
QuVLwEX51jFmMNzVdCV7r4riIT0dYKHoXfycTECIrvsIUF0K9inmr/6qFaRpXS29
MN+aMgJ+PRJ37c60fvueLu+EpUgU2Xvz+NNLI1OC0Hkvl1zBMcHCMjsAHak9WwHd
Txr+vUVv2XVylVver3dUD6LUsax1LaLrBmWq3abbVNiXQi8hpcTzaXDJG9WCWJIw
dTM79X8OBuaaL0QLQ8/Bq1evo9LSKVdPsc8jHeU59y6ff0vLB50=
=IoUu
-----END PGP SIGNATURE-----

--tqI+Z3u+9OQ7kwn0--

