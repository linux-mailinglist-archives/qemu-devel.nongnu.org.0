Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 089553F7AE6
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 18:48:15 +0200 (CEST)
Received: from localhost ([::1]:47944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIw4U-0001Td-3x
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 12:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mIw3c-0000fa-Rr
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 12:47:20 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:42744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mIw3Z-0000va-Rf
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 12:47:20 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-HhpdPUesNfWQtOumLeUJVw-1; Wed, 25 Aug 2021 12:46:51 -0400
X-MC-Unique: HhpdPUesNfWQtOumLeUJVw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B0961008065;
 Wed, 25 Aug 2021 16:46:49 +0000 (UTC)
Received: from bahia.lan (unknown [10.39.194.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C6E75D741;
 Wed, 25 Aug 2021 16:46:48 +0000 (UTC)
Date: Wed, 25 Aug 2021 18:46:47 +0200
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [RESEND PATCH v3 2/5] spapr: move NUMA data init to post-CAS
Message-ID: <20210825184647.24711857@bahia.lan>
In-Reply-To: <20210825143943.529733-3-danielhb413@gmail.com>
References: <20210825143943.529733-1-danielhb413@gmail.com>
 <20210825143943.529733-3-danielhb413@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
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

On Wed, 25 Aug 2021 11:39:40 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> The pSeries machine will support a new NUMA affinity form, FORM2.
> This new FORM will be negotiated via ibm,architecture-vec5 during
> CAS. All artifacts and assumptions that are currently on use for
> FORM1 affinity will be deprecated in a guest that chooses to use
> FORM2. This means that we're going to wait until CAS to determine
> whether we're going to use FORM1 and FORM2.
>=20
> This patch does that by moving all NUMA data init functions to post-CAS
> time. spapr_numa_associativity_init() is moved from spapr_machine_init()
> to do_client_architecture_support(). Straightforward change since the
> initialization of spapr->numa_assoc_array is transparent to the guest.
>=20
> spapr_numa_write_rtas_dt() is more complex. The function is called from
> spapr_dt_rtas(), which in turned is called by spapr_build_fdt().

It seems some other functions like spapr_numa_write_associativity_dt()
or spapr_numa_get_vcpu_assoc() could also be affected by the delayed call
to spapr_numa_associativity_init().

> spapr_build_fdt() is called in two places: spapr_machine_reset() and
> do_client_architecture_support(). This means that we're writing RTAS
> nodes with NUMA artifacts without going through CAS first, and then
> writing it again post CAS. This is not an issue because, at this moment,
> we always write the same FORM1 NUMA affinity properties in the DT.
> With the upcoming FORM2 support, we're now reliant on guest choice to
> decide what to write.
>=20
> The proposed solution is to change spapr_numa_write_rtas_dt() to not
> write the DT until we're post-CAS. This is a benign guest visible change
> (a well behaved guest wouldn't bother to read NUMA properties before CAs)=
,
> but to be on the safe side, let's wrap it with a machine class flag to sk=
ip
> this logic unless we're running with the latest machine type. This also
> means that FORM2 support will not be available for older machine types.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/ppc/spapr.c         |  6 +++---
>  hw/ppc/spapr_hcall.c   |  4 ++++
>  hw/ppc/spapr_numa.c    | 11 +++++++++++
>  include/hw/ppc/spapr.h |  1 +
>  4 files changed, 19 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 5459f9a7e9..d8363bda88 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -2809,9 +2809,6 @@ static void spapr_machine_init(MachineState *machin=
e)
> =20
>      spapr->gpu_numa_id =3D spapr_numa_initial_nvgpu_numa_id(machine);
> =20
> -    /* Init numa_assoc_array */
> -    spapr_numa_associativity_init(spapr, machine);
> -
>      if ((!kvm_enabled() || kvmppc_has_cap_mmu_radix()) &&
>          ppc_type_check_compat(machine->cpu_type, CPU_POWERPC_LOGICAL_3_0=
0, 0,
>                                spapr->max_compat_pvr)) {
> @@ -4709,8 +4706,11 @@ DEFINE_SPAPR_MACHINE(6_1, "6.1", true);
>   */
>  static void spapr_machine_6_0_class_options(MachineClass *mc)
>  {
> +    SpaprMachineClass *smc =3D SPAPR_MACHINE_CLASS(mc);
> +
>      spapr_machine_6_1_class_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_6_0, hw_compat_6_0_len)=
;
> +    smc->pre_6_1_numa_affinity =3D true;

Versions should be bumped now that 6.1 is released.

>  }
> =20
>  DEFINE_SPAPR_MACHINE(6_0, "6.0", false);
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 0e9a5b2e40..1cc88716c1 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -11,6 +11,7 @@
>  #include "helper_regs.h"
>  #include "hw/ppc/spapr.h"
>  #include "hw/ppc/spapr_cpu_core.h"
> +#include "hw/ppc/spapr_numa.h"
>  #include "mmu-hash64.h"
>  #include "cpu-models.h"
>  #include "trace.h"
> @@ -1197,6 +1198,9 @@ target_ulong do_client_architecture_support(PowerPC=
CPU *cpu,
>      spapr->cas_pre_isa3_guest =3D !spapr_ovec_test(ov1_guest, OV1_PPC_3_=
00);
>      spapr_ovec_cleanup(ov1_guest);
> =20
> +    /* Init numa_assoc_array */
> +    spapr_numa_associativity_init(spapr, MACHINE(spapr));
> +
>      /*
>       * Ensure the guest asks for an interrupt mode we support;
>       * otherwise terminate the boot.
> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
> index 04a86f9b5b..b0bd056546 100644
> --- a/hw/ppc/spapr_numa.c
> +++ b/hw/ppc/spapr_numa.c
> @@ -379,6 +379,17 @@ static void spapr_numa_FORM1_write_rtas_dt(SpaprMach=
ineState *spapr,
>   */
>  void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int r=
tas)
>  {
> +    SpaprMachineClass *smc =3D SPAPR_MACHINE_GET_CLASS(spapr);
> +
> +    /*
> +     * pre-6.1 machine types were writing RTAS information before

pre-6.2

> +     * CAS. Check if that's case before changing their existing
> +     * behavior.
> +     */
> +    if (spapr_ovec_empty(spapr->ov5_cas) && !smc->pre_6_1_numa_affinity)=
 {

Checking emptiness of spapr->ov5_cas is a hack since the guest
could have cleared all the bits... I'm not a big fan of checks
for pre/post CAS actually even if I had to add one for memory
hot unplug support some time back.

I'm not sure about the motivation for this patch. Is it *just* to
avoid the supposedly useless generation of FORM1 properties in
the initial DT ? If yes, this isn't a hot path so I don't think
it's worth the pain. We can start with FORM1 and switch to FORM2
if the guest requests so during CAS, no ?

> +        return;
> +    }
> +
>      spapr_numa_FORM1_write_rtas_dt(spapr, fdt, rtas);
>  }
> =20
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index 637652ad16..068a29535a 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -145,6 +145,7 @@ struct SpaprMachineClass {
>      hwaddr rma_limit;          /* clamp the RMA to this size */
>      bool pre_5_1_assoc_refpoints;
>      bool pre_5_2_numa_associativity;
> +    bool pre_6_1_numa_affinity;
> =20
>      bool (*phb_placement)(SpaprMachineState *spapr, uint32_t index,
>                            uint64_t *buid, hwaddr *pio,


