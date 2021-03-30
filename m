Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE1734E0D3
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 07:47:45 +0200 (CEST)
Received: from localhost ([::1]:57580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lR7E8-0003yb-3x
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 01:47:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lR7CJ-0003VW-LJ; Tue, 30 Mar 2021 01:45:52 -0400
Received: from ozlabs.org ([203.11.71.1]:44519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lR7CH-0002JX-44; Tue, 30 Mar 2021 01:45:51 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F8dhZ3dxWz9sWF; Tue, 30 Mar 2021 16:45:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1617083134;
 bh=2m5B4mCYePkslhFXDt+tFhD75FEyimoBsvR0n+I19CM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FHKFZj3dhnrBt5qZkO7aY4d1Szfa/sRVIaLB8Svu2iwCMTTJu7VopYGUHDCmoAsVn
 18wNCpHhyNx0qKJjyn6nBoIfJkyrk2aMugpaTaA/OJqeyTdVvGmHr8Fyxcfjfjgysx
 DZyI2VclPlw2XJMYq+nvulmBynABuCzFO6zcQAaU=
Date: Tue, 30 Mar 2021 15:54:36 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v5 02/10] target/ppc: Disconnect hflags from MSR
Message-ID: <YGKvDOCtfbj0avYF@yekko.fritz.box>
References: <20210323184340.619757-1-richard.henderson@linaro.org>
 <20210323184340.619757-3-richard.henderson@linaro.org>
 <YFqBtsijRRcEBB/k@yekko.fritz.box>
 <20210329150522.1b00607d@bahia.lan>
 <d0221e19-6c8b-6cc3-c4aa-2d5fff4ecb8b@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KPSFNFhpRi5gq9Jr"
Content-Disposition: inline
In-Reply-To: <d0221e19-6c8b-6cc3-c4aa-2d5fff4ecb8b@linaro.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Ivan Warren <ivan@vmfacility.fr>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--KPSFNFhpRi5gq9Jr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 29, 2021 at 10:26:02AM -0600, Richard Henderson wrote:
> On 3/29/21 7:05 AM, Greg Kurz wrote:
> > On Wed, 24 Mar 2021 11:03:02 +1100
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> >=20
> > > On Tue, Mar 23, 2021 at 12:43:32PM -0600, Richard Henderson wrote:
> > > > Copying flags directly from msr has drawbacks: (1) msr bits
> > > > mean different things per cpu, (2) msr has 64 bits on 64 cpus
> > > > while tb->flags has only 32 bits.
> > > >=20
> > > > Create a enum to define these bits.  Document the origin of each bit
> > > > and validate those bits that must match MSR.  This fixes the
> > > > truncation of env->hflags to tb->flags, because we no longer
> > > > have hflags bits set above bit 31.
> > > >=20
> > > > Most of the code in ppc_tr_init_disas_context is moved over to
> > > > hreg_compute_hflags.  Some of it is simple extractions from msr,
> > > > some requires examining other cpu flags.  Anything that is moved
> > > > becomes a simple extract from hflags in ppc_tr_init_disas_context.
> > > >=20
> > > > Several existing bugs are left in ppc_tr_init_disas_context, where
> > > > additional changes are required -- to be addressed in future patche=
s.
> > > >=20
> > > > Remove a broken #if 0 block.
> > > >=20
> > > > Reported-by: Ivan Warren <ivan@vmfacility.fr>
> > > > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > >=20
> > > Applied to ppc-for-6.0.
> > >=20
> >=20
> > FYI I can consistently reproduce locally on my laptop an error I'm also
> > seeing in CI.
> >=20
> > $ ./configure --target-list=3Dppc64abi32-linux-user && make -j all && m=
ake check-tcg
> > ...
> >    TEST    threadcount on ppc64abi32
> > qemu: uncaught target signal 11 (Segmentation fault) - core dumped
> >=20
> > Bisect led to this commit in ppc-for-6.0
>=20
> Any more details?  Because this works for me.

Yeah, I haven't gotten this to fail locally either.

But wait... it gets even weirder.  With gitlab, I can get similar
looking failures with

  A) Just the non-hflags patches from my tree
     https://gitlab.com/dgibson/qemu/-/pipelines/278542370

  B) Just the hflags patches from my / Richard's tree
     https://gitlab.com/dgibson/qemu/-/pipelines/278497244

But I haven't managed to get the same failures with (C) their common
ancestor (i.e. the upstream master at the time I split made the (A)
and (B) branches).
    https://gitlab.com/dgibson/qemu/-/pipelines/278497233

With (A) and (B) the build-user and build-user-static tests don't
always fail, but they generally seem to fail within 2-4 attempts.
I've made a bunch of retries on (C) and haven't managed to get either
build-user or build-user-static to fail.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--KPSFNFhpRi5gq9Jr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBirwoACgkQbDjKyiDZ
s5K7zRAAwf8ELBjQR/CBYk/q1qzKHtRJ3bJ4lfdkZXJoHPGF1mxypT/Bvk8R6mei
YBA5cYi4U2EaMmpdzh4NePv5IeVVbeYUavSS7FXnQCrDBRGgz/T6R1h+9uwEUezT
3TxexP5eHqjM5om5NjFsA5ca8hqkg3CNLUwIGmtcu/yZqSmFSWhcWVcafQxLkh/H
mcT9DMlaK6gPEplw/NLylypqUG9OvHTmNesZj8Id2V5ceaJp6ba6jmCUMwl8cp6t
e6HwC2153I3ZZI6xpO3vWv0c9V8dpsSoITg1yrilAHmn6PYkmA+fJgOVrSwMEfXQ
3q8JPdLTy/JqBxFRAKSPzruZLwRjvARImW7A3BNWrcgPYkP8FtwH48kZvDV7zKPB
OOtOJbQnPNL2BmbPWb5f3+2vJoGqUyiU6ixwXSDMP5z/HBDClfVC9Lo1EW0mrCsl
R3tSChZa8HCfIrgjF5JKEw3Kgbu/OMhpE2lhjGb6T67l7DK5y7el9edSpeOS1kg4
W4fZZmzcYNzN69PPhBjTq75RvWQeTLDLW0MThIIgT7k/nulhvI0970Icf9wdDyFx
wFjNbLPxydKolV3kCmHWfdtFGDCkKOLiuZONYW6SWWjyifkqlF3ZDg+wRQRKfZM3
ZL9bw32ibmxnwtzdNjyoEcYsS4kXA0+Myh4//l0yw/AwDTc/9Xw=
=P93t
-----END PGP SIGNATURE-----

--KPSFNFhpRi5gq9Jr--

