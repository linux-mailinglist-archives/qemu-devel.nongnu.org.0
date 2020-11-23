Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AED42BFFFA
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 07:22:38 +0100 (CET)
Received: from localhost ([::1]:50242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh5FF-000688-5g
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 01:22:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh52J-0001KW-T0; Mon, 23 Nov 2020 01:09:17 -0500
Received: from ozlabs.org ([203.11.71.1]:40973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kh52G-0006dQ-SU; Mon, 23 Nov 2020 01:09:15 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CfcDH2M2fz9sVW; Mon, 23 Nov 2020 17:09:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1606111743;
 bh=tXatipDtJl/t17nuEywKFNqddeuDYhrJ8q1ElSiYFCs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VwtIde+tR3uwHLxrIOWbbSThUOjxqrKUsHE3z5qRQvtA170vDSHPutKDfNvvO9q4F
 mhNjbCJ1vIPCrXnZ5J41vGA4Xxg7gemtvVkrpOHeFI3LarCJm9l1PHoVYugo33AOwL
 6hf0fnDFd/cVPteiIkOchnkU7pakqKxkSIqyAf84=
Date: Mon, 23 Nov 2020 16:46:33 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Chen Qun <kuhn.chenqun@huawei.com>
Subject: Re: [PATCH v3 6/7] ppc: Add a missing break for PPC6xx_INPUT_TBEN
Message-ID: <20201123054633.GT521467@yekko.fritz.box>
References: <20201116024810.2415819-1-kuhn.chenqun@huawei.com>
 <20201116024810.2415819-7-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qUsYCxAE223BCwdt"
Content-Disposition: inline
In-Reply-To: <20201116024810.2415819-7-kuhn.chenqun@huawei.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: Thomas Huth <thuth@redhat.com>, zhang.zhanghailiang@huawei.com,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org, ganqixin@huawei.com,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--qUsYCxAE223BCwdt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2020 at 10:48:09AM +0800, Chen Qun wrote:
> When using -Wimplicit-fallthrough in our CFLAGS, the compiler showed warn=
ing:
> hw/ppc/ppc.c: In function =E2=80=98ppc6xx_set_irq=E2=80=99:
> hw/ppc/ppc.c:118:16: warning: this statement may fall through [-Wimplicit=
-fallthrough=3D]
>   118 |             if (level) {
>       |                ^
> hw/ppc/ppc.c:123:9: note: here
>   123 |         case PPC6xx_INPUT_INT:
>       |         ^~~~
>=20
> According to the discussion, a break statement needs to be added here.
>=20
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Acked-by: David Gibson <david@gibson.dropbear.id.au>

Applied to ppc-for-6.0, thanks.

> ---
> v1->v2: Add a "break" statement here instead of /* fall through */ commen=
ts
> (Base on Thomas's and David review).
>=20
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> ---
>  hw/ppc/ppc.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> index 4a11fb1640..1b98272076 100644
> --- a/hw/ppc/ppc.c
> +++ b/hw/ppc/ppc.c
> @@ -120,6 +120,7 @@ static void ppc6xx_set_irq(void *opaque, int pin, int=
 level)
>              } else {
>                  cpu_ppc_tb_stop(env);
>              }
> +            break;
>          case PPC6xx_INPUT_INT:
>              /* Level sensitive - active high */
>              LOG_IRQ("%s: set the external IRQ state to %d\n",

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--qUsYCxAE223BCwdt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+7TLkACgkQbDjKyiDZ
s5JIaxAAu58D+vUeKLPnOb0GWW8m+O2l9o2QvTzU/ROjCHXh3G18gyN6MpCfqCWR
4jWuRnMGryon4DgtrjbH7XmBZSuBoGVUr/oP5MN5Z1eL3zOI961F+M1Hw4Pqs6KX
XoeI8Lh9dLXVRNcAmhYAIX0+Y+YJJOIlqoKhrKlfxaFu5ULe/B7D2SHrfUhyFLTI
AWTiGPyztB0wjp0mMR0O5OzffTcCClDhWaD/hQAfk0DpVQWxQgkPnYbZtARYF5K4
/rpovZ6bxrmUBRGkG4o6ngpuc9xXVl9xyCPvPdCByR55Ey3REqLCRiUC62SscvI5
JReBzoa/AgfkJ8ZIGhgL+QdskmqIjV0BbmhaIYgI5jvXVnVQjIM4UHNhWk9szZNF
2jgqwMsSi6sRpmpQi8VSe2vRHzcloRmvnRoDw1n1tLFiOCx5Can3qrd8JW7eHbTn
tz76ONN9ShzEzpp9u331DOQZhbup/MVYQUsQ/4pyVMVda1gMg3zZPmYbxawDmhaa
oAdElmo99oXXT2eB01ncqIXXvWJ8/aYu+u6M4Ekp/NRvJebdlyUBIkyrsDZWLyOI
XkJfMVzWgBA5To0b90dsGCh71t7Iphin/MqhzdcWxtZMbf/O1nrE6SpkJHWBqGiX
x0vaWcTjSyUjxr26EDa6QCdcg5IXm83p8uL6Fd4HpFwOF0yTfMs=
=RvBJ
-----END PGP SIGNATURE-----

--qUsYCxAE223BCwdt--

