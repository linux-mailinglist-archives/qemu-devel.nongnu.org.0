Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE392CFAED
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Dec 2020 11:02:54 +0100 (CET)
Received: from localhost ([::1]:47474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klUOz-0000vF-Ai
	for lists+qemu-devel@lfdr.de; Sat, 05 Dec 2020 05:02:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1klULJ-0007Kt-Rt; Sat, 05 Dec 2020 04:59:10 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:34433 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1klULG-0008AU-Kq; Sat, 05 Dec 2020 04:59:05 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Cp4ls3ZvCz9sWP; Sat,  5 Dec 2020 20:58:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607162329;
 bh=RyCVT6M+FgHjahCyt9/T9kVskYpKffc32MYnHP6H7MY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TZGHhqL1EbGSZWFKLy4UMxE+aFNIIFA6xzv9pIQzqSvqvu0TFNJ6lu6mro5L0esoY
 3wKVkKdTF1x0sdOLjdMKJdtvT3rFqT80Zs+P/TivU0sr0iy6IT1B3m/kahLqffSARa
 vZWTHfBQWo1mUrS9BqTZ7eOi5ZqoEgOopJOuyeOw=
Date: Sat, 5 Dec 2020 20:53:58 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Gan Qixin <ganqixin@huawei.com>
Subject: Re: [PATCH] ppc/e500: Free irqs array to avoid memleak
Message-ID: <20201205095358.GA4783@yekko.fritz.box>
References: <20201204075822.359832-1-ganqixin@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Content-Disposition: inline
In-Reply-To: <20201204075822.359832-1-ganqixin@huawei.com>
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
Cc: qemu-trivial@nongnu.org, kuhn.chenqun@huawei.com,
 Euler Robot <euler.robot@huawei.com>, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 04, 2020 at 03:58:22PM +0800, Gan Qixin wrote:
> When running qom-test, a memory leak occurred in the ppce500_init functio=
n,
> this patch free irqs array to fix it.
>=20
> ASAN shows memory leak stack:
>=20
> Direct leak of 40 byte(s) in 1 object(s) allocated from:
>     #0 0xfffc5ceee1f0 in __interceptor_calloc (/lib64/libasan.so.5+0xee1f=
0)
>     #1 0xfffc5c806800 in g_malloc0 (/lib64/libglib-2.0.so.0+0x56800)
>     #2 0xaaacf9999244 in ppce500_init qemu/hw/ppc/e500.c:859
>     #3 0xaaacf97434e8 in machine_run_board_init qemu/hw/core/machine.c:11=
34
>     #4 0xaaacf9c9475c in qemu_init qemu/softmmu/vl.c:4369
>     #5 0xaaacf94785a0 in main qemu/softmmu/main.c:49
>=20
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>

Applied to ppc-for-6.0, thanks.

> ---
> Cc: David Gibson <david@gibson.dropbear.id.au>
> ---
>  hw/ppc/e500.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index ae39b9358e..74f33af88e 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -925,6 +925,7 @@ void ppce500_init(MachineState *machine)
>                                  ccsr_addr_space);
> =20
>      mpicdev =3D ppce500_init_mpic(pms, ccsr_addr_space, irqs);
> +    g_free(irqs);
> =20
>      /* Serial */
>      if (serial_hd(0)) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/LWLQACgkQbDjKyiDZ
s5Kv1g//WNb3usz3sPFLXDnWQOcrx53DPuz8cCSOfaqYsc0JsPGIX3ejU3W+7O4G
VeAcFTnKIweHjKed3QKjl8OXCCnJguvYxkRfMTNr5qUwf5R7psaJHAJOcWL8AE14
bgds9EaFMHqLD5LK3KrfRsc30sLiOIiXA/XtqbzK3EJnSFBLn09icvReoQl79SW1
KUndlXfvQ3kw8t+fV5/1x98/Cnaui4iTdKUzGeonsCAw/1njCS/CpD/+5z7hPdFZ
0t7ux1haLlpOs1EZluoYOkUzgAGLwV0cItHz7AfDx0k41/aSXRWDo/YeT0ZvSv1y
jyqPc/uzerxxYA/B3hvmtfW3/uDgh5pL3S9omixCAfyoRdIPtrRG6QN64GfGoycV
lM9iqBkxKuTjEUgAaeMIpu7J11lfYmWTclwPwscv0tOUE+c93XYyzEtJ1s6QP4BY
rPjKTQ9GbqAlakMVvSf43WmbfFbXhjtWblaR17jNR1dMAYlSQoRkRehbYbcJMISI
XenAOR/Rt4iMQRgAP+CdhI3s7CwsvB9c1A8wLwmqNdJ8TpEf8JCvYW1WCJnEebiZ
cqT2erHTe5PA9cuty1R4bw6H1RQLTUOZmR9YUW8UtEQbtVYKlUB9NOpcF7BTHT1G
sMaxrtBTuCbkcO2wH5v+s29Uyfct3mlRsJk33V+NE2gWvfPdYg4=
=P4rF
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--

