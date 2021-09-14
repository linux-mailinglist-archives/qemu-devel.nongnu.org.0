Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2231640AD44
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 14:14:51 +0200 (CEST)
Received: from localhost ([::1]:54704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ7Ks-0008Ob-7m
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 08:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mQ7H9-0005jy-CH
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 08:10:59 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:44568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mQ7H7-0003rb-4P
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 08:10:59 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-YtmCtZ2xMHeRufuwjTmDUw-1; Tue, 14 Sep 2021 08:10:53 -0400
X-MC-Unique: YtmCtZ2xMHeRufuwjTmDUw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 198561808329;
 Tue, 14 Sep 2021 12:10:52 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.206])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D584360C7F;
 Tue, 14 Sep 2021 12:10:50 +0000 (UTC)
Date: Tue, 14 Sep 2021 14:10:49 +0200
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v6 4/6] spapr_numa.c: parametrize FORM1 macros
Message-ID: <20210914141049.04322b1d@bahia.huguette>
In-Reply-To: <20210910195539.797170-5-danielhb413@gmail.com>
References: <20210910195539.797170-1-danielhb413@gmail.com>
 <20210910195539.797170-5-danielhb413@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

On Fri, 10 Sep 2021 16:55:37 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> The next preliminary step to introduce NUMA FORM2 affinity is to make
> the existing code independent of FORM1 macros and values, i.e.
> MAX_DISTANCE_REF_POINTS, NUMA_ASSOC_SIZE and VCPU_ASSOC_SIZE. This patch
> accomplishes that by doing the following:
>=20
> - move the NUMA related macros from spapr.h to spapr_numa.c where they
> are used. spapr.h gets instead a 'NUMA_NODES_MAX_NUM' macro that is used
> to refer to the maximum number of NUMA nodes, including GPU nodes, that
> the machine can support;
>=20
> - MAX_DISTANCE_REF_POINTS and NUMA_ASSOC_SIZE are renamed to
> FORM1_DIST_REF_POINTS and FORM1_NUMA_ASSOC_SIZE. These FORM1 specific
> macros are used in FORM1 init functions;
>=20
> - code that uses MAX_DISTANCE_REF_POINTS now retrieves the
> max_dist_ref_points value using get_max_dist_ref_points().
> NUMA_ASSOC_SIZE is replaced by get_numa_assoc_size() and VCPU_ASSOC_SIZE
> is replaced by get_vcpu_assoc_size(). These functions are used by the
> generic device tree functions and h_home_node_associativity() and will
> allow them to switch between FORM1 and FORM2 without changing their core
> logic.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---

I'd prefer this patch to go before patch 3 so that we get a
clear distinction between FORM1 and common code, before we
starting adding new paths.

LGTM appart from that.

>  hw/ppc/spapr_numa.c    | 93 +++++++++++++++++++++++++++++++-----------
>  include/hw/ppc/spapr.h | 22 +++-------
>  2 files changed, 74 insertions(+), 41 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
> index 327952ba9e..7ad4b6582b 100644
> --- a/hw/ppc/spapr_numa.c
> +++ b/hw/ppc/spapr_numa.c
> @@ -19,6 +19,47 @@
>  /* Moved from hw/ppc/spapr_pci_nvlink2.c */
>  #define SPAPR_GPU_NUMA_ID           (cpu_to_be32(1))
> =20
> +/*
> + * NUMA FORM1 macros. FORM1_DIST_REF_POINTS was taken from
> + * MAX_DISTANCE_REF_POINTS in arch/powerpc/mm/numa.h from Linux
> + * kernel source. It represents the amount of associativity domains
> + * for non-CPU resources.
> + *
> + * FORM1_NUMA_ASSOC_SIZE is the base array size of an ibm,associativity
> + * array for any non-CPU resource.
> + */
> +#define FORM1_DIST_REF_POINTS            4
> +#define FORM1_NUMA_ASSOC_SIZE            (FORM1_DIST_REF_POINTS + 1)
> +
> +/*
> + * Retrieves max_dist_ref_points of the current NUMA affinity.
> + */
> +static int get_max_dist_ref_points(SpaprMachineState *spapr)
> +{
> +    /* No FORM2 affinity implemented yet */
> +    return FORM1_DIST_REF_POINTS;
> +}
> +
> +/*
> + * Retrieves numa_assoc_size of the current NUMA affinity.
> + */
> +static int get_numa_assoc_size(SpaprMachineState *spapr)
> +{
> +    /* No FORM2 affinity implemented yet */
> +    return FORM1_NUMA_ASSOC_SIZE;
> +}
> +
> +/*
> + * Retrieves vcpu_assoc_size of the current NUMA affinity.
> + *
> + * vcpu_assoc_size is the size of ibm,associativity array
> + * for CPUs, which has an extra element (vcpu_id) in the end.
> + */
> +static int get_vcpu_assoc_size(SpaprMachineState *spapr)
> +{
> +    return get_numa_assoc_size(spapr) + 1;
> +}
> +
>  static bool spapr_numa_is_symmetrical(MachineState *ms)
>  {
>      int src, dst;
> @@ -96,7 +137,7 @@ static void spapr_numa_define_FORM1_domains(SpaprMachi=
neState *spapr)
>       * considered a match with associativity domains of node 0.
>       */
>      for (i =3D 1; i < nb_numa_nodes; i++) {
> -        for (j =3D 1; j < MAX_DISTANCE_REF_POINTS; j++) {
> +        for (j =3D 1; j < FORM1_DIST_REF_POINTS; j++) {
>              spapr->FORM1_assoc_array[i][j] =3D cpu_to_be32(i);
>          }
>      }
> @@ -134,7 +175,7 @@ static void spapr_numa_define_FORM1_domains(SpaprMach=
ineState *spapr)
>               *
>               * The Linux kernel will assume that the distance between sr=
c and
>               * dst, in this case of no match, is 10 (local distance) dou=
bled
> -             * for each NUMA it didn't match. We have MAX_DISTANCE_REF_P=
OINTS
> +             * for each NUMA it didn't match. We have FORM1_DIST_REF_POI=
NTS
>               * levels (4), so this gives us 10*2*2*2*2 =3D 160.
>               *
>               * This logic can be seen in the Linux kernel source code, a=
s of
> @@ -168,13 +209,13 @@ static void spapr_numa_FORM1_affinity_init(SpaprMac=
hineState *spapr,
>      int i, j, max_nodes_with_gpus;
> =20
>      /* init FORM1_assoc_array */
> -    for (i =3D 0; i < MAX_NODES + NVGPU_MAX_NUM; i++) {
> -        spapr->FORM1_assoc_array[i] =3D g_new0(uint32_t, NUMA_ASSOC_SIZE=
);
> +    for (i =3D 0; i < NUMA_NODES_MAX_NUM; i++) {
> +        spapr->FORM1_assoc_array[i] =3D g_new0(uint32_t, FORM1_NUMA_ASSO=
C_SIZE);
>      }
> =20
>      /*
>       * For all associativity arrays: first position is the size,
> -     * position MAX_DISTANCE_REF_POINTS is always the numa_id,
> +     * position FORM1_DIST_REF_POINTS is always the numa_id,
>       * represented by the index 'i'.
>       *
>       * This will break on sparse NUMA setups, when/if QEMU starts
> @@ -182,8 +223,8 @@ static void spapr_numa_FORM1_affinity_init(SpaprMachi=
neState *spapr,
>       * 'i' will be a valid node_id set by the user.
>       */
>      for (i =3D 0; i < nb_numa_nodes; i++) {
> -        spapr->FORM1_assoc_array[i][0] =3D cpu_to_be32(MAX_DISTANCE_REF_=
POINTS);
> -        spapr->FORM1_assoc_array[i][MAX_DISTANCE_REF_POINTS] =3D cpu_to_=
be32(i);
> +        spapr->FORM1_assoc_array[i][0] =3D cpu_to_be32(FORM1_DIST_REF_PO=
INTS);
> +        spapr->FORM1_assoc_array[i][FORM1_DIST_REF_POINTS] =3D cpu_to_be=
32(i);
>      }
> =20
>      /*
> @@ -197,15 +238,15 @@ static void spapr_numa_FORM1_affinity_init(SpaprMac=
hineState *spapr,
>      max_nodes_with_gpus =3D nb_numa_nodes + NVGPU_MAX_NUM;
> =20
>      for (i =3D nb_numa_nodes; i < max_nodes_with_gpus; i++) {
> -        spapr->FORM1_assoc_array[i][0] =3D cpu_to_be32(MAX_DISTANCE_REF_=
POINTS);
> +        spapr->FORM1_assoc_array[i][0] =3D cpu_to_be32(FORM1_DIST_REF_PO=
INTS);
> =20
> -        for (j =3D 1; j < MAX_DISTANCE_REF_POINTS; j++) {
> +        for (j =3D 1; j < FORM1_DIST_REF_POINTS; j++) {
>              uint32_t gpu_assoc =3D smc->pre_5_1_assoc_refpoints ?
>                                   SPAPR_GPU_NUMA_ID : cpu_to_be32(i);
>              spapr->FORM1_assoc_array[i][j] =3D gpu_assoc;
>          }
> =20
> -        spapr->FORM1_assoc_array[i][MAX_DISTANCE_REF_POINTS] =3D cpu_to_=
be32(i);
> +        spapr->FORM1_assoc_array[i][FORM1_DIST_REF_POINTS] =3D cpu_to_be=
32(i);
>      }
> =20
>      /*
> @@ -255,16 +296,17 @@ void spapr_numa_associativity_reset(SpaprMachineSta=
te *spapr)
>  void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *f=
dt,
>                                         int offset, int nodeid)
>  {
> -    /* Hardcode the size of FORM1 associativity array for now */
>      _FDT((fdt_setprop(fdt, offset, "ibm,associativity",
>                        spapr->numa_assoc_array[nodeid],
> -                      NUMA_ASSOC_SIZE * sizeof(uint32_t))));
> +                      get_numa_assoc_size(spapr) * sizeof(uint32_t))));
>  }
> =20
>  static uint32_t *spapr_numa_get_vcpu_assoc(SpaprMachineState *spapr,
>                                             PowerPCCPU *cpu)
>  {
> -    uint32_t *vcpu_assoc =3D g_new(uint32_t, VCPU_ASSOC_SIZE);
> +    int max_distance_ref_points =3D get_max_dist_ref_points(spapr);
> +    int vcpu_assoc_size =3D get_vcpu_assoc_size(spapr);
> +    uint32_t *vcpu_assoc =3D g_new(uint32_t, vcpu_assoc_size);
>      int index =3D spapr_get_vcpu_id(cpu);
> =20
>      /*
> @@ -273,10 +315,10 @@ static uint32_t *spapr_numa_get_vcpu_assoc(SpaprMac=
hineState *spapr,
>       * 0, put cpu_id last, then copy the remaining associativity
>       * domains.
>       */
> -    vcpu_assoc[0] =3D cpu_to_be32(MAX_DISTANCE_REF_POINTS + 1);
> -    vcpu_assoc[VCPU_ASSOC_SIZE - 1] =3D cpu_to_be32(index);
> +    vcpu_assoc[0] =3D cpu_to_be32(max_distance_ref_points + 1);
> +    vcpu_assoc[vcpu_assoc_size - 1] =3D cpu_to_be32(index);
>      memcpy(vcpu_assoc + 1, spapr->numa_assoc_array[cpu->node_id] + 1,
> -           (VCPU_ASSOC_SIZE - 2) * sizeof(uint32_t));
> +           (vcpu_assoc_size - 2) * sizeof(uint32_t));
> =20
>      return vcpu_assoc;
>  }
> @@ -285,12 +327,13 @@ int spapr_numa_fixup_cpu_dt(SpaprMachineState *spap=
r, void *fdt,
>                              int offset, PowerPCCPU *cpu)
>  {
>      g_autofree uint32_t *vcpu_assoc =3D NULL;
> +    int vcpu_assoc_size =3D get_vcpu_assoc_size(spapr);
> =20
>      vcpu_assoc =3D spapr_numa_get_vcpu_assoc(spapr, cpu);
> =20
>      /* Advertise NUMA via ibm,associativity */
>      return fdt_setprop(fdt, offset, "ibm,associativity", vcpu_assoc,
> -                       VCPU_ASSOC_SIZE * sizeof(uint32_t));
> +                       vcpu_assoc_size * sizeof(uint32_t));
>  }
> =20
> =20
> @@ -298,17 +341,18 @@ int spapr_numa_write_assoc_lookup_arrays(SpaprMachi=
neState *spapr, void *fdt,
>                                           int offset)
>  {
>      MachineState *machine =3D MACHINE(spapr);
> +    int max_distance_ref_points =3D get_max_dist_ref_points(spapr);
>      int nb_numa_nodes =3D machine->numa_state->num_nodes;
>      int nr_nodes =3D nb_numa_nodes ? nb_numa_nodes : 1;
>      uint32_t *int_buf, *cur_index, buf_len;
>      int ret, i;
> =20
>      /* ibm,associativity-lookup-arrays */
> -    buf_len =3D (nr_nodes * MAX_DISTANCE_REF_POINTS + 2) * sizeof(uint32=
_t);
> +    buf_len =3D (nr_nodes * max_distance_ref_points + 2) * sizeof(uint32=
_t);
>      cur_index =3D int_buf =3D g_malloc0(buf_len);
>      int_buf[0] =3D cpu_to_be32(nr_nodes);
>       /* Number of entries per associativity list */
> -    int_buf[1] =3D cpu_to_be32(MAX_DISTANCE_REF_POINTS);
> +    int_buf[1] =3D cpu_to_be32(max_distance_ref_points);
>      cur_index +=3D 2;
>      for (i =3D 0; i < nr_nodes; i++) {
>          /*
> @@ -317,8 +361,8 @@ int spapr_numa_write_assoc_lookup_arrays(SpaprMachine=
State *spapr, void *fdt,
>           */
>          uint32_t *associativity =3D spapr->numa_assoc_array[i];
>          memcpy(cur_index, ++associativity,
> -               sizeof(uint32_t) * MAX_DISTANCE_REF_POINTS);
> -        cur_index +=3D MAX_DISTANCE_REF_POINTS;
> +               sizeof(uint32_t) * max_distance_ref_points);
> +        cur_index +=3D max_distance_ref_points;
>      }
>      ret =3D fdt_setprop(fdt, offset, "ibm,associativity-lookup-arrays", =
int_buf,
>                        (cur_index - int_buf) * sizeof(uint32_t));
> @@ -406,6 +450,7 @@ static target_ulong h_home_node_associativity(PowerPC=
CPU *cpu,
>      target_ulong procno =3D args[1];
>      PowerPCCPU *tcpu;
>      int idx, assoc_idx;
> +    int vcpu_assoc_size =3D get_vcpu_assoc_size(spapr);
> =20
>      /* only support procno from H_REGISTER_VPA */
>      if (flags !=3D 0x1) {
> @@ -424,7 +469,7 @@ static target_ulong h_home_node_associativity(PowerPC=
CPU *cpu,
>       * 12 associativity domains for vcpus. Assert and bail if that's
>       * not the case.
>       */
> -    G_STATIC_ASSERT((VCPU_ASSOC_SIZE - 1) <=3D 12);
> +    g_assert((vcpu_assoc_size - 1) <=3D 12);
> =20
>      vcpu_assoc =3D spapr_numa_get_vcpu_assoc(spapr, tcpu);
>      /* assoc_idx starts at 1 to skip associativity size */
> @@ -445,9 +490,9 @@ static target_ulong h_home_node_associativity(PowerPC=
CPU *cpu,
>           * macro. The ternary will fill the remaining registers with -1
>           * after we went through vcpu_assoc[].
>           */
> -        a =3D assoc_idx < VCPU_ASSOC_SIZE ?
> +        a =3D assoc_idx < vcpu_assoc_size ?
>              be32_to_cpu(vcpu_assoc[assoc_idx++]) : -1;
> -        b =3D assoc_idx < VCPU_ASSOC_SIZE ?
> +        b =3D assoc_idx < vcpu_assoc_size ?
>              be32_to_cpu(vcpu_assoc[assoc_idx++]) : -1;
> =20
>          args[idx] =3D ASSOCIATIVITY(a, b);
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index 8a9490f0bf..2554928250 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -100,23 +100,11 @@ typedef enum {
> =20
>  #define FDT_MAX_SIZE                    0x200000
> =20
> -/*
> - * NUMA related macros. MAX_DISTANCE_REF_POINTS was taken
> - * from Linux kernel arch/powerpc/mm/numa.h. It represents the
> - * amount of associativity domains for non-CPU resources.
> - *
> - * NUMA_ASSOC_SIZE is the base array size of an ibm,associativity
> - * array for any non-CPU resource.
> - *
> - * VCPU_ASSOC_SIZE represents the size of ibm,associativity array
> - * for CPUs, which has an extra element (vcpu_id) in the end.
> - */
> -#define MAX_DISTANCE_REF_POINTS    4
> -#define NUMA_ASSOC_SIZE            (MAX_DISTANCE_REF_POINTS + 1)
> -#define VCPU_ASSOC_SIZE            (NUMA_ASSOC_SIZE + 1)
> +/* Max number of GPUs per system */
> +#define NVGPU_MAX_NUM              6
> =20
> -/* Max number of these GPUsper a physical box */
> -#define NVGPU_MAX_NUM                6
> +/* Max number of NUMA nodes */
> +#define NUMA_NODES_MAX_NUM         (MAX_NODES + NVGPU_MAX_NUM)
> =20
>  typedef struct SpaprCapabilities SpaprCapabilities;
>  struct SpaprCapabilities {
> @@ -249,7 +237,7 @@ struct SpaprMachineState {
>      unsigned gpu_numa_id;
>      SpaprTpmProxy *tpm_proxy;
> =20
> -    uint32_t *FORM1_assoc_array[MAX_NODES + NVGPU_MAX_NUM];
> +    uint32_t *FORM1_assoc_array[NUMA_NODES_MAX_NUM];
>      uint32_t **numa_assoc_array;
> =20
>      Error *fwnmi_migration_blocker;


