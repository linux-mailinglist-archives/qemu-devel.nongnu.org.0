Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2452FC5D9
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 01:33:13 +0100 (CET)
Received: from localhost ([::1]:45644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l21Qu-0006Rp-8x
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 19:33:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l21PJ-0005sG-Tk; Tue, 19 Jan 2021 19:31:34 -0500
Received: from ozlabs.org ([203.11.71.1]:59007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l21PG-0004MC-V2; Tue, 19 Jan 2021 19:31:33 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DL5zw5q9nz9sVS; Wed, 20 Jan 2021 11:31:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1611102684;
 bh=KdsZ6C7Yf/WUHXzsStWPdHoUj9rd7KNDbbB5344xKLk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=if8AkSkqxccd0A98Bl2LA/6rW0+wTyV2eBzSVafJJnZJRLFua6e/+K6SHWsVsqHgR
 4pR9FfeOEuSOUHVultNKu/Ht/TAgXlRrRNtnTvMLpHTMIbwL2e71/8wm/6zINfSL+0
 vuJuEY05rEJKIzJKfgDZlbUO3ddQs2HqifkZYRv4=
Date: Wed, 20 Jan 2021 11:24:45 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 1/1] spapr_caps.c: disable KVM specific caps when running
 with TCG
Message-ID: <20210120002445.GA5174@yekko.fritz.box>
References: <20210119205824.2222801-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Content-Disposition: inline
In-Reply-To: <20210119205824.2222801-1-danielhb413@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 19, 2021 at 05:58:24PM -0300, Daniel Henrique Barboza wrote:
> Commit 006e9d361869 added warning messages for cap-cfpc, cap-ibs and
> cap-sbbc when enabled under TCG. Commit 8ff43ee404d3 did the same thing
> when introducing cap-ccf-assist.
>=20
> These warning messages, although benign to the machine launch, can make
> users a bit confused. E.g:
>=20
> $ sudo ./ppc64-softmmu/qemu-system-ppc64
> qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-cf=
pc=3Dworkaround
> qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-sb=
bc=3Dworkaround
> qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-ib=
s=3Dworkaround
> qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-cc=
f-assist=3Don
>=20
> We're complaining about "TCG doesn't support requested feature" when the
> user didn't request any of those caps in the command line.
>=20
> Check if we're running with TCG and change the defaults in spapr_caps_ini=
t().
> Note that this change doesn't impact backward compatibility or migration
> to older QEMU versions because we never activated these caps with TCG
> in the first place.

Nack.  Changing those capabilities changes guest visible properties of
the guest environment.  Silently altering guest visible
characteristics based on whether or not we're running with KVM is not
acceptable (we did it in the past and it caused a lot of grief).

>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/ppc/spapr_caps.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
> index 9341e9782a..53eea2b11e 100644
> --- a/hw/ppc/spapr_caps.c
> +++ b/hw/ppc/spapr_caps.c
> @@ -781,6 +781,21 @@ void spapr_caps_init(SpaprMachineState *spapr)
>      /* Compute the actual set of caps we should run with */
>      default_caps =3D default_caps_with_cpu(spapr, MACHINE(spapr)->cpu_ty=
pe);
> =20
> +   /*
> +    * These are KVM specific caps that TCG doesn't support, but will
> +    * throw an warning if enabled by default (see 006e9d361869 and
> +    * 8ff43ee404d3). This behavior can make the user wonder why a warning
> +    * is being shown for caps that the user didn't enable in the
> +    * command line.
> +    *
> +    * Disable them for TCG. */
> +    if (tcg_enabled()) {
> +        default_caps.caps[SPAPR_CAP_CFPC] =3D SPAPR_CAP_BROKEN;
> +        default_caps.caps[SPAPR_CAP_SBBC] =3D SPAPR_CAP_BROKEN;
> +        default_caps.caps[SPAPR_CAP_IBS] =3D SPAPR_CAP_BROKEN;
> +        default_caps.caps[SPAPR_CAP_CCF_ASSIST] =3D SPAPR_CAP_BROKEN;
> +    }
> +
>      for (i =3D 0; i < SPAPR_CAP_NUM; i++) {
>          /* Store the defaults */
>          spapr->def.caps[i] =3D default_caps.caps[i];

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAHeEsACgkQbDjKyiDZ
s5K/jxAAwXcoQYTvkiXz06lfzsZSfxULvwjzKkpVPDW4xUV/YLoAH3Gj9jl/ijrS
d6cWrfjfOIH2SKxZBP+gTW5yE0VdyCb+63lLgT9W+L13mwrQZUfBHEGiStIMY3vy
8ceI5uwFelg1+IuHCwYN8b+3uAolGbPXoZp/TZz9s+LvdGaN2KJLFzAJYZrhvR3W
vZSSgGIPyGOWCrbxoAlLpj6NsrFGNGYSCa0DV8VcqLw6AO5oqWwZNUPEAkgDBw6A
W+W5gcg7OasFwLDxP/0XiLIwEMAKscGTP9s5mPgPRoFSf6kM8GawAi4TOKpG3gTd
zcEEyt9LGC43mJXLlg/clpuEb7BYFfJpgX2CsthxZh2FuLgLw6yRNThJ+7tOsAJL
2vx6M5nrxj1aGWvUtzNpWA7oznzoytmtiEIr1GjloBnYTLHn0ePo11SaU3Q85sty
eSuGhAe0TTuP/PNOjysyAwwz0L2VivWRZJ8nDuauuI3dlB46QR+JM4AayscY1n3N
0phBtnF4TqDSM/LeP8q2QDP1/g/9jJbFdqM6t/L0UKewDInudASYAV5TKZLAvvGc
AkWJbWPjfwz6VGRMS3tLeqFeXmUpKh9qw7TgpaVOQO8xuoTwn6tckd2G1kZQmUcw
Qef66HCks5eK8EHGu2+HRUZXOCGDIyAALtxz4kWLp6l+Fr4iius=
=++zy
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--

