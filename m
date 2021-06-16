Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 937F13A9334
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 08:53:16 +0200 (CEST)
Received: from localhost ([::1]:49208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltPQJ-0004bw-K3
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 02:53:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ltPHK-0004cz-ID; Wed, 16 Jun 2021 02:43:58 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:52159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ltPHI-0004MH-1I; Wed, 16 Jun 2021 02:43:58 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G4bHm3lDMz9sXG; Wed, 16 Jun 2021 16:43:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623825828;
 bh=wwyfql3qEzdf0SzEbZ+kKqzYJt51XbBehHrP6eArYpQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XWGdHSrEibuIOvT0KkZxnDEMqve4Nc5R3XH0yGSsIESlz2kru/5bi57TszIh2BQyG
 6SLACn99FNauVTO/oM7Q2TlPwWlNEdjow08WzyWzKjTLY5y9p25hzMdJs54NA4CkS4
 u/Ekpzlf2Puemt+EkVjRWU+Riyki/HxQkq2RFlPQ=
Date: Wed, 16 Jun 2021 16:16:45 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Subject: Re: [PATCH v2 1/2] target/ppc: fix address translation bug for radix
 mmus
Message-ID: <YMmXTRIGAJs6GRXi@yekko>
References: <20210614191630.101304-1-bruno.larsen@eldorado.org.br>
 <YMgFO37SzY1KkwQc@yekko>
 <61359cca-19fc-8f2f-0cf6-ee520fc356c2@linaro.org>
 <0b052edd-99fe-fd68-fb19-6d295c4119e9@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ze2ZXZtQqTKA6Iwf"
Content-Disposition: inline
In-Reply-To: <0b052edd-99fe-fd68-fb19-6d295c4119e9@eldorado.org.br>
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
Cc: farosas@linux.ibm.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ze2ZXZtQqTKA6Iwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 15, 2021 at 09:25:06AM -0300, Bruno Piazera Larsen wrote:
>=20
> On 15/06/2021 00:20, Richard Henderson wrote:
> > On 6/14/21 6:41 PM, David Gibson wrote:
> > > I think move these to mmu-book3s-v3.h, since they're correct for both
> > > the radix and hash sides of the modern book3s mmu.
> >=20
> > They're also correct for all non-booke mmus, e.g. hash32 and 6xx, which
> > is why I recommended internal.h (or some new mmu-internal.h).
> >=20
> > While neither hash32 nor 6xx have HV, and thus there is no second tlb
> > bug, it would still be More Correct to use mmu_idx instead of direct
> > references to msr_pr et al.
> yeah, I agree that I should change the documentation. Before I send a new
> version with everything corrected, I wanna make sure if I should leave th=
em
> in internal and use it for hash32 and 6xx MMUs, or do I put them in
> mmu-book3s-v3.h, since only radix64 has that the bug?

Put them in mmu-book3s-v3.h for the time being, we can move it later
if it makes sense.  I want to move to a mode model-first approach to
the softmmu code, so I think of these values as logically
per-MMU-style, even if they are the same in practice for many of them.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ze2ZXZtQqTKA6Iwf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDJl00ACgkQbDjKyiDZ
s5KjCRAAo+Y07B30qvrK9ArNYq0TnoeRKfk1XPVWO9uriX2EPkX6K3fFsGINDTMB
kzJ/c/oyc0LPYcIsGI9t8qF1zZgjvUU4GsWxyI0jLTizYWUuRG6PUTtFaqbqXz5L
Q6dZRbLq6jqJ59T0R60ou2oCHm09qtogTYPVImHJSuo4sExbqYpAEdDhw72yXR0I
RCDfzOiyS6r+D12Wr7yAvAJ2I1x3xdgXAdgwvp0cqzhyMmN1eVcMi1YuO9xKlagp
HCbjXnaApel02U/G8drAW3bU2kTlsjDg2EGTAGQ9xPcRwvl0+i3IGZ5L+VrriUPY
8tFrPv40Pp1nTD/0JTssPhtcnRzEaFpLa4gcqor9Sr2GzRpcLXxYbxwv6vWwMgij
NPesueNTMN1TcxTII+b7DhjmPJa/IgH62m4PGjBgfZhm1P1KQyWHwwaI95eY0CQF
QxHPzsMNePn1WxeJGSnlpYLgp5ms9DCTIIPLSL6rYL2xwmT7+S4KnH4mIFC9lQZK
4sfmCiApk3b08HCNQ0owB7cvsJVmSfCVXM7lmCFRWDf2A3omc4frT+0Zn5EglVno
b3XEOuLIdTDsZOd5dvQt+e2bbr29FLwV3hbV2hRNgeeqKii0AF7DA40fARBw3EuE
dnY6nd673oR3F6WFKSKLMNT+nqHzCJGwc9jyDDNxYhnkFEt64R8=
=9aEG
-----END PGP SIGNATURE-----

--ze2ZXZtQqTKA6Iwf--

