Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF82A396BC8
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 05:17:26 +0200 (CEST)
Received: from localhost ([::1]:35852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnuuD-0000GH-Rt
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 23:17:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lnut8-0006um-1i; Mon, 31 May 2021 23:16:18 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:60673 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lnut2-00014E-E0; Mon, 31 May 2021 23:16:16 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FvHNx2DKlz9sVb; Tue,  1 Jun 2021 13:16:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622517361;
 bh=Mv64VIPyeoXakr1OHn4AvPqTn7Weevo/laykMb+2YmM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d5jD0XVI54MmQ7Y23OgtwNpgpnKQCnJINheZknWzHGd5QcYcbgmlL5it7+cp8y/DA
 2da04C9jyumvc8NSWK5BHme9WAT2L8b9mCfHi8rp6NsblGUGkbToOqH2lr6zBMXGUv
 hmdYdPTVsPIrwpnFggEXnUg67nxpzQrzU2jxYwKI=
Date: Tue, 1 Jun 2021 12:34:29 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
Subject: Re: [target/ppc] excp_helper.c and mmu_helper.c cleanup
Message-ID: <YLWctd0j9gv+0Zie@yekko>
References: <5f3cd63e-92d5-56a3-89bc-519998cfe7cc@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9uT0EzZez/apR+lf"
Content-Disposition: inline
In-Reply-To: <5f3cd63e-92d5-56a3-89bc-519998cfe7cc@eldorado.org.br>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: farosas@linux.ibm.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, luis.pires@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--9uT0EzZez/apR+lf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 31, 2021 at 04:21:11PM -0300, Lucas Mateus Martins Araujo e Cas=
tro wrote:
> Hi everyone,
>=20
> I'm working on cleaning up some of the changes to enable the disable-tcg
> option on PPC, right now focusing on target/ppc/excp_helper.c and
> target/ppc/mmu_helper.c as these files have functions that are needed in a
> !TCG build but also contains code that doesn't compile in a !TCG build, a=
nd
> currently that is dealt with #ifdef.
>=20
> For excp_helper.c I moved all exception handling functions to a new file
> (named target/ppc/excp_handler.c for now) and left only the helpers in it,
> and changed meson.build to always compile the new file and only compile t=
he
> file with the helpers in a build with TCG.

That sounds reasonable.

> For mmu_helper.c the idea is to move all the code inside #ifdef CONFIG_TCG
> to another file that shouldn't be compiled in a !TCG build. But these
> changes are based on Richard Henderson's patch, so it depends if they'll =
be
> applied as is or there will be another version.

Ok.

> Also I'm looking into the possibility of not compiling
> ppc_tlb_invalidate_all in mmu_helper.c, but that's only possible if this
> function is not used in a !TCG build, does anyone know if this function is
> used in some corner case when running with KVM?

I'm pretty sure if ppc_tlb_invalidate_all() was ever called with KVM
that would be a bug, so that sounds sensible.

> Any opinion on these changes?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--9uT0EzZez/apR+lf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC1nLMACgkQbDjKyiDZ
s5KkIQ//XhDQN/+QVI9GWt69XtwDyuwCcpN1V2RQkkUo7sneQURVbBcNIDqu8xXJ
9mf4hJfxkEAKnNE/dqinMa3zjiQoEloHtqECaYl75FYBAwFKtC0YhldtygZo0z1k
4rvfjqkbGZFj34ikG31KkJDHw5JIRvSTX66wyLFihhB+1vo/nP21+Sj8nAUklaY5
YrzhSjrZTi/Bl6x2ORi3KOsUoVMZopmAd0AgoZaD1Ba54WOWNU4QgA18fyoHDb2j
GroK3y8kijp8y7e7vLj/KOO9ByvWUd9S6vnK5o6cSAhcApqej0A5b+4heD5Mfq64
P2bC5rOwSC2A4+CSs/NOE9WhHr7l26b8ZDUz3LQxetDTSUgEbyWPN4aMC+6KQT1U
FXzFclAGSrbSWol0VHsHI4ig5XZTb9ML4EtxYv0U2ZoiDtorEVKoozKMLpLf9766
L4hgjRd4m0mqAgUM0bJCWimPcm0qe5EPOrTgRXkP2bRg1XWgZ9ergpStJVZQGKhs
vWf+WWMaCQX2LnrwvhXpkJNR7gEYKh1vpxUsrEhI1BOUG/L8fGj/xoCNUtoXFnhQ
N9uzxxQLRmCzeEjtTTlNDQtMieMGPGGuYbbXS2RveipvR3Lr5FrIwmeMFo62MHXs
/NOO7wHZskQVjVt1y9l5y1AdaInVlQDuXi+TnIqUvJGR+q3UcXw=
=wjcW
-----END PGP SIGNATURE-----

--9uT0EzZez/apR+lf--

