Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F058C3E522E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 06:28:44 +0200 (CEST)
Received: from localhost ([::1]:35390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDJNb-0007tq-Rb
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 00:28:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDJEJ-0000gz-0q; Tue, 10 Aug 2021 00:19:07 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:42871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDJEH-0002XF-2v; Tue, 10 Aug 2021 00:19:06 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GkKSX467Tz9tT8; Tue, 10 Aug 2021 14:18:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628569100;
 bh=XPf3jT3M5KV7BuNFWxEZE0sSaxCU2nBJ+GIFoLHOstg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ta0E4pdDYAdz8ih4gn+5TmV7S5FrXm+yxQzNqNvyIb6VRST7LPyp90uPy1NTa5NBm
 AtgzLlk/UfxWiZHkerEQze3SXdaKvCqsy52jB51WYyaNqeHsGfCxaKS4zTm60Peq4v
 HKjn8koLxw4iqvXqvBZO5J7B32EZOXw8vi3ynXeY=
Date: Tue, 10 Aug 2021 14:13:16 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 16/19] target/ppc/pmu_book3s_helper: adding 0xFA event
Message-ID: <YRH83FNxCgPnOr78@yekko>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-17-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Yg4z4DGZZTqNDrb1"
Content-Disposition: inline
In-Reply-To: <20210809131057.1694145-17-danielhb413@gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: gustavo.romero@linaro.org, clg@kaod.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Yg4z4DGZZTqNDrb1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 09, 2021 at 10:10:54AM -0300, Daniel Henrique Barboza wrote:
> The PowerISA 3.1 defines the 0xFA event as instructions completed when
> the thread's CTRL register is set. Some EBB powerpc kernel tests use
> this event to exercise both the PMU and the EBB support.

Couldn't you implement this more accurately by snapshotting the count
at each CTRL write, and either adding the delta to the PMC or not
depending on the previous CTRL value?

> We don't have a way at this moment to tell whether an instruction was
> completed under those conditions. What we can do is to make it
> equivalent to the existing PM_INST_COMPL event that counts all
> instructions completed. For our current purposes with the PMU support
> this is enough.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  target/ppc/pmu_book3s_helper.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book3s_helpe=
r.c
> index c5c5ab38c9..388263688b 100644
> --- a/target/ppc/pmu_book3s_helper.c
> +++ b/target/ppc/pmu_book3s_helper.c
> @@ -52,6 +52,20 @@ static uint8_t get_PMC_event(CPUPPCState *env, int spr=
n)
>          break;
>      case SPR_POWER_PMC4:
>          event =3D MMCR1_PMC4SEL & env->spr[SPR_POWER_MMCR1];
> +
> +        /*
> +         * Event 0xFA for PMC4SEL is described as follows in
> +         * PowerISA v3.1:
> +         *
> +         * "The thread has completed an instruction when the RUN bit of
> +         * the thread=E2=80=99s CTRL register contained 1"
> +         *
> +         * Our closest equivalent for this event at this moment is plain
> +         * INST_CMPL (event 0x2)
> +         */
> +        if (event =3D=3D 0xFA) {
> +            event =3D 0x2;
> +        }
>          break;
>      case SPR_POWER_PMC5:
>          event =3D 0x2;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Yg4z4DGZZTqNDrb1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmER/NwACgkQbDjKyiDZ
s5IcyA/+KlhEP+3sYmJD9J8GIb8Q7qChqvBPgEaeydQySu8RvDC7c27UqPqzvz9w
M8b4k0jPkTvOnqK0wsFjVjtaqoHIWtRUkOvoJv81TwWsgtx0AABsynBI24sebjUR
A1s8j+84b9jSo+THak2jIhIEMK8VB/jnMQo/wgH8u43uyJdIfHzSb/3mZmxb02ol
JRYsLSP8aGR2mQd8J8SiE2CFQ07GfMkOeLSCEHx+3qGkmt1FGj9YldQdqvzSsboD
ULxhEPfEcdGnZrebIcDPurfqVnzF/2KIJ2ctbUcQho4WGK/GuVzGKTJZAwVmhPT8
CVo87CFIqRvHAlI4evzw8HbS3c8NYsov2IshLDrWRr+zajQ/YNO2DoW0JbMisujT
ng7KEbtRf8K3W9GGDPIujOcSruuZiWD9kT4zCW54dpG0QMLoWqht0ywlGCQ1JWMg
fCNSsK7/3ZBz+mWl/BbfV7jKsOdYpqZLJ2S/N4zMTlKd4tY/fek/Sg8G/qPyvZTF
F0RtOfi4nKVDpJc+bmsBa8U4CzPyFGpPO+m/j3DvD4u1t+9baSLj/Dcd00hCvDLa
3v7n/vtgtmIXLhIB9zaoydcpZX4mEntmCULBGZthROgeXnJC+Av1Tev9Ty+uYfvK
okFC8SRlvfstAaE5DGJvZXoZ+z05/uYXJfJrc5id1jviM91NcFU=
=qZzX
-----END PGP SIGNATURE-----

--Yg4z4DGZZTqNDrb1--

