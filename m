Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AA940A964
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 10:35:46 +0200 (CEST)
Received: from localhost ([::1]:46154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ3uq-0001GG-6y
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 04:35:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mQ3tP-0000NR-5v
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 04:34:15 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:46615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mQ3tM-0000GY-L6
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 04:34:14 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494--H1iXNjHMIKFVZ2QCUUXZw-1; Tue, 14 Sep 2021 04:34:09 -0400
X-MC-Unique: -H1iXNjHMIKFVZ2QCUUXZw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CB481800D41;
 Tue, 14 Sep 2021 08:34:08 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.206])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8036B1972D;
 Tue, 14 Sep 2021 08:34:07 +0000 (UTC)
Date: Tue, 14 Sep 2021 10:34:06 +0200
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v6 2/6] spapr_numa.c: scrap 'legacy_numa' concept
Message-ID: <20210914103406.7d38f446@bahia.huguette>
In-Reply-To: <20210910195539.797170-3-danielhb413@gmail.com>
References: <20210910195539.797170-1-danielhb413@gmail.com>
 <20210910195539.797170-3-danielhb413@gmail.com>
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

On Fri, 10 Sep 2021 16:55:35 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> When first introduced, 'legacy_numa' was a way to refer to guests that
> either wouldn't be affected by associativity domain calculations, namely
> the ones with only 1 NUMA node, and pre 5.2 guests that shouldn't be
> affected by it because it would be an userspace change. Calling these
> cases 'legacy_numa' was a convenient way to label these cases.
>=20
> We're about to introduce a new NUMA affinity, FORM2, and this concept
> of 'legacy_numa' is now a bit misleading because, although it is called
> 'legacy' it is in fact a FORM1 exclusive contraint.
>=20
> This patch removes spapr_machine_using_legacy_numa() and open code the
> conditions in each caller. While we're at it, move the chunk inside
> spapr_numa_FORM1_affinity_init() that sets all numa_assoc_array domains
> with 'node_id' to spapr_numa_define_FORM1_domains(). This chunk was
> being executed if !pre_5_2_numa_associativity and num_nodes =3D> 1, the
> same conditions in which spapr_numa_define_FORM1_domains() is called
> shortly after.
>=20

Those are definitely improvements. Just one question, see below.

> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/ppc/spapr_numa.c | 46 +++++++++++++++++++--------------------------
>  1 file changed, 19 insertions(+), 27 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
> index 786def7c73..fb6059550f 100644
> --- a/hw/ppc/spapr_numa.c
> +++ b/hw/ppc/spapr_numa.c
> @@ -19,15 +19,6 @@
>  /* Moved from hw/ppc/spapr_pci_nvlink2.c */
>  #define SPAPR_GPU_NUMA_ID           (cpu_to_be32(1))
> =20
> -static bool spapr_machine_using_legacy_numa(SpaprMachineState *spapr)
> -{
> -    MachineState *machine =3D MACHINE(spapr);
> -    SpaprMachineClass *smc =3D SPAPR_MACHINE_GET_CLASS(machine);
> -
> -    return smc->pre_5_2_numa_associativity ||
> -           machine->numa_state->num_nodes <=3D 1;
> -}
> -
>  static bool spapr_numa_is_symmetrical(MachineState *ms)
>  {
>      int src, dst;
> @@ -97,7 +88,18 @@ static void spapr_numa_define_FORM1_domains(SpaprMachi=
neState *spapr)
>      MachineState *ms =3D MACHINE(spapr);
>      NodeInfo *numa_info =3D ms->numa_state->nodes;
>      int nb_numa_nodes =3D ms->numa_state->num_nodes;
> -    int src, dst, i;
> +    int src, dst, i, j;
> +
> +    /*
> +     * Fill all associativity domains of non-zero NUMA nodes with
> +     * node_id. This is required because the default value (0) is
> +     * considered a match with associativity domains of node 0.
> +     */
> +    for (i =3D 1; i < nb_numa_nodes; i++) {
> +        for (j =3D 1; j < MAX_DISTANCE_REF_POINTS; j++) {
> +            spapr->numa_assoc_array[i][j] =3D cpu_to_be32(i);
> +        }
> +    }
> =20
>      for (src =3D 0; src < nb_numa_nodes; src++) {
>          for (dst =3D src; dst < nb_numa_nodes; dst++) {
> @@ -164,7 +166,6 @@ static void spapr_numa_FORM1_affinity_init(SpaprMachi=
neState *spapr,
>      SpaprMachineClass *smc =3D SPAPR_MACHINE_GET_CLASS(spapr);
>      int nb_numa_nodes =3D machine->numa_state->num_nodes;
>      int i, j, max_nodes_with_gpus;
> -    bool using_legacy_numa =3D spapr_machine_using_legacy_numa(spapr);
> =20
>      /*
>       * For all associativity arrays: first position is the size,
> @@ -178,17 +179,6 @@ static void spapr_numa_FORM1_affinity_init(SpaprMach=
ineState *spapr,
>      for (i =3D 0; i < nb_numa_nodes; i++) {
>          spapr->numa_assoc_array[i][0] =3D cpu_to_be32(MAX_DISTANCE_REF_P=
OINTS);
>          spapr->numa_assoc_array[i][MAX_DISTANCE_REF_POINTS] =3D cpu_to_b=
e32(i);
> -
> -        /*
> -         * Fill all associativity domains of non-zero NUMA nodes with
> -         * node_id. This is required because the default value (0) is
> -         * considered a match with associativity domains of node 0.
> -         */
> -        if (!using_legacy_numa && i !=3D 0) {
> -            for (j =3D 1; j < MAX_DISTANCE_REF_POINTS; j++) {
> -                spapr->numa_assoc_array[i][j] =3D cpu_to_be32(i);
> -            }
> -        }
>      }
> =20
>      /*
> @@ -214,11 +204,13 @@ static void spapr_numa_FORM1_affinity_init(SpaprMac=
hineState *spapr,
>      }
> =20
>      /*
> -     * Legacy NUMA guests (pseries-5.1 and older, or guests with only
> -     * 1 NUMA node) will not benefit from anything we're going to do
> -     * after this point.
> +     * Guests pseries-5.1 and older uses zeroed associativity domains,
> +     * i.e. no domain definition based on NUMA distance input.
> +     *
> +     * Same thing with guests that have only one NUMA node.
>       */
> -    if (using_legacy_numa) {
> +    if (smc->pre_5_2_numa_associativity ||
> +        machine->numa_state->num_nodes <=3D 1) {
>          return;
>      }
> =20
> @@ -334,7 +326,7 @@ static void spapr_numa_FORM1_write_rtas_dt(SpaprMachi=
neState *spapr,
>          cpu_to_be32(maxdomain)
>      };
> =20
> -    if (spapr_machine_using_legacy_numa(spapr)) {
> +    if (smc->pre_5_2_numa_associativity) {

This doesn't check the number of NUMA nodes and thus changes behavior,
or am I missing something ?

Rest looks good though so if you add the missing check or provide a
justification, feel free to add:

Reviewed-by: Greg Kurz <groug@kaod.org>

>          uint32_t legacy_refpoints[] =3D {
>              cpu_to_be32(0x4),
>              cpu_to_be32(0x4),


