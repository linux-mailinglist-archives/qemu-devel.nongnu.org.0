Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E7141B8B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jun 2019 07:28:04 +0200 (CEST)
Received: from localhost ([::1]:56760 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1havnn-0007ai-Th
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 01:28:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55149)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1havl5-0005Sc-D3
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 01:25:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1havl4-0007i1-70
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 01:25:15 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:46459)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1havl3-0007h9-PL; Wed, 12 Jun 2019 01:25:14 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45NwL52J15z9s9y; Wed, 12 Jun 2019 15:25:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1560317101;
 bh=7VICz6MrWLn1BeiBV66AE/FzaL2PZkA/wKzIxPWcWBs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pEa6k2nStoF+f6xaF1Hn5BrtRNONQNPdi+bDXvKeHY38v85QgxDvR+nxxs5NiOhUR
 emluPQckyg3GK/LSG+rY2XTUVMXbeMjc5aTzatcYsgVJKDIltjGTaP5/RzavZ294qJ
 y8h04OeQDWdJLrz/rVJMXdq1ZEJhiImHHV9wqwRQ=
Date: Wed, 12 Jun 2019 15:16:05 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <rth@twiddle.net>
Message-ID: <20190612051604.GI3998@umbus.fritz.box>
References: <20190602110903.3431-1-mark.cave-ayland@ilande.co.uk>
 <20190602110903.3431-5-mark.cave-ayland@ilande.co.uk>
 <20190612015224.GG3998@umbus.fritz.box>
 <53c86ca8-332c-e073-0e78-2a684cd05161@twiddle.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="G3juXO9GfR42w+sw"
Content-Disposition: inline
In-Reply-To: <53c86ca8-332c-e073-0e78-2a684cd05161@twiddle.net>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-devel] [PATCH v2 04/15] target/ppc: introduce separate
 VSX_CMP macro for xvcmp* instructions
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
Cc: qemu-ppc@nongnu.org, gkurz@kaod.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--G3juXO9GfR42w+sw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2019 at 09:22:15PM -0700, Richard Henderson wrote:
> On 6/11/19 6:52 PM, David Gibson wrote:
> > On Sun, Jun 02, 2019 at 12:08:52PM +0100, Mark Cave-Ayland wrote:
> >> Rather than perform the VSR register decoding within the helper itself,
> >> introduce a new VSX_CMP macro which performs the decode based upon xT,=
 xA
> >> and xB at translation time.
> >>
> >> Subsequent commits will make the same changes for other instructions h=
owever
> >> the xvcmp* instructions are different in that they return a set of fla=
gs to be
> >> optionally written back to the crf[6] register. Move this logic from t=
he
> >> helper function to the generator function, along with the
> >> float_status update.
> >=20
> > What's the advantage of this.  Since we still have a helper, don't we
> > suffer the cost of the helper call *plus* the now-generated
> > instructions?
>=20
> Not as such.
>=20
> The generated instructions are all of the form
>=20
> 	lea	offset+x*16(env), reg
>=20
> which is cheaper than
>=20
> 	mov	$x, reg
>=20
> and then
>=20
> 	shl	$4, reg
> 	lea	offset(env, reg), reg
>=20
> within the helper.

Fair enough.  Richard, I was kind of hoping for an A-b or R-b on the
series from you, but didn't see one..?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--G3juXO9GfR42w+sw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl0AipQACgkQbDjKyiDZ
s5LAgQ//a1vmDtwGPiZAQpUaqn27w33oPotdvLI06bnQyrU5HcFqvNprAAfD3lnv
LJnND3E30iTMx21mt1qbFUjRiYcgjPzrQwnuI846nRaj2jqP296O5R8i1YpwG7u8
fPfjBWtCir+tF6abyRLlaDHoUGIV2c6OghcukdAQwA8IIkFXJGoCeBQIXtSSXDaj
vQfw9VKFiCFXuVNUHBJnWvCz55Bpbatyy/X2XPA7xsNi0ZYM3eX+Evbz4ojtRrRi
H4vs1kPQEp/An5+5t326cELQacIY3uJu3YdFO+6qCA9jzjKh2MnEhnjbkbIFh5+d
e5YRtEkwLKxCZ6x0pSFyCshIjk3BkSyc0FqvUvWIRJ4iFOfiL2OXQwbSVkX7HsYM
Xawp1IzVCHc2bAqwFyRbxV099YcfRRXaMFlPZRC9uKQOS4CS7StGOusar+G3oM2A
Rt8d2OIkuxSVDWzLYxLLLG32dB0DfRJUIf4haHuhhIGCdCet8dhVih0nDxOY2I80
y9MC45nPEnpiCL5h4/a2L4C8N+TJlZqz/IiQIeb00A2pC5Gv61XnyaaKHPGjX2D7
8Ddsa3f7yd1NuErbTCuZzCEvRXMCCw06DG3DRum/9rASsV9kO1rpWg8vCfqGgO+M
SdQHZdyQHmOWtZkB+8BP1au5402y/YM2DzF71KjmN13ZMaOyPKQ=
=2YxY
-----END PGP SIGNATURE-----

--G3juXO9GfR42w+sw--

