Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A40BC9F0D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Oct 2019 15:05:06 +0200 (CEST)
Received: from localhost ([::1]:36116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iG0n2-0004Yd-VT
	for lists+qemu-devel@lfdr.de; Thu, 03 Oct 2019 09:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49383)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iG0kn-0003Ye-4v
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 09:02:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iG0kh-0008FR-Vd
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 09:02:45 -0400
Received: from 7.mo4.mail-out.ovh.net ([178.33.253.54]:45224)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iG0kh-0008DI-Pm
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 09:02:39 -0400
Received: from player732.ha.ovh.net (unknown [10.109.143.3])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id D690F209F7F
 for <qemu-devel@nongnu.org>; Thu,  3 Oct 2019 15:02:36 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player732.ha.ovh.net (Postfix) with ESMTPSA id B80ADA6D3C1C;
 Thu,  3 Oct 2019 13:02:32 +0000 (UTC)
Date: Thu, 3 Oct 2019 15:02:31 +0200
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 1/7] spapr, xics: Get number of servers with a
 XICSFabricClass method
Message-ID: <20191003150231.44bf1046@bahia.lan>
In-Reply-To: <7e0d1ddd-61eb-4adf-193a-9bb197b3033c@kaod.org>
References: <157010404888.246126.9768030542733152637.stgit@bahia.lan>
 <157010405465.246126.7760334967989385566.stgit@bahia.lan>
 <a00c6fee-42b8-c923-386f-5fa909f6f99b@kaod.org>
 <20191003144952.181da0e2@bahia.lan>
 <7e0d1ddd-61eb-4adf-193a-9bb197b3033c@kaod.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 17396279464803932555
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrgeekgdeiudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 178.33.253.54
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
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Oct 2019 14:58:45 +0200
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> On 03/10/2019 14:49, Greg Kurz wrote:
> > On Thu, 3 Oct 2019 14:24:06 +0200
> > C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> >=20
> >> On 03/10/2019 14:00, Greg Kurz wrote:
> >>> The number of servers, ie. upper bound of the highest VCPU id, is
> >>> currently only needed to generate the "interrupt-controller" node
> >>> in the DT. Soon it will be needed to inform the XICS-on-XIVE KVM
> >>> device that it can allocates less resources in the XIVE HW.
> >>>
> >>> Add a method to XICSFabricClass for this purpose.=20
> >>
> >> This is sPAPR code and PowerNV does not care.
> >>
> >=20
> > Then PowerNV doesn't need to implement the method.
> >=20
> >> why can not we simply call spapr_max_server_number(spapr) ?
> >>
> >=20
> > Because the backend shouldn't reach out to sPAPR machine
> > internals. XICSFabric is the natural interface for ICS/ICP
> > if they need something from the machine.
>=20
> From what I can see, xics_nr_servers() is only called by :=20
>=20
>   spapr_dt_xics(SpaprMachineState *spapr ...)
>   xics_kvm_connect(SpaprMachineState *spapr ...)
>=20

Yes... and ?

> C.=20
>=20
> >>
> >>> Implement it
> >>> for sPAPR and use it to generate the "interrupt-controller" node.
> >>>
> >>> Signed-off-by: Greg Kurz <groug@kaod.org>
> >>> ---
> >>>  hw/intc/xics.c        |    7 +++++++
> >>>  hw/intc/xics_spapr.c  |    3 ++-
> >>>  hw/ppc/spapr.c        |    8 ++++++++
> >>>  include/hw/ppc/xics.h |    2 ++
> >>>  4 files changed, 19 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/hw/intc/xics.c b/hw/intc/xics.c
> >>> index dfe7dbd254ab..f82072935266 100644
> >>> --- a/hw/intc/xics.c
> >>> +++ b/hw/intc/xics.c
> >>> @@ -716,6 +716,13 @@ ICPState *xics_icp_get(XICSFabric *xi, int serve=
r)
> >>>      return xic->icp_get(xi, server);
> >>>  }
> >>> =20
> >>> +uint32_t xics_nr_servers(XICSFabric *xi)
> >>> +{
> >>> +    XICSFabricClass *xic =3D XICS_FABRIC_GET_CLASS(xi);
> >>> +
> >>> +    return xic->nr_servers(xi);
> >>> +}
> >>> +
> >>>  void ics_set_irq_type(ICSState *ics, int srcno, bool lsi)
> >>>  {
> >>>      assert(!(ics->irqs[srcno].flags & XICS_FLAGS_IRQ_MASK));
> >>> diff --git a/hw/intc/xics_spapr.c b/hw/intc/xics_spapr.c
> >>> index 6e5eb24b3cca..aa568ed0dc0d 100644
> >>> --- a/hw/intc/xics_spapr.c
> >>> +++ b/hw/intc/xics_spapr.c
> >>> @@ -311,8 +311,9 @@ static void ics_spapr_realize(DeviceState *dev, E=
rror **errp)
> >>>  void spapr_dt_xics(SpaprMachineState *spapr, uint32_t nr_servers, vo=
id *fdt,
> >>>                     uint32_t phandle)
> >>>  {
> >>> +    ICSState *ics =3D spapr->ics;
> >>>      uint32_t interrupt_server_ranges_prop[] =3D {
> >>> -        0, cpu_to_be32(nr_servers),
> >>> +        0, cpu_to_be32(xics_nr_servers(ics->xics)),
> >>>      };
> >>>      int node;
> >>> =20
> >>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> >>> index 514a17ae74d6..b8b9796c88e4 100644
> >>> --- a/hw/ppc/spapr.c
> >>> +++ b/hw/ppc/spapr.c
> >>> @@ -4266,6 +4266,13 @@ static ICPState *spapr_icp_get(XICSFabric *xi,=
 int vcpu_id)
> >>>      return cpu ? spapr_cpu_state(cpu)->icp : NULL;
> >>>  }
> >>> =20
> >>> +static uint32_t spapr_nr_servers(XICSFabric *xi)
> >>> +{
> >>> +    SpaprMachineState *spapr =3D SPAPR_MACHINE(xi);
> >>> +
> >>> +    return spapr_max_server_number(spapr);
> >>> +}
> >>> +
> >>>  static void spapr_pic_print_info(InterruptStatsProvider *obj,
> >>>                                   Monitor *mon)
> >>>  {
> >>> @@ -4423,6 +4430,7 @@ static void spapr_machine_class_init(ObjectClas=
s *oc, void *data)
> >>>      xic->ics_get =3D spapr_ics_get;
> >>>      xic->ics_resend =3D spapr_ics_resend;
> >>>      xic->icp_get =3D spapr_icp_get;
> >>> +    xic->nr_servers =3D spapr_nr_servers;
> >>>      ispc->print_info =3D spapr_pic_print_info;
> >>>      /* Force NUMA node memory size to be a multiple of
> >>>       * SPAPR_MEMORY_BLOCK_SIZE (256M) since that's the granularity
> >>> diff --git a/include/hw/ppc/xics.h b/include/hw/ppc/xics.h
> >>> index 1e6a9300eb2b..e6bb1239e8f8 100644
> >>> --- a/include/hw/ppc/xics.h
> >>> +++ b/include/hw/ppc/xics.h
> >>> @@ -151,9 +151,11 @@ typedef struct XICSFabricClass {
> >>>      ICSState *(*ics_get)(XICSFabric *xi, int irq);
> >>>      void (*ics_resend)(XICSFabric *xi);
> >>>      ICPState *(*icp_get)(XICSFabric *xi, int server);
> >>> +    uint32_t (*nr_servers)(XICSFabric *xi);
> >>>  } XICSFabricClass;
> >>> =20
> >>>  ICPState *xics_icp_get(XICSFabric *xi, int server);
> >>> +uint32_t xics_nr_servers(XICSFabric *xi);
> >>> =20
> >>>  /* Internal XICS interfaces */
> >>>  void icp_set_cppr(ICPState *icp, uint8_t cppr);
> >>>
> >>
> >=20
>=20


