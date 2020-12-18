Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEA02DE718
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 17:02:02 +0100 (CET)
Received: from localhost ([::1]:39496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqICe-0000Ig-Ll
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 11:02:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kqI9o-0007dk-L1; Fri, 18 Dec 2020 10:59:04 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:56973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kqI9l-0004P1-WB; Fri, 18 Dec 2020 10:59:04 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.7])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 3BC827BB685F;
 Fri, 18 Dec 2020 16:58:49 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 18 Dec
 2020 16:58:48 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00147333124-0659-4fed-977d-45f50119d6e4,
 FB7A68720C4516EC60B551F1D5F540B41FF25855) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 82.253.208.248
Date: Fri, 18 Dec 2020 16:58:47 +0100
From: Greg Kurz <groug@kaod.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH] spapr: Fix buffer overflow in
 spapr_numa_associativity_init()
Message-ID: <20201218165847.289dbc3a@bahia.lan>
In-Reply-To: <680d5f91-a0ba-8ee2-0787-877b01d4ab7b@redhat.com>
References: <160829960428.734871.12634150161215429514.stgit@bahia.lan>
 <680d5f91-a0ba-8ee2-0787-877b01d4ab7b@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: e2de1704-28d4-4456-bba3-8a544e506c3e
X-Ovh-Tracer-Id: 15111828552871156006
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudeliedgkeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeevtdekteeijedvheefgfdutddtkeelleejudekjeelvefgffehkeetieefjedvfeenucffohhmrghinheprhgvughhrghtrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=groug@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Dec 2020 16:16:49 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On 12/18/20 2:53 PM, Greg Kurz wrote:
> > Running a guest with 128 NUMA nodes crashes QEMU:
> >=20
> > ../../util/error.c:59: error_setv: Assertion `*errp =3D=3D NULL' failed.
> >=20
> > The crash happens when setting the FWNMI migration blocker:
> >=20
> > 2861	    if (spapr_get_cap(spapr, SPAPR_CAP_FWNMI) =3D=3D SPAPR_CAP_ON)=
 {
> > 2862	        /* Create the error string for live migration blocker */
> > 2863	        error_setg(&spapr->fwnmi_migration_blocker,
> > 2864	            "A machine check is being handled during migration. Th=
e handler"
> > 2865	            "may run and log hardware error on the destination");
> > 2866	    }
> >=20
> > Inspection reveals that papr->fwnmi_migration_blocker isn't NULL:
> >=20
> > (gdb) p spapr->fwnmi_migration_blocker
> > $1 =3D (Error *) 0x8000000004000000
> >=20
> > Since this is the only place where papr->fwnmi_migration_blocker is
> > set, this means someone wrote there in our back. Further analysis
> > points to spapr_numa_associativity_init(), especially the part
> > that initializes the associative arrays for NVLink GPUs:
> >=20
> >     max_nodes_with_gpus =3D nb_numa_nodes + NVGPU_MAX_NUM;
> >=20
> > ie. max_nodes_with_gpus =3D 128 + 6, but the array isn't sized to
> > accommodate the 6 extra nodes:
> >=20
> > #define MAX_NODES 128
> >=20
> > struct SpaprMachineState {
> >     .
> >     .
> >     .
> >     uint32_t numa_assoc_array[MAX_NODES][NUMA_ASSOC_SIZE];
> >=20
> >     Error *fwnmi_migration_blocker;
> > };
> >=20
> > and the following loops happily overwrite spapr->fwnmi_migration_blocke=
r,
> > and probably more:
> >=20
> >     for (i =3D nb_numa_nodes; i < max_nodes_with_gpus; i++) {
>=20
> Along with your fix you can also remove max_nodes_with_gpus
> and use the safer ARRAY_SIZE(numa_assoc_array)...
>=20

No. We want to fill the array according to the specified NUMA topology, ie.

	[ nb_numa_nodes, nb_numa_nodes + NVGPU_MAX_NUM [

not

	[ nb_numa_nodes, MAX_NODES + NVGPU_MAX_NUM [

> >         spapr->numa_assoc_array[i][0] =3D cpu_to_be32(MAX_DISTANCE_REF_=
POINTS);
> >=20
> >         for (j =3D 1; j < MAX_DISTANCE_REF_POINTS; j++) {
> >             uint32_t gpu_assoc =3D smc->pre_5_1_assoc_refpoints ?
> >                                  SPAPR_GPU_NUMA_ID : cpu_to_be32(i);
> >             spapr->numa_assoc_array[i][j] =3D gpu_assoc;
> >         }
> >=20
> >         spapr->numa_assoc_array[i][MAX_DISTANCE_REF_POINTS] =3D cpu_to_=
be32(i);
> >     }
> >=20
> > Fix the size of the array. This requires "hw/ppc/spapr.h" to see
> > NVGPU_MAX_NUM. Including "hw/pci-host/spapr.h" introduces a
> > circular dependency that breaks the build, so this moves the
> > definition of NVGPU_MAX_NUM to "hw/ppc/spapr.h" instead.
> >=20
> > Reported-by: Min Deng <mdeng@redhat.com>
> > BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1908693
> > Fixes: dd7e1d7ae431 ("spapr_numa: move NVLink2 associativity handling t=
o spapr_numa.c")
> > Cc: danielhb413@gmail.com
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >  include/hw/pci-host/spapr.h |    2 --
> >  include/hw/ppc/spapr.h      |    5 ++++-
> >  2 files changed, 4 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/include/hw/pci-host/spapr.h b/include/hw/pci-host/spapr.h
> > index 4f58f0223b56..bd014823a933 100644
> > --- a/include/hw/pci-host/spapr.h
> > +++ b/include/hw/pci-host/spapr.h
> > @@ -115,8 +115,6 @@ struct SpaprPhbState {
> >  #define SPAPR_PCI_NV2RAM64_WIN_BASE  SPAPR_PCI_LIMIT
> >  #define SPAPR_PCI_NV2RAM64_WIN_SIZE  (2 * TiB) /* For up to 6 GPUs 256=
GB each */
> > =20
> > -/* Max number of these GPUsper a physical box */
> > -#define NVGPU_MAX_NUM                6
> >  /* Max number of NVLinks per GPU in any physical box */
> >  #define NVGPU_MAX_LINKS              3
> > =20
> > diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> > index 06a5b4259f20..1cc19575f548 100644
> > --- a/include/hw/ppc/spapr.h
> > +++ b/include/hw/ppc/spapr.h
> > @@ -112,6 +112,9 @@ typedef enum {
> >  #define NUMA_ASSOC_SIZE            (MAX_DISTANCE_REF_POINTS + 1)
> >  #define VCPU_ASSOC_SIZE            (NUMA_ASSOC_SIZE + 1)
> > =20
> > +/* Max number of these GPUsper a physical box */
> > +#define NVGPU_MAX_NUM                6
> > +
> >  typedef struct SpaprCapabilities SpaprCapabilities;
> >  struct SpaprCapabilities {
> >      uint8_t caps[SPAPR_CAP_NUM];
> > @@ -240,7 +243,7 @@ struct SpaprMachineState {
> >      unsigned gpu_numa_id;
> >      SpaprTpmProxy *tpm_proxy;
> > =20
> > -    uint32_t numa_assoc_array[MAX_NODES][NUMA_ASSOC_SIZE];
> > +    uint32_t numa_assoc_array[MAX_NODES + NVGPU_MAX_NUM][NUMA_ASSOC_SI=
ZE];
> > =20
> >      Error *fwnmi_migration_blocker;
> >  };
> >=20
> >=20
> >=20
>=20


