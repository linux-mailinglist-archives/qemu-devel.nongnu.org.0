Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FCCAF6EA
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 09:30:26 +0200 (CEST)
Received: from localhost ([::1]:47402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7x57-00043i-Gb
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 03:30:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47152)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1i7x3j-00034y-St
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 03:29:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1i7x3i-0007ZH-Ro
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 03:28:59 -0400
Received: from 8.mo68.mail-out.ovh.net ([46.105.74.219]:42152)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1i7x3i-0007Xf-LJ
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 03:28:58 -0400
Received: from player778.ha.ovh.net (unknown [10.109.160.244])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id EA409141095
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2019 09:28:56 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player778.ha.ovh.net (Postfix) with ESMTPSA id 0227D99BB447;
 Wed, 11 Sep 2019 07:28:46 +0000 (UTC)
To: David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20190911040452.8341-1-david@gibson.dropbear.id.au>
 <20190911040452.8341-3-david@gibson.dropbear.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <14d8fd7e-d00b-84ce-44d4-464b49d818f0@kaod.org>
Date: Wed, 11 Sep 2019 09:28:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190911040452.8341-3-david@gibson.dropbear.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 11689092834240400166
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrtddugdduvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.74.219
Subject: Re: [Qemu-devel] [PATCH 2/7] spapr: Move handling of special NVLink
 numa node from reset to init
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
Cc: aik@ozlabs.ru, lvivier@redhat.com, philmd@redhat.com, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/09/2019 06:04, David Gibson wrote:
> The number of NUMA nodes in the system is fixed from the command line.
> Therefore, there's no need to recalculate it at reset time, and we can
> determine the special gpu_numa_id value used for NVLink2 devices at ini=
t
> time.
>=20
> This simplifies the reset path a bit which will make further improvemen=
ts
> easier.
>=20
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>


Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>  hw/ppc/spapr.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index c551001f86..e03e874d94 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1737,16 +1737,6 @@ static void spapr_machine_reset(MachineState *ma=
chine)
>          spapr_setup_hpt_and_vrma(spapr);
>      }
> =20
> -    /*
> -     * NVLink2-connected GPU RAM needs to be placed on a separate NUMA=
 node.
> -     * We assign a new numa ID per GPU in spapr_pci_collect_nvgpu() wh=
ich is
> -     * called from vPHB reset handler so we initialize the counter her=
e.
> -     * If no NUMA is configured from the QEMU side, we start from 1 as=
 GPU RAM
> -     * must be equally distant from any other node.
> -     * The final value of spapr->gpu_numa_id is going to be written to
> -     * max-associativity-domains in spapr_build_fdt().
> -     */
> -    spapr->gpu_numa_id =3D MAX(1, machine->numa_state->num_nodes);
>      qemu_devices_reset();
> =20
>      /*
> @@ -2885,6 +2875,17 @@ static void spapr_machine_init(MachineState *mac=
hine)
> =20
>      }
> =20
> +    /*
> +     * NVLink2-connected GPU RAM needs to be placed on a separate NUMA=
 node.
> +     * We assign a new numa ID per GPU in spapr_pci_collect_nvgpu() wh=
ich is
> +     * called from vPHB reset handler so we initialize the counter her=
e.
> +     * If no NUMA is configured from the QEMU side, we start from 1 as=
 GPU RAM
> +     * must be equally distant from any other node.
> +     * The final value of spapr->gpu_numa_id is going to be written to
> +     * max-associativity-domains in spapr_build_fdt().
> +     */
> +    spapr->gpu_numa_id =3D MAX(1, machine->numa_state->num_nodes);
> +
>      if ((!kvm_enabled() || kvmppc_has_cap_mmu_radix()) &&
>          ppc_type_check_compat(machine->cpu_type, CPU_POWERPC_LOGICAL_3=
_00, 0,
>                                spapr->max_compat_pvr)) {
>=20


