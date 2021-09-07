Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E95574021BF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 03:09:38 +0200 (CEST)
Received: from localhost ([::1]:57822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNPcH-0007xt-Ul
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 21:09:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mNPXD-0004oK-M1; Mon, 06 Sep 2021 21:04:25 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:50607 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mNPXA-0005xC-5K; Mon, 06 Sep 2021 21:04:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630976654;
 bh=j4CJBYhCxT5wU0YStC9ZF0fvkufb+Y9oA7J+HmoxKxg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NnRyKj5pIHjUrF+1lKHl5XlkAlnf2ED/2MtDZIBHQXj+TMMB75mxKhK6HnDyblxKz
 sZM//qTVkqQF3YLl7shwmR+4j/HgVZTcm02SGWToZedOlYWLwP3ygaTJjxKD87XV8b
 AQAvvIygQQ+SyV30nSRa7S8hFCZpMIvh94fhYOlU=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H3Rqf6XfHz9sW4; Tue,  7 Sep 2021 11:04:14 +1000 (AEST)
Date: Tue, 7 Sep 2021 11:02:05 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v5 3/4] spapr_numa.c: base FORM2 NUMA affinity support
Message-ID: <YTa6DUxTo2os9EIZ@yekko>
References: <20210907002527.412013-1-danielhb413@gmail.com>
 <20210907002527.412013-4-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qAPTbvhj2D2+YkWh"
Content-Disposition: inline
In-Reply-To: <20210907002527.412013-4-danielhb413@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


--qAPTbvhj2D2+YkWh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 06, 2021 at 09:25:26PM -0300, Daniel Henrique Barboza wrote:
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
> - call spapr_numa_associativity_reset() in do_client_architecture_support=
()
> if FORM2 is chosen. This will avoid re-initializing FORM1 artifacts that
> were already initialized in spapr_machine_reset();
>=20
> - ibm,associativity-reference-points has a new semantic. Instead of
> being used to calculate distances via NUMA levels, it's now used to
> indicate the primary domain index in the ibm,associativity domain of
> each resource. In our case it's set to {0x4}, matching the position
> where we already place logical_domain_id;

Hmm... I'm a bit torn on this.  The whole reason the ibm,associativity
things are arrays rather than just numbers was to enable the FORM1
nonsense. So we have a choice here: keep the associativity arrays in
the same form, for simplicity of the code, or reduce the associativity
arrays to one entry for FORM2, to simplify the overall DT contents in
the "modern" case.

> - two new RTAS DT artifacts are introduced: ibm,numa-lookup-index-table

This doesn't really have anything to do with RTAS.

> and ibm,numa-distance-table. The index table is used to list all the
> NUMA logical domains of the platform, in ascending order, and allows for
> spartial NUMA configurations (although QEMU ATM doesn't support
> that).

s/spartial/partial/

Perhaps more to the point, it allows for sparsely allocated domain
IDs.

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
>  hw/ppc/spapr.c              |  24 +++++++
>  hw/ppc/spapr_hcall.c        |  10 +++
>  hw/ppc/spapr_numa.c         | 135 +++++++++++++++++++++++++++++++++++-
>  include/hw/ppc/spapr.h      |   1 +
>  include/hw/ppc/spapr_ovec.h |   1 +
>  5 files changed, 170 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 8e1ff6cd10..8d98e3b08a 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1789,6 +1789,22 @@ static int spapr_post_load(void *opaque, int versi=
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
> +     * One solution is to always call numa_associativity_reset. The
> +     * downside is that a guest migrated before CAS will run
> +     * numa_associativity_reset again when going through it, but
> +     * at least we're making sure spapr->numa_assoc_array will be
> +     * initialized and hotplug operations won't fail in both before
> +     * and after CAS migration cases.
> +     */
> +     spapr_numa_associativity_reset(spapr);
> +
>      return err;
>  }
> =20
> @@ -2755,6 +2771,11 @@ static void spapr_machine_init(MachineState *machi=
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
> @@ -4700,8 +4721,11 @@ DEFINE_SPAPR_MACHINE(6_2, "6.2", true);
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
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 0e9a5b2e40..7efbe93f4b 100644
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
> @@ -1197,6 +1198,15 @@ target_ulong do_client_architecture_support(PowerP=
CCPU *cpu,
>      spapr->cas_pre_isa3_guest =3D !spapr_ovec_test(ov1_guest, OV1_PPC_3_=
00);
>      spapr_ovec_cleanup(ov1_guest);
> =20
> +    /*
> +     * If the guest chooses FORM2 we need to reset the associativity
> +     * information - it is being defaulted to FORM1 during
> +     * spapr_machine_reset().
> +     */
> +    if (spapr_ovec_test(spapr->ov5_cas, OV5_FORM2_AFFINITY)) {
> +        spapr_numa_associativity_reset(spapr);
> +    }
> +
>      /*
>       * Ensure the guest asks for an interrupt mode we support;
>       * otherwise terminate the boot.
> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
> index 84636cb86a..ca276e16cb 100644
> --- a/hw/ppc/spapr_numa.c
> +++ b/hw/ppc/spapr_numa.c
> @@ -202,6 +202,24 @@ void spapr_numa_associativity_reset(SpaprMachineStat=
e *spapr)
>          spapr->numa_assoc_array[i][0] =3D cpu_to_be32(MAX_DISTANCE_REF_P=
OINTS);
>          spapr->numa_assoc_array[i][MAX_DISTANCE_REF_POINTS] =3D cpu_to_b=
e32(i);
> =20
> +        /*
> +         * For FORM2 affinity, zero all the non-used associativity
> +         * domains (all domains but the last). This step is necessary
> +         * because FORM2 will always be populated on top of FORM1
> +         * (via spapr_machine_reset()), which populates them.
> +         *
> +         * The kernel doesn't mind these non-used domains but zeroing
> +         * them out makes it clearer to userspace that they are not
> +         * being used.

Huh... so you are clearing the entries in any case.  Wouldn't it make
more sense to just make all the arrays 1 entry long for FORM2?

> +         */
> +        if (spapr_ovec_test(spapr->ov5_cas, OV5_FORM2_AFFINITY)) {
> +            for (j =3D 1; j < MAX_DISTANCE_REF_POINTS; j++) {
> +                spapr->numa_assoc_array[i][j] =3D 0;
> +            }
> +
> +            continue;
> +        }
> +
>          /*
>           * Fill all associativity domains of non-zero NUMA nodes with
>           * node_id. This is required because the default value (0) is
> @@ -236,7 +254,16 @@ void spapr_numa_associativity_reset(SpaprMachineStat=
e *spapr)
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
> @@ -313,6 +340,107 @@ int spapr_numa_write_assoc_lookup_arrays(SpaprMachi=
neState *spapr, void *fdt,
>      return ret;
>  }
> =20
> +static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
> +                                               void *fdt, int rtas)

Again, not really related to RTAS at all... oh except for appearing in
the /rtas node, ok I see your point.  I'd still probably dump the
"rtas" from the function name.

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

This comment seems a little misleading.  The ids can be sparse in
PAPR, but they're not as we've constructed them above.

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
> +        cpu_to_be32(maxdomain),
> +        cpu_to_be32(maxdomain),
> +        cpu_to_be32(maxdomain),
> +        cpu_to_be32(maxdomain)

This doesn't seem right, since you only ever use 0 for the top 3
domain ID levels.  Again, wouldn't this be simplifed by just making
the first entry 1, along with every associativity array?

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
> @@ -379,6 +507,11 @@ static void spapr_numa_FORM1_write_rtas_dt(SpaprMach=
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

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--qAPTbvhj2D2+YkWh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmE2ugsACgkQbDjKyiDZ
s5KkYg//ZoxqCvla97n03jN4C4RUDDpknCpKzrra7jA6XeAtganqntDvsPhNhax/
3KzJXGKWEI8lyuUNFrftfiO0diX2uXAek7T2w90mli2VLFlRqnqiQcVQqzi1nV+m
tHHUOyah//vNgcDCL8OHbqxP0Sh/GMxJqdo3GLl7pqnQS34RxiLbPOp8s/JRH6XU
GVjfG+ovbrYSw3hLGsKqwV0tMWrfuZ7ORDI8LYdouk/g8h5K7gY8FP9FgL57jtXy
DDURdxKgNcp67s6dpkpu56au4uzC1suThNLh5a5cdN8ggf6QjOlzeV9Ou5gjORfX
zD/SLLrNvT6MO/JxO6fz5ryUNOEjWRzvqPvBj8FijPz3dsbzZoEnFzJXCvYngEsz
4BAl87ecBDIX66in8PWdifhjvfydRqds6bk2Yt4PawDY1X207BcTaUCB+fVnZG21
nUNchxtCHo7fUbS0EdvGqu4CJhwOhEQnTLBOWyhfHVA3ixX73pLqOze4IVCX4ntm
lEDbsNCkhNIuDXx8Ic/kk1fkYptEhPGck57M9AoOXsJv8tLubGUP4JcGKpunFUtm
xcM2c+oj4n5wuYwtY53nPIDmdjJGPUorgoVer9NW8WLmA785OoPfzUx8wJmkCfLu
J0VU/ayBwpWEWjHBifmNgMU3eqO0EXXuo8JS0+V4HMIghUwqs3o=
=6RUX
-----END PGP SIGNATURE-----

--qAPTbvhj2D2+YkWh--

