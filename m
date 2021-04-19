Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F389F363AFA
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 07:19:28 +0200 (CEST)
Received: from localhost ([::1]:51698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYMJj-0003nm-Iv
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 01:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lYMI4-0003H8-JA; Mon, 19 Apr 2021 01:17:44 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:55297 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lYMI2-0001PB-0M; Mon, 19 Apr 2021 01:17:44 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FNw733kgzz9vFN; Mon, 19 Apr 2021 15:17:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618809455;
 bh=p2DLv0uOTpOeGPrcUchGaR2U6kX4sY+Tizg/mdnKxi4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ceJVAWsMygp/l9BzQ5GQFFV93X+zYPw7981dNTvozRqGoO1JTubaSTq9yhJiBirON
 eMnNYQ2ntvZlmNQHljTbFF8+2QmMVbp66FHHSCBZNRSgVaE1Z/GMfsmjWN7rMwukOb
 n3Lqv2ghF8zKNzfbwgGuXh9YEv0k3XSc5KiYpTcY=
Date: Mon, 19 Apr 2021 15:17:29 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
Subject: Re: target/ppc: sPAPR invalid function calls when compiling without
 TCG
Message-ID: <YH0SaTPzkNXg5uPf@yekko.fritz.box>
References: <RO1PR80MB56100E30B8B94BB4F733FB07CE4E9@RO1PR80MB5610.lamprd80.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qhlKNCWy4vvVnNkH"
Content-Disposition: inline
In-Reply-To: <RO1PR80MB56100E30B8B94BB4F733FB07CE4E9@RO1PR80MB5610.lamprd80.prod.outlook.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--qhlKNCWy4vvVnNkH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 14, 2021 at 06:28:26PM +0000, Lucas Mateus Martins Araujo e Cas=
tro wrote:
> Hi, I have been working on billionai's patch to enable the --disable-tcg =
option on PowerPC and one of the problems is that 5 files in hw/ppc use fun=
ctions implemented in mmu-hash64.c which is not compiled with --disable-tcg=
, I'd like to know how to correct the spapr function call, should I
>=20
>   *   change the calls to generic functions that should call the correct =
function based on if kvm is being used or not,
>   *   should I just implement said functions independently of mmu-hash64.=
c and always call them,
>   *   should I just implement said functions independently of mmu-hash64.=
c and only call it with --disable-tcg option turned on,
>   *   find a way to not have said calls when compiling without TCG as the=
y're not necessary,
>   *   just create a stub
>=20
> Here's when each function is called by each .c:
> spapr.c:
>     function do_lpcr_sync call ppc_store_lpcr

I think ppc_store_lpcr() needs to be moved so that it's compiled with
KVM as well, but #ifdef out the hreg_compute_hflags() line in that case.

>=20
> spapr_hcall.c:
>     function h_enter call ppc_hash64_hpte_page_shift_noslb, ppc_hash64_ma=
p_hptes and ppc_hash64_unmap_hptes
>     function remove_hpte call ppc_hash64_map_hptes, ppc_hash64_unmap_hpte=
s and ppc_hash64_tlb_flush_hpte
>     function h_protect call ppc_hash64_map_hptes, ppc_hash64_unmap_hptes =
and ppc_hash64_tlb_flush_hpte
>     function h_read call ppc_hash64_map_hptes and ppc_hash64_unmap_hptes
>     function rehash_hpte call ppc_hash64_hpte_page_shift_noslb
>     function rehash_hpt call ppc_hash64_map_hptes and ppc_hash64_unmap_hp=
tes

h_enter, remove_hpte, h_protect, h_read and rehash_hpte should never
be called for a KVM guest (KVM will intercept the relevant hcalls
before they reach qemu).  I think it would make sense to split of a
TCG only portion of spapr_hcall.c into a new file.  You'll then
probably need !TCG stubs for those hypercalls, which should trip a
fatal error (if KVM hasn't handled the calls, there's nothing we can
do that will salvage the situation).

> spapr_rtas.c:
>     function rtas_start_cpu call ppc_store_lpcr
>     function rtas_stop_self call ppc_store_lpcr

As above.

> spapr_spapr_cpu_core.c
>     function spapr_reset_vcpu call ppc_store_lpcr
>     function spapr_cpu_set_entry_state call ppc_store_lpcr

As above.

> spapr_caps.c:
>     function cap_large_decr_cpu_apply call ppc_store_lpcr

As above.

>     function cap_hpt_maxpagesize_cpu_apply call ppc_hash64_filter_pagesiz=
es

Ok, you definitely need the filter_pagesizes logic, even with KVM, so
that will also have to be moved out of the TCG only file.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--qhlKNCWy4vvVnNkH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmB9EmcACgkQbDjKyiDZ
s5KLdg//XzKppqc3p5knpYPOxDfexEUw2WxU7x1TRUfBux7rWMst0gr9NQKjsZOR
Fc5ECGM+FdoklyaEU/I5tbEYfm0MDisiG+VPqnyHR0Y4YiRZOmniEPs80PpkQA6B
R7Muh2wP19MAaT1X6lM8XFKOyTSFBfvTwlzU9MWP8Jgsmng81YanxBwZFTO0XlEO
Z4E0UK7Axl/D+CSHphzB9JXsWGTgsPMObU4Shqjhpx7Czf8oTN52gwArec6NsriH
LxIjqbWwUsg6n7iIn+tIpzOJFQFrJJQVX0zjLKae/TsewssNIBVTWkCaIyWLj1Nm
pk4nU79eomTPxCSVafWFMQb2o5S4BvghprYtHrJ+ShtyiZBG343oFwizP2D6J8fL
BmaFmumcQL7L9H3Stz5D2gfs6/+EE3+GZ14qjEQvK77oe9VCbO59/4kubmx0M6Dx
RIPACPlox+eB5//X8mjI5dT8XwsWaPLr2xnRK26WKqQ0jmGVV0zKsdWb5+m31hVQ
mw8nRoUvUDixYHQwUaklaKIIugBmz8opy8EDUEfZhGqJj1TWcNQNWtCjbovjltPl
d6cpP6CUzfUH/SP7oubQfaBc8kWpuD+Fx213dTWyDcAsB5pI3JTkzhiDmW+kxKti
ocDgibr/jXt1hQONWmI5P0dSMpdvZid8TQ5gpaHkhEl1dmIwJqU=
=B0En
-----END PGP SIGNATURE-----

--qhlKNCWy4vvVnNkH--

