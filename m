Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 122F0412D14
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 04:53:18 +0200 (CEST)
Received: from localhost ([::1]:32932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSVuH-00019l-28
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 22:53:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mSVrE-0007Bg-2T; Mon, 20 Sep 2021 22:50:08 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:46223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mSVrA-0007DA-N7; Mon, 20 Sep 2021 22:50:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632192599;
 bh=8G6RgdjWLIOAtwADubN5rGoE7R/ioS8Y1Q4QPKPgEak=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bWAqdXjwsqTNnYNeZF7ZReqpLiXAU8eA0wZe18vSQaFgrynoOvCCyDh/n4p78vuP1
 Yf5odRuJKj7CU4yAhYpy1PrJug16ilPMcjSmNnsMaLZepPltJD5CoZRrJ4IZ37Hj73
 tVUjh++c7+YP0hCQgMg8REB4zEtSSEpS1VHvrvMs=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4HD5WC5QBsz9sW5; Tue, 21 Sep 2021 12:49:59 +1000 (AEST)
Date: Tue, 21 Sep 2021 11:34:40 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v9 6/7] spapr_numa.c: FORM2 NUMA affinity support
Message-ID: <YUk2sCgYtmZ7QAnG@yekko>
References: <20210920174947.556324-1-danielhb413@gmail.com>
 <20210920174947.556324-7-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wjzt09V2ePoVPPol"
Content-Disposition: inline
In-Reply-To: <20210920174947.556324-7-danielhb413@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--wjzt09V2ePoVPPol
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2021 at 02:49:46PM -0300, Daniel Henrique Barboza wrote:
> The main feature of FORM2 affinity support is the separation of NUMA
> distances from ibm,associativity information. This allows for a more
> flexible and straightforward NUMA distance assignment without relying on
> complex associations between several levels of NUMA via
> ibm,associativity matches. Another feature is its extensibility. This base
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
> - get_max_dist_ref_points(), get_numa_assoc_size() and get_associativity()
> now checks for OV5_FORM2_AFFINITY and returns FORM2 values if the guest
> selected FORM2 affinity during CAS.
>=20
> Reviewed-by: Greg Kurz <groug@kaod.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/ppc/spapr.c              |   8 ++
>  hw/ppc/spapr_numa.c         | 146 ++++++++++++++++++++++++++++++++++++
>  include/hw/ppc/spapr.h      |   9 +++
>  include/hw/ppc/spapr_ovec.h |   1 +
>  4 files changed, 164 insertions(+)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index ada85ee083..babb662845 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -2752,6 +2752,11 @@ static void spapr_machine_init(MachineState *machi=
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
> @@ -4667,8 +4672,11 @@ DEFINE_SPAPR_MACHINE(6_2, "6.2", true);
>   */
>  static void spapr_machine_6_1_class_options(MachineClass *mc)
>  {
> +    SpaprMachineClass *smc =3D SPAPR_MACHINE_CLASS(mc);
> +
>      spapr_machine_6_2_class_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
> +    smc->pre_6_2_numa_affinity =3D true;
>  }
> =20
>  DEFINE_SPAPR_MACHINE(6_1, "6.1", false);
> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
> index 6718c0fdd1..13db321997 100644
> --- a/hw/ppc/spapr_numa.c
> +++ b/hw/ppc/spapr_numa.c
> @@ -24,6 +24,10 @@
>   */
>  static int get_max_dist_ref_points(SpaprMachineState *spapr)
>  {
> +    if (spapr_ovec_test(spapr->ov5_cas, OV5_FORM2_AFFINITY)) {
> +        return FORM2_DIST_REF_POINTS;
> +    }
> +
>      return FORM1_DIST_REF_POINTS;
>  }
> =20
> @@ -32,6 +36,10 @@ static int get_max_dist_ref_points(SpaprMachineState *=
spapr)
>   */
>  static int get_numa_assoc_size(SpaprMachineState *spapr)
>  {
> +    if (spapr_ovec_test(spapr->ov5_cas, OV5_FORM2_AFFINITY)) {
> +        return FORM2_NUMA_ASSOC_SIZE;
> +    }
> +
>      return FORM1_NUMA_ASSOC_SIZE;
>  }
> =20
> @@ -52,6 +60,9 @@ static int get_vcpu_assoc_size(SpaprMachineState *spapr)
>   */
>  static const uint32_t *get_associativity(SpaprMachineState *spapr, int n=
ode_id)
>  {
> +    if (spapr_ovec_test(spapr->ov5_cas, OV5_FORM2_AFFINITY)) {
> +        return spapr->FORM2_assoc_array[node_id];
> +    }
>      return spapr->FORM1_assoc_array[node_id];
>  }
> =20
> @@ -295,14 +306,50 @@ static void spapr_numa_FORM1_affinity_init(SpaprMac=
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
> +     * Given that this initialization is also valid for GPU associativity
> +     * arrays, handle everything in one single step by populating the
> +     * arrays up to NUMA_NODES_MAX_NUM.
> +     */
> +    for (i =3D 0; i < NUMA_NODES_MAX_NUM; i++) {
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
>  }
> =20
>  void spapr_numa_associativity_check(SpaprMachineState *spapr)
>  {
> +    /*
> +     * FORM2 does not have any restrictions we need to handle
> +     * at CAS time, for now.
> +     */
> +    if (spapr_ovec_test(spapr->ov5_cas, OV5_FORM2_AFFINITY)) {
> +        return;
> +    }
> +
>      spapr_numa_FORM1_affinity_check(MACHINE(spapr));
>  }
> =20
> @@ -447,6 +494,100 @@ static void spapr_numa_FORM1_write_rtas_dt(SpaprMac=
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

You're allocating significantly more than you need here, since the
actual distance entries are u8, not u32.  That can be fixed as a
followup, however.

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
> +    uint32_t maxdomains[] =3D { cpu_to_be32(1), cpu_to_be32(maxdomain) };
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
> @@ -454,6 +595,11 @@ static void spapr_numa_FORM1_write_rtas_dt(SpaprMach=
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
> index 6b3dfc5dc2..ee7504b976 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -118,6 +118,13 @@ typedef enum {
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
>  typedef struct SpaprCapabilities SpaprCapabilities;
>  struct SpaprCapabilities {
>      uint8_t caps[SPAPR_CAP_NUM];
> @@ -145,6 +152,7 @@ struct SpaprMachineClass {
>      hwaddr rma_limit;          /* clamp the RMA to this size */
>      bool pre_5_1_assoc_refpoints;
>      bool pre_5_2_numa_associativity;
> +    bool pre_6_2_numa_affinity;
> =20
>      bool (*phb_placement)(SpaprMachineState *spapr, uint32_t index,
>                            uint64_t *buid, hwaddr *pio,
> @@ -250,6 +258,7 @@ struct SpaprMachineState {
>      SpaprTpmProxy *tpm_proxy;
> =20
>      uint32_t FORM1_assoc_array[NUMA_NODES_MAX_NUM][FORM1_NUMA_ASSOC_SIZE=
];
> +    uint32_t FORM2_assoc_array[NUMA_NODES_MAX_NUM][FORM2_NUMA_ASSOC_SIZE=
];
> =20
>      Error *fwnmi_migration_blocker;
>  };
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

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--wjzt09V2ePoVPPol
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFJNq0ACgkQbDjKyiDZ
s5KdVw//Udsxqo6qe8XH1BAXhHLoHk9N6WxxHJzph5MkOS5R51mrPZ4DmzoqDT54
QuEi5Z9u2VSvUuPxbFfqLYG4HO0Y06gE+8jKE5ICbd3nSbvywQGdCpXvXOUkZCYR
sc4rVJZ8r+y81cAdn+uuSPGIngqUURFe4u2vQXEFoql+Tp18EpWLV8aXrPSReHRH
VohA+MAgRRvKveFtCavUK00EOkmZz+cVL/W+i1p/FDXVIl8KOlXERzNjkTd7xBQZ
WMADqZ0Yn56JS9uAtjpbNCeJ9Vc0jWEbnWz5ueWuwt6BY2S3g9RBNNgiJiPODRrN
pk1jDvEOIt7v/63c3rlnkq9IljqrMWAoDtrlMfvQ9gxX3LHIsVSQwgr/fM7GAIPH
qpyQz76A1pYhUXnMbEQZ8bNcjSnyinRmfwENrDkwnBheOaAf99BbmHdfTAb4Nlij
jsY22yOuWPRZGRtQWR70lkHc9srkK4/uNaTLbKTQAyuaxyjCFHbcMr+zBJHFnqoA
BU5CqCro20kGb7t3tFlpXreCDxvK0vqefNlAhw/IwRFlE8Ki4qAW38bh2IrqkyN2
AU5gOdmVUxPquOGoeKqAMAan0/yuSZ2Km083kq68LMy6JtjO3qTZZTi6Nrp9xcTf
oNi1fp3KVAXNi8/+1m9DTxxpc+Arzv22dadT8QeJTmW+/kiX9z8=
=GbwD
-----END PGP SIGNATURE-----

--wjzt09V2ePoVPPol--

