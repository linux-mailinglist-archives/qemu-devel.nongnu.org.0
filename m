Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B80E414942
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 14:43:15 +0200 (CEST)
Received: from localhost ([::1]:42610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT1ak-000292-K2
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 08:43:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mT1YL-0008AY-GR
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 08:40:46 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:47354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mT1YJ-0007HV-Mv
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 08:40:45 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-GsPQsIAHN_mygVT9y6gbyA-1; Wed, 22 Sep 2021 08:40:40 -0400
X-MC-Unique: GsPQsIAHN_mygVT9y6gbyA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F125D1B18BC0;
 Wed, 22 Sep 2021 12:40:38 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 381A25D9DC;
 Wed, 22 Sep 2021 12:40:36 +0000 (UTC)
Date: Wed, 22 Sep 2021 14:40:34 +0200
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 1/1] spapr_numa.c: fixes in
 spapr_numa_FORM2_write_rtas_tables()
Message-ID: <20210922144034.4b44bec1@bahia.huguette>
In-Reply-To: <20210922122852.130054-2-danielhb413@gmail.com>
References: <20210922122852.130054-1-danielhb413@gmail.com>
 <20210922122852.130054-2-danielhb413@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: philmd@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 22 Sep 2021 09:28:52 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> This patch has a handful of modifications for the recent added
> FORM2 support:
>=20
> - to not allocate more than the necessary size in 'distance_table'.
> At this moment the array is oversized due to allocating uint32_t for
> all elements, when most of them fits in an uint8_t. Fix it by
> changing the array to uint8_t and allocating the exact size;
>=20
> - use stl_be_p() to store the uint32_t at the start of 'distance_table';
>=20
> - use sizeof(uint32_t) to skip the uint32_t length when populating the
> distances;
>=20
> - use the NUMA_DISTANCE_MIN macro from sysemu/numa.h to avoid hardcoding
> the local distance value.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/ppc/spapr_numa.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
> index 58d5dc7084..5822938448 100644
> --- a/hw/ppc/spapr_numa.c
> +++ b/hw/ppc/spapr_numa.c
> @@ -502,9 +502,8 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprM=
achineState *spapr,
>      int nb_numa_nodes =3D ms->numa_state->num_nodes;
>      int distance_table_entries =3D nb_numa_nodes * nb_numa_nodes;
>      g_autofree uint32_t *lookup_index_table =3D NULL;
> -    g_autofree uint32_t *distance_table =3D NULL;
> +    g_autofree uint8_t *distance_table =3D NULL;
>      int src, dst, i, distance_table_size;
> -    uint8_t *node_distances;
> =20
>      /*
>       * ibm,numa-lookup-index-table: array with length and a
> @@ -531,11 +530,13 @@ static void spapr_numa_FORM2_write_rtas_tables(Spap=
rMachineState *spapr,
>       * array because NUMA ids can be sparse (node 0 is the first,
>       * node 8 is the second ...).
>       */
> -    distance_table =3D g_new0(uint32_t, distance_table_entries + 1);
> -    distance_table[0] =3D cpu_to_be32(distance_table_entries);

I personally liked the comment from v1:

+    /*
+     * Distance table is an uint8_t array with a leading uint32_t
+     * containing its length.
+     */

but I guess the code is simple enough to understand that, so :

Reviewed-by: Greg Kurz <groug@kaod.org>

> +    distance_table_size =3D distance_table_entries * sizeof(uint8_t) +
> +                          sizeof(uint32_t);
> +    distance_table =3D g_new0(uint8_t, distance_table_size);
> +    stl_be_p(distance_table, distance_table_entries);
> =20
> -    node_distances =3D (uint8_t *)&distance_table[1];
> -    i =3D 0;
> +    /* Skip the uint32_t array length at the start */
> +    i =3D sizeof(uint32_t);
> =20
>      for (src =3D 0; src < nb_numa_nodes; src++) {
>          for (dst =3D 0; dst < nb_numa_nodes; dst++) {
> @@ -546,16 +547,14 @@ static void spapr_numa_FORM2_write_rtas_tables(Spap=
rMachineState *spapr,
>               * adding the numa_info to retrieve distance info from.
>               */
>              if (src =3D=3D dst) {
> -                node_distances[i++] =3D 10;
> +                distance_table[i++] =3D NUMA_DISTANCE_MIN;
>                  continue;
>              }
> =20
> -            node_distances[i++] =3D numa_info[src].distance[dst];
> +            distance_table[i++] =3D numa_info[src].distance[dst];
>          }
>      }
> =20
> -    distance_table_size =3D distance_table_entries * sizeof(uint8_t) +
> -                          sizeof(uint32_t);
>      _FDT(fdt_setprop(fdt, rtas, "ibm,numa-distance-table",
>                       distance_table, distance_table_size));
>  }


