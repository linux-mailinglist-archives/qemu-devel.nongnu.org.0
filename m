Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4148840E794
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 19:33:46 +0200 (CEST)
Received: from localhost ([::1]:42186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQvGa-00034c-UC
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 13:33:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mQvF2-0002CH-M2
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 13:32:09 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:32500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mQvEy-0004UX-Dd
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 13:32:08 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-3tdK28RhMDSoS-K8BHJ8Kw-1; Thu, 16 Sep 2021 13:31:51 -0400
X-MC-Unique: 3tdK28RhMDSoS-K8BHJ8Kw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E47AA100C662;
 Thu, 16 Sep 2021 17:31:49 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C33A10023AB;
 Thu, 16 Sep 2021 17:31:48 +0000 (UTC)
Date: Thu, 16 Sep 2021 19:31:46 +0200
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v6 3/6] spapr: introduce spapr_numa_associativity_reset()
Message-ID: <20210916193146.6961a0c6@bahia.huguette>
In-Reply-To: <0dc516f6-8504-6d65-93f7-c8cd0de3afa2@gmail.com>
References: <20210910195539.797170-1-danielhb413@gmail.com>
 <20210910195539.797170-4-danielhb413@gmail.com>
 <20210914135514.1896ea3e@bahia.huguette>
 <3bd59a2f-5c3b-f062-4a6c-abf34340000d@gmail.com>
 <0dc516f6-8504-6d65-93f7-c8cd0de3afa2@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
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

On Wed, 15 Sep 2021 22:32:13 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> Greg,
>=20
>=20
> On 9/14/21 16:58, Daniel Henrique Barboza wrote:
> >=20
> >=20
> > On 9/14/21 08:55, Greg Kurz wrote:
> >> On Fri, 10 Sep 2021 16:55:36 -0300
> >> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
> >>
>=20
> [...]
>=20
>=20
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >>> @@ -167,6 +167,11 @@ static void spapr_numa_FORM1_affinity_init(Spapr=
MachineState *spapr,
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int nb_numa_nodes =3D machine->numa_st=
ate->num_nodes;
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int i, j, max_nodes_with_gpus;
> >>> +=C2=A0=C2=A0=C2=A0 /* init FORM1_assoc_array */
> >>> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < MAX_NODES + NVGPU_MAX_NUM; i++)=
 {
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spapr->FORM1_assoc_array[=
i] =3D g_new0(uint32_t, NUMA_ASSOC_SIZE);
> >>
> >> Why dynamic allocation since you have fixed size ?
> >=20
> > If I use static allocation the C compiler complains that I can't assign=
 a
> > uint32_t** pointer to a uint32_t[MAX_NODES + NVGPU_MAX_NUM][NUMA_ASSOC_=
SIZE]
> > array type.
> >=20
> > And given that the FORM2 array is a [MAX_NODES + NVGPU_MAX_NUM][2] arra=
y, the
> > way I worked around that here is to use dynamic allocation. Then C cons=
iders valid
> > to use numa_assoc_array as an uint32_t** pointer for both FORM1 and FOR=
M2
> > 2D arrays. I'm fairly certain that there might be a way of doing static=
 allocation
> > and keeping the uint32_t** pointer as is, but didn't find any. Tips wel=
come :D
> >=20
> > An alternative that I considered, without the need for this dynamic all=
ocation hack,
> > is to make both FORM1 and FORM2 data structures the same size (i.e.
> > an [MAX_NODES + NVGPU_MAX_NUM][NUMA_ASSOC_SIZE] uint32_t array) and the=
n numa_assoc_array
> > can be a pointer of the same array type for both. Since we're controlli=
ng FORM1 and
> > FORM2 sizes separately inside the functions this would work. The downsi=
de is that
> > FORM2 2D array would be bigger than necessary.
>=20
> I took a look and didn't find any neat way of doing a pointer switch
> between 2 static arrays without either allocating dynamic mem on the
> pointer and then g_memdup'ing it, or make all arrays the same size
> (i.e. numa_assoc_array would also be a statically allocated array
> with FORM1 size) and then memcpy() the chosen mode.
>=20
> I just posted a new version in which I'm not relying on 'numa_assoc_array=
'.
> Instead, the DT functions will use a get_associativity() to retrieve
> the current associativity array based on CAS choice, in a similar
> manner like it is already done with the array sizes. This also allowed
> us to get rid of associativity_reset().
>=20


Hi Daniel,

I've vaguely started at looking at the new version and it seems
to look better indeed. Now that KVM Forum 2021 and its too many
captivating talks are over :-) , I'll try to find some time to
review.

Cheers,

--
Greg

>=20
> Thanks,
>=20
>=20
> Daniel
>=20
>=20
>=20
> >=20
> >=20
> > I don't have strong opinions about which way to do it, so I'm all ears.
> >=20
> >=20
> > Thanks,
> >=20
> >=20
> > Daniel
> >=20
> >=20
> >=20
> >>
> >>> +=C2=A0=C2=A0=C2=A0 }
> >>> +
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * For all associativity arrays: =
first position is the size,
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * position MAX_DISTANCE_REF_POIN=
TS is always the numa_id,
> >>> @@ -177,8 +182,8 @@ static void spapr_numa_FORM1_affinity_init(SpaprM=
achineState *spapr,
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * 'i' will be a valid node_id se=
t by the user.
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < nb_numa_nodes; i++) =
{
> >>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spapr->numa_assoc_array[i=
][0] =3D cpu_to_be32(MAX_DISTANCE_REF_POINTS);
> >>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spapr->numa_assoc_array[i=
][MAX_DISTANCE_REF_POINTS] =3D cpu_to_be32(i);
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spapr->FORM1_assoc_array[=
i][0] =3D cpu_to_be32(MAX_DISTANCE_REF_POINTS);
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spapr->FORM1_assoc_array[=
i][MAX_DISTANCE_REF_POINTS] =3D cpu_to_be32(i);
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> >>> @@ -192,15 +197,15 @@ static void spapr_numa_FORM1_affinity_init(Spap=
rMachineState *spapr,
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 max_nodes_with_gpus =3D nb_numa_nodes =
+ NVGPU_MAX_NUM;
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D nb_numa_nodes; i < max_node=
s_with_gpus; i++) {
> >>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spapr->numa_assoc_array[i=
][0] =3D cpu_to_be32(MAX_DISTANCE_REF_POINTS);
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spapr->FORM1_assoc_array[=
i][0] =3D cpu_to_be32(MAX_DISTANCE_REF_POINTS);
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (j =3D 1; =
j < MAX_DISTANCE_REF_POINTS; j++) {
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 uint32_t gpu_assoc =3D smc->pre_5_1_assoc_refpoints ?
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SPAPR_GPU_NUMA=
_ID : cpu_to_be32(i);
> >>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s=
papr->numa_assoc_array[i][j] =3D gpu_assoc;
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s=
papr->FORM1_assoc_array[i][j] =3D gpu_assoc;
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spapr->numa_assoc_array[i=
][MAX_DISTANCE_REF_POINTS] =3D cpu_to_be32(i);
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spapr->FORM1_assoc_array[=
i][MAX_DISTANCE_REF_POINTS] =3D cpu_to_be32(i);
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> >>> @@ -227,14 +232,33 @@ void spapr_numa_associativity_init(SpaprMachine=
State *spapr,
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ma=
chineState *machine)
> >>> =C2=A0 {
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spapr_numa_FORM1_affinity_init(spapr, =
machine);
> >>> +
> >>> +=C2=A0=C2=A0=C2=A0 /*
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Default to FORM1 affinity until CAS. We'l=
l call affinity_reset()
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0 * during CAS when we're sure about which NU=
MA affinity the guest
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0 * is going to use.
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0 * This step is a failsafe - guests in the w=
ild were able to read
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0 * FORM1 affinity info before CAS for a long=
 time. Since affinity_reset()
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0 * is just a pointer switch between data tha=
t was already populated
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0 * here, this is an acceptable overhead to b=
e on the safer side.
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
> >>> +=C2=A0=C2=A0=C2=A0 spapr->numa_assoc_array =3D spapr->FORM1_assoc_ar=
ray;
> >>
> >> The right way to do that is to call spapr_numa_associativity_reset() f=
rom
> >> spapr_machine_reset() because we want to revert to FORM1 each time the
> >> guest is rebooted.
> >>
> >>> +}
> >>> +
> >>> +void spapr_numa_associativity_reset(SpaprMachineState *spapr)
> >>> +{
> >>> +=C2=A0=C2=A0=C2=A0 /* No FORM2 affinity implemented yet */
> >>
> >> This seems quite obvious at this point, not sure the comment helps.
> >>
> >>> +=C2=A0=C2=A0=C2=A0 spapr->numa_assoc_array =3D spapr->FORM1_assoc_ar=
ray;
> >>> =C2=A0 }
> >>> =C2=A0 void spapr_numa_write_associativity_dt(SpaprMachineState *spap=
r, void *fdt,
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 int offset, int nodeid)
> >>> =C2=A0 {
> >>> +=C2=A0=C2=A0=C2=A0 /* Hardcode the size of FORM1 associativity array=
 for now */
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _FDT((fdt_setprop(fdt, offset, "ibm,as=
sociativity",
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spapr=
->numa_assoc_array[nodeid],
> >>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(spapr->=
numa_assoc_array[nodeid]))));
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NUMA_ASSOC_SIZ=
E * sizeof(uint32_t))));
> >>
> >> Rather than doing this temporary change that gets undone in
> >> a later patch, I suggest you introduce get_numa_assoc_size()
> >> in a preliminary patch and use it here already :
> >>
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NUMA_ASSOC_SIZE *=
 sizeof(uint32_t))));
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 get_numa_assoc_si=
ze(spapr) * sizeof(uint32_t))));
> >>
> >> This will simplify the reviewing.
> >>
> >>> =C2=A0 }
> >>> =C2=A0 static uint32_t *spapr_numa_get_vcpu_assoc(SpaprMachineState *=
spapr,
> >>> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> >>> index 637652ad16..8a9490f0bf 100644
> >>> --- a/include/hw/ppc/spapr.h
> >>> +++ b/include/hw/ppc/spapr.h
> >>> @@ -249,7 +249,8 @@ struct SpaprMachineState {
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned gpu_numa_id;
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SpaprTpmProxy *tpm_proxy;
> >>> -=C2=A0=C2=A0=C2=A0 uint32_t numa_assoc_array[MAX_NODES + NVGPU_MAX_N=
UM][NUMA_ASSOC_SIZE];
> >>> +=C2=A0=C2=A0=C2=A0 uint32_t *FORM1_assoc_array[MAX_NODES + NVGPU_MAX=
_NUM];
> >>
> >> As said above, I really don't see the point in not having :
> >>
> >> =C2=A0=C2=A0=C2=A0=C2=A0 uint32_t *FORM1_assoc_array[MAX_NODES + NVGPU=
_MAX_NUM][NUMA_ASSOC_SIZE];
> >>
> >>> +=C2=A0=C2=A0=C2=A0 uint32_t **numa_assoc_array;
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Error *fwnmi_migration_blocker;
> >>> =C2=A0 };
> >>> diff --git a/include/hw/ppc/spapr_numa.h b/include/hw/ppc/spapr_numa.=
h
> >>> index 6f9f02d3de..ccf3e4eae8 100644
> >>> --- a/include/hw/ppc/spapr_numa.h
> >>> +++ b/include/hw/ppc/spapr_numa.h
> >>> @@ -24,6 +24,7 @@
> >>> =C2=A0=C2=A0 */
> >>> =C2=A0 void spapr_numa_associativity_init(SpaprMachineState *spapr,
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ma=
chineState *machine);
> >>> +void spapr_numa_associativity_reset(SpaprMachineState *spapr);
> >>> =C2=A0 void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *=
fdt, int rtas);
> >>> =C2=A0 void spapr_numa_write_associativity_dt(SpaprMachineState *spap=
r, void *fdt,
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 int offset, int nodeid);
> >>


