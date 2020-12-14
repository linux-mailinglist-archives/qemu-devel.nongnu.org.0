Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E72552D948A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 10:04:20 +0100 (CET)
Received: from localhost ([::1]:47478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kojmG-0003x1-0U
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 04:04:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kojjB-0002Ee-0N; Mon, 14 Dec 2020 04:01:12 -0500
Received: from ozlabs.org ([203.11.71.1]:43543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kojj6-0006tm-Mj; Mon, 14 Dec 2020 04:01:08 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Cvb2z5F8nz9sTK; Mon, 14 Dec 2020 20:00:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607936459;
 bh=Pq9EMB2ezGYOXhX4VlBLlJJsn9o1RIyKxHooX6Iw8OY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=faB2TJo//YLHeOpObnHlqrgLqQ/iyVEX8hjyYcWwzj+nx4aG6kgFNSTIZssw4ea5+
 c5Nl2Llpuz8eth6Jt+wkKaHLaifcgnv14LUETCjj9d1wiT4NhlG4Ke6N5f16oIJ7ZE
 KxxtwuBVOCz/KzTjEce4UynVvs83PkvXsiWA2/IE=
Date: Mon, 14 Dec 2020 16:55:25 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 3/8] hw/ppc/virtex_ml507: Drop use of ppcuic_init()
Message-ID: <20201214055525.GD4717@yekko.fritz.box>
References: <20201212001537.24520-1-peter.maydell@linaro.org>
 <20201212001537.24520-4-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="n/aVsWSeQ4JHkrmm"
Content-Disposition: inline
In-Reply-To: <20201212001537.24520-4-peter.maydell@linaro.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--n/aVsWSeQ4JHkrmm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 12, 2020 at 12:15:32AM +0000, Peter Maydell wrote:
> Switch the virtex_ml507 board to directly creating and
> configuring the UIC, rather than doing it via the old
> ppcuic_init() helper function.
>=20
> This fixes a trivial Coverity-detected memory leak where
> we were leaking the array of IRQs returned by ppcuic_init().
>=20
> Fixes: Coverity CID 1421992
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Applied to ppc-for-6.0.

> ---
>  hw/ppc/virtex_ml507.c | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
> index 7f1bca928c1..34767b11cad 100644
> --- a/hw/ppc/virtex_ml507.c
> +++ b/hw/ppc/virtex_ml507.c
> @@ -43,6 +43,7 @@
>  #include "qemu/option.h"
>  #include "exec/address-spaces.h"
> =20
> +#include "hw/intc/ppc-uic.h"
>  #include "hw/ppc/ppc.h"
>  #include "hw/ppc/ppc4xx.h"
>  #include "hw/qdev-properties.h"
> @@ -95,7 +96,8 @@ static PowerPCCPU *ppc440_init_xilinx(const char *cpu_t=
ype, uint32_t sysclk)
>  {
>      PowerPCCPU *cpu;
>      CPUPPCState *env;
> -    qemu_irq *irqs;
> +    DeviceState *uicdev;
> +    SysBusDevice *uicsbd;
> =20
>      cpu =3D POWERPC_CPU(cpu_create(cpu_type));
>      env =3D &cpu->env;
> @@ -105,10 +107,19 @@ static PowerPCCPU *ppc440_init_xilinx(const char *c=
pu_type, uint32_t sysclk)
>      ppc_dcr_init(env, NULL, NULL);
> =20
>      /* interrupt controller */
> -    irqs =3D g_new0(qemu_irq, PPCUIC_OUTPUT_NB);
> -    irqs[PPCUIC_OUTPUT_INT] =3D ((qemu_irq *)env->irq_inputs)[PPC40x_INP=
UT_INT];
> -    irqs[PPCUIC_OUTPUT_CINT] =3D ((qemu_irq *)env->irq_inputs)[PPC40x_IN=
PUT_CINT];
> -    ppcuic_init(env, irqs, 0x0C0, 0, 1);
> +    uicdev =3D qdev_new(TYPE_PPC_UIC);
> +    uicsbd =3D SYS_BUS_DEVICE(uicdev);
> +
> +    object_property_set_link(OBJECT(uicdev), "cpu", OBJECT(cpu),
> +                             &error_fatal);
> +    sysbus_realize_and_unref(uicsbd, &error_fatal);
> +
> +    sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_INT,
> +                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_INT]);
> +    sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_CINT,
> +                       ((qemu_irq *)env->irq_inputs)[PPC40x_INPUT_CINT]);
> +
> +    /* This board doesn't wire anything up to the inputs of the UIC. */
>      return cpu;
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--n/aVsWSeQ4JHkrmm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/W/kwACgkQbDjKyiDZ
s5I7IRAAxtw5G4zp43Dh+Li3sXNhbf/87Mf7AYVolmReMq+lgalYtFZ93+9RD1rL
Wp32sYDhP6ddMmjjEdE2R72vz54ezJ2OMh1fM1WBqUSGKeANytl+iXDaNNDPo4D4
W5ImSAt9EkRe6on9OBTfRdsFFLMSmOxKVygJMHbGhmI9e+iP4GrizhUBnV5uvVYq
glKgjpFK12PI2ZbbwCV4JYuHeoJB/JhOWvFfkeHrLfsXmEK054hZOc65i8H3s7Dh
CCbozk/3j+HEv4jSBJqw78RnLOs3UIwX+kNaez2JoU4RyJ1kdJEiDv/Ar1evWd1+
oasyATUNOzPRi3yCp3EjRb3KgfJQuQxrBz2bzxtC4/A8ap19lPWkdjB/Db2eWJ3U
MejeeoEC+OUe0eACDQAronawDVuMm/jvKOrWBnnsetQKrHgTK1n311PDLnclhAfC
UYn64zcBhhQAGD4S0DEJE/8GsZsQLtyyc5d5bpkfz85AvOLoTnd8+qBqjQ2adlFS
V41NI460Tu5eJy+PXnGNBnipV88H7sO+FeV5gZmwqFqS/YNpmkYi2tooYrhTIYDR
c2wr1FkcK8iNZpTHwT7lSAhof/ZwM/VjvIuVXghYzBYS9ezsNN+tbcSAnyKrCdQC
FaCgoy4I888t24Gfky7PGYL5fADZocml7COM8cFXYHNNG4toR7c=
=axhd
-----END PGP SIGNATURE-----

--n/aVsWSeQ4JHkrmm--

