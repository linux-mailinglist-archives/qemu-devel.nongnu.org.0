Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D32E04EB7DF
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 03:34:25 +0200 (CEST)
Received: from localhost ([::1]:47946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZNE8-0006Ma-95
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 21:34:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nZN9W-0005NG-9c; Tue, 29 Mar 2022 21:29:38 -0400
Received: from [2404:9400:2221:ea00::3] (port=60171 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nZN9T-0008T0-2n; Tue, 29 Mar 2022 21:29:37 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4KSpkc6q8gz4xXw; Wed, 30 Mar 2022 12:29:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1648603768;
 bh=8r8nIaE2b+lHttvYyu6pcXv4tw7crt0AfdMv/LegpyA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Er9kYB/GK2sxmQ9mZy46qzNEG8FE3cZDDX1Vyde2FUvO7oXiE5bGEnJLWN6fy7IcT
 dGIKDJ/ZmQxTjt3phDeKFcN7+zgdhFj1T8fVuosugtzMUwpJ8ZS+ojOaFGN9XH93Kc
 W14VT0LV9RXTTobodJq95rYf5MSmkdrSXHWSqDK4=
Date: Wed, 30 Mar 2022 11:48:54 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 1/1] hw/ppc: free env->tb_env in spapr_unrealize_vcpu()
Message-ID: <YkOo9qAX8YXNgUfc@yekko>
References: <20220329124545.529145-1-danielhb413@gmail.com>
 <20220329124545.529145-2-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kVw1Dv0ro55gQ4MK"
Content-Disposition: inline
In-Reply-To: <20220329124545.529145-2-danielhb413@gmail.com>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--kVw1Dv0ro55gQ4MK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2022 at 09:45:45AM -0300, Daniel Henrique Barboza wrote:
> The timebase is allocated during spapr_realize_vcpu() and it's not
> freed. This results in memory leaks when doing vcpu unplugs:
>=20
> =3D=3D636935=3D=3D
> =3D=3D636935=3D=3D 144 (96 direct, 48 indirect) bytes in 1 blocks are def=
initely lost in loss record 6
> ,461 of 8,135
> =3D=3D636935=3D=3D    at 0x4897468: calloc (vg_replace_malloc.c:760)
> =3D=3D636935=3D=3D    by 0x5077213: g_malloc0 (in /usr/lib64/libglib-2.0.=
so.0.6400.4)
> =3D=3D636935=3D=3D    by 0x507757F: g_malloc0_n (in /usr/lib64/libglib-2.=
0.so.0.6400.4)
> =3D=3D636935=3D=3D    by 0x93C3FB: cpu_ppc_tb_init (ppc.c:1066)
> =3D=3D636935=3D=3D    by 0x97BC2B: spapr_realize_vcpu (spapr_cpu_core.c:2=
68)
> =3D=3D636935=3D=3D    by 0x97C01F: spapr_cpu_core_realize (spapr_cpu_core=
=2Ec:337)
> =3D=3D636935=3D=3D    by 0xD4626F: device_set_realized (qdev.c:531)
> =3D=3D636935=3D=3D    by 0xD55273: property_set_bool (object.c:2273)
> =3D=3D636935=3D=3D    by 0xD523DF: object_property_set (object.c:1408)
> =3D=3D636935=3D=3D    by 0xD588B7: object_property_set_qobject (qom-qobje=
ct.c:28)
> =3D=3D636935=3D=3D    by 0xD52897: object_property_set_bool (object.c:147=
7)
> =3D=3D636935=3D=3D    by 0xD4579B: qdev_realize (qdev.c:333)
> =3D=3D636935=3D=3D
>=20
> This patch adds a cpu_ppc_tb_free() helper in hw/ppc/ppc.c to allow us
> to free the timebase. This leak is then solved by calling
> cpu_ppc_tb_free() in spapr_unrealize_vcpu().
>=20
> Fixes: 6f4b5c3ec590 ("spapr: CPU hot unplug support")
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/ppc.c            | 7 +++++++
>  hw/ppc/spapr_cpu_core.c | 3 +++
>  include/hw/ppc/ppc.h    | 1 +
>  3 files changed, 11 insertions(+)
>=20
> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> index faa02d6710..fea70df45e 100644
> --- a/hw/ppc/ppc.c
> +++ b/hw/ppc/ppc.c
> @@ -1083,6 +1083,13 @@ clk_setup_cb cpu_ppc_tb_init (CPUPPCState *env, ui=
nt32_t freq)
>      return &cpu_ppc_set_tb_clk;
>  }
> =20
> +void cpu_ppc_tb_free(CPUPPCState *env)
> +{
> +    timer_free(env->tb_env->decr_timer);
> +    timer_free(env->tb_env->hdecr_timer);
> +    g_free(env->tb_env);
> +}
> +
>  /* cpu_ppc_hdecr_init may be used if the timer is not used by HDEC emula=
tion */
>  void cpu_ppc_hdecr_init(CPUPPCState *env)
>  {
> diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
> index ed84713960..8a4861f45a 100644
> --- a/hw/ppc/spapr_cpu_core.c
> +++ b/hw/ppc/spapr_cpu_core.c
> @@ -189,10 +189,13 @@ static const VMStateDescription vmstate_spapr_cpu_s=
tate =3D {
> =20
>  static void spapr_unrealize_vcpu(PowerPCCPU *cpu, SpaprCpuCore *sc)
>  {
> +    CPUPPCState *env =3D &cpu->env;
> +
>      if (!sc->pre_3_0_migration) {
>          vmstate_unregister(NULL, &vmstate_spapr_cpu_state, cpu->machine_=
data);
>      }
>      spapr_irq_cpu_intc_destroy(SPAPR_MACHINE(qdev_get_machine()), cpu);
> +    cpu_ppc_tb_free(env);
>      qdev_unrealize(DEVICE(cpu));
>  }
> =20
> diff --git a/include/hw/ppc/ppc.h b/include/hw/ppc/ppc.h
> index b0ba4bd6b9..364f165b4b 100644
> --- a/include/hw/ppc/ppc.h
> +++ b/include/hw/ppc/ppc.h
> @@ -54,6 +54,7 @@ struct ppc_tb_t {
> =20
>  uint64_t cpu_ppc_get_tb(ppc_tb_t *tb_env, uint64_t vmclk, int64_t tb_off=
set);
>  clk_setup_cb cpu_ppc_tb_init (CPUPPCState *env, uint32_t freq);
> +void cpu_ppc_tb_free(CPUPPCState *env);
>  void cpu_ppc_hdecr_init(CPUPPCState *env);
>  void cpu_ppc_hdecr_exit(CPUPPCState *env);
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--kVw1Dv0ro55gQ4MK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmJDqO8ACgkQgypY4gEw
YSII/xAA1aeZef1/xpUzf1qkF9vzy1q4YbJM7KD5E2EwcJBMmx8wUHywTI9+Lpb3
19QxF+wgdVrRPSJ6c2tNAe8icrMctxzPA7tpmgdVkC7hZIkn8qSRCI+fSVB3PJVB
9BaT9CDI20c5T6aTv80bJnwZtJzuvfx6Wi9YOyvLd+oKBOHxAkZBeB/aTR3ZaVUg
v6xIH07JKGf3mBW07dFWZa7Ytb+r++sAaSrv7PT+XpYLjSgMOhD13jVVZo0wqbB9
mldqd0Sxkg0iLEeOZicWrLeIb3ZScozfeVMu7FG4vXXbsDsGxt4CBKFrL1RspYfd
+v4U9bboMybnkYRoz1fpk2gnjQe0guQK2FsC2Fv66euUF0VQWYd3l4cIkseHyEpo
JwU8wYpumdtfpLelVR6k27b5RO70W/6YQ3wCA7MUAUL83Y8wc28xQung7tOm8t25
0RDJOHgs3Ty+gyGbPZ2bBcPyRV4CvKZZ6yNUcPGhwWSkqmwTLdvfxXv4igLGO+c6
ls7Mu7G4aplLxjMDT6SLljYqoKVScQtsyJhWJnRMBg2s7cwazsSnke3nSQcVz3SR
sy+TbgyE+nQ+jqrfhCGFW8uEd8SI7X2yp3R7//xZjpv0OBqJtF7froVhL0XC40E7
BhgI6M5k9whbtm1BlBhKLc2PvqoLOGM64l8AhDNicDY0YR6i55Q=
=AUAX
-----END PGP SIGNATURE-----

--kVw1Dv0ro55gQ4MK--

