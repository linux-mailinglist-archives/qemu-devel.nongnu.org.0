Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DDB363B19
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 07:44:52 +0200 (CEST)
Received: from localhost ([::1]:47596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYMiJ-0006YS-Be
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 01:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lYMgA-0004yr-Lz; Mon, 19 Apr 2021 01:42:38 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:51581 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lYMg6-0008Qo-PZ; Mon, 19 Apr 2021 01:42:36 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FNwgp4rKXz9vFg; Mon, 19 Apr 2021 15:42:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618810950;
 bh=K7twTZgO+ohJo9GynZ7M2RuP/wNjGosZ18XIOfwvxY0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gXZhjZiMcMLbr1B11Dey0tTa6V36rs3ajXSn69aB16vJ00sGFI8g9c5LT+IrFxaRr
 RFf0+mTM4iVx8cMFc2pFNegWHwquKEYx9/ptMFJjN5Z+S8U3H6ZgWxJUCKaVNhoI7V
 uGcPrUfvx0tVPJAmZIOyI0MGyW0wtONiVc7NjtiE=
Date: Mon, 19 Apr 2021 15:40:59 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 1/2] spapr.c: do not use MachineClass::max_cpus to limit
 CPUs
Message-ID: <YH0X69caAAJ05DNn@yekko.fritz.box>
References: <20210408204049.221802-1-danielhb413@gmail.com>
 <20210408204049.221802-2-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZAO0dTDnLhqntaFC"
Content-Disposition: inline
In-Reply-To: <20210408204049.221802-2-danielhb413@gmail.com>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ZAO0dTDnLhqntaFC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 08, 2021 at 05:40:48PM -0300, Daniel Henrique Barboza wrote:
> Up to this patch, 'max_cpus' value is hardcoded to 1024 (commit
> 6244bb7e5811). In theory this patch would simply bump it to 2048, since
> it's the default NR_CPUS kernel setting for ppc64 servers nowadays, but
> the whole mechanic of MachineClass:max_cpus is flawed for the pSeries
> machine. The two supported accelerators, KVM and TCG, can live without
> it.
>=20
> TCG guests don't have a theoretical limit. The user must be free to
> emulate as many CPUs as the hardware is capable of. And even if there
> were a limit, max_cpus is not the proper way to report it since it's a
> common value checked by SMP code in machine_smp_parse() for KVM as well.
>=20
> For KVM guests, the proper way to limit KVM CPUs is by host
> configuration via NR_CPUS, not a QEMU hardcoded value. There is no
> technical reason for a pSeries QEMU guest to forcefully stay below
> NR_CPUS.
>=20
> This hardcoded value also disregard hosts that might have a lower
> NR_CPUS limit, say 512. In this case, machine.c:machine_smp_parse() will
> allow a 1024 value to pass, but then kvm_init() will complain about it
> because it will exceed NR_CPUS:
>=20
> Number of SMP cpus requested (1024) exceeds the maximum cpus supported
> by KVM (512)
>=20
> A better 'max_cpus' value would consider host settings, but
> MachineClass::max_cpus is defined well before machine_init() and
> kvm_init(). We can't check for KVM limits because it's too soon, so we
> end up making a guess.

Well.. it's not so much that we're guessing KVM limits.  I think
max_cpus in the generic code is more about hard CPU limits which are
part of the machine architecture itself.  You're right that that
doesn't really make sense for the paravirtual PAPR machine though.

> This patch makes MachineClass:max_cpus settings innocuous by setting it
> to INT32_MAX. machine.c:machine_smp_parse() will not fail the
> verification based on max_cpus, letting kvm_init() do the checking with
> actual host settings. And TCG guests get to do whatever the hardware is
> capable of emulating.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Applied to ppc-for-6.1.

> ---
>  hw/ppc/spapr.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 73a06df3b1..d6a67da21f 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4482,7 +4482,16 @@ static void spapr_machine_class_init(ObjectClass *=
oc, void *data)
>      mc->init =3D spapr_machine_init;
>      mc->reset =3D spapr_machine_reset;
>      mc->block_default_type =3D IF_SCSI;
> -    mc->max_cpus =3D 1024;
> +
> +    /*
> +     * Setting max_cpus to INT32_MAX. Both KVM and TCG max_cpus values
> +     * should be limited by the host capability instead of hardcoded.
> +     * max_cpus for KVM guests will be checked in kvm_init(), and TCG
> +     * guests are welcome to have as many CPUs as the host are capable
> +     * of emulate.
> +     */
> +    mc->max_cpus =3D INT32_MAX;
> +
>      mc->no_parallel =3D 1;
>      mc->default_boot_order =3D "";
>      mc->default_ram_size =3D 512 * MiB;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ZAO0dTDnLhqntaFC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmB9F+oACgkQbDjKyiDZ
s5Lpxw/9FES9pueeqxsPSpY4zn23Tsb6quYycLvUTbdXKDthwYM4MH17FPDLuafC
tBKHmQ6bZHaW3bLh0D6zxC+8CryKG5qOqvIgY769WdKEVYwXZAFcYEiP7lBQ4Wuu
kBGvTKvr5aFBWHaqajf7FM4lIBaXyaJrNOerGSufbJ1JW72dcr/Z9elmCKQmzU3j
oet45rbLCHvCJnRCQhJQTEkX+w0TK0CZK3d9qvNfH5d3Aebg+a/ccQ7t1dzUvOlK
YtMjxD9SbadQhCbdmbeDb5dq0nFm1WGcVsoeHkIYQWRGRaXy8xiSxqm+xBsNIviT
tqzMFXStlwn4tQxuj7CyrJrZR/xJkU+LlbYQQBL8emrQ2Pj7WQcco0A7KQuU5IDj
5rYsM1qJVqTTSCLr7hSLRE2xje84Es5GSeFOFYWKBcR07bhacEiGWGU3y5TgcIDA
nruqdOFoTjVoXCYsF+jCXNpZNkrijk5amuTKolXbuOh18s/qtz+wTwrQaukTtj1D
liMQOXjWC1Nl8PE1RJW8PkvOJhLc7kff41Tq+paqyriPmSyd8WjGDvlJIcR93u9E
TgdEDZdXUsBZSNIQoDF0mF5n50Z3zy660uy3+5bk2LKP2peJt9aDS4001QFG298V
JNWW3ASrVqakLPJD8tyFpT1yncYAPpzq3xJ1UBcfY+M3yUrjTj4=
=XeNu
-----END PGP SIGNATURE-----

--ZAO0dTDnLhqntaFC--

