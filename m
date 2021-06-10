Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B53DF3A2457
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 08:17:37 +0200 (CEST)
Received: from localhost ([::1]:34986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrE0W-0000H9-KO
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 02:17:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lrDzJ-0007B2-W5; Thu, 10 Jun 2021 02:16:22 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:56973 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lrDzG-0006J6-TL; Thu, 10 Jun 2021 02:16:21 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G0tyY6fXSz9s5R; Thu, 10 Jun 2021 16:16:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623305765;
 bh=uzlBUEoBLrDUL7/OxdhWJRT/qFDzqPAgLAXXFXXuRqE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hine9RXGTDOiKOJXX81CBekjX52kVkkfIbsU/rzP0JNDsDeuK8miVgdA+CWB8rWUW
 ySNEhvI5ixQtQKh76fYWyH+Mh1u3hiYJFec0atAH4XmjGDGRXRZoLoyiFnM+pi/YVJ
 7jvU9LqFzLYoOZuHCWSHKjOolOtmAjZu3i+HnY6w=
Date: Thu, 10 Jun 2021 15:32:10 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
Subject: Re: [RFC PATCH 2/4] target/ppc: divided mmu_helper.c in 2 files
Message-ID: <YMGj2oz12mFSGibL@yekko>
References: <20210602192604.90846-1-lucas.araujo@eldorado.org.br>
 <20210602192604.90846-3-lucas.araujo@eldorado.org.br>
 <YL2E91r4YCErNp5H@yekko>
 <e0aac42a-21e3-928a-b18c-39f55d132af9@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="N8MIOk3m2ZOboXKZ"
Content-Disposition: inline
In-Reply-To: <e0aac42a-21e3-928a-b18c-39f55d132af9@eldorado.org.br>
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
Cc: qemu-devel@nongnu.org, luis.pires@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--N8MIOk3m2ZOboXKZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 07, 2021 at 03:35:06PM -0300, Lucas Mateus Martins Araujo e Cas=
tro wrote:
>=20
> On 06/06/2021 23:31, David Gibson wrote:
> > On Wed, Jun 02, 2021 at 04:26:02PM -0300, Lucas Mateus Castro (alqotel)=
 wrote:
> > > Moved functions in mmu_helper.c that should be compiled in build to
> > > mmu_common.c, moved declaration of functions that both files use to
> > > cpu.h and moved struct declarations and inline functions needed by
> > > both to target/ppc/internal.h. Updated meson.build to compile the
> > > new file.
> > >=20
> > > Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.o=
rg.br>
> > > ---
> > > Had to turn a few functions non static as it was used by both
> > > mmu_common.c and mmu_helper.c. Added the declaration of mmu_ctx_t to
> > > cpu.h so functions there can reference it and added the definition to
> > > internal.h so functions in both mmu_* files can access it.
> > > And maybe the tlb functions should be declared in internal.h instead =
of
> > > cpu.h.
> > > ---
> > >   target/ppc/cpu.h        |   35 +
> > >   target/ppc/internal.h   |   26 +
> > >   target/ppc/meson.build  |    6 +-
> > >   target/ppc/mmu_common.c | 1606 ++++++++++++++++++++++++++++++++++
> > >   target/ppc/mmu_helper.c | 1814 +++---------------------------------=
---
> > >   5 files changed, 1774 insertions(+), 1713 deletions(-)
> > >   create mode 100644 target/ppc/mmu_common.c
> > >=20
> > > diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> > > index b0934d9be4..cfc35ef83e 100644
> > > --- a/target/ppc/cpu.h
> > > +++ b/target/ppc/cpu.h
> > > @@ -1329,6 +1329,41 @@ void store_booke_tsr(CPUPPCState *env, target_=
ulong val);
> > >   void ppc_tlb_invalidate_all(CPUPPCState *env);
> > >   void ppc_tlb_invalidate_one(CPUPPCState *env, target_ulong addr);
> > >   void cpu_ppc_set_vhyp(PowerPCCPU *cpu, PPCVirtualHypervisor *vhyp);
> > > +
> > > +typedef struct mmu_ctx_t mmu_ctx_t;
> > > +int ppcemb_tlb_check(CPUPPCState *env, ppcemb_tlb_t *tlb,
> > > +                            hwaddr *raddrp,
> > > +                            target_ulong address, uint32_t pid, int =
ext,
> > > +                            int i);
> > > +int get_physical_address_wtlb(CPUPPCState *env, mmu_ctx_t *ctx,
> > > +                                     target_ulong eaddr,
> > > +                                     MMUAccessType access_type, int =
type,
> > > +                                     int mmu_idx);
> > > +hwaddr booke206_tlb_to_page_size(CPUPPCState *env,
> > > +                                        ppcmas_tlb_t *tlb);
> > > +int ppcmas_tlb_check(CPUPPCState *env, ppcmas_tlb_t *tlb,
> > > +                            hwaddr *raddrp, target_ulong address,
> > > +                            uint32_t pid);
> > > +int get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
> > > +                                target_ulong eaddr, MMUAccessType ac=
cess_type,
> > > +                                int type);
> > > +static inline int ppc6xx_tlb_getnum(CPUPPCState *env, target_ulong e=
addr,
> > > +                                    int way, int is_code)
> > > +{
> > > +    int nr;
> > > +
> > > +    /* Select TLB num in a way from address */
> > > +    nr =3D (eaddr >> TARGET_PAGE_BITS) & (env->tlb_per_way - 1);
> > > +    /* Select TLB way */
> > > +    nr +=3D env->tlb_per_way * way;
> > > +    /* 6xx have separate TLBs for instructions and data */
> > > +    if (is_code && env->id_tlbs =3D=3D 1) {
> > > +        nr +=3D env->nb_tlb;
> > > +    }
> > > +
> > > +    return nr;
> > > +}
> > This is a rather complex and model specific function to have inline in
> > a header.
> What is the best way to deal with this function? It's used by both
> mmu_helper.c and mmu_common.c so I put it there as a way to keep it being=
 an
> inline function, so it would be best to put it in target/ppc/internal.h or
> maybe just turn it into a not inline function?

There's no good reason for this to be inline.  Just put it in
mmu_common.c and export.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--N8MIOk3m2ZOboXKZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDBo9oACgkQbDjKyiDZ
s5LpyA/8CDvCX4zYy9ZNNHVsIGy0OLNPAk5qKsU0xY15ApMyX39gODiutqPmVa2t
aJHENT8jLatOmQabZ8Ddbf8mBgRgxxQQkN+wdjp9dp1R2RjWEQGTuBTa6pXbcg++
lrPsh77XJx3bL8GmfuWHCfHNhtoDPgo9dlUaFvEtxIDcB1AZ6zn4LG4mxiySaZIo
XxgaqOz5gogGxNZ6sz4RForxKXolf/sIVC9HZcITIttZ2INTrXWK/DjDRy3l9t3O
QIDz75rU0cEaL5fuwnULl/3WvoAOCA7YSO9Bz98M4dC98Pz0FKI++mq5S1ecoQcy
uFQWHR0qOgFLx+XtJidb7kU8qpBZm0Lx8EnO/548UeKMwwLeQ26xVq7teudE+N5m
HEt8z1hmoznqRlzG3qCcd2d7C/bHfYwaN3eIar6/Bs3484cj09PO861LF5nG8fs7
R1AAtpHcqPeQxYsTffc3rSEM7vYwmRHZE7nWmMoX4kgrt1N45cvpd5i61rWDuVet
+f/MzJPht1xTT2+f4dN8J/EEDTWWSVSdGjqnf5xS+LteZdwPueFSX0uNT63P7GB1
dpmGiDYF2cQsY6VKhvx4VDVpMVOO5FcHM6bSzMA+NmsbdQh13nVx8/NgqTrFHujD
o1myjRQHGo7l6FmgTG+H13xtzEBG32DQKQruZFbK9DQ8QNYgFGA=
=9xLm
-----END PGP SIGNATURE-----

--N8MIOk3m2ZOboXKZ--

