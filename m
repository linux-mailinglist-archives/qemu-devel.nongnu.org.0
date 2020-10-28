Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB80829CE50
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 07:06:18 +0100 (CET)
Received: from localhost ([::1]:53780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXebC-0007fp-08
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 02:06:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kXeZW-0006gB-9Z; Wed, 28 Oct 2020 02:04:34 -0400
Received: from ozlabs.org ([203.11.71.1]:42677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kXeZT-0003ex-Gn; Wed, 28 Oct 2020 02:04:33 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CLdLx0L46z9sWT; Wed, 28 Oct 2020 17:04:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1603865065;
 bh=o6ssx+HDJOIFY/bFyaGdwlM5ILRKuFCzafX3VdxdUjo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YlRqEMbcepBykE3FeFQ+erKASmWCZy4UBLdP6DZYi6kvag7rzpP/gjY77qM3BfeM6
 ju7qMmNgNPrVl4yHqY3gn2Er3SUoTABs1KOJhhaycqP4C/EzYQLyOC5D6pquU4UpBu
 4ZujXzPKbp6qpmZkrG2UCfqFfiHsv+sjPXoCN9XQ=
Date: Wed, 28 Oct 2020 16:53:12 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Chen Qun <kuhn.chenqun@huawei.com>
Subject: Re: [PATCH] target/ppc/excp_helper: Add a fallthrough for fix
 compiler warning
Message-ID: <20201028055312.GE5604@yekko.fritz.box>
References: <20201028055107.2170401-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ytoMbUMiTKPMT3hY"
Content-Disposition: inline
In-Reply-To: <20201028055107.2170401-1-kuhn.chenqun@huawei.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 02:04:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: zhang.zhanghailiang@huawei.com, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, clg@kaod.org, ganqixin@huawei.com,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ytoMbUMiTKPMT3hY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2020 at 01:51:07PM +0800, Chen Qun wrote:
> When using -Wimplicit-fallthrough in our CFLAGS, the compiler showed warn=
ing:
> ../target/ppc/excp_helper.c: In function =E2=80=98powerpc_excp=E2=80=99:
> ../target/ppc/excp_helper.c:529:13: warning: this statement may fall thro=
ugh [-Wimplicit-fallthrough=3D]
>   529 |         msr |=3D env->error_code;
>       |         ~~~~^~~~~~~~~~~~~~~~~~
> ../target/ppc/excp_helper.c:530:5: note: here
>   530 |     case POWERPC_EXCP_HDECR:     /* Hypervisor decrementer except=
ion         */
>       |     ^~~~
>=20
> Add the corresponding "fall through" comment to fix it.
>=20
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>

Applied to ppc-for-5.2, thanks.

> ---
>  target/ppc/excp_helper.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index a988ba15f4..c639516399 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -527,6 +527,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int =
excp_model, int excp)
>          break;
>      case POWERPC_EXCP_HISI:      /* Hypervisor instruction storage excep=
tion */
>          msr |=3D env->error_code;
> +        /* fall through */
>      case POWERPC_EXCP_HDECR:     /* Hypervisor decrementer exception    =
     */
>      case POWERPC_EXCP_HDSI:      /* Hypervisor data storage exception   =
     */
>      case POWERPC_EXCP_HDSEG:     /* Hypervisor data segment exception   =
     */

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ytoMbUMiTKPMT3hY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+ZB0YACgkQbDjKyiDZ
s5JS8xAAs89OlxqCVAFnkQfdW6FQpaMwUNB75wKpszG6syemQlY7fxfQC2UTeu/S
UAHPiCKN/zzJTQzwN6eaEwCWX/3EN84SNTIN2/GC1rTBc/N4NBM31I0pLe8hvaNa
f40SYhomBpHZclpf+9q3JNfhErDwsNnXO+gTi/KpcV+lNaQEYmaY+ZaAA1bGYHYl
At/V6Ku4Sji1XhiCD4zez3mSnprdvMlceIENGrbrQ11IRJvW4ktaOrP2aVFEMLA/
7cyXL/7sKnjN+sSMFJYy99AcW2MqU5QCaV8HHJeVly3l//O+EIr6s3SReBBBJ1fu
AUaaHXRYNU18Om9VpmYj1KCnlai84PIflitNT75l6IuKg9yVfovjLMi5KWKUO90H
Tjm9WwhqlM/wSia4Zuskhp4svMwlBvuXe3yDwbRXeUkd2TcmvIfNM15vippGLUqt
aOEwF9vMBwakdhAHFwtbA8nUxsFoCsXbt0tWHknKIN45xynw9Dzg3Yd9XdhK8DDe
0tgCV6FoLwclw8QvaDyZCk2jXeF1ZLDY45gBaZqz2HgHnCjXwgyEsetU9gR4UNZB
a6rEtk9ktd7BXFvqlEkzh0/wpTFsDp3EWvtTZZNY/WvfhFuHX5XJfQG3KeN1mRZp
7wmFsZB7XuRjTAkcH3DB3DgLq/pKdaydGICMqklmQ4Ows77FTxk=
=kEjJ
-----END PGP SIGNATURE-----

--ytoMbUMiTKPMT3hY--

