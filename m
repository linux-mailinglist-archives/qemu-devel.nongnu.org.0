Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C13B41763A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 15:50:40 +0200 (CEST)
Received: from localhost ([::1]:47480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTlb4-0007jU-Q0
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 09:50:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mTlZk-00073T-4K
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 09:49:16 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:50014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mTlZi-00005n-Ak
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 09:49:15 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-EPuv4xRVOiyQ04EMfjkGNg-1; Fri, 24 Sep 2021 09:49:10 -0400
X-MC-Unique: EPuv4xRVOiyQ04EMfjkGNg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43F41801B3D;
 Fri, 24 Sep 2021 13:49:09 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87F4B12D4A;
 Fri, 24 Sep 2021 13:49:07 +0000 (UTC)
Date: Fri, 24 Sep 2021 15:49:06 +0200
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [RFC PATCH] spapr/xive: Allocate vCPU IPIs from local context
Message-ID: <20210924154906.59da27f7@bahia.huguette>
In-Reply-To: <71b9a1a8-7d76-ff7c-db47-7c8e9b4d87b5@kaod.org>
References: <20210922144120.1277504-1-clg@kaod.org>
 <20210923111249.33c41068@bahia.huguette>
 <71b9a1a8-7d76-ff7c-db47-7c8e9b4d87b5@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 24 Sep 2021 14:40:24 +0200
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> On 9/23/21 11:12, Greg Kurz wrote:
> > On Wed, 22 Sep 2021 16:41:20 +0200
> > C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> >=20
> >> When QEMU switches to the XIVE interrupt mode, it creates all possible
> >> guest interrupts at the level of the KVM device. These interrupts are
> >> backed by real HW interrupts from the IPI interrupt pool of the XIVE
> >> controller.
> >>
> >> Currently, this is done from the QEMU main thread, which results in
> >> allocating all interrupts from the chip on which QEMU is running. IPIs
> >> are not distributed across the system and the load is not well
> >> balanced across the interrupt controllers.
> >>
> >> To improve distribution on the system, we should try to allocate the
> >> underlying HW IPI from the vCPU context. This also benefits to
> >> configurations using CPU pinning. In this case, the HW IPI is
> >> allocated on the local chip, rerouting between interrupt controllers
> >> is reduced and performance improved.
> >>
> >> This moves the initialization of the vCPU IPIs from reset time to the
> >> H_INT_SET_SOURCE_CONFIG hcall which is called from the vCPU context.
> >> But this needs some extra checks in the sequences getting and setting
> >> the source states to make sure a valid HW IPI is backing the guest
> >> interrupt. For that, we check if a target was configured in the END in
> >> case of a vCPU IPI.
> >>
> >> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> >> ---
> >>
> >>   I have tested different SMT configurations, kernel_irqchip=3Doff/on,
> >>   did some migrations, CPU hotplug, etc. It's not enough and I would
> >>   like more testing but, at least, it is not making anymore the bad
> >>   assumption vCPU id =3D IPI number.
> >>
> >=20
> > Yeah, the IPI number is provided by the guest, so h_int_set_source_conf=
ig()
> > is really the only place where we can know the IPI number of a given vC=
PU.
>=20
> The patch lacks a run_on_cpu() to perform the reset on the vCPU context
> to be complete.
>=20

Yes since the vCPU doing the hcall is obviously not the target for the
IPI :-)

> >=20
> >>   Comments ?
> >>
> >=20
> > LGTM but I didn't check if more users of xive_end_is_valid() should
> > be converted to using xive_source_is_initialized().
>=20
> I think you mean xive_eas_is_valid() ?
>=20

Oops yes... bad copy/paste :-\

> The changes only impact KVM support since we are deferring the IRQ
> initialization at the KVM level. What we have to be careful about is not
> accessing an ESB page of an interrupt that would not have been initiliaze=
d
> in the KVM device, else QEMU gets a sigbus.
>=20

Ok, so this is just needed on a path that leads to xive_esb_rw() or
kvmppc_xive_esb_trigger(), right ?

It seems that

h_int_esb()
 kvmppc_xive_esb_rw()

can get there with an lisn provided by the guest, and I don't see any
such check on the way : h_int_esb() only checks xive_eas_is_valid().

Cheers,

--
Greg

> That only happens when QEMU gets/sets the ESB states.
>  =20
> > Any chance you have some perf numbers to share ?
>=20
> I will try.
>=20
> Thanks,
>=20
> C.
>=20
>  =20
> >>   hw/intc/spapr_xive.c     | 17 +++++++++++++++++
> >>   hw/intc/spapr_xive_kvm.c | 36 +++++++++++++++++++++++++++++++-----
> >>   2 files changed, 48 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
> >> index 6f31ce74f198..2dc594a720b1 100644
> >> --- a/hw/intc/spapr_xive.c
> >> +++ b/hw/intc/spapr_xive.c
> >> @@ -1089,6 +1089,23 @@ static target_ulong h_int_set_source_config(Pow=
erPCCPU *cpu,
> >>       if (spapr_xive_in_kernel(xive)) {
> >>           Error *local_err =3D NULL;
> >>  =20
> >> +        /*
> >> +         * Initialize the vCPU IPIs from the vCPU context to allocate
> >> +         * the backing HW IPI on the local chip. This improves
> >> +         * distribution of the IPIs in the system and when the vCPUs
> >> +         * are pinned, it reduces rerouting between interrupt
> >> +         * controllers for better performance.
> >> +         */
> >> +        if (lisn < SPAPR_XIRQ_BASE) {
> >> +            XiveSource *xsrc =3D &xive->source;
> >> +
> >> +            kvmppc_xive_source_reset_one(xsrc, lisn, &local_err);
> >> +            if (local_err) {
> >> +                error_report_err(local_err);
> >> +                return H_HARDWARE;
> >> +            }
> >> +        }
> >> +
> >>           kvmppc_xive_set_source_config(xive, lisn, &new_eas, &local_e=
rr);
> >>           if (local_err) {
> >>               error_report_err(local_err);
> >> diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
> >> index 53731d158625..1607a59e9483 100644
> >> --- a/hw/intc/spapr_xive_kvm.c
> >> +++ b/hw/intc/spapr_xive_kvm.c
> >> @@ -254,7 +254,12 @@ static int kvmppc_xive_source_reset(XiveSource *x=
src, Error **errp)
> >>       SpaprXive *xive =3D SPAPR_XIVE(xsrc->xive);
> >>       int i;
> >>  =20
> >> -    for (i =3D 0; i < xsrc->nr_irqs; i++) {
> >> +    /*
> >> +     * vCPU IPIs are initialized at the KVM level when configured by
> >> +     * H_INT_SET_SOURCE_CONFIG.
> >> +     */
> >> +
> >> +    for (i =3D SPAPR_XIRQ_BASE; i < xsrc->nr_irqs; i++) {
> >>           int ret;
> >>  =20
> >>           if (!xive_eas_is_valid(&xive->eat[i])) {
> >> @@ -342,6 +347,27 @@ uint64_t kvmppc_xive_esb_rw(XiveSource *xsrc, int=
 srcno, uint32_t offset,
> >>       }
> >>   }
> >>  =20
> >> +static bool xive_source_is_initialized(SpaprXive *xive, int lisn)
> >> +{
> >> +    assert(lisn < xive->nr_irqs);
> >> +
> >> +    if (!xive_eas_is_valid(&xive->eat[lisn])) {
> >> +        return false;
> >> +    }
> >> +
> >> +    /*
> >> +     * vCPU IPIs are initialized at the KVM level when configured by
> >> +     * H_INT_SET_SOURCE_CONFIG, in which case, we should have a valid
> >> +     * target (server, priority) in the END.
> >> +     */
> >> +    if (lisn < SPAPR_XIRQ_BASE) {
> >> +        return !!xive_get_field64(EAS_END_INDEX, xive->eat[lisn].w);
> >> +    }
> >> +
> >> +    /* Device sources */
> >> +    return true;
> >> +}
> >> +
> >>   static void kvmppc_xive_source_get_state(XiveSource *xsrc)
> >>   {
> >>       SpaprXive *xive =3D SPAPR_XIVE(xsrc->xive);
> >> @@ -350,7 +376,7 @@ static void kvmppc_xive_source_get_state(XiveSourc=
e *xsrc)
> >>       for (i =3D 0; i < xsrc->nr_irqs; i++) {
> >>           uint8_t pq;
> >>  =20
> >> -        if (!xive_eas_is_valid(&xive->eat[i])) {
> >> +        if (!xive_source_is_initialized(xive, i)) {
> >>               continue;
> >>           }
> >>  =20
> >> @@ -533,7 +559,7 @@ static void kvmppc_xive_change_state_handler(void =
*opaque, bool running,
> >>               uint8_t pq;
> >>               uint8_t old_pq;
> >>  =20
> >> -            if (!xive_eas_is_valid(&xive->eat[i])) {
> >> +            if (!xive_source_is_initialized(xive, i)) {
> >>                   continue;
> >>               }
> >>  =20
> >> @@ -561,7 +587,7 @@ static void kvmppc_xive_change_state_handler(void =
*opaque, bool running,
> >>       for (i =3D 0; i < xsrc->nr_irqs; i++) {
> >>           uint8_t pq;
> >>  =20
> >> -        if (!xive_eas_is_valid(&xive->eat[i])) {
> >> +        if (!xive_source_is_initialized(xive, i)) {
> >>               continue;
> >>           }
> >>  =20
> >> @@ -666,7 +692,7 @@ int kvmppc_xive_post_load(SpaprXive *xive, int ver=
sion_id)
> >>  =20
> >>       /* Restore the EAT */
> >>       for (i =3D 0; i < xive->nr_irqs; i++) {
> >> -        if (!xive_eas_is_valid(&xive->eat[i])) {
> >> +        if (!xive_source_is_initialized(xive, i)) {
> >>               continue;
> >>           }
> >>  =20
> >=20
>=20


