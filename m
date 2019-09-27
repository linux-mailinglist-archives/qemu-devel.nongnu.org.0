Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B69B1C05EE
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 15:02:53 +0200 (CEST)
Received: from localhost ([::1]:49910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDptb-00036M-Sq
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 09:02:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52156)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iDpk6-00030n-48
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 08:53:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iDpk2-0001Qk-AH
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 08:53:00 -0400
Received: from 9.mo7.mail-out.ovh.net ([46.105.60.248]:36852)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iDpk1-0001Po-QW
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 08:52:58 -0400
Received: from player788.ha.ovh.net (unknown [10.108.35.110])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 6137A134F9A
 for <qemu-devel@nongnu.org>; Fri, 27 Sep 2019 14:16:24 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player788.ha.ovh.net (Postfix) with ESMTPSA id C80BEA46E123;
 Fri, 27 Sep 2019 12:16:13 +0000 (UTC)
Date: Fri, 27 Sep 2019 14:16:12 +0200
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2 22/33] spapr, xics, xive: Move irq claim and free
 from SpaprIrq to SpaprInterruptController
Message-ID: <20190927141612.4acb340c@bahia.lan>
In-Reply-To: <20190927055028.11493-23-david@gibson.dropbear.id.au>
References: <20190927055028.11493-1-david@gibson.dropbear.id.au>
 <20190927055028.11493-23-david@gibson.dropbear.id.au>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 18273074014143355366
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrfeeigdeglecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.60.248
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
Cc: Jason Wang <jasowang@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 clg@kaod.org,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 27 Sep 2019 15:50:17 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> These methods, like cpu_intc_create, really belong to the interrupt
> controller, but need to be called on all possible intcs.
> 
> Like cpu_intc_create, therefore, make them methods on the intc and
> always call it for all existing intcs.
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  hw/intc/spapr_xive.c        |  71 +++++++++++-----------
>  hw/intc/xics_spapr.c        |  29 +++++++++
>  hw/ppc/spapr_irq.c          | 114 ++++++++++++------------------------
>  include/hw/ppc/spapr_irq.h  |   5 +-
>  include/hw/ppc/spapr_xive.h |   2 -
>  5 files changed, 107 insertions(+), 114 deletions(-)
> 
> diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
> index 9338daba3d..ff1a175b44 100644
> --- a/hw/intc/spapr_xive.c
> +++ b/hw/intc/spapr_xive.c
> @@ -487,6 +487,42 @@ static const VMStateDescription vmstate_spapr_xive = {
>      },
>  };
>  
> +static int spapr_xive_claim_irq(SpaprInterruptController *intc, int lisn,
> +                                bool lsi, Error **errp)
> +{
> +    SpaprXive *xive = SPAPR_XIVE(intc);
> +    XiveSource *xsrc = &xive->source;
> +
> +    assert(lisn < xive->nr_irqs);
> +
> +    if (xive_eas_is_valid(&xive->eat[lisn])) {
> +        error_setg(errp, "IRQ %d is not free", lisn);
> +        return -EBUSY;
> +    }
> +
> +    /*
> +     * Set default values when allocating an IRQ number
> +     */
> +    xive->eat[lisn].w |= cpu_to_be64(EAS_VALID | EAS_MASKED);
> +    if (lsi) {
> +        xive_source_irq_set_lsi(xsrc, lisn);
> +    }
> +
> +    if (kvm_irqchip_in_kernel()) {
> +        return kvmppc_xive_source_reset_one(xsrc, lisn, errp);
> +    }
> +
> +    return 0;
> +}
> +
> +static void spapr_xive_free_irq(SpaprInterruptController *intc, int lisn)
> +{
> +    SpaprXive *xive = SPAPR_XIVE(intc);
> +    assert(lisn < xive->nr_irqs);
> +
> +    xive->eat[lisn].w &= cpu_to_be64(~EAS_VALID);
> +}
> +
>  static Property spapr_xive_properties[] = {
>      DEFINE_PROP_UINT32("nr-irqs", SpaprXive, nr_irqs, 0),
>      DEFINE_PROP_UINT32("nr-ends", SpaprXive, nr_ends, 0),
> @@ -536,6 +572,8 @@ static void spapr_xive_class_init(ObjectClass *klass, void *data)
>      xrc->get_tctx = spapr_xive_get_tctx;
>  
>      sicc->cpu_intc_create = spapr_xive_cpu_intc_create;
> +    sicc->claim_irq = spapr_xive_claim_irq;
> +    sicc->free_irq = spapr_xive_free_irq;
>  }
>  
>  static const TypeInfo spapr_xive_info = {
> @@ -557,39 +595,6 @@ static void spapr_xive_register_types(void)
>  
>  type_init(spapr_xive_register_types)
>  
> -int spapr_xive_irq_claim(SpaprXive *xive, int lisn, bool lsi, Error **errp)
> -{
> -    XiveSource *xsrc = &xive->source;
> -
> -    assert(lisn < xive->nr_irqs);
> -
> -    if (xive_eas_is_valid(&xive->eat[lisn])) {
> -        error_setg(errp, "IRQ %d is not free", lisn);
> -        return -EBUSY;
> -    }
> -
> -    /*
> -     * Set default values when allocating an IRQ number
> -     */
> -    xive->eat[lisn].w |= cpu_to_be64(EAS_VALID | EAS_MASKED);
> -    if (lsi) {
> -        xive_source_irq_set_lsi(xsrc, lisn);
> -    }
> -
> -    if (kvm_irqchip_in_kernel()) {
> -        return kvmppc_xive_source_reset_one(xsrc, lisn, errp);
> -    }
> -
> -    return 0;
> -}
> -
> -void spapr_xive_irq_free(SpaprXive *xive, int lisn)
> -{
> -    assert(lisn < xive->nr_irqs);
> -
> -    xive->eat[lisn].w &= cpu_to_be64(~EAS_VALID);
> -}
> -
>  /*
>   * XIVE hcalls
>   *
> diff --git a/hw/intc/xics_spapr.c b/hw/intc/xics_spapr.c
> index 946311b858..224fe1efcd 100644
> --- a/hw/intc/xics_spapr.c
> +++ b/hw/intc/xics_spapr.c
> @@ -346,6 +346,33 @@ static int xics_spapr_cpu_intc_create(SpaprInterruptController *intc,
>      return 0;
>  }
>  
> +static int xics_spapr_claim_irq(SpaprInterruptController *intc, int irq,
> +                                bool lsi, Error **errp)
> +{
> +    ICSState *ics = ICS_SPAPR(intc);
> +
> +    assert(ics);
> +    assert(ics_valid_irq(ics, irq));
> +
> +    if (!ics_irq_free(ics, irq - ics->offset)) {
> +        error_setg(errp, "IRQ %d is not free", irq);
> +        return -EBUSY;
> +    }
> +
> +    ics_set_irq_type(ics, irq - ics->offset, lsi);
> +    return 0;
> +}
> +
> +static void xics_spapr_free_irq(SpaprInterruptController *intc, int irq)
> +{
> +    ICSState *ics = ICS_SPAPR(intc);
> +    uint32_t srcno = irq - ics->offset;
> +
> +    assert(ics_valid_irq(ics, irq));
> +
> +    memset(&ics->irqs[srcno], 0, sizeof(ICSIRQState));
> +}
> +
>  static void ics_spapr_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -355,6 +382,8 @@ static void ics_spapr_class_init(ObjectClass *klass, void *data)
>      device_class_set_parent_realize(dc, ics_spapr_realize,
>                                      &isc->parent_realize);
>      sicc->cpu_intc_create = xics_spapr_cpu_intc_create;
> +    sicc->claim_irq = xics_spapr_claim_irq;
> +    sicc->free_irq = xics_spapr_free_irq;
>  }
>  
>  static const TypeInfo ics_spapr_info = {
> diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
> index a855dfe4e9..ea44378d8c 100644
> --- a/hw/ppc/spapr_irq.c
> +++ b/hw/ppc/spapr_irq.c
> @@ -98,33 +98,6 @@ static void spapr_irq_init_kvm(SpaprMachineState *spapr,
>   * XICS IRQ backend.
>   */
>  
> -static int spapr_irq_claim_xics(SpaprMachineState *spapr, int irq, bool lsi,
> -                                Error **errp)
> -{
> -    ICSState *ics = spapr->ics;
> -
> -    assert(ics);
> -    assert(ics_valid_irq(ics, irq));
> -
> -    if (!ics_irq_free(ics, irq - ics->offset)) {
> -        error_setg(errp, "IRQ %d is not free", irq);
> -        return -1;
> -    }
> -
> -    ics_set_irq_type(ics, irq - ics->offset, lsi);
> -    return 0;
> -}
> -
> -static void spapr_irq_free_xics(SpaprMachineState *spapr, int irq)
> -{
> -    ICSState *ics = spapr->ics;
> -    uint32_t srcno = irq - ics->offset;
> -
> -    assert(ics_valid_irq(ics, irq));
> -
> -    memset(&ics->irqs[srcno], 0, sizeof(ICSIRQState));
> -}
> -
>  static void spapr_irq_print_info_xics(SpaprMachineState *spapr, Monitor *mon)
>  {
>      CPUState *cs;
> @@ -182,8 +155,6 @@ SpaprIrq spapr_irq_xics = {
>      .xics        = true,
>      .xive        = false,
>  
> -    .claim       = spapr_irq_claim_xics,
> -    .free        = spapr_irq_free_xics,
>      .print_info  = spapr_irq_print_info_xics,
>      .dt_populate = spapr_dt_xics,
>      .post_load   = spapr_irq_post_load_xics,
> @@ -196,17 +167,6 @@ SpaprIrq spapr_irq_xics = {
>   * XIVE IRQ backend.
>   */
>  
> -static int spapr_irq_claim_xive(SpaprMachineState *spapr, int irq, bool lsi,
> -                                Error **errp)
> -{
> -    return spapr_xive_irq_claim(spapr->xive, irq, lsi, errp);
> -}
> -
> -static void spapr_irq_free_xive(SpaprMachineState *spapr, int irq)
> -{
> -    spapr_xive_irq_free(spapr->xive, irq);
> -}
> -
>  static void spapr_irq_print_info_xive(SpaprMachineState *spapr,
>                                        Monitor *mon)
>  {
> @@ -272,8 +232,6 @@ SpaprIrq spapr_irq_xive = {
>      .xics        = false,
>      .xive        = true,
>  
> -    .claim       = spapr_irq_claim_xive,
> -    .free        = spapr_irq_free_xive,
>      .print_info  = spapr_irq_print_info_xive,
>      .dt_populate = spapr_dt_xive,
>      .post_load   = spapr_irq_post_load_xive,
> @@ -301,33 +259,6 @@ static SpaprIrq *spapr_irq_current(SpaprMachineState *spapr)
>          &spapr_irq_xive : &spapr_irq_xics;
>  }
>  
> -static int spapr_irq_claim_dual(SpaprMachineState *spapr, int irq, bool lsi,
> -                                Error **errp)
> -{
> -    Error *local_err = NULL;
> -    int ret;
> -
> -    ret = spapr_irq_xics.claim(spapr, irq, lsi, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> -        return ret;
> -    }
> -
> -    ret = spapr_irq_xive.claim(spapr, irq, lsi, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> -        return ret;
> -    }
> -
> -    return ret;
> -}
> -
> -static void spapr_irq_free_dual(SpaprMachineState *spapr, int irq)
> -{
> -    spapr_irq_xics.free(spapr, irq);
> -    spapr_irq_xive.free(spapr, irq);
> -}
> -
>  static void spapr_irq_print_info_dual(SpaprMachineState *spapr, Monitor *mon)
>  {
>      spapr_irq_current(spapr)->print_info(spapr, mon);
> @@ -401,8 +332,6 @@ SpaprIrq spapr_irq_dual = {
>      .xics        = true,
>      .xive        = true,
>  
> -    .claim       = spapr_irq_claim_dual,
> -    .free        = spapr_irq_free_dual,
>      .print_info  = spapr_irq_print_info_dual,
>      .dt_populate = spapr_irq_dt_populate_dual,
>      .post_load   = spapr_irq_post_load_dual,
> @@ -567,10 +496,12 @@ void spapr_irq_init(SpaprMachineState *spapr, Error **errp)
>  
>          /* Enable the CPU IPIs */
>          for (i = 0; i < nr_servers; ++i) {
> +            SpaprInterruptControllerClass *sicc
> +                = SPAPR_INTC_GET_CLASS(spapr->xive);
>              Error *local_err = NULL;
>  
> -            spapr_xive_irq_claim(spapr->xive, SPAPR_IRQ_IPI + i,
> -                                 false, &local_err);
> +            sicc->claim_irq(SPAPR_INTC(spapr->xive), SPAPR_IRQ_IPI + i,
> +                            false, &local_err);
>              if (local_err) {
>                  goto out;
>              }
> @@ -588,10 +519,30 @@ out:
>  
>  int spapr_irq_claim(SpaprMachineState *spapr, int irq, bool lsi, Error **errp)
>  {
> +    int rc;
> +
>      assert(irq >= SPAPR_XIRQ_BASE);
>      assert(irq < (spapr->irq->nr_xirqs + SPAPR_XIRQ_BASE));
>  
> -    return spapr->irq->claim(spapr, irq, lsi, errp);
> +    if (spapr->xive) {
> +        SpaprInterruptControllerClass *sicc = SPAPR_INTC_GET_CLASS(spapr->xive);
> +
> +        rc = sicc->claim_irq(SPAPR_INTC(spapr->xive), irq, lsi, errp);
> +        if (rc < 0) {
> +            return rc;
> +        }
> +    }
> +
> +    if (spapr->ics) {
> +        SpaprInterruptControllerClass *sicc = SPAPR_INTC_GET_CLASS(spapr->ics);
> +
> +        rc = sicc->claim_irq(SPAPR_INTC(spapr->ics), irq, lsi, errp);
> +        if (rc < 0) {
> +            return rc;
> +        }
> +    }
> +

We don't really need an indirection here since we explicitly check
spapr->xive and spapr->ics. Calling directly spapr_xive_claim_irq() and
xics_spapr_claim_irq() would allow to avoid the method boiler plate and
be more explicit IMHO.

> +    return 0;
>  }
>  
>  void spapr_irq_free(SpaprMachineState *spapr, int irq, int num)
> @@ -602,7 +553,18 @@ void spapr_irq_free(SpaprMachineState *spapr, int irq, int num)
>      assert((irq + num) <= (spapr->irq->nr_xirqs + SPAPR_XIRQ_BASE));
>  
>      for (i = irq; i < (irq + num); i++) {
> -        spapr->irq->free(spapr, irq);
> +        if (spapr->xive) {
> +            SpaprInterruptController *intc = SPAPR_INTC(spapr->xive);
> +            SpaprInterruptControllerClass *sicc = SPAPR_INTC_GET_CLASS(intc);
> +
> +            sicc->free_irq(intc, irq);
> +        }
> +        if (spapr->ics) {
> +            SpaprInterruptController *intc = SPAPR_INTC(spapr->ics);
> +            SpaprInterruptControllerClass *sicc = SPAPR_INTC_GET_CLASS(intc);
> +
> +            sicc->free_irq(intc, irq);
> +        }

Same here.

>      }
>  }
>  
> @@ -727,8 +689,6 @@ SpaprIrq spapr_irq_xics_legacy = {
>      .xics        = true,
>      .xive        = false,
>  
> -    .claim       = spapr_irq_claim_xics,
> -    .free        = spapr_irq_free_xics,
>      .print_info  = spapr_irq_print_info_xics,
>      .dt_populate = spapr_dt_xics,
>      .post_load   = spapr_irq_post_load_xics,
> diff --git a/include/hw/ppc/spapr_irq.h b/include/hw/ppc/spapr_irq.h
> index 30d660ff1e..616086f9bb 100644
> --- a/include/hw/ppc/spapr_irq.h
> +++ b/include/hw/ppc/spapr_irq.h
> @@ -50,6 +50,9 @@ typedef struct SpaprInterruptControllerClass {
>       */
>      int (*cpu_intc_create)(SpaprInterruptController *intc,
>                              PowerPCCPU *cpu, Error **errp);
> +    int (*claim_irq)(SpaprInterruptController *intc, int irq, bool lsi,
> +                     Error **errp);
> +    void (*free_irq)(SpaprInterruptController *intc, int irq);
>  } SpaprInterruptControllerClass;
>  
>  void spapr_irq_print_info(SpaprMachineState *spapr, Monitor *mon);
> @@ -70,8 +73,6 @@ typedef struct SpaprIrq {
>      bool        xics;
>      bool        xive;
>  
> -    int (*claim)(SpaprMachineState *spapr, int irq, bool lsi, Error **errp);
> -    void (*free)(SpaprMachineState *spapr, int irq);
>      void (*print_info)(SpaprMachineState *spapr, Monitor *mon);
>      void (*dt_populate)(SpaprMachineState *spapr, uint32_t nr_servers,
>                          void *fdt, uint32_t phandle);
> diff --git a/include/hw/ppc/spapr_xive.h b/include/hw/ppc/spapr_xive.h
> index 0df20a6590..8f875673f5 100644
> --- a/include/hw/ppc/spapr_xive.h
> +++ b/include/hw/ppc/spapr_xive.h
> @@ -54,8 +54,6 @@ typedef struct SpaprXive {
>   */
>  #define SPAPR_XIVE_BLOCK_ID 0x0
>  
> -int spapr_xive_irq_claim(SpaprXive *xive, int lisn, bool lsi, Error **errp);
> -void spapr_xive_irq_free(SpaprXive *xive, int lisn);
>  void spapr_xive_pic_print_info(SpaprXive *xive, Monitor *mon);
>  int spapr_xive_post_load(SpaprXive *xive, int version_id);
>  


