Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C5D4644CA
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 03:12:40 +0100 (CET)
Received: from localhost ([::1]:38630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msF6t-0008AP-PW
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 21:12:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1msEw3-0000vR-Eo; Tue, 30 Nov 2021 21:01:27 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:58499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1msEvz-0004vs-CN; Tue, 30 Nov 2021 21:01:27 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4J3j4C1qknz4xZ3; Wed,  1 Dec 2021 13:01:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1638324075;
 bh=5dh+Mcb0BUIe/93aioIjGIUsOUirybq9M39sf+mqf9I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=phv7EKyAoZygnPUCQ7b6pf1x1+a6rEohLz60wMiHhdfImlDUytvFqRtumVb2dSyse
 RYqR7JxWvK9CXTlhuFPsgf+9pkjAqkMjFopVu74/e0EgkT0IoNQFOrqqbWcjtjbZmB
 ohhnkDT2sF6kinmJesthOZU7+3fc0w1pUMsC5sic=
Date: Wed, 1 Dec 2021 10:43:55 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 1/2] ppc/pnv.c: add a friendly warning when accel=kvm
 is used
Message-ID: <Yaa3OyEl1KGFVx66@yekko>
References: <20211130133153.444601-1-danielhb413@gmail.com>
 <20211130133153.444601-2-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pGvWRl93zyFtqYp+"
Content-Disposition: inline
In-Reply-To: <20211130133153.444601-2-danielhb413@gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


--pGvWRl93zyFtqYp+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 30, 2021 at 10:31:52AM -0300, Daniel Henrique Barboza wrote:
> If one tries to use -machine powernv9,accel=3Dkvm in a Power9 host, a
> cryptic error will be shown:
>=20
> qemu-system-ppc64: Register sync failed... If you're using kvm-hv.ko, onl=
y "-cpu host" is possible
> qemu-system-ppc64: kvm_init_vcpu: kvm_arch_init_vcpu failed (0): Invalid =
argument
>=20
> Appending '-cpu host' will throw another error:
>=20
> qemu-system-ppc64: invalid chip model 'host' for powernv9 machine
>=20
> The root cause is that in IBM PowerPC we have different specs for the bar=
e-metal
> and the guests. The bare-metal follows OPAL, the guests follow PAPR. The =
kernel
> KVM modules presented in the ppc kernels implements PAPR. This means that=
 we
> can't use KVM accel when using the powernv machine, which is the emulatio=
n of
> the bare-metal host.
>=20
> All that said, let's give a more informative error in this case.
>=20
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/pnv.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 71e45515f1..e5b87e8730 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -742,6 +742,11 @@ static void pnv_init(MachineState *machine)
>      DriveInfo *pnor =3D drive_get(IF_MTD, 0, 0);
>      DeviceState *dev;
> =20
> +    if (kvm_enabled()) {
> +        error_report("The powernv machine does not work with KVM acceler=
ation");
> +        exit(EXIT_FAILURE);
> +    }
> +
>      /* allocate RAM */
>      if (machine->ram_size < mc->default_ram_size) {
>          char *sz =3D size_to_str(mc->default_ram_size);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--pGvWRl93zyFtqYp+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGmtzsACgkQbDjKyiDZ
s5LtxQ//QcyaXGuZK69RcHDoLOHhOzR5TyEVnOYskO4Is1u0qkaNCCsWm9jBSVt4
kkyCcCj4Wjw8Pwesb7FaW+PCkqGdMuICZSvIaNRJuXN/2MDJwHPuhI1NGl7lHrNU
+7X3J39VEKfRJDD0N7Uo7FmSmpT/c5upzMhhvYnkJKJze12PkcrXNS0x8K9b+2TG
cCPfG8OaQIXgqMN+L2thS+Q2+In0FMTHI1n5P4/GqnAigX3ius1G1UWZ9Mx0nS01
Qbzt7Xc4vSd+T6bYJLUkKfy8GRJ+UM0+YQnkaJau6Uwn5Wt8M7V/s/yR3SYa1r2K
+La37PSTOxViruFFF6t8vr5aqJlpc3RtP715X6oFQAAgh22p0BGt4SxGhqr+cLxC
4Hj3uBXZxdNalC91e0OrSDSdACMTflHImRh2SnBaILDh71LcNTM3Of7aIoPKcXWg
KnILA4TuhoVLV9YfKiFqoWbGNH4H2nydK6TDdx7XQw5hjDtD6sVhGgi0ord+ncRx
bV2APaYtYqSRjaIFe4+RJq6/XfRlXRoRj03to77610YA1U+YRdZ2kUCEseU/213c
4wKgykShVQ9q/EFwJBYtYqFM2IH5B5mlL9ohC3gbLtWlykSUu+lGdn5tNFxMUQNF
q6LPqAovNg+lKP0/dnc/oEtCF4Sy+sXTy1aQeeFQ/suDkRvK4o4=
=sfVI
-----END PGP SIGNATURE-----

--pGvWRl93zyFtqYp+--

