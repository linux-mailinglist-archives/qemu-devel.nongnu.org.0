Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB3A32E90
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jun 2019 13:24:32 +0200 (CEST)
Received: from localhost ([127.0.0.1]:33301 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXl4p-0003tl-OH
	for lists+qemu-devel@lfdr.de; Mon, 03 Jun 2019 07:24:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48945)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1hXl2o-0002jP-Cc
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 07:22:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1hXky8-0000Nn-SH
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 07:17:38 -0400
Received: from 3.mo6.mail-out.ovh.net ([178.33.253.26]:55480)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <groug@kaod.org>) id 1hXky8-0000Ga-KI
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 07:17:36 -0400
Received: from player796.ha.ovh.net (unknown [10.108.54.38])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id 9C74D1CEC26
	for <qemu-devel@nongnu.org>; Mon,  3 Jun 2019 13:17:32 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
	[82.253.208.248]) (Authenticated sender: groug@kaod.org)
	by player796.ha.ovh.net (Postfix) with ESMTPSA id 99ACD652B494;
	Mon,  3 Jun 2019 11:17:24 +0000 (UTC)
Date: Mon, 3 Jun 2019 13:17:23 +0200
From: Greg Kurz <groug@kaod.org>
To: Aravinda Prasad <aravinda@linux.vnet.ibm.com>
Message-ID: <20190603131723.261eba99@bahia.lab.toulouse-stg.fr.ibm.com>
In-Reply-To: <20190603121243.687d8d75@bahia.lab.toulouse-stg.fr.ibm.com>
References: <155910829070.13149.5215948335633966328.stgit@aravinda>
	<155910841478.13149.2830700794862210739.stgit@aravinda>
	<20190603121243.687d8d75@bahia.lab.toulouse-stg.fr.ibm.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 129478490207066516
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrudefjedgfeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.33.253.26
Subject: Re: [Qemu-devel] [Qemu-ppc] [PATCH v9 1/6] ppc: spapr: Handle "ibm,
 nmi-register" and "ibm, nmi-interlock" RTAS calls
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
Cc: aik@au1.ibm.com, qemu-devel@nongnu.org, paulus@ozlabs.org,
	qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 3 Jun 2019 12:12:43 +0200
Greg Kurz <groug@kaod.org> wrote:

> On Wed, 29 May 2019 11:10:14 +0530
> Aravinda Prasad <aravinda@linux.vnet.ibm.com> wrote:
> 
> > This patch adds support in QEMU to handle "ibm,nmi-register"
> > and "ibm,nmi-interlock" RTAS calls.
> > 
> > The machine check notification address is saved when the
> > OS issues "ibm,nmi-register" RTAS call.
> > 
> > This patch also handles the case when multiple processors
> > experience machine check at or about the same time by
> > handling "ibm,nmi-interlock" call. In such cases, as per
> > PAPR, subsequent processors serialize waiting for the first
> > processor to issue the "ibm,nmi-interlock" call. The second
> > processor that also received a machine check error waits
> > till the first processor is done reading the error log.
> > The first processor issues "ibm,nmi-interlock" call
> > when the error log is consumed. This patch implements the
> > releasing part of the error-log while subsequent patch
> > (which builds error log) handles the locking part.
> > 
> > Signed-off-by: Aravinda Prasad <aravinda@linux.vnet.ibm.com>
> > Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> > ---  
> 
> The code looks okay but it still seems wrong to advertise the RTAS
> calls to the guest that early in the series. The linux kernel in
> the guest will assume FWNMI is functional, which isn't true until
> patch 6 (yes, migration is part of the feature, it should be
> supported upfront, not fixed afterwards).
> 
> It doesn't help much to introduce the RTAS calls early and to
> modify them in the other patches. I'd rather see the rest of
> the code first and a final patch that introduces the fully
> functional RTAS calls and calls spapr_rtas_register().
> 

Thinking again, you should introduce the "fwnmi-mce" spapr capability in
its own patch first, default to "off" and and have the last patch in the
series to switch the default to "on" for newer machine types only.

This patch should then only register the RTAS calls if "fwnmi-mcr" is set
to "on".

This should address the fact that we don't want to expose a partially
implemented FWNMI feature to the guest, and we don't want to support
FWNMI at all with older machine types for the sake of compatibility.

> >  hw/ppc/spapr.c         |    7 +++++
> >  hw/ppc/spapr_rtas.c    |   65 ++++++++++++++++++++++++++++++++++++++++++++++++
> >  include/hw/ppc/spapr.h |    9 ++++++-
> >  3 files changed, 80 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > index e2b33e5..fae28a9 100644
> > --- a/hw/ppc/spapr.c
> > +++ b/hw/ppc/spapr.c
> > @@ -1808,6 +1808,11 @@ static void spapr_machine_reset(void)
> >      first_ppc_cpu->env.gpr[5] = 0;
> >  
> >      spapr->cas_reboot = false;
> > +
> > +    spapr->guest_machine_check_addr = -1;
> > +
> > +    /* Signal all vCPUs waiting on this condition */
> > +    qemu_cond_broadcast(&spapr->mc_delivery_cond);
> >  }
> >  
> >  static void spapr_create_nvram(SpaprMachineState *spapr)
> > @@ -3072,6 +3077,8 @@ static void spapr_machine_init(MachineState *machine)
> >  
> >          kvmppc_spapr_enable_inkernel_multitce();
> >      }
> > +
> > +    qemu_cond_init(&spapr->mc_delivery_cond);
> >  }
> >  
> >  static int spapr_kvm_type(MachineState *machine, const char *vm_type)
> > diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> > index 5bc1a93..e7509cf 100644
> > --- a/hw/ppc/spapr_rtas.c
> > +++ b/hw/ppc/spapr_rtas.c
> > @@ -352,6 +352,38 @@ static void rtas_get_power_level(PowerPCCPU *cpu, SpaprMachineState *spapr,
> >      rtas_st(rets, 1, 100);
> >  }
> >  
> > +static void rtas_ibm_nmi_register(PowerPCCPU *cpu,
> > +                                  SpaprMachineState *spapr,
> > +                                  uint32_t token, uint32_t nargs,
> > +                                  target_ulong args,
> > +                                  uint32_t nret, target_ulong rets)
> > +{
> > +    hwaddr rtas_addr = spapr_get_rtas_addr();
> > +
> > +    if (!rtas_addr) {
> > +        rtas_st(rets, 0, RTAS_OUT_NOT_SUPPORTED);
> > +        return;
> > +    }
> > +
> > +    spapr->guest_machine_check_addr = rtas_ld(args, 1);
> > +    rtas_st(rets, 0, RTAS_OUT_SUCCESS);
> > +}
> > +
> > +static void rtas_ibm_nmi_interlock(PowerPCCPU *cpu,
> > +                                   SpaprMachineState *spapr,
> > +                                   uint32_t token, uint32_t nargs,
> > +                                   target_ulong args,
> > +                                   uint32_t nret, target_ulong rets)
> > +{
> > +    if (spapr->guest_machine_check_addr == -1) {
> > +        /* NMI register not called */
> > +        rtas_st(rets, 0, RTAS_OUT_PARAM_ERROR);
> > +    } else {
> > +        qemu_cond_signal(&spapr->mc_delivery_cond);
> > +        rtas_st(rets, 0, RTAS_OUT_SUCCESS);
> > +    }
> > +}
> > +
> >  static struct rtas_call {
> >      const char *name;
> >      spapr_rtas_fn fn;
> > @@ -470,6 +502,35 @@ void spapr_load_rtas(SpaprMachineState *spapr, void *fdt, hwaddr addr)
> >      }
> >  }
> >  
> > +hwaddr spapr_get_rtas_addr(void)
> > +{
> > +    SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
> > +    int rtas_node;
> > +    const struct fdt_property *rtas_addr_prop;
> > +    void *fdt = spapr->fdt_blob;
> > +    uint32_t rtas_addr;
> > +
> > +    /* fetch rtas addr from fdt */
> > +    rtas_node = fdt_path_offset(fdt, "/rtas");
> > +    if (rtas_node == 0) {
> > +        return 0;
> > +    }
> > +
> > +    rtas_addr_prop = fdt_get_property(fdt, rtas_node, "linux,rtas-base", NULL);
> > +    if (!rtas_addr_prop) {
> > +        return 0;
> > +    }
> > +
> > +    /*
> > +     * We assume that the OS called RTAS instantiate-rtas, but some other
> > +     * OS might call RTAS instantiate-rtas-64 instead. This fine as of now
> > +     * as SLOF only supports 32-bit variant.
> > +     */
> > +    rtas_addr = fdt32_to_cpu(*(uint32_t *)rtas_addr_prop->data);
> > +    return (hwaddr)rtas_addr;
> > +}
> > +
> > +
> >  static void core_rtas_register_types(void)
> >  {
> >      spapr_rtas_register(RTAS_DISPLAY_CHARACTER, "display-character",
> > @@ -493,6 +554,10 @@ static void core_rtas_register_types(void)
> >                          rtas_set_power_level);
> >      spapr_rtas_register(RTAS_GET_POWER_LEVEL, "get-power-level",
> >                          rtas_get_power_level);
> > +    spapr_rtas_register(RTAS_IBM_NMI_REGISTER, "ibm,nmi-register",
> > +                        rtas_ibm_nmi_register);
> > +    spapr_rtas_register(RTAS_IBM_NMI_INTERLOCK, "ibm,nmi-interlock",
> > +                        rtas_ibm_nmi_interlock);
> >  }
> >  
> >  type_init(core_rtas_register_types)
> > diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> > index 4f5becf..9dc5e30 100644
> > --- a/include/hw/ppc/spapr.h
> > +++ b/include/hw/ppc/spapr.h
> > @@ -188,6 +188,10 @@ struct SpaprMachineState {
> >       * occurs during the unplug process. */
> >      QTAILQ_HEAD(, SpaprDimmState) pending_dimm_unplugs;
> >  
> > +    /* State related to "ibm,nmi-register" and "ibm,nmi-interlock" calls */
> > +    target_ulong guest_machine_check_addr;
> > +    QemuCond mc_delivery_cond;
> > +
> >      /*< public >*/
> >      char *kvm_type;
> >      char *host_model;
> > @@ -624,8 +628,10 @@ target_ulong spapr_hypercall(PowerPCCPU *cpu, target_ulong opcode,
> >  #define RTAS_IBM_CREATE_PE_DMA_WINDOW           (RTAS_TOKEN_BASE + 0x27)
> >  #define RTAS_IBM_REMOVE_PE_DMA_WINDOW           (RTAS_TOKEN_BASE + 0x28)
> >  #define RTAS_IBM_RESET_PE_DMA_WINDOW            (RTAS_TOKEN_BASE + 0x29)
> > +#define RTAS_IBM_NMI_REGISTER                   (RTAS_TOKEN_BASE + 0x2A)
> > +#define RTAS_IBM_NMI_INTERLOCK                  (RTAS_TOKEN_BASE + 0x2B)
> >  
> > -#define RTAS_TOKEN_MAX                          (RTAS_TOKEN_BASE + 0x2A)
> > +#define RTAS_TOKEN_MAX                          (RTAS_TOKEN_BASE + 0x2C)
> >  
> >  /* RTAS ibm,get-system-parameter token values */
> >  #define RTAS_SYSPARM_SPLPAR_CHARACTERISTICS      20
> > @@ -876,4 +882,5 @@ void spapr_check_pagesize(SpaprMachineState *spapr, hwaddr pagesize,
> >  #define SPAPR_OV5_XIVE_BOTH     0x80 /* Only to advertise on the platform */
> >  
> >  void spapr_set_all_lpcrs(target_ulong value, target_ulong mask);
> > +uint64_t spapr_get_rtas_addr(void);
> >  #endif /* HW_SPAPR_H */
> >   
> 
> 


