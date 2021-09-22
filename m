Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B840241483B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 13:53:58 +0200 (CEST)
Received: from localhost ([::1]:46010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT0p3-0004Mr-Qp
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 07:53:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mT0oC-00034T-6l
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 07:53:04 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:34893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mT0oA-0000CB-J9
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 07:53:03 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-xaaApnoDNLSqPwdLluHofA-1; Wed, 22 Sep 2021 07:52:57 -0400
X-MC-Unique: xaaApnoDNLSqPwdLluHofA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2351343CF;
 Wed, 22 Sep 2021 11:52:55 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BB7260BF4;
 Wed, 22 Sep 2021 11:52:51 +0000 (UTC)
Date: Wed, 22 Sep 2021 13:52:50 +0200
From: Greg Kurz <groug@kaod.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH] spapr_numa.c: fixes in
 spapr_numa_FORM2_write_rtas_tables()
Message-ID: <20210922135250.31a2d4d4@bahia.huguette>
In-Reply-To: <78cc89be-4e4b-c23a-e40a-b41865037008@redhat.com>
References: <20210921194347.52347-1-danielhb413@gmail.com>
 <78cc89be-4e4b-c23a-e40a-b41865037008@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 22 Sep 2021 13:17:32 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On 9/21/21 21:43, Daniel Henrique Barboza wrote:
> > This patch has a handful of modifications for the recent added
> > FORM2 support:
> >=20
> > - there is no particular reason for both 'lookup_index_table' and
> > 'distance_table' to be allocated in the heap, since their sizes are
> > known right at the start of the function. Use static allocation in
> > them to spare a couple of g_new0() calls;
> >=20
> > - to not allocate more than the necessary size in 'distance_table'. At
> > this moment the array is oversized due to allocating uint32_t for all
> > elements, when most of them fits in an uint8_t;
> >=20
> > - create a NUMA_LOCAL_DISTANCE macro to avoid hardcoding the local
> > distance value.
> >=20
> > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > ---
> >   hw/ppc/spapr_numa.c | 35 +++++++++++++++++++----------------
> >   1 file changed, 19 insertions(+), 16 deletions(-)
> >=20
> > diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
> > index 58d5dc7084..039a0439c6 100644
> > --- a/hw/ppc/spapr_numa.c
> > +++ b/hw/ppc/spapr_numa.c
> > @@ -19,6 +19,9 @@
> >   /* Moved from hw/ppc/spapr_pci_nvlink2.c */
> >   #define SPAPR_GPU_NUMA_ID           (cpu_to_be32(1))
> >  =20
> > +/* Macro to avoid hardcoding the local distance value */
> > +#define NUMA_LOCAL_DISTANCE         10
> > +
> >   /*
> >    * Retrieves max_dist_ref_points of the current NUMA affinity.
> >    */
> > @@ -500,17 +503,21 @@ static void spapr_numa_FORM2_write_rtas_tables(Sp=
aprMachineState *spapr,
> >       MachineState *ms =3D MACHINE(spapr);
> >       NodeInfo *numa_info =3D ms->numa_state->nodes;
> >       int nb_numa_nodes =3D ms->numa_state->num_nodes;
> > +    /* Lookup index table has an extra uint32_t with its length */
> > +    uint32_t lookup_index_table[nb_numa_nodes + 1];
> >       int distance_table_entries =3D nb_numa_nodes * nb_numa_nodes;
> > -    g_autofree uint32_t *lookup_index_table =3D NULL;
> > -    g_autofree uint32_t *distance_table =3D NULL;
> > -    int src, dst, i, distance_table_size;
> > -    uint8_t *node_distances;
>=20
> This should have be of ptrdiff_t type.
>=20

Why ? I don't see pointer subtraction in the code.

> > +    /*
> > +     * Distance table is an uint8_t array with a leading uint32_t
> > +     * containing its length.
> > +     */
> > +    uint8_t distance_table[distance_table_entries + 4];
>=20
> The previous code seems better by using the heap, now we have
> to worry about stack overflow...
>=20

Indeed the size of this array could be up to 16k + 4. I guess
Philippe's point make sense. David's request was to use uint8_t
instead of uin32t_t, not to drop g_new0(). Please revert to
using the heap.

lookup_index_table[] can _only_ grow up to 516 bytes, which is
less problematic, but it doesn't hurt either to allocate it
on the heap. Not changing that would make this patch simpler.

> > +    uint32_t *distance_table_length;
>=20
> Please drop, ...
>=20
> > +    int src, dst, i;
> >  =20
> >       /*
> >        * ibm,numa-lookup-index-table: array with length and a
> >        * list of NUMA ids present in the guest.
> >        */
> > -    lookup_index_table =3D g_new0(uint32_t, nb_numa_nodes + 1);
> >       lookup_index_table[0] =3D cpu_to_be32(nb_numa_nodes);
> >  =20
> >       for (i =3D 0; i < nb_numa_nodes; i++) {
> > @@ -518,8 +525,7 @@ static void spapr_numa_FORM2_write_rtas_tables(Spap=
rMachineState *spapr,
> >       }
> >  =20
> >       _FDT(fdt_setprop(fdt, rtas, "ibm,numa-lookup-index-table",
> > -                     lookup_index_table,
> > -                     (nb_numa_nodes + 1) * sizeof(uint32_t)));
> > +                     lookup_index_table, sizeof(lookup_index_table)));
> >  =20
> >       /*
> >        * ibm,numa-distance-table: contains all node distances. First
> > @@ -531,11 +537,10 @@ static void spapr_numa_FORM2_write_rtas_tables(Sp=
aprMachineState *spapr,
> >        * array because NUMA ids can be sparse (node 0 is the first,
> >        * node 8 is the second ...).
> >        */
> > -    distance_table =3D g_new0(uint32_t, distance_table_entries + 1);
> > -    distance_table[0] =3D cpu_to_be32(distance_table_entries);
> > +    distance_table_length =3D (uint32_t *)distance_table;
> > +    distance_table_length[0] =3D cpu_to_be32(distance_table_entries);
>=20
> ... and use instead:
>=20
>         stl_be_p(distance_table, distance_table_entries);
>=20

+1

> > -    node_distances =3D (uint8_t *)&distance_table[1];
> > -    i =3D 0;
> > +    i =3D 4;
> >  =20
> >       for (src =3D 0; src < nb_numa_nodes; src++) {
> >           for (dst =3D 0; dst < nb_numa_nodes; dst++) {
> > @@ -546,18 +551,16 @@ static void spapr_numa_FORM2_write_rtas_tables(Sp=
aprMachineState *spapr,
> >                * adding the numa_info to retrieve distance info from.
> >                */
> >               if (src =3D=3D dst) {
> > -                node_distances[i++] =3D 10;
> > +                distance_table[i++] =3D NUMA_LOCAL_DISTANCE;
> >                   continue;
> >               }
> >  =20
> > -            node_distances[i++] =3D numa_info[src].distance[dst];
> > +            distance_table[i++] =3D numa_info[src].distance[dst];
> >           }
> >       }
> >  =20
> > -    distance_table_size =3D distance_table_entries * sizeof(uint8_t) +
> > -                          sizeof(uint32_t);
> >       _FDT(fdt_setprop(fdt, rtas, "ibm,numa-distance-table",
> > -                     distance_table, distance_table_size));
> > +                     distance_table, sizeof(distance_table)));
> >   }
> >  =20
> >   /*
> >=20
>=20


