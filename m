Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 213A740AE82
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 15:03:25 +0200 (CEST)
Received: from localhost ([::1]:49414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ85s-0006YW-5S
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 09:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mQ80x-00034P-Sh
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 08:58:22 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:36983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mQ80u-0006TF-EC
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 08:58:19 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-hFI80A-PMmugMyDpTkhB2A-1; Tue, 14 Sep 2021 08:58:10 -0400
X-MC-Unique: hFI80A-PMmugMyDpTkhB2A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73EA51B18BC3;
 Tue, 14 Sep 2021 12:58:09 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.206])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF3F760C7F;
 Tue, 14 Sep 2021 12:58:07 +0000 (UTC)
Date: Tue, 14 Sep 2021 14:58:04 +0200
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v6 6/6] spapr_numa.c: FORM2 NUMA affinity support
Message-ID: <20210914145804.4c8c7ebe@bahia.huguette>
In-Reply-To: <20210910195539.797170-7-danielhb413@gmail.com>
References: <20210910195539.797170-1-danielhb413@gmail.com>
 <20210910195539.797170-7-danielhb413@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

On Fri, 10 Sep 2021 16:55:39 -0300
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
> - get_max_dist_ref_points() and get_numa_assoc_size() now checks for
> OV5_FORM2_AFFINITY and returns FORM2 values if the guest selected FORM2
> affinity during CAS.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/ppc/spapr.c              |   8 ++
>  hw/ppc/spapr_numa.c         | 151 +++++++++++++++++++++++++++++++++++-
>  include/hw/ppc/spapr.h      |   2 +
>  include/hw/ppc/spapr_ovec.h |   1 +
>  4 files changed, 159 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 0703a26093..23aba5ae2d 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -2766,6 +2766,11 @@ static void spapr_machine_init(MachineState *machi=
ne)
> =20
>      spapr_ovec_set(spapr->ov5, OV5_FORM1_AFFINITY);
> =20
> +    /* Do not advertise FORM2 NUMA support for pseries-6.1 and older */
> +    if (!smc->pre_6_2_numa_affinity) {
> +        spapr_ovec_set(spapr->ov5, OV5_FORM2_AFFINITY);
> +    }
> +
>      /* advertise support for dedicated HP event source to guests */
>      if (spapr->use_hotplug_event_source) {
>          spapr_ovec_set(spapr->ov5, OV5_HP_EVT);
> @@ -4681,8 +4686,11 @@ DEFINE_SPAPR_MACHINE(6_2, "6.2", true);
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
> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
> index 0ade63c2d3..dd52b8921c 100644
> --- a/hw/ppc/spapr_numa.c
> +++ b/hw/ppc/spapr_numa.c
> @@ -31,12 +31,22 @@
>  #define FORM1_DIST_REF_POINTS            4
>  #define FORM1_NUMA_ASSOC_SIZE            (FORM1_DIST_REF_POINTS + 1)
> =20
> +/*
> + * FORM2 NUMA affinity has a single associativity domain, giving
> + * us a assoc size of 2.
> + */
> +#define FORM2_DIST_REF_POINTS            1
> +#define FORM2_NUMA_ASSOC_SIZE            (FORM2_DIST_REF_POINTS + 1)
> +
>  /*
>   * Retrieves max_dist_ref_points of the current NUMA affinity.
>   */
>  static int get_max_dist_ref_points(SpaprMachineState *spapr)
>  {
> -    /* No FORM2 affinity implemented yet */
> +    if (spapr_ovec_test(spapr->ov5_cas, OV5_FORM2_AFFINITY)) {
> +        return FORM2_DIST_REF_POINTS;
> +    }
> +
>      return FORM1_DIST_REF_POINTS;
>  }
> =20
> @@ -45,7 +55,10 @@ static int get_max_dist_ref_points(SpaprMachineState *=
spapr)
>   */
>  static int get_numa_assoc_size(SpaprMachineState *spapr)
>  {
> -    /* No FORM2 affinity implemented yet */
> +    if (spapr_ovec_test(spapr->ov5_cas, OV5_FORM2_AFFINITY)) {
> +        return FORM2_NUMA_ASSOC_SIZE;
> +    }
> +
>      return FORM1_NUMA_ASSOC_SIZE;
>  }
> =20
> @@ -305,10 +318,39 @@ static void spapr_numa_FORM1_affinity_init(SpaprMac=
hineState *spapr,
>      spapr_numa_define_FORM1_domains(spapr);
>  }
> =20
> +/*
> + * Init NUMA FORM2 machine state data
> + */
> +static void spapr_numa_FORM2_affinity_init(SpaprMachineState *spapr)
> +{
> +    int i;
> +
> +    /*
> +     * For all resources but CPUs, FORM2 associativity arrays will
> +     * be a size 2 array with the following format:
> +     *
> +     * ibm,associativity =3D {1, numa_id}
> +     *
> +     * CPUs will write an additional 'vcpu_id' on top of the arrays
> +     * being initialized here. 'numa_id' is represented by the
> +     * index 'i' of the loop.
> +     *
> +     * Given that this initialization is also valid for GPU associativit=
y
> +     * arrays, handle everything in one single step by populating the
> +     * arrays up to NUMA_NODES_MAX_NUM.
> +     */
> +    for (i =3D 0; i < NUMA_NODES_MAX_NUM; i++) {
> +        spapr->FORM2_assoc_array[i] =3D g_new0(uint32_t, 2);

Same remark as with FORM1 for dynamic allocation.

> +        spapr->FORM2_assoc_array[i][0] =3D cpu_to_be32(1);
> +        spapr->FORM2_assoc_array[i][1] =3D cpu_to_be32(i);
> +    }
> +}
> +
>  void spapr_numa_associativity_init(SpaprMachineState *spapr,
>                                     MachineState *machine)
>  {
>      spapr_numa_FORM1_affinity_init(spapr, machine);
> +    spapr_numa_FORM2_affinity_init(spapr);
> =20
>      /*
>       * Default to FORM1 affinity until CAS. We'll call affinity_reset()
> @@ -326,7 +368,11 @@ void spapr_numa_associativity_init(SpaprMachineState=
 *spapr,
>  void spapr_numa_associativity_reset(SpaprMachineState *spapr,
>                                      bool post_CAS_check)
>  {
> -    /* No FORM2 affinity implemented yet */
> +    if (spapr_ovec_test(spapr->ov5_cas, OV5_FORM2_AFFINITY)) {
> +        spapr->numa_assoc_array =3D spapr->FORM2_assoc_array;
> +        return;
> +    }
> +
>      spapr->numa_assoc_array =3D spapr->FORM1_assoc_array;
> =20
>      if (post_CAS_check) {
> @@ -471,6 +517,100 @@ static void spapr_numa_FORM1_write_rtas_dt(SpaprMac=
hineState *spapr,
>                       maxdomains, sizeof(maxdomains)));
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

Well... indeed both functions populate the same properties in the DT,
but that's about the only common thing between FORM1 and FORM2. The
contents are different and so are the ways they are computed. This
load of differences is the motivation to have distinct implementations.

Not sure it is worth adding a comment that basically says "we could
have come up with a works-for-all clogged helper but we decided to
go for separate and easier code paths". This is clearly visible with
the resulting code.

Also to make this even more obvious you could open-code
spapr_numa_FORM2_write_rtas_tables() in spapr_numa_FORM2_write_rtas_dt()
since it is its only user.

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
> +     * primary domain index (for FORM2, the first element).
> +     *
> +     * This value (in our case, the numa-id) is then used as an index
> +     * to retrieve all other attributes of the node (distance,
> +     * bandwidth, latency) via ibm,numa-lookup-index-table and other
> +     * ibm,numa-*-table properties.
> +     */
> +    uint32_t refpoints[] =3D { cpu_to_be32(1) };
> +
> +    uint32_t maxdomain =3D ms->numa_state->num_nodes + number_nvgpus_nod=
es;
> +    uint32_t maxdomains[] =3D { cpu_to_be32(1), cpu_to_be32(maxdomain) }=
;
> +
> +    _FDT(fdt_setprop(fdt, rtas, "ibm,associativity-reference-points",
> +                     refpoints, sizeof(refpoints)));
> +
> +    _FDT(fdt_setprop(fdt, rtas, "ibm,max-associativity-domains",
> +                     maxdomains, sizeof(maxdomains)));
> +
> +    spapr_numa_FORM2_write_rtas_tables(spapr, fdt, rtas);
> +}
> +
>  /*
>   * Helper that writes ibm,associativity-reference-points and
>   * max-associativity-domains in the RTAS pointed by @rtas
> @@ -478,6 +618,11 @@ static void spapr_numa_FORM1_write_rtas_dt(SpaprMach=
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
> index 2554928250..2a4502b65d 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -133,6 +133,7 @@ struct SpaprMachineClass {
>      hwaddr rma_limit;          /* clamp the RMA to this size */
>      bool pre_5_1_assoc_refpoints;
>      bool pre_5_2_numa_associativity;
> +    bool pre_6_2_numa_affinity;
> =20
>      bool (*phb_placement)(SpaprMachineState *spapr, uint32_t index,
>                            uint64_t *buid, hwaddr *pio,
> @@ -238,6 +239,7 @@ struct SpaprMachineState {
>      SpaprTpmProxy *tpm_proxy;
> =20
>      uint32_t *FORM1_assoc_array[NUMA_NODES_MAX_NUM];
> +    uint32_t *FORM2_assoc_array[NUMA_NODES_MAX_NUM];
>      uint32_t **numa_assoc_array;
> =20
>      Error *fwnmi_migration_blocker;
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


