Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8850C3A736C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 03:45:06 +0200 (CEST)
Received: from localhost ([::1]:40072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsy8X-0007vt-Fw
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 21:45:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lsy6n-0005nK-2m; Mon, 14 Jun 2021 21:43:17 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:47817 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lsy6k-0008NW-KQ; Mon, 14 Jun 2021 21:43:16 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G3rgF5nsbz9sW7; Tue, 15 Jun 2021 11:43:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623721385;
 bh=XkU35WD2ZzZP19InMURP90NCNunsegT0n/R0MDDOZHg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FVODVTCYFKY7EJzcErtLRaM8CffKp7GgRVOLPAs5rSQ0J43Hk9MLFWbd0HmXybvzj
 /pqnA9j+k7kGYtph9ZuI5lZw8Lr3IAJdi7q+tCsFJdib4JLqhlAGsAnPDgnn0jm/W9
 H3qMUgoAzRm/1i7/e4coVq5GZJRFUy92BiP4pZQA=
Date: Tue, 15 Jun 2021 11:18:18 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] target/ppc: fix address translation bug for radix
 mmus
Message-ID: <YMf/2vmRcAii2dM2@yekko>
References: <20210614191630.101304-1-bruno.larsen@eldorado.org.br>
 <87r1h4upiq.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rXe5BTaQLi089+Gj"
Content-Disposition: inline
In-Reply-To: <87r1h4upiq.fsf@linux.ibm.com>
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
Cc: richard.henderson@linaro.org, lucas.araujo@eldorado.org.br,
 qemu-devel@nongnu.org, luis.pires@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--rXe5BTaQLi089+Gj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 14, 2021 at 06:04:13PM -0300, Fabiano Rosas wrote:
> "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br> writes:
>=20
> > +/*
> > + * These correspond to the mmu_idx values computed in
> > + * hreg_compute_hflags_value. See the tables therein
> > + */
> > +static inline bool mmuidx_pr(int idx) { return !(idx & 1); }
> > +/*
> > + * If we want to use these macros for hash-style MMUs, we need to
> > + * add an if or another macro here.
> > + */
>=20
> Don't these work just fine for hash as well? Except for Booke.

Right, I think we want to restrict these to BookS mmus, but I don't
think we need to restrict to radix.
>=20
> > +static inline bool mmuidx_real(int idx) { return idx & 2; }
> > +static inline bool mmuidx_hv(int idx) { return idx & 4; }
> > +
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rXe5BTaQLi089+Gj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDH/9gACgkQbDjKyiDZ
s5IcgBAAq7/Jn9D/TcsFTE9XU/eylltki9A7hKozzDLSZig9HsJT7rAGKwkeo4BN
BiDitT68a6FdNE7KcxMRp87FUMbQ2smGznqmjKduq/XI7yKBUJA4/boImjlr+Ikr
Me9fBhfljJ4pk/ZZw7s3oSjVe0ZuipRcR2LLcf0np2OWnMG+UWkS8/ufHyb8pTmj
GxPs9mbzc5zJ2788aHXVPwBePBwEMhcaYj8sz9QroYCTkEHuVM0CjvXeDXd5r00x
7OUBpP5sblWxJ7eJ1KX/6yP9OMYW+zuAVulBBQZnWGrZxkmkh47oFYCr9xpUWlBq
OycUbQF/LX1CxVkCGnCMt7zetMLdU3DdFnELPtG+p9rRc18yyGTuUSrGfCjAaDn9
hBirFuBOINWKWaLfWoKKoGoer3kGIurF0/6YEkGUrC54PFUhqT3rio06e3tYJJdt
DY1E5MOAGMckZxO85znPNeEVJg016lt8oqSv4nveLte2+oFt375Xjkzlhgq5MSR9
xgn8KG+gxDei8uaxRe8P/GNuEjRxE3/aTeJLc63pGzJ50B9Lp7q+M3jp7sQezlBr
osx6Q+QvlN8DHiY89xwaHfSwyl1BKMhp/YPkBYlGrmNQT37UvA+m8ccm4QanWOUI
Hdk8O3M2VCNgYuqZLBwCn9tnGHrkPUswk+cAfvmIcpoyTfbdUoE=
=R0Pa
-----END PGP SIGNATURE-----

--rXe5BTaQLi089+Gj--

