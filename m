Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFE44111DB
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 11:24:00 +0200 (CEST)
Received: from localhost ([::1]:33444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSFWp-0001KX-Pg
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 05:23:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mSFUh-0007yZ-ER
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 05:21:47 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:31365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mSFUf-0005p6-Mw
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 05:21:47 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-4-qB9B1xMU2-mNh3bvsjiQ-1; Mon, 20 Sep 2021 05:21:41 -0400
X-MC-Unique: 4-qB9B1xMU2-mNh3bvsjiQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10C53BAF82;
 Mon, 20 Sep 2021 09:21:40 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C50F45F706;
 Mon, 20 Sep 2021 09:21:38 +0000 (UTC)
Date: Mon, 20 Sep 2021 11:21:32 +0200
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v8 4/7] spapr_numa.c: rename numa_assoc_array to
 FORM1_assoc_array
Message-ID: <20210920112132.35d430df@bahia.huguette>
In-Reply-To: <20210917212802.424481-5-danielhb413@gmail.com>
References: <20210917212802.424481-1-danielhb413@gmail.com>
 <20210917212802.424481-5-danielhb413@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

On Fri, 17 Sep 2021 18:27:59 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> Introducing a new NUMA affinity, FORM2, requires a new mechanism to
> switch between affinity modes after CAS. Also, we want FORM2 data
> structures and functions to be completely separated from the existing
> FORM1 code, allowing us to avoid adding new code that inherits the
> existing complexity of FORM1.
>=20
> The idea of switching values used by the write_dt() functions in
> spapr_numa.c was already introduced in the previous patch, and
> the same approach will be used when dealing with the FORM1 and FORM2
> arrays.
>=20
> We can accomplish that by that by renaming the existing numa_assoc_array
> to FORM1_assoc_array, which now is used exclusively to handle FORM1 affin=
ity
> data. A new helper get_associativity() is then introduced to be used by t=
he
> write_dt() functions to retrieve the current ibm,associativity array of
> a given node, after considering affinity selection that might have been
> done during CAS. All code that was using numa_assoc_array now needs to
> retrieve the array by calling this function.
>=20
> This will allow for an easier plug of FORM2 data later on.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---

This looks good. Just one suggestion, see below.

>  hw/ppc/spapr_hcall.c   |  1 +
>  hw/ppc/spapr_numa.c    | 38 +++++++++++++++++++++++++-------------
>  include/hw/ppc/spapr.h |  2 +-
>  3 files changed, 27 insertions(+), 14 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 0e9a5b2e40..9056644890 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -17,6 +17,7 @@
>  #include "kvm_ppc.h"
>  #include "hw/ppc/fdt.h"
>  #include "hw/ppc/spapr_ovec.h"
> +#include "hw/ppc/spapr_numa.h"
>  #include "mmu-book3s-v3.h"
>  #include "hw/mem/memory-device.h"
> =20
> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
> index 08e2d6aed8..7339d00d20 100644
> --- a/hw/ppc/spapr_numa.c
> +++ b/hw/ppc/spapr_numa.c
> @@ -46,6 +46,15 @@ static int get_vcpu_assoc_size(SpaprMachineState *spap=
r)
>      return get_numa_assoc_size(spapr) + 1;
>  }
> =20
> +/*
> + * Retrieves the ibm,associativity array of NUMA node 'node_id'
> + * for the current NUMA affinity.
> + */
> +static uint32_t *get_associativity(SpaprMachineState *spapr, int node_id=
)
> +{
> +    return spapr->FORM1_assoc_array[node_id];
> +}

All users of this helper only need to read the content of the
associativity array. And since these arrays are static, the
returned pointer should certainly not be passed to g_free()
for example. This wouldn't be detected by compilers though,
unless you have the helper to return a pointer to const
data. So I suggest you just do that for extra safety.

> +
>  static bool spapr_numa_is_symmetrical(MachineState *ms)
>  {
>      int src, dst;
> @@ -124,7 +133,7 @@ static void spapr_numa_define_FORM1_domains(SpaprMach=
ineState *spapr)
>       */
>      for (i =3D 1; i < nb_numa_nodes; i++) {
>          for (j =3D 1; j < FORM1_DIST_REF_POINTS; j++) {
> -            spapr->numa_assoc_array[i][j] =3D cpu_to_be32(i);
> +            spapr->FORM1_assoc_array[i][j] =3D cpu_to_be32(i);
>          }
>      }
> =20
> @@ -176,8 +185,8 @@ static void spapr_numa_define_FORM1_domains(SpaprMach=
ineState *spapr)
>               * and going up to 0x1.
>               */
>              for (i =3D n_level; i > 0; i--) {
> -                assoc_src =3D spapr->numa_assoc_array[src][i];
> -                spapr->numa_assoc_array[dst][i] =3D assoc_src;
> +                assoc_src =3D spapr->FORM1_assoc_array[src][i];
> +                spapr->FORM1_assoc_array[dst][i] =3D assoc_src;
>              }
>          }
>      }
> @@ -204,8 +213,8 @@ static void spapr_numa_FORM1_affinity_init(SpaprMachi=
neState *spapr,
>       * 'i' will be a valid node_id set by the user.
>       */
>      for (i =3D 0; i < nb_numa_nodes; i++) {
> -        spapr->numa_assoc_array[i][0] =3D cpu_to_be32(FORM1_DIST_REF_POI=
NTS);
> -        spapr->numa_assoc_array[i][FORM1_DIST_REF_POINTS] =3D cpu_to_be3=
2(i);
> +        spapr->FORM1_assoc_array[i][0] =3D cpu_to_be32(FORM1_DIST_REF_PO=
INTS);
> +        spapr->FORM1_assoc_array[i][FORM1_DIST_REF_POINTS] =3D cpu_to_be=
32(i);
>      }
> =20
>      /*
> @@ -219,15 +228,15 @@ static void spapr_numa_FORM1_affinity_init(SpaprMac=
hineState *spapr,
>      max_nodes_with_gpus =3D nb_numa_nodes + NVGPU_MAX_NUM;
> =20
>      for (i =3D nb_numa_nodes; i < max_nodes_with_gpus; i++) {
> -        spapr->numa_assoc_array[i][0] =3D cpu_to_be32(FORM1_DIST_REF_POI=
NTS);
> +        spapr->FORM1_assoc_array[i][0] =3D cpu_to_be32(FORM1_DIST_REF_PO=
INTS);
> =20
>          for (j =3D 1; j < FORM1_DIST_REF_POINTS; j++) {
>              uint32_t gpu_assoc =3D smc->pre_5_1_assoc_refpoints ?
>                                   SPAPR_GPU_NUMA_ID : cpu_to_be32(i);
> -            spapr->numa_assoc_array[i][j] =3D gpu_assoc;
> +            spapr->FORM1_assoc_array[i][j] =3D gpu_assoc;
>          }
> =20
> -        spapr->numa_assoc_array[i][FORM1_DIST_REF_POINTS] =3D cpu_to_be3=
2(i);
> +        spapr->FORM1_assoc_array[i][FORM1_DIST_REF_POINTS] =3D cpu_to_be=
32(i);
>      }
> =20
>      /*
> @@ -259,8 +268,10 @@ void spapr_numa_associativity_init(SpaprMachineState=
 *spapr,
>  void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *f=
dt,
>                                         int offset, int nodeid)
>  {
> +    uint32_t *associativity =3D get_associativity(spapr, nodeid);
> +
>      _FDT((fdt_setprop(fdt, offset, "ibm,associativity",
> -                      spapr->numa_assoc_array[nodeid],
> +                      associativity,
>                        get_numa_assoc_size(spapr) * sizeof(uint32_t))));
>  }
> =20
> @@ -270,6 +281,7 @@ static uint32_t *spapr_numa_get_vcpu_assoc(SpaprMachi=
neState *spapr,
>      int max_distance_ref_points =3D get_max_dist_ref_points(spapr);
>      int vcpu_assoc_size =3D get_vcpu_assoc_size(spapr);
>      uint32_t *vcpu_assoc =3D g_new(uint32_t, vcpu_assoc_size);
> +    uint32_t *associativity =3D get_associativity(spapr, cpu->node_id);
>      int index =3D spapr_get_vcpu_id(cpu);
> =20
>      /*
> @@ -280,7 +292,7 @@ static uint32_t *spapr_numa_get_vcpu_assoc(SpaprMachi=
neState *spapr,
>       */
>      vcpu_assoc[0] =3D cpu_to_be32(max_distance_ref_points + 1);
>      vcpu_assoc[vcpu_assoc_size - 1] =3D cpu_to_be32(index);
> -    memcpy(vcpu_assoc + 1, spapr->numa_assoc_array[cpu->node_id] + 1,
> +    memcpy(vcpu_assoc + 1, associativity + 1,
>             (vcpu_assoc_size - 2) * sizeof(uint32_t));
> =20
>      return vcpu_assoc;
> @@ -319,10 +331,10 @@ int spapr_numa_write_assoc_lookup_arrays(SpaprMachi=
neState *spapr, void *fdt,
>      cur_index +=3D 2;
>      for (i =3D 0; i < nr_nodes; i++) {
>          /*
> -         * For the lookup-array we use the ibm,associativity array,
> -         * from numa_assoc_array. without the first element (size).
> +         * For the lookup-array we use the ibm,associativity array of th=
e
> +         * current NUMA affinity, without the first element (size).
>           */
> -        uint32_t *associativity =3D spapr->numa_assoc_array[i];
> +        uint32_t *associativity =3D get_associativity(spapr, i);
>          memcpy(cur_index, ++associativity,
>                 sizeof(uint32_t) * max_distance_ref_points);
>          cur_index +=3D max_distance_ref_points;
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index 814e087e98..6b3dfc5dc2 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -249,7 +249,7 @@ struct SpaprMachineState {
>      unsigned gpu_numa_id;
>      SpaprTpmProxy *tpm_proxy;
> =20
> -    uint32_t numa_assoc_array[NUMA_NODES_MAX_NUM][FORM1_NUMA_ASSOC_SIZE]=
;
> +    uint32_t FORM1_assoc_array[NUMA_NODES_MAX_NUM][FORM1_NUMA_ASSOC_SIZE=
];
> =20
>      Error *fwnmi_migration_blocker;
>  };


