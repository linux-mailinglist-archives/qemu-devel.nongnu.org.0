Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3BE3FC920
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 15:57:59 +0200 (CEST)
Received: from localhost ([::1]:40092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL4Gz-00079M-Gu
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 09:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mL411-0006FR-P6
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 09:41:27 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:37419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mL40j-0006Ky-0U
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 09:41:27 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-sr_8lnD1PPCUA99TdfL6sg-1; Tue, 31 Aug 2021 09:41:00 -0400
X-MC-Unique: sr_8lnD1PPCUA99TdfL6sg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82194190B2A2;
 Tue, 31 Aug 2021 13:40:59 +0000 (UTC)
Received: from bahia.lan (unknown [10.39.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2EA2F5DA2D;
 Tue, 31 Aug 2021 13:40:58 +0000 (UTC)
Date: Tue, 31 Aug 2021 15:40:55 +0200
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v4 3/5] spapr_numa.c: base FORM2 NUMA affinity support
Message-ID: <20210831154055.3c5cf39f@bahia.lan>
In-Reply-To: <20210827092455.125411-4-danielhb413@gmail.com>
References: <20210827092455.125411-1-danielhb413@gmail.com>
 <20210827092455.125411-4-danielhb413@gmail.com>
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

On Fri, 27 Aug 2021 06:24:53 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> The main feature of FORM2 affinity support is the separation of NUMA
> distances from ibm,associativity information. This allows for a more
> flexible and straightforward NUMA distance assignment without relying on
> complex associations between several levels of NUMA via
> ibm,associativity matches. Another feature is its extensibility. This bas=
e
> support contains the facilities for NUMA distance assignment, but in the
> future more facilities will be added for latency, performance, bandwidth
> and so on.
>=20
> This patch implements the base FORM2 affinity support as follows:
>=20
> - the use of FORM2 associativity is indicated by using bit 2 of byte 5
> of ibm,architecture-vec-5. A FORM2 aware guest can choose to use FORM1
> or FORM2 affinity. Setting both forms will default to FORM2. We're not
> advertising FORM2 for pseries-6.1 and older machine versions to prevent
> guest visible changes in those;
>=20
> - move spapr_numa_associativity_init() from spapr_machine_init() to
> do_client_architecture_support(), when we already know which NUMA
> affinity the guest will use. This will avoid initializing FORM1
> spapr->numa_assoc_array and overwrite it shortly after if FORM2 is
> chosen;
>=20

As I was saying in another mail. I'm not very comfortable with delaying
spapr_numa_associativity_init() to CAS until I'm sure nothing else
assumes it's already done when the machine first resets and boots.

And also, these are slow paths and I'd rather overwrite the array if
that keeps the code simple. FWIW this is what we already do with the
irq backend : we always reset to XICS and switch to XIVE at CAS.

This also makes me think that spapr_numa_associativity_init() should
be called during machine reset so that spapr->numa_assoc_array is
reset to a known default value, i.e. FORM1 or legacy depending on
the machine version. Maybe rename it to spapr_numa_associativity_reset()
for clarity ?

> - ibm,associativity-reference-points has a new semantic. Instead of
> being used to calculate distances via NUMA levels, it's now used to
> indicate the primary domain index in the ibm,associativity domain of
> each resource. In our case it's set to {0x4}, matching the position
> where we already place logical_domain_id;
>=20
> - two new RTAS DT artifacts are introduced: ibm,numa-lookup-index-table
> and ibm,numa-distance-table. The index table is used to list all the
> NUMA logical domains of the platform, in ascending order, and allows for
> spartial NUMA configurations (although QEMU ATM doesn't support that).
> ibm,numa-distance-table is an array that contains all the distances from
> the first NUMA node to all other nodes, then the second NUMA node
> distances to all other nodes and so on;
>=20
> - spapr_post_load changes: since we're adding a new NUMA affinity that
> isn't compatible with the existing one, migration must be handled
> accordingly because we can't be certain of whether the guest went
> through CAS in the source. The solution chosen is to initiate the NUMA
> associativity data in spapr_post_load() unconditionally. The worst case
> would be to write the DT twice if the guest is in pre-CAS stage.
> Otherwise, we're making sure that a FORM1 guest will have the
> spapr->numa_assoc_array initialized with the proper information based on
> user distance, something that we're not doing with FORM2.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/ppc/spapr.c              |  27 +++++++-
>  hw/ppc/spapr_hcall.c        |   4 ++
>  hw/ppc/spapr_numa.c         | 127 +++++++++++++++++++++++++++++++++++-
>  include/hw/ppc/spapr.h      |   1 +
>  include/hw/ppc/spapr_ovec.h |   1 +
>  5 files changed, 156 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index d39fd4e644..a3eb33764d 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1786,6 +1786,22 @@ static int spapr_post_load(void *opaque, int versi=
on_id)
>          return err;
>      }
> =20
> +    /*
> +     * NUMA data init is made in CAS time. There is no reliable
> +     * way of telling whether the guest already went through CAS
> +     * in the source due to how spapr_ov5_cas_needed works: a
> +     * FORM1 guest can be migrated with ov5_cas empty regardless
> +     * of going through CAS first.
> +     *
> +     * One solution is to always call numa_associativity_init. The
> +     * downside is that a guest migrated before CAS will run
> +     * numa_associativity_init again when going through it, but
> +     * at least we're making sure spapr->numa_assoc_array will be
> +     * initialized and hotplug operations won't fail in both before
> +     * and after CAS migration cases.

This seems to comfort my feelings : it is safer to do the init
unconditionally to ensure no other code gets upset.

> +     */
> +     spapr_numa_associativity_init(spapr, MACHINE(spapr));
> +
>      return err;
>  }
> =20
> @@ -2752,6 +2768,11 @@ static void spapr_machine_init(MachineState *machi=
ne)
> =20
>      spapr_ovec_set(spapr->ov5, OV5_FORM1_AFFINITY);
> =20
> +    /* Do not advertise FORM2 support for pseries-6.1 and older */
> +    if (!smc->pre_6_2_numa_affinity) {
> +        spapr_ovec_set(spapr->ov5, OV5_FORM2_AFFINITY);
> +    }
> +
>      /* advertise support for dedicated HP event source to guests */
>      if (spapr->use_hotplug_event_source) {
>          spapr_ovec_set(spapr->ov5, OV5_HP_EVT);
> @@ -2808,9 +2829,6 @@ static void spapr_machine_init(MachineState *machin=
e)
> =20
>      spapr->gpu_numa_id =3D spapr_numa_initial_nvgpu_numa_id(machine);
> =20
> -    /* Init numa_assoc_array */
> -    spapr_numa_associativity_init(spapr, machine);
> -
>      if ((!kvm_enabled() || kvmppc_has_cap_mmu_radix()) &&
>          ppc_type_check_compat(machine->cpu_type, CPU_POWERPC_LOGICAL_3_0=
0, 0,
>                                spapr->max_compat_pvr)) {
> @@ -4700,8 +4718,11 @@ DEFINE_SPAPR_MACHINE(6_2, "6.2", true);
>   */
>  static void spapr_machine_6_1_class_options(MachineClass *mc)
>  {
> +    SpaprMachineClass *smc =3D SPAPR_MACHINE_CLASS(mc);
> +
>      spapr_machine_6_2_class_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len)=
;
> +    smc->pre_6_2_numa_affinity =3D true;
>  }
> =20
>  DEFINE_SPAPR_MACHINE(6_1, "6.1", false);
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 0e9a5b2e40..1cc88716c1 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -11,6 +11,7 @@
>  #include "helper_regs.h"
>  #include "hw/ppc/spapr.h"
>  #include "hw/ppc/spapr_cpu_core.h"
> +#include "hw/ppc/spapr_numa.h"
>  #include "mmu-hash64.h"
>  #include "cpu-models.h"
>  #include "trace.h"
> @@ -1197,6 +1198,9 @@ target_ulong do_client_architecture_support(PowerPC=
CPU *cpu,
>      spapr->cas_pre_isa3_guest =3D !spapr_ovec_test(ov1_guest, OV1_PPC_3_=
00);
>      spapr_ovec_cleanup(ov1_guest);
> =20
> +    /* Init numa_assoc_array */
> +    spapr_numa_associativity_init(spapr, MACHINE(spapr));
> +
>      /*
>       * Ensure the guest asks for an interrupt mode we support;
>       * otherwise terminate the boot.
> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
> index 04a86f9b5b..0a5fa8101e 100644
> --- a/hw/ppc/spapr_numa.c
> +++ b/hw/ppc/spapr_numa.c
> @@ -202,6 +202,16 @@ void spapr_numa_associativity_init(SpaprMachineState=
 *spapr,
>          spapr->numa_assoc_array[i][0] =3D cpu_to_be32(MAX_DISTANCE_REF_P=
OINTS);
>          spapr->numa_assoc_array[i][MAX_DISTANCE_REF_POINTS] =3D cpu_to_b=
e32(i);
> =20
> +        /*
> +         * For FORM2 affinity the initialization above is enough. No
> +         * need to fill non-zero NUMA nodes with node_id because
> +         * there is no associativity domain match to calculate
> +         * NUMA distances in FORM2.
> +         */
> +        if (spapr_ovec_test(spapr->ov5_cas, OV5_FORM2_AFFINITY)) {
> +            continue;
> +        }
> +
>          /*
>           * Fill all associativity domains of non-zero NUMA nodes with
>           * node_id. This is required because the default value (0) is
> @@ -236,7 +246,16 @@ void spapr_numa_associativity_init(SpaprMachineState=
 *spapr,
>          spapr->numa_assoc_array[i][MAX_DISTANCE_REF_POINTS] =3D cpu_to_b=
e32(i);
>      }
> =20
> -    spapr_numa_FORM1_affinity_init(spapr, machine);
> +    /*
> +     * We test for !FORM2 instead of testing for FORM1 because,
> +     * as per spapr_ov5_cas_needed, setting FORM1 is not enough
> +     * to get ov5_cas migrated, but setting FORM2 is. Since we're
> +     * dealing with either FORM1 or FORM2, test for the option
> +     * that is guaranteed to be set after a migration.
> +     */
> +    if (!spapr_ovec_test(spapr->ov5_cas, OV5_FORM2_AFFINITY)) {
> +        spapr_numa_FORM1_affinity_init(spapr, machine);
> +    }
>  }
> =20
>  void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *f=
dt,
> @@ -313,6 +332,107 @@ int spapr_numa_write_assoc_lookup_arrays(SpaprMachi=
neState *spapr, void *fdt,
>      return ret;
>  }
> =20
> +static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
> +                                               void *fdt, int rtas)
> +{
> +    MachineState *ms =3D MACHINE(spapr);
> +    NodeInfo *numa_info =3D ms->numa_state->nodes;
> +    int nb_numa_nodes =3D ms->numa_state->num_nodes;
> +    int distance_table_entries =3D nb_numa_nodes * nb_numa_nodes;
> +    g_autofree uint32_t *lookup_index_table =3D NULL;
> +    g_autofree uint32_t *distance_table =3D NULL;
> +    int src, dst, i, distance_table_size;
> +    uint8_t *node_distances;
> +
> +    /*
> +     * ibm,numa-lookup-index-table: array with length and a
> +     * list of NUMA ids present in the guest.
> +     */
> +    lookup_index_table =3D g_new0(uint32_t, nb_numa_nodes + 1);
> +    lookup_index_table[0] =3D cpu_to_be32(nb_numa_nodes);
> +
> +    for (i =3D 0; i < nb_numa_nodes; i++) {
> +        lookup_index_table[i + 1] =3D cpu_to_be32(i);
> +    }
> +
> +    _FDT(fdt_setprop(fdt, rtas, "ibm,numa-lookup-index-table",
> +                     lookup_index_table,
> +                     (nb_numa_nodes + 1) * sizeof(uint32_t)));
> +
> +    /*
> +     * ibm,numa-distance-table: contains all node distances. First
> +     * element is the size of the table as uint32, followed up
> +     * by all the uint8 distances from the first NUMA node, then all
> +     * distances from the second NUMA node and so on.
> +     *
> +     * ibm,numa-lookup-index-table is used by guest to navigate this
> +     * array because NUMA ids can be sparse (node 0 is the first,
> +     * node 8 is the second ...).
> +     */
> +    distance_table =3D g_new0(uint32_t, distance_table_entries + 1);
> +    distance_table[0] =3D cpu_to_be32(distance_table_entries);
> +
> +    node_distances =3D (uint8_t *)&distance_table[1];
> +    i =3D 0;
> +
> +    for (src =3D 0; src < nb_numa_nodes; src++) {
> +        for (dst =3D 0; dst < nb_numa_nodes; dst++) {
> +            node_distances[i++] =3D numa_info[src].distance[dst];

It looks like you could s/i++/src + dst/ here.

> +        }
> +    }
> +
> +    distance_table_size =3D distance_table_entries * sizeof(uint8_t) +
> +                          sizeof(uint32_t);
> +    _FDT(fdt_setprop(fdt, rtas, "ibm,numa-distance-table",
> +                     distance_table, distance_table_size));
> +}
> +
> +/*
> + * This helper could be compressed in a single function with
> + * FORM1 logic since we're setting the same DT values, with the
> + * difference being a call to spapr_numa_FORM2_write_rtas_tables()
> + * in the end. The separation was made to avoid clogging FORM1 code
> + * which already has to deal with compat modes from previous
> + * QEMU machine types.
> + */
> +static void spapr_numa_FORM2_write_rtas_dt(SpaprMachineState *spapr,
> +                                           void *fdt, int rtas)
> +{
> +    MachineState *ms =3D MACHINE(spapr);
> +    uint32_t number_nvgpus_nodes =3D spapr->gpu_numa_id -
> +                                   spapr_numa_initial_nvgpu_numa_id(ms);
> +
> +    /*
> +     * In FORM2, ibm,associativity-reference-points will point to
> +     * the element in the ibm,associativity array that contains the
> +     * primary domain index. This value (in our case, the numa-id) is
> +     * then used as an index to retrieve all other attributes of the
> +     * node (distance, bandwidth, latency) via ibm,numa-lookup-index-tab=
le
> +     * and other ibm,numa-*-table properties.
> +     */
> +    uint32_t refpoints[] =3D {
> +        cpu_to_be32(0x4),
> +    };
> +
> +    uint32_t nr_refpoints =3D ARRAY_SIZE(refpoints);
> +    uint32_t maxdomain =3D ms->numa_state->num_nodes + number_nvgpus_nod=
es;
> +    uint32_t maxdomains[] =3D {
> +        cpu_to_be32(4),

Maybe use same base for initializers, especially when they land in the same
hunk :) Either dec or hex I don't care.

Rest LGTM.

> +        cpu_to_be32(maxdomain),
> +        cpu_to_be32(maxdomain),
> +        cpu_to_be32(maxdomain),
> +        cpu_to_be32(maxdomain)
> +    };
> +
> +    _FDT(fdt_setprop(fdt, rtas, "ibm,associativity-reference-points",
> +                     refpoints, nr_refpoints * sizeof(refpoints[0])));
> +
> +    _FDT(fdt_setprop(fdt, rtas, "ibm,max-associativity-domains",
> +                     maxdomains, sizeof(maxdomains)));
> +
> +    spapr_numa_FORM2_write_rtas_tables(spapr, fdt, rtas);
> +}
> +
>  static void spapr_numa_FORM1_write_rtas_dt(SpaprMachineState *spapr,
>                                             void *fdt, int rtas)
>  {
> @@ -379,6 +499,11 @@ static void spapr_numa_FORM1_write_rtas_dt(SpaprMach=
ineState *spapr,
>   */
>  void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int r=
tas)
>  {
> +    if (spapr_ovec_test(spapr->ov5_cas, OV5_FORM2_AFFINITY)) {
> +        spapr_numa_FORM2_write_rtas_dt(spapr, fdt, rtas);
> +        return;
> +    }
> +
>      spapr_numa_FORM1_write_rtas_dt(spapr, fdt, rtas);
>  }
> =20
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index 637652ad16..21b1cf9ebf 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -145,6 +145,7 @@ struct SpaprMachineClass {
>      hwaddr rma_limit;          /* clamp the RMA to this size */
>      bool pre_5_1_assoc_refpoints;
>      bool pre_5_2_numa_associativity;
> +    bool pre_6_2_numa_affinity;
> =20
>      bool (*phb_placement)(SpaprMachineState *spapr, uint32_t index,
>                            uint64_t *buid, hwaddr *pio,
> diff --git a/include/hw/ppc/spapr_ovec.h b/include/hw/ppc/spapr_ovec.h
> index 48b716a060..c3e8b98e7e 100644
> --- a/include/hw/ppc/spapr_ovec.h
> +++ b/include/hw/ppc/spapr_ovec.h
> @@ -49,6 +49,7 @@ typedef struct SpaprOptionVector SpaprOptionVector;
>  /* option vector 5 */
>  #define OV5_DRCONF_MEMORY       OV_BIT(2, 2)
>  #define OV5_FORM1_AFFINITY      OV_BIT(5, 0)
> +#define OV5_FORM2_AFFINITY      OV_BIT(5, 2)
>  #define OV5_HP_EVT              OV_BIT(6, 5)
>  #define OV5_HPT_RESIZE          OV_BIT(6, 7)
>  #define OV5_DRMEM_V2            OV_BIT(22, 0)


