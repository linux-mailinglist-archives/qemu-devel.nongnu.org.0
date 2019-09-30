Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EACBC1B2C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Sep 2019 07:57:08 +0200 (CEST)
Received: from localhost ([::1]:46226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iEogF-0002bb-Ll
	for lists+qemu-devel@lfdr.de; Mon, 30 Sep 2019 01:57:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33074)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iEoeq-0001mc-TZ
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 01:55:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iEoep-0006vW-Fs
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 01:55:40 -0400
Received: from 11.mo5.mail-out.ovh.net ([46.105.47.167]:49015)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iEoep-0006vH-9r
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 01:55:39 -0400
Received: from player795.ha.ovh.net (unknown [10.108.54.13])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 699E92505D1
 for <qemu-devel@nongnu.org>; Mon, 30 Sep 2019 07:55:37 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player795.ha.ovh.net (Postfix) with ESMTPSA id C77AAA48D92E;
 Mon, 30 Sep 2019 05:55:24 +0000 (UTC)
Subject: Re: [PATCH v2 28/33] spapr: Remove SpaprIrq::init_kvm hook
To: David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20190927055028.11493-1-david@gibson.dropbear.id.au>
 <20190927055028.11493-29-david@gibson.dropbear.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <dabd5af2-f07a-cd4f-e965-9a4eb07eeade@kaod.org>
Date: Mon, 30 Sep 2019 07:55:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190927055028.11493-29-david@gibson.dropbear.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 11013552890250103577
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrgedugddutdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.47.167
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
Cc: Jason Wang <jasowang@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>, groug@kaod.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/09/2019 07:50, David Gibson wrote:
> This hook is a bit odd.  The only caller is spapr_irq_init_kvm(), but
> it explicitly takes an SpaprIrq *, so it's never really called through =
the
> current SpaprIrq.  Essentially this is just a way of passing through a
> function pointer so that spapr_irq_init_kvm() can handle some
> configuration and error handling logic without duplicating it between t=
he
> xics and xive reset paths.

yes. There were a few iteration before reaching that state.=20
=20
> So, make it just take that function pointer.  Because of earlier rework=
s
> to the KVM connect/disconnect code in the xics and xive backends we can
> also eliminate some wrapper functions and streamline error handling a b=
it.
>=20
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

> ---
>  hw/ppc/spapr_irq.c         | 74 +++++++++++++-------------------------
>  include/hw/ppc/spapr_irq.h |  1 -
>  2 files changed, 25 insertions(+), 50 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
> index 561bdbc4de..c6abebc4ef 100644
> --- a/hw/ppc/spapr_irq.c
> +++ b/hw/ppc/spapr_irq.c
> @@ -65,33 +65,35 @@ void spapr_irq_msi_free(SpaprMachineState *spapr, i=
nt irq, uint32_t num)
>      bitmap_clear(spapr->irq_map, irq - SPAPR_IRQ_MSI, num);
>  }
> =20
> -static void spapr_irq_init_kvm(SpaprMachineState *spapr,
> -                                  SpaprIrq *irq, Error **errp)
> +static int spapr_irq_init_kvm(int (*fn)(SpaprInterruptController *, Er=
ror **),
> +                              SpaprInterruptController *intc,
> +                              Error **errp)
>  {
> -    MachineState *machine =3D MACHINE(spapr);
> +    MachineState *machine =3D MACHINE(qdev_get_machine());
>      Error *local_err =3D NULL;
> =20
>      if (kvm_enabled() && machine_kernel_irqchip_allowed(machine)) {
> -        irq->init_kvm(spapr, &local_err);
> -        if (local_err && machine_kernel_irqchip_required(machine)) {
> -            error_prepend(&local_err,
> -                          "kernel_irqchip requested but unavailable: "=
);
> -            error_propagate(errp, local_err);
> -            return;
> -        }
> +        if (fn(intc, &local_err) < 0) {
> +            if (machine_kernel_irqchip_required(machine)) {
> +                error_prepend(&local_err,
> +                              "kernel_irqchip requested but unavailabl=
e: ");
> +                error_propagate(errp, local_err);
> +                return -1;
> +            }
> =20
> -        if (!local_err) {
> -            return;
> +            /*
> +             * We failed to initialize the KVM device, fallback to
> +             * emulated mode
> +             */
> +            error_prepend(&local_err,
> +                          "kernel_irqchip allowed but unavailable: ");
> +            error_append_hint(&local_err,
> +                              "Falling back to kernel-irqchip=3Doff\n"=
);
> +            warn_report_err(local_err);
>          }
> -
> -        /*
> -         * We failed to initialize the KVM device, fallback to
> -         * emulated mode
> -         */
> -        error_prepend(&local_err, "kernel_irqchip allowed but unavaila=
ble: ");
> -        error_append_hint(&local_err, "Falling back to kernel-irqchip=3D=
off\n");
> -        warn_report_err(local_err);
>      }
> +
> +    return 0;
>  }
> =20
>  /*
> @@ -112,20 +114,7 @@ static int spapr_irq_post_load_xics(SpaprMachineSt=
ate *spapr, int version_id)
> =20
>  static void spapr_irq_reset_xics(SpaprMachineState *spapr, Error **err=
p)
>  {
> -    Error *local_err =3D NULL;
> -
> -    spapr_irq_init_kvm(spapr, &spapr_irq_xics, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> -        return;
> -    }
> -}
> -
> -static void spapr_irq_init_kvm_xics(SpaprMachineState *spapr, Error **=
errp)
> -{
> -    if (kvm_enabled()) {
> -        xics_kvm_connect(SPAPR_INTC(spapr->ics), errp);
> -    }
> +    spapr_irq_init_kvm(xics_kvm_connect, SPAPR_INTC(spapr->ics), errp)=
;
>  }
> =20
>  SpaprIrq spapr_irq_xics =3D {
> @@ -136,7 +125,6 @@ SpaprIrq spapr_irq_xics =3D {
> =20
>      .post_load   =3D spapr_irq_post_load_xics,
>      .reset       =3D spapr_irq_reset_xics,
> -    .init_kvm    =3D spapr_irq_init_kvm_xics,
>  };
> =20
>  /*
> @@ -151,7 +139,6 @@ static int spapr_irq_post_load_xive(SpaprMachineSta=
te *spapr, int version_id)
>  static void spapr_irq_reset_xive(SpaprMachineState *spapr, Error **err=
p)
>  {
>      CPUState *cs;
> -    Error *local_err =3D NULL;
> =20
>      CPU_FOREACH(cs) {
>          PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> @@ -160,9 +147,8 @@ static void spapr_irq_reset_xive(SpaprMachineState =
*spapr, Error **errp)
>          spapr_xive_set_tctx_os_cam(spapr_cpu_state(cpu)->tctx);
>      }
> =20
> -    spapr_irq_init_kvm(spapr, &spapr_irq_xive, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> +    if (spapr_irq_init_kvm(kvmppc_xive_connect,
> +                           SPAPR_INTC(spapr->xive), errp) < 0) {
>          return;
>      }
> =20
> @@ -170,13 +156,6 @@ static void spapr_irq_reset_xive(SpaprMachineState=
 *spapr, Error **errp)
>      spapr_xive_mmio_set_enabled(spapr->xive, true);
>  }
> =20
> -static void spapr_irq_init_kvm_xive(SpaprMachineState *spapr, Error **=
errp)
> -{
> -    if (kvm_enabled()) {
> -        kvmppc_xive_connect(SPAPR_INTC(spapr->xive), errp);
> -    }
> -}
> -
>  SpaprIrq spapr_irq_xive =3D {
>      .nr_xirqs    =3D SPAPR_NR_XIRQS,
>      .nr_msis     =3D SPAPR_NR_MSIS,
> @@ -185,7 +164,6 @@ SpaprIrq spapr_irq_xive =3D {
> =20
>      .post_load   =3D spapr_irq_post_load_xive,
>      .reset       =3D spapr_irq_reset_xive,
> -    .init_kvm    =3D spapr_irq_init_kvm_xive,
>  };
> =20
>  /*
> @@ -251,7 +229,6 @@ SpaprIrq spapr_irq_dual =3D {
> =20
>      .post_load   =3D spapr_irq_post_load_dual,
>      .reset       =3D spapr_irq_reset_dual,
> -    .init_kvm    =3D NULL, /* should not be used */
>  };
> =20
> =20
> @@ -682,7 +659,6 @@ SpaprIrq spapr_irq_xics_legacy =3D {
> =20
>      .post_load   =3D spapr_irq_post_load_xics,
>      .reset       =3D spapr_irq_reset_xics,
> -    .init_kvm    =3D spapr_irq_init_kvm_xics,
>  };
> =20
>  static void spapr_irq_register_types(void)
> diff --git a/include/hw/ppc/spapr_irq.h b/include/hw/ppc/spapr_irq.h
> index c82724fc2b..c947f40571 100644
> --- a/include/hw/ppc/spapr_irq.h
> +++ b/include/hw/ppc/spapr_irq.h
> @@ -85,7 +85,6 @@ typedef struct SpaprIrq {
> =20
>      int (*post_load)(SpaprMachineState *spapr, int version_id);
>      void (*reset)(SpaprMachineState *spapr, Error **errp);
> -    void (*init_kvm)(SpaprMachineState *spapr, Error **errp);
>  } SpaprIrq;
> =20
>  extern SpaprIrq spapr_irq_xics;
>=20


