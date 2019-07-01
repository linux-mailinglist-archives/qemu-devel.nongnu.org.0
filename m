Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDAC523E5
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jun 2019 09:04:19 +0200 (CEST)
Received: from localhost ([::1]:56996 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hffV4-0000uv-SX
	for lists+qemu-devel@lfdr.de; Tue, 25 Jun 2019 03:04:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57650)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <groug@kaod.org>) id 1hffRY-00083K-Q6
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 03:00:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1hffRW-00066h-Ia
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 03:00:40 -0400
Received: from 10.mo69.mail-out.ovh.net ([46.105.73.241]:41135)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1hffRW-00065N-B2
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 03:00:38 -0400
Received: from player698.ha.ovh.net (unknown [10.109.146.163])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 0EECB5CEA2
 for <qemu-devel@nongnu.org>; Tue, 25 Jun 2019 09:00:34 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player698.ha.ovh.net (Postfix) with ESMTPSA id 0FE99730AAAF;
 Tue, 25 Jun 2019 07:00:25 +0000 (UTC)
Date: Tue, 25 Jun 2019 09:00:23 +0200
From: Greg Kurz <groug@kaod.org>
To: Aravinda Prasad <aravinda@linux.vnet.ibm.com>
Message-ID: <20190625090023.10c26982@bahia.lan>
In-Reply-To: <658ed3c3-9722-e23a-b65c-89df6025461e@linux.vnet.ibm.com>
References: <156033104292.26635.15759339817253067370.stgit@aravinda>
 <156033129836.26635.3348706829139659071.stgit@aravinda>
 <20190624162935.02d08837@bahia.lan>
 <658ed3c3-9722-e23a-b65c-89df6025461e@linux.vnet.ibm.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 14308498969527097748
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudefgdduudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.73.241
Subject: Re: [Qemu-devel] [PATCH v10 6/6] ppc: spapr: Handle "ibm,
 nmi-register" and "ibm, nmi-interlock" RTAS calls
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
Cc: aik@au1.ibm.com, qemu-devel@nongnu.org, paulus@ozlabs.org,
 qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 25 Jun 2019 11:46:06 +0530
Aravinda Prasad <aravinda@linux.vnet.ibm.com> wrote:

> On Monday 24 June 2019 07:59 PM, Greg Kurz wrote:
> > On Wed, 12 Jun 2019 14:51:38 +0530
> > Aravinda Prasad <aravinda@linux.vnet.ibm.com> wrote:
> >   
> >> This patch adds support in QEMU to handle "ibm,nmi-register"
> >> and "ibm,nmi-interlock" RTAS calls and sets the default
> >> value of SPAPR_CAP_FWNMI_MCE to SPAPR_CAP_ON for machine
> >> type 4.0.
> >>  
> > 
> > Next machine type is 4.1.  
> 
> ok.
> 
> >   
> >> The machine check notification address is saved when the
> >> OS issues "ibm,nmi-register" RTAS call.
> >>
> >> This patch also handles the case when multiple processors
> >> experience machine check at or about the same time by
> >> handling "ibm,nmi-interlock" call. In such cases, as per
> >> PAPR, subsequent processors serialize waiting for the first
> >> processor to issue the "ibm,nmi-interlock" call. The second
> >> processor that also received a machine check error waits
> >> till the first processor is done reading the error log.
> >> The first processor issues "ibm,nmi-interlock" call
> >> when the error log is consumed.
> >>
> >> Signed-off-by: Aravinda Prasad <aravinda@linux.vnet.ibm.com>
> >> ---
> >>  hw/ppc/spapr.c         |    6 ++++-
> >>  hw/ppc/spapr_rtas.c    |   63 ++++++++++++++++++++++++++++++++++++++++++++++++
> >>  include/hw/ppc/spapr.h |    5 +++-
> >>  3 files changed, 72 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> >> index 3d6d139..213d493 100644
> >> --- a/hw/ppc/spapr.c
> >> +++ b/hw/ppc/spapr.c
> >> @@ -2946,6 +2946,9 @@ static void spapr_machine_init(MachineState *machine)
> >>          /* Create the error string for live migration blocker */
> >>          error_setg(&spapr->fwnmi_migration_blocker,
> >>                  "Live migration not supported during machine check handling");
> >> +
> >> +        /* Register ibm,nmi-register and ibm,nmi-interlock RTAS calls */
> >> +        spapr_fwnmi_register();  
> > 
> > IIRC this was supposed to depend on SPAPR_CAP_FWNMI_MCE being ON.  
> 
> Yes this is inside SPAPR_CAP_FWNMI_MCE check:
> 
> if (spapr_get_cap(spapr, SPAPR_CAP_FWNMI_MCE) == SPAPR_CAP_ON) {
>     /*
>      * Ensure that the rtas image size is less than RTAS_ERROR_LOG_OFFSET
>      * or else the rtas image will be overwritten with the rtas error log
>      * when a machine check exception is encountered.
>      */
>     g_assert(spapr->rtas_size < RTAS_ERROR_LOG_OFFSET);
> 
>     /* Resize rtas blob to accommodate error log */
>     spapr->rtas_size = RTAS_ERROR_LOG_MAX;
> 
>     /* Create the error string for live migration blocker */
>     error_setg(&spapr->fwnmi_migration_blocker,
>             "Live migration not supported during machine check handling");
> 
>     /* Register ibm,nmi-register and ibm,nmi-interlock RTAS calls */
>     spapr_fwnmi_register();
> }
> 

Oops my bad... sorry for the noise.

> 
> >   
> >>      }
> >>  
> >>      spapr->rtas_blob = g_malloc(spapr->rtas_size);
> >> @@ -4408,7 +4411,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
> >>      smc->default_caps.caps[SPAPR_CAP_NESTED_KVM_HV] = SPAPR_CAP_OFF;
> >>      smc->default_caps.caps[SPAPR_CAP_LARGE_DECREMENTER] = SPAPR_CAP_ON;
> >>      smc->default_caps.caps[SPAPR_CAP_CCF_ASSIST] = SPAPR_CAP_OFF;
> >> -    smc->default_caps.caps[SPAPR_CAP_FWNMI_MCE] = SPAPR_CAP_OFF;
> >> +    smc->default_caps.caps[SPAPR_CAP_FWNMI_MCE] = SPAPR_CAP_ON;
> >>      spapr_caps_add_properties(smc, &error_abort);
> >>      smc->irq = &spapr_irq_dual;
> >>      smc->dr_phb_enabled = true;
> >> @@ -4512,6 +4515,7 @@ static void spapr_machine_3_1_class_options(MachineClass *mc)
> >>      smc->default_caps.caps[SPAPR_CAP_SBBC] = SPAPR_CAP_BROKEN;
> >>      smc->default_caps.caps[SPAPR_CAP_IBS] = SPAPR_CAP_BROKEN;
> >>      smc->default_caps.caps[SPAPR_CAP_LARGE_DECREMENTER] = SPAPR_CAP_OFF;
> >> +    smc->default_caps.caps[SPAPR_CAP_FWNMI_MCE] = SPAPR_CAP_OFF;  
> > 
> > This should have been put into spapr_machine_4_0_class_options().  
> 
> ok. I will change it.
> 
> > 
> > But unless you manage to get this merged before soft-freeze (2019-07-02),
> > I'm afraid this will be a 4.2 feature.  
> 
> If there are no other comments, can this be merged to 4.1? I will send a
> revised version with the above changes.
> 

This is David's call.

> Regards,
> Aravinda
> 
> >   
> >>  }
> >>  
> >>  DEFINE_SPAPR_MACHINE(3_1, "3.1", false);
> >> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> >> index a015a80..e010cb2 100644
> >> --- a/hw/ppc/spapr_rtas.c
> >> +++ b/hw/ppc/spapr_rtas.c
> >> @@ -49,6 +49,7 @@
> >>  #include "hw/ppc/fdt.h"
> >>  #include "target/ppc/mmu-hash64.h"
> >>  #include "target/ppc/mmu-book3s-v3.h"
> >> +#include "migration/blocker.h"
> >>  
> >>  static void rtas_display_character(PowerPCCPU *cpu, SpaprMachineState *spapr,
> >>                                     uint32_t token, uint32_t nargs,
> >> @@ -352,6 +353,60 @@ static void rtas_get_power_level(PowerPCCPU *cpu, SpaprMachineState *spapr,
> >>      rtas_st(rets, 1, 100);
> >>  }
> >>  
> >> +static void rtas_ibm_nmi_register(PowerPCCPU *cpu,
> >> +                                  SpaprMachineState *spapr,
> >> +                                  uint32_t token, uint32_t nargs,
> >> +                                  target_ulong args,
> >> +                                  uint32_t nret, target_ulong rets)
> >> +{
> >> +    int ret;
> >> +    hwaddr rtas_addr = spapr_get_rtas_addr();
> >> +
> >> +    if (!rtas_addr) {
> >> +        rtas_st(rets, 0, RTAS_OUT_NOT_SUPPORTED);
> >> +        return;
> >> +    }
> >> +
> >> +    if (spapr_get_cap(spapr, SPAPR_CAP_FWNMI_MCE) == SPAPR_CAP_OFF) {
> >> +        rtas_st(rets, 0, RTAS_OUT_NOT_SUPPORTED);
> >> +        return;
> >> +    }
> >> +
> >> +    ret = kvmppc_fwnmi_enable(cpu);
> >> +    if (ret == 1) {
> >> +        rtas_st(rets, 0, RTAS_OUT_NOT_SUPPORTED);
> >> +        return;
> >> +    } else if (ret < 0) {
> >> +        error_report("Couldn't enable KVM FWNMI capability");
> >> +        rtas_st(rets, 0, RTAS_OUT_HW_ERROR);
> >> +        return;
> >> +    }
> >> +
> >> +    spapr->guest_machine_check_addr = rtas_ld(args, 1);
> >> +    rtas_st(rets, 0, RTAS_OUT_SUCCESS);
> >> +}
> >> +
> >> +static void rtas_ibm_nmi_interlock(PowerPCCPU *cpu,
> >> +                                   SpaprMachineState *spapr,
> >> +                                   uint32_t token, uint32_t nargs,
> >> +                                   target_ulong args,
> >> +                                   uint32_t nret, target_ulong rets)
> >> +{
> >> +    if (spapr->guest_machine_check_addr == -1) {
> >> +        /* NMI register not called */
> >> +        rtas_st(rets, 0, RTAS_OUT_PARAM_ERROR);
> >> +    } else {
> >> +        /*
> >> +         * vCPU issuing "ibm,nmi-interlock" is done with NMI handling,
> >> +         * hence unset mc_status.
> >> +         */
> >> +        spapr->mc_status = -1;
> >> +        qemu_cond_signal(&spapr->mc_delivery_cond);
> >> +        migrate_del_blocker(spapr->fwnmi_migration_blocker);
> >> +        rtas_st(rets, 0, RTAS_OUT_SUCCESS);
> >> +    }
> >> +}
> >> +
> >>  static struct rtas_call {
> >>      const char *name;
> >>      spapr_rtas_fn fn;
> >> @@ -496,6 +551,14 @@ hwaddr spapr_get_rtas_addr(void)
> >>      return (hwaddr)fdt32_to_cpu(*rtas_data);
> >>  }
> >>  
> >> +void spapr_fwnmi_register(void)
> >> +{
> >> +    spapr_rtas_register(RTAS_IBM_NMI_REGISTER, "ibm,nmi-register",
> >> +                        rtas_ibm_nmi_register);
> >> +    spapr_rtas_register(RTAS_IBM_NMI_INTERLOCK, "ibm,nmi-interlock",
> >> +                        rtas_ibm_nmi_interlock);
> >> +}
> >> +
> >>  static void core_rtas_register_types(void)
> >>  {
> >>      spapr_rtas_register(RTAS_DISPLAY_CHARACTER, "display-character",
> >> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> >> index 0dedf0a..7ae53e2 100644
> >> --- a/include/hw/ppc/spapr.h
> >> +++ b/include/hw/ppc/spapr.h
> >> @@ -637,8 +637,10 @@ target_ulong spapr_hypercall(PowerPCCPU *cpu, target_ulong opcode,
> >>  #define RTAS_IBM_CREATE_PE_DMA_WINDOW           (RTAS_TOKEN_BASE + 0x27)
> >>  #define RTAS_IBM_REMOVE_PE_DMA_WINDOW           (RTAS_TOKEN_BASE + 0x28)
> >>  #define RTAS_IBM_RESET_PE_DMA_WINDOW            (RTAS_TOKEN_BASE + 0x29)
> >> +#define RTAS_IBM_NMI_REGISTER                   (RTAS_TOKEN_BASE + 0x2A)
> >> +#define RTAS_IBM_NMI_INTERLOCK                  (RTAS_TOKEN_BASE + 0x2B)
> >>  
> >> -#define RTAS_TOKEN_MAX                          (RTAS_TOKEN_BASE + 0x2A)
> >> +#define RTAS_TOKEN_MAX                          (RTAS_TOKEN_BASE + 0x2C)
> >>  
> >>  /* RTAS ibm,get-system-parameter token values */
> >>  #define RTAS_SYSPARM_SPLPAR_CHARACTERISTICS      20
> >> @@ -894,4 +896,5 @@ void spapr_check_pagesize(SpaprMachineState *spapr, hwaddr pagesize,
> >>  
> >>  void spapr_set_all_lpcrs(target_ulong value, target_ulong mask);
> >>  hwaddr spapr_get_rtas_addr(void);
> >> +void spapr_fwnmi_register(void);
> >>  #endif /* HW_SPAPR_H */
> >>  
> >   
> 


