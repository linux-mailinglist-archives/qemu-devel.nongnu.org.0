Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A09335098
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jun 2019 22:06:15 +0200 (CEST)
Received: from localhost ([127.0.0.1]:57333 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYFhG-0004WA-H9
	for lists+qemu-devel@lfdr.de; Tue, 04 Jun 2019 16:06:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58263)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1hYFg8-000464-Ez
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 16:05:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1hYFfx-0003E6-O3
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 16:04:57 -0400
Received: from 5.mo68.mail-out.ovh.net ([46.105.62.179]:60306)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <groug@kaod.org>) id 1hYFfu-000338-Sc
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 16:04:51 -0400
Received: from player796.ha.ovh.net (unknown [10.109.159.157])
	by mo68.mail-out.ovh.net (Postfix) with ESMTP id D94AF12FAF2
	for <qemu-devel@nongnu.org>; Tue,  4 Jun 2019 22:04:29 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
	[82.253.208.248]) (Authenticated sender: groug@kaod.org)
	by player796.ha.ovh.net (Postfix) with ESMTPSA id 650FE6650FB5;
	Tue,  4 Jun 2019 20:04:22 +0000 (UTC)
Date: Tue, 4 Jun 2019 22:04:21 +0200
From: Greg Kurz <groug@kaod.org>
To: Aravinda Prasad <aravinda@linux.vnet.ibm.com>
Message-ID: <20190604220421.13a03ddd@bahia.lab.toulouse-stg.fr.ibm.com>
In-Reply-To: <7e45c080-b726-da90-c043-3d61548726de@linux.vnet.ibm.com>
References: <155910829070.13149.5215948335633966328.stgit@aravinda>
	<155910845769.13149.8097972239187020170.stgit@aravinda>
	<20190603174000.5875d724@bahia.lab.toulouse-stg.fr.ibm.com>
	<7e45c080-b726-da90-c043-3d61548726de@linux.vnet.ibm.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 14901566743889680788
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrudegtddgtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.62.179
Subject: Re: [Qemu-devel] [Qemu-ppc] [PATCH v9 6/6] migration: Include
 migration support for machine check handling
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

On Tue, 4 Jun 2019 12:34:37 +0530
Aravinda Prasad <aravinda@linux.vnet.ibm.com> wrote:

> On Monday 03 June 2019 09:10 PM, Greg Kurz wrote:
> > On Wed, 29 May 2019 11:10:57 +0530
> > Aravinda Prasad <aravinda@linux.vnet.ibm.com> wrote:
> >   
> >> This patch includes migration support for machine check
> >> handling. Especially this patch blocks VM migration
> >> requests until the machine check error handling is
> >> complete as (i) these errors are specific to the source
> >> hardware and is irrelevant on the target hardware,
> >> (ii) these errors cause data corruption and should
> >> be handled before migration.
> >>
> >> Signed-off-by: Aravinda Prasad <aravinda@linux.vnet.ibm.com>
> >> ---  
> > 
> > LGTM, just one issue: machine reset should del and free the blocker as well,
> > otherwise QEMU would crash if spapr_mce_req_event() is called again.  
> 
> Sure.
> 
> 
> >   
> >>  hw/ppc/spapr.c         |   20 ++++++++++++++++++++
> >>  hw/ppc/spapr_events.c  |   17 +++++++++++++++++
> >>  hw/ppc/spapr_rtas.c    |    4 ++++
> >>  include/hw/ppc/spapr.h |    2 ++
> >>  4 files changed, 43 insertions(+)
> >>
> >> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> >> index e8a77636..31c4850 100644
> >> --- a/hw/ppc/spapr.c
> >> +++ b/hw/ppc/spapr.c
> >> @@ -2104,6 +2104,25 @@ static const VMStateDescription vmstate_spapr_dtb = {
> >>      },
> >>  };
> >>  
> >> +static bool spapr_fwnmi_needed(void *opaque)
> >> +{
> >> +    SpaprMachineState *spapr = (SpaprMachineState *)opaque;
> >> +
> >> +    return (spapr->guest_machine_check_addr == -1) ? 0 : 1;

And also you can drop the parens since == as precedence over ?:

> >> +}
> >> +
> >> +static const VMStateDescription vmstate_spapr_machine_check = {
> >> +    .name = "spapr_machine_check",
> >> +    .version_id = 1,
> >> +    .minimum_version_id = 1,
> >> +    .needed = spapr_fwnmi_needed,
> >> +    .fields = (VMStateField[]) {
> >> +        VMSTATE_UINT64(guest_machine_check_addr, SpaprMachineState),
> >> +        VMSTATE_INT32(mc_status, SpaprMachineState),
> >> +        VMSTATE_END_OF_LIST()
> >> +    },
> >> +};
> >> +
> >>  static const VMStateDescription vmstate_spapr = {
> >>      .name = "spapr",
> >>      .version_id = 3,
> >> @@ -2137,6 +2156,7 @@ static const VMStateDescription vmstate_spapr = {
> >>          &vmstate_spapr_dtb,
> >>          &vmstate_spapr_cap_large_decr,
> >>          &vmstate_spapr_cap_ccf_assist,
> >> +        &vmstate_spapr_machine_check,
> >>          NULL
> >>      }
> >>  };
> >> diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
> >> index 573c0b7..35e21e4 100644
> >> --- a/hw/ppc/spapr_events.c
> >> +++ b/hw/ppc/spapr_events.c
> >> @@ -41,6 +41,7 @@
> >>  #include "qemu/bcd.h"
> >>  #include "hw/ppc/spapr_ovec.h"
> >>  #include <libfdt.h>
> >> +#include "migration/blocker.h"
> >>  
> >>  #define RTAS_LOG_VERSION_MASK                   0xff000000
> >>  #define   RTAS_LOG_VERSION_6                    0x06000000
> >> @@ -855,6 +856,22 @@ static void spapr_mce_dispatch_elog(PowerPCCPU *cpu, bool recovered)
> >>  void spapr_mce_req_event(PowerPCCPU *cpu, bool recovered)
> >>  {
> >>      SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
> >> +    int ret;
> >> +    Error *local_err = NULL;
> >> +
> >> +    error_setg(&spapr->fwnmi_migration_blocker,
> >> +            "Live migration not supported during machine check handling");
> >> +    ret = migrate_add_blocker(spapr->fwnmi_migration_blocker, &local_err);
> >> +    if (ret < 0) {
> >> +        /*
> >> +         * We don't want to abort and let the migration to continue. In a
> >> +         * rare case, the machine check handler will run on the target
> >> +         * hardware. Though this is not preferable, it is better than aborting
> >> +         * the migration or killing the VM.
> >> +         */
> >> +        error_free(spapr->fwnmi_migration_blocker);
> >> +        warn_report_err(local_err);
> >> +    }
> >>  
> >>      while (spapr->mc_status != -1) {
> >>          /*
> >> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> >> index 91a7ab9..c849223 100644
> >> --- a/hw/ppc/spapr_rtas.c
> >> +++ b/hw/ppc/spapr_rtas.c
> >> @@ -50,6 +50,7 @@
> >>  #include "target/ppc/mmu-hash64.h"
> >>  #include "target/ppc/mmu-book3s-v3.h"
> >>  #include "kvm_ppc.h"
> >> +#include "migration/blocker.h"
> >>  
> >>  static void rtas_display_character(PowerPCCPU *cpu, SpaprMachineState *spapr,
> >>                                     uint32_t token, uint32_t nargs,
> >> @@ -404,6 +405,9 @@ static void rtas_ibm_nmi_interlock(PowerPCCPU *cpu,
> >>          spapr->mc_status = -1;
> >>          qemu_cond_signal(&spapr->mc_delivery_cond);
> >>          rtas_st(rets, 0, RTAS_OUT_SUCCESS);
> >> +        migrate_del_blocker(spapr->fwnmi_migration_blocker);
> >> +        error_free(spapr->fwnmi_migration_blocker);
> >> +        spapr->fwnmi_migration_blocker = NULL;
> >>      }
> >>  }
> >>  
> >> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> >> index bd75d4b..6c0cfd8 100644
> >> --- a/include/hw/ppc/spapr.h
> >> +++ b/include/hw/ppc/spapr.h
> >> @@ -214,6 +214,8 @@ struct SpaprMachineState {
> >>      SpaprCapabilities def, eff, mig;
> >>  
> >>      unsigned gpu_numa_id;
> >> +
> >> +    Error *fwnmi_migration_blocker;
> >>  };
> >>  
> >>  #define H_SUCCESS         0
> >>
> >>  
> >   
> 


