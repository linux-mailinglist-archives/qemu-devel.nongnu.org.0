Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE915373434
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 06:21:51 +0200 (CEST)
Received: from localhost ([::1]:47708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le92l-00070N-1g
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 00:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1le91a-0006E8-Fz; Wed, 05 May 2021 00:20:38 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:33019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1le91Y-0001Sn-FP; Wed, 05 May 2021 00:20:38 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZk5s3Rtnz9sRR; Wed,  5 May 2021 14:20:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620188433;
 bh=OEVsKX8rStUmBVT7VblJ6fKCtBTd64nECccwWgQn5Oc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NV9YkUF9oSrEn/WEvEBucgCUOyRLwXstxDUH75CO9EL5M/rmTq+3fPva3srwxLJyb
 RbXFDNC5WztrP5N4GPd5r+57L7mOTNdn1rP0YXByZPIeH67aG2Hs0mt2p1rkPIVNEX
 LYbF5xYx7kUFfOq7PCtSI2r04vgcN/lyJTD8BaWU=
Date: Wed, 5 May 2021 14:20:28 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] target/ppc/spapr: Update H_GET_CPU_CHARACTERISTICS bits
Message-ID: <YJIdDOCE6CMZ0zLF@yekko>
References: <20210503125833.891752-1-npiggin@gmail.com>
 <YJCYKBF2YgEl8AEA@yekko> <1620117371.82b83ry366.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lyAA3TK1xSI8rAg7"
Content-Disposition: inline
In-Reply-To: <1620117371.82b83ry366.astroid@bobo.none>
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--lyAA3TK1xSI8rAg7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 04, 2021 at 06:50:54PM +1000, Nicholas Piggin wrote:
> Excerpts from David Gibson's message of May 4, 2021 10:41 am:
> > On Mon, May 03, 2021 at 10:58:33PM +1000, Nicholas Piggin wrote:
> >> There are several new bits added to the hcall which reflect new issues
> >> found and new hardware mitigations.
> >>=20
> >> This adds the link stack flush behaviour, link stack flush accelerated
> >> instruction capability, and several L1D flush type behaviours (which a=
re
> >> now being specified as negative in order to simplify patched kernel
> >> compatibility with older firmware).
> >=20
> > So, to clarify here, the bits your adding aren't advertising any new
> > behaviour on qemu/KVM's part, they're just new ways of advertising the
> > same behaviour?
>=20
> I... think so. "Behaviour" is in context of the hcall that advertises
> how the processor behaves (or what the guest must do for security).

Heh.  Don't get me started on how the difference between
"characteristics" and "behaviours" in the fields is totally
non-obvious.

> The new NO_ bits added are for processors that don't require a particular
> flush. The FLUSH_LINK_STACK was basically always required but I think
> Linux just keyed off the count cache flush and did both at once.
>=20
> The new LINK_FLUSH_ASSIST is a new processor feature the guest will use
> to implement link stack flushing, so maybe that does need a cap?

Yeah, sounds like it will.

>=20
> >=20
> >>=20
> >> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> >> ---
> >>  hw/ppc/spapr_hcall.c   | 5 +++++
> >>  include/hw/ppc/spapr.h | 6 ++++++
> >>  2 files changed, 11 insertions(+)
> >>=20
> >> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> >> index 7275d0bba1..f656620232 100644
> >> --- a/hw/ppc/spapr_hcall.c
> >> +++ b/hw/ppc/spapr_hcall.c
> >> @@ -1878,6 +1878,9 @@ static target_ulong h_get_cpu_characteristics(Po=
werPCCPU *cpu,
> >>          behaviour |=3D H_CPU_BEHAV_L1D_FLUSH_PR;
> >>          break;
> >>      case SPAPR_CAP_FIXED:
> >> +        behaviour |=3D H_CPU_BEHAV_NO_L1D_FLUSH_ENTRY;
> >> +        behaviour |=3D H_CPU_BEHAV_NO_L1D_FLUSH_UACCESS;
> >> +        behaviour |=3D H_CPU_BEHAV_NO_STF_BARRIER;
> >>          break;
> >>      default: /* broken */
> >>          assert(safe_cache =3D=3D SPAPR_CAP_BROKEN);
> >> @@ -1909,9 +1912,11 @@ static target_ulong h_get_cpu_characteristics(P=
owerPCCPU *cpu,
> >>          break;
> >>      case SPAPR_CAP_WORKAROUND:
> >>          behaviour |=3D H_CPU_BEHAV_FLUSH_COUNT_CACHE;
> >> +        behaviour |=3D H_CPU_BEHAV_FLUSH_LINK_STACK;
> >>          if (count_cache_flush_assist) {
> >>              characteristics |=3D H_CPU_CHAR_BCCTR_FLUSH_ASSIST;
> >>          }
> >> +        /* Should have a way to enable BCCTR_LINK_FLUSH_ASSIST */
> >=20
> > Do we need a new spapr capability for this link flush thing?
>=20
> It is independent of the FLUSH_COUNT_CACHE capability, so it seems like
> it should I think? Should that be added as a following patch?

No, it will have to go in first or at the same time.  Otherwise we'll
be errneously advertising things.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--lyAA3TK1xSI8rAg7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCSHQwACgkQbDjKyiDZ
s5KT9Q//SOQ60GjowjLxnqk9ar+/fYqL77p2fj2jculr4GerMiak4Ruy05A0jm07
zxU8koa4ko9BMIMVKW/boKdZzm7ptr0uXiw4Yg5/1/qTYcXxnTKwPiCaSUAv6rxl
iT1Je0r4L5Ju4GVkB/S50bOzNJWji4uKlkj/c34zUVXgYbzbf0SeH+tJk17gDVCS
6ouaFx6cu1c+cQoWpAlwlDNz1qtXO0CznkJBss9L0iRZVdUeBqqE78dZ8aSQSf14
2l3Q4qosTMJO337/CyTm+gNFs+sDuJVZwKvCroHabpNFjsBmy7A2x3G/UEsjOhAq
O9dipP46hVmcg98bSZtfHZF2hE55kyPCOT8bMkcR2Txta30oads0OdumwTWFODd1
HP7A+K4d0Fy5vVCoLKcqKD4zNHj7tL0jy5TCgCr5OCciwjWieGvX6KRbF+pRZSzB
24pqUa0B/8n+TB2XMnKSRYCsTKAoGxfhwrsLPhv/K09g4ike+45b4zr/wfiHngJn
TvTE/M3bDhbk8iyUHmar2pTnm8M+eDTvaxj6CxkvcshMzQU0xk/jFi1llSIxjMTP
eb0tl50Lih/a4VWWoAKbPat3X1ZqU4jzP0Gwp3yg3LciNzSu/+fCeXu0/nune1Cb
Q09Lu6GDKW1VO2qsFZUFhYEGFOgkGPcVvFdRPIsEBIZew1suFJs=
=KAFC
-----END PGP SIGNATURE-----

--lyAA3TK1xSI8rAg7--

