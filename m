Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F9BAE64E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 11:07:39 +0200 (CEST)
Received: from localhost ([::1]:36140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7c7d-0002gd-T6
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 05:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36799)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1i7bp8-0007RJ-BN
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 04:48:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1i7bp5-0008CZ-UU
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 04:48:29 -0400
Received: from 9.mo5.mail-out.ovh.net ([178.32.96.204]:41474)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1i7bp4-0008BE-D7
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 04:48:26 -0400
Received: from player796.ha.ovh.net (unknown [10.108.42.239])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id F021524AEA5
 for <qemu-devel@nongnu.org>; Tue, 10 Sep 2019 10:48:23 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player796.ha.ovh.net (Postfix) with ESMTPSA id 6FD18988AF01;
 Tue, 10 Sep 2019 08:48:15 +0000 (UTC)
Date: Tue, 10 Sep 2019 10:48:14 +0200
From: Greg Kurz <groug@kaod.org>
To: Aravinda Prasad <aravinda@linux.vnet.ibm.com>
Message-ID: <20190910104814.6bd89cec@bahia.lan>
In-Reply-To: <156801390267.24362.17017161761742932333.stgit@aravinda>
References: <156801373576.24362.1904051970114447107.stgit@aravinda>
 <156801390267.24362.17017161761742932333.stgit@aravinda>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 7158190133393594772
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudekkedgtdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.32.96.204
Subject: Re: [Qemu-devel] [PATCH v13 6/6] migration: Include migration
 support for machine check handling
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
Cc: aik@ozlabs.ru, qemu-devel@nongnu.org, paulus@ozlabs.org,
 qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Aravinda,

Sorry for not being able to review the whole series in one pass,
and thus forcing you to poste more versions... but I have some
more remarks about migration.

On Mon, 09 Sep 2019 12:55:02 +0530
Aravinda Prasad <aravinda@linux.vnet.ibm.com> wrote:

> This patch includes migration support for machine check
> handling. Especially this patch blocks VM migration
> requests until the machine check error handling is
> complete as (i) these errors are specific to the source
> hardware and is irrelevant on the target hardware,
> (ii) these errors cause data corruption and should
> be handled before migration.
> 
> Signed-off-by: Aravinda Prasad <aravinda@linux.vnet.ibm.com>
> ---
>  hw/ppc/spapr.c         |   44 ++++++++++++++++++++++++++++++++++++++++++++
>  hw/ppc/spapr_events.c  |   14 ++++++++++++++
>  hw/ppc/spapr_rtas.c    |    2 ++
>  include/hw/ppc/spapr.h |    2 ++
>  4 files changed, 62 insertions(+)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 1c0908e..f6262f0 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -46,6 +46,7 @@
>  #include "migration/qemu-file-types.h"
>  #include "migration/global_state.h"
>  #include "migration/register.h"
> +#include "migration/blocker.h"
>  #include "mmu-hash64.h"
>  #include "mmu-book3s-v3.h"
>  #include "cpu-models.h"
> @@ -1829,6 +1830,8 @@ static void spapr_machine_reset(MachineState *machine)
>  
>      /* Signal all vCPUs waiting on this condition */
>      qemu_cond_broadcast(&spapr->mc_delivery_cond);
> +
> +    migrate_del_blocker(spapr->fwnmi_migration_blocker);
>  }
>  
>  static void spapr_create_nvram(SpaprMachineState *spapr)
> @@ -2119,6 +2122,42 @@ static const VMStateDescription vmstate_spapr_dtb = {
>      },
>  };
>  
> +static bool spapr_fwnmi_needed(void *opaque)
> +{
> +    SpaprMachineState *spapr = (SpaprMachineState *)opaque;
> +
> +    return spapr->guest_machine_check_addr != -1;
> +}
> +
> +static int spapr_fwnmi_post_load(void *opaque, int version_id)
> +{
> +    SpaprMachineState *spapr = (SpaprMachineState *)opaque;
> +
> +    if (spapr_get_cap(spapr, SPAPR_CAP_FWNMI_MCE) == SPAPR_CAP_ON) {
> +
> +        if (kvmppc_has_cap_ppc_fwnmi()) {
> +            return 0;
> +        }
> +
> +        return kvmppc_set_fwnmi();
> +    }
> +
> +    return 0;
> +}
> +
> +static const VMStateDescription vmstate_spapr_machine_check = {
> +    .name = "spapr_machine_check",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = spapr_fwnmi_needed,
> +    .post_load = spapr_fwnmi_post_load,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT64(guest_machine_check_addr, SpaprMachineState),
> +        VMSTATE_INT32(mc_status, SpaprMachineState),
> +        VMSTATE_END_OF_LIST()
> +    },
> +};
> +
>  static const VMStateDescription vmstate_spapr = {
>      .name = "spapr",
>      .version_id = 3,
> @@ -2152,6 +2191,7 @@ static const VMStateDescription vmstate_spapr = {
>          &vmstate_spapr_dtb,
>          &vmstate_spapr_cap_large_decr,
>          &vmstate_spapr_cap_ccf_assist,
> +        &vmstate_spapr_machine_check,
>          NULL
>      }
>  };
> @@ -2948,6 +2988,10 @@ static void spapr_machine_init(MachineState *machine)
>              exit(1);
>          }
>  
> +        /* Create the error string for live migration blocker */
> +        error_setg(&spapr->fwnmi_migration_blocker,
> +            "Live migration not supported during machine check handling");
> +
>          /* Register ibm,nmi-register and ibm,nmi-interlock RTAS calls */
>          spapr_fwnmi_register();
>      }
> diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
> index ecc3d68..83f0a22 100644
> --- a/hw/ppc/spapr_events.c
> +++ b/hw/ppc/spapr_events.c
> @@ -43,6 +43,7 @@
>  #include "qemu/main-loop.h"
>  #include "hw/ppc/spapr_ovec.h"
>  #include <libfdt.h>
> +#include "migration/blocker.h"
>  
>  #define RTAS_LOG_VERSION_MASK                   0xff000000
>  #define   RTAS_LOG_VERSION_6                    0x06000000
> @@ -844,6 +845,8 @@ void spapr_mce_req_event(PowerPCCPU *cpu, bool recovered)
>  {
>      SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
>      CPUState *cs = CPU(cpu);
> +    int ret;
> +    Error *local_err = NULL;
>  
>      if (spapr->guest_machine_check_addr == -1) {
>          /*
> @@ -857,6 +860,17 @@ void spapr_mce_req_event(PowerPCCPU *cpu, bool recovered)
>          return;
>      }
>  
> +    ret = migrate_add_blocker(spapr->fwnmi_migration_blocker, &local_err);

If an MCE is already being handled, this adds yet another blocker. IIUC only
the vCPU handling the previous MCE is supposed to call "ibm,nmi-interlock"
and clear the blocker. This might cause a blocker to be leaked. I think
migrate_add_blocker() should only be called when we know that the vCPU
does handle the MCE, ie, after the loop.

Also, please note that migrate_add_blocker() can fail for two reasons:
(1) migration is already in progress (-EBUSY)
(2) QEMU was started with -only-migratable (-EACCES)

> +    if (ret < 0) {
> +        /*
> +         * We don't want to abort and let the migration to continue. In a
> +         * rare case, the machine check handler will run on the target
> +         * hardware. Though this is not preferable, it is better than aborting
> +         * the migration or killing the VM.
> +         */

This seems correct for case (1).

> +        warn_report_err(local_err);

The warning would be:

disallowing migration blocker (migration in progress) for:
 Live migration not supported during machine check handling

This rather looks rather cryptic for the average user. Maybe
better to ignore the generic message, ie, pass NULL to
migrate_add_blocker, and output a more meaningul warning
with warn_report() directly. Something like:

"A machine check is being handled during migration. This may
cause data corruption or abusive poisoning of some of the
guest memory on the destination"

Case (2) is different. There isn't any migration in progress: the idea
behind the -only-migratable QEMU option is to avoid configurations that
can block migration. If migration doesn't happen while the MCE is being
handled, I don't think we should output a warning at all. But a warning
(same as above?) should be printed if migration happens before the vCPU
did call "ibm,nmi-interlock", by checking mc_status in spapr_pre_save()
for example.

> +    }
> +
>      while (spapr->mc_status != -1) {
>          /*
>           * Check whether the same CPU got machine check error
> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> index d892583..b682cc2 100644
> --- a/hw/ppc/spapr_rtas.c
> +++ b/hw/ppc/spapr_rtas.c
> @@ -50,6 +50,7 @@
>  #include "hw/ppc/fdt.h"
>  #include "target/ppc/mmu-hash64.h"
>  #include "target/ppc/mmu-book3s-v3.h"
> +#include "migration/blocker.h"
>  
>  static void rtas_display_character(PowerPCCPU *cpu, SpaprMachineState *spapr,
>                                     uint32_t token, uint32_t nargs,
> @@ -438,6 +439,7 @@ static void rtas_ibm_nmi_interlock(PowerPCCPU *cpu,
>           */
>          spapr->mc_status = -1;
>          qemu_cond_signal(&spapr->mc_delivery_cond);
> +        migrate_del_blocker(spapr->fwnmi_migration_blocker);
>          rtas_st(rets, 0, RTAS_OUT_SUCCESS);
>      }
>  }
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index dada821..ea7625e 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -217,6 +217,8 @@ struct SpaprMachineState {
>  
>      unsigned gpu_numa_id;
>      SpaprTpmProxy *tpm_proxy;
> +
> +    Error *fwnmi_migration_blocker;
>  };
>  
>  #define H_SUCCESS         0
> 


