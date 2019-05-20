Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B339A22CB9
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 09:14:58 +0200 (CEST)
Received: from localhost ([127.0.0.1]:59275 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hScVd-00008Z-Ti
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 03:14:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1hScUb-0008Ch-1W
	for qemu-devel@nongnu.org; Mon, 20 May 2019 03:13:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1hScUZ-0008T5-W4
	for qemu-devel@nongnu.org; Mon, 20 May 2019 03:13:53 -0400
Received: from 10.mo68.mail-out.ovh.net ([46.105.79.203]:41663)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <groug@kaod.org>) id 1hScUZ-0008Qp-R4
	for qemu-devel@nongnu.org; Mon, 20 May 2019 03:13:51 -0400
Received: from player772.ha.ovh.net (unknown [10.109.159.159])
	by mo68.mail-out.ovh.net (Postfix) with ESMTP id AF46912E5C6
	for <qemu-devel@nongnu.org>; Mon, 20 May 2019 09:13:41 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
	[82.253.208.248]) (Authenticated sender: groug@kaod.org)
	by player772.ha.ovh.net (Postfix) with ESMTPSA id A6CD05E876FD;
	Mon, 20 May 2019 07:13:34 +0000 (UTC)
Date: Mon, 20 May 2019 09:13:33 +0200
From: Greg Kurz <groug@kaod.org>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20190520091333.21254bc0@bahia.lan>
In-Reply-To: <6d4a50ac-168d-7390-a5f8-eb5d2d5738a7@redhat.com>
References: <20190520060550.29481-1-david@gibson.dropbear.id.au>
	<6d4a50ac-168d-7390-a5f8-eb5d2d5738a7@redhat.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 6027223680417241382
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddtjedguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.79.203
Subject: Re: [Qemu-devel] [PATCH] Fix phb_placement backwards compatibility
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: aik@ozlabs.ru, qemu-devel@nongnu.org, alex.williamson@redhat.com,
	qemu-ppc@nongnu.org, clg@kaod.org,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 20 May 2019 08:21:32 +0200
Laurent Vivier <lvivier@redhat.com> wrote:

> On 20/05/2019 08:05, David Gibson wrote:
> > When we added support for NVLink2 passthrough devices, we changed the
> > phb_placement hook to handle the placement of NVLink2 bridges' specific
> > resources.  For compatibility we use a version that doesn't do this
> > allocation  for old machine types.
> > 
> > However, because of the delay between when the patch was posted and when
> > it was merged, we ended up with that compatibility hook applying for
> > machine versions 3.1 and earlier whereas it should apply for 4.0 and
> > earlier (since the patch was applied early in the 4.1 tree).
> > 
> > Fixes: ec132efaa81 "spapr: Support NVIDIA V100 GPU with NVLink2"
> > 
> > Reported-by: Laurent Vivier <lvivier@redhat.com>
> > Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > ---

Reviewed-by: Greg Kurz <groug@kaod.org>

> >  hw/ppc/spapr.c | 28 +++++++++++++++-------------
> >  1 file changed, 15 insertions(+), 13 deletions(-)
> > 
> > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > index bcae30ad26..39e698e9b0 100644
> > --- a/hw/ppc/spapr.c
> > +++ b/hw/ppc/spapr.c
> > @@ -4411,18 +4411,7 @@ DEFINE_SPAPR_MACHINE(4_1, "4.1", true);
> >  /*
> >   * pseries-4.0
> >   */
> > -static void spapr_machine_4_0_class_options(MachineClass *mc)
> > -{
> > -    spapr_machine_4_1_class_options(mc);
> > -    compat_props_add(mc->compat_props, hw_compat_4_0, hw_compat_4_0_len);
> > -}
> > -
> > -DEFINE_SPAPR_MACHINE(4_0, "4.0", false);
> > -
> > -/*
> > - * pseries-3.1
> > - */
> > -static void phb_placement_3_1(SpaprMachineState *spapr, uint32_t index,
> > +static void phb_placement_4_0(SpaprMachineState *spapr, uint32_t index,
> >                                uint64_t *buid, hwaddr *pio,
> >                                hwaddr *mmio32, hwaddr *mmio64,
> >                                unsigned n_dma, uint32_t *liobns,
> > @@ -4434,6 +4423,20 @@ static void phb_placement_3_1(SpaprMachineState *spapr, uint32_t index,
> >      *nv2atsd = 0;
> >  }
> >  
> > +static void spapr_machine_4_0_class_options(MachineClass *mc)
> > +{
> > +    SpaprMachineClass *smc = SPAPR_MACHINE_CLASS(mc);
> > +
> > +    spapr_machine_4_1_class_options(mc);
> > +    compat_props_add(mc->compat_props, hw_compat_4_0, hw_compat_4_0_len);
> > +    smc->phb_placement = phb_placement_4_0;
> > +}
> > +
> > +DEFINE_SPAPR_MACHINE(4_0, "4.0", false);
> > +
> > +/*
> > + * pseries-3.1
> > + */
> >  static void spapr_machine_3_1_class_options(MachineClass *mc)
> >  {
> >      SpaprMachineClass *smc = SPAPR_MACHINE_CLASS(mc);
> > @@ -4449,7 +4452,6 @@ static void spapr_machine_3_1_class_options(MachineClass *mc)
> >      smc->default_caps.caps[SPAPR_CAP_SBBC] = SPAPR_CAP_BROKEN;
> >      smc->default_caps.caps[SPAPR_CAP_IBS] = SPAPR_CAP_BROKEN;
> >      smc->default_caps.caps[SPAPR_CAP_LARGE_DECREMENTER] = SPAPR_CAP_OFF;
> > -    smc->phb_placement = phb_placement_3_1;
> >  }
> >  
> >  DEFINE_SPAPR_MACHINE(3_1, "3.1", false);
> >   
> 
> Reviewed-by: Laurent Vivier <lvivier@redhat.com>
> 


