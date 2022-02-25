Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5484C4C3CF3
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 05:12:41 +0100 (CET)
Received: from localhost ([::1]:43190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNRyA-0004uT-Su
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 23:12:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nNRhQ-0007sP-D3; Thu, 24 Feb 2022 22:55:22 -0500
Received: from [2404:9400:2221:ea00::3] (port=40987 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nNRhG-0001PQ-9c; Thu, 24 Feb 2022 22:55:18 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4K4bWm1tsZz4xml; Fri, 25 Feb 2022 14:55:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1645761300;
 bh=GRzKIcvAr4AatZqDJYSljs7BcN3i64G28Ut2nya2ML0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aCYnUIoA2NQf+7JYrJg/02SjU3PbHLQg2MFYJOnYBtE2htRfZ86Oxp9EQldFjOKKO
 RZ1rUiUCcPZiFKQtXAhtJFIg4EkexP4jrUWnb16yOvy+uscjsCNGmXk6OHV2Z39Tx6
 sBuV5af4AC0WUs+2oNTxNEQs7QbVzVuDSnzBFOsU=
Date: Fri, 25 Feb 2022 14:21:25 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [RFC PATCH 3/4] hw/ppc: Take nested guest into account when
 saving timebase
Message-ID: <YhhLNVXO/Uj7XpVi@yekko>
References: <20220224185817.2207228-1-farosas@linux.ibm.com>
 <20220224185817.2207228-4-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LMH6UsOSkiKh1dvN"
Content-Disposition: inline
In-Reply-To: <20220224185817.2207228-4-farosas@linux.ibm.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2404:9400:2221:ea00::3
 (failed)
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: aik@ozlabs.ru, danielhb413@gmail.com, qemu-devel@nongnu.org,
 npiggin@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--LMH6UsOSkiKh1dvN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 24, 2022 at 03:58:16PM -0300, Fabiano Rosas wrote:
> When saving the guest "timebase" we look to the first_cpu for its
> tb_offset. If that CPU happens to be running a nested guest at this
> time, the tb_offset will have the nested guest value.
>=20
> This was caught by code inspection.

This doesn't seem right.  Isn't the real problem that nested_tb_offset
isn't being migrated?  If you migrate that, shouldn't everything be
fixed up when the L1 cpu leaves the nested guest on the destination
host?

>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>  hw/ppc/ppc.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> index 9e99625ea9..093cd87014 100644
> --- a/hw/ppc/ppc.c
> +++ b/hw/ppc/ppc.c
> @@ -36,6 +36,7 @@
>  #include "kvm_ppc.h"
>  #include "migration/vmstate.h"
>  #include "trace.h"
> +#include "hw/ppc/spapr_cpu_core.h"
> =20
>  static void cpu_ppc_tb_stop (CPUPPCState *env);
>  static void cpu_ppc_tb_start (CPUPPCState *env);
> @@ -961,19 +962,33 @@ static void timebase_save(PPCTimebase *tb)
>  {
>      uint64_t ticks =3D cpu_get_host_ticks();
>      PowerPCCPU *first_ppc_cpu =3D POWERPC_CPU(first_cpu);
> +    int64_t tb_offset;
> =20
>      if (!first_ppc_cpu->env.tb_env) {
>          error_report("No timebase object");
>          return;
>      }
> =20
> +    tb_offset =3D first_ppc_cpu->env.tb_env->tb_offset;
> +
> +    if (first_ppc_cpu->vhyp && vhyp_cpu_in_nested(first_ppc_cpu)) {
> +        SpaprCpuState *spapr_cpu =3D spapr_cpu_state(first_ppc_cpu);
> +
> +        /*
> +         * If the first_cpu happens to be running a nested guest at
> +         * this time, tb_env->tb_offset will contain the nested guest
> +         * offset.
> +         */
> +        tb_offset -=3D spapr_cpu->nested_tb_offset;
> +    }
> +
>      /* not used anymore, we keep it for compatibility */
>      tb->time_of_the_day_ns =3D qemu_clock_get_ns(QEMU_CLOCK_HOST);
>      /*
>       * tb_offset is only expected to be changed by QEMU so
>       * there is no need to update it from KVM here
>       */
> -    tb->guest_timebase =3D ticks + first_ppc_cpu->env.tb_env->tb_offset;
> +    tb->guest_timebase =3D ticks + tb_offset;
> =20
>      tb->runstate_paused =3D
>          runstate_check(RUN_STATE_PAUSED) || runstate_check(RUN_STATE_SAV=
E_VM);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--LMH6UsOSkiKh1dvN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIYSy8ACgkQgypY4gEw
YSL3/Q//a9Hc31zWpn5o1kVGE4YRXUo+TdfFCf2+s6q/PiO2iht2kF7e6CvM9Jpk
l863OyWRGertTJVnpU0AaLzXxH6U1NLBpj2XN3G57YJJqHq5CSV+aXlMGQQ6onRI
N2MAHCxOQC81+zSiMAjig/s5MUXVmAQx5JawCfs44DqRbVLip9OsCf+4n1Usb6tk
OJkMrDqyDwm7MvQczx8Rv0GEElJlNGplnI2JJIGgDxC+FhukL0a/sJxeyK32W9ze
dTIC7HvOn6WXBz7+ED1nok9/C57SYJEeA4lO2Mzfk19AKKjDZBnBuBOERUWa75WL
+Tb6+WjzK8FZGRbQ4cbbUrjDeIYri9fKZYuJayVCN12RDNlYuwJaimBlteSfPjwP
YOY4uq/E8hPhJDVzuIelxk8RxINQKKH/7BtiNyD/QZ/6jejg650ILEMJ4I1r0p88
ygldJgm/42K87G+GTSShHQNFa/BeZa+H8RRJcF89KL/etS3lkaQjRjyiGDt+jfuH
/u85l7YQV4dyJGJV5Xw4613fdxK83PMNfCX5kj+XRn7TNZ7O9YOZQ13GiA2tYoWC
g9OXFRD7eLtWc8VpjSOA1zk1mAnCOadtUBlv+Gh0rfNGW8lDMpCSvhxWLpJVLUQf
zouMMhL1yzSDLdUtt8+HrHnTfkCUcMxHAIMA8K1tVRwrK+Rqz8A=
=Xm+z
-----END PGP SIGNATURE-----

--LMH6UsOSkiKh1dvN--

