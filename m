Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4663BC4A6
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 03:42:12 +0200 (CEST)
Received: from localhost ([::1]:34626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0a6E-000430-TZ
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 21:42:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m0a3G-0003Ar-2m; Mon, 05 Jul 2021 21:39:06 -0400
Received: from ozlabs.org ([203.11.71.1]:51435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m0a3D-0006lQ-Bt; Mon, 05 Jul 2021 21:39:05 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GJlZm3JMKz9shx; Tue,  6 Jul 2021 11:38:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625535536;
 bh=yJefDq6a38yJ93BzsebXE+AwKoOFYycrAS3Hz2ccXco=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m3y7Hd7bj2NpSy+ki4v6Oo2TiqycBY58nTBg+eIEY/j1fQd38ZfTIedC3e3vWkAxJ
 ZJJ8WtSMK9sRO2ZZw0uG5KHz9HHGvUG6iiQXvznW5ENPJWNhMxx9v7+qv9jWPBOtcJ
 vA0jYhC2SMCTa9YdDCwpJG2bq59epVtIvkzABq6M=
Date: Tue, 6 Jul 2021 11:35:14 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH v4 2/3] target/ppc: change ppc_hash32_xlate to use mmu_idx
Message-ID: <YOOzUrQTgwVOD+Wg@yekko>
References: <20210628133610.1143-1-bruno.larsen@eldorado.org.br>
 <20210628133610.1143-3-bruno.larsen@eldorado.org.br>
 <YOKJco6ebWubvDwx@yekko>
 <893bd8b3-d2be-309a-dd35-59aba1712be6@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/RabdQ8M2O8tweXP"
Content-Disposition: inline
In-Reply-To: <893bd8b3-d2be-309a-dd35-59aba1712be6@eldorado.org.br>
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--/RabdQ8M2O8tweXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 05, 2021 at 11:31:13AM -0300, Bruno Piazera Larsen wrote:
>=20
> On 05/07/2021 01:24, David Gibson wrote:
>=20
> > > Changed hash32 address translation to use the supplied mmu_idx, inste=
ad
> > > of using what was stored in the msr, for parity purposes (radix64
> > > already uses that).
>=20
> > Well.. parity and conceptual correctness.  The translation is supposed
> > to use mmu_idx, not look at the CPU again to get the right context.
> > AFAIK there isn't a situation in hash32 where they'll get out of sync,
> > but nothing guarantees that.
>=20
>=20
> Fair point, I can change the description if I do end up with a new
> version, but
>=20
> > I think the right approach is to duplicate the helper macros in
> > mmu-hash32.h for now.  We can unify them later with a more thorough
> > review (which would probably involve creating a new header for things
> > common to all BookS family MMUs).
>=20
> This doesn't work directly. I'd need to put in an ifndef
> PPC_MMU_BOOK3S_V3_H, which also feels a bit dubious to me. I can go
> with whichever one you prefer

Ah... good point, because both headers are included in some places.

Ok, in that case let's jump ahead instead.  Let's create a new
mmu-books.h to cover all MMUs based on the "classic" powerpc model,
and put them in there.  hash32 and book3s-v3 can include that, BookE,
4xx etc. will not.

For now these will be the only things in there, but there will
probably be more we can add later on.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/RabdQ8M2O8tweXP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDjs08ACgkQbDjKyiDZ
s5KwSQ//QcaqHMnkAPR2586oNhqFmdK+qmGsZhPUYNKQbGhcnmODuELA8jRvu1xn
2MxwjcUCQ9m4u8AWUht3OfraUdHi3zsmIhj97esZeGqUf2Fx18bMfgAVmHHeK5SS
vjUx9TcRcft7Tky9RUOv0TrBxig3A8MNypVeKKdbjt/A72wwh16Voob9BKrThCos
oT354Uz1nVau+fROAfv/qFJyQEqtDA5ruLlwM+79V+4/6f56NZl2dvcIEFLD+uAj
Y+DasslCiyQgpSBvZ3bP2ovk3uqZqIJjjdm1UYg1C6ZHO6c58BX9M5keFkmLzLkU
PwIxQNRQJKcDqmo7owm921gpN6sw39T09DhTHRsghUm9+3iJMB+dSsl4UFBDs5wd
G02Up5II2yHKGJDoR+Kq5R/1lnkATWXXS9gn4NMgAAU1kbeqFoexO9meQMhADJNo
6AciJicedB4v93xftYIEN7PHIGOXIrrinKsutEtqtEyZ203EWwrp7uEIY1ruST3r
KX5mhFJ3gviRj7OblMLtzLqnWUSj6qQ+6BMKqC6gF3uPSQ2wNfSD8fp/ywutChdz
LdFGaWZXOIRHo8TE61x9vQwnlu0tB+x0p9xKTLm6O2O5uGF5FU04LlP2WfIUESIu
uEPg/qzLu6+Nz8+R/2DNsWxNurfVhZ77XHU0cxeIeFVdk+bxzXg=
=8be/
-----END PGP SIGNATURE-----

--/RabdQ8M2O8tweXP--

