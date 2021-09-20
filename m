Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF53A4111F8
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 11:39:20 +0200 (CEST)
Received: from localhost ([::1]:45296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSFlf-0001Vh-Fm
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 05:39:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mSFkc-0000f6-8t
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 05:38:14 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:34222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mSFkZ-0002ij-Em
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 05:38:13 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-q_7Je_OCM5mdyeBEVRC22A-1; Mon, 20 Sep 2021 05:38:07 -0400
X-MC-Unique: q_7Je_OCM5mdyeBEVRC22A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEF5D362F8;
 Mon, 20 Sep 2021 09:38:05 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51FA95D9DD;
 Mon, 20 Sep 2021 09:38:04 +0000 (UTC)
Date: Mon, 20 Sep 2021 11:38:03 +0200
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v8 5/7] spapr: move FORM1 verifications to post CAS
Message-ID: <20210920113803.319112e4@bahia.huguette>
In-Reply-To: <20210917212802.424481-6-danielhb413@gmail.com>
References: <20210917212802.424481-1-danielhb413@gmail.com>
 <20210917212802.424481-6-danielhb413@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
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

On Fri, 17 Sep 2021 18:28:00 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> FORM2 NUMA affinity is prepared to deal with empty (memory/cpu less)
> NUMA nodes. This is used by the DAX KMEM driver to locate a PAPR SCM
> device that has a different latency than the original NUMA node from the
> regular memory. FORM2 is also able  to deal with asymmetric NUMA
> distances gracefully, something that our FORM1 implementation doesn't
> do.
>=20
> Move these FORM1 verifications to a new function and wait until after
> CAS, when we're sure that we're sticking with FORM1, to enforce them.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/spapr.c              | 33 -----------------------
>  hw/ppc/spapr_hcall.c        |  6 +++++
>  hw/ppc/spapr_numa.c         | 53 ++++++++++++++++++++++++++++++++-----
>  include/hw/ppc/spapr_numa.h |  1 +
>  4 files changed, 54 insertions(+), 39 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index d39fd4e644..ada85ee083 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -2773,39 +2773,6 @@ static void spapr_machine_init(MachineState *machi=
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
> index 9056644890..222c1b6bbd 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1198,6 +1198,12 @@ target_ulong do_client_architecture_support(PowerP=
CCPU *cpu,
>      spapr->cas_pre_isa3_guest =3D !spapr_ovec_test(ov1_guest, OV1_PPC_3_=
00);
>      spapr_ovec_cleanup(ov1_guest);
> =20
> +    /*
> +     * Check for NUMA affinity conditions now that we know which NUMA
> +     * affinity the guest will use.
> +     */
> +    spapr_numa_associativity_check(spapr);
> +
>      /*
>       * Ensure the guest asks for an interrupt mode we support;
>       * otherwise terminate the boot.
> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
> index 7339d00d20..dfe4fada01 100644
> --- a/hw/ppc/spapr_numa.c
> +++ b/hw/ppc/spapr_numa.c
> @@ -193,6 +193,48 @@ static void spapr_numa_define_FORM1_domains(SpaprMac=
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
> @@ -250,12 +292,6 @@ static void spapr_numa_FORM1_affinity_init(SpaprMach=
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
> @@ -265,6 +301,11 @@ void spapr_numa_associativity_init(SpaprMachineState=
 *spapr,
>      spapr_numa_FORM1_affinity_init(spapr, machine);
>  }
> =20
> +void spapr_numa_associativity_check(SpaprMachineState *spapr)
> +{
> +    spapr_numa_FORM1_affinity_check(MACHINE(spapr));
> +}
> +
>  void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *f=
dt,
>                                         int offset, int nodeid)
>  {
> diff --git a/include/hw/ppc/spapr_numa.h b/include/hw/ppc/spapr_numa.h
> index 6f9f02d3de..7cb3367400 100644
> --- a/include/hw/ppc/spapr_numa.h
> +++ b/include/hw/ppc/spapr_numa.h
> @@ -24,6 +24,7 @@
>   */
>  void spapr_numa_associativity_init(SpaprMachineState *spapr,
>                                     MachineState *machine);
> +void spapr_numa_associativity_check(SpaprMachineState *spapr);
>  void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int r=
tas);
>  void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *f=
dt,
>                                         int offset, int nodeid);


