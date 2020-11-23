Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 874462BFF10
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 05:43:18 +0100 (CET)
Received: from localhost ([::1]:39068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh3h7-0006bi-L6
	for lists+qemu-devel@lfdr.de; Sun, 22 Nov 2020 23:43:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh3d4-0000w9-JE; Sun, 22 Nov 2020 23:39:06 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:53013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh3cz-0006L3-Sr; Sun, 22 Nov 2020 23:39:06 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CfZDC3k2jz9sTv; Mon, 23 Nov 2020 15:38:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1606106331;
 bh=TeKQ0oNxfTwObYDcbi9/8Pdv/Ihp16Gfe6/bXqqReKw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ri6v3blFh9dEVu/9OGdyzHaryNCRYyjtS9gNLI4mar0S3MnkVB79kmsBQvsbNaIcM
 pwLT40NGX74hSg2JX7d4EIdYDRGol1mdZG3kBtXmeYjHrUQB3EeEtm1/BDghZYT0A+
 SY/udTTT0A0b5aB0UloB6cIyGKjjn+s+6qwcJhzs=
Date: Mon, 23 Nov 2020 15:18:09 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH for-6.0 6/8] spapr/xics: Add "nr-servers" property
Message-ID: <20201123041809.GF521467@yekko.fritz.box>
References: <20201120174646.619395-1-groug@kaod.org>
 <20201120174646.619395-7-groug@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/QKKmeG/X/bPShih"
Content-Disposition: inline
In-Reply-To: <20201120174646.619395-7-groug@kaod.org>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--/QKKmeG/X/bPShih
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2020 at 06:46:44PM +0100, Greg Kurz wrote:
> The sPAPR ICS device exposes the range of vCPU ids it can handle in
> the "ibm,interrupt-server-ranges" FDT property. The highest vCPU
> id, ie. spapr_max_server_number(), is obtained from the machine
> through the "nr_servers" argument of the generic spapr_irq_dt() call.
>=20
> We want to drop the "nr_servers" argument from the API because it
> doesn't make sense for the sPAPR XIVE device actually.
>=20
> On POWER9, we also pass the highest vCPU id to the KVM XICS-on-XIVE
> device, in order to optimize resource allocation in the HW.
>=20
> This is enough motivation to introduce an "nr-servers" property
> and to use it for both purposes.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  include/hw/ppc/spapr.h      |  4 ++--
>  include/hw/ppc/xics_spapr.h | 21 +++++++++++++++++---
>  hw/intc/xics_kvm.c          |  2 +-
>  hw/intc/xics_spapr.c        | 38 ++++++++++++++++++++++++-------------
>  hw/ppc/spapr.c              |  5 +++--
>  hw/ppc/spapr_irq.c          |  7 +++++--
>  6 files changed, 54 insertions(+), 23 deletions(-)
>=20
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index 2e89e36cfbdc..b76c84a2f884 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -10,7 +10,7 @@
>  #include "hw/ppc/spapr_irq.h"
>  #include "qom/object.h"
>  #include "hw/ppc/spapr_xive.h"  /* For SpaprXive */
> -#include "hw/ppc/xics.h"        /* For ICSState */
> +#include "hw/ppc/xics_spapr.h"  /* For IcsSpaprState */
>  #include "hw/ppc/spapr_tpm_proxy.h"
> =20
>  struct SpaprVioBus;
> @@ -230,7 +230,7 @@ struct SpaprMachineState {
>      SpaprIrq *irq;
>      qemu_irq *qirqs;
>      SpaprInterruptController *active_intc;
> -    ICSState *ics;
> +    IcsSpaprState *ics;
>      SpaprXive *xive;
> =20
>      bool cmd_line_caps[SPAPR_CAP_NUM];
> diff --git a/include/hw/ppc/xics_spapr.h b/include/hw/ppc/xics_spapr.h
> index de752c0d2c7e..1a483a873b62 100644
> --- a/include/hw/ppc/xics_spapr.h
> +++ b/include/hw/ppc/xics_spapr.h
> @@ -28,12 +28,27 @@
>  #define XICS_SPAPR_H
> =20
>  #include "hw/ppc/spapr.h"
> +#include "hw/ppc/xics.h"
>  #include "qom/object.h"
> =20
> +typedef struct IcsSpaprState {
> +    /*< private >*/
> +    ICPState parent_obj;

It's called "*Ics*SpaprState" and it's replacing an ICSState, but it's
parent object is an *ICP*State - that doesn't seem right.

> +
> +    /*
> +     * The ICS needs to know the upper limit to vCPU ids it
> +     * might be exposed to in order to size the vCPU id range
> +     * in "ibm,interrupt-server-ranges" and to optimize HW
> +     * resource allocation when using the XICS-on-XIVE KVM
> +     * device. It is the purpose of the "nr-servers" property
> +     * which *must* be set to a non-null value before realizing
> +     * the ICS.
> +     */
> +    uint32_t nr_servers;

That said, I'm a but dubious about attaching the number of servers to
the ICS side, rather than the ICP side, since server numbers is
basically an ICP concept.  In fact... things about the overall
topology are usually done via the XicsFabric, so I'm wondering if we
should add a callback there for nr_servers.

> +} IcsSpaprState;
> +
>  #define TYPE_ICS_SPAPR "ics-spapr"
> -/* This is reusing the ICSState typedef from TYPE_ICS */
> -DECLARE_INSTANCE_CHECKER(ICSState, ICS_SPAPR,
> -                         TYPE_ICS_SPAPR)
> +DECLARE_INSTANCE_CHECKER(IcsSpaprState, ICS_SPAPR, TYPE_ICS_SPAPR)
> =20
>  int xics_kvm_connect(SpaprInterruptController *intc, uint32_t nr_servers,
>                       Error **errp);
> diff --git a/hw/intc/xics_kvm.c b/hw/intc/xics_kvm.c
> index 570d635bcc08..ecbbda0e249b 100644
> --- a/hw/intc/xics_kvm.c
> +++ b/hw/intc/xics_kvm.c
> @@ -350,7 +350,7 @@ void ics_kvm_set_irq(ICSState *ics, int srcno, int va=
l)
>  int xics_kvm_connect(SpaprInterruptController *intc, uint32_t nr_servers,
>                       Error **errp)
>  {
> -    ICSState *ics =3D ICS_SPAPR(intc);
> +    ICSState *ics =3D ICS(intc);
>      int rc;
>      CPUState *cs;
>      Error *local_err =3D NULL;
> diff --git a/hw/intc/xics_spapr.c b/hw/intc/xics_spapr.c
> index 8ae4f41459c3..ce147e8980ed 100644
> --- a/hw/intc/xics_spapr.c
> +++ b/hw/intc/xics_spapr.c
> @@ -34,6 +34,7 @@
>  #include "hw/ppc/xics.h"
>  #include "hw/ppc/xics_spapr.h"
>  #include "hw/ppc/fdt.h"
> +#include "hw/qdev-properties.h"
>  #include "qapi/visitor.h"
> =20
>  /*
> @@ -154,7 +155,7 @@ static void rtas_set_xive(PowerPCCPU *cpu, SpaprMachi=
neState *spapr,
>                            uint32_t nargs, target_ulong args,
>                            uint32_t nret, target_ulong rets)
>  {
> -    ICSState *ics =3D spapr->ics;
> +    ICSState *ics =3D ICS(spapr->ics);
>      uint32_t nr, srcno, server, priority;
> =20
>      CHECK_EMULATED_XICS_RTAS(spapr, rets);
> @@ -189,7 +190,7 @@ static void rtas_get_xive(PowerPCCPU *cpu, SpaprMachi=
neState *spapr,
>                            uint32_t nargs, target_ulong args,
>                            uint32_t nret, target_ulong rets)
>  {
> -    ICSState *ics =3D spapr->ics;
> +    ICSState *ics =3D ICS(spapr->ics);
>      uint32_t nr, srcno;
> =20
>      CHECK_EMULATED_XICS_RTAS(spapr, rets);
> @@ -221,7 +222,7 @@ static void rtas_int_off(PowerPCCPU *cpu, SpaprMachin=
eState *spapr,
>                           uint32_t nargs, target_ulong args,
>                           uint32_t nret, target_ulong rets)
>  {
> -    ICSState *ics =3D spapr->ics;
> +    ICSState *ics =3D ICS(spapr->ics);
>      uint32_t nr, srcno;
> =20
>      CHECK_EMULATED_XICS_RTAS(spapr, rets);
> @@ -254,7 +255,7 @@ static void rtas_int_on(PowerPCCPU *cpu, SpaprMachine=
State *spapr,
>                          uint32_t nargs, target_ulong args,
>                          uint32_t nret, target_ulong rets)
>  {
> -    ICSState *ics =3D spapr->ics;
> +    ICSState *ics =3D ICS(spapr->ics);
>      uint32_t nr, srcno;
> =20
>      CHECK_EMULATED_XICS_RTAS(spapr, rets);
> @@ -285,10 +286,13 @@ static void rtas_int_on(PowerPCCPU *cpu, SpaprMachi=
neState *spapr,
> =20
>  static void ics_spapr_realize(DeviceState *dev, Error **errp)
>  {
> -    ICSState *ics =3D ICS_SPAPR(dev);
> -    ICSStateClass *icsc =3D ICS_GET_CLASS(ics);
> +    IcsSpaprState *sics =3D ICS_SPAPR(dev);
> +    ICSStateClass *icsc =3D ICS_GET_CLASS(dev);
>      Error *local_err =3D NULL;
> =20
> +    /* Set by spapr_irq_init() */
> +    g_assert(sics->nr_servers);
> +
>      icsc->parent_realize(dev, &local_err);
>      if (local_err) {
>          error_propagate(errp, local_err);
> @@ -312,7 +316,7 @@ static void xics_spapr_dt(SpaprInterruptController *i=
ntc, uint32_t nr_servers,
>                            void *fdt, uint32_t phandle)
>  {
>      uint32_t interrupt_server_ranges_prop[] =3D {
> -        0, cpu_to_be32(nr_servers),
> +        0, cpu_to_be32(ICS_SPAPR(intc)->nr_servers),
>      };
>      int node;
> =20
> @@ -333,7 +337,7 @@ static void xics_spapr_dt(SpaprInterruptController *i=
ntc, uint32_t nr_servers,
>  static int xics_spapr_cpu_intc_create(SpaprInterruptController *intc,
>                                         PowerPCCPU *cpu, Error **errp)
>  {
> -    ICSState *ics =3D ICS_SPAPR(intc);
> +    ICSState *ics =3D ICS(intc);
>      Object *obj;
>      SpaprCpuState *spapr_cpu =3D spapr_cpu_state(cpu);
> =20
> @@ -364,7 +368,7 @@ static void xics_spapr_cpu_intc_destroy(SpaprInterrup=
tController *intc,
>  static int xics_spapr_claim_irq(SpaprInterruptController *intc, int irq,
>                                  bool lsi, Error **errp)
>  {
> -    ICSState *ics =3D ICS_SPAPR(intc);
> +    ICSState *ics =3D ICS(intc);
> =20
>      assert(ics);
>      assert(ics_valid_irq(ics, irq));
> @@ -380,7 +384,7 @@ static int xics_spapr_claim_irq(SpaprInterruptControl=
ler *intc, int irq,
> =20
>  static void xics_spapr_free_irq(SpaprInterruptController *intc, int irq)
>  {
> -    ICSState *ics =3D ICS_SPAPR(intc);
> +    ICSState *ics =3D ICS(intc);
>      uint32_t srcno =3D irq - ics->offset;
> =20
>      assert(ics_valid_irq(ics, irq));
> @@ -390,7 +394,7 @@ static void xics_spapr_free_irq(SpaprInterruptControl=
ler *intc, int irq)
> =20
>  static void xics_spapr_set_irq(SpaprInterruptController *intc, int irq, =
int val)
>  {
> -    ICSState *ics =3D ICS_SPAPR(intc);
> +    ICSState *ics =3D ICS(intc);
>      uint32_t srcno =3D irq - ics->offset;
> =20
>      ics_set_irq(ics, srcno, val);
> @@ -398,7 +402,7 @@ static void xics_spapr_set_irq(SpaprInterruptControll=
er *intc, int irq, int val)
> =20
>  static void xics_spapr_print_info(SpaprInterruptController *intc, Monito=
r *mon)
>  {
> -    ICSState *ics =3D ICS_SPAPR(intc);
> +    ICSState *ics =3D ICS(intc);
>      CPUState *cs;
> =20
>      CPU_FOREACH(cs) {
> @@ -426,7 +430,8 @@ static int xics_spapr_activate(SpaprInterruptControll=
er *intc,
>                                 uint32_t nr_servers, Error **errp)
>  {
>      if (kvm_enabled()) {
> -        return spapr_irq_init_kvm(xics_kvm_connect, intc, nr_servers, er=
rp);
> +        return spapr_irq_init_kvm(xics_kvm_connect, intc,
> +                                  ICS_SPAPR(intc)->nr_servers, errp);
>      }
>      return 0;
>  }
> @@ -438,6 +443,11 @@ static void xics_spapr_deactivate(SpaprInterruptCont=
roller *intc)
>      }
>  }
> =20
> +static Property ics_spapr_properties[] =3D {
> +    DEFINE_PROP_UINT32("nr-servers", IcsSpaprState, nr_servers, 0),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>  static void ics_spapr_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
> @@ -446,6 +456,7 @@ static void ics_spapr_class_init(ObjectClass *klass, =
void *data)
> =20
>      device_class_set_parent_realize(dc, ics_spapr_realize,
>                                      &isc->parent_realize);
> +    device_class_set_props(dc, ics_spapr_properties);
>      sicc->activate =3D xics_spapr_activate;
>      sicc->deactivate =3D xics_spapr_deactivate;
>      sicc->cpu_intc_create =3D xics_spapr_cpu_intc_create;
> @@ -462,6 +473,7 @@ static void ics_spapr_class_init(ObjectClass *klass, =
void *data)
>  static const TypeInfo ics_spapr_info =3D {
>      .name =3D TYPE_ICS_SPAPR,
>      .parent =3D TYPE_ICS,
> +    .instance_size =3D sizeof(IcsSpaprState),
>      .class_init =3D ics_spapr_class_init,
>      .interfaces =3D (InterfaceInfo[]) {
>          { TYPE_SPAPR_INTC },
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 12a012d9dd09..21de0456446b 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4218,15 +4218,16 @@ static void spapr_phb_placement(SpaprMachineState=
 *spapr, uint32_t index,
>  static ICSState *spapr_ics_get(XICSFabric *dev, int irq)
>  {
>      SpaprMachineState *spapr =3D SPAPR_MACHINE(dev);
> +    ICSState *ics =3D ICS(spapr->ics);
> =20
> -    return ics_valid_irq(spapr->ics, irq) ? spapr->ics : NULL;
> +    return ics_valid_irq(ics, irq) ? ics : NULL;
>  }
> =20
>  static void spapr_ics_resend(XICSFabric *dev)
>  {
>      SpaprMachineState *spapr =3D SPAPR_MACHINE(dev);
> =20
> -    ics_resend(spapr->ics);
> +    ics_resend(ICS(spapr->ics));
>  }
> =20
>  static ICPState *spapr_icp_get(XICSFabric *xi, int vcpu_id)
> diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
> index 2dacbecfd5fd..be6f4041e433 100644
> --- a/hw/ppc/spapr_irq.c
> +++ b/hw/ppc/spapr_irq.c
> @@ -316,6 +316,9 @@ void spapr_irq_init(SpaprMachineState *spapr, Error *=
*errp)
>          object_property_set_link(obj, ICS_PROP_XICS, OBJECT(spapr),
>                                   &error_abort);
>          object_property_set_int(obj, "nr-irqs", smc->nr_xirqs, &error_ab=
ort);
> +        object_property_set_uint(obj, "nr-servers",
> +                                 spapr_max_server_number(spapr),
> +                                 &error_abort);
>          if (!qdev_realize(DEVICE(obj), NULL, errp)) {
>              return;
>          }
> @@ -426,7 +429,7 @@ qemu_irq spapr_qirq(SpaprMachineState *spapr, int irq)
>      assert(irq < (smc->nr_xirqs + SPAPR_XIRQ_BASE));
> =20
>      if (spapr->ics) {
> -        assert(ics_valid_irq(spapr->ics, irq));
> +        assert(ics_valid_irq(ICS(spapr->ics), irq));
>      }
>      if (spapr->xive) {
>          assert(irq < spapr->xive->nr_irqs);
> @@ -556,7 +559,7 @@ static int ics_find_free_block(ICSState *ics, int num=
, int alignnum)
> =20
>  int spapr_irq_find(SpaprMachineState *spapr, int num, bool align, Error =
**errp)
>  {
> -    ICSState *ics =3D spapr->ics;
> +    ICSState *ics =3D ICS(spapr->ics);
>      int first =3D -1;
> =20
>      assert(ics);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/QKKmeG/X/bPShih
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+7OAEACgkQbDjKyiDZ
s5JswQ//R8beO5m77rBSv7ENZYpwMSBDpAIogruddJDy2zxBNq5ajAhYlmdcvtaT
GOQ+tvCnGcNij83b9nIRKw+zHSPVqzEHno7pN3LBs+ukHCCfqozjNgpnu2kXtO7S
g5opa2IPuDYKjcBqlrDyW3We97w/a/v8HgYpwS7CoYAlw4uwCXM/Cfyw2g5FKnvt
e8rw422bnHc/FQR9nLB7tfX5MOnve3nRKVtQ87TuNNcfiL0vf6Wb1mgyUtRv8IXC
Fna9R9z7CibqyNQ452oyD0oxkOZLnb1F4552lUafp9XZj5pS73ClXGU37Dub554q
sB0U6y7X0ZM4G9o4HvxnVGoZgIKEvXo828rmjn8YWNCMlrhmw/fXKYItC1WNZKGo
HvmiM+IPmfABpCil7KehRNWdDl59m/aQHFsjFhcyenbzG9i21YpvpZoTYw7C3q57
oH8AnpcAgmsO6R3NA5rwzUq/HVB80z5rPFIYQRiUod48kVjG8Ypqt4nwIaJXwq3l
jitOO0iiCp5p0253ZxevmcLPAuh1X69U/ftD+DBJazZOgZ5SplpE/QRFXAIEb/Sb
+w+mLqN151F2oycYmKoL5dE/BWbFn+sb9h7qgTF7BIkJC0rXE61oZE+7ypoqKNeV
/cOEH8GzdIqrTY0hRjrQBXscheLf4hP8dYnHrXrNSaFbSscIlz4=
=WFeL
-----END PGP SIGNATURE-----

--/QKKmeG/X/bPShih--

