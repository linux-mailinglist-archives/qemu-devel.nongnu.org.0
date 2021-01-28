Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF40307D3E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 19:02:45 +0100 (CET)
Received: from localhost ([::1]:35324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Bcy-0006i0-2A
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 13:02:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l5BNG-00032Z-MS
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:46:30 -0500
Received: from 9.mo52.mail-out.ovh.net ([87.98.180.222]:43084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l5BN9-0000yF-Ph
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:46:30 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.83])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id DE52E239601;
 Thu, 28 Jan 2021 18:46:19 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 28 Jan
 2021 18:46:19 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0053c666cca-695a-4e49-9aa1-daec951ae2d3,
 12ABEFCAB104A9A3990DEAE01579FEA45C2F0BE3) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 28 Jan 2021 18:46:18 +0100
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 3/3] spapr_numa.c: fix ibm,max-associativity-domains
 calculation
Message-ID: <20210128184618.53b468a9@bahia.lan>
In-Reply-To: <20210128174213.1349181-4-danielhb413@gmail.com>
References: <20210128174213.1349181-1-danielhb413@gmail.com>
 <20210128174213.1349181-4-danielhb413@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 3d50b0c2-1068-4259-93f7-f96d77033de5
X-Ovh-Tracer-Id: 17900401144982378915
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfedtgddutdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeevlefhtddufffhieevhefhleegleelgfetffetkedugeehjeffgfehhfefueduffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=87.98.180.222; envelope-from=groug@kaod.org;
 helo=9.mo52.mail-out.ovh.net
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
Cc: clg@kaod.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Jan 2021 14:42:13 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> The current logic for calculating 'maxdomain' making it a sum of
> numa_state->num_nodes with spapr->gpu_numa_id. spapr->gpu_numa_id is
> used as a index to determine the next available NUMA id that a
> given NVGPU can use.
>=20
> The problem is that the initial value of gpu_numa_id, for any topology
> that has more than one NUMA node, is equal to numa_state->num_nodes.
> This means that our maxdomain will always be, at least, twice the
> amount of existing NUMA nodes. This means that a guest with 4 NUMA
> nodes will end up with the following max-associativity-domains:
>=20
> rtas/ibm,max-associativity-domains
>                  00000004 00000008 00000008 00000008 00000008
>=20
> This overtuning of maxdomains doesn't go unnoticed in the guest, being
> detected in SLUB during boot:
>=20
>  dmesg | grep SLUB
> [    0.000000] SLUB: HWalign=3D128, Order=3D0-3, MinObjects=3D0, CPUs=3D4=
, Nodes=3D8
>=20
> SLUB is detecting 8 total nodes, with 4 nodes being online.
>=20
> This patch fixes ibm,max-associativity-domains by considering the amount
> of NVGPUs NUMA nodes presented in the guest, instead of just
> spapr->gpu_numa_id.
>=20
> Reported-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Tested-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/spapr_numa.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
> index a757dd88b8..779f18b994 100644
> --- a/hw/ppc/spapr_numa.c
> +++ b/hw/ppc/spapr_numa.c
> @@ -311,6 +311,8 @@ void spapr_numa_write_rtas_dt(SpaprMachineState *spap=
r, void *fdt, int rtas)
>  {
>      MachineState *ms =3D MACHINE(spapr);
>      SpaprMachineClass *smc =3D SPAPR_MACHINE_GET_CLASS(spapr);
> +    uint32_t number_nvgpus_nodes =3D spapr->gpu_numa_id -
> +                                   spapr_numa_initial_nvgpu_numa_id(ms);
>      uint32_t refpoints[] =3D {
>          cpu_to_be32(0x4),
>          cpu_to_be32(0x3),
> @@ -318,7 +320,7 @@ void spapr_numa_write_rtas_dt(SpaprMachineState *spap=
r, void *fdt, int rtas)
>          cpu_to_be32(0x1),
>      };
>      uint32_t nr_refpoints =3D ARRAY_SIZE(refpoints);
> -    uint32_t maxdomain =3D ms->numa_state->num_nodes + spapr->gpu_numa_i=
d;
> +    uint32_t maxdomain =3D ms->numa_state->num_nodes + number_nvgpus_nod=
es;
>      uint32_t maxdomains[] =3D {
>          cpu_to_be32(4),
>          cpu_to_be32(maxdomain),


