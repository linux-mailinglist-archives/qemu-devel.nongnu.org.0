Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F6D268538
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 08:58:42 +0200 (CEST)
Received: from localhost ([::1]:51182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHiRl-0007WI-By
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 02:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kHiPr-0006r8-2h; Mon, 14 Sep 2020 02:56:44 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:51021 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kHiPo-0007vh-Ha; Mon, 14 Sep 2020 02:56:42 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4BqcbM3TsFz9sT6; Mon, 14 Sep 2020 16:56:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1600066591;
 bh=9GWFY9QXUEhT7sG0e6nX0zqlqxk4pJ/7wpvmzuz7e0Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MWVWKVt12wJ/085W7H8Uj/UoUepOW4drR9+oyr2IlGO0xzx/F6XYd8qqGzXBEV+ps
 ZGqiFdo9z8gZJiLzNlauJr2kIWLoc/ACuFMjTIvnZotphzoV9iFn/MgECEW/K4JGw1
 3eKHCcDXXVpTo7fbueAFBTU/zMOpyiuiafWA9I4E=
Date: Mon, 14 Sep 2020 16:21:19 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH] spapr: Handle HPT allocation failure in nested guest
Message-ID: <20200914062119.GB5306@yekko.fritz.box>
References: <20200911043123.204162-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/NkBOFFp2J2Af1nK"
Content-Disposition: inline
In-Reply-To: <20200911043123.204162-1-farosas@linux.ibm.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 02:56:31
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--/NkBOFFp2J2Af1nK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2020 at 01:31:23AM -0300, Fabiano Rosas wrote:
> The nested KVM code does not yet support HPT guests. Calling the
> KVM_CAP_PPC_ALLOC_HTAB ioctl currently leads to KVM setting the guest
> as HPT and erroneously executing code in L1 that should only run in
> hypervisor mode, leading to an exception in the L1 vcpu thread when it
> enters the nested guest.
>=20
> This can be reproduced with -machine max-cpu-compat=3Dpower8 in the L2
> guest command line.
>=20
> The KVM code has since been modified to fail the ioctl when running in
> a nested environment so QEMU needs to be able to handle that. This
> patch provides an error message informing the user about the lack of
> support for HPT in nested guests.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Applied to ppc-for-5.2.

> ---
>  hw/ppc/spapr.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 9bce1892b5..ea2c755310 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1483,6 +1483,12 @@ void spapr_reallocate_hpt(SpaprMachineState *spapr=
, int shift,
>      spapr_free_hpt(spapr);
> =20
>      rc =3D kvmppc_reset_htab(shift);
> +
> +    if (rc =3D=3D -EOPNOTSUPP) {
> +        error_setg(errp, "HPT not supported in nested guests");
> +        return;
> +    }
> +
>      if (rc < 0) {
>          /* kernel-side HPT needed, but couldn't allocate one */
>          error_setg_errno(errp, errno,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/NkBOFFp2J2Af1nK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl9fC98ACgkQbDjKyiDZ
s5IVchAAxaFZpuEkonxj1EkD4Zh8DAA1p22ZGeFIyY92nGUZVq8h+0dBjq2z+su3
b2XsvBCcsDK5OoMJxryyJFPPxVn7qkYKF8gVHTefWBFnU37ZMiOiMcp5axJX4W/7
Jg7wG/KUuvSMc7/gFd+W+Xg8oXCsfF6jzZwxpmT9Nk5ORzihgXMhLtK3cjlMPFp2
k1EH1D5lTe8XF4SMZ4ZGfeiUgKZCjDqe+vRhTbZWEWGQuDrQrZpilckQUaV1slk5
FmeLr+dCsnzOprE+ZBFKOQBZo14sYX0Hv5Sq7bks2MxMZwHo9co4FSALYj0qP3bd
aDEqsuQkO+ixHNQpFQ/xAVK06jVhHncGB59lQtidu1JfX3WKMhuYqazlESJ8sd4A
2BGrameNrmriQjjcvwJdCYDGgZ3AA9UUFRBOuKGLI7dVLL7ereAnqlJIoUG0jK+J
9OVrgGazY72WEJEmihBLAB+ehbYckzeBJIRJjzAuI7Us1J7ho8f+TnSVlqewzJie
jSiarMCtkv41gq8iOZk4OJeUlMbDH9t7t/G9leA4fRAlEYZouXl6n/Q2mpYcU8W6
RNkVhzlg9+sLVnZXw9K0dWwUK1q/7L/MAyFlRVihHgfIlTE0c8FsWTmTgoxETOm0
7mAKNNHwXMcssvnyu0rzhk1tCMjsdpd5AgDAnz2PfnvBoq3NsTU=
=Mor0
-----END PGP SIGNATURE-----

--/NkBOFFp2J2Af1nK--

