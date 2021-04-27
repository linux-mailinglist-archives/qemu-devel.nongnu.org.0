Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D816936BDD4
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 05:44:25 +0200 (CEST)
Received: from localhost ([::1]:44862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbEe8-0001gQ-UC
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 23:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lbEZJ-00056E-Bf; Mon, 26 Apr 2021 23:39:25 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:46209 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lbEZF-0005SA-2m; Mon, 26 Apr 2021 23:39:25 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FTnYw2jGVz9sXH; Tue, 27 Apr 2021 13:39:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1619494756;
 bh=fECWLovo7b2Uu2vzZX7xMjjGRf3WNEY1Hx6hHcB1pTU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FrueoglQG7JQIKSPlJUch+wpYzXzEpw8sbiPah3YaE/phd2An6JqeKFBD7pjyZAvo
 wqtpbnMZQEkWFe83DvxTGNpk8cHB8tQf+Zodhu8tdVpeqUk5IAciTyMjR52aSa/oQ+
 23VL3PMNgiW4hp0oARaInI+y0UdswY4oOZMEyYOA=
Date: Tue, 27 Apr 2021 13:38:55 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
Subject: Re: [RFC PATCH 4/4] target/ppc: isolated cpu init from translation
 logic
Message-ID: <YIeHTz/A+eJ9IFHI@yekko.fritz.box>
References: <20210423191807.77963-1-bruno.larsen@eldorado.org.br>
 <20210423191807.77963-5-bruno.larsen@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zNEoqc/wsB9Ymq2c"
Content-Disposition: inline
In-Reply-To: <20210423191807.77963-5-bruno.larsen@eldorado.org.br>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: farosas@linux.ibm.com, qemu-devel@nongnu.org, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--zNEoqc/wsB9Ymq2c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 23, 2021 at 04:18:07PM -0300, Bruno Larsen (billionai) wrote:
65;6203;1c> finished isolation of CPU initialization logic from
> translation logic. CPU initialization now only has common code
> and may or may not call accelerator-specific code, as the
> build options require.
>=20
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> ---
>  target/ppc/{translate_init.c.inc =3D> cpu_init.c} | 11 ++++++++++-
>  target/ppc/meson.build                          |  1 +
>  target/ppc/translate.c                          |  4 +++-
>  3 files changed, 14 insertions(+), 2 deletions(-)
>  rename target/ppc/{translate_init.c.inc =3D> cpu_init.c} (99%)
>=20
> diff --git a/target/ppc/translate_init.c.inc b/target/ppc/cpu_init.c
> similarity index 99%
> rename from target/ppc/translate_init.c.inc
> rename to target/ppc/cpu_init.c
> index 33e44f1363..38e4c87aa5 100644
> --- a/target/ppc/translate_init.c.inc
> +++ b/target/ppc/cpu_init.c
> @@ -18,6 +18,7 @@
>   * License along with this library; if not, see <http://www.gnu.org/lice=
nses/>.
>   */
> =20
> +#include "qemu/osdep.h"
>  #include "disas/dis-asm.h"
>  #include "exec/gdbstub.h"
>  #include "kvm_ppc.h"
> @@ -42,6 +43,9 @@
>  #include "fpu/softfloat.h"
>  #include "qapi/qapi-commands-machine-target.h"
> =20
> +#include "helper_regs.h"
> +#include "internal.h"
> +
>  /* #define PPC_DUMP_CPU */
>  /* #define PPC_DEBUG_SPR */
>  /* #define PPC_DUMP_SPR_ACCESSES */
> @@ -51,7 +55,12 @@ static inline void vscr_init(CPUPPCState *env, uint32_=
t val)
>  {
>      /* Altivec always uses round-to-nearest */
>      set_float_rounding_mode(float_round_nearest_even, &env->vec_status);
> -    helper_mtvscr(env, val);
> +    /*
> +     * This comment is here just so the project will build.
> +     * The current solution is in another patch and will be
> +     * added when we figure out an internal fork of qemu
> +     */
> +    /* helper_mtvscr(env, val); */

Ugh.  Yeah, this doesn't belong here at all.  This looks like what
should be reset time initialization of the VSCR, which isn't actually
an SPR, though it's somewhat similar.  It really belongs in the reset
path for the relevant CPUs, not with the construction of the CPU
registers itself.

>  }
> =20
>  /*
> diff --git a/target/ppc/meson.build b/target/ppc/meson.build
> index aaee5e7c0c..14f0ba5d48 100644
> --- a/target/ppc/meson.build
> +++ b/target/ppc/meson.build
> @@ -2,6 +2,7 @@ ppc_ss =3D ss.source_set()
>  ppc_ss.add(files(
>    'cpu-models.c',
>    'cpu.c',
> +  'cpu_init.c',
>    'dfp_helper.c',
>    'excp_helper.c',
>    'fpu_helper.c',
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index bb893be928..a4d9fb8d54 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -37,6 +37,9 @@
>  #include "exec/log.h"
>  #include "qemu/atomic128.h"
> =20
> +#include "qemu/qemu-print.h"
> +#include "qapi/error.h"
> +#include "internal.h"
> =20
>  #define CPU_SINGLE_STEP 0x1
>  #define CPU_BRANCH_STEP 0x2
> @@ -7593,7 +7596,6 @@ GEN_HANDLER2_E(trechkpt, "trechkpt", 0x1F, 0x0E, 0x=
1F, 0x03FFF800, \
>  };
> =20
>  #include "helper_regs.h"
> -#include "translate_init.c.inc"
> =20
>  /***********************************************************************=
******/
>  /* Misc PowerPC helpers */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--zNEoqc/wsB9Ymq2c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCHh08ACgkQbDjKyiDZ
s5Ji3hAAuRXsL43wi2EHDnlNKvay52hjhZsQdij70+rMVHCR5hE5mmSR7nhBlZcN
yk35EGeR8HhMMllsC/3PwfJB6IgoK9aHP5lwVYVuFcBVVikCtECwPXAZESiCCIbd
dh8dGVaPfvKAR/VfoKDoQoB8Qe25+o6Y4bgyjFRziJ0dqBZOzJ00wLIS9LeHLWvm
5pvDBkgq1X6A6A06lZbYRf27k44AZLHfflh7jF5CTnWhCHwVlrHKuU5aqoO91QGq
haQRkJEDebmv5ONLcBeZ0vjmTT3gbGGk9aD3ioGaXyo+L+wYcwayUArV2N9lhYlw
ImEib830kr0Nv7cwM3n94fZ8rxOCqSNFZdyI+2kaECYLsQkmlJcaC+R2k0zDBjNi
NThKnyfzHXM2/bHiM1SAtMwN031LaQjQYlcFxvw9oguw326Sd4l8BO/UZiHJsaol
3HBwUU0q3eqitGl14NvDqoBeV6syk826r+BlFnDnwyo/pnXKt8nAeO7lG1dgL7co
J0vf5i1uahCJ+i/KHT1yT4TCVpDgWRP1sVBXSNTdEB7QZ2+SC+W+88L6R8i/IXjD
dsZ0klP8s2FGt8CVN4RZVwkfwFb7l8ykyR7i7fV9oh9RNoH4NY9V9OtLKvZ9IeuH
USGEzSmuOQzPoQnk4CF34rjOGKNzIR/gbTm00OQlG7wA4k+TJ5g=
=8yeN
-----END PGP SIGNATURE-----

--zNEoqc/wsB9Ymq2c--

