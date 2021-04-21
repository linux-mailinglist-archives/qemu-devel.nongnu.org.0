Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7298366440
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 06:08:29 +0200 (CEST)
Received: from localhost ([::1]:35756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ4A8-0005BF-HX
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 00:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lZ48v-0004eb-IE; Wed, 21 Apr 2021 00:07:13 -0400
Received: from ozlabs.org ([203.11.71.1]:45307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lZ48s-0006lK-V0; Wed, 21 Apr 2021 00:07:13 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FQ6Sc0FK1z9tlf; Wed, 21 Apr 2021 14:06:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618978016;
 bh=fbiCxlhombpLaogqfwxz76OGoWRDmxcATvb/fqsKMf8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D1/YKwkaywjeIP0icoE51tUNWHfUJmIewMuy2yoWjvG3kfM7KPMV20ARItlY2pvJp
 zrFgNGivBfPw2gPlRp/TB8NrEDIHtUl20RWGqVkzH284xmnI9bDjUMRz08jwaaQK7/
 v/DWOrXvxaW1FPPs8Nxb39wz7KaP/yZzlMORs4g0=
Date: Wed, 21 Apr 2021 14:06:03 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
Subject: Re: target/ppc: sPAPR invalid function calls when compiling without
 TCG
Message-ID: <YH+kq8F0gOSWtgbN@yekko.fritz.box>
References: <RO1PR80MB561024219A35A26C418CF51BCE489@RO1PR80MB5610.lamprd80.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GWoDzVs7TFQz20v1"
Content-Disposition: inline
In-Reply-To: <RO1PR80MB561024219A35A26C418CF51BCE489@RO1PR80MB5610.lamprd80.prod.outlook.com>
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
Cc: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--GWoDzVs7TFQz20v1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 20, 2021 at 06:27:38PM +0000, Lucas Mateus Martins Araujo e Cas=
tro wrote:
>=20
>=20
>=20
> ________________________________
>=20
> >> spapr_hcall.c:
> >>     function h_enter call ppc_hash64_hpte_page_shift_noslb, ppc_hash64=
_map_hptes and ppc_hash64_unmap_hptes
> >>     function remove_hpte call ppc_hash64_map_hptes, ppc_hash64_unmap_h=
ptes and ppc_hash64_tlb_flush_hpte
> >>     function h_protect call ppc_hash64_map_hptes, ppc_hash64_unmap_hpt=
es and ppc_hash64_tlb_flush_hpte
> >>     function h_read call ppc_hash64_map_hptes and ppc_hash64_unmap_hpt=
es
> >>     function rehash_hpte call ppc_hash64_hpte_page_shift_noslb
> >>     function rehash_hpt call ppc_hash64_map_hptes and ppc_hash64_unmap=
_hptes
> >
> >h_enter, remove_hpte, h_protect, h_read and rehash_hpte should never
> >be called for a KVM guest (KVM will intercept the relevant hcalls
> >before they reach qemu).  I think it would make sense to split of a
> >TCG only portion of spapr_hcall.c into a new file.  You'll then
> >probably need !TCG stubs for those hypercalls, which should trip a
> >fatal error (if KVM hasn't handled the calls, there's nothing we can
> >do that will salvage the situation).
>=20
> Besides the aforementioned functions, will all spapr hypercalls
> beginning with H_* be intercepted (and therefore, should trip a
> fatal error in the KVM-only file) or only a subset of these
> functions will be intercepted?

No, only a few hcalls will be KVM intercepted.  There are basically
two categories:
  1) hcalls which *must* be implemented in KVM, because qemu doesn't
     have access to the KVM data structures to implement them.  I
     think this is pretty much just the MMU related hypercalls.
  2) performance critical hcalls where we have a KVM accelerated
     implementation, but *could* be implemented in qemu (and in a few
     cases the kernel fast path will fall back to the qemu slow path
     sometimes)

> If the latter is there an interval of
> opcodes that'll be intercepted?

No.  The opcode numbers aren't defined by KVM or qemu, they're from
=66rom PAPR/PowerVM and have no bearing on how concerns are divided in
the KVM/qemu world.  I'd start by only separating hypercall
implementations which are actively causing you problems (calling into
TCG code is a strong hint that its in category (1)).

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--GWoDzVs7TFQz20v1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmB/pKgACgkQbDjKyiDZ
s5Ij3g//ZFidD9GVX0eWkGFHg/vwUC0e4elwo/X/qWV21D4nipqZixhMs5Hk76Hi
aTUYt98az8aNs+uqr7qYbrVnx3r6huKu8OEb1E0f2GWrtmCE6kRSuAE98ZSuN1c7
A2ciUOdmtasR0IxJL8S9d04pHA0coR27kXDZ9HtDXh139cHfXU5+WA7cEsJXwZfe
UPysaSUXrJXNMEbZiGfRu06Qg22dP4hS7BVt6QCAitZq2wyH7rIhtHuFj5e1xRCM
P/9qjL0Z8GtOQ0I/mBtuQW/68ZlPEehFdeqFJTYFCmPl/ajCQf5U4J1f1VD6ANVG
YgWuZ7LiRvrJ1bg4JDQUh1qYY2mkCkyFjVt5l5HzcJj44ardw2ybt0s1H9lNdOb+
v1Vd1ejuC7a6kixtzb+hUfXNoOfERWbfISasJ3Y8sest1npMMg7C9VZTEACMrMjE
pIoub0gkQzlwRu5Zjhdy4I23rVYMbLDeYvKb5LvPxzB5R2kQX2Dplx5b3r2IiiYe
HT5WQEAlyR4UkhRNpaxCEkuursr7fEcDx12LSdxqmg/KAVC+7zZNomEZsAFaX/8j
NW/s2zgen1u8baHdHjI8r/c233NkcIJrS0BdoinSdKBzjso5NTQ4XH4uZpjld1xm
yzmpMwYR4RJPB8sOPjxBhwFeTlILgCSPFoLookeNqf3epC1gbBs=
=g870
-----END PGP SIGNATURE-----

--GWoDzVs7TFQz20v1--

