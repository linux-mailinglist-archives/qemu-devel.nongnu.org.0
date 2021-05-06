Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A233B374D75
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 04:22:12 +0200 (CEST)
Received: from localhost ([::1]:44648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leTeV-0002Qg-NG
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 22:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1leTav-0005ol-91; Wed, 05 May 2021 22:18:30 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:56487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1leTaq-0004cV-Fd; Wed, 05 May 2021 22:18:27 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FbHLH5XqTz9sTD; Thu,  6 May 2021 12:18:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620267495;
 bh=GlMn/kYkx4XMKX5OM/3d1kqHLb59rMyb/NTUPM9dalM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zg81B7QOHvJIntrEBiepKhSvDTi5fbLIBh/0fJvKs5BOfmI1mRWesL06F9fbJzl9E
 sI+JcdtsHNtjf7mtqylCTCQ6M23Fw1S5Kfr6/dYVIO4jwwScFbf/a4vo/TMhw7wNIL
 xmFrKSAqyj+RxKnwg0sz3yv2zfISvulGwYuNzD8k=
Date: Thu, 6 May 2021 12:03:10 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
Subject: Re: [RFC PATCH v2 1/2] target/ppc: Moved functions out of mmu-hash64
Message-ID: <YJNOXs2tD04vqGCD@yekko>
References: <20210430184047.81653-1-lucas.araujo@eldorado.org.br>
 <20210430184047.81653-2-lucas.araujo@eldorado.org.br>
 <YI97GykbXX5u428t@yekko>
 <6c67c7fb-a825-a469-a0dd-30c3c76c6472@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="thj9gqSxUknPu5tJ"
Content-Disposition: inline
In-Reply-To: <6c67c7fb-a825-a469-a0dd-30c3c76c6472@eldorado.org.br>
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
Cc: bruno.larsen@eldorado.org.br, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 farosas@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--thj9gqSxUknPu5tJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 05, 2021 at 02:30:35PM -0300, Lucas Mateus Martins Araujo e Cas=
tro wrote:
>=20
> On 03/05/2021 01:24, David Gibson wrote:
> > On Fri, Apr 30, 2021 at 03:40:46PM -0300, Lucas Mateus Castro (alqotel)=
 wrote:
> > > The functions ppc_store_lpcr, ppc_hash64_filter_pagesizes and
> > > ppc_hash64_unmap_hptes have been moved to mmu-misc.h since they are
> > > not needed in a !TCG context and mmu-hash64 should not be compiled
> > > in such situation.
> > >=20
> > > ppc_store_lpcr and ppc_hash64_filter_pagesizes are used by multiple
> > > functions, while ppc_hash64_unmap_hptes is used by rehash_hpt (in
> > > spapr_hcall.c).
> > Hmm.. looking at it, ppc_store_lpcr() (and helper_store_lpcr()) don't
> > really belong in this file at all.  The LPCR has some things related
> > to the hash MMU, but plenty of others that don't.  So, maybe
> > misc_helper.c?  That might have to be moved again, since misc_helper
> > itself should probably mostly not be used for !TCG.  But.. one thing
> > at a time.
>=20
> I tested here and compiling misc_helper.c with disable-tcg it's kind of
> complicated and it would require many changes in it, so for this patch
> just move it there and deal with it in a later patch?

Yes, sounds reasonable.

>=20
> > AFAICT the only user of ppc_hash64_filter_pagesizes() is in
> > spapr_caps.c.  For now you can just move it next to the caller, it's
> > debatable whether it belongs more to PAPR or MMU code.
>=20
> Also I'm assuming the prototype should also be moved from
> "target/ppc/mmu-hash64.h" to "include/hw/ppc/spapr.h" (or some other
> spapr_*.h file), or should it be left in the original file?

Well, if you put it next to the caller you can make it static and
remove the prototype entirely.

>=20
> > ppc_hash64_unmap_hptes() is definitely TCG only and should stay where
> > it is.  The call from rehash_hpt() can be solved because rehash_hpt()
> > itself is TCG only.  I've already suggested splitting the TCG (well,
> > softmmu) only things out from spapr_hcall.c, so it might simplify
> > things to tackle that first.
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--thj9gqSxUknPu5tJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCTTlwACgkQbDjKyiDZ
s5JCHQ//SE13omhlWyU/iGqzBPw9rf3CHDiiLb22uypG15EyV5rG+eSjUyXRYLuE
bmFOLFILZ8RhjpOekgQS9W7LBqwZ0hf7OKxRaP9zwYAX3h57lu6QgV20CiJN3+ma
pdyJJhdppUkOglmbjMYmkQ+cK5iEi6P/KBFxH3VEZbBuFt9TQx+l1rsgMPjIs61+
+lYIcMznhR2W8g82LAxpEecafVQ7DXwN6isbhwjTr3dxE3z5TA1V9Wpnum80w1y1
8KhH1hlEbprAyOVsB6N2UKIo0HvkZ7coTLSmipjtCNLfk8qXQ5dMBuqQG5sm7hc3
QeIvlxrjjb3sNbXOPRETYW7VWYsQu31DqQN/1/ZMW2/Blm8RJ716DYCxeyGfju1T
95AvPLesXt9aGDewBOFa7kIP3/KyVj014iEQfYlOYFEHXQ5siP/NxX+e0RmXqVsR
ryH9/oN5rATIekcyvG16UhCyyawksN5t+HVZR72YVSQ7d8gVYheh4dydx80FIzaM
qxGEbjRvBuK5qRlm/6ZiqeXvVVjtH3qW1ZMwiYf78TJ518gNHUX1nQmcb/2oi1hO
GyU95iqbVB+vLtphSc1kagbhZOreU/WhxRA4CiABSTKFU2Hwi3+Kt9/fQJ2QSXz3
nkskW1M7s83wzv/ep/fzIkF4g6xKkGOAuw0ViuWX4cG09U41RTg=
=NbVn
-----END PGP SIGNATURE-----

--thj9gqSxUknPu5tJ--

