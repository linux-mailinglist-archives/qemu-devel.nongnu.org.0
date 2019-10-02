Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BC6C4760
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Oct 2019 08:02:37 +0200 (CEST)
Received: from localhost ([::1]:51712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFXie-0003Fz-9u
	for lists+qemu-devel@lfdr.de; Wed, 02 Oct 2019 02:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44901)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iFXeh-0002G2-Tc
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 01:58:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iFXef-0004ew-R3
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 01:58:31 -0400
Received: from 16.mo1.mail-out.ovh.net ([178.33.104.224]:57014)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iFXef-0004bF-Kz
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 01:58:29 -0400
Received: from player691.ha.ovh.net (unknown [10.108.54.74])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id B4C8B191DE1
 for <qemu-devel@nongnu.org>; Wed,  2 Oct 2019 07:58:26 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player691.ha.ovh.net (Postfix) with ESMTPSA id 2235EA8D7127;
 Wed,  2 Oct 2019 05:58:16 +0000 (UTC)
Subject: Re: [PATCH v3 19/34] spapr: Add return value to spapr_irq_check()
To: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20191002025208.3487-1-david@gibson.dropbear.id.au>
 <20191002025208.3487-20-david@gibson.dropbear.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <15987e67-7362-7340-bf7f-471a1c81e46a@kaod.org>
Date: Wed, 2 Oct 2019 07:58:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191002025208.3487-20-david@gibson.dropbear.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 4360047392791694233
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrgeehgddutdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 178.33.104.224
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

On 02/10/2019 04:51, David Gibson wrote:
> Explicitly return success or failure, rather than just relying on the
> Error ** parameter.  This makes handling it less verbose in the caller.
>=20
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>


Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/ppc/spapr_irq.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
> index 3ac67ba0c7..0413fbd0a3 100644
> --- a/hw/ppc/spapr_irq.c
> +++ b/hw/ppc/spapr_irq.c
> @@ -529,7 +529,7 @@ SpaprIrq spapr_irq_dual =3D {
>  };
> =20
> =20
> -static void spapr_irq_check(SpaprMachineState *spapr, Error **errp)
> +static int spapr_irq_check(SpaprMachineState *spapr, Error **errp)
>  {
>      MachineState *machine =3D MACHINE(spapr);
> =20
> @@ -545,7 +545,7 @@ static void spapr_irq_check(SpaprMachineState *spap=
r, Error **errp)
>           */
>          if (spapr->irq =3D=3D &spapr_irq_dual) {
>              spapr->irq =3D &spapr_irq_xics;
> -            return;
> +            return 0;
>          }
> =20
>          /*
> @@ -565,7 +565,7 @@ static void spapr_irq_check(SpaprMachineState *spap=
r, Error **errp)
>           */
>          if (spapr->irq =3D=3D &spapr_irq_xive) {
>              error_setg(errp, "XIVE-only machines require a POWER9 CPU"=
);
> -            return;
> +            return -1;
>          }
>      }
> =20
> @@ -579,8 +579,10 @@ static void spapr_irq_check(SpaprMachineState *spa=
pr, Error **errp)
>          machine_kernel_irqchip_required(machine) &&
>          xics_kvm_has_broken_disconnect(spapr)) {
>          error_setg(errp, "KVM is too old to support ic-mode=3Ddual,ker=
nel-irqchip=3Don");
> -        return;
> +        return -1;
>      }
> +
> +    return 0;
>  }
> =20
>  /*
> @@ -589,7 +591,6 @@ static void spapr_irq_check(SpaprMachineState *spap=
r, Error **errp)
>  void spapr_irq_init(SpaprMachineState *spapr, Error **errp)
>  {
>      MachineState *machine =3D MACHINE(spapr);
> -    Error *local_err =3D NULL;
> =20
>      if (machine_kernel_irqchip_split(machine)) {
>          error_setg(errp, "kernel_irqchip split mode not supported on p=
series");
> @@ -602,9 +603,7 @@ void spapr_irq_init(SpaprMachineState *spapr, Error=
 **errp)
>          return;
>      }
> =20
> -    spapr_irq_check(spapr, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> +    if (spapr_irq_check(spapr, errp) < 0) {
>          return;
>      }
> =20
>=20


