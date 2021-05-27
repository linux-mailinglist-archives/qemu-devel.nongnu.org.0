Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6579039249C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 03:54:23 +0200 (CEST)
Received: from localhost ([::1]:37912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm5E6-00024S-6D
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 21:54:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lm58U-00062c-IJ; Wed, 26 May 2021 21:48:34 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:46991 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lm58S-0001tE-H5; Wed, 26 May 2021 21:48:34 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fr9gz1xMRz9sWp; Thu, 27 May 2021 11:48:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622080095;
 bh=vedFwsPShwM6+1+cxCwo9Sg2+okG+WJDz3RlIdSohkc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J66TMlWtzLjoB+ZwbO/UjeLnQLtxxWocKFgaAYXr7fRPVowiUaawat4lEhy3E6v8z
 b8/CoH8n0KMWQwVJDo6siOqxE3z1amzuVILulkTuVywq2Jr0/Tw7dwwzO3eJ/truX2
 iwLaj6tqhlb6aQhKsOCuGCk7l9I7w9Feu8VBO39A=
Date: Thu, 27 May 2021 11:29:22 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v1 2/3] spapr: Set LPCR to current AIL mode when starting
 a new CPU
Message-ID: <YK718jkXZqbwBjcy@yekko>
References: <20210526091626.3388262-1-npiggin@gmail.com>
 <20210526091626.3388262-3-npiggin@gmail.com>
 <20210526180309.24b189c3@bahia.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YF+5zYCWwojyDmBD"
Content-Disposition: inline
In-Reply-To: <20210526180309.24b189c3@bahia.lan>
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
Cc: qemu-ppc@nongnu.org, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--YF+5zYCWwojyDmBD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 26, 2021 at 06:03:09PM +0200, Greg Kurz wrote:
> On Wed, 26 May 2021 19:16:25 +1000
> Nicholas Piggin <npiggin@gmail.com> wrote:
>=20
> > TCG does not keep track of AIL mode in a central place, it's based on
> > the current LPCR[AIL] bits. Synchronize the new CPU's LPCR to the
> > current LPCR in rtas_start_cpu(), similarly to the way the ILE bit is
> > synchronized.
> >=20
> > Open-code the ILE setting as well now that the caller's LPCR is
> > available directly, there is no need for the indirection.
> >=20
> > Without this, under both TCG and KVM, adding a POWER8/9/10 class CPU
> > with a new core ID after a modern Linux has booted results in the new
> > CPU's LPCR missing the LPCR[AIL]=3D0b11 setting that the other CPUs hav=
e.
> > This can cause crashes and unexpected behaviour.
> >=20
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >  hw/ppc/spapr_rtas.c | 14 +++++++++-----
> >  1 file changed, 9 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> > index 63d96955c0..b476382ae6 100644
> > --- a/hw/ppc/spapr_rtas.c
> > +++ b/hw/ppc/spapr_rtas.c
> > @@ -132,8 +132,8 @@ static void rtas_start_cpu(PowerPCCPU *callcpu, Spa=
prMachineState *spapr,
> >      target_ulong id, start, r3;
> >      PowerPCCPU *newcpu;
> >      CPUPPCState *env;
> > -    PowerPCCPUClass *pcc;
> >      target_ulong lpcr;
> > +    target_ulong caller_lpcr;
> > =20
> >      if (nargs !=3D 3 || nret !=3D 1) {
> >          rtas_st(rets, 0, RTAS_OUT_PARAM_ERROR);
> > @@ -152,7 +152,6 @@ static void rtas_start_cpu(PowerPCCPU *callcpu, Spa=
prMachineState *spapr,
> >      }
> > =20
> >      env =3D &newcpu->env;
> > -    pcc =3D POWERPC_CPU_GET_CLASS(newcpu);
> > =20
> >      if (!CPU(newcpu)->halted) {
> >          rtas_st(rets, 0, RTAS_OUT_HW_ERROR);
> > @@ -164,10 +163,15 @@ static void rtas_start_cpu(PowerPCCPU *callcpu, S=
paprMachineState *spapr,
> >      env->msr =3D (1ULL << MSR_SF) | (1ULL << MSR_ME);
> >      hreg_compute_hflags(env);
> > =20
> > +    caller_lpcr =3D callcpu->env.spr[SPR_LPCR];
> >      lpcr =3D env->spr[SPR_LPCR];
> > -    if (!pcc->interrupts_big_endian(callcpu)) {
> > -        lpcr |=3D LPCR_ILE;
> > -    }
> > +
> > +    /* Set ILE the same way */
> > +    lpcr =3D (lpcr & ~LPCR_ILE) | (caller_lpcr & LPCR_ILE);
> > +
>=20
> Unrelated change as Cedric already noted but that's nice :)
>=20
> /me starting to think we might do the same elsewhere and
> maybe get rid of PowerPCCPUClass::interrupts_big_endian()

Yes, that's a nice thought.

> > +    /* Set AIL the same way */
> > +    lpcr =3D (lpcr & ~LPCR_AIL) | (caller_lpcr & LPCR_AIL);
> > +
>=20
> It seems better indeed to rely on the calling CPU here rather
> than the arbitrary first_cpu in the hotplug handler.

I agree.

> Reviewed-by: Greg Kurz <groug@kaod.org>

Applied to ppc-for-6.1, thanks.

>=20
> >      if (env->mmu_model =3D=3D POWERPC_MMU_3_00) {
> >          /*
> >           * New cpus are expected to start in the same radix/hash mode
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--YF+5zYCWwojyDmBD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCu9fEACgkQbDjKyiDZ
s5KuiBAAuG4z8Myij1nPSTUOv+apHJ89yLh1Z/KybYb9zMAxsYJ3+QLp9hSaYStg
ZC8kjHRAYSBIyRJ3+pBIKfDOnnMRKM0w/CoUXfvyXl+1QWXAfuCQ57qcpmOKW1Rr
He1KqdJaWzbGcR3VhEwjoqS3JUYZm32Y/ImhRpehnA6qwtR3pGzX+hfzANCTHvgu
TE5HW7rkzajgOUmRX5dvK3Ji2e8tSJ3A6FbuBF/HltjnZdAb2/6ddBZZkOZZgKKm
9xApHbSj3JqZVfAk12syysNFvAiz/7yTcdCHYMfcxKGII/QkibGnOYcSfQyRHOO5
rdzlY4CBRCDJq69i3zxIKv2xo+c7InbLd5sfqcKumjm969GxK/eAFMEgfVYMz0zC
a+NEkpLnmErvWg1bGvjUeSLpW1bqWM9AiDC3DkdNJgvZiQIDv1Fn6cAKY0ajjP5b
0u3i+VCAiEGKVdnUXAeoQlF3RmQWQB8nj0LUsnUt9bBIHX4L1vyILCJuvt2yWFT5
JN1TAoGRK4/xwrMBsjd3k7mAYodCquKelCEYd56wFoH0CQvBWjj4wZdMXIT8UERO
nGZniSQx1LQZz9WPAimtZxCiAAlB7Wf2ulDe9yL+F/5BXcL7EPoBTr3rIqiX95xo
8J3dg9a8mXEvyMMVCPwYGwXg5VeYZ2dh4yuccVBHfiYvM2pFOzk=
=NvrR
-----END PGP SIGNATURE-----

--YF+5zYCWwojyDmBD--

