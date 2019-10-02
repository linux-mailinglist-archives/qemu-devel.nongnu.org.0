Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A81BFC4827
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Oct 2019 09:14:32 +0200 (CEST)
Received: from localhost ([::1]:52196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFYqF-0000ZC-E6
	for lists+qemu-devel@lfdr.de; Wed, 02 Oct 2019 03:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56135)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iFYpG-0008Ll-NB
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 03:13:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iFYpE-0000LI-RM
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 03:13:30 -0400
Received: from 3.mo4.mail-out.ovh.net ([46.105.57.129]:55064)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iFYpE-0000Jt-Kl
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 03:13:28 -0400
Received: from player759.ha.ovh.net (unknown [10.109.146.131])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 306EB20985D
 for <qemu-devel@nongnu.org>; Wed,  2 Oct 2019 09:13:25 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player759.ha.ovh.net (Postfix) with ESMTPSA id 087D1A7F815C;
 Wed,  2 Oct 2019 07:13:11 +0000 (UTC)
Date: Wed, 2 Oct 2019 09:13:10 +0200
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v3 22/34] spapr, xics, xive: Move cpu_intc_create from
 SpaprIrq to SpaprInterruptController
Message-ID: <20191002091310.0e362825@bahia.lan>
In-Reply-To: <20191002025208.3487-23-david@gibson.dropbear.id.au>
References: <20191002025208.3487-1-david@gibson.dropbear.id.au>
 <20191002025208.3487-23-david@gibson.dropbear.id.au>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 5626403310341298662
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrgeehgdduudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.57.129
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
 clg@kaod.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed,  2 Oct 2019 12:51:56 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> This method essentially represents code which belongs to the interrupt
> controller, but needs to be called on all possible intcs, rather than
> just the currently active one.  The "dual" version therefore calls
> into the xics and xive versions confusingly.
> 
> Handle this more directly, by making it instead a method on the intc
> backend, and always calling it on every backend that exists.
> 
> While we're there, streamline the error reporting a bit.
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/intc/spapr_xive.c       | 25 ++++++++++++
>  hw/intc/xics_spapr.c       | 18 +++++++++
>  hw/ppc/spapr_cpu_core.c    |  3 +-
>  hw/ppc/spapr_irq.c         | 81 +++++++++++---------------------------
>  include/hw/ppc/spapr_irq.h | 13 +++++-
>  5 files changed, 79 insertions(+), 61 deletions(-)
> 
> diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
> index b67e9c3245..9338daba3d 100644
> --- a/hw/intc/spapr_xive.c
> +++ b/hw/intc/spapr_xive.c
> @@ -495,10 +495,33 @@ static Property spapr_xive_properties[] = {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> +static int spapr_xive_cpu_intc_create(SpaprInterruptController *intc,
> +                                      PowerPCCPU *cpu, Error **errp)
> +{
> +    SpaprXive *xive = SPAPR_XIVE(intc);
> +    Object *obj;
> +    SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
> +
> +    obj = xive_tctx_create(OBJECT(cpu), XIVE_ROUTER(xive), errp);
> +    if (!obj) {
> +        return -1;
> +    }
> +
> +    spapr_cpu->tctx = XIVE_TCTX(obj);
> +
> +    /*
> +     * (TCG) Early setting the OS CAM line for hotplugged CPUs as they
> +     * don't beneficiate from the reset of the XIVE IRQ backend
> +     */
> +    spapr_xive_set_tctx_os_cam(spapr_cpu->tctx);
> +    return 0;
> +}
> +
>  static void spapr_xive_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>      XiveRouterClass *xrc = XIVE_ROUTER_CLASS(klass);
> +    SpaprInterruptControllerClass *sicc = SPAPR_INTC_CLASS(klass);
>  
>      dc->desc    = "sPAPR XIVE Interrupt Controller";
>      dc->props   = spapr_xive_properties;
> @@ -511,6 +534,8 @@ static void spapr_xive_class_init(ObjectClass *klass, void *data)
>      xrc->get_nvt = spapr_xive_get_nvt;
>      xrc->write_nvt = spapr_xive_write_nvt;
>      xrc->get_tctx = spapr_xive_get_tctx;
> +
> +    sicc->cpu_intc_create = spapr_xive_cpu_intc_create;
>  }
>  
>  static const TypeInfo spapr_xive_info = {
> diff --git a/hw/intc/xics_spapr.c b/hw/intc/xics_spapr.c
> index 4874e6be55..946311b858 100644
> --- a/hw/intc/xics_spapr.c
> +++ b/hw/intc/xics_spapr.c
> @@ -330,13 +330,31 @@ void spapr_dt_xics(SpaprMachineState *spapr, uint32_t nr_servers, void *fdt,
>      _FDT(fdt_setprop_cell(fdt, node, "phandle", phandle));
>  }
>  
> +static int xics_spapr_cpu_intc_create(SpaprInterruptController *intc,
> +                                       PowerPCCPU *cpu, Error **errp)
> +{
> +    ICSState *ics = ICS_SPAPR(intc);
> +    Object *obj;
> +    SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
> +
> +    obj = icp_create(OBJECT(cpu), TYPE_ICP, ics->xics, errp);
> +    if (!obj) {
> +        return -1;
> +    }
> +
> +    spapr_cpu->icp = ICP(obj);
> +    return 0;
> +}
> +
>  static void ics_spapr_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>      ICSStateClass *isc = ICS_CLASS(klass);
> +    SpaprInterruptControllerClass *sicc = SPAPR_INTC_CLASS(klass);
>  
>      device_class_set_parent_realize(dc, ics_spapr_realize,
>                                      &isc->parent_realize);
> +    sicc->cpu_intc_create = xics_spapr_cpu_intc_create;
>  }
>  
>  static const TypeInfo ics_spapr_info = {
> diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
> index 1d93de8161..3e4302c7d5 100644
> --- a/hw/ppc/spapr_cpu_core.c
> +++ b/hw/ppc/spapr_cpu_core.c
> @@ -237,8 +237,7 @@ static void spapr_realize_vcpu(PowerPCCPU *cpu, SpaprMachineState *spapr,
>      qemu_register_reset(spapr_cpu_reset, cpu);
>      spapr_cpu_reset(cpu);
>  
> -    spapr->irq->cpu_intc_create(spapr, cpu, &local_err);
> -    if (local_err) {
> +    if (spapr_irq_cpu_intc_create(spapr, cpu, &local_err) < 0) {
>          goto error_unregister;
>      }
>  
> diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
> index 8791dec1ba..9cb2fc71ca 100644
> --- a/hw/ppc/spapr_irq.c
> +++ b/hw/ppc/spapr_irq.c
> @@ -138,23 +138,6 @@ static void spapr_irq_print_info_xics(SpaprMachineState *spapr, Monitor *mon)
>      ics_pic_print_info(spapr->ics, mon);
>  }
>  
> -static void spapr_irq_cpu_intc_create_xics(SpaprMachineState *spapr,
> -                                           PowerPCCPU *cpu, Error **errp)
> -{
> -    Error *local_err = NULL;
> -    Object *obj;
> -    SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
> -
> -    obj = icp_create(OBJECT(cpu), TYPE_ICP, XICS_FABRIC(spapr),
> -                     &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> -        return;
> -    }
> -
> -    spapr_cpu->icp = ICP(obj);
> -}
> -
>  static int spapr_irq_post_load_xics(SpaprMachineState *spapr, int version_id)
>  {
>      if (!kvm_irqchip_in_kernel()) {
> @@ -203,7 +186,6 @@ SpaprIrq spapr_irq_xics = {
>      .free        = spapr_irq_free_xics,
>      .print_info  = spapr_irq_print_info_xics,
>      .dt_populate = spapr_dt_xics,
> -    .cpu_intc_create = spapr_irq_cpu_intc_create_xics,
>      .post_load   = spapr_irq_post_load_xics,
>      .reset       = spapr_irq_reset_xics,
>      .set_irq     = spapr_irq_set_irq_xics,
> @@ -239,28 +221,6 @@ static void spapr_irq_print_info_xive(SpaprMachineState *spapr,
>      spapr_xive_pic_print_info(spapr->xive, mon);
>  }
>  
> -static void spapr_irq_cpu_intc_create_xive(SpaprMachineState *spapr,
> -                                           PowerPCCPU *cpu, Error **errp)
> -{
> -    Error *local_err = NULL;
> -    Object *obj;
> -    SpaprCpuState *spapr_cpu = spapr_cpu_state(cpu);
> -
> -    obj = xive_tctx_create(OBJECT(cpu), XIVE_ROUTER(spapr->xive), &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> -        return;
> -    }
> -
> -    spapr_cpu->tctx = XIVE_TCTX(obj);
> -
> -    /*
> -     * (TCG) Early setting the OS CAM line for hotplugged CPUs as they
> -     * don't beneficiate from the reset of the XIVE IRQ backend
> -     */
> -    spapr_xive_set_tctx_os_cam(spapr_cpu->tctx);
> -}
> -
>  static int spapr_irq_post_load_xive(SpaprMachineState *spapr, int version_id)
>  {
>      return spapr_xive_post_load(spapr->xive, version_id);
> @@ -316,7 +276,6 @@ SpaprIrq spapr_irq_xive = {
>      .free        = spapr_irq_free_xive,
>      .print_info  = spapr_irq_print_info_xive,
>      .dt_populate = spapr_dt_xive,
> -    .cpu_intc_create = spapr_irq_cpu_intc_create_xive,
>      .post_load   = spapr_irq_post_load_xive,
>      .reset       = spapr_irq_reset_xive,
>      .set_irq     = spapr_irq_set_irq_xive,
> @@ -381,20 +340,6 @@ static void spapr_irq_dt_populate_dual(SpaprMachineState *spapr,
>      spapr_irq_current(spapr)->dt_populate(spapr, nr_servers, fdt, phandle);
>  }
>  
> -static void spapr_irq_cpu_intc_create_dual(SpaprMachineState *spapr,
> -                                           PowerPCCPU *cpu, Error **errp)
> -{
> -    Error *local_err = NULL;
> -
> -    spapr_irq_xive.cpu_intc_create(spapr, cpu, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> -        return;
> -    }
> -
> -    spapr_irq_xics.cpu_intc_create(spapr, cpu, errp);
> -}
> -
>  static int spapr_irq_post_load_dual(SpaprMachineState *spapr, int version_id)
>  {
>      /*
> @@ -460,7 +405,6 @@ SpaprIrq spapr_irq_dual = {
>      .free        = spapr_irq_free_dual,
>      .print_info  = spapr_irq_print_info_dual,
>      .dt_populate = spapr_irq_dt_populate_dual,
> -    .cpu_intc_create = spapr_irq_cpu_intc_create_dual,
>      .post_load   = spapr_irq_post_load_dual,
>      .reset       = spapr_irq_reset_dual,
>      .set_irq     = spapr_irq_set_irq_dual,
> @@ -527,6 +471,30 @@ static int spapr_irq_check(SpaprMachineState *spapr, Error **errp)
>  /*
>   * sPAPR IRQ frontend routines for devices
>   */
> +#define ALL_INTCS(spapr_) \
> +    { SPAPR_INTC((spapr_)->ics), SPAPR_INTC((spapr_)->xive), }
> +
> +int spapr_irq_cpu_intc_create(SpaprMachineState *spapr,
> +                              PowerPCCPU *cpu, Error **errp)
> +{
> +    SpaprInterruptController *intcs[] = ALL_INTCS(spapr);
> +    int i;
> +    int rc;
> +
> +    for (i = 0; i < ARRAY_SIZE(intcs); i++) {
> +        SpaprInterruptController *intc = intcs[i];
> +        if (intc) {
> +            SpaprInterruptControllerClass *sicc = SPAPR_INTC_GET_CLASS(intc);
> +            rc = sicc->cpu_intc_create(intc, cpu, errp);
> +            if (rc < 0) {
> +                return rc;
> +            }
> +        }
> +    }
> +
> +    return 0;
> +}
> +
>  void spapr_irq_init(SpaprMachineState *spapr, Error **errp)
>  {
>      MachineState *machine = MACHINE(spapr);
> @@ -762,7 +730,6 @@ SpaprIrq spapr_irq_xics_legacy = {
>      .free        = spapr_irq_free_xics,
>      .print_info  = spapr_irq_print_info_xics,
>      .dt_populate = spapr_dt_xics,
> -    .cpu_intc_create = spapr_irq_cpu_intc_create_xics,
>      .post_load   = spapr_irq_post_load_xics,
>      .reset       = spapr_irq_reset_xics,
>      .set_irq     = spapr_irq_set_irq_xics,
> diff --git a/include/hw/ppc/spapr_irq.h b/include/hw/ppc/spapr_irq.h
> index b9398e0be3..5e641e23c1 100644
> --- a/include/hw/ppc/spapr_irq.h
> +++ b/include/hw/ppc/spapr_irq.h
> @@ -43,8 +43,19 @@ typedef struct SpaprInterruptController SpaprInterruptController;
>  
>  typedef struct SpaprInterruptControllerClass {
>      InterfaceClass parent;
> +
> +    /*
> +     * These methods will typically be called on all intcs, active and
> +     * inactive
> +     */
> +    int (*cpu_intc_create)(SpaprInterruptController *intc,
> +                            PowerPCCPU *cpu, Error **errp);
>  } SpaprInterruptControllerClass;
>  
> +int spapr_irq_cpu_intc_create(SpaprMachineState *spapr,
> +                              PowerPCCPU *cpu, Error **errp);
> +
> +
>  void spapr_irq_msi_init(SpaprMachineState *spapr, uint32_t nr_msis);
>  int spapr_irq_msi_alloc(SpaprMachineState *spapr, uint32_t num, bool align,
>                          Error **errp);
> @@ -61,8 +72,6 @@ typedef struct SpaprIrq {
>      void (*print_info)(SpaprMachineState *spapr, Monitor *mon);
>      void (*dt_populate)(SpaprMachineState *spapr, uint32_t nr_servers,
>                          void *fdt, uint32_t phandle);
> -    void (*cpu_intc_create)(SpaprMachineState *spapr, PowerPCCPU *cpu,
> -                            Error **errp);
>      int (*post_load)(SpaprMachineState *spapr, int version_id);
>      void (*reset)(SpaprMachineState *spapr, Error **errp);
>      void (*set_irq)(void *opaque, int srcno, int val);


