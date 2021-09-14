Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 568D640ADF3
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 14:38:30 +0200 (CEST)
Received: from localhost ([::1]:36580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ7hl-0002on-E9
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 08:38:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mQ7Yf-0007OS-2e
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 08:29:05 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:51040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mQ7YZ-0007wH-S2
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 08:29:04 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-BlEcOPB-MLqe0rSSVkWFaQ-1; Tue, 14 Sep 2021 08:28:53 -0400
X-MC-Unique: BlEcOPB-MLqe0rSSVkWFaQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0F9C100C631;
 Tue, 14 Sep 2021 12:28:43 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.206])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 709A91972D;
 Tue, 14 Sep 2021 12:28:42 +0000 (UTC)
Date: Tue, 14 Sep 2021 14:26:42 +0200
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v6 5/6] spapr: move FORM1 verifications to post CAS
Message-ID: <20210914142642.15d27287@bahia.huguette>
In-Reply-To: <20210910195539.797170-6-danielhb413@gmail.com>
References: <20210910195539.797170-1-danielhb413@gmail.com>
 <20210910195539.797170-6-danielhb413@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 10 Sep 2021 16:55:38 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> FORM2 NUMA affinity is prepared to deal with empty (memory/cpu less)
> NUMA nodes. This is used by the DAX KMEM driver to locate a PAPR SCM
> device that has a different latency than the original NUMA node from the
> regular memory. FORM2 is also enable to deal with asymmetric NUMA

s/enable/able

> distances gracefully, something that our FORM1 implementation doesn't
> do.
>=20
> Move these FORM1 verifications to a new function and wait until after
> CAS, when we're sure that we're sticking with FORM1, to enforce them.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/ppc/spapr.c              | 35 +----------------------
>  hw/ppc/spapr_hcall.c        |  2 +-
>  hw/ppc/spapr_numa.c         | 55 ++++++++++++++++++++++++++++++++-----
>  include/hw/ppc/spapr_numa.h |  3 +-
>  4 files changed, 52 insertions(+), 43 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 5afbb76cab..0703a26093 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1798,7 +1798,7 @@ static int spapr_post_load(void *opaque, int versio=
n_id)
>       * through it, but since it's a lightweight operation it's worth bei=
ng
>       * a little redundant to be safe.
>       */
> -     spapr_numa_associativity_reset(spapr);
> +     spapr_numa_associativity_reset(spapr, false);
> =20
>      return err;
>  }
> @@ -2787,39 +2787,6 @@ static void spapr_machine_init(MachineState *machi=
ne)
>      /* init CPUs */
>      spapr_init_cpus(spapr);
> =20
> -    /*
> -     * check we don't have a memory-less/cpu-less NUMA node
> -     * Firmware relies on the existing memory/cpu topology to provide th=
e
> -     * NUMA topology to the kernel.
> -     * And the linux kernel needs to know the NUMA topology at start
> -     * to be able to hotplug CPUs later.
> -     */
> -    if (machine->numa_state->num_nodes) {
> -        for (i =3D 0; i < machine->numa_state->num_nodes; ++i) {
> -            /* check for memory-less node */
> -            if (machine->numa_state->nodes[i].node_mem =3D=3D 0) {
> -                CPUState *cs;
> -                int found =3D 0;
> -                /* check for cpu-less node */
> -                CPU_FOREACH(cs) {
> -                    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> -                    if (cpu->node_id =3D=3D i) {
> -                        found =3D 1;
> -                        break;
> -                    }
> -                }
> -                /* memory-less and cpu-less node */
> -                if (!found) {
> -                    error_report(
> -                       "Memory-less/cpu-less nodes are not supported (no=
de %d)",
> -                                 i);
> -                    exit(1);
> -                }
> -            }
> -        }
> -
> -    }
> -
>      spapr->gpu_numa_id =3D spapr_numa_initial_nvgpu_numa_id(machine);
> =20
>      /* Init numa_assoc_array */
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 82ab92ddba..2dc22e2dc7 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1202,7 +1202,7 @@ target_ulong do_client_architecture_support(PowerPC=
CPU *cpu,
>       * Reset numa_assoc_array now that we know which NUMA affinity
>       * the guest will use.
>       */
> -    spapr_numa_associativity_reset(spapr);
> +    spapr_numa_associativity_reset(spapr, true);
> =20
>      /*
>       * Ensure the guest asks for an interrupt mode we support;
> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
> index 7ad4b6582b..0ade63c2d3 100644
> --- a/hw/ppc/spapr_numa.c
> +++ b/hw/ppc/spapr_numa.c
> @@ -198,6 +198,48 @@ static void spapr_numa_define_FORM1_domains(SpaprMac=
hineState *spapr)
> =20
>  }
> =20
> +static void spapr_numa_FORM1_affinity_check(MachineState *machine)
> +{
> +    int i;
> +
> +    /*
> +     * Check we don't have a memory-less/cpu-less NUMA node
> +     * Firmware relies on the existing memory/cpu topology to provide th=
e
> +     * NUMA topology to the kernel.
> +     * And the linux kernel needs to know the NUMA topology at start
> +     * to be able to hotplug CPUs later.
> +     */
> +    if (machine->numa_state->num_nodes) {
> +        for (i =3D 0; i < machine->numa_state->num_nodes; ++i) {
> +            /* check for memory-less node */
> +            if (machine->numa_state->nodes[i].node_mem =3D=3D 0) {
> +                CPUState *cs;
> +                int found =3D 0;
> +                /* check for cpu-less node */
> +                CPU_FOREACH(cs) {
> +                    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> +                    if (cpu->node_id =3D=3D i) {
> +                        found =3D 1;
> +                        break;
> +                    }
> +                }
> +                /* memory-less and cpu-less node */
> +                if (!found) {
> +                    error_report(
> +"Memory-less/cpu-less nodes are not supported with FORM1 NUMA (node %d)"=
, i);
> +                    exit(EXIT_FAILURE);
> +                }
> +            }
> +        }
> +    }
> +
> +    if (!spapr_numa_is_symmetrical(machine)) {
> +        error_report(
> +"Asymmetrical NUMA topologies aren't supported in the pSeries machine us=
ing FORM1 NUMA");
> +        exit(EXIT_FAILURE);
> +    }
> +}
> +
>  /*
>   * Set NUMA machine state data based on FORM1 affinity semantics.
>   */
> @@ -260,12 +302,6 @@ static void spapr_numa_FORM1_affinity_init(SpaprMach=
ineState *spapr,
>          return;
>      }
> =20
> -    if (!spapr_numa_is_symmetrical(machine)) {
> -        error_report("Asymmetrical NUMA topologies aren't supported "
> -                     "in the pSeries machine");
> -        exit(EXIT_FAILURE);
> -    }
> -
>      spapr_numa_define_FORM1_domains(spapr);
>  }
> =20
> @@ -287,10 +323,15 @@ void spapr_numa_associativity_init(SpaprMachineStat=
e *spapr,
>      spapr->numa_assoc_array =3D spapr->FORM1_assoc_array;
>  }
> =20
> -void spapr_numa_associativity_reset(SpaprMachineState *spapr)
> +void spapr_numa_associativity_reset(SpaprMachineState *spapr,
> +                                    bool post_CAS_check)

Coding style requires lower case for variable names and that's what
we already with other CAS related variables in the rest of the code.

Rest LGTM so with these remarks addressed :

Reviewed-by: Greg Kurz <groug@kaod.org>

>  {
>      /* No FORM2 affinity implemented yet */
>      spapr->numa_assoc_array =3D spapr->FORM1_assoc_array;
> +
> +    if (post_CAS_check) {
> +        spapr_numa_FORM1_affinity_check(MACHINE(spapr));
> +    }
>  }
> =20
>  void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *f=
dt,
> diff --git a/include/hw/ppc/spapr_numa.h b/include/hw/ppc/spapr_numa.h
> index ccf3e4eae8..246767d0a8 100644
> --- a/include/hw/ppc/spapr_numa.h
> +++ b/include/hw/ppc/spapr_numa.h
> @@ -24,7 +24,8 @@
>   */
>  void spapr_numa_associativity_init(SpaprMachineState *spapr,
>                                     MachineState *machine);
> -void spapr_numa_associativity_reset(SpaprMachineState *spapr);
> +void spapr_numa_associativity_reset(SpaprMachineState *spapr,
> +                                    bool post_CAS_check);
>  void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int r=
tas);
>  void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *f=
dt,
>                                         int offset, int nodeid);


