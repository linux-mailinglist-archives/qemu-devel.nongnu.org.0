Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7CA3D515B
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 04:44:44 +0200 (CEST)
Received: from localhost ([::1]:40346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7qbi-0005k9-IK
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 22:44:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m7qYu-0004qc-Sk; Sun, 25 Jul 2021 22:41:50 -0400
Received: from ozlabs.org ([203.11.71.1]:43743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m7qYq-0008Nj-2w; Sun, 25 Jul 2021 22:41:48 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GY41s2v3yz9sj5; Mon, 26 Jul 2021 12:41:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1627267297;
 bh=6EU53h4n9HvBM73LYK6417tXHCcQ3NW43E4VOp5lzqg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TO+g4fv+HN+sGCSsoApSZPk80xxyEAZXqa54tZ5Z9txTA64MezQSzjHEercnKsfsA
 kH/tZ4hNUI7ByJMYBDH2z2r9cgve/3cI+FG/AHkEt435wV6XK2DdvKkotR4/RLpfyI
 bfCQ2VQRv4WQaeHJRjE0bZeVpeFS5pqowYseTtY0=
Date: Mon, 26 Jul 2021 12:25:20 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH] kvm: ppc: Print meaningful message on KVM_CREATE_VM
 failure
Message-ID: <YP4dEI+nJkMgbHmu@yekko>
References: <20210722141340.2367905-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fLLGxPg1bMWTq2lF"
Content-Disposition: inline
In-Reply-To: <20210722141340.2367905-1-farosas@linux.ibm.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--fLLGxPg1bMWTq2lF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 22, 2021 at 11:13:40AM -0300, Fabiano Rosas wrote:
> PowerPC has two KVM types (HV, PR) that translate into three kernel
> modules:
>=20
> kvm.ko - common kvm code
> kvm_hv.ko - kvm running with MSR_HV=3D1 or MSR_HV|PR=3D0 in a nested gues=
t.
> kvm_pr.ko - kvm running in usermode MSR_PR=3D1.
>=20
> Since the two KVM types can both be running at the same time, this
> creates a situation in which it is possible for one or both of the
> modules to fail to initialize, leaving the generic one behind. This
> leads QEMU to think it can create a guest, but KVM will fail when
> calling the type-specific code:
>=20
>  ioctl(KVM_CREATE_VM) failed: 22 Invalid argument
>  qemu-kvm: failed to initialize KVM: Invalid argument
>=20
> Ideally this would be solved kernel-side, but it might be a while
> until we can get rid of one of the modules. So in the meantime this
> patch tries to make this less confusing for the end user by adding a
> more elucidative message:
>=20
>  ioctl(KVM_CREATE_VM) failed: 22 Invalid argument
>  PPC KVM module is not loaded. Try 'modprobe kvm_hv'.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Applied to ppc-for-6.1, thanks.

> ---
>  accel/kvm/kvm-all.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 3bd17135ce..4d9a7c7bfc 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -2397,6 +2397,12 @@ static int kvm_init(MachineState *ms)
>                      "- for kernels supporting the vm.allocate_pgste sysc=
tl, "
>                      "whether it is enabled\n");
>          }
> +#elif TARGET_PPC
> +        if (ret =3D=3D -EINVAL) {
> +            fprintf(stderr,
> +                    "PPC KVM module is not loaded. Try modprobe kvm_%s.\=
n",
> +                    (type =3D=3D 2) ? "pr" : "hv");
> +        }
>  #endif
>          goto err;
>      }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--fLLGxPg1bMWTq2lF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmD+HQ8ACgkQbDjKyiDZ
s5J6tQ/8DnKKXAJWuY/T5+SzybTjSgTjn5282M9ryZNOJbJDMbqizsCr7fvfBx7z
fIj67G/K5xNn7sSLFqMFuO1RJYe/vHhB3VFNbUhjhR5VzdEkAvrTnKYMeD4udNXl
xkvClyoyj9vPRe4lTaFFYWvglaFgZMEs39MRGgFeS0URunTuTO6VFebIyy49ubiq
AW+jSzFkGCdHdqRdocV9DUsxS10lqkMcF+dWaTnRDcV3WAIyDXwYv6SLWfTjRURe
QJa8wDGqXL05oLY12DLLFkDCblsCmDowAF8DRs+PKt80pETbiYGzc20/FMPSbMOa
RO3C90ijUID41pLSXuipUCxP0pbKN2lip2E4Ig6y5U0Bw96j8aYF873HsH2MVS5V
1iYLMVp7tf+9iHx2abAlMQE8zf1m7V2C+pMdhkDZ8GbVmx8/22lrQYWo4f2tSgXh
3mAD3dp6xoTNreKnGO1JMq5GKvJbsM9GxOuHBKDlZZWzTkJVC9zsTDFxne30E+o2
o7KHqnzlFJLmky3HI3nFUnRJreLKXKek17eriGVPHYWSG/Gh45miAVqTg1Rrh2bS
LWS7Yn6kNST0zHEBeHeib9905Ovybbqtecq5/lEBL1jJTs8psaKmerhzgrteTmvX
xAMxtRFuXsuzuT4c5YseWK90l0WiCYEagni9bEIr0Y7Pt9vBe4E=
=k6Mt
-----END PGP SIGNATURE-----

--fLLGxPg1bMWTq2lF--

