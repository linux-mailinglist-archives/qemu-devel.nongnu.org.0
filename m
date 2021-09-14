Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C88340ACF0
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 13:59:57 +0200 (CEST)
Received: from localhost ([::1]:59574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ76S-0000b9-7q
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 07:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mQ728-0002yr-Vr
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 07:55:29 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:59355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mQ725-00019X-GK
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 07:55:28 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-KAOwMUAhPga957n5GT9Skg-1; Tue, 14 Sep 2021 07:55:18 -0400
X-MC-Unique: KAOwMUAhPga957n5GT9Skg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 098981006AA2;
 Tue, 14 Sep 2021 11:55:17 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.206])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2F4060C4A;
 Tue, 14 Sep 2021 11:55:15 +0000 (UTC)
Date: Tue, 14 Sep 2021 13:55:14 +0200
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v6 3/6] spapr: introduce spapr_numa_associativity_reset()
Message-ID: <20210914135514.1896ea3e@bahia.huguette>
In-Reply-To: <20210910195539.797170-4-danielhb413@gmail.com>
References: <20210910195539.797170-1-danielhb413@gmail.com>
 <20210910195539.797170-4-danielhb413@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

On Fri, 10 Sep 2021 16:55:36 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> Introducing a new NUMA affinity, FORM2, requires a new mechanism to
> switch between affinity modes after CAS. Also, we want FORM2 data
> structures and functions to be completely separated from the existing
> FORM1 code, allowing us to avoid adding new code that inherits the
> existing complexity of FORM1.
>=20
> At the same time, it's also desirable to minimize the amount of changes
> made in write_dt() functions that are used to write ibm,associativity of
> the resources, RTAS artifacts and h_home_node_associativity. These
> functions can work in the same way in both NUMA affinity modes, as long
> as we use a similar data structure and parametrize it properly depending
> on the affinity mode selected.
>=20
> This patch introduces spapr_numa_associativity_reset() to start this
> process. This function will be used to switch to the chosen NUMA
> affinity after CAS and after migrating the guest. To do that, the
> existing 'numa_assoc_array' is renamed to 'FORM1_assoc_array' and will
> hold FORM1 data that is populated at associativity_init().
> 'numa_assoc_array' is now a pointer that can be switched between the
> existing affinity arrays. We don't have FORM2 data structures yet, so
> 'numa_assoc_array' will always point to 'FORM1_assoc_array'.
>=20
> We also take the precaution of pointing 'numa_assoc_array' to
> 'FORM1_assoc_array' in associativity_init() time, before CAS, to not
> change FORM1 availability for existing guests.
>=20
> A small change in spapr_numa_write_associativity_dt() is made to reflect
> the fact that 'numa_assoc_array' is now a pointer and we must be
> explicit with the size being written in the DT.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/ppc/spapr.c              | 14 +++++++++++++
>  hw/ppc/spapr_hcall.c        |  7 +++++++
>  hw/ppc/spapr_numa.c         | 42 +++++++++++++++++++++++++++++--------
>  include/hw/ppc/spapr.h      |  3 ++-
>  include/hw/ppc/spapr_numa.h |  1 +
>  5 files changed, 57 insertions(+), 10 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index d39fd4e644..5afbb76cab 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1786,6 +1786,20 @@ static int spapr_post_load(void *opaque, int versi=
on_id)
>          return err;
>      }
> =20
> +    /*
> +     * NUMA affinity selection is made in CAS time. There is no reliable
> +     * way of telling whether the guest already went through CAS before
> +     * migration due to how spapr_ov5_cas_needed works: a FORM1 guest ca=
n
> +     * be migrated with ov5_cas empty regardless of going through CAS
> +     * first.
> +     *
> +     * One solution is to call numa_associativity_reset(). The downside
> +     * is that a guest migrated before CAS will reset it again when goin=
g
> +     * through it, but since it's a lightweight operation it's worth bei=
ng
> +     * a little redundant to be safe.

Also this isn't a hot path.

> +     */
> +     spapr_numa_associativity_reset(spapr);
> +
>      return err;
>  }
> =20
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 0e9a5b2e40..82ab92ddba 100644
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
> @@ -1197,6 +1198,12 @@ target_ulong do_client_architecture_support(PowerP=
CCPU *cpu,
>      spapr->cas_pre_isa3_guest =3D !spapr_ovec_test(ov1_guest, OV1_PPC_3_=
00);
>      spapr_ovec_cleanup(ov1_guest);
> =20
> +    /*
> +     * Reset numa_assoc_array now that we know which NUMA affinity
> +     * the guest will use.
> +     */
> +    spapr_numa_associativity_reset(spapr);
> +
>      /*
>       * Ensure the guest asks for an interrupt mode we support;
>       * otherwise terminate the boot.
> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
> index fb6059550f..327952ba9e 100644
> --- a/hw/ppc/spapr_numa.c
> +++ b/hw/ppc/spapr_numa.c
> @@ -97,7 +97,7 @@ static void spapr_numa_define_FORM1_domains(SpaprMachin=
eState *spapr)
>       */
>      for (i =3D 1; i < nb_numa_nodes; i++) {
>          for (j =3D 1; j < MAX_DISTANCE_REF_POINTS; j++) {
> -            spapr->numa_assoc_array[i][j] =3D cpu_to_be32(i);
> +            spapr->FORM1_assoc_array[i][j] =3D cpu_to_be32(i);
>          }
>      }
> =20
> @@ -149,8 +149,8 @@ static void spapr_numa_define_FORM1_domains(SpaprMach=
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
> @@ -167,6 +167,11 @@ static void spapr_numa_FORM1_affinity_init(SpaprMach=
ineState *spapr,
>      int nb_numa_nodes =3D machine->numa_state->num_nodes;
>      int i, j, max_nodes_with_gpus;
> =20
> +    /* init FORM1_assoc_array */
> +    for (i =3D 0; i < MAX_NODES + NVGPU_MAX_NUM; i++) {
> +        spapr->FORM1_assoc_array[i] =3D g_new0(uint32_t, NUMA_ASSOC_SIZE=
);

Why dynamic allocation since you have fixed size ?

> +    }
> +
>      /*
>       * For all associativity arrays: first position is the size,
>       * position MAX_DISTANCE_REF_POINTS is always the numa_id,
> @@ -177,8 +182,8 @@ static void spapr_numa_FORM1_affinity_init(SpaprMachi=
neState *spapr,
>       * 'i' will be a valid node_id set by the user.
>       */
>      for (i =3D 0; i < nb_numa_nodes; i++) {
> -        spapr->numa_assoc_array[i][0] =3D cpu_to_be32(MAX_DISTANCE_REF_P=
OINTS);
> -        spapr->numa_assoc_array[i][MAX_DISTANCE_REF_POINTS] =3D cpu_to_b=
e32(i);
> +        spapr->FORM1_assoc_array[i][0] =3D cpu_to_be32(MAX_DISTANCE_REF_=
POINTS);
> +        spapr->FORM1_assoc_array[i][MAX_DISTANCE_REF_POINTS] =3D cpu_to_=
be32(i);
>      }
> =20
>      /*
> @@ -192,15 +197,15 @@ static void spapr_numa_FORM1_affinity_init(SpaprMac=
hineState *spapr,
>      max_nodes_with_gpus =3D nb_numa_nodes + NVGPU_MAX_NUM;
> =20
>      for (i =3D nb_numa_nodes; i < max_nodes_with_gpus; i++) {
> -        spapr->numa_assoc_array[i][0] =3D cpu_to_be32(MAX_DISTANCE_REF_P=
OINTS);
> +        spapr->FORM1_assoc_array[i][0] =3D cpu_to_be32(MAX_DISTANCE_REF_=
POINTS);
> =20
>          for (j =3D 1; j < MAX_DISTANCE_REF_POINTS; j++) {
>              uint32_t gpu_assoc =3D smc->pre_5_1_assoc_refpoints ?
>                                   SPAPR_GPU_NUMA_ID : cpu_to_be32(i);
> -            spapr->numa_assoc_array[i][j] =3D gpu_assoc;
> +            spapr->FORM1_assoc_array[i][j] =3D gpu_assoc;
>          }
> =20
> -        spapr->numa_assoc_array[i][MAX_DISTANCE_REF_POINTS] =3D cpu_to_b=
e32(i);
> +        spapr->FORM1_assoc_array[i][MAX_DISTANCE_REF_POINTS] =3D cpu_to_=
be32(i);
>      }
> =20
>      /*
> @@ -227,14 +232,33 @@ void spapr_numa_associativity_init(SpaprMachineStat=
e *spapr,
>                                     MachineState *machine)
>  {
>      spapr_numa_FORM1_affinity_init(spapr, machine);
> +
> +    /*
> +     * Default to FORM1 affinity until CAS. We'll call affinity_reset()
> +     * during CAS when we're sure about which NUMA affinity the guest
> +     * is going to use.
> +     *
> +     * This step is a failsafe - guests in the wild were able to read
> +     * FORM1 affinity info before CAS for a long time. Since affinity_re=
set()
> +     * is just a pointer switch between data that was already populated
> +     * here, this is an acceptable overhead to be on the safer side.
> +     */
> +    spapr->numa_assoc_array =3D spapr->FORM1_assoc_array;

The right way to do that is to call spapr_numa_associativity_reset() from
spapr_machine_reset() because we want to revert to FORM1 each time the
guest is rebooted.

> +}
> +
> +void spapr_numa_associativity_reset(SpaprMachineState *spapr)
> +{
> +    /* No FORM2 affinity implemented yet */

This seems quite obvious at this point, not sure the comment helps.

> +    spapr->numa_assoc_array =3D spapr->FORM1_assoc_array;
>  }
> =20
>  void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *f=
dt,
>                                         int offset, int nodeid)
>  {
> +    /* Hardcode the size of FORM1 associativity array for now */
>      _FDT((fdt_setprop(fdt, offset, "ibm,associativity",
>                        spapr->numa_assoc_array[nodeid],
> -                      sizeof(spapr->numa_assoc_array[nodeid]))));
> +                      NUMA_ASSOC_SIZE * sizeof(uint32_t))));

Rather than doing this temporary change that gets undone in
a later patch, I suggest you introduce get_numa_assoc_size()
in a preliminary patch and use it here already :

-                      NUMA_ASSOC_SIZE * sizeof(uint32_t))));
+                      get_numa_assoc_size(spapr) * sizeof(uint32_t))));

This will simplify the reviewing.

>  }
> =20
>  static uint32_t *spapr_numa_get_vcpu_assoc(SpaprMachineState *spapr,
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index 637652ad16..8a9490f0bf 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -249,7 +249,8 @@ struct SpaprMachineState {
>      unsigned gpu_numa_id;
>      SpaprTpmProxy *tpm_proxy;
> =20
> -    uint32_t numa_assoc_array[MAX_NODES + NVGPU_MAX_NUM][NUMA_ASSOC_SIZE=
];
> +    uint32_t *FORM1_assoc_array[MAX_NODES + NVGPU_MAX_NUM];

As said above, I really don't see the point in not having :

    uint32_t *FORM1_assoc_array[MAX_NODES + NVGPU_MAX_NUM][NUMA_ASSOC_SIZE]=
;

> +    uint32_t **numa_assoc_array;
> =20
>      Error *fwnmi_migration_blocker;
>  };
> diff --git a/include/hw/ppc/spapr_numa.h b/include/hw/ppc/spapr_numa.h
> index 6f9f02d3de..ccf3e4eae8 100644
> --- a/include/hw/ppc/spapr_numa.h
> +++ b/include/hw/ppc/spapr_numa.h
> @@ -24,6 +24,7 @@
>   */
>  void spapr_numa_associativity_init(SpaprMachineState *spapr,
>                                     MachineState *machine);
> +void spapr_numa_associativity_reset(SpaprMachineState *spapr);
>  void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int r=
tas);
>  void spapr_numa_write_associativity_dt(SpaprMachineState *spapr, void *f=
dt,
>                                         int offset, int nodeid);


